# MoonPlot

A plotting library written in [MoonBit](https://www.moonbitlang.com/).
Create figures, add charts and annotations, and export self-contained SVG
for reports, documentation, and applications.

MoonPlot focuses on useful plotting features that can grow incrementally.
Its API takes inspiration from Matplotlib, with typed MoonBit data and
an SVG rendering pipeline.

![Two-series chart rendered by MoonPlot](assets/two-series.png)

[View the SVG](assets/two-series.svg) ·
[Run this example](cmd/preview/main.mbt)

## Features

- **Everyday charts:** line, scatter, bar, histogram, pie, box, and violin plots.
- **Scientific plots:** error bars, filled regions, contours, triangulated meshes,
  vector fields, and stream plots.
- **Images and color:** scalar and RGB(A) images, heatmaps, color maps,
  normalization, masks, and colorbars.
- **Figure composition:** multiple axes, shared axes, nested grids, secondary
  axes, titles, labels, legends, tables, and annotations.
- **Axes and data:** numeric scales, explicit ticks and formatters, date/time
  coordinates, time zones, and categorical labels.
- **Editable lines:** data updates, visibility, color, alpha, line width,
  draw styles, dashes, and gap colors through `Line2D` handles.
- **SVG output:** render a figure to a string without a Python runtime.

Support varies by chart and option. See the
[usage guide](docs/USAGE.md) for examples and the
[capability notes](COMPATIBILITY.md) for detailed boundaries.

## Getting Started

Install the [MoonBit toolchain](https://www.moonbitlang.com/download/).
The native example also requires a working C compiler.

Clone the repository, install its declared dependencies, and render the preview:

```sh
git clone https://github.com/moonbit-community/moonplot.git
cd moonplot
moon install
moon run cmd/preview --target native > chart.svg
```

Open `chart.svg` in a browser or an SVG viewer. The command writes the chart
to standard output; the shell redirects it to the file.

If your local package index needs refreshing, run `moon update` before
`moon install`. Some recent toolchains warn that `moon install` is deprecated;
it remains an explicit dependency setup command for the current checkout.
See the [Moon CLI documentation](https://docs.moonbitlang.com/en/latest/toolchain/moon/commands.html)
for your toolchain's dependency workflow.

The checked-in PNG above is a preview of the SVG output. MoonPlot does not
currently provide standalone PNG export.

## Library Usage

The repository and project are named **MoonPlot**. The current MoonBit module
ID is still **`mathplotlib/mathplotlib`**, so imports retain that name.
The repository rename does not introduce a `moonbit-community/moonplot`
Mooncakes module.

A package using the library imports the root plotting API in `moon.pkg`:

```moonbit nocheck
///|
import {
  "mathplotlib/mathplotlib",
}
```

Create a figure, choose its axes, add data, and request SVG output.
This compact example uses explicit limits and ticks:

```moonbit nocheck
///|
fn main raise {
  let fig = @mathplotlib.figure(width=640, height=400)
  fig.set_title("A MoonPlot chart")
  fig.set_x_label("Sample")
  fig.set_y_label("Value")
  fig.set_x_limits(0.0, 4.0)
  fig.set_y_limits(0.0, 20.0)
  fig.set_x_ticks([0.0, 1.0, 2.0, 3.0, 4.0])
  fig.set_y_ticks([0.0, 5.0, 10.0, 15.0, 20.0])
  fig.set_x_tick_labels(["0", "1", "2", "3", "4"])
  fig.set_y_tick_labels(["0", "5", "10", "15", "20"])
  fig.plot(
    [0.0, 1.0, 2.0, 3.0, 4.0],
    [3.0, 7.0, 5.0, 13.0, 17.0],
    color="#2563eb",
    label="Measurements",
  )
  fig.legend(fig.legend_entries())
  println(fig.to_svg_checked())
}
```

Use the object API for individual figures and axes, or the
[`pyplot` package](pyplot/) for a stateful facade.
For mutable line data and appearance, `plot_line` returns a `Line2D` handle.
The complete two-series example is in [`cmd/preview`](cmd/preview/main.mbt).

The checked rendering APIs propagate data, tick, and layout errors so callers
can handle them. Some plot combinations still have known tick/layout errors;
the available options and more complex combinations are evolving.

### Current scope

- SVG is the supported output backend. There is no standalone PNG/PDF backend
  or interactive GUI renderer.
- 3D plotting, animation, and full mathtext/TeX and font layout are not available.
- The library is not a drop-in Matplotlib implementation. Python's dynamic
  argument forms and every chart parameter are not reproduced.
- SVG text uses the viewer's fonts; full text measurement and typography remain
  limited.

## Documentation

- [Detailed usage and API examples](docs/USAGE.md)
- [Capabilities and current limitations](COMPATIBILITY.md)
- [Dependencies and integration notes](DEPENDENCIES.md)
- [Third-party licenses and attribution](THIRD_PARTY_NOTICES.md)

The root package provides the common plotting facade. Implementation packages
include `scene` for figure and artist state, `ticker` for axes and date handling,
`transforms` for geometry, and `backend/svg` for rendering.

## Development

From the repository root:

```sh
moon check --target all
moon test --target all
moon info
moon fmt
```

Tests include unit tests, public API examples, SVG checks, and source-reference
fixtures. Guides under [`testdata/`](testdata/) describe their supported domains
and reproduction steps. Python is used by some fixture generators, not by the
plotting runtime.

When changing public APIs, review the generated `pkg.generated.mbti` diffs.
Keep examples and capability notes aligned with the behavior that is tested.

## License

Licensed under the [Apache License 2.0](LICENSE).

Some algorithms and behavior are adapted from the pinned Matplotlib v3.11.2
source and retain its [license](LICENSE-MATPLOTLIB).
Other dependencies and bundled data retain their own licenses; see
[Third-Party Notices](THIRD_PARTY_NOTICES.md).
