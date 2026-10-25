///|
test "facade errorbar exposes original sample ranges and real cap geometry" {
  let fig = @mathplotlib.figure(width=400, height=200)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  ax.set_x_limits(0.0, 4.0)
  ax.set_y_limits(0.0, 10.0)
  ax.legend([])
  ax.errorbar([1.0], [4.0], xerr=[0.5], yerr=[2.0], label="Measured")
  let frame = fig.to_drawing()
  let point = frame.hit_test(97.0, 80.0, radius=0.0).unwrap()
  let info = frame.hit_info(point).unwrap()
  let error : @mathplotlib.ErrorInfo = info.error.unwrap()
  assert_eq(info.kind, @mathplotlib.HitKind::ErrorBar)
  assert_eq(info.series, "Measured")
  assert_eq((point.data_x, point.data_y), (1.0, 4.0))
  assert_eq(error.x_range, (0.5, 1.5))
  assert_eq(error.y_range, (2.0, 6.0))
  assert_true(
    frame
    .targets()
    .any(target => target.shape is @mathplotlib.HitShape::Segment(_, _, _, _)),
  )
  assert_eq(frame.svg(), fig.to_svg_checked())
}
