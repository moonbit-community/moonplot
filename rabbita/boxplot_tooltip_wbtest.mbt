///|
test "boxplot default tooltip shows group summary and typed outlier without recomputing statistics" {
  let point = @drawing.hit_point(0, 0, 1, 2.0, 20.0, 50.0, 50.0)
  let box = @drawing.box_info(
    1,
    q1=2.25,
    median=3.5,
    q3=4.75,
    lower_whisker=1.0,
    upper_whisker=5.0,
    part=Outlier(20.0),
  )
  let info = @drawing.hit_info(point, BoxPlot, value=20.0, box=Some(box))
  assert_eq(tooltip_kind(info.kind), "boxplot")
  assert_eq(tooltip_rows(info), [
    ("Group", "2"),
    ("Median", "3.5"),
    ("Q1", "2.25"),
    ("Q3", "4.75"),
    ("Whiskers", "1 – 5"),
    ("Outlier", "20"),
  ])
  let constant = @drawing.box_info(
    0,
    q1=3.0,
    median=3.0,
    q3=3.0,
    lower_whisker=3.0,
    upper_whisker=3.0,
  )
  assert_eq(
    tooltip_rows(
      @drawing.hit_info(point, BoxPlot, value=3.0, box=Some(constant)),
    ),
    [
      ("Group", "1"),
      ("Median", "3"),
      ("Q1", "3"),
      ("Q3", "3"),
      ("Whiskers", "3 – 3"),
    ],
  )
}

///|
test "boxplot custom tooltip reads immutable current-frame metadata and suppresses hidden or stale callbacks" {
  let fig = @plot.figure(width=400, height=200)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  ax.set_x_limits(0.0, 2.0)
  ax.set_y_limits(0.0, 25.0)
  ignore(ax.boxplot([[1.0, 2.0, 3.0, 4.0, 5.0, 20.0]], label="Latency"))
  ax.legend([])
  let old = fig.to_drawing()
  let outlier = old.hit_test(200.0, 40.0, radius=0.0).unwrap()
  let received : @ref.Ref[@drawing.BoxInfo?] = @ref.Ref(None)
  let calls = @ref.Ref(0)
  let render = fn(info : @drawing.HitInfo) {
    calls.val += 1
    received.val = info.box
    @html.b("中位数：" + info.box.unwrap().median.to_string() + " ms")
  }
  ignore(
    view(
      old,
      id="box-old",
      on_event=_ => @rabbita.none,
      hovered=outlier,
      tooltip=render,
    ),
  )
  assert_eq(received.val.unwrap().part, @drawing.BoxPart::Outlier(20.0))
  assert_eq(received.val.unwrap().median, 3.5)
  ax.clear()
  ignore(ax.boxplot([[10.0, 10.0, 10.0]], label="Updated"))
  let current = fig.to_drawing()
  ignore(
    view(
      current,
      id="box-stale",
      on_event=_ => @rabbita.none,
      hovered=outlier,
      tooltip=render,
    ),
  )
  assert_eq(calls.val, 1)
  let point = current.points()[0]
  ignore(
    view(
      current,
      id="box-hidden",
      on_event=_ => @rabbita.none,
      hovered=point,
      tooltip=render,
      tooltip_visible=false,
    ),
  )
  assert_eq(calls.val, 1)
  ignore(
    view(
      current,
      id="box-current",
      on_event=_ => @rabbita.none,
      hovered=point,
      tooltip=render,
    ),
  )
  assert_eq(calls.val, 2)
  assert_eq(received.val.unwrap().median, 10.0)
  assert_eq(old.hit_info(outlier).unwrap().box.unwrap().median, 3.5)
}
