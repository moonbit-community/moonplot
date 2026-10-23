// Generated from complete original Scalar/Axis lifecycle.

///|
test "Scalar original axis 0 set_locs exact axis dependency/order" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  f.set_scientific(true)
  let calls = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    calls.val += 1
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([1000000.0, 1000004.0]),
    )
  })
  f.set_axis(Some(binding))
  f.set_locs_view(@ticker.TickValues::from_array([]))
  assert_eq(calls.val, 0)
  assert_eq(
    f.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(
    f.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.format_pattern(), "")
  assert_eq(f.locations().length(), 0)
}

///|
test "Scalar original axis 1 set_locs exact axis dependency/order" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  f.set_scientific(false)
  let calls = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    calls.val += 1
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([1000000.0, 1000004.0]),
    )
  })
  f.set_axis(Some(binding))
  f.set_locs_view(@ticker.TickValues::from_array([]))
  assert_eq(calls.val, 0)
  assert_eq(
    f.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(
    f.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.format_pattern(), "")
  assert_eq(f.locations().length(), 0)
}

///|
test "Scalar original axis 2 set_locs exact axis dependency/order" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  f.set_scientific(true)
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(3),
      @bigint.BigInt::from_int(3),
    ]),
  )
  let calls = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    calls.val += 1
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([1000000.0, 1000004.0]),
    )
  })
  f.set_axis(Some(binding))
  f.set_locs_view(@ticker.TickValues::from_array([]))
  assert_eq(calls.val, 0)
  assert_eq(
    f.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(
    f.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.format_pattern(), "")
  assert_eq(f.locations().length(), 0)
}

///|
test "Scalar original axis 3 set_locs exact axis dependency/order" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(false)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  f.set_scientific(true)
  let calls = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    calls.val += 1
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([1000000.0, 1000004.0]),
    )
  })
  f.set_axis(Some(binding))
  f.set_locs_view(@ticker.TickValues::from_array([]))
  assert_eq(calls.val, 0)
  assert_eq(
    f.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(
    f.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.format_pattern(), "")
  assert_eq(f.locations().length(), 0)
}

///|
test "Scalar original axis 4 set_locs exact axis dependency/order" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(false)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  f.set_scientific(false)
  let calls = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    calls.val += 1
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([1000000.0, 1000004.0]),
    )
  })
  f.set_axis(Some(binding))
  f.set_locs_view(@ticker.TickValues::from_array([]))
  assert_eq(calls.val, 0)
  assert_eq(
    f.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(
    f.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.format_pattern(), "")
  assert_eq(f.locations().length(), 0)
}

///|
test "Scalar original axis 5 set_locs exact axis dependency/order" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(false)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  f.set_scientific(true)
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(3),
      @bigint.BigInt::from_int(3),
    ]),
  )
  let calls = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    calls.val += 1
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([1000000.0, 1000004.0]),
    )
  })
  f.set_axis(Some(binding))
  f.set_locs_view(@ticker.TickValues::from_array([]))
  assert_eq(calls.val, 0)
  assert_eq(
    f.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(
    f.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.format_pattern(), "")
  assert_eq(f.locations().length(), 0)
}

///|
test "Scalar original axis 6 set_locs exact axis dependency/order" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Number(1000000.0)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  f.set_scientific(true)
  let calls = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    calls.val += 1
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([1000000.0, 1000004.0]),
    )
  })
  f.set_axis(Some(binding))
  f.set_locs_view(@ticker.TickValues::from_array([]))
  assert_eq(calls.val, 0)
  assert_eq(f.offset(), Some(@ticker.ScalarNumber::Number(1000000.0)))
  assert_eq(
    f.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.format_pattern(), "")
  assert_eq(f.locations().length(), 0)
}

///|
test "Scalar original axis 7 set_locs exact axis dependency/order" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Number(1000000.0)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  f.set_scientific(false)
  let calls = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    calls.val += 1
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([1000000.0, 1000004.0]),
    )
  })
  f.set_axis(Some(binding))
  f.set_locs_view(@ticker.TickValues::from_array([]))
  assert_eq(calls.val, 0)
  assert_eq(f.offset(), Some(@ticker.ScalarNumber::Number(1000000.0)))
  assert_eq(
    f.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.format_pattern(), "")
  assert_eq(f.locations().length(), 0)
}

///|
test "Scalar original axis 8 set_locs exact axis dependency/order" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Number(1000000.0)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  f.set_scientific(true)
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(3),
      @bigint.BigInt::from_int(3),
    ]),
  )
  let calls = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    calls.val += 1
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([1000000.0, 1000004.0]),
    )
  })
  f.set_axis(Some(binding))
  f.set_locs_view(@ticker.TickValues::from_array([]))
  assert_eq(calls.val, 0)
  assert_eq(f.offset(), Some(@ticker.ScalarNumber::Number(1000000.0)))
  assert_eq(
    f.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.format_pattern(), "")
  assert_eq(f.locations().length(), 0)
}

///|
test "Scalar original axis 9 set_locs exact axis dependency/order" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  f.set_scientific(true)
  let calls = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    calls.val += 1
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([1000000.0, 1000004.0]),
    )
  })
  f.set_axis(Some(binding))
  f.set_locs_view(@ticker.TickValues::from_array([1000000.0]))
  assert_eq(calls.val, 3)
  assert_eq(
    f.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(
    f.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  )
  assert_eq(f.format_pattern(), "%1.0f")
  assert_eq(f.locations().length(), 1)
  assert_eq(f.locations().get(0), 1000000.0)
}

///|
test "Scalar original axis 10 set_locs exact axis dependency/order" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  f.set_scientific(false)
  let calls = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    calls.val += 1
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([1000000.0, 1000004.0]),
    )
  })
  f.set_axis(Some(binding))
  f.set_locs_view(@ticker.TickValues::from_array([1000000.0]))
  assert_eq(calls.val, 2)
  assert_eq(
    f.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(
    f.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.format_pattern(), "%1.0f")
  assert_eq(f.locations().length(), 1)
  assert_eq(f.locations().get(0), 1000000.0)
}

///|
test "Scalar original axis 11 set_locs exact axis dependency/order" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  f.set_scientific(true)
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(3),
      @bigint.BigInt::from_int(3),
    ]),
  )
  let calls = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    calls.val += 1
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([1000000.0, 1000004.0]),
    )
  })
  f.set_axis(Some(binding))
  f.set_locs_view(@ticker.TickValues::from_array([1000000.0]))
  assert_eq(calls.val, 2)
  assert_eq(
    f.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(
    f.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("3")),
  )
  assert_eq(f.format_pattern(), "%1.0f")
  assert_eq(f.locations().length(), 1)
  assert_eq(f.locations().get(0), 1000000.0)
}

///|
test "Scalar original axis 12 set_locs exact axis dependency/order" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(false)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  f.set_scientific(true)
  let calls = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    calls.val += 1
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([1000000.0, 1000004.0]),
    )
  })
  f.set_axis(Some(binding))
  f.set_locs_view(@ticker.TickValues::from_array([1000000.0]))
  assert_eq(calls.val, 2)
  assert_eq(
    f.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(
    f.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  )
  assert_eq(f.format_pattern(), "%1.0f")
  assert_eq(f.locations().length(), 1)
  assert_eq(f.locations().get(0), 1000000.0)
}

///|
test "Scalar original axis 13 set_locs exact axis dependency/order" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(false)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  f.set_scientific(false)
  let calls = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    calls.val += 1
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([1000000.0, 1000004.0]),
    )
  })
  f.set_axis(Some(binding))
  f.set_locs_view(@ticker.TickValues::from_array([1000000.0]))
  assert_eq(calls.val, 1)
  assert_eq(
    f.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(
    f.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.format_pattern(), "%1.0f")
  assert_eq(f.locations().length(), 1)
  assert_eq(f.locations().get(0), 1000000.0)
}

///|
test "Scalar original axis 14 set_locs exact axis dependency/order" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(false)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  f.set_scientific(true)
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(3),
      @bigint.BigInt::from_int(3),
    ]),
  )
  let calls = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    calls.val += 1
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([1000000.0, 1000004.0]),
    )
  })
  f.set_axis(Some(binding))
  f.set_locs_view(@ticker.TickValues::from_array([1000000.0]))
  assert_eq(calls.val, 1)
  assert_eq(
    f.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(
    f.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("3")),
  )
  assert_eq(f.format_pattern(), "%1.0f")
  assert_eq(f.locations().length(), 1)
  assert_eq(f.locations().get(0), 1000000.0)
}

///|
test "Scalar original axis 15 set_locs exact axis dependency/order" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Number(1000000.0)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  f.set_scientific(true)
  let calls = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    calls.val += 1
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([1000000.0, 1000004.0]),
    )
  })
  f.set_axis(Some(binding))
  f.set_locs_view(@ticker.TickValues::from_array([1000000.0]))
  assert_eq(calls.val, 2)
  assert_eq(f.offset(), Some(@ticker.ScalarNumber::Number(1000000.0)))
  assert_eq(
    f.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.format_pattern(), "%1.0f")
  assert_eq(f.locations().length(), 1)
  assert_eq(f.locations().get(0), 1000000.0)
}

///|
test "Scalar original axis 16 set_locs exact axis dependency/order" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Number(1000000.0)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  f.set_scientific(false)
  let calls = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    calls.val += 1
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([1000000.0, 1000004.0]),
    )
  })
  f.set_axis(Some(binding))
  f.set_locs_view(@ticker.TickValues::from_array([1000000.0]))
  assert_eq(calls.val, 1)
  assert_eq(f.offset(), Some(@ticker.ScalarNumber::Number(1000000.0)))
  assert_eq(
    f.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.format_pattern(), "%1.0f")
  assert_eq(f.locations().length(), 1)
  assert_eq(f.locations().get(0), 1000000.0)
}

///|
test "Scalar original axis 17 set_locs exact axis dependency/order" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Number(1000000.0)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  f.set_scientific(true)
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(3),
      @bigint.BigInt::from_int(3),
    ]),
  )
  let calls = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    calls.val += 1
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([1000000.0, 1000004.0]),
    )
  })
  f.set_axis(Some(binding))
  f.set_locs_view(@ticker.TickValues::from_array([1000000.0]))
  assert_eq(calls.val, 1)
  assert_eq(f.offset(), Some(@ticker.ScalarNumber::Number(1000000.0)))
  assert_eq(
    f.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("3")),
  )
  assert_eq(f.format_pattern(), "%1.0f")
  assert_eq(f.locations().length(), 1)
  assert_eq(f.locations().get(0), 1000000.0)
}

///|
test "Scalar original axis 18 set_locs exact axis dependency/order" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  f.set_scientific(true)
  let calls = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    calls.val += 1
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([1000000.0, 1000004.0]),
    )
  })
  f.set_axis(Some(binding))
  f.set_locs_view(@ticker.TickValues::from_array([1000000.0, 1000002.0]))
  assert_eq(calls.val, 2)
  assert_eq(f.offset(), Some(@ticker.ScalarNumber::NumpyFloat64(1000000.0)))
  assert_eq(
    f.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.format_pattern(), "%1.0f")
  assert_eq(f.locations().length(), 2)
  assert_eq(f.locations().get(0), 1000000.0)
  assert_eq(f.locations().get(1), 1000002.0)
}

