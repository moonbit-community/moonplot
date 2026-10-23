// Complete original EngFormatter and actual Axis lifecycle.

///|
// Original source case 0: nonempty preparation exact only-view dependencies
fn eng_axis_scene_case_0() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(false)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  f.as_scalar_formatter().set_scientific(false)
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(7),
      @bigint.BigInt::from_int(7),
    ]),
  )
  let reads = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    reads.val += 1
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([1000000.0, 1000004.0]),
    )
  })
  f.set_axis(Some(binding))
  f.set_locs_view(@ticker.TickValues::from_array([]))
  assert_eq(reads.val, 0)
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "")
  assert_eq(f.as_scalar_formatter().get_use_offset(), false)
  assert_eq(f.locations().length(), 0)
}

///|
// Original source case 1: nonempty preparation exact only-view dependencies
fn eng_axis_scene_case_1() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(false)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  f.as_scalar_formatter().set_scientific(true)
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(7),
      @bigint.BigInt::from_int(7),
    ]),
  )
  let reads = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    reads.val += 1
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([1000000.0, 1000004.0]),
    )
  })
  f.set_axis(Some(binding))
  f.set_locs_view(@ticker.TickValues::from_array([]))
  assert_eq(reads.val, 0)
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "")
  assert_eq(f.as_scalar_formatter().get_use_offset(), false)
  assert_eq(f.locations().length(), 0)
}

///|
// Original source case 2: nonempty preparation exact only-view dependencies
fn eng_axis_scene_case_2() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  f.as_scalar_formatter().set_scientific(false)
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(7),
      @bigint.BigInt::from_int(7),
    ]),
  )
  let reads = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    reads.val += 1
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([1000000.0, 1000004.0]),
    )
  })
  f.set_axis(Some(binding))
  f.set_locs_view(@ticker.TickValues::from_array([]))
  assert_eq(reads.val, 0)
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "")
  assert_eq(f.as_scalar_formatter().get_use_offset(), true)
  assert_eq(f.locations().length(), 0)
}

///|
// Original source case 3: nonempty preparation exact only-view dependencies
fn eng_axis_scene_case_3() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  f.as_scalar_formatter().set_scientific(true)
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(7),
      @bigint.BigInt::from_int(7),
    ]),
  )
  let reads = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    reads.val += 1
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([1000000.0, 1000004.0]),
    )
  })
  f.set_axis(Some(binding))
  f.set_locs_view(@ticker.TickValues::from_array([]))
  assert_eq(reads.val, 0)
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "")
  assert_eq(f.as_scalar_formatter().get_use_offset(), true)
  assert_eq(f.locations().length(), 0)
}

///|
// Original source case 4: nonempty preparation exact only-view dependencies
fn eng_axis_scene_case_4() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Number(1000000.0)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  f.as_scalar_formatter().set_scientific(false)
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(7),
      @bigint.BigInt::from_int(7),
    ]),
  )
  let reads = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    reads.val += 1
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([1000000.0, 1000004.0]),
    )
  })
  f.set_axis(Some(binding))
  f.set_locs_view(@ticker.TickValues::from_array([]))
  assert_eq(reads.val, 0)
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::Number(1000000.0)),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "")
  assert_eq(f.as_scalar_formatter().get_use_offset(), false)
  assert_eq(f.locations().length(), 0)
}

///|
// Original source case 5: nonempty preparation exact only-view dependencies
fn eng_axis_scene_case_5() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Number(1000000.0)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  f.as_scalar_formatter().set_scientific(true)
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(7),
      @bigint.BigInt::from_int(7),
    ]),
  )
  let reads = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    reads.val += 1
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([1000000.0, 1000004.0]),
    )
  })
  f.set_axis(Some(binding))
  f.set_locs_view(@ticker.TickValues::from_array([]))
  assert_eq(reads.val, 0)
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::Number(1000000.0)),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "")
  assert_eq(f.as_scalar_formatter().get_use_offset(), false)
  assert_eq(f.locations().length(), 0)
}

///|
// Original source case 6: nonempty preparation exact only-view dependencies
fn eng_axis_scene_case_6() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(false)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  f.as_scalar_formatter().set_scientific(false)
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(7),
      @bigint.BigInt::from_int(7),
    ]),
  )
  let reads = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    reads.val += 1
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([1000000.0, 1000004.0]),
    )
  })
  f.set_axis(Some(binding))
  f.set_locs_view(@ticker.TickValues::from_array([1000000.0]))
  assert_eq(reads.val, 2)
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "%1.0f")
  assert_eq(f.as_scalar_formatter().get_use_offset(), false)
  assert_eq(f.locations().length(), 1)
  assert_eq(
    f.locations().get(0).reinterpret_as_uint64(),
    1000000.0.reinterpret_as_uint64(),
  )
}

///|
// Original source case 7: nonempty preparation exact only-view dependencies
fn eng_axis_scene_case_7() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(false)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  f.as_scalar_formatter().set_scientific(true)
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(7),
      @bigint.BigInt::from_int(7),
    ]),
  )
  let reads = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    reads.val += 1
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([1000000.0, 1000004.0]),
    )
  })
  f.set_axis(Some(binding))
  f.set_locs_view(@ticker.TickValues::from_array([1000000.0]))
  assert_eq(reads.val, 2)
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "%1.0f")
  assert_eq(f.as_scalar_formatter().get_use_offset(), false)
  assert_eq(f.locations().length(), 1)
  assert_eq(
    f.locations().get(0).reinterpret_as_uint64(),
    1000000.0.reinterpret_as_uint64(),
  )
}

///|
// Original source case 8: nonempty preparation exact only-view dependencies
fn eng_axis_scene_case_8() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  f.as_scalar_formatter().set_scientific(false)
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(7),
      @bigint.BigInt::from_int(7),
    ]),
  )
  let reads = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    reads.val += 1
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([1000000.0, 1000004.0]),
    )
  })
  f.set_axis(Some(binding))
  f.set_locs_view(@ticker.TickValues::from_array([1000000.0]))
  assert_eq(reads.val, 3)
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "%1.0f")
  assert_eq(f.as_scalar_formatter().get_use_offset(), true)
  assert_eq(f.locations().length(), 1)
  assert_eq(
    f.locations().get(0).reinterpret_as_uint64(),
    1000000.0.reinterpret_as_uint64(),
  )
}

///|
// Original source case 9: nonempty preparation exact only-view dependencies
fn eng_axis_scene_case_9() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  f.as_scalar_formatter().set_scientific(true)
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(7),
      @bigint.BigInt::from_int(7),
    ]),
  )
  let reads = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    reads.val += 1
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([1000000.0, 1000004.0]),
    )
  })
  f.set_axis(Some(binding))
  f.set_locs_view(@ticker.TickValues::from_array([1000000.0]))
  assert_eq(reads.val, 3)
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "%1.0f")
  assert_eq(f.as_scalar_formatter().get_use_offset(), true)
  assert_eq(f.locations().length(), 1)
  assert_eq(
    f.locations().get(0).reinterpret_as_uint64(),
    1000000.0.reinterpret_as_uint64(),
  )
}

///|
// Original source case 10: nonempty preparation exact only-view dependencies
fn eng_axis_scene_case_10() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Number(1000000.0)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  f.as_scalar_formatter().set_scientific(false)
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(7),
      @bigint.BigInt::from_int(7),
    ]),
  )
  let reads = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    reads.val += 1
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([1000000.0, 1000004.0]),
    )
  })
  f.set_axis(Some(binding))
  f.set_locs_view(@ticker.TickValues::from_array([1000000.0]))
  assert_eq(reads.val, 2)
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::Number(1000000.0)),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "%1.0f")
  assert_eq(f.as_scalar_formatter().get_use_offset(), false)
  assert_eq(f.locations().length(), 1)
  assert_eq(
    f.locations().get(0).reinterpret_as_uint64(),
    1000000.0.reinterpret_as_uint64(),
  )
}

///|
// Original source case 11: nonempty preparation exact only-view dependencies
fn eng_axis_scene_case_11() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Number(1000000.0)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  f.as_scalar_formatter().set_scientific(true)
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(7),
      @bigint.BigInt::from_int(7),
    ]),
  )
  let reads = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    reads.val += 1
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([1000000.0, 1000004.0]),
    )
  })
  f.set_axis(Some(binding))
  f.set_locs_view(@ticker.TickValues::from_array([1000000.0]))
  assert_eq(reads.val, 2)
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::Number(1000000.0)),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "%1.0f")
  assert_eq(f.as_scalar_formatter().get_use_offset(), false)
  assert_eq(f.locations().length(), 1)
  assert_eq(
    f.locations().get(0).reinterpret_as_uint64(),
    1000000.0.reinterpret_as_uint64(),
  )
}

///|
// Original source case 12: nonempty preparation exact only-view dependencies
fn eng_axis_scene_case_12() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(false)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  f.as_scalar_formatter().set_scientific(false)
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(7),
      @bigint.BigInt::from_int(7),
    ]),
  )
  let reads = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    reads.val += 1
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([1000000.0, 1000004.0]),
    )
  })
  f.set_axis(Some(binding))
  f.set_locs_view(
    @ticker.TickValues::from_array([1000000.0, 1000002.0, 1000004.0]),
  )
  assert_eq(reads.val, 1)
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "%1.0f")
  assert_eq(f.as_scalar_formatter().get_use_offset(), false)
  assert_eq(f.locations().length(), 3)
  assert_eq(
    f.locations().get(0).reinterpret_as_uint64(),
    1000000.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(1).reinterpret_as_uint64(),
    1000002.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(2).reinterpret_as_uint64(),
    1000004.0.reinterpret_as_uint64(),
  )
}

///|
// Original source case 13: nonempty preparation exact only-view dependencies
fn eng_axis_scene_case_13() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(false)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  f.as_scalar_formatter().set_scientific(true)
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(7),
      @bigint.BigInt::from_int(7),
    ]),
  )
  let reads = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    reads.val += 1
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([1000000.0, 1000004.0]),
    )
  })
  f.set_axis(Some(binding))
  f.set_locs_view(
    @ticker.TickValues::from_array([1000000.0, 1000002.0, 1000004.0]),
  )
  assert_eq(reads.val, 1)
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "%1.0f")
  assert_eq(f.as_scalar_formatter().get_use_offset(), false)
  assert_eq(f.locations().length(), 3)
  assert_eq(
    f.locations().get(0).reinterpret_as_uint64(),
    1000000.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(1).reinterpret_as_uint64(),
    1000002.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(2).reinterpret_as_uint64(),
    1000004.0.reinterpret_as_uint64(),
  )
}

///|
// Original source case 14: nonempty preparation exact only-view dependencies
fn eng_axis_scene_case_14() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  f.as_scalar_formatter().set_scientific(false)
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(7),
      @bigint.BigInt::from_int(7),
    ]),
  )
  let reads = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    reads.val += 1
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([1000000.0, 1000004.0]),
    )
  })
  f.set_axis(Some(binding))
  f.set_locs_view(
    @ticker.TickValues::from_array([1000000.0, 1000002.0, 1000004.0]),
  )
  assert_eq(reads.val, 2)
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::NumpyFloat64(1000002.0)),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "%1.0f")
  assert_eq(f.as_scalar_formatter().get_use_offset(), true)
  assert_eq(f.locations().length(), 3)
  assert_eq(
    f.locations().get(0).reinterpret_as_uint64(),
    1000000.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(1).reinterpret_as_uint64(),
    1000002.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(2).reinterpret_as_uint64(),
    1000004.0.reinterpret_as_uint64(),
  )
}

