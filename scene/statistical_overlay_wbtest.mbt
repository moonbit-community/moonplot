///|
test "statistical overlay: later error centers arms and caps remain selectable above bars while later bars cover them" {
  for error_first in [false, true] {
    let (fig, ax) = errorbar_axes()
    if error_first {
      ax.errorbar([1.0], [4.0], yerr=[2.0], label="Measured")
      ax.bar([@core.point(1.0, 6.0)], label="Base")
    } else {
      ax.bar([@core.point(1.0, 6.0)], label="Base")
      ax.errorbar([1.0], [4.0], yerr=[2.0], label="Measured")
    }
    let frame = fig.to_drawing()
    assert_eq(frame.svg(), fig.to_svg_checked())
    for (x, y) in [(100.0, 100.0), (100.0, 120.0), (97.0, 160.0)] {
      for mode in [@drawing.HitMode::Nearest, XNearest] {
        let point = frame.hit_test(x, y, radius=0.0, mode~).unwrap()
        let info = frame.hit_info(point).unwrap()
        if error_first {
          assert_eq(info.kind, @drawing.HitKind::Bar)
          assert_eq(info.series, "Base")
        } else {
          assert_eq(info.kind, @drawing.HitKind::ErrorBar)
          assert_eq(info.series, "Measured")
          assert_eq(info.error.unwrap().y_range, (2.0, 6.0))
        }
      }
    }
  }
}

///|
test "statistical overlay: error overlays keep XNearest centers distinct from nearest long error arms" {
  for band in [false, true] {
    let (fig, ax) = errorbar_axes()
    if band {
      ax.fill_between([2.4, 3.2], [0.0, 0.0], [10.0, 10.0], label="Band")
    } else {
      ax.bar([@core.point(2.8, 10.0)], label="Base")
    }
    ax.errorbar([1.0, 3.0], [2.0, 8.0], xerr=[2.0, 0.0], label="Measured")
    let frame = fig.to_drawing()
    let nearest = frame.hit_test(280.0, 160.0, radius=0.0).unwrap()
    assert_eq((nearest.point_index, nearest.data_x), (0, 1.0))
    let snapped = frame
      .hit_test(280.0, 160.0, radius=0.0, mode=@drawing.HitMode::XNearest)
      .unwrap()
    assert_eq((snapped.point_index, snapped.data_x), (1, 3.0))
    assert_eq(frame.hit_info(snapped).unwrap().series, "Measured")
    // Unpainted space in the underlying region does not activate an overlay.
    let plain = frame
      .hit_test(280.0, 100.0, radius=0.0, mode=@drawing.HitMode::XNearest)
      .unwrap()
    assert_eq(
      frame.hit_info(plain).unwrap().kind,
      if band {
        @drawing.HitKind::Area
      } else {
        Bar
      },
    )
  }
}

///|
test "statistical overlay: unrelated later error series cannot steal an activated overlay XNearest" {
  let (fig, ax) = errorbar_axes()
  ax.bar([@core.point(2.8, 10.0)], label="Base")
  ax.errorbar([1.0, 3.0], [2.0, 8.0], xerr=[2.0, 0.0], label="Measured")
  ax.errorbar([2.8], [5.0], label="Unrelated")
  let frame = fig.to_drawing()
  let point = frame
    .hit_test(280.0, 160.0, radius=0.0, mode=@drawing.HitMode::XNearest)
    .unwrap()
  assert_eq((point.point_index, point.data_x), (1, 3.0))
  assert_eq(frame.hit_info(point).unwrap().series, "Measured")
}

///|
test "statistical overlay: overlay proximity uses CSS pixels and leaves region values available beyond the radius" {
  let (fig, ax) = errorbar_axes()
  ax.bar([@core.point(1.0, 6.0)], label="Base")
  ax.errorbar([1.0], [4.0], yerr=[2.0], label="Measured")
  let frame = fig.to_drawing()
  for mode in [@drawing.HitMode::Nearest, XNearest] {
    for (width, client_x) in [(200.0, 62.0), (300.0, 112.0)] {
      let near = frame
        .hit_test_client(
          client_x,
          70.0,
          10.0,
          20.0,
          width,
          100.0,
          radius=2.0,
          mode~,
        )
        .unwrap()
      assert_eq(frame.hit_info(near).unwrap().kind, @drawing.HitKind::ErrorBar)
      let far = frame
        .hit_test_client(
          client_x,
          70.0,
          10.0,
          20.0,
          width,
          100.0,
          radius=1.99,
          mode~,
        )
        .unwrap()
      assert_eq(frame.hit_info(far).unwrap().kind, @drawing.HitKind::Bar)
    }
  }
}

///|
test "statistical overlay: box whiskers caps and outliers above a filled region preserve typed part identity" {
  for box_first in [false, true] {
    let (fig, ax) = interactive_box_axes()
    ax.legend([])
    if box_first {
      ignore(
        ax.boxplot([[1.0, 2.0, 3.0, 4.0, 5.0, 20.0]], label="Distribution"),
      )
      ax.fill_between([0.0, 3.0], [0.0, 0.0], [25.0, 25.0], label="Band")
    } else {
      ax.fill_between([0.0, 3.0], [0.0, 0.0], [25.0, 25.0], label="Band")
      ignore(
        ax.boxplot([[1.0, 2.0, 3.0, 4.0, 5.0, 20.0]], label="Distribution"),
      )
    }
    let frame = fig.to_drawing()
    let artist = if box_first { 0 } else { 1 }
    for part in [@drawing.BoxPart::LowerWhisker, UpperCap, Outlier(20.0)] {
      let target = find_box_target(frame, part, artist~)
      let point = target.info.point
      for mode in [@drawing.HitMode::Nearest, XNearest] {
        let hit = frame
          .hit_test(point.screen_x, point.screen_y, radius=0.0, mode~)
          .unwrap()
        let info = frame.hit_info(hit).unwrap()
        if box_first {
          assert_eq(info.kind, @drawing.HitKind::Area)
        } else {
          assert_eq(info.kind, @drawing.HitKind::BoxPlot)
          assert_eq(info.box.unwrap().part, part)
        }
      }
    }
  }
}
