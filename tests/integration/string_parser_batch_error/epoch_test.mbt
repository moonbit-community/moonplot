///|
test "no default string batches finish parsing and aware UTC conversion before locking epoch" {
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock=fn() { 1781524800000L }),
  )
  assert_true(
    try {
      ignore(parser.to_numbers(["2024-01-01", "invalid"]))
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        parser.to_numbers(["2024-01-01 12:00 UTC", "0001-01-01 00:00 +2300"]),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(parser.to_number("9999-12-31 23:30 -2300"))
      false
    } catch {
      _ => true
    },
  )
  @date.set_epoch("2000-01-01T00:00:00")
  assert_eq(parser.to_number("2000-01-01"), 0.0)
}