///|
// Original source case 15: nonempty preparation exact only-view dependencies
fn eng_axis_scene_case_15() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  f.as_scalar_formatter().set_scientific(true)
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(7),
      @bigint.BigInt::from_int(7),
    ]),
  )
  let reads = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    reads.val += 1
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([1000000.0, 1000004.0]),
    )
  })
  f.set_axis(Some(binding))
  f.set_locs_view(
    @ticker.TickValues::from_array([1000000.0, 1000002.0, 1000004.0]),
  )
  assert_eq(reads.val, 2)
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::NumpyFloat64(1000002.0)),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "%1.0f")
  assert_eq(f.as_scalar_formatter().get_use_offset(), true)
  assert_eq(f.locations().length(), 3)
  assert_eq(
    f.locations().get(0).reinterpret_as_uint64(),
    1000000.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(1).reinterpret_as_uint64(),
    1000002.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(2).reinterpret_as_uint64(),
    1000004.0.reinterpret_as_uint64(),
  )
}

///|
// Original source case 16: nonempty preparation exact only-view dependencies
fn eng_axis_scene_case_16() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Number(1000000.0)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  f.as_scalar_formatter().set_scientific(false)
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(7),
      @bigint.BigInt::from_int(7),
    ]),
  )
  let reads = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    reads.val += 1
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([1000000.0, 1000004.0]),
    )
  })
  f.set_axis(Some(binding))
  f.set_locs_view(
    @ticker.TickValues::from_array([1000000.0, 1000002.0, 1000004.0]),
  )
  assert_eq(reads.val, 1)
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::Number(1000000.0)),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "%1.0f")
  assert_eq(f.as_scalar_formatter().get_use_offset(), false)
  assert_eq(f.locations().length(), 3)
  assert_eq(
    f.locations().get(0).reinterpret_as_uint64(),
    1000000.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(1).reinterpret_as_uint64(),
    1000002.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(2).reinterpret_as_uint64(),
    1000004.0.reinterpret_as_uint64(),
  )
}

///|
// Original source case 17: nonempty preparation exact only-view dependencies
fn eng_axis_scene_case_17() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Number(1000000.0)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  f.as_scalar_formatter().set_scientific(true)
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(7),
      @bigint.BigInt::from_int(7),
    ]),
  )
  let reads = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    reads.val += 1
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([1000000.0, 1000004.0]),
    )
  })
  f.set_axis(Some(binding))
  f.set_locs_view(
    @ticker.TickValues::from_array([1000000.0, 1000002.0, 1000004.0]),
  )
  assert_eq(reads.val, 1)
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::Number(1000000.0)),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "%1.0f")
  assert_eq(f.as_scalar_formatter().get_use_offset(), false)
  assert_eq(f.locations().length(), 3)
  assert_eq(
    f.locations().get(0).reinterpret_as_uint64(),
    1000000.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(1).reinterpret_as_uint64(),
    1000002.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(2).reinterpret_as_uint64(),
    1000004.0.reinterpret_as_uint64(),
  )
}

///|
// Original source case 18: unbound method
fn eng_axis_scene_case_18() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(false)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  assert_eq(f.call(1000002.0), "1 MHz")
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "")
  assert_eq(f.as_scalar_formatter().get_use_offset(), false)
  assert_eq(f.locations().length(), 0)
}

///|
// Original source case 19: unbound method
fn eng_axis_scene_case_19() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(false)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  assert_eq(f.format_data(1000002.0), "1 MHz")
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "")
  assert_eq(f.as_scalar_formatter().get_use_offset(), false)
  assert_eq(f.locations().length(), 0)
}

///|
// Original source case 20: unbound method
fn eng_axis_scene_case_20() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(false)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  assert_eq(f.format_eng(1000002.0), "1 MHz")
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "")
  assert_eq(f.as_scalar_formatter().get_use_offset(), false)
  assert_eq(f.locations().length(), 0)
}

///|
// Original source case 21: unbound method
fn eng_axis_scene_case_21() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(false)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let failed = try {
    ignore(f.format_data_short(0.123456789))
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
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "")
  assert_eq(f.as_scalar_formatter().get_use_offset(), false)
  assert_eq(f.locations().length(), 0)
}

///|
// Original source case 22: unbound method
fn eng_axis_scene_case_22() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(false)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  assert_eq(
    f.format_data_short_value(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("1000002")),
    ),
    "1000002",
  )
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "")
  assert_eq(f.as_scalar_formatter().get_use_offset(), false)
  assert_eq(f.locations().length(), 0)
}

///|
// Original source case 23: unbound method
fn eng_axis_scene_case_23() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(false)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  assert_eq(f.get_offset(), "")
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "")
  assert_eq(f.as_scalar_formatter().get_use_offset(), false)
  assert_eq(f.locations().length(), 0)
}

///|
// Original source case 24: view error preserves earlier state
fn eng_axis_scene_case_24() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let reads = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    reads.val += 1
    if reads.val == 1 {
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
  assert_eq(reads.val, 1)
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "")
  assert_eq(f.as_scalar_formatter().get_use_offset(), true)
  assert_eq(f.locations().length(), 1)
  assert_eq(
    f.locations().get(0).reinterpret_as_uint64(),
    1000001.0.reinterpret_as_uint64(),
  )
}

///|
// Original source case 25: view error preserves earlier state
fn eng_axis_scene_case_25() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let reads = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    reads.val += 1
    if reads.val == 2 {
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
  assert_eq(reads.val, 2)
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "")
  assert_eq(f.as_scalar_formatter().get_use_offset(), true)
  assert_eq(f.locations().length(), 1)
  assert_eq(
    f.locations().get(0).reinterpret_as_uint64(),
    1000001.0.reinterpret_as_uint64(),
  )
}

///|
// Original source case 26: view error preserves earlier state
fn eng_axis_scene_case_26() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let reads = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    reads.val += 1
    if reads.val == 3 {
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
  assert_eq(reads.val, 3)
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "")
  assert_eq(f.as_scalar_formatter().get_use_offset(), true)
  assert_eq(f.locations().length(), 1)
  assert_eq(
    f.locations().get(0).reinterpret_as_uint64(),
    1000001.0.reinterpret_as_uint64(),
  )
}

///|
// Original source case 27: raw view domain and sorted span
fn eng_axis_scene_case_27() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(false)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  binding.set_view_interval(
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([0.0, 0.0]),
    ),
  )
  f.set_axis(Some(binding))
  let failed = try {
    ignore(f.set_locs_view(@ticker.TickValues::from_array([1.0, 2.0])))
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(message, "ValueError: math domain error")
      true
    }
    _ => false
  }
  assert_true(failed)
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "")
  assert_eq(f.as_scalar_formatter().get_use_offset(), false)
  assert_eq(f.locations().length(), 2)
  assert_eq(
    f.locations().get(0).reinterpret_as_uint64(),
    1.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(1).reinterpret_as_uint64(),
    2.0.reinterpret_as_uint64(),
  )
}

///|
// Original source case 28: raw view domain and sorted span
fn eng_axis_scene_case_28() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(false)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  binding.set_view_interval(
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([2.0, 2.0]),
    ),
  )
  f.set_axis(Some(binding))
  let failed = try {
    ignore(f.set_locs_view(@ticker.TickValues::from_array([1.0, 2.0])))
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(message, "ValueError: math domain error")
      true
    }
    _ => false
  }
  assert_true(failed)
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "")
  assert_eq(f.as_scalar_formatter().get_use_offset(), false)
  assert_eq(f.locations().length(), 2)
  assert_eq(
    f.locations().get(0).reinterpret_as_uint64(),
    1.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(1).reinterpret_as_uint64(),
    2.0.reinterpret_as_uint64(),
  )
}

///|
// Original source case 29: raw view domain and sorted span
fn eng_axis_scene_case_29() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(false)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  binding.set_view_interval(
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([1000004.0, 1000000.0]),
    ),
  )
  f.set_axis(Some(binding))
  f.set_locs_view(@ticker.TickValues::from_array([1.0, 2.0]))
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "%1.0f")
  assert_eq(f.as_scalar_formatter().get_use_offset(), false)
  assert_eq(f.locations().length(), 2)
  assert_eq(
    f.locations().get(0).reinterpret_as_uint64(),
    1.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(1).reinterpret_as_uint64(),
    2.0.reinterpret_as_uint64(),
  )
}

///|
// Original source case 30: raw view domain and sorted span
fn eng_axis_scene_case_30() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(false)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  binding.set_view_interval(
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([0.0 / 0.0, 1.0]),
    ),
  )
  f.set_axis(Some(binding))
  let failed = try {
    ignore(f.set_locs_view(@ticker.TickValues::from_array([1.0, 2.0])))
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
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "")
  assert_eq(f.as_scalar_formatter().get_use_offset(), false)
  assert_eq(f.locations().length(), 2)
  assert_eq(
    f.locations().get(0).reinterpret_as_uint64(),
    1.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(1).reinterpret_as_uint64(),
    2.0.reinterpret_as_uint64(),
  )
}

///|
// Original source case 31: raw view domain and sorted span
fn eng_axis_scene_case_31() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(false)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  binding.set_view_interval(
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([1.0, 0.0 / 0.0]),
    ),
  )
  f.set_axis(Some(binding))
  let failed = try {
    ignore(f.set_locs_view(@ticker.TickValues::from_array([1.0, 2.0])))
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
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "")
  assert_eq(f.as_scalar_formatter().get_use_offset(), false)
  assert_eq(f.locations().length(), 2)
  assert_eq(
    f.locations().get(0).reinterpret_as_uint64(),
    1.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(1).reinterpret_as_uint64(),
    2.0.reinterpret_as_uint64(),
  )
}

///|
// Original source case 32: raw view domain and sorted span
fn eng_axis_scene_case_32() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(false)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  binding.set_view_interval(
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([-1.0 / 0.0, 1.0 / 0.0]),
    ),
  )
  f.set_axis(Some(binding))
  let failed = try {
    ignore(f.set_locs_view(@ticker.TickValues::from_array([1.0, 2.0])))
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
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "")
  assert_eq(f.as_scalar_formatter().get_use_offset(), false)
  assert_eq(f.locations().length(), 2)
  assert_eq(
    f.locations().get(0).reinterpret_as_uint64(),
    1.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(1).reinterpret_as_uint64(),
    2.0.reinterpret_as_uint64(),
  )
}

///|
// Original source case 33: raw view domain and sorted span
fn eng_axis_scene_case_33() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(false)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  binding.set_view_interval(
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([1.0, 1.0 / 0.0]),
    ),
  )
  f.set_axis(Some(binding))
  let failed = try {
    ignore(f.set_locs_view(@ticker.TickValues::from_array([1.0, 2.0])))
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
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "")
  assert_eq(f.as_scalar_formatter().get_use_offset(), false)
  assert_eq(f.locations().length(), 2)
  assert_eq(
    f.locations().get(0).reinterpret_as_uint64(),
    1.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(1).reinterpret_as_uint64(),
    2.0.reinterpret_as_uint64(),
  )
}

