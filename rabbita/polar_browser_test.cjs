// Actual DOM acceptance for raw polar samples, frame disk and private CTM.
// Result claims belong only to the reports written by an actual execution.
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
const output = path.resolve(process.env.MOONPLOT_POLAR_OUTPUT || path.join(root, '.moonagent/checkpoints/M16-polar-interaction/browser'));
const mixedScript = process.env.MOONPLOT_POLAR_MIXED_JS ? path.resolve(process.env.MOONPLOT_POLAR_MIXED_JS) : null;
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
  if (series === 1) return { theta: [0, Math.PI / 2, Math.PI, 3 * Math.PI / 2, Math.PI / 4, 7 * Math.PI], radius: revision % 2 ? [.55, .7, .45, .85, 1.2, 0] : [.4, .65, .8, 1, 1.2, 0] };
  return {
    theta: Array.from({ length: 49 }, (_, i) => i * Math.PI / 16 + (revision % 2 ? Math.PI / 6 : 0)),
    radius: Array.from({ length: 49 }, (_, i) => revision % 2 ? .1 + .75 * i / 48 : .15 + .85 * i / 48),
  };
}
function decode(raw) {
  const get = k => raw.attrs['data-' + k], number = k => Number(get(k));
  const targets = Array.from({ length: number('target-count') }, (_, i) => { const p = `target-${i}-`; return {
    kind: get(p + 'kind'), shape: get(p + 'shape'), panel: number(p + 'panel'), artist: number(p + 'artist'), point: number(p + 'point'), theta: number(p + 'theta'), radius: number(p + 'radius'), value: number(p + 'value'),
    screen: { x: number(p + 'screen-x'), y: number(p + 'screen-y') }, series: get(p + 'series'), categoryPresent: get(p + 'category-present') === 'true', category: get(p + 'category'),
    bounds: [number(p + 'left'), number(p + 'top'), number(p + 'width'), number(p + 'height')], unrelated: Object.fromEntries(['interval','fraction','cell','error','band','box','hexbin','violin','vector','tricolor','streamplot'].map(k => [k, get(p + k + '-present')]))
  }; });
  return { ...raw, targets, hitRadius: number('hit-radius'), revision: number('revision'), rmax: number('radius-max'), offset: number('theta-offset'), clockwise: get('direction') === 'clockwise',
    sources: [0, 1].map(i => { const p = `source-${i}-`, n = number(p + 'count'); return {
      visible: get(p + 'visible') === 'true', name: get(p + 'name'), color: get(p + 'color'), geometry: get(p + 'geometry'), closed: get(p + 'closed') === 'true',
      theta: Array.from({ length: n }, (_, j) => number(`${p}point-${j}-theta`)), radius: Array.from({ length: n }, (_, j) => number(`${p}point-${j}-radius`)),
    }; }),
  };
}
function intrinsicProjection(f, angle, radius) {
  const phi = f.offset + (f.clockwise ? -angle : angle), c = f.circle;
  return { x: c.cx + c.r * radius / f.rmax * Math.cos(phi), y: c.cy - c.r * radius / f.rmax * Math.sin(phi) };
}
function projection(f, angle, radius) { return map(intrinsicProjection(f, angle, radius), f.circle.matrix);
}
function circleGeometry(f) {
  const c = f.circle, center = map({ x: c.cx, y: c.cy }, c.matrix), east = map({ x: c.cx + c.r, y: c.cy }, c.matrix), south = map({ x: c.cx, y: c.cy + c.r }, c.matrix);
  const u = { x: east.x - center.x, y: east.y - center.y }, v = { x: south.x - center.x, y: south.y - center.y }, rx = Math.hypot(u.x, u.y), ry = Math.hypot(v.x, v.y);
  near(rx, ry, 1e-6); near(u.x * v.x + u.y * v.y, 0, 1e-5); assert(rx > 20, 'A visible physical circle'); return { center, radius: rx, east, south };
}
function expectedAnchors(f, chart) {
  let artist = 0; return f.sources.flatMap((s, series) => {
    if (!s.visible) return []; const current = artist++;
    return s.theta.flatMap((theta, point) => s.radius[point] >= 0 && s.radius[point] <= f.rmax ? [{ panel: 0, artist: current, point, seriesIndex: series, theta, radius: s.radius[point], series: s.name, category: chart === 'radar' ? labels[point] : null, screen: intrinsicProjection(f, theta, s.radius[point]), client: projection(f, theta, s.radius[point]) }] : []);
  });
}
function pointOracle(f, chart, requested) {
  const local = inverse(requested, f.rootMatrix), circleLocal = inverse(requested, f.circle.matrix), c = f.circle;
  const insideViewport = local.x >= f.viewBox.x && local.x <= f.viewBox.x + f.viewBox.width && local.y >= f.viewBox.y && local.y <= f.viewBox.y + f.viewBox.height;
  const radialDistance = Math.hypot(circleLocal.x - c.cx, circleLocal.y - c.cy), inCircle = radialDistance <= c.r;
  const candidates = expectedAnchors(f, chart).map(a => ({ ...a, distance: Math.hypot(a.client.x - requested.x, a.client.y - requested.y) })).sort((a, b) => a.distance - b.distance);
  return { local, circleLocal, insideViewport, inCircle, radialDistance, nearest: candidates[0] || null, next: candidates[1] || null, accepted: insideViewport && inCircle && !!candidates[0] && candidates[0].distance <= f.hitRadius };
}
function verifyFrame(chart, f) {
  assert.equal(f.attrs['data-normal-equal'], 'true'); assert.equal(f.attrs['data-hit-mode'], chart === 'spiral' ? 'nearest' : 'x-nearest'); near(f.hitRadius, 8);
  near(f.rmax, chart === 'spiral' ? 1 : 100); near(f.offset, chart === 'spiral' ? 0 : Math.PI / 2); if (chart === 'radar') assert(f.clockwise);
  assert.equal(f.circle.units, 'userSpaceOnUse'); assert.equal(f.circle.clippedDataGroups, 1); assert.equal(f.circle.otherClippedPaint, 0);
  const physical = circleGeometry(f); assert(f.frameCircles.some(c => Math.abs(c.radius - physical.radius) < 1e-5 && Math.hypot(c.center.x - physical.center.x, c.center.y - physical.center.y) < 1e-5));
  assert.equal(f.attrs['data-circle-present'], 'true'); near(Number(f.attrs['data-circle-cx']), f.circle.cx); near(Number(f.attrs['data-circle-cy']), f.circle.cy); near(Number(f.attrs['data-circle-r']), f.circle.r);
  let next = 0;
  f.sources.forEach((s, series) => {
    const expected = input(chart, series, f.revision); assert.equal(s.theta.length, expected.theta.length); assert.equal(s.radius.length, expected.radius.length);
    expected.theta.forEach((x, i) => near(s.theta[i], x, 1e-12)); expected.radius.forEach((x, i) => near(s.radius[i], x, 1e-12));
    assert.equal(s.geometry, chart === 'spiral' && series === 1 ? 'scatter' : 'line'); assert.equal(s.closed, chart === 'radar'); if (!s.visible) return;
    if (s.geometry === 'line') {
      const n = f.paint[next++]; assert.equal(n.kind, 'polyline'); assert.equal(n.stroke.toLowerCase(), s.color.toLowerCase()); assert.equal(n.fill, 'none'); assert.equal(n.points.length, s.theta.length + (s.closed ? 1 : 0));
      s.theta.forEach((angle, i) => samePoint(n.points[i], projection(f, angle, s.radius[i]))); if (s.closed) samePoint(n.points.at(-1), n.points[0]);
    } else s.theta.forEach((angle, i) => { const n = f.paint[next++]; assert.equal(n.kind, 'circle'); assert.equal(n.fill.toLowerCase(), s.color.toLowerCase()); samePoint(n.center, projection(f, angle, s.radius[i])); near(n.rawRadius, 5, 1e-12); });
  });
  assert.equal(next, f.paint.length); assert(f.text.every(t => !t.insideDataClip)); if (chart === 'radar') for (const label of labels) assert(f.text.some(t => t.text === label));
  const expected = expectedAnchors(f, chart); assert.equal(f.targets.length, expected.length); assert.equal(Number(f.attrs['data-point-count']), expected.length);
  f.targets.forEach((t, i) => { const e = expected[i]; assert.equal(t.kind, 'polar'); assert.equal(t.shape, 'point'); assert.equal(t.panel, 0); assert.equal(t.artist, e.artist); assert.equal(t.point, e.point); near(t.theta, e.theta, 1e-12); near(t.radius, e.radius, 1e-12); near(t.value, e.radius, 1e-12); samePoint(t.screen, e.screen); assert.equal(t.series, e.series); assert.equal(t.categoryPresent, e.category !== null); if (e.category !== null) assert.equal(t.category, e.category); for (const value of Object.values(t.unrelated)) assert.equal(value, 'false'); [f.circle.cx - f.circle.r, f.circle.cy - f.circle.r, 2 * f.circle.r, 2 * f.circle.r].forEach((v, j) => near(t.bounds[j], v)); });
  return physical;
}
async function main() {
  await fs.mkdir(output, { recursive: true }); const compiled = await fs.readFile(compiledScript), mixedCompiled = mixedScript ? await fs.readFile(mixedScript) : null, served = [];
  const artifact = { path: compiledScript, bytes: compiled.length, sha256: createHash('sha256').update(compiled).digest('hex') };
  const server = http.createServer(async (request, response) => {
    try {
      const url = new URL(request.url, 'http://127.0.0.1'); if (url.pathname === '/favicon.ico') { response.writeHead(204); response.end(); return; }
      if (url.pathname === '/_acceptance/polar-mixed.html') { assert(mixedCompiled, 'Temporary mixed fixture must be freshly compiled and supplied'); response.writeHead(200, { 'Content-Type': 'text/html' }); response.end('<!doctype html><meta charset="utf-8"><link rel="stylesheet" href="/rabbita/moonplot.css"><style>body{margin:24px}#app{max-width:1000px}svg{max-width:100%}</style><div id="app"></div><script type="module" src="/_acceptance/polar-mixed.js"></script>'); return; }
      if (url.pathname === '/_acceptance/polar-mixed.js') { assert(mixedCompiled); served.push({ url: url.pathname, bytes: mixedCompiled.length, sha256: createHash('sha256').update(mixedCompiled).digest('hex') }); response.writeHead(200, { 'Content-Type': 'text/javascript' }); response.end(mixedCompiled); return; }
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
    await page.evaluate(() => { window.polarEvents = []; for (const type of ['mousemove', 'click']) document.addEventListener(type, e => { const root = e.target.closest?.('[data-testid]'), svg = e.target.closest?.('svg[data-moonplot-root]'), m = svg?.getScreenCTM(); window.polarEvents.push({ type, x: e.clientX, y: e.clientY, target: root?.getAttribute('data-testid') || e.target.tagName, ctm: m ? { a:m.a,b:m.b,c:m.c,d:m.d,e:m.e,f:m.f } : null }); }, true); });
    const tooltip = chart => page.locator(`[data-testid="polar-${chart}-tooltip"]`);
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
        const refs = [...svg.querySelectorAll('g[clip-path]')].filter(n => !n.hasAttribute('data-moonplot-decoration')).flatMap(group => {
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
        const groups = [...svg.querySelectorAll('g[clip-path]')].filter(n => !n.hasAttribute('data-moonplot-decoration')).filter(n => { const id = /^url\(["']?#([^"')]+)["']?\)$/.exec(n.getAttribute('clip-path'))?.[1]; return id && [...svg.querySelectorAll('clipPath')].some(c => c.id === id && c.querySelector('circle')); });
        if (groups.length !== 1) return false;
        const visible = i => s.getAttribute(`data-source-${i}-visible`) === 'true', lines = chart === 'radar' ? Number(visible(0)) + Number(visible(1)) : Number(visible(0)), markers = chart === 'spiral' && visible(1) ? 6 : 0;
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
    async function raster(chart, key) {
      return page.locator(`#polar-${chart}-svg`).evaluate(async (svg, key) => {
        await document.fonts.ready; const clone = svg.cloneNode(true); clone.setAttribute('xmlns', 'http://www.w3.org/2000/svg'); const box = svg.viewBox.baseVal, width = box.width || Number(svg.getAttribute('width')), height = box.height || Number(svg.getAttribute('height')); clone.setAttribute('width', width); clone.setAttribute('height', height);
        const url = URL.createObjectURL(new Blob([new XMLSerializer().serializeToString(clone)], { type: 'image/svg+xml' })), image = new Image(); image.src = url;
        try { await image.decode(); const canvas = document.createElement('canvas'); canvas.width = width; canvas.height = height; const context = canvas.getContext('2d'); context.drawImage(image, 0, 0, width, height); window.polarRasters ||= {}; window.polarRasters[key] = context.getImageData(0, 0, width, height); return { width, height }; } finally { URL.revokeObjectURL(url); }
      }, key);
    }
    async function nativeCircle(chart, requested, f) {
      return page.locator(`#polar-${chart}-svg`).evaluate((svg, { requested, c }) => {
        const clip = [...svg.querySelectorAll('clipPath')].find(n => n.id === c.id), circle = clip.querySelector('circle'), m = c.matrix, det = m.a * m.d - m.b * m.c, x = requested.x - m.e, y = requested.y - m.f;
        const point = { x: (m.d * x - m.c * y) / det, y: (-m.b * x + m.a * y) / det };
        return { inside: circle.isPointInFill(new DOMPoint(point.x, point.y)), local: point };
      }, { requested, c: f.circle });
    }
    async function locate(chart, query) {
      const f = await frame(chart), c = circleGeometry(f), candidates = [];
      if (query.corner) {
        for (let i = 0; i < 96; i++) for (const rho of [1.015, 1.025, 1.04, 1.06, 1.09]) { const phi = 2 * Math.PI * i / 96, p = map({ x: f.circle.cx + f.circle.r * rho * Math.cos(phi), y: f.circle.cy + f.circle.r * rho * Math.sin(phi) }, f.circle.matrix); candidates.push({ x: Math.round(p.x), y: Math.round(p.y) }); }
      } else if (query.blank) {
        for (const n of f.paint) if (n.kind === 'polyline') for (let i = 1; i < n.points.length; i++) { const a = n.points[i - 1], b = n.points[i]; for (let dy = -2; dy <= 2; dy++) for (let dx = -2; dx <= 2; dx++) candidates.push({ x: Math.round((a.x + b.x) / 2) + dx, y: Math.round((a.y + b.y) / 2) + dy }); }
      } else {
        const e = expectedAnchors(f, chart).find(a => a.seriesIndex === query.series && a.point === query.point); assert(e, 'Requested original source anchor exists');
        for (let dy = -2; dy <= 2; dy++) for (let dx = -2; dx <= 2; dx++) candidates.push({ x: Math.round(e.client.x) + dx, y: Math.round(e.client.y) + dy });
      }
      const valid = candidates.map(p => ({ ...p, oracle: pointOracle(f, chart, p) })).filter(p => {
        const o = p.oracle; if (!o.insideViewport) return false;
        if (query.corner) return !o.inCircle && Math.abs(o.circleLocal.x - f.circle.cx) < f.circle.r && Math.abs(o.circleLocal.y - f.circle.cy) < f.circle.r && (o.radialDistance / f.circle.r - 1) * c.radius > .8 && o.nearest && o.nearest.distance < f.hitRadius - .8;
        if (query.blank) return o.inCircle && !o.accepted && o.nearest && o.nearest.distance > f.hitRadius + 2;
        return o.accepted && o.nearest.seriesIndex === query.series && o.nearest.point === query.point && o.nearest.distance < .8 && (!o.next || o.next.distance - o.nearest.distance > 1);
      }).sort((a, b) => query.blank ? b.oracle.nearest.distance - a.oracle.nearest.distance : a.oracle.nearest.distance - b.oracle.nearest.distance);
      assert(valid.length, `No safe actual integer event for ${chart} ${JSON.stringify(query)}`); const picked = valid[0], native = await nativeCircle(chart, picked, f); assert.equal(native.inside, picked.oracle.inCircle); return { ...picked, native };
    }
    async function move(chart, requested, click = false) {
      await page.mouse.move(5, 5); await page.evaluate(() => new Promise(resolve => requestAnimationFrame(() => resolve())));
      const eventFrame = await frame(chart);
      const before = await status(chart).evaluate(n => ({ hover: Number(n.getAttribute('data-hover-events')), click: Number(n.getAttribute('data-click-events')) }));
      await page.evaluate(() => { window.polarEvents = []; }); await page.mouse.move(requested.x, requested.y); if (click) await page.mouse.click(requested.x, requested.y);
      await page.waitForFunction(({ chart, before, click }) => { const n = document.querySelector(`#polar-${chart}-status`); return n && Number(n.getAttribute('data-hover-events')) > before.hover && (!click || Number(n.getAttribute('data-click-events')) > before.click); }, { chart, before, click });
      const events = await page.evaluate(() => window.polarEvents); assert(events.some(e => e.type === 'mousemove')); if (click) assert(events.some(e => e.type === 'click'));
      for (const event of events) { assert.equal(event.x, requested.x); assert.equal(event.y, requested.y); assert(Number.isInteger(event.x) && Number.isInteger(event.y)); assert(event.ctm); for (const key of ['a','b','c','d','e','f']) near(event.ctm[key], eventFrame.rootMatrix[key], 1e-8); }
      const f = await frame(chart), o = pointOracle(eventFrame, chart, requested), native = await nativeCircle(chart, requested, eventFrame); assert.equal(native.inside, o.inCircle);
      evidence.push({ phase: 'actual-polar-event', chart, eventRootMatrix: eventFrame.rootMatrix, requested: { x: requested.x, y: requested.y }, events, before, after: await status(chart).evaluate(n => ({ hover: Number(n.getAttribute('data-hover-events')), click: Number(n.getAttribute('data-click-events')) })), oracle: o, native }); return { frame: f, oracle: o };
    }
    async function highlighted(chart, kind, expected) {
      const proof = await page.locator(`[data-testid="polar-${chart}-${kind}"]`).evaluate(n => {
        const parent = n.closest('g[clip-path]'), svg = n.ownerSVGElement, id = /^url\(["']?#([^"')]+)["']?\)$/.exec(parent?.getAttribute('clip-path'))?.[1], clip = id ? [...svg.querySelectorAll('clipPath')].find(c => c.id === id) : null, circle = clip?.querySelector('circle');
        return { id, panel: parent?.getAttribute('data-moonplot-panel'), decoration: parent?.getAttribute('data-moonplot-decoration'), point: Number(n.getAttribute('data-moonplot-' + parent?.getAttribute('data-moonplot-decoration'))), x: Number(n.getAttribute('cx')), y: Number(n.getAttribute('cy')), clip: circle ? { cx: Number(circle.getAttribute('cx')), cy: Number(circle.getAttribute('cy')), r: Number(circle.getAttribute('r')) } : null };
      });
      assert(proof.id.startsWith('moonplot-decoration-')); assert.equal(proof.panel, '0'); assert.equal(proof.decoration, kind); assert.equal(proof.point, expected.point); samePoint(proof, { x: expected.screen.x, y: expected.screen.y });
      const f = await frame(chart); assert(proof.clip); near(proof.clip.cx, f.circle.cx); near(proof.clip.cy, f.circle.cy); near(proof.clip.r, f.circle.r); evidence.push({ phase: 'actual-polar-highlight-clip', chart, kind, proof }); await resources();
    }
    async function hover(chart, query, click = false) {
      const p = await locate(chart, query), result = await move(chart, p, click), e = result.oracle.nearest; assert(result.oracle.accepted);
      await state(chart, { hovered: true, kind: 'polar', panel: 0, artist: e.artist, point: e.point, series: e.series, 'category-present': e.category !== null });
      const attrs = await status(chart).evaluate(n => Object.fromEntries([...n.attributes].map(a => [a.name, a.value]))); near(Number(attrs['data-theta']), e.theta, 1e-12); near(Number(attrs['data-radius']), e.radius, 1e-12); near(Number(attrs['data-value']), e.radius, 1e-12); if (e.category !== null) assert.equal(attrs['data-category'], e.category);
      for (const key of ['interval','fraction','cell','error','band','box','hexbin','violin','vector','tricolor','streamplot']) assert.equal(attrs[`data-${key}-present`], 'false');
      await tooltip(chart).waitFor(); const rows = await tooltip(chart).locator('.moonplot-coordinate-label').allTextContents(), text = await tooltip(chart).innerText();
      if (chart === 'spiral') assert.deepEqual(rows, ['Theta (rad)', 'Radius']); else { assert.deepEqual(rows, ['类别', '角度（弧度）', '半径']); assert(text.includes(e.category)); }
      assert(text.includes(e.series)); assert(!rows.some(r => r === 'x' || r === 'y' || r === 'X' || r === 'Y'));
      if (click) { await state(chart, { selected: true, 'selected-panel': 0, 'selected-artist': e.artist, 'selected-point': e.point }); await highlighted(chart, 'selected', e); }
      else { const sameSelected = attrs['data-selected'] === 'true' && Number(attrs['data-selected-artist']) === e.artist && Number(attrs['data-selected-point']) === e.point; await highlighted(chart, sameSelected ? 'selected' : 'hover', e); }
      evidence.push({ phase: 'actual-polar-callback', chart, attrs, rows, text }); return { requested: p, expected: e, text };
    }
    async function negative(chart, query) {
      const p = await locate(chart, query), result = await move(chart, p); assert(!result.oracle.accepted); await state(chart, { hovered: false }); assert.equal(await tooltip(chart).count(), 0); return p;
    }
    async function imageDifference(on, off, probes) {
      return page.evaluate(({ on, off, probes }) => {
        const a = window.polarRasters[on], b = window.polarRasters[off]; if (a.width !== b.width || a.height !== b.height) throw Error('Actual SVG raster size changed');
        return probes.map(point => { let changed = 0, max = 0; for (let dy = -1; dy <= 1; dy++) for (let dx = -1; dx <= 1; dx++) { const x = Math.round(point.x) + dx, y = Math.round(point.y) + dy; if (x < 0 || y < 0 || x >= a.width || y >= a.height) throw Error('Native clip sample outside real SVG'); let delta = 0; for (let i = 0; i < 4; i++) delta = Math.max(delta, Math.abs(a.data[4 * (y * a.width + x) + i] - b.data[4 * (y * b.width + x) + i])); max = Math.max(max, delta); if (delta) changed++; } return { point, changed, max }; });
      }, { on, off, probes });
    }

    assert.equal(await page.locator('svg[data-moonplot-root]').count(), 2); let spiral = await settled('spiral', { revision: 0 }), radar = await settled('radar', { revision: 0 }); await resources();
    assert.equal(spiral.targets.length, 54); assert.equal(radar.targets.length, 10); evidence.push({ phase: 'initial-semantic-frames', spiral, radar });
    checks.push('Actual two-card frame keeps normal SVG and emitted circle geometry while every eligible target has exact raw theta/r/index/label metadata');
    await hover('spiral', { series: 0, point: 12 }); await hover('spiral', { series: 1, point: 2 }); const center = await hover('spiral', { series: 1, point: 5 }); near(center.expected.theta, 7 * Math.PI, 1e-12); near(center.expected.radius, 0); assert.deepEqual(spiral.targets.filter(t => t.series === 'Samples').map(t => t.point), [0, 1, 2, 3, 5]);
    checks.push('Default Theta (rad)/Radius reads original spiral and scatter samples, including raw7π at r0 and the uncompressed outside-slot hole');
    for (const [series, point] of [[0, 0], [0, 2], [1, 4]]) await hover('radar', { series, point }); assert(radar.paint.every(n => n.points.length === 6)); assert(radar.targets.every(t => t.point < 5));
    checks.push('Chinese callback receives original radar Category/theta/radius, with five identities per six-vertex closed outline');
    await negative('radar', { blank: true }); await hover('spiral', { series: 0, point: 24 }); await hover('radar', { series: 1, point: 3 });
    checks.push('Both modes select physical original points; a real radar chord midpoint away from samples has no interpolated or XNearest panel tooltip');
    const corner = await negative('spiral', { corner: true }); assert(corner.oracle.nearest.distance < spiral.hitRadius); assert(!corner.native.inside); assert(!spiral.targets.some(t => t.series === 'Samples' && t.point === 4));
    checks.push('A native outside-disk point inside its bbox and within physical hit radius is rejected, and the raw outside-center sample stays static');
    await page.mouse.move(5, 5); await state('spiral', { hovered: false }); await raster('spiral', 'highlight-off'); const boundary = await hover('spiral', { series: 1, point: 3 }, true); await raster('spiral', 'highlight-on');
    spiral = await frame('spiral'); const raw = intrinsicProjection(spiral, boundary.expected.theta, boundary.expected.radius), delta = { x: (raw.x - spiral.circle.cx) / spiral.circle.r, y: (raw.y - spiral.circle.cy) / spiral.circle.r }, clipProof = await imageDifference('highlight-on', 'highlight-off', [{ x: raw.x - 2 * delta.x, y: raw.y - 2 * delta.y }, { x: raw.x + 3 * delta.x, y: raw.y + 3 * delta.y }]); assert(clipProof[0].changed > 0); assert.equal(clipProof[1].changed, 0); evidence.push({ phase: 'actual-native-highlight-paint-clip', proof: clipProof }); await hover('spiral', { series: 0, point: 24 }); await highlighted('spiral', 'selected', boundary.expected);
    checks.push('Click selection and concurrent hover use distinct scoped frame-circle clips; native real-SVG pixels prove the boundary decoration is clipped');
    const kept = await hover('radar', { series: 1, point: 2 }, true); const rawBefore = expectedAnchors(spiral, 'spiral').map(a => [a.series, a.point, a.theta, a.radius]); await page.locator('#polar-direction').click(); spiral = await settled('spiral', { direction: 'clockwise', hovered: false, selected: false }, spiral.signature); await state('radar', { selected: true, 'selected-point': kept.expected.point }); assert.deepEqual(expectedAnchors(spiral, 'spiral').map(a => [a.series, a.point, a.theta, a.radius]), rawBefore); await hover('spiral', { series: 1, point: 2 }); await page.locator('#polar-direction').click(); spiral = await settled('spiral', { direction: 'counterclockwise', hovered: false, selected: false }, spiral.signature);
    checks.push('Direction updates move actual projected anchors and clear only their own state while raw observations and the other card selection persist');
    radar = await frame('radar'); await page.locator('#polar-update').click(); spiral = await settled('spiral', { revision: 1, hovered: false, selected: false }, spiral.signature); radar = await settled('radar', { revision: 1, hovered: false, selected: false }, radar.signature); await hover('spiral', { series: 0, point: 24 }); await hover('radar', { series: 0, point: 2 }); evidence.push({ phase: 'updated-semantic-frames', spiral, radar });
    checks.push('Data replacement clears stale hover/selection and waits for actual new paint and raw metadata before default/custom callbacks');
    await hover('radar', { series: 1, point: 2 }, true); const other = (await frame('radar')).signature; await toggle('spiral', 0, false); spiral = await toggle('spiral', 1, false); assert.equal(spiral.targets.length, 0); assert.equal((await frame('radar')).signature, other); await state('radar', { selected: true }); await toggle('spiral', 0, true); await toggle('spiral', 1, true); await toggle('radar', 0, false); radar = await toggle('radar', 1, false); assert.equal(radar.targets.length, 0); await toggle('radar', 0, true); await toggle('radar', 1, true);
    checks.push('All four legend controls await actual paint/target removal and restoration, retain explicit circle scale and isolate the other card state');
    for (let i = 0; i < 3; i++) { await page.locator('#polar-mount').click(); await page.waitForSelector('#polar-unmounted'); assert.equal(await page.locator('svg[data-moonplot-root]').count(), 0); await page.locator('#polar-mount').click(); await page.waitForSelector('#polar-radar-svg'); await settled('spiral', { revision: 1, selected: false }); await settled('radar', { revision: 1, selected: false }); await resources(); } const clicksBefore = Number(await status('spiral').getAttribute('data-clicks')); await hover('spiral', { series: 1, point: 5 }, true); await state('spiral', { clicks: clicksBefore + 1 });
    checks.push('Three actual remounts keep source identities/resource scopes and deliver one selection count for one physical click');
    // CSS disk admission needs a real boundary sample; revision1 has max .85.
    spiral = await frame('spiral'); radar = await frame('radar'); await page.locator('#polar-update').click(); spiral = await settled('spiral', { revision: 2, hovered: false, selected: false }, spiral.signature); radar = await settled('radar', { revision: 2, hovered: false, selected: false }, radar.signature);
    const originalStyles = { wrapper: await page.locator('#polar-spiral').getAttribute('style'), svg: await page.locator('#polar-spiral-svg').getAttribute('style') };
    await page.locator('#polar-spiral').evaluate(n => { n.style.padding = '21px'; n.style.border = '7px solid #e5e9ed'; }); await page.locator('#polar-spiral-svg').evaluate(n => { n.style.border = '5px solid #e5e9ed'; n.style.padding = '9px'; n.style.width = '360px'; n.style.height = '360px'; }); await hover('spiral', { series: 0, point: 24 }); await negative('spiral', { corner: true });
    checks.push('Actual CTM bridge preserves physical point/radius and true-disk rejection under container and SVG-own border/padding');
    for (const size of [[360, 360], [420, 220]]) { await page.locator('#polar-spiral-svg').evaluate((n, [width, height]) => { n.style.width = width + 'px'; n.style.height = height + 'px'; }, size); const f = await frame('spiral'); verifyFrame('spiral', f); circleGeometry(f); await hover('spiral', { series: 1, point: 5 }); const candidates = []; for (let y = 2; y < f.rect.height - 2; y += 8) for (let x = 2; x < f.rect.width - 2; x += 8) { const q = { x: Math.round(f.rect.x + x), y: Math.round(f.rect.y + y) }, o = pointOracle(f, 'spiral', q); if (!o.insideViewport) candidates.push(q); } assert(candidates.length); const result = await move('spiral', candidates[Math.floor(candidates.length / 2)]); assert(!result.oracle.insideViewport); await state('spiral', { hovered: false }); assert.equal(await tooltip('spiral').count(), 0); }
    await page.locator('#polar-spiral').evaluate((n, style) => { if (style === null) n.removeAttribute('style'); else n.setAttribute('style', style); }, originalStyles.wrapper); await page.locator('#polar-spiral-svg').evaluate((n, style) => { if (style === null) n.removeAttribute('style'); else n.setAttribute('style', style); }, originalStyles.svg);
    checks.push('Square and wide meet viewports preserve a physical circle and reject actual blank letterbox without border-box remapping');
    await page.setViewportSize({ width: 375, height: 812 }); await hover('spiral', { series: 1, point: 5 }); const defaultTip = await tooltip('spiral').boundingBox(); assert(defaultTip.x >= 0 && defaultTip.x + defaultTip.width <= 375); await page.screenshot({ path: path.join(output, 'mobile-default.png'), fullPage: true }); await hover('radar', { series: 1, point: 2 }, true); const tip = await tooltip('radar').boundingBox(); assert(tip.x >= 0 && tip.x + tip.width <= 375); assert(await page.evaluate(() => document.documentElement.scrollWidth <= innerWidth)); await resources(); await page.screenshot({ path: path.join(output, 'mobile.png'), fullPage: true });
    checks.push('375px real default/Chinese tooltips and selected-circle clips stay within the responsive two-card layout');
    await page.setViewportSize({ width: 1280, height: 950 }); spiral = await frame('spiral'); radar = await frame('radar'); await page.locator('#polar-update').click(); await settled('spiral', { revision: 3 }, spiral.signature); await settled('radar', { revision: 3 }, radar.signature); await hover('radar', { series: 1, point: 2 }, true); await page.screenshot({ path: path.join(output, 'polar.png'), fullPage: true });
    checks.push('Final real desktop capture uses restored styles, latest raw data and an actual Chinese callback/selection rather than a generated image');

    // Temporary mixed fixture is opt-in; the product runner stays reproducible
    // without an ignored package. Supplying its fresh JS retains all16 groups.
    if (mixedCompiled) {
    assert(mixedCompiled, 'Supply a freshly compiled actual temporary mixed fixture via MOONPLOT_POLAR_MIXED_JS');
    await page.goto(`http://127.0.0.1:${server.address().port}/_acceptance/polar-mixed.html`, { waitUntil: 'networkidle' }); await page.waitForFunction(() => document.querySelector('#polar-mixed-svg') || document.querySelector('#mixed-error')); const mixedFailure = await page.locator('#mixed-error').count(); assert.equal(mixedFailure, 0, mixedFailure ? await page.locator('#mixed-error').innerText() : 'Actual mixed fixture renders');
    await page.evaluate(() => { window.mixedEvents = []; for (const type of ['mousemove', 'click']) document.addEventListener(type, e => { const svg = e.target.closest?.('svg[data-moonplot-root]'), m = svg?.getScreenCTM(); window.mixedEvents.push({ type, x: e.clientX, y: e.clientY, ctm: m ? { a: m.a, b: m.b, c: m.c, d: m.d, e: m.e, f: m.f } : null }); }, true); });
    async function mixedFrame() {
      await page.locator('#polar-mixed-svg').scrollIntoViewIfNeeded();
      return page.locator('#polar-mixed-svg').evaluate(svg => {
        const s = document.querySelector('#mixed-status'), attrs = Object.fromEntries([...s.attributes].map(a => [a.name, a.value])), matrix = m => ({ a: m.a, b: m.b, c: m.c, d: m.d, e: m.e, f: m.f }), m = svg.getScreenCTM(), circles = [...svg.querySelectorAll('g[clip-path]')].filter(n => !n.hasAttribute('data-moonplot-decoration')).flatMap(g => { const id = /^url\(["']?#([^"')]+)["']?\)$/.exec(g.getAttribute('clip-path'))?.[1], c = [...svg.querySelectorAll('clipPath')].find(c => c.id === id)?.querySelector('circle'); if (!c) return []; return [{ id, cx: Number(c.getAttribute('cx')), cy: Number(c.getAttribute('cy')), r: Number(c.getAttribute('r')), matrix: matrix(g.getScreenCTM()), markers: [...g.querySelectorAll('circle')].map(n => ({ x: Number(n.getAttribute('cx')), y: Number(n.getAttribute('cy')) })) }]; });
        const ordinary = [...svg.querySelectorAll('polyline')].find(n => n.getAttribute('stroke') === '#8a9db1' && n.getAttribute('points').trim().split(/\s+/).length === 3); if (!ordinary) throw Error('Actual ordinary three-point polyline is missing');
        const points = ordinary.getAttribute('points').trim().split(/\s+/).map(pair => { const [x, y] = pair.split(',').map(Number); return { x, y }; });
        return { attrs, circles, ordinary: { matrix: matrix(ordinary.getScreenCTM()), points }, rootMatrix: matrix(m) };
      });
    }
    function verifyMixed(f) {
      assert.equal(f.circles.length, 2); assert.equal(f.attrs['data-target-count'], '7');
      const raw = { 0: [[Math.PI / 4, 1], [Math.PI / 2, .6]], 1: [[0, .7], [Math.PI / 2, .8]], 2: [[0, .2], [1, .7], [2, .4]] }, order = [[0, 0], [0, 1], [1, 0], [1, 1], [2, 0], [2, 1], [2, 2]];
      for (const panel of [0, 1]) { const c = f.circles.find(c => Math.abs(c.cx - Number(f.attrs[`data-circle-${panel}-cx`])) < 1e-9 && Math.abs(c.cy - Number(f.attrs[`data-circle-${panel}-cy`])) < 1e-9); assert(c); c.panel = panel; near(c.r, Number(f.attrs[`data-circle-${panel}-r`])); assert.equal(c.markers.length, 2);
        raw[panel].forEach(([theta, radius], i) => { const phi = panel === 0 ? theta : Math.PI / 2 - theta; samePoint(c.markers[i], { x: c.cx + c.r * radius * Math.cos(phi), y: c.cy - c.r * radius * Math.sin(phi) }); });
      }
      order.forEach(([panel, point], i) => { const p = `data-target-${i}-`; assert.equal(Number(f.attrs[p + 'panel']), panel); assert.equal(Number(f.attrs[p + 'point']), point); assert.equal(Number(f.attrs[p + 'artist']), 0); assert.equal(f.attrs[p + 'kind'], panel === 2 ? 'ordinary' : 'polar'); near(Number(f.attrs[p + 'x']), raw[panel][point][0], 1e-12); near(Number(f.attrs[p + 'y']), raw[panel][point][1], 1e-12); near(Number(f.attrs[p + 'value']), raw[panel][point][1], 1e-12); });
      return f;
    }
    async function mixedNative(c, requested) {
      return page.locator('#polar-mixed-svg').evaluate((svg, { c, requested }) => { const circle = [...svg.querySelectorAll('clipPath')].find(n => n.id === c.id).querySelector('circle'), m = c.matrix, det = m.a * m.d - m.b * m.c, x = requested.x - m.e, y = requested.y - m.f; return circle.isPointInFill(new DOMPoint((m.d * x - m.c * y) / det, (-m.b * x + m.a * y) / det)); }, { c, requested });
    }
    async function mixedMove(f, panel, point, blank = false) {
      const circle = panel === 2 ? null : f.circles.find(c => c.panel === panel), anchor = panel === 2 ? map(f.ordinary.points[point], f.ordinary.matrix) : blank ? map({ x: circle.cx + .87 * circle.r, y: circle.cy - .87 * circle.r }, circle.matrix) : map(circle.markers[point], circle.matrix), requested = { x: Math.round(anchor.x), y: Math.round(anchor.y) };
      const admission = []; for (const c of f.circles) admission.push({ panel: c.panel, inside: await mixedNative(c, requested) });
      if (blank || panel === 2) assert(admission.every(c => !c.inside)); else { assert(admission.find(c => c.panel === panel).inside); assert(admission.filter(c => c.panel !== panel).every(c => !c.inside)); }
      await page.mouse.move(5, 5); await page.evaluate(() => new Promise(resolve => requestAnimationFrame(() => resolve()))); const before = Number(await page.locator('#mixed-status').getAttribute('data-moves')); await page.evaluate(() => { window.mixedEvents = []; }); await page.mouse.move(requested.x, requested.y); await page.mouse.click(requested.x, requested.y);
      await page.waitForFunction(before => Number(document.querySelector('#mixed-status').getAttribute('data-moves')) > before, before); const events = await page.evaluate(() => window.mixedEvents); assert(events.some(e => e.type === 'click')); for (const event of events) { assert.equal(event.x, requested.x); assert.equal(event.y, requested.y); assert(Number.isInteger(event.x) && Number.isInteger(event.y)); assert(event.ctm); }
      await page.waitForFunction(expected => { const n = document.querySelector('#mixed-status'); return n.getAttribute('data-hovered') === String(!expected.blank) && (expected.blank || Number(n.getAttribute('data-panel')) === expected.panel && Number(n.getAttribute('data-point')) === expected.point); }, { blank, panel, point });
      const attrs = await page.locator('#mixed-status').evaluate(n => Object.fromEntries([...n.attributes].map(a => [a.name, a.value]))); if (blank) assert.equal(await page.locator('[data-testid="polar-mixed-tooltip"]').count(), 0); else assert.equal(attrs['data-kind'], panel === 2 ? 'ordinary' : 'polar');
      evidence.push({ phase: 'actual-mixed-panel-event', mode: attrs['data-mode'], requested, admission, events, attrs, expected: { panel, point, blank } });
    }
    let mixed = verifyMixed(await mixedFrame()); await resources(); evidence.push({ phase: 'actual-mixed-frame', frame: mixed });
    checks.push('Temporary freshly compiled mixed Figure uses actual ordinary plus two distinct polar panels, seven original anchors and independent frame circle records');
    for (const mode of ['nearest', 'x-nearest']) {
      if ((await mixedFrame()).attrs['data-mode'] !== mode) { await page.locator('#mixed-mode').click(); await page.waitForFunction(mode => document.querySelector('#mixed-status').getAttribute('data-mode') === mode, mode); }
      mixed = verifyMixed(await mixedFrame()); await mixedMove(mixed, 0, 0, true); await mixedMove(mixed, 0, 1); await mixedMove(mixed, 1, 0); await mixedMove(mixed, 2, 1);
    }
    await page.locator('#polar-mixed').evaluate(n => { n.style.border = '7px solid #ddd'; n.style.padding = '21px'; }); await page.locator('#polar-mixed-svg').evaluate(n => { n.style.border = '5px solid #ddd'; n.style.padding = '9px'; n.style.width = '720px'; n.style.height = '520px'; }); mixed = verifyMixed(await mixedFrame()); await mixedMove(mixed, 0, 0, true); await mixedMove(mixed, 1, 1); await mixedMove(mixed, 2, 1); await resources(); await page.screenshot({ path: path.join(output, 'mixed.png'), fullPage: true });
    checks.push('Huge-radius both-mode circle-corner negatives remain local to their panel while the other polar and ordinary callbacks work, including actual bordered/padded CTM');
    }
    assert.equal(checks.length, mixedCompiled ? 16 : 14); assert.deepEqual(errors, []); assert(served.some(s => s.url === scriptPath)); if (mixedCompiled) assert(served.some(s => s.url === '/_acceptance/polar-mixed.js'));
    for (const s of served) { const expected = s.url === scriptPath ? compiled : mixedCompiled; assert.equal(s.bytes, expected.length); assert.equal(s.sha256, createHash('sha256').update(expected).digest('hex')); }
    const mixedArtifact = mixedCompiled ? { path: mixedScript, bytes: mixedCompiled.length, sha256: createHash('sha256').update(mixedCompiled).digest('hex') } : null, report = { browser: browser.version(), artifact, mixedArtifact, served, checks, evidence, pageErrors: errors };
    await fs.writeFile(path.join(output, 'report.json'), JSON.stringify(report, null, 2) + '\n'); console.log(JSON.stringify({ browser: report.browser, artifact, mixedArtifact, served, checks, actualEventGroups: evidence.filter(e => ['actual-polar-event','actual-mixed-panel-event'].includes(e.phase)).length, pageErrors: errors, report: path.join(output, 'report.json') }, null, 2));
  } catch (error) {
    if (page) { await page.screenshot({ path: path.join(output, 'failure.png'), fullPage: true }).catch(() => {}); console.error(await page.locator('body').innerText().catch(() => 'Unable to read body')); }
    await fs.writeFile(path.join(output, 'failure.json'), JSON.stringify({ error: String(error), artifact, served, checks, evidence, pageErrors: errors }, null, 2) + '\n'); throw error;
  } finally { if (browser) await browser.close(); await new Promise(resolve => server.close(resolve)); }
}
main().catch(error => { console.error(error); process.exitCode = 1; });
