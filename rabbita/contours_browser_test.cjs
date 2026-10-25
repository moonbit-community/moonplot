// Actual DOM acceptance for contour levels, generated path slots and inline gaps.
// Build rabbita/cmd/contours first. Read real SVG edges and typed frame metadata.
const assert = require('node:assert/strict');
const { createHash } = require('node:crypto');
const fs = require('node:fs/promises');
const http = require('node:http');
const path = require('node:path');
const { chromium } = require(process.env.PLAYWRIGHT_MODULE || 'playwright');
const root = path.resolve(__dirname, '..');
const target = path.resolve(process.env.MOONPLOT_CONTOURS_TARGET_DIR || path.join(root, '_build'));
const compiledScript = path.join(target, 'js/debug/build/rabbita/cmd/contours/contours.js');
const scriptPath = '/_build/js/debug/build/rabbita/cmd/contours/contours.js';
const output = path.resolve(process.env.MOONPLOT_CONTOURS_OUTPUT || path.join(root, '.moonagent/checkpoints/M11-contour/browser'));
const checks = [], evidence = [];
const near = (a, b, tolerance = 1e-8) => assert(Math.abs(a - b) <= tolerance, `${a} ≈ ${b}`);
const same = (a, b) => Math.abs(a.x - b.x) <= 1e-7 && Math.abs(a.y - b.y) <= 1e-7;
const midpoint = (a, b) => ({ x: a.x / 2 + b.x / 2, y: a.y / 2 + b.y / 2 });
const screen = (m, p) => ({ x: m.a * p.x + m.c * p.y + m.e, y: m.b * p.x + m.d * p.y + m.f });
function distance(p, a, b) {
  const dx = b.x - a.x, dy = b.y - a.y;
  const t = dx || dy ? Math.max(0, Math.min(1, ((p.x - a.x) * dx + (p.y - a.y) * dy) / (dx * dx + dy * dy))) : 0;
  return Math.hypot(p.x - a.x - t * dx, p.y - a.y - t * dy);
}
// Independent clipping of an actual SVG line against actual target bounds.
// This validates the screen anchor; it does not construct contour geometry.
function clipped(a, b, bounds) {
  let lo = 0, hi = 1;
  const dx = b.x - a.x, dy = b.y - a.y;
  for (const [p, q] of [[-dx, a.x - bounds.left], [dx, bounds.left + bounds.width - a.x], [-dy, a.y - bounds.top], [dy, bounds.top + bounds.height - a.y]]) {
    if (!p) { if (q < 0) return null; continue; }
    const r = q / p;
    if (p < 0) lo = Math.max(lo, r); else hi = Math.min(hi, r);
    if (lo > hi) return null;
  }
  return [{ x: a.x + lo * dx, y: a.y + lo * dy }, { x: a.x + hi * dx, y: a.y + hi * dy }];
}
function read(raw) {
  const get = key => raw.attrs['data-' + key], num = key => Number(get(key));
  const paths = Array.from({ length: num('path-count') }, (_, i) => ({ slot: i, level: num(`path-${i}-level`),
    points: Array.from({ length: num(`path-${i}-count`) }, (_, j) => ({ x: num(`path-${i}-point-${j}-x`), y: num(`path-${i}-point-${j}-y`) })) }));
  const targets = Array.from({ length: num('target-count') }, (_, i) => {
    const key = `target-${i}-`, n = suffix => num(key + suffix);
    return { index: i, kind: get(key + 'kind'), shape: get(key + 'shape'), slot: n('slot'), artist: n('artist'), value: n('value'), series: get(key + 'series'),
      data: { x: n('data-x'), y: n('data-y') }, anchor: { x: n('screen-x'), y: n('screen-y') },
      a: { x: n('x0'), y: n('y0') }, b: { x: n('x1'), y: n('y1') },
      bounds: { left: n('left'), top: n('top'), width: n('width'), height: n('height') } };
  });
  const edges = raw.lines.flatMap((line, lineIndex) => line.slice(1).map((p, i) => ({ line: lineIndex, edge: i, a: line[i], b: p })));
  return { ...raw, paths, targets, edges };
}
function emitted(frame, item) {
  const match = frame.edges.find(e => (same(e.a, item.a) && same(e.b, item.b)) || (same(e.b, item.a) && same(e.a, item.b)));
  assert(match, 'Typed Segment matches a numeric edge of the actual emitted SVG polyline'); return match;
}

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
    await page.goto(`http://127.0.0.1:${server.address().port}/rabbita/contours.html`, { waitUntil: 'networkidle' });
    await page.waitForFunction(() => document.querySelector('#contour-triangle-svg') || document.querySelector('#contours-error'));
    const failed = await page.locator('#contours-error').count();
    assert.equal(failed, 0, failed ? await page.locator('#contours-error').textContent() : 'Both charts render');
    assert.equal(await page.locator('svg[data-moonplot-root]').count(), 2);
    const identity = await page.evaluate(() => {
      const ids = [...document.querySelectorAll('[id]')].map(n => n.id);
      return { duplicates: ids.filter((id, i) => ids.indexOf(id) !== i), namespaced: [...document.querySelectorAll('svg, svg *')].every(n => n.namespaceURI === 'http://www.w3.org/2000/svg') };
    });
    assert.deepEqual(identity, { duplicates: [], namespaced: true });
    await page.evaluate(() => {
      window.contourEvents = []; window.contourActiveChart = 'regular';
      document.addEventListener('mousemove', event => {
        const svg = document.querySelector(`#contour-${window.contourActiveChart}-svg`); if (!svg) return;
        const local = new DOMPoint(event.clientX, event.clientY).matrixTransform(svg.getScreenCTM().inverse());
        window.contourEvents.push({ clientX: event.clientX, clientY: event.clientY, localX: local.x, localY: local.y });
        if (window.contourEvents.length > 8) window.contourEvents.shift();
      }, true);
    });
    checks.push('Two independent real contour SVGs render with namespaced elements and unique resources');

    const tooltip = chart => page.locator(`[data-testid="contour-${chart}-tooltip"]`);
    const status = chart => page.locator(`#contour-${chart}-status`);
    const legend = (chart, name) => page.locator(`[data-testid="contour-${chart}"] [data-moonplot-series="${name}"]`);
    async function state(chart, expected) {
      try {
        await page.waitForFunction(({ chart, expected }) => {
          const node = document.querySelector(`#contour-${chart}-status`);
          return node && Object.entries(expected).every(([key, value]) => node.getAttribute('data-' + key) === String(value));
        }, { chart, expected });
      } catch (error) { console.error({ chart, expected, actual: await status(chart).evaluate(n => ({ ...n.dataset })) }); throw error; }
    }
    async function frame(chart) {
      const svg = page.locator(`#contour-${chart}-svg`); await svg.scrollIntoViewIfNeeded();
      return read(await svg.evaluate((svg, chart) => {
        const color = chart === 'regular' ? '#398575' : '#8a70b5', status = document.querySelector(`#contour-${chart}-status`);
        const points = node => node.getAttribute('points').trim().split(/\s+/).map(pair => { const [x, y] = pair.split(',').map(Number); return { x, y }; });
        const spines = [...svg.querySelectorAll('line[stroke="#d8dfe5"]')];
        const xs = spines.flatMap(n => [Number(n.getAttribute('x1')), Number(n.getAttribute('x2'))]);
        const ys = spines.flatMap(n => [Number(n.getAttribute('y1')), Number(n.getAttribute('y2'))]);
        const m = svg.getScreenCTM();
        return { attrs: Object.fromEntries([...status.attributes].map(a => [a.name, a.value])), lines: [...svg.querySelectorAll(`polyline[stroke="${color}"]`)].map(points),
          ctm: { a: m.a, b: m.b, c: m.c, d: m.d, e: m.e, f: m.f },
          plot: { left: Math.min(...xs), top: Math.min(...ys), width: Math.max(...xs) - Math.min(...xs), height: Math.max(...ys) - Math.min(...ys) } };
      }, chart));
    }
    function toData(chart, f, p) {
      const [xmin, xmax, ymin, ymax] = chart === 'regular' ? [9, 41, -4, 9] : [0.25, 1.75, -0.1, 2.1];
      return { x: xmin + (p.x - f.plot.left) / f.plot.width * (xmax - xmin), y: ymax - (p.y - f.plot.top) / f.plot.height * (ymax - ymin) };
    }
    function fromData(chart, f, p) {
      const [xmin, xmax, ymin, ymax] = chart === 'regular' ? [9, 41, -4, 9] : [0.25, 1.75, -0.1, 2.1];
      return { x: f.plot.left + (p.x - xmin) / (xmax - xmin) * f.plot.width, y: f.plot.top + (ymax - p.y) / (ymax - ymin) * f.plot.height };
    }
    async function verify(chart) {
      const f = await frame(chart), contours = f.targets.filter(t => t.kind === 'contour');
      let clippedAnchors = 0;
      for (const item of contours) {
        assert.equal(item.shape, 'segment'); assert(f.paths[item.slot], 'Original generated path slot exists');
        assert.equal(item.value, f.paths[item.slot].level); assert.equal(item.series, chart === 'regular' ? 'Field levels' : 'Mesh levels');
        const edge = emitted(f, item), visible = clipped(edge.a, edge.b, item.bounds); assert(visible);
        const anchor = midpoint(...visible); near(anchor.x, item.anchor.x); near(anchor.y, item.anchor.y);
        const originalMidpoint = midpoint(toData(chart, f, edge.a), toData(chart, f, edge.b));
        near(originalMidpoint.x, item.data.x); near(originalMidpoint.y, item.data.y);
        const path = f.paths[item.slot].points;
        assert(path.slice(1).some((b, i) => distance(item.data, path[i], b) < 1e-8), 'Generated anchor belongs to its original returned path');
        if (!same(midpoint(edge.a, edge.b), anchor)) clippedAnchors++;
      }
      evidence.push({ phase: 'typed-frame-vs-actual-svg', chart, paths: f.paths, targets: f.targets, clippedAnchors });
      return { ...f, clippedAnchors };
    }
    function targetDistance(f, item, point) {
      if (item.shape === 'point') { const p = screen(f.ctm, item.anchor); return Math.hypot(point.x - p.x, point.y - p.y); }
      const visible = clipped(item.a, item.b, item.bounds); return visible ? distance(point, ...visible.map(p => screen(f.ctm, p))) : Infinity;
    }
    function candidate(f, item, perpendicularCSS = 0) {
      const edge = emitted(f, item), visible = clipped(edge.a, edge.b, item.bounds); assert(visible);
      const [a, b] = visible.map(p => screen(f.ctm, p)), dx = b.x - a.x, dy = b.y - a.y, length = Math.hypot(dx, dy);
      const options = [];
      for (const fraction of [0.5, 0.35, 0.65, 0.2, 0.8]) {
        const p = { x: a.x + dx * fraction - dy / length * perpendicularCSS, y: a.y + dy * fraction + dx / length * perpendicularCSS };
        for (let ox = -1; ox <= 1; ox++) for (let oy = -1; oy <= 1; oy++) {
          const q = { x: Math.round(p.x) + ox, y: Math.round(p.y) + oy }, own = distance(q, a, b);
          const others = Math.min(...f.targets.filter(t => t.index !== item.index).map(t => targetDistance(f, t, q)));
          if ((!perpendicularCSS && own < 1) || (perpendicularCSS && Math.abs(own - Math.abs(perpendicularCSS)) < 0.5)) {
            if (others > own + 0.2) options.push({ ...q, own, others, screenSegment: { a, b }, item, intrinsicEdge: edge });
          }
        }
      }
      options.sort((x, y) => perpendicularCSS ? Math.abs(x.own - Math.abs(perpendicularCSS)) - Math.abs(y.own - Math.abs(perpendicularCSS)) : x.own - y.own);
      assert(options.length, 'Actual SVG edge has an unambiguous integer event position'); return options[0];
    }
    async function move(chart, requested) {
      await page.evaluate(chart => { window.contourEvents = []; window.contourActiveChart = chart; }, chart);
      await page.mouse.move(requested.x, requested.y); await page.waitForFunction(() => window.contourEvents.length > 0);
      const events = await page.evaluate(() => window.contourEvents); const event = events.at(-1);
      assert(Number.isInteger(event.clientX) && Number.isInteger(event.clientY));
      evidence.push({ phase: 'actual-contour-mouse-event', chart, requested, events }); return event;
    }
    async function observed(chart, expected, fragments = []) {
      await state(chart, expected); await tooltip(chart).waitFor();
      const text = await tooltip(chart).innerText(); for (const word of fragments) assert(text.includes(word), `${word} in ${text}`);
      const raw = await status(chart).evaluate(n => Object.fromEntries([...n.attributes].map(a => [a.name, a.value])));
      if (expected.kind === 'contour') {
        assert.equal(raw['data-value'], raw['data-expected-level']); assert.equal(raw['data-series'], raw['data-expected-series']);
        for (const key of ['cell-present', 'error-present', 'band-present', 'fraction-present', 'vector-present', 'interval-present']) assert.equal(raw['data-' + key], 'false');
      }
      evidence.push({ phase: 'actual-callback', chart, raw });
    }
    async function hover(chart, options = {}, fragments = []) {
      const f = await frame(chart);
      const item = f.targets.find(t => t.kind === 'contour' && (options.slot === undefined || t.slot === options.slot) && (options.artist === undefined || t.artist === options.artist) && (!options.predicate || options.predicate(t)));
      assert(item, 'Expected actual typed contour segment'); const p = candidate(f, item, options.perpendicularCSS || 0);
      const event = await move(chart, p); assert(distance({ x: event.clientX, y: event.clientY }, p.screenSegment.a, p.screenSegment.b) <= 2);
      await observed(chart, { kind: 'contour', slot: item.slot, artist: item.artist, value: item.value, 'data-x': item.data.x, 'data-y': item.data.y, 'screen-x': item.anchor.x, 'screen-y': item.anchor.y }, fragments);
      return p;
    }
    async function ordinary(chart) {
      const f = await frame(chart), item = f.targets.find(t => t.kind === 'line' && t.slot === 0); assert(item);
      const p = screen(f.ctm, item.anchor); await move(chart, { x: Math.round(p.x), y: Math.round(p.y), item });
      await observed(chart, { kind: 'line', series: 'Reference', slot: 0, artist: item.artist, value: chart === 'regular' ? 7 : 1.8 }, chart === 'regular' ? ['Reference'] : ['参考线']);
      return item.artist;
    }
    async function noHit(chart, local) {
      const f = await frame(chart), p = screen(f.ctm, local), requested = { x: Math.round(p.x), y: Math.round(p.y), intrinsic: local };
      const clearance = Math.min(...f.targets.map(t => targetDistance(f, t, requested))); assert(clearance > 2, `Actual negative event clearance ${clearance} > CSS radius2`);
      await move(chart, { ...requested, clearance }); await state(chart, { hovered: false }); assert.equal(await tooltip(chart).count(), 0);
    }
    async function toggle(chart, name, visible) {
      await legend(chart, name).click(); await state(chart, { [name + '-visible']: visible });
      await page.waitForFunction(({ chart, name, visible }) => {
        const n = document.querySelector(`#contour-${chart}-status`), count = Number(n.getAttribute('data-target-count'));
        const kinds = Array.from({ length: count }, (_, i) => n.getAttribute(`data-target-${i}-kind`));
        return visible ? kinds.includes(name === 'reference' ? 'line' : 'contour') : !kinds.includes(name === 'reference' ? 'line' : 'contour');
      }, { chart, name, visible });
    }

    let regular = await verify('regular'); assert.deepEqual(regular.paths.map(p => p.level), [0.5, 1.5, 1.5, 2.5]);
    checks.push('Typed level and original path slots match returned generated paths and each emitted SVG edge midpoint');
    for (const item of [...new Map(regular.targets.filter(t => t.kind === 'contour').map(t => [t.artist, t])).values()]) {
      await hover('regular', { slot: item.slot, artist: item.artist }, ['Level', 'Field levels']);
    }
    checks.push('Every regular inline fragment exposes its original exact scalar level and call series across disconnected same-level paths');

    const firstSlot = regular.targets.filter(t => t.kind === 'contour' && t.slot === 0), fragments = [...new Set(firstSlot.map(t => t.artist))]; assert.equal(fragments.length, 2);
    const endpoints = fragments.map(artist => {
      const lineIndex = emitted(regular, firstSlot.find(t => t.artist === artist)).line, p = regular.lines[lineIndex]; return [p[0], p.at(-1)];
    });
    const gaps = endpoints[0].flatMap(a => endpoints[1].map(b => ({ a, b, d: Math.hypot(a.x - b.x, a.y - b.y) }))).sort((a, b) => a.d - b.d);
    const gap = midpoint(gaps[0].a, gaps[0].b); await noHit('regular', gap);
    await page.locator('#contours-labels').click(); await state('regular', { inline: false }); regular = await verify('regular');
    assert.equal(new Set(regular.targets.filter(t => t.kind === 'contour' && t.slot === 0).map(t => t.artist)).size, 1);
    const restored = regular.targets.find(t => t.kind === 'contour' && t.slot === 0 && distance(gap, t.a, t.b) < 1e-7); assert(restored);
    await hover('regular', { slot: 0 }, ['Level', '0.5']);
    checks.push('Inline fragments retain one original path slot and erased SVG gaps reject hits; rebuilding with overlaid labels restores the real line');

    const plainReference = await ordinary('regular');
    await page.locator('#contours-labels').click(); await state('regular', { inline: true }); regular = await verify('regular');
    const inlineReference = await ordinary('regular'); assert.notEqual(plainReference, inlineReference);
    checks.push('Same-color ordinary Line retains its own raw source values and label through actual inline artist-index shifts');

    let tri = await verify('triangle'); assert.equal(tri.paths.length, 2); assert(tri.clippedAnchors > 0);
    await hover('triangle', { slot: 0 }, ['等值线', 'Mesh levels', '等值', '1']);
    await hover('triangle', { slot: 1 }, ['等值线', '3']);
    checks.push('Triangular levels preserve original path slots and clip-before data midpoints separately from visible clipped screen anchors');

    await toggle('triangle', 'reference', false); await noHit('triangle', fromData('triangle', await frame('triangle'), { x: 0.6, y: 1.5 }));
    await noHit('regular', fromData('regular', await frame('regular'), { x: 38, y: 8 }));
    const clicked = await hover('regular', { slot: 0 }); await page.mouse.click(clicked.x, clicked.y); await state('regular', { selected: true, clicks: 1 });
    checks.push('Both hit modes remain physical on contour-only blank regions without a generated-point or panel-X fallback');

    await page.locator('#contours-mask').click(); await state('triangle', { masked: false }); tri = await verify('triangle');
    const newlyVisible = tri.targets.find(t => t.kind === 'contour' && t.data.x < 0.5); assert(newlyVisible);
    const missing = midpoint(...clipped(newlyVisible.a, newlyVisible.b, newlyVisible.bounds));
    await hover('triangle', { slot: newlyVisible.slot, artist: newlyVisible.artist, predicate: t => t.data.x < 0.5 }, ['等值线']);
    await page.locator('#contours-mask').click(); await state('triangle', { masked: true }); await noHit('triangle', missing); await state('regular', { selected: true, clicks: 1 });
    checks.push('Mask toggling adds and removes the actual missing-face edge and preserves the other chart selection');

    await toggle('triangle', 'contour', false); await state('triangle', { 'target-count': 0, 'path-count': 0 });
    assert.equal((await frame('triangle')).lines.length, 0); await state('regular', { selected: true });
    await toggle('triangle', 'contour', true); await toggle('triangle', 'reference', true); await ordinary('triangle');
    await toggle('regular', 'contour', false); assert((await frame('regular')).targets.every(t => t.kind === 'line' && t.series === 'Reference')); await ordinary('regular');
    await toggle('regular', 'contour', true); const triClick = await hover('triangle', { slot: 0 }); await page.mouse.click(triClick.x, triClick.y); await state('triangle', { selected: true, clicks: 1 });
    checks.push('Independent contour/reference legends await completed geometry updates and preserve the other chart state');

    await page.locator('#contours-update').click(); await page.waitForFunction(() => document.querySelector('#contours-revision')?.textContent === 'Revision 1');
    await state('triangle', { hovered: false, selected: false }); await state('regular', { hovered: false, selected: false });
    regular = await verify('regular'); assert.deepEqual(regular.paths.map(p => p.level), [1.5, 2.5, 2.5, 3.5]);
    await hover('regular', { slot: 0 }, ['Level', '1.5']); tri = await verify('triangle'); assert.deepEqual(tri.paths.map(p => p.level), [2, 4]); await hover('triangle', { slot: 0 }, ['等值', '2']);
    checks.push('Replacement field and resolved levels update raw callback values and clear stale selection metadata');

    await page.locator('#contours-update').click(); await page.waitForFunction(() => document.querySelector('#contours-revision')?.textContent === 'Revision 2');
    regular = await verify('regular'); assert(regular.paths.length > 0); assert(regular.paths.every(p => same(p.points[0], p.points.at(-1))));
    assert(regular.targets.filter(t => t.kind === 'contour').every(t => t.shape === 'segment'));
    await noHit('regular', fromData('regular', regular, { x: 20, y: 1 })); await hover('regular', { slot: 0 }, ['Level']);
    checks.push('Closed generated paths retain physical line-only selection and their enclosed interior stays empty');

    await page.locator('#contours-update').click(); await page.waitForFunction(() => document.querySelector('#contours-revision')?.textContent === 'Revision 3');
    for (let i = 0; i < 3; i++) {
      await page.locator('#contours-mount').click(); await page.waitForSelector('#contours-unmounted'); assert.equal(await page.locator('svg').count(), 0);
      await page.locator('#contours-mount').click(); await page.waitForSelector('#contour-triangle-svg'); await verify('regular');
    }
    const again = await hover('regular', { slot: 0 }); await page.mouse.click(again.x, again.y); await state('regular', { selected: true, clicks: 2 }); await state('triangle', { clicks: 1 });
    checks.push('Three real remount cycles preserve independent click counts and one event per actual click');

    await page.locator('#contour-regular').evaluate(n => { n.style.padding = '21px'; n.style.border = '7px solid #e5e9ed'; });
    await page.locator('#contour-regular-svg').evaluate(n => { n.style.width = '360px'; n.style.height = '360px'; });
    await hover('regular', { slot: 0, perpendicularCSS: 1 }, ['Level']);
    let scaled = await frame('regular'), scaledTarget = scaled.targets.find(t => t.kind === 'contour' && t.slot === 0), miss = candidate(scaled, scaledTarget, 6);
    const inverse = scaled.ctm, localMiss = { x: (miss.x - inverse.e) / inverse.a, y: (miss.y - inverse.f) / inverse.d }; await noHit('regular', localMiss);
    const box = await page.locator('#contour-regular-svg').boundingBox(); await page.mouse.move(box.x + box.width / 2, box.y + 3); await state('regular', { hovered: false });
    await page.locator('#contour-regular').evaluate(n => { n.style.padding = ''; n.style.border = ''; });
    await page.locator('#contour-regular-svg').evaluate(n => { n.style.width = '100%'; n.style.height = 'auto'; });
    checks.push('Actual contour stroke radius remains in CSS pixels through padding, borders, scale and empty letterbox space');

    await page.setViewportSize({ width: 375, height: 812 }); await hover('regular', { slot: 0 }, ['Level']); await hover('triangle', { slot: 1 }, ['等值线', '3']);
    let mobileTip = await tooltip('triangle').boundingBox(); assert(mobileTip.x >= 0 && mobileTip.x + mobileTip.width <= 375);
    assert(await page.evaluate(() => document.documentElement.scrollWidth <= innerWidth));
    await page.screenshot({ path: path.join(output, 'mobile.png'), fullPage: true });
    checks.push('375px layout retains actual clipped line hits and readable Level/Chinese tooltips without page overflow');

    await page.setViewportSize({ width: 1280, height: 950 }); await hover('triangle', { slot: 1 }, ['等值线']);
    await page.screenshot({ path: path.join(output, 'contours.png'), fullPage: true }); assert.deepEqual(errors, []);
    const artifact = { path: compiledScript, bytes: compiled.length, sha256: createHash('sha256').update(compiled).digest('hex') };
    const report = { browser: browser.version(), artifact, checks, evidence, pageErrors: errors };
    await fs.writeFile(path.join(output, 'report.json'), JSON.stringify(report, null, 2) + '\n'); console.log(JSON.stringify(report, null, 2));
  } catch (error) {
    if (page) { await page.screenshot({ path: path.join(output, 'failure.png'), fullPage: true }).catch(() => {}); console.error(await page.locator('body').innerText().catch(() => 'Unable to read body')); }
    await fs.writeFile(path.join(output, 'failure.json'), JSON.stringify({ error: String(error), checks, evidence, pageErrors: errors }, null, 2) + '\n'); throw error;
  } finally { if (browser) await browser.close(); await new Promise(resolve => server.close(resolve)); }
}
main().catch(error => { console.error(error); process.exitCode = 1; });
