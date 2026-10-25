///|
fn tripcolor_consumer_fixture(case : Int32) -> @plot.Figure raise {
  let xs = if case == 2 {
    [0.0, 2.0, 0.0, 2.0]
  } else {
    [0.0, 2.0, 2.0, 0.0, 1.0]
  }
  let ys = if case == 2 {
    [0.0, 0.0, 2.0, 2.0]
  } else {
    [0.0, 0.0, 2.0, 2.0, 1.0]
  }
  let triangles = if case == 2 {
    [[0, 1, 2], [1, 3, 2], [0, 1, 3], [0, 3, 2]]
  } else {
    [[0, 1, 4], [1, 2, 4], [2, 3, 4], [3, 0, 4]]
  }
  let values = if case == 0 {
    [10.0, 20.0, 30.0, 40.0]
  } else if case == 1 {
    [0.0, 3.0, 6.0, 9.0, 12.0]
  } else {
    [2.0, 5.0, 11.0, 17.0]
  }
  let mask = if case == 0 { [false, true, false, false] } else { [] }
  let label = if case == 0 {
    "Face scalars"
  } else if case == 1 {
    "Vertex arithmetic means"
  } else {
    "Equal counts choose faces"
  }
  let figure = @plot.figure(width=400, height=300)
  figure.axes().set_axis_off()
  figure.set_x_limits(-0.25, 2.25)
  figure.set_y_limits(-0.25, 2.25)
  if case == 0 {
    figure.tripcolor(
      xs,
      ys,
      triangles,
      values,
      vmin=0.0,
      vmax=40.0,
      mask~,
      label~,
    )
  } else {
    let mesh = @scene.triangulation(xs, ys, triangles~, mask~)
    if case == 1 {
      figure.tripcolor_triangulation(mesh, values, vmin=0.0, vmax=12.0, label~)
    } else {
      figure
      .axes()
      .tripcolor_triangulation(mesh, values, vmin=0.0, vmax=20.0, label~)
    }
  }
  figure
}

///|
fn verify_tripcolor_consumer() -> Unit raise {
  for case in 0..<3 {
    let figure = tripcolor_consumer_fixture(case)
    let frame = figure.to_drawing()
    assert_eq(frame.svg(), figure.to_svg_checked())
    assert_eq(figure.containers().length(), 0)
    let slots = if case == 0 { [0, 2, 3] } else { [0, 1, 2, 3] }
    let triples = if case == 2 {
      [(0, 1, 2), (1, 3, 2), (0, 1, 3), (0, 3, 2)]
    } else {
      [(0, 1, 4), (1, 2, 4), (2, 3, 4), (3, 0, 4)]
    }
    let values = if case == 0 {
      [10.0, 20.0, 30.0, 40.0]
    } else if case == 1 {
      [5.0, 7.0, 9.0, 7.0]
    } else {
      [2.0, 5.0, 11.0, 17.0]
    }
    let label = if case == 0 {
      "Face scalars"
    } else if case == 1 {
      "Vertex arithmetic means"
    } else {
      "Equal counts choose faces"
    }
    let targets = frame.targets()
    assert_eq(targets.length(), slots.length())
    for i, target in targets {
      let slot = slots[i]
      let info = target.info
      assert_eq(
        (info.kind, info.series, info.value),
        (@plot.HitKind::Tripcolor, label, values[slot]),
      )
      assert_eq((info.point.point_index, info.point.artist_index), (slot, i))
      let typed = info.tricolor.unwrap()
      assert_eq((typed.vertices, typed.vertex_mean), (triples[slot], case == 1))
      // Verify the public facade factory and generic optional metadata entry.
      let rebuilt = @drawing.hit_info(
        info.point,
        Tripcolor,
        value=values[slot],
        series=label,
        tricolor=Some(@plot.tricolor_info(triples[slot], vertex_mean=case == 1)),
      )
      assert_eq(rebuilt, info)
      guard target.shape is @plot.HitShape::FilledRegion(region) else {
        fail("Tripcolor did not expose its actual filled triangle")
      }
      assert_eq(region.even_odd(), false)
      let rings = region.rings()
      assert_eq((rings.length(), rings[0].length()), (1, 3))
      let saved = region.rings()
      rings[0].clear()
      rings.clear()
      assert_eq(region.rings(), saved)
    }
    // Screen probes derive from the frozen actual XML and explicit [-.25,2.25]
    // limits. They lie deep inside faces, including real overlapping last paint.
    let probes = if case == 2 {
      [(176.96, 210.16, 2), (107.84, 165.04, 3)]
    } else {
      [
        (200.0, 200.1333333333333, 0),
        (200.0, 99.8666666666667, 2),
        (123.2, 150.0, 3),
      ]
    }
    for mode in [@plot.HitMode::Nearest, XNearest] {
      for (x, y, slot) in probes {
        let info = frame
          .hit_info(frame.hit_test(x, y, radius=0.0, mode~).unwrap())
          .unwrap()
        assert_eq((info.point.point_index, info.value), (slot, values[slot]))
      }
      if case == 0 {
        assert_eq(frame.hit_test(276.8, 150.0, radius=100.0, mode~), None)
        // A bbox corner belongs to real face3 rather than triangle0.
        assert_eq(
          frame.hit_test(102.08, 157.52, radius=0.0, mode~).unwrap().point_index,
          3,
        )
      }
    }
    let old_svg = frame.svg()
    // Figure::artists returns copy_artist snapshots. Editing the public
    // inspection copy must preserve both the live scene and its old frame.
    guard figure.artists()[0] is @plot.Artist::Polygon(points, _) else {
      fail("Expected existing public Polygon")
    }
    points[0] = @plot.point(0.3, 0.3)
    assert_eq(figure.to_drawing().targets(), targets)
    assert_eq(figure.to_drawing().svg(), old_svg)
    assert_eq((frame.svg(), frame.targets()), (old_svg, targets))
  }
}
