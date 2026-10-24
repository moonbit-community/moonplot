// Actual-page regression for shared SVG source IDs in two public adapter views.
// Build cmd/resources first. Install Playwright, or set PLAYWRIGHT_MODULE.
const assert = require('node:assert/strict');
const fs = require('node:fs/promises');
const http = require('node:http');
const path = require('node:path');
const { chromium } = require(process.env.PLAYWRIGHT_MODULE || 'playwright');

const root = __dirname;
const output = path.resolve(process.env.MOONPLOT_RESOURCE_OUTPUT ||
  path.join(root, '../../.moonagent/checkpoints/M2/resource-browser/final'));
const checks = [];
const evidence = [];

async function main() {
  await fs.mkdir(output, { recursive: true });
  await fs.access(path.join(root,
    '_build/js/debug/build/moonbit-community/moonplot-rabbita/cmd/resources/resources.js'));
  const server = http.createServer(async (req, res) => {
    try {
      const url = new URL(req.url, 'http://127.0.0.1');
      if (url.pathname === '/favicon.ico') { res.writeHead(204); res.end(); return; }
      const filename = path.resolve(root, '.' + decodeURIComponent(
        url.pathname === '/' ? '/resources.html' : url.pathname));
      if (!filename.startsWith(root + path.sep)) { res.writeHead(403); res.end(); return; }
      const content = await fs.readFile(filename);
      const mime = { '.html': 'text/html', '.js': 'text/javascript', '.css': 'text/css' };
      res.writeHead(200, { 'Content-Type': mime[path.extname(filename)] || 'application/octet-stream' });
      res.end(content);
    } catch (_) { res.writeHead(404); res.end('Not found'); }
  });
  await new Promise(resolve => server.listen(0, '127.0.0.1', resolve));
  let browser;
  let page;
  const errors = [];
  try {
    const channel = process.env.BROWSER_CHANNEL || 'chrome';
    browser = await chromium.launch({ headless: true,
      ...(channel === 'bundled' ? {} : { channel }) });
    page = await browser.newPage({ viewport: { width: 1100, height: 700 }, deviceScaleFactor: 1 });
    page.on('pageerror', error => errors.push(String(error)));
    page.on('console', message => { if (message.type() === 'error') errors.push(message.text()); });
    await page.goto(`http://127.0.0.1:${server.address().port}/resources.html`, { waitUntil: 'networkidle' });
    await page.waitForFunction(() => document.querySelector('#resource-blue-svg') ||
      document.querySelector('#resource-error'));
    const fixtureError = await page.locator('#resource-error').count();
    assert.equal(fixtureError, 0, fixtureError ?
      await page.locator('#resource-error').textContent() : 'Fixture rendering failed');

    async function resourceAudit(phase) {
      const audit = await page.evaluate(() => {
        const ids = [...document.querySelectorAll('[id]')].map(node => node.id);
        const duplicateIds = ids.filter((id, index) => ids.indexOf(id) !== index);
        const charts = [...document.querySelectorAll('svg[data-moonplot-root]')].map(svg => {
          const references = [];
          function target(value, source, property) {
            const id = decodeURIComponent(new URL(value, document.baseURI).hash.slice(1));
            const node = document.getElementById(id);
            references.push({ property, id, source: source.tagName,
              found: !!node, local: node === svg || node?.ownerSVGElement === svg,
              target: node?.tagName || null });
          }
          function urlReferences(node, property) {
            const value = getComputedStyle(node).getPropertyValue(property);
            for (const match of value.matchAll(/url\(\s*(?:"([^"]*)"|'([^']*)'|([^\s)]*))\s*\)/g)) {
              target(match[1] ?? match[2] ?? match[3], node, property);
            }
          }
          const tile = svg.querySelector('rect[clip-path]');
          const strip = svg.querySelector('rect[style]');
          for (const property of ['fill', 'clip-path']) urlReferences(tile, property);
          for (const property of ['fill', 'stroke']) urlReferences(strip, property);
          // A custom property exercises a root-ID alias without changing paint.
          // This is reference-identity evidence; painted resources use pixels below.
          urlReferences(svg, '--source-root');
          for (const gradient of svg.querySelectorAll('linearGradient[href]')) {
            target(gradient.getAttribute('href'), gradient, 'href');
          }
          return { id: svg.id, references,
            computedFill: getComputedStyle(tile).fill,
            computedClip: getComputedStyle(tile).clipPath,
            clipX: svg.querySelector('clipPath rect').getAttribute('x'),
            clipWidth: svg.querySelector('clipPath rect').getAttribute('width'),
            namespaced: [...svg.querySelectorAll('*')].every(node =>
              node.namespaceURI === 'http://www.w3.org/2000/svg') };
        });
        return { duplicateIds, charts };
      });
      evidence.push({ phase, ...audit });
      assert.deepEqual(audit.duplicateIds, [], `${phase}: all document IDs must be unique`);
      assert.equal(audit.charts.length, 2);
      for (const chart of audit.charts) {
        assert(chart.namespaced, `${phase}: actual SVG namespace`);
        assert(chart.references.length >= 7, `${phase}: URL, CSS, root alias and href chain present`);
        const rootReference = chart.references.find(ref => ref.property === '--source-root');
        assert.equal(rootReference?.id, chart.id, `${phase}: source root maps to actual view SVG`);
        for (const ref of chart.references) {
          assert(ref.found && ref.local, `${phase}: ${chart.id} ${ref.property} resolves inside its own SVG`);
        }
      }
      return audit;
    }

    // The source of every pixel is Chromium's screenshot of the shared document.
    // Canvas only decodes that PNG; no SVG serialization or isolated re-rendering.
    async function pixelAudit(phase, revision) {
      const positions = await page.evaluate(() => {
        const points = [];
        for (const color of ['red', 'blue']) {
          const svg = document.querySelector(`#resource-${color}-svg`);
          const definitions = [
            ['inside', color === 'red' ? 60 : 240, 70],
            ['outside', color === 'red' ? 240 : 60, 70],
            ['strip', 80, 176],
            ['edge', color === 'red' ? 150 : 170, 70],
          ];
          for (const [kind, x, y] of definitions) {
            const p = new DOMPoint(x, y).matrixTransform(svg.getScreenCTM());
            points.push({ color, kind, x: Math.floor(p.x), y: Math.floor(p.y) });
          }
        }
        return points;
      });
      const filename = path.join(output, `${phase}.png`);
      const screenshot = await page.screenshot({ path: filename });
      const samples = await page.evaluate(async ({ png, positions }) => {
        const image = new Image(); image.src = 'data:image/png;base64,' + png;
        await image.decode();
        const canvas = document.createElement('canvas');
        canvas.width = image.naturalWidth; canvas.height = image.naturalHeight;
        const context = canvas.getContext('2d'); context.drawImage(image, 0, 0);
        return positions.map(point => ({ ...point,
          rgba: [...context.getImageData(point.x, point.y, 1, 1).data] }));
      }, { png: screenshot.toString('base64'), positions });
      evidence.push({ phase, screenshot: path.basename(filename), samples });
      for (const sample of samples) {
        const [r, g, b, a] = sample.rgba;
        assert.equal(a, 255);
        const white = sample.kind === 'outside' ||
          (sample.kind === 'edge' && revision % 2 === 1);
        if (white) {
          assert(r > 245 && g > 245 && b > 245,
            `${phase}: ${sample.color} ${sample.kind} is clipped to white: ${sample.rgba}`);
        } else if (sample.color === 'red') {
          assert(r > g + 70 && r > b + 70,
            `${phase}: red ${sample.kind} retains its own gradient: ${sample.rgba}`);
        } else {
          assert(b > r + 70 && b > g + 30,
            `${phase}: blue ${sample.kind} retains its own gradient: ${sample.rgba}`);
        }
      }
    }

    await resourceAudit('initial');
    checks.push('Shared source IDs become unique document IDs through public view');
    checks.push('Computed fill, clip, quoted CSS URLs and both href chain edges resolve locally');
    await pixelAudit('initial', 0);
    checks.push('Actual shared-document screenshot shows red/blue gradients and distinct clip regions');

    async function clickPoint(color, count) {
      const point = await page.locator(`#resource-${color}-svg`).evaluate(svg => {
        const marker = svg.querySelector('circle');
        const p = new DOMPoint(marker.cx.baseVal.value, marker.cy.baseVal.value)
          .matrixTransform(svg.getScreenCTM());
        return { x: p.x, y: p.y };
      });
      await page.mouse.move(point.x, point.y);
      await page.waitForSelector(`[data-testid="resource-${color}-tooltip"]`);
      await page.mouse.click(point.x, point.y);
      await page.waitForFunction(({ color, count }) =>
        document.querySelector(`#resource-${color}-clicks`)?.textContent === `Clicks: ${count}`,
      { color, count });
    }
    await clickPoint('red', 1);
    await clickPoint('blue', 1);
    checks.push('Independent hover and click dispatch survives resource rewriting');

    await page.locator('#redraw').click();
    await page.waitForFunction(() => document.querySelector('#revision')?.textContent === 'Revision 1');
    const changed = await resourceAudit('redraw');
    assert(changed.charts.every(chart => chart.clipWidth === '120'));
    await pixelAudit('redraw', 1);
    checks.push('Redraw refreshes both clip geometries while preserving resource isolation');

    await page.locator('#reverse').click();
    await page.waitForFunction(() => document.querySelector('svg[data-moonplot-root]')?.id === 'resource-blue-svg');
    await resourceAudit('reversed');
    await pixelAudit('reversed', 1);
    await clickPoint('red', 2);
    await clickPoint('blue', 2);
    checks.push('Reversing chart order retains colors, local references and independent events');

    for (let i = 0; i < 3; i++) {
      await page.locator('#mount').click();
      await page.waitForSelector('#resources-unmounted');
      assert.equal(await page.locator('svg').count(), 0);
      await page.locator('#mount').click();
      await page.waitForSelector('#resource-blue-svg');
      await resourceAudit(`remount-${i + 1}`);
    }
    await pixelAudit('remounted', 1);
    await clickPoint('red', 3);
    await clickPoint('blue', 3);
    checks.push('Three unmount/remount cycles leave no stale resources or duplicate listeners');

    assert.deepEqual(errors, []);
    const report = { browser: browser.version(), checks, pageErrors: errors, evidence };
    await fs.writeFile(path.join(output, 'report.json'), JSON.stringify(report, null, 2) + '\n');
    console.log(JSON.stringify({ browser: report.browser, checks, pageErrors: errors }, null, 2));
  } catch (error) {
    if (page) await page.screenshot({ path: path.join(output, 'failure.png') }).catch(() => {});
    await fs.writeFile(path.join(output, 'failure.json'),
      JSON.stringify({ message: String(error), checks, pageErrors: errors, evidence }, null, 2) + '\n');
    throw error;
  } finally {
    if (browser) await browser.close();
    await new Promise(resolve => server.close(resolve));
  }
}

main().catch(error => { console.error(error); process.exitCode = 1; });
