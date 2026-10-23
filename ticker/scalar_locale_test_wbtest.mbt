///|
test "locale final tuple budget follows completed intermediate scalar formatting" {
  let saved = @config.numeric_locale()
  defer @config.set_numeric_locale(saved)
  @config.set_numeric_locale(
    @config.NumericLocale::new(thousands_sep=",", grouping=[3, 0]),
  )
  // Native grouping has negative separator count for inf/nan and removes all
  // the ASCII padding. The 1000-character intermediate is not a 3-unit output.
  assert_eq(
    scalar_locale_format_string("%1000g", ScalarNumber::Number(1.0 / 0.0), 3L),
    "inf",
  )
}

///|
test "locale final tuple checks actual remaining units before string padding" {
  let saved = @config.numeric_locale()
  defer @config.set_numeric_locale(saved)
  @config.set_numeric_locale(@config.NumericLocale::new())
  let error = try {
    ignore(
      scalar_locale_format_string("pre%20f", ScalarNumber::Number(1.0), 8L),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "ResourceError: locale result exceeds String addressability")
}

///|
test "locale unmatched ascii conversion budgets padding before later missing arguments" {
  // This port resource boundary is separate from source observations; a giant
  // valid native intermediate is deliberately not allocated in the oracle.
  let error = try {
    ignore(scalar_locale_string_tuple("p%2147483647a%s", ["🐍"], 2147483647L))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "ResourceError: locale result exceeds String addressability")
}

///|
test "locale math comma escape checks its own final address units" {
  let saved = @config.numeric_locale()
  defer @config.set_numeric_locale(saved)
  @config.set_numeric_locale(
    @config.NumericLocale::new(thousands_sep=",", grouping=[3, 0]),
  )
  let number = ScalarNumber::Integer(@bigint.BigInt::from_int(1234))
  assert_eq(
    scalar_named_format("%d", number, true, true, available=7L),
    "1{,}234",
  )
  let error = try {
    ignore(scalar_named_format("%d", number, true, true, available=6L))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    error, "ResourceError: locale math text exceeds String addressability",
  )
}