///|
// Original source case 34: view origin transports scalar span before log
fn eng_axis_scene_case_34() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(false)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  binding.set_view_interval(
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_int64_array([
        -9223372036854775807L - 1L,
        9223372036854775807L,
      ]),
    ),
  )
  f.set_axis(Some(binding))
  let failed = try {
    ignore(f.set_locs_view(@ticker.TickValues::from_array([0.0, 1.0])))
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(message, "ValueError: math domain error")
      true
    }
    _ => false
  }
  assert_true(failed)
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "")
  assert_eq(f.as_scalar_formatter().get_use_offset(), false)
  assert_eq(f.locations().length(), 2)
  assert_eq(
    f.locations().get(0).reinterpret_as_uint64(),
    0.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(1).reinterpret_as_uint64(),
    1.0.reinterpret_as_uint64(),
  )
}

///|
// Original source case 35: view origin transports scalar span before log
fn eng_axis_scene_case_35() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(false)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  binding.set_view_interval(
    @ticker.FormatterViewInterval::Integers([
      @bigint.BigInt::from_string(
        "-10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
      ),
      @bigint.BigInt::from_string(
        "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
      ),
    ]),
  )
  f.set_axis(Some(binding))
  let failed = try {
    ignore(f.set_locs_view(@ticker.TickValues::from_array([0.0, 1.0])))
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(message, "OverflowError: (34, 'Result too large')")
      true
    }
    _ => false
  }
  assert_true(failed)
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("399")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "")
  assert_eq(f.as_scalar_formatter().get_use_offset(), false)
  assert_eq(f.locations().length(), 2)
  assert_eq(
    f.locations().get(0).reinterpret_as_uint64(),
    0.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(1).reinterpret_as_uint64(),
    1.0.reinterpret_as_uint64(),
  )
}

///|
// Original source case 36: view origin transports scalar span before log
fn eng_axis_scene_case_36() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(false)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  binding.set_view_interval(
    @ticker.FormatterViewInterval::Sequence([1000000.0, 1000004.0]),
  )
  f.set_axis(Some(binding))
  f.set_locs_view(@ticker.TickValues::from_array([0.0, 1.0]))
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "%1.0f")
  assert_eq(f.as_scalar_formatter().get_use_offset(), false)
  assert_eq(f.locations().length(), 2)
  assert_eq(
    f.locations().get(0).reinterpret_as_uint64(),
    0.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(1).reinterpret_as_uint64(),
    1.0.reinterpret_as_uint64(),
  )
}

///|
// Original source case 37: first view midpoint versus independently read offset view
fn eng_axis_scene_case_37() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
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
    ["−2", "0", "2"],
  )
  assert_eq(reads.val, 2)
  assert_eq(f.get_offset(), "1 Hz+1 MHz")
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::NumpyFloat64(1000002.0)),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "%1.0f")
  assert_eq(f.as_scalar_formatter().get_use_offset(), true)
  assert_eq(f.locations().length(), 3)
  assert_eq(
    f.locations().get(0).reinterpret_as_uint64(),
    1000000.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(1).reinterpret_as_uint64(),
    1000002.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(2).reinterpret_as_uint64(),
    1000004.0.reinterpret_as_uint64(),
  )
}

///|
// Original source case 38: first versus second live view independently controls stage
fn eng_axis_scene_case_38() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
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
          [0.0, 1.0]
        },
      ),
    )
  })
  f.set_axis(Some(binding))
  assert_eq(
    f.format_ticks_view(
      @ticker.TickValues::from_array([1000000.0, 1000002.0, 1000004.0]),
    ),
    ["1 MHz", "1 MHz", "1 MHz"],
  )
  assert_eq(reads.val, 2)
  assert_eq(f.get_offset(), "")
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "%1.0f")
  assert_eq(f.as_scalar_formatter().get_use_offset(), true)
  assert_eq(f.locations().length(), 3)
  assert_eq(
    f.locations().get(0).reinterpret_as_uint64(),
    1000000.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(1).reinterpret_as_uint64(),
    1000002.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(2).reinterpret_as_uint64(),
    1000004.0.reinterpret_as_uint64(),
  )
}

///|
// Original source case 39: first versus second live view independently controls stage
fn eng_axis_scene_case_39() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
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
          [0.0, 2000000.0]
        } else {
          [1000000.0, 1000004.0]
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
  assert_eq(f.get_offset(), "1 MHz+1 MHz")
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::NumpyFloat64(1000000.0)),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "%1.6f")
  assert_eq(f.as_scalar_formatter().get_use_offset(), true)
  assert_eq(f.locations().length(), 3)
  assert_eq(
    f.locations().get(0).reinterpret_as_uint64(),
    1000000.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(1).reinterpret_as_uint64(),
    1000002.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(2).reinterpret_as_uint64(),
    1000004.0.reinterpret_as_uint64(),
  )
}

///|
// Original source case 40: engineering midpoint retains view scalar origin
fn eng_axis_scene_case_40() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
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
      @ticker.TickValues::from_array([1000000.0, 1000002.0, 1000004.0]),
    ),
    ["−2", "0", "2"],
  )
  assert_eq(f.get_offset(), "1 Hz+1 MHz")
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::NumpyFloat64(1000002.0)),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "%1.0f")
  assert_eq(f.as_scalar_formatter().get_use_offset(), true)
  assert_eq(f.locations().length(), 3)
  assert_eq(
    f.locations().get(0).reinterpret_as_uint64(),
    1000000.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(1).reinterpret_as_uint64(),
    1000002.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(2).reinterpret_as_uint64(),
    1000004.0.reinterpret_as_uint64(),
  )
}

///|
// Original source case 41: engineering midpoint retains view scalar origin
fn eng_axis_scene_case_41() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  binding.set_view_interval(
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_int64_array([1000000L, 1000004L]),
    ),
  )
  f.set_axis(Some(binding))
  assert_eq(
    f.format_ticks_view(
      @ticker.TickValues::from_array([1000000.0, 1000002.0, 1000004.0]),
    ),
    ["−2", "0", "2"],
  )
  assert_eq(f.get_offset(), "1 Hz+1 MHz")
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::NumpyFloat64(1000002.0)),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "%1.0f")
  assert_eq(f.as_scalar_formatter().get_use_offset(), true)
  assert_eq(f.locations().length(), 3)
  assert_eq(
    f.locations().get(0).reinterpret_as_uint64(),
    1000000.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(1).reinterpret_as_uint64(),
    1000002.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(2).reinterpret_as_uint64(),
    1000004.0.reinterpret_as_uint64(),
  )
}

///|
// Original source case 42: full raw locations retained before display filtering
fn eng_axis_scene_case_42() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
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
      @ticker.TickValues::from_array([1000000.0, 1000002.0, 1000004.0]),
    ),
    ["−2", "0", "2"],
  )
  assert_eq(f.get_offset(), "1 Hz+1 MHz")
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::NumpyFloat64(1000002.0)),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "%1.0f")
  assert_eq(f.as_scalar_formatter().get_use_offset(), true)
  assert_eq(f.locations().length(), 3)
  assert_eq(
    f.locations().get(0).reinterpret_as_uint64(),
    1000000.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(1).reinterpret_as_uint64(),
    1000002.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(2).reinterpret_as_uint64(),
    1000004.0.reinterpret_as_uint64(),
  )
}

///|
// Original source case 43: full raw locations retained before display filtering
fn eng_axis_scene_case_43() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
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
    ["−3", "−2", "0", "2", "3"],
  )
  assert_eq(f.get_offset(), "1 Hz+1 MHz")
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::NumpyFloat64(1000002.0)),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "%1.0f")
  assert_eq(f.as_scalar_formatter().get_use_offset(), true)
  assert_eq(f.locations().length(), 5)
  assert_eq(
    f.locations().get(0).reinterpret_as_uint64(),
    999999.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(1).reinterpret_as_uint64(),
    1000000.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(2).reinterpret_as_uint64(),
    1000002.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(3).reinterpret_as_uint64(),
    1000004.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(4).reinterpret_as_uint64(),
    1000005.0.reinterpret_as_uint64(),
  )
}

///|
// Original source case 44: full raw locations retained before display filtering
fn eng_axis_scene_case_44() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
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
        1000000.0001, 1000000.0002, 1000000.0003, 2000000.0,
      ]),
    ),
    ["−2", "−2", "−2", "999998"],
  )
  assert_eq(f.get_offset(), "1 Hz+1 MHz")
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::NumpyFloat64(1000002.0)),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "%1.0f")
  assert_eq(f.as_scalar_formatter().get_use_offset(), true)
  assert_eq(f.locations().length(), 4)
  assert_eq(
    f.locations().get(0).reinterpret_as_uint64(),
    1000000.0001.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(1).reinterpret_as_uint64(),
    1000000.0002.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(2).reinterpret_as_uint64(),
    1000000.0003.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(3).reinterpret_as_uint64(),
    2000000.0.reinterpret_as_uint64(),
  )
}

///|
// Original source case 45: empty assignment retains caches but call reverts to engineering independent format
fn eng_axis_scene_case_45() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
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
  f.set_locs_view(
    @ticker.TickValues::from_array([1000000.0, 1000002.0, 1000004.0]),
  )
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::NumpyFloat64(1000002.0)),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "%1.0f")
  assert_eq(f.as_scalar_formatter().get_use_offset(), true)
  assert_eq(f.locations().length(), 3)
  assert_eq(
    f.locations().get(0).reinterpret_as_uint64(),
    1000000.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(1).reinterpret_as_uint64(),
    1000002.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(2).reinterpret_as_uint64(),
    1000004.0.reinterpret_as_uint64(),
  )
  f.set_locs([])
  assert_eq(f.call(1000002.0), "1 MHz")
  assert_eq(f.get_offset(), "")
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::NumpyFloat64(1000002.0)),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "%1.0f")
  assert_eq(f.as_scalar_formatter().get_use_offset(), true)
  assert_eq(f.locations().length(), 0)
}

///|
// Original source case 46: zero offset suppresses offset text regardless nonzero cached order
fn eng_axis_scene_case_46() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(false)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let live : Array[Double] = []
  f.set_locs(live)
  live.push(1.0)
  live.push(2.0)
  f
  .as_scalar_formatter()
  .set_order_of_magnitude(
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_int(6)),
  )
  assert_eq(f.get_offset(), "")
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "")
  assert_eq(f.as_scalar_formatter().get_use_offset(), false)
  assert_eq(f.locations().length(), 2)
  assert_eq(
    f.locations().get(0).reinterpret_as_uint64(),
    1.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(1).reinterpret_as_uint64(),
    2.0.reinterpret_as_uint64(),
  )
}

///|
// Original source case 47: offset read can fail late without reading axis
fn eng_axis_scene_case_47() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(false)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let live : Array[Double] = []
  f.set_locs(live)
  live.push(1.0)
  live.push(2.0)
  f
  .as_scalar_formatter()
  .set_use_offset(Some(@ticker.ScalarNumber::Number(0.0 / 0.0)))
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
  match f.as_scalar_formatter().offset() {
    Some(@ticker.ScalarNumber::Number(value)) => assert_true(value.is_nan())
    _ => fail("expected raw Python NaN offset")
  }
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "")
  assert_eq(f.as_scalar_formatter().get_use_offset(), false)
  assert_eq(f.locations().length(), 2)
  assert_eq(
    f.locations().get(0).reinterpret_as_uint64(),
    1.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(1).reinterpret_as_uint64(),
    2.0.reinterpret_as_uint64(),
  )
}