///|
test "Scalar original axis 19 set_locs exact axis dependency/order" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  f.set_scientific(false)
  let calls = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    calls.val += 1
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([1000000.0, 1000004.0]),
    )
  })
  f.set_axis(Some(binding))
  f.set_locs_view(@ticker.TickValues::from_array([1000000.0, 1000002.0]))
  assert_eq(calls.val, 1)
  assert_eq(f.offset(), Some(@ticker.ScalarNumber::NumpyFloat64(1000000.0)))
  assert_eq(
    f.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.format_pattern(), "%1.0f")
  assert_eq(f.locations().length(), 2)
  assert_eq(f.locations().get(0), 1000000.0)
  assert_eq(f.locations().get(1), 1000002.0)
}

///|
test "Scalar original axis 20 set_locs exact axis dependency/order" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  f.set_scientific(true)
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(3),
      @bigint.BigInt::from_int(3),
    ]),
  )
  let calls = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    calls.val += 1
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([1000000.0, 1000004.0]),
    )
  })
  f.set_axis(Some(binding))
  f.set_locs_view(@ticker.TickValues::from_array([1000000.0, 1000002.0]))
  assert_eq(calls.val, 1)
  assert_eq(f.offset(), Some(@ticker.ScalarNumber::NumpyFloat64(1000000.0)))
  assert_eq(
    f.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("3")),
  )
  assert_eq(f.format_pattern(), "%1.3f")
  assert_eq(f.locations().length(), 2)
  assert_eq(f.locations().get(0), 1000000.0)
  assert_eq(f.locations().get(1), 1000002.0)
}

///|
test "Scalar original axis 21 set_locs exact axis dependency/order" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(false)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  f.set_scientific(true)
  let calls = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    calls.val += 1
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([1000000.0, 1000004.0]),
    )
  })
  f.set_axis(Some(binding))
  f.set_locs_view(@ticker.TickValues::from_array([1000000.0, 1000002.0]))
  assert_eq(calls.val, 1)
  assert_eq(
    f.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(
    f.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  )
  assert_eq(f.format_pattern(), "%1.6f")
  assert_eq(f.locations().length(), 2)
  assert_eq(f.locations().get(0), 1000000.0)
  assert_eq(f.locations().get(1), 1000002.0)
}

///|
test "Scalar original axis 22 set_locs exact axis dependency/order" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(false)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  f.set_scientific(false)
  let calls = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    calls.val += 1
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([1000000.0, 1000004.0]),
    )
  })
  f.set_axis(Some(binding))
  f.set_locs_view(@ticker.TickValues::from_array([1000000.0, 1000002.0]))
  assert_eq(calls.val, 0)
  assert_eq(
    f.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(
    f.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.format_pattern(), "%1.0f")
  assert_eq(f.locations().length(), 2)
  assert_eq(f.locations().get(0), 1000000.0)
  assert_eq(f.locations().get(1), 1000002.0)
}

///|
test "Scalar original axis 23 set_locs exact axis dependency/order" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(false)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  f.set_scientific(true)
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(3),
      @bigint.BigInt::from_int(3),
    ]),
  )
  let calls = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    calls.val += 1
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([1000000.0, 1000004.0]),
    )
  })
  f.set_axis(Some(binding))
  f.set_locs_view(@ticker.TickValues::from_array([1000000.0, 1000002.0]))
  assert_eq(calls.val, 0)
  assert_eq(
    f.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(
    f.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("3")),
  )
  assert_eq(f.format_pattern(), "%1.3f")
  assert_eq(f.locations().length(), 2)
  assert_eq(f.locations().get(0), 1000000.0)
  assert_eq(f.locations().get(1), 1000002.0)
}

///|
test "Scalar original axis 24 set_locs exact axis dependency/order" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Number(1000000.0)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  f.set_scientific(true)
  let calls = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    calls.val += 1
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([1000000.0, 1000004.0]),
    )
  })
  f.set_axis(Some(binding))
  f.set_locs_view(@ticker.TickValues::from_array([1000000.0, 1000002.0]))
  assert_eq(calls.val, 1)
  assert_eq(f.offset(), Some(@ticker.ScalarNumber::Number(1000000.0)))
  assert_eq(
    f.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.format_pattern(), "%1.0f")
  assert_eq(f.locations().length(), 2)
  assert_eq(f.locations().get(0), 1000000.0)
  assert_eq(f.locations().get(1), 1000002.0)
}

///|
test "Scalar original axis 25 set_locs exact axis dependency/order" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Number(1000000.0)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  f.set_scientific(false)
  let calls = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    calls.val += 1
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([1000000.0, 1000004.0]),
    )
  })
  f.set_axis(Some(binding))
  f.set_locs_view(@ticker.TickValues::from_array([1000000.0, 1000002.0]))
  assert_eq(calls.val, 0)
  assert_eq(f.offset(), Some(@ticker.ScalarNumber::Number(1000000.0)))
  assert_eq(
    f.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.format_pattern(), "%1.0f")
  assert_eq(f.locations().length(), 2)
  assert_eq(f.locations().get(0), 1000000.0)
  assert_eq(f.locations().get(1), 1000002.0)
}

///|
test "Scalar original axis 26 set_locs exact axis dependency/order" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Number(1000000.0)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  f.set_scientific(true)
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(3),
      @bigint.BigInt::from_int(3),
    ]),
  )
  let calls = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    calls.val += 1
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([1000000.0, 1000004.0]),
    )
  })
  f.set_axis(Some(binding))
  f.set_locs_view(@ticker.TickValues::from_array([1000000.0, 1000002.0]))
  assert_eq(calls.val, 0)
  assert_eq(f.offset(), Some(@ticker.ScalarNumber::Number(1000000.0)))
  assert_eq(
    f.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("3")),
  )
  assert_eq(f.format_pattern(), "%1.3f")
  assert_eq(f.locations().length(), 2)
  assert_eq(f.locations().get(0), 1000000.0)
  assert_eq(f.locations().get(1), 1000002.0)
}

///|
test "Scalar original axis 27 set_locs exact axis dependency/order" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  f.set_scientific(true)
  let calls = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    calls.val += 1
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([1000000.0, 1000004.0]),
    )
  })
  f.set_axis(Some(binding))
  f.set_locs_view(
    @ticker.TickValues::from_array([1000000.0, 1000002.0, 1000004.0, 2000000.0]),
  )
  assert_eq(calls.val, 2)
  assert_eq(f.offset(), Some(@ticker.ScalarNumber::NumpyFloat64(1000000.0)))
  assert_eq(
    f.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.format_pattern(), "%1.0f")
  assert_eq(f.locations().length(), 4)
  assert_eq(f.locations().get(0), 1000000.0)
  assert_eq(f.locations().get(1), 1000002.0)
  assert_eq(f.locations().get(2), 1000004.0)
  assert_eq(f.locations().get(3), 2000000.0)
}

///|
test "Scalar original axis 28 set_locs exact axis dependency/order" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  f.set_scientific(false)
  let calls = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    calls.val += 1
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([1000000.0, 1000004.0]),
    )
  })
  f.set_axis(Some(binding))
  f.set_locs_view(
    @ticker.TickValues::from_array([1000000.0, 1000002.0, 1000004.0, 2000000.0]),
  )
  assert_eq(calls.val, 1)
  assert_eq(f.offset(), Some(@ticker.ScalarNumber::NumpyFloat64(1000000.0)))
  assert_eq(
    f.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.format_pattern(), "%1.0f")
  assert_eq(f.locations().length(), 4)
  assert_eq(f.locations().get(0), 1000000.0)
  assert_eq(f.locations().get(1), 1000002.0)
  assert_eq(f.locations().get(2), 1000004.0)
  assert_eq(f.locations().get(3), 2000000.0)
}

///|
test "Scalar original axis 29 set_locs exact axis dependency/order" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  f.set_scientific(true)
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(3),
      @bigint.BigInt::from_int(3),
    ]),
  )
  let calls = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    calls.val += 1
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([1000000.0, 1000004.0]),
    )
  })
  f.set_axis(Some(binding))
  f.set_locs_view(
    @ticker.TickValues::from_array([1000000.0, 1000002.0, 1000004.0, 2000000.0]),
  )
  assert_eq(calls.val, 1)
  assert_eq(f.offset(), Some(@ticker.ScalarNumber::NumpyFloat64(1000000.0)))
  assert_eq(
    f.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("3")),
  )
  assert_eq(f.format_pattern(), "%1.0f")
  assert_eq(f.locations().length(), 4)
  assert_eq(f.locations().get(0), 1000000.0)
  assert_eq(f.locations().get(1), 1000002.0)
  assert_eq(f.locations().get(2), 1000004.0)
  assert_eq(f.locations().get(3), 2000000.0)
}

///|
test "Scalar original axis 30 set_locs exact axis dependency/order" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(false)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  f.set_scientific(true)
  let calls = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    calls.val += 1
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([1000000.0, 1000004.0]),
    )
  })
  f.set_axis(Some(binding))
  f.set_locs_view(
    @ticker.TickValues::from_array([1000000.0, 1000002.0, 1000004.0, 2000000.0]),
  )
  assert_eq(calls.val, 1)
  assert_eq(
    f.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(
    f.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  )
  assert_eq(f.format_pattern(), "%1.0f")
  assert_eq(f.locations().length(), 4)
  assert_eq(f.locations().get(0), 1000000.0)
  assert_eq(f.locations().get(1), 1000002.0)
  assert_eq(f.locations().get(2), 1000004.0)
  assert_eq(f.locations().get(3), 2000000.0)
}

///|
test "Scalar original axis 31 set_locs exact axis dependency/order" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(false)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  f.set_scientific(false)
  let calls = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    calls.val += 1
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([1000000.0, 1000004.0]),
    )
  })
  f.set_axis(Some(binding))
  f.set_locs_view(
    @ticker.TickValues::from_array([1000000.0, 1000002.0, 1000004.0, 2000000.0]),
  )
  assert_eq(calls.val, 0)
  assert_eq(
    f.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(
    f.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.format_pattern(), "%1.0f")
  assert_eq(f.locations().length(), 4)
  assert_eq(f.locations().get(0), 1000000.0)
  assert_eq(f.locations().get(1), 1000002.0)
  assert_eq(f.locations().get(2), 1000004.0)
  assert_eq(f.locations().get(3), 2000000.0)
}

///|
test "Scalar original axis 32 set_locs exact axis dependency/order" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(false)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  f.set_scientific(true)
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(3),
      @bigint.BigInt::from_int(3),
    ]),
  )
  let calls = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    calls.val += 1
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([1000000.0, 1000004.0]),
    )
  })
  f.set_axis(Some(binding))
  f.set_locs_view(
    @ticker.TickValues::from_array([1000000.0, 1000002.0, 1000004.0, 2000000.0]),
  )
  assert_eq(calls.val, 0)
  assert_eq(
    f.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(
    f.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("3")),
  )
  assert_eq(f.format_pattern(), "%1.0f")
  assert_eq(f.locations().length(), 4)
  assert_eq(f.locations().get(0), 1000000.0)
  assert_eq(f.locations().get(1), 1000002.0)
  assert_eq(f.locations().get(2), 1000004.0)
  assert_eq(f.locations().get(3), 2000000.0)
}

