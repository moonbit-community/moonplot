///|
test "facade ECDF callbacks reference compressed returned slots with exact complementary probability" {
  let fig = @mathplotlib.figure(width=400, height=200)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  ax.set_x_limits(0.0, 1.0)
  ax.set_y_limits(0.0, 5.0)
  ax.legend([])
  let result = ax.ecdf(
    [4.0, 1.0, 1.0, 3.0],
    weights=[2.0, 1.0, 2.0, 3.0],
    compress=true,
    complementary=true,
    horizontal=true,
  )
  assert_eq(result.values(), [1.0, 3.0, 4.0])
  assert_eq(result.probabilities(), [0.625, 0.25, 0.0])
  let frame = fig.to_drawing()
  let info = frame
    .hit_info(frame.hit_test(175.0, 80.0, radius=0.0).unwrap())
    .unwrap()
  assert_eq(
    (
      info.kind,
      info.point.point_index,
      info.value,
      info.fraction,
      info.interval,
    ),
    (
      @mathplotlib.HitKind::Ecdf,
      1,
      result.values()[1],
      Some(result.probabilities()[1]),
      Some((3.0, 4.0)),
    ),
  )
  let band = info.band.unwrap()
  assert_eq((band.lower, band.upper, band.horizontal), (0.625, 0.25, true))
}
