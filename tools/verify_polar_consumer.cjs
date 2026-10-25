// Real external-consumer SVG paint checks; polar interaction is a later slice.
const assert = require('node:assert/strict');

async function snapshot(page) {
  return page.evaluate(() => {
    const source = document.querySelector('#polar-consumer');
    const data = { ...source.dataset };
    const raw = {};
    const panels = {};
    for (const [name, id] of [['field', 'release-polar-svg'], ['radar', 'release-radar-svg']]) {
      raw[name] = [0, 1].map(i => {
        const prefix = `data-${name}-${i}-`;
        const count = Number(source.getAttribute(prefix + 'count'));
        return { count,
          theta: Array.from({ length: count }, (_, j) => Number(source.getAttribute(prefix + 'theta-' + j))),
          radius: Array.from({ length: count }, (_, j) => Number(source.getAttribute(prefix + 'radius-' + j))) };
      });
      const svg = document.getElementById(id);
      if (!svg) throw Error('Missing actual public polar SVG: ' + id);
      const toRoot = node => svg.getScreenCTM().inverse().multiply(node.getScreenCTM());
      const at = (node, x, y) => {
        const p = new DOMPoint(x, y).matrixTransform(toRoot(node));
        return { x: p.x, y: p.y };
      };
      const clips = [...svg.querySelectorAll('clipPath')];
      if (clips.length !== 1) throw Error('Expected one true circular data clip');
      const clip = clips[0];
      const circle = clip.querySelector('circle');
      if (!circle || clip.querySelector('rect')) throw Error('Clip is not an actual circle');
      // SVGPointList and SVGAnimatedLength expose float32 values in Chrome.
      // Read the actual serialized doubles for the mathematical oracle; native
      // browser painting is independently checked by rasterization below.
      const cx = Number(circle.getAttribute('cx')), cy = Number(circle.getAttribute('cy'));
      const r = Number(circle.getAttribute('r'));
      const center = at(circle, cx, cy);
      const horizontal = at(circle, cx + r, cy);
      const vertical = at(circle, cx, cy + r);
      const physical = node => {
        const p = new DOMPoint(cx, cy).matrixTransform(node.getScreenCTM());
        const x = new DOMPoint(cx + r, cy).matrixTransform(node.getScreenCTM());
        const y = new DOMPoint(cx, cy + r).matrixTransform(node.getScreenCTM());
        return { x: Math.hypot(x.x - p.x, x.y - p.y), y: Math.hypot(y.x - p.x, y.y - p.y) };
      };
      const clipped = [...svg.querySelectorAll('g[clip-path]')].filter(node => {
        const ref = node.getAttribute('clip-path').match(/^url\(["']?#([^"')]+)["']?\)$/);
        return ref?.[1] === clip.id;
      });
      if (clipped.length !== 1) throw Error('Data group does not reference its own circle');
      const group = clipped[0];
      const lines = [...group.querySelectorAll('polyline')].map(node => ({
        color: node.getAttribute('stroke'),
        points: node.getAttribute('points').trim().split(/\s+/).map(pair => {
          const [x, y] = pair.split(',').map(Number); return at(node, x, y);
        })
      }));
      const markers = [...group.querySelectorAll('circle')].map(node => ({
        color: node.getAttribute('fill'), radius: Number(node.getAttribute('r')),
        ...at(node, Number(node.getAttribute('cx')), Number(node.getAttribute('cy')))
      }));
      const frame = [...svg.querySelectorAll('circle[stroke="#6b7280"]')];
      if (frame.length !== 1 || group.contains(frame[0])) throw Error('Frame must be outside the data clip');
      const f = frame[0];
      const frameCenter = at(f, Number(f.getAttribute('cx')), Number(f.getAttribute('cy')));
      panels[name] = {
        id, clipId: clip.id, clipUnits: clip.getAttribute('clipPathUnits'),
        center, radius: Math.hypot(horizontal.x - center.x, horizontal.y - center.y),
        verticalRadius: Math.hypot(vertical.x - center.x, vertical.y - center.y),
        physical: physical(circle), frameCenter, frameRadius: Number(f.getAttribute('r')),
        lines, markers,
        labels: [...svg.querySelectorAll('text')].filter(n => !group.contains(n)).map(n => n.textContent),
        viewBox: { width: svg.viewBox.baseVal.width, height: svg.viewBox.baseVal.height }
      };
    }
    const ids = [...document.querySelectorAll('svg [id]')].map(n => n.id);
    return { data, raw, panels, idsUnique: new Set(ids).size === ids.length };
  });
}

