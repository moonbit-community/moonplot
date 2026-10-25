///|
test "Barbs default tooltip uses original input X Y U V with safe missing vector fallback" {
  let point = @drawing.hit_point(0, 1, 2, 10.0, 2.0, 100.0, 100.0)
  let info = @drawing.hit_info(
    point,
    Barbs,
    value=0.2,
    vector=Some(@drawing.vector_info(0.1, 0.2)),
  )
  assert_eq(tooltip_kind(Barbs), "barbs")
  assert_eq(tooltip_rows(info), [
    ("X", "10"),
    ("Y", "2"),
    ("U", "0.1"),
    ("V", "0.2"),
  ])
  assert_eq(tooltip_rows(@drawing.hit_info(point, Barbs, value=0.2)), [
    ("X", "10"),
    ("Y", "2"),
  ])
}

///|
test "real Barbs stroke flag and nonzero rounded calm callback keep original input vector" {
  let fig = @plot.figure(width=400, height=280)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  ax.set_x_limits(0.0, 14.0)
  ax.set_y_limits(0.0, 14.0)
  ax.barbs_with_options(
    [5.0, 10.0],
    [3.0, 2.0],
    [6.5, 0.1],
    [0.0, 0.2],
    half_increment=0.5,
    full_increment=1.0,
    flag_increment=5.0,
    barb_length=12.0,
    pivot="middle",
    label="wind",
  )
  let frame = fig.to_drawing()
  for target in frame.targets() {
    let point = frame
      .hit_test(
        target.info.point.screen_x,
        target.info.point.screen_y,
        radius=1.0e-7,
      )
      .unwrap()
    let received : @ref.Ref[@drawing.HitInfo?] = @ref.Ref(None)
    ignore(
      view(frame, id="barbs", hovered=point, on_event=_ => @rabbita.none, tooltip=info => {
        received.val = Some(info)
        @html.b("原始风矢量")
      }),
    )
    let info = received.val.unwrap()
    assert_eq(info, frame.hit_info(point).unwrap())
    assert_eq(
      (info.kind, info.series, info.value),
      (Barbs, "wind", info.vector.unwrap().v),
    )
    if info.point.point_index == 1 {
      assert_eq((info.point.data_x, info.point.data_y), (10.0, 2.0))
      assert_eq(info.vector, Some(@drawing.vector_info(0.1, 0.2)))
    }
  }
}
