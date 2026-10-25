// Actual DOM acceptance for raw triangular-face values and vertex means.
// Oracle: actual Polygon isPointInFill plus actual frame plot bounds. Scalar
// and ordered vertex expectations are declared input fixtures, never color.
const assert = require('node:assert/strict');
const { createHash } = require('node:crypto');
const fs = require('node:fs/promises');
const http = require('node:http');
const path = require('node:path');
const { chromium } = require(process.env.PLAYWRIGHT_MODULE || 'playwright');
const root = path.resolve(__dirname, '..');
const target = path.resolve(process.env.MOONPLOT_TRIPCOLOR_TARGET_DIR || path.join(root, '_build'));
const compiledScript = path.resolve(process.env.MOONPLOT_TRIPCOLOR_JS || path.join(target, 'js/debug/build/rabbita/cmd/triangles/triangles.js'));
const scriptPath = '/_build/js/debug/build/rabbita/cmd/triangles/triangles.js';
const output = path.resolve(process.env.MOONPLOT_TRIPCOLOR_OUTPUT || path.join(root, '.moonagent/checkpoints/M13-tripcolor/browser'));
const checks = [], evidence = [];
const xy = [[0, 0], [2, 0], [2, 2], [0, 2], [1, 1]], faces = [[0, 1, 4], [1, 2, 4], [2, 3, 4], [3, 0, 4]];
const near = (a, b, e = 1e-8) => assert(Number.isFinite(a) && Number.isFinite(b) && Math.abs(a - b) <= e, `${a} ≈ ${b}`);
const same = (a, b) => Math.abs(a.x - b.x) <= 1e-7 && Math.abs(a.y - b.y) <= 1e-7;
const middle = (a, b) => ({ x: a.x / 2 + b.x / 2, y: a.y / 2 + b.y / 2 });
const emptyFields = ['category', 'cell', 'error', 'band', 'fraction', 'interval', 'vector', 'box', 'violin', 'hexbin'];
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
    return { kind: s(p + 'kind'), shape: s(p + 'shape'), slot: num('slot'), artist: num('artist'), series: s(p + 'series'), value: num('value'),
      vertices: [num('vertex-0'), num('vertex-1'), num('vertex-2')], vertexMean: s(p + 'vertex-mean') === 'true', hasTricolor: s(p + 'tricolor-present') === 'true',
      unrelated: Object.fromEntries(emptyFields.map(k => [k, s(p + k + '-present')])),
      data: { x: num('data-x'), y: num('data-y') }, anchor: { x: num('screen-x'), y: num('screen-y') },
      bounds: { left: num('left'), top: num('top'), width: num('width'), height: num('height') }, evenOdd: s(p + 'even-odd') === 'true',
      rings: Array.from({ length: num('ring-count') }, (_, j) => Array.from({ length: num(`ring-${j}-count`) }, (_, k) => ({ x: num(`ring-${j}-point-${k}-x`), y: num(`ring-${j}-point-${k}-y`) }))) };
  });
  return { ...raw, targets, revision: n('revision'), visible: s('visible') === 'true', masked: s('masked') === 'true', normMax: n('norm-max') };
}
const expectedValues = (chart, revision) => chart === 'faces' ? (revision % 2 ? [12, 24, 36, 48] : [10, 20, 30, 40]) : (revision % 2 ? [8, 10, 12, 10] : [5, 7, 9, 7]);
const signature = f => JSON.stringify(f.nodes.map(n => ({ points: n.points, fill: n.fill })));
const semantic = f => f.targets.map(t => ({ slot: t.slot, vertices: t.vertices, vertexMean: t.vertexMean, value: t.value, series: t.series, rings: t.rings }));

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
    page = await browser.newPage({ viewport: { width: 1280, height: 950 }, deviceScaleFactor: 1 });
    page.on('pageerror', e => errors.push(String(e))); page.on('console', m => { if (m.type() === 'error') errors.push(m.text()); });
    await page.goto(`http://127.0.0.1:${server.address().port}/rabbita/triangles.html`, { waitUntil: 'networkidle' });
    await page.waitForFunction(() => document.querySelector('#triangles-vertices-svg') || document.querySelector('#triangles-error'));
    const failed = await page.locator('#triangles-error').count(); assert.equal(failed, 0, failed ? await page.locator('#triangles-error').innerText() : 'Both real charts render');
    assert.equal(await page.locator('svg[data-moonplot-root]').count(), 2);
    assert.deepEqual(await page.evaluate(() => { const ids = [...document.querySelectorAll('[id]')].map(n => n.id); return { duplicates: ids.filter((id, i) => ids.indexOf(id) !== i), namespaced: [...document.querySelectorAll('svg, svg *')].every(n => n.namespaceURI === 'http://www.w3.org/2000/svg') }; }), { duplicates: [], namespaced: true });
    await page.evaluate(() => {
      window.triangleEvents = []; window.triangleActive = 'faces';
      document.addEventListener('mousemove', e => {
        const svg = document.querySelector(`#triangles-${window.triangleActive}-svg`); if (!svg) return;
        const p = new DOMPoint(e.clientX, e.clientY).matrixTransform(svg.getScreenCTM().inverse());
        window.triangleEvents.push({ clientX: e.clientX, clientY: e.clientY, localX: p.x, localY: p.y }); if (window.triangleEvents.length > 8) window.triangleEvents.shift();
      }, true);
    });
    checks.push('Two actual independent tripcolor cards render with unique namespaced resources');

    const tooltip = c => page.locator(`[data-testid="triangles-${c}-tooltip"]`), status = c => page.locator(`#triangles-${c}-status`), legend = c => page.locator(`[data-testid="triangles-${c}"] [data-moonplot-series="faces"]`);
    async function state(chart, expected) {
      try { await page.waitForFunction(({ chart, expected }) => { const n = document.querySelector(`#triangles-${chart}-status`); return n && Object.entries(expected).every(([k, v]) => n.getAttribute('data-' + k) === String(v)); }, { chart, expected }); }
      catch (error) { console.error({ chart, expected, actual: await status(chart).evaluate(n => ({ ...n.dataset })) }); throw error; }
    }
    async function frame(chart) {
      const svg = page.locator(`#triangles-${chart}-svg`); await svg.scrollIntoViewIfNeeded();
      const f = decode(await svg.evaluate((svg, chart) => {
        const n = document.querySelector(`#triangles-${chart}-status`), m = svg.getScreenCTM();
        const nodes = [...svg.querySelectorAll('polygon')].map(n => ({ tag: n.tagName, rule: getComputedStyle(n).fillRule, fill: n.getAttribute('fill'), strokeWidth: Number(n.getAttribute('stroke-width')), points: n.getAttribute('points').trim().split(/\s+/).map(pair => { const [x, y] = pair.split(',').map(Number); return { x, y }; }) }));
        return { attrs: Object.fromEntries([...n.attributes].map(a => [a.name, a.value])), nodes, ctm: { a: m.a, b: m.b, c: m.c, d: m.d, e: m.e, f: m.f }, clipResources: svg.querySelectorAll('clipPath,[clip-path]').length };
      }, chart));
      if (f.targets.length) knownBounds[chart] = f.targets[0].bounds; f.plot = knownBounds[chart]; return f;
    }
    // Status alone is not render completion: match actual visible Polygon count
    // and target count together. Repaints additionally wait for actual fill bytes.
    async function settled(chart, expected, beforeSignature) {
      await state(chart, expected);
      await page.waitForFunction(({ chart, beforeSignature }) => {
        const svg = document.querySelector(`#triangles-${chart}-svg`), n = document.querySelector(`#triangles-${chart}-status`); if (!svg || !n) return false;
        const nodes = [...svg.querySelectorAll('polygon')]; if (nodes.length !== Number(n.getAttribute('data-target-count'))) return false;
        const s = JSON.stringify(nodes.map(n => ({ points: n.getAttribute('points').trim().split(/\s+/).map(pair => { const [x, y] = pair.split(',').map(Number); return { x, y }; }), fill: n.getAttribute('fill') })));
        return beforeSignature === undefined || s !== beforeSignature;
      }, { chart, beforeSignature });
      return frame(chart);
    }
    async function verify(chart) {
      const f = await frame(chart); assert.equal(f.clipResources, 0); assert.equal(Number(f.attrs['data-container-count']), 0, 'Preserve actual lack of Containers');
      assert.equal(f.nodes.length, Number(f.attrs['data-artist-count'])); assert.equal(f.nodes.length, f.targets.length);
      const slots = f.visible ? (chart === 'faces' && f.masked ? [0, 2, 3] : [0, 1, 2, 3]) : [];
      assert.deepEqual(f.targets.map(t => t.slot), slots); const values = expectedValues(chart, f.revision);
      for (const item of f.targets) {
        assert.equal(item.kind, 'tripcolor'); assert.equal(item.shape, 'filled-region'); assert(item.hasTricolor); assert.equal(item.vertexMean, chart === 'vertices');
        assert.deepEqual(item.vertices, faces[item.slot]); assert.equal(item.value, values[item.slot]); assert.equal(item.series, chart === 'faces' ? 'Face values' : 'Vertex means');
        for (const flag of emptyFields) assert.equal(item.unrelated[flag], 'false', `${flag} remains absent`);
        assert.equal(item.evenOdd, false); assert.equal(item.rings.length, 1); assert.equal(item.rings[0].length, 3);
        const node = f.nodes[item.artist]; assert(node); assert.equal(node.rule, 'nonzero'); assert.equal(node.strokeWidth, 0); assert.equal(node.points.length, 3);
        const data = faces[item.slot].map(v => ({ x: xy[v][0], y: xy[v][1] }));
        const map = p => ({ x: item.bounds.left + (p.x + .25) / 2.5 * item.bounds.width, y: item.bounds.top + (2.25 - p.y) / 2.5 * item.bounds.height });
        data.forEach((p, i) => { const q = map(p); near(q.x, node.points[i].x); near(q.y, node.points[i].y); near(node.points[i].x, item.rings[0][i].x); near(node.points[i].y, item.rings[0][i].y); });
        let chosen;
        for (let i = 0; i < 3 && !chosen; i++) { const a = node.points[i], b = node.points[(i + 1) % 3]; if (same(a, b)) continue; const visible = clip(a, b, item.bounds); if (visible) chosen = { screen: middle(...visible), data: middle(data[i], data[(i + 1) % 3]) }; }
        assert(chosen); near(item.data.x, chosen.data.x); near(item.data.y, chosen.data.y); near(item.anchor.x, chosen.screen.x); near(item.anchor.y, chosen.screen.y);
      }
      evidence.push({ phase: 'typed-tricolor-vs-actual-svg', chart, revision: f.revision, normMax: f.normMax, targets: f.targets, nodes: f.nodes }); return f;
    }
    async function oracle(chart, point) {
      const f = await frame(chart);
      return page.locator(`#triangles-${chart}-svg`).evaluate((svg, { point, bounds }) => {
        const local = new DOMPoint(point.x, point.y).matrixTransform(svg.getScreenCTM().inverse());
        const fills = [...svg.querySelectorAll('polygon')].map(n => n.isPointInFill(new DOMPoint(point.x, point.y).matrixTransform(n.getScreenCTM().inverse())));
        const insidePlot = local.x >= bounds.left && local.x <= bounds.left + bounds.width && local.y >= bounds.top && local.y <= bounds.top + bounds.height;
        const [, , width, height] = svg.getAttribute('viewBox').split(/\s+/).map(Number);
        return { local: { x: local.x, y: local.y }, fills, topArtist: fills.lastIndexOf(true), insidePlot, insideViewBox: local.x >= 0 && local.y >= 0 && local.x <= width && local.y <= height };
      }, { point, bounds: f.plot });
    }
    async function locate(chart, query) {
      const f = await frame(chart);
      return page.locator(`#triangles-${chart}-svg`).evaluate((svg, { query, targets, bounds, nodes: actual }) => {
        const nodes = [...svg.querySelectorAll('polygon')], ctm = svg.getScreenCTM(), rect = svg.getBoundingClientRect();
        const all = actual.flatMap(n => n.points); const bbox = { left: Math.min(...all.map(p => p.x)), right: Math.max(...all.map(p => p.x)), top: Math.min(...all.map(p => p.y)), bottom: Math.max(...all.map(p => p.y)) };
        const candidates = [];
        if (query.client) candidates.push(query.client);
        else if (query.intrinsic) { const p = new DOMPoint(query.intrinsic.x, query.intrinsic.y).matrixTransform(ctm); candidates.push({ x: Math.round(p.x), y: Math.round(p.y) }); }
        else {
          const [, , width, height] = svg.getAttribute('viewBox').split(/\s+/).map(Number);
          for (let y = .025; y < 1; y += .025) for (let x = .025; x < 1; x += .025) { const p = new DOMPoint(x * width, y * height).matrixTransform(ctm); candidates.push({ x: Math.round(p.x), y: Math.round(p.y) }); }
        }
        const results = [];
        for (const point of candidates) {
          if (point.x <= rect.x + 1 || point.x >= rect.x + rect.width - 1 || point.y <= rect.y + 1 || point.y >= rect.y + rect.height - 1) continue;
          const p = new DOMPoint(point.x, point.y).matrixTransform(ctm.inverse());
          const fills = nodes.map(n => n.isPointInFill(new DOMPoint(point.x, point.y).matrixTransform(n.getScreenCTM().inverse()))), top = fills.lastIndexOf(true), item = targets.find(t => t.artist === top);
          const insidePlot = p.x > bounds.left && p.x < bounds.left + bounds.width && p.y > bounds.top && p.y < bounds.top + bounds.height;
          if (!query.outsidePlot && !insidePlot) continue; if (query.outsidePlot && insidePlot) continue;
          if (query.slot !== undefined && (!item || item.slot !== query.slot)) continue;
          if (query.blank && top !== -1) continue;
          if (query.insidePaintBBox && !(p.x > bbox.left && p.x < bbox.right && p.y > bbox.top && p.y < bbox.bottom)) continue;
          if (query.rightHalf && p.x <= (bbox.left + bbox.right) / 2) continue;
          if (query.bboxRejectSlot !== undefined) {
            const rejected = targets.find(t => t.slot === query.bboxRejectSlot), ring = actual[rejected.artist].points;
            if (!(p.x > Math.min(...ring.map(v => v.x)) && p.x < Math.max(...ring.map(v => v.x)) && p.y > Math.min(...ring.map(v => v.y)) && p.y < Math.max(...ring.map(v => v.y))) || fills[rejected.artist]) continue;
          }
          if (![[1, 0], [-1, 0], [0, 1], [0, -1]].every(([dx, dy]) => nodes.map(n => n.isPointInFill(new DOMPoint(point.x + dx, point.y + dy).matrixTransform(n.getScreenCTM().inverse()))).lastIndexOf(true) === top)) continue;
          results.push({ ...point, intrinsic: { x: p.x, y: p.y }, nativeFills: fills, nativeTopArtist: top, insidePlot, item });
        }
        if (!results.length) throw Error('No integer event position meets actual native triangle fill / plot constraints');
        return results[Math.floor(results.length / 2)];
      }, { query, targets: f.targets, bounds: f.plot, nodes: f.nodes });
    }
    async function move(chart, requested) {
      await page.evaluate(chart => { window.triangleEvents = []; window.triangleActive = chart; }, chart);
      await page.mouse.move(requested.x, requested.y); await page.waitForFunction(() => window.triangleEvents.length > 0);
      const events = await page.evaluate(() => window.triangleEvents), event = events.at(-1);
      assert.equal(event.clientX, requested.x); assert.equal(event.clientY, requested.y); assert(Number.isInteger(event.clientX) && Number.isInteger(event.clientY));
      const native = await oracle(chart, requested); evidence.push({ phase: 'actual-triangle-mouse-event', chart, requested, events, native }); return native;
    }
    async function hover(chart, query, expected = {}, words = []) {
      const p = await locate(chart, query), native = await move(chart, p); assert(native.insidePlot && native.topArtist >= 0);
      const f = await frame(chart), item = f.targets.find(t => t.artist === native.topArtist); assert(item);
      await state(chart, { hovered: true, kind: 'tripcolor', slot: item.slot, artist: item.artist, value: item.value, 'vertex-0': item.vertices[0], 'vertex-1': item.vertices[1], 'vertex-2': item.vertices[2], 'vertex-mean': item.vertexMean, ...expected }); await tooltip(chart).waitFor();
      const raw = await status(chart).evaluate(n => Object.fromEntries([...n.attributes].map(a => [a.name, a.value])));
      assert.equal(Number(raw['data-value']), expectedValues(chart, f.revision)[Number(raw['data-slot'])]);
      assert.deepEqual([0, 1, 2].map(i => Number(raw[`data-vertex-${i}`])), faces[Number(raw['data-slot'])]);
      assert.equal(raw['data-tricolor-present'], 'true'); for (const key of emptyFields) assert.equal(raw[`data-${key}-present`], 'false');
      const text = await tooltip(chart).innerText(); for (const word of words) assert(text.includes(word), `${word} in ${text}`);
      assert(!text.includes('X:') && !text.includes('Y:') && !text.includes('中点'));
      evidence.push({ phase: 'actual-tricolor-callback', chart, raw, text }); return p;
    }
    async function noHit(chart, query) {
      const p = await locate(chart, query), native = await move(chart, p); assert(!native.insidePlot || native.topArtist === -1);
      await state(chart, { hovered: false }); assert.equal(await tooltip(chart).count(), 0); return p;
    }
    async function visibility(chart, visible) {
      await legend(chart).click(); const count = visible ? (chart === 'faces' ? 3 : 4) : 0;
      return settled(chart, { visible, 'target-count': count, 'artist-count': count });
    }

    let faceFrame = await verify('faces'), vertexFrame = await verify('vertices');
    assert.deepEqual(faceFrame.targets.map(t => [t.slot, t.value, ...t.vertices]), [[0, 10, 0, 1, 4], [2, 30, 2, 3, 4], [3, 40, 3, 0, 4]]);
    assert.deepEqual(vertexFrame.targets.map(t => t.value), [5, 7, 9, 7]);
    checks.push('Typed raw face slots, ordered vertex tuples and means match actual nonzero three-point Polygons with zero Containers');

    for (const slot of [0, 2, 3]) await hover('faces', { slot }, { slot, value: [10, 20, 30, 40][slot] }, ['Face values', 'Value']);
    const selected = await hover('faces', { slot: 2 }, { slot: 2, value: 30 }); await page.mouse.click(selected.x, selected.y); await state('faces', { selected: true, clicks: 1 });
    checks.push('Every unmasked face exposes exact original scalar and default Value and accepts one real click');

    const corner = await hover('faces', { slot: 3, bboxRejectSlot: 0 }, { slot: 3, value: 40 }, ['Value']); assert.equal(corner.nativeFills[0], false); assert.equal(corner.nativeTopArtist, 2);
    checks.push('A face-zero bbox corner selects actual face three rather than a rectangular false hit');

    await noHit('faces', { blank: true, insidePaintBBox: true, rightHalf: true });
    await noHit('vertices', { blank: true });
    checks.push('Masked face interior and physical XNearest blank plot space do not absorb hover');

    for (const slot of [0, 1, 2, 3]) await hover('vertices', { slot }, { slot, 'vertex-mean': true }, ['顶点均值', 'Vertex means', '数值', '顶点']);
    assert.equal(vertexFrame.targets[1].value, vertexFrame.targets[3].value); assert.notDeepEqual(vertexFrame.targets[1].vertices, vertexFrame.targets[3].vertices);
    checks.push('All wrapper vertex means retain exact source tuples and equal means remain distinct source faces');

    await page.locator('#triangles-tooltip').click(); await settled('vertices', { translated: false, hovered: false, selected: false });
    await hover('vertices', { slot: 1 }, { slot: 1, value: 7 }, ['Vertex mean', 'Vertex means']);
    await page.locator('#triangles-tooltip').click(); await settled('vertices', { translated: true }); await hover('vertices', { slot: 3 }, { value: 7 }, ['顶点均值']); await state('faces', { clicks: 1, selected: true });
    checks.push('Default Vertex mean and custom Chinese formatting use the same typed value without generated XY');

    await page.locator('#triangles-mask').click(); await settled('faces', { masked: false, selected: false, hovered: false, 'target-count': 4 }); await verify('faces');
    const restored = await hover('faces', { slot: 1 }, { slot: 1, value: 20 }, ['Value']);
    await page.mouse.click(restored.x, restored.y); await state('faces', { selected: true, clicks: 2 });
    const actualBeforeMask = { point: restored.intrinsic, nativeFills: restored.nativeFills, item: restored.item };
    await page.locator('#triangles-mask').click(); await settled('faces', { masked: true, selected: false, hovered: false, 'target-count': 3 }); await verify('faces');
    const removed = await noHit('faces', { intrinsic: actualBeforeMask.point, blank: true }); evidence.push({ phase: 'actual-mask-before-after', before: actualBeforeMask, after: removed });
    checks.push('Unmask and remask use actual prior DOM fill samples, restore original face one, and clear stale selection');

    for (const chart of ['faces', 'vertices']) {
      const before = await verify(chart), beforeSemantic = semantic(before); await hover(chart, { slot: 2 }, { slot: 2 });
      await page.locator(`#triangles-${chart}-scale`).click(); const wide = await settled(chart, { 'wide-scale': true, 'norm-max': chart === 'faces' ? 100 : 30, hovered: false, selected: false }, signature(before));
      assert.deepEqual(semantic(wide), beforeSemantic); assert.notDeepEqual(wide.nodes.map(n => n.fill), before.nodes.map(n => n.fill)); await verify(chart); await hover(chart, { slot: 2 }, { slot: 2 });
      await page.locator(`#triangles-${chart}-scale`).click(); const normal = await settled(chart, { 'wide-scale': false, 'norm-max': chart === 'faces' ? 50 : 15 }, signature(wide)); assert.deepEqual(semantic(normal), beforeSemantic);
    }
    checks.push('Normalization-only repaint awaits changed actual fill bytes while preserving raw scalar, tuple and geometry');

    faceFrame = await frame('faces'); vertexFrame = await frame('vertices'); await page.locator('#triangles-update').click();
    await settled('faces', { revision: 1, hovered: false, selected: false, 'target-0-value': 12 }, signature(faceFrame)); await settled('vertices', { revision: 1, hovered: false, selected: false, 'target-0-value': 8 }, signature(vertexFrame));
    await verify('faces'); await verify('vertices'); await hover('faces', { slot: 2 }, { value: 36 }, ['Value']); await hover('vertices', { slot: 3 }, { value: 10 }, ['顶点均值']);
    checks.push('Actual data replacement clears both states and changes actual SVG paint and exact old arithmetic means');

    const keep = await hover('vertices', { slot: 2 }, { value: 12 }); await page.mouse.click(keep.x, keep.y); await state('vertices', { selected: true, clicks: 1 });
    await visibility('faces', false); assert.equal((await frame('faces')).nodes.length, 0); await state('vertices', { selected: true, clicks: 1 }); await visibility('faces', true);
    await visibility('vertices', false); assert.equal((await frame('vertices')).nodes.length, 0); await visibility('vertices', true); await verify('faces'); await verify('vertices');
    checks.push('Independent legends await real zero-Polygon removal/restoration and preserve the other card selection');

    for (let i = 0; i < 3; i++) {
      await page.locator('#triangles-mount').click(); await page.waitForSelector('#triangles-unmounted'); assert.equal(await page.locator('svg').count(), 0);
      await page.locator('#triangles-mount').click(); await page.waitForSelector('#triangles-vertices-svg'); await settled('faces', { revision: 1, visible: true, 'target-count': 3 }); await settled('vertices', { revision: 1, visible: true, 'target-count': 4 });
    }
    const pick = await hover('faces', { slot: 2 }, { value: 36 }); await page.mouse.click(pick.x, pick.y); await state('faces', { clicks: 3, selected: true }); await state('vertices', { clicks: 1, selected: false });
    checks.push('Three actual remounts retain independent counters without duplicate click listeners');

    await page.locator('#triangles-vertices').evaluate(n => { n.style.padding = '21px'; n.style.border = '7px solid #e5e9ed'; });
    await page.locator('#triangles-vertices-svg').evaluate(n => { n.style.width = '360px'; n.style.height = '360px'; });
    await hover('vertices', { slot: 2 }, { value: 12 }, ['顶点均值']); await noHit('vertices', { blank: true });
    const box = await page.locator('#triangles-vertices-svg').boundingBox(), letterbox = { x: Math.round(box.x + box.width / 2), y: Math.round(box.y + 3) };
    const emptyLetterbox = await move('vertices', letterbox); assert.equal(emptyLetterbox.insideViewBox, false); await state('vertices', { hovered: false });
    await page.locator('#triangles-vertices').evaluate(n => { n.style.padding = ''; n.style.border = ''; }); await page.locator('#triangles-vertices-svg').evaluate(n => { n.style.width = '100%'; n.style.height = 'auto'; });
    checks.push('Actual triangular fill and physical blank regions survive borders, padding, scale and empty letterbox space');

    await page.setViewportSize({ width: 375, height: 812 }); await hover('faces', { slot: 2 }, { value: 36 }, ['Value']); await hover('vertices', { slot: 3 }, { value: 10 }, ['顶点均值']);
    const tip = await tooltip('vertices').boundingBox(); assert(tip.x >= 0 && tip.x + tip.width <= 375); assert(await page.evaluate(() => document.documentElement.scrollWidth <= innerWidth));
    await page.screenshot({ path: path.join(output, 'mobile.png'), fullPage: true });
    await page.setViewportSize({ width: 1280, height: 950 }); const finalFace = await frame('faces'), finalVertex = await frame('vertices');
    await page.locator('#triangles-update').click(); await settled('faces', { revision: 2, 'target-0-value': 10 }, signature(finalFace)); await settled('vertices', { revision: 2, 'target-0-value': 5 }, signature(finalVertex)); await verify('faces'); await verify('vertices');
    await hover('vertices', { slot: 2 }, { value: 9 }, ['顶点均值']); await page.screenshot({ path: path.join(output, 'triangles.png'), fullPage: true });
    checks.push('375px layout has visible value-only tooltips and no overflow; actual desktop and mobile screenshots are saved');
    assert.equal(checks.length, 14); assert.deepEqual(errors, []);
    const artifact = { path: compiledScript, bytes: compiled.length, sha256: createHash('sha256').update(compiled).digest('hex') }, report = { browser: browser.version(), artifact, checks, evidence, pageErrors: errors };
    await fs.writeFile(path.join(output, 'report.json'), JSON.stringify(report, null, 2) + '\n'); console.log(JSON.stringify({ browser: report.browser, artifact, checks, pageErrors: errors, report: path.join(output, 'report.json') }, null, 2));
  } catch (error) {
    if (page) { await page.screenshot({ path: path.join(output, 'failure.png'), fullPage: true }).catch(() => {}); console.error(await page.locator('body').innerText().catch(() => 'Unable to read body')); }
    await fs.writeFile(path.join(output, 'failure.json'), JSON.stringify({ error: String(error), checks, evidence, pageErrors: errors }, null, 2) + '\n'); throw error;
  } finally { if (browser) await browser.close(); await new Promise(resolve => server.close(resolve)); }
}
main().catch(error => { console.error(error); process.exitCode = 1; });
