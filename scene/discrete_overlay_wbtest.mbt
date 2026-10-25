///|
fn m7_overlay_plateau(
  frame : @drawing.Drawing,
  kind : @drawing.HitKind,
  index : Int32,
  ratio : Double,
) -> (Double, Double) raise {
  for target in frame.targets() {
    if target.info.kind == kind && target.info.point.point_index == index {
      if target.shape is @drawing.HitShape::Segment(x0, y0, x1, y1) {
        if y0 == y1 && x0 != x1 {
          return (x0 + (x1 - x0) * ratio, y0)
        }
      }
    }
  }
  fail("No actual discrete plateau in this frame")
}

///|
fn m7_overlay_step(ax : Axes) -> Unit raise {
  ax.step([0.0, 2.0, 4.0], [2.0, 2.0, 3.0], where_="post", label="Steps")
}

///|
test "discrete overlay: later actual step strokes and later area faces retain paint order" {
  for area_last in [false, true] {
    let (fig, ax) = distribution_overlay_axes()
    if area_last {
      m7_overlay_step(ax)
    }
    ax.fill_between([0.0, 4.0], [0.0, 0.0], [4.0, 4.0], label="Background")
    if !area_last {
      m7_overlay_step(ax)
    }
    let frame = fig.to_drawing()
    assert_eq(frame.svg(), fig.to_svg_checked())
    let (x, y) = m7_overlay_plateau(frame, @drawing.HitKind::Step, 0, 0.5)
    for mode in [@drawing.HitMode::Nearest, XNearest] {
      let picked = frame.hit_test(x, y, radius=0.0, mode~).unwrap()
      let info = frame.hit_info(picked).unwrap()
      assert_eq(
        info.kind,
        if area_last {
          @drawing.HitKind::Area
        } else {
          @drawing.HitKind::Step
        },
      )
      assert_eq(info.series, if area_last { "Background" } else { "Steps" })
      if !area_last {
        assert_eq(
          (info.point.point_index, info.value, info.interval),
          (0, 2.0, Some((0.0, 2.0))),
        )
      }
    }
  }
}

///|
test "discrete overlay: step plateau and real hexbin faces retain source semantics in either order" {
  for hex_last in [false, true] {
    let (fig, ax) = distribution_overlay_axes()
    if hex_last {
      m7_overlay_step(ax)
    }
    ignore(distribution_overlay_hex(ax))
    if !hex_last {
      m7_overlay_step(ax)
    }
    let frame = fig.to_drawing()
    let (x, y) = m7_overlay_plateau(frame, @drawing.HitKind::Step, 0, 0.5)
    for mode in [@drawing.HitMode::Nearest, XNearest] {
      let info = frame
        .hit_info(frame.hit_test(x, y, radius=0.0, mode~).unwrap())
        .unwrap()
      assert_eq(
        info.kind,
        if hex_last {
          @drawing.HitKind::Hexbin
        } else {
          @drawing.HitKind::Step
        },
      )
      if hex_last {
        assert_eq(info.hexbin.unwrap().count, 2)
      } else {
        assert_eq(info.point.point_index, 0)
      }
    }
  }
}

///|
fn m7_overlay_ecdf(ax : Axes) -> Unit raise {
  ignore(ax.ecdf([1.0, 3.0], label="Cumulative"))
}

///|
test "discrete overlay: actual ECDF plateau and filled stairs preserve before-after probability and interval" {
  for stairs_last in [false, true] {
    let (fig, ax) = distribution_overlay_axes()
    if stairs_last {
      m7_overlay_ecdf(ax)
    }
    ax.stairs([0.8, 0.8], edges=[0.0, 2.0, 4.0], fill=true, label="Intervals")
    if !stairs_last {
      m7_overlay_ecdf(ax)
    }
    let frame = fig.to_drawing()
    assert_eq(frame.svg(), fig.to_svg_checked())
    let (x, y) = m7_overlay_plateau(frame, @drawing.HitKind::Ecdf, 0, 0.25)
    for mode in [@drawing.HitMode::Nearest, XNearest] {
      let info = frame
        .hit_info(frame.hit_test(x, y, radius=0.0, mode~).unwrap())
        .unwrap()
      assert_eq(info.point.point_index, 0)
      if stairs_last {
        assert_eq(info.kind, @drawing.HitKind::Stairs)
        assert_eq((info.value, info.interval), (0.8, Some((0.0, 2.0))))
      } else {
        assert_eq(info.kind, @drawing.HitKind::Ecdf)
        assert_eq((info.value, info.fraction), (1.0, Some(0.5)))
        let band = info.band.unwrap()
        assert_eq((band.lower, band.upper), (0.0, 0.5))
      }
    }
  }
}
