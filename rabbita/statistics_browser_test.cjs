// Real Chrome acceptance for public statistical charts and typed ranges.
// Build rabbita/cmd/statistics first. MOONPLOT_STATISTICS_TARGET_DIR can select
// an isolated moon --target-dir build; PLAYWRIGHT_MODULE locates Playwright.
const assert = require('node:assert/strict');
const { createHash } = require('node:crypto');
const fs = require('node:fs/promises');
const http = require('node:http');
const path = require('node:path');
const { chromium } = require(process.env.PLAYWRIGHT_MODULE || 'playwright');
const root = path.resolve(__dirname, '..');
const target = path.resolve(process.env.MOONPLOT_STATISTICS_TARGET_DIR || path.join(root, '_build'));
const scriptPath = '/_build/js/debug/build/rabbita/cmd/statistics/statistics.js';
const compiledScript = path.join(target, 'js/debug/build/rabbita/cmd/statistics/statistics.js');
const output = path.resolve(process.env.MOONPLOT_STATISTICS_OUTPUT ||
  path.join(root, '.moonagent/checkpoints/M4-statistics/browser'));
const checks = [];

async function main() {
  await fs.mkdir(output, { recursive: true });
  const compiled = await fs.readFile(compiledScript);
  const server = http.createServer(async (request, response) => {
    try {
      const url = new URL(request.url, 'http://127.0.0.1');
      if (url.pathname === '/favicon.ico') { response.writeHead(204); response.end(); return; }
      const filename = path.resolve(root, '.' + decodeURIComponent(url.pathname));
      if (!filename.startsWith(root + path.sep)) { response.writeHead(403); response.end(); return; }
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
    await page.goto(`http://127.0.0.1:${server.address().port}/rabbita/statistics.html`, { waitUntil: 'networkidle' });
    await page.waitForFunction(() => document.querySelector('#stat-boxh-svg') || document.querySelector('#statistics-error'));
    const failed = await page.locator('#statistics-error').count();
    assert.equal(failed, 0, failed ? await page.locator('#statistics-error').textContent() : 'All figures render');
    assert.equal(await page.locator('svg[data-moonplot-root]').count(), 5);
    const identity = await page.evaluate(() => {
      const ids = [...document.querySelectorAll('[id]')].map(node => node.id);
      return { duplicates: ids.filter((id, index) => ids.indexOf(id) !== index),
        namespaced: [...document.querySelectorAll('svg, svg *')].every(node => node.namespaceURI === 'http://www.w3.org/2000/svg') };
    });
    assert.deepEqual(identity, { duplicates: [], namespaced: true });
    checks.push('Five real statistical charts render as namespaced SVG with unique IDs');

    const tooltip = chart => page.locator(`[data-testid="stat-${chart}-tooltip"]`);
    async function state(chart, expected) {
      await page.waitForFunction(({ chart, expected }) => {
        const node = document.querySelector(`#stat-${chart}-status`);
        return node && Object.entries(expected).every(([key, value]) => node.dataset[key] === String(value));
      }, { chart, expected });
    }
    async function position(chart, query) {
      const svg = page.locator(`#stat-${chart}-svg`);
      await svg.scrollIntoViewIfNeeded();
      return svg.evaluate((svg, query) => {
        let x, y;
        function linePoint(line, fraction) {
          if (!line) throw Error('Missing actual statistical line');
          return { x: line.x1.baseVal.value + (line.x2.baseVal.value - line.x1.baseVal.value) * fraction,
            y: line.y1.baseVal.value + (line.y2.baseVal.value - line.y1.baseVal.value) * fraction };
        }
        if (query.kind === 'error') {
          const color = query.color || '#4d79c7';
          if (query.part === 'center') {
            const point = svg.querySelector(`polyline[stroke="${color}"]`).points.getItem(query.sample);
            x = point.x; y = point.y;
          } else {
            const offsets = { yarm: 0, ylow: 1, yhigh: 2, xarm: 3, xlow: 4, xhigh: 5 };
            const line = svg.querySelectorAll(`line[stroke="${color}"]`)[query.sample * (query.stride || 6) + offsets[query.part]];
            ({ x, y } = linePoint(line, query.fraction ?? 0.5));
          }
        } else if (query.kind === 'band') {
          const polygon = svg.querySelectorAll(`polygon[fill="${query.fill}"]`)[query.segment || 0];
          if (!polygon) throw Error('Missing actual filled polygon ' + query.fill);
          const count = polygon.points.numberOfItems / 2;
          const sample = query.sample;
          const next = Math.min(count - 1, sample + 1);
          const offset = query.offset ?? 0;
          const top = polygon.points.getItem(sample);
          const nextTop = polygon.points.getItem(next);
          const bottom = polygon.points.getItem(count * 2 - 1 - sample);
          const nextBottom = polygon.points.getItem(count * 2 - 1 - next);
          const topY = top.y + (nextTop.y - top.y) * offset;
          const bottomY = bottom.y + (nextBottom.y - bottom.y) * offset;
          x = top.x + (nextTop.x - top.x) * offset;
          y = topY + (bottomY - topY) * (query.fy ?? 0.5) + (query.dy || 0);
        } else if (query.kind === 'band-gap') {
          const polygons = svg.querySelectorAll('polygon[fill="#8dbeb0"]');
          const left = polygons[0].points;
          const right = polygons[1].points;
          const a = left.getItem(left.numberOfItems / 2 - 1), b = right.getItem(0);
          x = (a.x + b.x) / 2; y = (a.y + b.y) / 2 + 15;
        } else if (query.kind === 'box') {
          const fill = query.fill;
          if (query.part === 'body' || query.part === 'gap') {
            const box = svg.querySelectorAll(`rect[fill="${fill}"]`)[query.group || 0];
            if (!box) throw Error('Missing actual box rectangle');
            x = box.x.baseVal.value + box.width.baseVal.value * (query.fx ?? 0.5);
            y = box.y.baseVal.value + box.height.baseVal.value * (query.fy ?? 0.5);
            if (query.part === 'gap') x = box.x.baseVal.value + box.width.baseVal.value + 25;
          } else if (query.part === 'outlier') {
            const circle = svg.querySelectorAll(`circle[fill="${fill}"]`)[query.index || 0];
            if (!circle) throw Error('Missing actual outlier circle');
            x = circle.cx.baseVal.value + (query.dx || 0); y = circle.cy.baseVal.value;
          } else {
            const offsets = { lower: 0, upper: 1, median: 2, lowercap: 3, uppercap: 4 };
            const line = svg.querySelectorAll(`line[stroke="${fill}"]`)[(query.group || 0) * 5 + offsets[query.part]];
            ({ x, y } = linePoint(line, query.fraction ?? 0.5));
          }
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
      assert.equal(actual, value, `${chart} ${label} has the original metadata`);
    }
    const error = (part, sample = 1, fraction = 0.5) => ({ kind: 'error', part, sample, fraction });
    const observed = (part = 'center', fraction = 0.5) => ({ kind: 'error', part, sample: 0, fraction, color: '#ce8650', stride: 3 });
    const band = (sample = 1, offset = 0.2, fy = 0.5) => ({ kind: 'band', fill: '#8dbeb0', sample, offset, fy });
    const stack = (fill, sample = 1, fy = 0.5) => ({ kind: 'band', fill, sample, offset: 0.2, fy });
    const box = (part = 'body', group = 0, extra = {}) => ({ kind: 'box', part, fill: '#8a70b5', group, ...extra });
    const boxh = (part = 'body', group = 0, extra = {}) => ({ kind: 'box', part, fill: '#5e91a8', group, ...extra });

    await hover('error', error('center'), 'errorbar', ['采样 2', '6 °C', '4.5 – 7.5 °C', '1.75 – 2.25 天']);
    await state('error', { point: 1, dataX: 2, dataY: 6, value: 6, xLower: 1.75, xUpper: 2.25, yLower: 4.5, yUpper: 7.5 });
    await hover('error', error('yarm', 1, 0.05), 'errorbar', ['6 °C']);
    await hover('error', error('xarm', 1, 0.05), 'errorbar', ['1.75 – 2.25 天']);
    await click('error', error('yhigh', 1, 0.98), 1);
    await hover('error', error('xhigh', 1, 0.98), 'errorbar', ['4.5 – 7.5 °C']);
    await state('error', { point: 1 });
    checks.push('Errorbar centers, arms and far cap ends retain the same original sample and exact x/y error bounds');
    await noHit('error', { kind: 'absolute', x: 500, y: 80 });
    await noHit('error', { kind: 'absolute', x: 10, y: 10 });
    checks.push('Errorbar blank plot space and outside-panel positions produce no tooltip');

    await hover('band', band(), 'area', ['Forecast band', 'Lower', '3', 'Upper', '7']);
    await fieldIs('band', 'Lower', '3');
    await fieldIs('band', 'Upper', '7');
    await state('band', { point: 1, dataX: 1, dataY: 7, lower: 3, upper: 7, horizontal: false, stacked: false });
    await hover('band', band(1, 0.2, 0.95), 'area', ['3', '7']);
    await click('band', band(), 1);
    await noHit('band', { kind: 'band-gap' });
    await noHit('band', { ...band(1, 0, 0), dy: -35 });
    await hover('band', { ...band(2, 0, 0.5), segment: 1 }, 'area', ['4', '8']);
    await state('band', { point: 6, lower: 4, upper: 8 });
    checks.push('Confidence-band interiors and edges choose original samples; NaN gaps remain empty and later samples retain their indices');
    await hover('stack', stack('#398575'), 'area', ['Partners', '2 k', '4 – 6 k', 'Q2']);
    await fieldIs('stack', 'Value', '2 k');
    await fieldIs('stack', 'Stack bounds', '4 – 6 k');
    await state('stack', { point: 1, dataX: 1, dataY: 6, value: 2, lower: 4, upper: 6, horizontal: false, stacked: true });
    await hover('stack', stack('#ce8650', 1, 0.95), 'area', ['Other', '1 k', '6 – 7 k']);
    await click('stack', stack('#4d79c7'), 1);
    await noHit('stack', { ...stack('#ce8650', 1, 0), dy: -50 });
    await state('error', { selected: true, clicks: 1 });
    checks.push('Each stacked area exposes its original contribution separately from cumulative bounds and uses independent chart state');

    await hover('box', box(), 'boxplot', ['北区', '四分位区间', '4.5 ms', '2.75 – 6.25 ms', '1 – 7 ms']);
    await state('box', { point: 0, group: 0, value: 4.5, median: 4.5, q1: 2.75, q3: 6.25, lower: 1, upper: 7 });
    await hover('box', box('body', 0, { fx: 0.03, fy: 0.75 }), 'boxplot', ['北区', '4.5 ms']);
    await hover('box', box('lower'), 'boxplot', ['下须', '1 – 7 ms']);
    await state('box', { point: 0, value: 1, part: '下须' });
    await hover('box', box('upper'), 'boxplot', ['上须', '1 – 7 ms']);
    await state('box', { point: 0, value: 7, part: '上须' });
    await hover('box', box('lowercap', 0, { fraction: 0.96 }), 'boxplot', ['下须端']);
    await state('box', { point: 0, value: 1, part: '下须端' });
    await click('box', box('uppercap', 0, { fraction: 0.96 }), 1);
    await state('box', { point: 0, value: 7, part: '上须端' });
    await hover('box', box('outlier'), 'boxplot', ['离群值', '20 ms', '4.5 ms']);
    await state('box', { part: '离群值', value: 20, group: 0 });
    await hover('box', box('body', 1), 'boxplot', ['南区', '5.5 ms', '3.75 – 7.25 ms', '2 – 9 ms']);
    await state('box', { group: 1 });
    checks.push('Vertical box bodies, whiskers, cap ends and outliers return the exact original group statistics and outlier value');
    await noHit('box', box('gap'));
    await noHit('box', box('outlier', 0, { dx: 20 }));
    checks.push('Blank space beside a box and outside an outlier radius stays empty');

    await hover('boxh', boxh(), 'boxplot', ['北区', '4.5 ms', '2.75 – 6.25 ms']);
    await hover('boxh', boxh('lower'), 'boxplot', ['下须']);
    await hover('boxh', boxh('uppercap', 0, { fraction: 0.96 }), 'boxplot', ['上须端']);
    await click('boxh', boxh('outlier'), 1);
    await state('boxh', { group: 0, value: 20, part: '离群值' });
    await hover('boxh', boxh('body', 1), 'boxplot', ['南区', '5.5 ms']);
    checks.push('Horizontal boxes, whiskers, caps and outliers preserve the same statistics and independent selection');

    await page.locator('[data-testid="stat-band"] [data-moonplot-series="forecast"]').click();
    await page.waitForFunction(() => !document.querySelector('#stat-band-svg polygon[fill="#8dbeb0"]'));
    await noHit('band', { kind: 'absolute', x: 140, y: 180 });
    await page.locator('[data-testid="stat-band"] [data-moonplot-series="forecast"]').click();
    await page.waitForSelector('#stat-band-svg polygon[fill="#8dbeb0"]');
    await hover('band', band(), 'area', ['3', '7']);
    checks.push('Legend rebuilds remove hidden band geometry and restore current hit metadata');

    await hover('band', observed(), 'errorbar', ['Observed', '5', '4.5 – 5.5']);
    await fieldIs('band', 'y', '5');
    await fieldIs('band', 'y range', '4.5 – 5.5');
    await hover('band', observed('yarm', 0.05), 'errorbar', ['Observed', '4.5 – 5.5']);
    await hover('band', band(), 'area', ['Forecast band', '3', '7']);
    checks.push('Visible errorbars painted over a confidence band retain their own original sample and ranges; adjacent band interiors remain selectable');

    await page.locator('#statistics-update').click();
    await page.waitForFunction(() => document.querySelector('#statistics-revision')?.textContent === 'Revision 1');
    await state('error', { selected: false, hovered: false });
    await hover('error', error('yhigh', 1, 0.98), 'errorbar', ['7 °C', '4.5 – 9.5 °C', '1.5 – 2.5 天']);
    await state('error', { dataX: 2, dataY: 7, value: 7, xLower: 1.5, xUpper: 2.5, yLower: 4.5, yUpper: 9.5 });
    await hover('band', band(1, 0.45), 'area', ['4', '9']);
    await state('band', { point: 1, lower: 4, upper: 9 });
    await hover('band', observed(), 'errorbar', ['Observed', '6.5', '5.5 – 7.5']);
    await fieldIs('band', 'y', '6.5');
    await fieldIs('band', 'y range', '5.5 – 7.5');
    await hover('stack', stack('#398575'), 'area', ['Partners', '2 k', '6 – 8 k']);
    await fieldIs('stack', 'Value', '2 k');
    await fieldIs('stack', 'Stack bounds', '6 – 8 k');
    await hover('box', box(), 'boxplot', ['9 ms', '5.5 – 12.5 ms', '2 – 14 ms']);
    await hover('box', box('outlier'), 'boxplot', ['30 ms']);
    await hover('boxh', boxh('outlier'), 'boxplot', ['30 ms']);
    checks.push('Data replacement refreshes error ranges, band bounds, stack totals and box summaries while clearing stale selections');

    for (let index = 0; index < 3; index++) {
      await page.locator('#statistics-mount').click();
      await page.waitForSelector('#statistics-unmounted');
      assert.equal(await page.locator('svg').count(), 0);
      await page.locator('#statistics-mount').click();
      await page.waitForSelector('#stat-boxh-svg');
    }
    await click('error', error('center'), 2);
    await state('band', { clicks: 1 });
    await state('stack', { clicks: 1 });
    await state('box', { clicks: 1 });
    await state('boxh', { clicks: 1 });
    checks.push('Three remount cycles retain independent click counts and dispatch one event per click');

    await page.locator('#stat-error').evaluate(node => { node.style.padding = '23px'; node.style.border = '7px solid #e5e9ed'; });
    await page.locator('#stat-error-svg').evaluate(node => { node.style.width = '360px'; node.style.height = '360px'; });
    await hover('error', error('yarm', 1, 0.05), 'errorbar', ['7 °C']);
    const letterbox = await page.locator('#stat-error-svg').boundingBox();
    await page.mouse.move(letterbox.x + letterbox.width / 2, letterbox.y + 3);
    await state('error', { hovered: false });
    await page.locator('#stat-error').evaluate(node => { node.style.padding = ''; node.style.border = ''; });
    await page.locator('#stat-error-svg').evaluate(node => { node.style.width = '100%'; node.style.height = 'auto'; });
    checks.push('Actual error segments retain CSS-scaled hits through borders, padding and square letterboxing; blank bands reject hits');

    await page.setViewportSize({ width: 375, height: 812 });
    await hover('error', error('center'), 'errorbar', ['7 °C']);
    const mobileTooltip = await tooltip('error').boundingBox();
    assert(mobileTooltip.x >= 0 && mobileTooltip.x + mobileTooltip.width <= 375);
    await hover('band', band(1, 0.45), 'area', ['4', '9']);
    await hover('stack', stack('#398575'), 'area', ['2 k']);
    await hover('box', box('outlier'), 'boxplot', ['30 ms']);
    await hover('boxh', boxh('body'), 'boxplot', ['9 ms']);
    assert(await page.evaluate(() => document.documentElement.scrollWidth <= innerWidth));
    await page.screenshot({ path: path.join(output, 'mobile.png'), fullPage: true });
    checks.push('375px mobile layout retains error, band, stack, box and outlier hits without tooltip or page overflow');

    await page.setViewportSize({ width: 1280, height: 950 });
    await page.locator('#statistics-update').click();
    await page.waitForFunction(() => document.querySelector('#statistics-revision')?.textContent === 'Revision 2');
    await hover('error', error('yhigh', 1, 0.98), 'errorbar', ['6 °C']);
    await page.screenshot({ path: path.join(output, 'statistics.png'), fullPage: true });
    assert.deepEqual(errors, []);
    const artifact = { path: compiledScript, bytes: compiled.length,
      sha256: createHash('sha256').update(compiled).digest('hex') };
    const report = { browser: browser.version(), artifact, checks, pageErrors: errors };
    await fs.writeFile(path.join(output, 'report.json'), JSON.stringify(report, null, 2) + '\n');
    console.log(JSON.stringify(report, null, 2));
  } catch (error) {
    if (page) {
      await page.screenshot({ path: path.join(output, 'failure.png'), fullPage: true }).catch(() => {});
      console.error(await page.locator('body').innerText().catch(() => 'Unable to read body'));
    }
    await fs.writeFile(path.join(output, 'failure.json'), JSON.stringify({ error: String(error), checks, pageErrors: errors }, null, 2) + '\n');
    throw error;
  } finally {
    if (browser) await browser.close();
    await new Promise(resolve => server.close(resolve));
  }
}

main().catch(error => { console.error(error); process.exitCode = 1; });