///|
// Original source case 48: complete original Axis.draw engineering offset lifecycle
fn eng_axis_scene_case_48() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=320, height=200)
  let axes = figure.axes()
  axes.set_x_limits(1000000.0, 1000004.0)
  axes.set_y_limits(1000000.0, 1000004.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.x_axis()
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  axis.set_named_formatter(f.as_base_formatter())
  axis.set_locator(
    @ticker.FixedLocator::new([
      999999.0, 1000000.0, 1000002.0, 1000004.0, 1000005.0,
    ]).as_locator(),
  )
  axis.set_minor_locator(
    @ticker.FixedLocator::new([1000001.0]).as_minor_locator(),
  )
  axis.set_minor_named_formatter(
    @ticker.NullFormatter::new().as_base_formatter(),
  )
  let svg = figure.to_svg_checked()
  assert_eq(svg.split(">1 Hz+1 MHz<").count() - 1, 1)
  assert_eq(svg.split(">−2<").count() - 1, 1)
  assert_eq(svg.split(">0<").count() - 1, 1)
  assert_eq(svg.split(">2<").count() - 1, 1)
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::NumpyFloat64(1000002.0)),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "%1.0f")
  assert_eq(f.as_scalar_formatter().get_use_offset(), true)
  assert_eq(f.locations().length(), 5)
  assert_eq(
    f.locations().get(0).reinterpret_as_uint64(),
    999999.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(1).reinterpret_as_uint64(),
    1000000.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(2).reinterpret_as_uint64(),
    1000002.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(3).reinterpret_as_uint64(),
    1000004.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(4).reinterpret_as_uint64(),
    1000005.0.reinterpret_as_uint64(),
  )
}

///|
// Original source case 49: complete original Axis.draw engineering offset lifecycle
fn eng_axis_scene_case_49() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=320, height=200)
  let axes = figure.axes()
  axes.set_x_limits(1000000.0, 1000004.0)
  axes.set_y_limits(1000000.0, 1000004.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.x_axis()
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(false)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  axis.set_named_formatter(f.as_base_formatter())
  axis.set_locator(
    @ticker.FixedLocator::new([
      999999.0, 1000000.0, 1000002.0, 1000004.0, 1000005.0,
    ]).as_locator(),
  )
  axis.set_minor_locator(
    @ticker.FixedLocator::new([1000001.0]).as_minor_locator(),
  )
  axis.set_minor_named_formatter(
    @ticker.NullFormatter::new().as_base_formatter(),
  )
  let svg = figure.to_svg_checked()
  assert_eq(f.get_offset(), "")
  assert_eq(svg.split(">1 MHz<").count() - 1, 3)
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "%1.0f")
  assert_eq(f.as_scalar_formatter().get_use_offset(), false)
  assert_eq(f.locations().length(), 5)
  assert_eq(
    f.locations().get(0).reinterpret_as_uint64(),
    999999.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(1).reinterpret_as_uint64(),
    1000000.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(2).reinterpret_as_uint64(),
    1000002.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(3).reinterpret_as_uint64(),
    1000004.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(4).reinterpret_as_uint64(),
    1000005.0.reinterpret_as_uint64(),
  )
}

///|
// Original source case 50: complete original Axis.draw engineering offset lifecycle
fn eng_axis_scene_case_50() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=320, height=200)
  let axes = figure.axes()
  axes.set_x_limits(1000000.0, 1000004.0)
  axes.set_y_limits(1000000.0, 1000004.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.x_axis()
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  axis.set_named_formatter(f.as_base_formatter())
  axis.set_locator(
    @ticker.FixedLocator::new([
      999999.0, 1000000.0, 1000002.0, 1000004.0, 1000005.0,
    ]).as_locator(),
  )
  axis.set_minor_locator(
    @ticker.FixedLocator::new([1000001.0]).as_minor_locator(),
  )
  axis.set_minor_named_formatter(f.as_base_formatter())
  let svg = figure.to_svg_checked()
  assert_eq(f.get_offset(), "")
  assert_eq(svg.split(">−2<").count() - 1, 1)
  assert_eq(svg.split(">0<").count() - 1, 1)
  assert_eq(svg.split(">2<").count() - 1, 1)
  assert_eq(svg.split(">1 MHz<").count() - 1, 1)
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "%1.0f")
  assert_eq(f.as_scalar_formatter().get_use_offset(), true)
  assert_eq(f.locations().length(), 1)
  assert_eq(
    f.locations().get(0).reinterpret_as_uint64(),
    1000001.0.reinterpret_as_uint64(),
  )
}

///|
// Original source case 51: complete original Axis.draw engineering offset lifecycle
fn eng_axis_scene_case_51() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=320, height=200)
  let axes = figure.axes()
  axes.set_x_limits(1000000.0, 1000004.0)
  axes.set_y_limits(1000000.0, 1000004.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.x_axis()
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  axis.set_named_formatter(f.as_base_formatter())
  axis.set_locator(
    @ticker.FixedLocator::new([
      999999.0, 1000000.0, 1000002.0, 1000004.0, 1000005.0,
    ]).as_locator(),
  )
  axis.set_minor_locator(
    @ticker.FixedLocator::new([1000001.0]).as_minor_locator(),
  )
  axis.set_minor_named_formatter(
    @ticker.FuncFormatter::new((_, _) => {
      f
      .as_scalar_formatter()
      .set_use_offset(Some(@ticker.ScalarNumber::Number(2000000.0)))
      "minor"
    }).as_base_formatter(),
  )
  let svg = figure.to_svg_checked()
  assert_eq(svg.split(">1 Hz+2 MHz<").count() - 1, 1)
  assert_eq(svg.split(">−2<").count() - 1, 1)
  assert_eq(svg.split(">0<").count() - 1, 1)
  assert_eq(svg.split(">2<").count() - 1, 1)
  assert_eq(svg.split(">minor<").count() - 1, 1)
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::Number(2000000.0)),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "%1.0f")
  assert_eq(f.as_scalar_formatter().get_use_offset(), false)
  assert_eq(f.locations().length(), 5)
  assert_eq(
    f.locations().get(0).reinterpret_as_uint64(),
    999999.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(1).reinterpret_as_uint64(),
    1000000.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(2).reinterpret_as_uint64(),
    1000002.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(3).reinterpret_as_uint64(),
    1000004.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(4).reinterpret_as_uint64(),
    1000005.0.reinterpret_as_uint64(),
  )
}

///|
// Original source case 52: complete original Axis.draw engineering offset lifecycle
fn eng_axis_scene_case_52() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=320, height=200)
  let axes = figure.axes()
  axes.set_x_limits(1000000.0, 1000004.0)
  axes.set_y_limits(1000000.0, 1000004.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.x_axis()
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  axis.set_named_formatter(f.as_base_formatter())
  axis.set_locator(
    @ticker.FixedLocator::new([
      999999.0, 1000000.0, 1000002.0, 1000004.0, 1000005.0,
    ]).as_locator(),
  )
  axis.set_minor_locator(
    @ticker.FixedLocator::new([1000001.0]).as_minor_locator(),
  )
  axis.set_minor_named_formatter(
    @ticker.FuncFormatter::new((_, _) => {
      f.set_unit("s")
      "minor"
    }).as_base_formatter(),
  )
  let svg = figure.to_svg_checked()
  assert_eq(svg.split(">1 s+1 Ms<").count() - 1, 1)
  assert_eq(svg.split(">−2<").count() - 1, 1)
  assert_eq(svg.split(">0<").count() - 1, 1)
  assert_eq(svg.split(">2<").count() - 1, 1)
  assert_eq(svg.split(">minor<").count() - 1, 1)
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::NumpyFloat64(1000002.0)),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "%1.0f")
  assert_eq(f.as_scalar_formatter().get_use_offset(), true)
  assert_eq(f.locations().length(), 5)
  assert_eq(
    f.locations().get(0).reinterpret_as_uint64(),
    999999.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(1).reinterpret_as_uint64(),
    1000000.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(2).reinterpret_as_uint64(),
    1000002.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(3).reinterpret_as_uint64(),
    1000004.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(4).reinterpret_as_uint64(),
    1000005.0.reinterpret_as_uint64(),
  )
}

///|
// Original source case 53: complete original Axis.draw engineering offset lifecycle
fn eng_axis_scene_case_53() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=320, height=200)
  let axes = figure.axes()
  axes.set_x_limits(1000000.0, 1000004.0)
  axes.set_y_limits(1000000.0, 1000004.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.x_axis()
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  axis.set_named_formatter(f.as_base_formatter())
  axis.set_locator(
    @ticker.FixedLocator::new([
      999999.0, 1000000.0, 1000002.0, 1000004.0, 1000005.0,
    ]).as_locator(),
  )
  axis.set_minor_locator(
    @ticker.FixedLocator::new([1000001.0]).as_minor_locator(),
  )
  axis.set_minor_named_formatter(
    @ticker.NullFormatter::new().as_base_formatter(),
  )
  f.set_locs_view(
    @ticker.TickValues::from_array([1000000.0, 1000002.0, 1000004.0]),
  )
  axis.set_locator(@ticker.NullLocator::new().as_locator())
  axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let svg = figure.to_svg_checked()
  assert_eq(svg.split(">1 Hz+1 MHz<").count() - 1, 1)
  assert_true(!svg.contains(">−2<"))
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::NumpyFloat64(1000002.0)),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "%1.0f")
  assert_eq(f.as_scalar_formatter().get_use_offset(), true)
  assert_eq(f.locations().length(), 3)
  assert_eq(
    f.locations().get(0).reinterpret_as_uint64(),
    1000000.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(1).reinterpret_as_uint64(),
    1000002.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(2).reinterpret_as_uint64(),
    1000004.0.reinterpret_as_uint64(),
  )
}

///|
// Original source case 54: complete original Axis.draw engineering offset lifecycle
fn eng_axis_scene_case_54() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=320, height=200)
  let axes = figure.axes()
  axes.set_x_limits(1000000.0, 1000004.0)
  axes.set_y_limits(1000000.0, 1000004.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.x_axis()
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  axis.set_named_formatter(f.as_base_formatter())
  axis.set_locator(
    @ticker.FixedLocator::new([
      999999.0, 1000000.0, 1000002.0, 1000004.0, 1000005.0,
    ]).as_locator(),
  )
  axis.set_minor_locator(
    @ticker.FixedLocator::new([1000001.0]).as_minor_locator(),
  )
  axis.set_minor_named_formatter(
    @ticker.FuncFormatter::new((_, _) => {
      f.set_places(
        Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_int(-1))),
      )
      "minor"
    }).as_base_formatter(),
  )
  let failed = try {
    ignore(figure.to_svg_checked())
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(message, "ValueError: Format specifier missing precision")
      true
    }
    _ => false
  }
  assert_true(failed)
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::NumpyFloat64(1000002.0)),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "%1.0f")
  assert_eq(f.as_scalar_formatter().get_use_offset(), true)
  assert_eq(f.locations().length(), 5)
  assert_eq(
    f.locations().get(0).reinterpret_as_uint64(),
    999999.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(1).reinterpret_as_uint64(),
    1000000.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(2).reinterpret_as_uint64(),
    1000002.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(3).reinterpret_as_uint64(),
    1000004.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(4).reinterpret_as_uint64(),
    1000005.0.reinterpret_as_uint64(),
  )
}

