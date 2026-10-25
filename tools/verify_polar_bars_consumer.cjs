const assert = require('node:assert/strict');

async function snapshot(page) {
  return page.locator('#polar-bars-consumer').evaluate(node => ({ ...node.dataset }));
}

function near(a, b, label) {
  assert(Number.isFinite(a) && Number.isFinite(b), label + ' finite');
  assert(Math.abs(a - b) < 1e-8, `${label}: ${a} != ${b}`);
}

async function interact(page, name, request, events, type = 'mousemove') {
  const id = name === 'bars' ? 'release-polar-bars' : 'release-rose';
  await page.locator('#' + id + '-svg').scrollIntoViewIfNeeded();
  const sample = await page.evaluate(({ id, name, request, type }) => {
    const svg = document.getElementById(id + '-svg');
    const d = document.getElementById('polar-bars-consumer').dataset;
    const color = name === 'bars' ? '#398575' : '#a76a42';
    const shapes = [...svg.querySelectorAll(`g[clip-path] path[fill="${color}"], g[clip-path] circle[fill="${color}"]`)];
    if (shapes.length !== 3) throw Error('Expected three actual filled positive sectors');
    const cx = Number(d[name + 'Cx']), cy = Number(d[name + 'Cy']);
    const r = Number(d[name + 'DiskRadius']);
    const theta = request.blank ? 5 * Math.PI / 4 : [0, Math.PI / 2, Math.PI][request.index];
    const rawRadius = request.blank ? null : Number(d[`${name}-0Radius-${request.index}`]);
    const phi = name === 'bars' ? theta : Math.PI / 2 - theta;
    let radial = request.blank ? .75 : Math.min(rawRadius, 1) * (request.fraction || .8);
    let x = cx + r * radial * Math.cos(phi), y = cy - r * radial * Math.sin(phi);
    if (request.corner) { x = cx + .9 * r; y = cy + .9 * r; }
    const matrix = svg.getScreenCTM();
    const point = new DOMPoint(x, y).matrixTransform(matrix);
    const clientX = Math.round(point.x), clientY = Math.round(point.y);
    const intrinsic = new DOMPoint(clientX, clientY).matrixTransform(matrix.inverse());
    const distance = Math.hypot(intrinsic.x - cx, intrinsic.y - cy);
    const nativeFill = shapes.map(shape => shape.isPointInFill(new DOMPoint(clientX, clientY).matrixTransform(shape.getScreenCTM().inverse())));
    if (request.blank && nativeFill.some(Boolean)) throw Error('The intended blank angle actually paints');
    if (request.corner && distance <= r) throw Error('Corner lost its outside-circle proof');
    if (!request.blank && !request.corner && (!nativeFill[request.index] || distance > r)) throw Error('Positive integer event must be in the actual native sector fill');
    window.__releasePolarBarEvent = null;
    svg.addEventListener(type, e => { window.__releasePolarBarEvent = { clientX: e.clientX, clientY: e.clientY, type: e.type }; }, { once: true });
    return { clientX, clientY, intrinsic: { x: intrinsic.x, y: intrinsic.y }, nativeFill, distance, circle: { cx, cy, r }, theta, rawRadius };
  }, { id, name, request, type });
  if (type === 'click') await page.mouse.click(sample.clientX, sample.clientY);
  else { await page.mouse.move(1, 1); await page.mouse.move(sample.clientX, sample.clientY); }
  await page.waitForFunction(() => window.__releasePolarBarEvent !== null);
  const actualEvent = await page.evaluate(() => window.__releasePolarBarEvent);
  assert.deepEqual(actualEvent, { clientX: sample.clientX, clientY: sample.clientY, type });
  events.push({ name, request, ...sample, actualEvent });
  return sample;
}

async function state(page, name, index, type = 'hover') {
  await page.waitForFunction(({ name, index, type }) => {
    const d = document.getElementById('polar-bars-consumer').dataset;
    return d[name + type[0].toUpperCase() + type.slice(1)] === String(index);
  }, { name, index, type });
  const d = await snapshot(page);
  const prefix = name + type[0].toUpperCase() + type.slice(1);
  if (index >= 0) {
    assert.equal(d[prefix + 'Artist'], '0');
    assert.equal(d[prefix + 'PolarBar'], 'true');
    near(Number(d[prefix + 'Theta']), [0, Math.PI / 2, Math.PI][index], 'original theta');
    near(Number(d[prefix + 'Radius']), Number(d[`${name}-0Radius-${index}`]), 'original radius');
    near(Number(d[prefix + 'Value']), Number(d[`${name}-0Radius-${index}`]), 'original value');
  }
  return d;
}

