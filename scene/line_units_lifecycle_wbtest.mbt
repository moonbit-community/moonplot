///|
fn line_units_geometry(artist : Artist) -> Array[(Double, Double)] {
  match artist {
    Line(points, _) | Scatter(points, _) =>
      points.map(point => (point.x(), point.y()))
    _ => []
  }
}

///|
test "category replacement distinguishes identical numeric line and scatter geometry" {
  let axes = figure().axes()
  axes.plot_category(["b", "a"], [10.0, 20.0])
  axes.plot([0.0, 1.0], [10.0, 20.0])
  axes.scatter_category(["b", "a"], [10.0, 20.0])
  let x = axes.x_axis()
  let formatter = @ticker.FuncFormatter::new((_, _) => "explicit")
  let locator = @ticker.FixedLocator::new([0.0, 1.0])
  x.set_named_formatter(formatter.as_base_formatter())
  x.set_locator(locator.as_locator())
  axes.set_xlim(-1.0, 2.0)
  axes.set_ylim(5.0, 25.0)
  x.clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  axes.set_x_units(
    Some(@axis.AxisUnitTag::Category(@axis.CategoryUnits::new(["a", "b"]))),
  )
  assert_eq(line_units_geometry(axes.artists()[0]), [(1.0, 10.0), (0.0, 20.0)])
  assert_eq(line_units_geometry(axes.artists()[1]), [(0.0, 10.0), (1.0, 20.0)])
  assert_eq(line_units_geometry(axes.artists()[2]), [(0.0, 10.0), (1.0, 20.0)])
  assert_true(
    physical_equal(x.named_formatter().unwrap(), formatter.as_base_formatter()),
  )
  assert_true(
    physical_equal(x.locator().unwrap().fixed_locator().unwrap(), locator),
  )
  assert_true(!x.is_default_formatter())
  assert_true(!x.is_default_locator())
  assert_true(!x.autoscale_on())
  assert_true(x.autoscale_stale())
  assert_true(!axes.y_axis().autoscale_stale())
  let limits = axes.get_xlim_checked()
  assert_eq((limits.lower(), limits.upper()), (-1.0, 2.0))
  let data = axes.data_limits()
  assert_eq((data.lower(), data.upper()), (0.0, 1.0))
}

///|
test "category y recache appends omitted repeated empty and Unicode originals" {
  let axes = figure().axes()
  axes.plot_category_y([5.0, 6.0, 7.0, 8.0], ["β", "", "β", "猫"])
  axes.plot([5.0, 6.0, 7.0, 8.0], [0.0, 1.0, 0.0, 2.0])
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  let replacement = @axis.CategoryUnits::new(["", "猫"])
  axes.set_y_units(Some(@axis.AxisUnitTag::Category(replacement)))
  assert_eq(replacement.labels(), ["", "猫", "β"])
  assert_eq(line_units_geometry(axes.artists()[0]), [
    (5.0, 2.0),
    (6.0, 0.0),
    (7.0, 2.0),
    (8.0, 1.0),
  ])
  assert_eq(line_units_geometry(axes.artists()[1]), [
    (5.0, 0.0),
    (6.0, 1.0),
    (7.0, 0.0),
    (8.0, 2.0),
  ])
  assert_true(!axes.x_axis().autoscale_stale())
  assert_true(axes.y_axis().autoscale_stale())
}

///|
test "line original inputs and exported artist arrays are independent snapshots" {
  let axes = figure().axes()
  let names = ["b", "a"]
  let values = [10.0, 20.0]
  let xs = [0.0, 1.0]
  let ys = [30.0, 40.0]
  let points = [@core.point(2.0, 50.0), @core.point(3.0, 60.0)]
  axes.plot_category(names, values)
  axes.plot(xs, ys)
  axes.line(points)
  names[0] = "changed"
  values[0] = -100.0
  xs[0] = -200.0
  ys[0] = -300.0
  points[0] = @core.point(-400.0, -500.0)
  match axes.artists()[0] {
    Line(snapshot, _) => snapshot[0] = @core.point(-600.0, -700.0)
    _ => ()
  }
  axes.set_x_units(
    Some(@axis.AxisUnitTag::Category(@axis.CategoryUnits::new(["a", "b"]))),
  )
  assert_eq(line_units_geometry(axes.artists()[0]), [(1.0, 10.0), (0.0, 20.0)])
  assert_eq(line_units_geometry(axes.artists()[1]), [(0.0, 30.0), (1.0, 40.0)])
  assert_eq(line_units_geometry(axes.artists()[2]), [(2.0, 50.0), (3.0, 60.0)])
  assert_eq(axes.x_axis().get_category_units().unwrap().labels(), ["a", "b"])
}

