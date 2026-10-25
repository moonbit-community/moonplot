// DOM acceptance plan for actual static polar/radar SVG and Rabbita controls.
// Actual acceptance runner for the static M15 A scope; no polar pointer gate.
// The geometry oracle reads the emitted clip circle and paint, then applies the
// independent polar formula to fixed raw inputs. It never calls hit helpers.
const assert = require('node:assert/strict');
const { createHash } = require('node:crypto');
const fs = require('node:fs/promises');
const http = require('node:http');
const path = require('node:path');
const { chromium } = require(process.env.PLAYWRIGHT_MODULE || 'playwright');
const root = path.resolve(__dirname, '..');
const target = path.resolve(process.env.MOONPLOT_POLAR_TARGET_DIR || path.join(root, '_build'));
const compiledScript = path.resolve(process.env.MOONPLOT_POLAR_JS || path.join(target, 'js/debug/build/rabbita/cmd/polar/polar.js'));
const scriptPath = '/_build/js/debug/build/rabbita/cmd/polar/polar.js';
const output = path.resolve(process.env.MOONPLOT_POLAR_OUTPUT || path.join(root, '.moonagent/checkpoints/M15-polar/browser'));
const checks = [], evidence = [], charts = ['spiral', 'radar'];
const keys = { spiral: ['spiral', 'samples'], radar: ['baseline', 'current'] };
const labels = ['探索', '实现', '验证', '表达', '协作'];
const near = (a, b, e = 1e-5) => assert(Number.isFinite(a) && Number.isFinite(b) && Math.abs(a - b) <= e, `${a} ≈ ${b}, tolerance ${e}`);
const map = (p, m) => ({ x: m.a * p.x + m.c * p.y + m.e, y: m.b * p.x + m.d * p.y + m.f });
const inverse = (p, m) => { const d = m.a * m.d - m.b * m.c, x = p.x - m.e, y = p.y - m.f; assert(d !== 0); return { x: (m.d * x - m.c * y) / d, y: (-m.b * x + m.a * y) / d }; };
const samePoint = (a, b, e = 1e-5) => { near(a.x, b.x, e); near(a.y, b.y, e); };
function input(chart, series, revision) {
  if (chart === 'radar') return {
    theta: Array.from({ length: 5 }, (_, i) => 2 * Math.PI * i / 5),
    radius: series === 0 ? (revision % 2 ? [75, 80, 65, 85, 78] : [70, 85, 60, 90, 75]) : (revision % 2 ? [88, 74, 92, 78, 85] : [82, 68, 88, 72, 92]),
  };
  if (series === 1) return { theta: [0, Math.PI / 2, Math.PI, 3 * Math.PI / 2, Math.PI / 4], radius: revision % 2 ? [.55, .7, .45, .85, 1.2] : [.4, .65, .8, 1, 1.2] };
  return {
    theta: Array.from({ length: 49 }, (_, i) => i * Math.PI / 16 + (revision % 2 ? Math.PI / 6 : 0)),
    radius: Array.from({ length: 49 }, (_, i) => revision % 2 ? .1 + .75 * i / 48 : .15 + .85 * i / 48),
  };
}
function decode(raw) {
  const get = k => raw.attrs['data-' + k], number = k => Number(get(k));
  return { ...raw, revision: number('revision'), rmax: number('radius-max'), offset: number('theta-offset'), clockwise: get('direction') === 'clockwise',
    sources: [0, 1].map(i => { const p = `source-${i}-`, n = number(p + 'count'); return {
      visible: get(p + 'visible') === 'true', name: get(p + 'name'), color: get(p + 'color'), geometry: get(p + 'geometry'), closed: get(p + 'closed') === 'true',
      theta: Array.from({ length: n }, (_, j) => number(`${p}point-${j}-theta`)), radius: Array.from({ length: n }, (_, j) => number(`${p}point-${j}-radius`)),
    }; }),
  };
}
function projection(f, angle, radius) {
  const phi = f.offset + (f.clockwise ? -angle : angle), c = f.circle;
  return map({ x: c.cx + c.r * radius / f.rmax * Math.cos(phi), y: c.cy - c.r * radius / f.rmax * Math.sin(phi) }, c.matrix);
}
function circleGeometry(f) {
  const c = f.circle, center = map({ x: c.cx, y: c.cy }, c.matrix), east = map({ x: c.cx + c.r, y: c.cy }, c.matrix), south = map({ x: c.cx, y: c.cy + c.r }, c.matrix);
  const u = { x: east.x - center.x, y: east.y - center.y }, v = { x: south.x - center.x, y: south.y - center.y }, rx = Math.hypot(u.x, u.y), ry = Math.hypot(v.x, v.y);
  near(rx, ry, 1e-6); near(u.x * v.x + u.y * v.y, 0, 1e-5); assert(rx > 20, 'A visible physical circle'); return { center, radius: rx, east, south };
}
function verifyFrame(chart, f) {
  for (const key of ['point-count', 'target-count', 'unexpected-hovers', 'unexpected-clicks']) assert.equal(f.attrs['data-' + key], '0', `${chart} ${key}`);
  assert.equal(f.attrs['data-normal-equal'], 'true'); assert.equal(f.attrs['data-hit-mode'], chart === 'spiral' ? 'nearest' : 'x-nearest');
  near(f.rmax, chart === 'spiral' ? 1 : 100); near(f.offset, chart === 'spiral' ? 0 : Math.PI / 2); if (chart === 'radar') assert(f.clockwise);
  assert.equal(f.circle.units, 'userSpaceOnUse'); assert.equal(f.circle.clippedDataGroups, 1, 'One data-only circular clip'); assert.equal(f.circle.otherClippedPaint, 0, 'Grid, frame, titles and labels stay outside the data clip');
  const physical = circleGeometry(f); assert(f.frameCircles.some(c => Math.abs(c.radius - physical.radius) < 1e-5 && Math.hypot(c.center.x - physical.center.x, c.center.y - physical.center.y) < 1e-5), 'Actual frame and data use the same circle');
  let next = 0;
  f.sources.forEach((s, series) => {
    const expected = input(chart, series, f.revision); assert.equal(s.theta.length, expected.theta.length); assert.equal(s.radius.length, expected.radius.length);
    expected.theta.forEach((x, i) => near(s.theta[i], x, 1e-12)); expected.radius.forEach((x, i) => near(s.radius[i], x, 1e-12));
    assert.equal(s.geometry, chart === 'spiral' && series === 1 ? 'scatter' : 'line'); assert.equal(s.closed, chart === 'radar');
    if (!s.visible) return;
    if (s.geometry === 'line') {
      const n = f.paint[next++]; assert(n); assert.equal(n.kind, 'polyline'); assert.equal(n.stroke.toLowerCase(), s.color.toLowerCase()); assert.equal(n.fill, 'none');
      assert.equal(n.points.length, s.theta.length + (s.closed ? 1 : 0));
      s.theta.forEach((angle, i) => samePoint(n.points[i], projection(f, angle, s.radius[i])));
      if (s.closed) samePoint(n.points.at(-1), n.points[0]); else assert(Math.hypot(n.points.at(-1).x - n.points[0].x, n.points.at(-1).y - n.points[0].y) > 5);
    } else {
      s.theta.forEach((angle, i) => { const n = f.paint[next++]; assert(n); assert.equal(n.kind, 'circle'); assert.equal(n.fill.toLowerCase(), s.color.toLowerCase()); samePoint(n.center, projection(f, angle, s.radius[i])); near(n.rawRadius, 5, 1e-12); });
    }
  });
  assert.equal(next, f.paint.length, 'No extra generated observations or clipped grid paint');
  assert(f.text.every(t => !t.insideDataClip), 'Text stays outside the circular data clip');
  if (chart === 'radar') for (const label of labels) assert(f.text.some(t => t.text === label), `Category label ${label}`);
  return physical;
}
async function main() {
  await fs.mkdir(output, { recursive: true }); const compiled = await fs.readFile(compiledScript), served = [];
  const artifact = { path: compiledScript, bytes: compiled.length, sha256: createHash('sha256').update(compiled).digest('hex') };
  const server = http.createServer(async (request, response) => {
    try {
      const url = new URL(request.url, 'http://127.0.0.1'); if (url.pathname === '/favicon.ico') { response.writeHead(204); response.end(); return; }
      const filename = path.resolve(root, '.' + decodeURIComponent(url.pathname)); assert(filename.startsWith(root + path.sep));
      const body = url.pathname === scriptPath ? compiled : await fs.readFile(filename);
      if (url.pathname === scriptPath) served.push({ url: url.pathname, bytes: body.length, sha256: createHash('sha256').update(body).digest('hex') });
      response.writeHead(200, { 'Content-Type': { '.js': 'text/javascript', '.css': 'text/css', '.html': 'text/html' }[path.extname(filename)] || 'application/octet-stream' }); response.end(body);
    } catch (_) { response.writeHead(404); response.end('Not found'); }
  });
  await new Promise(resolve => server.listen(0, '127.0.0.1', resolve)); let browser, page; const errors = [];
  try {
    const channel = process.env.BROWSER_CHANNEL || 'chrome'; browser = await chromium.launch({ headless: true, ...(channel === 'bundled' ? {} : { channel }) });
    page = await browser.newPage({ viewport: { width: 1280, height: 950 }, deviceScaleFactor: 1 }); page.on('pageerror', e => errors.push(String(e))); page.on('console', m => { if (m.type() === 'error') errors.push(m.text()); });
    await page.goto(`http://127.0.0.1:${server.address().port}/rabbita/polar.html`, { waitUntil: 'networkidle' });
    await page.waitForFunction(() => document.querySelector('#polar-radar-svg') || document.querySelector('#polar-error')); const failure = await page.locator('#polar-error').count(); assert.equal(failure, 0, failure ? await page.locator('#polar-error').textContent() : 'Both polar cards render');
    await page.evaluate(() => { window.polarEvents = []; for (const type of ['mousemove', 'click']) document.addEventListener(type, e => { const root = e.target.closest?.('[data-testid]'); window.polarEvents.push({ type, x: e.clientX, y: e.clientY, target: root?.getAttribute('data-testid') || e.target.tagName }); }, true); });
    const status = chart => page.locator(`#polar-${chart}-status`), legend = (chart, series) => page.locator(`[data-testid="polar-${chart}"] [data-moonplot-series="${keys[chart][series]}"]`);
    async function state(chart, expected) {
      try { await page.waitForFunction(({ chart, expected }) => { const n = document.querySelector(`#polar-${chart}-status`); return n && Object.entries(expected).every(([key, value]) => n.getAttribute('data-' + key) === String(value)); }, { chart, expected }); }
      catch (error) { console.error({ chart, expected, actual: await status(chart).evaluate(n => Object.fromEntries([...n.attributes].map(a => [a.name, a.value]))).catch(() => null) }); throw error; }
    }
    async function frame(chart) {
      const svg = page.locator(`#polar-${chart}-svg`); await svg.scrollIntoViewIfNeeded();
      return decode(await svg.evaluate((svg, chart) => {
        const matrix = m => ({ a: m.a, b: m.b, c: m.c, d: m.d, e: m.e, f: m.f });
        const point = (x, y, m) => ({ x: m.a * x + m.c * y + m.e, y: m.b * x + m.d * y + m.f });
        const number = (n, key) => Number(n.getAttribute(key) || 0);
        const writtenPoints = n => n.getAttribute('points').trim().split(/\s+/).map(pair => { const [x, y] = pair.split(',').map(Number); return { x, y }; });
        const domMatrix = m => new DOMMatrix([m.a, m.b, m.c, m.d, m.e, m.f]);
        const transform = n => domMatrix(n.transform?.baseVal?.consolidate()?.matrix || new DOMMatrix());
        const refs = [...svg.querySelectorAll('g[clip-path]')].flatMap(group => {
          const id = /^url\(["']?#([^"')]+)["']?\)$/.exec(group.getAttribute('clip-path'))?.[1], clip = id ? [...svg.querySelectorAll('clipPath')].find(n => n.id === id) : null, circle = clip?.querySelector('circle');
          return circle ? [{ group, clip, circle }] : [];
        });
        if (refs.length !== 1) throw Error(`Expected one actual polar circle clip, got ${refs.length}`);
        const { group, clip, circle } = refs[0], ctm = domMatrix(group.getScreenCTM()).multiply(transform(clip)).multiply(transform(circle));
        const paint = [...group.querySelectorAll('polyline,circle')].map(n => {
          const m = n.getScreenCTM(); return n.tagName === 'polyline' ? { kind: 'polyline', stroke: n.getAttribute('stroke'), fill: n.getAttribute('fill'), points: writtenPoints(n).map(p => point(p.x, p.y, m)) } : { kind: 'circle', fill: n.getAttribute('fill'), center: point(number(n, 'cx'), number(n, 'cy'), m), rawRadius: number(n, 'r') };
        });
        const r = svg.getBoundingClientRect(), s = document.querySelector(`#polar-${chart}-status`);
        return {
          serializationDiagnostics: { polyline: [...group.querySelectorAll('polyline')].map(n => writtenPoints(n).map((p, i) => ({ index: i, written: p, svgPoint: { x: n.points[i].x, y: n.points[i].y }, maxDifference: Math.max(Math.abs(p.x - n.points[i].x), Math.abs(p.y - n.points[i].y)) })).sort((a, b) => b.maxDifference - a.maxDifference)[0]), circle: { written: { cx: number(circle, 'cx'), cy: number(circle, 'cy'), r: number(circle, 'r') }, animated: { cx: circle.cx.baseVal.value, cy: circle.cy.baseVal.value, r: circle.r.baseVal.value } } },
          attrs: Object.fromEntries([...s.attributes].map(a => [a.name, a.value])), paint, rootMatrix: matrix(svg.getScreenCTM()), viewBox: { x: svg.viewBox.baseVal.x, y: svg.viewBox.baseVal.y, width: svg.viewBox.baseVal.width, height: svg.viewBox.baseVal.height }, rect: { x: r.x, y: r.y, width: r.width, height: r.height },
          circle: { id: clip.id, cx: number(circle, 'cx'), cy: number(circle, 'cy'), r: number(circle, 'r'), matrix: matrix(ctm), units: clip.getAttribute('clipPathUnits') || 'userSpaceOnUse', clippedDataGroups: refs.length, otherClippedPaint: [...group.querySelectorAll('text,line,polygon,path,rect')].length },
          frameCircles: [...svg.querySelectorAll('circle')].filter(n => !n.closest('defs') && !group.contains(n)).map(n => { const m = n.getScreenCTM(), center = point(number(n, 'cx'), number(n, 'cy'), m), east = point(number(n, 'cx') + number(n, 'r'), number(n, 'cy'), m); return { center, radius: Math.hypot(east.x - center.x, east.y - center.y) }; }),
          text: [...svg.querySelectorAll('text')].map(n => ({ text: n.textContent, insideDataClip: group.contains(n) })), signature: group.outerHTML,
        };
      }, chart));
    }
    async function settled(chart, expected, beforeSignature) {
      await state(chart, expected);
      await page.waitForFunction(({ chart, beforeSignature }) => {
        const svg = document.querySelector(`#polar-${chart}-svg`), s = document.querySelector(`#polar-${chart}-status`); if (!svg || !s) return false;
        const groups = [...svg.querySelectorAll('g[clip-path]')].filter(n => { const id = /^url\(["']?#([^"')]+)["']?\)$/.exec(n.getAttribute('clip-path'))?.[1]; return id && [...svg.querySelectorAll('clipPath')].some(c => c.id === id && c.querySelector('circle')); });
        if (groups.length !== 1) return false;
        const visible = i => s.getAttribute(`data-source-${i}-visible`) === 'true', lines = chart === 'radar' ? Number(visible(0)) + Number(visible(1)) : Number(visible(0)), markers = chart === 'spiral' && visible(1) ? 5 : 0;
        return groups[0].querySelectorAll('polyline').length === lines && groups[0].querySelectorAll('circle').length === markers && (beforeSignature === undefined || groups[0].outerHTML !== beforeSignature);
      }, { chart, beforeSignature });
      const result = await frame(chart); try { verifyFrame(chart, result); } catch (error) { evidence.push({ phase: 'failed-actual-frame', chart, frame: result }); throw error; } return result;
    }
    async function resources() {
      assert.deepEqual(await page.evaluate(() => {
        const ids = [...document.querySelectorAll('[id]')].map(n => n.id), duplicates = ids.filter((id, i) => ids.indexOf(id) !== i), missing = [];
        for (const svg of document.querySelectorAll('svg[data-moonplot-root]')) for (const n of svg.querySelectorAll('[clip-path]')) { const id = /^url\(["']?#([^"')]+)["']?\)$/.exec(n.getAttribute('clip-path'))?.[1]; if (!id || ![...svg.querySelectorAll('[id]')].some(x => x.id === id)) missing.push(n.getAttribute('clip-path')); }
        return { duplicates, missing, namespaced: [...document.querySelectorAll('svg,svg *')].every(n => n.namespaceURI === 'http://www.w3.org/2000/svg') };
      }), { duplicates: [], missing: [], namespaced: true });
    }
    async function toggle(chart, series, visible) {
      const before = await frame(chart); await legend(chart, series).click(); const after = await settled(chart, { [`source-${series}-visible`]: visible }, before.signature);
      assert.equal(await legend(chart, series).getAttribute('aria-pressed'), String(visible)); return after;
    }
    async function noInteraction(chart, localPosition, click = false) {
      const f = await frame(chart), c = circleGeometry(f), requested = { x: Math.round(c.center.x + c.radius * localPosition[0]), y: Math.round(c.center.y + c.radius * localPosition[1]) };
      assert(requested.x >= f.rect.x && requested.x <= f.rect.x + f.rect.width && requested.y >= f.rect.y && requested.y <= f.rect.y + f.rect.height, 'Integer event lies on the actual SVG');
      await page.mouse.move(5, 5);
      await page.evaluate(() => new Promise(resolve => requestAnimationFrame(() => resolve())));
      const before = await status(chart).evaluate(n => ({ hover: Number(n.getAttribute('data-hover-events')), click: Number(n.getAttribute('data-click-events')) }));
      await page.evaluate(() => { window.polarEvents = []; }); await page.mouse.move(requested.x, requested.y);
      if (click) await page.mouse.click(requested.x, requested.y);
      await page.waitForFunction(click => window.polarEvents.some(e => e.type === (click ? 'click' : 'mousemove')), click);
      const events = await page.evaluate(() => window.polarEvents); const event = events.filter(e => e.type === (click ? 'click' : 'mousemove')).at(-1); assert.equal(event.x, requested.x); assert.equal(event.y, requested.y); assert(Number.isInteger(event.x) && Number.isInteger(event.y));
      await page.waitForFunction(({ chart, before, click }) => { const n = document.querySelector(`#polar-${chart}-status`); return n && Number(n.getAttribute('data-hover-events')) > before.hover && (!click || Number(n.getAttribute('data-click-events')) > before.click); }, { chart, before, click });
      await state(chart, { 'unexpected-hovers': 0, 'unexpected-clicks': 0, 'point-count': 0, 'target-count': 0 }); assert.equal(await page.locator('[role="tooltip"]').count(), 0);
      const after = await status(chart).evaluate(n => ({ hover: Number(n.getAttribute('data-hover-events')), click: Number(n.getAttribute('data-click-events')) }));
      evidence.push({ phase: 'actual-integer-static-event', chart, requested, events, before, after });
    }
    async function raster(chart, key) {
      return page.locator(`#polar-${chart}-svg`).evaluate(async (svg, key) => {
        await document.fonts.ready; const clone = svg.cloneNode(true); clone.setAttribute('xmlns', 'http://www.w3.org/2000/svg'); const box = svg.viewBox.baseVal, width = box.width || Number(svg.getAttribute('width')), height = box.height || Number(svg.getAttribute('height')); clone.setAttribute('width', width); clone.setAttribute('height', height);
        const url = URL.createObjectURL(new Blob([new XMLSerializer().serializeToString(clone)], { type: 'image/svg+xml' })), image = new Image(); image.src = url;
        try { await image.decode(); const canvas = document.createElement('canvas'); canvas.width = width; canvas.height = height; const context = canvas.getContext('2d'); context.drawImage(image, 0, 0, width, height); window.polarRasters ||= {}; window.polarRasters[key] = context.getImageData(0, 0, width, height); return { width, height }; } finally { URL.revokeObjectURL(url); }
      }, key);
    }
    async function rasterDifference(chart, f, on, off) {
      const expected = input(chart, 1, f.revision), inside = inverse(projection(f, expected.theta[0], expected.radius[0]), f.rootMatrix), outside = inverse(projection(f, expected.theta[4], expected.radius[4]), f.rootMatrix);
      return page.evaluate(({ on, off, inside, outside, viewBox }) => {
        const a = window.polarRasters[on], b = window.polarRasters[off]; if (a.width !== b.width || a.height !== b.height) throw Error('Native raster size changed');
        const sample = p => { let max = 0, changed = 0; for (let dy = -1; dy <= 1; dy++) for (let dx = -1; dx <= 1; dx++) { const x = Math.round(p.x - viewBox.x) + dx, y = Math.round(p.y - viewBox.y) + dy; if (x < 0 || y < 0 || x >= a.width || y >= a.height) throw Error('Clipping sample lies outside actual SVG'); let d = 0; for (let c = 0; c < 4; c++) d = Math.max(d, Math.abs(a.data[4 * (y * a.width + x) + c] - b.data[4 * (y * b.width + x) + c])); max = Math.max(max, d); if (d) changed++; } return { max, changed }; };
        return { inside: { point: inside, ...sample(inside) }, outside: { point: outside, ...sample(outside) }, width: a.width, height: a.height };
      }, { on, off, inside, outside, viewBox: f.viewBox });
    }

    assert.equal(await page.locator('svg[data-moonplot-root]').count(), 2); let spiral = await settled('spiral', { revision: 0 }), radar = await settled('radar', { revision: 0 });
    evidence.push({ phase: 'initial-real-frames', spiral, radar });
    checks.push('Two real static cards render normal SVG equal to Drawing SVG, with zero actual points and targets in both hit modes');
    await resources(); assert.notEqual(spiral.circle.id, radar.circle.id); assert(spiral.rect.width > spiral.rect.height * 1.2); circleGeometry(spiral); circleGeometry(radar);
    checks.push('Each non-square panel uses a physical circle and uniquely scoped, resolved data-only circle clip');
    assert.equal(spiral.sources[0].theta.length, 49); assert.equal(spiral.paint[0].points.length, 49);
    checks.push('The open spiral contains exactly 49 original samples projected by the independent theta/r formula, joined as chords');
    const scatter = spiral.paint.slice(1); assert.equal(scatter.length, 5); const physical = circleGeometry(spiral), outside = scatter.at(-1).center; near(Math.hypot(outside.x - physical.center.x, outside.y - physical.center.y), 1.2 * physical.radius);
    checks.push('Five independent scatter markers use SVG pixel radii; the raw r=1.2 point is projected beyond explicit rmax without clamping');
    await raster('spiral', 'samples-on'); const rasterFrame = spiral; await toggle('spiral', 1, false); await raster('spiral', 'samples-off'); const clipProof = await rasterDifference('spiral', rasterFrame, 'samples-on', 'samples-off'); assert(clipProof.inside.changed > 0); assert(clipProof.inside.max > 20); assert.equal(clipProof.outside.changed, 0); evidence.push({ phase: 'actual-native-svg-paint-clipping', ...clipProof }); spiral = await toggle('spiral', 1, true);
    checks.push('Native rendering of the actual SVG changes the visible sample pixels while the out-of-range sample center stays clipped');
    for (const n of radar.paint) { assert.equal(n.kind, 'polyline'); assert.equal(n.points.length, 6); samePoint(n.points[0], n.points[5]); } assert.equal(radar.sources[0].theta.length, 5); assert.equal(radar.sources[1].theta.length, 5);
    checks.push('Both five-category radar outlines close only the paint path, retaining five declared input values per series');
    const rc = circleGeometry(radar), first = radar.paint[0].points[0], second = radar.paint[0].points[1]; near(first.x, rc.center.x); assert(first.y < rc.center.y); assert(second.x > rc.center.x); for (const label of labels) assert(radar.text.some(t => t.text === label));
    checks.push('The application explicitly selects top zero and clockwise radar with all category labels on one shared 0–100 scale');
    const untouchedRadar = radar.signature; await page.locator('#polar-direction').click(); spiral = await settled('spiral', { direction: 'clockwise' }, spiral.signature); radar = await settled('radar', { direction: 'clockwise' }); assert.equal(radar.signature, untouchedRadar); await page.locator('#polar-direction').click(); spiral = await settled('spiral', { direction: 'counterclockwise' }, spiral.signature);
    checks.push('Direction control changes the actual spiral and scatter projection while the separate radar stays unchanged');
    const beforeSpiral = spiral.signature, beforeRadar = radar.signature; await page.locator('#polar-update').click(); spiral = await settled('spiral', { revision: 1 }, beforeSpiral); radar = await settled('radar', { revision: 1 }, beforeRadar); evidence.push({ phase: 'actual-updated-frames', spiral, radar });
    checks.push('Data replacement waits for both source revision and actual changed paint, then independently checks every projected point');
    const other = radar.signature; await toggle('spiral', 0, false); spiral = await toggle('spiral', 1, false); assert.equal(spiral.paint.length, 0); near(spiral.rmax, 1); assert.equal((await frame('radar')).signature, other); await toggle('spiral', 0, true); spiral = await toggle('spiral', 1, true);
    await toggle('radar', 0, false); radar = await toggle('radar', 1, false); assert.equal(radar.paint.length, 0); near(radar.rmax, 100); assert(radar.text.some(t => t.text === labels[0])); await toggle('radar', 0, true); radar = await toggle('radar', 1, true);
    checks.push('Each of four legend controls awaits actual removal/restoration, preserves the other card and keeps explicit scale and labels when empty');
    for (let i = 0; i < 3; i++) { await page.locator('#polar-mount').click(); await page.waitForSelector('#polar-unmounted'); assert.equal(await page.locator('svg[data-moonplot-root]').count(), 0); await page.locator('#polar-mount').click(); await page.waitForSelector('#polar-radar-svg'); spiral = await settled('spiral', { revision: 1 }); radar = await settled('radar', { revision: 1 }); await resources(); }
    checks.push('Three real remounts restore independent series/configuration with collision-free SVG clip resources');
    for (const chart of charts) { for (const position of [[0, 0], [.4, 0], [0, -.65], [-.7, .2]]) await noInteraction(chart, position, true); }
    checks.push('Real integer mouse and click events on both static plots produce no HitInfo callbacks or floating tooltip even with large hit radius');
    const originalStyles = { wrapper: await page.locator('#polar-spiral').getAttribute('style'), svg: await page.locator('#polar-spiral-svg').getAttribute('style') };
    await page.locator('#polar-spiral').evaluate(n => { n.style.padding = '21px'; n.style.border = '7px solid #e5e9ed'; }); await page.locator('#polar-spiral-svg').evaluate(n => { n.style.width = '360px'; n.style.height = '360px'; }); spiral = await settled('spiral', { revision: 1 }); circleGeometry(spiral); await noInteraction('spiral', [0, 0], true);
    await page.locator('#polar-spiral').evaluate((n, style) => { if (style === null) n.removeAttribute('style'); else n.setAttribute('style', style); }, originalStyles.wrapper); await page.locator('#polar-spiral-svg').evaluate((n, style) => { if (style === null) n.removeAttribute('style'); else n.setAttribute('style', style); }, originalStyles.svg);
    checks.push('Border, padding and a square CSS SVG viewport preserve round projected geometry without introducing interaction targets');
    await page.setViewportSize({ width: 375, height: 812 }); for (const chart of charts) { const f = await settled(chart, { revision: 1 }); circleGeometry(f); await noInteraction(chart, [.2, -.2], true); } assert(await page.evaluate(() => document.documentElement.scrollWidth <= innerWidth)); await resources(); await page.screenshot({ path: path.join(output, 'mobile.png'), fullPage: true });
    await page.setViewportSize({ width: 1280, height: 950 }); spiral = await frame('spiral'); radar = await frame('radar'); await page.locator('#polar-update').click(); await settled('spiral', { revision: 2 }, spiral.signature); await settled('radar', { revision: 2 }, radar.signature); await page.mouse.move(5, 5); await page.screenshot({ path: path.join(output, 'polar.png'), fullPage: true });
    checks.push('375px layout remains within viewport with round circles and readable controls; actual mobile and desktop screenshots are recorded');
    assert.equal(checks.length, 14); assert.deepEqual(errors, []); assert(served.length > 0); for (const s of served) { assert.equal(s.bytes, artifact.bytes); assert.equal(s.sha256, artifact.sha256); }
    const report = { browser: browser.version(), artifact, served, checks, evidence, pageErrors: errors }; await fs.writeFile(path.join(output, 'report.json'), JSON.stringify(report, null, 2) + '\n'); console.log(JSON.stringify({ browser: report.browser, artifact, served, checks, events: evidence.filter(e => e.phase === 'actual-integer-static-event').length, pageErrors: errors, report: path.join(output, 'report.json') }, null, 2));
  } catch (error) {
    if (page) { await page.screenshot({ path: path.join(output, 'failure.png'), fullPage: true }).catch(() => {}); console.error(await page.locator('body').innerText().catch(() => 'Unable to read body')); }
    await fs.writeFile(path.join(output, 'failure.json'), JSON.stringify({ error: String(error), artifact, served, checks, evidence, pageErrors: errors }, null, 2) + '\n'); throw error;
  } finally { if (browser) await browser.close(); await new Promise(resolve => server.close(resolve)); }
}
main().catch(error => { console.error(error); process.exitCode = 1; });