async function clippedSelection(page, id) {
  const result = await page.locator('#' + id + '-svg').evaluate((svg, id) => {
    const highlight = svg.querySelector(`[data-testid="${id}-selected"]`);
    if (!highlight) throw Error('Missing selected marker');
    const clipped = highlight.closest('[clip-path]');
    if (!clipped) throw Error('Missing selected circle clip');
    const ref = clipped.getAttribute('clip-path').match(/^url\(["']?#([^"')]+)["']?\)$/)[1];
    const clip = [...svg.querySelectorAll('clipPath')].find(n => n.id === ref);
    const circle = clip?.querySelector('circle');
    if (!circle) throw Error('Selected marker must use the actual circle');
    const dataGroup = [...svg.querySelectorAll('g[clip-path]')].find(n => n.querySelector('path[fill="#398575"], path[fill="#a76a42"]'));
    const dataRef = dataGroup.getAttribute('clip-path').match(/^url\(["']?#([^"')]+)["']?\)$/)[1];
    const dataCircle = [...svg.querySelectorAll('clipPath')].find(n => n.id === dataRef).querySelector('circle');
    const values = n => [Number(n.getAttribute('cx')), Number(n.getAttribute('cy')), Number(n.getAttribute('r'))];
    return { decoration: values(circle), actual: values(dataCircle), scoped: ref.startsWith('moonplot-decoration-') && ref.endsWith('-polar-0-selected') };
  }, id);
  assert(result.scoped);
  assert(result.actual[2] > 0);
  for (let i = 0; i < 3; i++) near(result.decoration[i], result.actual[i], 'same actual selection circle');
}

async function desktop(page, checks, events, initial) {
  const d = await snapshot(page);
  assert.equal(initial.revision, '0');
  assert.equal(d.revision, '1');
  for (const name of ['bars', 'rose']) {
    assert.equal(d[name + 'Points'], '3');
    assert.equal(d[name + 'Targets'], '3');
    assert.equal(d[name + 'Artists'], '1');
    assert.equal(d[name + '-0Count'], '4');
    near(Number(initial[name + '-0Radius-0']), .6, 'initial radius');
    near(Number(d[name + '-0Radius-0']), .7, 'updated radius');
    near(Number(d[name + '-0Radius-2']), 1.6, 'raw clipped radius');
  }
  // The updated face extends beyond the previous 0.6 radius.
  const updated = await interact(page, 'bars', { index: 0, fraction: .95 }, events);
  assert(updated.distance > updated.circle.r * .6);
  await state(page, 'bars', 0);
  const tip = page.locator('[data-testid="release-polar-bars-tooltip"]');
  assert.equal(await tip.getAttribute('data-moonplot-kind'), 'polar-bar');
  assert.deepEqual(await tip.locator('.moonplot-coordinate-label').allTextContents(), ['Theta (rad)', 'Radius']);
  const values = await tip.locator('.moonplot-coordinate b').allTextContents();
  near(Number(values[0]), 0, 'default theta'); near(Number(values[1]), .7, 'default radius');
  checks.push('Installed polar bars redraw linear-radius filled sectors from current data; native face interiors select original theta/radius with default rows');

  await interact(page, 'bars', { index: 2, fraction: .85 }, events, 'click');
  await state(page, 'bars', 2, 'selected');
  await clippedSelection(page, 'release-polar-bars');
  await interact(page, 'rose', { index: 2, fraction: .85 }, events);
  await state(page, 'rose', 2);
  const custom = page.locator('[data-testid="consumer-rose-tooltip"]');
  assert.equal(await custom.getAttribute('data-polar-bar'), 'true');
  near(Number(await custom.getAttribute('data-theta')), Math.PI, 'Chinese raw theta');
  near(Number(await custom.getAttribute('data-radius')), 1.6, 'Chinese raw radius');
  assert((await custom.textContent()).includes('半径 1.6 单位'));
  checks.push('Installed polar sector faces keep clipped raw radius and original indices through click selection and north-zero clockwise Chinese tooltip formatting');

  for (const name of ['bars', 'rose']) {
    await interact(page, name, { blank: true }, events); await state(page, name, -1);
    await interact(page, name, { corner: true, index: 0 }, events); await state(page, name, -1);
    const testid = name === 'bars' ? 'release-polar-bars-tooltip' : 'consumer-rose-tooltip';
    assert.equal(await page.locator(`[data-testid="${testid}"]`).count(), 0);
  }
  checks.push('Nearest and XNearest installed polar bars leave real blank angles and outside-circle square corners unselected despite a 10000-pixel hit radius');
}

async function mobile(page, checks, events) {
  await interact(page, 'bars', { index: 1 }, events, 'click');
  await state(page, 'bars', 1, 'selected');
  await clippedSelection(page, 'release-polar-bars');
  await interact(page, 'rose', { index: 2 }, events);
  await state(page, 'rose', 2);
  assert(await page.evaluate(() => document.documentElement.scrollWidth <= innerWidth));
  assert((await page.locator('[data-testid="consumer-rose-tooltip"]').textContent()).includes('半径 1.6 单位'));
  checks.push('375px installed rose sectors retain actual whole-face click/hover, circle-clipped selection and readable Chinese raw values without overflow');
}

module.exports = { snapshot, desktop, mobile };
