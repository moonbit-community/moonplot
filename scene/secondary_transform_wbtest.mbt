///|
fn secondary_transform_hand_bounds(child : SecondaryAxis) -> Array[Double] {
  let bounds = child.display_bounds()
  [bounds.x0(), bounds.y0(), bounds.width(), bounds.height()]
}

///|
test "invalid secondary affine constructor stops before log functions or child attachment" {
  let axes = figure().axes()
  axes.set_x_scale(@scale.log_scale())
  axes.set_y_scale(@scale.log_scale())
  let calls = [0]
  let forward = value => {
    calls[0] += 1
    value
  }
  let inverse = value => {
    calls[0] += 1
    value
  }
  let expected = "ValueError: Both *x_transform* and *y_transform* must be 2D affine transforms"
  // The complete matrix must be separable, including the unused selected row.
  for
    transform in [
      @transforms.affine_from_values(1.0, 0.0, 1.0, 1.0, 0.0, 0.0),
      @transforms.affine_from_values(1.0, 1.0, 0.0, 1.0, 0.0, 0.0),
    ] {
    assert_true(
      try {
        ignore(
          axes.secondary_xaxis(forward, inverse, transform=Some(transform)),
        )
        false
      } catch {
        @core.DataError::InvalidTicks(message~) => message == expected
        _ => false
      },
    )
    assert_true(
      try {
        ignore(
          axes.secondary_yaxis(forward, inverse, transform=Some(transform)),
        )
        false
      } catch {
        @core.DataError::InvalidTicks(message~) => message == expected
        _ => false
      },
    )
  }
  assert_eq(calls[0], 0)
  assert_eq(axes.state.val.secondary_x.length(), 0)
  assert_eq(axes.state.val.secondary_y.length(), 0)
}

