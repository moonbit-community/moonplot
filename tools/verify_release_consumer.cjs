// Usage: node tools/verify_release_consumer.cjs /absolute/path/to/unpacked/bundle
// Build example/cmd/app from that bundle first. PLAYWRIGHT_MODULE may point to
// an installed Playwright package; BROWSER_CHANNEL=bundled uses its Chromium.
const assert = require('node:assert/strict');
const fs = require('node:fs/promises');
const http = require('node:http');
const path = require('node:path');
const polar = require('./verify_polar_consumer.cjs');
const polarBars = require('./verify_polar_bars_consumer.cjs');

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
  const vectorEvents = [];
  const barbEvents = [];
  const contourEvents = [];
  const filledEvents = [];
  const tripcolorEvents = [];
  const streamplotEvents = [];
  const polarEvents = [];
  const polarBarEvents = [];
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
    assert.equal(await page.locator('#release-chart').evaluate(node =>
      getComputedStyle(node).getPropertyValue('--moonplot-text').trim()), '#263443');
    checks.push('Independent public consumer renders real SVG DOM and bundled component CSS');
    const polarInitial = await polar.snapshot(page);
    const polarBarsInitial = await polarBars.snapshot(page);

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

    await page.locator('#release-bars-svg').scrollIntoViewIfNeeded();
    const bar = await page.locator('#release-bars-svg rect[x][y]').first().evaluate(rect => {
      const x = Number(rect.getAttribute('x')) + Number(rect.getAttribute('width')) * 0.3;
      const y = Number(rect.getAttribute('y')) + Number(rect.getAttribute('height')) * 0.8;
      const p = new DOMPoint(x, y).matrixTransform(rect.ownerSVGElement.getScreenCTM());
      return { x: p.x, y: p.y };
    });
    await page.mouse.move(bar.x, bar.y);
    await page.waitForSelector('[data-testid="consumer-custom-tooltip"]');
    assert.equal(await page.locator('[data-testid="consumer-custom-tooltip"]').textContent(),
      'Orders · North: 5 items');
    checks.push('Installed grouped bar geometry triggers a custom series/category/value tooltip inside the whole rectangle');

    await page.locator('#release-cells-svg').scrollIntoViewIfNeeded();
    const cell = await page.locator('#release-cells-svg rect[x][y]').first().evaluate(rect => {
      const x = Number(rect.getAttribute('x')) + Number(rect.getAttribute('width')) * 0.05;
      const y = Number(rect.getAttribute('y')) + Number(rect.getAttribute('height')) * 0.05;
      const p = new DOMPoint(x, y).matrixTransform(rect.ownerSVGElement.getScreenCTM());
      return { x: p.x, y: p.y };
    });
    await page.mouse.move(cell.x, cell.y);
    await page.waitForSelector('[data-testid="consumer-cell-tooltip"]');
    assert.equal(await page.locator('[data-testid="consumer-cell-tooltip"]').textContent(), 'Cell 0,0: 1');
    checks.push('Installed scalar heatmap exposes original row/column/value at a cell edge through the public callback');

    await page.locator('#release-statistics-svg').scrollIntoViewIfNeeded();
    const errorArm = await page.locator('#release-statistics-svg line[stroke="#975a40"]').first().evaluate(line => {
      const x = (Number(line.getAttribute('x1')) + Number(line.getAttribute('x2'))) / 2;
      const y = (Number(line.getAttribute('y1')) + Number(line.getAttribute('y2'))) / 2;
      const p = new DOMPoint(x, y).matrixTransform(line.ownerSVGElement.getScreenCTM());
      return { x: p.x, y: p.y };
    });
    await page.mouse.move(errorArm.x, errorArm.y);
    await page.waitForFunction(() => document.querySelector('[data-testid="consumer-statistics-tooltip"]')?.textContent === 'Measured: 5 [3, 7]');
    checks.push('Installed error-bar overlay exposes its original value and full typed range above the confidence band');

    const bandInterior = await page.locator('#release-statistics-svg polygon[fill="#deebe7"]').evaluate(polygon => {
      const points = [...polygon.points];
      const xs = points.map(p => p.x), ys = points.map(p => p.y);
      const x = Math.min(...xs) + (Math.max(...xs) - Math.min(...xs)) * 0.8;
      const y = (Math.min(...ys) + Math.max(...ys)) / 2;
      const p = new DOMPoint(x, y).matrixTransform(polygon.ownerSVGElement.getScreenCTM());
      return { x: p.x, y: p.y };
    });
    await page.mouse.move(bandInterior.x, bandInterior.y);
    await page.waitForFunction(() => document.querySelector('[data-testid="consumer-statistics-tooltip"]')?.textContent === 'Band: 1..7');
    checks.push('Installed filled-area interior retains its own bounds away from the measurement overlay');

    await page.locator('#release-boxes-svg').scrollIntoViewIfNeeded();
    const outlier = await page.locator('#release-boxes-svg circle[fill="#567681"]').first().evaluate(circle => {
      const p = new DOMPoint(Number(circle.getAttribute('cx')), Number(circle.getAttribute('cy')))
        .matrixTransform(circle.ownerSVGElement.getScreenCTM());
      return { x: p.x, y: p.y };
    });
    await page.mouse.move(outlier.x, outlier.y);
    await page.waitForFunction(() => document.querySelector('[data-testid="consumer-box-tooltip"]')?.textContent === 'Box: 2.25 / 3.5 / 4.75; value=20');
    checks.push('Installed boxplot outlier carries original quartiles, median and outlier value to a custom tooltip');

    async function polygonPoint(id, index, fraction = 0.5) {
      await page.locator(`#${id}`).scrollIntoViewIfNeeded();
      return page.locator(`#${id} polygon`).nth(index).evaluate((polygon, fraction) => {
        const points = [...polygon.points];
        const xs = points.map(p => p.x), ys = points.map(p => p.y);
        const x = Math.min(...xs) + (Math.max(...xs) - Math.min(...xs)) * fraction;
        const y = Math.min(...ys) + (Math.max(...ys) - Math.min(...ys)) * fraction;
        const p = new DOMPoint(x, y).matrixTransform(polygon.ownerSVGElement.getScreenCTM());
        return { x: p.x, y: p.y };
      }, fraction);
    }
    const meshCell = await polygonPoint('release-mesh-svg', 0, 0.05);
    await page.mouse.move(meshCell.x, meshCell.y);
    await page.waitForFunction(() => document.querySelector('[data-testid="consumer-mesh-tooltip"]')?.textContent === 'Mesh 0,0: 3; x=0..1; y=-1..2');
    checks.push('Installed nonuniform flat mesh exposes its original scalar and both data intervals near a cell corner');

    const zeroBin = await polygonPoint('release-bins-svg', 2);
    await page.mouse.move(zeroBin.x, zeroBin.y);
    await page.waitForFunction(() => document.querySelector('[data-testid="consumer-bins-tooltip"]')?.textContent === 'Count 0; x=0..1; y=1..2');
    assert.equal(await page.locator('[data-testid="consumer-bins-tooltip"]').getAttribute('data-histogram2d'), 'true');
    checks.push('Installed Histogram2D distinguishes a zero-count bin and preserves its exact x/y intervals');

    const maximumBin = await polygonPoint('release-bins-svg', 3);
    await page.mouse.move(maximumBin.x, maximumBin.y);
    await page.waitForFunction(() => document.querySelector('[data-testid="consumer-bins-tooltip"]')?.textContent === 'Count 2; x=1..2; y=1..2');
    checks.push('Installed two-dimensional histogram includes repeated maximum-boundary samples in the last bin');

    const hexCenter = await polygonPoint('release-hex-svg', 0);
    await page.mouse.move(hexCenter.x, hexCenter.y);
    await page.waitForFunction(() => document.querySelector('[data-testid="consumer-hex-tooltip"]')?.textContent === 'Mean 5; count=3');
    assert.equal(await page.locator('[data-testid="consumer-hex-tooltip"]').getAttribute('data-mean'), 'true');
    checks.push('Installed hexbin exposes the original mean and count from the actual six-vertex cell');

    await page.locator('#release-violin-svg').scrollIntoViewIfNeeded();
    const densityPoint = await page.locator('#release-violin-svg polygon').evaluate(polygon => {
      const count = polygon.points.numberOfItems / 2;
      const high = polygon.points.getItem(3), low = polygon.points.getItem(2 * count - 1 - 3);
      const p = new DOMPoint(low.x + (high.x - low.x) * 0.95, high.y)
        .matrixTransform(polygon.ownerSVGElement.getScreenCTM());
      return { x: p.x, y: p.y };
    });
    await page.mouse.move(densityPoint.x, densityPoint.y);
    await page.waitForFunction(() => document.querySelector('[data-testid="consumer-violin-tooltip"]')?.textContent === 'KDE 5; mean=4; median=4; range=2..6');
    checks.push('Installed violin body reports a KDE sample coordinate and the original distribution summary');

    async function violinSummaryPoint(index) {
      return page.locator('#release-violin-svg line[stroke="#5c3b9c"]').nth(index).evaluate(line => {
        const x0 = Number(line.getAttribute('x1')), x1 = Number(line.getAttribute('x2'));
        const y0 = Number(line.getAttribute('y1')), y1 = Number(line.getAttribute('y2'));
        const p = new DOMPoint(x0 + (x1 - x0) * 0.85, y0 + (y1 - y0) * 0.85)
          .matrixTransform(line.ownerSVGElement.getScreenCTM());
        return { x: p.x, y: p.y };
      });
    }
    const median = await violinSummaryPoint(1);
    await page.mouse.move(median.x, median.y);
    await page.waitForFunction(() => document.querySelector('[data-testid="consumer-violin-tooltip"]')?.textContent === 'Median 4');
    checks.push('Installed coincident mean and median retain the later median part above the filled violin');
    const quantile = await violinSummaryPoint(5);
    await page.mouse.move(quantile.x, quantile.y);
    await page.waitForFunction(() => document.querySelector('[data-testid="consumer-violin-tooltip"]')?.textContent === 'Quantile 0: 3');
    checks.push('Installed violin quantile preserves its source index and exact value through the public callback');

    async function stepEdge(index) {
      await page.locator('#release-step-svg').scrollIntoViewIfNeeded();
      return page.locator('#release-step-svg polyline').first().evaluate((line, index) => {
        const a = line.points.getItem(index), b = line.points.getItem(index + 1);
        const p = new DOMPoint((a.x + b.x) / 2, (a.y + b.y) / 2)
          .matrixTransform(line.ownerSVGElement.getScreenCTM());
        return { x: p.x, y: p.y };
      }, index);
    }
    const plateau = await stepEdge(0);
    await page.mouse.move(plateau.x, plateau.y);
    await page.waitForFunction(() => document.querySelector('[data-testid="consumer-step-tooltip"]')?.textContent === 'Step 0: 3; range=0..2');
    assert.equal(await page.locator('[data-testid="consumer-step-tooltip"]').getAttribute('data-step'), 'true');
    assert.equal(await page.locator('[data-testid="consumer-step-tooltip"]').getAttribute('data-source-x'), '0');
    checks.push('Installed step plateau exposes the original sample and interval without a synthetic corner index');
    const riser = await stepEdge(1);
    await page.mouse.move(riser.x, riser.y);
    await page.waitForFunction(() => document.querySelector('[data-testid="consumer-step-tooltip"]')?.textContent === 'Step 1: 7; range=2..5');
    assert.equal(await page.locator('[data-testid="consumer-step-tooltip"]').getAttribute('data-source-x'), '2');
    assert.equal(await page.locator('[data-testid="consumer-step-tooltip"]').getAttribute('data-source-y'), '7');
    checks.push('Installed step jump selects the incoming real sample instead of interpolating a new observation');

    async function stairsInterior(index) {
      await page.locator('#release-stairs-svg').scrollIntoViewIfNeeded();
      return page.locator('#release-stairs-svg polygon').evaluate((polygon, index) => {
        const points = [...polygon.points];
        const [a, b, c] = index === 0 ? [points[0], points[1], points[2]] : [points[3], points[4], points[5]];
        const p = new DOMPoint(index === 0 ? (a.x + b.x) / 2 : (a.x + c.x) / 2,
          index === 0 ? (a.y + c.y) / 2 : (a.y + b.y) / 2)
          .matrixTransform(polygon.ownerSVGElement.getScreenCTM());
        return { x: p.x, y: p.y };
      }, index);
    }
    const positiveStair = await stairsInterior(0);
    await page.mouse.move(positiveStair.x, positiveStair.y);
    await page.waitForFunction(() => document.querySelector('[data-testid="consumer-stairs-tooltip"]')?.textContent === 'Stairs 0: 4; range=0..1; baseline=1');
    assert.equal(await page.locator('[data-testid="consumer-stairs-tooltip"]').getAttribute('data-stairs'), 'true');
    assert.equal(await page.locator('[data-testid="consumer-stairs-tooltip"]').getAttribute('data-horizontal'), 'true');
    checks.push('Installed horizontal filled stairs expose their original nonuniform interval and value across the actual positive strip');
    const negativeStair = await stairsInterior(1);
    await page.mouse.move(negativeStair.x, negativeStair.y);
    await page.waitForFunction(() => document.querySelector('[data-testid="consumer-stairs-tooltip"]')?.textContent === 'Stairs 1: -2; range=1..4; baseline=1');
    checks.push('Installed negative stairs retain the original value and baseline rather than reporting rectangle height');


    async function ecdfEdge(index) {
      await page.locator('#release-ecdf-svg').scrollIntoViewIfNeeded();
      return page.locator('#release-ecdf-svg polyline').first().evaluate((line, index) => {
        const a = line.points.getItem(index), b = line.points.getItem(index + 1);
        const p = new DOMPoint((a.x + b.x) / 2, (a.y + b.y) / 2)
          .matrixTransform(line.ownerSVGElement.getScreenCTM());
        return { x: p.x, y: p.y };
      }, index);
    }
    const probabilityJump = await ecdfEdge(0);
    await page.mouse.move(probabilityJump.x, probabilityJump.y);
    await page.waitForFunction(() => document.querySelector('[data-testid="consumer-ecdf-tooltip"]')?.textContent === 'ECDF 0: 1; probability=0.625; jump=1..0.625');
    assert.equal(await page.locator('[data-testid="consumer-ecdf-tooltip"]').getAttribute('data-ecdf'), 'true');
    assert.equal(await page.locator('[data-testid="consumer-ecdf-tooltip"]').getAttribute('data-source-x'), '0.625');
    assert.equal(await page.locator('[data-testid="consumer-ecdf-tooltip"]').getAttribute('data-source-y'), '1');
    const probabilityPlateau = await ecdfEdge(1);
    await page.mouse.move(probabilityPlateau.x, probabilityPlateau.y);
    await page.waitForFunction(() => document.querySelector('[data-testid="consumer-ecdf-tooltip"]')?.textContent === 'ECDF 0: 1; probability=0.625; jump=1..0.625');
    checks.push('Installed compressed weighted complementary ECDF retains the exact returned value/probability on both the jump and outgoing plateau');
    const nextProbabilityJump = await ecdfEdge(2);
    await page.mouse.move(nextProbabilityJump.x, nextProbabilityJump.y);
    await page.waitForFunction(() => document.querySelector('[data-testid="consumer-ecdf-tooltip"]')?.textContent === 'ECDF 1: 3; probability=0.25; jump=0.625..0.25');
    checks.push('Installed ECDF point indices follow returned compressed slots while directed before/after probabilities remain intact');

    async function stemRod(index) {
      await page.locator('#release-stem-svg').scrollIntoViewIfNeeded();
      return page.locator('#release-stem-svg polyline').nth(index).evaluate(line => {
        const points = line.getAttribute('points').trim().split(/\s+/).map(pair => pair.split(',').map(Number));
        const p = new DOMPoint((points[0][0] + points[1][0]) / 2,
          (points[0][1] + points[1][1]) / 2).matrixTransform(line.getScreenCTM());
        return { x: p.x, y: p.y };
      });
    }
    const positiveStem = await stemRod(0);
    await page.mouse.move(positiveStem.x, positiveStem.y);
    await page.waitForFunction(() => document.querySelector('[data-testid="consumer-stem-tooltip"]')?.textContent === 'Stem 0: 5; baseline=1; horizontal=true');
    assert.equal(await page.locator('[data-testid="consumer-stem-tooltip"]').getAttribute('data-stem'), 'true');
    assert.equal(await page.locator('[data-testid="consumer-stem-tooltip"]').getAttribute('data-source-x'), '5');
    assert.equal(await page.locator('[data-testid="consumer-stem-tooltip"]').getAttribute('data-source-y'), '1');
    const stemHead = await page.locator('#release-stem-svg circle').first().evaluate(circle => {
      const p = new DOMPoint(Number(circle.getAttribute('cx')), Number(circle.getAttribute('cy')))
        .matrixTransform(circle.getScreenCTM());
      return { x: p.x, y: p.y };
    });
    await page.mouse.move(stemHead.x, stemHead.y);
    await page.waitForFunction(() => document.querySelector('[data-testid="consumer-stem-tooltip"]')?.textContent === 'Stem 0: 5; baseline=1; horizontal=true');
    checks.push('Installed horizontal stem rod interiors and actual heads retain the original head value, location and nonzero baseline');
    const negativeStem = await stemRod(1);
    await page.mouse.move(negativeStem.x, negativeStem.y);
    await page.waitForFunction(() => document.querySelector('[data-testid="consumer-stem-tooltip"]')?.textContent === 'Stem 1: -2; baseline=1; horizontal=true');
    assert.equal(await page.locator('[data-testid="consumer-stem-tooltip"]').getAttribute('data-source-x'), '-2');
    assert.equal(await page.locator('[data-testid="consumer-stem-tooltip"]').getAttribute('data-source-y'), '3');
    checks.push('Installed negative stems return the original sample index and signed head instead of a rod endpoint index or height');

    async function vectorPart(index) {
      await page.locator('#release-vector-svg').scrollIntoViewIfNeeded();
      return page.locator('#release-vector-svg').evaluate((svg, index) => {
        const lines = [...svg.querySelectorAll('line[stroke="#0f766e"]')];
        if (lines.length !== 6) throw new Error(`Expected six actual strokes, saw ${lines.length}`);
        const segments = lines.map(line => {
          const a = new DOMPoint(Number(line.getAttribute('x1')), Number(line.getAttribute('y1'))).matrixTransform(line.getScreenCTM());
          const b = new DOMPoint(Number(line.getAttribute('x2')), Number(line.getAttribute('y2'))).matrixTransform(line.getScreenCTM());
          return [a.x, a.y, b.x, b.y];
        });
        const distance = (x, y, s) => {
          const dx = s[2] - s[0], dy = s[3] - s[1];
          const t = Math.max(0, Math.min(1, ((x - s[0]) * dx + (y - s[1]) * dy) / (dx * dx + dy * dy)));
          return Math.hypot(x - s[0] - t * dx, y - s[1] - t * dy);
        };
        const chosen = segments[index];
        const candidates = [];
        for (let x = Math.floor(Math.min(chosen[0], chosen[2])); x <= Math.ceil(Math.max(chosen[0], chosen[2])); x++) {
          for (let y = Math.floor(Math.min(chosen[1], chosen[3])); y <= Math.ceil(Math.max(chosen[1], chosen[3])); y++) {
            const own = distance(x, y, chosen);
            const others = Math.min(...segments.filter((_, i) => i !== index).map(s => distance(x, y, s)));
            if (x > 0 && x < innerWidth && y > 0 && y < innerHeight && own < 0.85 && others > 1.2)
              candidates.push({ x, y, ownDistance: own, otherDistance: others, index });
          }
        }
        candidates.sort((a, b) => a.ownDistance - b.ownDistance || b.otherDistance - a.otherDistance);
        if (!candidates.length) throw new Error(`No integer event isolates actual vector part ${index}`);
        svg.addEventListener('mousemove', event => {
          window.__releaseVectorEvent = { clientX: event.clientX, clientY: event.clientY };
        }, { once: true });
        return candidates[0];
      }, index);
    }
    async function checkVectorPart(index, expectedText, expectedX, expectedY, expectedV) {
      await page.mouse.move(5, 5);
      await page.waitForFunction(() => !document.querySelector('[data-testid="consumer-vector-tooltip"]'));
      const p = await vectorPart(index);
      await page.mouse.move(p.x, p.y);
      await page.waitForFunction(expected => document.querySelector('[data-testid="consumer-vector-tooltip"]')?.textContent === expected, expectedText);
      const actualEvent = await page.evaluate(() => window.__releaseVectorEvent);
      assert.deepEqual(actualEvent, { clientX: p.x, clientY: p.y });
      const tip = page.locator('[data-testid="consumer-vector-tooltip"]');
      assert.equal(await tip.getAttribute('data-quiver'), 'true');
      assert.equal(await tip.getAttribute('data-source-x'), String(expectedX));
      assert.equal(await tip.getAttribute('data-source-y'), String(expectedY));
      assert.equal(await tip.getAttribute('data-value'), String(expectedV));
      vectorEvents.push({ ...p, actualEvent, expectedText });
    }
    await checkVectorPart(0, 'Vector 0: U=3; V=3', 1, 1, 3);
    checks.push('Installed quiver shaft exposes original X/Y/U/V after update through a public custom tooltip');
    await checkVectorPart(1, 'Vector 0: U=3; V=3', 1, 1, 3);
    await checkVectorPart(2, 'Vector 0: U=3; V=3', 1, 1, 3);
    checks.push('Each installed arrow wing independently triggers from its actual stroke at a verified integer MouseEvent');
    await checkVectorPart(3, 'Vector 2: U=-2; V=-4', 6, 6, -4);
    checks.push('Installed negative quiver components retain the original input index after a zero-vector gap and value means V');

    async function barbPrimitive(id, kind, index) {
      await page.locator(`#${id}`).scrollIntoViewIfNeeded();
      return page.locator(`#${id}`).evaluate((svg, { kind, index }) => {
        const screen = (node, x, y) => {
          const p = new DOMPoint(x, y).matrixTransform(node.getScreenCTM());
          return { x: p.x, y: p.y };
        };
        const distance = (p, a, b) => {
          const dx = b.x - a.x, dy = b.y - a.y;
          const t = Math.max(0, Math.min(1, ((p.x-a.x)*dx+(p.y-a.y)*dy)/(dx*dx+dy*dy)));
          return Math.hypot(p.x-a.x-t*dx, p.y-a.y-t*dy);
        };
        const lines = [...svg.querySelectorAll('polyline[stroke="#9a6c3d"]')]
          .map(node => [...node.points].map(p => screen(node, p.x, p.y)));
        let points, circle, actual;
        if (kind === 'line') {
          points = lines[index];
          if (!points || points.length !== 2) throw Error('Missing actual barb segment');
          actual = { points };
        } else if (kind === 'flag') {
          const node = svg.querySelectorAll('polygon[fill="#5d7485"]')[index];
          if (!node) throw Error('Missing actual filled flag');
          points = [...node.points].map(p => screen(node, p.x, p.y));
          if (points.length !== 3 || Number(node.getAttribute('stroke-width')) !== 0)
            throw Error('Expected actual triangular flag with zero stroke width');
          actual = { points, strokeWidth: 0 };
        } else {
          const node = svg.querySelectorAll('circle[fill="#5d7485"]')[index];
          if (!node) throw Error('Missing actual calm disk');
          const cx=Number(node.getAttribute('cx')), cy=Number(node.getAttribute('cy')), r=Number(node.getAttribute('r'));
          const center=screen(node,cx,cy), edge=screen(node,cx+r,cy);
          circle={ center, radius:Math.hypot(edge.x-center.x,edge.y-center.y), local:{cx,cy,r} };
          actual={circle};
          points=[{x:center.x-circle.radius,y:center.y-circle.radius},{x:center.x+circle.radius,y:center.y+circle.radius}];
        }
        const minX=Math.floor(Math.min(...points.map(p=>p.x))), maxX=Math.ceil(Math.max(...points.map(p=>p.x)));
        const minY=Math.floor(Math.min(...points.map(p=>p.y))), maxY=Math.ceil(Math.max(...points.map(p=>p.y)));
        const candidates=[];
        for(let x=minX;x<=maxX;x++) for(let y=minY;y<=maxY;y++) {
          if(x<=0||x>=innerWidth||y<=0||y>=innerHeight) continue;
          const p={x,y};
          if(kind==='line') {
            const own=distance(p,...points), others=Math.min(...lines.filter((_,i)=>i!==index).map(s=>distance(p,...s)));
            if(own<.8&&others>1.2) candidates.push({x,y,ownDistance:own,otherDistance:others,rank:-own});
          } else if(kind==='flag') {
            const crosses=points.map((a,i)=>{const b=points[(i+1)%3];return(b.x-a.x)*(y-a.y)-(b.y-a.y)*(x-a.x);});
            const clearance=Math.min(...points.map((a,i)=>distance(p,a,points[(i+1)%3])));
            if((crosses.every(v=>v>0)||crosses.every(v=>v<0))&&clearance>1.2)
              candidates.push({x,y,edgeClearance:clearance,rank:clearance});
          } else {
            const d=Math.hypot(x-circle.center.x,y-circle.center.y);
            if(d>1.2&&d<circle.radius*.9) candidates.push({x,y,distanceFromCenter:d,rank:d});
          }
        }
        candidates.sort((a,b)=>b.rank-a.rank);
        if(!candidates.length) throw Error(`No integer MouseEvent isolates actual ${kind} ${index}`);
        svg.addEventListener('mousemove',event=>{
          window.__releaseBarbEvent={clientX:event.clientX,clientY:event.clientY};
        },{once:true});
        return {...candidates[0],actual};
      },{kind,index});
    }
    async function checkBarb(id, kind, index, expected) {
      await page.mouse.move(5,5);
      const p=await barbPrimitive(id,kind,index);
      await page.mouse.move(p.x,p.y);
      const testid=id==='release-barbs-svg'?'consumer-barbs-tooltip':'consumer-barb-symbols-tooltip';
      await page.waitForFunction(({testid,text})=>document.querySelector(`[data-testid="${testid}"]`)?.textContent===text,{testid,text:expected.text});
      const actualEvent=await page.evaluate(()=>window.__releaseBarbEvent);
      assert.deepEqual(actualEvent,{clientX:p.x,clientY:p.y});
      const tip=page.locator(`[data-testid="${testid}"]`);
      assert.equal(await tip.getAttribute('data-barbs'),'true');
      for(const [key,value] of Object.entries(expected.attrs)) assert.equal(await tip.getAttribute(`data-${key}`),String(value));
      barbEvents.push({id,kind,index,...p,actualEvent,expected});
    }
    for(const index of [0,1,2,3]) await checkBarb('release-barbs-svg','line',index,{
      text:'Wind 0: U=3; V=3',attrs:{'source-x':1,'source-y':1,value:3,artist:index}
    });
    checks.push('Installed basic barbs expose the original updated U/V on the real shaft and all three feathers with distinct artist identities');
    await checkBarb('release-barbs-svg','line',4,{
      text:'Wind 2: U=-2; V=-4',attrs:{'source-x':6,'source-y':6,value:-4,artist:4}
    });
    checks.push('Installed negative wind barbs preserve their original index after an omitted zero vector');
    await checkBarb('release-barb-symbols-svg','flag',0,{
      text:'Wind symbols 0: U=6.5; V=0',attrs:{'source-x':5,'source-y':3,value:0,artist:1}
    });
    checks.push('Installed zero-width flag fill returns original pivot-before input/U/V well inside the actual triangular face');
    await checkBarb('release-barb-symbols-svg','circle',0,{
      text:'Wind symbols 2: U=0.1; V=0.2',attrs:{'source-x':10,'source-y':2,value:.2,artist:8}
    });
    await checkBarb('release-barb-symbols-svg','circle',1,{
      text:'Wind symbols 3: U=0; V=0',attrs:{'source-x':3,'source-y':11,value:0,artist:9}
    });
    checks.push('Installed full calm disks select beyond point proximity and retain nonzero rounded components and exact-zero input independently');

    async function contourStroke(id, polyline) {
      await page.mouse.move(5, 5);
      await page.locator(`#${id}`).scrollIntoViewIfNeeded();
      return page.locator(`#${id}`).evaluate((svg, polyline) => {
        const matrix = svg.getScreenCTM(), box = svg.getBoundingClientRect();
        const segments = [...svg.querySelectorAll('polyline')].flatMap((line, path) => {
          const values = line.getAttribute('points').trim().split(/[\s,]+/).map(Number);
          const points = [];
          for (let i = 0; i < values.length; i += 2)
            points.push(new DOMPoint(values[i], values[i + 1]).matrixTransform(matrix));
          return points.slice(1).map((b, i) => ({ path, edge: i, a: points[i], b }));
        });
        const distance = (x, y, { a, b }) => {
          const dx = b.x - a.x, dy = b.y - a.y;
          const t = Math.max(0, Math.min(1, ((x - a.x) * dx + (y - a.y) * dy) / (dx * dx + dy * dy)));
          return Math.hypot(x - a.x - t * dx, y - a.y - t * dy);
        };
        const candidates = [];
        for (const segment of segments.filter(s => s.path === polyline)) {
          for (let step = 1; step < 100; step++) {
            const t = step / 100;
            const x = Math.round(segment.a.x + t * (segment.b.x - segment.a.x));
            const y = Math.round(segment.a.y + t * (segment.b.y - segment.a.y));
            if (x <= box.left + 2 || x >= box.right - 2 || y <= box.top + 2 || y >= box.bottom - 2 ||
                x < 0 || x >= innerWidth || y < 0 || y >= innerHeight) continue;
            const ownDistance = distance(x, y, segment);
            const otherDistance = Math.min(...segments.filter(s => s.path !== polyline).map(s => distance(x, y, s)));
            if (ownDistance < 1.0 && otherDistance > 2.5)
              candidates.push({ x, y, ownDistance, otherDistance: Number.isFinite(otherDistance) ? otherDistance : null,
                polyline, edge: segment.edge });
          }
        }
        candidates.sort((a, b) => a.ownDistance - b.ownDistance);
        if (!candidates.length) throw Error(`No integer contour event for polyline ${polyline}`);
        svg.addEventListener('mousemove', event => {
          window.__releaseContourEvent = { clientX: event.clientX, clientY: event.clientY };
        }, { once: true });
        return candidates[0];
      }, polyline);
    }
    async function moveContour(id, polyline) {
      const position = await contourStroke(id, polyline);
      await page.mouse.move(position.x, position.y);
      await page.waitForSelector(`[data-testid="${id.replace(/-svg$/, '')}-tooltip"]`);
      const actualEvent = await page.evaluate(() => window.__releaseContourEvent);
      assert.deepEqual(actualEvent, { clientX: position.x, clientY: position.y });
      contourEvents.push({ id, ...position, actualEvent });
    }
    for (const fragment of [0, 1]) {
      await moveContour('release-contours-svg', fragment);
      const tip = page.locator('[data-testid="release-contours-tooltip"]');
      assert.equal(await tip.getAttribute('data-moonplot-kind'), 'contour');
      assert.equal(await tip.locator('.moonplot-tooltip-series').textContent(), 'Field');
      assert.equal(await tip.locator('.moonplot-coordinate-label').textContent(), 'Level');
      assert.equal(await tip.locator('.moonplot-coordinate b').textContent(), '1.5');
    }
    checks.push('Installed regular contours retain the exact updated level and default Level tooltip on both real inline fragments');
    await moveContour('release-tricontours-svg', 0);
    const contourTip = page.locator('[data-testid="consumer-contour-tooltip"]');
    assert.equal(await contourTip.textContent(), 'Mesh: Level 2');
    for (const [key, value] of Object.entries({ contour: true, path: 0, 'midpoint-x': 0.5, 'midpoint-y': 0.5 }))
      assert.equal(await contourTip.getAttribute(`data-${key}`), String(value));
    checks.push('Installed triangular contour clips the actual stroke while preserving its generated preclip midpoint and exact level');
    const blankContour = await page.locator('#release-tricontours-svg').evaluate(svg => {
      const p = new DOMPoint(300, 270).matrixTransform(svg.getScreenCTM());
      return { x: Math.round(p.x), y: Math.round(p.y) };
    });
    await page.mouse.move(blankContour.x, blankContour.y);
    await page.waitForFunction(() => !document.querySelector('[data-testid="consumer-contour-tooltip"]'));
    checks.push('Installed XNearest contour does not select an empty panel position away from the visible stroke');

    async function filledSample(id, request) {
      await page.mouse.move(5, 5);
      await page.locator(`#${id}`).scrollIntoViewIfNeeded();
      return page.locator(`#${id}`).evaluate((svg, { id, request }) => {
        const nodes = [...svg.querySelectorAll('polygon,path')];
        const inverse = svg.getScreenCTM().inverse(), matrix = svg.getScreenCTM();
        const rect = svg.getBoundingClientRect();
        const regionBox = nodes[0].getBBox();
        const regionMidX = regionBox.x + regionBox.width / 2;
        const state = document.querySelector('#filled-contour-consumer');
        const prefix = id.includes('trifilled') ? 'tri' : 'regular';
        const bounds = ['Left','Top','Width','Height'].map(key => Number(state.dataset[prefix + key]));
        if (!bounds.every(Number.isFinite)) throw Error('Missing actual public Drawing plot bounds');
        const classify = (x, y) => {
          const p = new DOMPoint(x, y).matrixTransform(inverse);
          const nativeFill = nodes.map(node => node.isPointInFill(p));
          const top = nativeFill.lastIndexOf(true);
          const inPlot = p.x >= bounds[0] && p.y >= bounds[1] &&
            p.x <= bounds[0] + bounds[2] && p.y <= bounds[1] + bounds[3];
          return { x, y, svgX:p.x, svgY:p.y, nativeFill, top, inPlot };
        };
        let selected;
        if (request.negative) {
          // Use actual emitted subpath vertices only to propose hole/gap points;
          // the real whole element's native fill predicate remains the oracle.
          const tokens = nodes[0].getAttribute('d').match(/[MLZ]|[-+]?(?:\d*\.\d+|\d+)(?:[eE][-+]?\d+)?/g);
          const rings = []; let ring = [];
          for (let i=0; i<tokens.length;) {
            const command=tokens[i++];
            if (command==='Z') { rings.push(ring); ring=[]; }
            else if (command==='M' || command==='L') ring.push([Number(tokens[i++]),Number(tokens[i++])]);
            else throw Error('Unexpected emitted filled-contour path command');
          }
          const boxes = rings.map(points => [Math.min(...points.map(p=>p[0])),Math.min(...points.map(p=>p[1])),
            Math.max(...points.map(p=>p[0])),Math.max(...points.map(p=>p[1]))]);
          const centers = [...new Map(boxes.map(box => {
            const p=new DOMPoint((box[0]+box[2])/2,(box[1]+box[3])/2).matrixTransform(matrix);
            const value=classify(Math.round(p.x),Math.round(p.y));
            return [`${value.x},${value.y}`,value];
          })).values()].sort((a,b)=>a.x-b.x);
          if (centers.length!==2) throw Error('Expected two actual annulus centers');
          if (request.negative==='gap') {
            selected=classify(Math.round((centers[0].x+centers[1].x)/2),Math.round((centers[0].y+centers[1].y)/2));
          } else selected=centers[request.negative==='left-hole'?0:1];
          if (selected.top!==-1 || !selected.inPlot) throw Error('Actual whole Path does not prove a blank hole/gap');
        } else {
          const wanted = candidate => candidate.top===request.artist &&
            candidate.inPlot!==Boolean(request.margin) &&
            (!request.side || (request.side==='left' ? candidate.svgX < regionMidX : candidate.svgX > regionMidX));
          outer: for(let y=Math.max(1,Math.ceil(rect.top)+2);y<Math.min(innerHeight-1,rect.bottom-2);y+=3) {
            for(let x=Math.max(1,Math.ceil(rect.left)+2);x<Math.min(innerWidth-1,rect.right-2);x+=3) {
              const candidate=classify(x,y);
              if (wanted(candidate) && [[-1,0],[1,0],[0,-1],[0,1]].every(([dx,dy])=>wanted(classify(x+dx,y+dy)))) {
                selected=candidate; break outer;
              }
            }
          }
          if (!selected) throw Error('No stable integer event matches the actual filled DOM and plot rule');
        }
        svg.addEventListener('mousemove',event=>{
          window.__releaseFilledEvent={clientX:event.clientX,clientY:event.clientY};
        },{once:true});
        return { ...selected, id, request, bounds };
      }, { id, request });
    }
    async function moveFilled(id, request) {
      const sample=await filledSample(id,request);
      await page.mouse.move(sample.x,sample.y);
      const actualEvent=await page.evaluate(()=>window.__releaseFilledEvent);
      assert.deepEqual(actualEvent,{clientX:sample.x,clientY:sample.y});
      filledEvents.push({...sample,actualEvent});
      return sample;
    }
    for (const [artist, band, range, representative] of [[0,1,'0.5 – 1.5','1'],[1,2,'1.5 – 2.5','2'],[2,3,'2.5 – 3.5','3']]) {
      const sample=await moveFilled('release-filled-contours-svg',{artist});
      await page.waitForFunction(band=>document.querySelector('#filled-contour-consumer')?.dataset.band===String(band),band);
      const tip=page.locator('[data-testid="release-filled-contours-tooltip"]');
      await tip.waitFor();
      assert.equal(await tip.getAttribute('data-moonplot-kind'),'contourf');
      assert.equal(await tip.locator('.moonplot-tooltip-series').textContent(),'Regular bands');
      assert.deepEqual(await tip.locator('.moonplot-coordinate-label').allTextContents(),['Range','Representative']);
      assert.deepEqual(await tip.locator('.moonplot-coordinate b').allTextContents(),[range,representative]);
      if (artist===0) assert.deepEqual(sample.nativeFill,[true,false,false]);
    }
    checks.push('Installed filled contours expose exact finite intervals, representatives and original noncompressed band slots; a real hole reveals the earlier band');
    for (const side of ['left','right']) {
      await moveFilled('release-trifilled-contours-svg',{artist:0,side});
      await page.waitForFunction(()=>document.querySelector('[data-testid="consumer-filled-contour-tooltip"]')?.textContent==='填色区间 1.5..2.5；代表值 2');
      const tip=page.locator('[data-testid="consumer-filled-contour-tooltip"]');
      assert.equal(await tip.getAttribute('data-contourf'),'true');
      assert.equal(await tip.getAttribute('data-band'),'0');
    }
    checks.push('Installed triangulation wrapper exposes one whole evenodd region and one band across both disconnected painted islands');
    for (const negative of ['left-hole','right-hole','gap']) {
      await moveFilled('release-trifilled-contours-svg',{negative});
      await page.waitForFunction(()=>!document.querySelector('[data-testid="consumer-filled-contour-tooltip"]'));
    }
    checks.push('Installed XNearest filled contours keep both native whole-Path holes and the between-island bbox gap unselectable');
    const margin=await moveFilled('release-filled-contours-svg',{artist:2,margin:true});
    assert.equal(margin.inPlot,false); assert.equal(margin.top,2);
    await page.waitForFunction(()=>document.querySelector('#filled-contour-consumer')?.dataset.band==='-1');
    assert.equal(await page.locator('[data-testid="release-filled-contours-tooltip"]').count(),0);
    checks.push('Installed legacy margin paint remains visible in native SVG geometry and outside the interactive plot without fabricated clipping');

    async function moveTripcolor(id, request) {
      await page.mouse.move(5, 5);
      await page.locator(`#${id}`).scrollIntoViewIfNeeded();
      const sample = await page.locator(`#${id}`).evaluate((svg, { id, request }) => {
        const nodes = [...svg.querySelectorAll('polygon')];
        const mean = id.includes('-mean-');
        const slots = mean ? [0, 1, 2, 3] : [0, 2, 3];
        if (nodes.length !== slots.length) throw Error('Unexpected actual tripcolor face count');
        const matrix = svg.getScreenCTM(), inverse = matrix.inverse();
        const nodeInverses = nodes.map(node => node.getScreenCTM().inverse());
        const rect = svg.getBoundingClientRect();
        const state = document.querySelector('#tripcolor-consumer');
        const prefix = mean ? 'mean' : 'face';
        const bounds = ['Left', 'Top', 'Width', 'Height'].map(key => Number(state.dataset[prefix + key]));
        if (!bounds.every(Number.isFinite)) throw Error('Missing actual tripcolor plot bounds');
        const firstBox = nodes[0].getBBox();
        const classify = (x, y) => {
          const p = new DOMPoint(x, y).matrixTransform(inverse);
          const nativeFill = nodes.map((node, i) =>
            node.isPointInFill(new DOMPoint(x, y).matrixTransform(nodeInverses[i])));
          const top = nativeFill.lastIndexOf(true);
          return { x, y, svgX: p.x, svgY: p.y, nativeFill, top,
            face: top < 0 ? -1 : slots[top],
            inPlot: p.x >= bounds[0] && p.y >= bounds[1] &&
              p.x <= bounds[0] + bounds[2] && p.y <= bounds[1] + bounds[3] };
        };
        const wanted = p => p.inPlot && (request.negative ? p.top === -1 : p.face === request.face) &&
          (!request.bboxCorner || (!p.nativeFill[0] && p.svgX > firstBox.x &&
            p.svgX < firstBox.x + firstBox.width && p.svgY > firstBox.y &&
            p.svgY < firstBox.y + firstBox.height));
        const stable = p => wanted(p) && [[-1, 0], [1, 0], [0, -1], [0, 1]]
          .every(([dx, dy]) => wanted(classify(p.x + dx, p.y + dy)));
        let selected;
        if (request.negative) {
          let proposal;
          if (request.negative === 'mask') {
            // Actual retained triangles provide the missing face's three vertices.
            // Their average only proposes an event; the real complete polygons
            // and native fill predicates must prove a stable blank position.
            const vertices = [[0, 1], [1, 0], [0, 2]].map(([node, point]) => {
              const p = nodes[node].points.getItem(point);
              return new DOMPoint(p.x, p.y).matrixTransform(nodes[node].getScreenCTM());
            });
            proposal = { x: Math.round(vertices.reduce((s, p) => s + p.x, 0) / 3),
              y: Math.round(vertices.reduce((s, p) => s + p.y, 0) / 3) };
          } else {
            const p = new DOMPoint(bounds[0] + 3, bounds[1] + 3).matrixTransform(matrix);
            proposal = { x: Math.round(p.x), y: Math.round(p.y) };
          }
          selected = classify(proposal.x, proposal.y);
          if (!stable(selected)) throw Error('Actual polygons do not prove the requested blank position');
        } else {
          outer: for (let y = Math.max(1, Math.ceil(rect.top) + 2); y < Math.min(innerHeight - 1, rect.bottom - 2); y += 3) {
            for (let x = Math.max(1, Math.ceil(rect.left) + 2); x < Math.min(innerWidth - 1, rect.right - 2); x += 3) {
              const p = classify(x, y);
              if (stable(p)) { selected = p; break outer; }
            }
          }
          if (!selected) throw Error('No stable integer event matches the actual tripcolor polygons');
        }
        window.__releaseTripcolorEvent = null;
        svg.addEventListener('mousemove', event => {
          window.__releaseTripcolorEvent = { clientX: event.clientX, clientY: event.clientY };
        }, { once: true });
        return { ...selected, id, request, bounds };
      }, { id, request });
      await page.mouse.move(sample.x, sample.y);
      const actualEvent = await page.evaluate(() => window.__releaseTripcolorEvent);
      assert.deepEqual(actualEvent, { clientX: sample.x, clientY: sample.y });
      tripcolorEvents.push({ ...sample, actualEvent });
      return sample;
    }
    for (const [face, value, vertices] of [[0, 15, '0,1,4'], [2, 35, '2,3,4'], [3, 45, '3,0,4']]) {
      await moveTripcolor('release-tripcolor-svg', { face });
      await page.waitForFunction(face => document.querySelector('#tripcolor-consumer')?.dataset.face === String(face), face);
      const tip = page.locator('[data-testid="release-tripcolor-tooltip"]');
      await tip.waitFor();
      assert.equal(await tip.getAttribute('data-moonplot-kind'), 'tripcolor');
      assert.equal(await tip.locator('.moonplot-tooltip-series').textContent(), 'Face scalars');
      assert.deepEqual(await tip.locator('.moonplot-coordinate-label').allTextContents(), ['Value']);
      assert.deepEqual(await tip.locator('.moonplot-coordinate b').allTextContents(), [String(value)]);
      const typed = await page.locator('#tripcolor-consumer').evaluate(node => ({
        vertices: node.dataset.faceVertices, mean: node.dataset.faceVertexMean, value: node.dataset.faceValue
      }));
      assert.deepEqual(typed, { vertices, mean: 'false', value: String(value) });
    }
    checks.push('Installed tripcolor retains original masked face slots, ordered vertices and updated raw values beyond the color normalization range');
    const corner = await moveTripcolor('release-tripcolor-svg', { face: 3, bboxCorner: true });
    assert.equal(corner.nativeFill[0], false);
    await page.waitForFunction(() => document.querySelector('#tripcolor-consumer')?.dataset.face === '3');
    checks.push('Installed tripcolor selects the actual later face in an earlier triangle bounding-box corner');
    await moveTripcolor('release-tripcolor-svg', { negative: 'mask' });
    await page.waitForFunction(() => document.querySelector('#tripcolor-consumer')?.dataset.face === '-1');
    assert.equal(await page.locator('[data-testid="release-tripcolor-tooltip"]').count(), 0);
    await moveTripcolor('release-tripcolor-mean-svg', { negative: 'blank' });
    await page.waitForFunction(() => !document.querySelector('[data-testid="consumer-tripcolor-tooltip"]'));
    checks.push('Installed tripcolor preserves the real masked blank face and XNearest does not invent hits in empty plot space');
    const meanVertices = ['0,1,4', '1,2,4', '2,3,4', '3,0,4'];
    async function checkTripcolorMean(face) {
      await moveTripcolor('release-tripcolor-mean-svg', { face });
      const expected = `顶点均值 ${[8, 10, 12, 10][face]}；顶点 ${meanVertices[face]}`;
      await page.waitForFunction(expected => document.querySelector('[data-testid="consumer-tripcolor-tooltip"]')?.textContent === expected, expected);
      const tip = page.locator('[data-testid="consumer-tripcolor-tooltip"]');
      assert.equal(await tip.getAttribute('data-tripcolor'), 'true');
      assert.equal(await tip.getAttribute('data-face'), String(face));
      assert.equal(await tip.getAttribute('data-vertex-mean'), 'true');
    }
    for (const face of [0, 1, 2, 3]) await checkTripcolorMean(face);
    checks.push('Installed triangulation wrapper exposes all exact updated vertex means and ordered source triples through a Chinese custom tooltip');

    async function moveStreamplot(id, request) {
      await page.mouse.move(5, 5);
      await page.locator(`#${id}`).scrollIntoViewIfNeeded();
      const sample = await page.locator(`#${id}`).evaluate((svg, { id, request }) => {
        const styled = id.includes('-style-');
        const nodes = [...svg.querySelectorAll('polyline, polygon')];
        if (nodes.length !== (styled ? 8 : 6)) throw Error('Unexpected actual streamplot paint count');
        const matrix = svg.getScreenCTM(), inverse = matrix.inverse();
        const rect = svg.getBoundingClientRect();
        const state = document.querySelector('#streamplot-consumer');
        const prefix = styled ? 'style' : 'body';
        const bounds = ['Left', 'Top', 'Width', 'Height'].map(key => Number(state.dataset[prefix + key]));
        if (!bounds.every(Number.isFinite)) throw Error('Missing actual streamplot plot bounds');
        const bodyArtists = styled ? [0, 1, 2, 3, 4, 5] : [0, 3];
        const segments = [], arrows = [];
        nodes.forEach((node, artist) => {
          const points = [...node.points].map(p => {
            const screen = new DOMPoint(p.x, p.y).matrixTransform(node.getScreenCTM());
            return { x: screen.x, y: screen.y, svgX: p.x, svgY: p.y };
          });
          for (let edge = 0; edge + 1 < points.length; edge++) {
            const segment = { a: points[edge], b: points[edge + 1], artist,
              edge: styled ? artist : edge, seed: styled ? 1 : artist / 3 };
            (bodyArtists.includes(artist) ? segments : arrows).push(segment);
          }
        });
        if (segments.length !== (styled ? 6 : 12)) throw Error('Unexpected actual streamplot body edge count');
        const distance = (x, y, s) => {
          const dx = s.b.x - s.a.x, dy = s.b.y - s.a.y;
          const t = Math.max(0, Math.min(1, ((x - s.a.x) * dx + (y - s.a.y) * dy) / (dx * dx + dy * dy)));
          return { distance: Math.hypot(x - s.a.x - t * dx, y - s.a.y - t * dy), t };
        };
        const classify = (x, y) => {
          const p = new DOMPoint(x, y).matrixTransform(inverse);
          const closest = segments.map(s => ({ ...s, ...distance(x, y, s) }))
            .sort((a, b) => a.distance - b.distance || b.artist - a.artist || b.edge - a.edge);
          const arrowDistance = Math.min(...arrows.map(s => distance(x, y, s).distance));
          const first = closest[0];
          return { x, y, svgX: p.x, svgY: p.y, distance: first.distance,
            t: first.t, seed: first.seed, edge: first.edge, artist: first.artist,
            midpointX: ((first.a.svgX + first.b.svgX) / 2 - bounds[0]) / bounds[2] * 2,
            otherDistance: closest[1].distance, arrowDistance,
            inPlot: p.x >= bounds[0] && p.y >= bounds[1] &&
              p.x <= bounds[0] + bounds[2] && p.y <= bounds[1] + bounds[3] };
        };
        const radius = styled ? 1 : 10;
        let selected;
        if (request.negative === 'blank') {
          const p = new DOMPoint(bounds[0] + bounds[2] * .6, bounds[1] + bounds[3] * .1).matrixTransform(matrix);
          selected = classify(Math.round(p.x), Math.round(p.y));
          if (!selected.inPlot || selected.distance < radius + 5) throw Error('Actual body does not prove blank space');
        } else {
          const candidates = [];
          for (let y = Math.max(1, Math.ceil(rect.top) + 1); y < Math.min(innerHeight - 1, rect.bottom - 1); y++) {
            for (let x = Math.max(1, Math.ceil(rect.left) + 1); x < Math.min(innerWidth - 1, rect.right - 1); x++) {
              const p = classify(x, y);
              if (!p.inPlot) continue;
              if (request.negative === 'arrow') {
                if (p.arrowDistance < .65 && p.distance > radius + .75 &&
                  [[-1, 0], [1, 0], [0, -1], [0, 1]].every(([dx, dy]) => classify(x + dx, y + dy).distance > radius))
                  candidates.push(p);
              } else if (p.seed === request.seed && p.edge === request.edge &&
                p.distance < .65 && p.otherDistance > 1.2 && p.t > .12 && p.t < .32 &&
                [[-1, 0], [1, 0], [0, -1], [0, 1]].every(([dx, dy]) => {
                  const q = classify(x + dx, y + dy);
                  return q.inPlot && q.seed === p.seed && q.edge === p.edge && q.artist === p.artist;
                })) candidates.push(p);
            }
          }
          candidates.sort((a, b) => request.negative ? b.distance - a.distance :
            a.distance - b.distance || Math.abs(a.t - .2) - Math.abs(b.t - .2));
          selected = candidates[0];
          if (!selected) throw Error('No stable integer event matches actual streamplot strokes');
        }
        window.__releaseStreamplotEvent = null;
        svg.addEventListener('mousemove', event => {
          window.__releaseStreamplotEvent = { clientX: event.clientX, clientY: event.clientY };
        }, { once: true });
        return { ...selected, id, request, bounds, radius };
      }, { id, request });
      await page.mouse.move(sample.x, sample.y);
      const actualEvent = await page.evaluate(() => window.__releaseStreamplotEvent);
      assert.deepEqual(actualEvent, { clientX: sample.x, clientY: sample.y });
      streamplotEvents.push({ ...sample, actualEvent });
      return sample;
    }
    for (const [seed, edge] of [[0, 0], [0, 3], [1, 5]]) {
      const sample = await moveStreamplot('release-streamplot-svg', { seed, edge });
      await page.waitForFunction(({ seed, edge }) => {
        const d = document.querySelector('#streamplot-consumer')?.dataset;
        return d?.seed === String(seed) && d?.edge === String(edge);
      }, { seed, edge });
      const tip = page.locator('[data-testid="release-streamplot-tooltip"]');
      await tip.waitFor();
      assert.equal(await tip.getAttribute('data-moonplot-kind'), 'streamplot');
      assert.equal(await tip.locator('.moonplot-tooltip-series').textContent(), 'Flow samples');
      assert.deepEqual(await tip.locator('.moonplot-coordinate-label').allTextContents(), ['U', 'V']);
      assert.deepEqual(await tip.locator('.moonplot-coordinate b').allTextContents(), ['1.5', '0.25']);
      const typed = await page.locator('#streamplot-consumer').evaluate(node => ({
        artist: node.dataset.artist, value: node.dataset.value, color: node.dataset.colorPresent
      }));
      assert.deepEqual(typed, { artist: String(sample.artist), value: '0.25', color: 'false' });
    }
    checks.push('Installed continuous streamplot body exposes actual seed/edge/artist and updated U/V on edge interiors; default rows do not invent observational X/Y or color');
    async function checkStreamplotStyle(edge) {
      const sample = await moveStreamplot('release-streamplot-style-svg', { seed: 1, edge });
      await page.waitForFunction(edge => document.querySelector('[data-testid="consumer-streamplot-tooltip"]')?.dataset.edge === String(edge), edge);
      const tip = page.locator('[data-testid="consumer-streamplot-tooltip"]');
      assert.equal(await tip.getAttribute('data-kind'), 'true');
      assert.equal(await tip.getAttribute('data-seed'), '1');
      assert.equal(await tip.getAttribute('data-artist'), String(edge));
      assert.equal(await tip.getAttribute('data-u'), '1.5');
      assert.equal(await tip.getAttribute('data-v'), '0.25');
      assert.equal(await tip.getAttribute('data-value'), '0.25');
      const color = Number(await tip.getAttribute('data-color'));
      assert(color > 5 && Math.abs(color - (5 + sample.midpointX)) < 1e-5,
        'Raw color must match this actual original edge midpoint, without norm clamping or pointer resampling');
      assert((await tip.textContent()).startsWith('采样 U 1.5；V 0.25；颜色 '));
    }
    for (const edge of [0, 1, 2, 3, 4, 5]) await checkStreamplotStyle(edge);
    checks.push('Installed style-grid streamplot preserves rejected seed slot zero, every original edge and raw midpoint color beyond normalization through a Chinese custom tooltip');
    await moveStreamplot('release-streamplot-svg', { negative: 'blank' });
    await page.waitForFunction(() => document.querySelector('#streamplot-consumer')?.dataset.seed === '-1');
    assert.equal(await page.locator('[data-testid="release-streamplot-tooltip"]').count(), 0);
    await moveStreamplot('release-streamplot-style-svg', { negative: 'blank' });
    await page.waitForFunction(() => !document.querySelector('[data-testid="consumer-streamplot-tooltip"]'));
    checks.push('Installed streamplot requires physical stroke proximity in both modes and leaves real empty plot space unselected');
    await moveStreamplot('release-streamplot-style-svg', { negative: 'arrow' });
    await page.waitForFunction(() => !document.querySelector('[data-testid="consumer-streamplot-tooltip"]'));
    checks.push('Installed visible open arrowhead stays static away from the body instead of reviving generic generated-Y point data');

    await polar.desktop(page, checks, polarEvents, polarInitial);
    await polarBars.desktop(page, checks, polarBarEvents, polarBarsInitial);
    await page.setViewportSize({ width: 375, height: 812 });
    await page.locator('#release-chart-svg').scrollIntoViewIfNeeded();
    const mobile = await point(2);
    await page.mouse.move(mobile.x, mobile.y);
    await page.mouse.click(mobile.x, mobile.y);
    await state({ selected: true, point: 2, x: 3, y: 4, clicks: 3 });
    assert(await page.evaluate(() => document.documentElement.scrollWidth <= innerWidth));
    await moveContour('release-tricontours-svg', 0);
    assert.equal(await page.locator('[data-testid="consumer-contour-tooltip"]').textContent(), 'Mesh: Level 2');
    assert(await page.evaluate(() => document.documentElement.scrollWidth <= innerWidth));
    checks.push('375px installed contour retains a real clipped stroke hit and readable exact-level custom tooltip');
    await moveFilled('release-trifilled-contours-svg',{artist:0,side:'right'});
    await page.waitForFunction(()=>document.querySelector('[data-testid="consumer-filled-contour-tooltip"]')?.textContent==='填色区间 1.5..2.5；代表值 2');
    assert(await page.evaluate(()=>document.documentElement.scrollWidth<=innerWidth));
    checks.push('375px installed filled-region picking keeps its actual whole-Path geometry and Chinese range tooltip without overflow');
    await checkTripcolorMean(3);
    assert(await page.evaluate(() => document.documentElement.scrollWidth <= innerWidth));
    checks.push('375px installed tripcolor keeps physical polygon picking and readable Chinese vertex-mean metadata without overflow');
    await checkStreamplotStyle(3);
    assert(await page.evaluate(() => document.documentElement.scrollWidth <= innerWidth));
    checks.push('375px installed streamplot keeps physical continuous picking and readable typed Chinese field metadata');
    polarEvents.push(...await polar.mobile(page, checks));
    await polarBars.mobile(page, checks, polarBarEvents);
    await page.screenshot({ path: path.join(output, 'consumer-mobile.png'), fullPage: true });
    checks.push('375px independent consumer retains responsive hit coordinates');
    await page.setViewportSize({ width: 1100, height: 850 });
    await page.screenshot({ path: path.join(output, 'consumer.png'), fullPage: true });
    assert.deepEqual(errors, []);
    const report = { bundle: root, browser: browser.version(), checks, vectorEvents, barbEvents, contourEvents, filledEvents, tripcolorEvents, streamplotEvents, polarEvents, polarBarEvents, pageErrors: errors };
    await fs.writeFile(path.join(output, 'report.json'), JSON.stringify(report, null, 2) + '\n');
    console.log(JSON.stringify(report, null, 2));
  } catch (error) {
    if (page) await page.screenshot({ path: path.join(output, 'failure.png'), fullPage: true }).catch(() => {});
    await fs.writeFile(path.join(output, 'failure.json'), JSON.stringify({ error: String(error),
      checks, vectorEvents, barbEvents, contourEvents, filledEvents, tripcolorEvents, streamplotEvents, polarEvents, polarBarEvents, pageErrors: errors }, null, 2) + '\n');
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
