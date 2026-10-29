///|
test "area tooltip uses actual sample bounds orientation and original stacked value" {
  let point = @drawing.hit_point(0, 1, 2, 3.0, 8.0, 30.0, 40.0)
  let vertical = @drawing.hit_info(
    point,
    Area,
    value=8.0,
    band=Some(@drawing.band_info(2.0, 8.0)),
  )
  assert_eq(tooltip_kind(vertical.kind), "area")
  assert_eq(tooltip_rows(@drawing.hit_info(point, Area, value=8.0)), [
    ("Value", "8"),
  ])
  assert_eq(tooltip_rows(vertical), [("x", "3"), ("Lower", "2"), ("Upper", "8")])
  let horizontal = @drawing.hit_info(
    point,
    Area,
    value=2.0,
    band=Some(@drawing.band_info(7.0, 2.0, horizontal=true)),
  )
  assert_eq(tooltip_rows(horizontal), [
    ("y", "8"),
    ("Lower", "7"),
    ("Upper", "2"),
  ])
  let stacked = @drawing.hit_info(
    point,
    Area,
    value=0.1,
    band=Some(@drawing.band_info(1000000.0, 1000000.1, stacked=true)),
  )
  assert_eq(tooltip_rows(stacked), [
    ("x", "3"),
    ("Lower", "1000000"),
    ("Upper", "1000000.1"),
    ("Value", "0.1"),
  ])
}

///|
test "area custom tooltip receives typed immutable band from the current frame" {
  let point = @drawing.hit_point(0, 1, 2, 3.0, 8.0, 30.0, 40.0)
  let band = @drawing.band_info(2.0, 8.0, stacked=true)
  let info = @drawing.hit_info(
    point,
    Area,
    value=6.0,
    series="中文置信带",
    band=Some(band),
  )
  let snapshot = @drawing.drawing(
    100,
    100,
    "<svg viewBox=\"0 0 100 100\"/>",
    [point],
    targets=[
      @drawing.hit_target(
        info,
        Quadrilateral(10.0, 10.0, 90.0, 10.0, 90.0, 90.0, 10.0, 90.0),
        (0.0, 0.0, 100.0, 100.0),
      ),
    ],
  )
  let received : @ref.Ref[@drawing.HitInfo?] = @ref.Ref(None)
  ignore(
    view(snapshot, id="band", on_event=_ => @tea.none, hovered=point, tooltip=metadata => {
      received.val = Some(metadata)
      @html.b("\{metadata.series}：\{metadata.value} 元")
    }),
  )
  assert_eq(received.val, Some(info))
  assert_eq(received.val.unwrap().band, Some(band))
  let selected = snapshot
    .hit_test_client(25.0, 25.0, 0.0, 0.0, 50.0, 50.0, radius=0.0)
    .unwrap()
  assert_eq(tooltip_info(snapshot, selected).unwrap().band, Some(band))
}
