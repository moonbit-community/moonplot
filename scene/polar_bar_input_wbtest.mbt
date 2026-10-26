///|
test "polar bar width and pair validation is atomic before artist identity legend or color consumption" {
  let fig = figure(width=400, height=240)
  let p = fig.add_polar_axes(0.0, 0.0, 1.0, 1.0)
  p.bar([0.0], [1.0], width=0.5, label="First")
  let before = fig.to_drawing()
  for width in [0.0, -1.0, 2.0 * @math.PI + 1.0e-10, 1.0 / 0.0, 0.0 / 0.0] {
    let rejected = try {
      p.bar([0.0], [2.0], width~, label="Rejected")
      false
    } catch {
      _ => true
    }
    assert_true(rejected)
    assert_eq(fig.to_drawing().targets(), before.targets())
    assert_eq(fig.to_svg_checked(), before.svg())
    assert_eq(p.config().closed.length(), 1)
    assert_eq(p.config().hit_data.length(), 1)
  }
  let rejected = try {
    p.bar([0.0], [], width=0.5, label="Mismatch")
    false
  } catch {
    _ => true
  }
  assert_true(rejected)
  p.bar([1.0], [2.0], width=0.5, label="Second")
  let reference = figure(width=400, height=240)
  let q = reference.add_polar_axes(0.0, 0.0, 1.0, 1.0)
  q.bar([0.0], [1.0], width=0.5, label="First")
  q.bar([1.0], [2.0], width=0.5, label="Second")
  assert_eq(fig.to_svg_checked(), reference.to_svg_checked())
  assert_eq(fig.containers().length(), 0)
}

///|
test "polar bars copy arrays retain missing source slots and keep independent call labels" {
  let fig = figure(width=400, height=240)
  let p = fig.add_polar_axes(0.0, 0.0, 1.0, 1.0)
  let theta = [0.0, 1.0, 0.0 / 0.0, 3.0, 4.0, 5.0, 6.0]
  let radius = [2.0, 0.0, 1.0, -1.0, 1.0 / 0.0, 0.75, 0.5]
  p.set_radius_max(1.0)
  p.bar(theta, radius, width=0.2, color="#398575", label="First")
  p.bar([0.0], [0.5], width=0.2, color="#398575", label="Second")
  let old = fig.to_drawing()
  assert_eq(
    old
    .targets()
    .map(t => (t.info.point.artist_index, t.info.point.point_index)),
    [(0, 0), (0, 5), (0, 6), (1, 0)],
  )
  theta[0] = 8.0
  radius[0] = 9.0
  guard fig.artists()[0] is Bar(inspected, _) else { fail("Bar") }
  inspected[0] = @core.point(8.0, 9.0)
  assert_eq(fig.to_drawing().svg(), old.svg())
  assert_eq(fig.to_drawing().targets(), old.targets())
  assert_eq(old.targets()[0].info.point.data_x, 0.0)
  assert_eq(old.targets()[0].info.value, 2.0)
  assert_eq(old.targets()[0].info.series, "First")
  assert_eq(old.targets()[3].info.series, "Second")
  p.set_theta_ticks([0.0], labels=["Display only"])
  p.legend([])
  assert_eq(
    fig
    .to_drawing()
    .targets()
    .map(t => {
      (
        t.info.point.point_index,
        t.info.point.data_x,
        t.info.point.data_y,
        t.info.value,
        t.info.series,
      )
    }),
    old
    .targets()
    .map(t => {
      (
        t.info.point.point_index,
        t.info.point.data_x,
        t.info.point.data_y,
        t.info.value,
        t.info.series,
      )
    }),
  )
}

///|
test "polar bar auto maximum includes other primitives and caps raw huge radii before ratio" {
  let fig = figure(width=400, height=240)
  let p = fig.add_polar_axes(0.0, 0.0, 1.0, 1.0)
  p.legend([])
  p.bar([0.0], [2.0], width=0.5)
  p.plot([1.0, 2.0], [4.0, 3.0])
  p.scatter([3.0], [8.0])
  let frame = fig.to_drawing()
  let (_, _, radius) = frame.polar_circle(0).unwrap()
  guard frame.targets()[0].shape is Sector(_, _, r, _, _) else {
    fail("Sector")
  }
  assert_eq(r, radius / 4.0)
  p.clear()
  p.set_radius_max(1.0e-300)
  p.bar([0.0], [1.0e308], width=0.5)
  let huge = fig.to_drawing()
  assert_eq(huge.targets().length(), 1)
  assert_eq(huge.targets()[0].info.value, 1.0e308)
  guard huge.targets()[0].shape is Sector(_, _, clipped, _, _) else {
    fail("Sector")
  }
  assert_eq(clipped, radius)
  assert_true(!huge.svg().contains("Infinity") && !huge.svg().contains("NaN"))
}

///|
test "polar bar clear preserves projection and previously returned frame with correct rebuilt source kind" {
  for via_figure in [false, true] {
    let fig = figure(width=400, height=240)
    let p = fig.add_polar_axes(0.0, 0.0, 1.0, 1.0)
    p.set_direction(Clockwise)
    p.set_radius_max(3.0)
    p.bar([0.0, 1.0], [1.0, 2.0], width=0.4, label="Before")
    let old = fig.to_drawing()
    if via_figure {
      fig.clear_checked()
    } else {
      p.clear()
    }
    assert_eq(p.config().hit_data.length(), 0)
    assert_eq(fig.to_drawing().targets().length(), 0)
    assert_eq(p.config().direction, Clockwise)
    assert_eq(p.config().radius_max, Some(3.0))
    p.bar([2.0], [1.5], width=2.0 * @math.PI, label="After")
    let now = fig.to_drawing()
    assert_eq(now.targets().length(), 1)
    assert_eq(now.targets()[0].info.series, "After")
    assert_true(now.targets()[0].shape is Sector(_, _, _, _, 360.0))
    assert_eq(old.targets().length(), 2)
    assert_eq(old.targets()[0].info.series, "Before")
  }
}