///|
test "units recache retains empty lines and native nonfinite numeric vertices" {
  let axes = figure().axes()
  axes.plot_category([], [])
  axes.plot([0.0, 0.0 / 0.0, 2.0], [1.0, 2.0, 3.0])
  axes.plot_category(["b", "a"], [1.0, 2.0])
  axes.set_x_units(
    Some(@axis.AxisUnitTag::Category(@axis.CategoryUnits::new(["a", "b"]))),
  )
  assert_eq(line_units_geometry(axes.artists()[0]), [])
  let numeric = line_units_geometry(axes.artists()[1])
  assert_eq(numeric.length(), 3)
  assert_eq(numeric[0], (0.0, 1.0))
  assert_true(numeric[1].0.is_nan())
  assert_eq(numeric[1].1, 2.0)
  assert_eq(numeric[2], (2.0, 3.0))
  assert_eq(line_units_geometry(axes.artists()[2]), [(1.0, 1.0), (0.0, 2.0)])
}

///|
test "conversion-only units failure commits earlier lines without relim or a new request" {
  let axes = figure().axes()
  axes.plot_category(["b", "a"], [10.0, 20.0])
  axes.plot_category_y([0.0, 1.0], ["low", "high"])
  axes.plot_category(["b", "a"], [30.0, 40.0])
  let old_bad = line_units_geometry(axes.artists()[1])
  let old_last = line_units_geometry(axes.artists()[2])
  let old_data = axes.data_limits()
  axes.y_axis().clear()
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  let replacement = @axis.CategoryUnits::new(["pad", "more", "a", "b"])
  assert_true(
    try {
      axes.set_x_units(Some(@axis.AxisUnitTag::Category(replacement)))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message.contains("Missing category information")
      _ => false
    },
  )
  assert_eq(line_units_geometry(axes.artists()[0]), [(3.0, 10.0), (2.0, 20.0)])
  assert_eq(line_units_geometry(axes.artists()[1]), old_bad)
  assert_eq(line_units_geometry(axes.artists()[2]), old_last)
  assert_true(
    physical_equal(axes.x_axis().get_category_units().unwrap(), replacement),
  )
  assert_eq(axes.y_axis().unit_converter_kind(), Some("category"))
  assert_true(axes.y_axis().unit_tag() is None)
  let data = axes.data_limits()
  assert_eq((data.lower(), data.upper()), (old_data.lower(), old_data.upper()))
  assert_true(!axes.x_axis().autoscale_stale())
  assert_true(!axes.y_axis().autoscale_stale())
}

///|
test "shared units preserve ordered peer partial changes when a later peer conversion fails" {
  let fig = figure()
  let panels = fig.subplots(1, 3, share_x=true)
  for panel in panels {
    panel.plot_category(["b", "a"], [10.0, 20.0])
  }
  let ordered = panels[0].x_group_states()
  let first : Axes = { figure: fig, state: ordered[0], }
  let bad : Axes = { figure: fig, state: ordered[1], }
  let last : Axes = { figure: fig, state: ordered[2], }
  bad.plot_category_y([0.0, 1.0], ["low", "high"])
  bad.y_axis().clear()
  let old_last_units = last.x_axis().get_category_units().unwrap()
  for panel in panels {
    panel.x_axis().clear_autoscale_request()
    panel.y_axis().clear_autoscale_request()
  }
  let replacement = @axis.CategoryUnits::new(["a", "b"])
  assert_true(
    try {
      panels[0].set_x_units(Some(@axis.AxisUnitTag::Category(replacement)))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message.contains("Missing category information")
      _ => false
    },
  )
  assert_eq(line_units_geometry(first.artists()[0]), [(1.0, 10.0), (0.0, 20.0)])
  assert_eq(line_units_geometry(bad.artists()[0]), [(1.0, 10.0), (0.0, 20.0)])
  assert_eq(line_units_geometry(last.artists()[0]), [(0.0, 10.0), (1.0, 20.0)])
  assert_true(
    physical_equal(first.x_axis().get_category_units().unwrap(), replacement),
  )
  assert_true(
    physical_equal(bad.x_axis().get_category_units().unwrap(), replacement),
  )
  assert_true(
    physical_equal(last.x_axis().get_category_units().unwrap(), old_last_units),
  )
  assert_true(first.x_axis().autoscale_stale())
  assert_true(!bad.x_axis().autoscale_stale())
  assert_true(!last.x_axis().autoscale_stale())
}

///|
test "detached line originals remain local and whole axes clear forgets them" {
  let fig = figure()
  let panels = fig.subplots(1, 2, share_x=true)
  panels[0].plot_category(["b", "a"], [1.0, 2.0], color="#102030")
  panels[1].plot_category(["b", "a"], [3.0, 4.0], color="#405060")
  panels[1].remove()
  panels[1].set_x_units(
    Some(@axis.AxisUnitTag::Category(@axis.CategoryUnits::new(["a", "b"]))),
  )
  assert_eq(line_units_geometry(panels[1].artists()[0]), [
    (1.0, 3.0),
    (0.0, 4.0),
  ])
  assert_eq(line_units_geometry(panels[0].artists()[0]), [
    (0.0, 1.0),
    (1.0, 2.0),
  ])
  assert_true(!fig.to_svg_checked().contains("#405060"))
  panels[0].clear_checked()
  panels[0].plot([0.0, 1.0], [5.0, 6.0])
  panels[0].set_x_units(
    Some(@axis.AxisUnitTag::Category(@axis.CategoryUnits::new(["a", "b"]))),
  )
  assert_eq(panels[0].artists().length(), 1)
  assert_eq(line_units_geometry(panels[0].artists()[0]), [
    (0.0, 5.0),
    (1.0, 6.0),
  ])
  panels[1].set_x_units(
    Some(@axis.AxisUnitTag::Category(@axis.CategoryUnits::new(["b", "a"]))),
  )
  assert_eq(line_units_geometry(panels[1].artists()[0]), [
    (0.0, 3.0),
    (1.0, 4.0),
  ])
}