///|
// Original source case 55: complete original Axis.draw engineering offset lifecycle
fn eng_axis_scene_case_55() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=320, height=200)
  let axes = figure.axes()
  axes.set_x_limits(1000000.0, 1000004.0)
  axes.set_y_limits(1000000.0, 1000004.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.y_axis()
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  axis.set_named_formatter(f.as_base_formatter())
  axis.set_locator(
    @ticker.FixedLocator::new([
      999999.0, 1000000.0, 1000002.0, 1000004.0, 1000005.0,
    ]).as_locator(),
  )
  axis.set_minor_locator(
    @ticker.FixedLocator::new([1000001.0]).as_minor_locator(),
  )
  axis.set_minor_named_formatter(
    @ticker.NullFormatter::new().as_base_formatter(),
  )
  let svg = figure.to_svg_checked()
  assert_eq(svg.split(">1 Hz+1 MHz<").count() - 1, 1)
  assert_eq(svg.split(">−2<").count() - 1, 1)
  assert_eq(svg.split(">0<").count() - 1, 1)
  assert_eq(svg.split(">2<").count() - 1, 1)
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::NumpyFloat64(1000002.0)),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "%1.0f")
  assert_eq(f.as_scalar_formatter().get_use_offset(), true)
  assert_eq(f.locations().length(), 5)
  assert_eq(
    f.locations().get(0).reinterpret_as_uint64(),
    999999.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(1).reinterpret_as_uint64(),
    1000000.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(2).reinterpret_as_uint64(),
    1000002.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(3).reinterpret_as_uint64(),
    1000004.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(4).reinterpret_as_uint64(),
    1000005.0.reinterpret_as_uint64(),
  )
}

///|
// Original source case 56: complete original Axis.draw engineering offset lifecycle
fn eng_axis_scene_case_56() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=320, height=200)
  let axes = figure.axes()
  axes.set_x_limits(1000000.0, 1000004.0)
  axes.set_y_limits(1000000.0, 1000004.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.y_axis()
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(false)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  axis.set_named_formatter(f.as_base_formatter())
  axis.set_locator(
    @ticker.FixedLocator::new([
      999999.0, 1000000.0, 1000002.0, 1000004.0, 1000005.0,
    ]).as_locator(),
  )
  axis.set_minor_locator(
    @ticker.FixedLocator::new([1000001.0]).as_minor_locator(),
  )
  axis.set_minor_named_formatter(
    @ticker.NullFormatter::new().as_base_formatter(),
  )
  let svg = figure.to_svg_checked()
  assert_eq(f.get_offset(), "")
  assert_eq(svg.split(">1 MHz<").count() - 1, 3)
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "%1.0f")
  assert_eq(f.as_scalar_formatter().get_use_offset(), false)
  assert_eq(f.locations().length(), 5)
  assert_eq(
    f.locations().get(0).reinterpret_as_uint64(),
    999999.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(1).reinterpret_as_uint64(),
    1000000.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(2).reinterpret_as_uint64(),
    1000002.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(3).reinterpret_as_uint64(),
    1000004.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(4).reinterpret_as_uint64(),
    1000005.0.reinterpret_as_uint64(),
  )
}

///|
// Original source case 57: complete original Axis.draw engineering offset lifecycle
fn eng_axis_scene_case_57() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=320, height=200)
  let axes = figure.axes()
  axes.set_x_limits(1000000.0, 1000004.0)
  axes.set_y_limits(1000000.0, 1000004.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.y_axis()
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  axis.set_named_formatter(f.as_base_formatter())
  axis.set_locator(
    @ticker.FixedLocator::new([
      999999.0, 1000000.0, 1000002.0, 1000004.0, 1000005.0,
    ]).as_locator(),
  )
  axis.set_minor_locator(
    @ticker.FixedLocator::new([1000001.0]).as_minor_locator(),
  )
  axis.set_minor_named_formatter(f.as_base_formatter())
  let svg = figure.to_svg_checked()
  assert_eq(f.get_offset(), "")
  assert_eq(svg.split(">−2<").count() - 1, 1)
  assert_eq(svg.split(">0<").count() - 1, 1)
  assert_eq(svg.split(">2<").count() - 1, 1)
  assert_eq(svg.split(">1 MHz<").count() - 1, 1)
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "%1.0f")
  assert_eq(f.as_scalar_formatter().get_use_offset(), true)
  assert_eq(f.locations().length(), 1)
  assert_eq(
    f.locations().get(0).reinterpret_as_uint64(),
    1000001.0.reinterpret_as_uint64(),
  )
}

///|
// Original source case 58: complete original Axis.draw engineering offset lifecycle
fn eng_axis_scene_case_58() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=320, height=200)
  let axes = figure.axes()
  axes.set_x_limits(1000000.0, 1000004.0)
  axes.set_y_limits(1000000.0, 1000004.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.y_axis()
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  axis.set_named_formatter(f.as_base_formatter())
  axis.set_locator(
    @ticker.FixedLocator::new([
      999999.0, 1000000.0, 1000002.0, 1000004.0, 1000005.0,
    ]).as_locator(),
  )
  axis.set_minor_locator(
    @ticker.FixedLocator::new([1000001.0]).as_minor_locator(),
  )
  axis.set_minor_named_formatter(
    @ticker.FuncFormatter::new((_, _) => {
      f
      .as_scalar_formatter()
      .set_use_offset(Some(@ticker.ScalarNumber::Number(2000000.0)))
      "minor"
    }).as_base_formatter(),
  )
  let svg = figure.to_svg_checked()
  assert_eq(svg.split(">1 Hz+2 MHz<").count() - 1, 1)
  assert_eq(svg.split(">−2<").count() - 1, 1)
  assert_eq(svg.split(">0<").count() - 1, 1)
  assert_eq(svg.split(">2<").count() - 1, 1)
  assert_eq(svg.split(">minor<").count() - 1, 1)
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::Number(2000000.0)),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "%1.0f")
  assert_eq(f.as_scalar_formatter().get_use_offset(), false)
  assert_eq(f.locations().length(), 5)
  assert_eq(
    f.locations().get(0).reinterpret_as_uint64(),
    999999.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(1).reinterpret_as_uint64(),
    1000000.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(2).reinterpret_as_uint64(),
    1000002.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(3).reinterpret_as_uint64(),
    1000004.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(4).reinterpret_as_uint64(),
    1000005.0.reinterpret_as_uint64(),
  )
}

///|
// Original source case 59: complete original Axis.draw engineering offset lifecycle
fn eng_axis_scene_case_59() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=320, height=200)
  let axes = figure.axes()
  axes.set_x_limits(1000000.0, 1000004.0)
  axes.set_y_limits(1000000.0, 1000004.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.y_axis()
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  axis.set_named_formatter(f.as_base_formatter())
  axis.set_locator(
    @ticker.FixedLocator::new([
      999999.0, 1000000.0, 1000002.0, 1000004.0, 1000005.0,
    ]).as_locator(),
  )
  axis.set_minor_locator(
    @ticker.FixedLocator::new([1000001.0]).as_minor_locator(),
  )
  axis.set_minor_named_formatter(
    @ticker.FuncFormatter::new((_, _) => {
      f.set_unit("s")
      "minor"
    }).as_base_formatter(),
  )
  let svg = figure.to_svg_checked()
  assert_eq(svg.split(">1 s+1 Ms<").count() - 1, 1)
  assert_eq(svg.split(">−2<").count() - 1, 1)
  assert_eq(svg.split(">0<").count() - 1, 1)
  assert_eq(svg.split(">2<").count() - 1, 1)
  assert_eq(svg.split(">minor<").count() - 1, 1)
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::NumpyFloat64(1000002.0)),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "%1.0f")
  assert_eq(f.as_scalar_formatter().get_use_offset(), true)
  assert_eq(f.locations().length(), 5)
  assert_eq(
    f.locations().get(0).reinterpret_as_uint64(),
    999999.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(1).reinterpret_as_uint64(),
    1000000.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(2).reinterpret_as_uint64(),
    1000002.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(3).reinterpret_as_uint64(),
    1000004.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(4).reinterpret_as_uint64(),
    1000005.0.reinterpret_as_uint64(),
  )
}

///|
// Original source case 60: complete original Axis.draw engineering offset lifecycle
fn eng_axis_scene_case_60() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=320, height=200)
  let axes = figure.axes()
  axes.set_x_limits(1000000.0, 1000004.0)
  axes.set_y_limits(1000000.0, 1000004.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.y_axis()
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  axis.set_named_formatter(f.as_base_formatter())
  axis.set_locator(
    @ticker.FixedLocator::new([
      999999.0, 1000000.0, 1000002.0, 1000004.0, 1000005.0,
    ]).as_locator(),
  )
  axis.set_minor_locator(
    @ticker.FixedLocator::new([1000001.0]).as_minor_locator(),
  )
  axis.set_minor_named_formatter(
    @ticker.NullFormatter::new().as_base_formatter(),
  )
  f.set_locs_view(
    @ticker.TickValues::from_array([1000000.0, 1000002.0, 1000004.0]),
  )
  axis.set_locator(@ticker.NullLocator::new().as_locator())
  axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let svg = figure.to_svg_checked()
  assert_eq(svg.split(">1 Hz+1 MHz<").count() - 1, 1)
  assert_true(!svg.contains(">−2<"))
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::NumpyFloat64(1000002.0)),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "%1.0f")
  assert_eq(f.as_scalar_formatter().get_use_offset(), true)
  assert_eq(f.locations().length(), 3)
  assert_eq(
    f.locations().get(0).reinterpret_as_uint64(),
    1000000.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(1).reinterpret_as_uint64(),
    1000002.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(2).reinterpret_as_uint64(),
    1000004.0.reinterpret_as_uint64(),
  )
}

///|
// Original source case 61: complete original Axis.draw engineering offset lifecycle
fn eng_axis_scene_case_61() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=320, height=200)
  let axes = figure.axes()
  axes.set_x_limits(1000000.0, 1000004.0)
  axes.set_y_limits(1000000.0, 1000004.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.y_axis()
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  axis.set_named_formatter(f.as_base_formatter())
  axis.set_locator(
    @ticker.FixedLocator::new([
      999999.0, 1000000.0, 1000002.0, 1000004.0, 1000005.0,
    ]).as_locator(),
  )
  axis.set_minor_locator(
    @ticker.FixedLocator::new([1000001.0]).as_minor_locator(),
  )
  axis.set_minor_named_formatter(
    @ticker.FuncFormatter::new((_, _) => {
      f.set_places(
        Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_int(-1))),
      )
      "minor"
    }).as_base_formatter(),
  )
  let failed = try {
    ignore(figure.to_svg_checked())
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(message, "ValueError: Format specifier missing precision")
      true
    }
    _ => false
  }
  assert_true(failed)
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::NumpyFloat64(1000002.0)),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "%1.0f")
  assert_eq(f.as_scalar_formatter().get_use_offset(), true)
  assert_eq(f.locations().length(), 5)
  assert_eq(
    f.locations().get(0).reinterpret_as_uint64(),
    999999.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(1).reinterpret_as_uint64(),
    1000000.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(2).reinterpret_as_uint64(),
    1000002.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(3).reinterpret_as_uint64(),
    1000004.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(4).reinterpret_as_uint64(),
    1000005.0.reinterpret_as_uint64(),
  )
}

