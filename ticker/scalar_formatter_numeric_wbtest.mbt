///|
test "scalar offset explicitly rejects proven upstream nontermination" {
  let formatter = ScalarFormatter::new(
    use_offset=Some(ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
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
  assert_eq(formatter.format_pattern(), "")
}

///|
test "scalar exact decimal power structural address limit is explicit" {
  let error = try {
    ignore(scalar_math_integer_power10(@bigint.BigInt::from_int(715827883)))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    error, "ResourceError: decimal power exceeds BigInt bit addressability",
  )
}
