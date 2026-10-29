///|
test "default tooltip rows describe actual chart semantics" {
  let point = @drawing.hit_point(0, 1, 2, 3.0, 4.0, 30.0, 40.0)
  assert_eq(tooltip_rows(@drawing.hit_info(point, Line, value=4.0)), [
    ("x", "3"),
    ("y", "4"),
  ])
  assert_eq(
    tooltip_rows(
      @drawing.hit_info(
        point,
        BarH,
        series="收入",
        category=Some("周二"),
        value=-12.0,
      ),
    ),
    [("Category", "周二"), ("Value", "-12")],
  )
  assert_eq(
    tooltip_rows(
      @drawing.hit_info(point, Histogram, value=8.0, interval=Some((1.25, 2.5))),
    ),
    [("Range", "1.25 – 2.5"), ("Count", "8")],
  )
  assert_eq(
    tooltip_rows(
      @drawing.hit_info(
        point,
        Pie,
        category=Some("中文 < & >"),
        value=2.0,
        fraction=Some(1.0 / 3.0),
      ),
    ),
    [("Category", "中文 < & >"), ("Value", "2"), ("Share", "33.33%")],
  )
}

///|
test "custom tooltip receives this frame's metadata and can be suppressed without dispatch" {
  let point = @drawing.hit_point(0, 1, 2, 3.0, 4.0, 30.0, 40.0)
  let info = @drawing.hit_info(
    point,
    Bar,
    series="销售",
    category=Some("上海"),
    value=4.0,
  )
  let drawing = @drawing.drawing(
    100,
    100,
    "<svg viewBox=\"0 0 100 100\"/>",
    [point],
    targets=[
      @drawing.hit_target(
        info,
        Rectangle(20.0, 20.0, 20.0, 40.0),
        (0.0, 0.0, 100.0, 100.0),
      ),
    ],
  )
  let rendered = @ref.Ref(0)
  let received_info : @ref.Ref[@drawing.HitInfo?] = @ref.Ref(None)
  let events = @ref.Ref(0)
  let render = fn(received : @drawing.HitInfo) {
    rendered.val += 1
    received_info.val = Some(received)
    @html.b("\{received.series}: \{received.value} 元")
  }
  ignore(
    view(
      drawing,
      id="custom",
      on_event=_ => {
        events.val += 1
        @tea.none
      },
      hovered=point,
      tooltip=render,
      tooltip_class="business-tooltip",
    ),
  )
  assert_eq(rendered.val, 1)
  assert_eq(received_info.val, Some(info))
  assert_eq(events.val, 0)
  ignore(
    view(
      drawing,
      id="hidden",
      on_event=_ => @tea.none,
      hovered=point,
      tooltip=render,
      tooltip_visible=false,
    ),
  )
  assert_eq(rendered.val, 1)
  ignore(view(drawing, id="empty", on_event=_ => @tea.none, tooltip=render))
  assert_eq(rendered.val, 1)
  let changed_point = @drawing.hit_point(0, 1, 2, 3.0, 5.0, 30.0, 50.0)
  assert_eq(tooltip_info(drawing, changed_point), None)
  ignore(
    view(
      drawing,
      id="stale",
      on_event=_ => @tea.none,
      hovered=changed_point,
      selected=changed_point,
      tooltip=render,
    ),
  )
  assert_eq(rendered.val, 1)
}

///|
test "legacy drawings retain coordinate tooltips without inventing metadata" {
  let point = @drawing.hit_point(0, 0, 0, 1.0, 2.0, 10.0, 20.0)
  let drawing = @drawing.drawing(100, 100, "<svg viewBox=\"0 0 100 100\"/>", [
    point,
  ])
  guard tooltip_info(drawing, point) is Some(info) else {
    fail("Legacy point lost its tooltip")
  }
  assert_eq(info.series, "")
  assert_eq(info.category, None)
  assert_eq(tooltip_rows(info), [("x", "1"), ("y", "2")])
}

///|
test "heatmap tooltip rows and callback carry original cell metadata" {
  let point = @drawing.hit_point(0, 0, 5, 2.0, 1.0, 50.0, 50.0)
  let cell = @drawing.cell_info(1, 2, (1.5, 2.5), (0.5, 1.5))
  let info = @drawing.hit_info(point, Heatmap, value=18.5, cell=Some(cell))
  assert_eq(tooltip_kind(info.kind), "heatmap")
  assert_eq(tooltip_rows(info), [
    ("Row", "1"),
    ("Column", "2"),
    ("Value", "18.5"),
  ])
  let snapshot = @drawing.drawing(
    100,
    100,
    "<svg viewBox=\"0 0 100 100\"/>",
    [point],
    targets=[
      @drawing.hit_target(
        info,
        Rectangle(0.0, 0.0, 100.0, 100.0),
        (0.0, 0.0, 100.0, 100.0),
      ),
    ],
  )
  let received : @ref.Ref[@drawing.CellInfo?] = @ref.Ref(None)
  ignore(
    view(snapshot, id="cell", on_event=_ => @tea.none, hovered=point, tooltip=info => {
      received.val = info.cell
      @html.b("\{info.value} 元")
    }),
  )
  assert_eq(received.val, Some(cell))
}
