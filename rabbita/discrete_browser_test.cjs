// Real SVG DOM acceptance for original step samples, stairs and ECDF results.
// Build rabbita/cmd/discrete before running. The optional target directory
// selects an actual isolated build; this runner never substitutes mock charts.
const assert = require('node:assert/strict');
const { createHash } = require('node:crypto');
const fs = require('node:fs/promises');
const http = require('node:http');
const path = require('node:path');
const { chromium } = require(process.env.PLAYWRIGHT_MODULE || 'playwright');
const root = path.resolve(__dirname, '..');
const target = path.resolve(process.env.MOONPLOT_DISCRETE_TARGET_DIR || path.join(root, '_build'));
const scriptPath = '/_build/js/debug/build/rabbita/cmd/discrete/discrete.js';
const compiledScript = path.join(target, 'js/debug/build/rabbita/cmd/discrete/discrete.js');
const output = path.resolve(process.env.MOONPLOT_DISCRETE_OUTPUT ||
  path.join(root, '.moonagent/checkpoints/M7-discrete/browser'));
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
    await page.goto(`http://127.0.0.1:${server.address().port}/rabbita/discrete.html`, { waitUntil: 'networkidle' });
    await page.waitForFunction(() => document.querySelector('#discrete-complementary-svg') || document.querySelector('#discrete-error'));
    const failed = await page.locator('#discrete-error').count();
    assert.equal(failed, 0, failed ? await page.locator('#discrete-error').textContent() : 'All figures render');
    assert.equal(await page.locator('svg[data-moonplot-root]').count(), 4);
    const identity = await page.evaluate(() => {
      const ids = [...document.querySelectorAll('[id]')].map(node => node.id);
      return { duplicates: ids.filter((id, index) => ids.indexOf(id) !== index),
        namespaced: [...document.querySelectorAll('svg, svg *')].every(node => node.namespaceURI === 'http://www.w3.org/2000/svg') };
    });
    assert.deepEqual(identity, { duplicates: [], namespaced: true });
    await page.evaluate(() => {
      window.discreteMouseEvents = [];
      document.addEventListener('mousemove', event => {
        const svg = document.querySelector('#discrete-step-svg');
        if (!svg) return;
        const local = new DOMPoint(event.clientX, event.clientY).matrixTransform(svg.getScreenCTM().inverse());
        window.discreteMouseEvents.push({ clientX: event.clientX, clientY: event.clientY, localX: local.x, localY: local.y });
        if (window.discreteMouseEvents.length > 8) window.discreteMouseEvents.shift();
      }, true);
    });
    checks.push('Four independent discrete charts render as actual namespaced SVG with unique IDs');

    const tooltip = chart => page.locator(`[data-testid="discrete-${chart}-tooltip"]`);
    const status = chart => page.locator(`#discrete-${chart}-status`);
    const legend = chart => page.locator(`[data-testid="discrete-${chart}"] [data-moonplot-series="discrete"]`);
    async function state(chart, expected) {
      try {
        await page.waitForFunction(({ chart, expected }) => {
          const node = document.querySelector(`#discrete-${chart}-status`);
          return node && Object.entries(expected).every(([key, value]) => node.dataset[key] === String(value));
        }, { chart, expected });
      } catch (error) {
        console.error({ chart, expected, actual: await status(chart).evaluate(node => ({ ...node.dataset })) });
        throw error;
      }
    }
    async function position(chart, query) {
      const svg = page.locator(`#discrete-${chart}-svg`);
      await svg.scrollIntoViewIfNeeded();
      return svg.evaluate((svg, { chart, query }) => {
        const colors = { step: '#398575', stairs: '#4d79c7', ecdf: '#8a70b5', complementary: '#5e91a8' };
        const data = document.querySelector(`#discrete-${chart}-status`).dataset;
        const horizontal = data.horizontal === 'true';
        let x, y;
        if (query.kind === 'edge' || query.kind === 'vertex') {
          const line = svg.querySelector(`polyline[stroke="${colors[chart]}"]`);
          if (!line) throw Error(`Missing actual ${chart} polyline`);
          // SVGPoint stores float32 coordinates in Chrome. Preserve the
          // actual written numeric values for endpoint identity checks.
          const points = line.getAttribute('points').trim().split(/\s+/).map(pair => {
            const [x, y] = pair.split(',').map(Number); return { x, y };
          });
          if (query.kind === 'vertex') {
            const point = points[query.index];
            x = point.x; y = point.y;
          } else {
            const a = points[query.index], b = points[query.index + 1];
            const fraction = query.fraction ?? 0.5;
            x = a.x + (b.x - a.x) * fraction;
            y = a.y + (b.y - a.y) * fraction;
          }
        } else if (query.kind === 'strip') {
          const polygon = svg.querySelector(`polygon[fill="${colors.stairs}"]`);
          if (!polygon) throw Error('Missing actual filled stairs polygon');
          const a = polygon.points.getItem(query.index * 2 + 1);
          const b = polygon.points.getItem(query.index * 2 + 2);
          const baseline = polygon.points.getItem(0);
          const across = query.across ?? 0.5;
          const height = query.height ?? 0.65;
          if (horizontal) {
            x = baseline.x + (a.x - baseline.x) * height;
            y = a.y + (b.y - a.y) * across;
          } else {
            x = a.x + (b.x - a.x) * across;
            y = baseline.y + (a.y - baseline.y) * height;
          }
        } else if (query.kind === 'data') {
          // Explicit linear fixture limits and actual axis spines supply the
          // display transform. No layout margins or tooltip data are guessed.
          const spines = [...svg.querySelectorAll('line[stroke="#d8dfe5"]')];
          if (spines.length !== 2) throw Error('Expected actual left/bottom axis spines');
          const xs = spines.flatMap(line => [line.x1.baseVal.value, line.x2.baseVal.value]);
          const ys = spines.flatMap(line => [line.y1.baseVal.value, line.y2.baseVal.value]);
          const left = Math.min(...xs), right = Math.max(...xs);
          const top = Math.min(...ys), bottom = Math.max(...ys);
          let limits;
          if (chart === 'step') limits = [-0.5, 8.5, 0, 9];
          else if (chart === 'stairs') limits = horizontal ? [-3, 7, -0.5, 8.5] : [-0.5, 8.5, -3, 7];
          else limits = horizontal ? [-0.1, 1.1, 0, 9] : [0, 9, -0.1, 1.1];
          x = left + (query.x - limits[0]) / (limits[1] - limits[0]) * (right - left);
          y = bottom - (query.y - limits[2]) / (limits[3] - limits[2]) * (bottom - top);
        } else { x = query.x; y = query.y; }
        const point = new DOMPoint(x, y).matrixTransform(svg.getScreenCTM());
        if (query.kind === 'vertex') {
          if (Math.abs(point.x - Math.round(point.x)) > 1e-9 || Math.abs(point.y - Math.round(point.y)) > 1e-9) {
            throw Error('Exact source endpoint must use an integer-event-aligned real layout');
          }
          return { x: Math.round(point.x), y: Math.round(point.y) };
        }
        return { x: point.x + (query.dx || 0), y: point.y + (query.dy || 0) };
      }, { chart, query });
    }
    async function hover(chart, query, kind, fragments = []) {
      const point = await position(chart, query);
      if (query.kind === 'vertex') await page.evaluate(() => { window.discreteMouseEvents = []; });
      await page.mouse.move(point.x, point.y);
      if (query.kind === 'vertex') {
        await page.waitForFunction(() => window.discreteMouseEvents.length > 0);
        evidence.push({ phase: 'real-mouse-endpoint', chart, query, requestedClient: point,
          actual: await page.locator(`#discrete-${chart}-svg`).evaluate((svg, query) => {
            const status = document.querySelector(`#discrete-step-status`);
            const canonical = { x: Number(status.getAttribute(`data-canonical-${query.source}-x`)),
              y: Number(status.getAttribute(`data-canonical-${query.source}-y`)) };
            const mapped = new DOMPoint(canonical.x, canonical.y).matrixTransform(svg.getScreenCTM());
            return { events: window.discreteMouseEvents, canonical, canonicalClient: { x: mapped.x, y: mapped.y },
              svgRect: svg.getBoundingClientRect().toJSON(),
              wrapperRect: svg.closest('.moonplot-viewport').getBoundingClientRect().toJSON(),
              rawPoints: svg.querySelector('polyline[stroke="#398575"]').getAttribute('points') };
          }, query) });
      }
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
    async function source(chart, expected) {
      await state(chart, expected);
      const actual = await status(chart).evaluate(node => ({ ...node.dataset }));
      for (const [observed, original] of [
        ['value', 'expectedValue'], ['dataX', 'expectedX'], ['dataY', 'expectedY'],
        ['intervalPresent', 'expectedIntervalPresent'],
      ]) {
        assert.notEqual(actual[observed], undefined, `${chart}: ${observed} exists`);
        assert.notEqual(actual[original], undefined, `${chart}: ${original} exists`);
        assert.equal(actual[observed], actual[original], `${chart}: ${observed} matches original source/return`);
      }
      if (actual.intervalPresent === 'true') {
        assert.equal(actual.intervalStart, actual.expectedIntervalStart);
        assert.equal(actual.intervalEnd, actual.expectedIntervalEnd);
      }
      if (chart === 'ecdf' || chart === 'complementary') {
        assert.equal(actual.fractionPresent, 'true');
        assert.equal(actual.bandPresent, 'true');
        assert.equal(actual.fraction, actual.expectedFraction);
        assert.equal(actual.lower, actual.expectedBefore);
        assert.equal(actual.upper, actual.expectedFraction);
        assert.equal(actual.bandHorizontal, String(chart === 'complementary'));
        assert.equal(actual.stacked, 'false');
        assert(Number(actual.fraction) >= 0 && Number(actual.fraction) <= 1);
      } else {
        assert.equal(actual.fractionPresent, 'false');
        if (chart === 'stairs' && actual.filled === 'true') {
          assert.equal(actual.bandPresent, 'true');
          assert.equal(actual.lower, '0');
          assert.equal(actual.upper, actual.value);
          assert.equal(actual.bandHorizontal, actual.horizontal);
          assert.equal(actual.stacked, 'false');
        } else assert.equal(actual.bandPresent, 'false');
      }
      evidence.push({ chart, ...actual });
    }
    const edge = (index, extra = {}) => ({ kind: 'edge', index, ...extra });
    const strip = (index, extra = {}) => ({ kind: 'strip', index, ...extra });
    const data = (x, y) => ({ kind: 'data', x, y });

    async function endpointLayout(enabled) {
      await page.locator('#discrete-step-svg').evaluate((svg, enabled) => {
        if (!enabled) {
          svg.style.width = '100%'; svg.style.height = 'auto'; svg.style.transform = '';
          return;
        }
        // Real Chrome MouseEvent coordinates are integers. This fixture's
        // scale 9/14 maps original source points to integer offsets; an
        // integer origin permits an actual mouse to hit the canonical point.
        svg.style.width = '360px'; svg.style.height = '225px';
        const rect = svg.getBoundingClientRect();
        svg.style.transform = `translate(${Math.round(rect.x) - rect.x}px, ${Math.round(rect.y) - rect.y}px)`;
      }, enabled);
    }

    await hover('step', edge(1), 'step', ['Sample value', '6']);
    await source('step', { point: 1, value: 6, dataX: 2, dataY: 6, intervalStart: 0, intervalEnd: 2 });
    await hover('step', edge(0), 'step', ['6']);
    await source('step', { point: 1, value: 6, dataX: 2, dataY: 6 });
    await endpointLayout(true);
    await hover('step', { kind: 'vertex', index: 0, source: 0 }, 'step', ['2']);
    await source('step', { point: 0, value: 2, dataX: 0, dataY: 2, intervalPresent: false });
    await hover('step', { kind: 'vertex', index: 2, source: 1 }, 'step', ['6']);
    await source('step', { point: 1, value: 6, dataX: 2, dataY: 6 });
    await endpointLayout(false);
    await noHit('step', data(1, 4));
    await click('step', edge(1), 1);
    checks.push('Pre-step plateaus, riser interiors and exact source endpoints retain original sample indices and values without synthetic corner samples');

    await page.locator('#discrete-step-mode').click();
    await state('step', { mode: 'post', selected: false });
    await hover('step', edge(0), 'step', ['2']);
    await source('step', { point: 0, value: 2, intervalStart: 0, intervalEnd: 2 });
    await hover('step', edge(1), 'step', ['6']);
    await source('step', { point: 1, value: 6, dataX: 2, dataY: 6, intervalStart: 2, intervalEnd: 5 });
    await endpointLayout(true);
    await hover('step', { kind: 'vertex', index: 6, source: 3 }, 'step', ['7']);
    await source('step', { point: 3, value: 7, intervalPresent: false });
    await endpointLayout(false);
    await page.locator('#discrete-step-mode').click();
    await state('step', { mode: 'mid' });
    await hover('step', edge(2), 'step', ['6']);
    await source('step', { point: 1, value: 6, intervalStart: 1, intervalEnd: 3.5 });
    await hover('step', edge(3), 'step', ['3']);
    await source('step', { point: 2, value: 3, dataX: 5, dataY: 3, intervalStart: 3.5, intervalEnd: 6.5 });
    await page.locator('#discrete-step-mode').click();
    await state('step', { mode: 'pre' });
    checks.push('Post and midpoint alignment change only real plateau intervals and transition locations while preserving original samples');

    for (const [index, value, start, end] of [[0, 2, 0, 1], [1, 5, 1, 3], [2, -1, 3, 6], [3, 4, 6, 8]]) {
      await hover('stairs', strip(index), 'stairs', ['区间用电', `${value} kW`, `${start} – ${end} h`]);
      await source('stairs', { point: index, value, intervalStart: start, intervalEnd: end, horizontal: false });
    }
    await hover('stairs', strip(1, { across: 0.985, height: 0.99 }), 'stairs', ['5 kW']);
    await noHit('stairs', data(2, 6));
    await noHit('stairs', data(4.5, 1));
    await click('stairs', strip(2), 1);
    checks.push('Filled stairs cover actual nonuniform positive and negative strips with original edges and baseline, leaving bounding-box empty areas unselectable');

    await page.locator('#discrete-stairs-orientation').click();
    await state('stairs', { horizontal: true, selected: false });
    await hover('stairs', strip(2), 'stairs', ['-1 kW', '3 – 6 h']);
    await source('stairs', { point: 2, value: -1, dataX: -1, dataY: 3, lower: 0, upper: -1, bandHorizontal: true });
    await noHit('stairs', data(1, 4.5));
    checks.push('Horizontal stairs keep source value, directed interval and baseline while swapping actual data axes');

    await page.locator('#discrete-stairs-fill').click();
    await state('stairs', { filled: false });
    await hover('stairs', edge(2), 'stairs', ['5 kW', '1 – 3 h']);
    await source('stairs', { point: 1, value: 5, dataX: 5, dataY: 1, bandPresent: false });
    await hover('stairs', edge(3), 'stairs', ['-1 kW']);
    await source('stairs', { point: 2, value: -1, intervalStart: 3, intervalEnd: 6, bandPresent: false });
    await noHit('stairs', data(2.5, 2));
    await page.locator('#discrete-stairs-fill').click();
    await page.locator('#discrete-stairs-orientation').click();
    await state('stairs', { filled: true, horizontal: false });
    checks.push('Outline stairs expose real plateau and riser owners without manufacturing filled interiors or an unused baseline');

    for (const [index, value, probability, before] of [[0, 1, 0.25, 0], [1, 3, 0.5, 0.25], [2, 5, 0.75, 0.5], [3, 7, 1, 0.75]]) {
      await hover('ecdf', edge(index * 2), 'ecdf', ['Weighted probability', String(value)]);
      await source('ecdf', { point: index, value, fraction: probability, lower: before, upper: probability, expectedLength: 4 });
    }
    await hover('ecdf', edge(1), 'ecdf', ['1']);
    await source('ecdf', { point: 0, value: 1, fraction: 0.25, intervalStart: 1, intervalEnd: 3 });
    await click('ecdf', edge(2), 1);
    await noHit('ecdf', data(0.5, 0.25));
    await noHit('ecdf', data(8, 1));
    checks.push('Weighted compressed ECDF jumps and outgoing plateaus match each actual public return value and probability without invented infinite tails');

    await page.locator('#discrete-ecdf-compress').click();
    await state('ecdf', { compressed: false, selected: false });
    await hover('ecdf', edge(0), 'ecdf', ['1']);
    await source('ecdf', { point: 0, value: 1, fraction: 0.125, lower: 0, upper: 0.125, intervalStart: 1, intervalEnd: 1, expectedLength: 5 });
    await hover('ecdf', edge(2), 'ecdf', ['1']);
    await source('ecdf', { point: 1, value: 1, fraction: 0.25, lower: 0.125, upper: 0.25, intervalStart: 1, intervalEnd: 3, expectedLength: 5 });
    await page.locator('#discrete-ecdf-compress').click();
    await state('ecdf', { compressed: true });
    checks.push('Uncompressed duplicate values retain distinct actual return slots and probability jumps rather than being labeled as original input indices');

    await hover('complementary', edge(0), 'ecdf', ['剩余分布', '1 ms', '75%', '1 → 0.75']);
    await source('complementary', { point: 0, value: 1, fraction: 0.75, dataX: 0.75, dataY: 1, lower: 1, upper: 0.75 });
    await hover('complementary', edge(1), 'ecdf', ['75%']);
    await source('complementary', { point: 0, value: 1, fraction: 0.75, intervalStart: 1, intervalEnd: 3 });
    await hover('complementary', edge(6), 'ecdf', ['7 ms', '0%']);
    await source('complementary', { point: 3, value: 7, fraction: 0, intervalPresent: false, lower: 0.25, upper: 0 });
    await noHit('complementary', data(0.75, 0.5));
    await noHit('complementary', data(0, 8));
    await click('complementary', edge(4), 1);
    checks.push('Horizontal complementary ECDF preserves decreasing before/after probabilities, true axes and zero probability at its final real jump');

    await hover('step', edge(1), 'step', ['6']);
    const removed = await position('step', edge(1));
    await legend('step').click();
    await page.waitForFunction(() => !document.querySelector('#discrete-step-svg polyline[stroke="#398575"]'));
    await page.mouse.move(removed.x, removed.y);
    await state('step', { hovered: false, selected: false });
    await state('complementary', { selected: true, clicks: 1 });
    await legend('step').click();
    await hover('step', edge(1), 'step', ['6']);
    await legend('stairs').click();
    await page.waitForFunction(() => !document.querySelector('#discrete-stairs-svg polygon'));
    await noHit('stairs', data(2, 2));
    await legend('stairs').click();
    await hover('stairs', strip(1), 'stairs', ['5 kW']);
    checks.push('Independent legends remove hidden line and face targets and preserve selections and counts in other charts');

    await page.locator('#discrete-update').click();
    await page.waitForFunction(() => document.querySelector('#discrete-revision')?.textContent === 'Revision 1');
    await state('complementary', { hovered: false, selected: false });
    await hover('step', edge(1), 'step', ['5']);
    await source('step', { point: 1, value: 5, dataX: 2, dataY: 5 });
    await hover('stairs', strip(2), 'stairs', ['-2 kW', '4 – 5 h']);
    await source('stairs', { point: 2, value: -2, intervalStart: 4, intervalEnd: 5, lower: 0, upper: -2 });
    await hover('ecdf', edge(0), 'ecdf', ['2']);
    await source('ecdf', { point: 0, value: 2, fraction: 0.5, lower: 0, upper: 0.5, intervalStart: 2, intervalEnd: 4 });
    await hover('complementary', edge(0), 'ecdf', ['2 ms', '50%', '1 → 0.5']);
    await source('complementary', { point: 0, value: 2, fraction: 0.5, dataX: 0.5, dataY: 2 });
    checks.push('Data replacement updates raw step samples, nonuniform edges and values and actual weighted probabilities while clearing stale selections');

    for (let index = 0; index < 3; index++) {
      await page.locator('#discrete-mount').click();
      await page.waitForSelector('#discrete-unmounted');
      assert.equal(await page.locator('svg').count(), 0);
      await page.locator('#discrete-mount').click();
      await page.waitForSelector('#discrete-complementary-svg');
    }
    await click('stairs', strip(1), 2);
    await state('step', { clicks: 1 });
    await state('ecdf', { clicks: 1 });
    await state('complementary', { clicks: 1 });
    checks.push('Three remount cycles preserve independent click counts and dispatch exactly one event per click');

    await page.locator('#discrete-step').evaluate(node => { node.style.padding = '23px'; node.style.border = '7px solid #e5e9ed'; });
    await page.locator('#discrete-step-svg').evaluate(node => { node.style.width = '360px'; node.style.height = '360px'; });
    await hover('step', edge(1, { dy: 2 }), 'step', ['5']);
    await source('step', { point: 1, value: 5 });
    await noHit('step', edge(1, { dy: 8 }));
    const letterbox = await page.locator('#discrete-step-svg').boundingBox();
    await page.mouse.move(letterbox.x + letterbox.width / 2, letterbox.y + 3);
    await state('step', { hovered: false });
    await page.locator('#discrete-step').evaluate(node => { node.style.padding = ''; node.style.border = ''; });
    await page.locator('#discrete-step-svg').evaluate(node => { node.style.width = '100%'; node.style.height = 'auto'; });
    checks.push('Actual segment hit radii remain CSS pixels under scaling, borders, padding and letterboxing, with empty letterbox space excluded');

    await page.setViewportSize({ width: 375, height: 812 });
    await hover('step', edge(1), 'step', ['5']);
    await source('step', { point: 1, value: 5 });
    await hover('stairs', strip(2), 'stairs', ['-2 kW', '4 – 5 h']);
    const mobileTooltip = await tooltip('stairs').boundingBox();
    assert(mobileTooltip.x >= 0 && mobileTooltip.x + mobileTooltip.width <= 375);
    await hover('complementary', edge(0), 'ecdf', ['50%']);
    await source('complementary', { value: 2, fraction: 0.5 });
    await noHit('ecdf', data(8.5, 1));
    assert(await page.evaluate(() => document.documentElement.scrollWidth <= innerWidth));
    await page.screenshot({ path: path.join(output, 'mobile.png'), fullPage: true });
    checks.push('375px mobile layout retains original intervals and weighted probabilities without page or tooltip overflow');

    await page.setViewportSize({ width: 1280, height: 950 });
    await page.locator('#discrete-update').click();
    await page.waitForFunction(() => document.querySelector('#discrete-revision')?.textContent === 'Revision 2');
    await hover('complementary', edge(0), 'ecdf', ['75%']);
    await page.screenshot({ path: path.join(output, 'discrete.png'), fullPage: true });
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
