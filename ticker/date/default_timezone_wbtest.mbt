///|
test "dateutil calendar rules normalize numeric clocks and month separators" {
  assert_eq(
    normalize_dateutil_rules(",M3-2-0/0230,M11-1-0/02:00:30"),
    ",M3.2.0/2:30:0,M11.1.0/2:0:30",
  )
  let zone = dateutil_posix_timezone("XST5XDT,M3-2-0/0230,M11-1-0/02:00:30") catch {
    DateError::InvalidDate(message~) => fail(message)
    _ => fail("unexpected timezone error")
  }
  assert_eq(zone.initial_offset_seconds(), -18000)
}
