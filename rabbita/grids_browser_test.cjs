// True-DOM acceptance for rectangular scalar grids and 2D count bins.
// Build rabbita/cmd/grids first. MOONPLOT_GRIDS_TARGET_DIR can select an isolated
// moon --target-dir build; PLAYWRIGHT_MODULE locates the installed Playwright.
const assert = require('node:assert/strict');
const { createHash } = require('node:crypto');
const fs = require('node:fs/promises');
const http = require('node:http');
const path = require('node:path');
const { chromium } = require(process.env.PLAYWRIGHT_MODULE || 'playwright');
const root = path.resolve(__dirname, '..');
const target = path.resolve(process.env.MOONPLOT_GRIDS_TARGET_DIR || path.join(root, '_build'));
const scriptPath = '/_build/js/debug/build/rabbita/cmd/grids/grids.js';
const compiledScript = path.join(target, 'js/debug/build/rabbita/cmd/grids/grids.js');
const output = path.resolve(process.env.MOONPLOT_GRIDS_OUTPUT ||
  path.join(root, '.moonagent/checkpoints/M5-grids/browser'));
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
    await page.goto(`http://127.0.0.1:${server.address().port}/rabbita/grids.html`, { waitUntil: 'networkidle' });
    await page.waitForFunction(() => document.querySelector('#grid-reverse-svg') || document.querySelector('#grids-error'));
    const failed = await page.locator('#grids-error').count();
    assert.equal(failed, 0, failed ? await page.locator('#grids-error').textContent() : 'All figures render');
    assert.equal(await page.locator('svg[data-moonplot-root]').count(), 3);
    const identity = await page.evaluate(() => {
      const ids = [...document.querySelectorAll('[id]')].map(node => node.id);
      return { duplicates: ids.filter((id, index) => ids.indexOf(id) !== index),
        namespaced: [...document.querySelectorAll('svg, svg *')].every(node => node.namespaceURI === 'http://www.w3.org/2000/svg') };
    });
    assert.deepEqual(identity, { duplicates: [], namespaced: true });
    checks.push('Three independent public grid charts render as real namespaced SVG with unique IDs');

    const tooltip = chart => page.locator(`[data-testid="grid-${chart}-tooltip"]`);
    async function state(chart, expected) {
      await page.waitForFunction(({ chart, expected }) => {
        const node = document.querySelector(`#grid-${chart}-status`);
        return node && Object.entries(expected).every(([key, value]) => node.dataset[key] === String(value));
      }, { chart, expected });
    }
    async function position(chart, query) {
      const svg = page.locator(`#grid-${chart}-svg`);
      await svg.scrollIntoViewIfNeeded();
      return svg.evaluate((svg, { chart, query }) => {
        let x, y;
        if (query.kind === 'cell') {
          const polygons = [...svg.querySelectorAll('polygon')].filter(node => node.points.numberOfItems === 4);
          const points = polygons.flatMap(node => Array.from({ length: node.points.numberOfItems }, (_, index) => {
            const point = node.points.getItem(index);
            return { x: point.x, y: point.y };
          }));
          const xs = [...new Set(points.map(point => point.x))].sort((a, b) => a - b);
          const ys = [...new Set(points.map(point => point.y))].sort((a, b) => a - b);
          if (xs.length !== 4 || ys.length !== 3) throw Error('Expected the real 2×3 rectangular grid boundaries');
          const column = chart === 'reverse' ? 2 - query.column : query.column;
          const row = chart === 'reverse' ? query.row : 1 - query.row;
          const bounds = { left: xs[column], right: xs[column + 1], top: ys[row], bottom: ys[row + 1] };
          const actual = polygons.find(polygon => {
            const box = polygon.getBBox();
            return Math.abs(box.x - bounds.left) < 0.01 && Math.abs(box.y - bounds.top) < 0.01 &&
              Math.abs(box.x + box.width - bounds.right) < 0.01 && Math.abs(box.y + box.height - bounds.bottom) < 0.01;
          });
          // A missing cell may have no polygon; its neighboring real corners
          // still define the blank interval. No scalar value is read from color.
          if (!actual && !query.missing) throw Error('Missing actual cell polygon');
          x = bounds.left + (bounds.right - bounds.left) * (query.fx ?? 0.5);
          y = bounds.top + (bounds.bottom - bounds.top) * (query.fy ?? 0.5);
        } else { x = query.x; y = query.y; }
        const point = new DOMPoint(x, y).matrixTransform(svg.getScreenCTM());
        return { x: point.x, y: point.y };
      }, { chart, query });
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
        const row = rows.find(row => row.querySelector('.moonplot-coordinate-label')?.textContent.trim().toLowerCase() === label.toLowerCase());
        return row?.querySelector('b')?.textContent;
      }, label);
      assert.equal(actual, value, `${chart} ${label} retains original metadata`);
    }
    const cell = (row, column, fx = 0.5, fy = 0.5) => ({ kind: 'cell', row, column, fx, fy });
    const legend = chart => page.locator(`[data-testid="grid-${chart}"] [data-moonplot-series="grid"]`);

    const widths = await page.locator('#grid-mesh-svg').evaluate(svg => {
      const xs = [...new Set([...svg.querySelectorAll('polygon')].flatMap(node =>
        Array.from({ length: node.points.numberOfItems }, (_, index) => node.points.getItem(index).x)))].sort((a, b) => a - b);
      return xs.slice(1).map((x, index) => x - xs[index]);
    });
    assert(Math.abs(widths[1] / widths[0] - 2) < 0.001 && Math.abs(widths[2] / widths[0] - 3) < 0.001,
      'Actual polygons have nonuniform 1:2:3 interval widths');
    await hover('mesh', cell(0, 2), 'heatmap', ['第 1 行', '第 3 列', '8 kWh', '3 – 6 h', '0 – 2 m']);
    await state('mesh', { row: 0, column: 2, value: 8, xLower: 3, xUpper: 6, yLower: 0, yUpper: 2 });
    await hover('mesh', cell(0, 2, 0.02, 0.97), 'heatmap', ['8 kWh']);
    await click('mesh', cell(1, 1), 1);
    await state('mesh', { row: 1, column: 1, value: 3, xLower: 1, xUpper: 3, yLower: 2, yUpper: 5 });
    checks.push('Nonuniform real cell polygons hit their interiors and edges with original row/column/scalar and both data intervals');
    await noHit('mesh', { ...cell(0, 1), missing: true });
    await noHit('mesh', { kind: 'absolute', x: 10, y: 10 });
    await hover('mesh', cell(1, 2), 'heatmap', ['第 2 行', '第 3 列', '11 kWh']);
    await state('mesh', { row: 1, column: 2, value: 11 });
    checks.push('Missing scalar interval stays empty while later cells preserve uncompressed original indices');

    await hover('hist', cell(0, 1), 'histogram2d', ['Count', '0', '2 – 4', '0 – 2']);
    await fieldIs('hist', 'Count', '0');
    await state('hist', { row: 0, column: 1, value: 0, xLower: 2, xUpper: 4, yLower: 0, yUpper: 2 });
    await click('hist', cell(0, 1), 1);
    await hover('hist', cell(0, 0), 'histogram2d', ['Count', '2']);
    await fieldIs('hist', 'Count', '2');
    await hover('hist', cell(1, 1), 'histogram2d', ['Count', '2']);
    await state('hist', { row: 1, column: 1, value: 2, xLower: 2, xUpper: 4, yLower: 2, yUpper: 4 });
    checks.push('Zero-count bins remain interactive; interior-boundary observations enter the next bin and retain exact counts and dual intervals');
    await hover('hist', cell(1, 2, 0.98, 0.02), 'histogram2d', ['Count', '1']);
    await fieldIs('hist', 'Count', '1');
    await state('hist', { row: 1, column: 2, value: 1, xLower: 4, xUpper: 6, yLower: 2, yUpper: 4 });
    await noHit('hist', { kind: 'absolute', x: 10, y: 10 });
    checks.push('The exact maximum observation at (6,4) enters the final bin; invalid input pairs are excluded and outside-panel space is empty');

    await hover('reverse', cell(0, 0), 'heatmap', ['第 1 行', '第 1 列', '1 kWh', '6 – 3 h', '5 – 2 m']);
    await state('reverse', { row: 0, column: 0, value: 1, xLower: 6, xUpper: 3, yLower: 5, yUpper: 2 });
    await hover('reverse', cell(1, 2, 0.03, 0.95), 'heatmap', ['第 2 行', '第 3 列', '10 kWh', '1 – 0 h', '2 – 0 m']);
    await click('reverse', cell(1, 2), 1);
    await state('reverse', { row: 1, column: 2, value: 10, xLower: 1, xUpper: 0, yLower: 2, yUpper: 0 });
    await state('mesh', { selected: true, clicks: 1 });
    await state('hist', { selected: true, clicks: 1 });
    checks.push('Descending boundaries retain their original order and raw cell indices, with independent state across all three charts');

    await legend('mesh').click();
    await page.waitForFunction(() => !document.querySelector('#grid-mesh-svg polygon'));
    await noHit('mesh', { kind: 'absolute', x: 280, y: 150 });
    await state('hist', { selected: true, clicks: 1 });
    await state('reverse', { selected: true, clicks: 1 });
    await legend('mesh').click();
    await page.waitForSelector('#grid-mesh-svg polygon');
    await hover('mesh', cell(0, 2), 'heatmap', ['8 kWh']);
    await legend('hist').click();
    await page.waitForFunction(() => !document.querySelector('#grid-hist-svg polygon'));
    await noHit('hist', { kind: 'absolute', x: 280, y: 150 });
    await state('reverse', { selected: true, clicks: 1 });
    await legend('hist').click();
    await page.waitForSelector('#grid-hist-svg polygon');
    await hover('hist', cell(0, 1), 'histogram2d', ['Count', '0']);
    checks.push('Independent legend rebuilds remove hidden targets, restore their current metadata and preserve other charts’ selections');

    await page.locator('#grids-update').click();
    await page.waitForFunction(() => document.querySelector('#grids-revision')?.textContent === 'Revision 1');
    await state('reverse', { selected: false, hovered: false });
    await hover('mesh', cell(1, 1), 'heatmap', ['9 kWh']);
    await state('mesh', { row: 1, column: 1, value: 9, xLower: 1, xUpper: 3, yLower: 2, yUpper: 5 });
    await hover('hist', cell(1, 2), 'histogram2d', ['Count', '3']);
    await fieldIs('hist', 'Count', '3');
    await state('hist', { value: 3, row: 1, column: 2, xLower: 4, xUpper: 6, yLower: 2, yUpper: 4 });
    await hover('hist', cell(1, 1), 'histogram2d', ['Count', '2']);
    await fieldIs('hist', 'Count', '2');
    await hover('reverse', cell(0, 0), 'heatmap', ['4 kWh', '6 – 3 h']);
    checks.push('Updates replace scalar values and raw counts while preserving interval identity, including unchanged counts under a new color scale');

    for (let index = 0; index < 3; index++) {
      await page.locator('#grids-mount').click();
      await page.waitForSelector('#grids-unmounted');
      assert.equal(await page.locator('svg').count(), 0);
      await page.locator('#grids-mount').click();
      await page.waitForSelector('#grid-reverse-svg');
    }
    await click('mesh', cell(1, 1), 2);
    await state('hist', { clicks: 1 });
    await state('reverse', { clicks: 1 });
    checks.push('Three remount cycles preserve independent click counts and dispatch one event per click');

    await page.locator('#grid-mesh').evaluate(node => { node.style.padding = '23px'; node.style.border = '7px solid #e5e9ed'; });
    await page.locator('#grid-mesh-svg').evaluate(node => { node.style.width = '360px'; node.style.height = '360px'; });
    await hover('mesh', cell(1, 1), 'heatmap', ['9 kWh']);
    await noHit('mesh', { ...cell(0, 1), missing: true });
    const letterbox = await page.locator('#grid-mesh-svg').boundingBox();
    await page.mouse.move(letterbox.x + letterbox.width / 2, letterbox.y + 3);
    await state('mesh', { hovered: false });
    await page.locator('#grid-mesh').evaluate(node => { node.style.padding = ''; node.style.border = ''; });
    await page.locator('#grid-mesh-svg').evaluate(node => { node.style.width = '100%'; node.style.height = 'auto'; });
    checks.push('Actual polygon hits remain correct through CSS scaling, padding, borders and letterboxing; missing cells and blank bands stay empty');

    await page.setViewportSize({ width: 375, height: 812 });
    await hover('mesh', cell(1, 1), 'heatmap', ['9 kWh']);
    const mobileTooltip = await tooltip('mesh').boundingBox();
    assert(mobileTooltip.x >= 0 && mobileTooltip.x + mobileTooltip.width <= 375);
    await hover('hist', cell(0, 1), 'histogram2d', ['Count', '0']);
    await hover('reverse', cell(0, 0), 'heatmap', ['4 kWh', '6 – 3 h']);
    assert(await page.evaluate(() => document.documentElement.scrollWidth <= innerWidth));
    await page.screenshot({ path: path.join(output, 'mobile.png'), fullPage: true });
    checks.push('375px mobile layout retains mesh, zero-count and reversed-interval hits with no tooltip or page overflow');

    await page.setViewportSize({ width: 1280, height: 950 });
    await page.locator('#grids-update').click();
    await page.waitForFunction(() => document.querySelector('#grids-revision')?.textContent === 'Revision 2');
    await hover('mesh', cell(1, 1), 'heatmap', ['3 kWh']);
    await page.screenshot({ path: path.join(output, 'grids.png'), fullPage: true });
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
