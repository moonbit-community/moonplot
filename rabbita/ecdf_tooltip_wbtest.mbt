///|
test "ECDF default rows show actual probability and safely omit missing optional fields" {
  let point = @drawing.hit_point(0, 0, 1, 0.25, 3.0, 100.0, 80.0)
  let info = @drawing.hit_info(
    point,
    Ecdf,
    value=3.0,
    fraction=Some(0.25),
    band=Some(@drawing.band_info(0.625, 0.25, horizontal=true)),
  )
  assert_eq(tooltip_rows(info), [("Value", "3"), ("Probability", "0.25")])
  assert_eq(tooltip_rows(@drawing.hit_info(point, Ecdf, value=3.0)), [
    ("Value", "3"),
  ])
}

///|
test "real ECDF jump and duplicate endpoints pass returned probability to custom DOM callbacks" {
  let fig = @plot.figure(width=400, height=200)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  ax.set_x_limits(0.0, 1.0)
  ax.set_y_limits(0.0, 5.0)
  ax.legend([])
  let result = ax.ecdf(
    [4.0, 1.0, 1.0, 3.0],
    weights=[2.0, 1.0, 2.0, 3.0],
    complementary=true,
    horizontal=true,
  )
  for (x, y, slot) in [(175.0, 80.0, 2), (250.0, 160.0, 1)] {
    let frame = fig.to_drawing()
    let point = frame.hit_test(x, y, radius=0.0).unwrap()
    let received : @ref.Ref[@drawing.HitInfo?] = @ref.Ref(None)
    ignore(
      view(frame, id="ecdf", hovered=point, on_event=_ => @tea.none, tooltip=info => {
        received.val = Some(info)
        @html.b("返回的累计概率")
      }),
    )
    let info = received.val.unwrap()
    assert_eq(info, frame.hit_info(point).unwrap())
    assert_eq(
      (info.kind, info.point.point_index, info.value, info.fraction),
      (Ecdf, slot, result.values()[slot], Some(result.probabilities()[slot])),
    )
    assert_true(info.band.unwrap().lower >= info.band.unwrap().upper)
  }
}
