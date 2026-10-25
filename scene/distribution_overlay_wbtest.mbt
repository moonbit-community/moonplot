///|
fn distribution_overlay_axes() -> (Figure, Axes) raise {
  let fig = figure(width=400, height=400)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  ax.set_x_limits(0.0, 4.0)
  ax.set_y_limits(0.0, 4.0)
  ax.legend([])
  (fig, ax)
}

///|
fn distribution_overlay_hex(ax : Axes) -> @core.Point raise {
  let result = ax.hexbin(
    [0.8, 1.2],
    [1.6, 2.2],
    gridsize=2,
    extent=[0.0, 4.0, 0.0, 4.0],
    color="#e4efeb",
    label="Bins",
  )
  assert_eq(result.counts(), [2])
  result.centers()[0]
}

///|
fn distribution_overlay_violin(
  ax : Axes,
  horizontal : Bool,
  center : @core.Point,
) -> Unit raise {
  ignore(
    ax.violinplot(
      if horizontal {
        [[center.x() - 0.5, center.x(), center.x() + 0.5]]
      } else {
        [[center.y() - 0.5, center.y(), center.y() + 0.5]]
      },
      positions=if horizontal { [center.y()] } else { [center.x()] },
      width=1.0,
      horizontal~,
      points=5,
      showmedians=true,
      showextrema=false,
      label="Distribution",
    ),
  )
}

///|
test "distribution overlay: actual violin summaries above hexagons and later hexagons preserve paint order" {
  for horizontal in [false, true] {
    for hex_last in [false, true] {
      let (reference, reference_ax) = distribution_overlay_axes()
      let center = distribution_overlay_hex(reference_ax)
      let (x, y) = if horizontal {
        (center.x() * 100.0, 400.0 - (center.y() - 0.25) * 100.0)
      } else {
        ((center.x() + 0.25) * 100.0, 400.0 - center.y() * 100.0)
      }
      let reference_frame = reference.to_drawing()
      let covered = reference_frame.hit_test(x, y, radius=0.0).unwrap()
      assert_eq(
        reference_frame.hit_info(covered).unwrap().kind,
        @drawing.HitKind::Hexbin,
      )
      let (fig, ax) = distribution_overlay_axes()
      if hex_last {
        distribution_overlay_violin(ax, horizontal, center)
        ignore(distribution_overlay_hex(ax))
      } else {
        ignore(distribution_overlay_hex(ax))
        distribution_overlay_violin(ax, horizontal, center)
      }
      let frame = fig.to_drawing()
      assert_eq(frame.svg(), fig.to_svg_checked())
      // The real median segment lies strictly within the actual hexagon.
      for mode in [@drawing.HitMode::Nearest, XNearest] {
        let point = frame.hit_test(x, y, radius=0.0, mode~).unwrap()
        let info = frame.hit_info(point).unwrap()
        if hex_last {
          assert_eq(info.kind, @drawing.HitKind::Hexbin)
          assert_eq(info.series, "Bins")
          assert_eq(info.hexbin.unwrap().count, 2)
        } else {
          assert_eq(info.kind, @drawing.HitKind::Violin)
          assert_eq(info.series, "Distribution")
          assert_eq(info.violin.unwrap().part, @drawing.ViolinPart::Median)
          assert_eq(
            info.value,
            if horizontal {
              center.x()
            } else {
              center.y()
            },
          )
        }
      }
      assert_eq(frame.hit_test(380.0, 20.0, radius=0.0), None)
    }
  }
}

///|
test "distribution overlay: real errorbar centers remain selectable above hexagon faces in both modes" {
  let (fig, ax) = distribution_overlay_axes()
  let center = distribution_overlay_hex(ax)
  ax.errorbar([center.x()], [center.y()], yerr=[0.5], label="Measured")
  let frame = fig.to_drawing()
  assert_eq(frame.svg(), fig.to_svg_checked())
  for mode in [@drawing.HitMode::Nearest, XNearest] {
    let point = frame
      .hit_test(
        center.x() * 100.0,
        400.0 - center.y() * 100.0,
        radius=0.0,
        mode~,
      )
      .unwrap()
    let info = frame.hit_info(point).unwrap()
    assert_eq(info.kind, @drawing.HitKind::ErrorBar)
    assert_eq(info.series, "Measured")
    assert_eq(info.error.unwrap().y_range, (center.y() - 0.5, center.y() + 0.5))
  }
}