///|
test "Scalar original axis 33 set_locs exact axis dependency/order" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Number(1000000.0)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  f.set_scientific(true)
  let calls = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    calls.val += 1
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([1000000.0, 1000004.0]),
    )
  })
  f.set_axis(Some(binding))
  f.set_locs_view(
    @ticker.TickValues::from_array([1000000.0, 1000002.0, 1000004.0, 2000000.0]),
  )
  assert_eq(calls.val, 1)
  assert_eq(f.offset(), Some(@ticker.ScalarNumber::Number(1000000.0)))
  assert_eq(
    f.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.format_pattern(), "%1.0f")
  assert_eq(f.locations().length(), 4)
  assert_eq(f.locations().get(0), 1000000.0)
  assert_eq(f.locations().get(1), 1000002.0)
  assert_eq(f.locations().get(2), 1000004.0)
  assert_eq(f.locations().get(3), 2000000.0)
}

///|
test "Scalar original axis 34 set_locs exact axis dependency/order" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Number(1000000.0)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  f.set_scientific(false)
  let calls = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    calls.val += 1
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([1000000.0, 1000004.0]),
    )
  })
  f.set_axis(Some(binding))
  f.set_locs_view(
    @ticker.TickValues::from_array([1000000.0, 1000002.0, 1000004.0, 2000000.0]),
  )
  assert_eq(calls.val, 0)
  assert_eq(f.offset(), Some(@ticker.ScalarNumber::Number(1000000.0)))
  assert_eq(
    f.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.format_pattern(), "%1.0f")
  assert_eq(f.locations().length(), 4)
  assert_eq(f.locations().get(0), 1000000.0)
  assert_eq(f.locations().get(1), 1000002.0)
  assert_eq(f.locations().get(2), 1000004.0)
  assert_eq(f.locations().get(3), 2000000.0)
}

///|
test "Scalar original axis 35 set_locs exact axis dependency/order" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Number(1000000.0)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  f.set_scientific(true)
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(3),
      @bigint.BigInt::from_int(3),
    ]),
  )
  let calls = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    calls.val += 1
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([1000000.0, 1000004.0]),
    )
  })
  f.set_axis(Some(binding))
  f.set_locs_view(
    @ticker.TickValues::from_array([1000000.0, 1000002.0, 1000004.0, 2000000.0]),
  )
  assert_eq(calls.val, 0)
  assert_eq(f.offset(), Some(@ticker.ScalarNumber::Number(1000000.0)))
  assert_eq(
    f.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("3")),
  )
  assert_eq(f.format_pattern(), "%1.0f")
  assert_eq(f.locations().length(), 4)
  assert_eq(f.locations().get(0), 1000000.0)
  assert_eq(f.locations().get(1), 1000002.0)
  assert_eq(f.locations().get(2), 1000004.0)
  assert_eq(f.locations().get(3), 2000000.0)
}

///|
test "Scalar original axis 36 view error partial state singleton" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let calls = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    calls.val += 1
    if calls.val == 1 {
      raise @core.DataError::InvalidTicks(message="ValueError: view stage 1")
    }
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([1000000.0, 1000004.0]),
    )
  })
  f.set_axis(Some(binding))
  let failed = try {
    ignore(f.set_locs_view(@ticker.TickValues::from_array([1000001.0])))
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(message, "ValueError: view stage 1")
      true
    }
    _ => false
  }
  assert_true(failed)
  assert_eq(calls.val, 1)
  assert_eq(
    f.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(
    f.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.format_pattern(), "")
  assert_eq(f.locations().length(), 1)
  assert_eq(f.locations().get(0), 1000001.0)
}

///|
test "Scalar original axis 37 view error partial state singleton" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let calls = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    calls.val += 1
    if calls.val == 2 {
      raise @core.DataError::InvalidTicks(message="ValueError: view stage 2")
    }
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([1000000.0, 1000004.0]),
    )
  })
  f.set_axis(Some(binding))
  let failed = try {
    ignore(f.set_locs_view(@ticker.TickValues::from_array([1000001.0])))
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(message, "ValueError: view stage 2")
      true
    }
    _ => false
  }
  assert_true(failed)
  assert_eq(calls.val, 2)
  assert_eq(
    f.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(
    f.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.format_pattern(), "")
  assert_eq(f.locations().length(), 1)
  assert_eq(f.locations().get(0), 1000001.0)
}

///|
test "Scalar original axis 38 view error partial state singleton" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let calls = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    calls.val += 1
    if calls.val == 3 {
      raise @core.DataError::InvalidTicks(message="ValueError: view stage 3")
    }
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([1000000.0, 1000004.0]),
    )
  })
  f.set_axis(Some(binding))
  let failed = try {
    ignore(f.set_locs_view(@ticker.TickValues::from_array([1000001.0])))
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(message, "ValueError: view stage 3")
      true
    }
    _ => false
  }
  assert_true(failed)
  assert_eq(calls.val, 3)
  assert_eq(
    f.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(
    f.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  )
  assert_eq(f.format_pattern(), "")
  assert_eq(f.locations().length(), 1)
  assert_eq(f.locations().get(0), 1000001.0)
}

///|
test "Scalar original axis 39 full locations versus visible offset/order" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  binding.set_view_interval(
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([1000000.0, 1000004.0]),
    ),
  )
  f.set_axis(Some(binding))
  assert_eq(f.format_ticks_view(@ticker.TickValues::from_array([])), [])
  assert_eq(f.get_offset(), "")
  assert_eq(
    f.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(
    f.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.format_pattern(), "")
  assert_eq(f.locations().length(), 0)
}

///|
test "Scalar original axis 40 full locations versus visible offset/order" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  binding.set_view_interval(
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([1000000.0, 1000004.0]),
    ),
  )
  f.set_axis(Some(binding))
  assert_eq(
    f.format_ticks_view(
      @ticker.TickValues::from_array([
        1000000.0, 1000002.0, 1000004.0, 2000000.0,
      ]),
    ),
    ["0", "2", "4", "1000000"],
  )
  assert_eq(f.get_offset(), "+1e6")
  assert_eq(f.offset(), Some(@ticker.ScalarNumber::NumpyFloat64(1000000.0)))
  assert_eq(
    f.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.format_pattern(), "%1.0f")
  assert_eq(f.locations().length(), 4)
  assert_eq(f.locations().get(0), 1000000.0)
  assert_eq(f.locations().get(1), 1000002.0)
  assert_eq(f.locations().get(2), 1000004.0)
  assert_eq(f.locations().get(3), 2000000.0)
}

///|
test "Scalar original axis 41 full locations versus visible offset/order" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  binding.set_view_interval(
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([1000000.0, 1000004.0]),
    ),
  )
  f.set_axis(Some(binding))
  assert_eq(
    f.format_ticks_view(
      @ticker.TickValues::from_array([
        999999.0, 1000000.0, 1000002.0, 1000004.0, 1000005.0,
      ]),
    ),
    ["−1", "0", "2", "4", "5"],
  )
  assert_eq(f.get_offset(), "+1e6")
  assert_eq(f.offset(), Some(@ticker.ScalarNumber::NumpyFloat64(1000000.0)))
  assert_eq(
    f.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.format_pattern(), "%1.0f")
  assert_eq(f.locations().length(), 5)
  assert_eq(f.locations().get(0), 999999.0)
  assert_eq(f.locations().get(1), 1000000.0)
  assert_eq(f.locations().get(2), 1000002.0)
  assert_eq(f.locations().get(3), 1000004.0)
  assert_eq(f.locations().get(4), 1000005.0)
}

///|
test "Scalar original axis 42 full locations versus visible offset/order" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  binding.set_view_interval(
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([1000000.0, 1000004.0]),
    ),
  )
  f.set_axis(Some(binding))
  let failed = try {
    ignore(
      f.format_ticks_view(
        @ticker.TickValues::from_array([0.0 / 0.0, 1000001.0]),
      ),
    )
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(message, "ValueError: cannot convert float NaN to integer")
      true
    }
    _ => false
  }
  assert_true(failed)
  assert_eq(
    f.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(
    f.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  )
  assert_eq(f.format_pattern(), "")
  assert_eq(f.locations().length(), 2)
  assert_true(f.locations().get(0).is_nan())
  assert_eq(f.locations().get(1), 1000001.0)
}

///|
test "Scalar original axis 43 full locations versus visible offset/order" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  binding.set_view_interval(
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([1000000.0, 1000004.0]),
    ),
  )
  f.set_axis(Some(binding))
  let failed = try {
    ignore(
      f.format_ticks_view(
        @ticker.TickValues::from_array([1.0 / 0.0, 1000001.0]),
      ),
    )
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(
        message, "OverflowError: cannot convert float infinity to integer",
      )
      true
    }
    _ => false
  }
  assert_true(failed)
  assert_eq(
    f.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(
    f.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  )
  assert_eq(f.format_pattern(), "")
  assert_eq(f.locations().length(), 2)
  assert_eq(f.locations().get(0), 1.0 / 0.0)
  assert_eq(f.locations().get(1), 1000001.0)
}

///|
test "Scalar original axis 44 unbound method" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  assert_eq(f.call(1.0), "")
}

///|
test "Scalar original axis 45 unbound method" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  assert_eq(f.format_data(1.0), "1")
}

///|
test "Scalar original axis 46 unbound method" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let failed = try {
    ignore(f.format_data_short(1.0))
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(
        message, "AttributeError: 'NoneType' object has no attribute 'get_view_interval'",
      )
      true
    }
    _ => false
  }
  assert_true(failed)
}

///|
test "Scalar original axis 47 unbound method" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  assert_eq(f.get_offset(), "")
}

///|
test "Scalar original axis 48 unbound nonempty works when both view consumers disabled" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(false)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  f.set_scientific(false)
  assert_eq(f.format_ticks_view(@ticker.TickValues::from_array([1.0, 2.0])), [
    "1", "2",
  ])
  assert_eq(f.get_offset(), "")
  assert_eq(
    f.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(
    f.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.format_pattern(), "%1.0f")
  assert_eq(f.locations().length(), 2)
  assert_eq(f.locations().get(0), 1.0)
  assert_eq(f.locations().get(1), 2.0)
}

///|
test "Scalar original axis 49 empty locations preserve numerical state and empty output" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  binding.set_view_interval(
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([1000000.0, 1000004.0]),
    ),
  )
  f.set_axis(Some(binding))
  ignore(
    f.format_ticks_view(
      @ticker.TickValues::from_array([1000000.0, 1000002.0, 1000004.0]),
    ),
  )
  assert_eq(f.offset(), Some(@ticker.ScalarNumber::NumpyFloat64(1000000.0)))
  assert_eq(
    f.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.format_pattern(), "%1.0f")
  assert_eq(f.locations().length(), 3)
  assert_eq(f.locations().get(0), 1000000.0)
  assert_eq(f.locations().get(1), 1000002.0)
  assert_eq(f.locations().get(2), 1000004.0)
  f.set_locs([])
  assert_eq(f.offset(), Some(@ticker.ScalarNumber::NumpyFloat64(1000000.0)))
  assert_eq(
    f.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.format_pattern(), "%1.0f")
  assert_eq(f.locations().length(), 0)
  assert_eq(f.call(1000002.0), "")
  assert_eq(f.get_offset(), "")
}

///|
test "Scalar original axis 50 actual pixel-neighbor short format linear" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let axis = @axis.axis()
  axis.set_limits(0.0, 1.0)
  axis.set_scale(@scale.linear_scale())
  axis.bind_formatter_geometry(() => (40.0, 100.0))
  axis.set_named_formatter(f.as_base_formatter())
  assert_eq(f.format_data_short(0.123456789), "0.12")
}

