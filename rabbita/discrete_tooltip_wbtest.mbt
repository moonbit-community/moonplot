///|
test "discrete tooltip defaults preserve original values intervals and actual probability" {
  let point = @drawing.hit_point(0, 0, 1, 2.0, 6.0, 160.0, 80.0)
  assert_eq(tooltip_kind(Step), "step")
  assert_eq(tooltip_kind(Stairs), "stairs")
  assert_eq(tooltip_kind(Ecdf), "ecdf")
  assert_eq(
    tooltip_rows(
      @drawing.hit_info(point, Step, value=6.0, interval=Some((0.0, 2.0))),
    ),
    [("Range", "0 – 2"), ("Value", "6")],
  )
  assert_eq(tooltip_rows(@drawing.hit_info(point, Step, value=6.0)), [
    ("Value", "6"),
  ])
  assert_eq(
    tooltip_rows(
      @drawing.hit_info(point, Ecdf, value=2.0, fraction=Some(0.625)),
    ),
    [("Value", "2"), ("Probability", "0.625")],
  )
}

///|
test "real step original endpoint and riser pass selected source data to the custom DOM callback" {
  let fig = @plot.figure(width=400, height=200)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  ax.set_x_limits(0.0, 5.0)
  ax.set_y_limits(0.0, 10.0)
  ax.legend([])
  ax.step([0.0, 2.0, 5.0], [2.0, 6.0, 4.0], where_="pre", label="samples")
  let frame = fig.to_drawing()
  for
    (x, y, index, range) in [
      (0.0, 160.0, 0, None),
      (0.0, 120.0, 1, Some((0.0, 2.0))),
    ] {
    let point = frame.hit_test(x, y, radius=0.0).unwrap()
    let received : @ref.Ref[@drawing.HitInfo?] = @ref.Ref(None)
    ignore(
      view(frame, id="step", hovered=point, on_event=_ => @tea.none, tooltip=info => {
        received.val = Some(info)
        @html.b("原始样本")
      }),
    )
    let info = received.val.unwrap()
    assert_eq(info, frame.hit_info(point).unwrap())
    assert_eq(
      (info.kind, info.point.point_index, info.interval),
      (Step, index, range),
    )
    assert_eq(info.value, if index == 0 { 2.0 } else { 6.0 })
  }
}