///|
// Original source case 62: actual shared setter last owner versus old copy
fn eng_axis_scene_case_62() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
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
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
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
  assert_eq(f.get_offset(), "1 MHz+1 MHz")
  assert_eq(old.format_ticks_view(values), ["−2", "0", "2"])
  assert_eq(old.get_offset(), "1 Hz+1 MHz")
  assert_eq(f.axis(), Some(b.formatter_axis_binding()))
  ignore(external)
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::NumpyFloat64(1000000.0)),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "%1.6f")
  assert_eq(f.as_scalar_formatter().get_use_offset(), true)
  assert_eq(f.locations().length(), 3)
  assert_eq(
    f.locations().get(0).reinterpret_as_uint64(),
    1000000.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(1).reinterpret_as_uint64(),
    1000002.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(2).reinterpret_as_uint64(),
    1000004.0.reinterpret_as_uint64(),
  )
}

///|
// Original source case 63: actual Figure removal rebind versus detached external
fn eng_axis_scene_case_63() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
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
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
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
  assert_eq(f.format_ticks_view(values), ["−2", "0", "2"])
  assert_eq(f.get_offset(), "1 Hz+1 MHz")
  assert_eq(external.format_ticks_view(values), [
    "0.000000", "0.000002", "0.000004",
  ])
  assert_eq(external.get_offset(), "1 MHz+1 MHz")
  assert_eq(f.axis(), Some(a.formatter_axis_binding()))
  assert_eq(external.axis(), Some(b.formatter_axis_binding()))
  ignore(old)
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::NumpyFloat64(1000002.0)),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "%1.0f")
  assert_eq(f.as_scalar_formatter().get_use_offset(), true)
  assert_eq(f.locations().length(), 3)
  assert_eq(
    f.locations().get(0).reinterpret_as_uint64(),
    1000000.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(1).reinterpret_as_uint64(),
    1000002.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(2).reinterpret_as_uint64(),
    1000004.0.reinterpret_as_uint64(),
  )
}

///|
// Original source case 64: actual shared setter last owner versus old copy
fn eng_axis_scene_case_64() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
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
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
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
  assert_eq(f.get_offset(), "1 MHz+1 MHz")
  assert_eq(old.format_ticks_view(values), ["−2", "0", "2"])
  assert_eq(old.get_offset(), "1 Hz+1 MHz")
  assert_eq(f.axis(), Some(b.formatter_axis_binding()))
  ignore(external)
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::NumpyFloat64(1000000.0)),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "%1.6f")
  assert_eq(f.as_scalar_formatter().get_use_offset(), true)
  assert_eq(f.locations().length(), 3)
  assert_eq(
    f.locations().get(0).reinterpret_as_uint64(),
    1000000.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(1).reinterpret_as_uint64(),
    1000002.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(2).reinterpret_as_uint64(),
    1000004.0.reinterpret_as_uint64(),
  )
}

///|
// Original source case 65: actual Figure removal rebind versus detached external
fn eng_axis_scene_case_65() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
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
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
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
  assert_eq(f.format_ticks_view(values), ["−2", "0", "2"])
  assert_eq(f.get_offset(), "1 Hz+1 MHz")
  assert_eq(external.format_ticks_view(values), [
    "0.000000", "0.000002", "0.000004",
  ])
  assert_eq(external.get_offset(), "1 MHz+1 MHz")
  assert_eq(f.axis(), Some(a.formatter_axis_binding()))
  assert_eq(external.axis(), Some(b.formatter_axis_binding()))
  ignore(old)
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::NumpyFloat64(1000002.0)),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "%1.0f")
  assert_eq(f.as_scalar_formatter().get_use_offset(), true)
  assert_eq(f.locations().length(), 3)
  assert_eq(
    f.locations().get(0).reinterpret_as_uint64(),
    1000000.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(1).reinterpret_as_uint64(),
    1000002.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(2).reinterpret_as_uint64(),
    1000004.0.reinterpret_as_uint64(),
  )
}

///|
// Original source case 66: secondary actual own Bbox before synchronization
fn eng_axis_scene_case_66() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=320, height=200)
  let axes = figure.axes()
  axes.set_x_limits(1000000.0, 1000004.0)
  axes.set_y_limits(1000000.0, 1000004.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.x_axis()
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
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
    ["2 MHz", "2.00001 MHz", "2.00001 MHz"],
  )
  assert_eq(f.get_offset(), "")
  ignore(axis)
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "%1.0f")
  assert_eq(f.as_scalar_formatter().get_use_offset(), true)
  assert_eq(f.locations().length(), 3)
  assert_eq(
    f.locations().get(0).reinterpret_as_uint64(),
    2000005.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(1).reinterpret_as_uint64(),
    2000009.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(2).reinterpret_as_uint64(),
    2000013.0.reinterpret_as_uint64(),
  )
}

///|
// Original source case 67: secondary original set_lims synchronization
fn eng_axis_scene_case_67() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=320, height=200)
  let axes = figure.axes()
  axes.set_x_limits(1000000.0, 1000004.0)
  axes.set_y_limits(1000000.0, 1000004.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.x_axis()
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
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
    ["−4", "0", "4"],
  )
  assert_eq(f.get_offset(), "1 Hz+2.00001 MHz")
  ignore(axis)
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::NumpyFloat64(2000009.0)),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "%1.0f")
  assert_eq(f.as_scalar_formatter().get_use_offset(), true)
  assert_eq(f.locations().length(), 3)
  assert_eq(
    f.locations().get(0).reinterpret_as_uint64(),
    2000005.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(1).reinterpret_as_uint64(),
    2000009.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(2).reinterpret_as_uint64(),
    2000013.0.reinterpret_as_uint64(),
  )
}

///|
// Original source case 68: secondary parent mutation remains stale before sync
fn eng_axis_scene_case_68() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=320, height=200)
  let axes = figure.axes()
  axes.set_x_limits(1000000.0, 1000004.0)
  axes.set_y_limits(1000000.0, 1000004.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.x_axis()
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
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
  axes.set_x_limits(1000000.0, 1000100.0)
  assert_eq(
    f.format_ticks_view(
      @ticker.TickValues::from_array([2000005.0, 2000009.0, 2000013.0]),
    ),
    ["−4", "0", "4"],
  )
  assert_eq(f.get_offset(), "1 Hz+2.00001 MHz")
  ignore(axis)
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::NumpyFloat64(2000009.0)),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "%1.0f")
  assert_eq(f.as_scalar_formatter().get_use_offset(), true)
  assert_eq(f.locations().length(), 3)
  assert_eq(
    f.locations().get(0).reinterpret_as_uint64(),
    2000005.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(1).reinterpret_as_uint64(),
    2000009.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(2).reinterpret_as_uint64(),
    2000013.0.reinterpret_as_uint64(),
  )
}

///|
// Original source case 69: secondary original sync after parent mutation
fn eng_axis_scene_case_69() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=320, height=200)
  let axes = figure.axes()
  axes.set_x_limits(1000000.0, 1000004.0)
  axes.set_y_limits(1000000.0, 1000004.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.x_axis()
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
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
  axes.set_x_limits(1000000.0, 1000100.0)
  secondary.apply_aspect()
  assert_eq(
    f.format_ticks_view(
      @ticker.TickValues::from_array([2000005.0, 2000009.0, 2000013.0]),
    ),
    ["−100", "−96", "−92"],
  )
  assert_eq(f.get_offset(), "1 Hz+2.00011 MHz")
  ignore(axis)
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::NumpyFloat64(2000105.0)),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "%1.0f")
  assert_eq(f.as_scalar_formatter().get_use_offset(), true)
  assert_eq(f.locations().length(), 3)
  assert_eq(
    f.locations().get(0).reinterpret_as_uint64(),
    2000005.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(1).reinterpret_as_uint64(),
    2000009.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(2).reinterpret_as_uint64(),
    2000013.0.reinterpret_as_uint64(),
  )
}

///|
// Original source case 70: secondary actual own Bbox before synchronization
fn eng_axis_scene_case_70() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=320, height=200)
  let axes = figure.axes()
  axes.set_x_limits(1000000.0, 1000004.0)
  axes.set_y_limits(1000000.0, 1000004.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.y_axis()
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
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
    ["2 MHz", "2.00001 MHz", "2.00001 MHz"],
  )
  assert_eq(f.get_offset(), "")
  ignore(axis)
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "%1.0f")
  assert_eq(f.as_scalar_formatter().get_use_offset(), true)
  assert_eq(f.locations().length(), 3)
  assert_eq(
    f.locations().get(0).reinterpret_as_uint64(),
    2000005.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(1).reinterpret_as_uint64(),
    2000009.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(2).reinterpret_as_uint64(),
    2000013.0.reinterpret_as_uint64(),
  )
}

///|
// Original source case 71: secondary original set_lims synchronization
fn eng_axis_scene_case_71() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=320, height=200)
  let axes = figure.axes()
  axes.set_x_limits(1000000.0, 1000004.0)
  axes.set_y_limits(1000000.0, 1000004.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.y_axis()
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
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
    ["−4", "0", "4"],
  )
  assert_eq(f.get_offset(), "1 Hz+2.00001 MHz")
  ignore(axis)
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::NumpyFloat64(2000009.0)),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "%1.0f")
  assert_eq(f.as_scalar_formatter().get_use_offset(), true)
  assert_eq(f.locations().length(), 3)
  assert_eq(
    f.locations().get(0).reinterpret_as_uint64(),
    2000005.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(1).reinterpret_as_uint64(),
    2000009.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(2).reinterpret_as_uint64(),
    2000013.0.reinterpret_as_uint64(),
  )
}

///|
// Original source case 72: secondary parent mutation remains stale before sync
fn eng_axis_scene_case_72() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=320, height=200)
  let axes = figure.axes()
  axes.set_x_limits(1000000.0, 1000004.0)
  axes.set_y_limits(1000000.0, 1000004.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.y_axis()
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
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
  axes.set_y_limits(1000000.0, 1000100.0)
  assert_eq(
    f.format_ticks_view(
      @ticker.TickValues::from_array([2000005.0, 2000009.0, 2000013.0]),
    ),
    ["−4", "0", "4"],
  )
  assert_eq(f.get_offset(), "1 Hz+2.00001 MHz")
  ignore(axis)
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::NumpyFloat64(2000009.0)),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "%1.0f")
  assert_eq(f.as_scalar_formatter().get_use_offset(), true)
  assert_eq(f.locations().length(), 3)
  assert_eq(
    f.locations().get(0).reinterpret_as_uint64(),
    2000005.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(1).reinterpret_as_uint64(),
    2000009.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(2).reinterpret_as_uint64(),
    2000013.0.reinterpret_as_uint64(),
  )
}

