///|
fn m9_overlay_vector(ax : Axes) -> Unit raise {
  ax.quiver([1.0], [2.0], [2.0], [0.0], label="Velocity")
}

///|
test "quiver overlay: actual vector strokes and filled areas respect either paint order" {
  for area_last in [false, true] {
    let (fig, ax) = distribution_overlay_axes()
    if area_last {
      m9_overlay_vector(ax)
    }
    ax.fill_between([0.0, 4.0], [0.0, 0.0], [4.0, 4.0], label="Background")
    if !area_last {
      m9_overlay_vector(ax)
    }
    let frame = fig.to_drawing()
    assert_eq(frame.svg(), fig.to_svg_checked())
    for mode in [@drawing.HitMode::Nearest, XNearest] {
      let info = frame
        .hit_info(frame.hit_test(200.0, 200.0, radius=0.0, mode~).unwrap())
        .unwrap()
      if area_last {
        assert_eq(info.kind, @drawing.HitKind::Area)
        assert_eq(info.series, "Background")
        assert_eq(
          (info.band.unwrap().lower, info.band.unwrap().upper),
          (0.0, 4.0),
        )
      } else {
        assert_eq(info.kind, @drawing.HitKind::Quiver)
        assert_eq(info.series, "Velocity")
        assert_eq(
          (info.point.point_index, info.point.data_x, info.point.data_y),
          (0, 1.0, 2.0),
        )
        assert_eq(
          (info.vector.unwrap().u, info.vector.unwrap().v, info.value),
          (2.0, 0.0, 0.0),
        )
      }
    }
  }
}

///|
test "quiver overlay: crossed stem rods retain real later component identity" {
  for stem_last in [false, true] {
    let (fig, ax) = distribution_overlay_axes()
    if stem_last {
      m9_overlay_vector(ax)
    }
    ax.stem([3.0], locs=[2.0], bottom=1.0, label="Impulses")
    if !stem_last {
      m9_overlay_vector(ax)
    }
    let frame = fig.to_drawing()
    for mode in [@drawing.HitMode::Nearest, XNearest] {
      let info = frame
        .hit_info(frame.hit_test(200.0, 200.0, radius=0.0, mode~).unwrap())
        .unwrap()
      assert_eq(info.point.point_index, 0)
      if stem_last {
        assert_eq(
          (info.kind, info.value, info.point.artist_index),
          (@drawing.HitKind::Stem, 3.0, 1),
        )
        assert_eq(
          (info.band.unwrap().lower, info.band.unwrap().upper),
          (1.0, 3.0),
        )
      } else {
        assert_eq(
          (info.kind, info.value, info.point.artist_index),
          (@drawing.HitKind::Quiver, 0.0, 3),
        )
        assert_eq((info.vector.unwrap().u, info.vector.unwrap().v), (2.0, 0.0))
      }
    }
  }
}

///|
test "quiver overlay: real hexagon and shaft preserve either source" {
  let (_, reference_ax) = distribution_overlay_axes()
  let center = distribution_overlay_hex(reference_ax)
  for hex_last in [false, true] {
    let (fig, ax) = distribution_overlay_axes()
    if !hex_last {
      ignore(distribution_overlay_hex(ax))
    }
    ax.quiver([center.x() - 0.5], [center.y()], [1.0], [0.0], label="Velocity")
    if hex_last {
      ignore(distribution_overlay_hex(ax))
    }
    let frame = fig.to_drawing()
    for mode in [@drawing.HitMode::Nearest, XNearest] {
      let info = frame
        .hit_info(
          frame
          .hit_test(
            center.x() * 100.0,
            400.0 - center.y() * 100.0,
            radius=0.0,
            mode~,
          )
          .unwrap(),
        )
        .unwrap()
      if hex_last {
        assert_eq(info.kind, @drawing.HitKind::Hexbin)
        assert_eq(info.hexbin.unwrap().count, 2)
      } else {
        assert_eq(info.kind, @drawing.HitKind::Quiver)
        assert_eq(
          (info.point.point_index, info.point.data_x, info.point.data_y),
          (0, center.x() - 0.5, center.y()),
        )
        assert_eq(
          (info.vector.unwrap().u, info.vector.unwrap().v, info.value),
          (1.0, 0.0, 0.0),
        )
      }
    }
  }
}
