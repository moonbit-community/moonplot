///|
test "named scalar base adapters share raw state while copies keep every cached slot independent" {
  let formatter = @ticker.ScalarFormatter::new(use_math_text=Some(false))
  let base = formatter.as_base_formatter()
  let retained = base.scalar_formatter().unwrap()
  assert_true(physical_equal(base, retained.as_base_formatter()))
  retained.set_offset(Some(@ticker.ScalarNumber::NumpyInt64(9007199254740993L)))
  retained.set_order_of_magnitude(@ticker.ScalarNumber::Number(2.5))
  retained.set_format_pattern("%r")
  retained.set_usetex(Some(true))
  retained.set_use_math_text(Some(true))
  retained.set_use_locale(Some(true))
  retained.set_scientific(false)
  let copied = base.copy().scalar_formatter().unwrap()
  copied.set_offset(None)
  copied.set_order_of_magnitude(
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_int(0)),
  )
  copied.set_format_pattern("copy")
  copied.set_usetex(Some(false))
  copied.set_use_math_text(Some(false))
  copied.set_use_locale(Some(false))
  copied.set_scientific(true)
  assert_eq(
    formatter.offset(),
    Some(@ticker.ScalarNumber::NumpyInt64(9007199254740993L)),
  )
  assert_eq(formatter.order_of_magnitude(), @ticker.ScalarNumber::Number(2.5))
  assert_eq(formatter.format_pattern(), "%r")
  assert_true(formatter.get_usetex())
  assert_true(formatter.get_use_math_text())
  assert_true(formatter.get_use_locale())
  assert_true(!formatter.scientific())
  assert_true(!physical_equal(base, copied.as_base_formatter()))
}

///|
test "checked scalar preparation stores original locations before the unbound axis failure" {
  let formatter = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
  )
  let locations = [1.0, 2.0]
  let error = try {
    formatter.as_base_formatter().set_locs_checked(locations)
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    error, "AttributeError: 'NoneType' object has no attribute 'get_view_interval'",
  )
  match formatter.locations() {
    Sequence(retained) => assert_true(physical_equal(retained, locations))
    _ => fail("expected original list")
  }
  locations.push(3.0)
  assert_eq(formatter.locations().length(), 3)
}

///|
test "scalar raw format consumes deadzone Python integer and masked short data ignores context" {
  let formatter = @ticker.ScalarFormatter::new(
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  assert_eq(formatter.format_data_short_masked(), "")
  formatter.create_dummy_axis()
  formatter.set_use_offset(Some(@ticker.ScalarNumber::Boolean(false)))
  formatter.set_locs([1.0, 2.0])
  formatter.set_format_pattern("%r")
  assert_eq(formatter.call(1.0e-9), "0")
  formatter.set_format_pattern("%x")
  assert_eq(
    formatter.call_value(@ticker.ScalarNumber::NumpyFloat64(1.0e-9)),
    "0",
  )
  formatter.set_axis(None)
  formatter.set_offset(None)
  formatter.set_format_pattern("%")
  assert_eq(formatter.format_data_short_masked(), "")
}

///|
test "scalar checked offset preserves late errors after a live empty list becomes nonempty" {
  let formatter = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Number(1.0 / 0.0)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  let locations : Array[Double] = []
  formatter.set_locs(locations)
  assert_eq(formatter.as_base_formatter().get_offset_checked(), "")
  locations.push(1.0)
  let error = try {
    ignore(formatter.as_base_formatter().get_offset_checked())
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "OverflowError: cannot convert float infinity to integer")
}
