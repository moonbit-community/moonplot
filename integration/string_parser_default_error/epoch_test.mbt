///|
test "explicit default string batch encodes each element and locks epoch before a later error" {
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock=fn() { 1781524800000L }),
  )
  assert_true(
    try {
      ignore(
        parser.to_numbers(
          ["2024-01-01", "invalid"],
          default_date=@date.datetime(2000, 1, 1),
        ),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      @date.set_epoch("2000-01-01T00:00:00")
      false
    } catch {
      _ => true
    },
  )
  assert_eq(@date.get_epoch(), "1970-01-01T00:00:00")
}
