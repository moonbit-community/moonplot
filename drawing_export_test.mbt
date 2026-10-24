///|
test "root facade exports a reusable drawing and typed point hit" {
  let figure = @mathplotlib.figure(width=320, height=200)
  figure.plot([1.0, 2.0], [3.0, 4.0])
  let drawing : @mathplotlib.Drawing = figure.to_drawing()
  let point : @mathplotlib.HitPoint = drawing.points()[0]
  assert_eq(point.point_index, 0)
  assert_eq((point.data_x, point.data_y), (1.0, 3.0))
  assert_eq(
    drawing.hit_test(point.screen_x, point.screen_y, radius=0.0),
    Some(point),
  )
  assert_eq(drawing.svg(), figure.to_svg_checked())
}
