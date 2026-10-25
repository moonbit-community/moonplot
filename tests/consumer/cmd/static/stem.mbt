///|
fn verify_stem_consumer() -> Unit raise {
  for horizontal in [false, true] {
    for reverse in [false, true] {
      let figure = @plot.figure(width=400, height=240)
      let axes = figure.add_axes(0.0, 0.0, 1.0, 1.0)
      let (xmin, xmax, ymin, ymax) = if horizontal {
        (-4.0, 12.0, 0.0, 8.0)
      } else {
        (0.0, 8.0, -4.0, 12.0)
      }
      axes.set_x_limits(
        if reverse {
          xmax
        } else {
          xmin
        },
        if reverse {
          xmin
        } else {
          xmax
        },
      )
      axes.set_y_limits(
        if reverse {
          ymax
        } else {
          ymin
        },
        if reverse {
          ymin
        } else {
          ymax
        },
      )
      axes.legend([])
      let heads = [4.0, -2.0, 8.0]
      let locs = [1.0, 3.0, 6.0]
      axes.stem(
        heads,
        locs~,
        bottom=1.0,
        orientation=if horizontal { "horizontal" } else { "vertical" },
        label="Impulses",
      )
      let grouped = axes.containers()[0]
      assert_true(grouped.kind() is Stem)
      assert_eq(grouped.label(), "Impulses")
      assert_eq(grouped.artists().length(), 5)
      heads[0] = 4000.0
      locs[0] = 1000.0
      let frame = figure.to_drawing()
      assert_eq(frame.svg(), figure.to_svg_checked())
      assert_eq(frame.targets().length(), 6)
      for target in frame.targets() {
        let info = target.info
        let i = info.point.point_index
        assert_eq(info.kind, @plot.HitKind::Stem)
        assert_eq(info.series, "Impulses")
        assert_true(i >= 0 && i < 3)
        let value = [4.0, -2.0, 8.0][i]
        let location = [1.0, 3.0, 6.0][i]
        assert_eq(info.value, value)
        assert_eq(
          (info.point.data_x, info.point.data_y),
          if horizontal {
            (value, location)
          } else {
            (location, value)
          },
        )
        assert_eq(info.interval, None)
        let band = info.band.unwrap()
        assert_eq(
          (band.lower, band.upper, band.horizontal, band.stacked),
          (1.0, value, horizontal, false),
        )
        assert_eq(frame.hit_info(info.point), Some(info))
        match target.shape {
          @plot.HitShape::Point => assert_eq(info.point.artist_index, 4)
          Segment(_, _, _, _) => assert_eq(info.point.artist_index, i)
          _ => fail("Stem must use its actual rod segment or head point")
        }
      }
      let (rod_x, rod_y) = if horizontal {
        (162.5, 210.0)
      } else {
        (50.0, 142.5)
      }
      let (head_x, head_y) = if horizontal {
        (200.0, 210.0)
      } else {
        (50.0, 120.0)
      }
      let (blank_x, blank_y) = if horizontal {
        (125.0, 180.0)
      } else {
        (100.0, 165.0)
      }
      for mode in [@plot.HitMode::Nearest, XNearest] {
        let actual_x = if reverse { 400.0 - rod_x } else { rod_x }
        let actual_y = if reverse { 240.0 - rod_y } else { rod_y }
        let rod = frame
          .hit_info(
            frame.hit_test(actual_x, actual_y, radius=0.0, mode~).unwrap(),
          )
          .unwrap()
        assert_eq(
          (rod.point.point_index, rod.point.artist_index, rod.value),
          (0, 0, 4.0),
        )
        let actual_x = if reverse { 400.0 - head_x } else { head_x }
        let actual_y = if reverse { 240.0 - head_y } else { head_y }
        let head = frame
          .hit_info(
            frame.hit_test(actual_x, actual_y, radius=0.0, mode~).unwrap(),
          )
          .unwrap()
        assert_eq(
          (head.point.point_index, head.point.artist_index, head.value),
          (0, 4, 4.0),
        )
        assert_eq(head.band, rod.band)
        let actual_x = if reverse { 400.0 - blank_x } else { blank_x }
        let actual_y = if reverse { 240.0 - blank_y } else { blank_y }
        assert_eq(frame.hit_test(actual_x, actual_y, radius=0.0, mode~), None)
      }
    }
  }
  let figure = @plot.figure(width=400, height=240)
  let axes = figure.add_axes(0.0, 0.0, 1.0, 1.0)
  axes.set_x_limits(0.0, 4.0)
  axes.set_y_limits(0.0, 8.0)
  axes.legend([])
  axes.stem([4.0, 0.0 / 0.0, 2.0], locs=[1.0, 2.0, 3.0], bottom=2.0)
  let frame = figure.to_drawing()
  assert_eq(frame.targets().length(), 3)
  let mut rods = 0
  let mut heads = 0
  for target in frame.targets() {
    assert_eq(target.info.kind, @plot.HitKind::Stem)
    assert_true(
      target.info.point.point_index == 0 || target.info.point.point_index == 2,
    )
    match target.shape {
      @plot.HitShape::Point => heads += 1
      Segment(_, _, _, _) => {
        rods += 1
        assert_eq(target.info.point.point_index, 0)
      }
      _ => fail("Missing or zero-height stem must not invent another shape")
    }
  }
  assert_eq((rods, heads), (1, 2))
  let clipped = @plot.figure(width=400, height=240)
  let clip_axes = clipped.add_axes(0.0, 0.0, 1.0, 1.0)
  clip_axes.set_x_limits(0.0, 4.0)
  clip_axes.set_y_limits(0.0, 10.0)
  clip_axes.legend([])
  clip_axes.stem([20.0], locs=[1.0], bottom=-10.0)
  let clip_frame = clipped.to_drawing()
  assert_eq(clip_frame.targets().length(), 1)
  for mode in [@plot.HitMode::Nearest, XNearest] {
    let info = clip_frame
      .hit_info(clip_frame.hit_test(100.0, 120.0, radius=0.0, mode~).unwrap())
      .unwrap()
    assert_eq(
      (info.point.point_index, info.point.data_x, info.point.data_y, info.value),
      (0, 1.0, 20.0, 20.0),
    )
    let band = info.band.unwrap()
    assert_eq((band.lower, band.upper), (-10.0, 20.0))
  }
  let log = @plot.figure(width=400, height=240)
  let log_axes = log.add_axes(0.0, 0.0, 1.0, 1.0)
  log_axes.set_x_limits(0.0, 4.0)
  log_axes.set_y_scale(@plot.log_scale())
  log_axes.set_y_limits(1.0, 100.0)
  log_axes.legend([])
  log_axes.stem([10.0], locs=[2.0], bottom=0.0)
  let log_frame = log.to_drawing()
  assert_eq(log_frame.targets().length(), 1)
  assert_eq(log_frame.targets()[0].shape, @plot.HitShape::Point)
  for mode in [@plot.HitMode::Nearest, XNearest] {
    let info = log_frame
      .hit_info(log_frame.hit_test(200.0, 120.0, radius=1.0e-6, mode~).unwrap())
      .unwrap()
    assert_eq(
      (info.point.artist_index, info.point.data_y, info.value),
      (2, 10.0, 10.0),
    )
    assert_eq(log_frame.hit_test(200.0, 210.0, radius=0.0, mode~), None)
  }
}
