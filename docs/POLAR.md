# Polar plots and outline radar charts

`Figure::add_polar_axes(left, bottom, width, height)` creates a typed
`PolarAxes` at a normalized Figure rectangle, using the same lower-left layout
coordinates as `add_axes`. Polar and ordinary panels can share a Figure.
This first slice produces static SVG and composable Rabbita DOM. Polar panels
currently provide no hover targets or tooltips.

```mbt
let figure = @plot.figure(width=460, height=300)
let polar = figure.add_polar_axes(0.0, 0.0, 1.0, 1.0)
polar.set_radius_max(1.0)
polar.plot([0.0, 1.0, 2.0, 3.0], [0.3, 0.8, 0.6, 1.0], label="Profile")
polar.scatter([0.0, 1.0, 2.0], [0.3, 0.8, 0.6], size=4.0)
let drawing = figure.to_drawing()
```

## Coordinates and appearance

Angles are radians. Zero points east, with increasing angles counterclockwise.
`set_theta_offset(radians)` moves zero; `set_direction(PolarDirection::Clockwise)`
reverses the angular direction. The offset and raw angles remain in radians
even when custom labels display degrees or category names. Huge finite angles
are reduced only while evaluating trigonometry; stored source values stay intact.

The radial domain is linear `[0, rmax]`. Its automatic maximum uses jointly
valid finite angle/radius pairs with nonnegative radius. Empty and all-zero data
use maximum1. `set_radius_max(value)` requires a finite positive value and
changes the view without rewriting observations. The circle uses one physical
radius in a rectangular panel; labels and a title receive layout allowance,
and unused space keeps the circle round.

`plot(theta, radius, color~="", linewidth~=1.5, label~="", closed~=false)`
draws straight chords between the projected samples. It does not insert an
arc or an interpolated observation. Provide enough samples for a smooth spiral.
`scatter(theta, radius, color~="", size~=3.5, label~="")` draws circular markers;
**size is SVG pixel radius**, rather than marker area. Colors use the existing
color cycle and labels use the existing automatic legend.

The two coordinate arrays must have equal length. Negative radius and
nonfinite angle/radius pairs are missing: lines break into separate runs and
scatter skips them. Radius zero is valid. Radii above an explicit maximum stay
in the raw source; a real SVG circle clips their painted strokes and markers.
An unrepresentable derived projection conservatively breaks the run instead of
writing nonfinite SVG coordinates.

For `closed=true`, only the rendered path gains a final copy of its first point,
and only when the complete original group projects validly. Missing values do
not get bridged to close a shape. Inspection still returns the original N points.

## Grid labels and radar

`set_theta_ticks(angles, labels~=[])` and
`set_radius_ticks(radii, labels~=[])` copy their inputs. Positions must be finite;
radial ticks must also be nonnegative. A nonempty label list must have the same
length. Validation errors leave existing configuration intact. Radial positions
outside the current maximum are omitted without changing the range. Zero has no
separate ring. The initial angular grid has eight degree labels; custom angular
positions without labels display their numeric radian values.

`radar(values, labels, color~="", linewidth~=1.5, label~="")` requires at least
three categories and one label per value. It uses equally spaced angles and the
same closed chord outline. Subsequent radar calls on one panel require the same
ordered category labels. This helper does not rotate the panel, fill the shape
or normalize each dimension.

```mbt
polar.set_theta_offset(1.5707963267948966) // north zero
polar.set_direction(@plot.PolarDirection::Clockwise)
polar.set_radius_max(100.0)
polar.radar([80.0, 60.0, 90.0, 70.0, 50.0],
  ["Strength", "Speed", "Recovery", "Endurance", "Defense"], label="First")
polar.radar([60.0, 85.0, 65.0, 95.0, 75.0],
  ["Strength", "Speed", "Recovery", "Endurance", "Defense"], label="Second")
```

`set_title`, `set_legend`/`legend`, `legend_entries` and
`set_legend_position` forward the small existing presentation API. `legend([])`
sets an explicitly empty in-SVG legend when an application supplies its own DOM
controls. Data is clipped independently of the grid, labels, title and legend.

## Lifecycle and scope

Input arrays, tick settings and labels are copied. Ordinary artist inspection
through `figure.axes_list()[index].artists()` returns independent copies with
raw theta/r points. Projection happens at render time, so changing the radial
maximum or direction affects every series consistently. A previously built
Drawing retains its immutable SVG. Per-frame projection and grid work are
O(samples + ticks); the original source never grows for outline closure.

`PolarAxes::clear()` removes series, title and legend while keeping the polar
projection and its range/direction/tick configuration. Public `Figure::clear()`
and `clear_checked()` also preserve the panel's polar identity. A later radar
group can establish its category list again.

Inherited Cartesian operations reachable through ordinary Figure/Axis handles
are not a polar configuration API. Cartesian scales, bounds, limits, tick
formatters/locators, axis-off, custom Cartesian grid/spine/margin/anchor settings,
sharing, aspect adjustments, secondary axes and foreign artists fail clearly in
checked rendering. There is no raw Axes or
mutable Line2D conversion method on `PolarAxes`.

This slice covers a full circle with radial minimum zero. It does not add
logarithmic or reversed radii, nonzero inner radii, angular wedges, filled radar,
arbitrary artist projection or polar semantic hits. `to_drawing()` and ordinary
SVG share the exact draw, while the polar branch captures no legacy Cartesian
points or targets. Ordinary panels keep their existing interaction.

[Capabilities](CAPABILITIES.md) · [Architecture](ARCHITECTURE.md) ·
[Rabbita DOM](RABBITA_DOM.md)
