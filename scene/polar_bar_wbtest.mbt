///|
fn polar_bar_figure(case : Int32) -> Figure raise {
  let fig = figure(width=400, height=240)
  let p = fig.add_polar_axes(0.12, 0.18, 0.76, 0.64)
  p.legend([])
  p.set_radius_max(1.0)
  if case == 0 {
    p.bar(
      [
        for i in 0..<8 => i.to_double() * @math.PI / 4.0
      ],
      [0.6, 0.85, 0.0, 1.2, 0.4, -0.2, 0.55, 0.75],
      width=@math.PI / 6.0,
      color="#398575",
      label="Rose",
    )
  } else if case == 1 {
    p.bar(
      [@math.PI / 3.0],
      [0.72],
      width=2.0 * @math.PI,
      color="#d97706",
      label="Full",
    )
  } else {
    p.set_theta_offset(@math.PI / 2.0)
    p.set_direction(Clockwise)
    p.bar([1.0e308], [1.2], width=@math.PI / 3.0, label="Huge theta")
  }
  fig
}

///|
test "polar bar real sectors preserve raw slots and data with true full circle" {
  for case in 0..<3 {
    let fig = polar_bar_figure(case)
    let frame = fig.to_drawing()
    assert_eq(frame.svg(), fig.to_svg_checked())
    assert_eq(fig.containers().length(), 0)
    assert_eq(frame.targets().length(), [6, 1, 1][case])
    assert_true(fig.artists()[0] is Bar(_, _))
    let (cx, cy, circle_radius) = frame.polar_circle(0).unwrap()
    if case == 0 {
      assert_eq(frame.targets().map(t => t.info.point.point_index), [
        0, 1, 3, 4, 6, 7,
      ])
      assert_eq(frame.targets()[2].info.value, 1.2)
      assert_eq(frame.targets()[2].info.point.data_y, 1.2)
    }
    for target in frame.targets() {
      let info = target.info
      assert_eq(info.kind, PolarBar)
      assert_eq(info.value, info.point.data_y)
      assert_eq(info.interval, None)
      assert_eq(info.fraction, None)
      assert_eq(info.category, None)
      assert_true(target.shape is Sector(_, _, _, _, _))
      for mode in [@drawing.HitMode::Nearest, XNearest] {
        let found = frame
          .hit_test(info.point.screen_x, info.point.screen_y, radius=0.0, mode~)
          .unwrap()
        assert_eq(frame.hit_info(found), Some(info))
        assert_eq(
          frame.hit_test(
            cx + circle_radius,
            cy - circle_radius,
            radius=1.0e6,
            mode~,
          ),
          None,
        )
      }
    }
    if case == 1 {
      assert_true(frame.targets()[0].shape is Sector(_, _, _, _, 360.0))
      assert_true(!frame.svg().contains("<path"))
      for mode in [@drawing.HitMode::Nearest, XNearest] {
        assert_true(
          frame.hit_test(cx - circle_radius * 0.7, cy, radius=0.0, mode~)
          is Some(_),
        )
      }
    }
    println("POLAR_BAR_SVG_BEGIN\t\{case}")
    println(frame.svg())
    println("POLAR_BAR_SVG_END\t\{case}")
  }
}

///|
test "polar bar area admits only physically nearby later polar points" {
  for reversed in [false, true] {
    let fig = figure(width=400, height=240)
    let p = fig.add_polar_axes(0.0, 0.0, 1.0, 1.0)
    p.legend([])
    p.set_radius_max(1.0)
    if reversed {
      p.scatter([0.0], [0.5], label="Point")
    }
    p.bar([0.0], [1.0], width=@math.PI / 2.0, label="Area")
    if !reversed {
      p.scatter([0.0], [0.5], label="Point")
    }
    let frame = fig.to_drawing()
    let (cx, cy, radius) = frame.polar_circle(0).unwrap()
    for mode in [@drawing.HitMode::Nearest, XNearest] {
      let at_point = frame
        .hit_test(cx + radius / 2.0, cy, radius=1.0, mode~)
        .unwrap()
      assert_eq(
        frame.hit_info(at_point).unwrap().kind,
        if reversed {
          PolarBar
        } else {
          Polar
        },
      )
      let far_point = frame
        .hit_test(cx + radius * 0.8, cy, radius=1.0, mode~)
        .unwrap()
      assert_eq(frame.hit_info(far_point).unwrap().kind, PolarBar)
    }
  }
}
