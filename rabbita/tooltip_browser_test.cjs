// True-DOM acceptance for typed chart tooltips and geometric hit regions.
// Build rabbita/cmd/tooltips first; use installed Playwright or PLAYWRIGHT_MODULE.
const assert = require('node:assert/strict');
const fs = require('node:fs/promises');
const http = require('node:http');
const path = require('node:path');
const { chromium } = require(process.env.PLAYWRIGHT_MODULE || 'playwright');
const root = path.resolve(__dirname, '..');
const output = path.resolve(process.env.MOONPLOT_TOOLTIP_OUTPUT ||
  path.join(root, '.moonagent/checkpoints/typed-tooltips/browser'));
const checks = [];

async function main() {
  await fs.mkdir(output, { recursive: true });
  await fs.access(path.join(root, '_build/js/debug/build/rabbita/cmd/tooltips/tooltips.js'));
  const server = http.createServer(async (request, response) => {
    try {
      const url = new URL(request.url, 'http://127.0.0.1');
      if (url.pathname === '/favicon.ico') { response.writeHead(204); response.end(); return; }
      const filename = path.resolve(root, '.' + decodeURIComponent(url.pathname));
      if (!filename.startsWith(root + path.sep)) { response.writeHead(403); response.end(); return; }
      const body = await fs.readFile(filename);
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
    page = await browser.newPage({ viewport: { width: 1280, height: 950 } });
    page.on('pageerror', error => errors.push(String(error)));
    page.on('console', message => { if (message.type() === 'error') errors.push(message.text()); });
    await page.goto(`http://127.0.0.1:${server.address().port}/rabbita/tooltips.html`, { waitUntil: 'networkidle' });
    await page.waitForFunction(() => document.querySelector('#tip-pie-svg') ||
      document.querySelector('#tooltip-error'));
    const failed = await page.locator('#tooltip-error').count();
    assert.equal(failed, 0, failed ? await page.locator('#tooltip-error').innerText() : 'All figures render');
    assert.equal(await page.locator('svg[data-moonplot-root]').count(), 6);
    assert(await page.evaluate(() => [...document.querySelectorAll('svg, svg *')].every(
      element => element.namespaceURI === 'http://www.w3.org/2000/svg')));
    checks.push('Six public Figure exports render as real namespaced SVG DOM');

    const tooltip = chart => page.locator(`[data-testid="tip-${chart}-tooltip"]`);
    async function state(chart, expected) {
      await page.waitForFunction(({ chart, expected }) => {
        const node = document.querySelector(`#tip-${chart}-status`);
        return node && Object.entries(expected).every(([key, value]) => node.dataset[key] === String(value));
      }, { chart, expected });
    }
    async function position(chart, query) {
      const svg = page.locator(`#tip-${chart}-svg`);
      await svg.scrollIntoViewIfNeeded();
      return svg.evaluate((svg, query) => {
        let x, y;
        if (query.kind === 'rect') {
          const rect = [...svg.querySelectorAll('rect')].filter(node =>
            node.getAttribute('fill') === query.fill)[query.index || 0];
          if (!rect) throw Error('Missing colored bar rect ' + query.fill);
          x = rect.x.baseVal.value + rect.width.baseVal.value * query.fx;
          y = rect.y.baseVal.value + rect.height.baseVal.value * query.fy;
        } else if (query.kind === 'legend') {
          const rect = svg.querySelector('rect[fill="white"][fill-opacity="0.85"]');
          if (!rect) throw Error('Missing embedded SVG legend');
          x = rect.x.baseVal.value + rect.width.baseVal.value / 2;
          y = rect.y.baseVal.value + rect.height.baseVal.value / 2;
          const coveredBar = [...svg.querySelectorAll('rect[fill="#5e91a8"]')].slice(0, 3)
            .some(bar => x >= bar.x.baseVal.value && x <= bar.x.baseVal.value + bar.width.baseVal.value &&
              y >= bar.y.baseVal.value && y <= bar.y.baseVal.value + bar.height.baseVal.value);
          if (!coveredBar) throw Error('Legend regression must cover a real histogram bar');
        } else if (query.kind === 'scatter') {
          const circle = svg.querySelectorAll('circle[fill="#ce8650"]')[query.index || 0];
          x = circle.cx.baseVal.value; y = circle.cy.baseVal.value + (query.dy || 0);
        } else if (query.kind === 'line') {
          const points = svg.querySelector('polyline').points;
          const vertex = points.getItem(query.index || 0);
          const first = points.getItem(0), second = points.getItem(1);
          const unitY = (first.y - second.y) / 5;
          x = vertex.x + (query.dx || 0);
          y = query.near ? vertex.y : first.y + unitY * 1.4;
        } else if (query.kind === 'pie') {
          const wedge = svg.querySelector('path[fill="#4d79c7"]');
          let cx, cy, r;
          if (wedge) {
            const values = wedge.getAttribute('d').match(/-?\d+(?:\.\d+)?(?:e[+-]?\d+)?/gi).map(Number);
            [cx, cy] = values; r = values[4];
          } else {
            const circle = svg.querySelector('circle[fill="#ce8650"]');
            cx = circle.cx.baseVal.value; cy = circle.cy.baseVal.value; r = circle.r.baseVal.value;
          }
          const angle = query.angle * Math.PI / 180;
          x = cx + r * (query.radius || 0.62) * Math.cos(angle);
          y = cy - r * (query.radius || 0.62) * Math.sin(angle);
        } else { x = query.x; y = query.y; }
        const screen = new DOMPoint(x, y).matrixTransform(svg.getScreenCTM());
        return { x: screen.x, y: screen.y };
      }, query);
    }
    async function hover(chart, query, kind, fragments = []) {
      const point = await position(chart, query);
      await page.mouse.move(point.x, point.y);
      await tooltip(chart).waitFor();
      assert.equal(await tooltip(chart).getAttribute('data-moonplot-kind'), kind);
      const text = await tooltip(chart).innerText();
      for (const fragment of fragments) assert(text.includes(fragment), `${chart} tooltip contains ${fragment}: ${text}`);
      return point;
    }
    async function noHit(chart, query) {
      const point = await position(chart, query);
      await page.mouse.move(point.x, point.y);
      await state(chart, { hovered: false });
      assert.equal(await tooltip(chart).count(), 0);
    }
    async function fieldIs(chart, label, value) {
      const actual = await tooltip(chart).locator('.moonplot-coordinate').evaluateAll((rows, label) => {
        const row = rows.find(row => row.querySelector('.moonplot-coordinate-label')?.textContent === label);
        return row?.querySelector('b')?.textContent;
      }, label);
      assert.equal(actual, value, `${chart} ${label} metadata`);
    }
    async function click(chart, query, count) {
      const point = await position(chart, query);
      await page.mouse.click(point.x, point.y);
      await state(chart, { selected: true, clicks: count });
    }
    const bar = (index = 0, fx = 0.5, fy = 0.65) => ({ kind: 'rect', fill: '#398575', index, fx, fy });
    const barh = (index = 0, fx = 0.4, fy = 0.5) => ({ kind: 'rect', fill: '#8a70b5', index, fx, fy });
    const hist = (index, fx = 0.5) => ({ kind: 'rect', fill: '#5e91a8', index, fx, fy: 0.6 });

    assert.equal(await page.locator('#tip-line-svg circle').count(), 0, 'Line has no visible markers');
    await hover('line', { kind: 'line', index: 1 }, 'line', ['2026-10-24', '7 °C', 'Temperature']);
    await state('line', { point: 1 });
    await click('line', { kind: 'line', index: 1 }, 1);
    await noHit('line', { kind: 'absolute', x: 10, y: 10 });
    checks.push('Explicit XNearest follows unmarked line samples far from Y, with custom date and unit; outside panel is empty');

    await hover('scatter', { kind: 'scatter', index: 1 }, 'scatter', ['Observations', '7']);
    await noHit('scatter', { kind: 'scatter', index: 1, dy: 60 });
    await state('line', { selected: true, clicks: 1 });
    checks.push('Scatter retains radius-based point hits and independent chart state');

    const before = await page.locator('#tip-bar').boundingBox();
    await hover('bar', bar(), 'bar', ['华东', '8 万元', '地区销量']);
    await hover('bar', bar(0, 0.02, 0.35), 'bar', ['华东', '8 万元']);
    await click('bar', bar(), 1);
    const after = await page.locator('#tip-bar').boundingBox();
    assert(Math.abs(before.height - after.height) < 0.5);
    await hover('bar', bar(1), 'bar', ['华南', '-4 万元']);
    const gap = await page.locator('#tip-bar-svg').evaluate(svg => {
      const bars = [...svg.querySelectorAll('rect[fill="#398575"]')];
      return { x: (bars[0].x.baseVal.value + bars[0].width.baseVal.value + bars[1].x.baseVal.value) / 2,
        y: bars[0].y.baseVal.value + bars[0].height.baseVal.value * 0.6 };
    });
    await noHit('bar', { kind: 'absolute', ...gap });
    checks.push('Whole positive/negative bars and edges use custom Chinese category/value tooltips; gaps stay empty and layout is stable');

    await hover('barh', barh(), 'barh', ['Net change', 'West', '-5']);
    await fieldIs('barh', 'Category', 'West');
    await fieldIs('barh', 'Value', '-5');
    await click('barh', barh(0, 0.02), 1);
    await hover('barh', barh(2, 0.7), 'barh', ['East', '7']);
    checks.push('Negative horizontal bar interiors and far edges retain signed values and categories');

    await hover('hist', hist(0, 0.01), 'histogram', ['Response time', 'Range', '0', '1', 'Count', '2']);
    await fieldIs('hist', 'Range', '0 – 1');
    await fieldIs('hist', 'Count', '2');
    await hover('hist', hist(1, 0.99), 'histogram', ['Range', '1', '2', 'Count', '2']);
    await fieldIs('hist', 'Range', '1 – 2');
    await fieldIs('hist', 'Count', '2');
    await hover('hist', hist(2, 0.99), 'histogram', ['Range', '2', '3', 'Count', '4']);
    await fieldIs('hist', 'Range', '2 – 3');
    await fieldIs('hist', 'Count', '4');
    checks.push('Histogram bin edges and the inclusive maximum expose original intervals and exact counts');
    await noHit('hist', { kind: 'legend' });
    checks.push('Embedded SVG legend suppresses the real histogram bar underneath its rectangle');

    await hover('pie', { kind: 'pie', angle: 30 }, 'pie', ['Research', 'Value', '1', 'Share', '16.67%']);
    await hover('pie', { kind: 'pie', angle: 120 }, 'pie', ['Operations', '2', '33.33%']);
    await fieldIs('pie', 'Category', 'Operations');
    await fieldIs('pie', 'Value', '2');
    await fieldIs('pie', 'Share', '33.33%');
    await hover('pie', { kind: 'pie', angle: 270, radius: 0.92 }, 'pie', ['Services', '3', '50%']);
    await noHit('pie', { kind: 'pie', angle: 270, radius: 1.2 });
    checks.push('Each pie sector, including outer interior, exposes category/value/share; outside circle stays empty');

    await page.locator('#tooltip-toggle').click();
    const hiddenPoint = await position('bar', bar());
    await page.mouse.move(hiddenPoint.x, hiddenPoint.y);
    await state('bar', { hovered: true });
    assert.equal(await tooltip('bar').count(), 0);
    await click('bar', bar(), 2);
    await page.locator('#tooltip-toggle').click();
    await hover('bar', bar(), 'bar', ['8 万元']);
    checks.push('Tooltip visibility can be disabled without disabling hover/click events');

    await page.locator('[data-testid="tip-line"] [data-moonplot-series="temperature"]').click();
    await page.waitForFunction(() => !document.querySelector('#tip-line-svg polyline'));
    await noHit('line', { kind: 'absolute', x: 280, y: 150 });
    await page.locator('[data-testid="tip-line"] [data-moonplot-series="temperature"]').click();
    await page.waitForSelector('#tip-line-svg polyline');
    checks.push('Visibility changes remove hidden line targets');

    await page.locator('#tooltip-update').click();
    await page.waitForFunction(() => document.querySelector('#tooltip-revision')?.textContent === 'Revision 1');
    await hover('bar', bar(), 'bar', ['11 万元']);
    await hover('line', { kind: 'line', index: 1, near: true }, 'line', ['8 °C']);
    for (const angle of [15, 135, 260, 355]) {
      await hover('pie', { kind: 'pie', angle }, 'pie', ['Services', '5', '100%']);
    }
    checks.push('Data updates replace tooltip metadata and a single positive pie slice covers the full circle');

    for (let i = 0; i < 3; i++) {
      await page.locator('#tooltip-mount').click();
      await page.waitForSelector('#tooltips-unmounted');
      assert.equal(await page.locator('svg').count(), 0);
      await page.locator('#tooltip-mount').click();
      await page.waitForSelector('#tip-pie-svg');
    }
    await click('bar', bar(), 3);
    await state('barh', { clicks: 1 });
    await state('line', { clicks: 1 });
    checks.push('Three remount cycles preserve independent state and dispatch one click per event');

    await page.locator('#tip-bar').evaluate(node => { node.style.padding = '27px'; node.style.border = '7px solid #e5e9ed'; });
    await page.locator('#tip-bar-svg').evaluate(node => { node.style.width = '360px'; node.style.height = '360px'; });
    await hover('bar', bar(), 'bar', ['11 万元']);
    const letterbox = await page.locator('#tip-bar-svg').boundingBox();
    await page.mouse.move(letterbox.x + letterbox.width / 2, letterbox.y + 5);
    await state('bar', { hovered: false });
    await page.locator('#tip-bar').evaluate(node => { node.style.padding = ''; node.style.border = ''; });
    await page.locator('#tip-bar-svg').evaluate(node => { node.style.width = '100%'; node.style.height = 'auto'; });
    checks.push('Scroll, outer padding and borders, and letterboxing preserve region coordinates and reject blank bands');

    await page.setViewportSize({ width: 375, height: 812 });
    await hover('bar', bar(), 'bar', ['11 万元']);
    const mobileBox = await tooltip('bar').boundingBox();
    assert(mobileBox.x >= 0 && mobileBox.x + mobileBox.width <= 375);
    assert(await page.evaluate(() => document.documentElement.scrollWidth <= innerWidth));
    await page.screenshot({ path: path.join(output, 'mobile.png'), fullPage: true });
    checks.push('375px layout and custom tooltip stay inside the viewport');

    await page.setViewportSize({ width: 1280, height: 950 });
    await page.locator('#tooltip-update').click();
    await page.waitForFunction(() => document.querySelector('#tooltip-revision')?.textContent === 'Revision 2');
    await hover('bar', bar(), 'bar', ['8 万元']);
    await page.screenshot({ path: path.join(output, 'tooltips.png'), fullPage: true });
    assert.deepEqual(errors, []);
    const report = { browser: browser.version(), checks, pageErrors: errors };
    await fs.writeFile(path.join(output, 'report.json'), JSON.stringify(report, null, 2) + '\n');
    console.log(JSON.stringify(report, null, 2));
  } catch (error) {
    if (page) {
      await page.screenshot({ path: path.join(output, 'failure.png'), fullPage: true }).catch(() => {});
      console.error(await page.locator('body').innerText().catch(() => 'Unable to read body'));
    }
    await fs.writeFile(path.join(output, 'failure.json'),
      JSON.stringify({ error: String(error), checks, pageErrors: errors }, null, 2) + '\n');
    throw error;
  } finally {
    if (browser) await browser.close();
    await new Promise(resolve => server.close(resolve));
  }
}

main().catch(error => { console.error(error); process.exitCode = 1; });
