///|
fn line2d_render_fixture() -> (Figure, Axes) raise {
  let fig = figure(width=400, height=200)
  let axes = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  for axis in [axes.x_axis(), axes.y_axis()] {
    axis.set_locator(@ticker.NullLocator::new().as_locator())
    axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  }
  (fig, axes)
}

///|
fn line2d_render_data_bounds(axes : Axes) -> (Double, Double) {
  let limits = axes.data_limits()
  (limits.lower(), limits.upper())
}

///|
fn line2d_render_clear_requests(axes : Axes) -> Unit {
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
}

///|
test "Line errors remain lazy until data drawing after primary formatting" {
  let (fig, axes) = line2d_render_fixture()
  let line = axes.plot_line(
    LineData::Numeric([0.0, 1.0]),
    LineData::Numeric([0.0, 1.0]),
  )
  ignore(fig.to_svg_checked())
  assert_true(!line.stale())
  line2d_render_clear_requests(axes)
  let before = line2d_render_data_bounds(axes)
  line.set_data(
    LineData::Numeric([0.0, 1.0]),
    LineData::Numeric([0.0, 0.5, 1.0]),
  )
  // Export is deliberately pure: neither cache conversion nor shape validation.
  let retained = fig.to_render_figure()
  assert_true(line.stale())
  axes.x_axis().set_locator(@ticker.FixedLocator::new([0.5]).as_locator())
  axes
  .x_axis()
  .set_named_formatter(
    @ticker.FuncFormatter::new((_, _) => {
      raise @core.DataError::InvalidTicks(message="primary before Line")
    }).as_base_formatter(),
  )
  try @svg.render_with_positions_checked(retained) catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_eq(message, "primary before Line")
    _ => fail("expected primary formatting before the lazy Line error")
  } noraise {
    _ => fail("expected primary error")
  }
  axes.x_axis().set_locator(@ticker.NullLocator::new().as_locator())
  try @svg.render_with_positions_checked(retained) catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_true(message.contains("shape mismatch"))
    _ => fail("expected lazy Line shape error")
  } noraise {
    _ => fail("expected lazy Line shape error")
  }
  assert_true(line.stale())
  assert_eq(line2d_render_data_bounds(axes), before)
  assert_true(!axes.x_axis().autoscale_stale())
  assert_true(!axes.y_axis().autoscale_stale())
}

///|
test "child callback changes Line data after IR export and before the same frame Line draw" {
  let (fig, axes) = line2d_render_fixture()
  let line = axes.plot_line(
    LineData::Numeric([0.0, 1.0]),
    LineData::Numeric([0.0, 1.0]),
  )
  let old_xy = line.xy_values_checked()
  let child = axes.secondary_xaxis(value => value, value => value)
  child.set_ticks([0.5])
  let changed = [false]
  child.set_named_formatter(
    @ticker.FuncFormatter::new((_, position) => {
      if position == Some(0) && !changed[0] {
        line.set_ydata(LineData::Numeric([1.0, 0.0]))
        changed[0] = true
      }
      "Line-changing-child"
    }).as_base_formatter(),
  )
  line2d_render_clear_requests(axes)
  let before = line2d_render_data_bounds(axes)
  let retained = fig.to_render_figure()
  let (svg, _) = @svg.render_with_positions_checked(retained)
  assert_true(changed[0])
  assert_true(svg.contains("points=\"0,0 400,200\""))
  assert_eq(old_xy.to_array(), [0.0, 0.0, 1.0, 1.0])
  assert_eq(line.xy_values_checked().to_array(), [0.0, 1.0, 1.0, 0.0])
  assert_true(!line.stale())
  assert_eq(line2d_render_data_bounds(axes), before)
  assert_true(!axes.x_axis().autoscale_stale())
  assert_true(!axes.y_axis().autoscale_stale())
}

