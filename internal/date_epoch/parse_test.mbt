///|
test "UTC epoch syntax retains source and exact seconds through microseconds" {
  let cases : Array[(String, Int64, Int32)] = [
    ("1970", 0L, 0),
    ("1970-01", 0L, 0),
    ("1970-01-01", 0L, 0),
    ("1970-01-01T01", 3600L, 0),
    ("1970-01-01 01:02", 3720L, 0),
    ("1970-01-01T01:02:03.123456", 3723L, 123456),
    ("1969-12-31T23:59:59.1", -1L, 100000),
    ("0000-12-31", -62135683200L, 0),
    ("-0001-12-31", -62167305600L, 0),
    ("+10000-01-01", 253402300800L, 0),
  ]
  for entry in cases {
    let (source, seconds, microsecond) = entry
    let parsed = @date_epoch.parse(source).unwrap()
    assert_eq(parsed.source, source)
    assert_eq(parsed.seconds, seconds)
    assert_eq(parsed.microsecond, microsecond)
  }
}

///|
test "epoch calendar supports astronomical years and explicit Int32 bounds" {
  for
    value in [
      "0000-02-29", "-0004-02-29", "+2147483647-12-31", "-2147483648-01-01",
    ] {
    assert_true(@date_epoch.parse(value) is Ok(_))
  }
  for
    value in [
      "2147483648", "-2147483649", "999999999999999999999999999999999999", "-0001-02-29",
      "1900-02-29",
    ] {
    assert_true(@date_epoch.parse(value) is Err(_))
  }
}

///|
test "epoch parser rejects ambiguous unsupported or malformed input" {
  for
    value in [
      "", "NaT", "now", "today", "2024Z", "2024-01-01Z", "2024-01-01T00:00:00+01:00",
      "2024-01-01T00:00:00.0000001", "2024-01-01T00:00:00.", "2024-01-01T24:00",
      "2024-01-01T23:59:60", "2024-01-01T00:60", "2024-01-01T0", "2024-01T01", "2024-1",
      "2024-01-00", "2024-13-01", " 2024", "2024-01-01 ", "2024-01-01T00:00:00junk",
      "２０２４-01-01",
    ] {
    assert_true(@date_epoch.parse(value) is Err(_))
  }
}
