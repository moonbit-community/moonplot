// Real SVG DOM acceptance for hexbin reductions and violin density estimates.
// Build rabbita/cmd/distributions first. MOONPLOT_DISTRIBUTIONS_TARGET_DIR can
// select an isolated moon --target-dir build; PLAYWRIGHT_MODULE locates Chrome.
const assert = require('node:assert/strict');
const { createHash } = require('node:crypto');
const fs = require('node:fs/promises');
const http = require('node:http');
const path = require('node:path');
const { chromium } = require(process.env.PLAYWRIGHT_MODULE || 'playwright');
const root = path.resolve(__dirname, '..');
const target = path.resolve(process.env.MOONPLOT_DISTRIBUTIONS_TARGET_DIR || path.join(root, '_build'));
const scriptPath = '/_build/js/debug/build/rabbita/cmd/distributions/distributions.js';
const compiledScript = path.join(target, 'js/debug/build/rabbita/cmd/distributions/distributions.js');
const output = path.resolve(process.env.MOONPLOT_DISTRIBUTIONS_OUTPUT ||
  path.join(root, '.moonagent/checkpoints/M6-distributions/browser'));
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
    await page.goto(`http://127.0.0.1:${server.address().port}/rabbita/distributions.html`, { waitUntil: 'networkidle' });
    await page.waitForFunction(() => document.querySelector('#distribution-horizontal-svg') || document.querySelector('#distributions-error'));
    const failed = await page.locator('#distributions-error').count();
    assert.equal(failed, 0, failed ? await page.locator('#distributions-error').textContent() : 'All figures render');
    assert.equal(await page.locator('svg[data-moonplot-root]').count(), 4);
    const identity = await page.evaluate(() => {
      const ids = [...document.querySelectorAll('[id]')].map(node => node.id);
      return { duplicates: ids.filter((id, index) => ids.indexOf(id) !== index),
        namespaced: [...document.querySelectorAll('svg, svg *')].every(node => node.namespaceURI === 'http://www.w3.org/2000/svg') };
    });
    assert.deepEqual(identity, { duplicates: [], namespaced: true });
    checks.push('Four independent distribution charts render as actual namespaced SVG with unique IDs');

    const tooltip = chart => page.locator(`[data-testid="distribution-${chart}-tooltip"]`);
    const status = chart => page.locator(`#distribution-${chart}-status`);
    async function state(chart, expected) {
      await page.waitForFunction(({ chart, expected }) => {
        const node = document.querySelector(`#distribution-${chart}-status`);
        return node && Object.entries(expected).every(([key, value]) => node.dataset[key] === String(value));
      }, { chart, expected });
    }
    async function position(chart, query) {
      const svg = page.locator(`#distribution-${chart}-svg`);
      await svg.scrollIntoViewIfNeeded();
      return svg.evaluate((svg, { chart, query }) => {
        let x, y;
        if (query.kind === 'hex') {
          const polygon = [...svg.querySelectorAll('polygon')].filter(node => node.points.numberOfItems === 6)[query.index || 0];
          if (!polygon) throw Error('Missing actual hexagon');
          const points = Array.from({ length: 6 }, (_, index) => polygon.points.getItem(index));
          const cx = points.reduce((sum, point) => sum + point.x, 0) / 6;
          const cy = points.reduce((sum, point) => sum + point.y, 0) / 6;
          if (query.corner) {
            const box = polygon.getBBox();
            x = box.x + box.width * 0.03; y = box.y + box.height * 0.03;
          } else if (query.edge !== undefined) {
            const a = points[query.edge], b = points[(query.edge + 1) % 6];
            x = cx + ((a.x + b.x) / 2 - cx) * 0.985;
            y = cy + ((a.y + b.y) / 2 - cy) * 0.985;
          } else { x = cx; y = cy; }
        } else if (query.kind === 'body') {
          const color = chart === 'horizontal' ? '#5e91a8' : '#8a70b5';
          const polygon = svg.querySelectorAll(`polygon[fill="${color}"]`)[query.group || 0];
          if (!polygon) throw Error('Missing real violin body');
          const count = polygon.points.numberOfItems / 2;
          const high = polygon.points.getItem(query.sample);
          const low = polygon.points.getItem(count * 2 - 1 - query.sample);
          const fraction = query.opposite ? -0.6 : (query.fraction ?? 0.75);
          x = high.x + (low.x - high.x) * fraction;
          y = high.y + (low.y - high.y) * fraction;
        } else if (query.kind === 'summary') {
          const color = chart === 'horizontal' ? '#5e91a8' : '#8a70b5';
          const offsets = { mean: 0, median: 1, minimum: 2, maximum: 3, range: 4, q0: 5, q1: 6 };
          const line = svg.querySelectorAll(`line[stroke="${color}"]`)[(query.group || 0) * 7 + offsets[query.part]];
          if (!line) throw Error('Missing real violin summary line');
          const fraction = query.fraction ?? 0.85;
          x = line.x1.baseVal.value + (line.x2.baseVal.value - line.x1.baseVal.value) * fraction;
          y = line.y1.baseVal.value + (line.y2.baseVal.value - line.y1.baseVal.value) * fraction;
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
    async function sourceBin(chart) {
      const actual = await status(chart).evaluate(node => ({ ...node.dataset }));
      assert.equal(actual.count, actual.expectedCount, 'Actual bin count matches public Hexbin return');
      assert.equal(actual.value, actual.expectedValue, 'Actual raw reduction matches public Hexbin return');
      assert.equal(actual.dataX, actual.expectedX, 'Actual center X matches public Hexbin return');
      assert.equal(actual.dataY, actual.expectedY, 'Actual center Y matches public Hexbin return');
    }
    async function sourceDensity(chart, expected) {
      await state(chart, expected);
      const actual = await status(chart).evaluate(node => ({ ...node.dataset }));
      assert.equal(actual.coordinate, actual.expectedCoordinate, 'Body coordinate matches original public ViolinStats sample');
      assert.equal(actual.density, actual.expectedDensity, 'Body density matches original public ViolinStats density');
      assert.equal(actual.value, actual.coordinate, 'Body value represents estimated sample coordinate');
      assert(Number(actual.density) > 0 && Number.isFinite(Number(actual.density)));
    }
    async function observedContainment(chart, expectedValues) {
      const svg = page.locator(`#distribution-${chart}-svg`);
      await svg.scrollIntoViewIfNeeded();
      const samples = [[0.8, 1.6, 0], [1.2, 2.2, 0], [2.8, 1.6, 1], [3.1, 2, 1], [3.2, 2.2, 1]];
      const audit = await svg.evaluate((svg, samples) => {
        const spines = [...svg.querySelectorAll('line[stroke="#d8dfe5"]')];
        if (spines.length !== 2) throw Error('Expected actual left/bottom axis spines');
        const xs = spines.flatMap(line => [line.x1.baseVal.value, line.x2.baseVal.value]);
        const ys = spines.flatMap(line => [line.y1.baseVal.value, line.y2.baseVal.value]);
        const left = Math.min(...xs), right = Math.max(...xs);
        const top = Math.min(...ys), bottom = Math.max(...ys);
        const polygons = [...svg.querySelectorAll('polygon')].filter(node => node.points.numberOfItems === 6);
        return samples.map(([sourceX, sourceY, bin]) => {
          // Fixture axes are explicitly linear 0..4. Their rendered spines
          // provide the real display transform; no layout margin is guessed.
          const x = left + sourceX / 4 * (right - left);
          const y = bottom - sourceY / 4 * (bottom - top);
          const polygon = polygons[bin];
          if (!polygon) throw Error('Missing assigned hexagonal face');
          const points = Array.from({ length: 6 }, (_, index) => polygon.points.getItem(index));
          const crosses = points.map((a, index) => {
            const b = points[(index + 1) % 6];
            return (b.x - a.x) * (y - a.y) - (b.y - a.y) * (x - a.x);
          });
          const contained = crosses.every(value => value >= -1e-7) || crosses.every(value => value <= 1e-7);
          const screen = new DOMPoint(x, y).matrixTransform(svg.getScreenCTM());
          return { sourceX, sourceY, bin, contained, clientX: screen.x, clientY: screen.y };
        });
      }, samples);
      for (const sample of audit) {
        assert(sample.contained, `${chart}: source (${sample.sourceX},${sample.sourceY}) lies inside its actual assigned SVG face`);
        await page.mouse.move(sample.clientX, sample.clientY);
        await tooltip(chart).waitFor();
        assert.equal(await tooltip(chart).getAttribute('data-moonplot-kind'), 'hexbin');
        await state(chart, { row: 1, column: sample.bin, count: sample.bin === 0 ? 2 : 3,
          value: expectedValues[sample.bin], dataX: sample.bin === 0 ? 1 : 3, dataY: 2 });
        await sourceBin(chart);
      }
      evidence.push({ phase: 'source-observation-containment', chart, observations: audit });
    }
    const hex = (index = 0, extra = {}) => ({ kind: 'hex', index, ...extra });
    const body = (sample = 4, group = 0, extra = {}) => ({ kind: 'body', sample, group, ...extra });
    const summary = (part, group = 0, fraction = 0.85) => ({ kind: 'summary', part, group, fraction });
    const legend = chart => page.locator(`[data-testid="distribution-${chart}"] [data-moonplot-series="distribution"]`);

    await hover('count', hex(), 'hexbin', ['Count', '2']);
    await state('count', { point: 0, row: 1, column: 0, count: 2, value: 2, reduction: 'Count', dataX: 1, dataY: 2 });
    await sourceBin('count');
    for (const edge of [0, 2, 4]) await hover('count', hex(0, { edge }), 'hexbin', ['2']);
    await noHit('count', hex(0, { corner: true }));
    await click('count', hex(1), 1);
    await state('count', { point: 1, row: 1, column: 1, count: 3, value: 3, reduction: 'Count', dataX: 3, dataY: 2 });
    await sourceBin('count');
    checks.push('Hexagon centers and actual edge interiors expose original count, grid indices and data centers; bounding-box empty corners reject hits');

    await hover('reduce', hex(), 'hexbin', ['8 kWh', '样本数', '2', '自定义求和']);
    await state('reduce', { point: 0, row: 1, column: 0, count: 2, value: 8, reduction: 'Custom', dataX: 1, dataY: 2 });
    await sourceBin('reduce');
    await hover('reduce', hex(1, { edge: 1 }), 'hexbin', ['60 kWh', '3']);
    await state('reduce', { point: 1, row: 1, column: 1, count: 3, value: 60, reduction: 'Custom' });
    await sourceBin('reduce');
    await click('reduce', hex(1), 1);
    await noHit('reduce', hex(1, { corner: true }));
    checks.push('Custom reductions keep raw sums and counts under a logarithmic color scale and agree with actual public Hexbin results');

    await observedContainment('count', [2, 3]);
    await observedContainment('reduce', [8, 60]);
    checks.push('Each original observation lies inside its actual assigned SVG hexagon and real mouse hits at that source coordinate return the corresponding raw count or reduction');

    const removed = await page.locator('#distribution-count-svg').evaluate(svg => {
      const polygon = [...svg.querySelectorAll('polygon')].find(node => node.points.numberOfItems === 6);
      const points = Array.from({ length: 6 }, (_, index) => polygon.points.getItem(index));
      return { x: points.reduce((sum, point) => sum + point.x, 0) / 6,
        y: points.reduce((sum, point) => sum + point.y, 0) / 6 };
    });
    await page.locator('#distributions-filter').click();
    await page.waitForFunction(() => document.querySelector('#distribution-filter-state')?.textContent === 'Min count 3');
    assert.equal(await page.locator('#distribution-count-svg polygon').count(), 1);
    await noHit('count', { kind: 'absolute', ...removed });
    await hover('count', hex(), 'hexbin', ['3']);
    await state('count', { point: 0, row: 1, column: 1, count: 3, value: 3 });
    await sourceBin('count');
    await state('reduce', { selected: true, clicks: 1 });
    await page.locator('#distributions-filter').click();
    await page.waitForFunction(() => document.querySelector('#distribution-count-svg')?.querySelectorAll('polygon').length === 2);
    checks.push('Minimum-count filtering leaves no ghost target and keeps each retained Hexbin return index and original row/column intact');

    await hover('violin', body(), 'violin', ['密度估计采样', '2.75 ms', '估计密度']);
    await sourceDensity('violin', { group: 0, position: 1, horizontal: false, part: 'Body', sample: 4, coordinate: 2.75,
      mean: 3.6, median: 3, minimum: 1, maximum: 8 });
    assert(![1, 2, 3, 4, 8].includes(2.75), 'Chosen KDE sample is explicitly not an observed input value');
    await hover('violin', body(4, 0, { fraction: 0.98 }), 'violin', ['2.75 ms']);
    await click('violin', body(), 1);
    checks.push('Whole violin density bodies select original KDE samples and densities, cross-checked against actual ViolinStats instead of being presented as observed points');

    for (const [part, name, value] of [
      ['mean', 'Mean', 3.6], ['median', 'Median', 3], ['minimum', 'Minimum', 1], ['maximum', 'Maximum', 8],
      ['range', 'Range', 3], ['q0', 'Quantile', 2], ['q1', 'Quantile', 4],
    ]) {
      await hover('violin', summary(part, 0, part === 'range' ? 0.62 : 0.85), 'violin');
      await state('violin', { group: 0, position: 1, horizontal: false, part: name, value,
        mean: 3.6, median: 3, minimum: 1, maximum: 8 });
      if (part === 'q0' || part === 'q1') await state('violin', { quantile: part === 'q0' ? 0 : 1, quantileValue: value });
    }
    await hover('violin', body(4, 1), 'violin', ['南区', '3.75 ms']);
    await sourceDensity('violin', { group: 1, position: 2, horizontal: false, sample: 4, coordinate: 3.75,
      mean: 4.6, median: 4, minimum: 2, maximum: 9 });
    checks.push('Actual mean, median, extrema, range and quantile lines retain distinct typed parts and full original group summaries, including inside the density body');

    await hover('horizontal', body(4, 0, { fraction: 0.6 }), 'violin', ['密度估计采样', '2.75 ms']);
    await sourceDensity('horizontal', { group: 0, position: 1, horizontal: true, part: 'Body', sample: 4, coordinate: 2.75,
      mean: 3.6, median: 3, minimum: 1, maximum: 8 });
    await noHit('horizontal', body(4, 0, { opposite: true }));
    await hover('horizontal', summary('mean'), 'violin', ['均值', '3.6 ms']);
    await state('horizontal', { part: 'Mean', value: 3.6 });
    await click('horizontal', summary('q0'), 1);
    await state('horizontal', { group: 0, horizontal: true, part: 'Quantile', quantile: 0, quantileValue: 2, value: 2 });
    await noHit('horizontal', { kind: 'absolute', x: 10, y: 10 });
    checks.push('Horizontal one-sided violins hit only the actual density half and summary lines, leaving the empty half and margins unselectable');

    await legend('count').click();
    await page.waitForFunction(() => !document.querySelector('#distribution-count-svg polygon'));
    await noHit('count', { kind: 'absolute', ...removed });
    await state('reduce', { selected: true, clicks: 1 });
    await state('horizontal', { selected: true, clicks: 1 });
    await legend('count').click();
    await page.waitForSelector('#distribution-count-svg polygon');
    await hover('count', hex(), 'hexbin', ['2']);
    await legend('violin').click();
    await page.waitForFunction(() => !document.querySelector('#distribution-violin-svg polygon'));
    await noHit('violin', { kind: 'absolute', x: 180, y: 180 });
    await legend('violin').click();
    await page.waitForSelector('#distribution-violin-svg polygon');
    await hover('violin', body(), 'violin', ['密度估计采样']);
    checks.push('Independent legends remove hidden density and bin targets, restore current metadata and preserve other charts’ selections');

    await page.locator('#distributions-update').click();
    await page.waitForFunction(() => document.querySelector('#distributions-revision')?.textContent === 'Revision 1');
    await state('horizontal', { hovered: false, selected: false });
    await hover('count', hex(), 'hexbin', ['3']);
    await state('count', { count: 3, value: 3 });
    await sourceBin('count');
    await hover('reduce', hex(), 'hexbin', ['12 kWh', '2']);
    await state('reduce', { count: 2, value: 12, reduction: 'Custom' });
    await sourceBin('reduce');
    await hover('reduce', hex(1), 'hexbin', ['70 kWh', '3']);
    await state('reduce', { count: 3, value: 70 });
    await hover('violin', body(5), 'violin', ['密度估计采样', '4.5 ms']);
    await sourceDensity('violin', { group: 0, position: 1, horizontal: false, part: 'Body', sample: 5, coordinate: 4.5,
      mean: 4.8, median: 4, minimum: 2, maximum: 10 });
    await hover('horizontal', summary('q0'), 'violin', ['分位线 1', '3 ms']);
    await state('horizontal', { group: 0, part: 'Quantile', quantile: 0, quantileValue: 3, value: 3,
      mean: 4.8, median: 4, minimum: 2, maximum: 10 });
    checks.push('Data replacement refreshes raw counts, custom sums, KDE samples and original summaries while clearing stale selections');

    for (let index = 0; index < 3; index++) {
      await page.locator('#distributions-mount').click();
      await page.waitForSelector('#distributions-unmounted');
      assert.equal(await page.locator('svg').count(), 0);
      await page.locator('#distributions-mount').click();
      await page.waitForSelector('#distribution-horizontal-svg');
    }
    await click('reduce', hex(), 2);
    await state('count', { clicks: 1 });
    await state('violin', { clicks: 1 });
    await state('horizontal', { clicks: 1 });
    checks.push('Three remount cycles preserve independent click counts and dispatch one event per click');

    await page.locator('#distribution-count').evaluate(node => { node.style.padding = '23px'; node.style.border = '7px solid #e5e9ed'; });
    await page.locator('#distribution-count-svg').evaluate(node => { node.style.width = '360px'; node.style.height = '360px'; });
    await hover('count', hex(0, { edge: 2 }), 'hexbin', ['3']);
    await noHit('count', hex(0, { corner: true }));
    const letterbox = await page.locator('#distribution-count-svg').boundingBox();
    await page.mouse.move(letterbox.x + letterbox.width / 2, letterbox.y + 3);
    await state('count', { hovered: false });
    await page.locator('#distribution-count').evaluate(node => { node.style.padding = ''; node.style.border = ''; });
    await page.locator('#distribution-count-svg').evaluate(node => { node.style.width = '100%'; node.style.height = 'auto'; });
    checks.push('True hexagonal edges and empty corners keep correct hits through CSS scaling, borders, padding and letterboxing');

    await page.setViewportSize({ width: 375, height: 812 });
    await hover('reduce', hex(), 'hexbin', ['12 kWh']);
    const mobileTooltip = await tooltip('reduce').boundingBox();
    assert(mobileTooltip.x >= 0 && mobileTooltip.x + mobileTooltip.width <= 375);
    await hover('violin', body(5), 'violin', ['密度估计采样', '4.5 ms']);
    await sourceDensity('violin', { part: 'Body', sample: 5, coordinate: 4.5 });
    await hover('horizontal', body(5, 0, { fraction: 0.6 }), 'violin', ['4.5 ms']);
    await noHit('horizontal', body(5, 0, { opposite: true }));
    assert(await page.evaluate(() => document.documentElement.scrollWidth <= innerWidth));
    await page.screenshot({ path: path.join(output, 'mobile.png'), fullPage: true });
    checks.push('375px mobile layout retains raw reductions, KDE body samples and one-sided exclusions without page or tooltip overflow');

    await page.setViewportSize({ width: 1280, height: 950 });
    await page.locator('#distributions-update').click();
    await page.waitForFunction(() => document.querySelector('#distributions-revision')?.textContent === 'Revision 2');
    await hover('reduce', hex(), 'hexbin', ['8 kWh']);
    await page.screenshot({ path: path.join(output, 'distributions.png'), fullPage: true });
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
