// Usage: node tools/verify_release_consumer.cjs /absolute/path/to/unpacked/bundle
// Build example/cmd/app from that bundle first. PLAYWRIGHT_MODULE may point to
// an installed Playwright package; BROWSER_CHANNEL=bundled uses its Chromium.
const assert = require('node:assert/strict');
const fs = require('node:fs/promises');
const http = require('node:http');
const path = require('node:path');

async function main() {
  assert(process.argv[2], 'Pass the unpacked release bundle directory.');
  const root = await fs.realpath(path.resolve(process.argv[2]));
  const output = path.resolve(process.env.MOONPLOT_CONSUMER_OUTPUT ||
    path.join(process.cwd(), '.moonagent/checkpoints/M2/release-consumer'));
  await fs.access(path.join(root,
    '_build/js/debug/build/moonplot-release/consumer/cmd/app/app.js'));
  await fs.access(path.join(root, 'library/rabbita/moonplot.css'));
  await fs.mkdir(output, { recursive: true });
  const { chromium } = require(process.env.PLAYWRIGHT_MODULE || 'playwright');
  const server = http.createServer(async (req, res) => {
    try {
      const url = new URL(req.url, 'http://127.0.0.1');
      if (url.pathname === '/favicon.ico') { res.writeHead(204); res.end(); return; }
      const route = url.pathname === '/example/' ? '/example/index.html' : url.pathname;
      const filename = await fs.realpath(path.resolve(root, '.' + decodeURIComponent(route)));
      if (!filename.startsWith(root + path.sep)) { res.writeHead(403); res.end(); return; }
      const data = await fs.readFile(filename);
      const mime = { '.html': 'text/html', '.js': 'text/javascript', '.css': 'text/css' };
      res.writeHead(200, { 'Content-Type': mime[path.extname(filename)] || 'application/octet-stream' });
      res.end(data);
    } catch (_) { res.writeHead(404); res.end('Not found'); }
  });
  let browser;
  let page;
  let listening = false;
  const checks = [];
  const errors = [];
  try {
    await new Promise((resolve, reject) => {
      server.once('error', reject);
      server.listen(0, '127.0.0.1', () => { listening = true; resolve(); });
    });
    const channel = process.env.BROWSER_CHANNEL || 'chrome';
    browser = await chromium.launch({ headless: true,
      ...(channel === 'bundled' ? {} : { channel }) });
    page = await browser.newPage({ viewport: { width: 1100, height: 850 } });
    page.setDefaultTimeout(10000);
    page.on('pageerror', error => errors.push(String(error)));
    page.on('console', message => {
      if (message.type() === 'error') errors.push(message.text());
    });
    await page.goto(`http://127.0.0.1:${server.address().port}/example/`,
      { waitUntil: 'networkidle' });
    await page.waitForSelector('#release-chart-svg');
    assert.equal(await page.locator('#plot-error').count(), 0);
    assert(await page.evaluate(() => [...document.querySelectorAll('svg, svg *')]
      .every(node => node.namespaceURI === 'http://www.w3.org/2000/svg')));
    assert.equal(await page.locator('#release-chart-svg polyline').count(), 1);
    assert.equal(await page.locator('.moonplot').evaluate(node =>
      getComputedStyle(node).getPropertyValue('--moonplot-text').trim()), '#263443');
    checks.push('Independent public consumer renders real SVG DOM and bundled component CSS');

    async function point(index = 0) {
      return page.locator('#release-chart-svg').evaluate((svg, index) => {
        const vertex = svg.querySelector('polyline').points.getItem(index);
        const p = new DOMPoint(vertex.x, vertex.y).matrixTransform(svg.getScreenCTM());
        return { x: p.x, y: p.y };
      }, index);
    }
    async function state(values) {
      await page.waitForFunction(values => {
        const element = document.querySelector('#selection');
        return element && Object.entries(values)
          .every(([key, value]) => element.dataset[key] === String(value));
      }, values);
    }
    const first = await point();
    await page.mouse.move(first.x, first.y);
    await page.waitForSelector('[data-testid="release-chart-tooltip"]');
    assert.equal(await page.locator('[data-testid="release-chart-tooltip"]').count(), 1);
    await page.mouse.click(first.x, first.y);
    await state({ selected: true, point: 0, x: 1, y: 2, clicks: 1 });
    checks.push('Actual hover and click events update application state');

    const trend = page.locator('[data-moonplot-series="trend"]');
    await trend.click();
    await page.waitForFunction(() => !document.querySelector('#release-chart-svg polyline'));
    assert.equal(await trend.getAttribute('aria-pressed'), 'false');
    await page.mouse.click(first.x, first.y);
    await state({ selected: false, clicks: 1 });
    await trend.click();
    await page.waitForSelector('#release-chart-svg polyline');
    assert.equal(await trend.getAttribute('aria-pressed'), 'true');
    checks.push('Application-controlled legend removes the series and its hit targets');

    const previous = await page.locator('#release-chart-svg polyline').getAttribute('points');
    await page.locator('#update-data').click();
    await page.waitForFunction(() => document.querySelector('#revision').textContent.endsWith('1'));
    await page.waitForFunction(previous =>
      document.querySelector('#release-chart-svg polyline').getAttribute('points') !== previous, previous);
    await state({ selected: false, clicks: 1 });
    const updated = await point();
    await page.mouse.click(updated.x, updated.y);
    await state({ selected: true, point: 0, x: 1, y: 3, clicks: 2 });
    checks.push('Data updates redraw geometry and select current values');

    await page.setViewportSize({ width: 375, height: 812 });
    const mobile = await point(2);
    await page.mouse.move(mobile.x, mobile.y);
    await page.mouse.click(mobile.x, mobile.y);
    await state({ selected: true, point: 2, x: 3, y: 4, clicks: 3 });
    assert(await page.evaluate(() => document.documentElement.scrollWidth <= innerWidth));
    await page.screenshot({ path: path.join(output, 'consumer-mobile.png'), fullPage: true });
    checks.push('375px independent consumer retains responsive hit coordinates');
    await page.setViewportSize({ width: 1100, height: 850 });
    await page.screenshot({ path: path.join(output, 'consumer.png'), fullPage: true });
    assert.deepEqual(errors, []);
    const report = { bundle: root, browser: browser.version(), checks, pageErrors: errors };
    await fs.writeFile(path.join(output, 'report.json'), JSON.stringify(report, null, 2) + '\n');
    console.log(JSON.stringify(report, null, 2));
  } catch (error) {
    if (page) await page.screenshot({ path: path.join(output, 'failure.png'), fullPage: true }).catch(() => {});
    throw error;
  } finally {
    try {
      if (browser) await browser.close();
    } finally {
      if (listening) await new Promise(resolve => server.close(resolve));
    }
  }
}

main().catch(error => { console.error(error); process.exitCode = 1; });
