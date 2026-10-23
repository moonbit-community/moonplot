// Independent dispatch regressions from the complete pinned EngFormatter.
// Source observations: testdata/eng_dispatch_reference.json.

///|
test "engineering live Scalar and Base views preserve derived data and whole minus stages" {
  let previous_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(previous_minus)
  @config.set_unicode_minus(true)
  let engineering = @ticker.EngFormatter::new(
    unit="unit-hyphen-",
    places=Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_int(2))),
    usetex=Some(false),
    use_math_text=Some(false),
  )
  let base = engineering.as_base_formatter()
  let scalar = base.scalar_formatter().unwrap()
  assert_true(physical_equal(base, scalar.as_base_formatter()))
  assert_true(
    physical_equal(base, base.eng_formatter().unwrap().as_base_formatter()),
  )
  assert_eq(base.call(-1234.5), "−1.23 kunit−hyphen−")
  assert_eq(
    scalar.call_value(@ticker.ScalarNumber::Number(-1234.5)),
    "−1.23 kunit−hyphen−",
  )
  assert_eq(base.format_data(-1234.5), "-1.23 kunit-hyphen-")
  assert_eq(
    scalar.format_data_value(@ticker.ScalarNumber::Number(-1234.5)),
    "-1.23 kunit-hyphen-",
  )
  assert_eq(
    scalar.format_data_short_value(
      @ticker.ScalarNumber::NumpyInt64(9007199254740993L),
    ),
    "9007199254740993",
  )
  engineering.set_unit("Hz")
  assert_eq(base.call(-1234.5), "−1.23 kHz")
}

///|
test "engineering Base batch retains NumPy integer negation before inherited Scalar view consumption" {
  let previous_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(previous_minus)
  @config.set_unicode_minus(true)
  let engineering = @ticker.EngFormatter::new(
    unit="Hz",
    usetex=Some(false),
    use_math_text=Some(false),
  )
  let axis = @ticker.FormatterAxisBinding::new()
  axis.set_view_interval(
    @ticker.FormatterViewInterval::Sequence([0.0, 10000.0]),
  )
  engineering.set_axis(Some(axis))
  let base = engineering.as_base_formatter()
  assert_eq(base.format_ticks([-9223372036854775808.0]), ["−9.22337 EHz"])
  let view = @ticker.TickValues::from_int64_array([-9223372036854775808L])
  let error = try {
    ignore(base.format_ticks_view(view))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "ValueError: math domain error")
  match base.locations() {
    NdArray(retained) => assert_true(physical_equal(retained, view))
    _ => fail("expected original integer view after failure")
  }
}

///|
test "engineering cached Scalar branch defers bad places until direct data or late offset" {
  let previous_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(previous_minus)
  @config.set_unicode_minus(true)
  let engineering = @ticker.EngFormatter::new(
    unit="unit-hyphen-",
    places=Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_int(2))),
    usetex=Some(false),
    use_math_text=Some(false),
  )
  let base = engineering.as_base_formatter()
  let scalar = engineering.as_scalar_formatter()
  let axis = @ticker.FormatterAxisBinding::new()
  axis.set_view_interval(
    @ticker.FormatterViewInterval::Sequence([0.0, 10000.0]),
  )
  base.set_axis(Some(axis))
  scalar.set_use_offset(
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_int(1000000))),
  )
  base.set_locs_checked([1000000.0, 1000002.0, 1000004.0])
  assert_eq(base.call(1000002.0), "0.002")
  assert_eq(
    base.get_offset_checked(),
    "1.00 kunit−hyphen−+1.00 Munit−hyphen−",
  )
  engineering.set_places(Some(@ticker.ScalarNumber::Number(2.0)))
  assert_eq(scalar.call_value(@ticker.ScalarNumber::Number(1000002.0)), "0.002")
  let error = try {
    ignore(base.format_data(1000002.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    error, "ValueError: Unknown format code 'd' for object of type 'float'",
  )
  base.set_locs_checked([])
  assert_eq(base.get_offset_checked(), "")
}
