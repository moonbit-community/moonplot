///|
test "Tripcolor default tooltip distinguishes supplied value and vertex mean and safely handles missing typed record" {
  let p = @drawing.hit_point(0, 1, 2, 10.0, 20.0, 30.0, 40.0)
  assert_eq(tooltip_kind(Tripcolor), "tripcolor")
  for mean in [false, true] {
    let info = @drawing.hit_info(
      p,
      Tripcolor,
      value=7.0,
      tricolor=Some(@drawing.tricolor_info((2, 0, 1), vertex_mean=mean)),
    )
    assert_eq(tooltip_rows(info), [
      (if mean { "Vertex mean" } else { "Value" }, "7"),
    ])
  }
  assert_eq(tooltip_rows(@drawing.hit_info(p, Tripcolor, value=7.0)), [
    ("Value", "7"),
  ])
}

///|
test "Tripcolor actual region callback carries frame value and ordered vertices to a custom tooltip" {
  let fig = @plot.figure(width=400, height=300)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  ax.set_x_limits(0.0, 1.0)
  ax.set_y_limits(0.0, 1.0)
  ax.tripcolor(
    [0.0, 1.0, 0.0],
    [0.0, 0.0, 1.0],
    [[0, 1, 2]],
    [1.0, 4.0, 7.0],
    label="均值",
  )
  let frame = fig.to_drawing()
  let p = frame.hit_test(80.0, 240.0, radius=0.0).unwrap()
  let received : @ref.Ref[@drawing.HitInfo?] = @ref.Ref(None)
  ignore(
    view(frame, id="tripcolor", hovered=p, on_event=_ => @tea.none, tooltip=info => {
      received.val = Some(info)
      @html.b("顶点均值")
    }),
  )
  assert_eq(received.val, frame.hit_info(p))
  assert_eq(received.val.unwrap().value, 4.0)
  assert_eq(received.val.unwrap().tricolor.unwrap().vertices, (0, 1, 2))
  assert_eq(tooltip_rows(received.val.unwrap()), [("Vertex mean", "4")])
}
