///|
fn step_interaction_fixture(mode : String) -> (Figure, Axes) raise {
  let fig = figure(width=400, height=200)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  ax.set_x_limits(0.0, 5.0)
  ax.set_y_limits(0.0, 10.0)
  ax.legend([])
  ax.step([0.0, 2.0, 5.0], [2.0, 6.0, 4.0], where_=mode, label="samples")
  (fig, ax)
}

///|
fn step_selected(
  frame : @drawing.Drawing,
  x : Double,
  y : Double,
  mode~ : @drawing.HitMode = Nearest,
) -> @drawing.HitInfo {
  frame.hit_info(frame.hit_test(x, y, radius=0.0, mode~).unwrap()).unwrap()
}

///|
test "step real plateaus risers and original endpoints retain source indices in every mode" {
  for mode in ["pre", "post", "mid"] {
    let (fig, _) = step_interaction_fixture(mode)
    let frame = fig.to_drawing()
    assert_eq(frame.svg(), fig.to_svg_checked())
    for pick in [@drawing.HitMode::Nearest, XNearest] {
      let (x, y, i, interval) = if mode == "pre" {
        (80.0, 80.0, 1, Some((0.0, 2.0)))
      } else if mode == "post" {
        (80.0, 160.0, 0, Some((0.0, 2.0)))
      } else {
        (160.0, 80.0, 1, Some((1.0, 3.5)))
      }
      let plateau = step_selected(frame, x, y, mode=pick)
      assert_eq(
        (plateau.kind, plateau.point.point_index, plateau.interval),
        (Step, i, interval),
      )
      assert_eq(plateau.series, "samples")
      let riser_x = if mode == "pre" {
        0.0
      } else if mode == "post" {
        160.0
      } else {
        80.0
      }
      let riser = step_selected(frame, riser_x, 120.0, mode=pick)
      assert_eq(
        (
          riser.point.point_index,
          riser.value,
          riser.point.data_x,
          riser.point.data_y,
        ),
        (1, 6.0, 2.0, 6.0),
      )
      for (sx, sy, i) in [(0.0, 160.0, 0), (160.0, 80.0, 1), (400.0, 120.0, 2)] {
        assert_eq(step_selected(frame, sx, sy, mode=pick).point.point_index, i)
      }
    }
    let first = step_selected(frame, 0.0, 160.0)
    let last = step_selected(frame, 400.0, 120.0)
    if mode == "pre" {
      assert_eq(first.interval, None)
    }
    if mode == "post" {
      assert_eq(last.interval, None)
    }
  }
}

///|
test "step source copies and constant final sample survive synthetic zero length edges" {
  let fig = figure(width=400, height=200)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  ax.set_x_limits(0.0, 5.0)
  ax.set_y_limits(0.0, 10.0)
  let xs = [0.0, 2.0, 5.0]
  let ys = [2.0, 2.0, 2.0]
  ax.step(xs, ys, where_="post")
  xs[1] = 4.0
  ys[2] = 9.0
  let frame = fig.to_drawing()
  let last = step_selected(frame, 400.0, 160.0)
  assert_eq((last.point.point_index, last.value, last.interval), (2, 2.0, None))
  assert_eq(step_selected(frame, 160.0, 160.0).point.point_index, 1)
}

///|
test "step NaN runs keep finite source slots and never bridge missing data" {
  for mode in ["pre", "post", "mid"] {
    let fig = figure(width=400, height=200)
    let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
    ax.set_x_limits(0.0, 5.0)
    ax.set_y_limits(0.0, 10.0)
    ax.step([0.0, 2.0, 5.0], [2.0, 0.0 / 0.0, 4.0], where_=mode)
    let frame = fig.to_drawing()
    assert_true(!frame.targets().is_empty())
    assert_true(
      frame
      .targets()
      .all(t => t.info.kind == Step && t.info.point.point_index != 1),
    )
    assert_eq(frame.hit_test(160.0, 140.0, radius=0.0), None)
    let original = ax.state.val.line_originals[0]
    original.xy_values_checked().set(5, 6.0)
    assert_true(fig.to_drawing().targets().all(t => t.info.kind == Line))
  }
}

///|
test "step stale metadata never survives setters original cache path or drawstyle replacement" {
  for change in 0..<6 {
    let (fig, ax) = step_interaction_fixture("post")
    let original = fig.to_drawing()
    let retained = fig.to_render_figure(capture_points=true)
    let line = ax.state.val.line_originals[0]
    if change == 0 {
      line.set_data(line.get_xdata(), line.get_ydata())
    } else if change == 1 {
      line.set_xdata(Numeric([0.0, 1.0, 2.0, 4.0, 5.0]))
    } else if change == 2 {
      line.set_drawstyle("steps-mid")
    } else if change == 3 {
      line.xy_values_checked().set(3, 3.0)
    } else if change == 4 {
      line.path_values_checked().set(3, 3.0)
    } else {
      guard line.get_ydata() is Numeric(values) else {
        fail("Expected numeric originals")
      }
      values[1] = 3.0
    }
    let (updated, _) = @svg.render_drawing_with_positions_checked(retained)
    assert_true(!updated.targets().is_empty())
    assert_true(updated.targets().all(t => t.info.kind == Line))
    assert_eq(step_selected(original, 80.0, 160.0).kind, Step)
  }
}