///|
test "Scalar original axis 51 actual pixel-neighbor short format linear" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let axis = @axis.axis()
  axis.set_limits(0.0, 1.0)
  axis.set_scale(@scale.linear_scale())
  axis.bind_formatter_geometry(() => (40.0, 400.0))
  axis.set_named_formatter(f.as_base_formatter())
  assert_eq(f.format_data_short(0.123456789), "0.123")
}

///|
test "Scalar original axis 52 actual pixel-neighbor short format linear" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let axis = @axis.axis()
  axis.set_limits(0.0, 1.0)
  axis.set_scale(@scale.linear_scale())
  axis.bind_formatter_geometry(() => (40.0, 1000.0))
  axis.set_named_formatter(f.as_base_formatter())
  assert_eq(f.format_data_short(0.123456789), "0.123")
}

///|
test "Scalar original axis 53 actual pixel-neighbor short format nonlinear" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let axis = @axis.axis()
  axis.set_limits(1.0, 1000.0)
  axis.set_scale(@scale.log_scale())
  axis.bind_formatter_geometry(() => (40.0, 400.0))
  axis.set_named_formatter(f.as_base_formatter())
  assert_eq(f.format_data_short(13.123456789), "13.1")
}

///|
test "Scalar original axis 54 actual pixel-neighbor short format nonlinear" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let axis = @axis.axis()
  axis.set_limits(-100.0, 100.0)
  axis.set_scale(@scale.symlog_scale(linthresh=2.0))
  axis.bind_formatter_geometry(() => (40.0, 400.0))
  axis.set_named_formatter(f.as_base_formatter())
  assert_eq(f.format_data_short(0.123456789), "0.12")
}

///|
test "Scalar original axis 55 actual pixel-neighbor short format nonlinear" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let axis = @axis.axis()
  axis.set_limits(-100.0, 100.0)
  axis.set_scale(@scale.asinh_scale())
  axis.bind_formatter_geometry(() => (40.0, 400.0))
  axis.set_named_formatter(f.as_base_formatter())
  assert_eq(f.format_data_short(0.123456789), "0.12")
}

///|
test "Scalar original axis 56 actual pixel-neighbor short format nonlinear" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let axis = @axis.axis()
  axis.set_limits(0.01, 0.99)
  axis.set_scale(@scale.logit_scale())
  axis.bind_formatter_geometry(() => (40.0, 400.0))
  axis.set_named_formatter(f.as_base_formatter())
  assert_eq(f.format_data_short(0.123456789), "0.123")
}

///|
test "Scalar original axis 57 actual pixel-neighbor short format linear" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let axis = @axis.axis()
  axis.set_limits(0.0, 1.0)
  axis.set_scale(@scale.linear_scale())
  axis.bind_formatter_geometry(() => (60.0, 300.0))
  axis.set_named_formatter(f.as_base_formatter())
  assert_eq(f.format_data_short(0.123456789), "0.123")
}

///|
test "Scalar original axis 58 actual pixel-neighbor short format linear" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let axis = @axis.axis()
  axis.set_limits(0.0, 1.0)
  axis.set_scale(@scale.linear_scale())
  axis.bind_formatter_geometry(() => (60.0, 300.0))
  axis.set_named_formatter(f.as_base_formatter())
  assert_eq(f.format_data_short(0.123456789), "0.123")
}

///|
test "Scalar original axis 59 actual pixel-neighbor short format linear" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let axis = @axis.axis()
  axis.set_limits(0.0, 1.0)
  axis.set_scale(@scale.linear_scale())
  axis.bind_formatter_geometry(() => (60.0, 300.0))
  axis.set_named_formatter(f.as_base_formatter())
  assert_eq(f.format_data_short(0.123456789), "0.123")
}

///|
test "Scalar original axis 60 actual pixel-neighbor short format nonlinear" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let axis = @axis.axis()
  axis.set_limits(1.0, 1000.0)
  axis.set_scale(@scale.log_scale())
  axis.bind_formatter_geometry(() => (60.0, 300.0))
  axis.set_named_formatter(f.as_base_formatter())
  assert_eq(f.format_data_short(13.123456789), "13.1")
}

///|
test "Scalar original axis 61 actual pixel-neighbor short format nonlinear" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let axis = @axis.axis()
  axis.set_limits(-100.0, 100.0)
  axis.set_scale(@scale.symlog_scale(linthresh=2.0))
  axis.bind_formatter_geometry(() => (60.0, 300.0))
  axis.set_named_formatter(f.as_base_formatter())
  assert_eq(f.format_data_short(0.123456789), "0.12")
}

///|
test "Scalar original axis 62 actual pixel-neighbor short format nonlinear" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let axis = @axis.axis()
  axis.set_limits(-100.0, 100.0)
  axis.set_scale(@scale.asinh_scale())
  axis.bind_formatter_geometry(() => (60.0, 300.0))
  axis.set_named_formatter(f.as_base_formatter())
  assert_eq(f.format_data_short(0.123456789), "0.12")
}

///|
test "Scalar original axis 63 actual pixel-neighbor short format nonlinear" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let axis = @axis.axis()
  axis.set_limits(0.01, 0.99)
  axis.set_scale(@scale.logit_scale())
  axis.bind_formatter_geometry(() => (60.0, 300.0))
  axis.set_named_formatter(f.as_base_formatter())
  assert_eq(f.format_data_short(0.123456789), "0.123")
}

///|
test "Scalar original axis 64 dummy short format range fallback" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  f.create_dummy_axis()
  f
  .axis()
  .unwrap()
  .set_view_interval(@ticker.FormatterViewInterval::Sequence([0.0, 1.0]))
  assert_eq(f.format_data_short(0.123456789), "0.1235")
}

