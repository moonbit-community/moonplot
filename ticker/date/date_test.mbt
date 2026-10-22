///|
test "date values use the Matplotlib epoch" {
  let epoch = try! @date.datetime(1970, 1, 1)
  assert_eq(epoch.to_ordinal(), 0.0)
  let noon = try! @date.datetime(1970, 1, 1, hour=12)
  assert_eq(noon.to_ordinal(), 0.5)
  let leap = try! @date.datetime(2000, 2, 29, hour=6)
  let round_trip = try! @date.from_ordinal(leap.to_ordinal())
  assert_eq(round_trip.year(), 2000)
  assert_eq(round_trip.month(), 2)
  assert_eq(round_trip.day(), 29)
  assert_eq(round_trip.hour(), 6)
}

///|
test "date parser and formatter support ISO values" {
  let value = try! @date.parse_iso("2024-02-29T03:04:05")
  assert_eq(value.year(), 2024)
  assert_eq(
    @date.format_date(value, "%Y-%m-%d %H:%M:%S"),
    "2024-02-29 03:04:05",
  )
  assert_eq(@date.format_date(value, "%b %d"), "Feb 29")
}

///|
test "date weekdays and weekday format directives follow Python conventions" {
  let epoch = try! @date.datetime(1970, 1, 1)
  assert_eq(epoch.weekday(), 3)
  assert_eq(@date.format_date(epoch, "%a"), "Thu")
  assert_eq(@date.format_date(epoch, "%A"), "Thursday")
  assert_eq(@date.format_date(epoch, "%w"), "4")
}
