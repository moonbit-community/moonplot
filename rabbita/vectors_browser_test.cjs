// Actual three-line Quiver geometry and original X/Y/U/V metadata acceptance.
// Build rabbita/cmd/vectors first; an actual isolated target is supported.
const assert = require('node:assert/strict');
const { createHash } = require('node:crypto');
const fs = require('node:fs/promises');
const http = require('node:http');
const path = require('node:path');
const { chromium } = require(process.env.PLAYWRIGHT_MODULE || 'playwright');
const root = path.resolve(__dirname, '..');
const target = path.resolve(process.env.MOONPLOT_VECTORS_TARGET_DIR || path.join(root, '_build'));
const scriptPath = '/_build/js/debug/build/rabbita/cmd/vectors/vectors.js';
const compiledScript = path.join(target, 'js/debug/build/rabbita/cmd/vectors/vectors.js');
const output = path.resolve(process.env.MOONPLOT_VECTORS_OUTPUT ||
  path.join(root, '.moonagent/checkpoints/M9-quiver/browser'));
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
    browser = await chromium.launch({ headless: true, ...(channel === 'bundled' ? {} : { channel }) });
    page = await browser.newPage({ viewport: { width: 1280, height: 950 }, deviceScaleFactor: 1 });
    page.on('pageerror', error => errors.push(String(error)));
    page.on('console', message => { if (message.type() === 'error') errors.push(message.text()); });
    await page.goto(`http://127.0.0.1:${server.address().port}/rabbita/vectors.html`, { waitUntil: 'networkidle' });
    await page.waitForFunction(() => document.querySelector('#vector-context-svg') || document.querySelector('#vectors-error'));
    const failed = await page.locator('#vectors-error').count();
    assert.equal(failed, 0, failed ? await page.locator('#vectors-error').textContent() : 'Both figures render');
    assert.equal(await page.locator('svg[data-moonplot-root]').count(), 2);
    const identity = await page.evaluate(() => {
      const ids = [...document.querySelectorAll('[id]')].map(node => node.id);
      return { duplicates: ids.filter((id, index) => ids.indexOf(id) !== index),
        namespaced: [...document.querySelectorAll('svg, svg *')].every(node => node.namespaceURI === 'http://www.w3.org/2000/svg') };
    });
    assert.deepEqual(identity, { duplicates: [], namespaced: true });
    await page.evaluate(() => {
      window.vectorEvents = []; window.vectorActiveChart = 'raw';
      document.addEventListener('mousemove', event => {
        const svg = document.querySelector(`#vector-${window.vectorActiveChart}-svg`);
        if (!svg) return;
        const local = new DOMPoint(event.clientX, event.clientY).matrixTransform(svg.getScreenCTM().inverse());
        window.vectorEvents.push({ clientX: event.clientX, clientY: event.clientY, localX: local.x, localY: local.y });
        if (window.vectorEvents.length > 8) window.vectorEvents.shift();
      }, true);
    });
    checks.push('Two independent vector charts render real namespaced SVG with unique resource IDs');

    const tooltip = chart => page.locator(`[data-testid="vector-${chart}-tooltip"]`);
    const status = chart => page.locator(`#vector-${chart}-status`);
    const legend = (chart, series = 'vectors') => page.locator(`[data-testid="vector-${chart}"] [data-moonplot-series="${series}"]`);
    async function state(chart, expected) {
      try {
        await page.waitForFunction(({ chart, expected }) => {
          const node = document.querySelector(`#vector-${chart}-status`);
          return node && Object.entries(expected).every(([key, value]) => node.dataset[key] === String(value));
        }, { chart, expected });
      } catch (error) {
        console.error({ chart, expected, actual: await status(chart).evaluate(node => ({ ...node.dataset })) }); throw error;
      }
    }
    async function position(chart, query) {
      const svg = page.locator(`#vector-${chart}-svg`);
      if (query.kind !== 'head-gap') await svg.scrollIntoViewIfNeeded();
      return svg.evaluate((svg, { chart, query }) => {
        const color = chart === 'raw' ? '#398575' : '#8a70b5';
        const read = line => ({ a: { x: Number(line.getAttribute('x1')), y: Number(line.getAttribute('y1')) },
          b: { x: Number(line.getAttribute('x2')), y: Number(line.getAttribute('y2')) } });
        const ctm = svg.getScreenCTM();
        const screen = point => { const p = new DOMPoint(point.x, point.y).matrixTransform(ctm); return { x: p.x, y: p.y }; };
        const segments = [...svg.querySelectorAll(`line[stroke="${color}"]`)].map(read);
        if (query.kind === 'segment') {
          const offset = [0, 2, 3].indexOf(query.source) * 3 + query.part;
          const actual = segments[offset]; if (!actual) throw Error('Missing actual vector component');
          const fraction = query.fraction ?? 0.55;
          const p = screen({ x: actual.a.x + (actual.b.x - actual.a.x) * fraction,
            y: actual.a.y + (actual.b.y - actual.a.y) * fraction });
          const a = screen(actual.a), b = screen(actual.b);
          const dx = b.x - a.x, dy = b.y - a.y, length = Math.hypot(dx, dy);
          const distance = query.perpendicularCSS || 0;
          return { x: p.x - dy / length * distance, y: p.y + dx / length * distance, actual, screenSegment: { a, b } };
        }
        if (query.kind === 'head-gap') {
          // The three lines already written to SVG are the authority. This
          // triangle is only an empty-space search region, never a hit shape.
          // No arrow angle, length, tip formula or component metadata is derived.
          const offset = [0, 2, 3].indexOf(query.source) * 3;
          const tip = screen(segments[offset + 1].a), left = screen(segments[offset + 1].b), right = screen(segments[offset + 2].b);
          const crosses = (p, a, b) => (b.x - a.x) * (p.y - a.y) - (b.y - a.y) * (p.x - a.x);
          const distance = (p, a, b) => {
            const dx = b.x - a.x, dy = b.y - a.y;
            const t = Math.max(0, Math.min(1, ((p.x - a.x) * dx + (p.y - a.y) * dy) / (dx * dx + dy * dy)));
            return Math.hypot(p.x - a.x - t * dx, p.y - a.y - t * dy);
          };
          const actual = segments.map(segment => ({ a: screen(segment.a), b: screen(segment.b) }));
          const box = svg.closest('.chart-card').getBoundingClientRect();
          const candidates = [];
          for (let y = Math.ceil(Math.min(tip.y, left.y, right.y)); y <= Math.floor(Math.max(tip.y, left.y, right.y)); y++) {
            for (let x = Math.ceil(Math.min(tip.x, left.x, right.x)); x <= Math.floor(Math.max(tip.x, left.x, right.x)); x++) {
              if (x <= Math.max(0, box.left) || x >= Math.min(innerWidth, box.right) || y <= Math.max(0, box.top) || y >= Math.min(innerHeight, box.bottom)) continue;
              const p = { x, y }, signs = [crosses(p, tip, left), crosses(p, left, right), crosses(p, right, tip)];
              if (!(signs.every(v => v > 0) || signs.every(v => v < 0))) continue;
              const clearance = Math.min(...actual.map(segment => distance(p, segment.a, segment.b)));
              if (clearance > 2.2) candidates.push({ x, y, clearance });
            }
          }
          candidates.sort((a, b) => b.clearance - a.clearance);
          if (!candidates.length) throw Error('No visible integer event in actual arrowhead gap with sufficient physical clearance');
          return { ...candidates[0], actualHead: { tip, left, right }, actualSegments: actual };
        }
        if (query.kind === 'data') {
          const spines = [...svg.querySelectorAll('line[stroke="#d8dfe5"]')].map(read);
          if (spines.length !== 2) throw Error('Expected actual axis spines');
          const xs = spines.flatMap(s => [s.a.x, s.b.x]), ys = spines.flatMap(s => [s.a.y, s.b.y]);
          const left = Math.min(...xs), right = Math.max(...xs), top = Math.min(...ys), bottom = Math.max(...ys);
          const focused = document.querySelector(`#vector-${chart}-status`).dataset.focused === 'true';
          // Limits are explicit fixture inputs; geometry comes from the spines.
          return screen({ x: left + query.x / (focused ? 4.5 : 8) * (right - left), y: bottom - query.y / 8 * (bottom - top) });
        }
        return screen(query);
      }, { chart, query });
    }
    async function hover(chart, query, kind = 'quiver', fragments = []) {
      const requested = await position(chart, query);
      await page.evaluate(chart => { window.vectorEvents = []; window.vectorActiveChart = chart; }, chart);
      await page.mouse.move(requested.x, requested.y);
      await page.waitForFunction(() => window.vectorEvents.length > 0);
      const events = await page.evaluate(() => window.vectorEvents);
      if (requested.screenSegment && !query.perpendicularCSS) {
        const { a, b } = requested.screenSegment, event = events.at(-1);
        const dx = b.x - a.x, dy = b.y - a.y;
        const t = Math.max(0, Math.min(1, ((event.clientX - a.x) * dx + (event.clientY - a.y) * dy) / (dx * dx + dy * dy)));
        const distance = Math.hypot(event.clientX - a.x - t * dx, event.clientY - a.y - t * dy);
        assert(distance <= 2, 'Actual delivered event is within the actual component CSS hit radius');
        evidence.push({ phase: 'actual-vector-segment-event', chart, query, requested, events, distanceCSS: distance });
      }
      await tooltip(chart).waitFor();
      assert.equal(await tooltip(chart).getAttribute('data-moonplot-kind'), kind);
      const text = await tooltip(chart).innerText();
      for (const fragment of fragments) assert(text.includes(fragment), `${chart}: ${fragment} in ${text}`);
      return requested;
    }
    async function noHit(chart, query) {
      const point = await position(chart, query); await page.mouse.move(point.x, point.y);
      await state(chart, { hovered: false }); assert.equal(await tooltip(chart).count(), 0);
      return point;
    }
    async function source(chart, expected) {
      await state(chart, expected);
      const actual = await status(chart).evaluate(node => ({ ...node.dataset }));
      for (const [observed, original] of [['dataX', 'expectedX'], ['dataY', 'expectedY'], ['u', 'expectedU'], ['v', 'expectedV'], ['series', 'expectedSeries']]) {
        assert.notEqual(actual[observed], undefined); assert.notEqual(actual[original], undefined);
        assert.equal(actual[observed], actual[original], `${chart}: ${observed} equals original input`);
      }
      assert.equal(actual.value, actual.v, 'Value is raw V, never magnitude');
      assert.equal(actual.vectorPresent, 'true'); assert.equal(actual.bandPresent, 'false');
      assert.equal(actual.intervalPresent, 'false'); assert.equal(actual.fractionPresent, 'false');
      evidence.push({ chart, ...actual });
    }
    async function click(chart, query, clicks) {
      const point = await position(chart, query); await page.mouse.click(point.x, point.y);
      await state(chart, { selected: true, clicks });
    }
    const segment = (source, part = 0, extra = {}) => ({ kind: 'segment', source, part, ...extra });
    const data = (x, y) => ({ kind: 'data', x, y });

    for (const chart of ['raw', 'context']) {
      await state(chart, { 'segments-0': 3, 'segments-1': 0, 'segments-2': 3, 'segments-3': 3 });
      const color = chart === 'raw' ? '#398575' : '#8a70b5';
      assert.equal(await page.locator(`#vector-${chart}-svg line[stroke="${color}"]`).count(), 9);
    }
    for (const [index, u, v, x, y] of [[0, 2, 3, 1, 1], [2, -3, -2, 7, 6], [3, 2, -2, 1, 7]]) {
      await hover('raw', segment(index), 'quiver', ['Measured vectors', 'X', 'Y', 'U', 'V']);
      await source('raw', { point: index, u, v, value: v, dataX: x, dataY: y });
    }
    await click('raw', segment(0), 1);
    checks.push('Three actual segments per nonzero vector and shaft hits expose original position, signed U/V, index and raw V instead of magnitude');

    for (const [index, u, v] of [[0, 2, 3], [2, -3, -2], [3, 2, -2]]) {
      for (const part of [1, 2]) {
        await hover('raw', segment(index, part), 'quiver', ['U', 'V']);
        await source('raw', { point: index, u, v, value: v });
      }
    }
    checks.push('Both actually written arrow wings independently return their original vector metadata with real MouseEvent-to-segment evidence');

    await noHit('raw', data(3, 2));
    await noHit('raw', data(1, 4.5));
    await hover('raw', segment(2), 'quiver', ['-2']);
    await source('raw', { point: 2, u: -3, v: -2 });
    checks.push('A zero vector produces no target and preserves later original index holes without tail or panel-wide snapping');

    assert.equal(await page.locator('#vector-raw-svg polygon').count(), 0);
    await page.locator('#vector-raw-svg').scrollIntoViewIfNeeded();
    await page.locator('#vector-raw-svg').evaluate(svg => {
      svg.style.width = '1680px'; svg.style.height = '1200px'; svg.style.maxWidth = 'none';
      // Keep the actual first arrowhead visible through the card's overflow
      // clip while inspecting a zoomed view; no SVG primitive is changed.
      const wing = svg.querySelectorAll('line[stroke="#398575"]')[1];
      const tip = new DOMPoint(Number(wing.getAttribute('x1')), Number(wing.getAttribute('y1'))).matrixTransform(svg.getScreenCTM());
      const card = svg.closest('.chart-card').getBoundingClientRect();
      const x = card.left + card.width / 2;
      const y = Math.min(innerHeight - 80, Math.max(80, card.top + 280));
      svg.style.transform = `translate(${x - tip.x}px, ${y - tip.y}px)`;
    });
    const gap = await noHit('raw', { kind: 'head-gap', source: 0 });
    evidence.push({ phase: 'actual-three-line-head-gap', gap });
    await page.locator('#vector-raw-svg').evaluate(svg => { svg.style.width = '100%'; svg.style.height = 'auto'; svg.style.maxWidth = ''; svg.style.transform = ''; });
    checks.push('Empty space between the actual three arrow lines remains empty; no filled triangle or bounding-box target is invented');

    for (const part of [0, 1, 2]) {
      await hover('context', segment(2, part), 'quiver', ['向量分量', '横向 U', '-3', '纵向 V', '-2']);
      await source('context', { point: 2, u: -3, v: -2, hitMode: 'x-nearest' });
    }
    await hover('context', data(4.5, 1), 'area', ['参考区域']);
    await state('context', { vectorPresent: false });
    await click('context', segment(3), 1);
    checks.push('Actual shafts and both wings remain selectable over an earlier real area in XNearest, while area-only space has no vector metadata');

    await page.locator('#vectors-focus').click(); await state('raw', { focused: true, selected: false });
    await hover('raw', segment(2, 0, { fraction: 0.94 }), 'quiver', ['-2']);
    await source('raw', { point: 2, dataX: 7, dataY: 6, u: -3, v: -2 });
    await noHit('raw', data(4.65, 5));
    await page.locator('#vectors-focus').click(); await state('raw', { focused: false });
    checks.push('Visible clipped shaft portions keep the original off-panel tail and vector components without inventing clipped source coordinates');

    await legend('raw').click(); await state('raw', { 'segments-0': 0, selected: false });
    await noHit('raw', data(2, 2.5)); await state('context', { selected: true, clicks: 1 });
    await legend('raw').click(); await hover('raw', segment(0), 'quiver', ['3']);
    await legend('context').click(); await hover('context', data(2, 2.5), 'area', ['参考区域']);
    await state('context', { vectorPresent: false });
    await legend('context', 'band').click(); await noHit('context', data(2, 2.5));
    await noHit('context', data(1, 4.5));
    await legend('context').click(); await hover('context', segment(0), 'quiver', ['向量分量']);
    await legend('context', 'band').click();
    checks.push('Independent legends remove their own geometry and keep physical-only XNearest behavior while preserving the other chart selection');

    await page.locator('#vectors-update').click();
    await page.waitForFunction(() => document.querySelector('#vectors-revision')?.textContent === 'Revision 1');
    await state('context', { hovered: false, selected: false });
    await hover('raw', segment(0), 'quiver', ['U', 'V']);
    await source('raw', { point: 0, dataX: 1, dataY: 1, u: 3, v: 2, value: 2 });
    for (const part of [0, 1, 2]) {
      await hover('context', segment(2, part), 'quiver', ['-2', '-3']);
      await source('context', { point: 2, dataX: 7, dataY: 6, u: -2, v: -3, value: -3 });
    }
    await state('raw', { 'segments-1': 0 });
    checks.push('Data replacement refreshes actual shafts and wings, original signed components and zero-index holes while clearing stale selections');

    for (let index = 0; index < 3; index++) {
      await page.locator('#vectors-mount').click(); await page.waitForSelector('#vectors-unmounted');
      assert.equal(await page.locator('svg').count(), 0);
      await page.locator('#vectors-mount').click(); await page.waitForSelector('#vector-context-svg');
    }
    await click('raw', segment(0), 2); await state('context', { clicks: 1 });
    checks.push('Three remount cycles preserve independent click counts and emit one selection event per click');

    await page.locator('#vector-raw').evaluate(node => { node.style.padding = '21px'; node.style.border = '7px solid #e5e9ed'; });
    await page.locator('#vector-raw-svg').evaluate(svg => { svg.style.width = '360px'; svg.style.height = '360px'; });
    await hover('raw', segment(0, 0, { perpendicularCSS: 1 }), 'quiver', ['U', 'V']);
    await source('raw', { point: 0, u: 3, v: 2 });
    await noHit('raw', segment(0, 0, { perpendicularCSS: 6 }));
    const letterbox = await page.locator('#vector-raw-svg').boundingBox();
    await page.mouse.move(letterbox.x + letterbox.width / 2, letterbox.y + 3); await state('raw', { hovered: false });
    await page.locator('#vector-raw').evaluate(node => { node.style.padding = ''; node.style.border = ''; });
    await page.locator('#vector-raw-svg').evaluate(svg => { svg.style.width = '100%'; svg.style.height = 'auto'; });
    checks.push('Physical component hit radii stay in CSS pixels through scaling, padding, border and letterboxing, with empty space excluded');

    await page.setViewportSize({ width: 375, height: 812 });
    for (const part of [0, 1, 2]) {
      await hover('context', segment(2, part), 'quiver', ['-2', '-3']);
      await source('context', { point: 2, u: -2, v: -3 });
    }
    const mobileTooltip = await tooltip('context').boundingBox(); assert(mobileTooltip.x >= 0 && mobileTooltip.x + mobileTooltip.width <= 375);
    await noHit('raw', data(3, 2)); assert(await page.evaluate(() => document.documentElement.scrollWidth <= innerWidth));
    await page.screenshot({ path: path.join(output, 'mobile.png'), fullPage: true });
    checks.push('375px mobile layout retains actual shaft and both wing metadata without page or tooltip overflow');

    await page.setViewportSize({ width: 1280, height: 950 });
    await page.locator('#vectors-update').click();
    await page.waitForFunction(() => document.querySelector('#vectors-revision')?.textContent === 'Revision 2');
    await hover('context', segment(2, 1), 'quiver', ['-3', '-2']);
    await page.screenshot({ path: path.join(output, 'vectors.png'), fullPage: true });
    assert.deepEqual(errors, []);
    const artifact = { path: compiledScript, bytes: compiled.length, sha256: createHash('sha256').update(compiled).digest('hex') };
    const report = { browser: browser.version(), artifact, checks, evidence, pageErrors: errors };
    await fs.writeFile(path.join(output, 'report.json'), JSON.stringify(report, null, 2) + '\n'); console.log(JSON.stringify(report, null, 2));
  } catch (error) {
    if (page) { await page.screenshot({ path: path.join(output, 'failure.png'), fullPage: true }).catch(() => {}); console.error(await page.locator('body').innerText().catch(() => 'Unable to read body')); }
    await fs.writeFile(path.join(output, 'failure.json'), JSON.stringify({ error: String(error), checks, evidence, pageErrors: errors }, null, 2) + '\n'); throw error;
  } finally { if (browser) await browser.close(); await new Promise(resolve => server.close(resolve)); }
}

main().catch(error => { console.error(error); process.exitCode = 1; });
