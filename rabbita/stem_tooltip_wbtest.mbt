///|
test "stem default rows use location original head and raw bottom with safe optional metadata" {
  let point = @drawing.hit_point(0, 1, 1, -1.0, 3.0, 80.0, 100.0)
  let info = @drawing.hit_info(
    point,
    Stem,
    value=-1.0,
    band=Some(@drawing.band_info(1.0, -1.0, horizontal=true)),
  )
  assert_eq(tooltip_kind(Stem), "stem")
  assert_eq(tooltip_rows(info), [
    ("Location", "3"),
    ("Value", "-1"),
    ("Bottom", "1"),
  ])
  assert_eq(tooltip_rows(@drawing.hit_info(point, Stem, value=-1.0)), [
    ("Value", "-1"),
  ])
}

///|
test "real stem rod and head custom DOM callbacks share raw datum with real component identities" {
  let fig = @plot.figure(width=400, height=200)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  ax.set_x_limits(-2.0, 8.0)
  ax.set_y_limits(-2.0, 8.0)
  ax.stem(
    [4.0, -1.0, 6.0],
    locs=[1.0, 3.0, 6.0],
    bottom=1.0,
    orientation="horizontal",
  )
  let frame = fig.to_drawing()
  for (x, artist) in [(80.0, 1), (40.0, 4)] {
    let point = frame.hit_test(x, 100.0, radius=0.0).unwrap()
    let received : @ref.Ref[@drawing.HitInfo?] = @ref.Ref(None)
    ignore(
      view(frame, id="stem", hovered=point, on_event=_ => @rabbita.none, tooltip=info => {
        received.val = Some(info)
        @html.b("原始茎叶值")
      }),
    )
    let info = received.val.unwrap()
    assert_eq(info, frame.hit_info(point).unwrap())
    assert_eq(
      (info.kind, info.point.point_index, info.point.artist_index, info.value),
      (Stem, 1, artist, -1.0),
    )
    assert_eq(info.band, Some(@drawing.band_info(1.0, -1.0, horizontal=true)))
  }
}
