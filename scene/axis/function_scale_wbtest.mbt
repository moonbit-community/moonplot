///|
test "function context captures its transform while ordinary scale reset clears it" {
  let axis = axis()
  axis.configure_function_scale(
    value => 2.0 * value + 5.0,
    value => (value - 5.0) / 2.0,
    logarithmic=true,
  )
  let transform = axis.coordinate_transform()
  let inverse = axis.coordinate_inverse()
  assert_eq(axis.coordinate_scale_name(), "functionlog")
  assert_eq(transform(7.0), 0.0)
  assert_eq(transform(5.0), -1000.0)
  assert_eq(inverse(0.0), 7.0)
  axis.set_scale(@scale.linear_scale())
  assert_eq(axis.coordinate_scale_name(), "linear")
  assert_eq(axis.coordinate_transform()(7.0), 7.0)
  assert_eq(transform(7.0), 0.0)
  assert_eq(inverse(0.0), 7.0)
}

///|
test "functionlog reuses own empty-data autoscale with its composed inverse" {
  let axis = axis()
  axis.configure_function_scale(
    value => 2.0 * value + 5.0,
    value => (value - 5.0) / 2.0,
    logarithmic=true,
  )
  let bounds = axis
    .autoscale_bounds_checked([], margin=0.05, stickies=[], tight=false)
    .unwrap()
  let view = axis.set_bound_limits_checked(bounds.lower(), bounds.upper())
  assert_eq(view.lower(), 5.0)
  assert_eq(view.upper(), 5.234401174884448e50)
  assert_eq(axis.get_minpos(), 1.0 / 0.0)
}

///|
test "functionlog source tick positions expand raw own view without log rejection" {
  let axis = axis()
  axis.configure_function_scale(
    value => value,
    value => value,
    logarithmic=true,
  )
  ignore(axis.set_bound_limits_checked(10.0, 1.0, automatic=Some(false)))
  axis.request_autoscale()
  let ticks = [-3.0, 4.0, 20.0]
  axis.set_source_ticks(ticks)
  ticks[0] = -40.0
  let view = axis.stored_view_limits()
  assert_eq((view.lower(), view.upper()), (20.0, -3.0))
  assert_true(!axis.autoscale_on())
  assert_true(axis.autoscale_stale())
  assert_true(!axis.is_default_locator())
  assert_true(axis.locator().unwrap().fixed_locator() is Some(_))
  assert_eq(
    axis.locator().unwrap().fixed_locator().unwrap().locations().to_array(),
    [-3.0, 4.0, 20.0],
  )
}

///|
test "primary legacy log locator guards stay local to ordinary log geometry" {
  let primary = axis()
  primary.set_scale(@scale.log_scale())
  assert_true(
    try {
      primary.set_locator(@ticker.Locator::Fixed([-1.0, 1.0]))
      false
    } catch {
      _ => true
    },
  )
  let child = axis()
  child.configure_function_scale(
    value => value,
    value => value,
    logarithmic=true,
  )
  child.set_locator(@ticker.Locator::Fixed([-1.0, 1.0]))
  child.set_minor_locator(@ticker.MinorLocator::Fixed([-0.5, 0.5]))
  assert_eq(child.coordinate_scale_name(), "functionlog")
}

///|
test "minor overlap compares the composed function coordinates" {
  let child = axis()
  child.configure_function_scale(value => value * value, value => value.sqrt())
  child.set_locator(@ticker.FixedLocator::new([25.0]).as_locator())
  child.set_minor_locator(
    @ticker.FixedLocator::new([25.00095]).as_minor_locator(),
  )
  child.set_limits(1.0, 100.0)
  // In raw coordinates .00095 is within 99 * 1e-5. Under sqrt it lies
  // outside the actual transformed span's 9 * 1e-5 overlap tolerance.
  assert_eq(child.minor_tick_values_checked(@core.limits(1.0, 100.0)), [
    25.00095,
  ])
}

///|
test "source ticks second view failure retains expanded bounds and old locator" {
  let child = axis()
  child.configure_function_scale(value => value, value => value)
  guard child.locator() is Some(@ticker.Locator::NamedAuto(before)) else {
    fail("default AutoLocator")
  }
  let reads = [0]
  child.bind_view_interval(() => {
    reads[0] += 1
    if reads[0] == 2 {
      raise @core.DataError::InvalidTicks(message="second view failed")
    }
    let view = child.stored_view_limits()
    (view.lower(), view.upper())
  })
  assert_true(
    try {
      child.set_source_ticks([3.0])
      false
    } catch {
      @core.DataError::InvalidTicks(message~) => message == "second view failed"
      _ => false
    },
  )
  assert_eq(reads[0], 2)
  let view = child.stored_view_limits()
  assert_eq((view.lower(), view.upper()), (0.0, 3.0))
  guard child.locator() is Some(@ticker.Locator::NamedAuto(after)) else {
    fail("old AutoLocator retained")
  }
  assert_true(physical_equal(before, after))
  assert_true(child.is_default_locator())
}

///|
test "source ticks raw interval setter is independent of a projected view getter" {
  let child = axis()
  child.configure_function_scale(value => value, value => value)
  let reads = [0]
  child.bind_view_interval(() => {
    reads[0] += 1
    (100.0, 200.0)
  })
  child.set_source_ticks([3.0])
  let view = child.stored_view_limits()
  assert_eq((view.lower(), view.upper()), (0.0, 3.0))
  assert_eq(reads[0], 2)
  let flat = axis()
  flat.configure_function_scale(value => value, value => value)
  flat.set_view_limits(4.0, 4.0)
  flat.set_source_ticks([-1.0, 1.0])
  let view = flat.stored_view_limits()
  assert_eq((view.lower(), view.upper()), (4.0, -1.0))
  assert_true(flat.inverted())
  let zeros = axis()
  zeros.configure_function_scale(value => value, value => value)
  zeros.set_view_limits(1.0, 2.0)
  zeros.set_source_ticks([0.0, -0.0])
  assert_eq(zeros.stored_view_limits().lower().reinterpret_as_uint64(), 0UL)
}

///|
test "source tick input emptied by first view callback fails before raw view mutation" {
  let child = axis()
  child.configure_function_scale(value => value, value => value)
  let ticks = [3.0]
  let reads = [0]
  child.bind_view_interval(() => {
    reads[0] += 1
    ticks.clear()
    let view = child.stored_view_limits()
    (view.lower(), view.upper())
  })
  assert_true(
    try {
      child.set_source_ticks(ticks)
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "min() iterable argument is empty"
      _ => false
    },
  )
  let view = child.stored_view_limits()
  assert_eq((view.lower(), view.upper()), (0.0, 1.0))
  assert_eq(reads[0], 1)
  assert_true(child.is_default_locator())
}
