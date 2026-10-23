///|
test "Scalar percent reserves the literal UTF16 prefix before allocating width" {
  assert_true(
    try {
      ignore(
        scalar_percent_format("😀%2147483646s", ScalarNumber::Boolean(true)),
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
test "Scalar percent applies the native integer decimal digit limit before text allocation" {
  let integer = @bigint.BigInt::from_int(10).pow(@bigint.BigInt::from_int(4300))
  for format in ["%d", "%s", "%r", "%a"] {
    assert_true(
      try {
        ignore(scalar_percent_format(format, ScalarNumber::Integer(integer)))
        false
      } catch {
        @core.DataError::InvalidTicks(message~) =>
          message ==
          "ValueError: Exceeds the limit (4300 digits) for integer string conversion; use sys.set_int_max_str_digits() to increase the limit"
        _ => false
      },
    )
  }
}
