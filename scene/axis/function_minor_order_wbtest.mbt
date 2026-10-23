///|
// Original Axis.get_minorticklocs transforms minors, then majors, then reads
// the view and transforms its bounds. The recorded source probe is independent
// of this implementation: D40-function-context-review.md and adjacent evidence.
test "function minor overlap runs its transform before the late view read" {
  let value = axis()
  let events : Array[Double] = []
  value.configure_function_scale(number => number, number => {
    events.push(number)
    number
  })
  value.set_locator(@ticker.FixedLocator::new([2.0]).as_locator())
  value.set_minor_locator(@ticker.FixedLocator::new([3.0]).as_minor_locator())
  value.bind_view_interval(() => {
    events.push(-99.0)
    (0.0, 10.0)
  })
  assert_eq(value.minor_tick_values_checked(@core.limits(0.0, 10.0)), [3.0])
  assert_eq(events, [3.0, 2.0, -99.0, 0.0, 10.0])
}

///|
test "retained minor selection reads the live Int64 buffer after late view mutation" {
  let value = axis()
  let events : Array[Double] = []
  value.configure_function_scale(number => number, number => {
    events.push(number)
    number
  })
  let original = [2L, 3L]
  value.set_locator(@ticker.FixedLocator::new([2.0]).as_locator())
  value.set_minor_locator(
    @ticker.FixedLocator::from_view(
      @ticker.TickValues::from_int64_array(original),
    ).as_minor_locator(),
  )
  value.bind_view_interval(() => {
    events.push(-99.0)
    original[1] = 4L
    (0.0, 10.0)
  })
  let selected = value.formatter_tick_locations_checked(
    @core.limits(0.0, 10.0),
    minor=true,
  )
  assert_eq(events, [2.0, 3.0, 2.0, -99.0, 0.0, 10.0])
  assert_eq(selected.dtype(), Some("int64"))
  assert_eq(selected.length(), 1)
  assert_true(selected.get_value(0) is @ticker.ScalarNumber::NumpyInt64(4L))
  original[1] = 5L
  assert_true(selected.get_value(0) is @ticker.ScalarNumber::NumpyInt64(4L))
}

///|
test "minor view failure follows both tick transforms and precedes bound transforms" {
  let value = axis()
  let events : Array[Double] = []
  value.configure_function_scale(number => number, number => {
    events.push(number)
    number
  })
  value.set_locator(@ticker.FixedLocator::new([2.0]).as_locator())
  value.set_minor_locator(@ticker.FixedLocator::new([3.0]).as_minor_locator())
  value.bind_view_interval(() => {
    events.push(-99.0)
    raise @core.DataError::InvalidTicks(message="late view")
  })
  assert_true(
    try {
      ignore(value.minor_tick_values_checked(@core.limits(0.0, 10.0)))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) => message == "late view"
      _ => false
    },
  )
  assert_eq(events, [3.0, 2.0, -99.0])
}

///|
test "minor selection retains its old transform when the late view changes scale" {
  let value = axis()
  value.configure_function_scale(number => number * number, number => {
    number.sqrt()
  })
  value.set_locator(@ticker.FixedLocator::new([25.0]).as_locator())
  value.set_minor_locator(
    @ticker.FixedLocator::new([25.00095]).as_minor_locator(),
  )
  value.bind_view_interval(() => {
    value.configure_function_scale(number => number, number => number)
    (1.0, 100.0)
  })
  // sqrt coordinates separate the ticks beyond their 9 * 1e-5 tolerance;
  // the newly installed identity coordinates would instead remove the minor.
  assert_eq(value.minor_tick_values_checked(@core.limits(1.0, 100.0)), [
    25.00095,
  ])
  assert_eq(value.coordinate_transform()(25.0), 25.0)
}

///|
test "direct Null minor getters preserve major transform and late view phases" {
  let value = axis()
  let events : Array[Double] = []
  value.configure_function_scale(number => number, number => {
    events.push(number)
    number
  })
  value.set_locator(@ticker.FixedLocator::new([2.0]).as_locator())
  value.bind_view_interval(() => {
    events.push(-99.0)
    (0.0, 10.0)
  })
  assert_eq(value.minor_tick_values_checked(@core.limits(0.0, 10.0)), [])
  assert_eq(events, [2.0, -99.0, 0.0, 10.0])
  events.clear()
  value.set_minor_overlap_removal(false)
  assert_eq(value.minor_tick_values_checked(@core.limits(0.0, 10.0)), [])
  assert_eq(events, [])
  assert_true(value.tick_group_is_null(minor=true))
}

///|
test "calendar minors use the same late overlap stage after their own owner query" {
  let value = axis()
  let events : Array[Double] = []
  value.configure_function_scale(number => number, number => {
    events.push(number)
    number
  })
  value.set_locator(@ticker.FixedLocator::new([2.0]).as_locator())
  value.set_minor_date_locator(@date.day_locator(tz="UTC"))
  value.bind_view_interval(() => {
    events.push(-99.0)
    (0.0, 2.0)
  })
  assert_eq(value.minor_tick_values_checked(@core.limits(0.0, 2.0)), [0.0, 1.0])
  assert_eq(events, [-99.0, 0.0, 1.0, 2.0, 2.0, -99.0, 0.0, 2.0])
}