///|
test "Scalar original axis 65 complete Axis.draw offset order" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let figure = @scene.figure(width=320, height=200)
  let axes = figure.axes()
  axes.set_x_limits(1000000.0, 1000004.0)
  axes.set_y_limits(1000000.0, 1000004.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.x_axis()
  let major = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  major.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let major_locs = [999999.0, 1000000.0, 1000002.0, 1000004.0, 1000005.0]
  axis.set_locator(@ticker.FixedLocator::new(major_locs).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::new([1000001.0, 1000003.0]).as_minor_locator(),
  )
  axis.set_named_formatter(major.as_base_formatter())
  let minor = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  minor.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  axis.set_minor_named_formatter(minor.as_base_formatter())
  let svg = figure.to_svg_checked()
  assert_eq(svg.split(">+1e6<").count() - 1, 1)
  assert_eq(svg.split(">0<").count() - 1, 1)
  assert_eq(svg.split(">2<").count() - 1, 1)
  assert_eq(svg.split(">4<").count() - 1, 1)
  assert_eq(svg.split(">1<").count() - 1, 1)
  assert_eq(svg.split(">3<").count() - 1, 1)
  assert_eq(major.offset(), Some(@ticker.ScalarNumber::NumpyFloat64(1000000.0)))
  assert_eq(
    major.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(major.format_pattern(), "%1.0f")
  assert_eq(major.locations().length(), 5)
  assert_eq(major.locations().get(0), 999999.0)
  assert_eq(major.locations().get(1), 1000000.0)
  assert_eq(major.locations().get(2), 1000002.0)
  assert_eq(major.locations().get(3), 1000004.0)
  assert_eq(major.locations().get(4), 1000005.0)
  assert_eq(minor.offset(), Some(@ticker.ScalarNumber::NumpyFloat64(1000000.0)))
  assert_eq(
    minor.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(minor.format_pattern(), "%1.0f")
  assert_eq(minor.locations().length(), 2)
  assert_eq(minor.locations().get(0), 1000001.0)
  assert_eq(minor.locations().get(1), 1000003.0)
}

///|
test "Scalar original axis 66 complete Axis.draw offset order" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let figure = @scene.figure(width=320, height=200)
  let axes = figure.axes()
  axes.set_x_limits(1000000.0, 1000004.0)
  axes.set_y_limits(1000000.0, 1000004.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.x_axis()
  let major = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  major.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let major_locs = [999999.0, 1000000.0, 1000002.0, 1000004.0, 1000005.0]
  axis.set_locator(@ticker.FixedLocator::new(major_locs).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::new([1000001.0, 1000003.0]).as_minor_locator(),
  )
  axis.set_named_formatter(major.as_base_formatter())
  axis.set_minor_named_formatter(major.as_base_formatter())
  let svg = figure.to_svg_checked()
  assert_eq(svg.split(">+1e6<").count() - 1, 1)
  assert_eq(svg.split(">0<").count() - 1, 1)
  assert_eq(svg.split(">2<").count() - 1, 1)
  assert_eq(svg.split(">4<").count() - 1, 1)
  assert_eq(svg.split(">1<").count() - 1, 1)
  assert_eq(svg.split(">3<").count() - 1, 1)
  assert_eq(major.offset(), Some(@ticker.ScalarNumber::NumpyFloat64(1000000.0)))
  assert_eq(
    major.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(major.format_pattern(), "%1.0f")
  assert_eq(major.locations().length(), 2)
  assert_eq(major.locations().get(0), 1000001.0)
  assert_eq(major.locations().get(1), 1000003.0)
}

///|
test "Scalar original axis 67 complete Axis.draw offset order" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let figure = @scene.figure(width=320, height=200)
  let axes = figure.axes()
  axes.set_x_limits(1000000.0, 1000004.0)
  axes.set_y_limits(1000000.0, 1000004.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.x_axis()
  let major = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  major.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let major_locs = [999999.0, 1000000.0, 1000002.0, 1000004.0, 1000005.0]
  axis.set_locator(@ticker.FixedLocator::new(major_locs).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::new([1000001.0, 1000003.0]).as_minor_locator(),
  )
  axis.set_named_formatter(major.as_base_formatter())
  axis.set_minor_named_formatter(
    @ticker.FuncFormatter::new((_, pos) => {
      major.set_use_offset(Some(@ticker.ScalarNumber::Number(2000000.0)))
      pos.unwrap().to_string()
    }).as_base_formatter(),
  )
  let svg = figure.to_svg_checked()
  assert_eq(svg.split(">+2e6<").count() - 1, 1)
  assert_eq(svg.split(">0<").count() - 1, 2)
  assert_eq(svg.split(">2<").count() - 1, 1)
  assert_eq(svg.split(">4<").count() - 1, 1)
  assert_eq(svg.split(">1<").count() - 1, 1)
  assert_eq(major.offset(), Some(@ticker.ScalarNumber::Number(2000000.0)))
  assert_eq(
    major.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(major.format_pattern(), "%1.0f")
  assert_eq(major.locations().length(), 5)
  assert_eq(major.locations().get(0), 999999.0)
  assert_eq(major.locations().get(1), 1000000.0)
  assert_eq(major.locations().get(2), 1000002.0)
  assert_eq(major.locations().get(3), 1000004.0)
  assert_eq(major.locations().get(4), 1000005.0)
}

///|
test "Scalar original axis 68 complete Axis.draw offset order" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let figure = @scene.figure(width=320, height=200)
  let axes = figure.axes()
  axes.set_x_limits(1000000.0, 1000004.0)
  axes.set_y_limits(1000000.0, 1000004.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.x_axis()
  let major = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  major.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let major_locs = [999999.0, 1000000.0, 1000002.0, 1000004.0, 1000005.0]
  axis.set_locator(@ticker.FixedLocator::new(major_locs).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::new([1000001.0, 1000003.0]).as_minor_locator(),
  )
  axis.set_named_formatter(major.as_base_formatter())
  ignore(
    major.format_ticks_view(
      @ticker.TickValues::from_array([1000000.0, 1000002.0, 1000004.0]),
    ),
  )
  axis.set_locator(@ticker.NullLocator::new().as_locator())
  axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let svg = figure.to_svg_checked()
  assert_eq(svg.split(">+1e6<").count() - 1, 1)
  assert_eq(major.offset(), Some(@ticker.ScalarNumber::NumpyFloat64(1000000.0)))
  assert_eq(
    major.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(major.format_pattern(), "%1.0f")
  assert_eq(major.locations().length(), 3)
  assert_eq(major.locations().get(0), 1000000.0)
  assert_eq(major.locations().get(1), 1000002.0)
  assert_eq(major.locations().get(2), 1000004.0)
}

///|
test "Scalar original axis 69 complete Axis.draw offset order" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let figure = @scene.figure(width=320, height=200)
  let axes = figure.axes()
  axes.set_x_limits(1000000.0, 1000004.0)
  axes.set_y_limits(1000000.0, 1000004.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.y_axis()
  let major = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  major.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let major_locs = [999999.0, 1000000.0, 1000002.0, 1000004.0, 1000005.0]
  axis.set_locator(@ticker.FixedLocator::new(major_locs).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::new([1000001.0, 1000003.0]).as_minor_locator(),
  )
  axis.set_named_formatter(major.as_base_formatter())
  let minor = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  minor.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  axis.set_minor_named_formatter(minor.as_base_formatter())
  let svg = figure.to_svg_checked()
  assert_eq(svg.split(">+1e6<").count() - 1, 1)
  assert_eq(svg.split(">0<").count() - 1, 1)
  assert_eq(svg.split(">2<").count() - 1, 1)
  assert_eq(svg.split(">4<").count() - 1, 1)
  assert_eq(svg.split(">1<").count() - 1, 1)
  assert_eq(svg.split(">3<").count() - 1, 1)
  assert_eq(major.offset(), Some(@ticker.ScalarNumber::NumpyFloat64(1000000.0)))
  assert_eq(
    major.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(major.format_pattern(), "%1.0f")
  assert_eq(major.locations().length(), 5)
  assert_eq(major.locations().get(0), 999999.0)
  assert_eq(major.locations().get(1), 1000000.0)
  assert_eq(major.locations().get(2), 1000002.0)
  assert_eq(major.locations().get(3), 1000004.0)
  assert_eq(major.locations().get(4), 1000005.0)
  assert_eq(minor.offset(), Some(@ticker.ScalarNumber::NumpyFloat64(1000000.0)))
  assert_eq(
    minor.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(minor.format_pattern(), "%1.0f")
  assert_eq(minor.locations().length(), 2)
  assert_eq(minor.locations().get(0), 1000001.0)
  assert_eq(minor.locations().get(1), 1000003.0)
}

///|
test "Scalar original axis 70 complete Axis.draw offset order" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let figure = @scene.figure(width=320, height=200)
  let axes = figure.axes()
  axes.set_x_limits(1000000.0, 1000004.0)
  axes.set_y_limits(1000000.0, 1000004.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.y_axis()
  let major = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  major.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let major_locs = [999999.0, 1000000.0, 1000002.0, 1000004.0, 1000005.0]
  axis.set_locator(@ticker.FixedLocator::new(major_locs).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::new([1000001.0, 1000003.0]).as_minor_locator(),
  )
  axis.set_named_formatter(major.as_base_formatter())
  axis.set_minor_named_formatter(major.as_base_formatter())
  let svg = figure.to_svg_checked()
  assert_eq(svg.split(">+1e6<").count() - 1, 1)
  assert_eq(svg.split(">0<").count() - 1, 1)
  assert_eq(svg.split(">2<").count() - 1, 1)
  assert_eq(svg.split(">4<").count() - 1, 1)
  assert_eq(svg.split(">1<").count() - 1, 1)
  assert_eq(svg.split(">3<").count() - 1, 1)
  assert_eq(major.offset(), Some(@ticker.ScalarNumber::NumpyFloat64(1000000.0)))
  assert_eq(
    major.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(major.format_pattern(), "%1.0f")
  assert_eq(major.locations().length(), 2)
  assert_eq(major.locations().get(0), 1000001.0)
  assert_eq(major.locations().get(1), 1000003.0)
}

///|
test "Scalar original axis 71 complete Axis.draw offset order" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let figure = @scene.figure(width=320, height=200)
  let axes = figure.axes()
  axes.set_x_limits(1000000.0, 1000004.0)
  axes.set_y_limits(1000000.0, 1000004.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.y_axis()
  let major = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  major.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let major_locs = [999999.0, 1000000.0, 1000002.0, 1000004.0, 1000005.0]
  axis.set_locator(@ticker.FixedLocator::new(major_locs).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::new([1000001.0, 1000003.0]).as_minor_locator(),
  )
  axis.set_named_formatter(major.as_base_formatter())
  axis.set_minor_named_formatter(
    @ticker.FuncFormatter::new((_, pos) => {
      major.set_use_offset(Some(@ticker.ScalarNumber::Number(2000000.0)))
      pos.unwrap().to_string()
    }).as_base_formatter(),
  )
  let svg = figure.to_svg_checked()
  assert_eq(svg.split(">+2e6<").count() - 1, 1)
  assert_eq(svg.split(">0<").count() - 1, 2)
  assert_eq(svg.split(">2<").count() - 1, 1)
  assert_eq(svg.split(">4<").count() - 1, 1)
  assert_eq(svg.split(">1<").count() - 1, 1)
  assert_eq(major.offset(), Some(@ticker.ScalarNumber::Number(2000000.0)))
  assert_eq(
    major.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(major.format_pattern(), "%1.0f")
  assert_eq(major.locations().length(), 5)
  assert_eq(major.locations().get(0), 999999.0)
  assert_eq(major.locations().get(1), 1000000.0)
  assert_eq(major.locations().get(2), 1000002.0)
  assert_eq(major.locations().get(3), 1000004.0)
  assert_eq(major.locations().get(4), 1000005.0)
}

///|
test "Scalar original axis 72 complete Axis.draw offset order" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let figure = @scene.figure(width=320, height=200)
  let axes = figure.axes()
  axes.set_x_limits(1000000.0, 1000004.0)
  axes.set_y_limits(1000000.0, 1000004.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.y_axis()
  let major = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  major.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let major_locs = [999999.0, 1000000.0, 1000002.0, 1000004.0, 1000005.0]
  axis.set_locator(@ticker.FixedLocator::new(major_locs).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::new([1000001.0, 1000003.0]).as_minor_locator(),
  )
  axis.set_named_formatter(major.as_base_formatter())
  ignore(
    major.format_ticks_view(
      @ticker.TickValues::from_array([1000000.0, 1000002.0, 1000004.0]),
    ),
  )
  axis.set_locator(@ticker.NullLocator::new().as_locator())
  axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let svg = figure.to_svg_checked()
  assert_eq(svg.split(">+1e6<").count() - 1, 1)
  assert_eq(major.offset(), Some(@ticker.ScalarNumber::NumpyFloat64(1000000.0)))
  assert_eq(
    major.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(major.format_pattern(), "%1.0f")
  assert_eq(major.locations().length(), 3)
  assert_eq(major.locations().get(0), 1000000.0)
  assert_eq(major.locations().get(1), 1000002.0)
  assert_eq(major.locations().get(2), 1000004.0)
}

///|
test "Scalar original axis 73 shared last setter controls preparation view" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let figure = @scene.figure()
  let panels = figure.subplots(1, 2, share_x=true)
  let first = panels[0]
  let second = panels[1]
  let a = first.x_axis()
  let b = second.x_axis()
  a.set_limits(1000000.0, 1000004.0)
  b.set_limits(0.0, 2000000.0)
  a.bind_view_interval(() => (1000000.0, 1000004.0))
  b.bind_view_interval(() => (0.0, 2000000.0))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  first.set_x_named_formatter(f.as_base_formatter())
  let old = f.copy()
  second.set_x_named_formatter(f.as_base_formatter())
  let external = f.copy()
  let values = @ticker.TickValues::from_array([1000000.0, 1000002.0, 1000004.0])
  assert_eq(f.format_ticks_view(values), ["0.000000", "0.000002", "0.000004"])
  assert_eq(f.get_offset(), "1e6+1e6")
  assert_eq(old.format_ticks_view(values), ["0", "2", "4"])
  assert_eq(old.get_offset(), "+1e6")
  assert_eq(f.axis(), Some(b.formatter_axis_binding()))
  ignore(external)
}

///|
test "Scalar original axis 74 shared deletion installed versus detached external" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let figure = @scene.figure()
  let panels = figure.subplots(1, 2, share_x=true)
  let first = panels[0]
  let second = panels[1]
  let a = first.x_axis()
  let b = second.x_axis()
  a.set_limits(1000000.0, 1000004.0)
  b.set_limits(0.0, 2000000.0)
  a.bind_view_interval(() => (1000000.0, 1000004.0))
  b.bind_view_interval(() => (0.0, 2000000.0))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  first.set_x_named_formatter(f.as_base_formatter())
  let old = f.copy()
  second.set_x_named_formatter(f.as_base_formatter())
  let external = f.copy()
  let values = @ticker.TickValues::from_array([1000000.0, 1000002.0, 1000004.0])
  second.remove()
  assert_eq(f.format_ticks_view(values), ["0", "2", "4"])
  assert_eq(f.get_offset(), "+1e6")
  assert_eq(external.format_ticks_view(values), [
    "0.000000", "0.000002", "0.000004",
  ])
  assert_eq(external.get_offset(), "1e6+1e6")
  assert_eq(f.axis(), Some(a.formatter_axis_binding()))
  assert_eq(external.axis(), Some(b.formatter_axis_binding()))
  ignore(old)
}

///|
test "Scalar original axis 75 shared last setter controls preparation view" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let figure = @scene.figure()
  let panels = figure.subplots(1, 2, share_y=true)
  let first = panels[0]
  let second = panels[1]
  let a = first.y_axis()
  let b = second.y_axis()
  a.set_limits(1000000.0, 1000004.0)
  b.set_limits(0.0, 2000000.0)
  a.bind_view_interval(() => (1000000.0, 1000004.0))
  b.bind_view_interval(() => (0.0, 2000000.0))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  first.set_y_named_formatter(f.as_base_formatter())
  let old = f.copy()
  second.set_y_named_formatter(f.as_base_formatter())
  let external = f.copy()
  let values = @ticker.TickValues::from_array([1000000.0, 1000002.0, 1000004.0])
  assert_eq(f.format_ticks_view(values), ["0.000000", "0.000002", "0.000004"])
  assert_eq(f.get_offset(), "1e6+1e6")
  assert_eq(old.format_ticks_view(values), ["0", "2", "4"])
  assert_eq(old.get_offset(), "+1e6")
  assert_eq(f.axis(), Some(b.formatter_axis_binding()))
  ignore(external)
}

///|
test "Scalar original axis 76 shared deletion installed versus detached external" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let figure = @scene.figure()
  let panels = figure.subplots(1, 2, share_y=true)
  let first = panels[0]
  let second = panels[1]
  let a = first.y_axis()
  let b = second.y_axis()
  a.set_limits(1000000.0, 1000004.0)
  b.set_limits(0.0, 2000000.0)
  a.bind_view_interval(() => (1000000.0, 1000004.0))
  b.bind_view_interval(() => (0.0, 2000000.0))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  first.set_y_named_formatter(f.as_base_formatter())
  let old = f.copy()
  second.set_y_named_formatter(f.as_base_formatter())
  let external = f.copy()
  let values = @ticker.TickValues::from_array([1000000.0, 1000002.0, 1000004.0])
  second.remove()
  assert_eq(f.format_ticks_view(values), ["0", "2", "4"])
  assert_eq(f.get_offset(), "+1e6")
  assert_eq(external.format_ticks_view(values), [
    "0.000000", "0.000002", "0.000004",
  ])
  assert_eq(external.get_offset(), "1e6+1e6")
  assert_eq(f.axis(), Some(a.formatter_axis_binding()))
  assert_eq(external.axis(), Some(b.formatter_axis_binding()))
  ignore(old)
}

///|
test "Scalar original axis 77 secondary before own sync full preparation" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let figure = @scene.figure(width=320, height=200)
  let axes = figure.axes()
  axes.set_x_limits(1000000.0, 1000004.0)
  axes.set_y_limits(1000000.0, 1000004.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.x_axis()
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let secondary = axes.secondary_xaxis(value => value * 2.0 + 5.0, value => {
    (value - 5.0) / 2.0
  })
  secondary.set_named_formatter(f.as_base_formatter())
  assert_eq(
    f.format_ticks_view(
      @ticker.TickValues::from_array([2000005.0, 2000009.0, 2000013.0]),
    ),
    ["2000005", "2000009", "2000013"],
  )
  assert_eq(f.get_offset(), "")
  assert_eq(
    f.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(
    f.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.format_pattern(), "%1.0f")
  assert_eq(f.locations().length(), 3)
  assert_eq(f.locations().get(0), 2000005.0)
  assert_eq(f.locations().get(1), 2000009.0)
  assert_eq(f.locations().get(2), 2000013.0)
  ignore(axis)
}

///|
test "Scalar original axis 78 secondary after own sync full preparation" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let figure = @scene.figure(width=320, height=200)
  let axes = figure.axes()
  axes.set_x_limits(1000000.0, 1000004.0)
  axes.set_y_limits(1000000.0, 1000004.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.x_axis()
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let secondary = axes.secondary_xaxis(value => value * 2.0 + 5.0, value => {
    (value - 5.0) / 2.0
  })
  secondary.set_named_formatter(f.as_base_formatter())
  secondary.apply_aspect()
  assert_eq(
    f.format_ticks_view(
      @ticker.TickValues::from_array([2000005.0, 2000009.0, 2000013.0]),
    ),
    ["5", "9", "13"],
  )
  assert_eq(f.get_offset(), "+2e6")
  assert_eq(f.offset(), Some(@ticker.ScalarNumber::NumpyFloat64(2000000.0)))
  assert_eq(
    f.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.format_pattern(), "%1.0f")
  assert_eq(f.locations().length(), 3)
  assert_eq(f.locations().get(0), 2000005.0)
  assert_eq(f.locations().get(1), 2000009.0)
  assert_eq(f.locations().get(2), 2000013.0)
  ignore(axis)
}

///|
test "Scalar original axis 79 secondary before own sync full preparation" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let figure = @scene.figure(width=320, height=200)
  let axes = figure.axes()
  axes.set_x_limits(1000000.0, 1000004.0)
  axes.set_y_limits(1000000.0, 1000004.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.y_axis()
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let secondary = axes.secondary_yaxis(value => value * 2.0 + 5.0, value => {
    (value - 5.0) / 2.0
  })
  secondary.set_named_formatter(f.as_base_formatter())
  assert_eq(
    f.format_ticks_view(
      @ticker.TickValues::from_array([2000005.0, 2000009.0, 2000013.0]),
    ),
    ["2000005", "2000009", "2000013"],
  )
  assert_eq(f.get_offset(), "")
  assert_eq(
    f.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(
    f.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.format_pattern(), "%1.0f")
  assert_eq(f.locations().length(), 3)
  assert_eq(f.locations().get(0), 2000005.0)
  assert_eq(f.locations().get(1), 2000009.0)
  assert_eq(f.locations().get(2), 2000013.0)
  ignore(axis)
}

///|
test "Scalar original axis 80 secondary after own sync full preparation" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let figure = @scene.figure(width=320, height=200)
  let axes = figure.axes()
  axes.set_x_limits(1000000.0, 1000004.0)
  axes.set_y_limits(1000000.0, 1000004.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.y_axis()
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let secondary = axes.secondary_yaxis(value => value * 2.0 + 5.0, value => {
    (value - 5.0) / 2.0
  })
  secondary.set_named_formatter(f.as_base_formatter())
  secondary.apply_aspect()
  assert_eq(
    f.format_ticks_view(
      @ticker.TickValues::from_array([2000005.0, 2000009.0, 2000013.0]),
    ),
    ["5", "9", "13"],
  )
  assert_eq(f.get_offset(), "+2e6")
  assert_eq(f.offset(), Some(@ticker.ScalarNumber::NumpyFloat64(2000000.0)))
  assert_eq(
    f.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.format_pattern(), "%1.0f")
  assert_eq(f.locations().length(), 3)
  assert_eq(f.locations().get(0), 2000005.0)
  assert_eq(f.locations().get(1), 2000009.0)
  assert_eq(f.locations().get(2), 2000013.0)
  ignore(axis)
}

///|
test "Scalar original axis 81 offset query can raise after successful batch" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(false)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  f.set_scientific(false)
  ignore(f.format_ticks_view(@ticker.TickValues::from_array([1.0, 2.0])))
  f.set_use_offset(Some(@ticker.ScalarNumber::Number(0.0 / 0.0)))
  let failed = try {
    ignore(f.get_offset())
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(message, "ValueError: cannot convert float NaN to integer")
      true
    }
    _ => false
  }
  assert_true(failed)
}

///|
test "Scalar original axis 82 offset query can raise after successful batch" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(false)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  f.set_scientific(false)
  ignore(f.format_ticks_view(@ticker.TickValues::from_array([1.0, 2.0])))
  f.set_use_offset(Some(@ticker.ScalarNumber::Number(1.0 / 0.0)))
  let failed = try {
    ignore(f.get_offset())
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(
        message, "OverflowError: cannot convert float infinity to integer",
      )
      true
    }
    _ => false
  }
  assert_true(failed)
}

///|
test "Scalar original axis 83 offset query can raise after successful batch" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(false)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  f.set_scientific(false)
  ignore(f.format_ticks_view(@ticker.TickValues::from_array([1.0, 2.0])))
  f.set_use_offset(Some(@ticker.ScalarNumber::Number(-1.0 / 0.0)))
  let failed = try {
    ignore(f.get_offset())
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(
        message, "OverflowError: cannot convert float infinity to integer",
      )
      true
    }
    _ => false
  }
  assert_true(failed)
}

///|
test "Scalar original axis 84 complete Null Axis.draw Fixed/Func still queries offset" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let figure = @scene.figure(width=320, height=200)
  let axes = figure.axes()
  axes.set_x_limits(1000000.0, 1000004.0)
  axes.set_y_limits(1000000.0, 1000004.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.x_axis()
  let formatter = @ticker.FixedFormatter::new(["A", "B"]).as_base_formatter()
  formatter.fixed_formatter().unwrap().set_offset_string("")
  axis.set_named_formatter(formatter)
  let svg = figure.to_svg_checked()
  assert_eq(formatter.get_offset_checked(), "")
  assert_true(!svg.contains(">A<"))
  assert_eq(formatter.locations().length(), 0)
}

///|
test "Scalar original axis 85 complete Null Axis.draw Fixed/Func still queries offset" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let figure = @scene.figure(width=320, height=200)
  let axes = figure.axes()
  axes.set_x_limits(1000000.0, 1000004.0)
  axes.set_y_limits(1000000.0, 1000004.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.x_axis()
  let formatter = @ticker.FixedFormatter::new(["A", "B"]).as_base_formatter()
  formatter
  .fixed_formatter()
  .unwrap()
  .set_offset_string("fixed/function offset")
  axis.set_named_formatter(formatter)
  let svg = figure.to_svg_checked()
  assert_eq(svg.split(">fixed/function offset<").count() - 1, 1)
  assert_eq(formatter.locations().length(), 0)
}

///|
test "Scalar original axis 86 complete Null Axis.draw Fixed/Func still queries offset" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let figure = @scene.figure(width=320, height=200)
  let axes = figure.axes()
  axes.set_x_limits(1000000.0, 1000004.0)
  axes.set_y_limits(1000000.0, 1000004.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.x_axis()
  let formatter = @ticker.FixedFormatter::new(["A", "B"]).as_base_formatter()
  formatter.fixed_formatter().unwrap().set_offset_string("")
  formatter.set_locs_view_checked(@ticker.TickValues::from_array([0.0, 1.0]))
  axis.set_named_formatter(formatter)
  let svg = figure.to_svg_checked()
  assert_eq(formatter.get_offset_checked(), "")
  assert_true(!svg.contains(">A<"))
  assert_eq(formatter.locations().length(), 2)
}

///|
test "Scalar original axis 87 complete Null Axis.draw Fixed/Func still queries offset" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let figure = @scene.figure(width=320, height=200)
  let axes = figure.axes()
  axes.set_x_limits(1000000.0, 1000004.0)
  axes.set_y_limits(1000000.0, 1000004.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.x_axis()
  let formatter = @ticker.FixedFormatter::new(["A", "B"]).as_base_formatter()
  formatter
  .fixed_formatter()
  .unwrap()
  .set_offset_string("fixed/function offset")
  formatter.set_locs_view_checked(@ticker.TickValues::from_array([0.0, 1.0]))
  axis.set_named_formatter(formatter)
  let svg = figure.to_svg_checked()
  assert_eq(svg.split(">fixed/function offset<").count() - 1, 1)
  assert_eq(formatter.locations().length(), 2)
}

///|
test "Scalar original axis 88 complete Null Axis.draw Fixed/Func still queries offset" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let figure = @scene.figure(width=320, height=200)
  let axes = figure.axes()
  axes.set_x_limits(1000000.0, 1000004.0)
  axes.set_y_limits(1000000.0, 1000004.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.x_axis()
  let named = @ticker.FuncFormatter::new((_, _) => {
    raise @core.DataError::InvalidTicks(message="Null must not call formatter")
  })
  named.set_offset_string("")
  let formatter = named.as_base_formatter()
  axis.set_named_formatter(formatter)
  let svg = figure.to_svg_checked()
  assert_eq(formatter.get_offset_checked(), "")
  assert_true(!svg.contains(">A<"))
  assert_eq(formatter.locations().length(), 0)
}

///|
test "Scalar original axis 89 complete Null Axis.draw Fixed/Func still queries offset" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let figure = @scene.figure(width=320, height=200)
  let axes = figure.axes()
  axes.set_x_limits(1000000.0, 1000004.0)
  axes.set_y_limits(1000000.0, 1000004.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.x_axis()
  let named = @ticker.FuncFormatter::new((_, _) => {
    raise @core.DataError::InvalidTicks(message="Null must not call formatter")
  })
  named.set_offset_string("fixed/function offset")
  let formatter = named.as_base_formatter()
  axis.set_named_formatter(formatter)
  let svg = figure.to_svg_checked()
  assert_eq(svg.split(">fixed/function offset<").count() - 1, 1)
  assert_eq(formatter.locations().length(), 0)
}

///|
test "Scalar original axis 90 complete Null Axis.draw Fixed/Func still queries offset" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let figure = @scene.figure(width=320, height=200)
  let axes = figure.axes()
  axes.set_x_limits(1000000.0, 1000004.0)
  axes.set_y_limits(1000000.0, 1000004.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.x_axis()
  let named = @ticker.FuncFormatter::new((_, _) => {
    raise @core.DataError::InvalidTicks(message="Null must not call formatter")
  })
  named.set_offset_string("")
  let formatter = named.as_base_formatter()
  formatter.set_locs_view_checked(@ticker.TickValues::from_array([0.0, 1.0]))
  axis.set_named_formatter(formatter)
  let svg = figure.to_svg_checked()
  assert_eq(formatter.get_offset_checked(), "")
  assert_true(!svg.contains(">A<"))
  assert_eq(formatter.locations().length(), 2)
}

///|
test "Scalar original axis 91 complete Null Axis.draw Fixed/Func still queries offset" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let figure = @scene.figure(width=320, height=200)
  let axes = figure.axes()
  axes.set_x_limits(1000000.0, 1000004.0)
  axes.set_y_limits(1000000.0, 1000004.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.x_axis()
  let named = @ticker.FuncFormatter::new((_, _) => {
    raise @core.DataError::InvalidTicks(message="Null must not call formatter")
  })
  named.set_offset_string("fixed/function offset")
  let formatter = named.as_base_formatter()
  formatter.set_locs_view_checked(@ticker.TickValues::from_array([0.0, 1.0]))
  axis.set_named_formatter(formatter)
  let svg = figure.to_svg_checked()
  assert_eq(svg.split(">fixed/function offset<").count() - 1, 1)
  assert_eq(formatter.locations().length(), 2)
}

///|
test "Scalar original axis 92 complete Null Axis.draw Fixed/Func still queries offset" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let figure = @scene.figure(width=320, height=200)
  let axes = figure.axes()
  axes.set_x_limits(1000000.0, 1000004.0)
  axes.set_y_limits(1000000.0, 1000004.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.y_axis()
  let formatter = @ticker.FixedFormatter::new(["A", "B"]).as_base_formatter()
  formatter.fixed_formatter().unwrap().set_offset_string("")
  axis.set_named_formatter(formatter)
  let svg = figure.to_svg_checked()
  assert_eq(formatter.get_offset_checked(), "")
  assert_true(!svg.contains(">A<"))
  assert_eq(formatter.locations().length(), 0)
}

///|
test "Scalar original axis 93 complete Null Axis.draw Fixed/Func still queries offset" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let figure = @scene.figure(width=320, height=200)
  let axes = figure.axes()
  axes.set_x_limits(1000000.0, 1000004.0)
  axes.set_y_limits(1000000.0, 1000004.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.y_axis()
  let formatter = @ticker.FixedFormatter::new(["A", "B"]).as_base_formatter()
  formatter
  .fixed_formatter()
  .unwrap()
  .set_offset_string("fixed/function offset")
  axis.set_named_formatter(formatter)
  let svg = figure.to_svg_checked()
  assert_eq(svg.split(">fixed/function offset<").count() - 1, 1)
  assert_eq(formatter.locations().length(), 0)
}

///|
test "Scalar original axis 94 complete Null Axis.draw Fixed/Func still queries offset" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let figure = @scene.figure(width=320, height=200)
  let axes = figure.axes()
  axes.set_x_limits(1000000.0, 1000004.0)
  axes.set_y_limits(1000000.0, 1000004.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.y_axis()
  let formatter = @ticker.FixedFormatter::new(["A", "B"]).as_base_formatter()
  formatter.fixed_formatter().unwrap().set_offset_string("")
  formatter.set_locs_view_checked(@ticker.TickValues::from_array([0.0, 1.0]))
  axis.set_named_formatter(formatter)
  let svg = figure.to_svg_checked()
  assert_eq(formatter.get_offset_checked(), "")
  assert_true(!svg.contains(">A<"))
  assert_eq(formatter.locations().length(), 2)
}

///|
test "Scalar original axis 95 complete Null Axis.draw Fixed/Func still queries offset" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let figure = @scene.figure(width=320, height=200)
  let axes = figure.axes()
  axes.set_x_limits(1000000.0, 1000004.0)
  axes.set_y_limits(1000000.0, 1000004.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.y_axis()
  let formatter = @ticker.FixedFormatter::new(["A", "B"]).as_base_formatter()
  formatter
  .fixed_formatter()
  .unwrap()
  .set_offset_string("fixed/function offset")
  formatter.set_locs_view_checked(@ticker.TickValues::from_array([0.0, 1.0]))
  axis.set_named_formatter(formatter)
  let svg = figure.to_svg_checked()
  assert_eq(svg.split(">fixed/function offset<").count() - 1, 1)
  assert_eq(formatter.locations().length(), 2)
}

///|
test "Scalar original axis 96 complete Null Axis.draw Fixed/Func still queries offset" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let figure = @scene.figure(width=320, height=200)
  let axes = figure.axes()
  axes.set_x_limits(1000000.0, 1000004.0)
  axes.set_y_limits(1000000.0, 1000004.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.y_axis()
  let named = @ticker.FuncFormatter::new((_, _) => {
    raise @core.DataError::InvalidTicks(message="Null must not call formatter")
  })
  named.set_offset_string("")
  let formatter = named.as_base_formatter()
  axis.set_named_formatter(formatter)
  let svg = figure.to_svg_checked()
  assert_eq(formatter.get_offset_checked(), "")
  assert_true(!svg.contains(">A<"))
  assert_eq(formatter.locations().length(), 0)
}

///|
test "Scalar original axis 97 complete Null Axis.draw Fixed/Func still queries offset" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let figure = @scene.figure(width=320, height=200)
  let axes = figure.axes()
  axes.set_x_limits(1000000.0, 1000004.0)
  axes.set_y_limits(1000000.0, 1000004.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.y_axis()
  let named = @ticker.FuncFormatter::new((_, _) => {
    raise @core.DataError::InvalidTicks(message="Null must not call formatter")
  })
  named.set_offset_string("fixed/function offset")
  let formatter = named.as_base_formatter()
  axis.set_named_formatter(formatter)
  let svg = figure.to_svg_checked()
  assert_eq(svg.split(">fixed/function offset<").count() - 1, 1)
  assert_eq(formatter.locations().length(), 0)
}

///|
test "Scalar original axis 98 complete Null Axis.draw Fixed/Func still queries offset" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let figure = @scene.figure(width=320, height=200)
  let axes = figure.axes()
  axes.set_x_limits(1000000.0, 1000004.0)
  axes.set_y_limits(1000000.0, 1000004.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.y_axis()
  let named = @ticker.FuncFormatter::new((_, _) => {
    raise @core.DataError::InvalidTicks(message="Null must not call formatter")
  })
  named.set_offset_string("")
  let formatter = named.as_base_formatter()
  formatter.set_locs_view_checked(@ticker.TickValues::from_array([0.0, 1.0]))
  axis.set_named_formatter(formatter)
  let svg = figure.to_svg_checked()
  assert_eq(formatter.get_offset_checked(), "")
  assert_true(!svg.contains(">A<"))
  assert_eq(formatter.locations().length(), 2)
}

///|
test "Scalar original axis 99 complete Null Axis.draw Fixed/Func still queries offset" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let figure = @scene.figure(width=320, height=200)
  let axes = figure.axes()
  axes.set_x_limits(1000000.0, 1000004.0)
  axes.set_y_limits(1000000.0, 1000004.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.y_axis()
  let named = @ticker.FuncFormatter::new((_, _) => {
    raise @core.DataError::InvalidTicks(message="Null must not call formatter")
  })
  named.set_offset_string("fixed/function offset")
  let formatter = named.as_base_formatter()
  formatter.set_locs_view_checked(@ticker.TickValues::from_array([0.0, 1.0]))
  axis.set_named_formatter(formatter)
  let svg = figure.to_svg_checked()
  assert_eq(svg.split(">fixed/function offset<").count() - 1, 1)
  assert_eq(formatter.locations().length(), 2)
}

///|
test "Scalar original axis 100 each preparation stage reads live view independently" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let reads = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    reads.val += 1
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array(
        if reads.val == 1 {
          [1000000.0, 1000004.0]
        } else {
          [0.0, 2000000.0]
        },
      ),
    )
  })
  f.set_axis(Some(binding))
  assert_eq(
    f.format_ticks_view(
      @ticker.TickValues::from_array([1000000.0, 1000002.0, 1000004.0]),
    ),
    ["0.000000", "0.000002", "0.000004"],
  )
  assert_eq(reads.val, 2)
  assert_eq(f.get_offset(), "1e6+1e6")
  assert_eq(f.offset(), Some(@ticker.ScalarNumber::NumpyFloat64(1000000.0)))
  assert_eq(
    f.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  )
  assert_eq(f.format_pattern(), "%1.6f")
  assert_eq(f.locations().length(), 3)
  assert_eq(f.locations().get(0), 1000000.0)
  assert_eq(f.locations().get(1), 1000002.0)
  assert_eq(f.locations().get(2), 1000004.0)
}

