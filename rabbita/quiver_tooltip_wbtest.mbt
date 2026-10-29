///|
test "quiver default tooltip displays original position and components without inventing magnitude" {
  let point = @drawing.hit_point(0, 2, 4, -3.0, 6.0, 80.0, 100.0)
  let info = @drawing.hit_info(
    point,
    Quiver,
    value=-2.0,
    vector=Some(@drawing.vector_info(4.0, -2.0)),
  )
  assert_eq(tooltip_kind(Quiver), "quiver")
  assert_eq(tooltip_rows(info), [
    ("X", "-3"),
    ("Y", "6"),
    ("U", "4"),
    ("V", "-2"),
  ])
  assert_eq(tooltip_rows(@drawing.hit_info(point, Quiver, value=-2.0)), [
    ("X", "-3"),
    ("Y", "6"),
  ])
}

///|
test "actual quiver shaft and both wing callbacks receive the same original immutable vector" {
  let fig = @plot.figure(width=400, height=200)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  ax.set_x_limits(0.0, 5.0)
  ax.set_y_limits(0.0, 5.0)
  ax.quiver([1.0], [1.0], [2.0], [1.0], label="velocity")
  let frame = fig.to_drawing()
  assert_eq(frame.targets().length(), 3)
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
      view(frame, id="quiver", hovered=point, on_event=_ => @tea.none, tooltip=info => {
        received.val = Some(info)
        @html.b("原始向量")
      }),
    )
    let info = received.val.unwrap()
    assert_eq(info, frame.hit_info(point).unwrap())
    assert_eq(
      (
        info.kind,
        info.point.artist_index,
        info.point.point_index,
        info.point.data_x,
        info.point.data_y,
        info.value,
        info.series,
      ),
      (Quiver, 0, 0, 1.0, 1.0, 1.0, "velocity"),
    )
    assert_eq(info.vector, Some(@drawing.vector_info(2.0, 1.0)))
  }
}
