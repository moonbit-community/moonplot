///|
fn secondary_position_scene_fixture() -> (Figure, Axes) raise {
  let fig = figure(width=320, height=240)
  let axes = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  axes.set_x_limits(1.0, 2.0)
  axes.set_y_limits(0.0, 1.0)
  for axis in [axes.x_axis(), axes.y_axis()] {
    axis.set_locator(@ticker.NullLocator::new().as_locator())
    axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  }
  (fig, axes)
}

///|
fn secondary_position_scene_attribute(
  svg : String,
  label : String,
  attribute : String,
) -> String raise {
  let found : Array[String] = []
  for element in svg.split("<text ") {
    if element.contains(">" + label + "</text>") {
      let (_, attributes) = element.split_once(attribute + "=\"").unwrap()
      let (value, _) = attributes.split_once("\"").unwrap()
      found.push(value.to_owned())
    }
  }
  assert_eq(found.length(), 1)
  found[0]
}

///|
// Complete Secondary.draw + Base.draw source observations: old Fixed first
// gives [3.8,4.2], then positioned aspect under the new functionlog gives [1,10].
test "complete secondary draw applies positioned limits after the parent scale reset" {
  let (fig, axes) = secondary_position_scene_fixture()
  let child = axes.secondary_xaxis(_ => 4.0, _ => 1.0)
  child.set_locator(@ticker.FixedLocator::new([2.0, 3.0]).as_locator())
  axes.set_x_scale(@scale.log_scale())
  ignore(fig.to_svg_checked())
  let final_view = child.numeric_axis.stored_view_limits()
  assert_eq((final_view.lower(), final_view.upper()), (1.0, 10.0))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "functionlog")
}

///|
test "retained IR positions a later child using the location changed by an earlier callback" {
  let (fig, axes) = secondary_position_scene_fixture()
  let first = axes.secondary_yaxis(value => value, value => value)
  let later = axes.secondary_xaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Position(0.75),
  )
  first.set_ticks([0.5])
  later.set_ticks([1.5])
  later.set_named_formatter(
    @ticker.FixedFormatter::new(["moved-later"]).as_base_formatter(),
  )
  first.set_named_formatter(
    @ticker.FuncFormatter::new((_, position) => {
      if position == Some(0) {
        later.set_location(SecondaryAxisLocation::Position(0.25))
      }
      "first-y"
    }).as_base_formatter(),
  )
  let retained = fig.to_render_figure()
  let (svg, _) = @svg.render_with_positions_checked(retained)
  let (left, top, right, bottom) = later.drawing_bounds()
  assert_eq((left, right, bottom), (0.0, 320.0, 180.0))
  assert_true(top < bottom && bottom - top < 1.0e-7)
  assert_true(later.alignment() is SecondaryAxisAlignment::Top)
  assert_eq(
    secondary_position_scene_attribute(svg, "moved-later", "x"),
    160.0.to_string(),
  )
  assert_eq(
    secondary_position_scene_attribute(svg, "moved-later", "y"),
    (top - 17.0).to_string(),
  )
}

///|
test "own formatter location is deferred while its alignment changes the current child side" {
  let (fig, axes) = secondary_position_scene_fixture()
  let child = axes.secondary_xaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Position(0.75),
  )
  child.set_ticks([1.5])
  let changed = [false]
  let before : Array[(Double, Double, Double, Double)] = []
  let after : Array[(Double, Double, Double, Double)] = []
  child.set_named_formatter(
    @ticker.FuncFormatter::new((_, position) => {
      if position == Some(0) && !changed[0] {
        before.push(child.drawing_bounds())
        child.set_location(SecondaryAxisLocation::Position(0.25))
        child.set_alignment(SecondaryAxisAlignment::Bottom)
        after.push(child.drawing_bounds())
        changed[0] = true
      }
      "own-side"
    }).as_base_formatter(),
  )
  let retained = fig.to_render_figure()
  let (first, _) = @svg.render_with_positions_checked(retained)
  assert_eq(before.length(), 1)
  assert_eq(after, before)
  assert_eq(before[0].3, 60.0)
  assert_eq(
    secondary_position_scene_attribute(first, "own-side", "y"),
    78.0.to_string(),
  )
  let (second, _) = @svg.render_with_positions_checked(retained)
  assert_eq(child.drawing_bounds().3, 180.0)
  assert_eq(
    secondary_position_scene_attribute(second, "own-side", "y"),
    198.0.to_string(),
  )
}

