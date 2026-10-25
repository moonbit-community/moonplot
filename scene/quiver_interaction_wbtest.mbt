///|
fn quiver_pick(
  frame : @drawing.Drawing,
  x : Double,
  y : Double,
  mode~ : @drawing.HitMode = Nearest,
) -> @drawing.HitInfo {
  frame.hit_info(frame.hit_test(x, y, radius=1.0e-7, mode~).unwrap()).unwrap()
}

///|
test "quiver actual shaft and both wings retain original tail vector and zero domain overflow index holes" {
  let expected_counts = [9, 9, 3, 1, 1, 3]
  for case in 0..<6 {
    let fig = quiver_control_figure(case)
    let frame = fig.to_drawing()
    assert_eq(frame.svg(), fig.to_svg_checked())
    assert_eq(frame.targets().length(), expected_counts[case])
    assert_eq(fig.artists().length(), 1)
    assert_true(fig.containers()[0].kind() is Quiver)
    assert_eq(fig.containers()[0].artists().length(), 1)
    let expected = if case < 2 {
      [
        (-2.0, 0.0, 3.0, 2.0),
        (1.0, -1.0, -2.0, 1.0),
        (3.0, 2.0, 0.0, 0.0),
        (4.0, 3.0, -1.0, -2.0),
      ]
    } else if case == 2 {
      [(1.0, 1.0, 3.0, 8.0), (10.0, 10.0, -11.0, 0.0), (50.0, 10.0, 0.0, 0.0)]
    } else if case == 3 {
      [(-2.0, 0.0, 4.0, 0.0)]
    } else if case == 4 {
      [(4.01, 2.0, 0.0, 0.5)]
    } else {
      [(1.0e308, 0.0, 1.0e308, 0.0), (0.0, 0.0, 1.0, 1.0)]
    }
    if case < 2 {
      assert_eq(frame.targets().map(t => t.info.point.point_index), [
        0, 0, 0, 1, 1, 1, 3, 3, 3,
      ])
    }
    for target in frame.targets() {
      assert_true(target.shape is Segment(_, _, _, _))
      for mode in [@drawing.HitMode::Nearest, XNearest] {
        let info = quiver_pick(
          frame,
          target.info.point.screen_x,
          target.info.point.screen_y,
          mode~,
        )
        let i = info.point.point_index
        let (x, y, u, v) = expected[i]
        assert_eq(
          (
            info.kind,
            info.point.artist_index,
            info.point.data_x,
            info.point.data_y,
            info.value,
          ),
          (Quiver, 0, x, y, v),
        )
        assert_eq(info.vector, Some(@drawing.vector_info(u, v)))
        assert_eq(info.band, None)
        assert_eq(info.interval, None)
        if case < 2 {
          assert_eq(info.series, "vectors")
        }
      }
    }
    if case == 5 {
      assert_eq(frame.targets()[0].info.point.point_index, 1)
    }
  }
}

///|
test "quiver finite large SymLog components remain interactive when vector norm would overflow" {
  let fig = figure(width=400, height=200)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  ax.set_x_scale(@scale.symlog_scale())
  ax.set_y_scale(@scale.symlog_scale())
  ax.set_x_limits(-1.0e308, 1.0e308)
  ax.set_y_limits(-1.0e308, 1.0e308)
  for axis in [ax.x_axis(), ax.y_axis()] {
    axis.set_locator(@ticker.NullLocator::new().as_locator())
    axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  }
  ax.quiver([-8.0e307], [-8.0e307], [1.7e308], [1.7e308])
  let frame = fig.to_drawing()
  assert_eq(frame.targets().length(), 3)
  assert_true((1.7e308 * 2.0.sqrt()).is_inf())
  for target in frame.targets() {
    let info = quiver_pick(
      frame,
      target.info.point.screen_x,
      target.info.point.screen_y,
    )
    assert_eq(
      (info.value, info.point.data_x, info.point.data_y),
      (1.7e308, -8.0e307, -8.0e307),
    )
    assert_eq(info.vector, Some(@drawing.vector_info(1.7e308, 1.7e308)))
  }
}

///|
test "quiver input copies dual array identities and current contents guard immutable frames" {
  let fig = figure()
  let ax = fig.axes()
  let xs = [0.0, 2.0]
  let ys = [0.0, 1.0]
  let us = [1.0, -1.0]
  let vs = [2.0, -1.0]
  ax.quiver(xs, ys, us, vs, label="original")
  let old = fig.to_drawing()
  for array in [xs, ys, us, vs] {
    array[0] = 99.0
  }
  assert_eq(
    fig.to_drawing().targets()[0].info.vector,
    Some(@drawing.vector_info(1.0, 2.0)),
  )
  guard ax.state.val.artists[0] is Artist::Quiver(points, vectors, style) else {
    fail("Expected Quiver")
  }
  let copied = copy_artist(ax.state.val.artists[0])
  assert_true(
    ax.state.val.hit_metadata(copied, 0, @ref.Ref(0)).vector() is None,
  )
  assert_true(
    ax.state.val
    .hit_metadata(Artist::Quiver(points, vectors.copy(), style), 0, @ref.Ref(0))
    .vector()
    is None,
  )
  points[0] = @core.point(9.0, 9.0)
  assert_eq(fig.to_drawing().targets().length(), 0)
  points[0] = @core.point(0.0, 0.0)
  vectors[0] = @core.point(9.0, 9.0)
  assert_eq(fig.to_drawing().targets().length(), 0)
  assert_eq(old.targets()[0].info.vector, Some(@drawing.vector_info(1.0, 2.0)))
  ax.clear_checked()
  ax.plot([0.0, 1.0], [0.0, 1.0])
  assert_true(fig.to_drawing().targets().all(t => t.info.kind == Line))
}

