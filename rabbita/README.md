# MoonPlot for Rabbita

Interactive MoonPlot SVG components built with public
[Rabbita](https://github.com/moonbit-community/rabbita) APIs. The component returns
real SVG DOM inside composable `Html`; your application owns its state.

The component is the **`Lampese/mathplotlib/rabbita` package** in the unified
`Lampese/mathplotlib@0.3.0` module. See [installation and release status](../docs/PUBLISHING.md)
for the current publication result. There is no separate adapter module to install.

![Two interactive charts](https://raw.githubusercontent.com/moonbit-community/moonplot/master/assets/rabbita-interactive.png)

## Install and import

From your application's module directory:

```sh
moon add Lampese/mathplotlib@0.3.0
```

Import the packages used by your application's view in `moon.pkg`:

```moonbit nocheck
import {
  "Lampese/mathplotlib",
  "Lampese/mathplotlib/drawing",
  "Lampese/mathplotlib/rabbita" @plot_dom,
  "moonbit-community/rabbita",
  "moonbit-community/rabbita/html",
}

supported_targets = "js"
```

Keep the explicit `@plot_dom` alias so it does not conflict with Rabbita's own
`@rabbita` alias. The core facade still uses `@mathplotlib`.
Installing this one module resolves its declared Rabbita dependencies too.
Core plotting, Scene and Drawing do not import UI types; the browser component
and its executables declare `supported_targets = "js"`.

## Hover values and regions (0.3.0)

Line/scatter targets now carry semantic metadata. Bar and horizontal-bar rectangles,
histogram bins and pie sectors also support hover and click selection.
Set `hit_mode=@drawing.HitMode::XNearest` to select actual line samples by horizontal
position inside their panel. The default `Nearest` retains existing point-radius behavior.
Pass `tooltip=info => ...` for custom Rabbita content; `tooltip_visible=false` hides the
floating content while preserving events, and `tooltip_class` adds your styling hook.
`HitInfo` supplies series, category, value, histogram interval and pie fraction.
See the [complete tooltip guide](../docs/TOOLTIPS.md) and the
[six-chart example](https://github.com/moonbit-community/moonplot/blob/v0.3.0/rabbita/cmd/tooltips/main.mbt).

## Component API

Your application must also declare `moonbit-community/rabbita@0.16.7` when importing
Rabbita APIs directly: `moon add moonbit-community/rabbita@0.16.7`. MoonPlot itself
is one module; this is your application’s framework dependency.


Create a drawing snapshot and compose it into the Rabbita view:

```moonbit nocheck
let drawing = figure.to_drawing()
let chart = @plot_dom.view(
  drawing,
  id="measurements",
  on_event=event => emit(Chart(event)),
  hovered?=model.hovered,
  selected?=model.selected,
  legend=[@plot_dom.legend_item("trend", "Trend", "#2563eb", model.show_trend)],
)
```

Handle `Hover(HitPoint?)`, `Click(HitPoint?)` and `ToggleSeries(String)` in your
update function. Prepare a new figure when visibility or data changes.
Create `create_pure_state` / `Val.view` **inside** the builder passed to `rabbita.new`.
The [complete demo](cmd/demo/main.mbt) shows model, update and view together.
Refresh or clear hover/selection when replacing the displayed data.

Load the included stylesheet through your application's asset pipeline:

```html
<link rel="stylesheet" href="/path/to/moonplot.css">
```

Copy or serve [moonplot.css](moonplot.css) from the installed module's `rabbita/`
directory. Its rules are scoped to `.moonplot`. Override `--moonplot-text`,
`--moonplot-muted`, `--moonplot-border` and `--moonplot-accent` on the component.
The floating inspector does not resize the chart on hover. `demo.css` only
styles the repository's example page.

## Run the repository examples

From the full repository root:

```sh
moon build rabbita/cmd/demo --target js
moon build rabbita/cmd/resources --target js
python3 -m http.server 8765 --bind 127.0.0.1
```

Open [the double-chart demo](http://127.0.0.1:8765/rabbita/) or
[the resource isolation case](http://127.0.0.1:8765/rabbita/resources.html).
Serve the repository root so the pages can find the JavaScript in its `_build`
directory. No local `moon.work` is required. Stop the server with Ctrl+C.

## Multi-chart resources and errors

Use a distinct, nonempty `id` per chart. M2 scopes every source SVG ID and its local
`url(...)`, `href` and `xlink:href` references to that chart, including inline CSS,
quoted/escaped URLs, UTF-8 fragment escapes, gradient chains and root references.
The public root remains `id + "-svg"`. Names are deterministic across redraws;
the original Drawing/SVG, geometry and hit coordinates are unchanged.

Duplicate/empty source IDs, missing local targets, ambiguous fragment spellings
and conflicting href/xlink:href values raise `AdapterError::InvalidSvg`.
External/data URLs and ordinary color literals are preserved. Unknown tags or
attributes raise an explicit adapter error. Rabbita 0.16.7 has no public SVG ARIA
setters, so SVG `aria-labelledby` / `aria-describedby` remain unsupported; HTML
legend buttons retain their accessibility attributes.

## Layout and scope

`HitPoint` contains panel, artist and original sample indices, numeric data values
and intrinsic SVG coordinates. Picking covers Line, Scatter and PathCollection point anchors, Bar/BarH/Histogram
rectangles and Pie sectors. Lines can also snap by X; segment interpolation is not provided;
indices belong to the current frame, not persistent identities across reordering.

The SVG uses responsive width and `xMidYMid meet`. Picking uses client coordinates,
the actual SVG viewport and letterbox offsets; `hit_radius~` defaults to 10 CSS px.
Scrolling and wrapper padding/borders are supported. Borders/padding or arbitrary
CSS transforms directly on the SVG root, other aspect policies, touch gestures,
zoom/pan and point keyboard navigation are outside M2.

Every `view` parses its snapshot and scans points for picking. Dense-data performance
and caching remain future work. Only JS browser interaction is claimed. The unified
module pins Rabbita 0.16.7 and XML 0.5.0; dependency resolution happens for the whole
module, while the static plotting packages do not compile or link this UI package.

## Develop and verify

From a full repository checkout:

```sh
moon check rabbita --target js
moon test rabbita --target js
moon build rabbita/cmd/demo rabbita/cmd/resources --target js
PLAYWRIGHT_MODULE=/path/to/node_modules/playwright node rabbita/browser_test.cjs
PLAYWRIGHT_MODULE=/path/to/node_modules/playwright node rabbita/resource_browser_test.cjs
```

The browser runners require Playwright and installed Google Chrome.
`BROWSER_CHANNEL=bundled` selects Playwright's installed Chromium instead.
They use ephemeral loopback servers and close browser/server in `finally`.
The [M2 record](../docs/MILESTONE_M2.md) preserves v0.2.0's 14 unit tests, 11 main
browser checks, 7 resource groups and independent release-consumer acceptance;
those historical results are separate from the unified package's publication checks.

The earlier `moonbit-community/moonplot-rabbita` module path is replaced by
`Lampese/mathplotlib/rabbita`. See [migration notes](../docs/PUBLISHING.md#从早期模块路径迁移)
for the static package prefix change too.

Licensed under [Apache 2.0](../LICENSE). See the module's
[third-party notices](../docs/THIRD_PARTY_NOTICES.md) for dependencies and bundled data.
