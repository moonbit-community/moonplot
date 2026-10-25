///|
fn tricolor_control_figure(case : Int32) -> Figure raise {
  let fig = figure(width=400, height=300)
  fig.axes().set_axis_off()
  fig.set_x_limits(-0.25, 2.25)
  fig.set_y_limits(-0.25, 2.25)
  if case == 0 {
    fig.tripcolor(
      [0.0, 2.0, 2.0, 0.0, 1.0],
      [0.0, 0.0, 2.0, 2.0, 1.0],
      [[0, 1, 4], [1, 2, 4], [2, 3, 4], [3, 0, 4]],
      [10.0, 20.0, 30.0, 40.0],
      vmin=0.0,
      vmax=40.0,
      mask=[false, true, false, false],
      label="Face scalars",
    )
  } else {
    let xs = if case == 1 {
      [0.0, 2.0, 2.0, 0.0, 1.0]
    } else {
      [0.0, 2.0, 0.0, 2.0]
    }
    let ys = if case == 1 {
      [0.0, 0.0, 2.0, 2.0, 1.0]
    } else {
      [0.0, 0.0, 2.0, 2.0]
    }
    let faces = if case == 1 {
      [[0, 1, 4], [1, 2, 4], [2, 3, 4], [3, 0, 4]]
    } else {
      [[0, 1, 2], [1, 3, 2], [0, 1, 3], [0, 3, 2]]
    }
    let mesh = triangulation(xs, ys, triangles=faces, mask=[
      false, false, false, false,
    ])
    if case == 1 {
      fig.tripcolor_triangulation(
        mesh,
        [0.0, 3.0, 6.0, 9.0, 12.0],
        vmin=0.0,
        vmax=12.0,
        label="Vertex arithmetic means",
      )
    } else {
      fig
      .axes()
      .tripcolor_triangulation(
        mesh,
        [2.0, 5.0, 11.0, 17.0],
        vmin=0.0,
        vmax=20.0,
        label="Equal counts choose faces",
      )
    }
  }
  fig
}

///|
fn tricolor_pick(
  frame : @drawing.Drawing,
  x : Double,
  y : Double,
  mode : @drawing.HitMode,
) -> @drawing.HitInfo? {
  match frame.hit_test(84.8 + x * 115.2, 225.2 - y * 75.2, radius=0.0, mode~) {
    Some(point) => frame.hit_info(point)
    None => None
  }
}

///|
test "tripcolor actual triangles retain original face holes value vertices mode and immutable call label" {
  for case in 0..<3 {
    let fig = tricolor_control_figure(case)
    let frame = fig.to_drawing()
    let slots = if case == 0 { [0, 2, 3] } else { [0, 1, 2, 3] }
    let triples = if case == 2 {
      [(0, 1, 2), (1, 3, 2), (0, 1, 3), (0, 3, 2)]
    } else {
      [(0, 1, 4), (1, 2, 4), (2, 3, 4), (3, 0, 4)]
    }
    let expected = if case == 0 {
      [10.0, 20.0, 30.0, 40.0]
    } else if case == 1 {
      [5.0, 7.0, 9.0, 7.0]
    } else {
      [2.0, 5.0, 11.0, 17.0]
    }
    let label = [
        "Face scalars", "Vertex arithmetic means", "Equal counts choose faces",
      ][case]
    assert_eq(frame.svg(), fig.to_svg_checked())
    assert_eq(fig.containers().length(), 0)
    assert_eq(frame.targets().length(), slots.length())
    for artist_index, target in frame.targets() {
      let info = target.info
      assert_eq(
        (
          info.kind,
          info.value,
          info.point.point_index,
          info.point.artist_index,
          info.series,
        ),
        (
          Tripcolor,
          expected[slots[artist_index]],
          slots[artist_index],
          artist_index,
          label,
        ),
      )
      assert_eq(
        info.tricolor,
        Some(
          @drawing.tricolor_info(
            triples[slots[artist_index]],
            vertex_mean=case == 1,
          ),
        ),
      )
      assert_eq(
        (info.cell, info.interval, info.fraction, info.band, info.vector),
        (None, None, None, None, None),
      )
      guard target.shape is FilledRegion(region) else { fail("FilledRegion") }
      assert_eq(region.even_odd(), false)
      assert_eq(region.rings().length(), 1)
      assert_eq(region.rings()[0].length(), 3)
    }
    for mode in [@drawing.HitMode::Nearest, XNearest] {
      if case < 2 {
        for (x, y, slot) in [(1.0, 0.3, 0), (1.0, 1.7, 2), (0.3, 1.0, 3)] {
          let info = tricolor_pick(frame, x, y, mode).unwrap()
          assert_eq(
            (info.point.point_index, info.value),
            (slot, expected[slot]),
          )
        }
        if case == 0 {
          assert_eq(tricolor_pick(frame, 1.7, 1.0, mode), None)
          assert_eq(
            tricolor_pick(frame, 0.15, 0.9, mode).unwrap().point.point_index,
            3,
          )
        } else {
          assert_eq(tricolor_pick(frame, 1.7, 1.0, mode).unwrap().value, 7.0)
          assert_eq(tricolor_pick(frame, 0.3, 1.0, mode).unwrap().value, 7.0)
        }
      } else {
        assert_eq(
          tricolor_pick(frame, 1.5, 0.25, mode).unwrap().point.point_index,
          2,
        )
        assert_eq(
          tricolor_pick(frame, 0.25, 0.75, mode).unwrap().point.point_index,
          3,
        )
      }
      assert_eq(tricolor_pick(frame, 0.05, 2.1, mode), None)
    }
  }
}

///|
test "tripcolor input and public region getter aliases cannot mutate original or old frame metadata" {
  let xs = [0.0, 2.0, 0.0]
  let ys = [0.0, 0.0, 2.0]
  let faces = [[0, 1, 2]]
  let values = [7.0]
  let mask = [false]
  let fig = figure(width=400, height=300)
  fig.set_x_limits(-0.25, 2.25)
  fig.set_y_limits(-0.25, 2.25)
  fig.tripcolor(xs, ys, faces, values, mask~, label="Original face")
  let old = fig.to_drawing()
  xs[0] = 50.0
  ys.clear()
  faces[0][0] = 2
  values[0] = 100.0
  mask[0] = true
  assert_eq(fig.to_drawing().targets(), old.targets())
  guard old.targets()[0].shape is FilledRegion(region) else {
    fail("FilledRegion")
  }
  let rings = region.rings()
  rings[0][0] = (100.0, 100.0)
  rings.clear()
  for mode in [@drawing.HitMode::Nearest, XNearest] {
    let info = tricolor_pick(old, 0.3, 0.3, mode).unwrap()
    assert_eq(info.value, 7.0)
    assert_eq(info.tricolor.unwrap().vertices, (0, 1, 2))
  }
}
