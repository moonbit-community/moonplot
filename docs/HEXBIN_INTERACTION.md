# Hexbin interaction

`Figure::hexbin` and `Axes::hexbin` now prepare whole-face hover/click targets
when `marginals=false` (the default). Static SVG output is unchanged. Rabbita's
existing `view`, `on_event`, `tooltip`, `tooltip_class`, and hit-mode options work
with these targets without a separate chart component.

```moonbit
let fig = @plot.figure(width=640, height=360)
let bins = fig.hexbin(
  [0.1, 0.2, 2.1, 2.2, 2.3],
  [0.1, 0.2, 0.8, 0.9, 1.0],
  values=[2.0, 6.0, 10.0, 20.0, 30.0],
  gridsize=2,
  extent=[0.0, 4.0, 0.0, 4.0],
  reduce="sum",
  bins="log",
  label="Totals",
)
let drawing = fig.to_drawing()
// bins.values() and HitInfo.value contain 8 and 60, not their logarithms.
```

The snippet assumes the facade package is imported as `@plot` and errors are
propagated by the enclosing function. `bins` remains the existing `Hexbin`
result with copying `centers()`, `values()`, and `counts()` accessors.

## Source metadata

A hit has `HitInfo.kind == Hexbin`, its supplied label in `series`, and
`HitInfo.hexbin: HexbinInfo?` with immutable scalar fields:

| Field | Meaning |
| --- | --- |
| `row`, `column` | Zero-based lattice indices calculated during the original binning |
| `count` | Number of input samples aggregated into this occupied bin |
| `reduction` | `Count`, `Mean`, `Sum`, `Min`, `Max`, or `Custom` |

`HitPoint.data_x` and `data_y` are the original bin center, rather than an
individual input sample or a cursor interpolation. `HitPoint.point_index`
indexes the arrays returned by this call to `hexbin`, after `mincnt` filtering.
Invisible or offscreen faces do not compact that index again. Each cell is
still a separate Polygon artist; `artist_index` follows the frame's actual
artist ordering.

`HitInfo.value` is the already computed count or reduced scalar. With no
`values`, reduction is `Count` regardless of the `reduce` string. A supplied
`reduce_fn` takes precedence and reports `Custom`; preparing or rebuilding a
Drawing never calls it again. Color normalization, identical colors, and
`bins="log"` cannot change the stored value. The raw sample count remains
available even when the value represents a mean, sum, or custom result.

The facade re-exports `HexbinInfo` and `HexbinReduction`. Drawing adds the
optional `hexbin=None` argument to `hit_info`; existing calls keep their
defaults. Exhaustive matches on `HitKind` must add the `Hexbin` case.

## Actual geometry and ordering

Scene records source semantics when it pushes each original Polygon. The
renderer captures the same valid vertices emitted by the ordinary polygon
writer, maps them with that draw's scales and panel rectangle, and checks that
all six form a finite, strictly convex face. A diagonal divides that real
six-sided face into two immutable `Quadrilateral` targets. Both share one
`HitInfo` and one `HitPoint`; the Drawing's point array contains the bin once.
No new public hit shape or mutable polygon collection is needed.

Both halves and their common diagonal return the same cell. Bounding-box
corners outside the polygon do not hit. A bbox is used only to discard faces
wholly outside the panel, while a visible face whose center lies outside the
viewport remains selectable. The panel bounds clip hits; legend exclusions,
later painted faces, later visible error-bar/box-plot geometry, multiple panels,
CSS viewport mapping, and letterboxing retain their existing ordering rules.
`Nearest` and `XNearest` both select the containing face; hexbin does not add a
nearest-center fallback outside a face.

Logarithmic, SymLog, Asinh, and Logit coordinate scales use the existing
transformed-coordinate binning and inverse-mapped centers/vertices. This is
independent of linear/log color bins. Changing axes later maps the stored
polygons with the new drawing configuration; it does not repeat aggregation.

## Visibility and scope

- Only occupied cells passing `count >= mincnt` exist. `mincnt=0` does not
  synthesize empty cells. Extent filtering and the returned ordering are kept.
- `marginals=true` keeps the entire call static for this slice. Existing
  marginal rectangles are painted over the cells within the same axes and
  include counts from cells filtered by `mincnt`; no Hexbin targets are emitted
  for either the faces or these rectangles.
- Colormap sampling retains actual RGBA alpha for capture. Known invisible
  explicit fills (`none`, `transparent`, zero-alpha hex colors) have no interior
  target, even with a visible outline. Other CSS paints retain the existing
  conservative paint handling; dynamic CSS and functional `rgba(...)` alpha
  are not fully resolved by the library's small color parser.
- Nonfinite reduced results, incomplete vertices after an axis-domain change,
  degenerate faces, and mapped faces failing convexity retain their ordinary
  static SVG but have no Hexbin target. Input/reducer validation and static
  drawing behavior are unchanged.
- Arbitrary Polygon artists and hexbin marginal bars do not acquire inferred
  bin semantics. No bin intervals are fabricated from a hexagon's bbox.

The default tooltip shows the center's x/y and sample Count. Reduced bins also
show Value. A custom Rabbita tooltip receives the full typed `HexbinInfo` and
can supply units, localized labels, reducer names, and application formatting.
