///|
test "polar inputs and tick labels are copied while source arrays retain exactly their original polar observations" {
  let fig = figure(width=420, height=300)
  let p = fig.add_polar_axes(0.0, 0.0, 1.0, 1.0)
  let theta = [0.0, 1.0, 2.0]
  let radii = [1.0, 2.0, 3.0]
  let labels = ["east<&", "middle", "last"]
  let ticks = [0.0, 1.0, 2.0]
  p.plot(theta, radii, closed=true, label="Original")
  p.scatter(theta, radii, size=4.0)
  p.set_theta_ticks(ticks, labels~)
  p.set_radius_ticks([1.0, 2.0, 3.0], labels=["one", "two", "three"])
  let before = fig.to_drawing()
  theta[0] = 7.0
  radii[0] = 99.0
  ticks[0] = 5.0
  labels[0] = "Changed"
  guard fig.axes_list()[0].artists()[0] is Line(inspected, _) else {
    fail("Line")
  }
  assert_eq(inspected.length(), 3)
  assert_eq((inspected[0].x(), inspected[0].y()), (0.0, 1.0))
  inspected[0] = @core.point(8.0, 8.0)
  assert_eq(fig.to_drawing().svg(), before.svg())
  assert_true(before.svg().contains("east&lt;&amp;"))
  assert_true(!before.svg().contains("Changed"))
  assert_eq(fig.to_drawing().targets(), before.targets())
  assert_true(before.targets().any(t => t.info.kind == Polar))
}

///|
test "polar invalid sizes ranges offsets and tick pairs fail atomically before appending artists or changing configuration" {
  let (fig, p) = polar_control_figure(0)
  let before = fig.to_svg_checked()
  for case in 0..<10 {
    let result = Ok(
      match case {
        0 => p.plot([0.0], [])
        1 => p.scatter([0.0], [])
        2 => p.plot([0.0], [1.0], linewidth=-1.0)
        3 => p.scatter([0.0], [1.0], size=1.0 / 0.0)
        4 => p.set_radius_max(0.0)
        5 => p.set_radius_max(1.0 / 0.0)
        6 => p.set_theta_offset(0.0 / 0.0)
        7 => p.set_theta_ticks([0.0, 1.0], labels=["Only one"])
        8 => p.set_radius_ticks([-1.0])
        _ => p.set_theta_ticks([1.0 / 0.0])
      },
    ) catch {
      e => Err(e)
    }
    assert_true(result is Err(_))
    assert_eq(fig.to_svg_checked(), before)
    assert_eq(fig.axes_list()[0].artists().length(), 2)
  }
}

///|
test "radar keeps five raw values and category consistency without rotating the panel or normalizing dimensions" {
  let (fig, p) = polar_control_figure(1)
  let before = fig.to_svg_checked()
  let direction = p.config().direction
  let offset = p.config().theta_offset
  for case in 0..<3 {
    let result = Ok(
      match case {
        0 => p.radar([1.0, 2.0], ["a", "b"])
        1 => p.radar([1.0, 2.0, 3.0], ["a", "b"])
        _ =>
          p.radar([1.0, 2.0, 3.0, 4.0, 5.0], [
            "different", "速度", "恢复", "耐力", "防御",
          ])
      },
    ) catch {
      e => Err(e)
    }
    assert_true(result is Err(_))
    assert_eq(fig.to_svg_checked(), before)
  }
  assert_eq(
    (p.config().direction, p.config().theta_offset),
    (direction, offset),
  )
  assert_eq(p.config().radar_labels.unwrap(), [
    "力量", "速度", "恢复", "耐力", "防御",
  ])
  guard fig.axes_list()[0].artists()[0] is Line(points, _) else { fail("Line") }
  assert_eq(points.map(q => q.y()), [80.0, 60.0, 90.0, 70.0, 50.0])
}
