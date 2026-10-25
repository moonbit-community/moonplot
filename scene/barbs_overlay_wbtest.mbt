///|
fn m10_flag_overlay(ax : Axes) -> Unit raise {
  ax.barbs_with_options(
    [1.0],
    [2.0],
    [2.0],
    [0.0],
    half_increment=0.5,
    full_increment=1.0,
    flag_increment=2.0,
    barb_length=1.0,
    linewidth=0.0,
    label="Wind flag",
  )
}

///|
test "barbs overlay: actual zero-width flag fill and area preserve either paint order" {
  for area_last in [false, true] {
    let (fig, ax) = distribution_overlay_axes()
    if area_last {
      m10_flag_overlay(ax)
    }
    ax.fill_between([0.0, 4.0], [0.0, 0.0], [4.0, 4.0], label="Background")
    if !area_last {
      m10_flag_overlay(ax)
    }
    let frame = fig.to_drawing()
    assert_eq(frame.svg(), fig.to_svg_checked())
    for mode in [@drawing.HitMode::Nearest, XNearest] {
      let info = frame
        .hit_info(frame.hit_test(290.0, 180.0, radius=0.0, mode~).unwrap())
        .unwrap()
      if area_last {
        assert_eq(
          (info.kind, info.series),
          (@drawing.HitKind::Area, "Background"),
        )
        assert_eq(
          (info.band.unwrap().lower, info.band.unwrap().upper),
          (0.0, 4.0),
        )
      } else {
        assert_eq(
          (info.kind, info.series),
          (@drawing.HitKind::Barbs, "Wind flag"),
        )
        assert_eq((info.point.artist_index, info.point.point_index), (2, 0))
        assert_eq((info.point.data_x, info.point.data_y), (1.0, 2.0))
        assert_eq(
          (info.vector.unwrap().u, info.vector.unwrap().v, info.value),
          (2.0, 0.0, 0.0),
        )
      }
    }
  }
}

///|
test "barbs overlay: filled calm disk and real hexagon retain original independent data" {
  let (_, reference_ax) = distribution_overlay_axes()
  let center = distribution_overlay_hex(reference_ax)
  for hex_last in [false, true] {
    let (fig, ax) = distribution_overlay_axes()
    if !hex_last {
      ignore(distribution_overlay_hex(ax))
    }
    ax.barbs_with_options(
      [center.x() - 0.05],
      [center.y() - 0.1],
      [0.1],
      [0.2],
      pivot="middle",
      barb_length=12.0,
      linewidth=0.0,
      label="Rounded wind",
    )
    if hex_last {
      ignore(distribution_overlay_hex(ax))
    }
    let frame = fig.to_drawing()
    assert_eq(frame.svg(), fig.to_svg_checked())
    for mode in [@drawing.HitMode::Nearest, XNearest] {
      let info = frame
        .hit_info(
          frame
          .hit_test(
            center.x() * 100.0 + 2.0,
            400.0 - center.y() * 100.0,
            radius=0.0,
            mode~,
          )
          .unwrap(),
        )
        .unwrap()
      if hex_last {
        assert_eq((info.kind, info.series), (@drawing.HitKind::Hexbin, "Bins"))
        assert_eq(info.hexbin.unwrap().count, 2)
      } else {
        assert_eq(
          (info.kind, info.series),
          (@drawing.HitKind::Barbs, "Rounded wind"),
        )
        assert_eq((info.point.artist_index, info.point.point_index), (1, 0))
        assert_eq(
          (info.point.data_x, info.point.data_y),
          (center.x() - 0.05, center.y() - 0.1),
        )
        assert_eq(
          (info.vector.unwrap().u, info.vector.unwrap().v, info.value),
          (0.1, 0.2, 0.2),
        )
      }
    }
  }
}

///|
test "barbs overlay: ordinary samples preserve nearest ties and XNearest fallback priority" {
  for line_last in [false, true] {
    let (fig, ax) = distribution_overlay_axes()
    if line_last {
      ax.barbs([1.0], [2.0], [2.0], [0.0], label="Wind")
    }
    ax.plot([2.0, 2.0, 2.0], [1.0, 2.0, 3.0], label="Measurements")
    if !line_last {
      ax.barbs([1.0], [2.0], [2.0], [0.0], label="Wind")
    }
    let frame = fig.to_drawing()
    for mode in [@drawing.HitMode::Nearest, XNearest] {
      let info = frame
        .hit_info(frame.hit_test(200.0, 200.0, radius=0.0, mode~).unwrap())
        .unwrap()
      if line_last && mode == @drawing.HitMode::Nearest {
        assert_eq(
          (info.kind, info.series),
          (@drawing.HitKind::Line, "Measurements"),
        )
      } else {
        assert_eq((info.kind, info.series), (@drawing.HitKind::Barbs, "Wind"))
        // The middle feather root coincides with this point and is later than the shaft.
        // XNearest keeps its existing physical hit before generic Line snapping.
        assert_eq(
          (info.point.artist_index, info.point.point_index),
          (if line_last { 2 } else { 3 }, 0),
        )
        assert_eq((info.point.data_x, info.point.data_y), (1.0, 2.0))
        assert_eq((info.vector.unwrap().u, info.vector.unwrap().v), (2.0, 0.0))
      }
    }
  }
}
