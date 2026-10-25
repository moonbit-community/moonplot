///|
test "Streamplot tooltip names generated U V and optional raw Color value with safe missing metadata fallback" {
  let point = @drawing.hit_point(0, 1, 2, 10.0, 20.0, 30.0, 40.0)
  assert_eq(tooltip_kind(Streamplot), "streamplot")
  for color in [None, Some(17.5)] {
    let info = @drawing.hit_info(
      point,
      Streamplot,
      value=-2.0,
      streamplot=Some(@drawing.streamplot_info(3, 1.5, -2.0, color_value=color)),
    )
    let expected = [("U", "1.5"), ("V", "-2")]
    if color is Some(_) {
      expected.push(("Color value", "17.5"))
    }
    assert_eq(tooltip_rows(info), expected)
  }
  assert_eq(tooltip_rows(@drawing.hit_info(point, Streamplot, value=-2.0)), [
    ("Value", "-2"),
  ])
}

///|
test "Streamplot real body custom tooltip receives the exact generated edge record from the Drawing" {
  let fig = @plot.figure(width=400, height=300)
  ignore(
    fig.streamplot(
      [0.0, 1.0],
      [0.0, 1.0],
      [[1.0, 1.0], [1.0, 1.0]],
      [[0.0, 0.0], [0.0, 0.0]],
      density=0.2,
      max_steps=4,
      minlength=0.0,
      maxlength=1.0,
      start_points=[@plot.point(0.25, 0.5)],
      integration_direction="forward",
      broken_streamlines=false,
      arrows=false,
      label="Generated",
    ),
  )
  let frame = fig.to_drawing()
  let info = frame.targets()[0].info
  let p = frame
    .hit_test(info.point.screen_x, info.point.screen_y, radius=0.0)
    .unwrap()
  let received : @ref.Ref[@drawing.HitInfo?] = @ref.Ref(None)
  ignore(
    view(frame, id="streamplot", hovered=p, on_event=_ => @rabbita.none, tooltip=actual => {
      received.val = Some(actual)
      @html.b("生成流线场值")
    }),
  )
  assert_eq(received.val, frame.hit_info(p))
  assert_eq(received.val.unwrap().value, 0.0)
  assert_eq(tooltip_rows(received.val.unwrap()), [("U", "1"), ("V", "0")])
}
