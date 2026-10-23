///|
fn secondary_functions_hand_flags(child : SecondaryAxis) -> Array[Bool] {
  [
    child.numeric_axis.is_default_locator(),
    child.numeric_axis.is_default_locator(minor=true),
    child.numeric_axis.is_default_formatter(),
    child.numeric_axis.is_default_formatter(minor=true),
  ]
}

///|
fn secondary_functions_hand_view(child : SecondaryAxis) -> (Double, Double) {
  let view = child.numeric_axis.stored_view_limits()
  (view.lower(), view.upper())
}

///|
fn secondary_functions_hand_same_major(
  first : @ticker.Locator,
  last : @ticker.Locator,
) -> Bool {
  match (first, last) {
    (@ticker.Locator::NamedAuto(a), @ticker.Locator::NamedAuto(b)) =>
      physical_equal(a, b)
    (@ticker.Locator::NamedLog(a), @ticker.Locator::NamedLog(b)) =>
      physical_equal(a, b)
    (@ticker.Locator::NamedFixed(a), @ticker.Locator::NamedFixed(b)) =>
      physical_equal(a, b)
    _ => false
  }
}

///|
fn secondary_functions_hand_same_minor(
  first : @ticker.MinorLocator,
  last : @ticker.MinorLocator,
) -> Bool {
  match (first, last) {
    (@ticker.MinorLocator::Null(a), @ticker.MinorLocator::Null(b)) =>
      physical_equal(a, b)
    (
      @ticker.MinorLocator::NamedAutoMinor(a),
      @ticker.MinorLocator::NamedAutoMinor(b),
    ) => physical_equal(a, b)
    (@ticker.MinorLocator::NamedLog(a), @ticker.MinorLocator::NamedLog(b)) =>
      physical_equal(a, b)
    _ => false
  }
}

///|
test "secondary same-name functions keep old getter values and installed roles" {
  let axes = figure().axes()
  axes.set_x_limits(1.0, 4.0)
  let child = axes.secondary_xaxis(value => value * 2.0, value => value / 2.0)
  let old_forward = child.forward()
  let old_inverse = child.inverse()
  let old_transform = child.numeric_axis.coordinate_transform()
  let old_major = child.locator().unwrap()
  let old_minor = child.minor_locator().unwrap()
  let old_formatter = child.named_formatter().unwrap()
  let old_minor_formatter = child.minor_named_formatter().unwrap()
  let old_binding = child.formatter_axis_binding()
  child.set_functions(value => value * value, value => value.sqrt())
  assert_eq(old_forward(9.0), 18.0)
  assert_eq(old_inverse(9.0), 4.5)
  assert_eq(child.forward()(9.0), 81.0)
  assert_eq(child.inverse()(9.0), 3.0)
  assert_eq(old_transform(9.0), 4.5)
  assert_eq(child.numeric_axis.coordinate_transform()(9.0), 4.5)
  assert_eq(secondary_functions_hand_view(child), (0.0, 1.0))
  assert_eq(secondary_functions_hand_flags(child), [true, true, true, true])
  assert_true(
    secondary_functions_hand_same_major(old_major, child.locator().unwrap()),
  )
  assert_true(
    secondary_functions_hand_same_minor(
      old_minor,
      child.minor_locator().unwrap(),
    ),
  )
  assert_true(physical_equal(old_formatter, child.named_formatter().unwrap()))
  assert_true(
    physical_equal(old_minor_formatter, child.minor_named_formatter().unwrap()),
  )
  child.reset_functions()
  assert_eq(child.forward()(9.0), 9.0)
  assert_eq(child.inverse()(9.0), 9.0)
  assert_eq(old_forward(9.0), 18.0)
  assert_eq(old_inverse(9.0), 4.5)
  assert_eq(child.numeric_axis.coordinate_transform()(9.0), 4.5)
  assert_eq(secondary_functions_hand_view(child), (0.0, 1.0))
  assert_eq(secondary_functions_hand_flags(child), [true, true, true, true])
  assert_true(
    secondary_functions_hand_same_major(old_major, child.locator().unwrap()),
  )
  assert_true(
    secondary_functions_hand_same_minor(
      old_minor,
      child.minor_locator().unwrap(),
    ),
  )
  assert_true(physical_equal(old_formatter, child.named_formatter().unwrap()))
  assert_true(
    physical_equal(old_minor_formatter, child.minor_named_formatter().unwrap()),
  )
  assert_eq(child.formatter_axis_binding(), old_binding)
  assert_eq(old_formatter.axis(), Some(old_binding))
  assert_eq(child.parent_scale_name, Some("linear"))
}

