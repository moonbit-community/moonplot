// Actual SVG/mouse acceptance for stem rods, heads and raw baseline metadata.
// Build rabbita/cmd/stems first; an isolated target directory is supported.
const assert = require('node:assert/strict');
const { createHash } = require('node:crypto');
const fs = require('node:fs/promises');
const http = require('node:http');
const path = require('node:path');
const { chromium } = require(process.env.PLAYWRIGHT_MODULE || 'playwright');
const root = path.resolve(__dirname, '..');
const target = path.resolve(process.env.MOONPLOT_STEMS_TARGET_DIR || path.join(root, '_build'));
const scriptPath = '/_build/js/debug/build/rabbita/cmd/stems/stems.js';
const compiledScript = path.join(target, 'js/debug/build/rabbita/cmd/stems/stems.js');
const output = path.resolve(process.env.MOONPLOT_STEMS_OUTPUT ||
  path.join(root, '.moonagent/checkpoints/M8-stem/browser'));
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
    await page.goto(`http://127.0.0.1:${server.address().port}/rabbita/stems.html`, { waitUntil: 'networkidle' });
    await page.waitForFunction(() => document.querySelector('#stem-band-svg') || document.querySelector('#stems-error'));
    const failed = await page.locator('#stems-error').count();
    assert.equal(failed, 0, failed ? await page.locator('#stems-error').textContent() : 'All figures render');
    assert.equal(await page.locator('svg[data-moonplot-root]').count(), 3);
    const identity = await page.evaluate(() => {
      const ids = [...document.querySelectorAll('[id]')].map(node => node.id);
      return { duplicates: ids.filter((id, index) => ids.indexOf(id) !== index),
        namespaced: [...document.querySelectorAll('svg, svg *')].every(node => node.namespaceURI === 'http://www.w3.org/2000/svg') };
    });
    assert.deepEqual(identity, { duplicates: [], namespaced: true });
    await page.evaluate(() => {
      window.stemMouseEvents = [];
      window.stemActiveChart = 'vertical';
      document.addEventListener('mousemove', event => {
        const svg = document.querySelector(`#stem-${window.stemActiveChart}-svg`);
        if (!svg) return;
        const local = new DOMPoint(event.clientX, event.clientY).matrixTransform(svg.getScreenCTM().inverse());
        window.stemMouseEvents.push({ clientX: event.clientX, clientY: event.clientY, localX: local.x, localY: local.y });
        if (window.stemMouseEvents.length > 8) window.stemMouseEvents.shift();
      }, true);
    });
    checks.push('Three independent stem charts render actual namespaced SVG with unique resource IDs');

    const tooltip = chart => page.locator(`[data-testid="stem-${chart}-tooltip"]`);
    const status = chart => page.locator(`#stem-${chart}-status`);
    const legend = (chart, series = 'stem') => page.locator(`[data-testid="stem-${chart}"] [data-moonplot-series="${series}"]`);
    async function state(chart, expected) {
      try {
        await page.waitForFunction(({ chart, expected }) => {
          const node = document.querySelector(`#stem-${chart}-status`);
          return node && Object.entries(expected).every(([key, value]) => node.dataset[key] === String(value));
        }, { chart, expected });
      } catch (error) {
        console.error({ chart, expected, actual: await status(chart).evaluate(node => ({ ...node.dataset })) });
        throw error;
      }
    }
    async function position(chart, query) {
      const svg = page.locator(`#stem-${chart}-svg`);
      await svg.scrollIntoViewIfNeeded();
      return svg.evaluate((svg, { chart, query }) => {
        const colors = { vertical: '#398575', horizontal: '#4d79c7', band: '#8a70b5' };
        const rawPoints = line => line.getAttribute('points').trim().split(/\s+/).map(pair => {
          const [x, y] = pair.split(',').map(Number); return { x, y };
        });
        let x, y;
        if (query.kind === 'rod') {
          // Missing input1 is intentionally preserved as an index hole. Its
          // single-point static polyline has no rod segment to select.
          const lines = [...svg.querySelectorAll(`polyline[stroke="${colors[chart]}"]`)]
            .map(rawPoints).filter(points => points.length === 2 && (points[0].x !== points[1].x || points[0].y !== points[1].y));
          const points = lines[[0, 2, 3].indexOf(query.source)];
          if (!points) throw Error('Missing actual finite rod');
          const fraction = query.fraction ?? 0.5;
          x = points[0].x + (points[1].x - points[0].x) * fraction;
          y = points[0].y + (points[1].y - points[0].y) * fraction;
        } else if (query.kind === 'head') {
          const circle = svg.querySelectorAll(`circle[fill="${colors[chart]}"][r="3.5"]`)[[0, 2, 3].indexOf(query.source)];
          if (!circle) throw Error('Missing actual finite head');
          // Read written doubles; SVGPoint and animated float getters can
          // reduce precision before the real MouseEvent is delivered.
          x = Number(circle.getAttribute('cx')); y = Number(circle.getAttribute('cy'));
        } else if (query.kind === 'baseline') {
          const line = svg.querySelector(`line[stroke="${colors[chart]}"]`);
          if (!line) throw Error('Missing actual static baseline');
          const fraction = query.fraction ?? 0.32;
          x = Number(line.getAttribute('x1')) + (Number(line.getAttribute('x2')) - Number(line.getAttribute('x1'))) * fraction;
          y = Number(line.getAttribute('y1')) + (Number(line.getAttribute('y2')) - Number(line.getAttribute('y1'))) * fraction;
        } else if (query.kind === 'data') {
          const spines = [...svg.querySelectorAll('line[stroke="#d8dfe5"]')];
          if (spines.length !== 2) throw Error('Expected actual left/bottom axis spines');
          const xs = spines.flatMap(line => [Number(line.getAttribute('x1')), Number(line.getAttribute('x2'))]);
          const ys = spines.flatMap(line => [Number(line.getAttribute('y1')), Number(line.getAttribute('y2'))]);
          const left = Math.min(...xs), right = Math.max(...xs), top = Math.min(...ys), bottom = Math.max(...ys);
          const clipped = document.querySelector(`#stem-${chart}-status`).dataset.clipped === 'true';
          // These are explicit fixture limits, mapped by the real spines.
          const limits = chart === 'horizontal' ? [-5, 11, 0, 8] : [0, 8, -5, clipped ? 6 : 11];
          x = left + (query.x - limits[0]) / (limits[1] - limits[0]) * (right - left);
          y = bottom - (query.y - limits[2]) / (limits[3] - limits[2]) * (bottom - top);
        } else { x = query.x; y = query.y; }
        const client = new DOMPoint(x, y).matrixTransform(svg.getScreenCTM());
        if (query.exact) {
          if (Math.abs(client.x - Math.round(client.x)) > 1e-9 || Math.abs(client.y - Math.round(client.y)) > 1e-9) {
            throw Error('Exact head requires an integer-event-aligned actual viewport');
          }
          return { x: Math.round(client.x), y: Math.round(client.y) };
        }
        return { x: client.x + (query.dx || 0), y: client.y + (query.dy || 0) };
      }, { chart, query });
    }
    async function alignHeads(chart, enabled) {
      await page.locator(`#stem-${chart}-svg`).evaluate((svg, enabled) => {
        if (!enabled) {
          svg.style.width = '100%'; svg.style.height = 'auto'; svg.style.maxWidth = ''; svg.style.transform = '';
          return;
        }
        svg.style.width = '560px'; svg.style.height = '400px'; svg.style.maxWidth = 'none';
        const rect = svg.getBoundingClientRect();
        svg.style.transform = `translate(${Math.round(rect.x) - rect.x}px, ${Math.round(rect.y) - rect.y}px)`;
      }, enabled);
    }
    async function hover(chart, query, kind = 'stem', fragments = []) {
      const client = await position(chart, query);
      if (query.exact) await page.evaluate(chart => { window.stemMouseEvents = []; window.stemActiveChart = chart; }, chart);
      await page.mouse.move(client.x, client.y);
      if (query.exact) {
        await page.waitForFunction(() => window.stemMouseEvents.length > 0);
        const actual = await page.locator(`#stem-${chart}-svg`).evaluate((svg, { chart, source }) => {
          const status = document.querySelector(`#stem-${chart}-status`);
          const canonical = { x: Number(status.getAttribute(`data-head-${source}-x`)), y: Number(status.getAttribute(`data-head-${source}-y`)) };
          const mapped = new DOMPoint(canonical.x, canonical.y).matrixTransform(svg.getScreenCTM());
          return { events: window.stemMouseEvents, canonical, canonicalClient: { x: mapped.x, y: mapped.y },
            svgRect: svg.getBoundingClientRect().toJSON(), wrapperRect: svg.closest('.moonplot-viewport').getBoundingClientRect().toJSON() };
        }, { chart, source: query.source });
        const event = actual.events.at(-1);
        assert.equal(client.x, event.clientX); assert.equal(client.y, event.clientY);
        assert(Math.abs(event.clientX - actual.canonicalClient.x) < 1e-9);
        assert(Math.abs(event.clientY - actual.canonicalClient.y) < 1e-9);
        evidence.push({ phase: 'actual-head-event', chart, source: query.source, requestedClient: client, actual });
      }
      await tooltip(chart).waitFor();
      assert.equal(await tooltip(chart).getAttribute('data-moonplot-kind'), kind);
      const text = await tooltip(chart).innerText();
      for (const fragment of fragments) assert(text.includes(fragment), `${chart}: ${fragment} in ${text}`);
      return client;
    }
    async function noHit(chart, query) {
      const client = await position(chart, query);
      await page.mouse.move(client.x, client.y);
      await state(chart, { hovered: false });
      assert.equal(await tooltip(chart).count(), 0);
    }
    async function source(chart, expected, component) {
      await state(chart, expected);
      const actual = await status(chart).evaluate(node => ({ ...node.dataset }));
      for (const [observed, original] of [['value', 'expectedValue'], ['dataX', 'expectedX'], ['dataY', 'expectedY'], ['lower', 'expectedLower'], ['series', 'expectedSeries']]) {
        assert.notEqual(actual[observed], undefined); assert.notEqual(actual[original], undefined);
        assert.equal(actual[observed], actual[original], `${chart}: ${observed} is the raw source value`);
      }
      assert.equal(actual.upper, actual.value);
      assert.equal(actual.bandHorizontal, String(chart === 'horizontal'));
      assert.equal(actual.bandPresent, 'true'); assert.equal(actual.stacked, 'false');
      assert.equal(actual.intervalPresent, 'false'); assert.equal(actual.fractionPresent, 'false');
      if (component) {
        const artist = await status(chart).getAttribute(`data-${component}-${actual.point}-artist`);
        assert.notEqual(artist, null, 'The actual frame has this physical component');
        assert.equal(actual.artist, artist, 'Hit carries the actual rod/head component identity');
      }
      evidence.push({ chart, component, ...actual });
    }
    async function click(chart, query, clicks) {
      const client = await position(chart, query);
      await page.mouse.click(client.x, client.y);
      await state(chart, { selected: true, clicks });
    }
    const rod = (source, extra = {}) => ({ kind: 'rod', source, ...extra });
    const head = source => ({ kind: 'head', source, exact: true });
    const data = (x, y) => ({ kind: 'data', x, y });

    for (const [index, value] of [[0, 5], [2, -1], [3, 7]]) {
      await hover('vertical', rod(index), 'stem', ['Sample response', String(value)]);
      await source('vertical', { point: index, value, lower: 1, upper: value }, 'rod');
    }
    await noHit('vertical', { kind: 'baseline' });
    await noHit('vertical', data(1, 9));
    await click('vertical', rod(0), 1);
    checks.push('Vertical rods retain original signed values, input indices and nonzero directed baseline bounds; baseline and off-stroke space do not snap');

    await alignHeads('vertical', true);
    for (const [index, value] of [[0, 5], [2, -1], [3, 7]]) {
      await hover('vertical', head(index), 'stem', [String(value)]);
      await source('vertical', { point: index, value }, 'head');
      const rodArtist = await status('vertical').getAttribute(`data-rod-${index}-artist`);
      assert.notEqual(await status('vertical').getAttribute('data-artist'), rodArtist);
    }
    await alignHeads('vertical', false);
    checks.push('Real integer-aligned mouse events select original heads with distinct component artists and the same source metadata as their rods');

    for (const chart of ['vertical', 'horizontal', 'band']) {
      assert.equal(await status(chart).getAttribute('data-head-1-artist'), null);
      assert.equal(await status(chart).getAttribute('data-rod-1-artist'), null);
    }
    await noHit('vertical', data(2, 5));
    await hover('vertical', rod(2), 'stem', ['-1']);
    await source('vertical', { point: 2, value: -1 }, 'rod');
    checks.push('A missing input creates no head or rod target and leaves the later original input indices uncompressed');

    await hover('horizontal', rod(2), 'stem', ['采样读数', '-1 mV', '基线']);
    await source('horizontal', { point: 2, value: -1, dataX: -1, dataY: 4, hitMode: 'x-nearest' }, 'rod');
    await alignHeads('horizontal', true);
    await hover('horizontal', head(0), 'stem', ['5 mV']);
    await source('horizontal', { point: 0, value: 5, dataX: 5, dataY: 1 }, 'head');
    await alignHeads('horizontal', false);
    await noHit('horizontal', { kind: 'baseline' });
    await noHit('horizontal', data(-4, 1));
    await noHit('horizontal', data(5, 2.5));
    await click('horizontal', rod(2), 1);
    checks.push('Horizontal stems swap raw head coordinates and retain physical-only hits in XNearest without panel-wide horizontal snapping');

    await page.locator('#stems-clip').click();
    await state('vertical', { clipped: true, selected: false });
    await hover('vertical', rod(3), 'stem', ['7']);
    await source('vertical', { point: 3, value: 7, upper: 7 }, 'rod');
    assert.equal(await status('vertical').getAttribute('data-head-3-artist'), null);
    await noHit('vertical', data(7, 7));
    await noHit('vertical', rod(3, { fraction: 0.97 }));
    await page.locator('#stems-clip').click();
    await state('vertical', { clipped: false });
    checks.push('Panel clipping keeps visible rod portions with the full raw head value and excludes the off-panel head and stroke portions');

    assert(await page.locator('#stem-band-svg polygon').count() > 0);
    for (const [index, value] of [[0, 5], [2, -1], [3, 7]]) {
      await hover('band', rod(index), 'stem', ['采样读数', `${value} mV`]);
      await source('band', { point: index, value }, 'rod');
    }
    await alignHeads('band', true);
    await hover('band', head(0), 'stem', ['5 mV']);
    await source('band', { point: 0, value: 5 }, 'head');
    await alignHeads('band', false);
    await hover('band', data(2.8, 3), 'area', ['参考区间']);
    await click('band', rod(0), 1);
    checks.push('Later actual rods and heads remain selectable over an earlier real confidence band while band-only space retains area semantics');

    await legend('vertical').click();
    await page.waitForFunction(() => !document.querySelector('#stem-vertical-svg circle[fill="#398575"]'));
    await noHit('vertical', data(1, 3));
    await state('horizontal', { selected: true, clicks: 1 });
    await state('band', { selected: true, clicks: 1 });
    await legend('vertical').click();
    await hover('vertical', rod(0), 'stem', ['5']);
    await legend('band').click();
    await hover('band', data(1, 3), 'area', ['参考区间']);
    await legend('band', 'band').click();
    await noHit('band', data(1, 3));
    await legend('band').click();
    await hover('band', rod(0), 'stem', ['5 mV']);
    await legend('band', 'band').click();
    checks.push('Independent stem and reference legends remove only their own targets and preserve other chart selections and click counts');

    await page.locator('#stems-update').click();
    await page.waitForFunction(() => document.querySelector('#stems-revision')?.textContent === 'Revision 1');
    await state('horizontal', { hovered: false, selected: false });
    await state('band', { hovered: false, selected: false });
    await hover('vertical', rod(0), 'stem', ['3']);
    await source('vertical', { point: 0, value: 3, dataX: 1, dataY: 3, upper: 3 }, 'rod');
    await hover('horizontal', rod(2), 'stem', ['-2 mV']);
    await source('horizontal', { point: 2, value: -2, dataX: -2, dataY: 4, upper: -2 }, 'rod');
    await alignHeads('band', true);
    await hover('band', head(3), 'stem', ['6 mV']);
    await source('band', { point: 3, value: 6, dataX: 7, dataY: 6 }, 'head');
    await alignHeads('band', false);
    checks.push('Data replacement updates rods and heads with original index holes and signed baseline bounds while clearing stale selections');

    for (let index = 0; index < 3; index++) {
      await page.locator('#stems-mount').click();
      await page.waitForSelector('#stems-unmounted');
      assert.equal(await page.locator('svg').count(), 0);
      await page.locator('#stems-mount').click();
      await page.waitForSelector('#stem-band-svg');
    }
    await click('vertical', rod(0), 2);
    await state('horizontal', { clicks: 1 });
    await state('band', { clicks: 1 });
    checks.push('Three remount cycles preserve independent click counts and emit exactly one selection event per click');

    await page.locator('#stem-vertical').evaluate(node => { node.style.padding = '21px'; node.style.border = '7px solid #e5e9ed'; });
    await page.locator('#stem-vertical-svg').evaluate(node => { node.style.width = '360px'; node.style.height = '360px'; });
    await hover('vertical', rod(0, { dx: 2 }), 'stem', ['3']);
    await source('vertical', { point: 0, value: 3 }, 'rod');
    await noHit('vertical', rod(0, { dx: 8 }));
    const letterbox = await page.locator('#stem-vertical-svg').boundingBox();
    await page.mouse.move(letterbox.x + letterbox.width / 2, letterbox.y + 3);
    await state('vertical', { hovered: false });
    await page.locator('#stem-vertical').evaluate(node => { node.style.padding = ''; node.style.border = ''; });
    await page.locator('#stem-vertical-svg').evaluate(node => { node.style.width = '100%'; node.style.height = 'auto'; });
    checks.push('Actual rod hit radii remain CSS pixels through scaling, padding, borders and square letterboxing, excluding blank space');

    await page.setViewportSize({ width: 375, height: 812 });
    await hover('horizontal', rod(2), 'stem', ['-2 mV']);
    const mobileTooltip = await tooltip('horizontal').boundingBox();
    assert(mobileTooltip.x >= 0 && mobileTooltip.x + mobileTooltip.width <= 375);
    await source('horizontal', { point: 2, value: -2 }, 'rod');
    await alignHeads('vertical', true);
    await hover('vertical', head(0), 'stem', ['3']);
    await source('vertical', { point: 0, value: 3 }, 'head');
    await alignHeads('vertical', false);
    await noHit('horizontal', { kind: 'baseline' });
    assert(await page.evaluate(() => document.documentElement.scrollWidth <= innerWidth));
    await page.screenshot({ path: path.join(output, 'mobile.png'), fullPage: true });
    checks.push('375px mobile layout keeps raw signed values, actual head events and physical-only selection without page or tooltip overflow');

    await page.setViewportSize({ width: 1280, height: 950 });
    await page.locator('#stems-update').click();
    await page.waitForFunction(() => document.querySelector('#stems-revision')?.textContent === 'Revision 2');
    await hover('band', rod(0), 'stem', ['5 mV']);
    await page.screenshot({ path: path.join(output, 'stems.png'), fullPage: true });
    assert.deepEqual(errors, []);
    const artifact = { path: compiledScript, bytes: compiled.length, sha256: createHash('sha256').update(compiled).digest('hex') };
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
