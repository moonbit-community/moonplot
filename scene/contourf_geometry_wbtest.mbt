///|
test "contourf finite representative survives overflowing legacy layer sum without changing returned getters or SVG" {
  let fig = figure(width=400, height=300)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  ax.set_x_limits(0.0, 1.0)
  ax.set_y_limits(0.0, 1.0)
  let result = ax.contourf(
    [[1.0e308, 1.0e308], [1.2e308, 1.2e308]],
    levels=[1.0e308, 1.2e308],
    label="Large",
  )
  assert_true(result.layers()[0].is_inf())
  let frame = fig.to_drawing()
  assert_eq(frame.svg(), fig.to_svg_checked())
  assert_eq(frame.targets().length(), 1)
  assert_eq(frame.targets()[0].info.interval, Some((1.0e308, 1.2e308)))
  assert_eq(frame.targets()[0].info.value, 1.1e308)
  for mode in [@drawing.HitMode::Nearest, XNearest] {
    let info = contourf_pick(frame, 200.0, 150.0, mode).unwrap()
    assert_eq(
      (info.kind, info.series, info.point.point_index),
      (ContourF, "Large", 0),
    )
    assert_true(!info.value.is_inf())
  }
}

///|
test "contourf long generated boundary stores one band region rather than one complete region per edge" {
  let fig = figure(width=400, height=300)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  ax.set_x_limits(-2.0, 2.0)
  ax.set_y_limits(-2.0, 2.0)
  let points = Array::makei(2048, i => {
    let angle = i.to_double() / 2048.0 * 2.0 * @math.PI
    @core.point(@math.cos(angle), @math.sin(angle))
  })
  ax.push_contourf_band(
    [points],
    @core.style("red", width=0.0, fill="red"),
    5,
    -1.0,
    1.0,
    "Long",
  )
  let frame = fig.to_drawing()
  assert_eq(frame.targets().length(), 1)
  guard frame.targets()[0].shape is FilledRegion(region) else { fail("Region") }
  assert_eq(region.rings()[0].length(), 2048)
  for mode in [@drawing.HitMode::Nearest, XNearest] {
    let info = contourf_pick(frame, 200.0, 150.0, mode).unwrap()
    assert_eq(
      (info.kind, info.point.point_index, info.interval),
      (ContourF, 5, Some((-1.0, 1.0))),
    )
  }
  points[0] = @core.point(0.0, 0.0)
  assert_eq(fig.to_drawing().targets().length(), 0)
  assert_true(contourf_pick(frame, 200.0, 150.0, Nearest) is Some(_))
}

///|
test "contourf same colors across calls and panels keep band ownership and physical CSS holes without radius dilation" {
  let fig = figure(width=600, height=300)
  for i in 0..<2 {
    let ax = fig.add_axes(i.to_double() * 0.5, 0.0, 0.5, 1.0)
    ax.set_x_limits(0.0, 2.0)
    ax.set_y_limits(0.0, 2.0)
    ignore(
      ax.contourf(
        [[2.0, 2.0, 2.0], [2.0, 0.0, 2.0], [2.0, 2.0, 2.0]],
        levels=[0.5, 1.5],
        colors=["red"],
        label="P\{i}",
      ),
    )
  }
  let frame = fig.to_drawing()
  assert_eq(frame.targets().length(), 2)
  for mode in [@drawing.HitMode::Nearest, XNearest] {
    for i in 0..<2 {
      let offset = i.to_double() * 300.0
      let x = offset + 225.0
      let info = frame
        .hit_info(
          frame
          .hit_test_client(
            10.0 + x * 2.0,
            20.0 + 150.0 * 2.0,
            10.0,
            20.0,
            1200.0,
            600.0,
            radius=0.0,
            mode~,
          )
          .unwrap(),
        )
        .unwrap()
      assert_eq(
        (info.kind, info.series, info.point.panel_index),
        (ContourF, "P\{i}", i),
      )
      assert_eq(
        frame.hit_test_client(
          10.0 + (offset + 150.0) * 2.0,
          320.0,
          10.0,
          20.0,
          1200.0,
          600.0,
          radius=1000.0,
          mode~,
        ),
        None,
      )
    }
  }
}
