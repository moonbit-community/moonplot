///|
test "facade Contour uses generated path slots exact level and physical interaction after inline clabel" {
  let fig = @mathplotlib.figure(width=400, height=300)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  ax.set_x_limits(0.0, 2.0)
  ax.set_y_limits(0.0, 2.0)
  let contours = ax.contour(
    [[0.0, 1.0], [1.0, 2.0]],
    levels=[0.5],
    label="Level lines",
  )
  fig.clabel(contours)
  let frame = fig.to_drawing()
  assert_eq(frame.svg(), fig.to_svg_checked())
  assert_true(frame.targets().length() > 0)
  for target in frame.targets() {
    let p = target.info.point
    let kind : @mathplotlib.HitKind = target.info.kind
    assert_eq(kind, @mathplotlib.HitKind::Contour)
    assert_eq(p.point_index, 0)
    assert_eq(target.info.value, contours.segment_levels()[p.point_index])
    for mode in [@mathplotlib.HitMode::Nearest, XNearest] {
      let selected = frame
        .hit_test(p.screen_x, p.screen_y, radius=1.0e-7, mode~)
        .unwrap()
      let info : @mathplotlib.HitInfo = frame.hit_info(selected).unwrap()
      assert_eq(
        (info.kind, info.series, info.value),
        (@mathplotlib.HitKind::Contour, "Level lines", 0.5),
      )
      assert_eq(
        (info.vector, info.interval, info.fraction, info.cell, info.band),
        (None, None, None, None, None),
      )
    }
  }
}
