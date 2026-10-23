///|
fn secondary_position_hand_points(bounds : @transforms.BBox) -> Array[Double] {
  [bounds.x0(), bounds.y0(), bounds.x1(), bounds.y1()]
}

///|
test "secondary numeric constructor chooses alignment once with stable orientation" {
  let axes = figure(width=320, height=240).axes()
  for position in [-0.25, 0.49999999999999994, 0.5, 1.25] {
    let x = axes.secondary_xaxis(
      value => value,
      value => value,
      location=Position(position),
    )
    let y = axes.secondary_yaxis(
      value => value,
      value => value,
      location=Position(position),
    )
    assert_eq(x.position(), position)
    assert_eq(y.position(), position)
    assert_true(x.horizontal)
    assert_true(!y.horizontal)
    if position < 0.5 {
      assert_true(x.alignment() is SecondaryAxisAlignment::Bottom)
      assert_true(y.alignment() is SecondaryAxisAlignment::Left)
    } else {
      assert_true(x.alignment() is SecondaryAxisAlignment::Top)
      assert_true(y.alignment() is SecondaryAxisAlignment::Right)
    }
    assert_eq(secondary_position_hand_points(x.active_bounds), [
      0.0, 1.0, 1.0, 1.0001,
    ])
    assert_eq(secondary_position_hand_points(y.active_bounds), [
      0.0, 1.0, 0.0001, 2.0,
    ])
    assert_eq(x.get_tick_space(), 10.0)
    assert_eq(y.get_tick_space(), 11.0)
  }
}

///|
test "secondary location and alignment setters preserve pending view and tick state" {
  let axes = figure(width=320, height=240).axes()
  axes.set_x_limits(1.0, 4.0)
  let calls = [0]
  let child = axes.secondary_xaxis(
    value => {
      calls[0] += 1
      value
    },
    value => value,
    location=Position(0.25),
  )
  child.set_ticks([2.0, 3.0])
  let before = secondary_position_hand_points(child.active_bounds)
  let old_view = child.numeric_axis.stored_view_limits()
  let old_locator = child.locator().unwrap().fixed_locator().unwrap()
  let old_formatter = child.named_formatter().unwrap()
  child.set_location(Top)
  assert_eq(child.position(), 1.0)
  assert_true(child.location() is SecondaryAxisLocation::Top)
  assert_true(child.alignment() is SecondaryAxisAlignment::Bottom)
  child.set_alignment(Top)
  child.set_location(Bottom)
  assert_eq(child.position(), 0.0)
  assert_true(child.alignment() is SecondaryAxisAlignment::Top)
  child.set_location(Position(0.75))
  assert_eq(child.position(), 0.75)
  assert_true(child.horizontal)
  assert_eq(calls[0], 0)
  assert_eq(secondary_position_hand_points(child.active_bounds), before)
  let view = child.numeric_axis.stored_view_limits()
  assert_eq((view.lower(), view.upper()), (old_view.lower(), old_view.upper()))
  assert_true(
    physical_equal(
      old_locator,
      child.locator().unwrap().fixed_locator().unwrap(),
    ),
  )
  assert_true(physical_equal(old_formatter, child.named_formatter().unwrap()))
  assert_true(child.ticks_set)
  assert_true(child.source_ticks_current)
  assert_true(!child.legacy_sampling)
  assert_eq(child.parent_scale_name, Some("linear"))
}

