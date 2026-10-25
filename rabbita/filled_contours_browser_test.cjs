// Actual DOM acceptance for whole FilledRegion bands, holes and finite ranges.
// Scalar expectations come from declared band arguments, geometry from real SVG.
const assert = require('node:assert/strict');
const { createHash } = require('node:crypto');
const fs = require('node:fs/promises');
const http = require('node:http');
const path = require('node:path');
const { chromium } = require(process.env.PLAYWRIGHT_MODULE || 'playwright');
const root = path.resolve(__dirname, '..');
const target = path.resolve(process.env.MOONPLOT_FILLED_CONTOURS_TARGET_DIR || path.join(root, '_build'));
const compiledScript = path.join(target, 'js/debug/build/rabbita/cmd/filled_contours/filled_contours.js');
const scriptPath = '/_build/js/debug/build/rabbita/cmd/filled_contours/filled_contours.js';
const output = path.resolve(process.env.MOONPLOT_FILLED_CONTOURS_OUTPUT || path.join(root, '.moonagent/checkpoints/M12-contourf/browser'));
const checks = [], evidence = [];
const near = (a, b, e = 1e-8) => assert(Math.abs(a - b) <= e, `${a} ≈ ${b}`);
const same = (a, b) => Math.abs(a.x - b.x) <= 1e-7 && Math.abs(a.y - b.y) <= 1e-7;
const middle = (a, b) => ({ x: a.x / 2 + b.x / 2, y: a.y / 2 + b.y / 2 });
function clip(a, b, r) {
  let lo = 0, hi = 1; const dx = b.x - a.x, dy = b.y - a.y;
  for (const [p, q] of [[-dx, a.x - r.left], [dx, r.left + r.width - a.x], [-dy, a.y - r.top], [dy, r.top + r.height - a.y]]) {
    if (!p) { if (q < 0) return null; continue; }
    const t = q / p; if (p < 0) lo = Math.max(lo, t); else hi = Math.min(hi, t); if (lo > hi) return null;
  }
  return [{ x: a.x + lo * dx, y: a.y + lo * dy }, { x: a.x + hi * dx, y: a.y + hi * dy }];
}
function decode(raw) {
  const s = k => raw.attrs['data-' + k], n = k => Number(s(k));
  const targets = Array.from({ length: n('target-count') }, (_, i) => {
    const p = `target-${i}-`, num = k => n(p + k);
    return { kind: s(p + 'kind'), shape: s(p + 'shape'), slot: num('slot'), artist: num('artist'), series: s(p + 'series'), value: num('value'), interval: [num('lower'), num('upper')],
      data: { x: num('data-x'), y: num('data-y') }, anchor: { x: num('screen-x'), y: num('screen-y') }, bounds: { left: num('left'), top: num('top'), width: num('width'), height: num('height') }, evenOdd: s(p + 'even-odd') === 'true',
      rings: Array.from({ length: num('ring-count') }, (_, j) => Array.from({ length: num(`ring-${j}-count`) }, (_, k) => ({ x: num(`ring-${j}-point-${k}-x`), y: num(`ring-${j}-point-${k}-y`) }))) };
  });
  return { ...raw, targets, paths: Array.from({ length: n('returned-path-count') }, (_, i) => ({ layer: n(`returned-path-${i}-layer`), points: Array.from({ length: n(`returned-path-${i}-count`) }, (_, j) => ({ x: n(`returned-path-${i}-point-${j}-x`), y: n(`returned-path-${i}-point-${j}-y`) })) })), layers: Array.from({ length: n('returned-layer-count') }, (_, i) => n(`returned-layer-${i}`)) };
}
async function main() {
  await fs.mkdir(output, { recursive: true }); const compiled = await fs.readFile(compiledScript);
  const server = http.createServer(async (request, response) => {
    try {
      const url = new URL(request.url, 'http://127.0.0.1'); if (url.pathname === '/favicon.ico') { response.writeHead(204); response.end(); return; }
      const filename = path.resolve(root, '.' + decodeURIComponent(url.pathname)); if (!filename.startsWith(root + path.sep)) { response.writeHead(403); response.end(); return; }
      const body = url.pathname === scriptPath ? compiled : await fs.readFile(filename);
      response.writeHead(200, { 'Content-Type': { '.js': 'text/javascript', '.css': 'text/css', '.html': 'text/html' }[path.extname(filename)] || 'application/octet-stream' }); response.end(body);
    } catch (_) { response.writeHead(404); response.end('Not found'); }
  });
  await new Promise(resolve => server.listen(0, '127.0.0.1', resolve)); let browser, page; const errors = [], knownBounds = {};
  try {
    const channel = process.env.BROWSER_CHANNEL || 'chrome'; browser = await chromium.launch({ headless: true, ...(channel === 'bundled' ? {} : { channel }) });
    page = await browser.newPage({ viewport: { width: 1280, height: 950 }, deviceScaleFactor: 1 }); page.on('pageerror', e => errors.push(String(e))); page.on('console', m => { if (m.type() === 'error') errors.push(m.text()); });
    await page.goto(`http://127.0.0.1:${server.address().port}/rabbita/filled-contours.html`, { waitUntil: 'networkidle' });
    await page.waitForFunction(() => document.querySelector('#filled-islands-svg') || document.querySelector('#filled-error'));
    const failed = await page.locator('#filled-error').count(); assert.equal(failed, 0, failed ? await page.locator('#filled-error').innerText() : 'Both charts render');
    assert.equal(await page.locator('svg[data-moonplot-root]').count(), 2);
    assert.deepEqual(await page.evaluate(() => { const ids = [...document.querySelectorAll('[id]')].map(n => n.id); return { duplicates: ids.filter((id, i) => ids.indexOf(id) !== i), namespaced: [...document.querySelectorAll('svg, svg *')].every(n => n.namespaceURI === 'http://www.w3.org/2000/svg') }; }), { duplicates: [], namespaced: true });
    await page.evaluate(() => {
      window.filledEvents = []; window.filledActive = 'regular'; document.addEventListener('mousemove', e => {
        const svg = document.querySelector(`#filled-${window.filledActive}-svg`); if (!svg) return;
        const p = new DOMPoint(e.clientX, e.clientY).matrixTransform(svg.getScreenCTM().inverse()); window.filledEvents.push({ clientX: e.clientX, clientY: e.clientY, localX: p.x, localY: p.y }); if (window.filledEvents.length > 8) window.filledEvents.shift();
      }, true);
    });
    checks.push('Two real independent filled-contour SVGs render with unique namespaced resources');

    const tooltip = c => page.locator(`[data-testid="filled-${c}-tooltip"]`), status = c => page.locator(`#filled-${c}-status`), legend = c => page.locator(`[data-testid="filled-${c}"] [data-moonplot-series="bands"]`);
    async function state(chart, expected) {
      try { await page.waitForFunction(({ chart, expected }) => { const n = document.querySelector(`#filled-${chart}-status`); return n && Object.entries(expected).every(([k, v]) => n.getAttribute('data-' + k) === String(v)); }, { chart, expected }); }
      catch (error) { console.error({ chart, expected, actual: await status(chart).evaluate(n => ({ ...n.dataset })) }); throw error; }
    }
    async function frame(chart) {
      const svg = page.locator(`#filled-${chart}-svg`); await svg.scrollIntoViewIfNeeded();
      const f = decode(await svg.evaluate((svg, chart) => {
        const parse = n => {
          if (n.tagName === 'polygon') return [n.getAttribute('points').trim().split(/\s+/).map(pair => { const [x, y] = pair.split(',').map(Number); return { x, y }; })];
          const tokens = n.getAttribute('d').match(/[MLZ]|[-+]?(?:\d*\.\d+|\d+)(?:[eE][-+]?\d+)?/g); const rings = []; let ring = [], i = 0;
          while (i < tokens.length) { const command = tokens[i++]; if (command === 'M' || command === 'L') { if (command === 'M' && ring.length) { rings.push(ring); ring = []; } ring.push({ x: Number(tokens[i++]), y: Number(tokens[i++]) }); } else if (command === 'Z') { rings.push(ring); ring = []; } else throw Error('Unexpected actual path command'); }
          if (ring.length) rings.push(ring); return rings;
        };
        const status = document.querySelector(`#filled-${chart}-status`), nodes = [...svg.querySelectorAll('polygon,path')];
        const m = svg.getScreenCTM(); return { attrs: Object.fromEntries([...status.attributes].map(a => [a.name, a.value])), nodes: nodes.map(n => ({ tag: n.tagName, rule: getComputedStyle(n).fillRule, rings: parse(n) })), ctm: { a: m.a, b: m.b, c: m.c, d: m.d, e: m.e, f: m.f }, clipResources: svg.querySelectorAll('clipPath,[clip-path]').length };
      }, chart));
      if (f.targets.length) knownBounds[chart] = f.targets[0].bounds; f.plot = knownBounds[chart]; return f;
    }
    async function settled(chart, expected) {
      await state(chart, expected); await page.waitForFunction(chart => { const svg = document.querySelector(`#filled-${chart}-svg`), n = document.querySelector(`#filled-${chart}-status`); return svg.querySelectorAll('polygon,path').length === Number(n.getAttribute('data-target-count')); }, chart); return frame(chart);
    }
    async function verify(chart) {
      const f = await frame(chart); assert.equal(f.clipResources, 0, 'Legacy filled SVG does not gain fictitious axes clip resources'); assert.equal(f.nodes.length, f.targets.length);
      const limits = chart === 'regular' ? [-1.5, 1.5, -1.5, 1.5] : [-3.5, 3.5, -1.5, 1.5];
      for (const item of f.targets) {
        assert.equal(item.kind, 'contourf'); assert.equal(item.shape, 'filled-region'); assert.equal(item.series, chart === 'regular' ? 'Nested bands' : 'Island band');
        const node = f.nodes[item.artist]; assert(node); assert.equal(item.evenOdd, node.rule === 'evenodd'); assert.equal(item.rings.length, node.rings.length);
        const sources = [];
        const mapped = p => ({ x: item.bounds.left + (p.x - limits[0]) / (limits[1] - limits[0]) * item.bounds.width, y: item.bounds.top + (limits[3] - p.y) / (limits[3] - limits[2]) * item.bounds.height });
        for (let i = 0; i < item.rings.length; i++) {
          const actual = node.rings[i]; assert.equal(actual.length, item.rings[i].length); actual.forEach((p, j) => { near(p.x, item.rings[i][j].x); near(p.y, item.rings[i][j].y); });
          const source = f.paths.find(p => p.points.length === actual.length && p.points.every((v, j) => same(mapped(v), actual[j]))); assert(source, 'Actual emitted ring matches one returned generated boundary'); sources.push(source.points);
        }
        let chosen;
        for (let i = 0; i < item.rings.length && !chosen; i++) for (let j = 0; j < item.rings[i].length && !chosen; j++) {
          const ring = item.rings[i], a = ring[j], b = ring[(j + 1) % ring.length]; if (same(a, b)) continue;
          const visible = clip(a, b, item.bounds); if (visible) chosen = { screen: middle(...visible), data: middle(sources[i][j], sources[i][(j + 1) % ring.length]) };
        }
        if (chosen) { near(chosen.screen.x, item.anchor.x); near(chosen.screen.y, item.anchor.y); near(chosen.data.x, item.data.x); near(chosen.data.y, item.data.y); }
        else assert(Number.isFinite(item.data.x) && Number.isFinite(item.data.y), 'Whole-plot fallback anchors remain finite');
      }
      evidence.push({ phase: 'typed-filled-region-vs-actual-svg', chart, paths: f.paths, layers: f.layers, targets: f.targets, nodes: f.nodes }); return f;
    }
    // Native whole-element fill containment is the independent oracle. The
    // declared plot rule is checked separately; no z/scalar field is resampled.
    async function oracle(chart, point) {
      const f = await frame(chart);
      return page.locator(`#filled-${chart}-svg`).evaluate((svg, { point, bounds }) => {
        const local = new DOMPoint(point.x, point.y).matrixTransform(svg.getScreenCTM().inverse());
        const nodes = [...svg.querySelectorAll('polygon,path')], fills = nodes.map(n => n.isPointInFill(new DOMPoint(point.x, point.y).matrixTransform(n.getScreenCTM().inverse())));
        const insidePlot = local.x >= bounds.left && local.x <= bounds.left + bounds.width && local.y >= bounds.top && local.y <= bounds.top + bounds.height;
        return { local: { x: local.x, y: local.y }, fills, topArtist: fills.lastIndexOf(true), insidePlot };
      }, { point, bounds: f.plot });
    }
    async function locate(chart, query) {
      const f = await frame(chart);
      return page.locator(`#filled-${chart}-svg`).evaluate((svg, { query, targets, bounds, actualRings }) => {
        const nodes = [...svg.querySelectorAll('polygon,path')], ctm = svg.getScreenCTM(), rect = svg.getBoundingClientRect();
        const screen = p => new DOMPoint(p.x, p.y).matrixTransform(ctm);
        const bbox = nodes.length ? nodes[0].getBBox() : { x: 0, y: 0, width: 0, height: 0 };
        const candidates = [];
        if (query.intrinsic) candidates.push(query.intrinsic);
        else if (query.holeCenter !== undefined) {
          const centers = actualRings.map(r => ({ x: (Math.min(...r.map(p => p.x)) + Math.max(...r.map(p => p.x))) / 2, y: (Math.min(...r.map(p => p.y)) + Math.max(...r.map(p => p.y))) / 2 }));
          const unique = centers.filter((p, i) => centers.findIndex(q => Math.hypot(p.x - q.x, p.y - q.y) < 1e-7) === i).sort((a, b) => a.x - b.x); candidates.push(unique[query.holeCenter]);
        } else if (query.bboxCenter) candidates.push({ x: bbox.x + bbox.width / 2, y: bbox.y + bbox.height / 2 });
        else {
          const width = Number(svg.getAttribute('viewBox').split(/\s+/)[2]), height = Number(svg.getAttribute('viewBox').split(/\s+/)[3]);
          for (let y = 0.025; y < 1; y += 0.025) for (let x = 0.025; x < 1; x += 0.025) candidates.push({ x: x * width, y: y * height });
        }
        const results = [];
        for (const raw of candidates) {
          const intended = screen(raw), point = { x: Math.round(intended.x), y: Math.round(intended.y) };
          if (point.x <= rect.x + 2 || point.x >= rect.x + rect.width - 2 || point.y <= rect.y + 2 || point.y >= rect.y + rect.height - 2) continue;
          const p = new DOMPoint(point.x, point.y).matrixTransform(ctm.inverse());
          const fills = nodes.map(n => n.isPointInFill(new DOMPoint(point.x, point.y).matrixTransform(n.getScreenCTM().inverse()))), top = fills.lastIndexOf(true), item = targets.find(t => t.artist === top);
          const insidePlot = p.x > bounds.left && p.x < bounds.left + bounds.width && p.y > bounds.top && p.y < bounds.top + bounds.height;
          if (query.slot !== undefined && (!item || item.slot !== query.slot)) continue;
          if (query.side === 'left' && p.x >= bbox.x + bbox.width / 2) continue;
          if (query.side === 'right' && p.x <= bbox.x + bbox.width / 2) continue;
          if (query.blank && top !== -1) continue;
          if (query.margin ? insidePlot || top < 0 : !insidePlot) continue;
          if (query.passThrough && !(fills[0] && !fills[1] && !fills[2])) continue;
          const stableInterior = [[1, 0], [-1, 0], [0, 1], [0, -1]].every(([dx, dy]) => nodes.map(n => n.isPointInFill(new DOMPoint(point.x + dx, point.y + dy).matrixTransform(n.getScreenCTM().inverse()))).lastIndexOf(true) === top);
          if (!stableInterior) continue;
          results.push({ ...point, intrinsic: { x: p.x, y: p.y }, nativeFills: fills, nativeTopArtist: top, insidePlot, item });
        }
        if (!results.length) throw Error('No actual integer event position meets native whole-fill and plot constraints');
        return results[Math.floor(results.length / 2)];
      }, { query, targets: f.targets, bounds: f.plot, actualRings: f.nodes[0]?.rings || [] });
    }
    async function move(chart, requested) {
      await page.evaluate(chart => { window.filledEvents = []; window.filledActive = chart; }, chart); await page.mouse.move(requested.x, requested.y); await page.waitForFunction(() => window.filledEvents.length > 0);
      const events = await page.evaluate(() => window.filledEvents), event = events.at(-1); assert.equal(event.clientX, requested.x); assert.equal(event.clientY, requested.y); assert(Number.isInteger(event.clientX) && Number.isInteger(event.clientY));
      const native = await oracle(chart, requested); evidence.push({ phase: 'actual-filled-mouse-event', chart, requested, events, native }); return native;
    }
    async function hover(chart, query, expected, words = []) {
      const p = await locate(chart, query), native = await move(chart, p); assert(native.insidePlot && native.topArtist >= 0);
      const item = (await frame(chart)).targets.find(t => t.artist === native.topArtist); assert(item);
      await state(chart, { kind: 'contourf', slot: item.slot, artist: item.artist, value: item.value, lower: item.interval[0], upper: item.interval[1], ...expected }); await tooltip(chart).waitFor();
      const raw = await status(chart).evaluate(n => Object.fromEntries([...n.attributes].map(a => [a.name, a.value])));
      for (const key of ['lower', 'upper', 'value', 'series']) assert.equal(raw['data-' + key], raw['data-expected-' + key]);
      for (const key of ['category-present', 'cell-present', 'error-present', 'band-present', 'fraction-present', 'vector-present']) assert.equal(raw['data-' + key], 'false');
      const text = await tooltip(chart).innerText(); for (const word of words) assert(text.includes(word), `${word} in ${text}`); assert(!text.includes('X:') && !text.includes('Y:') && !text.includes('中点'));
      evidence.push({ phase: 'actual-filled-callback', chart, raw, text }); return p;
    }
    async function noHit(chart, query) { const p = await locate(chart, query), native = await move(chart, p); assert(!native.insidePlot || native.topArtist === -1); await state(chart, { hovered: false }); assert.equal(await tooltip(chart).count(), 0); return p; }
    async function visibility(chart, visible) { await legend(chart).click(); return settled(chart, { visible, 'target-count': visible ? (chart === 'regular' ? 3 : 1) : 0 }); }

    let regular = await verify('regular'), islands = await verify('islands');
    assert.deepEqual(regular.targets.map(t => [t.slot, ...t.interval, t.value, t.rings.length, t.evenOdd]), [[0, 0, 0.5, 0.25, 1, false], [1, 0.5, 1.5, 1, 2, true], [2, 1.5, 2, 1.75, 2, true]]);
    assert.equal(regular.paths.length, 5); assert.deepEqual(regular.layers, [0.25, 1, 1.75]); assert.equal(islands.targets[0].rings.length, 4); assert.equal(islands.paths.length, 4); assert.deepEqual(islands.layers, [1]);
    checks.push('Typed opaque regions match actual Polygon nonzero and whole Path evenodd loops without conflating returned loops and bands');

    for (const [slot, lower, upper, value] of [[0, 0, 0.5, 0.25], [1, 0.5, 1.5, 1], [2, 1.5, 2, 1.75]]) await hover('regular', { slot }, { slot, lower, upper, value }, ['Range', 'Representative', 'Nested bands']);
    checks.push('All regular under, ordinary and over bands expose exact finite ranges and representative values');

    const through = await hover('regular', { slot: 0, passThrough: true }, { slot: 0, lower: 0, upper: 0.5, value: 0.25 }, ['Range']); assert.deepEqual(through.nativeFills, [true, false, false]);
    await page.mouse.click(through.x, through.y); await state('regular', { selected: true, clicks: 1 });
    checks.push('A real normal-band hole passes through to the earlier under-band paint rather than returning the surrounding range');

    const left = await hover('islands', { slot: 0, side: 'left' }, { slot: 0, lower: 0.5, upper: 1.5, value: 1 }, ['填色等值区', '区间', '代表值']);
    const right = await hover('islands', { slot: 0, side: 'right' }, { slot: 0 }, ['Island band']); assert.equal(left.item.artist, right.item.artist);
    checks.push('Both disconnected painted annuli share one real four-loop Path and original logical band identity');

    await noHit('islands', { holeCenter: 0, blank: true }); await noHit('islands', { holeCenter: 1, blank: true }); await noHit('islands', { bboxCenter: true, blank: true });
    checks.push('Whole-Path native containment rejects both holes and the between-islands bbox gap in physical XNearest mode');

    const margin = await noHit('regular', { margin: true }); assert(margin.nativeTopArtist >= 0 && !margin.insidePlot);
    checks.push('Legacy margin remains visibly painted with no invented clip resource and stays outside panel interaction');

    await page.locator('#filled-extend').click(); await settled('regular', { extended: false, 'target-count': 1 }); regular = await verify('regular');
    assert.deepEqual(regular.targets.map(t => [t.slot, ...t.interval, t.value]), [[0, 0.5, 1.5, 1]]); await hover('regular', { slot: 0 }, { slot: 0, value: 1 }, ['Range']);
    await noHit('regular', { bboxCenter: true, blank: true });
    await page.locator('#filled-extend').click(); await settled('regular', { extended: true, 'target-count': 3 }); await verify('regular');
    checks.push('Extend toggling rebuilds actual bands and their logical color slots while a removed under fill leaves a real empty center');

    await hover('islands', { slot: 0, side: 'left' }, { slot: 0 });
    const beforeMaskSamples = await page.locator('#filled-islands-svg').evaluate(svg => {
      const node = svg.querySelector('path,polygon'), box = node.getBBox(), out = [];
      for (let y = box.y; y < box.y + box.height; y += 3) for (let x = box.x; x < box.x + box.width / 2; x += 3) {
        if ([[0, 0], [2, 0], [-2, 0], [0, 2], [0, -2]].every(([dx, dy]) => node.isPointInFill(new DOMPoint(x + dx, y + dy)))) out.push({ x, y });
      }
      return out;
    });
    await page.locator('#filled-mask').click(); await settled('islands', { masked: true }); islands = await verify('islands');
    const removed = await page.locator('#filled-islands-svg').evaluate((svg, actualBeforeSamples) => {
      const node = svg.querySelector('path,polygon');
      // Every candidate was tested on the real original DOM element before
      // masking. Compare only with the real replacement element, without
      // constructing a surrogate path or resampling a scalar field.
      const out = actualBeforeSamples.filter(({ x, y }) => [[0, 0], [2, 0], [-2, 0], [0, 2], [0, -2]].every(([dx, dy]) => !node.isPointInFill(new DOMPoint(x + dx, y + dy))));
      if (!out.length) throw Error('No actual removed-face interior found'); return out[Math.floor(out.length / 2)];
    }, beforeMaskSamples);
    evidence.push({ phase: 'actual-native-before-after-mask', beforeMaskSamples, removed });
    await noHit('islands', { intrinsic: removed, blank: true }); await state('regular', { clicks: 1 });
    await page.locator('#filled-mask').click(); await settled('islands', { masked: false }); await hover('islands', { intrinsic: removed, slot: 0 }, { slot: 0 });
    checks.push('Mask removes an actual previously written filled face while preserving the other chart count and restoring the real region');

    await page.locator('#filled-update').click(); await page.waitForFunction(() => document.querySelector('#filled-revision')?.textContent === 'Revision 1');
    await state('regular', { hovered: false, selected: false }); await state('islands', { hovered: false, selected: false });
    regular = await verify('regular'); assert.deepEqual(regular.targets.map(t => [t.slot, ...t.interval, t.value]), [[1, 0.5, 1.5, 1], [2, 1.5, 2.5, 2], [3, 2.5, 3.5, 3]]);
    assert.deepEqual(regular.layers, [1, 2, 3]); assert.equal(regular.paths.length, 5);
    await hover('regular', { slot: 2 }, { slot: 2, lower: 1.5, upper: 2.5, value: 2 }, ['Representative']); await hover('islands', { slot: 0 }, { lower: 1.5, upper: 2.5, value: 2 }, ['区间']);
    checks.push('Data replacement preserves empty under/over slots zero and four while emitted bands retain original logical slots one through three');

    await visibility('regular', false); assert.equal((await frame('regular')).nodes.length, 0); await state('islands', { clicks: 0 }); await visibility('regular', true);
    await visibility('islands', false); assert.equal((await frame('islands')).nodes.length, 0); await visibility('islands', true);
    const pick = await hover('islands', { slot: 0 }, { value: 2 }); await page.mouse.click(pick.x, pick.y); await state('islands', { selected: true, clicks: 1 });
    checks.push('Independent legends await complete region removal and restoration and retain other-chart state');

    for (let i = 0; i < 3; i++) { await page.locator('#filled-mount').click(); await page.waitForSelector('#filled-unmounted'); assert.equal(await page.locator('svg').count(), 0); await page.locator('#filled-mount').click(); await page.waitForSelector('#filled-islands-svg'); await settled('regular', { visible: true, 'target-count': 3 }); }
    const regularClick = await hover('regular', { slot: 2 }, { value: 2 }); await page.mouse.click(regularClick.x, regularClick.y); await state('regular', { clicks: 2 }); await state('islands', { clicks: 1 });
    checks.push('Three real remounts preserve independent counters with one event per actual click');

    await page.locator('#filled-islands').evaluate(n => { n.style.padding = '21px'; n.style.border = '7px solid #e5e9ed'; }); await page.locator('#filled-islands-svg').evaluate(n => { n.style.width = '360px'; n.style.height = '360px'; });
    await hover('islands', { slot: 0 }, { value: 2 }, ['区间']); await noHit('islands', { holeCenter: 0, blank: true });
    const box = await page.locator('#filled-islands-svg').boundingBox(); await page.mouse.move(box.x + box.width / 2, box.y + 3); await state('islands', { hovered: false });
    await page.locator('#filled-islands').evaluate(n => { n.style.padding = ''; n.style.border = ''; }); await page.locator('#filled-islands-svg').evaluate(n => { n.style.width = '100%'; n.style.height = 'auto'; });
    checks.push('Actual fill containment and real holes stay correct through borders, padding, scaling and empty letterbox space');

    await page.setViewportSize({ width: 375, height: 812 }); await hover('regular', { slot: 2 }, { value: 2 }, ['Range', 'Representative']); await hover('islands', { slot: 0 }, { value: 2 }, ['填色等值区']);
    const tip = await tooltip('islands').boundingBox(); assert(tip.x >= 0 && tip.x + tip.width <= 375); assert(await page.evaluate(() => document.documentElement.scrollWidth <= innerWidth));
    await page.screenshot({ path: path.join(output, 'mobile.png'), fullPage: true }); checks.push('375px layout retains native whole-region selection with range-only tooltips and no page overflow');
    await page.setViewportSize({ width: 1280, height: 950 }); await page.locator('#filled-update').click(); await page.waitForFunction(() => document.querySelector('#filled-revision')?.textContent === 'Revision 2');
    await hover('islands', { slot: 0 }, { value: 1 }, ['代表值']); await page.screenshot({ path: path.join(output, 'filled-contours.png'), fullPage: true }); assert.deepEqual(errors, []);
    const artifact = { path: compiledScript, bytes: compiled.length, sha256: createHash('sha256').update(compiled).digest('hex') }, report = { browser: browser.version(), artifact, checks, evidence, pageErrors: errors };
    await fs.writeFile(path.join(output, 'report.json'), JSON.stringify(report, null, 2) + '\n'); console.log(JSON.stringify(report, null, 2));
  } catch (error) {
    if (page) { await page.screenshot({ path: path.join(output, 'failure.png'), fullPage: true }).catch(() => {}); console.error(await page.locator('body').innerText().catch(() => 'Unable to read body')); }
    await fs.writeFile(path.join(output, 'failure.json'), JSON.stringify({ error: String(error), checks, evidence, pageErrors: errors }, null, 2) + '\n'); throw error;
  } finally { if (browser) await browser.close(); await new Promise(resolve => server.close(resolve)); }
}
main().catch(error => { console.error(error); process.exitCode = 1; });
