// Actual Chrome acceptance for the M3 public Figure APIs and Rabbita adapter.
// Build rabbita/cmd/charts first. Set PLAYWRIGHT_MODULE if it is not on NODE_PATH.
// MOONPLOT_CHARTS_TARGET_DIR can select an isolated moon --target-dir build.
const assert = require('node:assert/strict');
const { createHash } = require('node:crypto');
const fs = require('node:fs/promises');
const http = require('node:http');
const path = require('node:path');
const { chromium } = require(process.env.PLAYWRIGHT_MODULE || 'playwright');
const root = path.resolve(__dirname, '..');
const target = path.resolve(process.env.MOONPLOT_CHARTS_TARGET_DIR || path.join(root, '_build'));
const scriptPath = '/_build/js/debug/build/rabbita/cmd/charts/charts.js';
const compiledScript = path.join(target, 'js/debug/build/rabbita/cmd/charts/charts.js');
const output = path.resolve(process.env.MOONPLOT_CHART_OUTPUT ||
  path.join(root, '.moonagent/checkpoints/M3-charts/browser'));
const checks = [];
const evidence = [];

async function main() {
  await fs.mkdir(output, { recursive: true });
  const compiled = await fs.readFile(compiledScript);
  const server = http.createServer(async (request, response) => {
    try {
      const url = new URL(request.url, 'http://127.0.0.1');
      if (url.pathname === '/favicon.ico') { response.writeHead(204); response.end(); return; }
      const filename = path.resolve(root, '.' + decodeURIComponent(url.pathname));
      if (!filename.startsWith(root + path.sep)) { response.writeHead(403); response.end(); return; }
      // The page retains its production URL while isolated builds are served
      // only at this one known script route. Record the exact supplied bytes.
      const body = url.pathname === scriptPath ? compiled : await fs.readFile(filename);
      const mime = { '.js': 'text/javascript', '.css': 'text/css', '.html': 'text/html' };
      response.writeHead(200, { 'Content-Type': mime[path.extname(filename)] || 'application/octet-stream' });
      response.end(body);
    } catch (_) { response.writeHead(404); response.end('Not found'); }
  });
  await new Promise(resolve => server.listen(0, '127.0.0.1', resolve));
  let browser;
  let page;
  const errors = [];
  try {
    const channel = process.env.BROWSER_CHANNEL || 'chrome';
    browser = await chromium.launch({ headless: true,
      ...(channel === 'bundled' ? {} : { channel }) });
    page = await browser.newPage({ viewport: { width: 1280, height: 950 }, deviceScaleFactor: 1 });
    page.on('pageerror', error => errors.push(String(error)));
    page.on('console', message => { if (message.type() === 'error') errors.push(message.text()); });
    await page.goto(`http://127.0.0.1:${server.address().port}/rabbita/charts.html`, { waitUntil: 'networkidle' });
    await page.waitForFunction(() => document.querySelector('#chart-donut-svg') || document.querySelector('#charts-error'));
    const failed = await page.locator('#charts-error').count();
    assert.equal(failed, 0, failed ? await page.locator('#charts-error').textContent() : 'All figures render');
    assert.equal(await page.locator('svg[data-moonplot-root]').count(), 5);
    const identity = await page.evaluate(() => {
      const ids = [...document.querySelectorAll('[id]')].map(node => node.id);
      return {
        duplicates: ids.filter((id, index) => ids.indexOf(id) !== index),
        namespaced: [...document.querySelectorAll('svg, svg *')].every(node => node.namespaceURI === 'http://www.w3.org/2000/svg'),
      };
    });
    assert.deepEqual(identity, { duplicates: [], namespaced: true });
    checks.push('Five public Figure charts render as namespaced SVG with unique document IDs');

    const tooltip = chart => page.locator(`[data-testid="chart-${chart}-tooltip"]`);
    async function state(chart, expected) {
      await page.waitForFunction(({ chart, expected }) => {
        const node = document.querySelector(`#chart-${chart}-status`);
        return node && Object.entries(expected).every(([key, value]) => node.dataset[key] === String(value));
      }, { chart, expected });
    }
    async function position(chart, query) {
      const svg = page.locator(`#chart-${chart}-svg`);
      await svg.scrollIntoViewIfNeeded();
      return svg.evaluate((svg, query) => {
        let x, y;
        if (query.kind === 'cell') {
          const first = [...svg.querySelectorAll('rect')].find(node =>
            node.getAttribute('fill')?.startsWith('#') && node.width.baseVal.value > 20 && node.height.baseVal.value > 20);
          if (!first) throw Error('Missing real heatmap cells');
          x = first.x.baseVal.value + first.width.baseVal.value * (query.column + (query.fx ?? 0.5));
          y = first.y.baseVal.value + first.height.baseVal.value * (query.row + (query.fy ?? 0.5));
        } else if (query.kind === 'bar') {
          const bar = svg.querySelectorAll(`rect[fill="${query.fill}"]`)[query.index || 0];
          if (!bar) throw Error(`Missing ${chart} bar ${query.fill}:${query.index || 0}`);
          x = bar.x.baseVal.value + bar.width.baseVal.value * (query.fx ?? 0.5);
          y = bar.y.baseVal.value + bar.height.baseVal.value * (query.fy ?? 0.5);
        } else if (query.kind === 'ring') {
          const arc = svg.querySelector('path[fill="#ce8650"]');
          const match = arc?.getAttribute('d').match(/[Aa]\s*([\d.eE+-]+)[ ,]+([\d.eE+-]+)/);
          if (!match) throw Error('Missing a true annular SVG arc');
          const backgrounds = [...svg.querySelectorAll('polygon')].filter(node =>
            ['#e4efeb', '#f0e9de'].includes(node.getAttribute('fill'))).map(node => node.getBBox());
          if (backgrounds.length !== 2) throw Error('Missing two real colored Scene polygons');
          const cx = (Math.min(...backgrounds.map(box => box.x)) + Math.max(...backgrounds.map(box => box.x + box.width))) / 2;
          const cy = (Math.min(...backgrounds.map(box => box.y)) + Math.max(...backgrounds.map(box => box.y + box.height))) / 2;
          const radius = Number(match[1]);
          const angle = (query.angle ?? 0) * Math.PI / 180;
          x = cx + radius * query.radius * Math.cos(angle);
          y = cy - radius * query.radius * Math.sin(angle);
        } else { x = query.x; y = query.y; }
        const point = new DOMPoint(x, y).matrixTransform(svg.getScreenCTM());
        return { x: point.x, y: point.y };
      }, query);
    }
    async function hover(chart, query, kind, fragments = []) {
      const point = await position(chart, query);
      await page.mouse.move(point.x, point.y);
      await tooltip(chart).waitFor();
      assert.equal(await tooltip(chart).getAttribute('data-moonplot-kind'), kind);
      const text = await tooltip(chart).innerText();
      for (const fragment of fragments) assert(text.includes(fragment), `${chart}: ${fragment} in ${text}`);
      return point;
    }
    async function noHit(chart, query) {
      const point = await position(chart, query);
      await page.mouse.move(point.x, point.y);
      await state(chart, { hovered: false });
      assert.equal(await tooltip(chart).count(), 0);
    }
    async function click(chart, query, clicks) {
      const point = await position(chart, query);
      await page.mouse.click(point.x, point.y);
      await state(chart, { selected: true, clicks });
    }
    async function fieldIs(chart, label, value) {
      const actual = await tooltip(chart).locator('.moonplot-coordinate').evaluateAll((rows, label) => {
        const row = rows.find(row => row.querySelector('.moonplot-coordinate-label')?.textContent === label);
        return row?.querySelector('b')?.textContent;
      }, label);
      assert.equal(actual, value, `${chart} ${label} retains original metadata`);
    }
    const cell = (row, column, fx = 0.5, fy = 0.5) => ({ kind: 'cell', row, column, fx, fy });
    const bar = (fill, index = 0, fx = 0.5, fy = 0.65) => ({ kind: 'bar', fill, index, fx, fy });
    const ring = (angle, radius = 0.8) => ({ kind: 'ring', angle, radius });

    const cellRects = await page.locator('#chart-heat-svg').evaluate(svg => [...svg.querySelectorAll('rect')]
      .filter(node => node.getAttribute('fill')?.startsWith('#') && node.width.baseVal.value > 20).length);
    assert.equal(cellRects, 11, 'A 3×4 matrix paints eleven valid scalar cells');
    await hover('heat', cell(0, 1), 'heatmap', ['北区', '周二', '5 万元', '原始行列 0, 1']);
    await state('heat', { row: 0, column: 1, value: 5 });
    await hover('heat', cell(0, 1, 0.02, 0.97), 'heatmap', ['5 万元']);
    await click('heat', cell(0, 1), 1);
    checks.push('Whole scalar cells, including near edges, return original row/column/value to a custom Chinese tooltip and click');
    await noHit('heat', cell(1, 1));
    await noHit('heat', { kind: 'absolute', x: 10, y: 10 });
    await hover('heat', cell(2, 3), 'heatmap', ['南区', '周四', '12 万元', '原始行列 2, 3']);
    checks.push('NaN cell and outside-panel locations stay empty; upper-origin last row and column retain their identity');

    await hover('grouped', bar('#4d79c7'), 'bar', ['Direct', 'Q1', '8']);
    await fieldIs('grouped', 'Value', '8');
    await click('grouped', bar('#398575'), 1);
    await hover('grouped', bar('#398575', 0, 0.96, 0.8), 'bar', ['Partners', 'Q1', '5']);
    const gap = await page.locator('#chart-grouped-svg').evaluate(svg => {
      const first = svg.querySelector('rect[fill="#4d79c7"]');
      const next = svg.querySelector('rect[fill="#398575"]');
      const gap = next.x.baseVal.value - first.x.baseVal.value - first.width.baseVal.value;
      if (gap <= 0) throw Error('Grouped bars require a real visible gap');
      return { x: first.x.baseVal.value + first.width.baseVal.value + gap / 2,
        y: next.y.baseVal.value + next.height.baseVal.value * 0.8 };
    });
    await noHit('grouped', { kind: 'absolute', ...gap });
    await state('heat', { selected: true, clicks: 1 });
    checks.push('Grouped categories expose each series and segment value; group gaps are empty and selection state is independent');

    await hover('stacked', bar('#398575'), 'bar', ['Core', 'North', '5']);
    await hover('stacked', bar('#4d79c7'), 'bar', ['Growth', 'North', '2']);
    await fieldIs('stacked', 'Value', '2');
    await hover('stacked', bar('#4d79c7', 1), 'bar', ['Growth', 'Central', '-2']);
    await fieldIs('stacked', 'Value', '-2');
    await click('stacked', bar('#ce8650', 0), 1);
    await hover('stacked', bar('#ce8650', 0), 'bar', ['Adjustments', 'North', '-1']);
    const stackEdges = await page.locator('#chart-stacked-svg').evaluate(svg => {
      const a = svg.querySelector('rect[fill="#398575"]');
      const b = svg.querySelector('rect[fill="#4d79c7"]');
      return { firstTop: a.y.baseVal.value, secondBottom: b.y.baseVal.value + b.height.baseVal.value };
    });
    assert(Math.abs(stackEdges.firstTop - stackEdges.secondBottom) < 0.01, 'Positive segments share a true cumulative baseline');
    checks.push('Positive and negative stacks use contiguous geometry while tooltips retain signed segment values instead of cumulative endpoints');

    await hover('horizontal', bar('#398575', 0, 0.97, 0.5), 'barh', ['Core', 'West', '6']);
    await fieldIs('horizontal', 'Value', '6');
    await hover('horizontal', bar('#4d79c7', 0, 0.03, 0.5), 'barh', ['Growth', 'West', '-2']);
    await hover('horizontal', bar('#ce8650', 0, 0.98, 0.5), 'barh', ['Adjustments', 'West', '3']);
    await click('horizontal', bar('#398575', 1), 1);
    await fieldIs('horizontal', 'Value', '-4');
    checks.push('Horizontal stacks with a nonzero baseline hit whole positive/negative segments and report their original values');

    await hover('donut', ring(6), 'pie', ['Design', '2', '20%']);
    await hover('donut', ring(96), 'pie', ['Engineering', '3', '30%']);
    await hover('donut', ring(240, 0.98), 'pie', ['Operations', '5', '50%']);
    await click('donut', ring(240, 0.61), 1);
    await noHit('donut', ring(240, 0.56));
    await noHit('donut', ring(0, 0));
    await noHit('donut', ring(240, 1.1));
    checks.push('Rotated annular sectors hit the ring interior and near both edges; the actual hole and outside radius reject hover');

    const holeSamples = [
      { point: await position('donut', ring(180, 0.28)), expected: [228, 239, 235] },
      { point: await position('donut', ring(0, 0.28)), expected: [240, 233, 222] },
    ];
    await noHit('donut', ring(0, 0));
    const painted = await page.screenshot({ path: path.join(output, 'ring-transparency.png') });
    const rgba = await page.evaluate(async ({ png, samples }) => {
      const image = new Image(); image.src = 'data:image/png;base64,' + png;
      await image.decode();
      const canvas = document.createElement('canvas');
      canvas.width = image.naturalWidth; canvas.height = image.naturalHeight;
      const context = canvas.getContext('2d'); context.drawImage(image, 0, 0);
      return samples.map(({ point }) => [...context.getImageData(Math.floor(point.x), Math.floor(point.y), 1, 1).data]);
    }, { png: painted.toString('base64'), samples: holeSamples });
    for (let index = 0; index < holeSamples.length; index++) {
      assert.equal(rgba[index][3], 255);
      for (let channel = 0; channel < 3; channel++) assert(Math.abs(rgba[index][channel] - holeSamples[index].expected[channel]) <= 2,
        `Real screenshot hole pixel ${index} reveals its underlying Scene polygon: ${rgba[index]}`);
    }
    evidence.push({ phase: 'ring-transparency', samples: holeSamples.map((sample, index) => ({ ...sample, rgba: rgba[index] })) });
    checks.push('Actual Chrome screenshot pixels inside the hole reveal both colored Scene polygons; no covering disk or CSS SVG mutation');

    const legend = key => page.locator(`[data-testid="chart-grouped"] [data-moonplot-series="${key}"]`);
    await legend('partners').click();
    await page.waitForFunction(() => !document.querySelector('#chart-grouped-svg rect[fill="#398575"]'));
    await hover('grouped', bar('#4d79c7'), 'bar', ['Direct', 'Q1', '8']);
    assert.equal(await tooltip('grouped').innerText().then(text => text.includes('Partners')), false);
    await legend('direct').click();
    await page.waitForFunction(() => !document.querySelector('#chart-grouped-svg rect[fill="#4d79c7"]'));
    await noHit('grouped', { kind: 'absolute', x: 280, y: 175 });
    await legend('partners').click();
    await hover('grouped', bar('#398575'), 'bar', ['Partners', 'Q1', '5']);
    await legend('direct').click();
    await page.waitForFunction(() => document.querySelectorAll('#chart-grouped-svg rect[fill="#4d79c7"]').length === 3 &&
      document.querySelectorAll('#chart-grouped-svg rect[fill="#398575"]').length === 3);
    assert.equal(await page.locator('#chart-grouped-svg rect[fill="#4d79c7"]').count(), 3);
    assert.equal(await page.locator('#chart-grouped-svg rect[fill="#398575"]').count(), 3);
    checks.push('Independent legend buttons rebuild group layout and hit metadata, including hiding every series and restoring them');

    await page.locator('#charts-update').click();
    await page.waitForFunction(() => document.querySelector('#charts-revision')?.textContent === 'Revision 1');
    await state('heat', { selected: false, hovered: false });
    await hover('heat', cell(0, 1), 'heatmap', ['8 万元']);
    await state('heat', { row: 0, column: 1, value: 8 });
    await hover('grouped', bar('#4d79c7'), 'bar', ['11']);
    await fieldIs('grouped', 'Value', '11');
    await hover('stacked', bar('#398575'), 'bar', ['8']);
    await fieldIs('stacked', 'Value', '8');
    checks.push('Data replacement clears stale selections and refreshes scalar, grouped, and stacked metadata in the current frame');
    for (const angle of [0, 90, 180, 270, 355]) await hover('donut', ring(angle), 'pie', ['Operations', '8', '100%']);
    await noHit('donut', ring(0, 0.4));
    checks.push('A single remaining positive donut slice forms a complete ring across zero degrees while preserving the empty hole');

    for (let index = 0; index < 3; index++) {
      await page.locator('#charts-mount').click();
      await page.waitForSelector('#charts-unmounted');
      assert.equal(await page.locator('svg').count(), 0);
      await page.locator('#charts-mount').click();
      await page.waitForSelector('#chart-donut-svg');
    }
    await click('heat', cell(0, 1), 2);
    await state('stacked', { clicks: 1 });
    await state('horizontal', { clicks: 1 });
    await state('donut', { clicks: 1 });
    checks.push('Three remount cycles preserve independent click counts and dispatch exactly one event per click');

    await page.locator('#chart-heat').evaluate(node => { node.style.padding = '23px'; node.style.border = '7px solid #e5e9ed'; });
    await page.locator('#chart-heat-svg').evaluate(node => { node.style.width = '360px'; node.style.height = '360px'; });
    await hover('heat', cell(0, 1), 'heatmap', ['8 万元']);
    const letterbox = await page.locator('#chart-heat-svg').boundingBox();
    await page.mouse.move(letterbox.x + letterbox.width / 2, letterbox.y + 3);
    await state('heat', { hovered: false });
    await page.locator('#chart-heat').evaluate(node => { node.style.padding = ''; node.style.border = ''; });
    await page.locator('#chart-heat-svg').evaluate(node => { node.style.width = '100%'; node.style.height = 'auto'; });
    checks.push('Scaled cells keep exact hits through scroll, border, padding, and square CSS letterboxing; blank bands remain empty');

    await page.setViewportSize({ width: 375, height: 812 });
    await hover('heat', cell(0, 1), 'heatmap', ['8 万元']);
    const mobileTooltip = await tooltip('heat').boundingBox();
    assert(mobileTooltip.x >= 0 && mobileTooltip.x + mobileTooltip.width <= 375);
    await hover('horizontal', bar('#4d79c7'), 'barh', ['-2']);
    await hover('donut', ring(180), 'pie', ['100%']);
    await noHit('donut', ring(0, 0));
    assert(await page.evaluate(() => document.documentElement.scrollWidth <= innerWidth));
    await page.screenshot({ path: path.join(output, 'mobile.png'), fullPage: true });
    checks.push('375px mobile layout retains cell, horizontal segment, and annular hits without tooltip or page overflow');

    await page.setViewportSize({ width: 1280, height: 950 });
    await page.locator('#charts-update').click();
    await page.waitForFunction(() => document.querySelector('#charts-revision')?.textContent === 'Revision 2');
    await hover('heat', cell(0, 1), 'heatmap', ['5 万元']);
    await page.screenshot({ path: path.join(output, 'charts.png'), fullPage: true });
    assert.deepEqual(errors, []);
    const artifact = { path: compiledScript, bytes: compiled.length,
      sha256: createHash('sha256').update(compiled).digest('hex') };
    const report = { browser: browser.version(), artifact, checks, evidence, pageErrors: errors };
    await fs.writeFile(path.join(output, 'report.json'), JSON.stringify(report, null, 2) + '\n');
    console.log(JSON.stringify(report, null, 2));
  } catch (error) {
    if (page) {
      await page.screenshot({ path: path.join(output, 'failure.png'), fullPage: true }).catch(() => {});
      console.error(await page.locator('body').innerText().catch(() => 'Unable to read body'));
    }
    await fs.writeFile(path.join(output, 'failure.json'), JSON.stringify({ error: String(error), checks, evidence, pageErrors: errors }, null, 2) + '\n');
    throw error;
  } finally {
    if (browser) await browser.close();
    await new Promise(resolve => server.close(resolve));
  }
}

main().catch(error => { console.error(error); process.exitCode = 1; });
