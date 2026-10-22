///|
fn[A] parser_with_test_tz(spec : String, run : () -> A raise) -> A raise {
  let old = @env.get_env_var("TZ")
  @env.set_env_var("TZ", spec)
  let restore = () => {
    match old {
      Some(value) => @env.set_env_var("TZ", value)
      None => @env.unset_env_var("TZ")
    }
  }
  errdefer restore()
  let result = run()
  restore()
  result
}

///|
test "host parser loads an explicit timezone file on each runtime" {
  parser_with_test_tz(
    ":" + @env.current_dir().unwrap() + "/testdata/tzif/new_york.tzif",
    () => {
      let context = DateParserContext::system(clock=fn() { 1781524800000L })
      let parser = DateStringParser::new(context~)
      assert_eq(parser.local_names(), ["EST", "EDT"])
      assert_eq(parser.local_offsets(), (-18000, -14400))
      assert_eq(parser.parse("2024-11-03 01:30 EST").offset_seconds(), -18000)
      assert_eq(parser.parse("2024-11-03 01:30 EDT").offset_seconds(), -14400)
    },
  )
}

///|
test "host parser honors POSIX and unavailable host rules require explicit context" {
  parser_with_test_tz("XST-0:09:21", () => {
    let parser = DateStringParser::new(
      context=DateParserContext::system(clock=fn() { 1781524800000L }),
    )
    assert_eq(parser.local_offsets(), (561, 561))
    assert_eq(parser.parse("2024-01-01 10:00 XST").offset_seconds(), 561)
  })
  parser_with_test_tz("/not/a/real/timezone/file", () => {
    assert_true(
      try {
        ignore(DateParserContext::system())
        false
      } catch {
        _ => true
      },
    )
    let parser = DateStringParser::new(
      context=DateParserContext::utc(clock=fn() { 1781524800000L }),
    )
    assert_eq(parser.parse("2024-01-01").year(), 2024)
  })
}

///|
test "free string helper exposes copied default diagnostics without initializing on empty input" {
  parser_with_test_tz("/not/a/real/timezone/file", () => {
    assert_eq(datestrs2num([]), [])
    assert_eq(date_parse_warnings(), [])
  })
  parser_with_test_tz("UTC0", () => {
    ignore(datestr2num("2024-01-01 10:00 QQQQQ"))
    assert_eq(date_parse_warnings(), [UnknownTimezone("QQQQQ")])
    let messages = date_parse_warnings()
    messages.clear()
    assert_eq(date_parse_warnings(), [UnknownTimezone("QQQQQ")])
    assert_eq(datestrs2num([]), [])
    assert_eq(date_parse_warnings(), [UnknownTimezone("QQQQQ")])
    ignore(datestr2num("2024-01-01 10:00 UTC"))
    assert_eq(date_parse_warnings(), [])
  })
}