///|
test "nonseparable secondary setter writes raw metadata but keeps the installed locator" {
  let axes = figure(width=320, height=240).axes()
  axes.set_x_limits(1.0, 4.0)
  let child = axes.secondary_xaxis(
    value => value,
    value => value,
    location=Position(0.25),
    transform=Some(@transforms.translation(15.0, 25.0)),
  )
  child.set_ticks([2.0, 3.0])
  let old_locator = child.location_locator
  let old_ticks = child.locator().unwrap().fixed_locator().unwrap()
  let old_formatter = child.named_formatter().unwrap()
  let old_view = child.numeric_axis.stored_view_limits()
  let old_active = secondary_transform_hand_bounds(child)
  assert_true(
    try {
      child.set_location(
        Position(0.75),
        transform=Some(
          @transforms.affine_from_values(1.0, 1.0, 0.0, 1.0, 100.0, 200.0),
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: Both *x_transform* and *y_transform* must be 2D affine transforms"
      _ => false
    },
  )
  assert_eq(child.position(), 0.75)
  assert_true(physical_equal(child.location_locator, old_locator))
  assert_true(
    physical_equal(child.locator().unwrap().fixed_locator().unwrap(), old_ticks),
  )
  assert_true(physical_equal(child.named_formatter().unwrap(), old_formatter))
  assert_eq(secondary_transform_hand_bounds(child), old_active)
  let view = child.numeric_axis.stored_view_limits()
  assert_eq((view.lower(), view.upper()), (old_view.lower(), old_view.upper()))
  assert_true(child.ticks_set && child.source_ticks_current)
  assert_true(child.alignment() is SecondaryAxisAlignment::Bottom)
  assert_eq(child.parent_scale_name, Some("linear"))
  child.positioned_aspect(64.0, 60.0, 160.0, 120.0)
  // Original successful locator remains at .25 and uses its old display transform.
  assert_eq(secondary_transform_hand_bounds(child), [
    64.0, 25.25, 160.0, 1.000017846308765e-10,
  ])
  assert_eq(child.position(), 0.75)
}

///|
test "wrong secondary direction fails before both raw metadata and affine snapshot" {
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
  let bad = Some(@transforms.affine_from_values(1.0, 1.0, 0.0, 1.0, 0.0, 0.0))
  let old_x = x.location_locator
  let old_y = y.location_locator
  assert_true(
    try {
      x.set_location(Left, transform=bad)
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "secondary x axis location must be top or bottom"
      _ => false
    },
  )
  assert_true(
    try {
      y.set_location(Top, transform=bad)
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "secondary y axis location must be left or right"
      _ => false
    },
  )
  assert_eq(x.position(), 0.25)
  assert_eq(y.position(), 0.75)
  assert_true(physical_equal(x.location_locator, old_x))
  assert_true(physical_equal(y.location_locator, old_y))
}

///|
test "omitted and explicit None secondary transforms clear earlier display placement" {
  let axes = figure(width=320, height=240).axes()
  axes.set_x_limits(1.0, 4.0)
  axes.set_y_limits(10.0, 20.0)
  let transform = @transforms.translation(15.0, 25.0)
  let x = axes.secondary_xaxis(
    value => value,
    value => value,
    location=Position(0.25),
    transform=Some(transform),
  )
  let y = axes.secondary_yaxis(
    value => value,
    value => value,
    location=Position(0.25),
    transform=Some(transform),
  )
  for child in [x, y] {
    let before = secondary_transform_hand_bounds(child)
    child.set_location(Position(0.75))
    assert_true(child.location_locator.transform is None)
    assert_eq(secondary_transform_hand_bounds(child), before)
    child.set_location(Position(0.5), transform=Some(transform))
    child.set_location(Position(0.75), transform=None)
    assert_true(child.location_locator.transform is None)
    child.positioned_aspect(64.0, 60.0, 160.0, 120.0)
  }
  assert_eq(secondary_transform_hand_bounds(x), [
    64.0, 150.0, 160.0, 1.1999986782029737e-8,
  ])
  assert_eq(secondary_transform_hand_bounds(y), [
    184.0, 60.0, 1.6000001323845936e-8, 120.0,
  ])
}

///|
test "negative and singular secondary affine scales retain original enclosing bbox" {
  let axes = figure(width=320, height=240).axes()
  axes.set_x_limits(1.0, 4.0)
  axes.set_y_limits(10.0, 20.0)
  let negative = @transforms.affine_from_values(
    -2.0, 0.0, 0.0, -3.0, 15.0, 25.0,
  )
  let zero = @transforms.affine_from_values(0.0, 0.0, 0.0, 0.0, 15.0, 25.0)
  let x = axes.secondary_xaxis(
    value => value,
    value => value,
    location=Position(0.25),
    transform=Some(negative),
  )
  let y = axes.secondary_yaxis(
    value => value,
    value => value,
    location=Position(0.25),
    transform=Some(negative),
  )
  x.positioned_aspect(64.0, 60.0, 160.0, 120.0)
  y.positioned_aspect(64.0, 60.0, 160.0, 120.0)
  assert_eq(secondary_transform_hand_bounds(x), [
    64.0, 24.2499999997, 160.0, 2.999982484652719e-10,
  ])
  assert_eq(secondary_transform_hand_bounds(y), [
    14.4999999998, 60.0, 2.000000165480742e-10, 120.0,
  ])
  for child in [x, y] {
    child.set_location(Position(0.25), transform=Some(zero))
    child.positioned_aspect(64.0, 60.0, 160.0, 120.0)
  }
  assert_eq(secondary_transform_hand_bounds(x), [64.0, 25.0, 160.0, 0.0])
  assert_eq(secondary_transform_hand_bounds(y), [15.0, 60.0, 0.0, 120.0])
}

///|
test "secondary affine replacement during forward retains captured locator for this aspect" {
  let axes = figure(width=320, height=240).axes()
  axes.set_x_limits(1.0, 4.0)
  axes.set_y_limits(10.0, 20.0)
  let old = @transforms.affine_from_values(2.0, 0.0, 0.0, 3.0, 15.0, 25.0)
  let new = @transforms.translation(100.0, 200.0)
  let x = axes.secondary_xaxis(
    value => value,
    value => value,
    location=Position(0.25),
    transform=Some(old),
  )
  let y = axes.secondary_yaxis(
    value => value,
    value => value,
    location=Position(0.25),
    transform=Some(old),
  )
  for child in [x, y] {
    let fired = [false]
    child.set_functions(
      value => {
        if !fired[0] {
          fired[0] = true
          try! child.set_location(Position(0.75), transform=Some(new))
        }
        value
      },
      value => value,
    )
    child.positioned_aspect(64.0, 60.0, 160.0, 120.0)
    assert_true(fired[0])
    assert_eq(child.position(), 0.75)
    assert_eq(child.location_locator.position, 0.75)
    assert_true(child.location_locator.transform is Some(_))
  }
  // Actual complete original replacement-only callback observations.
  assert_eq(secondary_transform_hand_bounds(x), [
    64.0, 25.75, 160.0, 3.000018011789507e-10,
  ])
  assert_eq(secondary_transform_hand_bounds(y), [
    15.5, 60.0, 2.000000165480742e-10, 120.0,
  ])
}

///|
test "secondary affine separability does not reject unused nonfinite diagonal values" {
  let axes = figure(width=320, height=240).axes()
  axes.set_x_limits(1.0, 4.0)
  axes.set_y_limits(10.0, 20.0)
  let nan = 0.0 / 0.0
  let x = axes.secondary_xaxis(
    value => value,
    value => value,
    location=Position(0.25),
    transform=Some(
      @transforms.affine_from_values(nan, 0.0, 0.0, 1.0, nan, 25.0),
    ),
  )
  let y = axes.secondary_yaxis(
    value => value,
    value => value,
    location=Position(0.25),
    transform=Some(
      @transforms.affine_from_values(1.0, 0.0, 0.0, nan, 15.0, nan),
    ),
  )
  x.positioned_aspect(64.0, 60.0, 160.0, 120.0)
  y.positioned_aspect(64.0, 60.0, 160.0, 120.0)
  assert_eq(secondary_transform_hand_bounds(x), [
    64.0, 25.25, 160.0, 1.000017846308765e-10,
  ])
  assert_eq(secondary_transform_hand_bounds(y), [
    15.25, 60.0, 9.99982319171977e-11, 120.0,
  ])
}
