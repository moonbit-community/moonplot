///|
test "hexbin tooltips distinguish count and reduced scalar while keeping raw center coordinates" {
  let point = @drawing.hit_point(0, 1, 0, 1.0, 1.5, 100.0, 125.0)
  let info = @drawing.hit_info(
    point,
    Hexbin,
    value=3.0,
    hexbin=Some(@drawing.hexbin_info(0, 0, 3)),
  )
  assert_eq(tooltip_kind(info.kind), "hexbin")
  assert_eq(tooltip_rows(info), [("x", "1"), ("y", "1.5"), ("Count", "3")])
  let reduced = @drawing.hit_info(
    point,
    Hexbin,
    value=18.0,
    hexbin=Some(@drawing.hexbin_info(0, 0, 3, reduction=Custom)),
  )
  assert_eq(tooltip_rows(reduced), [
    ("x", "1"),
    ("y", "1.5"),
    ("Count", "3"),
    ("Value", "18"),
  ])
  assert_eq(tooltip_rows(@drawing.hit_info(point, Hexbin, value=8.0)), [
    ("x", "1"),
    ("y", "1.5"),
    ("Value", "8"),
  ])
}

///|
test "real hexbin drawing delivers immutable stored raw reduction count and identity to custom DOM tooltips" {
  let fig = @plot.figure(width=400, height=200)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  ax.set_x_limits(0.0, 4.0)
  ax.set_y_limits(0.0, 4.0)
  ax.legend([])
  ignore(
    ax.hexbin(
      [0.8, 0.8, 0.8],
      [1.6, 1.6, 1.6],
      values=[1.0, 3.0, 5.0],
      gridsize=2,
      extent=[0.0, 4.0, 0.0, 4.0],
      reduce="sum",
      bins="log",
      label="Totals",
    ),
  )
  let frame = fig.to_drawing()
  // A point in the second half away from the center still selects this bin.
  let point = frame.hit_test(120.0, 120.0, radius=0.0).unwrap()
  let received : @ref.Ref[@drawing.HitInfo?] = @ref.Ref(None)
  ignore(
    view(frame, id="hexagons", on_event=_ => @tea.none, hovered=point, tooltip=info => {
      received.val = Some(info)
      @html.b("总值：\{info.value}")
    }),
  )
  let info = received.val.unwrap()
  assert_eq(info.kind, @drawing.HitKind::Hexbin)
  assert_eq((info.point.data_x, info.point.data_y), (1.0, 2.0))
  assert_eq((info.value, info.series), (9.0, "Totals"))
  assert_eq(info.hexbin, Some(@drawing.hexbin_info(1, 0, 3, reduction=Sum)))
}