///|
test "secondary wrong-direction setters fail before location style or geometry changes" {
  let axes = figure().axes()
  let x = axes.secondary_xaxis(
    value => value,
    value => value,
    location=Position(0.25),
  )
  let y = axes.secondary_yaxis(
    value => value,
    value => value,
    location=Position(0.75),
  )
  let x_before = secondary_position_hand_points(x.active_bounds)
  let y_before = secondary_position_hand_points(y.active_bounds)
  assert_true(
    try {
      x.set_location(Left)
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "secondary x axis location must be top or bottom"
      _ => false
    },
  )
  assert_true(
    try {
      y.set_location(Top)
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "secondary y axis location must be left or right"
      _ => false
    },
  )
  assert_true(
    try {
      x.set_alignment(Left)
      false
    } catch {
      @core.DataError::InvalidTicks(_) => true
      _ => false
    },
  )
  assert_true(
    try {
      y.set_alignment(Top)
      false
    } catch {
      @core.DataError::InvalidTicks(_) => true
      _ => false
    },
  )
  assert_eq(x.position(), 0.25)
  assert_eq(y.position(), 0.75)
  assert_true(x.alignment() is SecondaryAxisAlignment::Bottom)
  assert_true(y.alignment() is SecondaryAxisAlignment::Right)
  assert_eq(secondary_position_hand_points(x.active_bounds), x_before)
  assert_eq(secondary_position_hand_points(y.active_bounds), y_before)
}

///|
test "secondary positioned aspect preserves the source thin bbox and direct aspect restores original" {
  let axes = figure(width=320, height=240).axes()
  axes.set_x_limits(1.0, 4.0)
  axes.set_y_limits(1.0, 4.0)
  let x = axes.secondary_xaxis(
    value => value,
    value => value,
    location=Position(0.75),
  )
  let y = axes.secondary_yaxis(
    value => value,
    value => value,
    location=Position(0.75),
  )
  x.positioned_aspect(64.0, 60.0, 160.0, 120.0)
  y.positioned_aspect(64.0, 60.0, 160.0, 120.0)
  let x_display = x.display_bounds()
  let y_display = y.display_bounds()
  // Actual original Bbox observations: retain the tiny cross-dimension rather
  // than drawing a mathematically collapsed line at the requested coordinate.
  assert_eq(
    [x_display.x0(), x_display.y0(), x_display.width(), x_display.height()],
    [64.0, 150.0, 160.0, 1.1999986782029737e-8],
  )
  assert_eq(
    [y_display.x0(), y_display.y0(), y_display.width(), y_display.height()],
    [184.0, 60.0, 1.6000001323845936e-8, 120.0],
  )
  assert_eq(x.formatter_geometry(), (64.0, 160.0))
  assert_eq(y.formatter_geometry(), (60.0, 120.0))
  let x_before = secondary_position_hand_points(x.active_bounds)
  x.set_location(Position(0.25))
  x.set_alignment(Bottom)
  assert_eq(secondary_position_hand_points(x.active_bounds), x_before)
  x.apply_aspect()
  y.apply_aspect()
  assert_eq(
    secondary_position_hand_points(x.active_bounds),
    secondary_position_hand_points(x.original_bounds),
  )
  assert_eq(
    secondary_position_hand_points(y.active_bounds),
    secondary_position_hand_points(y.original_bounds),
  )
  assert_eq(x.formatter_geometry(), (0.0, 320.0))
  assert_eq(y.formatter_geometry(), (240.0, 240.0))
  assert_eq(x.get_tick_space(), 10.0)
  assert_eq(y.get_tick_space(), 11.0)
  assert_true(x.alignment() is SecondaryAxisAlignment::Bottom)
}

///|
test "secondary positioned aspect commits the candidate captured before forward mutation" {
  let axes = figure(width=320, height=240).axes()
  axes.set_x_limits(1.0, 4.0)
  let child = axes.secondary_xaxis(
    value => value,
    value => value,
    location=Position(0.25),
  )
  child.set_functions(
    value => {
      // Position(Double) is always valid in the known horizontal context.
      try! child.set_location(Position(0.75))
      value
    },
    value => value,
  )
  child.positioned_aspect(64.0, 60.0, 160.0, 120.0)
  assert_eq(child.position(), 0.75)
  assert_eq(child.display_bounds().y0(), 90.0)
  assert_eq(child.display_bounds().height(), 1.2000000992884452e-8)
  child.positioned_aspect(64.0, 60.0, 160.0, 120.0)
  assert_eq(child.display_bounds().y0(), 150.0)
  assert_true(child.alignment() is SecondaryAxisAlignment::Bottom)
}

