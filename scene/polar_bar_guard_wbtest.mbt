///|
test "polar bar array copy content change and wrong primitive retain static paint without stale capture" {
  for replacement in 0..<4 {
    let fig = figure(width=400, height=240)
    let p = fig.add_polar_axes(0.0, 0.0, 1.0, 1.0)
    p.legend([])
    p.set_radius_max(2.0)
    p.bar([0.0, 1.0], [0.5, 1.0], width=0.4, label="Original")
    let old = fig.to_drawing()
    let state = fig.axes_list()[0].state.val
    guard state.artists[0] is Bar(points, style) else { fail("Bar") }
    match replacement {
      0 => state.artists[0] = Bar(points.copy(), style)
      1 => points[0] = @core.point(0.25, 0.75)
      2 => state.artists[0] = Line(points, style)
      _ =>
        state.artists[0] = Scatter(points, @core.style("#398575", radius=4.0))
    }
    let now = fig.to_drawing()
    assert_eq(now.svg(), fig.to_svg_checked())
    assert_eq(now.targets().length(), 0)
    assert_eq(now.points().length(), 0)
    if replacement == 0 {
      assert_eq(now.svg(), old.svg())
    }
    if replacement == 1 {
      assert_true(now.svg() != old.svg())
    }
    assert_eq(p.config().hit_data[0].bar_width(), Some(0.4))
    let point = old.targets()[0].info.point
    assert_eq(
      old.hit_test(point.screen_x, point.screen_y, radius=0.0),
      Some(point),
    )
    assert_eq(old.hit_info(point).unwrap().series, "Original")
  }
}

///|
test "polar hand injected Bar has no guessed width or borrowed curve source" {
  for from_scatter in [false, true] {
    let fig = figure(width=400, height=240)
    let p = fig.add_polar_axes(0.0, 0.0, 1.0, 1.0)
    if from_scatter {
      p.scatter([0.0], [1.0])
    } else {
      p.plot([0.0], [1.0])
    }
    let state = fig.axes_list()[0].state.val
    let points = match state.artists[0] {
      Line(points, _) | Scatter(points, _) => points
      _ => fail("Curve or marker")
    }
    state.artists[0] = Bar(points, @core.style("#398575", fill="#398575"))
    let rejected = try {
      ignore(fig.to_svg_checked())
      false
    } catch {
      @core.DataError::InvalidReference(..) => true
      _ => false
    }
    assert_true(rejected)
  }
}

///|
test "polar bar capture follows actual fill even at zero stroke width" {
  let fig = figure(width=400, height=240)
  let p = fig.add_polar_axes(0.0, 0.0, 1.0, 1.0)
  for color in ["none", "transparent", "#11223300", "rgba(12,34,56,0)"] {
    p.bar([0.0], [1.0], width=0.5, color~)
  }
  p.bar([1.0], [1.0], width=0.5, color="#398575")
  let frame = fig.to_drawing()
  assert_eq(frame.targets().length(), 1)
  assert_eq(frame.targets()[0].info.point.artist_index, 4)
  assert_true(frame.svg().contains("stroke=\"none\""))
}
