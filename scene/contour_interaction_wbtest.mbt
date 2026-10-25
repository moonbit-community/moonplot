///|
fn contour_interaction_fixture() -> (Figure, Axes, ContourSet) raise {
  let fig = figure(width=400, height=300)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  ax.legend([])
  ax.set_x_limits(10.0, 40.0)
  ax.set_y_limits(-3.0, 8.0)
  let contours = ax.contour(
    [[0.0, 1.0, 2.0], [1.0, 2.0, 3.0], [2.0, 3.0, 4.0]],
    x=[10.0, 20.0, 40.0],
    y=[-3.0, 1.0, 8.0],
    levels=[0.5, 1.5, 2.5],
    color="#226688",
    label="Field",
  )
  (fig, ax, contours)
}

///|
test "contour regular paths expose exact levels immutable call series and generated path slots on actual edges" {
  let (fig, _, contours) = contour_interaction_fixture()
  let paths = contours.segments()
  assert_eq(paths.map(p => p.length()), [3, 5, 3, 7])
  assert_eq(contours.segment_levels(), [0.5, 1.5, 1.5, 2.5])
  let frame = fig.to_drawing()
  assert_eq(frame.svg(), fig.to_svg_checked())
  assert_eq(frame.targets().length(), 14)
  assert_eq(fig.containers().length(), 1)
  for target in frame.targets() {
    let info = target.info
    let point = info.point
    assert_true(target.shape is Segment(_, _, _, _))
    assert_eq((info.kind, info.series), (Contour, "Field"))
    assert_eq(info.value, contours.segment_levels()[point.point_index])
    assert_eq(point.artist_index, point.point_index)
    assert_eq((info.cell, info.interval, info.fraction), (None, None, None))
    assert_eq((info.band, info.vector, info.error), (None, None, None))
    for mode in [@drawing.HitMode::Nearest, XNearest] {
      let selected = frame
        .hit_test(point.screen_x, point.screen_y, radius=1.0e-7, mode~)
        .unwrap()
      let actual = frame.hit_info(selected).unwrap()
      assert_eq(
        (actual.kind, actual.series, actual.value, actual.point.point_index),
        (Contour, "Field", info.value, point.point_index),
      )
    }
  }
  assert_eq(
    (frame.targets()[0].info.point.data_x, frame.targets()[0].info.point.data_y),
    (13.75, -2.5),
  )
  paths[0][0] = @core.point(99.0, 99.0)
  let levels = contours.segment_levels()
  levels[0] = 99.0
  assert_eq(fig.to_drawing().targets(), frame.targets())
}

///|
test "contour inline fragments retain original path slots and exact labels without targets in the erased gap or text" {
  let (fig, ax, contours) = contour_interaction_fixture()
  let before = contours.segments()
  ax.clabel(contours)
  let frame = fig.to_drawing()
  assert_eq(
    contours.segments().map(path => path.map(p => (p.x(), p.y()))),
    before.map(path => path.map(p => (p.x(), p.y()))),
  )
  let contour_artists = frame.targets().map(t => t.info.point.artist_index)
  assert_true(contour_artists.contains(0) && contour_artists.contains(1))
  assert_true(
    frame.targets().all(t => t.info.kind == Contour && t.info.series == "Field"),
  )
  assert_eq(
    frame
    .targets()
    .filter(t => t.info.point.artist_index == 0)
    .map(t => t.info.point.point_index),
    [0],
  )
  assert_true(
    frame
    .targets()
    .filter(t => t.info.point.artist_index == 1)
    .all(t => t.info.point.point_index == 0),
  )
  // Representative edge on first path is (15,-3) -> (12.5,-2).
  let gap_x = (13.75 - 10.0) / 30.0 * 400.0
  let gap_y = (8.0 - -2.5) / 11.0 * 300.0
  for mode in [@drawing.HitMode::Nearest, XNearest] {
    assert_eq(frame.hit_test(gap_x, gap_y, radius=0.1, mode~), None)
  }
  assert_eq(frame.svg(), fig.to_svg_checked())
  let old = frame.targets()
  ax.clabel(contours, inline=false)
  assert_eq(fig.to_drawing().targets(), old)
}