///|
test "Scalar original axis 101 offscreen full locations determine format precision" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  binding.set_view_interval(
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([1000000.0, 1000000.001]),
    ),
  )
  f.set_axis(Some(binding))
  assert_eq(
    f.format_ticks_view(
      @ticker.TickValues::from_array([
        1000000.0001, 1000000.0002, 1000000.0003, 2000000.0,
      ]),
    ),
    ["0", "0", "0", "1000000"],
  )
  assert_eq(f.get_offset(), "+1e6")
  assert_eq(f.offset(), Some(@ticker.ScalarNumber::NumpyFloat64(1000000.0)))
  assert_eq(
    f.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.format_pattern(), "%1.0f")
  assert_eq(f.locations().length(), 4)
  assert_eq(f.locations().get(0), 1000000.0001)
  assert_eq(f.locations().get(1), 1000000.0002)
  assert_eq(f.locations().get(2), 1000000.0003)
  assert_eq(f.locations().get(3), 2000000.0)
}

///|
test "Scalar original axis 102 pixel-origin affine ordering near precision threshold" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let axis = @axis.axis()
  axis.set_limits(0.0, 1.0)
  axis.set_scale(@scale.linear_scale())
  axis.bind_formatter_geometry(() => (0.0, 1000.0))
  axis.set_named_formatter(f.as_base_formatter())
  assert_eq(f.format_data_short(0.123456789), "0.123")
}

