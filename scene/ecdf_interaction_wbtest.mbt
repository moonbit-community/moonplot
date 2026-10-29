///|
fn ecdf_interaction_fixture(
  horizontal : Bool,
  complementary : Bool,
  compress : Bool,
) -> (Figure, Axes, Ecdf) raise {
  let fig = figure(width=400, height=200)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  ax.set_x_limits(0.0, if horizontal { 1.0 } else { 5.0 })
  ax.set_y_limits(0.0, if horizontal { 5.0 } else { 1.0 })
  ax.legend([])
  let result = ax.ecdf(
    [4.0, 1.0, 1.0, 3.0],
    weights=[2.0, 1.0, 2.0, 3.0],
    horizontal~,
    complementary~,
    compress~,
    label="distribution",
  )
  (fig, ax, result)
}

///|
fn ecdf_at(
  frame : @drawing.Drawing,
  value : Double,
  probability : Double,
  horizontal : Bool,
  mode~ : @drawing.HitMode = Nearest,
) -> @drawing.HitInfo {
  if horizontal {
    step_selected(frame, probability * 400.0, (5.0 - value) * 40.0, mode~)
  } else {
    step_selected(frame, value * 80.0, (1.0 - probability) * 200.0, mode~)
  }
}

///|
test "ecdf jumps outgoing plateaus and endpoints retain exact returned slots in all modes" {
  for horizontal in [false, true] {
    for complementary in [false, true] {
      for compress in [false, true] {
        let (fig, _, result) = ecdf_interaction_fixture(
          horizontal, complementary, compress,
        )
        let values = result.values()
        let probabilities = result.probabilities()
        let frame = fig.to_drawing()
        assert_eq(frame.svg(), fig.to_svg_checked())
        assert_eq(
          values,
          if compress {
            [1.0, 3.0, 4.0]
          } else {
            [1.0, 1.0, 3.0, 4.0]
          },
        )
        for mode in [@drawing.HitMode::Nearest, XNearest] {
          for i in 0..<values.length() {
            let before = if i == 0 {
              if complementary {
                1.0
              } else {
                0.0
              }
            } else {
              probabilities[i - 1]
            }
            let after = probabilities[i]
            let interval = if i + 1 < values.length() {
              Some((values[i], values[i + 1]))
            } else {
              None
            }
            let jump = ecdf_at(
              frame,
              values[i],
              (before + after) / 2.0,
              horizontal,
              mode~,
            )
            assert_eq(
              (jump.kind, jump.point.point_index, jump.value, jump.fraction),
              (Ecdf, i, values[i], Some(after)),
            )
            assert_eq(jump.interval, interval)
            assert_eq(
              jump.band,
              Some(@drawing.band_info(before, after, horizontal~)),
            )
            assert_eq(jump.series, "distribution")
            assert_eq(
              (jump.point.data_x, jump.point.data_y),
              if horizontal {
                (after, values[i])
              } else {
                (values[i], after)
              },
            )
            assert_eq(
              ecdf_at(frame, values[i], after, horizontal, mode~).point.point_index,
              i,
            )
            if i + 1 < values.length() && values[i] != values[i + 1] {
              let plateau = ecdf_at(
                frame,
                (values[i] + values[i + 1]) / 2.0,
                after,
                horizontal,
                mode~,
              )
              assert_eq(
                (
                  plateau.point.point_index,
                  plateau.value,
                  plateau.fraction,
                  plateau.interval,
                  plateau.band,
                ),
                (i, values[i], Some(after), interval, jump.band),
              )
            }
          }
        }
        // There are no invented infinite CDF tails or a horizontal snap mode.
        assert_eq(frame.hit_test(380.0, 100.0, radius=0.0, mode=XNearest), None)
      }
    }
  }
}