///|
test "tricontour direct and triangulation wrapper retain resolved levels masks and copied result slots" {
  for wrapper in [false, true] {
    let fig = figure(width=400, height=300)
    let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
    ax.set_x_limits(0.0, 2.0)
    ax.set_y_limits(0.0, 2.0)
    let xs = [0.0, 2.0, 2.0, 0.0]
    let ys = [0.0, 0.0, 2.0, 2.0]
    let triangles = [[0, 1, 2], [0, 2, 3]]
    let mask = [false, true]
    let values = [0.0, 2.0, 4.0, 2.0]
    let contours = if wrapper {
      let mesh = triangulation(xs, ys, triangles~, mask~)
      ax.tricontour_triangulation(mesh, values, levels=[1.0, 3.0], label="Mesh")
    } else {
      ax.tricontour(
        xs,
        ys,
        triangles,
        values,
        levels=[1.0, 3.0],
        mask~,
        label="Mesh",
      )
    }
    assert_eq(contours.segment_levels(), [1.0, 3.0])
    let frame = fig.to_drawing()
    assert_eq(frame.targets().length(), 2)
    assert_eq(
      frame
      .targets()
      .map(t => (t.info.value, t.info.point.point_index, t.info.series)),
      [(1.0, 0, "Mesh"), (3.0, 1, "Mesh")],
    )
    assert_eq(frame.svg(), fig.to_svg_checked())
  }
}

///|
test "empty regular and triangular contour calls preserve earlier Line and contour series while retaining static legend" {
  for previous_contour in [false, true] {
    for triangular in [false, true] {
      let fig = figure()
      let ax = fig.axes()
      if previous_contour {
        ignore(
          ax.contour([[0.0, 1.0], [1.0, 2.0]], levels=[0.5], label="Original"),
        )
      } else {
        ax.plot([0.0, 1.0], [0.0, 1.0], label="Original")
      }
      let before = fig.to_drawing().targets()
      let result = if triangular {
        ax.tricontour(
          [0.0, 1.0, 0.0],
          [0.0, 0.0, 1.0],
          [[0, 1, 2]],
          [0.0, 1.0, 2.0],
          levels=[99.0],
          label="Empty",
        )
      } else {
        ax.contour([[0.0, 1.0], [1.0, 2.0]], levels=[99.0], label="Empty")
      }
      assert_eq(result.segments().length(), 0)
      assert_eq(fig.to_drawing().targets(), before)
      assert_eq(ax.legend_entries().map(e => e.label()), ["Original", "Empty"])
      assert_true(fig.to_svg_checked().contains("Empty"))
    }
  }
}

///|
test "contour identity or content replacement stays static through inline splitting and old Drawing remains immutable" {
  for replacement in [true, false] {
    let (fig, ax, contours) = contour_interaction_fixture()
    let old = fig.to_drawing()
    guard ax.state.val.artists[0] is Line(points, style) else { fail("Line") }
    if replacement {
      ax.state.val.artists[0] = Line(points.copy(), style)
    } else {
      let previous = points[0]
      points[0] = @core.point(previous.x() + 0.1, previous.y())
    }
    assert_true(
      fig.to_drawing().targets().all(t => t.info.point.artist_index != 0),
    )
    if !replacement {
      points[0] = contours.segments()[0][0]
      // A restored same-identity snapshot is valid until provenance is lost.
      assert_eq(fig.to_drawing().targets(), old.targets())
      ax.state.val.artists[0] = Line(points.copy(), style)
    }
    ax.clabel(contours)
    assert_true(
      fig
      .to_drawing()
      .targets()
      .all(t => t.info.point.artist_index != 0 && t.info.point.artist_index != 1),
    )
    assert_eq(old.targets().length(), 14)
    assert_eq(old.targets()[0].info.series, "Field")
  }
}

///|
test "contour visible clip midpoint differs from preclip data midpoint and both modes stay physical" {
  let fig = figure(width=400, height=300)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  ax.set_x_limits(0.75, 1.25)
  ax.set_y_limits(0.0, 1.0)
  ignore(
    ax.tricontour(
      [0.0, 2.0, 2.0],
      [0.0, 0.0, 2.0],
      [[0, 1, 2]],
      [0.0, 2.0, 4.0],
      levels=[1.0],
      label="Clip",
    ),
  )
  let frame = fig.to_drawing()
  assert_eq(frame.targets().length(), 1)
  let point = frame.targets()[0].info.point
  assert_eq((point.data_x, point.data_y), (0.75, 0.25))
  assert_true((point.screen_x - 100.0).abs() < 1.0e-9)
  assert_true((point.screen_y - 262.5).abs() < 1.0e-9)
  for mode in [@drawing.HitMode::Nearest, XNearest] {
    assert_eq(
      frame
      .hit_info(
        frame
        .hit_test(point.screen_x, point.screen_y, radius=1.0e-7, mode~)
        .unwrap(),
      )
      .unwrap().value,
      1.0,
    )
    assert_eq(frame.hit_test(point.screen_x, 50.0, radius=1.0, mode~), None)
  }
}
