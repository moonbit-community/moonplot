///|
fn drawing_scene_fixture() -> (Figure, Axes) raise {
  let figure = figure(width=400, height=200)
  let axes = figure.add_axes(0.0, 0.0, 1.0, 1.0)
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  for axis in [axes.x_axis(), axes.y_axis()] {
    axis.set_locator(@ticker.NullLocator::new().as_locator())
    axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  }
  (figure, axes)
}

///|
test "Drawing snapshots original Line data before steps and gap paint expansion" {
  let (figure, axes) = drawing_scene_fixture()
  let line = axes.plot_line(
    LineData::Numeric([0.0, 0.5, 1.0]),
    LineData::Numeric([0.2, 0.8, 0.4]),
  )
  line.set_drawstyle("steps-mid")
  line.set_linestyle("--")
  line.set_gapcolor(Some("red"))
  let static_svg = figure.to_svg_checked()
  let drawing = figure.to_drawing()
  assert_eq(drawing.svg(), static_svg)
  assert_eq(drawing.points().map(p => p.point_index), [0, 1, 2])
  assert_eq(drawing.points().map(p => p.data_x), [0.0, 0.5, 1.0])
  assert_eq(drawing.points().map(p => p.data_y), [0.2, 0.8, 0.4])
  assert_eq(drawing.points()[1].screen_x, 200.0)
  assert_true((drawing.points()[1].screen_y - 40.0).abs() < 1.0e-12)
  assert_true(!line.stale())
  line.set_data(LineData::Numeric([0.25, 0.75]), LineData::Numeric([0.3, 0.7]))
  line.set_linewidth(4.0)
  let updated = figure.to_drawing()
  assert_eq(updated.points().map(p => p.data_x), [0.25, 0.75])
  assert_true(updated.svg().contains("stroke-width=\"4\""))
  assert_eq(drawing.points().map(p => p.data_x), [0.0, 0.5, 1.0])
  assert_eq(drawing.svg(), static_svg)
}

///|
test "Drawing does not register hidden None or zero width Lines" {
  let (figure, axes) = drawing_scene_fixture()
  let line = axes.plot_line(
    LineData::Numeric([0.0, 1.0]),
    LineData::Numeric([0.0, 1.0]),
  )
  line.set_visible(false)
  line.set_data(
    LineData::Numeric([0.0, 1.0]),
    LineData::Numeric([0.0, 0.5, 1.0]),
  )
  assert_eq(figure.to_drawing().points().length(), 0)
  line.set_data(LineData::Numeric([0.0, 1.0]), LineData::Numeric([0.0, 1.0]))
  line.set_visible(true)
  line.set_linestyle("None")
  assert_eq(figure.to_drawing().points().length(), 0)
  line.set_linestyle("-")
  line.set_linewidth(0.0)
  assert_eq(figure.to_drawing().points().length(), 0)
  line.set_linewidth(2.0)
  assert_eq(figure.to_drawing().points().length(), 2)
}

///|
test "Drawing preserves subplot artist indices and commits the same active frames" {
  let figure = figure(width=480, height=240)
  let panels = figure.subplots(1, 2)
  for panel in panels {
    panel.set_x_limits(0.0, 1.0)
    panel.set_y_limits(0.0, 1.0)
    panel.plot([0.0, 1.0], [0.0, 1.0])
  }
  panels[1].scatter([@core.point(0.0 / 0.0, 0.5), @core.point(0.5, 0.5)])
  let drawing = figure.to_drawing()
  let selected = drawing
    .points()
    .filter(p => p.panel_index == 1 && p.artist_index == 1)
  assert_eq(selected.length(), 1)
  assert_eq(selected[0].point_index, 1)
  let frame = panels[1].state.val.active_position.unwrap()
  assert_true(
    (selected[0].screen_x - frame.x() - frame.width() / 2.0).abs() < 1.0e-10,
  )
  assert_true(
    (selected[0].screen_y - frame.y() - frame.height() / 2.0).abs() < 1.0e-10,
  )
  assert_eq(drawing.svg(), figure.to_svg_checked())
}

///|
test "Drawing reuses formatter callback counts and the data changed by that callback" {
  let (figure, axes) = drawing_scene_fixture()
  let line = axes.plot_line(
    LineData::Numeric([0.0, 1.0]),
    LineData::Numeric([0.0, 1.0]),
  )
  let calls = [0]
  axes
  .x_axis()
  .set_locator(@ticker.FixedLocator::new([0.0, 0.5, 1.0]).as_locator())
  axes
  .x_axis()
  .set_named_formatter(
    @ticker.FuncFormatter::new((_, position) => {
      calls[0] += 1
      if position == Some(0) {
        line.set_ydata(LineData::Numeric([0.25, 0.75]))
      }
      "tick"
    }).as_base_formatter(),
  )
  let svg = figure.to_svg_checked()
  let expected_calls = calls[0]
  assert_true(expected_calls > 0)
  calls[0] = 0
  let drawing = figure.to_drawing()
  assert_eq(calls[0], expected_calls)
  assert_eq(drawing.svg(), svg)
  assert_eq(drawing.points().map(p => p.data_y), [0.25, 0.75])
}

///|
test "Drawing preserves checked lazy Line errors" {
  let (figure, axes) = drawing_scene_fixture()
  let line = axes.plot_line(
    LineData::Numeric([0.0, 1.0]),
    LineData::Numeric([0.0, 1.0]),
  )
  line.set_ydata(LineData::Numeric([0.0, 0.5, 1.0]))
  try figure.to_drawing() catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_true(message.contains("shape mismatch"))
    _ => fail("expected the existing checked shape error")
  } noraise {
    _ => fail("Drawing must not swallow checked data errors")
  }
  assert_true(line.stale())
}
