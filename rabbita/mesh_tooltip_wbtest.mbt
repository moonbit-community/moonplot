///|
test "histogram2d tooltips distinguish Count and both source intervals from a heatmap scalar" {
  let point = @drawing.hit_point(0, 1, 5, 2.0, 3.0, 50.0, 50.0)
  let cell = @drawing.cell_info(1, 2, (1.0, 3.0), (2.0, 4.0))
  let info = @drawing.hit_info(point, Histogram2D, value=7.0, cell=Some(cell))
  assert_eq(tooltip_kind(info.kind), "histogram2d")
  assert_eq(tooltip_rows(@drawing.hit_info(point, Histogram2D, value=0.0)), [
    ("Count", "0"),
  ])
  assert_eq(tooltip_rows(info), [
    ("x range", "1 – 3"),
    ("y range", "2 – 4"),
    ("Count", "7"),
  ])
  assert_eq(
    tooltip_rows(@drawing.hit_info(point, Heatmap, value=7.0, cell=Some(cell))),
    [("Row", "1"), ("Column", "2"), ("Value", "7")],
  )
}

///|
test "real histogram2d drawing delivers raw zero counts and typed intervals to custom DOM content" {
  let fig = @plot.figure(width=400, height=200)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  ax.set_x_limits(0.0, 2.0)
  ax.set_y_limits(0.0, 2.0)
  ax.hist2d([0.0, 0.2, 1.8, 2.0], [0.0, 0.2, 0.0, 2.0], bins_x=2, bins_y=2)
  let frame = fig.to_drawing()
  let point = frame.hit_test(100.0, 50.0, radius=0.0).unwrap()
  let received : @ref.Ref[@drawing.HitInfo?] = @ref.Ref(None)
  ignore(
    view(frame, id="bins", on_event=_ => @rabbita.none, hovered=point, tooltip=info => {
      received.val = Some(info)
      @html.b("频数：\{info.value}")
    }),
  )
  let info = received.val.unwrap()
  assert_eq(info.kind, @drawing.HitKind::Histogram2D)
  assert_eq(info.value, 0.0)
  assert_eq(info.cell, Some(@drawing.cell_info(1, 0, (0.0, 1.0), (1.0, 2.0))))
}
