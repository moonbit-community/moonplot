///|
test "errorbar default tooltip and custom callback expose the current original error ranges" {
  let point = @drawing.hit_point(0, 0, 0, 2.0, 4.0, 50.0, 50.0)
  let error = @drawing.error_info((1.0, 3.0), (2.0, 6.0))
  let info = @drawing.hit_info(
    point,
    ErrorBar,
    value=4.0,
    series="测量",
    error=Some(error),
  )
  assert_eq(tooltip_kind(info.kind), "errorbar")
  assert_eq(tooltip_rows(info), [
    ("x", "2"),
    ("y", "4"),
    ("x range", "1 – 3"),
    ("y range", "2 – 6"),
  ])
  let make_frame = fn(error : @drawing.ErrorInfo) {
    let info = @drawing.hit_info(
      point,
      ErrorBar,
      value=4.0,
      series="测量",
      error=Some(error),
    )
    @drawing.drawing(100, 100, "<svg viewBox=\"0 0 100 100\"/>", [point], targets=[
      @drawing.hit_target(info, Point, (0.0, 0.0, 100.0, 100.0)),
      @drawing.hit_target(
        info,
        Segment(50.0, 20.0, 50.0, 80.0),
        (0.0, 0.0, 100.0, 100.0),
      ),
    ])
  }
  let old = make_frame(error)
  let current_error = @drawing.error_info((1.0, 3.0), (1.0, 7.0))
  let current = make_frame(current_error)
  let received : @ref.Ref[@drawing.ErrorInfo?] = @ref.Ref(None)
  let rendered = @ref.Ref(0)
  let render = fn(info : @drawing.HitInfo) {
    rendered.val += 1
    received.val = info.error
    @html.b("\{info.series}: \{info.point.data_x}, \{info.point.data_y}")
  }
  ignore(
    view(
      current,
      id="error-current",
      on_event=_ => @rabbita.none,
      hovered=point,
      tooltip=render,
    ),
  )
  assert_eq(received.val, Some(current_error))
  assert_eq(old.hit_info(point).unwrap().error, Some(error))
  ignore(
    view(
      current,
      id="error-hidden",
      on_event=_ => @rabbita.none,
      hovered=point,
      tooltip=render,
      tooltip_visible=false,
    ),
  )
  assert_eq(rendered.val, 1)
  let stale = @drawing.hit_point(0, 0, 0, 2.0, 5.0, 50.0, 50.0)
  ignore(
    view(
      current,
      id="error-stale",
      on_event=_ => @rabbita.none,
      hovered=stale,
      tooltip=render,
    ),
  )
  assert_eq(rendered.val, 1)
}

///|
test "real errorbar drawing can render public Rabbita nodes and typed metadata without DOM access" {
  let fig = @plot.figure(width=400, height=200)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  ax.set_x_limits(0.0, 4.0)
  ax.set_y_limits(0.0, 10.0)
  ax.errorbar([1.0], [4.0], xerr=[0.5], yerr=[2.0], label="读数")
  ax.legend([])
  let frame = fig.to_drawing()
  let point = frame.hit_test(97.0, 160.0, radius=0.0).unwrap()
  assert_eq(frame.hit_info(point).unwrap().kind, @drawing.HitKind::ErrorBar)
  let received : @ref.Ref[@drawing.HitInfo?] = @ref.Ref(None)
  ignore(
    view(frame, id="actual-error", on_event=_ => @rabbita.none, hovered=point, tooltip=info => {
      received.val = Some(info)
      @html.span("自定义误差范围")
    }),
  )
  let actual = received.val.unwrap()
  assert_eq(actual.error, Some(@drawing.error_info((0.5, 1.5), (2.0, 6.0))))
  assert_eq(actual.series, "读数")
  assert_eq((actual.point.data_x, actual.point.data_y), (1.0, 4.0))
}