///|
test "secondary functions preserve sampling provenance and the empty ticks latch" {
  let axes = figure().axes()
  axes.set_x_limits(1.0, 4.0)
  let child = axes.secondary_xaxis(value => value, value => value)
  child.set_tick_count(4)
  assert_true(child.legacy_sampling)
  child.set_functions(value => value * 2.0, value => value / 2.0)
  child.reset_functions()
  assert_true(child.legacy_sampling)
  assert_true(!child.ticks_set)
  assert_true(!child.source_ticks_current)
  assert_true(child.locator() is None)
  child.set_ticks([])
  let empty_locator = child.locator().unwrap().fixed_locator().unwrap()
  child.set_functions(value => value * value, value => value.sqrt())
  child.reset_functions()
  assert_true(child.ticks_set)
  assert_true(child.source_ticks_current)
  assert_true(!child.legacy_sampling)
  assert_eq(child.ticks(), Some([]))
  assert_true(
    physical_equal(
      empty_locator,
      child.locator().unwrap().fixed_locator().unwrap(),
    ),
  )
  axes.set_x_scale(@scale.symlog_scale())
  child.set_functions(value => value * 2.0, value => value / 2.0)
  assert_eq(child.parent_scale_name, Some("symlog"))
  assert_eq(secondary_functions_hand_flags(child), [false, true, true, true])
  assert_true(child.ticks_set)
  assert_true(child.source_ticks_current)
  assert_true(!child.legacy_sampling)
  assert_eq(child.ticks(), Some([]))
  assert_true(
    !physical_equal(
      empty_locator,
      child.locator().unwrap().fixed_locator().unwrap(),
    ),
  )
}

///|
test "secondary changed-name functions retain CURRENT signed tick view alias" {
  let axes = figure().axes()
  axes.set_x_limits(1.0, 4.0)
  let child = axes.secondary_xaxis(value => value, value => value)
  child.set_ticks([2.0, 3.0])
  let owner = [1L, 4L, 7L, 9L]
  let original_view = @ticker.TickValues::from_int64_array(owner).view(1, 1, 2)
  let original_locator = @ticker.FixedLocator::from_view(original_view)
  child.set_locator(original_locator.as_locator())
  axes.set_x_scale(@scale.log_scale())
  child.set_functions(value => value * value, value => value.sqrt())
  let restored = child.locator().unwrap().fixed_locator().unwrap()
  assert_true(!physical_equal(original_locator, restored))
  assert_eq(child.tick_values_checked(), [4.0, 7.0])
  assert_eq(
    @ticker.FormatterLocations::NdArray(restored.locations()).dtype(),
    Some("int64"),
  )
  restored.locations().set(0, 6.0)
  assert_eq(owner, [1L, 6L, 7L, 9L])
  assert_eq(original_locator.locations().to_array(), [6.0, 7.0])
  owner[2] = 8L
  assert_eq(restored.locations().to_array(), [6.0, 8.0])
  assert_eq(secondary_functions_hand_view(child), (0.0, 3.0))
  assert_eq(secondary_functions_hand_flags(child), [false, true, true, true])
  assert_true(child.ticks_set)
  assert_true(!child.source_ticks_current)
  assert_true(!child.legacy_sampling)
  assert_eq(child.parent_scale_name, Some("log"))
}

