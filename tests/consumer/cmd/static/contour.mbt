///|
fn verify_contour_consumer() -> Unit raise {
  let figure = @plot.figure(width=400, height=300)
  let axes = figure.add_axes(0.0, 0.0, 1.0, 1.0)
  axes.legend([])
  axes.set_x_limits(10.0, 40.0)
  axes.set_y_limits(-3.0, 8.0)
  let result = axes.contour(
    [[0.0, 1.0, 2.0], [1.0, 2.0, 3.0], [2.0, 3.0, 4.0]],
    x=[10.0, 20.0, 40.0],
    y=[-3.0, 1.0, 8.0],
    levels=[0.5, 1.5, 2.5],
    color="#226688",
    label="Field",
  )
  let levels = result.segment_levels()
  assert_eq(levels, [0.5, 1.5, 1.5, 2.5])
  let before = figure.to_drawing()
  assert_eq(before.svg(), figure.to_svg_checked())
  assert_eq(before.targets().length(), 14)
  let paths = result.segments()
  for target in before.targets() {
    let info = target.info
    assert_eq((info.kind, info.series), (@plot.HitKind::Contour, "Field"))
    assert_eq(info.value, levels[info.point.point_index])
    assert_eq((info.cell, info.vector, info.band), (None, None, None))
    assert_eq((info.interval, info.fraction, info.error), (None, None, None))
    let path = paths[info.point.point_index]
    let mut found_midpoint = false
    for i in 0..<(path.length() - 1) {
      let x = path[i].x() / 2.0 + path[i + 1].x() / 2.0
      let y = path[i].y() / 2.0 + path[i + 1].y() / 2.0
      if (info.point.data_x - x).abs() < 1.0e-10 &&
        (info.point.data_y - y).abs() < 1.0e-10 {
        found_midpoint = true
      }
    }
    assert_true(found_midpoint)
    assert_true(target.shape is @plot.HitShape::Segment(_, _, _, _))
  }
  paths[0][0] = @plot.point(999.0, 999.0)
  levels[0] = 999.0
  axes.clabel(result)
  let inline = figure.to_drawing()
  assert_eq(inline.svg(), figure.to_svg_checked())
  let first_fragments = inline
    .targets()
    .filter(t => t.info.point.point_index == 0)
  assert_true(first_fragments.any(t => t.info.point.artist_index == 0))
  assert_true(first_fragments.any(t => t.info.point.artist_index == 1))
  for target in inline.targets() {
    assert_eq(target.info.kind, @plot.HitKind::Contour)
    assert_eq(target.info.series, "Field")
    assert_eq(
      target.info.value,
      result.segment_levels()[target.info.point.point_index],
    )
  }
  // The first representative edge's midpoint lies in the actual erased gap.
  for mode in [@plot.HitMode::Nearest, XNearest] {
    assert_eq(
      inline.hit_test(50.0, 300.0 * 10.5 / 11.0, radius=0.1, mode~),
      None,
    )
  }
  assert_eq(before.targets().length(), 14)
  assert_eq(result.segment_levels(), [0.5, 1.5, 1.5, 2.5])
  verify_clipped_contour_consumer()
  verify_contour_area_consumer()
}

///|
fn verify_clipped_contour_consumer() -> Unit raise {
  let figure = @plot.figure(width=400, height=200)
  let axes = figure.add_axes(0.0, 0.0, 1.0, 1.0)
  axes.legend([])
  axes.set_x_limits(0.2, 0.6)
  axes.set_y_limits(0.0, 1.0)
  let result = axes.tricontour(
    [0.0, 2.0, 0.0],
    [0.0, 0.0, 2.0],
    [[0, 1, 2]],
    [0.0, 2.0, 2.0],
    levels=[1.0],
    label="Mesh",
  )
  assert_eq(result.segment_levels(), [1.0])
  let frame = figure.to_drawing()
  assert_eq(frame.svg(), figure.to_svg_checked())
  assert_eq(frame.targets().length(), 1)
  let info = frame.targets()[0].info
  assert_eq(
    (info.kind, info.series, info.value),
    (@plot.HitKind::Contour, "Mesh", 1.0),
  )
  assert_eq(
    (info.point.point_index, info.point.data_x, info.point.data_y),
    (0, 0.5, 0.5),
  )
  assert_true((info.point.screen_x - 200.0).abs() < 1.0e-9)
  assert_true((info.point.screen_y - 80.0).abs() < 1.0e-9)
  for mode in [@plot.HitMode::Nearest, XNearest] {
    let hit = frame
      .hit_info(frame.hit_test(200.0, 80.0, radius=1.0e-7, mode~).unwrap())
      .unwrap()
    assert_eq(hit, info)
    assert_eq(frame.hit_test(200.0, 180.0, radius=0.0, mode~), None)
  }
}

///|
fn verify_contour_area_consumer() -> Unit raise {
  for contour_last in [false, true] {
    let figure = @plot.figure(width=400, height=200)
    let axes = figure.add_axes(0.0, 0.0, 1.0, 1.0)
    axes.legend([])
    axes.set_x_limits(0.0, 2.0)
    axes.set_y_limits(0.0, 2.0)
    if !contour_last {
      ignore(
        axes.contour(
          [[0.0, 2.0], [2.0, 4.0]],
          x=[0.0, 2.0],
          y=[0.0, 2.0],
          levels=[1.0],
          label="Level",
        ),
      )
    }
    axes.fill_between([0.0, 2.0], [0.0, 0.0], [2.0, 2.0], label="Area")
    if contour_last {
      ignore(
        axes.contour(
          [[0.0, 2.0], [2.0, 4.0]],
          x=[0.0, 2.0],
          y=[0.0, 2.0],
          levels=[1.0],
          label="Level",
        ),
      )
    }
    let frame = figure.to_drawing()
    assert_eq(frame.svg(), figure.to_svg_checked())
    for mode in [@plot.HitMode::Nearest, XNearest] {
      let hit = frame
        .hit_info(frame.hit_test(100.0, 150.0, radius=1.0e-7, mode~).unwrap())
        .unwrap()
      assert_eq(
        hit.kind,
        if contour_last {
          @plot.HitKind::Contour
        } else {
          @plot.HitKind::Area
        },
      )
      let area = frame
        .hit_info(frame.hit_test(300.0, 50.0, radius=0.0, mode~).unwrap())
        .unwrap()
      assert_eq((area.kind, area.series), (@plot.HitKind::Area, "Area"))
    }
  }
}
