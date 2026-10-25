///|
fn errorbar_axes() -> (Figure, Axes) raise {
  let fig = figure(width=400, height=200)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  ax.set_x_limits(0.0, 4.0)
  ax.set_y_limits(0.0, 10.0)
  ax.legend([])
  for axis in [ax.x_axis(), ax.y_axis()] {
    axis.set_locator(@ticker.NullLocator::new().as_locator())
    axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  }
  (fig, ax)
}

///|
test "error bars share original sample semantics across centers whiskers and end caps" {
  let (fig, ax) = errorbar_axes()
  ax.errorbar(
    [1.0, 3.0],
    [4.0, 8.0],
    xerr=[0.5, 0.25],
    yerr=[2.0, 1.0],
    label="Measured",
  )
  let frame = fig.to_drawing()
  assert_eq(frame.svg(), fig.to_svg_checked())
  assert_eq(frame.points().length(), 2)
  assert_eq(frame.targets().length(), 14)
  let first = frame.points()[0]
  assert_eq(
    (first.data_x, first.data_y, first.screen_x, first.screen_y),
    (1.0, 4.0, 100.0, 120.0),
  )
  assert_eq(
    frame.hit_info(first).unwrap().error,
    Some(@drawing.error_info((0.5, 1.5), (2.0, 6.0))),
  )
  assert_eq(frame.hit_info(first).unwrap().series, "Measured")
  for
    (x, y) in [
      (100.0, 120.0),
      (100.0, 145.0),
      (100.0, 90.0),
      (97.0, 160.0),
      (103.0, 80.0),
      (75.0, 120.0),
      (130.0, 120.0),
      (50.0, 117.0),
      (150.0, 123.0),
    ] {
    assert_eq(frame.hit_test(x, y, radius=0.0), Some(first))
    let info = frame.hit_info(frame.hit_test(x, y).unwrap()).unwrap()
    assert_eq(info.kind, @drawing.HitKind::ErrorBar)
    assert_eq(info.value, 4.0)
    assert_eq((info.point.data_x, info.point.data_y), (1.0, 4.0))
  }
  assert_eq(frame.hit_test(97.0, 159.0, radius=0.99), None)
  assert_eq(frame.hit_test(97.0, 159.0, radius=1.0), Some(first))
}

///|
test "disabled zero and missing sample errors preserve source indices and degenerate ranges" {
  let (fig, ax) = errorbar_axes()
  ax.errorbar(
    [1.0, 0.0 / 0.0, 3.0],
    [4.0, 5.0, 8.0],
    xerr=[0.5, 1.0, 0.0],
    label="X only",
  )
  let frame = fig.to_drawing()
  assert_eq(frame.points().map(p => p.point_index), [0, 2])
  assert_eq(frame.targets().length(), 5)
  assert_eq(
    frame.hit_info(frame.points()[0]).unwrap().error,
    Some(@drawing.error_info((0.5, 1.5), (4.0, 4.0))),
  )
  assert_eq(
    frame.hit_info(frame.points()[1]).unwrap().error,
    Some(@drawing.error_info((3.0, 3.0), (8.0, 8.0))),
  )
  ax.clear()
  ax.set_x_limits(0.0, 4.0)
  ax.set_y_limits(0.0, 10.0)
  ax.legend([])
  ax.errorbar([1.0, 3.0], [4.0, 8.0], yerr=[0.0, 1.0], label="Y only")
  let vertical = fig.to_drawing()
  assert_eq(vertical.targets().length(), 5)
  assert_eq(
    vertical.hit_info(vertical.points()[0]).unwrap().error,
    Some(@drawing.error_info((1.0, 1.0), (4.0, 4.0))),
  )
  assert_eq(
    vertical.hit_info(vertical.points()[1]).unwrap().error,
    Some(@drawing.error_info((3.0, 3.0), (7.0, 9.0))),
  )
}

///|
test "visible clipped whiskers retain offscreen sample coordinates without ghost centers" {
  let (fig, ax) = errorbar_axes()
  ax.errorbar(
    [-1.0, 2.0, 5.0],
    [5.0, 5.0, 5.0],
    xerr=[2.0, 0.0, 2.0],
    label="Clipped",
  )
  let frame = fig.to_drawing()
  assert_eq(frame.points().map(p => p.data_x), [-1.0, 2.0, 5.0])
  assert_eq(frame.hit_test(50.0, 100.0, radius=0.0), Some(frame.points()[0]))
  assert_eq(frame.hit_test(350.0, 100.0, radius=0.0), Some(frame.points()[2]))
  assert_eq(frame.hit_test(-1.0, 100.0, radius=1000.0), None)
  assert_eq(frame.hit_test(401.0, 100.0, radius=1000.0), None)
  assert_eq(
    frame.hit_test(10.0, 10.0, mode=@drawing.HitMode::XNearest),
    Some(frame.points()[1]),
  )
  let metadata = frame.hit_info(frame.points()[0]).unwrap()
  assert_eq(metadata.error.unwrap().x_range, (-3.0, 1.0))
  assert_eq(metadata.point.data_x, -1.0)
  for target in frame.targets() {
    if target.shape is @drawing.HitShape::Segment(x0, y0, x1, y1) {
      assert_true(x0 >= 0.0 && x1 <= 400.0 && y0 >= 0.0 && y1 <= 200.0)
    }
  }
}