///|
test "secondary function assignment survives CURRENT locator failure before reset" {
  let axes = figure().axes()
  axes.set_x_limits(1.0, 4.0)
  let child = axes.secondary_xaxis(value => value * 2.0, value => value / 2.0)
  child.set_ticks([0.0, 1.0])
  let failing = @ticker.LogLocator::new()
  child.set_locator(failing.as_locator())
  let old_minor = child.minor_locator().unwrap()
  let old_formatter = child.named_formatter().unwrap()
  let old_minor_formatter = child.minor_named_formatter().unwrap()
  let old_forward = child.forward()
  let binding = child.formatter_axis_binding()
  axes.set_x_scale(@scale.log_scale())
  assert_true(
    try {
      child.set_functions(value => value * value, value => value.sqrt())
      false
    } catch {
      @core.DataError::InvalidTicks(_) => true
      _ => false
    },
  )
  assert_eq(child.forward()(9.0), 81.0)
  assert_eq(child.inverse()(9.0), 3.0)
  assert_eq(old_forward(9.0), 18.0)
  assert_eq(child.numeric_axis.coordinate_transform()(9.0), 4.5)
  assert_eq(secondary_functions_hand_view(child), (0.0, 1.0))
  assert_eq(child.parent_scale_name, Some("linear"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
  assert_true(
    physical_equal(failing, child.locator().unwrap().log_locator().unwrap()),
  )
  assert_true(
    secondary_functions_hand_same_minor(
      old_minor,
      child.minor_locator().unwrap(),
    ),
  )
  assert_true(physical_equal(old_formatter, child.named_formatter().unwrap()))
  assert_true(
    physical_equal(old_minor_formatter, child.minor_named_formatter().unwrap()),
  )
  assert_eq(secondary_functions_hand_flags(child), [false, true, true, true])
  assert_true(child.ticks_set)
  assert_true(!child.source_ticks_current)
  assert_eq(child.formatter_axis_binding(), binding)
}

///|
test "secondary name-changing NaN functions use the source successful log fallback" {
  let axes = figure().axes()
  axes.set_x_limits(1.0, 4.0)
  let child = axes.secondary_xaxis(value => value, value => value)
  let old_major = child.locator().unwrap()
  axes.set_x_scale(@scale.log_scale())
  child.set_functions(_ => 0.0 / 0.0, value => value)
  assert_eq(secondary_functions_hand_view(child), (1.0, 10.0))
  assert_eq(secondary_functions_hand_flags(child), [true, true, true, true])
  assert_eq(child.parent_scale_name, Some("log"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "functionlog")
  assert_true(child.forward()(4.0).is_nan())
  assert_true(
    !secondary_functions_hand_same_major(old_major, child.locator().unwrap()),
  )
  assert_true(
    try {
      child.apply_aspect()
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: Axis limits cannot be NaN or Inf"
      _ => false
    },
  )
  assert_eq(secondary_functions_hand_view(child), (1.0, 10.0))
  assert_eq(child.parent_scale_name, Some("log"))
}

///|
test "secondary same-name NaN function is evaluated only by later aspect" {
  let axes = figure().axes()
  axes.set_y_limits(1.0, 4.0)
  let child = axes.secondary_yaxis(value => value * 2.0, value => value / 2.0)
  let calls = [0]
  child.set_functions(
    _ => {
      calls[0] += 1
      0.0 / 0.0
    },
    value => value,
  )
  assert_eq(calls[0], 0)
  assert_eq(secondary_functions_hand_view(child), (0.0, 1.0))
  assert_eq(child.numeric_axis.coordinate_transform()(9.0), 4.5)
  assert_true(
    try {
      child.apply_aspect()
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: Axis limits cannot be NaN or Inf"
      _ => false
    },
  )
  assert_true(calls[0] > 0)
  assert_eq(secondary_functions_hand_view(child), (0.0, 1.0))
  assert_eq(child.numeric_axis.coordinate_transform()(9.0), 4.5)
  assert_eq(child.parent_scale_name, Some("linear"))
}
