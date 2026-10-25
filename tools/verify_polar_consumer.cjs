// Real external-consumer polar paint and original-sample interaction checks.
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
      const dataGroups = [...svg.querySelectorAll('g[clip-path]')].filter(node => node.querySelector('polyline'));
      if (dataGroups.length !== 1) throw Error('Expected one actual circular data group');
      const dataRef = dataGroups[0].getAttribute('clip-path').match(/^url\(["']?#([^"')]+)["']?\)$/);
      const clip = [...svg.querySelectorAll('clipPath')].find(node => node.id === dataRef?.[1]);
      if (!clip) throw Error('Actual data group has no scoped circular resource');
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
    assert.equal(s.data[name + 'Points'], name === 'field' ? '7' : '10');
    assert.equal(s.data[name + 'Targets'], name === 'field' ? '7' : '10');
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
  await interact(page, 'field', { artist: 0, index: 1 }, events);
  await expectState(page, 'field', 0, 1, Math.PI / 6, .6, 'Polar radius', '');
  const defaultTip = page.locator('[data-testid="release-polar-tooltip"]');
  assert.equal(await defaultTip.getAttribute('data-moonplot-kind'), 'polar');
  assert.deepEqual(await defaultTip.locator('.moonplot-coordinate-label').allTextContents(), ['Theta (rad)', 'Radius']);
  const values = await defaultTip.locator('.moonplot-coordinate b').allTextContents();
  near(Number(values[0]), Math.PI / 6, 'default raw radians');
  near(Number(values[1]), .6, 'default original radius');
  checks.push('Installed polar line selects a nearby original sample without visible markers and shows exact raw radians and radius in default rows');
  await interact(page, 'field', { artist: 1, index: 1 }, events, 'click');
  await expectState(page, 'field', 1, 1, Math.PI / 2, .75, 'Samples', '', 'selected');
  await assertHighlight(page, 'release-polar', 'selected');
  checks.push('Installed polar scatter click preserves its own artist and original index, with selection clipped to the same immutable frame circle');
  await interact(page, 'radar', { artist: 0, index: 2 }, events);
  await expectState(page, 'radar', 0, 2, 4 * Math.PI / 5, 90, 'Current', '覆盖');
  const custom = page.locator('[data-testid="consumer-radar-tooltip"]');
  assert.equal(await custom.getAttribute('data-category'), '覆盖');
  near(Number(await custom.getAttribute('data-theta')), 4 * Math.PI / 5, 'custom original theta');
  assert((await custom.textContent()).includes('覆盖：90 分；原角度'));
  await interact(page, 'radar', { artist: 0, index: 2 }, events, 'click');
  await expectState(page, 'radar', 0, 2, 4 * Math.PI / 5, 90, 'Current', '覆盖', 'selected');
  await assertHighlight(page, 'release-radar', 'selected');
  checks.push('Installed clockwise north-zero radar preserves its original category and raw angle/radius through XNearest, Chinese formatting and click selection');
  for (const name of ['field', 'radar']) {
    await interact(page, name, { negative: 'corner' }, events);
    await page.waitForFunction(name => document.querySelector('#polar-consumer').dataset[name + 'Hover'] === '-1', name);
    const id = name === 'field' ? 'release-polar' : 'release-radar';
    assert.equal(await page.locator(`[data-testid="${id}-tooltip"]`).count(), 0);
    assert.equal(await page.locator(`[data-testid="${id}-hover"]`).count(), 0);
  }
  checks.push('Real integer pointer events inside each circle bounding square but outside its true disk clear hover in both installed point modes');
}

async function expectState(page, name, artist, index, theta, radius, series, category, kind = 'hover') {
  const key = name + kind[0].toUpperCase() + kind.slice(1);
  await page.waitForFunction(({ key, index, artist }) => {
    const d = document.querySelector('#polar-consumer').dataset;
    return d[key] === String(index) && d[key + 'Artist'] === String(artist);
  }, { key, index, artist });
  const d = await page.locator('#polar-consumer').evaluate(n => ({ ...n.dataset }));
  near(Number(d[key + 'Theta']), theta, name + ' raw theta');
  near(Number(d[key + 'Radius']), radius, name + ' raw radius');
  near(Number(d[key + 'Value']), radius, name + ' raw value');
  assert.equal(d[key + 'Series'], series);
  assert.equal(d[key + 'Category'], category);
  assert.equal(d[key + 'Polar'], 'true');
}

