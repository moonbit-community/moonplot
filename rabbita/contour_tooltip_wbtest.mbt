///|
test "Contour default tooltip says scalar Level rather than treating generated geometry as observations" {
  let point = @drawing.hit_point(0, 1, 2, 10.0, 2.0, 100.0, 100.0)
  let info = @drawing.hit_info(point, Contour, value=0.25, series="Field")
  assert_eq(tooltip_kind(Contour), "contour")
  assert_eq(tooltip_rows(info), [("Level", "0.25")])
}

///|
test "Contour actual inline line hit reaches custom tooltip with exact frame metadata" {
  let fig = @plot.figure(width=400, height=300)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  ax.set_x_limits(0.0, 2.0)
  ax.set_y_limits(0.0, 2.0)
  let contours = ax.contour(
    [[0.0, 1.0], [1.0, 2.0]],
    levels=[0.5],
    label="Field",
  )
  ax.clabel(contours)
  let frame = fig.to_drawing()
  for target in frame.targets() {
    let p = target.info.point
    let point = frame.hit_test(p.screen_x, p.screen_y, radius=1.0e-7).unwrap()
    let received : @ref.Ref[@drawing.HitInfo?] = @ref.Ref(None)
    ignore(
      view(frame, id="contour", hovered=point, on_event=_ => @tea.none, tooltip=info => {
        received.val = Some(info)
        @html.b("等值线级别")
      }),
    )
    let info = received.val.unwrap()
    assert_eq(info, frame.hit_info(point).unwrap())
    assert_eq(
      (info.kind, info.series, info.value, info.point.point_index),
      (Contour, "Field", 0.5, 0),
    )
    assert_eq(tooltip_rows(info), [("Level", "0.5")])
  }
}
