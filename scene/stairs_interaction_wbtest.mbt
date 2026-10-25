///|
fn stairs_interaction_fixture(
  horizontal : Bool,
  fill : Bool,
  descending~ : Bool = false,
) -> (Figure, Axes) raise {
  let fig = figure(width=400, height=200)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  ax.set_x_limits(-3.0, 5.0)
  ax.set_y_limits(-3.0, 5.0)
  ax.legend([])
  ax.stairs(
    [3.0, -2.0],
    edges=if descending { [4.0, 1.0, 0.0] } else { [0.0, 1.0, 4.0] },
    orientation=if horizontal { "horizontal" } else { "vertical" },
    baseline=1.0,
    fill~,
    label="intervals",
  )
  (fig, ax)
}

///|
fn stairs_at(
  frame : @drawing.Drawing,
  x : Double,
  y : Double,
) -> @drawing.HitInfo raise {
  step_selected(frame, (x + 3.0) * 50.0, (5.0 - y) * 25.0)
}

///|
test "stairs outline horizontal and vertical plateau and riser keep source interval and value" {
  for horizontal in [false, true] {
    let (fig, _) = stairs_interaction_fixture(horizontal, false)
    let frame = fig.to_drawing()
    assert_eq(frame.svg(), fig.to_svg_checked())
    for
      (primary, value, i, interval) in [
        (0.5, 3.0, 0, (0.0, 1.0)),
        (2.5, -2.0, 1, (1.0, 4.0)),
        (1.0, 0.5, 1, (1.0, 4.0)),
      ] {
      let info = if horizontal {
        stairs_at(frame, value, primary)
      } else {
        stairs_at(frame, primary, value)
      }
      assert_eq(
        (info.kind, info.point.point_index, info.interval),
        (Stairs, i, Some(interval)),
      )
      assert_eq(info.value, if i == 0 { 3.0 } else { -2.0 })
      assert_eq(info.series, "intervals")
      assert_eq(info.band, None)
      assert_eq(
        (info.point.data_x, info.point.data_y),
        if horizontal {
          (info.value, interval.0)
        } else {
          (interval.0, info.value)
        },
      )
    }
  }
}

///|
test "stairs filled intervals use real strips not whole polygon bounding boxes" {
  for horizontal in [false, true] {
    let (fig, _) = stairs_interaction_fixture(horizontal, true)
    let frame = fig.to_drawing()
    assert_eq(frame.svg(), fig.to_svg_checked())
    assert_eq(frame.targets().length(), 2)
    for
      (primary, value, i, original) in [
        (0.5, 2.0, 0, 3.0),
        (2.5, -0.5, 1, -2.0),
      ] {
      let info = if horizontal {
        stairs_at(frame, value, primary)
      } else {
        stairs_at(frame, primary, value)
      }
      assert_eq(
        (info.kind, info.point.point_index, info.value),
        (Stairs, i, original),
      )
      assert_eq(info.band, Some(@drawing.band_info(1.0, original, horizontal~)))
    }
    let (x, y) = if horizontal { (-1.0, 0.5) } else { (0.5, -1.0) }
    assert_eq(
      frame.hit_test((x + 3.0) * 50.0, (5.0 - y) * 25.0, radius=100.0),
      None,
    )
    assert_eq(stairs_at(frame, 1.0, 1.0).point.point_index, 1)
  }
}

///|
test "stairs original copies default edges zero area and descending intervals retain raw identity" {
  for horizontal in [false, true] {
    for fill in [false, true] {
      let (fig, _) = stairs_interaction_fixture(
        horizontal,
        fill,
        descending=true,
      )
      let frame = fig.to_drawing()
      let (primary, value) = if fill { (2.5, 2.0) } else { (2.5, 3.0) }
      let info = if horizontal {
        stairs_at(frame, value, primary)
      } else {
        stairs_at(frame, primary, value)
      }
      assert_eq(
        (info.point.point_index, info.value, info.interval),
        (0, 3.0, Some((4.0, 1.0))),
      )
    }
  }
  let fig = figure()
  let values = [1.0, 2.0]
  fig.stairs(values, fill=true, baseline=1.0)
  values[1] = 99.0
  let frame = fig.to_drawing()
  assert_eq(frame.targets().length(), 1)
  assert_eq(
    (
      frame.targets()[0].info.point.point_index,
      frame.targets()[0].info.value,
      frame.targets()[0].info.interval,
    ),
    (1, 2.0, Some((1.0, 2.0))),
  )
}