///|
test "later child cannot move or restyle the cached earlier drawing context" {
  let (fig, axes) = secondary_position_scene_fixture()
  let first = axes.secondary_xaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Position(0.75),
  )
  let later = axes.secondary_yaxis(value => value, value => value)
  first.set_ticks([1.5])
  later.set_ticks([0.5])
  let earlier : Array[(Double, Double, Double, Double)] = []
  first.set_named_formatter(
    @ticker.FuncFormatter::new((_, _) => {
      earlier.push(first.drawing_bounds())
      "cached-earlier"
    }).as_base_formatter(),
  )
  let changed = [false]
  later.set_named_formatter(
    @ticker.FuncFormatter::new((_, position) => {
      if position == Some(0) && !changed[0] {
        first.set_location(SecondaryAxisLocation::Position(0.25))
        first.set_alignment(SecondaryAxisAlignment::Bottom)
        first.apply_aspect()
        changed[0] = true
      }
      "mutating-later"
    }).as_base_formatter(),
  )
  let retained = fig.to_render_figure()
  let (svg, _) = @svg.render_with_positions_checked(retained)
  assert_true(changed[0])
  assert_eq(earlier.length(), 1)
  assert_eq(earlier[0].3, 60.0)
  assert_eq(first.drawing_bounds().3, 0.0)
  assert_true(first.alignment() is SecondaryAxisAlignment::Bottom)
  assert_eq(
    secondary_position_scene_attribute(svg, "cached-earlier", "y"),
    (earlier[0].1 - 17.0).to_string(),
  )
  let (next, _) = @svg.render_with_positions_checked(retained)
  assert_eq(
    secondary_position_scene_attribute(next, "cached-earlier", "y"),
    198.0.to_string(),
  )
}

///|
test "own formatter direct aspect restores original bounds for the spine and both tick groups" {
  let (fig, axes) = secondary_position_scene_fixture()
  let child = axes.secondary_xaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Position(0.75),
  )
  child.set_ticks([1.5])
  child.set_minor_locator(@ticker.FixedLocator::new([1.25]).as_minor_locator())
  child.set_minor_named_formatter(
    @ticker.FixedFormatter::new(["original-minor"]).as_base_formatter(),
  )
  child.set_alignment(SecondaryAxisAlignment::Bottom)
  child.set_named_formatter(
    @ticker.FuncFormatter::new((_, position) => {
      if position == Some(0) {
        child.apply_aspect()
      }
      "original-major"
    }).as_base_formatter(),
  )
  let svg = fig.to_svg_checked()
  let (left, top, right, bottom) = child.drawing_bounds()
  assert_eq((left, right, bottom), (0.0, 320.0, 0.0))
  assert_true(top < 0.0)
  assert_eq(
    secondary_position_scene_attribute(svg, "original-major", "x"),
    160.0.to_string(),
  )
  assert_eq(
    secondary_position_scene_attribute(svg, "original-major", "y"),
    18.0.to_string(),
  )
  assert_eq(
    secondary_position_scene_attribute(svg, "original-minor", "x"),
    80.0.to_string(),
  )
  assert_eq(
    secondary_position_scene_attribute(svg, "original-minor", "y"),
    17.0.to_string(),
  )
  assert_true(svg.contains("x1=\"0\" y1=\"0\" x2=\"320\" y2=\"0\""))
}

///|
// Source Bbox/transformed-locator observations use this same figure and parent
// rectangle. Preserve separately mapped edges rather than epsilon * size.
test "positioned x and y children preserve the source thin bbox display edges" {
  let fig = figure(width=320, height=240)
  let axes = fig.add_axes(0.2, 0.25, 0.5, 0.5)
  axes.set_x_limits(1.0, 4.0)
  axes.set_y_limits(0.0, 1.0)
  let x = axes.secondary_xaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Position(0.75),
  )
  let y = axes.secondary_yaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Position(0.75),
  )
  x.set_ticks([2.5])
  y.set_ticks([0.5])
  x.set_named_formatter(
    @ticker.FixedFormatter::new(["thin-x"]).as_base_formatter(),
  )
  y.set_named_formatter(
    @ticker.FixedFormatter::new(["thin-y"]).as_base_formatter(),
  )
  let svg = fig.to_svg_checked()
  assert_eq(x.drawing_bounds(), (64.0, 89.99999998800001, 224.0, 90.0))
  assert_eq(y.drawing_bounds(), (184.0, 60.0, 184.000000016, 180.0))
  assert_eq(
    secondary_position_scene_attribute(svg, "thin-x", "x"),
    144.0.to_string(),
  )
  assert_eq(
    secondary_position_scene_attribute(svg, "thin-y", "y"),
    123.0.to_string(),
  )
  assert_eq(
    secondary_position_scene_attribute(svg, "thin-y", "text-anchor"),
    "start",
  )
}
