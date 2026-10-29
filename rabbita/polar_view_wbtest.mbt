///|
test "Polar held state requires the current frame circle before tooltip presentation" {
  let figure = @plot.figure(width=460, height=320)
  figure.axes().set_axis_off()
  let panel = figure.add_polar_axes(0.08, 0.1, 0.84, 0.78)
  panel.set_radius_max(1.0)
  panel.scatter([21.991148575128552], [0.0], label="Center")
  let current = figure.to_drawing()
  let point = current.points()[0]
  assert_true(frame_point_presentable(current, point))
  let calls = @ref.Ref(0)
  let received : @ref.Ref[@drawing.HitInfo?] = @ref.Ref(None)
  ignore(
    view(
      current,
      id="polar-current",
      hovered=point,
      selected=point,
      on_event=_ => @tea.none,
      tooltip=info => {
        calls.val += 1
        received.val = Some(info)
        @html.b("Center")
      },
    ),
  )
  assert_eq(calls.val, 1)
  assert_true(received.val.unwrap().kind is Polar)
  assert_eq(received.val.unwrap().point.data_x, 21.991148575128552)
  // A public caller can copy actual SVG/targets while omitting their circle
  // proof. Such held Polar state must not be presented as a valid tooltip.
  let unproven = @drawing.drawing(
    current.width(),
    current.height(),
    current.svg(),
    current.points(),
    targets=current.targets(),
  )
  assert_true(!frame_point_presentable(unproven, point))
  ignore(
    view(
      unproven,
      id="polar-unproven",
      hovered=point,
      selected=point,
      on_event=_ => @tea.none,
      tooltip=_ => {
        calls.val += 1
        @html.b("must not render")
      },
    ),
  )
  assert_eq(calls.val, 1)
}

///|
test "Ordinary held state in a mixed drawing does not require another panel circle" {
  let figure = @plot.figure(width=460, height=320)
  figure.plot([0.0, 1.0], [0.0, 1.0], label="Cartesian")
  let polar = figure.add_polar_axes(0.6, 0.2, 0.3, 0.6)
  polar.set_radius_max(1.0)
  polar.scatter([0.0], [0.5], label="Polar")
  let current = figure.to_drawing()
  let ordinary = current.targets().filter(target => target.info.kind is Line)[0].info.point
  let unproven = @drawing.drawing(
    current.width(),
    current.height(),
    current.svg(),
    current.points(),
    targets=current.targets(),
  )
  assert_true(frame_point_presentable(unproven, ordinary))
  let calls = @ref.Ref(0)
  let received : @ref.Ref[@drawing.HitInfo?] = @ref.Ref(None)
  ignore(
    view(
      unproven,
      id="普通 \" 🐇",
      hovered=ordinary,
      selected=ordinary,
      on_event=_ => @tea.none,
      tooltip=info => {
        calls.val += 1
        received.val = Some(info)
        @html.b("Cartesian")
      },
    ),
  )
  assert_eq(calls.val, 1)
  assert_true(received.val.unwrap().kind is Line)
  assert_eq(received.val.unwrap().series, "Cartesian")
}
