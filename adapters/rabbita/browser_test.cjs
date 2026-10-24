// Browser acceptance for the built MoonPlot/Rabbita example.
// Install Playwright normally, or set PLAYWRIGHT_MODULE to its absolute path.
const assert = require('node:assert/strict');
const fs = require('node:fs/promises');
const http = require('node:http');
const path = require('node:path');
const { chromium } = require(process.env.PLAYWRIGHT_MODULE || 'playwright');

const root = __dirname;
const output = path.resolve(process.env.MOONPLOT_BROWSER_OUTPUT ||
  path.join(root, '../../.moonagent/checkpoints/G2-browser-acceptance'));
const checks = [];

async function main() {
  await fs.mkdir(output, { recursive: true });
  await fs.access(path.join(root, '_build/js/debug/build/moonbit-community/moonplot-rabbita/cmd/demo/demo.js'));
  const server = http.createServer(async (req, res) => {
    try {
      const url = new URL(req.url, 'http://127.0.0.1');
      if (url.pathname === '/favicon.ico') { res.writeHead(204); res.end(); return; }
      const filename = path.resolve(root, '.' + decodeURIComponent(
        url.pathname === '/' ? '/index.html' : url.pathname));
      if (!filename.startsWith(root + path.sep)) {
        res.writeHead(403); res.end(); return;
      }
      const mime = { '.html': 'text/html', '.js': 'text/javascript', '.css': 'text/css', '.png': 'image/png' };
      const content = await fs.readFile(filename);
      res.writeHead(200, { 'Content-Type': mime[path.extname(filename)] || 'application/octet-stream' });
      res.end(content);
    } catch (_) { res.writeHead(404); res.end('Not found'); }
  });
  await new Promise(resolve => server.listen(0, '127.0.0.1', resolve));
  let browser;
  let page;
  const errors = [];
  try {
    const channel = process.env.BROWSER_CHANNEL || 'chrome';
    browser = await chromium.launch({ headless: true,
      ...(channel === 'bundled' ? {} : { channel }) });
    page = await browser.newPage({ viewport: { width: 1280, height: 900 } });
    page.on('pageerror', error => errors.push(String(error)));
    page.on('console', msg => { if (msg.type() === 'error') errors.push(msg.text()); });
    await page.goto(`http://127.0.0.1:${server.address().port}/`, { waitUntil: 'networkidle' });
    await page.waitForSelector('#chart-a-svg', { timeout: 15000 });
    assert.equal(await page.locator('#plot-error').count(), 0);
    assert.equal(await page.locator('[data-moonplot-root]').count(), 2);
    assert(await page.evaluate(() => [...document.querySelectorAll('svg, svg *')]
      .every(node => node.namespaceURI === 'http://www.w3.org/2000/svg')));
    assert(await page.locator('#chart-a-svg polyline').first().evaluate(
      node => node instanceof SVGPolylineElement && node.getAttribute('points').includes('.')));
    checks.push('Real SVG DOM namespace and fractional geometry');

    async function point(chart, index = 0) {
      await page.locator(`#${chart}-svg`).scrollIntoViewIfNeeded();
      return page.locator(`#${chart}-svg`).evaluate((svg, index) => {
        const vertex = svg.querySelector('polyline').points.getItem(index);
        const client = new DOMPoint(vertex.x, vertex.y).matrixTransform(svg.getScreenCTM());
        return { x: client.x, y: client.y };
      }, index);
    }
    async function hover(chart, index = 0) {
      const p = await point(chart, index);
      await page.mouse.move(p.x, p.y);
      await page.waitForSelector(`[data-testid="${chart}-tooltip"]`);
      return p;
    }
    async function textIs(selector, fragment) {
      await page.waitForFunction(({ selector, fragment }) =>
        document.querySelector(selector)?.textContent.includes(fragment), { selector, fragment });
    }
    async function stateIs(chart, values) {
      const selector = chart === 'chart-a' ? '#a-selection' : '#b-selection';
      await page.waitForFunction(({ selector, values }) => {
        const summary = document.querySelector(selector);
        return summary && Object.entries(values).every(([key, value]) => summary.dataset[key] === String(value));
      }, { selector, values });
    }
    async function select(chart, index = 0) {
      const p = await point(chart, index);
      await page.mouse.click(p.x, p.y);
      await stateIs(chart, { point: index, selected: true });
    }

    const cardBeforeHover = await page.locator('.chart-card').first().boundingBox();
    const legendBeforeHover = await page.locator('[data-testid="chart-a-legend"]').boundingBox();
    await hover('chart-a');
    assert((await page.locator('[data-testid="chart-a-tooltip"]').innerText()).includes('2'));
    assert.equal(await page.locator('[data-testid="chart-b-tooltip"]').count(), 0);
    await select('chart-a');
    await stateIs('chart-a', { x: 1, y: 2 });
    await stateIs('chart-a', { clicks: 1 });
    assert.equal(await page.locator('#chart-a-svg [data-moonplot-selected]').count(), 1);
    checks.push('Hover tooltip and click selection update application state');
    const cardAfterHover = await page.locator('.chart-card').first().boundingBox();
    const legendAfterHover = await page.locator('[data-testid="chart-a-legend"]').boundingBox();
    assert(Math.abs(cardAfterHover.height - cardBeforeHover.height) < 0.5);
    assert(Math.abs(legendAfterHover.y - legendBeforeHover.y) < 0.5);
    assert(!((await page.locator('body').innerText()).includes('series=')));
    checks.push('Hover inspector does not move the legend or resize the card');

    await hover('chart-b');
    await page.waitForFunction(() => !document.querySelector('[data-testid="chart-a-tooltip"]'));
    await select('chart-b');
    await stateIs('chart-b', { x: 1, y: 7 });
    await stateIs('chart-b', { clicks: 1 });
    await stateIs('chart-a', { clicks: 1 });
    await stateIs('chart-a', { x: 1, y: 2 });
    checks.push('Two charts have independent hover, selection and click counts');

    const trend = page.locator('[data-testid="chart-a"] [data-moonplot-series="trend"]');
    const oldLinePoint = await point('chart-a', 3);
    await trend.focus();
    await page.keyboard.press('Space');
    await page.waitForFunction(() => !document.querySelector('#chart-a-svg polyline'));
    assert.equal(await trend.getAttribute('aria-pressed'), 'false');
    await page.mouse.click(oldLinePoint.x, oldLinePoint.y);
    await stateIs('chart-a', { selected: false });
    await stateIs('chart-a', { clicks: 1 });
    assert.equal(await page.locator('#chart-b-svg polyline').count(), 1);
    await trend.click();
    await page.waitForSelector('#chart-a-svg polyline');
    assert.equal(await trend.getAttribute('aria-pressed'), 'true');
    checks.push('Keyboard and pointer legend toggles remove lines and their hit targets');

    const before = await page.locator('#chart-a-svg polyline').getAttribute('points');
    await page.locator('#update-data').click();
    await textIs('#data-version', '1');
    await page.waitForFunction(before =>
      document.querySelector('#chart-a-svg polyline')?.getAttribute('points') !== before, before);
    await stateIs('chart-a', { selected: false });
    await select('chart-a');
    await stateIs('chart-a', { x: 1, y: 3 });
    await stateIs('chart-a', { clicks: 2 });
    checks.push('Data updates change geometry and report current data values');

    for (let i = 0; i < 3; i++) {
      await page.locator('#toggle-mount').click();
      await page.waitForSelector('#unmounted');
      assert.equal(await page.locator('svg').count(), 0);
      await page.locator('#toggle-mount').click();
      await page.waitForSelector('#chart-a-svg');
      assert.equal(await page.locator('[data-moonplot-root]').count(), 2);
    }
    await select('chart-a');
    await stateIs('chart-a', { clicks: 3 });
    await stateIs('chart-b', { clicks: 1 });
    checks.push('Repeated unmount/remount adds no duplicate event dispatch');

    await page.evaluate(() => {
      const spacer = document.createElement('div');
      spacer.id = 'test-scroll-spacer'; spacer.style.height = '650px';
      document.body.prepend(spacer);
      const card = document.querySelector('.chart-card');
      card.style.padding = '31px'; card.style.borderWidth = '9px';
    });
    await hover('chart-a', 2);
    assert(await page.evaluate(() => scrollY > 0));
    await select('chart-a', 2);
    await stateIs('chart-a', { x: 3, y: 3.25 });
    checks.push('Scroll and outer padding/borders use the actual SVG viewport');

    await page.locator('#chart-a-svg').evaluate(svg => {
      svg.style.width = '420px'; svg.style.height = '420px';
    });
    await hover('chart-a', 1);
    await select('chart-a', 1);
    await stateIs('chart-a', { x: 2, y: 4.5 });
    const box = await page.locator('#chart-a-svg').boundingBox();
    await page.mouse.click(box.x + box.width / 2, box.y + 5);
    await stateIs('chart-a', { selected: false });
    checks.push('Matching viewBox letterboxing maps points and rejects empty bands');

    await page.evaluate(() => {
      document.querySelector('#test-scroll-spacer').remove();
      const card = document.querySelector('.chart-card');
      card.style.padding = ''; card.style.borderWidth = '';
      const svg = document.querySelector('#chart-a-svg');
      svg.style.width = '100%'; svg.style.height = 'auto';
    });
    await page.setViewportSize({ width: 640, height: 900 });
    await hover('chart-a', 3);
    await select('chart-a', 3);
    await stateIs('chart-a', { x: 4, y: 7 });
    checks.push('Responsive width retains CSS-pixel hit coordinates');
    await page.setViewportSize({ width: 375, height: 812 });
    await hover('chart-a', 3);
    await select('chart-a', 3);
    await stateIs('chart-a', { x: 4, y: 7 });
    assert(await page.evaluate(() => document.documentElement.scrollWidth <= innerWidth));
    await page.screenshot({ path: path.join(output, 'mobile.png'), fullPage: true });
    checks.push('375px phone layout fits without horizontal overflow');

    await page.setViewportSize({ width: 1280, height: 900 });
    await page.locator('#reset').click();
    await textIs('#data-version', '0');
    await hover('chart-a', 2);
    await select('chart-a', 2);
    await page.screenshot({ path: path.join(output, 'demo.png'), fullPage: true });
    assert.deepEqual(errors, []);
    const report = { browser: browser.version(), checks, pageErrors: errors };
    await fs.writeFile(path.join(output, 'report.json'), JSON.stringify(report, null, 2) + '\n');
    console.log(JSON.stringify(report, null, 2));
  } catch (error) {
    if (page) {
      await page.screenshot({ path: path.join(output, 'failure.png'), fullPage: true }).catch(() => {});
      console.error(await page.locator('body').innerText().catch(() => 'Unable to read page'));
    }
    throw error;
  } finally {
    if (browser) await browser.close();
    await new Promise(resolve => server.close(resolve));
  }
}

main().catch(error => { console.error(error); process.exitCode = 1; });
