///|
test "polar bars default to original radians and radius without Cartesian or pie rows" {
  let point = @drawing.hit_point(0, 0, 2, 7.0, 2.0, 50.0, 50.0)
  let info = @drawing.hit_info(point, PolarBar, value=2.0, series="Rose")
  assert_eq(tooltip_kind(info.kind), "polar-bar")
  assert_eq(tooltip_rows(info), [("Theta (rad)", "7"), ("Radius", "2")])
}

///|
test "polar bar held state fails closed without its actual frame circle" {
  let figure = @plot.figure(width=400, height=240)
  let polar = figure.add_polar_axes(0.12, 0.18, 0.76, 0.64)
  polar.legend([])
  polar.bar([0.0], [2.0], width=0.5)
  let frame = figure.to_drawing()
  let point = frame.targets()[0].info.point
  assert_true(frame_point_presentable(frame, point))
  let unproven = @drawing.drawing(
    frame.width(),
    frame.height(),
    frame.svg(),
    frame.points(),
    targets=frame.targets(),
  )
  assert_true(!frame_point_presentable(unproven, point))
  let calls = @ref.Ref(0)
  ignore(
    view(
      unproven,
      id="unproven-bars",
      hovered=point,
      selected=point,
      on_event=_ => @rabbita.none,
      tooltip=_ => {
        calls.val += 1
        @html.b("must not present stale polar bar values")
      },
    ),
  )
  assert_eq(calls.val, 0)
}