///|
test "step visibility paint and unsupported dashed geometry cannot create semantic ghosts" {
  for change in 0..<6 {
    let (fig, ax) = step_interaction_fixture("pre")
    let line = ax.state.val.line_originals[0]
    if change == 0 {
      line.set_visible(false)
    }
    if change == 1 {
      line.set_linewidth(0.0)
    }
    if change == 2 {
      line.set_alpha(Some(0.0))
    }
    if change == 3 {
      line.set_color("none")
    }
    if change == 4 {
      line.set_linestyle("None")
    }
    if change == 5 {
      line.set_linestyle("--")
    }
    let frame = fig.to_drawing()
    if change == 5 {
      assert_true(frame.targets().all(t => t.info.kind == Line))
    } else {
      assert_eq((change, frame.targets().length()), (change, 0))
    }
  }
}

///|
test "step line removal and clear do not transplant semantics to reused artist positions" {
  let (fig, ax) = step_interaction_fixture("pre")
  let old = ax.state.val.line_originals[0]
  old.remove()
  ax.plot([0.0, 5.0], [1.0, 9.0])
  assert_true(fig.to_drawing().targets().all(t => t.info.kind == Line))
  ax.clear_checked()
  ax.set_x_limits(0.0, 5.0)
  ax.set_y_limits(0.0, 10.0)
  ax.step([0.0, 5.0], [3.0, 7.0], where_="post", label="new")
  old.set_data(Numeric([0.0, 5.0]), Numeric([9.0, 1.0]))
  let frame = fig.to_drawing()
  assert_true(
    frame.targets().all(t => t.info.kind == Step && t.info.series == "new"),
  )
}

///|
test "step clipped descending reversed and nonlinear geometry shares the real paint" {
  for reverse in [false, true] {
    let fig = figure(width=400, height=200)
    let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
    ax.set_x_limits(
      if reverse {
        5.0
      } else {
        0.0
      },
      if reverse {
        0.0
      } else {
        5.0
      },
    )
    ax.set_y_limits(0.0, 10.0)
    ax.step([5.0, 2.0, 0.0], [4.0, 6.0, 2.0], where_="post")
    let frame = fig.to_drawing()
    let p = step_selected(frame, if reverse { 80.0 } else { 320.0 }, 120.0)
    assert_eq(
      (p.point.point_index, p.interval, p.value),
      (0, Some((5.0, 2.0)), 4.0),
    )
  }
  let fig = figure(width=400, height=200)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  ax.set_x_scale(@scale.log_scale())
  ax.set_x_limits(1.0, 100.0)
  ax.set_y_limits(0.0, 10.0)
  ax.step([1.0, 100.0], [2.0, 8.0], where_="mid")
  let frame = fig.to_drawing()
  assert_eq(step_selected(frame, 200.0, 160.0).point.point_index, 0)
  assert_eq(step_selected(frame, 360.0, 40.0).point.point_index, 1)
  ax.set_x_limits(10.0, 20.0)
  let clipped = fig.to_drawing()
  assert_eq(step_selected(clipped, 200.0, 160.0).point.point_index, 0)
  assert_eq(clipped.svg(), fig.to_svg_checked())
}

///|
test "step physical segments respect later paint CSS radius and XNearest real source fallback" {
  for later in [false, true] {
    let fig = figure(width=400, height=200)
    let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
    ax.set_x_limits(0.0, 5.0)
    ax.set_y_limits(0.0, 10.0)
    if later {
      ax.fill_between([0.0, 5.0], [0.0, 0.0], [9.0, 9.0])
    }
    ax.step([0.0, 2.0, 5.0], [2.0, 6.0, 4.0], where_="post")
    if !later {
      ax.fill_between([0.0, 5.0], [0.0, 0.0], [9.0, 9.0])
    }
    let frame = fig.to_drawing()
    assert_eq(
      step_selected(frame, 80.0, 160.0).kind,
      if later {
        Step
      } else {
        Area
      },
    )
  }
  let (fig, _) = step_interaction_fixture("post")
  let frame = fig.to_drawing()
  let p = frame
    .hit_test_client(170.0, 340.0, 10.0, 20.0, 800.0, 400.0, radius=0.0)
    .unwrap()
  assert_eq(frame.hit_info(p).unwrap().point.point_index, 0)
  assert_eq(frame.hit_test(80.0, 153.0, radius=6.0), None)
  assert_eq(
    frame.hit_info(frame.hit_test(80.0, 153.0, radius=7.0).unwrap()).unwrap().point.point_index,
    0,
  )
  assert_eq(
    frame.hit_info(frame.hit_test(160.0, 10.0, mode=XNearest).unwrap()).unwrap().point.point_index,
    1,
  )
}
