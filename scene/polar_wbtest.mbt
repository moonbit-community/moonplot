///|
fn polar_control_figure(case : Int32) -> (Figure, PolarAxes) raise {
  let fig = figure(width=400, height=240)
  let polar = fig.add_polar_axes(0.0, 0.0, 1.0, 1.0)
  polar.legend([])
  if case == 0 {
    let theta = [
      0.0,
      @math.PI / 2.0,
      @math.PI,
      3.0 * @math.PI / 2.0,
      @math.PI / 4.0,
    ]
    let radius = [1.0, 0.75, 0.5, 0.25, 0.6]
    polar.plot(theta, radius, color="#398575", label="Cardinal chords")
    polar.scatter(theta, radius, color="#d97706", size=4.0)
    polar.set_radius_max(1.0)
  } else if case == 1 {
    polar.set_title("Radar")
    polar.set_radius_max(100.0)
    polar.set_theta_offset(@math.PI / 2.0)
    polar.set_direction(Clockwise)
    let labels = ["力量", "速度", "恢复", "耐力", "防御"]
    polar.radar(
      [80.0, 60.0, 90.0, 70.0, 50.0],
      labels,
      color="#398575",
      label="First",
    )
    polar.radar(
      [60.0, 85.0, 65.0, 95.0, 75.0],
      labels,
      color="#d97706",
      label="Second",
    )
    polar.set_radius_ticks([25.0, 50.0, 75.0, 100.0])
  } else {
    let theta = [
      0.0,
      @math.PI / 4.0,
      @math.PI / 2.0,
      @math.PI,
      3.0 * @math.PI / 2.0,
    ]
    let radius = [1.0, 0.0 / 0.0, -1.0, 0.0, 2.0]
    polar.plot(theta, radius, closed=true, color="#398575")
    polar.scatter(theta, radius, color="#d97706", size=4.0)
    polar.set_radius_max(1.0)
  }
  (fig, polar)
}

///|
test "polar three real SVG scenes retain raw originals true circle clipping and deliberately no semantic capture" {
  for case in 0..<3 {
    let (fig, _) = polar_control_figure(case)
    let drawing = fig.to_drawing()
    assert_eq(drawing.svg(), fig.to_svg_checked())
    assert_true(drawing.svg().contains("<clipPath"))
    assert_true(drawing.svg().contains("clipPathUnits=\"userSpaceOnUse\""))
    assert_true(drawing.svg().contains("clip-path=\"url(#moonplot-polar-clip-"))
    assert_true(
      !drawing.svg().contains("NaN") && !drawing.svg().contains("Infinity"),
    )
    assert_eq((drawing.points().length(), drawing.targets().length()), (0, 0))
    for mode in [@drawing.HitMode::Nearest, XNearest] {
      assert_eq(drawing.hit_test(200.0, 120.0, radius=1.0e6, mode~), None)
    }
    for artist in fig.artists() {
      let points = match artist {
        Line(p, _) | Scatter(p, _) => p
        _ => fail("Polar primitive")
      }
      assert_eq(points.length(), 5)
    }
    let (left, top, width, height) = @svg.panel_position(
      fig.to_render_figure(),
      0,
    ).unwrap()
    assert_eq(width, height)
    assert_true(left > 0.0 && top > 0.0)
    println("POLAR_SVG_BEGIN\t\{case}")
    println(drawing.svg())
    println("POLAR_SVG_END\t\{case}")
  }
}
