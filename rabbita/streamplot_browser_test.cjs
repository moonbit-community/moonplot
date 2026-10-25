// Actual DOM acceptance for continuous streamplot bodies and sampled fields.
// Geometry oracle uses actual written polyline segments and real plot bounds.
// Field oracle is the declared analytic grid below at the original edge midpoint;
// never production hit helpers, color decoding, integration or pointer resampling.
const assert = require('node:assert/strict');
const { createHash } = require('node:crypto');
const fs = require('node:fs/promises');
const http = require('node:http');
const path = require('node:path');
const { chromium } = require(process.env.PLAYWRIGHT_MODULE || 'playwright');
const root = path.resolve(__dirname, '..');
const target = path.resolve(process.env.MOONPLOT_STREAMPLOT_TARGET_DIR || path.join(root, '_build'));
const compiledScript = path.resolve(process.env.MOONPLOT_STREAMPLOT_JS || path.join(target, 'js/debug/build/rabbita/cmd/streamlines/streamlines.js'));
const scriptPath = '/_build/js/debug/build/rabbita/cmd/streamlines/streamlines.js';
const output = path.resolve(process.env.MOONPLOT_STREAMPLOT_OUTPUT || path.join(root, '.moonagent/checkpoints/M14-streamplot/browser'));
const checks = [], evidence = [], emptyFields = ['category', 'cell', 'error', 'band', 'fraction', 'interval', 'vector', 'box', 'violin', 'hexbin', 'tricolor'];
const near = (a, b, e = 1e-9) => assert(Number.isFinite(a) && Number.isFinite(b) && Math.abs(a - b) <= e, `${a} ≈ ${b}`);
const same = (a, b) => Math.abs(a.x - b.x) < 1e-8 && Math.abs(a.y - b.y) < 1e-8;
const middle = (a, b) => ({ x: (a.x + b.x) / 2, y: (a.y + b.y) / 2 });
const mapClient = (p, m) => ({ x: m.a * p.x + m.c * p.y + m.e, y: m.b * p.x + m.d * p.y + m.f });
function localPoint(p, m) { const d = m.a * m.d - m.b * m.c, x = p.x - m.e, y = p.y - m.f; return { x: (m.d * x - m.c * y) / d, y: (-m.b * x + m.a * y) / d }; }
function distance(p, a, b) { const dx = b.x - a.x, dy = b.y - a.y, d = dx * dx + dy * dy, t = d ? Math.max(0, Math.min(1, ((p.x - a.x) * dx + (p.y - a.y) * dy) / d)) : 0; return { distance: Math.hypot(p.x - a.x - t * dx, p.y - a.y - t * dy), t }; }
function clip(a, b, r) {
  let lo = 0, hi = 1; const dx = b.x - a.x, dy = b.y - a.y;
  for (const [p, q] of [[-dx, a.x - r.left], [dx, r.left + r.width - a.x], [-dy, a.y - r.top], [dy, r.top + r.height - a.y]]) { if (!p) { if (q < 0) return null; continue; } const t = q / p; if (p < 0) lo = Math.max(lo, t); else hi = Math.min(hi, t); if (lo > hi) return null; }
  return [{ x: a.x + lo * dx, y: a.y + lo * dy }, { x: a.x + hi * dx, y: a.y + hi * dy }];
}
function decode(raw) {
  const s = k => raw.attrs['data-' + k], n = k => Number(s(k));
  const artists = prefix => Array.from({ length: n(prefix + 'count') }, (_, i) => { const p = `${prefix}${i}-`; return { kind: s(p + 'kind'), color: s(p + 'color'), width: n(p + 'width'), fill: s(p + 'fill'), points: Array.from({ length: n(p + 'point-count') }, (_, j) => ({ x: n(`${p}point-${j}-x`), y: n(`${p}point-${j}-y`) })) }; });
  const targets = Array.from({ length: n('target-count') }, (_, i) => { const p = `target-${i}-`, num = k => n(p + k); return {
    kind: s(p + 'kind'), shape: s(p + 'shape'), hasStream: s(p + 'streamplot-present') === 'true', seed: num('seed'), edge: num('edge'), artist: num('artist'), series: s(p + 'series'), value: num('value'), u: num('u'), v: num('v'), colorPresent: s(p + 'color-present') === 'true', colorValue: s(p + 'color-value') === undefined ? null : num('color-value'),
    data: { x: num('data-x'), y: num('data-y') }, anchor: { x: num('screen-x'), y: num('screen-y') }, bounds: { left: num('left'), top: num('top'), width: num('width'), height: num('height') }, segment: [{ x: num('x0'), y: num('y0') }, { x: num('x1'), y: num('y1') }], unrelated: Object.fromEntries(emptyFields.map(k => [k, s(p + k + '-present')])) }; });
  return { ...raw, targets, paint: artists('paint-'), returnedLines: artists('returned-line-'), returnedArrows: artists('returned-arrow-'), containers: Array.from({ length: n('container-count') }, (_, i) => ({ kind: s(`container-${i}-kind`), label: s(`container-${i}-label`), artists: artists(`container-${i}-artist-`) })), revision: n('revision'), visible: s('visible') === 'true', arrows: s('arrows') === 'true', withColor: s('with-color') === 'true', radius: n('hit-radius') };
}
const sameArtist = (a, b) => a.kind === b.kind && a.color === b.color && a.fill === b.fill && a.width === b.width && a.points.length === b.points.length && a.points.every((p, i) => same(p, b.points[i]));
const svgSignature = f => JSON.stringify(f.nodes.map(n => ({ points: n.points, color: n.color, width: n.width, fill: n.fill })));
function bodySegments(f, chart) {
  return f.bodyIndices.flatMap((artist, returnedIndex) => f.nodes[artist].points.slice(0, -1).map((a, i) => ({ artist, seed: chart === 'flow' ? [0, 2][returnedIndex] : 1, edge: chart === 'flow' ? i : returnedIndex, a: mapClient(a, f.ctm), b: mapClient(f.nodes[artist].points[i + 1], f.ctm), intrinsic: [a, f.nodes[artist].points[i + 1]] })));
}
function oracle(f, chart, point) {
  const local = localPoint(point, f.ctm), r = f.plot;
  const insidePlot = local.x >= r.left && local.x <= r.left + r.width && local.y >= r.top && local.y <= r.top + r.height;
  const candidates = bodySegments(f, chart).map(s => ({ ...s, ...distance(point, s.a, s.b) })).sort((a, b) => a.distance - b.distance || b.artist - a.artist || b.edge - a.edge);
  return { local, insidePlot, nearest: candidates[0] || null, accepted: insidePlot && !!candidates[0] && candidates[0].distance <= f.radius };
}
async function main() {
  await fs.mkdir(output, { recursive: true }); const compiled = await fs.readFile(compiledScript);
  const server = http.createServer(async (request, response) => {
    try { const url = new URL(request.url, 'http://127.0.0.1'); if (url.pathname === '/favicon.ico') { response.writeHead(204); response.end(); return; }
      const filename = path.resolve(root, '.' + decodeURIComponent(url.pathname)); if (!filename.startsWith(root + path.sep)) { response.writeHead(403); response.end(); return; }
      const body = url.pathname === scriptPath ? compiled : await fs.readFile(filename); response.writeHead(200, { 'Content-Type': { '.js': 'text/javascript', '.css': 'text/css', '.html': 'text/html' }[path.extname(filename)] || 'application/octet-stream' }); response.end(body);
    } catch (_) { response.writeHead(404); response.end('Not found'); }
  });
  await new Promise(resolve => server.listen(0, '127.0.0.1', resolve)); let browser, page; const errors = [], bounds = {};
  try {
    const channel = process.env.BROWSER_CHANNEL || 'chrome'; browser = await chromium.launch({ headless: true, ...(channel === 'bundled' ? {} : { channel }) });
    page = await browser.newPage({ viewport: { width: 1280, height: 950 }, deviceScaleFactor: 1 }); page.on('pageerror', e => errors.push(String(e))); page.on('console', m => { if (m.type() === 'error') errors.push(m.text()); });
    await page.goto(`http://127.0.0.1:${server.address().port}/rabbita/streamlines.html`, { waitUntil: 'networkidle' }); await page.waitForFunction(() => document.querySelector('#streamlines-color-svg') || document.querySelector('#streamlines-error'));
    const failed = await page.locator('#streamlines-error').count(); assert.equal(failed, 0, failed ? await page.locator('#streamlines-error').innerText() : 'Both real charts render'); assert.equal(await page.locator('svg[data-moonplot-root]').count(), 2);
    assert.deepEqual(await page.evaluate(() => { const ids = [...document.querySelectorAll('[id]')].map(n => n.id); return { duplicates: ids.filter((id, i) => ids.indexOf(id) !== i), namespaced: [...document.querySelectorAll('svg,svg *')].every(n => n.namespaceURI === 'http://www.w3.org/2000/svg') }; }), { duplicates: [], namespaced: true });
    await page.evaluate(() => { window.streamEvents = []; window.streamActive = 'flow'; document.addEventListener('mousemove', e => { const svg = document.querySelector(`#streamlines-${window.streamActive}-svg`); if (!svg) return; const p = new DOMPoint(e.clientX, e.clientY).matrixTransform(svg.getScreenCTM().inverse()); window.streamEvents.push({ clientX: e.clientX, clientY: e.clientY, localX: p.x, localY: p.y }); if (window.streamEvents.length > 8) window.streamEvents.shift(); }, true); });
    checks.push('Two independent real streamplot cards render with unique namespaced SVG resources');
    const status = c => page.locator(`#streamlines-${c}-status`), tooltip = c => page.locator(`[data-testid="streamlines-${c}-tooltip"]`), legend = c => page.locator(`[data-testid="streamlines-${c}"] [data-moonplot-series="flow"]`);
    async function state(chart, expected) { try { await page.waitForFunction(({ chart, expected }) => { const n = document.querySelector(`#streamlines-${chart}-status`); return n && Object.entries(expected).every(([k, v]) => n.getAttribute('data-' + k) === String(v)); }, { chart, expected }); } catch (error) { console.error({ chart, expected, actual: await status(chart).evaluate(n => ({ ...n.dataset })) }); throw error; } }
    async function frame(chart) {
      const svg = page.locator(`#streamlines-${chart}-svg`); await svg.scrollIntoViewIfNeeded();
      const f = decode(await svg.evaluate((svg, chart) => { const s = document.querySelector(`#streamlines-${chart}-status`), m = svg.getScreenCTM(), r = svg.getBoundingClientRect(); return { attrs: Object.fromEntries([...s.attributes].map(a => [a.name, a.value])), ctm: { a: m.a, b: m.b, c: m.c, d: m.d, e: m.e, f: m.f }, rect: { x: r.x, y: r.y, width: r.width, height: r.height }, nodes: [...svg.querySelectorAll('polyline,polygon')].map(n => ({ kind: n.tagName === 'polyline' ? 'line' : 'polygon', color: n.getAttribute('stroke'), width: Number(n.getAttribute('stroke-width')), fill: n.getAttribute('fill'), points: n.getAttribute('points').trim().split(/\s+/).map(pair => { const [x, y] = pair.split(',').map(Number); return { x, y }; }) })) }; }, chart));
      if (f.targets.length) bounds[chart] = f.targets[0].bounds; f.plot = bounds[chart];
      f.bodyIndices = f.returnedLines.map(body => { const matches = f.paint.flatMap((a, i) => sameArtist(a, body) ? [i] : []); assert.equal(matches.length, 1); return matches[0]; }); return f;
    }
    async function settled(chart, expected, beforeSignature) {
      await state(chart, expected); await page.waitForFunction(({ chart, beforeSignature }) => { const svg = document.querySelector(`#streamlines-${chart}-svg`), s = document.querySelector(`#streamlines-${chart}-status`); if (!svg || !s) return false; const nodes = [...svg.querySelectorAll('polyline,polygon')]; if (nodes.length !== Number(s.getAttribute('data-paint-count'))) return false;
        const value = JSON.stringify(nodes.map(n => ({ points: n.getAttribute('points').trim().split(/\s+/).map(pair => { const [x, y] = pair.split(',').map(Number); return { x, y }; }), color: n.getAttribute('stroke'), width: Number(n.getAttribute('stroke-width')), fill: n.getAttribute('fill') }))); return beforeSignature === undefined || value !== beforeSignature;
      }, { chart, beforeSignature }); return frame(chart);
    }
    async function verify(chart) {
      const f = await frame(chart); assert.equal(f.nodes.length, f.paint.length); assert.equal(f.targets.length, f.visible ? (chart === 'flow' ? 12 : 6) : 0);
      assert.equal(f.containers.length, f.visible ? 1 : 0); if (!f.visible) return f;
      assert.equal(f.containers[0].kind, 'streamplot'); assert.equal(f.containers[0].label, chart === 'flow' ? 'Flow samples' : 'Color field'); assert.deepEqual(f.containers[0].artists, f.paint);
      assert.equal(f.returnedLines.length, chart === 'flow' ? 2 : 6); assert.equal(f.returnedArrows.length, chart === 'flow' ? (f.arrows ? 2 : 0) : 1);
      assert.equal(f.paint.length, chart === 'flow' ? (f.arrows ? 6 : 2) : 8);
      const map = p => ({ x: f.plot.left + p.x / 2 * f.plot.width, y: f.plot.top + (2 - p.y) / 2 * f.plot.height });
      f.paint.forEach((a, i) => { const n = f.nodes[i]; assert.equal(n.kind, a.kind); assert.equal(n.color, a.color); near(n.width, a.width); assert.equal(n.fill, a.kind === 'line' ? 'none' : a.fill); assert.equal(n.points.length, a.points.length); a.points.forEach((p, j) => { const q = map(p); near(q.x, n.points[j].x); near(q.y, n.points[j].y); }); });
      const segments = bodySegments(f, chart); assert.equal(segments.length, chart === 'flow' ? 12 : 6);
      assert.deepEqual(f.targets.map(t => [t.seed, t.edge]), chart === 'flow' ? [0, 2].flatMap(seed => Array.from({ length: 6 }, (_, edge) => [seed, edge])) : Array.from({ length: 6 }, (_, edge) => [1, edge]));
      for (const t of f.targets) {
        assert(t.hasStream); assert.equal(t.kind, 'streamplot'); assert.equal(t.shape, 'segment'); assert(f.bodyIndices.includes(t.artist), 'No actual arrow artist is interactive'); assert.equal(t.series, chart === 'flow' ? 'Flow samples' : 'Color field'); for (const k of emptyFields) assert.equal(t.unrelated[k], 'false');
        const body = f.paint[t.artist], localEdge = chart === 'flow' ? t.edge : 0, a = body.points[localEdge], b = body.points[localEdge + 1]; assert(a && b);
        const data = middle(a, b), originalScreen = [map(a), map(b)], visible = clip(...originalScreen, f.plot); assert(visible); visible.forEach((p, i) => { near(p.x, t.segment[i].x); near(p.y, t.segment[i].y); });
        near(t.data.x, data.x); near(t.data.y, data.y); const center = middle(...visible); near(t.anchor.x, center.x); near(t.anchor.y, center.y);
        const factor = f.revision % 2 ? 1.5 : 1, slope = f.revision % 2 ? .375 : 0, d = Math.abs(data.y - 1); near(t.u, factor * d); near(t.v, slope * d); assert.equal(t.value, t.v);
        assert.equal(t.colorPresent, chart === 'color' && f.withColor); if (t.colorPresent) near(t.colorValue, data.x + 2 * data.y + (f.revision % 2 ? 3 : 0)); else assert.equal(t.colorValue, null);
      }
      const staticArrowIndices = f.paint.flatMap((_, i) => f.bodyIndices.includes(i) ? [] : [i]); assert(staticArrowIndices.every(i => !f.targets.some(t => t.artist === i)));
      evidence.push({ phase: 'typed-stream-vs-actual-paint', chart, revision: f.revision, withColor: f.withColor, bodyIndices: f.bodyIndices, staticArrowIndices, targets: f.targets, paint: f.paint, returnedLines: f.returnedLines, returnedArrows: f.returnedArrows, nodes: f.nodes }); return f;
    }
    async function locate(chart, query) {
      const f = await frame(chart), segments = bodySegments(f, chart), candidates = [];
      if (query.client) candidates.push(query.client);
      else if (query.blank) { for (let y = .05; y < 1; y += .05) for (let x = .05; x < 1; x += .05) { const p = mapClient({ x: f.plot.left + f.plot.width * x, y: f.plot.top + f.plot.height * y }, f.ctm); candidates.push({ x: Math.round(p.x), y: Math.round(p.y) }); } }
      else for (const s of segments.filter(s => (query.seed === undefined || s.seed === query.seed) && (query.edge === undefined || s.edge === query.edge))) { const t = query.position === undefined ? .5 : query.position, p = { x: s.a.x + (s.b.x - s.a.x) * t, y: s.a.y + (s.b.y - s.a.y) * t }; for (let y = -2; y <= 2; y++) for (let x = -2; x <= 2; x++) candidates.push({ x: Math.round(p.x) + x, y: Math.round(p.y) + y }); }
      const found = candidates.map(p => ({ ...p, native: oracle(f, chart, p) })).filter(p => { const o = p.native, n = o.nearest; if (!o.insidePlot) return false; if (query.blank) return !o.accepted && n && n.distance > f.radius + 2; return o.accepted && n.distance < .6 && n.t > .1 && n.t < .9 && (query.seed === undefined || n.seed === query.seed) && (query.edge === undefined || n.edge === query.edge); });
      if (!found.length) throw Error('No actual integer event satisfies actual stroke-distance and plot conditions'); return found.sort((a, b) => query.blank ? b.native.nearest.distance - a.native.nearest.distance : a.native.nearest.distance - b.native.nearest.distance)[0];
    }
    async function staticArrowPoint(chart) {
      const f = await frame(chart), candidates = await page.locator(`#streamlines-${chart}-svg`).evaluate((svg, bodies) => {
        const nodes = [...svg.querySelectorAll('polyline,polygon')], points = [];
        nodes.forEach((n, artist) => { if (bodies.includes(artist)) return; const r = n.getBoundingClientRect(); for (let y = Math.ceil(r.y); y <= r.y + r.height; y++) for (let x = Math.ceil(r.x); x <= r.x + r.width; x++) { const local = new DOMPoint(x, y).matrixTransform(n.getScreenCTM().inverse()); const native = n.tagName === 'polygon' ? n.isPointInFill(local) : n.isPointInStroke(local); if (native) points.push({ x, y, arrowArtist: artist, geometry: n.tagName }); } }); return points;
      }, f.bodyIndices);
      const valid = candidates.map(p => ({ ...p, native: oracle(f, chart, p) })).filter(p => p.native.insidePlot && p.native.nearest && p.native.nearest.distance > f.radius + .5); assert(valid.length, 'Actual visible arrow geometry has an integer point away from every interactive body stroke'); return valid.sort((a, b) => b.native.nearest.distance - a.native.nearest.distance)[0];
    }
    async function move(chart, requested) { await page.evaluate(chart => { window.streamEvents = []; window.streamActive = chart; }, chart); await page.mouse.move(requested.x, requested.y); await page.waitForFunction(() => window.streamEvents.length > 0); const events = await page.evaluate(() => window.streamEvents), event = events.at(-1); assert.equal(event.clientX, requested.x); assert.equal(event.clientY, requested.y); assert(Number.isInteger(event.clientX) && Number.isInteger(event.clientY)); const actual = oracle(await frame(chart), chart, requested); evidence.push({ phase: 'actual-stream-mouse', chart, requested, events, actual }); return actual; }
    async function hover(chart, query, expected = {}, words = []) {
      const p = await locate(chart, query), o = await move(chart, p); assert(o.accepted); const f = await frame(chart), s = o.nearest, t = f.targets.find(t => t.artist === s.artist && t.seed === s.seed && t.edge === s.edge); assert(t);
      await state(chart, { hovered: true, kind: 'streamplot', seed: s.seed, edge: s.edge, artist: s.artist, value: t.v, u: t.u, v: t.v, 'color-present': t.colorPresent, ...expected }); await tooltip(chart).waitFor(); const raw = await status(chart).evaluate(n => Object.fromEntries([...n.attributes].map(a => [a.name, a.value])));
      for (const k of emptyFields) assert.equal(raw[`data-${k}-present`], 'false'); assert.equal(raw['data-streamplot-present'], 'true'); if (t.colorPresent) near(Number(raw['data-color-value']), t.colorValue);
      const text = await tooltip(chart).innerText(); for (const word of words) assert(text.includes(word), `${word} in ${text}`); assert(!text.includes('X:') && !text.includes('Y:') && !text.includes('magnitude'));
      evidence.push({ phase: 'actual-stream-callback', chart, raw, text }); return { ...p, target: t, text };
    }
    async function noHit(chart, query) { const p = query.arrow ? await staticArrowPoint(chart) : await locate(chart, { ...query, blank: true }), o = await move(chart, p); assert(!o.accepted); await state(chart, { hovered: false }); assert.equal(await tooltip(chart).count(), 0); return p; }
    async function visible(chart, value) { await legend(chart).click(); return settled(chart, { visible: value, 'target-count': value ? (chart === 'flow' ? 12 : 6) : 0, 'container-count': value ? 1 : 0 }); }

    let flow = await verify('flow'), color = await verify('color'); assert.deepEqual(flow.bodyIndices, [0, 3]); assert.deepEqual(color.bodyIndices, [0, 1, 2, 3, 4, 5]);
    checks.push('Actual mesh and styled paint/returns preserve complete Streamplot Containers while only body Segment targets carry semantics');
    for (const seed of [0, 2]) for (const edge of [0, 2, 5]) await hover('flow', { seed, edge }, { seed, edge, u: .5, v: 0 }, ['Flow samples', 'U', 'V']);
    const selected = await hover('flow', { seed: 2, edge: 2 }, { seed: 2 }); await page.mouse.click(selected.x, selected.y); await state('flow', { selected: true, clicks: 1 });
    checks.push('Continuous body interiors expose U/V and original seed zero/two and edge slots without endpoint aiming');
    for (const edge of [0, 2, 5]) await hover('color', { seed: 1, edge }, { seed: 1, edge }, ['流场采样', 'Color field', 'U', 'V', '颜色值']);
    checks.push('Style-split bodies keep original generated edge slots and same-midpoint genuine color scalar with Chinese formatting');
    const filledArrow = await noHit('flow', { arrow: true }), openArrow = await noHit('color', { arrow: true }); evidence.push({ phase: 'actual-native-static-arrows', filledArrow, openArrow });
    checks.push('Actual filled and open arrow geometry away from body remains static, including no generic vertex fallback or unreturned shaft targets');
    await noHit('flow', {}); await noHit('color', {}); await state('flow', { selected: true, clicks: 1 });
    checks.push('Both modes require physical stroke proximity and blank plot does not use XNearest panel snapping');
    const bodyBefore = flow.targets.map(t => ({ seed: t.seed, edge: t.edge, data: t.data, u: t.u, v: t.v }));
    await page.locator('#streamlines-arrows').click(); await settled('flow', { arrows: false, hovered: false, selected: false, 'paint-count': 2, 'target-count': 12 }); flow = await verify('flow'); assert.deepEqual(flow.targets.map(t => ({ seed: t.seed, edge: t.edge, data: t.data, u: t.u, v: t.v })), bodyBefore);
    await page.locator('#streamlines-arrows').click(); await settled('flow', { arrows: true, 'paint-count': 6 }); await verify('flow');
    checks.push('Arrow toggle preserves body samples while actual shafts and heads are removed and restored without adding semantics');
    const colorBefore = await frame('color'); await page.locator('#streamlines-color-samples').click(); await settled('color', { 'with-color': false, hovered: false, selected: false }, svgSignature(colorBefore)); color = await verify('color'); const plain = await hover('color', { seed: 1, edge: 2 }, { 'color-present': false }, ['流场采样']); assert(!plain.text.includes('颜色值'));
    await page.locator('#streamlines-color-samples').click(); await settled('color', { 'with-color': true }, svgSignature(color)); await verify('color'); await hover('color', { seed: 1, edge: 2 }, { 'color-present': true }, ['颜色值']);
    checks.push('Linewidth-only style has no color_value; restoring the genuine color grid waits for actual paint and raw scalar');
    flow = await frame('flow'); color = await frame('color'); await page.locator('#streamlines-update').click(); await settled('flow', { revision: 1, hovered: false, selected: false }, svgSignature(flow)); await settled('color', { revision: 1, hovered: false, selected: false }, svgSignature(color)); await verify('flow'); await verify('color');
    checks.push('Field and style data replacement clears stale state and waits for actual trajectory/style paint as well as new semantic frame');
    const a = await hover('color', { seed: 1, edge: 2, position: .25 }, {}, ['颜色值']), b = await hover('color', { seed: 1, edge: 2, position: .75 }); assert(Math.hypot(a.x - b.x, a.y - b.y) > 5); assert.deepEqual(a.target, b.target);
    checks.push('Different pointer locations on one real edge retain its fixed original midpoint samples instead of resampling at the pointer');
    const kept = await hover('color', { seed: 1, edge: 4 }); await page.mouse.click(kept.x, kept.y); await state('color', { selected: true, clicks: 1 }); await visible('flow', false); assert.equal((await frame('flow')).nodes.length, 0); await state('color', { selected: true, clicks: 1 }); await visible('flow', true); await visible('color', false); assert.equal((await frame('color')).nodes.length, 0); await visible('color', true); await verify('flow'); await verify('color');
    checks.push('Independent legend visibility awaits actual removal/restoration and keeps the other card selection and counters');
    for (let i = 0; i < 3; i++) { await page.locator('#streamlines-mount').click(); await page.waitForSelector('#streamlines-unmounted'); assert.equal(await page.locator('svg').count(), 0); await page.locator('#streamlines-mount').click(); await page.waitForSelector('#streamlines-color-svg'); await settled('flow', { revision: 1, 'target-count': 12 }); await settled('color', { revision: 1, 'target-count': 6 }); }
    const pick = await hover('flow', { seed: 2, edge: 3 }); await page.mouse.click(pick.x, pick.y); await state('flow', { clicks: 2, selected: true }); await state('color', { clicks: 1, selected: false });
    checks.push('Three actual remounts keep independent state with one event per physical click');
    await page.locator('#streamlines-color').evaluate(n => { n.style.padding = '21px'; n.style.border = '7px solid #e5e9ed'; }); await page.locator('#streamlines-color-svg').evaluate(n => { n.style.width = '360px'; n.style.height = '360px'; }); await hover('color', { seed: 1, edge: 3 }, {}, ['流场采样']); await noHit('color', {});
    const box = await page.locator('#streamlines-color-svg').boundingBox(), empty = { x: Math.round(box.x + box.width / 2), y: Math.round(box.y + 3) }; const letter = await move('color', empty); assert(!letter.insidePlot && !letter.accepted); await state('color', { hovered: false }); await page.locator('#streamlines-color').evaluate(n => { n.style.padding = ''; n.style.border = ''; }); await page.locator('#streamlines-color-svg').evaluate(n => { n.style.width = '100%'; n.style.height = 'auto'; });
    checks.push('Physical segment hit and blank letterbox survive actual border, padding and scale changes');
    await page.setViewportSize({ width: 375, height: 812 }); await hover('flow', { seed: 2, edge: 2 }, {}, ['U', 'V']); await hover('color', { seed: 1, edge: 4 }, {}, ['流场采样', '颜色值']); const tip = await tooltip('color').boundingBox(); assert(tip.x >= 0 && tip.x + tip.width <= 375); assert(await page.evaluate(() => document.documentElement.scrollWidth <= innerWidth)); await page.screenshot({ path: path.join(output, 'mobile.png'), fullPage: true });
    await page.setViewportSize({ width: 1280, height: 950 }); flow = await frame('flow'); color = await frame('color'); await page.locator('#streamlines-update').click(); await settled('flow', { revision: 2 }, svgSignature(flow)); await settled('color', { revision: 2 }, svgSignature(color)); await verify('flow'); await verify('color'); await hover('color', { seed: 1, edge: 3 }, {}, ['颜色值']); await page.screenshot({ path: path.join(output, 'streamlines.png'), fullPage: true });
    checks.push('375px layout retains generated field/color samples with bounded tooltips and real desktop/mobile captures');
    assert.equal(checks.length, 14); assert.deepEqual(errors, []); const artifact = { path: compiledScript, bytes: compiled.length, sha256: createHash('sha256').update(compiled).digest('hex') }, report = { browser: browser.version(), artifact, checks, evidence, pageErrors: errors }; await fs.writeFile(path.join(output, 'report.json'), JSON.stringify(report, null, 2) + '\n'); console.log(JSON.stringify({ browser: report.browser, artifact, checks, pageErrors: errors, report: path.join(output, 'report.json') }, null, 2));
  } catch (error) { if (page) { await page.screenshot({ path: path.join(output, 'failure.png'), fullPage: true }).catch(() => {}); console.error(await page.locator('body').innerText().catch(() => 'Unable to read body')); } await fs.writeFile(path.join(output, 'failure.json'), JSON.stringify({ error: String(error), checks, evidence, pageErrors: errors }, null, 2) + '\n'); throw error; }
  finally { if (browser) await browser.close(); await new Promise(resolve => server.close(resolve)); }
}
main().catch(error => { console.error(error); process.exitCode = 1; });