///|
test "quiver keeps whole call nonfinite validation and empty zero geometry without ghost targets" {
  for slot in 0..<4 {
    let fig = figure()
    let arrays = [[0.0], [0.0], [1.0], [1.0]]
    arrays[slot][0] = 0.0 / 0.0
    try fig.quiver(arrays[0], arrays[1], arrays[2], arrays[3]) catch {
      _ => ()
    } noraise {
      _ => fail("Expected original nonfinite error")
    }
    assert_eq((fig.artists().length(), fig.containers().length()), (0, 0))
  }
  for empty in [false, true] {
    let fig = figure()
    if empty {
      fig.quiver([], [], [], [])
    } else {
      fig.quiver([0.0], [0.0], [0.0], [0.0])
    }
    let frame = fig.to_drawing()
    assert_eq((frame.targets().length(), frame.points().length()), (0, 0))
    assert_eq(frame.hit_test(100.0, 100.0, mode=XNearest), None)
  }
}

///|
test "quiver open arrowhead has no fabricated filled triangle and CSS radius has no XNearest tail fallback" {
  let fig = figure(width=400, height=200)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  ax.set_x_limits(-1.0, 3.0)
  ax.set_y_limits(-1.0, 1.0)
  ax.quiver([0.0], [0.0], [2.0], [0.0])
  let frame = fig.to_drawing()
  for mode in [@drawing.HitMode::Nearest, XNearest] {
    assert_eq(frame.hit_test(296.0, 101.0, radius=0.0, mode~), None)
    assert_eq(frame.hit_test(20.0, 20.0, radius=0.0, mode~), None)
    assert_eq(
      frame.hit_test_client(
        410.0,
        226.0,
        10.0,
        20.0,
        800.0,
        400.0,
        radius=5.99,
        mode~,
      ),
      None,
    )
    let selected = frame
      .hit_test_client(
        410.0,
        226.0,
        10.0,
        20.0,
        800.0,
        400.0,
        radius=6.0,
        mode~,
      )
      .unwrap()
    assert_eq(
      frame.hit_info(selected).unwrap().vector,
      Some(@drawing.vector_info(2.0, 0.0)),
    )
    assert_eq(
      frame.hit_test_client(410.0, 30.0, 10.0, 20.0, 800.0, 800.0, mode~),
      None,
    )
  }
}

///|
test "quiver double array source identity follows image contour Line removal and same color paint labels" {
  let fig = figure(width=400, height=200)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  ax.set_x_limits(-1.0, 3.0)
  ax.set_y_limits(-1.0, 3.0)
  ax.legend([])
  let removed = ax.plot_line(Numeric([0.0, 1.0]), Numeric([0.0, 1.0]))
  ax.imshow([[0.0]], aspect="auto")
  let contour = ax.contour([[0.0, 1.0], [1.0, 2.0]], levels=[0.5])
  ax.clabel(contour, inline=true)
  ax.quiver([0.0], [0.0], [2.0], [1.0], color="#123456", label="first")
  ax.quiver([0.0], [0.0], [2.0], [1.0], color="#123456", label="second")
  removed.remove()
  let artist = ax.state.val.artists.length() - 1
  let frame = fig.to_drawing()
  let targets = frame.targets().filter(t => t.info.kind == Quiver)
  assert_eq(targets.map(t => t.info.point.artist_index), [
    artist - 1,
    artist - 1,
    artist - 1,
    artist,
    artist,
    artist,
  ])
  for mode in [@drawing.HitMode::Nearest, XNearest] {
    let info = quiver_pick(frame, 200.0, 125.0, mode~)
    assert_eq(
      (info.kind, info.series, info.point.artist_index, info.point.point_index),
      (Quiver, "second", artist, 0),
    )
    assert_eq(info.vector, Some(@drawing.vector_info(2.0, 1.0)))
  }
}

///|
test "quiver later actual strokes cover earlier fill while later fill covers earlier arrows" {
  for area_first in [false, true] {
    let fig = figure(width=400, height=200)
    let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
    ax.set_x_limits(-1.0, 3.0)
    ax.set_y_limits(-1.0, 3.0)
    if area_first {
      ax.fill_between([-1.0, 3.0], [-1.0, -1.0], [3.0, 3.0])
    }
    ax.quiver([0.0], [0.0], [2.0], [1.0])
    if !area_first {
      ax.fill_between([-1.0, 3.0], [-1.0, -1.0], [3.0, 3.0])
    }
    let frame = fig.to_drawing()
    for mode in [@drawing.HitMode::Nearest, XNearest] {
      assert_eq(
        quiver_pick(frame, 200.0, 125.0, mode~).kind,
        if area_first {
          Quiver
        } else {
          Area
        },
      )
    }
  }
  for color in ["none", "transparent", "#12345600", "rgba(0,0,0,0)"] {
    let fig = figure()
    fig.quiver([0.0], [0.0], [2.0], [1.0], color~)
    assert_eq(fig.to_drawing().targets().length(), 0)
  }
}
