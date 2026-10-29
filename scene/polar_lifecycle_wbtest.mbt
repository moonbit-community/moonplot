///|
test "polar typed and public Figure clear preserve projection settings while removing original series" {
  for via_figure in [false, true] {
    let (fig, p) = polar_control_figure(1)
    let old = fig.to_drawing()
    let original = p.config()
    let ticks = original.theta_ticks.copy()
    if via_figure {
      fig.clear_checked()
    } else {
      p.clear()
    }
    assert_true(fig.axes_list()[0].state.val.polar is Some(_))
    assert_eq(fig.axes_list()[0].artists().length(), 0)
    assert_eq(p.config().closed.length(), 0)
    assert_eq(p.config().theta_ticks, ticks)
    assert_eq(
      (p.config().direction, p.config().theta_offset, p.config().radius_max),
      (Clockwise, @math.PI / 2.0, Some(100.0)),
    )
    p.plot([0.0, @math.PI / 2.0], [25.0, 50.0])
    assert_eq(fig.to_drawing().targets().length(), 2)
    assert_eq(old.targets().length(), 10)
    assert_true(old.svg().contains("Radar"))
    assert_true(!fig.to_svg_checked().contains("Radar"))
  }
}

///|
test "polar inherited Cartesian configuration and foreign artists are checked errors before provider evaluation" {
  for case in 0..<10 {
    let (fig, _) = polar_control_figure(0)
    let ax = fig.axes_list()[0]
    match case {
      0 => ax.set_x_scale(@scale.log_scale())
      1 => ax.set_y_limits(0.0, 2.0)
      2 => ax.set_aspect_equal()
      3 => ax.set_x_ticks([0.0, 1.0])
      4 => ax.set_x_label("Cartesian")
      5 => ax.bar([@core.point(0.0, 1.0)])
      6 => ax.plot([0.0, 1.0], [0.0, 1.0])
      7 => ax.x_axis().configure_function_scale(x => x, x => x)
      8 =>
        ax
        .x_axis()
        .set_minor_locator(@ticker.FixedLocator::new([0.0]).as_minor_locator())
      _ => ax.set_axis_off()
    }
    let result = Ok(fig.to_svg_checked()) catch { e => Err(e) }
    assert_true(
      result is Err(@core.DataError::InvalidReference(..)),
      msg="unsupported case \{case}",
    )
  }
}

///|
test "mixed Cartesian and polar panels keep old ordinary hit data and independent resource circles" {
  let fig = figure(width=700, height=300)
  let cartesian = fig.add_axes(0.05, 0.1, 0.4, 0.8)
  cartesian.set_x_limits(0.0, 1.0)
  cartesian.set_y_limits(0.0, 1.0)
  cartesian.plot([0.0, 1.0], [0.0, 1.0], label="Ordinary")
  let old = fig.to_drawing()
  let polar = fig.add_polar_axes(0.5, 0.0, 0.5, 1.0)
  polar.plot([0.0, 1.0, 2.0], [1.0, 2.0, 1.0])
  let now = fig.to_drawing()
  assert_eq(
    now.targets().filter(t => t.info.point.panel_index == 0),
    old.targets(),
  )
  assert_eq(now.points().filter(p => p.panel_index == 0), old.points())
  assert_eq(
    now.targets().filter(t => t.info.point.panel_index == 1).length(),
    3,
  )
  assert_eq(now.svg(), fig.to_svg_checked())
  for mode in [@drawing.HitMode::Nearest, XNearest] {
    let point = now.hit_test(525.0, 150.0, radius=1.0e6, mode~).unwrap()
    assert_eq(now.hit_info(point).unwrap().kind, Polar)
    let (cx, cy, r) = now.polar_circle(1).unwrap()
    assert_eq(now.hit_test(cx - r, cy - r, radius=1.0e6, mode~), None)
  }
  let second = fig.add_polar_axes(0.75, 0.05, 0.2, 0.25)
  second.scatter([0.0], [1.0])
  let text = fig.to_svg_checked()
  assert_true(text.contains("moonplot-polar-clip-1-"))
  assert_true(text.contains("moonplot-polar-clip-2-"))
}

///|
test "polar inherited custom Cartesian grid and hidden spine cannot be silently ignored" {
  let rejected = []
  for case in 0..<5 {
    let (fig, _) = polar_control_figure(0)
    let axes = fig.axes_list()[0]
    match case {
      0 => axes.grid(visible=true, color="red", linewidth=3.0)
      1 => axes.spine(Left).set_visible(false)
      2 => axes.set_x_margin(0.5)
      3 => axes.set_anchor(Anchor::Named("SW"))
      _ => axes.set_x_tick_position(@axis.TickPosition::Top)
    }
    let result = Ok(fig.to_svg_checked()) catch { e => Err(e) }
    rejected.push(result is Err(@core.DataError::InvalidReference(..)))
  }
  println("polar-inherited-grid-spine rejected=\{Repr(rejected)}")
  assert_eq(rejected, [true, true, true, true, true])
}