///|
test "ecdf zero weight duplicate slots keep canonical endpoints only on actual connected stroke" {
  for horizontal in [false, true] {
    let fig = figure(width=400, height=200)
    let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
    ax.set_x_limits(0.0, if horizontal { 1.0 } else { 5.0 })
    ax.set_y_limits(0.0, if horizontal { 5.0 } else { 1.0 })
    ignore(
      ax.ecdf(
        [1.0, 2.0, 3.0, 3.0, 3.0, 4.0],
        weights=[1.0, 1.0, 0.0, 0.0, 0.0, 0.0],
        horizontal~,
      ),
    )
    let frame = fig.to_drawing()
    assert_eq(frame.points().map(p => p.point_index), [0, 1, 2, 3, 4, 5])
    let duplicate = ecdf_at(frame, 3.0, 1.0, horizontal)
    assert_eq(
      (duplicate.point.point_index, duplicate.value, duplicate.band),
      (4, 3.0, Some(@drawing.band_info(1.0, 1.0, horizontal~))),
    )
    let final_point = ecdf_at(frame, 4.0, 1.0, horizontal)
    assert_eq((final_point.point.point_index, final_point.interval), (5, None))
    assert_eq(ecdf_at(frame, 3.5, 1.0, horizontal).point.point_index, 4)
  }
  let fig = figure()
  let result = fig.ecdf([1.0, 1.0], weights=[1.0e308, 1.0e308])
  // Existing overflowing accumulation remains unchanged. Its only valid
  // written run is wholly zero length, so it cannot create a visible target.
  assert_eq(result.probabilities()[0], 0.0)
  assert_true(result.probabilities()[1].is_nan())
  assert_eq(fig.to_drawing().targets().length(), 0)
}

///|
test "ecdf input and returned arrays are snapshots and changed actual paths lose source semantics" {
  let fig = figure(width=400, height=200)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  ax.set_x_limits(0.0, 5.0)
  ax.set_y_limits(0.0, 1.0)
  let values = [4.0, 1.0, 1.0, 3.0]
  let weights = [2.0, 1.0, 2.0, 3.0]
  let result = ax.ecdf(values, weights~, compress=true)
  let original = fig.to_drawing()
  values[1] = 99.0
  weights[1] = 99.0
  result.values()[0] = 99.0
  result.probabilities()[0] = 99.0
  assert_eq(result.values(), [1.0, 3.0, 4.0])
  assert_eq(result.probabilities(), [0.375, 0.75, 1.0])
  assert_eq(ecdf_at(fig.to_drawing(), 2.0, 0.375, false).point.point_index, 0)
  assert_eq(ax.state.val.line_originals.length(), 0)
  guard ax.state.val.artists[0] is Artist::Line(points, _) else {
    fail("Expected ECDF line")
  }
  points[1] = @core.point(1.0, 0.25)
  let changed = fig.to_drawing()
  assert_true(!changed.targets().is_empty())
  assert_true(changed.targets().all(t => t.info.kind == Line))
  assert_eq(ecdf_at(original, 2.0, 0.375, false).kind, Ecdf)
}

///|
test "ecdf constant compressed distributions and transparent paint keep actual visibility" {
  for horizontal in [false, true] {
    for compress in [false, true] {
      let fig = figure(width=400, height=200)
      let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
      ax.set_x_limits(0.0, if horizontal { 1.0 } else { 5.0 })
      ax.set_y_limits(0.0, if horizontal { 5.0 } else { 1.0 })
      let result = ax.ecdf([2.0, 2.0], horizontal~, compress~)
      let info = ecdf_at(
        fig.to_drawing(),
        2.0,
        if compress {
          0.5
        } else {
          0.75
        },
        horizontal,
      )
      let i = if compress { 0 } else { 1 }
      assert_eq(
        (info.kind, info.point.point_index, info.value, info.fraction),
        (Ecdf, i, 2.0, Some(result.probabilities()[i])),
      )
      assert_eq(info.interval, None)
    }
  }
  for color in ["none", "transparent", "#00000000", "rgba(0,0,0,0)"] {
    let fig = figure()
    ignore(fig.ecdf([1.0, 2.0], color~))
    assert_eq(fig.to_drawing().targets().length(), 0)
  }
}

