///|
fn stem_interaction_fixture(horizontal : Bool) -> (Figure, Axes) raise {
  let fig = figure(width=400, height=200)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  ax.set_x_limits(-2.0, 8.0)
  ax.set_y_limits(-2.0, 8.0)
  ax.legend([])
  ax.stem(
    [4.0, -1.0, 6.0],
    locs=[1.0, 3.0, 6.0],
    bottom=1.0,
    orientation=if horizontal { "horizontal" } else { "vertical" },
    label="stems",
  )
  (fig, ax)
}

///|
fn stem_at(
  frame : @drawing.Drawing,
  x : Double,
  y : Double,
  mode~ : @drawing.HitMode = Nearest,
) -> @drawing.HitInfo {
  step_selected(frame, (x + 2.0) * 40.0, (8.0 - y) * 20.0, mode~)
}

///|
test "stem physical rods and heads share original data while retaining real component artist identities" {
  for horizontal in [false, true] {
    let (fig, ax) = stem_interaction_fixture(horizontal)
    let frame = fig.to_drawing()
    assert_eq(frame.svg(), fig.to_svg_checked())
    assert_eq(fig.artists().length(), 5)
    assert_eq(ax.state.val.line_originals.length(), 0)
    assert_true(fig.containers()[0].kind() is Stem)
    assert_eq(
      (fig.containers()[0].label(), fig.containers()[0].artists().length()),
      ("stems", 5),
    )
    assert_eq(frame.targets().length(), 6)
    for mode in [@drawing.HitMode::Nearest, XNearest] {
      for
        (i, location, head, middle) in [
          (0, 1.0, 4.0, 2.5),
          (1, 3.0, -1.0, 0.0),
          (2, 6.0, 6.0, 3.5),
        ] {
        let rod = if horizontal {
          stem_at(frame, middle, location, mode~)
        } else {
          stem_at(frame, location, middle, mode~)
        }
        let marker = if horizontal {
          stem_at(frame, head, location, mode~)
        } else {
          stem_at(frame, location, head, mode~)
        }
        assert_eq(
          (
            rod.kind,
            rod.point.point_index,
            rod.point.artist_index,
            rod.value,
            rod.series,
          ),
          (Stem, i, i, head, "stems"),
        )
        assert_eq(
          (
            marker.kind,
            marker.point.point_index,
            marker.point.artist_index,
            marker.value,
          ),
          (Stem, i, 4, head),
        )
        assert_eq(rod.band, Some(@drawing.band_info(1.0, head, horizontal~)))
        assert_eq(marker.band, rod.band)
        assert_eq(
          (rod.point.data_x, rod.point.data_y),
          if horizontal {
            (head, location)
          } else {
            (location, head)
          },
        )
        assert_eq(
          (marker.point.data_x, marker.point.data_y),
          (rod.point.data_x, rod.point.data_y),
        )
      }
      let (x, y) = if horizontal { (1.0, 2.0) } else { (2.0, 1.0) }
      assert_eq(
        frame.hit_test((x + 2.0) * 40.0, (8.0 - y) * 20.0, radius=0.0, mode~),
        None,
      )
    }
  }
}

///|
test "stem NaN location gaps zero rods default locations and copied inputs keep original indices" {
  let fig = figure()
  fig.stem(
    [1.0, 0.0 / 0.0, 3.0, 5.0],
    locs=[0.0, 1.0, 1.0 / 0.0, 4.0],
    bottom=1.0,
  )
  let frame = fig.to_drawing()
  assert_eq(frame.targets().map(t => t.info.point.point_index), [3, 0, 3])
  assert_eq(frame.targets().filter(t => t.shape != Point).length(), 1)
  let empty = figure()
  empty.stem([])
  assert_eq(
    (empty.artists().length(), empty.to_drawing().targets().length()),
    (2, 0),
  )
  let copy = figure()
  let heads = [4.0, -1.0]
  copy.stem(heads, bottom=1.0)
  heads[0] = 99.0
  assert_true(
    copy
    .to_drawing()
    .targets()
    .all(t => {
      t.info.kind == Stem &&
      t.info.point.data_x == t.info.point.point_index.to_double()
    }),
  )
  assert_eq(copy.to_drawing().targets()[0].info.value, 4.0)
}

