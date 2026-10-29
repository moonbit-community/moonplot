///|
test "ContourF default tooltip displays scalar range and representative rather than generated XY anchors" {
  let p = @drawing.hit_point(0, 1, 2, 10.0, 20.0, 30.0, 40.0)
  let info = @drawing.hit_info(
    p,
    ContourF,
    value=1.0,
    interval=Some((0.5, 1.5)),
    series="Band",
  )
  assert_eq(tooltip_kind(ContourF), "contourf")
  assert_eq(tooltip_rows(info), [
    ("Range", "0.5 – 1.5"),
    ("Representative", "1"),
  ])
  assert_eq(tooltip_rows(@drawing.hit_info(p, ContourF, value=1.0)), [
    ("Representative", "1"),
  ])
}

///|
test "ContourF actual fill reaches custom tooltip with exact immutable frame band metadata" {
  let fig = @plot.figure(width=400, height=300)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  ax.set_x_limits(0.0, 1.0)
  ax.set_y_limits(0.0, 1.0)
  ignore(ax.contourf([[0.0, 0.0], [2.0, 2.0]], levels=[0.0, 2.0], label="Band"))
  let frame = fig.to_drawing()
  let point = frame.hit_test(200.0, 150.0, radius=0.0).unwrap()
  let received : @ref.Ref[@drawing.HitInfo?] = @ref.Ref(None)
  ignore(
    view(frame, id="contourf", hovered=point, on_event=_ => @tea.none, tooltip=info => {
      received.val = Some(info)
      @html.b("区间")
    }),
  )
  assert_eq(received.val.unwrap(), frame.hit_info(point).unwrap())
  assert_eq(tooltip_rows(received.val.unwrap()), [
    ("Range", "0 – 2"),
    ("Representative", "1"),
  ])
}
