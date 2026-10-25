///|
test "facade exposes typed boxplot statistics and original outlier values" {
  let fig = @mathplotlib.figure(width=400, height=200)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  ax.set_x_limits(0.0, 2.0)
  ax.set_y_limits(0.0, 25.0)
  ignore(ax.boxplot([[1.0, 2.0, 3.0, 4.0, 5.0, 20.0]], label="Samples"))
  ax.legend([])
  let frame = fig.to_drawing()
  let point = frame.hit_test(200.0, 40.0, radius=0.0).unwrap()
  let info = frame.hit_info(point).unwrap()
  assert_eq(info.kind, @mathplotlib.HitKind::BoxPlot)
  let box : @mathplotlib.BoxInfo = info.box.unwrap()
  let part : @mathplotlib.BoxPart = box.part
  assert_eq(part, @mathplotlib.BoxPart::Outlier(20.0))
  assert_eq((box.group_index, point.point_index), (0, 0))
  assert_eq(
    (box.lower_whisker, box.q1, box.median, box.q3, box.upper_whisker),
    (1.0, 2.25, 3.5, 4.75, 5.0),
  )
  assert_eq((info.value, info.series), (20.0, "Samples"))
}
