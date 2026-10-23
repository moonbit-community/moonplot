///|
fn secondary_functions_render_fixture() -> (Figure, Axes) raise {
  let fig = figure(width=320, height=240)
  let axes = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  axes.set_x_limits(1.0, 4.0)
  axes.set_y_limits(0.0, 1.0)
  for axis in [axes.x_axis(), axes.y_axis()] {
    axis.set_locator(@ticker.NullLocator::new().as_locator())
    axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  }
  (fig, axes)
}

///|
fn secondary_functions_render_label_x(
  svg : String,
  label : String,
) -> String raise {
  let matches : Array[String] = []
  let suffix = ">" + label + "</text>"
  for element in svg.split("<text ") {
    if element.contains(suffix) {
      let (_, attributes) = element.split_once("x=\"").unwrap()
      let (value, _) = attributes.split_once("\"").unwrap()
      matches.push(value.to_owned())
    }
  }
  assert_eq(matches.length(), 1)
  matches[0]
}

///|
fn secondary_functions_render_view(child : SecondaryAxis) -> (Double, Double) {
  let limits = child.numeric_axis.stored_view_limits()
  (limits.lower(), limits.upper())
}

///|
// The complete original SecondaryAxis/FuncTransform/transData observations in
// secondary_functions_reference.json nonlinear_observations[0..5] establish
// these positions for the same 320-pixel Bbox: affine 1/3, new bounds with the
// old affine 1/5, and identity bounds with the retained sqrt transform 1/2.
test "retained IR sees earlier y child replace later x functions without replacing its transform" {
  let (fig, axes) = secondary_functions_render_fixture()
  let first = axes.secondary_yaxis(value => value, value => value)
  let later = axes.secondary_xaxis(value => 2.0 * value, value => value / 2.0)
  first.set_ticks([0.5])
  later.set_ticks([4.0])
  later.set_named_formatter(
    @ticker.FixedFormatter::new(["later-function"]).as_base_formatter(),
  )
  let previous_forward = later.forward()
  let previous_inverse = later.inverse()
  let calls = [0]
  first.set_named_formatter(
    @ticker.FuncFormatter::new((_, position) => {
      if position == Some(0) {
        calls[0] += 1
        later.set_functions(value => value * value, value => value.sqrt())
      }
      "earlier-y"
    }).as_base_formatter(),
  )
  // The IR's compatibility forward/inverse fields already contain the old
  // pair. Its owned preparation and placement providers must remain live.
  let retained = fig.to_render_figure()
  let (svg, positions) = @svg.render_with_positions_checked(retained)
  assert_eq(positions, [(0.0, 0.0, 320.0, 240.0)])
  assert_eq(calls[0], 1)
  assert_eq(previous_forward(3.0), 6.0)
  assert_eq(previous_inverse(9.0), 4.5)
  assert_eq(later.forward()(3.0), 9.0)
  assert_eq(later.inverse()(9.0), 3.0)
  assert_eq(secondary_functions_render_view(later), (1.0, 16.0))
  assert_eq(later.numeric_axis.coordinate_transform()(4.0), 2.0)
  assert_eq(
    secondary_functions_render_label_x(svg, "later-function"),
    64.0.to_string(),
  )
}