///|
test "streamplot display lines retain nested points aliases across units recache" {
  let axes = figure().axes()
  let stream = axes.streamplot(
    [0.0, 1.0, 2.0],
    [0.0, 1.0, 2.0],
    [[1.0, 1.0, 1.0], [1.0, 1.0, 1.0], [1.0, 1.0, 1.0]],
    [[0.0, 0.0, 0.0], [0.0, 0.0, 0.0], [0.0, 0.0, 0.0]],
    start_points=[@core.point(0.0, 0.5)],
    arrows=false,
  )
  assert_true(stream.lines().length() > 0)
  let changed = @core.point(123.0, 456.0)
  match stream.lines()[0] {
    Line(points, _) => points[0] = changed
    _ => fail("expected a streamline")
  }
  axes.plot_category(["b", "a"], [1.0, 2.0])
  axes.set_x_units(
    Some(@axis.AxisUnitTag::Category(@axis.CategoryUnits::new(["a", "b"]))),
  )
  assert_eq(line_units_geometry(axes.artists()[0])[0], (123.0, 456.0))
  assert_eq(line_units_geometry(stream.lines()[0])[0], (123.0, 456.0))
  assert_eq(axes.data_limits().upper(), 123.0)
  assert_eq(axes.data_limits(horizontal=false).upper(), 456.0)
}

///|
test "date line recache preserves naive and aware instants after a display zone change" {
  let axes = figure().axes()
  let dates = [
    @date.RRuleDateTime::naive(@date.datetime(2024, 1, 1)),
    @date.RRuleDateTime::aware(@date.datetime(2024, 1, 2, offset_minutes=120)),
  ]
  axes.plot_date_units(dates, [10.0, 20.0])
  let before = line_units_geometry(axes.artists()[0])
  dates[0] = @date.RRuleDateTime::naive(@date.datetime(2030, 1, 1))
  axes.set_x_units(Some(@axis.AxisUnitTag::Date(@date.fixed_timezone(300))))
  assert_eq(line_units_geometry(axes.artists()[0]), before)
  assert_eq(before[0].0, @date.datetime(2024, 1, 1).to_ordinal())
  assert_eq(
    before[1].0,
    @date.datetime(2024, 1, 2, offset_minutes=120).to_ordinal(),
  )
}

///|
test "current numeric render snapshot follows remapped category vertices without changing native lines" {
  let fig = figure(width=400, height=240)
  let axes = fig.axes()
  axes.plot_category(["b<&", "猫"], [0.0, 1.0], color="#123abc")
  axes.plot([0.0, 1.0], [0.0, 1.0], color="#456def")
  axes.set_xlim(0.0, 1.0)
  axes.set_ylim(0.0, 1.0)
  axes.set_x_units(
    Some(@axis.AxisUnitTag::Category(@axis.CategoryUnits::new(["猫", "b<&"]))),
  )
  let panel = fig.to_render_figure().panels()[0]
  match panel.artists()[0] {
    @render.Artist::Line(points, _) =>
      assert_eq(points.map(point => (point.x(), point.y())), [
        (1.0, 0.0),
        (0.0, 1.0),
      ])
    _ => fail("expected the remapped render line")
  }
  match panel.artists()[1] {
    @render.Artist::Line(points, _) =>
      assert_eq(points.map(point => (point.x(), point.y())), [
        (0.0, 0.0),
        (1.0, 1.0),
      ])
    _ => fail("expected the native render line")
  }
  let svg = fig.to_svg_checked()
  assert_true(svg.contains("#123abc"))
  assert_true(svg.contains("#456def"))
  assert_true(svg.contains("b&lt;&amp;"))
  assert_true(svg.contains("猫"))
  assert_true(!svg.contains("NaN"))
}

///|
test "actual inline contour rewriting prunes matching true line originals without adopting fragments" {
  let axes = figure().axes()
  let contours = axes.contour([[0.0, 0.0], [1.0, 1.0]], levels=[0.5])
  let target = contours.segments()[0]
  axes.line(target)
  axes.plot([2.0, 3.0], [4.0, 5.0])
  assert_eq(axes.state.val.line_originals.length(), 2)
  axes.clabel(contours, inline=true)
  assert_eq(axes.state.val.line_originals.length(), 1)
  let geometry = axes.artists().map(artist => line_units_geometry(artist))
  assert_true(geometry.length() > 4)
  axes.set_x_units(
    Some(@axis.AxisUnitTag::Category(@axis.CategoryUnits::new(["a", "b"]))),
  )
  assert_eq(axes.artists().map(artist => line_units_geometry(artist)), geometry)
  assert_eq(axes.state.val.line_originals.length(), 1)
}
