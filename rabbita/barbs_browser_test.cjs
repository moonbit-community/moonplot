// Actual Barbs polyline/flag/calm geometry and original pivot-before X/Y/U/V.
// Build rabbita/cmd/barbs first; this script never builds a mocked fixture.
const assert = require('node:assert/strict');
const { createHash } = require('node:crypto');
const fs = require('node:fs/promises');
const http = require('node:http');
const path = require('node:path');
const { chromium } = require(process.env.PLAYWRIGHT_MODULE || 'playwright');
const root = path.resolve(__dirname, '..');
const target = path.resolve(process.env.MOONPLOT_BARBS_TARGET_DIR || path.join(root, '_build'));
const scriptPath = '/_build/js/debug/build/rabbita/cmd/barbs/barbs.js';
const compiledScript = path.join(target, 'js/debug/build/rabbita/cmd/barbs/barbs.js');
const output = path.resolve(process.env.MOONPLOT_BARBS_OUTPUT || path.join(root, '.moonagent/checkpoints/M10-barbs/browser'));
const checks = [], evidence = [];

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
      response.writeHead(200, { 'Content-Type': { '.js': 'text/javascript', '.css': 'text/css', '.html': 'text/html' }[path.extname(filename)] || 'application/octet-stream' }); response.end(body);
    } catch (_) { response.writeHead(404); response.end('Not found'); }
  });
  await new Promise(resolve => server.listen(0, '127.0.0.1', resolve));
  let browser, page;
  const errors = [];
  try {
    const channel = process.env.BROWSER_CHANNEL || 'chrome';
    browser = await chromium.launch({ headless: true, ...(channel === 'bundled' ? {} : { channel }) });
    page = await browser.newPage({ viewport: { width: 1280, height: 950 }, deviceScaleFactor: 1 });
    page.on('pageerror', error => errors.push(String(error)));
    page.on('console', message => { if (message.type() === 'error') errors.push(message.text()); });
    await page.goto(`http://127.0.0.1:${server.address().port}/rabbita/barbs.html`, { waitUntil: 'networkidle' });
    await page.waitForFunction(() => document.querySelector('#barb-advanced-svg') || document.querySelector('#barbs-error'));
    const failed = await page.locator('#barbs-error').count();
    assert.equal(failed, 0, failed ? await page.locator('#barbs-error').textContent() : 'Both charts render');
    assert.equal(await page.locator('svg[data-moonplot-root]').count(), 2);
    const identity = await page.evaluate(() => {
      const ids = [...document.querySelectorAll('[id]')].map(node => node.id);
      return { duplicates: ids.filter((id, i) => ids.indexOf(id) !== i),
        namespaced: [...document.querySelectorAll('svg, svg *')].every(node => node.namespaceURI === 'http://www.w3.org/2000/svg') };
    });
    assert.deepEqual(identity, { duplicates: [], namespaced: true });
    await page.evaluate(() => {
      window.barbEvents = []; window.barbActiveChart = 'basic';
      document.addEventListener('mousemove', event => {
        const svg = document.querySelector(`#barb-${window.barbActiveChart}-svg`); if (!svg) return;
        const local = new DOMPoint(event.clientX, event.clientY).matrixTransform(svg.getScreenCTM().inverse());
        window.barbEvents.push({ clientX: event.clientX, clientY: event.clientY, localX: local.x, localY: local.y });
        if (window.barbEvents.length > 8) window.barbEvents.shift();
      }, true);
    });
    checks.push('Two independent basic/options Barbs charts render real namespaced SVG with unique resources');

    const tooltip = chart => page.locator(`[data-testid="barb-${chart}-tooltip"]`);
    const status = chart => page.locator(`#barb-${chart}-status`);
    const legend = chart => page.locator(`[data-testid="barb-${chart}"] [data-moonplot-series="barbs"]`);
    async function state(chart, expected) {
      try {
        await page.waitForFunction(({ chart, expected }) => {
          const node = document.querySelector(`#barb-${chart}-status`);
          return node && Object.entries(expected).every(([key, value]) => node.dataset[key] === String(value));
        }, { chart, expected });
      } catch (error) { console.error({ chart, expected, actual: await status(chart).evaluate(n => ({ ...n.dataset })) }); throw error; }
    }
    async function position(chart, query) {
      const svg = page.locator(`#barb-${chart}-svg`); await svg.scrollIntoViewIfNeeded();
      return svg.evaluate((svg, { chart, query }) => {
        const color = chart === 'basic' ? '#398575' : '#8a70b5';
        const ctm = svg.getScreenCTM();
        const screen = p => { const q = new DOMPoint(p.x, p.y).matrixTransform(ctm); return { x: q.x, y: q.y }; };
        const points = node => node.getAttribute('points').trim().split(/\s+/).map(pair => { const [x, y] = pair.split(',').map(Number); return { x, y }; });
        const distance = (p, a, b) => {
          const dx = b.x - a.x, dy = b.y - a.y;
          const t = Math.max(0, Math.min(1, ((p.x - a.x) * dx + (p.y - a.y) * dy) / (dx * dx + dy * dy)));
          return Math.hypot(p.x - a.x - t * dx, p.y - a.y - t * dy);
        };
        let a, b;
        if (query.kind === 'line') {
          const lines = [...svg.querySelectorAll(`polyline[stroke="${color}"]`)].map(points).filter(p => p.length === 2);
          let index;
          if (chart === 'basic') index = [0, 2, 3].indexOf(query.source) * 4 + query.part;
          else {
            const changed = Number(document.querySelector('#barbs-revision').textContent.split(' ').at(-1)) % 2 === 1;
            const start = query.source === 0 ? 0 : (changed ? 2 : 3);
            const part = query.part === 'half' ? (query.source === 0 ? (changed ? 1 : 2) : (changed ? 4 : 3)) : query.part;
            index = start + part;
          }
          if (!lines[index]) throw Error('Missing actual Barbs line component');
          [a, b] = lines[index].map(screen);
        } else if (query.kind.startsWith('flag')) {
          const polygon = svg.querySelector(`polygon[fill="${color}"]`); if (!polygon) throw Error('Missing actual flag polygon');
          const localFlag = points(polygon), p = localFlag.map(screen); if (p.length !== 3) throw Error('Expected actual triangular flag');
          if (query.kind === 'flag-face') {
            const point = { x: p.reduce((s, v) => s + v.x, 0) / 3, y: p.reduce((s, v) => s + v.y, 0) / 3 };
            return { ...point, actualFlag: p, actualFlagSVG: localFlag, edgeClearanceCSS: Math.min(...p.map((v, i) => distance(point, v, p[(i + 1) % 3]))) };
          }
          if (query.kind === 'flag-corner') return { x: Math.min(...p.map(v => v.x)) + (Math.max(...p.map(v => v.x)) - Math.min(...p.map(v => v.x))) * 0.04,
            y: Math.min(...p.map(v => v.y)) + (Math.max(...p.map(v => v.y)) - Math.min(...p.map(v => v.y))) * 0.04, actualFlag: p };
          a = p[query.edge]; b = p[(query.edge + 1) % 3];
          if (query.outside) {
            const area = p.reduce((sum, v, i) => sum + v.x * p[(i + 1) % 3].y - p[(i + 1) % 3].x * v.y, 0);
            const dx = b.x - a.x, dy = b.y - a.y, length = Math.hypot(dx, dy), sign = area > 0 ? 1 : -1;
            return { x: (a.x + b.x) / 2 + sign * dy / length * 0.4, y: (a.y + b.y) / 2 - sign * dx / length * 0.4,
              screenSegment: { a, b }, actualFlag: p, outsideRequested: true };
          }
        } else if (query.kind.startsWith('circle')) {
          const circle = svg.querySelectorAll(`circle[fill="${color}"]`)[query.source - 2]; if (!circle) throw Error('Missing actual filled calm circle');
          const local = { x: Number(circle.getAttribute('cx')), y: Number(circle.getAttribute('cy')) }, r = Number(circle.getAttribute('r'));
          const center = screen(local), edge = screen({ x: local.x + r, y: local.y }), radius = Math.hypot(edge.x - center.x, edge.y - center.y);
          if (query.kind === 'circle-outside') return { x: Math.ceil(center.x + radius + 2), y: Math.round(center.y), actualCircle: { center, radius, local, r } };
          const candidates = [];
          for (let y = Math.ceil(center.y - radius); y <= Math.floor(center.y + radius); y++) {
            for (let x = Math.ceil(center.x - radius); x <= Math.floor(center.x + radius); x++) {
              const d = Math.hypot(x - center.x, y - center.y);
              if (d < radius * 0.9 && (!query.beyondPointRadius || d > 2.15)) candidates.push({ x, y, distanceFromCenterCSS: d });
            }
          }
          candidates.sort((a, b) => query.beyondPointRadius ? b.distanceFromCenterCSS - a.distanceFromCenterCSS : a.distanceFromCenterCSS - b.distanceFromCenterCSS);
          if (!candidates.length) throw Error('No actual integer mouse position inside the calm disk with requested clearance');
          return { ...candidates[0], actualCircle: { center, radius, local, r } };
        } else if (query.kind === 'data') {
          const spines = [...svg.querySelectorAll('line[stroke="#d8dfe5"]')];
          if (spines.length !== 2) throw Error('Expected actual axis spines');
          const xs = spines.flatMap(s => [Number(s.getAttribute('x1')), Number(s.getAttribute('x2'))]);
          const ys = spines.flatMap(s => [Number(s.getAttribute('y1')), Number(s.getAttribute('y2'))]);
          const left = Math.min(...xs), right = Math.max(...xs), top = Math.min(...ys), bottom = Math.max(...ys), limit = chart === 'basic' ? 8 : 14;
          return screen({ x: left + query.x / limit * (right - left), y: bottom - query.y / limit * (bottom - top) });
        } else return screen(query);
        const f = query.fraction ?? 0.55, dx = b.x - a.x, dy = b.y - a.y, length = Math.hypot(dx, dy), offset = query.perpendicularCSS || 0;
        return { x: a.x + dx * f - dy / length * offset, y: a.y + dy * f + dx / length * offset, screenSegment: { a, b } };
      }, { chart, query });
    }
    async function hover(chart, query, fragments = []) {
      const requested = await position(chart, query);
      await page.evaluate(chart => { window.barbEvents = []; window.barbActiveChart = chart; }, chart);
      await page.mouse.move(requested.x, requested.y); await page.waitForFunction(() => window.barbEvents.length > 0);
      const events = await page.evaluate(() => window.barbEvents), event = events.at(-1);
      let distanceCSS;
      if (requested.screenSegment && !query.perpendicularCSS) {
        const { a, b } = requested.screenSegment, dx = b.x - a.x, dy = b.y - a.y;
        const t = Math.max(0, Math.min(1, ((event.clientX - a.x) * dx + (event.clientY - a.y) * dy) / (dx * dx + dy * dy)));
        distanceCSS = Math.hypot(event.clientX - a.x - t * dx, event.clientY - a.y - t * dy);
        assert(distanceCSS <= 2, 'Delivered actual event is within actual component radius');
      }
      if (requested.actualCircle) {
        const { center, radius } = requested.actualCircle, d = Math.hypot(event.clientX - center.x, event.clientY - center.y);
        assert(d < radius, 'Actual delivered event is inside the painted circle');
        if (query.beyondPointRadius) assert(d > 2, 'Disk interior is selectable beyond center proximity radius');
      }
      if (requested.actualFlag) {
        const p = requested.actualFlag, signs = p.map((a, i) => {
          const b = p[(i + 1) % 3]; return (b.x - a.x) * (event.clientY - a.y) - (b.y - a.y) * (event.clientX - a.x);
        });
        const inside = signs.every(v => v >= 0) || signs.every(v => v <= 0);
        if (query.outside) assert(!inside, 'The delivered stroke event lies outside the filled flag');
        if (query.kind === 'flag-face') {
          assert(inside, 'The delivered face event lies inside the actual flag');
          const clearance = Math.min(...p.map((a, i) => {
            const b = p[(i + 1) % 3], dx = b.x - a.x, dy = b.y - a.y;
            const t = Math.max(0, Math.min(1, ((event.clientX - a.x) * dx + (event.clientY - a.y) * dy) / (dx * dx + dy * dy)));
            return Math.hypot(event.clientX - a.x - t * dx, event.clientY - a.y - t * dy);
          }));
          assert(clearance > 2, 'The actual face event selects fill beyond every stroke proximity radius');
        }
      }
      await tooltip(chart).waitFor(); assert.equal(await tooltip(chart).getAttribute('data-moonplot-kind'), 'barbs');
      const text = await tooltip(chart).innerText(); for (const fragment of fragments) assert(text.includes(fragment), `${chart}: ${fragment} in ${text}`);
      evidence.push({ phase: 'actual-barb-event', chart, query, requested, events, distanceCSS }); return requested;
    }
    async function source(chart, expected, shape) {
      await state(chart, expected); const actual = await status(chart).evaluate(node => ({ ...node.dataset }));
      for (const [observed, original] of [['dataX', 'expectedX'], ['dataY', 'expectedY'], ['u', 'expectedU'], ['v', 'expectedV'], ['series', 'expectedSeries']]) {
        assert.notEqual(actual[observed], undefined); assert.notEqual(actual[original], undefined); assert.equal(actual[observed], actual[original]);
      }
      assert.equal(actual.value, actual.v, 'Value is raw V, never rounded speed or magnitude');
      assert.equal(actual.vectorPresent, 'true'); for (const key of ['intervalPresent', 'fractionPresent', 'bandPresent']) assert.equal(actual[key], 'false');
      if (shape) { const artist = await status(chart).getAttribute(`data-${shape}-${actual.point}-artist`); assert.notEqual(artist, null); assert.equal(actual.artist, artist); }
      evidence.push({ chart, ...actual }); return actual;
    }
    async function noHit(chart, query) { const p = await position(chart, query); await page.mouse.move(p.x, p.y); await state(chart, { hovered: false }); assert.equal(await tooltip(chart).count(), 0); return p; }
    async function click(chart, query, clicks) { const p = await position(chart, query); await page.mouse.click(p.x, p.y); await state(chart, { selected: true, clicks }); }
    const line = (source, part = 0, extra = {}) => ({ kind: 'line', source, part, ...extra });
    const circle = (source = 2, beyondPointRadius = false) => ({ kind: 'circle-inside', source, beyondPointRadius });
    const face = { kind: 'flag-face' }, data = (x, y) => ({ kind: 'data', x, y });

    await state('basic', { 'segments-0': 4, 'segments-1': 0, 'segments-2': 4, 'segments-3': 4 });
    assert.equal(await page.locator('#barb-basic-svg polyline[stroke="#398575"]').count(), 12);
    for (const [index, u, v] of [[0, 2, 3], [2, -3, -2], [3, 2, -2]]) {
      const artists = new Set();
      for (const part of [0, 1, 2, 3]) { await hover('basic', line(index, part), ['Basic wind', 'X', 'Y', 'U', 'V']); artists.add((await source('basic', { point: index, u, v, value: v })).artist); }
      assert.equal(artists.size, 4, 'Actual basic components have distinct artist identities');
    }
    await click('basic', line(0), 1);
    checks.push('Basic shaft and three actual alternating feathers preserve original signed components and real component identities');

    await noHit('basic', data(3, 2)); await noHit('basic', data(1, 4.5)); await noHit('advanced', data(10, 6));
    await state('advanced', { hitMode: 'x-nearest' });
    checks.push('Zero basic input leaves its index hole and both hit modes stay physical away from actual marks');

    await state('advanced', { 'segments-0': 6, 'flags-0': 1, 'segments-1': 4, 'circles-2': 1, 'circles-3': 1 });
    assert.equal(await page.locator('#barb-advanced-svg polyline[stroke="#8a70b5"]').count(), 7);
    for (const [index, parts, u] of [[0, [0, 1, 'half'], 6.5], [1, [0, 1, 2, 'half'], -2.5]]) {
      for (const part of parts) { await hover('advanced', line(index, part), ['原始风矢量']); await source('advanced', { point: index, u, v: 0, value: 0 }); }
    }
    checks.push('Advanced actual shafts, full feathers and half feathers expose original U/V without a new public part type');

    const flag = await hover('advanced', face, ['横向 U', '6.5']); assert(flag.edgeClearanceCSS > 2);
    await source('advanced', { point: 0, dataX: 5, dataY: 3, u: 6.5, v: 0 }, 'flag');
    for (const edge of [0, 1, 2]) { await hover('advanced', { kind: 'flag-edge', edge }, ['6.5']); await source('advanced', { point: 0 }, 'flag'); }
    await hover('advanced', { kind: 'flag-edge', edge: 1, outside: true }, ['6.5']); await source('advanced', { point: 0 }, 'flag');
    await noHit('advanced', { kind: 'flag-corner' });
    await click('advanced', face, 1);
    checks.push('Real flag fill and all three actual edges select the original datum, including just outside the slanted edge, while empty bbox corners reject hits');

    const calm = await hover('advanced', circle(2, true), ['0.1', '0.2']);
    await source('advanced', { point: 2, dataX: 10, dataY: 2, u: 0.1, v: 0.2, value: 0.2 }, 'circle');
    const rawInputClient = await position('advanced', data(10, 2));
    assert(Math.hypot(calm.actualCircle.center.x - rawInputClient.x, calm.actualCircle.center.y - rawInputClient.y) > 0.5,
      'The middle-pivot actual calm center differs from the original input position');
    await hover('advanced', circle(3), ['0']); await source('advanced', { point: 3, dataX: 3, dataY: 11, u: 0, v: 0 }, 'circle');
    await noHit('advanced', { kind: 'circle-outside', source: 2 });
    checks.push('Painted calm disk interiors hit beyond point proximity and retain nonzero rounded raw vectors and original middle-pivot input positions');

    let previousCircle = calm.actualCircle.local;
    for (const expected of ['tip', 'tail', 'middle']) {
      await page.locator('#barbs-pivot').click(); await state('advanced', { pivot: expected, selected: false });
      const current = await hover('advanced', circle(2), ['0.1', '0.2']);
      await source('advanced', { point: 2, dataX: 10, dataY: 2, u: 0.1, v: 0.2 }, 'circle');
      assert.notDeepEqual(current.actualCircle.local, previousCircle, 'The actual circle moves when the anchor changes');
      previousCircle = current.actualCircle.local;
      if (expected === 'tip') {
        const input = await position('advanced', data(10, 2));
        assert(Math.hypot(current.actualCircle.center.x - input.x, current.actualCircle.center.y - input.y) < 1e-9);
      }
      if (expected === 'middle') assert.deepEqual(current.actualCircle.local, calm.actualCircle.local);
      evidence.push({ phase: 'actual-pivot-circle', pivot: expected, circle: current.actualCircle });
      await hover('advanced', face, ['6.5']); await source('advanced', { point: 0, dataX: 5, dataY: 3 }, 'flag');
    }
    await page.locator('#barbs-flip').click(); await state('advanced', { flipped: true });
    const flippedFlag = await hover('advanced', face, ['6.5']); await source('advanced', { point: 0 }, 'flag');
    assert.notDeepEqual(flippedFlag.actualFlagSVG, flag.actualFlagSVG, 'Feather flipping changes the actual flag vertices');
    await hover('advanced', line(1, 'half'), ['-2.5']); await source('advanced', { point: 1 });
    await page.locator('#barbs-flip').click(); await state('advanced', { flipped: false });
    checks.push('Middle, tip and tail anchors and feather flipping move actual marks while callback positions remain the original inputs');

    await page.locator('#barbs-calm').click(); await state('advanced', { fillEmpty: false, 'circles-2': 0, 'circles-3': 0 });
    await noHit('advanced', { kind: 'absolute', x: calm.actualCircle.local.x, y: calm.actualCircle.local.y });
    await state('basic', { selected: true, clicks: 1 });
    await page.locator('#barbs-calm').click(); await hover('advanced', circle(2), ['0.2']); await source('advanced', { point: 2 }, 'circle');
    await legend('basic').click(); await state('basic', { 'segments-0': 0, selected: false }); await noHit('basic', data(2, 2.5));
    await legend('basic').click(); await hover('basic', line(0), ['3']);
    await legend('advanced').click(); assert.equal(await page.locator('#barb-advanced-svg polygon, #barb-advanced-svg circle[fill="#8a70b5"]').count(), 0);
    await noHit('advanced', data(10, 2)); await legend('advanced').click(); await hover('advanced', face, ['6.5']);
    checks.push('Independent legends and calm visibility remove only their own targets, preserve source labels and keep the other chart state');

    await page.locator('#barbs-update').click(); await page.waitForFunction(() => document.querySelector('#barbs-revision')?.textContent === 'Revision 1');
    await state('advanced', { hovered: false, selected: false });
    await hover('basic', line(2, 2), ['-3']); await source('basic', { point: 2, u: -2, v: -3, value: -3 });
    await hover('advanced', face, ['5.5']); await source('advanced', { point: 0, u: 5.5, v: 0 }, 'flag');
    await hover('advanced', line(1, 'half'), ['-3.5']); await source('advanced', { point: 1, u: -3.5 });
    await hover('advanced', circle(2), ['0.2', '-0.1']); await source('advanced', { point: 2, u: 0.2, v: -0.1, value: -0.1 }, 'circle');
    checks.push('Data replacement updates real component geometry and raw negative V and rounded-calm values while clearing stale selections');

    for (let i = 0; i < 3; i++) { await page.locator('#barbs-mount').click(); await page.waitForSelector('#barbs-unmounted'); assert.equal(await page.locator('svg').count(), 0); await page.locator('#barbs-mount').click(); await page.waitForSelector('#barb-advanced-svg'); }
    await click('basic', line(0), 2); await state('advanced', { clicks: 1 });
    checks.push('Three remount cycles preserve independent click counts and emit one event per click');

    await page.locator('#barb-basic').evaluate(n => { n.style.padding = '21px'; n.style.border = '7px solid #e5e9ed'; });
    await page.locator('#barb-basic-svg').evaluate(n => { n.style.width = '360px'; n.style.height = '360px'; });
    await hover('basic', line(0, 0, { perpendicularCSS: 1 }), ['U', 'V']); await source('basic', { point: 0, u: 3, v: 2 });
    await noHit('basic', line(0, 0, { perpendicularCSS: 6 }));
    const box = await page.locator('#barb-basic-svg').boundingBox(); await page.mouse.move(box.x + box.width / 2, box.y + 3); await state('basic', { hovered: false });
    await page.locator('#barb-basic').evaluate(n => { n.style.padding = ''; n.style.border = ''; });
    await page.locator('#barb-basic-svg').evaluate(n => { n.style.width = '100%'; n.style.height = 'auto'; });
    checks.push('Physical line radii retain CSS-pixel behavior through padding, borders, scaling and empty letterbox space');

    await page.setViewportSize({ width: 375, height: 812 });
    await hover('advanced', face, ['5.5']); await source('advanced', { point: 0 }, 'flag');
    await hover('advanced', line(1, 'half'), ['-3.5']); await source('advanced', { point: 1 });
    await hover('advanced', circle(2), ['-0.1']); await source('advanced', { point: 2, u: 0.2, v: -0.1 }, 'circle');
    const mobileTooltip = await tooltip('advanced').boundingBox(); assert(mobileTooltip.x >= 0 && mobileTooltip.x + mobileTooltip.width <= 375);
    await noHit('basic', data(3, 2)); assert(await page.evaluate(() => document.documentElement.scrollWidth <= innerWidth));
    await page.screenshot({ path: path.join(output, 'mobile.png'), fullPage: true });
    checks.push('375px layout retains actual flag, half-feather and disk selections with raw components and no page or tooltip overflow');

    await page.setViewportSize({ width: 1280, height: 950 }); await page.locator('#barbs-update').click();
    await page.waitForFunction(() => document.querySelector('#barbs-revision')?.textContent === 'Revision 2');
    await hover('advanced', circle(2), ['0.1', '0.2']); await page.screenshot({ path: path.join(output, 'barbs.png'), fullPage: true });
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