function near(a, b, label) {
  assert(Number.isFinite(a) && Number.isFinite(b), label + ' must be finite');
  assert(Math.abs(a - b) < 1e-8, `${label}: ${a} != ${b}`);
}

function verify(s, revision) {
  assert.equal(s.data.revision, String(revision));
  assert(s.idsUnique, 'Actual mounted SVG resources must be unique');
  for (const name of ['field', 'radar']) {
    assert.equal(s.data[name + 'Points'], '0');
    assert.equal(s.data[name + 'Targets'], '0');
    assert.equal(s.data[name + 'Artists'], '2');
    const p = s.panels[name];
    assert.equal(p.clipUnits, 'userSpaceOnUse');
    assert(p.radius > 0);
    assert.notEqual(p.viewBox.width, p.viewBox.height);
    near(p.radius, p.verticalRadius, name + ' intrinsic true circle');
    near(p.physical.x, p.physical.y, name + ' physical true circle');
    near(p.center.x, p.frameCenter.x, name + ' frame center x');
    near(p.center.y, p.frameCenter.y, name + ' frame center y');
    near(p.radius, p.frameRadius, name + ' frame radius');
  }
  const theta = [0, Math.PI / 6, Math.PI / 2, Math.PI, 3 * Math.PI / 2];
  const radii = revision % 2 ? [.5, .6, .7, .9, .65] : [.35, .7, .85, .55, .9];
  const categories = ['速度', '质量', '覆盖', '稳定', '效率'];
  const profiles = [revision % 2 ? [75, 50, 90, 60, 85] : [70, 55, 80, 65, 75], [55, 70, 60, 85, 65]];
  function series(name, artist, angles, values, color, closed, maximum, offset, direction) {
    const p = s.panels[name];
    const line = p.lines.find(line => line.color === color);
    assert(line, 'Missing actual declared series ' + color);
    assert.equal(s.raw[name][artist].count, angles.length);
    assert.equal(line.points.length, angles.length + (closed ? 1 : 0));
    for (let i = 0; i < angles.length; i++) {
      near(s.raw[name][artist].theta[i], angles[i], name + ' original theta');
      near(s.raw[name][artist].radius[i], values[i], name + ' original radius');
      const phi = offset + direction * angles[i];
      near(line.points[i].x, p.center.x + p.radius * values[i] / maximum * Math.cos(phi), name + ' projected x');
      near(line.points[i].y, p.center.y - p.radius * values[i] / maximum * Math.sin(phi), name + ' projected y');
    }
    if (closed) assert.deepEqual(line.points.at(-1), line.points[0]);
  }
  series('field', 0, theta, radii, '#6b4b9a', false, 1, 0, 1);
  const radarTheta = Array.from({ length: 5 }, (_, i) => 2 * Math.PI * i / 5);
  for (let i = 0; i < 2; i++) series('radar', i, radarTheta, profiles[i], ['#398575', '#a76a42'][i], true, 100, Math.PI / 2, -1);
  for (const text of categories) assert(s.panels.radar.labels.includes(text));
  for (const text of ['East', 'North', 'West', 'South']) assert(s.panels.field.labels.includes(text));
  const p = s.panels.field;
  assert.equal(p.markers.length, 3);
  assert.equal(s.raw.field[1].count, 3);
  for (let i = 0; i < 3; i++) {
    const angle = [0, Math.PI / 2, Math.PI / 4][i], value = [.5, .75, 1.3][i];
    const marker = p.markers[i];
    assert.equal(marker.color, '#bd7145');
    near(marker.radius, 4, 'scatter physical marker radius');
    near(s.raw.field[1].theta[i], angle, 'raw scatter theta');
    near(s.raw.field[1].radius[i], value, 'raw scatter radius');
    near(marker.x, p.center.x + p.radius * value * Math.cos(angle), 'scatter projected x');
    near(marker.y, p.center.y - p.radius * value * Math.sin(angle), 'scatter projected y');
  }
  const outside = p.markers[2];
  assert(Math.abs(outside.x - p.center.x) < p.radius && Math.abs(outside.y - p.center.y) < p.radius);
  assert(Math.hypot(outside.x - p.center.x, outside.y - p.center.y) > p.radius);
}

