///|
test "stairs default tooltip displays original interval value and real fill baseline" {
  let point = @drawing.hit_point(0, 0, 1, -2.0, 1.0, 100.0, 100.0)
  let info = @drawing.hit_info(
    point,
    Stairs,
    value=-2.0,
    interval=Some((1.0, 4.0)),
    band=Some(@drawing.band_info(1.0, -2.0, horizontal=true)),
  )
  assert_eq(tooltip_rows(info), [
    ("Range", "1 – 4"),
    ("Value", "-2"),
    ("Baseline", "1"),
  ])
  assert_eq(tooltip_rows(@drawing.hit_info(point, Stairs, value=-2.0)), [
    ("Value", "-2"),
  ])
}

///|
test "real filled horizontal stairs callback preserves signed band source edge and original index" {
  let fig = @plot.figure(width=400, height=200)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  ax.set_x_limits(-3.0, 5.0)
  ax.set_y_limits(-3.0, 5.0)
  ax.legend([])
  ax.stairs(
    [3.0, -2.0],
    edges=[0.0, 1.0, 4.0],
    orientation="horizontal",
    baseline=1.0,
    fill=true,
  )
  let frame = fig.to_drawing()
  let point = frame.hit_test(125.0, 62.5, radius=0.0).unwrap()
  let received : @ref.Ref[@drawing.HitInfo?] = @ref.Ref(None)
  ignore(
    view(frame, id="stairs", hovered=point, on_event=_ => @rabbita.none, tooltip=info => {
      received.val = Some(info)
      @html.b("原始区间")
    }),
  )
  let info = received.val.unwrap()
  assert_eq(info, frame.hit_info(point).unwrap())
  assert_eq(
    (info.kind, info.point.point_index, info.value, info.interval),
    (Stairs, 1, -2.0, Some((1.0, 4.0))),
  )
  assert_eq(info.band, Some(@drawing.band_info(1.0, -2.0, horizontal=true)))
}
