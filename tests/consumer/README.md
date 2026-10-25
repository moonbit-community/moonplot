# Independent release consumer

This application is copied into `example/` in the MoonPlot source bundle. It
imports only public APIs from the versioned module and its JS subpackage. Its `moon.mod` has no
path dependency, and this directory deliberately has no `moon.work`.

The bundle provides an explicit workspace with exactly `library` and `example` as members. The library directory comes from the
actual `Lampese/mathplotlib` module archive. The same consumer is also tested
without a workspace by installing the module from Mooncakes.

Run these commands **from the unpacked bundle root**:

```sh
moon run example/cmd/static --target native > example.svg
moon build example/cmd/app --target js
python3 -m http.server 8765 --bind 127.0.0.1
```

Open [the interactive example](http://127.0.0.1:8765/example/). The app's HTML
loads the component stylesheet from `library/rabbita/moonplot.css` and its own small
page stylesheet. It supports sample hover, click selection, a trend legend
toggle, and data updates. The Rabbita state is created inside the root builder;
the application clears stale selection when the dataset changes.

The static executable asserts that the public drawing export retains the same
SVG and sample anchors, then prints the SVG. It has no browser package import.
It also checks generated contour path slots, exact levels, inline fragments,
clipped triangle-edge anchors and ordering against filled areas. The browser
includes regular-grid and triangular contours with default and custom level
tooltips; both use actual visible strokes for picking.

The repository's `tools/verify_release_consumer.cjs` runs real mouse-event
acceptance against an unpacked, built bundle. It accepts the bundle directory
as its first argument, requires Playwright and installed Google Chrome, and
closes its temporary server and browser even if an assertion fails.