///|
// Original source case 73: secondary original sync after parent mutation
fn eng_axis_scene_case_73() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=320, height=200)
  let axes = figure.axes()
  axes.set_x_limits(1000000.0, 1000004.0)
  axes.set_y_limits(1000000.0, 1000004.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.y_axis()
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
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
  axes.set_y_limits(1000000.0, 1000100.0)
  secondary.apply_aspect()
  assert_eq(
    f.format_ticks_view(
      @ticker.TickValues::from_array([2000005.0, 2000009.0, 2000013.0]),
    ),
    ["−100", "−96", "−92"],
  )
  assert_eq(f.get_offset(), "1 Hz+2.00011 MHz")
  ignore(axis)
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::NumpyFloat64(2000105.0)),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "%1.0f")
  assert_eq(f.as_scalar_formatter().get_use_offset(), true)
  assert_eq(f.locations().length(), 3)
  assert_eq(
    f.locations().get(0).reinterpret_as_uint64(),
    2000005.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(1).reinterpret_as_uint64(),
    2000009.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(2).reinterpret_as_uint64(),
    2000013.0.reinterpret_as_uint64(),
  )
}

///|
// Original source case 74: inherited cursor uses existing physical context and no engineering unit
fn eng_axis_scene_case_74() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let axis = @axis.axis()
  axis.set_limits(0.0, 1.0)
  axis.bind_formatter_geometry(() => (40.0, 1000.0))
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  axis.set_named_formatter(f.as_base_formatter())
  assert_eq(f.format_data_short(0.123456789), "0.123")
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "")
  assert_eq(f.as_scalar_formatter().get_use_offset(), true)
  assert_eq(f.locations().length(), 0)
}

///|
// Original source case 75: inherited cursor uses existing physical context and no engineering unit
fn eng_axis_scene_case_75() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let axis = @axis.axis()
  axis.set_limits(0.0, 1.0)
  axis.bind_formatter_geometry(() => (40.0, 1000.0))
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  axis.set_named_formatter(f.as_base_formatter())
  assert_eq(
    f.format_data_short_value(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_int(1000000)),
    ),
    "1000000",
  )
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "")
  assert_eq(f.as_scalar_formatter().get_use_offset(), true)
  assert_eq(f.locations().length(), 0)
}

///|
// Original source case 76: inherited cursor uses existing physical context and no engineering unit
fn eng_axis_scene_case_76() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let axis = @axis.axis()
  axis.set_limits(0.0, 1.0)
  axis.bind_formatter_geometry(() => (40.0, 1000.0))
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  axis.set_named_formatter(f.as_base_formatter())
  assert_eq(
    f.format_data_short_value(
      @ticker.ScalarNumber::NumpyInt64(9007199254740993L),
    ),
    "9007199254740993",
  )
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "")
  assert_eq(f.as_scalar_formatter().get_use_offset(), true)
  assert_eq(f.locations().length(), 0)
}

///|
// Original source case 77: inherited cursor uses existing physical context and no engineering unit
fn eng_axis_scene_case_77() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let axis = @axis.axis()
  axis.set_limits(0.0, 1.0)
  axis.bind_formatter_geometry(() => (40.0, 1000.0))
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  axis.set_named_formatter(f.as_base_formatter())
  assert_eq(f.format_data_short_masked(), "")
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "")
  assert_eq(f.as_scalar_formatter().get_use_offset(), true)
  assert_eq(f.locations().length(), 0)
}

///|
// Original source case 78: inherited cursor uses existing physical context and no engineering unit
fn eng_axis_scene_case_78() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let axis = @axis.axis()
  axis.set_limits(0.0, 1.0)
  axis.bind_formatter_geometry(() => (60.0, 800.0))
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  axis.set_named_formatter(f.as_base_formatter())
  assert_eq(f.format_data_short(0.123456789), "0.123")
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "")
  assert_eq(f.as_scalar_formatter().get_use_offset(), true)
  assert_eq(f.locations().length(), 0)
}

///|
// Original source case 79: inherited cursor uses existing physical context and no engineering unit
fn eng_axis_scene_case_79() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let axis = @axis.axis()
  axis.set_limits(0.0, 1.0)
  axis.bind_formatter_geometry(() => (60.0, 800.0))
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  axis.set_named_formatter(f.as_base_formatter())
  assert_eq(
    f.format_data_short_value(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_int(1000000)),
    ),
    "1000000",
  )
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "")
  assert_eq(f.as_scalar_formatter().get_use_offset(), true)
  assert_eq(f.locations().length(), 0)
}

///|
// Original source case 80: inherited cursor uses existing physical context and no engineering unit
fn eng_axis_scene_case_80() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let axis = @axis.axis()
  axis.set_limits(0.0, 1.0)
  axis.bind_formatter_geometry(() => (60.0, 800.0))
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  axis.set_named_formatter(f.as_base_formatter())
  assert_eq(
    f.format_data_short_value(
      @ticker.ScalarNumber::NumpyInt64(9007199254740993L),
    ),
    "9007199254740993",
  )
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "")
  assert_eq(f.as_scalar_formatter().get_use_offset(), true)
  assert_eq(f.locations().length(), 0)
}

///|
// Original source case 81: inherited cursor uses existing physical context and no engineering unit
fn eng_axis_scene_case_81() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let axis = @axis.axis()
  axis.set_limits(0.0, 1.0)
  axis.bind_formatter_geometry(() => (60.0, 800.0))
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  axis.set_named_formatter(f.as_base_formatter())
  assert_eq(f.format_data_short_masked(), "")
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "")
  assert_eq(f.as_scalar_formatter().get_use_offset(), true)
  assert_eq(f.locations().length(), 0)
}

///|
// Original source case 82: dummy inherited short fallback
fn eng_axis_scene_case_82() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(false)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  f.create_dummy_axis()
  assert_eq(f.format_data_short(0.123456789), "0.1235")
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "")
  assert_eq(f.as_scalar_formatter().get_use_offset(), false)
  assert_eq(f.locations().length(), 0)
}

///|
// Original source case 83: later locale override splits engineering data and numeric offset path
fn eng_axis_scene_case_83() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
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
  @config.set_numeric_locale(
    @config.NumericLocale::new(decimal_point=",", thousands_sep=".", grouping=[
      3, 0,
    ]),
  )
  f.as_scalar_formatter().set_use_locale(Some(true))
  f.set_locs_view(
    @ticker.TickValues::from_array([1000000.0, 1000002.0, 1000004.0]),
  )
  assert_eq(f.call(1000001.5), "−0")
  assert_eq(f.format_data(1234.5), "1.2345 kHz")
  assert_eq(f.format_data_short(1234.5), "1.234,5000")
  assert_eq(f.get_offset(), "1 Hz+1 MHz")
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::NumpyFloat64(1000002.0)),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "%1.0f")
  assert_eq(f.as_scalar_formatter().get_use_offset(), true)
  assert_eq(f.locations().length(), 3)
  assert_eq(
    f.locations().get(0).reinterpret_as_uint64(),
    1000000.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(1).reinterpret_as_uint64(),
    1000002.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(2).reinterpret_as_uint64(),
    1000004.0.reinterpret_as_uint64(),
  )
}

///|
// Original source case 84: call and offset fix_minus differ from direct format_data
fn eng_axis_scene_case_84() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(true)
  let f = @ticker.EngFormatter::new(
    unit="unit-hyphen-",
    use_offset=Some(@ticker.ScalarNumber::Boolean(false)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  f.set_places(Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_int(2))))
  assert_eq(f.call(-1.0), "−1.00 unit−hyphen−")
  assert_eq(f.format_data(-1.0), "-1.00 unit-hyphen-")
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "")
  assert_eq(f.as_scalar_formatter().get_use_offset(), false)
  assert_eq(f.locations().length(), 0)
}

///|
// Original source case 85: call and offset fix_minus differ from direct format_data
fn eng_axis_scene_case_85() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(false)
  let f = @ticker.EngFormatter::new(
    unit="unit-hyphen-",
    use_offset=Some(@ticker.ScalarNumber::Boolean(false)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  f.set_places(Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_int(2))))
  assert_eq(f.call(-1.0), "-1.00 unit-hyphen-")
  assert_eq(f.format_data(-1.0), "-1.00 unit-hyphen-")
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "")
  assert_eq(f.as_scalar_formatter().get_use_offset(), false)
  assert_eq(f.locations().length(), 0)
}

///|
// Original source case 106: actual secondary inverse transform mutates unit before final engineering offset
fn eng_axis_scene_case_106() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(false)
  let figure = @scene.figure(width=320, height=200)
  let axes = figure.axes()
  axes.set_x_limits(1000000.0, 1000004.0)
  axes.set_y_limits(1000000.0, 1000004.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.x_axis()
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let secondary = axes.secondary_xaxis(value => value * 2.0 + 5.0, value => {
    f.set_unit("after")
    (value - 5.0) / 2.0
  })
  secondary.set_locator(
    @ticker.FixedLocator::new([2000005.0, 2000009.0, 2000013.0]).as_locator(),
  )
  secondary.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  secondary.set_named_formatter(f.as_base_formatter())
  secondary.apply_aspect()
  f.set_unit("Hz")
  let svg = figure.to_svg_checked()
  assert_eq(svg.split(">1 after+2.00001 Mafter<").count() - 1, 1)
  assert_eq(f.get_offset(), "1 after+2.00001 Mafter")
  assert_eq(f.unit(), "after")
  ignore(axis)
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::NumpyFloat64(2000009.0)),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "%1.0f")
  assert_eq(f.as_scalar_formatter().get_use_offset(), true)
  assert_eq(f.locations().length(), 3)
  assert_eq(
    f.locations().get(0).reinterpret_as_uint64(),
    2000005.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(1).reinterpret_as_uint64(),
    2000009.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(2).reinterpret_as_uint64(),
    2000013.0.reinterpret_as_uint64(),
  )
}

///|
// Original source case 107: actual secondary inverse transform mutates unit before final engineering offset
fn eng_axis_scene_case_107() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_prefixes = @ticker.EngFormatter::class_prefixes()
  defer @ticker.EngFormatter::set_class_prefixes(saved_prefixes)
  @ticker.EngFormatter::set_class_prefixes(@ticker.EngPrefixes::si())
  let saved_locale = @config.numeric_locale()
  defer @config.set_numeric_locale(saved_locale)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let saved_threshold = @config.formatter_offset_threshold()
  defer @config.set_formatter_offset_threshold(saved_threshold)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_unicode_minus(false)
  let figure = @scene.figure(width=320, height=200)
  let axes = figure.axes()
  axes.set_x_limits(1000000.0, 1000004.0)
  axes.set_y_limits(1000000.0, 1000004.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.y_axis()
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  f
  .as_scalar_formatter()
  .set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(-5),
      @bigint.BigInt::from_int(6),
    ]),
  )
  let secondary = axes.secondary_yaxis(value => value * 2.0 + 5.0, value => {
    f.set_unit("after")
    (value - 5.0) / 2.0
  })
  secondary.set_locator(
    @ticker.FixedLocator::new([2000005.0, 2000009.0, 2000013.0]).as_locator(),
  )
  secondary.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  secondary.set_named_formatter(f.as_base_formatter())
  secondary.apply_aspect()
  f.set_unit("Hz")
  let svg = figure.to_svg_checked()
  assert_eq(svg.split(">1 after+2.00001 Mafter<").count() - 1, 1)
  assert_eq(f.get_offset(), "1 after+2.00001 Mafter")
  assert_eq(f.unit(), "after")
  ignore(axis)
  assert_eq(
    f.as_scalar_formatter().offset(),
    Some(@ticker.ScalarNumber::NumpyFloat64(2000009.0)),
  )
  assert_eq(
    f.as_scalar_formatter().order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(f.as_scalar_formatter().format_pattern(), "%1.0f")
  assert_eq(f.as_scalar_formatter().get_use_offset(), true)
  assert_eq(f.locations().length(), 3)
  assert_eq(
    f.locations().get(0).reinterpret_as_uint64(),
    2000005.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(1).reinterpret_as_uint64(),
    2000009.0.reinterpret_as_uint64(),
  )
  assert_eq(
    f.locations().get(2).reinterpret_as_uint64(),
    2000013.0.reinterpret_as_uint64(),
  )
}