async function checkRaster(page) {
  return page.evaluate(async () => {
    const svg = document.getElementById('release-polar-svg');
    const markers = [...svg.querySelectorAll('g[clip-path] circle[fill="#bd7145"]')];
    const clone = svg.cloneNode(true);
    clone.removeAttribute('style');
    clone.setAttribute('width', String(svg.viewBox.baseVal.width));
    clone.setAttribute('height', String(svg.viewBox.baseVal.height));
    async function raster(node) {
      const url = URL.createObjectURL(new Blob([new XMLSerializer().serializeToString(node)], { type: 'image/svg+xml' }));
      try {
        const image = new Image(); image.src = url; await image.decode();
        const canvas = document.createElement('canvas'); canvas.width = image.naturalWidth; canvas.height = image.naturalHeight;
        const context = canvas.getContext('2d'); context.drawImage(image, 0, 0);
        return [markers[0], markers[2]].map(marker => {
          const point = new DOMPoint(marker.cx.baseVal.value, marker.cy.baseVal.value)
            .matrixTransform(svg.getScreenCTM().inverse().multiply(marker.getScreenCTM()));
          return [...context.getImageData(Math.round(point.x), Math.round(point.y), 1, 1).data];
        });
      } finally { URL.revokeObjectURL(url); }
    }
    const clipped = await raster(clone);
    // Counterfactual removes only the real circle clip, proving the original
    // outside marker is clipped rather than omitted or hidden by the viewport.
    for (const node of clone.querySelectorAll('g[clip-path]')) node.removeAttribute('clip-path');
    return { clipped, unclipped: await raster(clone) };
  });
}

async function desktop(page, checks, events, initial) {
  verify(initial, 0);
  const current = await snapshot(page);
  verify(current, 1);
  assert.notDeepEqual(current.panels.field.lines[0].points, initial.panels.field.lines[0].points);
  assert.notDeepEqual(current.panels.radar.lines[0].points, initial.panels.radar.lines[0].points);
  checks.push('Public polar consumer retains raw theta/radius, projects five actual chords on a non-square true circle and redraws current data');
  checks.push('Public radar consumer keeps two original five-category profiles and paints six closed vertices using explicit north-zero clockwise projection');
  const pixels = await checkRaster(page);
  const orange = pixel => pixel[0] === 189 && pixel[1] === 113 && pixel[2] === 69 && pixel[3] === 255;
  assert(orange(pixels.clipped[0]), 'Inside actual SVG marker must paint');
  assert(!orange(pixels.clipped[1]), 'Outside-circle marker inside the bounding square must be clipped');
  assert(orange(pixels.unclipped[1]), 'Removing only the actual circle clip must reveal the retained outside marker');
  events.push({ raster: pixels });
  checks.push('Browser native SVG raster proves a retained scatter marker inside the square but outside the true disk is removed by the actual circle clip');
  for (const id of ['release-polar-svg', 'release-radar-svg']) {
    await page.locator('#' + id).scrollIntoViewIfNeeded();
    const point = await page.locator('#' + id).evaluate(svg => {
      const vertex = svg.querySelector('g[clip-path] polyline').points.getItem(1);
      const p = new DOMPoint(vertex.x, vertex.y).matrixTransform(svg.getScreenCTM());
      const x = Math.round(p.x), y = Math.round(p.y);
      window.__releasePolarEvent = null;
      svg.addEventListener('mousemove', event => {
        window.__releasePolarEvent = { x: event.clientX, y: event.clientY };
      }, { once: true });
      return { x, y };
    });
    await page.mouse.move(point.x, point.y);
    await page.waitForFunction(() => window.__releasePolarEvent !== null);
    const actualEvent = await page.evaluate(() => window.__releasePolarEvent);
    assert.deepEqual(actualEvent, point);
    assert.equal(await page.locator(`[data-testid="${id.slice(0, -4)}-tooltip"]`).count(), 0);
    events.push({ id, requested: point, actualEvent });
  }
  checks.push('Actual integer mouse events on mounted polar and radar DOM produce no invented Cartesian tooltip; both public drawings expose zero targets');
}

async function mobile(page, checks) {
  await page.locator('#release-polar-svg').scrollIntoViewIfNeeded();
  verify(await snapshot(page), 1);
  assert(await page.evaluate(() => document.documentElement.scrollWidth <= innerWidth));
  checks.push('375px public polar and radar retain physically round clipping, category labels and zero captures without page overflow');
}

module.exports = { snapshot, desktop, mobile };
