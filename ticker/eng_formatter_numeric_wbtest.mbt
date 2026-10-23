///|
test "engineering fixed output address limit is a library resource boundary" {
  let formatter = EngFormatter::new(
    places=Some(ScalarNumber::Integer(@bigint.BigInt::from_int(2147483647))),
    usetex=Some(false),
    use_math_text=Some(false),
  )
  formatter.set_prefixes(EngPrefixes::si())
  let error = try {
    ignore(formatter.format_data(1.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  // The minimum fixed result has one leading digit, decimal point and this
  // many places. Its UTF-16 size exceeds Int32 before any padding allocation.
  assert_eq(
    error, "ResourceError: formatted text exceeds String addressability",
  )
}

///|
test "engineering auto offset propagates proven inherited nontermination boundary" {
  let formatter = EngFormatter::new(
    use_offset=Some(ScalarNumber::Boolean(true)),
    usetex=Some(false),
    use_math_text=Some(false),
  )
  let axis = FormatterAxisBinding::new()
  axis.set_view_interval(
    FormatterViewInterval::Integers([
      @bigint.BigInt::from_string("9007199254740992"),
      @bigint.BigInt::from_string("9007199254740993"),
    ]),
  )
  formatter.set_axis(Some(axis))
  let error = try {
    formatter.set_locs_view(
      TickValues::from_int64_array([9007199254740992L, 9007199254740993L]),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    error, "Unsupported: unequal integer extrema collapse to one float; upstream offset search does not terminate",
  )
  assert_eq(formatter.locations().length(), 2)
  assert_eq(formatter.as_scalar_formatter().format_pattern(), "")
}