///|
test "Eng original scene axis cases 0..31" {
  eng_axis_scene_case_0() catch {
    error => fail("Eng original axis case 0 failed: " + error.to_string())
  }
  eng_axis_scene_case_1() catch {
    error => fail("Eng original axis case 1 failed: " + error.to_string())
  }
  eng_axis_scene_case_2() catch {
    error => fail("Eng original axis case 2 failed: " + error.to_string())
  }
  eng_axis_scene_case_3() catch {
    error => fail("Eng original axis case 3 failed: " + error.to_string())
  }
  eng_axis_scene_case_4() catch {
    error => fail("Eng original axis case 4 failed: " + error.to_string())
  }
  eng_axis_scene_case_5() catch {
    error => fail("Eng original axis case 5 failed: " + error.to_string())
  }
  eng_axis_scene_case_6() catch {
    error => fail("Eng original axis case 6 failed: " + error.to_string())
  }
  eng_axis_scene_case_7() catch {
    error => fail("Eng original axis case 7 failed: " + error.to_string())
  }
  eng_axis_scene_case_8() catch {
    error => fail("Eng original axis case 8 failed: " + error.to_string())
  }
  eng_axis_scene_case_9() catch {
    error => fail("Eng original axis case 9 failed: " + error.to_string())
  }
  eng_axis_scene_case_10() catch {
    error => fail("Eng original axis case 10 failed: " + error.to_string())
  }
  eng_axis_scene_case_11() catch {
    error => fail("Eng original axis case 11 failed: " + error.to_string())
  }
  eng_axis_scene_case_12() catch {
    error => fail("Eng original axis case 12 failed: " + error.to_string())
  }
  eng_axis_scene_case_13() catch {
    error => fail("Eng original axis case 13 failed: " + error.to_string())
  }
  eng_axis_scene_case_14() catch {
    error => fail("Eng original axis case 14 failed: " + error.to_string())
  }
  eng_axis_scene_case_15() catch {
    error => fail("Eng original axis case 15 failed: " + error.to_string())
  }
  eng_axis_scene_case_16() catch {
    error => fail("Eng original axis case 16 failed: " + error.to_string())
  }
  eng_axis_scene_case_17() catch {
    error => fail("Eng original axis case 17 failed: " + error.to_string())
  }
  eng_axis_scene_case_18() catch {
    error => fail("Eng original axis case 18 failed: " + error.to_string())
  }
  eng_axis_scene_case_19() catch {
    error => fail("Eng original axis case 19 failed: " + error.to_string())
  }
  eng_axis_scene_case_20() catch {
    error => fail("Eng original axis case 20 failed: " + error.to_string())
  }
  eng_axis_scene_case_21() catch {
    error => fail("Eng original axis case 21 failed: " + error.to_string())
  }
  eng_axis_scene_case_22() catch {
    error => fail("Eng original axis case 22 failed: " + error.to_string())
  }
  eng_axis_scene_case_23() catch {
    error => fail("Eng original axis case 23 failed: " + error.to_string())
  }
  eng_axis_scene_case_24() catch {
    error => fail("Eng original axis case 24 failed: " + error.to_string())
  }
  eng_axis_scene_case_25() catch {
    error => fail("Eng original axis case 25 failed: " + error.to_string())
  }
  eng_axis_scene_case_26() catch {
    error => fail("Eng original axis case 26 failed: " + error.to_string())
  }
  eng_axis_scene_case_27() catch {
    error => fail("Eng original axis case 27 failed: " + error.to_string())
  }
  eng_axis_scene_case_28() catch {
    error => fail("Eng original axis case 28 failed: " + error.to_string())
  }
  eng_axis_scene_case_29() catch {
    error => fail("Eng original axis case 29 failed: " + error.to_string())
  }
  eng_axis_scene_case_30() catch {
    error => fail("Eng original axis case 30 failed: " + error.to_string())
  }
  eng_axis_scene_case_31() catch {
    error => fail("Eng original axis case 31 failed: " + error.to_string())
  }
}

///|
test "Eng original scene axis cases 32..63" {
  eng_axis_scene_case_32() catch {
    error => fail("Eng original axis case 32 failed: " + error.to_string())
  }
  eng_axis_scene_case_33() catch {
    error => fail("Eng original axis case 33 failed: " + error.to_string())
  }
  eng_axis_scene_case_34() catch {
    error => fail("Eng original axis case 34 failed: " + error.to_string())
  }
  eng_axis_scene_case_35() catch {
    error => fail("Eng original axis case 35 failed: " + error.to_string())
  }
  eng_axis_scene_case_36() catch {
    error => fail("Eng original axis case 36 failed: " + error.to_string())
  }
  eng_axis_scene_case_37() catch {
    error => fail("Eng original axis case 37 failed: " + error.to_string())
  }
  eng_axis_scene_case_38() catch {
    error => fail("Eng original axis case 38 failed: " + error.to_string())
  }
  eng_axis_scene_case_39() catch {
    error => fail("Eng original axis case 39 failed: " + error.to_string())
  }
  eng_axis_scene_case_40() catch {
    error => fail("Eng original axis case 40 failed: " + error.to_string())
  }
  eng_axis_scene_case_41() catch {
    error => fail("Eng original axis case 41 failed: " + error.to_string())
  }
  eng_axis_scene_case_42() catch {
    error => fail("Eng original axis case 42 failed: " + error.to_string())
  }
  eng_axis_scene_case_43() catch {
    error => fail("Eng original axis case 43 failed: " + error.to_string())
  }
  eng_axis_scene_case_44() catch {
    error => fail("Eng original axis case 44 failed: " + error.to_string())
  }
  eng_axis_scene_case_45() catch {
    error => fail("Eng original axis case 45 failed: " + error.to_string())
  }
  eng_axis_scene_case_46() catch {
    error => fail("Eng original axis case 46 failed: " + error.to_string())
  }
  eng_axis_scene_case_47() catch {
    error => fail("Eng original axis case 47 failed: " + error.to_string())
  }
  eng_axis_scene_case_48() catch {
    error => fail("Eng original axis case 48 failed: " + error.to_string())
  }
  eng_axis_scene_case_49() catch {
    error => fail("Eng original axis case 49 failed: " + error.to_string())
  }
  eng_axis_scene_case_50() catch {
    error => fail("Eng original axis case 50 failed: " + error.to_string())
  }
  eng_axis_scene_case_51() catch {
    error => fail("Eng original axis case 51 failed: " + error.to_string())
  }
  eng_axis_scene_case_52() catch {
    error => fail("Eng original axis case 52 failed: " + error.to_string())
  }
  eng_axis_scene_case_53() catch {
    error => fail("Eng original axis case 53 failed: " + error.to_string())
  }
  eng_axis_scene_case_54() catch {
    error => fail("Eng original axis case 54 failed: " + error.to_string())
  }
  eng_axis_scene_case_55() catch {
    error => fail("Eng original axis case 55 failed: " + error.to_string())
  }
  eng_axis_scene_case_56() catch {
    error => fail("Eng original axis case 56 failed: " + error.to_string())
  }
  eng_axis_scene_case_57() catch {
    error => fail("Eng original axis case 57 failed: " + error.to_string())
  }
  eng_axis_scene_case_58() catch {
    error => fail("Eng original axis case 58 failed: " + error.to_string())
  }
  eng_axis_scene_case_59() catch {
    error => fail("Eng original axis case 59 failed: " + error.to_string())
  }
  eng_axis_scene_case_60() catch {
    error => fail("Eng original axis case 60 failed: " + error.to_string())
  }
  eng_axis_scene_case_61() catch {
    error => fail("Eng original axis case 61 failed: " + error.to_string())
  }
  eng_axis_scene_case_62() catch {
    error => fail("Eng original axis case 62 failed: " + error.to_string())
  }
  eng_axis_scene_case_63() catch {
    error => fail("Eng original axis case 63 failed: " + error.to_string())
  }
}

///|
test "Eng original scene axis cases 64..107" {
  eng_axis_scene_case_64() catch {
    error => fail("Eng original axis case 64 failed: " + error.to_string())
  }
  eng_axis_scene_case_65() catch {
    error => fail("Eng original axis case 65 failed: " + error.to_string())
  }
  eng_axis_scene_case_66() catch {
    error => fail("Eng original axis case 66 failed: " + error.to_string())
  }
  eng_axis_scene_case_67() catch {
    error => fail("Eng original axis case 67 failed: " + error.to_string())
  }
  eng_axis_scene_case_68() catch {
    error => fail("Eng original axis case 68 failed: " + error.to_string())
  }
  eng_axis_scene_case_69() catch {
    error => fail("Eng original axis case 69 failed: " + error.to_string())
  }
  eng_axis_scene_case_70() catch {
    error => fail("Eng original axis case 70 failed: " + error.to_string())
  }
  eng_axis_scene_case_71() catch {
    error => fail("Eng original axis case 71 failed: " + error.to_string())
  }
  eng_axis_scene_case_72() catch {
    error => fail("Eng original axis case 72 failed: " + error.to_string())
  }
  eng_axis_scene_case_73() catch {
    error => fail("Eng original axis case 73 failed: " + error.to_string())
  }
  eng_axis_scene_case_74() catch {
    error => fail("Eng original axis case 74 failed: " + error.to_string())
  }
  eng_axis_scene_case_75() catch {
    error => fail("Eng original axis case 75 failed: " + error.to_string())
  }
  eng_axis_scene_case_76() catch {
    error => fail("Eng original axis case 76 failed: " + error.to_string())
  }
  eng_axis_scene_case_77() catch {
    error => fail("Eng original axis case 77 failed: " + error.to_string())
  }
  eng_axis_scene_case_78() catch {
    error => fail("Eng original axis case 78 failed: " + error.to_string())
  }
  eng_axis_scene_case_79() catch {
    error => fail("Eng original axis case 79 failed: " + error.to_string())
  }
  eng_axis_scene_case_80() catch {
    error => fail("Eng original axis case 80 failed: " + error.to_string())
  }
  eng_axis_scene_case_81() catch {
    error => fail("Eng original axis case 81 failed: " + error.to_string())
  }
  eng_axis_scene_case_82() catch {
    error => fail("Eng original axis case 82 failed: " + error.to_string())
  }
  eng_axis_scene_case_83() catch {
    error => fail("Eng original axis case 83 failed: " + error.to_string())
  }
  eng_axis_scene_case_84() catch {
    error => fail("Eng original axis case 84 failed: " + error.to_string())
  }
  eng_axis_scene_case_85() catch {
    error => fail("Eng original axis case 85 failed: " + error.to_string())
  }
  eng_axis_scene_case_106() catch {
    error => fail("Eng original axis case 106 failed: " + error.to_string())
  }
  eng_axis_scene_case_107() catch {
    error => fail("Eng original axis case 107 failed: " + error.to_string())
  }
}