///|
test "error interactions retain full raw bounds while nonlinear domain checks match actual drawing" {
  for inverted in [false, true] {
    let (fig, ax) = errorbar_axes()
    ax.set_y_scale(@scale.log_scale())
    ax.set_y_limits(
      if inverted {
        100.0
      } else {
        1.0
      },
      if inverted {
        1.0
      } else {
        100.0
      },
    )
    ax.set_x_limits(
      if inverted {
        4.0
      } else {
        0.0
      },
      if inverted {
        0.0
      } else {
        4.0
      },
    )
    ax.errorbar([1.0, 3.0], [10.0, 2.0], yerr=[5.0, 3.0], label="Log")
    let frame = fig.to_drawing()
    assert_eq(frame.svg(), fig.to_svg_checked())
    assert_eq(frame.points().length(), 2)
    assert_eq(frame.targets().length(), 5)
    assert_eq(
      frame.hit_info(frame.points()[0]).unwrap().error.unwrap().y_range,
      (5.0, 15.0),
    )
    assert_eq(
      frame.hit_info(frame.points()[1]).unwrap().error.unwrap().y_range,
      (-1.0, 5.0),
    )
    let x = if inverted { 100.0 } else { 300.0 }
    assert_eq(frame.hit_test(x, 100.0, radius=0.0), None)
    for target in frame.targets() {
      if target.shape is @drawing.HitShape::Segment(x0, y0, x1, y1) {
        assert_eq(
          frame.hit_test((x0 + x1) / 2.0, (y0 + y1) / 2.0, radius=1.0e-10),
          Some(target.info.point),
        )
      }
    }
  }
}

///|
test "errorbar labels follow source identity after same color line removal" {
  let (fig, ax) = errorbar_axes()
  let line = ax.plot_line(
    LineData::Numeric([1.0]),
    LineData::Numeric([1.0]),
    color="red",
    label="Removed",
  )
  ax.errorbar([1.0], [4.0], yerr=[1.0], color="red", label="First")
  ax.errorbar([3.0], [8.0], yerr=[1.0], color="red", label="Second")
  line.remove()
  let frame = fig.to_drawing()
  assert_eq(frame.points().map(p => p.artist_index), [0, 1])
  assert_eq(frame.points().map(p => frame.hit_info(p).unwrap().series), [
    "First", "Second",
  ])
  assert_eq(
    frame.hit_info(frame.points()[0]).unwrap().error.unwrap().y_range,
    (3.0, 5.0),
  )
}

///|
test "error ranges update with the current frame while original samples and old snapshots remain stable" {
  let (fig, ax) = errorbar_axes()
  let errors = [1.0]
  ax.errorbar([1.0], [4.0], yerr=errors, label="Old")
  let old = fig.to_drawing()
  errors[0] = 99.0
  assert_eq(
    fig.to_drawing().hit_info(old.points()[0]).unwrap().error.unwrap().y_range,
    (3.0, 5.0),
  )
  ax.clear()
  ax.set_x_limits(0.0, 4.0)
  ax.set_y_limits(0.0, 10.0)
  ax.legend([])
  ax.errorbar([1.0], [4.0], yerr=[2.0], label="New")
  let fresh = fig.to_drawing()
  assert_eq(old.points(), fresh.points())
  assert_eq(
    old.hit_info(old.points()[0]).unwrap().error.unwrap().y_range,
    (3.0, 5.0),
  )
  assert_eq(
    fresh.hit_info(old.points()[0]).unwrap().error.unwrap().y_range,
    (2.0, 6.0),
  )
  assert_eq(fresh.hit_info(old.points()[0]).unwrap().series, "New")
  assert_eq(ax.containers().length(), 1)
}

///|
test "multiple error panels legends CSS scaling and XNearest keep each original sample independent" {
  let fig = figure(width=400, height=200)
  let left = fig.add_axes(0.0, 0.0, 0.5, 1.0)
  let right = fig.add_axes(0.5, 0.0, 0.5, 1.0)
  for ax in [left, right] {
    ax.set_x_limits(0.0, 4.0)
    ax.set_y_limits(0.0, 10.0)
    ax.legend([])
  }
  left.errorbar([1.0], [4.0], yerr=[2.0], label="Left")
  right.errorbar([3.0], [8.0], yerr=[1.0], label="Right")
  let frame = fig.to_drawing()
  assert_eq(frame.points().map(p => p.panel_index), [0, 1])
  let point = frame.points()[0]
  assert_eq(
    frame.hit_test_client(
      point.screen_x / 2.0,
      point.screen_y / 2.0,
      0.0,
      0.0,
      200.0,
      100.0,
      radius=0.0,
    ),
    Some(point),
  )
  assert_eq(
    frame.hit_test(190.0, 10.0, mode=@drawing.HitMode::XNearest),
    Some(point),
  )
  left.legend([legend_entry("Cover")])
  let covered = fig.to_drawing()
  assert_eq(
    covered.hit_test(50.0, 24.0, radius=1000.0, mode=@drawing.HitMode::XNearest),
    None,
  )
  assert_eq(covered.hit_test(350.0, 40.0, radius=0.0), Some(frame.points()[1]))
}

///|
test "errorbar rejects finite input whose symmetric endpoint arithmetic overflows before attaching" {
  let fig = figure()
  try fig.errorbar([1.7e308], [0.0], xerr=[1.7e308]) catch {
    @core.DataError::InvalidErrorBar(message~) =>
      assert_true(message.contains("finite"))
    _ => fail("expected finite endpoint error")
  } noraise {
    _ => fail("expected an error for overflowing endpoints")
  }
  assert_eq(fig.artists().length(), 0)
  assert_eq(fig.legend_entries().length(), 0)
}