///|
test "secondary mapped-limit failure does not commit the captured positioned bbox" {
  let axes = figure(width=320, height=240).axes()
  axes.set_x_limits(1.0, 4.0)
  let child = axes.secondary_xaxis(value => value, value => value)
  let before = secondary_position_hand_points(child.active_bounds)
  let old_view = child.numeric_axis.stored_view_limits()
  child.set_location(Position(0.75))
  child.set_functions(
    _ => {
      try! child.set_alignment(Bottom)
      0.0 / 0.0
    },
    value => value,
  )
  assert_true(
    try {
      child.positioned_aspect(64.0, 60.0, 160.0, 120.0)
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: Axis limits cannot be NaN or Inf"
      _ => false
    },
  )
  assert_eq(secondary_position_hand_points(child.active_bounds), before)
  let view = child.numeric_axis.stored_view_limits()
  assert_eq((view.lower(), view.upper()), (old_view.lower(), old_view.upper()))
  assert_eq(child.position(), 0.75)
  assert_true(child.alignment() is SecondaryAxisAlignment::Bottom)
  assert_eq(child.parent_scale_name, Some("linear"))
}

///|
test "secondary nonfinite positions are accepted before deferred bbox propagation" {
  let axes = figure(width=320, height=240).axes()
  axes.set_x_limits(1.0, 4.0)
  axes.set_y_limits(1.0, 4.0)
  for position in [0.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0] {
    let x = axes.secondary_xaxis(
      value => value,
      value => value,
      location=Position(position),
    )
    let y = axes.secondary_yaxis(
      value => value,
      value => value,
      location=Position(position),
    )
    if position < 0.5 {
      assert_true(x.alignment() is SecondaryAxisAlignment::Bottom)
      assert_true(y.alignment() is SecondaryAxisAlignment::Left)
    } else {
      assert_true(x.alignment() is SecondaryAxisAlignment::Top)
      assert_true(y.alignment() is SecondaryAxisAlignment::Right)
    }
    for child in [x, y] {
      let before = secondary_position_hand_points(child.active_bounds)
      child.set_location(Position(position))
      assert_eq(secondary_position_hand_points(child.active_bounds), before)
      child.positioned_aspect(64.0, 60.0, 160.0, 120.0)
      if position.is_nan() {
        assert_true(child.position().is_nan())
        assert_true(
          secondary_position_hand_points(child.active_bounds).all(value => {
            value.is_nan()
          }),
        )
      } else {
        assert_eq(child.position(), position)
        if child.horizontal {
          assert_true(child.active_bounds.x0().is_nan())
          assert_eq(child.active_bounds.y0(), position)
        } else {
          assert_eq(child.active_bounds.x0(), position)
          assert_true(child.active_bounds.y0().is_nan())
        }
      }
      assert_true(
        secondary_position_hand_points(child.display_bounds()).all(value => {
          value.is_nan()
        }),
      )
    }
  }
  // This test covers successful receipt and Bbox storage, not nonfinite SVG.
}

///|
test "secondary figure normalization uses the source diagonal reciprocal" {
  let axes = figure(width=792, height=858).axes()
  axes.set_x_limits(1.0, 4.0)
  let child = axes.secondary_xaxis(
    value => value,
    value => value,
    location=Position(0.75),
  )
  child.positioned_aspect(158.4, 214.5, 396.0, 429.0)
  // Actual original Affine/Bbox values. The determinant-based generic inverse
  // is one ULP lower in x here and changes the normalized/display positions.
  assert_eq(secondary_position_hand_points(child.active_bounds), [
    0.2, 0.625, 0.7, 0.62500000005,
  ])
  assert_eq(secondary_position_hand_points(child.display_bounds()), [
    158.4, 536.25, 554.4, 536.2500000429,
  ])
}
