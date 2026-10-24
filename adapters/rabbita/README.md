# MoonPlot for Rabbita

Version **0.2.0 (M2)**. Interactive MoonPlot SVG components built with public
[Rabbita](https://github.com/moonbit-community/rabbita) APIs. The adapter returns
real SVG DOM inside composable `Html`; the application owns its state.

![Two interactive charts](https://raw.githubusercontent.com/moonbit-community/moonplot/v0.2.0/assets/rabbita-interactive.png)

## Install the source release

Download and unzip **moonplot-v0.2.0-source.zip** from the
[v0.2.0 release](https://github.com/moonbit-community/moonplot/releases/tag/v0.2.0).
From its `moonplot-v0.2.0` directory:

```sh
moon run example/cmd/static --target native > chart.svg
moon build example/cmd/app --target js
python3 -m http.server 8765 --bind 127.0.0.1
```

Open [the independent example](http://127.0.0.1:8765/example/).
Hover or click points, toggle the series, and update data. Stop the server with Ctrl+C.
A MoonBit toolchain is required; native execution also requires a C compiler.
Python serves the browser example only.

The source bundle has explicit workspace members `core`, `rabbita`, `example`.
Its example declares normal versioned dependencies on `mathplotlib/mathplotlib@0.2.0`
and `moonbit-community/moonplot-rabbita@0.2.0`; the workspace resolves the two
unpacked modules. Copy these modules into your own workspace and list them as
members. The individual library ZIPs contain no repository `moon.work`.

**Neither module is published on Mooncakes.** The current publisher lacks both
namespace permissions (server returned 403 User mismatch). A registry-only
`moon add` installation is therefore not available. Module names are preserved.

## Component API

Import these packages in your application's `moon.pkg`:

```moonbit nocheck
import {
  "mathplotlib/mathplotlib",
  "mathplotlib/mathplotlib/drawing",
  "moonbit-community/moonplot-rabbita" @plot_dom,
  "moonbit-community/rabbita",
  "moonbit-community/rabbita/html",
}
```

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
The [complete repository demo](https://github.com/moonbit-community/moonplot/blob/v0.2.0/adapters/rabbita/cmd/demo/main.mbt)
and the release bundle's independent example show model/update/view together.
Refresh or clear hover/selection when replacing the displayed data.

Load the included stylesheet through your application's asset pipeline:

```html
<link rel="stylesheet" href="/path/to/moonplot.css">
```

[moonplot.css](moonplot.css) scopes rules to `.moonplot`. Override `--moonplot-text`,
`--moonplot-muted`, `--moonplot-border` and `--moonplot-accent` on the component.
The floating inspector does not resize the chart on hover.

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
and intrinsic SVG coordinates. Picking covers Line, Scatter and PathCollection
numeric point anchors. These are nearest-sample targets, not shape or segment tests;
indices belong to the current frame, not persistent identities across reordering.

The SVG uses responsive width and `xMidYMid meet`. Picking uses client coordinates,
the actual SVG viewport and letterbox offsets; `hit_radius~` defaults to 10 CSS px.
Scrolling and wrapper padding/borders are supported. Borders/padding or arbitrary
CSS transforms directly on the SVG root, other aspect policies, touch gestures,
zoom/pan and point keyboard navigation are outside M2.

Every `view` parses its snapshot and scans points for picking. Dense-data performance
and caching remain future work. Only JS browser interaction is claimed. Core SVG
usage does not require Rabbita. This adapter pins Rabbita 0.16.7 and XML 0.5.0.

## Develop and verify

From a full repository checkout (not a production library ZIP):

```sh
cd adapters/rabbita
moon check --target js
moon test . --target js
moon build cmd/demo cmd/resources --target js
python3 -m http.server 8765 --bind 127.0.0.1
```

Open [the demo](http://127.0.0.1:8765/) or
[the resource isolation case](http://127.0.0.1:8765/resources.html).
This checkout's local workspace links the core from `../..`.

From the repository root, with Playwright and Google Chrome installed:

```sh
PLAYWRIGHT_MODULE=/path/to/node_modules/playwright node adapters/rabbita/browser_test.cjs
PLAYWRIGHT_MODULE=/path/to/node_modules/playwright node adapters/rabbita/resource_browser_test.cjs
PLAYWRIGHT_MODULE=/path/to/node_modules/playwright python3 tools/build_release.py
```

`BROWSER_CHANNEL=bundled` selects Playwright's installed Chromium instead.
Runners use ephemeral loopback servers and close their browser/server in `finally`.
M2 validation: adapter **14/14**, original browser **11 checks**, resource browser
**7 groups**, plus a real browser consumer built outside the repository from the
actual release ZIPs. See the
[M2 acceptance record](https://github.com/moonbit-community/moonplot/blob/v0.2.0/docs/MILESTONE_M2.md).

Licensed under [Apache 2.0](LICENSE). See the core package's third-party notices for
its bundled algorithms/data and the repository's
[notices](https://github.com/moonbit-community/moonplot/blob/v0.2.0/docs/THIRD_PARTY_NOTICES.md).