///|
test "Scalar original axis 103 pixel-origin affine ordering near precision threshold" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let axis = @axis.axis()
  axis.set_limits(0.0, 1.0)
  axis.set_scale(@scale.linear_scale())
  axis.bind_formatter_geometry(() => (40.0, 1000.0))
  axis.set_named_formatter(f.as_base_formatter())
  assert_eq(f.format_data_short(0.123456789), "0.123")
}

///|
test "Scalar original axis 104 pixel-origin affine ordering near precision threshold" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let axis = @axis.axis()
  axis.set_limits(0.0, 1.0)
  axis.set_scale(@scale.linear_scale())
  axis.bind_formatter_geometry(() => (-40.0, 1000.0))
  axis.set_named_formatter(f.as_base_formatter())
  assert_eq(f.format_data_short(0.123456789), "0.123")
}

///|
test "Scalar original axis 105 pixel-origin affine ordering near precision threshold" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let axis = @axis.axis()
  axis.set_limits(0.0, 1.0)
  axis.set_scale(@scale.linear_scale())
  axis.bind_formatter_geometry(() => (1000000.0, 1000.0))
  axis.set_named_formatter(f.as_base_formatter())
  assert_eq(f.format_data_short(0.123456789), "0.1235")
}

///|
test "Scalar original axis 106 pixel-origin affine ordering near precision threshold" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let axis = @axis.axis()
  axis.set_limits(0.0, 1.0)
  axis.set_scale(@scale.linear_scale())
  axis.bind_formatter_geometry(() => (-1000000.0, 1000.0))
  axis.set_named_formatter(f.as_base_formatter())
  assert_eq(f.format_data_short(0.123456789), "0.123")
}

