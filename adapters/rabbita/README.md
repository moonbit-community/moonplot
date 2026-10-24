# MoonPlot for Rabbita

Use a MoonPlot figure as an interactive SVG component in a [Rabbita](https://github.com/moonbit-community/rabbita) application.
The adapter returns real `Html` / SVG DOM nodes through public Rabbita APIs.
The first version supports point hover, click selection, application-controlled legend buttons and reactive data updates.

![Two interactive MoonPlot charts](../../assets/rabbita-interactive.png)

## Run the example

From this repository's root:

```sh
cd adapters/rabbita
moon build cmd/demo --target js
python3 -m http.server 8765 --bind 127.0.0.1
```

Open [the local example](http://127.0.0.1:8765). Hover or click a data point, toggle a legend button,
update the data, or unmount and mount both charts. Stop the server with Ctrl+C.
The example requires the MoonBit toolchain; Python serves the files only.

This is a separate local module, `moonbit-community/moonplot-rabbita`.
It has not been published to Mooncakes. Its `moon.work` links the current core library from `../..`.
Running ordinary core commands from the repository root does not add Rabbita to the core module.

## Component API

Import the packages used by your view in `moon.pkg`:

```moonbit nocheck
import {
  "mathplotlib/mathplotlib",
  "mathplotlib/mathplotlib/drawing",
  "moonbit-community/moonplot-rabbita" @plot_dom,
  "moonbit-community/rabbita",
  "moonbit-community/rabbita/html",
}
```

Create a checked drawing snapshot, then compose the result into your Rabbita view:

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

Your application's update function handles:

- `Hover(HitPoint?)`: update hover state; `None` clears it.
- `Click(HitPoint?)`: select a sample; clicking empty space produces `None`.
- `ToggleSeries(String)`: update visibility for your own legend key, then prepare the new figure.

Create `create_pure_state` / `Val.view` **inside** the builder passed to `rabbita.new`.
The [complete example](cmd/demo/main.mbt) shows the model, update and view together.
Refresh or clear selected/hovered snapshots when the data changes, as the example does.
Use a distinct `id` for each chart. Legend keys belong to your application.

`HitPoint` contains panel, artist and original point indices, numeric data coordinates, and intrinsic SVG coordinates.
Indices identify the displayed frame's ordering; they are not persistent identifiers across artist or data reordering.
Line step vertices, missing samples and extra paint passes do not renumber the original data points.
The point anchors cover Line, Scatter and PathCollection data; they are nearest-sample targets, not pixel-shape tests.

`Figure::to_drawing()` raises existing checked data/layout errors. `view` raises `AdapterError` for malformed
or unsupported SVG. Unknown tags or attributes are reported rather than silently discarded.

## Layout and scope

The SVG uses responsive width and `xMidYMid meet`. Hits use client coordinates and the actual SVG viewport,
including letterbox offsets; the default hit radius is 10 CSS pixels and can be set with `hit_radius~`.
Wrapper padding/borders and scrolling are supported. Borders, padding or arbitrary CSS transforms applied
**directly to the SVG root**, other aspect-ratio policies, touch gestures and zoom/pan are not covered.

The current route renders once using MoonPlot's existing layout, captures point locations in that draw,
and converts its SVG events to public Rabbita nodes. It performs no `innerHTML` insertion or private VDOM access.
Each `view` call parses the drawing, and nearest-point queries scan its samples; dense-chart performance remains future work.
SVGs with conflicting custom gradient/clip IDs in multiple charts are not yet scoped automatically.

The adapter pins Rabbita `0.16.7`. This local workspace resolves `moonbitlang/x@0.5.1`;
the core module keeps its existing `0.4.46` declaration and normal dependency resolution.
Only JS browser interaction is claimed by this adapter.

## Verification

```sh
moon check --target js
moon test . --target js
moon build cmd/demo --target js
```

The adapter has 7 focused tests. The core's relevant four-target regression command and current results are
recorded in [the DOM integration notes](../../docs/RABBITA_DOM.md).

The browser runner serves the built example on an ephemeral loopback port, uses actual mouse events,
and closes its server and browser in `finally`:

```sh
# From the repository root; a normal Playwright installation also works.
npm install --prefix .moonagent/browser-tools --no-save playwright@1.62.1
PLAYWRIGHT_MODULE="$PWD/.moonagent/browser-tools/node_modules/playwright" \
  node adapters/rabbita/browser_test.cjs
```

The default browser channel is installed Google Chrome. Set `BROWSER_CHANNEL=bundled` to use Playwright's
installed Chromium instead. Browser binaries may need separate installation in a fresh environment.
`MOONPLOT_BROWSER_OUTPUT` overrides the output directory for screenshots and the JSON report.
The actual acceptance run used Chrome 155 and passed nine interaction/layout checks with no page errors.

Licensed under the repository's [Apache 2.0 license](../../LICENSE).
