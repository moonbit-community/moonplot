///|
test "percent width addressability is a separate resource boundary after scalar conversion" {
  assert_true(
    try {
      ignore(
        format_percent_checked(
          "%9223372036854775807c",
          NamedFormatValue::NumpyInt64(128512L),
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message.has_prefix("ResourceError:")
      _ => false
    },
  )
  assert_true(
    try {
      ignore(format_percent_checked("%2147483648x", PythonFloat(1.0)))
      false
    } catch {
      @core.DataError::InvalidTicks(
        message="TypeError: %x format: an integer is required, not float"
      ) => true
      _ => false
    },
  )
}

///|
test "percent integer precision cannot overflow the String size with a radix prefix" {
  assert_true(
    try {
      ignore(
        format_percent_checked(
          "%#.2147483647x",
          NamedFormatValue::NumpyInt64(-1L),
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message.has_prefix("ResourceError:")
      _ => false
    },
  )
}

///|
test "percent positive plus sign is included before integer precision allocation" {
  assert_true(
    try {
      ignore(format_percent_checked("%+.2147483647d", PythonFloat(1.0)))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message.has_prefix("ResourceError:")
      _ => false
    },
  )
}

///|
test "percent positive space sign is included before integer precision allocation" {
  assert_true(
    try {
      ignore(format_percent_checked("% .2147483647d", PythonFloat(1.0)))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message.has_prefix("ResourceError:")
      _ => false
    },
  )
}

///|
test "percent prior literal is included before integer precision allocation" {
  assert_true(
    try {
      ignore(format_percent_checked("a%.2147483647d", PythonFloat(1.0)))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message.has_prefix("ResourceError:")
      _ => false
    },
  )
}

///|
test "FormatStr live Base dispatch retains exact Int64 view input above Double precision" {
  let formatter = FormatStrFormatter::new("%d").as_base_formatter()
  assert_eq(formatter.call(9007199254740992.0), "9007199254740992")
  assert_eq(
    formatter.format_ticks_view(
      TickValues::from_int64_array([9007199254740993L]),
    ),
    ["9007199254740993"],
  )
  assert_eq(formatter.format_data_short(-0.5), "0")
}

///|
test "FormatStr keeps literal and numeric ASCII hyphens under Unicode-minus defaults" {
  let previous = @config.unicode_minus()
  defer @config.set_unicode_minus(previous)
  @config.set_unicode_minus(true)
  let formatter = FormatStrFormatter::new("a-b %s")
  assert_eq(formatter.call(-0.0), "a-b -0.0")
  formatter.set_fmt("%+.1f")
  assert_eq(formatter.format_data(-1.25), "-1.2")
}