///|
test "stem clipping and axis reversal retain outside head and signed raw band on actual intersecting rod" {
  for horizontal in [false, true] {
    for reverse in [false, true] {
      let fig = figure(width=400, height=200)
      let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
      let lower = if reverse { 2.0 } else { -1.0 }
      let upper = if reverse { -1.0 } else { 2.0 }
      ax.set_x_limits(
        if horizontal {
          lower
        } else {
          0.0
        },
        if horizontal {
          upper
        } else {
          2.0
        },
      )
      ax.set_y_limits(
        if horizontal {
          0.0
        } else {
          lower
        },
        if horizontal {
          2.0
        } else {
          upper
        },
      )
      ax.stem(
        [7.0],
        locs=[1.0],
        bottom=-3.0,
        orientation=if horizontal { "horizontal" } else { "vertical" },
      )
      let frame = fig.to_drawing()
      assert_eq(frame.svg(), fig.to_svg_checked())
      assert_eq(frame.targets().length(), 1)
      let info = step_selected(frame, 200.0, 100.0)
      assert_eq(
        (info.kind, info.value, info.point.point_index, info.point.artist_index),
        (Stem, 7.0, 0, 0),
      )
      assert_eq(info.band, Some(@drawing.band_info(-3.0, 7.0, horizontal~)))
      assert_eq(
        (info.point.data_x, info.point.data_y),
        if horizontal {
          (7.0, 1.0)
        } else {
          (1.0, 7.0)
        },
      )
    }
  }
}

///|
test "stem Log invalid bottom keeps only actual valid heads without inventing clipped rods" {
  for horizontal in [false, true] {
    let fig = figure(width=400, height=200)
    let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
    if horizontal {
      ax.set_x_scale(@scale.log_scale())
      ax.set_x_limits(1.0, 10.0)
      ax.set_y_limits(0.0, 4.0)
    } else {
      ax.set_y_scale(@scale.log_scale())
      ax.set_y_limits(1.0, 10.0)
      ax.set_x_limits(0.0, 4.0)
    }
    ax.stem(
      [4.0, -1.0],
      locs=[2.0, 3.0],
      orientation=if horizontal { "horizontal" } else { "vertical" },
    )
    let frame = fig.to_drawing()
    assert_eq(frame.targets().length(), 1)
    let target = frame.targets()[0]
    assert_eq(target.shape, Point)
    let info = step_selected(
      frame,
      target.info.point.screen_x,
      target.info.point.screen_y,
    )
    assert_eq(
      (info.kind, info.point.point_index, info.point.artist_index, info.value),
      (Stem, 0, 3, 4.0),
    )
    assert_eq(info.band, Some(@drawing.band_info(0.0, 4.0, horizontal~)))
  }
}

///|
test "stem modified actual paths invalidate component metadata without losing immutable old frames" {
  let (fig, ax) = stem_interaction_fixture(false)
  let old = fig.to_drawing()
  let copied = copy_artist(ax.state.val.artists[0])
  assert_true(ax.state.val.hit_metadata(copied, 0, @ref.Ref(0)).stem() is None)
  guard ax.state.val.artists[4] is Scatter(markers, _) else {
    fail("Expected stem heads")
  }
  markers[0] = @core.point(1.0, 5.0)
  assert_eq(fig.to_drawing().targets().length(), 3)
  guard ax.state.val.artists[0] is Line(points, _) else {
    fail("Expected stem rod")
  }
  points[1] = @core.point(1.0, 5.0)
  let changed = fig.to_drawing()
  assert_eq(changed.targets().map(t => t.info.point.point_index), [1, 2])
  assert_eq(stem_at(old, 1.0, 2.5).value, 4.0)
  ax.clear_checked()
  ax.plot([0.0, 1.0], [0.0, 1.0])
  assert_true(fig.to_drawing().targets().all(t => t.info.kind == Line))
}