///|
test "ecdf nonlinear invalid endpoints clipping and reversed axes use the actual written runs" {
  for reverse in [false, true] {
    let fig = figure(width=400, height=200)
    let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
    ax.set_x_scale(@scale.log_scale())
    ax.set_y_scale(@scale.log_scale())
    ax.set_x_limits(
      if reverse {
        100.0
      } else {
        1.0
      },
      if reverse {
        1.0
      } else {
        100.0
      },
    )
    ax.set_y_limits(0.1, 1.0)
    ignore(ax.ecdf([1.0, 10.0, 100.0], weights=[1.0, 1.0, 2.0]))
    let frame = fig.to_drawing()
    assert_eq(frame.svg(), fig.to_svg_checked())
    assert_true(frame.targets().all(t => t.info.kind == Ecdf))
    let target = frame
      .targets()
      .filter(t => t.info.point.point_index == 0 && t.shape != Point)[0]
    guard target.shape is Segment(x0, y0, x1, y1) else {
      fail("Expected actual plateau")
    }
    let info = step_selected(frame, (x0 + x1) / 2.0, (y0 + y1) / 2.0)
    assert_eq(
      (info.point.point_index, info.value, info.interval, info.fraction),
      (0, 1.0, Some((1.0, 10.0)), Some(0.25)),
    )
    ax.set_x_limits(
      if reverse {
        5.0
      } else {
        2.0
      },
      if reverse {
        2.0
      } else {
        5.0
      },
    )
    let clipped = fig.to_drawing()
    let target = clipped.targets().filter(t => t.info.point.point_index == 0)[0]
    let selected = step_selected(
      clipped,
      target.info.point.screen_x,
      target.info.point.screen_y,
    )
    assert_eq(
      (selected.kind, selected.value, selected.point.data_x),
      (Ecdf, 1.0, 1.0),
    )
    assert_eq(clipped.hit_test(-1.0, 100.0), None)
  }
}

///|
test "ecdf metadata follows physical artist identity across prefix removal clear and same color series" {
  let (fig, ax, _) = ecdf_interaction_fixture(false, false, true)
  let original = fig.to_drawing()
  let copied = copy_artist(ax.state.val.artists[0])
  assert_true(
    ax.state.val.hit_metadata(copied, 0, @ref.Ref(0)).discrete() is None,
  )
  ax.clear_checked()
  ax.set_x_limits(0.0, 5.0)
  ax.set_y_limits(0.0, 1.0)
  ax.legend([])
  ax.imshow([[0.0]], aspect="auto")
  let removed = ax.plot_line(Numeric([0.0, 1.0]), Numeric([0.0, 1.0]))
  ignore(
    ax.ecdf(
      [1.0, 3.0, 4.0],
      weights=[3.0, 3.0, 2.0],
      color="#123456",
      label="first",
    ),
  )
  ignore(
    ax.ecdf(
      [1.0, 3.0, 4.0],
      weights=[3.0, 3.0, 2.0],
      color="#123456",
      label="second",
    ),
  )
  removed.remove()
  let updated = fig.to_drawing()
  let info = ecdf_at(updated, 2.0, 0.375, false)
  assert_eq(
    (info.kind, info.series, info.point.artist_index),
    (Ecdf, "second", 2),
  )
  assert_eq(ecdf_at(original, 2.0, 0.375, false).series, "distribution")
}

///|
test "ecdf panel identity CSS radius and physical-only XNearest survive rebuilding" {
  let fig = figure(width=400, height=200)
  for panel in 0..<2 {
    let ax = fig.add_axes(panel.to_double() / 2.0, 0.0, 0.5, 1.0)
    ax.set_x_limits(0.0, 5.0)
    ax.set_y_limits(0.0, 1.0)
    ax.legend([])
    ignore(ax.ecdf([1.0, 3.0, 4.0], weights=[3.0, 3.0, 2.0]))
  }
  for _ in 0..<2 {
    let frame = fig.to_drawing()
    for (x, panel) in [(80.0, 0), (280.0, 1)] {
      for mode in [@drawing.HitMode::Nearest, XNearest] {
        let selected = frame
          .hit_test_client(
            10.0 + x * 2.0,
            270.0,
            10.0,
            20.0,
            800.0,
            400.0,
            radius=0.0,
            mode~,
          )
          .unwrap()
        assert_eq((selected.panel_index, selected.point_index), (panel, 0))
        assert_eq(frame.hit_info(selected).unwrap().fraction, Some(0.375))
      }
      assert_eq(frame.hit_test(x, 118.0, radius=6.0), None)
      assert_eq(frame.hit_test(x, 118.0, radius=7.0).unwrap().point_index, 0)
    }
  }
}