///|
test "render reads current converted views while old generations retain their own buffer" {
  let (fig, axes) = line2d_render_fixture()
  let line = axes.plot_line(
    LineData::Numeric([0.0, 0.5]),
    LineData::Numeric([0.0, 1.0]),
  )
  let retained = fig.to_render_figure()
  let old_x = line.x_values_checked()
  line2d_render_clear_requests(axes)
  let before = line2d_render_data_bounds(axes)
  line.set_xdata(LineData::Numeric([0.0, 0.25]))
  let current_x = line.x_values_checked()
  old_x.set(1, 0.75)
  current_x.set(1, 1.0)
  let (first, _) = @svg.render_with_positions_checked(retained)
  assert_true(first.contains("points=\"0,200 400,0\""))
  assert_eq(old_x.to_array(), [0.0, 0.75])
  assert_eq(current_x.to_array(), [0.0, 1.0])
  assert_true(!line.stale())
  match line.get_xdata() {
    LineData::Numeric(values) => assert_eq(values, [0.0, 0.25])
    _ => fail("expected unchanged numeric original data")
  }
  let current_y = line.y_values_checked()
  current_y.set(0, 1.0)
  assert_true(!line.stale())
  let (second, _) = @svg.render_with_positions_checked(retained)
  assert_true(second.contains("points=\"0,0 400,0\""))
  assert_eq(line2d_render_data_bounds(axes), before)
  assert_eq(before, (0.0, 0.5))
  assert_true(!axes.x_axis().autoscale_stale())
  assert_true(!axes.y_axis().autoscale_stale())
}

///|
test "retained IR pins the old Line completion across clear and a new attachment" {
  let (fig, axes) = line2d_render_fixture()
  let old = axes.plot_line(
    LineData::Numeric([0.0, 1.0]),
    LineData::Numeric([0.0, 1.0]),
  )
  let retained = fig.to_render_figure()
  axes.clear_checked()
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  for axis in [axes.x_axis(), axes.y_axis()] {
    axis.set_locator(@ticker.NullLocator::new().as_locator())
    axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  }
  let current = axes.plot_line(
    LineData::Numeric([0.0, 1.0]),
    LineData::Numeric([1.0, 0.0]),
  )
  old.set_ydata(LineData::Numeric([0.5, 0.5]))
  assert_true(old.stale())
  assert_true(current.stale())
  let (old_frame, _) = @svg.render_with_positions_checked(retained)
  assert_true(old_frame.contains("points=\"0,100 400,100\""))
  assert_true(!old.stale())
  assert_true(current.stale())
  assert_eq(current.xy_values_checked().to_array(), [0.0, 1.0, 1.0, 0.0])
  let new_frame = fig.to_svg_checked()
  assert_true(new_frame.contains("points=\"0,0 400,200\""))
  assert_true(!current.stale())
}

///|
test "Line render keeps category and date conversion on the existing units paths" {
  let (category_figure, category_axes) = line2d_render_fixture()
  let category = category_axes.plot_line(
    LineData::Category(["a", "b"]),
    LineData::Numeric([0.0, 1.0]),
  )
  let category_ir = category_figure.to_render_figure()
  category.set_xdata(LineData::Category(["b", "a"]))
  let (category_svg, _) = @svg.render_with_positions_checked(category_ir)
  assert_true(category_svg.contains("points=\"400,200 0,0\""))
  assert_true(!category.stale())
  match category.get_xdata() {
    LineData::Category(values) => assert_eq(values, ["b", "a"])
    _ => fail("category originals must survive render")
  }
  let (date_figure, date_axes) = line2d_render_fixture()
  let first = @date.RRuleDateTime::naive(@date.datetime(2024, 1, 1))
  let second = @date.RRuleDateTime::naive(@date.datetime(2024, 1, 2))
  let dates = date_axes.plot_line(
    LineData::Date([first, second]),
    LineData::Numeric([0.0, 1.0]),
  )
  let values = dates.x_values_checked().to_array()
  date_axes.set_x_limits(values[0], values[1])
  date_axes.x_axis().set_locator(@ticker.NullLocator::new().as_locator())
  let date_ir = date_figure.to_render_figure()
  dates.set_xdata(LineData::Date([second, first]))
  let (date_svg, _) = @svg.render_with_positions_checked(date_ir)
  assert_true(date_svg.contains("points=\"400,200 0,0\""))
  assert_true(!dates.stale())
  match dates.get_xdata() {
    LineData::Date(original) => {
      assert_true(original[0].is_naive())
      assert_eq(
        (
          original[0].date().year(),
          original[0].date().month(),
          original[0].date().day(),
        ),
        (2024, 1, 2),
      )
    }
    _ => fail("date originals must survive render")
  }
}