///|
test "stairs missing values split outline runs but altered filtered faces remain static" {
  for fill in [false, true] {
    let fig = figure()
    fig.stairs([3.0, 0.0 / 0.0, -2.0], edges=[0.0, 1.0, 2.0, 4.0], fill~)
    let frame = fig.to_drawing()
    assert_eq(frame.svg(), fig.to_svg_checked())
    if fill {
      assert_eq(frame.targets().length(), 0)
    } else {
      assert_true(!frame.targets().is_empty())
      assert_true(
        frame
        .targets()
        .all(t => t.info.kind == Stairs && t.info.point.point_index != 1),
      )
      assert_true(frame.targets().any(t => t.info.point.point_index == 2))
    }
  }
  for edges in [[0.0, 2.0, 1.0], [0.0, 1.0, 1.0], [0.0, 1.0, 1.0 / 0.0]] {
    let fig = figure()
    fig.stairs([3.0, -2.0], edges~, fill=true)
    let frame = fig.to_drawing()
    assert_eq(frame.targets().length(), 0)
    assert_eq(frame.svg(), fig.to_svg_checked())
  }
}

///|
test "stairs nonlinear full polygon validation rejects deleted domain endpoints without inventing baseline" {
  for baseline in [0.0, 1.0] {
    let fig = figure(width=400, height=200)
    let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
    ax.set_x_scale(@scale.log_scale())
    ax.set_y_scale(@scale.log_scale())
    ax.set_x_limits(1.0, 4.0)
    ax.set_y_limits(1.0, 10.0)
    ax.stairs([3.0, 9.0], edges=[1.0, 2.0, 4.0], fill=true, baseline~)
    let frame = fig.to_drawing()
    assert_eq(frame.svg(), fig.to_svg_checked())
    assert_eq(frame.targets().length(), if baseline == 0.0 { 0 } else { 2 })
  }
}

///|
test "stairs shared provider guard and immutable frames survive line mutation and clipping" {
  let (fig, ax) = stairs_interaction_fixture(true, false)
  let old = fig.to_drawing()
  let retained = fig.to_render_figure(capture_points=true)
  let line = ax.state.val.line_originals[0]
  line.set_data(Numeric([0.0, 1.0]), Numeric([2.0, 3.0]))
  let (updated, _) = @svg.render_drawing_with_positions_checked(retained)
  assert_true(updated.targets().all(t => t.info.kind == Line))
  assert_eq(stairs_at(old, 3.0, 0.5).kind, Stairs)
  let (filled, ax) = stairs_interaction_fixture(false, true)
  ax.set_x_limits(0.25, 0.75)
  ax.set_y_limits(1.5, 2.5)
  let clipped = filled.to_drawing()
  let info = step_selected(clipped, 200.0, 100.0)
  assert_eq(
    (info.point.point_index, info.value, info.interval),
    (0, 3.0, Some((0.0, 1.0))),
  )
}

///|
test "stairs transparent faces and repeated zero length source intervals do not create hits" {
  for color in ["none", "transparent", "#00000000", "rgba(0,0,0,0)"] {
    let fig = figure()
    fig.stairs([2.0, 3.0], fill=true, color~)
    assert_eq(fig.to_drawing().targets().length(), 0)
  }
  let fig = figure()
  fig.stairs([], fill=true)
  assert_eq(fig.to_drawing().targets().length(), 0)
}