///|
test "stem later rods and heads respect real filled region and same color artist paint order" {
  for area_first in [false, true] {
    let fig = figure(width=400, height=200)
    let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
    ax.set_x_limits(-2.0, 8.0)
    ax.set_y_limits(-2.0, 8.0)
    ax.legend([])
    if area_first {
      ax.fill_between([-2.0, 8.0], [-2.0, -2.0], [7.0, 7.0])
    }
    ax.stem([4.0], locs=[1.0], bottom=1.0)
    if !area_first {
      ax.fill_between([-2.0, 8.0], [-2.0, -2.0], [7.0, 7.0])
    }
    let frame = fig.to_drawing()
    for mode in [@drawing.HitMode::Nearest, XNearest] {
      for value in [2.0, 4.0] {
        assert_eq(
          stem_at(frame, 1.0, value, mode~).kind,
          if area_first {
            Stem
          } else {
            Area
          },
        )
      }
    }
  }
  let fig = figure(width=400, height=200)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  ax.set_x_limits(-2.0, 8.0)
  ax.set_y_limits(-2.0, 8.0)
  ax.legend([])
  ax.stem([4.0], locs=[1.0], bottom=1.0, color="#123456", label="first")
  ax.stem([6.0], locs=[1.0], bottom=1.0, color="#123456", label="second")
  let info = stem_at(fig.to_drawing(), 1.0, 3.0)
  assert_eq(
    (info.kind, info.series, info.value, info.point.artist_index),
    (Stem, "second", 6.0, 3),
  )
}

///|
test "stem CSS radius panels and letterbox use physical hits without XNearest source fallback" {
  let fig = figure(width=400, height=200)
  for i in 0..<2 {
    let ax = fig.add_axes(i.to_double() / 2.0, 0.0, 0.5, 1.0)
    ax.set_x_limits(0.0, 5.0)
    ax.set_y_limits(0.0, 10.0)
    ax.stem([7.0], locs=[2.0], bottom=1.0)
  }
  for _ in 0..<2 {
    let frame = fig.to_drawing()
    assert_eq(frame.hit_test(86.0, 120.0, radius=5.0), None)
    assert_eq(frame.hit_test(86.0, 120.0, radius=6.0).unwrap().panel_index, 0)
    assert_eq(frame.hit_test(10.0, 10.0, mode=XNearest), None)
    for (client_x, panel) in [(170.0, 0), (570.0, 1)] {
      let p = frame
        .hit_test_client(client_x, 460.0, 10.0, 20.0, 800.0, 800.0, radius=0.0)
        .unwrap()
      assert_eq((p.panel_index, frame.hit_info(p).unwrap().value), (panel, 7.0))
    }
    assert_eq(
      frame.hit_test_client(170.0, 30.0, 10.0, 20.0, 800.0, 800.0),
      None,
    )
  }
}

///|
test "stem none transparent and generated rgba paints do not create rod or head ghosts" {
  for color in ["none", "transparent", "#12345600", "rgba(0,0,0,0)"] {
    let fig = figure()
    fig.stem([4.0, -1.0], bottom=1.0, color~)
    assert_eq(fig.to_drawing().targets().length(), 0)
  }
}

///|
test "stem source identity survives image contour expansion and prior Line removal" {
  let fig = figure(width=400, height=200)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  ax.set_x_limits(-2.0, 8.0)
  ax.set_y_limits(-2.0, 8.0)
  ax.legend([])
  let removed = ax.plot_line(Numeric([0.0, 1.0]), Numeric([0.0, 1.0]))
  ax.imshow([[0.0]], aspect="auto")
  let contour = ax.contour([[0.0, 1.0], [1.0, 2.0]], levels=[0.5])
  ax.clabel(contour, inline=true)
  ax.stem([4.0, -1.0], locs=[1.0, 3.0], bottom=1.0, label="prefix")
  removed.remove()
  let heads_artist = ax.state.val.artists.length() - 1
  let frame = fig.to_drawing()
  let targets = frame.targets().filter(t => t.info.kind == Stem)
  assert_eq(targets.map(t => t.info.point.point_index), [0, 1, 0, 1])
  assert_eq(targets.map(t => t.info.point.artist_index), [
    heads_artist - 3,
    heads_artist - 2,
    heads_artist,
    heads_artist,
  ])
  for target in targets {
    let p = frame
      .hit_test(
        target.info.point.screen_x,
        target.info.point.screen_y,
        radius=0.0,
      )
      .unwrap()
    let info = frame.hit_info(p).unwrap()
    assert_eq(
      (info.kind, info.series, info.point.point_index, info.value),
      (Stem, "prefix", target.info.point.point_index, target.info.value),
    )
  }
}