///|
test "Scalar original axis 107 pixel-origin affine ordering near precision threshold" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let axis = @axis.axis()
  axis.set_limits(0.0, 1.0)
  axis.set_scale(@scale.linear_scale())
  axis.bind_formatter_geometry(() => (1000000000.0, 1000.0))
  axis.set_named_formatter(f.as_base_formatter())
  assert_eq(f.format_data_short(0.123456789), "0.1235")
}

///|
test "Scalar original axis 108 pixel-origin affine ordering near precision threshold" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let axis = @axis.axis()
  axis.set_limits(0.0, 1.0)
  axis.set_scale(@scale.linear_scale())
  axis.bind_formatter_geometry(() => (-1000000000.0, 1000.0))
  axis.set_named_formatter(f.as_base_formatter())
  assert_eq(f.format_data_short(0.123456789), "0.1235")
}

///|
test "Scalar original axis 109 pixel-origin affine ordering near precision threshold" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let axis = @axis.axis()
  axis.set_limits(0.0, 1.0)
  axis.set_scale(@scale.linear_scale())
  axis.bind_formatter_geometry(() => (0.0, 1000.0))
  axis.set_named_formatter(f.as_base_formatter())
  assert_eq(f.format_data_short(0.123456789), "0.123")
}

///|
test "Scalar original axis 110 pixel-origin affine ordering near precision threshold" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let axis = @axis.axis()
  axis.set_limits(0.0, 1.0)
  axis.set_scale(@scale.linear_scale())
  axis.bind_formatter_geometry(() => (40.0, 1000.0))
  axis.set_named_formatter(f.as_base_formatter())
  assert_eq(f.format_data_short(0.123456789), "0.123")
}

///|
test "Scalar original axis 111 pixel-origin affine ordering near precision threshold" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let axis = @axis.axis()
  axis.set_limits(0.0, 1.0)
  axis.set_scale(@scale.linear_scale())
  axis.bind_formatter_geometry(() => (-40.0, 1000.0))
  axis.set_named_formatter(f.as_base_formatter())
  assert_eq(f.format_data_short(0.123456789), "0.123")
}

///|
test "Scalar original axis 112 pixel-origin affine ordering near precision threshold" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let axis = @axis.axis()
  axis.set_limits(0.0, 1.0)
  axis.set_scale(@scale.linear_scale())
  axis.bind_formatter_geometry(() => (1000000.0, 1000.0))
  axis.set_named_formatter(f.as_base_formatter())
  assert_eq(f.format_data_short(0.123456789), "0.1235")
}

///|
test "Scalar original axis 113 pixel-origin affine ordering near precision threshold" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let axis = @axis.axis()
  axis.set_limits(0.0, 1.0)
  axis.set_scale(@scale.linear_scale())
  axis.bind_formatter_geometry(() => (-1000000.0, 1000.0))
  axis.set_named_formatter(f.as_base_formatter())
  assert_eq(f.format_data_short(0.123456789), "0.123")
}

///|
test "Scalar original axis 114 pixel-origin affine ordering near precision threshold" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let axis = @axis.axis()
  axis.set_limits(0.0, 1.0)
  axis.set_scale(@scale.linear_scale())
  axis.bind_formatter_geometry(() => (1000000000.0, 1000.0))
  axis.set_named_formatter(f.as_base_formatter())
  assert_eq(f.format_data_short(0.123456789), "0.1235")
}

///|
test "Scalar original axis 115 pixel-origin affine ordering near precision threshold" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let axis = @axis.axis()
  axis.set_limits(0.0, 1.0)
  axis.set_scale(@scale.linear_scale())
  axis.bind_formatter_geometry(() => (-1000000000.0, 1000.0))
  axis.set_named_formatter(f.as_base_formatter())
  assert_eq(f.format_data_short(0.123456789), "0.1235")
}

///|
test "Scalar original axis 116 short masked/integral skip axis but float special still reads" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let calls = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    calls.val += 1
    raise @core.DataError::InvalidTicks(message="ValueError: short view read")
  })
  f.set_axis(Some(binding))
  assert_eq(f.format_data_short_masked(), "")
  assert_eq(calls.val, 0)
}

///|
test "Scalar original axis 117 short masked/integral skip axis but float special still reads" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let calls = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    calls.val += 1
    raise @core.DataError::InvalidTicks(message="ValueError: short view read")
  })
  f.set_axis(Some(binding))
  assert_eq(
    f.format_data_short_value(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_int(1)),
    ),
    "1",
  )
  assert_eq(calls.val, 0)
}

///|
test "Scalar original axis 118 short masked/integral skip axis but float special still reads" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let calls = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    calls.val += 1
    raise @core.DataError::InvalidTicks(message="ValueError: short view read")
  })
  f.set_axis(Some(binding))
  assert_eq(
    f.format_data_short_value(
      @ticker.ScalarNumber::NumpyInt64(-9223372036854775807L - 1L),
    ),
    "−9223372036854775808",
  )
  assert_eq(calls.val, 0)
}

///|
test "Scalar original axis 119 short masked/integral skip axis but float special still reads" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let calls = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    calls.val += 1
    raise @core.DataError::InvalidTicks(message="ValueError: short view read")
  })
  f.set_axis(Some(binding))
  let failed = try {
    ignore(f.format_data_short(1.0 / 0.0))
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(message, "ValueError: short view read")
      true
    }
    _ => false
  }
  assert_true(failed)
  assert_eq(calls.val, 1)
}

///|
test "Scalar original axis 120 short masked/integral skip axis but float special still reads" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let calls = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    calls.val += 1
    raise @core.DataError::InvalidTicks(message="ValueError: short view read")
  })
  f.set_axis(Some(binding))
  let failed = try {
    ignore(f.format_data_short(0.0 / 0.0))
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(message, "ValueError: short view read")
      true
    }
    _ => false
  }
  assert_true(failed)
  assert_eq(calls.val, 1)
}

///|
test "Scalar original axis 141 secondary inverse mutation precedes major offset" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let figure = @scene.figure(width=320, height=200)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.x_axis()
  let slot : @ref.Ref[@ticker.FuncFormatter?] = @ref.Ref(None)
  let major = @ticker.FuncFormatter::new((_, pos) => {
    slot.val.unwrap().set_offset_string("from-format")
    pos.unwrap().to_string()
  })
  slot.val = Some(major)
  let secondary = axes.secondary_xaxis(fn(value) { return value }, value => {
    major.set_offset_string("from-inverse")
    value
  })
  secondary.set_locator(@ticker.FixedLocator::new([0.0, 0.5, 1.0]).as_locator())
  secondary.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  secondary.set_named_formatter(major.as_base_formatter())
  let svg = figure.to_svg_checked()
  assert_eq(svg.split(">from-inverse<").count() - 1, 1)
  assert_true(!svg.contains(">from-format<"))
  assert_eq(major.get_offset(), "from-inverse")
  ignore(axis)
}

///|
test "Scalar original axis 142 secondary inverse mutation precedes major offset" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let figure = @scene.figure(width=320, height=200)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.y_axis()
  let slot : @ref.Ref[@ticker.FuncFormatter?] = @ref.Ref(None)
  let major = @ticker.FuncFormatter::new((_, pos) => {
    slot.val.unwrap().set_offset_string("from-format")
    pos.unwrap().to_string()
  })
  slot.val = Some(major)
  let secondary = axes.secondary_yaxis(fn(value) { return value }, value => {
    major.set_offset_string("from-inverse")
    value
  })
  secondary.set_locator(@ticker.FixedLocator::new([0.0, 0.5, 1.0]).as_locator())
  secondary.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  secondary.set_named_formatter(major.as_base_formatter())
  let svg = figure.to_svg_checked()
  assert_eq(svg.split(">from-inverse<").count() - 1, 1)
  assert_true(!svg.contains(">from-format<"))
  assert_eq(major.get_offset(), "from-inverse")
  ignore(axis)
}

///|
test "Scalar original axis 143 explicit mathematical affine inverse profile 0" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let axis = @axis.axis()
  axis.set_limits(0.1, 0.9)
  axis.set_scale(@scale.linear_scale())
  axis.bind_formatter_geometry(() => (40.0, 400.0))
  axis.set_named_formatter(f.as_base_formatter())
  assert_eq(f.format_data_short(0.123456789), "0.123")
}

///|
test "Scalar original axis 144 explicit mathematical affine inverse profile 1" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let axis = @axis.axis()
  axis.set_limits(1.1, 9.9)
  axis.set_scale(@scale.linear_scale())
  axis.bind_formatter_geometry(() => (1000000.0, 333.0))
  axis.set_named_formatter(f.as_base_formatter())
  assert_eq(f.format_data_short(1.23456789), "1.23")
}

///|
test "Scalar original axis 145 explicit mathematical affine inverse profile 2" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let axis = @axis.axis()
  axis.set_limits(1000000.0, 1000004.0)
  axis.set_scale(@scale.linear_scale())
  axis.bind_formatter_geometry(() => (40.0, 400.0))
  axis.set_named_formatter(f.as_base_formatter())
  assert_eq(f.format_data_short(1000001.23456789), "1000001.23")
}

///|
test "Scalar original axis 146 explicit mathematical affine inverse profile 3" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let axis = @axis.axis()
  axis.set_limits(-0.3, 4.7)
  axis.set_scale(@scale.linear_scale())
  axis.bind_formatter_geometry(() => (37.0, 291.0))
  axis.set_named_formatter(f.as_base_formatter())
  assert_eq(f.format_data_short(0.123456789), "0.12")
}

///|
test "Scalar original axis 147 explicit mathematical affine inverse profile 4" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let axis = @axis.axis()
  axis.set_limits(-123.456, 789.123)
  axis.set_scale(@scale.linear_scale())
  axis.bind_formatter_geometry(() => (1000000000.0, 457.0))
  axis.set_named_formatter(f.as_base_formatter())
  assert_eq(f.format_data_short(123.456789), "123.")
}

///|
test "Scalar original axis 148 explicit mathematical affine inverse profile 5" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  f.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let axis = @axis.axis()
  axis.set_limits(0.01, 0.99)
  axis.set_scale(@scale.linear_scale())
  axis.bind_formatter_geometry(() => (40.0, 400.0))
  axis.set_named_formatter(f.as_base_formatter())
  assert_eq(f.format_data_short(0.123456789), "0.123")
}