///|
test "formatter replacing its own functions keeps this batch view until the next frame" {
  let (fig, axes) = secondary_functions_render_fixture()
  let child = axes.secondary_xaxis(value => 2.0 * value, value => value / 2.0)
  child.set_ticks([4.0])
  let changed = [false]
  let observed : Array[(Double, Double)] = []
  child.set_named_formatter(
    @ticker.FuncFormatter::new((_, position) => {
      if position == Some(0) && !changed[0] {
        observed.push(secondary_functions_render_view(child))
        child.set_functions(value => value * value, value => value.sqrt())
        observed.push(secondary_functions_render_view(child))
        changed[0] = true
      }
      "self-function"
    }).as_base_formatter(),
  )
  let retained = fig.to_render_figure()
  let (first, _) = @svg.render_with_positions_checked(retained)
  assert_eq(observed, [(2.0, 8.0), (2.0, 8.0)])
  assert_eq(secondary_functions_render_view(child), (2.0, 8.0))
  assert_eq(child.forward()(3.0), 9.0)
  assert_eq(child.numeric_axis.coordinate_transform()(4.0), 2.0)
  assert_eq(
    secondary_functions_render_label_x(first, "self-function"),
    106.66666666666666.to_string(),
  )
  let (second, _) = @svg.render_with_positions_checked(retained)
  assert_eq(observed.length(), 2)
  assert_eq(secondary_functions_render_view(child), (1.0, 16.0))
  assert_eq(child.numeric_axis.coordinate_transform()(4.0), 2.0)
  assert_eq(
    secondary_functions_render_label_x(second, "self-function"),
    64.0.to_string(),
  )
}

///|
test "later callback cannot move an earlier prepared child even after explicit aspect synchronization" {
  let (fig, axes) = secondary_functions_render_fixture()
  let prepared = axes.secondary_xaxis(value => 2.0 * value, value => value / 2.0)
  let later = axes.secondary_yaxis(value => value, value => value)
  prepared.set_ticks([4.0])
  prepared.set_named_formatter(
    @ticker.FixedFormatter::new(["already-prepared"]).as_base_formatter(),
  )
  later.set_ticks([0.5])
  let changed = [false]
  later.set_named_formatter(
    @ticker.FuncFormatter::new((_, position) => {
      if position == Some(0) && !changed[0] {
        prepared.set_functions(value => value * value, value => value.sqrt())
        prepared.apply_aspect()
        changed[0] = true
      }
      "later-y"
    }).as_base_formatter(),
  )
  let retained = fig.to_render_figure()
  let (first, _) = @svg.render_with_positions_checked(retained)
  assert_true(changed[0])
  assert_eq(secondary_functions_render_view(prepared), (1.0, 16.0))
  assert_eq(prepared.numeric_axis.coordinate_transform()(4.0), 2.0)
  assert_eq(
    secondary_functions_render_label_x(first, "already-prepared"),
    106.66666666666666.to_string(),
  )
  let (second, _) = @svg.render_with_positions_checked(retained)
  assert_eq(
    secondary_functions_render_label_x(second, "already-prepared"),
    64.0.to_string(),
  )
}

///|
test "retained IR identity reset maps new limits through the installed nonlinear child transform" {
  let (fig, axes) = secondary_functions_render_fixture()
  let first = axes.secondary_yaxis(value => value, value => value)
  let nonlinear = axes.secondary_xaxis(value => value * value, value => {
    value.sqrt()
  })
  first.set_ticks([0.5])
  nonlinear.set_ticks([2.25])
  nonlinear.set_named_formatter(
    @ticker.FixedFormatter::new(["reset-nonlinear"]).as_base_formatter(),
  )
  let calls = [0]
  first.set_named_formatter(
    @ticker.FuncFormatter::new((_, position) => {
      if position == Some(0) {
        calls[0] += 1
        nonlinear.reset_functions()
      }
      "reset-first"
    }).as_base_formatter(),
  )
  let retained = fig.to_render_figure()
  let (svg, _) = @svg.render_with_positions_checked(retained)
  assert_eq(calls[0], 1)
  assert_eq(nonlinear.forward()(3.0), 3.0)
  assert_eq(nonlinear.inverse()(9.0), 9.0)
  assert_eq(secondary_functions_render_view(nonlinear), (1.0, 4.0))
  assert_eq(nonlinear.numeric_axis.coordinate_transform()(2.25), 1.5)
  assert_eq(
    secondary_functions_render_label_x(svg, "reset-nonlinear"),
    160.0.to_string(),
  )
}