async function assertHighlight(page, id, kind) {
  const proof = await page.locator('#' + id + '-svg').evaluate((svg, { id, kind }) => {
    const highlight = svg.querySelector(`[data-testid="${id}-${kind}"]`);
    if (!highlight) throw Error('Missing actual selection decoration');
    let node = highlight;
    while (node && node !== svg && !node.hasAttribute('clip-path')) node = node.parentElement;
    const ref = node?.getAttribute('clip-path')?.match(/^url\(["']?#([^"')]+)["']?\)$/)?.[1];
    const clip = [...svg.querySelectorAll('clipPath')].find(n => n.id === ref);
    const circle = clip?.querySelector('circle');
    if (!circle) throw Error('Actual polar decoration is missing its own circular clip');
    const c = n => [Number(n.getAttribute('cx')), Number(n.getAttribute('cy')), Number(n.getAttribute('r'))];
    const paintGroup = [...svg.querySelectorAll('g[clip-path]')].find(n => n.querySelector('polyline'));
    const dataId = paintGroup.getAttribute('clip-path').match(/^url\(["']?#([^"')]+)["']?\)$/)[1];
    const dataCircle = [...svg.querySelectorAll('clipPath')].find(n => n.id === dataId).querySelector('circle');
    return { own: c(circle), actual: c(dataCircle), scoped: ref.startsWith('moonplot-decoration-') && ref.endsWith('-polar-0-' + kind) };
  }, { id, kind });
  for (let i = 0; i < 3; i++) near(proof.own[i], proof.actual[i], 'actual decoration clip');
  assert(proof.scoped, 'Decoration resources must be scoped to this adapter');
}

async function interact(page, name, request, events, type = 'mousemove') {
  const id = name === 'field' ? 'release-polar-svg' : 'release-radar-svg';
  await page.locator('#' + id).scrollIntoViewIfNeeded();
  const eventPoint = await page.locator('#' + id).evaluate((svg, { name, request, type }) => {
    const data = document.querySelector('#polar-consumer').dataset;
    const cx = Number(data[name + 'Cx']), cy = Number(data[name + 'Cy']), r = Number(data[name + 'DiskRadius']);
    const matrix = svg.getScreenCTM();
    let x, y;
    if (request.negative === 'corner') {
      x = cx + .9 * r; y = cy + .9 * r;
    } else {
      let paint;
      if (name === 'field' && request.artist === 1) {
        const marker = svg.querySelectorAll('g[clip-path] circle[fill="#bd7145"]')[request.index];
        x = Number(marker.getAttribute('cx')); y = Number(marker.getAttribute('cy'));
        paint = marker;
      } else {
        const colors = name === 'field' ? ['#6b4b9a'] : ['#398575', '#a76a42'];
        paint = [...svg.querySelectorAll('g[clip-path] polyline')].find(n => n.getAttribute('stroke') === colors[request.artist]);
        const xy = paint.getAttribute('points').trim().split(/\s+/)[request.index].split(',').map(Number);
        [x, y] = xy;
      }
      const actual = new DOMPoint(x, y).matrixTransform(matrix.inverse().multiply(paint.getScreenCTM()));
      x = actual.x; y = actual.y;
    }
    const client = new DOMPoint(x, y).matrixTransform(matrix);
    const clientX = Math.round(client.x), clientY = Math.round(client.y);
    const intrinsic = new DOMPoint(clientX, clientY).matrixTransform(matrix.inverse());
    const distance = Math.hypot(clientX - client.x, clientY - client.y);
    if (distance > .71) throw Error('Unstable integer pointer location');
    const diskDistance = Math.hypot(intrinsic.x - cx, intrinsic.y - cy);
    if (request.negative && diskDistance <= r) throw Error('Integer event no longer proves outside the actual disk');
    if (!request.negative && diskDistance > r) throw Error('Positive sample is outside the actual disk');
    window.__releasePolarEvent = null;
    svg.addEventListener(type, e => { window.__releasePolarEvent = { clientX: e.clientX, clientY: e.clientY, type: e.type }; }, { once: true });
    return { clientX, clientY, type, intrinsic: { x: intrinsic.x, y: intrinsic.y }, diskDistance, r, distance };
  }, { name, request, type });
  if (type === 'click') await page.mouse.click(eventPoint.clientX, eventPoint.clientY);
  else {
    await page.mouse.move(1, 1);
    await page.mouse.move(eventPoint.clientX, eventPoint.clientY);
  }
  await page.waitForFunction(() => window.__releasePolarEvent !== null);
  const actualEvent = await page.evaluate(() => window.__releasePolarEvent);
  assert.deepEqual(actualEvent, { clientX: eventPoint.clientX, clientY: eventPoint.clientY, type });
  events.push({ name, request, ...eventPoint, actualEvent });
}

async function mobile(page, checks) {
  await page.locator('#release-polar-svg').scrollIntoViewIfNeeded();
  verify(await snapshot(page), 1);
  assert(await page.evaluate(() => document.documentElement.scrollWidth <= innerWidth));
  const mobileEvents = [];
  await interact(page, 'field', { artist: 0, index: 1 }, mobileEvents);
  await expectState(page, 'field', 0, 1, Math.PI / 6, .6, 'Polar radius', '');
  await interact(page, 'radar', { artist: 1, index: 3 }, mobileEvents, 'click');
  await expectState(page, 'radar', 1, 3, 6 * Math.PI / 5, 85, 'Reference', '稳定', 'selected');
  await assertHighlight(page, 'release-radar', 'selected');
  assert(await page.evaluate(() => document.documentElement.scrollWidth <= innerWidth));
  checks.push('375px installed polar and radar retain physical original-sample picking, clipped selections and readable custom category/radius metadata without overflow');
  return mobileEvents;
}

module.exports = { snapshot, desktop, mobile };
