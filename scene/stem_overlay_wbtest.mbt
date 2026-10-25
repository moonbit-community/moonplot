///|
fn m8_overlay_stem(ax : Axes, horizontal : Bool) -> Unit raise {
  ax.stem(
    [3.0],
    locs=[2.0],
    bottom=1.0,
    orientation=if horizontal { "horizontal" } else { "vertical" },
    label="Impulses",
  )
}

///|
test "stem overlay: actual rods and filled regions preserve either paint order" {
  for horizontal in [false, true] {
    for area_last in [false, true] {
      let (fig, ax) = distribution_overlay_axes()
      if area_last {
        m8_overlay_stem(ax, horizontal)
      }
      ax.fill_between([0.0, 4.0], [0.0, 0.0], [4.0, 4.0], label="Background")
      if !area_last {
        m8_overlay_stem(ax, horizontal)
      }
      let frame = fig.to_drawing()
      assert_eq(frame.svg(), fig.to_svg_checked())
      for mode in [@drawing.HitMode::Nearest, XNearest] {
        let info = frame
          .hit_info(frame.hit_test(200.0, 200.0, radius=0.0, mode~).unwrap())
          .unwrap()
        assert_eq(
          info.kind,
          if area_last {
            @drawing.HitKind::Area
          } else {
            @drawing.HitKind::Stem
          },
        )
        assert_eq(
          info.series,
          if area_last {
            "Background"
          } else {
            "Impulses"
          },
        )
        if !area_last {
          assert_eq((info.point.point_index, info.value), (0, 3.0))
          assert_eq(
            (info.point.data_x, info.point.data_y),
            if horizontal {
              (3.0, 2.0)
            } else {
              (2.0, 3.0)
            },
          )
          let band = info.band.unwrap()
          assert_eq(
            (band.lower, band.upper, band.horizontal),
            (1.0, 3.0, horizontal),
          )
        }
      }
    }
  }
}

///|
test "stem overlay: actual rods and hexagonal faces retain source metadata" {
  let (_, reference_ax) = distribution_overlay_axes()
  let center = distribution_overlay_hex(reference_ax)
  for hex_last in [false, true] {
    let (fig, ax) = distribution_overlay_axes()
    if !hex_last {
      ignore(distribution_overlay_hex(ax))
    }
    ax.stem(
      [center.y() + 0.5],
      locs=[center.x()],
      bottom=center.y() - 0.5,
      label="Impulses",
    )
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
      assert_eq(
        info.kind,
        if hex_last {
          @drawing.HitKind::Hexbin
        } else {
          @drawing.HitKind::Stem
        },
      )
      if hex_last {
        assert_eq(info.hexbin.unwrap().count, 2)
      } else {
        assert_eq((info.point.point_index, info.value), (0, center.y() + 0.5))
        let band = info.band.unwrap()
        assert_eq(
          (band.lower, band.upper),
          (center.y() - 0.5, center.y() + 0.5),
        )
      }
    }
  }
}

///|
test "stem overlay: crossing step and rod retain actual later stroke semantics" {
  for step_last in [false, true] {
    let (fig, ax) = distribution_overlay_axes()
    if step_last {
      m8_overlay_stem(ax, false)
    }
    ax.step([0.0, 4.0], [2.0, 2.0], where_="post", label="Steps")
    if !step_last {
      m8_overlay_stem(ax, false)
    }
    let frame = fig.to_drawing()
    for mode in [@drawing.HitMode::Nearest, XNearest] {
      let info = frame
        .hit_info(frame.hit_test(200.0, 200.0, radius=0.0, mode~).unwrap())
        .unwrap()
      assert_eq(info.point.point_index, 0)
      if step_last {
        assert_eq(
          (info.kind, info.value, info.interval),
          (@drawing.HitKind::Step, 2.0, Some((0.0, 4.0))),
        )
      } else {
        assert_eq((info.kind, info.value), (@drawing.HitKind::Stem, 3.0))
        let band = info.band.unwrap()
        assert_eq((band.lower, band.upper), (1.0, 3.0))
      }
    }
  }
}
