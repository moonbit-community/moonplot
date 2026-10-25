///|
test "facade horizontal Stem returns actual component identity original head and decreasing bottom band" {
  let fig = @mathplotlib.figure(width=400, height=200)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  ax.set_x_limits(-2.0, 8.0)
  ax.set_y_limits(-2.0, 8.0)
  ax.stem(
    [4.0, -1.0, 6.0],
    locs=[1.0, 3.0, 6.0],
    bottom=1.0,
    orientation="horizontal",
    label="heads",
  )
  let frame = fig.to_drawing()
  let rod = frame
    .hit_info(frame.hit_test(80.0, 100.0, radius=0.0).unwrap())
    .unwrap()
  let head = frame
    .hit_info(frame.hit_test(40.0, 100.0, radius=0.0).unwrap())
    .unwrap()
  assert_eq(
    (
      rod.kind,
      rod.point.point_index,
      rod.point.artist_index,
      rod.value,
      rod.series,
    ),
    (@mathplotlib.HitKind::Stem, 1, 1, -1.0, "heads"),
  )
  assert_eq(
    (
      head.point.point_index,
      head.point.artist_index,
      head.point.data_x,
      head.point.data_y,
    ),
    (1, 4, -1.0, 3.0),
  )
  let band = rod.band.unwrap()
  assert_eq(
    (band.lower, band.upper, band.horizontal, band.stacked),
    (1.0, -1.0, true, false),
  )
  assert_eq(head.band, rod.band)
}
