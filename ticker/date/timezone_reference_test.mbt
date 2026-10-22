// Generated from pinned _get_tzinfo/formatters and verified dateutil gettz.

///|
test "timezone original conversion new_york.tzif" {
  let previous = @config.timezone()
  defer @config.set_timezone(previous)
  @date.register_timezone("new_york.tzif", tzif_new_york)
  defer @date.unregister_timezone("new_york.tzif")
  @config.set_timezone("new_york.tzif")
  let formatter = @date.date_formatter("%Y-%m-%d %H:%M:%S.%f %z %Z")
  assert_eq(
    @date.format_date(@date.num2date(-719161.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "0001-01-01 19:03:58.000000 -045602 LMT",
  )
  assert_eq(
    formatter.format_value(-719161.0),
    "0001-01-01 19:03:58.000000 -045602 LMT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(-719161.0, tz="new_york.tzif"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "0001-01-01 19:03:58.000000 -045602 LMT",
  )
  assert_eq(
    @date.format_date(@date.num2date(-62090.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1800-01-01 19:03:58.000000 -045602 LMT",
  )
  assert_eq(
    formatter.format_value(-62090.0),
    "1800-01-01 19:03:58.000000 -045602 LMT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(-62090.0, tz="new_york.tzif"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "1800-01-01 19:03:58.000000 -045602 LMT",
  )
  assert_eq(
    @date.format_date(@date.num2date(-25566.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1900-01-01 19:03:58.000000 -045602 LMT",
  )
  assert_eq(
    formatter.format_value(-25566.0),
    "1900-01-01 19:03:58.000000 -045602 LMT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(-25566.0, tz="new_york.tzif"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "1900-01-01 19:03:58.000000 -045602 LMT",
  )
  assert_eq(
    @date.format_date(@date.num2date(0.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1969-12-31 19:00:00.000000 -0500 EST",
  )
  assert_eq(formatter.format_value(0.0), "1969-12-31 19:00:00.000000 -0500 EST")
  assert_eq(
    @date.format_date(
      @date.num2date(0.0, tz="new_york.tzif"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "1969-12-31 19:00:00.000000 -0500 EST",
  )
  assert_eq(
    @date.format_date(@date.num2date(19417.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2023-02-28 19:00:00.000000 -0500 EST",
  )
  assert_eq(
    formatter.format_value(19417.0),
    "2023-02-28 19:00:00.000000 -0500 EST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19417.0, tz="new_york.tzif"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2023-02-28 19:00:00.000000 -0500 EST",
  )
  assert_eq(
    @date.format_date(@date.num2date(19781.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-02-27 19:00:00.000000 -0500 EST",
  )
  assert_eq(
    formatter.format_value(19781.0),
    "2024-02-27 19:00:00.000000 -0500 EST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19781.0, tz="new_york.tzif"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-02-27 19:00:00.000000 -0500 EST",
  )
  assert_eq(
    @date.format_date(@date.num2date(19782.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-02-28 19:00:00.000000 -0500 EST",
  )
  assert_eq(
    formatter.format_value(19782.0),
    "2024-02-28 19:00:00.000000 -0500 EST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19782.0, tz="new_york.tzif"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-02-28 19:00:00.000000 -0500 EST",
  )
  assert_eq(
    @date.format_date(@date.num2date(19783.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-02-29 19:00:00.000000 -0500 EST",
  )
  assert_eq(
    formatter.format_value(19783.0),
    "2024-02-29 19:00:00.000000 -0500 EST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19783.0, tz="new_york.tzif"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-02-29 19:00:00.000000 -0500 EST",
  )
  assert_eq(
    @date.format_date(@date.num2date(19723.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2023-12-31 19:00:00.000000 -0500 EST",
  )
  assert_eq(
    formatter.format_value(19723.0),
    "2023-12-31 19:00:00.000000 -0500 EST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19723.0, tz="new_york.tzif"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2023-12-31 19:00:00.000000 -0500 EST",
  )
  assert_eq(
    @date.format_date(@date.num2date(19905.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-06-30 20:00:00.000000 -0400 EDT",
  )
  assert_eq(
    formatter.format_value(19905.0),
    "2024-06-30 20:00:00.000000 -0400 EDT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19905.0, tz="new_york.tzif"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-06-30 20:00:00.000000 -0400 EDT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666657),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 01:59:59.999999 -0500 EST",
  )
  assert_eq(
    formatter.format_value(19792.291666666657),
    "2024-03-10 01:59:59.999999 -0500 EST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666657, tz="new_york.tzif"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 01:59:59.999999 -0500 EST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666668),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 03:00:00.000000 -0400 EDT",
  )
  assert_eq(
    formatter.format_value(19792.291666666668),
    "2024-03-10 03:00:00.000000 -0400 EDT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666668, tz="new_york.tzif"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 03:00:00.000000 -0400 EDT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.229166666668),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 01:30:00.000000 -0400 EDT",
  )
  assert_eq(
    formatter.format_value(20030.229166666668),
    "2024-11-03 01:30:00.000000 -0400 EDT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.229166666668, tz="new_york.tzif"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 01:30:00.000000 -0400 EDT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.270833333332),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 01:30:00.000000 -0500 EST",
  )
  assert_eq(
    formatter.format_value(20030.270833333332),
    "2024-11-03 01:30:00.000000 -0500 EST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.270833333332, tz="new_york.tzif"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 01:30:00.000000 -0500 EST",
  )
  assert_eq(
    @date.format_date(@date.num2date(25018.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2038-06-30 19:00:00.000000 -0500 EST",
  )
  assert_eq(
    formatter.format_value(25018.0),
    "2038-06-30 19:00:00.000000 -0500 EST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(25018.0, tz="new_york.tzif"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2038-06-30 19:00:00.000000 -0500 EST",
  )
  assert_eq(
    @date.format_date(@date.num2date(157236.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2400-06-30 19:00:00.000000 -0500 EST",
  )
  assert_eq(
    formatter.format_value(157236.0),
    "2400-06-30 19:00:00.000000 -0500 EST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(157236.0, tz="new_york.tzif"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2400-06-30 19:00:00.000000 -0500 EST",
  )
  assert_eq(
    @date.format_date(@date.num2date(2932713.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "9999-06-30 19:00:00.000000 -0500 EST",
  )
  assert_eq(
    formatter.format_value(2932713.0),
    "9999-06-30 19:00:00.000000 -0500 EST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(2932713.0, tz="new_york.tzif"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "9999-06-30 19:00:00.000000 -0500 EST",
  )
}

///|
test "timezone original conversion paris.tzif" {
  let previous = @config.timezone()
  defer @config.set_timezone(previous)
  @date.register_timezone("paris.tzif", tzif_paris)
  defer @date.unregister_timezone("paris.tzif")
  @config.set_timezone("paris.tzif")
  let formatter = @date.date_formatter("%Y-%m-%d %H:%M:%S.%f %z %Z")
  assert_eq(
    @date.format_date(@date.num2date(-719161.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "0001-01-02 00:09:21.000000 +000921 LMT",
  )
  assert_eq(
    formatter.format_value(-719161.0),
    "0001-01-02 00:09:21.000000 +000921 LMT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(-719161.0, tz="paris.tzif"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "0001-01-02 00:09:21.000000 +000921 LMT",
  )
  assert_eq(
    @date.format_date(@date.num2date(-62090.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1800-01-02 00:09:21.000000 +000921 LMT",
  )
  assert_eq(
    formatter.format_value(-62090.0),
    "1800-01-02 00:09:21.000000 +000921 LMT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(-62090.0, tz="paris.tzif"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "1800-01-02 00:09:21.000000 +000921 LMT",
  )
  assert_eq(
    @date.format_date(@date.num2date(-25566.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1900-01-02 00:09:21.000000 +000921 LMT",
  )
  assert_eq(
    formatter.format_value(-25566.0),
    "1900-01-02 00:09:21.000000 +000921 LMT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(-25566.0, tz="paris.tzif"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "1900-01-02 00:09:21.000000 +000921 LMT",
  )
  assert_eq(
    @date.format_date(@date.num2date(0.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1970-01-01 01:00:00.000000 +0100 CET",
  )
  assert_eq(formatter.format_value(0.0), "1970-01-01 01:00:00.000000 +0100 CET")
  assert_eq(
    @date.format_date(
      @date.num2date(0.0, tz="paris.tzif"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "1970-01-01 01:00:00.000000 +0100 CET",
  )
  assert_eq(
    @date.format_date(@date.num2date(19417.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2023-03-01 01:00:00.000000 +0100 CET",
  )
  assert_eq(
    formatter.format_value(19417.0),
    "2023-03-01 01:00:00.000000 +0100 CET",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19417.0, tz="paris.tzif"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2023-03-01 01:00:00.000000 +0100 CET",
  )
  assert_eq(
    @date.format_date(@date.num2date(19781.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-02-28 01:00:00.000000 +0100 CET",
  )
  assert_eq(
    formatter.format_value(19781.0),
    "2024-02-28 01:00:00.000000 +0100 CET",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19781.0, tz="paris.tzif"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-02-28 01:00:00.000000 +0100 CET",
  )
  assert_eq(
    @date.format_date(@date.num2date(19782.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-02-29 01:00:00.000000 +0100 CET",
  )
  assert_eq(
    formatter.format_value(19782.0),
    "2024-02-29 01:00:00.000000 +0100 CET",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19782.0, tz="paris.tzif"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-02-29 01:00:00.000000 +0100 CET",
  )
  assert_eq(
    @date.format_date(@date.num2date(19783.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-03-01 01:00:00.000000 +0100 CET",
  )
  assert_eq(
    formatter.format_value(19783.0),
    "2024-03-01 01:00:00.000000 +0100 CET",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19783.0, tz="paris.tzif"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-01 01:00:00.000000 +0100 CET",
  )
  assert_eq(
    @date.format_date(@date.num2date(19723.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-01-01 01:00:00.000000 +0100 CET",
  )
  assert_eq(
    formatter.format_value(19723.0),
    "2024-01-01 01:00:00.000000 +0100 CET",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19723.0, tz="paris.tzif"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-01-01 01:00:00.000000 +0100 CET",
  )
  assert_eq(
    @date.format_date(@date.num2date(19905.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-07-01 02:00:00.000000 +0200 CEST",
  )
  assert_eq(
    formatter.format_value(19905.0),
    "2024-07-01 02:00:00.000000 +0200 CEST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19905.0, tz="paris.tzif"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-07-01 02:00:00.000000 +0200 CEST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666657),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 07:59:59.999999 +0100 CET",
  )
  assert_eq(
    formatter.format_value(19792.291666666657),
    "2024-03-10 07:59:59.999999 +0100 CET",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666657, tz="paris.tzif"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 07:59:59.999999 +0100 CET",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666668),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 08:00:00.000000 +0100 CET",
  )
  assert_eq(
    formatter.format_value(19792.291666666668),
    "2024-03-10 08:00:00.000000 +0100 CET",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666668, tz="paris.tzif"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 08:00:00.000000 +0100 CET",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.229166666668),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 06:30:00.000000 +0100 CET",
  )
  assert_eq(
    formatter.format_value(20030.229166666668),
    "2024-11-03 06:30:00.000000 +0100 CET",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.229166666668, tz="paris.tzif"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 06:30:00.000000 +0100 CET",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.270833333332),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 07:30:00.000000 +0100 CET",
  )
  assert_eq(
    formatter.format_value(20030.270833333332),
    "2024-11-03 07:30:00.000000 +0100 CET",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.270833333332, tz="paris.tzif"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 07:30:00.000000 +0100 CET",
  )
  assert_eq(
    @date.format_date(@date.num2date(25018.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2038-07-01 01:00:00.000000 +0100 CET",
  )
  assert_eq(
    formatter.format_value(25018.0),
    "2038-07-01 01:00:00.000000 +0100 CET",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(25018.0, tz="paris.tzif"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2038-07-01 01:00:00.000000 +0100 CET",
  )
  assert_eq(
    @date.format_date(@date.num2date(157236.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2400-07-01 01:00:00.000000 +0100 CET",
  )
  assert_eq(
    formatter.format_value(157236.0),
    "2400-07-01 01:00:00.000000 +0100 CET",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(157236.0, tz="paris.tzif"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2400-07-01 01:00:00.000000 +0100 CET",
  )
  assert_eq(
    @date.format_date(@date.num2date(2932713.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "9999-07-01 01:00:00.000000 +0100 CET",
  )
  assert_eq(
    formatter.format_value(2932713.0),
    "9999-07-01 01:00:00.000000 +0100 CET",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(2932713.0, tz="paris.tzif"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "9999-07-01 01:00:00.000000 +0100 CET",
  )
}

///|
test "timezone original conversion lord_howe.tzif" {
  let previous = @config.timezone()
  defer @config.set_timezone(previous)
  @date.register_timezone("lord_howe.tzif", tzif_lord_howe)
  defer @date.unregister_timezone("lord_howe.tzif")
  @config.set_timezone("lord_howe.tzif")
  let formatter = @date.date_formatter("%Y-%m-%d %H:%M:%S.%f %z %Z")
  assert_eq(
    @date.format_date(@date.num2date(-719161.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "0001-01-02 10:36:20.000000 +103620 LMT",
  )
  assert_eq(
    formatter.format_value(-719161.0),
    "0001-01-02 10:36:20.000000 +103620 LMT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(-719161.0, tz="lord_howe.tzif"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "0001-01-02 10:36:20.000000 +103620 LMT",
  )
  assert_eq(
    @date.format_date(@date.num2date(-62090.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1800-01-02 10:36:20.000000 +103620 LMT",
  )
  assert_eq(
    formatter.format_value(-62090.0),
    "1800-01-02 10:36:20.000000 +103620 LMT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(-62090.0, tz="lord_howe.tzif"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "1800-01-02 10:36:20.000000 +103620 LMT",
  )
  assert_eq(
    @date.format_date(@date.num2date(-25566.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1900-01-02 10:36:20.000000 +103620 LMT",
  )
  assert_eq(
    formatter.format_value(-25566.0),
    "1900-01-02 10:36:20.000000 +103620 LMT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(-25566.0, tz="lord_howe.tzif"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "1900-01-02 10:36:20.000000 +103620 LMT",
  )
  assert_eq(
    @date.format_date(@date.num2date(0.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1970-01-01 10:00:00.000000 +1000 AEST",
  )
  assert_eq(
    formatter.format_value(0.0),
    "1970-01-01 10:00:00.000000 +1000 AEST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(0.0, tz="lord_howe.tzif"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "1970-01-01 10:00:00.000000 +1000 AEST",
  )
  assert_eq(
    @date.format_date(@date.num2date(19417.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2023-03-01 11:00:00.000000 +1100 +11",
  )
  assert_eq(
    formatter.format_value(19417.0),
    "2023-03-01 11:00:00.000000 +1100 +11",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19417.0, tz="lord_howe.tzif"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2023-03-01 11:00:00.000000 +1100 +11",
  )
  assert_eq(
    @date.format_date(@date.num2date(19781.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-02-28 11:00:00.000000 +1100 +11",
  )
  assert_eq(
    formatter.format_value(19781.0),
    "2024-02-28 11:00:00.000000 +1100 +11",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19781.0, tz="lord_howe.tzif"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-02-28 11:00:00.000000 +1100 +11",
  )
  assert_eq(
    @date.format_date(@date.num2date(19782.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-02-29 11:00:00.000000 +1100 +11",
  )
  assert_eq(
    formatter.format_value(19782.0),
    "2024-02-29 11:00:00.000000 +1100 +11",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19782.0, tz="lord_howe.tzif"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-02-29 11:00:00.000000 +1100 +11",
  )
  assert_eq(
    @date.format_date(@date.num2date(19783.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-03-01 11:00:00.000000 +1100 +11",
  )
  assert_eq(
    formatter.format_value(19783.0),
    "2024-03-01 11:00:00.000000 +1100 +11",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19783.0, tz="lord_howe.tzif"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-01 11:00:00.000000 +1100 +11",
  )
  assert_eq(
    @date.format_date(@date.num2date(19723.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-01-01 11:00:00.000000 +1100 +11",
  )
  assert_eq(
    formatter.format_value(19723.0),
    "2024-01-01 11:00:00.000000 +1100 +11",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19723.0, tz="lord_howe.tzif"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-01-01 11:00:00.000000 +1100 +11",
  )
  assert_eq(
    @date.format_date(@date.num2date(19905.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-07-01 10:30:00.000000 +1030 +1030",
  )
  assert_eq(
    formatter.format_value(19905.0),
    "2024-07-01 10:30:00.000000 +1030 +1030",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19905.0, tz="lord_howe.tzif"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-07-01 10:30:00.000000 +1030 +1030",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666657),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 17:59:59.999999 +1100 +11",
  )
  assert_eq(
    formatter.format_value(19792.291666666657),
    "2024-03-10 17:59:59.999999 +1100 +11",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666657, tz="lord_howe.tzif"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 17:59:59.999999 +1100 +11",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666668),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 18:00:00.000000 +1100 +11",
  )
  assert_eq(
    formatter.format_value(19792.291666666668),
    "2024-03-10 18:00:00.000000 +1100 +11",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666668, tz="lord_howe.tzif"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 18:00:00.000000 +1100 +11",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.229166666668),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 16:30:00.000000 +1100 +11",
  )
  assert_eq(
    formatter.format_value(20030.229166666668),
    "2024-11-03 16:30:00.000000 +1100 +11",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.229166666668, tz="lord_howe.tzif"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 16:30:00.000000 +1100 +11",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.270833333332),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 17:30:00.000000 +1100 +11",
  )
  assert_eq(
    formatter.format_value(20030.270833333332),
    "2024-11-03 17:30:00.000000 +1100 +11",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.270833333332, tz="lord_howe.tzif"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 17:30:00.000000 +1100 +11",
  )
  assert_eq(
    @date.format_date(@date.num2date(25018.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2038-07-01 10:30:00.000000 +1030 +1030",
  )
  assert_eq(
    formatter.format_value(25018.0),
    "2038-07-01 10:30:00.000000 +1030 +1030",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(25018.0, tz="lord_howe.tzif"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2038-07-01 10:30:00.000000 +1030 +1030",
  )
  assert_eq(
    @date.format_date(@date.num2date(157236.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2400-07-01 10:30:00.000000 +1030 +1030",
  )
  assert_eq(
    formatter.format_value(157236.0),
    "2400-07-01 10:30:00.000000 +1030 +1030",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(157236.0, tz="lord_howe.tzif"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2400-07-01 10:30:00.000000 +1030 +1030",
  )
  assert_eq(
    @date.format_date(@date.num2date(2932713.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "9999-07-01 10:30:00.000000 +1030 +1030",
  )
  assert_eq(
    formatter.format_value(2932713.0),
    "9999-07-01 10:30:00.000000 +1030 +1030",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(2932713.0, tz="lord_howe.tzif"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "9999-07-01 10:30:00.000000 +1030 +1030",
  )
}

///|
test "timezone original conversion nuuk.tzif" {
  let previous = @config.timezone()
  defer @config.set_timezone(previous)
  @date.register_timezone("nuuk.tzif", tzif_nuuk)
  defer @date.unregister_timezone("nuuk.tzif")
  @config.set_timezone("nuuk.tzif")
  let formatter = @date.date_formatter("%Y-%m-%d %H:%M:%S.%f %z %Z")
  assert_eq(
    @date.format_date(@date.num2date(-719161.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "0001-01-01 20:33:04.000000 -032656 LMT",
  )
  assert_eq(
    formatter.format_value(-719161.0),
    "0001-01-01 20:33:04.000000 -032656 LMT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(-719161.0, tz="nuuk.tzif"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "0001-01-01 20:33:04.000000 -032656 LMT",
  )
  assert_eq(
    @date.format_date(@date.num2date(-62090.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1800-01-01 20:33:04.000000 -032656 LMT",
  )
  assert_eq(
    formatter.format_value(-62090.0),
    "1800-01-01 20:33:04.000000 -032656 LMT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(-62090.0, tz="nuuk.tzif"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "1800-01-01 20:33:04.000000 -032656 LMT",
  )
  assert_eq(
    @date.format_date(@date.num2date(-25566.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1900-01-01 20:33:04.000000 -032656 LMT",
  )
  assert_eq(
    formatter.format_value(-25566.0),
    "1900-01-01 20:33:04.000000 -032656 LMT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(-25566.0, tz="nuuk.tzif"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "1900-01-01 20:33:04.000000 -032656 LMT",
  )
  assert_eq(
    @date.format_date(@date.num2date(0.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1969-12-31 21:00:00.000000 -0300 -03",
  )
  assert_eq(formatter.format_value(0.0), "1969-12-31 21:00:00.000000 -0300 -03")
  assert_eq(
    @date.format_date(
      @date.num2date(0.0, tz="nuuk.tzif"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "1969-12-31 21:00:00.000000 -0300 -03",
  )
  assert_eq(
    @date.format_date(@date.num2date(19417.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2023-02-28 21:00:00.000000 -0300 -03",
  )
  assert_eq(
    formatter.format_value(19417.0),
    "2023-02-28 21:00:00.000000 -0300 -03",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19417.0, tz="nuuk.tzif"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2023-02-28 21:00:00.000000 -0300 -03",
  )
  assert_eq(
    @date.format_date(@date.num2date(19781.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-02-27 22:00:00.000000 -0200 -02",
  )
  assert_eq(
    formatter.format_value(19781.0),
    "2024-02-27 22:00:00.000000 -0200 -02",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19781.0, tz="nuuk.tzif"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-02-27 22:00:00.000000 -0200 -02",
  )
  assert_eq(
    @date.format_date(@date.num2date(19782.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-02-28 22:00:00.000000 -0200 -02",
  )
  assert_eq(
    formatter.format_value(19782.0),
    "2024-02-28 22:00:00.000000 -0200 -02",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19782.0, tz="nuuk.tzif"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-02-28 22:00:00.000000 -0200 -02",
  )
  assert_eq(
    @date.format_date(@date.num2date(19783.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-02-29 22:00:00.000000 -0200 -02",
  )
  assert_eq(
    formatter.format_value(19783.0),
    "2024-02-29 22:00:00.000000 -0200 -02",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19783.0, tz="nuuk.tzif"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-02-29 22:00:00.000000 -0200 -02",
  )
  assert_eq(
    @date.format_date(@date.num2date(19723.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2023-12-31 22:00:00.000000 -0200 -02",
  )
  assert_eq(
    formatter.format_value(19723.0),
    "2023-12-31 22:00:00.000000 -0200 -02",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19723.0, tz="nuuk.tzif"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2023-12-31 22:00:00.000000 -0200 -02",
  )
  assert_eq(
    @date.format_date(@date.num2date(19905.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-06-30 23:00:00.000000 -0100 -01",
  )
  assert_eq(
    formatter.format_value(19905.0),
    "2024-06-30 23:00:00.000000 -0100 -01",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19905.0, tz="nuuk.tzif"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-06-30 23:00:00.000000 -0100 -01",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666657),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 04:59:59.999999 -0200 -02",
  )
  assert_eq(
    formatter.format_value(19792.291666666657),
    "2024-03-10 04:59:59.999999 -0200 -02",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666657, tz="nuuk.tzif"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 04:59:59.999999 -0200 -02",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666668),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 05:00:00.000000 -0200 -02",
  )
  assert_eq(
    formatter.format_value(19792.291666666668),
    "2024-03-10 05:00:00.000000 -0200 -02",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666668, tz="nuuk.tzif"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 05:00:00.000000 -0200 -02",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.229166666668),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 03:30:00.000000 -0200 -02",
  )
  assert_eq(
    formatter.format_value(20030.229166666668),
    "2024-11-03 03:30:00.000000 -0200 -02",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.229166666668, tz="nuuk.tzif"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 03:30:00.000000 -0200 -02",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.270833333332),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 04:30:00.000000 -0200 -02",
  )
  assert_eq(
    formatter.format_value(20030.270833333332),
    "2024-11-03 04:30:00.000000 -0200 -02",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.270833333332, tz="nuuk.tzif"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 04:30:00.000000 -0200 -02",
  )
  assert_eq(
    @date.format_date(@date.num2date(25018.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2038-06-30 22:00:00.000000 -0200 -02",
  )
  assert_eq(
    formatter.format_value(25018.0),
    "2038-06-30 22:00:00.000000 -0200 -02",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(25018.0, tz="nuuk.tzif"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2038-06-30 22:00:00.000000 -0200 -02",
  )
  assert_eq(
    @date.format_date(@date.num2date(157236.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2400-06-30 22:00:00.000000 -0200 -02",
  )
  assert_eq(
    formatter.format_value(157236.0),
    "2400-06-30 22:00:00.000000 -0200 -02",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(157236.0, tz="nuuk.tzif"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2400-06-30 22:00:00.000000 -0200 -02",
  )
  assert_eq(
    @date.format_date(@date.num2date(2932713.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "9999-06-30 22:00:00.000000 -0200 -02",
  )
  assert_eq(
    formatter.format_value(2932713.0),
    "9999-06-30 22:00:00.000000 -0200 -02",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(2932713.0, tz="nuuk.tzif"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "9999-06-30 22:00:00.000000 -0200 -02",
  )
}

///|
test "timezone original conversion UTC" {
  let previous = @config.timezone()
  defer @config.set_timezone(previous)
  @config.set_timezone("UTC")
  let formatter = @date.date_formatter("%Y-%m-%d %H:%M:%S.%f %z %Z")
  assert_eq(
    @date.format_date(@date.num2date(-719161.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "0001-01-02 00:00:00.000000 +0000 UTC",
  )
  assert_eq(
    formatter.format_value(-719161.0),
    "0001-01-02 00:00:00.000000 +0000 UTC",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(-719161.0, tz="UTC"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "0001-01-02 00:00:00.000000 +0000 UTC",
  )
  assert_eq(
    @date.format_date(@date.num2date(-62090.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1800-01-02 00:00:00.000000 +0000 UTC",
  )
  assert_eq(
    formatter.format_value(-62090.0),
    "1800-01-02 00:00:00.000000 +0000 UTC",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(-62090.0, tz="UTC"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "1800-01-02 00:00:00.000000 +0000 UTC",
  )
  assert_eq(
    @date.format_date(@date.num2date(-25566.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1900-01-02 00:00:00.000000 +0000 UTC",
  )
  assert_eq(
    formatter.format_value(-25566.0),
    "1900-01-02 00:00:00.000000 +0000 UTC",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(-25566.0, tz="UTC"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "1900-01-02 00:00:00.000000 +0000 UTC",
  )
  assert_eq(
    @date.format_date(@date.num2date(0.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1970-01-01 00:00:00.000000 +0000 UTC",
  )
  assert_eq(formatter.format_value(0.0), "1970-01-01 00:00:00.000000 +0000 UTC")
  assert_eq(
    @date.format_date(
      @date.num2date(0.0, tz="UTC"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "1970-01-01 00:00:00.000000 +0000 UTC",
  )
  assert_eq(
    @date.format_date(@date.num2date(19417.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2023-03-01 00:00:00.000000 +0000 UTC",
  )
  assert_eq(
    formatter.format_value(19417.0),
    "2023-03-01 00:00:00.000000 +0000 UTC",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19417.0, tz="UTC"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2023-03-01 00:00:00.000000 +0000 UTC",
  )
  assert_eq(
    @date.format_date(@date.num2date(19781.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-02-28 00:00:00.000000 +0000 UTC",
  )
  assert_eq(
    formatter.format_value(19781.0),
    "2024-02-28 00:00:00.000000 +0000 UTC",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19781.0, tz="UTC"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-02-28 00:00:00.000000 +0000 UTC",
  )
  assert_eq(
    @date.format_date(@date.num2date(19782.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-02-29 00:00:00.000000 +0000 UTC",
  )
  assert_eq(
    formatter.format_value(19782.0),
    "2024-02-29 00:00:00.000000 +0000 UTC",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19782.0, tz="UTC"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-02-29 00:00:00.000000 +0000 UTC",
  )
  assert_eq(
    @date.format_date(@date.num2date(19783.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-03-01 00:00:00.000000 +0000 UTC",
  )
  assert_eq(
    formatter.format_value(19783.0),
    "2024-03-01 00:00:00.000000 +0000 UTC",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19783.0, tz="UTC"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-01 00:00:00.000000 +0000 UTC",
  )
  assert_eq(
    @date.format_date(@date.num2date(19723.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-01-01 00:00:00.000000 +0000 UTC",
  )
  assert_eq(
    formatter.format_value(19723.0),
    "2024-01-01 00:00:00.000000 +0000 UTC",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19723.0, tz="UTC"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-01-01 00:00:00.000000 +0000 UTC",
  )
  assert_eq(
    @date.format_date(@date.num2date(19905.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-07-01 00:00:00.000000 +0000 UTC",
  )
  assert_eq(
    formatter.format_value(19905.0),
    "2024-07-01 00:00:00.000000 +0000 UTC",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19905.0, tz="UTC"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-07-01 00:00:00.000000 +0000 UTC",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666657),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 06:59:59.999999 +0000 UTC",
  )
  assert_eq(
    formatter.format_value(19792.291666666657),
    "2024-03-10 06:59:59.999999 +0000 UTC",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666657, tz="UTC"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 06:59:59.999999 +0000 UTC",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666668),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 07:00:00.000000 +0000 UTC",
  )
  assert_eq(
    formatter.format_value(19792.291666666668),
    "2024-03-10 07:00:00.000000 +0000 UTC",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666668, tz="UTC"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 07:00:00.000000 +0000 UTC",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.229166666668),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 05:30:00.000000 +0000 UTC",
  )
  assert_eq(
    formatter.format_value(20030.229166666668),
    "2024-11-03 05:30:00.000000 +0000 UTC",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.229166666668, tz="UTC"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 05:30:00.000000 +0000 UTC",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.270833333332),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 06:30:00.000000 +0000 UTC",
  )
  assert_eq(
    formatter.format_value(20030.270833333332),
    "2024-11-03 06:30:00.000000 +0000 UTC",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.270833333332, tz="UTC"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 06:30:00.000000 +0000 UTC",
  )
  assert_eq(
    @date.format_date(@date.num2date(25018.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2038-07-01 00:00:00.000000 +0000 UTC",
  )
  assert_eq(
    formatter.format_value(25018.0),
    "2038-07-01 00:00:00.000000 +0000 UTC",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(25018.0, tz="UTC"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2038-07-01 00:00:00.000000 +0000 UTC",
  )
  assert_eq(
    @date.format_date(@date.num2date(157236.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2400-07-01 00:00:00.000000 +0000 UTC",
  )
  assert_eq(
    formatter.format_value(157236.0),
    "2400-07-01 00:00:00.000000 +0000 UTC",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(157236.0, tz="UTC"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2400-07-01 00:00:00.000000 +0000 UTC",
  )
  assert_eq(
    @date.format_date(@date.num2date(2932713.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "9999-07-01 00:00:00.000000 +0000 UTC",
  )
  assert_eq(
    formatter.format_value(2932713.0),
    "9999-07-01 00:00:00.000000 +0000 UTC",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(2932713.0, tz="UTC"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "9999-07-01 00:00:00.000000 +0000 UTC",
  )
}

///|
test "timezone original conversion XST-5:45" {
  let previous = @config.timezone()
  defer @config.set_timezone(previous)
  @config.set_timezone("XST-5:45")
  let formatter = @date.date_formatter("%Y-%m-%d %H:%M:%S.%f %z %Z")
  assert_eq(
    @date.format_date(@date.num2date(-719161.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "0001-01-02 05:45:00.000000 +0545 XST",
  )
  assert_eq(
    formatter.format_value(-719161.0),
    "0001-01-02 05:45:00.000000 +0545 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(-719161.0, tz="XST-5:45"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "0001-01-02 05:45:00.000000 +0545 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(-62090.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1800-01-02 05:45:00.000000 +0545 XST",
  )
  assert_eq(
    formatter.format_value(-62090.0),
    "1800-01-02 05:45:00.000000 +0545 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(-62090.0, tz="XST-5:45"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "1800-01-02 05:45:00.000000 +0545 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(-25566.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1900-01-02 05:45:00.000000 +0545 XST",
  )
  assert_eq(
    formatter.format_value(-25566.0),
    "1900-01-02 05:45:00.000000 +0545 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(-25566.0, tz="XST-5:45"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "1900-01-02 05:45:00.000000 +0545 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(0.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1970-01-01 05:45:00.000000 +0545 XST",
  )
  assert_eq(formatter.format_value(0.0), "1970-01-01 05:45:00.000000 +0545 XST")
  assert_eq(
    @date.format_date(
      @date.num2date(0.0, tz="XST-5:45"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "1970-01-01 05:45:00.000000 +0545 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(19417.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2023-03-01 05:45:00.000000 +0545 XST",
  )
  assert_eq(
    formatter.format_value(19417.0),
    "2023-03-01 05:45:00.000000 +0545 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19417.0, tz="XST-5:45"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2023-03-01 05:45:00.000000 +0545 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(19781.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-02-28 05:45:00.000000 +0545 XST",
  )
  assert_eq(
    formatter.format_value(19781.0),
    "2024-02-28 05:45:00.000000 +0545 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19781.0, tz="XST-5:45"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-02-28 05:45:00.000000 +0545 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(19782.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-02-29 05:45:00.000000 +0545 XST",
  )
  assert_eq(
    formatter.format_value(19782.0),
    "2024-02-29 05:45:00.000000 +0545 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19782.0, tz="XST-5:45"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-02-29 05:45:00.000000 +0545 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(19783.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-03-01 05:45:00.000000 +0545 XST",
  )
  assert_eq(
    formatter.format_value(19783.0),
    "2024-03-01 05:45:00.000000 +0545 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19783.0, tz="XST-5:45"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-01 05:45:00.000000 +0545 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(19723.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-01-01 05:45:00.000000 +0545 XST",
  )
  assert_eq(
    formatter.format_value(19723.0),
    "2024-01-01 05:45:00.000000 +0545 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19723.0, tz="XST-5:45"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-01-01 05:45:00.000000 +0545 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(19905.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-07-01 05:45:00.000000 +0545 XST",
  )
  assert_eq(
    formatter.format_value(19905.0),
    "2024-07-01 05:45:00.000000 +0545 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19905.0, tz="XST-5:45"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-07-01 05:45:00.000000 +0545 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666657),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 12:44:59.999999 +0545 XST",
  )
  assert_eq(
    formatter.format_value(19792.291666666657),
    "2024-03-10 12:44:59.999999 +0545 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666657, tz="XST-5:45"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 12:44:59.999999 +0545 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666668),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 12:45:00.000000 +0545 XST",
  )
  assert_eq(
    formatter.format_value(19792.291666666668),
    "2024-03-10 12:45:00.000000 +0545 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666668, tz="XST-5:45"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 12:45:00.000000 +0545 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.229166666668),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 11:15:00.000000 +0545 XST",
  )
  assert_eq(
    formatter.format_value(20030.229166666668),
    "2024-11-03 11:15:00.000000 +0545 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.229166666668, tz="XST-5:45"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 11:15:00.000000 +0545 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.270833333332),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 12:15:00.000000 +0545 XST",
  )
  assert_eq(
    formatter.format_value(20030.270833333332),
    "2024-11-03 12:15:00.000000 +0545 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.270833333332, tz="XST-5:45"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 12:15:00.000000 +0545 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(25018.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2038-07-01 05:45:00.000000 +0545 XST",
  )
  assert_eq(
    formatter.format_value(25018.0),
    "2038-07-01 05:45:00.000000 +0545 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(25018.0, tz="XST-5:45"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2038-07-01 05:45:00.000000 +0545 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(157236.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2400-07-01 05:45:00.000000 +0545 XST",
  )
  assert_eq(
    formatter.format_value(157236.0),
    "2400-07-01 05:45:00.000000 +0545 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(157236.0, tz="XST-5:45"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2400-07-01 05:45:00.000000 +0545 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(2932713.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "9999-07-01 05:45:00.000000 +0545 XST",
  )
  assert_eq(
    formatter.format_value(2932713.0),
    "9999-07-01 05:45:00.000000 +0545 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(2932713.0, tz="XST-5:45"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "9999-07-01 05:45:00.000000 +0545 XST",
  )
}

///|
test "timezone original conversion XST0:09" {
  let previous = @config.timezone()
  defer @config.set_timezone(previous)
  @config.set_timezone("XST0:09")
  let formatter = @date.date_formatter("%Y-%m-%d %H:%M:%S.%f %z %Z")
  assert_eq(
    @date.format_date(@date.num2date(-719161.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "0001-01-01 23:51:00.000000 -0009 XST",
  )
  assert_eq(
    formatter.format_value(-719161.0),
    "0001-01-01 23:51:00.000000 -0009 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(-719161.0, tz="XST0:09"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "0001-01-01 23:51:00.000000 -0009 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(-62090.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1800-01-01 23:51:00.000000 -0009 XST",
  )
  assert_eq(
    formatter.format_value(-62090.0),
    "1800-01-01 23:51:00.000000 -0009 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(-62090.0, tz="XST0:09"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "1800-01-01 23:51:00.000000 -0009 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(-25566.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1900-01-01 23:51:00.000000 -0009 XST",
  )
  assert_eq(
    formatter.format_value(-25566.0),
    "1900-01-01 23:51:00.000000 -0009 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(-25566.0, tz="XST0:09"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "1900-01-01 23:51:00.000000 -0009 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(0.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1969-12-31 23:51:00.000000 -0009 XST",
  )
  assert_eq(formatter.format_value(0.0), "1969-12-31 23:51:00.000000 -0009 XST")
  assert_eq(
    @date.format_date(
      @date.num2date(0.0, tz="XST0:09"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "1969-12-31 23:51:00.000000 -0009 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(19417.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2023-02-28 23:51:00.000000 -0009 XST",
  )
  assert_eq(
    formatter.format_value(19417.0),
    "2023-02-28 23:51:00.000000 -0009 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19417.0, tz="XST0:09"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2023-02-28 23:51:00.000000 -0009 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(19781.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-02-27 23:51:00.000000 -0009 XST",
  )
  assert_eq(
    formatter.format_value(19781.0),
    "2024-02-27 23:51:00.000000 -0009 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19781.0, tz="XST0:09"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-02-27 23:51:00.000000 -0009 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(19782.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-02-28 23:51:00.000000 -0009 XST",
  )
  assert_eq(
    formatter.format_value(19782.0),
    "2024-02-28 23:51:00.000000 -0009 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19782.0, tz="XST0:09"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-02-28 23:51:00.000000 -0009 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(19783.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-02-29 23:51:00.000000 -0009 XST",
  )
  assert_eq(
    formatter.format_value(19783.0),
    "2024-02-29 23:51:00.000000 -0009 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19783.0, tz="XST0:09"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-02-29 23:51:00.000000 -0009 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(19723.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2023-12-31 23:51:00.000000 -0009 XST",
  )
  assert_eq(
    formatter.format_value(19723.0),
    "2023-12-31 23:51:00.000000 -0009 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19723.0, tz="XST0:09"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2023-12-31 23:51:00.000000 -0009 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(19905.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-06-30 23:51:00.000000 -0009 XST",
  )
  assert_eq(
    formatter.format_value(19905.0),
    "2024-06-30 23:51:00.000000 -0009 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19905.0, tz="XST0:09"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-06-30 23:51:00.000000 -0009 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666657),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 06:50:59.999999 -0009 XST",
  )
  assert_eq(
    formatter.format_value(19792.291666666657),
    "2024-03-10 06:50:59.999999 -0009 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666657, tz="XST0:09"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 06:50:59.999999 -0009 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666668),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 06:51:00.000000 -0009 XST",
  )
  assert_eq(
    formatter.format_value(19792.291666666668),
    "2024-03-10 06:51:00.000000 -0009 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666668, tz="XST0:09"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 06:51:00.000000 -0009 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.229166666668),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 05:21:00.000000 -0009 XST",
  )
  assert_eq(
    formatter.format_value(20030.229166666668),
    "2024-11-03 05:21:00.000000 -0009 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.229166666668, tz="XST0:09"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 05:21:00.000000 -0009 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.270833333332),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 06:21:00.000000 -0009 XST",
  )
  assert_eq(
    formatter.format_value(20030.270833333332),
    "2024-11-03 06:21:00.000000 -0009 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.270833333332, tz="XST0:09"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 06:21:00.000000 -0009 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(25018.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2038-06-30 23:51:00.000000 -0009 XST",
  )
  assert_eq(
    formatter.format_value(25018.0),
    "2038-06-30 23:51:00.000000 -0009 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(25018.0, tz="XST0:09"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2038-06-30 23:51:00.000000 -0009 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(157236.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2400-06-30 23:51:00.000000 -0009 XST",
  )
  assert_eq(
    formatter.format_value(157236.0),
    "2400-06-30 23:51:00.000000 -0009 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(157236.0, tz="XST0:09"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2400-06-30 23:51:00.000000 -0009 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(2932713.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "9999-06-30 23:51:00.000000 -0009 XST",
  )
  assert_eq(
    formatter.format_value(2932713.0),
    "9999-06-30 23:51:00.000000 -0009 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(2932713.0, tz="XST0:09"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "9999-06-30 23:51:00.000000 -0009 XST",
  )
}

///|
test "timezone original conversion XST0545" {
  let previous = @config.timezone()
  defer @config.set_timezone(previous)
  @config.set_timezone("XST0545")
  let formatter = @date.date_formatter("%Y-%m-%d %H:%M:%S.%f %z %Z")
  assert_eq(
    @date.format_date(@date.num2date(-719161.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "0001-01-01 18:15:00.000000 -0545 XST",
  )
  assert_eq(
    formatter.format_value(-719161.0),
    "0001-01-01 18:15:00.000000 -0545 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(-719161.0, tz="XST0545"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "0001-01-01 18:15:00.000000 -0545 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(-62090.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1800-01-01 18:15:00.000000 -0545 XST",
  )
  assert_eq(
    formatter.format_value(-62090.0),
    "1800-01-01 18:15:00.000000 -0545 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(-62090.0, tz="XST0545"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "1800-01-01 18:15:00.000000 -0545 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(-25566.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1900-01-01 18:15:00.000000 -0545 XST",
  )
  assert_eq(
    formatter.format_value(-25566.0),
    "1900-01-01 18:15:00.000000 -0545 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(-25566.0, tz="XST0545"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "1900-01-01 18:15:00.000000 -0545 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(0.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1969-12-31 18:15:00.000000 -0545 XST",
  )
  assert_eq(formatter.format_value(0.0), "1969-12-31 18:15:00.000000 -0545 XST")
  assert_eq(
    @date.format_date(
      @date.num2date(0.0, tz="XST0545"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "1969-12-31 18:15:00.000000 -0545 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(19417.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2023-02-28 18:15:00.000000 -0545 XST",
  )
  assert_eq(
    formatter.format_value(19417.0),
    "2023-02-28 18:15:00.000000 -0545 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19417.0, tz="XST0545"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2023-02-28 18:15:00.000000 -0545 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(19781.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-02-27 18:15:00.000000 -0545 XST",
  )
  assert_eq(
    formatter.format_value(19781.0),
    "2024-02-27 18:15:00.000000 -0545 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19781.0, tz="XST0545"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-02-27 18:15:00.000000 -0545 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(19782.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-02-28 18:15:00.000000 -0545 XST",
  )
  assert_eq(
    formatter.format_value(19782.0),
    "2024-02-28 18:15:00.000000 -0545 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19782.0, tz="XST0545"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-02-28 18:15:00.000000 -0545 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(19783.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-02-29 18:15:00.000000 -0545 XST",
  )
  assert_eq(
    formatter.format_value(19783.0),
    "2024-02-29 18:15:00.000000 -0545 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19783.0, tz="XST0545"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-02-29 18:15:00.000000 -0545 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(19723.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2023-12-31 18:15:00.000000 -0545 XST",
  )
  assert_eq(
    formatter.format_value(19723.0),
    "2023-12-31 18:15:00.000000 -0545 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19723.0, tz="XST0545"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2023-12-31 18:15:00.000000 -0545 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(19905.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-06-30 18:15:00.000000 -0545 XST",
  )
  assert_eq(
    formatter.format_value(19905.0),
    "2024-06-30 18:15:00.000000 -0545 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19905.0, tz="XST0545"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-06-30 18:15:00.000000 -0545 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666657),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 01:14:59.999999 -0545 XST",
  )
  assert_eq(
    formatter.format_value(19792.291666666657),
    "2024-03-10 01:14:59.999999 -0545 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666657, tz="XST0545"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 01:14:59.999999 -0545 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666668),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 01:15:00.000000 -0545 XST",
  )
  assert_eq(
    formatter.format_value(19792.291666666668),
    "2024-03-10 01:15:00.000000 -0545 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666668, tz="XST0545"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 01:15:00.000000 -0545 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.229166666668),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-02 23:45:00.000000 -0545 XST",
  )
  assert_eq(
    formatter.format_value(20030.229166666668),
    "2024-11-02 23:45:00.000000 -0545 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.229166666668, tz="XST0545"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-02 23:45:00.000000 -0545 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.270833333332),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 00:45:00.000000 -0545 XST",
  )
  assert_eq(
    formatter.format_value(20030.270833333332),
    "2024-11-03 00:45:00.000000 -0545 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.270833333332, tz="XST0545"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 00:45:00.000000 -0545 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(25018.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2038-06-30 18:15:00.000000 -0545 XST",
  )
  assert_eq(
    formatter.format_value(25018.0),
    "2038-06-30 18:15:00.000000 -0545 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(25018.0, tz="XST0545"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2038-06-30 18:15:00.000000 -0545 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(157236.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2400-06-30 18:15:00.000000 -0545 XST",
  )
  assert_eq(
    formatter.format_value(157236.0),
    "2400-06-30 18:15:00.000000 -0545 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(157236.0, tz="XST0545"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2400-06-30 18:15:00.000000 -0545 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(2932713.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "9999-06-30 18:15:00.000000 -0545 XST",
  )
  assert_eq(
    formatter.format_value(2932713.0),
    "9999-06-30 18:15:00.000000 -0545 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(2932713.0, tz="XST0545"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "9999-06-30 18:15:00.000000 -0545 XST",
  )
}

///|
test "timezone original conversion X-5" {
  let previous = @config.timezone()
  defer @config.set_timezone(previous)
  @config.set_timezone("X-5")
  let formatter = @date.date_formatter("%Y-%m-%d %H:%M:%S.%f %z %Z")
  assert_eq(
    @date.format_date(@date.num2date(-719161.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "0001-01-02 05:00:00.000000 +0500 X",
  )
  assert_eq(
    formatter.format_value(-719161.0),
    "0001-01-02 05:00:00.000000 +0500 X",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(-719161.0, tz="X-5"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "0001-01-02 05:00:00.000000 +0500 X",
  )
  assert_eq(
    @date.format_date(@date.num2date(-62090.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1800-01-02 05:00:00.000000 +0500 X",
  )
  assert_eq(
    formatter.format_value(-62090.0),
    "1800-01-02 05:00:00.000000 +0500 X",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(-62090.0, tz="X-5"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "1800-01-02 05:00:00.000000 +0500 X",
  )
  assert_eq(
    @date.format_date(@date.num2date(-25566.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1900-01-02 05:00:00.000000 +0500 X",
  )
  assert_eq(
    formatter.format_value(-25566.0),
    "1900-01-02 05:00:00.000000 +0500 X",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(-25566.0, tz="X-5"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "1900-01-02 05:00:00.000000 +0500 X",
  )
  assert_eq(
    @date.format_date(@date.num2date(0.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1970-01-01 05:00:00.000000 +0500 X",
  )
  assert_eq(formatter.format_value(0.0), "1970-01-01 05:00:00.000000 +0500 X")
  assert_eq(
    @date.format_date(
      @date.num2date(0.0, tz="X-5"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "1970-01-01 05:00:00.000000 +0500 X",
  )
  assert_eq(
    @date.format_date(@date.num2date(19417.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2023-03-01 05:00:00.000000 +0500 X",
  )
  assert_eq(
    formatter.format_value(19417.0),
    "2023-03-01 05:00:00.000000 +0500 X",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19417.0, tz="X-5"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2023-03-01 05:00:00.000000 +0500 X",
  )
  assert_eq(
    @date.format_date(@date.num2date(19781.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-02-28 05:00:00.000000 +0500 X",
  )
  assert_eq(
    formatter.format_value(19781.0),
    "2024-02-28 05:00:00.000000 +0500 X",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19781.0, tz="X-5"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-02-28 05:00:00.000000 +0500 X",
  )
  assert_eq(
    @date.format_date(@date.num2date(19782.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-02-29 05:00:00.000000 +0500 X",
  )
  assert_eq(
    formatter.format_value(19782.0),
    "2024-02-29 05:00:00.000000 +0500 X",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19782.0, tz="X-5"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-02-29 05:00:00.000000 +0500 X",
  )
  assert_eq(
    @date.format_date(@date.num2date(19783.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-03-01 05:00:00.000000 +0500 X",
  )
  assert_eq(
    formatter.format_value(19783.0),
    "2024-03-01 05:00:00.000000 +0500 X",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19783.0, tz="X-5"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-01 05:00:00.000000 +0500 X",
  )
  assert_eq(
    @date.format_date(@date.num2date(19723.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-01-01 05:00:00.000000 +0500 X",
  )
  assert_eq(
    formatter.format_value(19723.0),
    "2024-01-01 05:00:00.000000 +0500 X",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19723.0, tz="X-5"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-01-01 05:00:00.000000 +0500 X",
  )
  assert_eq(
    @date.format_date(@date.num2date(19905.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-07-01 05:00:00.000000 +0500 X",
  )
  assert_eq(
    formatter.format_value(19905.0),
    "2024-07-01 05:00:00.000000 +0500 X",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19905.0, tz="X-5"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-07-01 05:00:00.000000 +0500 X",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666657),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 11:59:59.999999 +0500 X",
  )
  assert_eq(
    formatter.format_value(19792.291666666657),
    "2024-03-10 11:59:59.999999 +0500 X",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666657, tz="X-5"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 11:59:59.999999 +0500 X",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666668),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 12:00:00.000000 +0500 X",
  )
  assert_eq(
    formatter.format_value(19792.291666666668),
    "2024-03-10 12:00:00.000000 +0500 X",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666668, tz="X-5"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 12:00:00.000000 +0500 X",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.229166666668),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 10:30:00.000000 +0500 X",
  )
  assert_eq(
    formatter.format_value(20030.229166666668),
    "2024-11-03 10:30:00.000000 +0500 X",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.229166666668, tz="X-5"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 10:30:00.000000 +0500 X",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.270833333332),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 11:30:00.000000 +0500 X",
  )
  assert_eq(
    formatter.format_value(20030.270833333332),
    "2024-11-03 11:30:00.000000 +0500 X",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.270833333332, tz="X-5"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 11:30:00.000000 +0500 X",
  )
  assert_eq(
    @date.format_date(@date.num2date(25018.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2038-07-01 05:00:00.000000 +0500 X",
  )
  assert_eq(
    formatter.format_value(25018.0),
    "2038-07-01 05:00:00.000000 +0500 X",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(25018.0, tz="X-5"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2038-07-01 05:00:00.000000 +0500 X",
  )
  assert_eq(
    @date.format_date(@date.num2date(157236.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2400-07-01 05:00:00.000000 +0500 X",
  )
  assert_eq(
    formatter.format_value(157236.0),
    "2400-07-01 05:00:00.000000 +0500 X",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(157236.0, tz="X-5"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2400-07-01 05:00:00.000000 +0500 X",
  )
  assert_eq(
    @date.format_date(@date.num2date(2932713.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "9999-07-01 05:00:00.000000 +0500 X",
  )
  assert_eq(
    formatter.format_value(2932713.0),
    "9999-07-01 05:00:00.000000 +0500 X",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(2932713.0, tz="X-5"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "9999-07-01 05:00:00.000000 +0500 X",
  )
}

///|
test "timezone original conversion GMT+05:45" {
  let previous = @config.timezone()
  defer @config.set_timezone(previous)
  @config.set_timezone("GMT+05:45")
  let formatter = @date.date_formatter("%Y-%m-%d %H:%M:%S.%f %z %Z")
  assert_eq(
    @date.format_date(@date.num2date(-719161.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "0001-01-02 05:45:00.000000 +0545 GMT",
  )
  assert_eq(
    formatter.format_value(-719161.0),
    "0001-01-02 05:45:00.000000 +0545 GMT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(-719161.0, tz="GMT+05:45"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "0001-01-02 05:45:00.000000 +0545 GMT",
  )
  assert_eq(
    @date.format_date(@date.num2date(-62090.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1800-01-02 05:45:00.000000 +0545 GMT",
  )
  assert_eq(
    formatter.format_value(-62090.0),
    "1800-01-02 05:45:00.000000 +0545 GMT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(-62090.0, tz="GMT+05:45"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "1800-01-02 05:45:00.000000 +0545 GMT",
  )
  assert_eq(
    @date.format_date(@date.num2date(-25566.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1900-01-02 05:45:00.000000 +0545 GMT",
  )
  assert_eq(
    formatter.format_value(-25566.0),
    "1900-01-02 05:45:00.000000 +0545 GMT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(-25566.0, tz="GMT+05:45"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "1900-01-02 05:45:00.000000 +0545 GMT",
  )
  assert_eq(
    @date.format_date(@date.num2date(0.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1970-01-01 05:45:00.000000 +0545 GMT",
  )
  assert_eq(formatter.format_value(0.0), "1970-01-01 05:45:00.000000 +0545 GMT")
  assert_eq(
    @date.format_date(
      @date.num2date(0.0, tz="GMT+05:45"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "1970-01-01 05:45:00.000000 +0545 GMT",
  )
  assert_eq(
    @date.format_date(@date.num2date(19417.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2023-03-01 05:45:00.000000 +0545 GMT",
  )
  assert_eq(
    formatter.format_value(19417.0),
    "2023-03-01 05:45:00.000000 +0545 GMT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19417.0, tz="GMT+05:45"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2023-03-01 05:45:00.000000 +0545 GMT",
  )
  assert_eq(
    @date.format_date(@date.num2date(19781.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-02-28 05:45:00.000000 +0545 GMT",
  )
  assert_eq(
    formatter.format_value(19781.0),
    "2024-02-28 05:45:00.000000 +0545 GMT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19781.0, tz="GMT+05:45"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-02-28 05:45:00.000000 +0545 GMT",
  )
  assert_eq(
    @date.format_date(@date.num2date(19782.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-02-29 05:45:00.000000 +0545 GMT",
  )
  assert_eq(
    formatter.format_value(19782.0),
    "2024-02-29 05:45:00.000000 +0545 GMT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19782.0, tz="GMT+05:45"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-02-29 05:45:00.000000 +0545 GMT",
  )
  assert_eq(
    @date.format_date(@date.num2date(19783.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-03-01 05:45:00.000000 +0545 GMT",
  )
  assert_eq(
    formatter.format_value(19783.0),
    "2024-03-01 05:45:00.000000 +0545 GMT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19783.0, tz="GMT+05:45"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-01 05:45:00.000000 +0545 GMT",
  )
  assert_eq(
    @date.format_date(@date.num2date(19723.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-01-01 05:45:00.000000 +0545 GMT",
  )
  assert_eq(
    formatter.format_value(19723.0),
    "2024-01-01 05:45:00.000000 +0545 GMT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19723.0, tz="GMT+05:45"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-01-01 05:45:00.000000 +0545 GMT",
  )
  assert_eq(
    @date.format_date(@date.num2date(19905.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-07-01 05:45:00.000000 +0545 GMT",
  )
  assert_eq(
    formatter.format_value(19905.0),
    "2024-07-01 05:45:00.000000 +0545 GMT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19905.0, tz="GMT+05:45"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-07-01 05:45:00.000000 +0545 GMT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666657),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 12:44:59.999999 +0545 GMT",
  )
  assert_eq(
    formatter.format_value(19792.291666666657),
    "2024-03-10 12:44:59.999999 +0545 GMT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666657, tz="GMT+05:45"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 12:44:59.999999 +0545 GMT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666668),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 12:45:00.000000 +0545 GMT",
  )
  assert_eq(
    formatter.format_value(19792.291666666668),
    "2024-03-10 12:45:00.000000 +0545 GMT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666668, tz="GMT+05:45"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 12:45:00.000000 +0545 GMT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.229166666668),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 11:15:00.000000 +0545 GMT",
  )
  assert_eq(
    formatter.format_value(20030.229166666668),
    "2024-11-03 11:15:00.000000 +0545 GMT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.229166666668, tz="GMT+05:45"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 11:15:00.000000 +0545 GMT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.270833333332),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 12:15:00.000000 +0545 GMT",
  )
  assert_eq(
    formatter.format_value(20030.270833333332),
    "2024-11-03 12:15:00.000000 +0545 GMT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.270833333332, tz="GMT+05:45"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 12:15:00.000000 +0545 GMT",
  )
  assert_eq(
    @date.format_date(@date.num2date(25018.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2038-07-01 05:45:00.000000 +0545 GMT",
  )
  assert_eq(
    formatter.format_value(25018.0),
    "2038-07-01 05:45:00.000000 +0545 GMT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(25018.0, tz="GMT+05:45"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2038-07-01 05:45:00.000000 +0545 GMT",
  )
  assert_eq(
    @date.format_date(@date.num2date(157236.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2400-07-01 05:45:00.000000 +0545 GMT",
  )
  assert_eq(
    formatter.format_value(157236.0),
    "2400-07-01 05:45:00.000000 +0545 GMT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(157236.0, tz="GMT+05:45"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2400-07-01 05:45:00.000000 +0545 GMT",
  )
  assert_eq(
    @date.format_date(@date.num2date(2932713.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "9999-07-01 05:45:00.000000 +0545 GMT",
  )
  assert_eq(
    formatter.format_value(2932713.0),
    "9999-07-01 05:45:00.000000 +0545 GMT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(2932713.0, tz="GMT+05:45"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "9999-07-01 05:45:00.000000 +0545 GMT",
  )
}

///|
test "timezone original conversion UTC-03:30" {
  let previous = @config.timezone()
  defer @config.set_timezone(previous)
  @config.set_timezone("UTC-03:30")
  let formatter = @date.date_formatter("%Y-%m-%d %H:%M:%S.%f %z %Z")
  assert_eq(
    @date.format_date(@date.num2date(-719161.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "0001-01-01 20:30:00.000000 -0330 UTC",
  )
  assert_eq(
    formatter.format_value(-719161.0),
    "0001-01-01 20:30:00.000000 -0330 UTC",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(-719161.0, tz="UTC-03:30"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "0001-01-01 20:30:00.000000 -0330 UTC",
  )
  assert_eq(
    @date.format_date(@date.num2date(-62090.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1800-01-01 20:30:00.000000 -0330 UTC",
  )
  assert_eq(
    formatter.format_value(-62090.0),
    "1800-01-01 20:30:00.000000 -0330 UTC",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(-62090.0, tz="UTC-03:30"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "1800-01-01 20:30:00.000000 -0330 UTC",
  )
  assert_eq(
    @date.format_date(@date.num2date(-25566.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1900-01-01 20:30:00.000000 -0330 UTC",
  )
  assert_eq(
    formatter.format_value(-25566.0),
    "1900-01-01 20:30:00.000000 -0330 UTC",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(-25566.0, tz="UTC-03:30"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "1900-01-01 20:30:00.000000 -0330 UTC",
  )
  assert_eq(
    @date.format_date(@date.num2date(0.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1969-12-31 20:30:00.000000 -0330 UTC",
  )
  assert_eq(formatter.format_value(0.0), "1969-12-31 20:30:00.000000 -0330 UTC")
  assert_eq(
    @date.format_date(
      @date.num2date(0.0, tz="UTC-03:30"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "1969-12-31 20:30:00.000000 -0330 UTC",
  )
  assert_eq(
    @date.format_date(@date.num2date(19417.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2023-02-28 20:30:00.000000 -0330 UTC",
  )
  assert_eq(
    formatter.format_value(19417.0),
    "2023-02-28 20:30:00.000000 -0330 UTC",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19417.0, tz="UTC-03:30"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2023-02-28 20:30:00.000000 -0330 UTC",
  )
  assert_eq(
    @date.format_date(@date.num2date(19781.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-02-27 20:30:00.000000 -0330 UTC",
  )
  assert_eq(
    formatter.format_value(19781.0),
    "2024-02-27 20:30:00.000000 -0330 UTC",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19781.0, tz="UTC-03:30"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-02-27 20:30:00.000000 -0330 UTC",
  )
  assert_eq(
    @date.format_date(@date.num2date(19782.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-02-28 20:30:00.000000 -0330 UTC",
  )
  assert_eq(
    formatter.format_value(19782.0),
    "2024-02-28 20:30:00.000000 -0330 UTC",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19782.0, tz="UTC-03:30"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-02-28 20:30:00.000000 -0330 UTC",
  )
  assert_eq(
    @date.format_date(@date.num2date(19783.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-02-29 20:30:00.000000 -0330 UTC",
  )
  assert_eq(
    formatter.format_value(19783.0),
    "2024-02-29 20:30:00.000000 -0330 UTC",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19783.0, tz="UTC-03:30"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-02-29 20:30:00.000000 -0330 UTC",
  )
  assert_eq(
    @date.format_date(@date.num2date(19723.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2023-12-31 20:30:00.000000 -0330 UTC",
  )
  assert_eq(
    formatter.format_value(19723.0),
    "2023-12-31 20:30:00.000000 -0330 UTC",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19723.0, tz="UTC-03:30"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2023-12-31 20:30:00.000000 -0330 UTC",
  )
  assert_eq(
    @date.format_date(@date.num2date(19905.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-06-30 20:30:00.000000 -0330 UTC",
  )
  assert_eq(
    formatter.format_value(19905.0),
    "2024-06-30 20:30:00.000000 -0330 UTC",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19905.0, tz="UTC-03:30"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-06-30 20:30:00.000000 -0330 UTC",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666657),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 03:29:59.999999 -0330 UTC",
  )
  assert_eq(
    formatter.format_value(19792.291666666657),
    "2024-03-10 03:29:59.999999 -0330 UTC",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666657, tz="UTC-03:30"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 03:29:59.999999 -0330 UTC",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666668),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 03:30:00.000000 -0330 UTC",
  )
  assert_eq(
    formatter.format_value(19792.291666666668),
    "2024-03-10 03:30:00.000000 -0330 UTC",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666668, tz="UTC-03:30"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 03:30:00.000000 -0330 UTC",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.229166666668),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 02:00:00.000000 -0330 UTC",
  )
  assert_eq(
    formatter.format_value(20030.229166666668),
    "2024-11-03 02:00:00.000000 -0330 UTC",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.229166666668, tz="UTC-03:30"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 02:00:00.000000 -0330 UTC",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.270833333332),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 03:00:00.000000 -0330 UTC",
  )
  assert_eq(
    formatter.format_value(20030.270833333332),
    "2024-11-03 03:00:00.000000 -0330 UTC",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.270833333332, tz="UTC-03:30"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 03:00:00.000000 -0330 UTC",
  )
  assert_eq(
    @date.format_date(@date.num2date(25018.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2038-06-30 20:30:00.000000 -0330 UTC",
  )
  assert_eq(
    formatter.format_value(25018.0),
    "2038-06-30 20:30:00.000000 -0330 UTC",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(25018.0, tz="UTC-03:30"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2038-06-30 20:30:00.000000 -0330 UTC",
  )
  assert_eq(
    @date.format_date(@date.num2date(157236.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2400-06-30 20:30:00.000000 -0330 UTC",
  )
  assert_eq(
    formatter.format_value(157236.0),
    "2400-06-30 20:30:00.000000 -0330 UTC",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(157236.0, tz="UTC-03:30"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2400-06-30 20:30:00.000000 -0330 UTC",
  )
  assert_eq(
    @date.format_date(@date.num2date(2932713.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "9999-06-30 20:30:00.000000 -0330 UTC",
  )
  assert_eq(
    formatter.format_value(2932713.0),
    "9999-06-30 20:30:00.000000 -0330 UTC",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(2932713.0, tz="UTC-03:30"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "9999-06-30 20:30:00.000000 -0330 UTC",
  )
}

///|
test "timezone original conversion XST5XDT" {
  let previous = @config.timezone()
  defer @config.set_timezone(previous)
  @config.set_timezone("XST5XDT")
  let formatter = @date.date_formatter("%Y-%m-%d %H:%M:%S.%f %z %Z")
  assert_eq(
    @date.format_date(@date.num2date(-719161.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "0001-01-01 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    formatter.format_value(-719161.0),
    "0001-01-01 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(-719161.0, tz="XST5XDT"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "0001-01-01 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(-62090.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1800-01-01 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    formatter.format_value(-62090.0),
    "1800-01-01 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(-62090.0, tz="XST5XDT"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "1800-01-01 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(-25566.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1900-01-01 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    formatter.format_value(-25566.0),
    "1900-01-01 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(-25566.0, tz="XST5XDT"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "1900-01-01 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(0.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1969-12-31 19:00:00.000000 -0500 XST",
  )
  assert_eq(formatter.format_value(0.0), "1969-12-31 19:00:00.000000 -0500 XST")
  assert_eq(
    @date.format_date(
      @date.num2date(0.0, tz="XST5XDT"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "1969-12-31 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(19417.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2023-02-28 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    formatter.format_value(19417.0),
    "2023-02-28 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19417.0, tz="XST5XDT"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2023-02-28 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(19781.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-02-27 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    formatter.format_value(19781.0),
    "2024-02-27 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19781.0, tz="XST5XDT"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-02-27 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(19782.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-02-28 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    formatter.format_value(19782.0),
    "2024-02-28 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19782.0, tz="XST5XDT"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-02-28 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(19783.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-02-29 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    formatter.format_value(19783.0),
    "2024-02-29 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19783.0, tz="XST5XDT"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-02-29 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(19723.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2023-12-31 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    formatter.format_value(19723.0),
    "2023-12-31 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19723.0, tz="XST5XDT"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2023-12-31 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(19905.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-06-30 20:00:00.000000 -0400 XDT",
  )
  assert_eq(
    formatter.format_value(19905.0),
    "2024-06-30 20:00:00.000000 -0400 XDT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19905.0, tz="XST5XDT"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-06-30 20:00:00.000000 -0400 XDT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666657),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 01:59:59.999999 -0500 XST",
  )
  assert_eq(
    formatter.format_value(19792.291666666657),
    "2024-03-10 01:59:59.999999 -0500 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666657, tz="XST5XDT"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 01:59:59.999999 -0500 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666668),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 02:00:00.000000 -0500 XST",
  )
  assert_eq(
    formatter.format_value(19792.291666666668),
    "2024-03-10 02:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666668, tz="XST5XDT"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 02:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.229166666668),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 00:30:00.000000 -0500 XST",
  )
  assert_eq(
    formatter.format_value(20030.229166666668),
    "2024-11-03 00:30:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.229166666668, tz="XST5XDT"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 00:30:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.270833333332),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 01:30:00.000000 -0500 XST",
  )
  assert_eq(
    formatter.format_value(20030.270833333332),
    "2024-11-03 01:30:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.270833333332, tz="XST5XDT"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 01:30:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(25018.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2038-06-30 20:00:00.000000 -0400 XDT",
  )
  assert_eq(
    formatter.format_value(25018.0),
    "2038-06-30 20:00:00.000000 -0400 XDT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(25018.0, tz="XST5XDT"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2038-06-30 20:00:00.000000 -0400 XDT",
  )
  assert_eq(
    @date.format_date(@date.num2date(157236.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2400-06-30 20:00:00.000000 -0400 XDT",
  )
  assert_eq(
    formatter.format_value(157236.0),
    "2400-06-30 20:00:00.000000 -0400 XDT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(157236.0, tz="XST5XDT"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2400-06-30 20:00:00.000000 -0400 XDT",
  )
  assert_eq(
    @date.format_date(@date.num2date(2932713.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "9999-06-30 20:00:00.000000 -0400 XDT",
  )
  assert_eq(
    formatter.format_value(2932713.0),
    "9999-06-30 20:00:00.000000 -0400 XDT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(2932713.0, tz="XST5XDT"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "9999-06-30 20:00:00.000000 -0400 XDT",
  )
}

///|
test "timezone original conversion EST5EDT,M3.2.0/2,M11.1.0/2" {
  let previous = @config.timezone()
  defer @config.set_timezone(previous)
  @config.set_timezone("EST5EDT,M3.2.0/2,M11.1.0/2")
  let formatter = @date.date_formatter("%Y-%m-%d %H:%M:%S.%f %z %Z")
  assert_eq(
    @date.format_date(@date.num2date(-719161.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "0001-01-01 19:00:00.000000 -0500 EST",
  )
  assert_eq(
    formatter.format_value(-719161.0),
    "0001-01-01 19:00:00.000000 -0500 EST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(-719161.0, tz="EST5EDT,M3.2.0/2,M11.1.0/2"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "0001-01-01 19:00:00.000000 -0500 EST",
  )
  assert_eq(
    @date.format_date(@date.num2date(-62090.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1800-01-01 19:00:00.000000 -0500 EST",
  )
  assert_eq(
    formatter.format_value(-62090.0),
    "1800-01-01 19:00:00.000000 -0500 EST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(-62090.0, tz="EST5EDT,M3.2.0/2,M11.1.0/2"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "1800-01-01 19:00:00.000000 -0500 EST",
  )
  assert_eq(
    @date.format_date(@date.num2date(-25566.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1900-01-01 19:00:00.000000 -0500 EST",
  )
  assert_eq(
    formatter.format_value(-25566.0),
    "1900-01-01 19:00:00.000000 -0500 EST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(-25566.0, tz="EST5EDT,M3.2.0/2,M11.1.0/2"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "1900-01-01 19:00:00.000000 -0500 EST",
  )
  assert_eq(
    @date.format_date(@date.num2date(0.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1969-12-31 19:00:00.000000 -0500 EST",
  )
  assert_eq(formatter.format_value(0.0), "1969-12-31 19:00:00.000000 -0500 EST")
  assert_eq(
    @date.format_date(
      @date.num2date(0.0, tz="EST5EDT,M3.2.0/2,M11.1.0/2"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "1969-12-31 19:00:00.000000 -0500 EST",
  )
  assert_eq(
    @date.format_date(@date.num2date(19417.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2023-02-28 19:00:00.000000 -0500 EST",
  )
  assert_eq(
    formatter.format_value(19417.0),
    "2023-02-28 19:00:00.000000 -0500 EST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19417.0, tz="EST5EDT,M3.2.0/2,M11.1.0/2"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2023-02-28 19:00:00.000000 -0500 EST",
  )
  assert_eq(
    @date.format_date(@date.num2date(19781.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-02-27 19:00:00.000000 -0500 EST",
  )
  assert_eq(
    formatter.format_value(19781.0),
    "2024-02-27 19:00:00.000000 -0500 EST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19781.0, tz="EST5EDT,M3.2.0/2,M11.1.0/2"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-02-27 19:00:00.000000 -0500 EST",
  )
  assert_eq(
    @date.format_date(@date.num2date(19782.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-02-28 19:00:00.000000 -0500 EST",
  )
  assert_eq(
    formatter.format_value(19782.0),
    "2024-02-28 19:00:00.000000 -0500 EST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19782.0, tz="EST5EDT,M3.2.0/2,M11.1.0/2"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-02-28 19:00:00.000000 -0500 EST",
  )
  assert_eq(
    @date.format_date(@date.num2date(19783.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-02-29 19:00:00.000000 -0500 EST",
  )
  assert_eq(
    formatter.format_value(19783.0),
    "2024-02-29 19:00:00.000000 -0500 EST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19783.0, tz="EST5EDT,M3.2.0/2,M11.1.0/2"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-02-29 19:00:00.000000 -0500 EST",
  )
  assert_eq(
    @date.format_date(@date.num2date(19723.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2023-12-31 19:00:00.000000 -0500 EST",
  )
  assert_eq(
    formatter.format_value(19723.0),
    "2023-12-31 19:00:00.000000 -0500 EST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19723.0, tz="EST5EDT,M3.2.0/2,M11.1.0/2"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2023-12-31 19:00:00.000000 -0500 EST",
  )
  assert_eq(
    @date.format_date(@date.num2date(19905.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-06-30 20:00:00.000000 -0400 EDT",
  )
  assert_eq(
    formatter.format_value(19905.0),
    "2024-06-30 20:00:00.000000 -0400 EDT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19905.0, tz="EST5EDT,M3.2.0/2,M11.1.0/2"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-06-30 20:00:00.000000 -0400 EDT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666657),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 01:59:59.999999 -0500 EST",
  )
  assert_eq(
    formatter.format_value(19792.291666666657),
    "2024-03-10 01:59:59.999999 -0500 EST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666657, tz="EST5EDT,M3.2.0/2,M11.1.0/2"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 01:59:59.999999 -0500 EST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666668),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 03:00:00.000000 -0400 EDT",
  )
  assert_eq(
    formatter.format_value(19792.291666666668),
    "2024-03-10 03:00:00.000000 -0400 EDT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666668, tz="EST5EDT,M3.2.0/2,M11.1.0/2"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 03:00:00.000000 -0400 EDT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.229166666668),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 01:30:00.000000 -0400 EDT",
  )
  assert_eq(
    formatter.format_value(20030.229166666668),
    "2024-11-03 01:30:00.000000 -0400 EDT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.229166666668, tz="EST5EDT,M3.2.0/2,M11.1.0/2"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 01:30:00.000000 -0400 EDT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.270833333332),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 01:30:00.000000 -0500 EST",
  )
  assert_eq(
    formatter.format_value(20030.270833333332),
    "2024-11-03 01:30:00.000000 -0500 EST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.270833333332, tz="EST5EDT,M3.2.0/2,M11.1.0/2"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 01:30:00.000000 -0500 EST",
  )
  assert_eq(
    @date.format_date(@date.num2date(25018.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2038-06-30 20:00:00.000000 -0400 EDT",
  )
  assert_eq(
    formatter.format_value(25018.0),
    "2038-06-30 20:00:00.000000 -0400 EDT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(25018.0, tz="EST5EDT,M3.2.0/2,M11.1.0/2"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2038-06-30 20:00:00.000000 -0400 EDT",
  )
  assert_eq(
    @date.format_date(@date.num2date(157236.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2400-06-30 20:00:00.000000 -0400 EDT",
  )
  assert_eq(
    formatter.format_value(157236.0),
    "2400-06-30 20:00:00.000000 -0400 EDT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(157236.0, tz="EST5EDT,M3.2.0/2,M11.1.0/2"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2400-06-30 20:00:00.000000 -0400 EDT",
  )
  assert_eq(
    @date.format_date(@date.num2date(2932713.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "9999-06-30 20:00:00.000000 -0400 EDT",
  )
  assert_eq(
    formatter.format_value(2932713.0),
    "9999-06-30 20:00:00.000000 -0400 EDT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(2932713.0, tz="EST5EDT,M3.2.0/2,M11.1.0/2"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "9999-06-30 20:00:00.000000 -0400 EDT",
  )
}

///|
test "timezone original conversion LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2" {
  let previous = @config.timezone()
  defer @config.set_timezone(previous)
  @config.set_timezone("LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2")
  let formatter = @date.date_formatter("%Y-%m-%d %H:%M:%S.%f %z %Z")
  assert_eq(
    @date.format_date(@date.num2date(-719161.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "0001-01-02 11:00:00.000000 +1100 LHDT",
  )
  assert_eq(
    formatter.format_value(-719161.0),
    "0001-01-02 11:00:00.000000 +1100 LHDT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(-719161.0, tz="LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "0001-01-02 11:00:00.000000 +1100 LHDT",
  )
  assert_eq(
    @date.format_date(@date.num2date(-62090.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1800-01-02 11:00:00.000000 +1100 LHDT",
  )
  assert_eq(
    formatter.format_value(-62090.0),
    "1800-01-02 11:00:00.000000 +1100 LHDT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(-62090.0, tz="LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "1800-01-02 11:00:00.000000 +1100 LHDT",
  )
  assert_eq(
    @date.format_date(@date.num2date(-25566.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1900-01-02 11:00:00.000000 +1100 LHDT",
  )
  assert_eq(
    formatter.format_value(-25566.0),
    "1900-01-02 11:00:00.000000 +1100 LHDT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(-25566.0, tz="LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "1900-01-02 11:00:00.000000 +1100 LHDT",
  )
  assert_eq(
    @date.format_date(@date.num2date(0.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1970-01-01 11:00:00.000000 +1100 LHDT",
  )
  assert_eq(
    formatter.format_value(0.0),
    "1970-01-01 11:00:00.000000 +1100 LHDT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(0.0, tz="LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "1970-01-01 11:00:00.000000 +1100 LHDT",
  )
  assert_eq(
    @date.format_date(@date.num2date(19417.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2023-03-01 11:00:00.000000 +1100 LHDT",
  )
  assert_eq(
    formatter.format_value(19417.0),
    "2023-03-01 11:00:00.000000 +1100 LHDT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19417.0, tz="LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2023-03-01 11:00:00.000000 +1100 LHDT",
  )
  assert_eq(
    @date.format_date(@date.num2date(19781.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-02-28 11:00:00.000000 +1100 LHDT",
  )
  assert_eq(
    formatter.format_value(19781.0),
    "2024-02-28 11:00:00.000000 +1100 LHDT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19781.0, tz="LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-02-28 11:00:00.000000 +1100 LHDT",
  )
  assert_eq(
    @date.format_date(@date.num2date(19782.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-02-29 11:00:00.000000 +1100 LHDT",
  )
  assert_eq(
    formatter.format_value(19782.0),
    "2024-02-29 11:00:00.000000 +1100 LHDT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19782.0, tz="LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-02-29 11:00:00.000000 +1100 LHDT",
  )
  assert_eq(
    @date.format_date(@date.num2date(19783.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-03-01 11:00:00.000000 +1100 LHDT",
  )
  assert_eq(
    formatter.format_value(19783.0),
    "2024-03-01 11:00:00.000000 +1100 LHDT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19783.0, tz="LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-01 11:00:00.000000 +1100 LHDT",
  )
  assert_eq(
    @date.format_date(@date.num2date(19723.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-01-01 11:00:00.000000 +1100 LHDT",
  )
  assert_eq(
    formatter.format_value(19723.0),
    "2024-01-01 11:00:00.000000 +1100 LHDT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19723.0, tz="LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-01-01 11:00:00.000000 +1100 LHDT",
  )
  assert_eq(
    @date.format_date(@date.num2date(19905.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-07-01 10:30:00.000000 +1030 LHST",
  )
  assert_eq(
    formatter.format_value(19905.0),
    "2024-07-01 10:30:00.000000 +1030 LHST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19905.0, tz="LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-07-01 10:30:00.000000 +1030 LHST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666657),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 17:59:59.999999 +1100 LHDT",
  )
  assert_eq(
    formatter.format_value(19792.291666666657),
    "2024-03-10 17:59:59.999999 +1100 LHDT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(
        19792.291666666657,
        tz="LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2",
      ),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 17:59:59.999999 +1100 LHDT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666668),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 18:00:00.000000 +1100 LHDT",
  )
  assert_eq(
    formatter.format_value(19792.291666666668),
    "2024-03-10 18:00:00.000000 +1100 LHDT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(
        19792.291666666668,
        tz="LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2",
      ),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 18:00:00.000000 +1100 LHDT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.229166666668),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 16:30:00.000000 +1100 LHDT",
  )
  assert_eq(
    formatter.format_value(20030.229166666668),
    "2024-11-03 16:30:00.000000 +1100 LHDT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(
        20030.229166666668,
        tz="LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2",
      ),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 16:30:00.000000 +1100 LHDT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.270833333332),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 17:30:00.000000 +1100 LHDT",
  )
  assert_eq(
    formatter.format_value(20030.270833333332),
    "2024-11-03 17:30:00.000000 +1100 LHDT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(
        20030.270833333332,
        tz="LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2",
      ),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 17:30:00.000000 +1100 LHDT",
  )
  assert_eq(
    @date.format_date(@date.num2date(25018.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2038-07-01 10:30:00.000000 +1030 LHST",
  )
  assert_eq(
    formatter.format_value(25018.0),
    "2038-07-01 10:30:00.000000 +1030 LHST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(25018.0, tz="LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2038-07-01 10:30:00.000000 +1030 LHST",
  )
  assert_eq(
    @date.format_date(@date.num2date(157236.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2400-07-01 10:30:00.000000 +1030 LHST",
  )
  assert_eq(
    formatter.format_value(157236.0),
    "2400-07-01 10:30:00.000000 +1030 LHST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(157236.0, tz="LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2400-07-01 10:30:00.000000 +1030 LHST",
  )
  assert_eq(
    @date.format_date(@date.num2date(2932713.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "9999-07-01 10:30:00.000000 +1030 LHST",
  )
  assert_eq(
    formatter.format_value(2932713.0),
    "9999-07-01 10:30:00.000000 +1030 LHST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(2932713.0, tz="LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "9999-07-01 10:30:00.000000 +1030 LHST",
  )
}

///|
test "timezone original conversion IST-1GMT0,M10.5.0/2,M3.5.0/1" {
  let previous = @config.timezone()
  defer @config.set_timezone(previous)
  @config.set_timezone("IST-1GMT0,M10.5.0/2,M3.5.0/1")
  let formatter = @date.date_formatter("%Y-%m-%d %H:%M:%S.%f %z %Z")
  assert_eq(
    @date.format_date(@date.num2date(-719161.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "0001-01-02 00:00:00.000000 +0000 GMT",
  )
  assert_eq(
    formatter.format_value(-719161.0),
    "0001-01-02 00:00:00.000000 +0000 GMT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(-719161.0, tz="IST-1GMT0,M10.5.0/2,M3.5.0/1"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "0001-01-02 00:00:00.000000 +0000 GMT",
  )
  assert_eq(
    @date.format_date(@date.num2date(-62090.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1800-01-02 00:00:00.000000 +0000 GMT",
  )
  assert_eq(
    formatter.format_value(-62090.0),
    "1800-01-02 00:00:00.000000 +0000 GMT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(-62090.0, tz="IST-1GMT0,M10.5.0/2,M3.5.0/1"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "1800-01-02 00:00:00.000000 +0000 GMT",
  )
  assert_eq(
    @date.format_date(@date.num2date(-25566.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1900-01-02 00:00:00.000000 +0000 GMT",
  )
  assert_eq(
    formatter.format_value(-25566.0),
    "1900-01-02 00:00:00.000000 +0000 GMT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(-25566.0, tz="IST-1GMT0,M10.5.0/2,M3.5.0/1"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "1900-01-02 00:00:00.000000 +0000 GMT",
  )
  assert_eq(
    @date.format_date(@date.num2date(0.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1970-01-01 00:00:00.000000 +0000 GMT",
  )
  assert_eq(formatter.format_value(0.0), "1970-01-01 00:00:00.000000 +0000 GMT")
  assert_eq(
    @date.format_date(
      @date.num2date(0.0, tz="IST-1GMT0,M10.5.0/2,M3.5.0/1"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "1970-01-01 00:00:00.000000 +0000 GMT",
  )
  assert_eq(
    @date.format_date(@date.num2date(19417.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2023-03-01 00:00:00.000000 +0000 GMT",
  )
  assert_eq(
    formatter.format_value(19417.0),
    "2023-03-01 00:00:00.000000 +0000 GMT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19417.0, tz="IST-1GMT0,M10.5.0/2,M3.5.0/1"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2023-03-01 00:00:00.000000 +0000 GMT",
  )
  assert_eq(
    @date.format_date(@date.num2date(19781.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-02-28 00:00:00.000000 +0000 GMT",
  )
  assert_eq(
    formatter.format_value(19781.0),
    "2024-02-28 00:00:00.000000 +0000 GMT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19781.0, tz="IST-1GMT0,M10.5.0/2,M3.5.0/1"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-02-28 00:00:00.000000 +0000 GMT",
  )
  assert_eq(
    @date.format_date(@date.num2date(19782.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-02-29 00:00:00.000000 +0000 GMT",
  )
  assert_eq(
    formatter.format_value(19782.0),
    "2024-02-29 00:00:00.000000 +0000 GMT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19782.0, tz="IST-1GMT0,M10.5.0/2,M3.5.0/1"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-02-29 00:00:00.000000 +0000 GMT",
  )
  assert_eq(
    @date.format_date(@date.num2date(19783.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-03-01 00:00:00.000000 +0000 GMT",
  )
  assert_eq(
    formatter.format_value(19783.0),
    "2024-03-01 00:00:00.000000 +0000 GMT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19783.0, tz="IST-1GMT0,M10.5.0/2,M3.5.0/1"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-01 00:00:00.000000 +0000 GMT",
  )
  assert_eq(
    @date.format_date(@date.num2date(19723.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-01-01 00:00:00.000000 +0000 GMT",
  )
  assert_eq(
    formatter.format_value(19723.0),
    "2024-01-01 00:00:00.000000 +0000 GMT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19723.0, tz="IST-1GMT0,M10.5.0/2,M3.5.0/1"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-01-01 00:00:00.000000 +0000 GMT",
  )
  assert_eq(
    @date.format_date(@date.num2date(19905.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-07-01 01:00:00.000000 +0100 IST",
  )
  assert_eq(
    formatter.format_value(19905.0),
    "2024-07-01 01:00:00.000000 +0100 IST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19905.0, tz="IST-1GMT0,M10.5.0/2,M3.5.0/1"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-07-01 01:00:00.000000 +0100 IST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666657),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 06:59:59.999999 +0000 GMT",
  )
  assert_eq(
    formatter.format_value(19792.291666666657),
    "2024-03-10 06:59:59.999999 +0000 GMT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666657, tz="IST-1GMT0,M10.5.0/2,M3.5.0/1"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 06:59:59.999999 +0000 GMT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666668),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 07:00:00.000000 +0000 GMT",
  )
  assert_eq(
    formatter.format_value(19792.291666666668),
    "2024-03-10 07:00:00.000000 +0000 GMT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666668, tz="IST-1GMT0,M10.5.0/2,M3.5.0/1"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 07:00:00.000000 +0000 GMT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.229166666668),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 05:30:00.000000 +0000 GMT",
  )
  assert_eq(
    formatter.format_value(20030.229166666668),
    "2024-11-03 05:30:00.000000 +0000 GMT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.229166666668, tz="IST-1GMT0,M10.5.0/2,M3.5.0/1"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 05:30:00.000000 +0000 GMT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.270833333332),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 06:30:00.000000 +0000 GMT",
  )
  assert_eq(
    formatter.format_value(20030.270833333332),
    "2024-11-03 06:30:00.000000 +0000 GMT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.270833333332, tz="IST-1GMT0,M10.5.0/2,M3.5.0/1"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 06:30:00.000000 +0000 GMT",
  )
  assert_eq(
    @date.format_date(@date.num2date(25018.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2038-07-01 01:00:00.000000 +0100 IST",
  )
  assert_eq(
    formatter.format_value(25018.0),
    "2038-07-01 01:00:00.000000 +0100 IST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(25018.0, tz="IST-1GMT0,M10.5.0/2,M3.5.0/1"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2038-07-01 01:00:00.000000 +0100 IST",
  )
  assert_eq(
    @date.format_date(@date.num2date(157236.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2400-07-01 01:00:00.000000 +0100 IST",
  )
  assert_eq(
    formatter.format_value(157236.0),
    "2400-07-01 01:00:00.000000 +0100 IST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(157236.0, tz="IST-1GMT0,M10.5.0/2,M3.5.0/1"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2400-07-01 01:00:00.000000 +0100 IST",
  )
  assert_eq(
    @date.format_date(@date.num2date(2932713.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "9999-07-01 01:00:00.000000 +0100 IST",
  )
  assert_eq(
    formatter.format_value(2932713.0),
    "9999-07-01 01:00:00.000000 +0100 IST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(2932713.0, tz="IST-1GMT0,M10.5.0/2,M3.5.0/1"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "9999-07-01 01:00:00.000000 +0100 IST",
  )
}

///|
test "timezone original conversion GMT+3DST" {
  let previous = @config.timezone()
  defer @config.set_timezone(previous)
  @config.set_timezone("GMT+3DST")
  let formatter = @date.date_formatter("%Y-%m-%d %H:%M:%S.%f %z %Z")
  assert_eq(
    @date.format_date(@date.num2date(-719161.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "0001-01-02 03:00:00.000000 +0300 GMT",
  )
  assert_eq(
    formatter.format_value(-719161.0),
    "0001-01-02 03:00:00.000000 +0300 GMT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(-719161.0, tz="GMT+3DST"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "0001-01-02 03:00:00.000000 +0300 GMT",
  )
  assert_eq(
    @date.format_date(@date.num2date(-62090.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1800-01-02 03:00:00.000000 +0300 GMT",
  )
  assert_eq(
    formatter.format_value(-62090.0),
    "1800-01-02 03:00:00.000000 +0300 GMT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(-62090.0, tz="GMT+3DST"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "1800-01-02 03:00:00.000000 +0300 GMT",
  )
  assert_eq(
    @date.format_date(@date.num2date(-25566.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1900-01-02 03:00:00.000000 +0300 GMT",
  )
  assert_eq(
    formatter.format_value(-25566.0),
    "1900-01-02 03:00:00.000000 +0300 GMT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(-25566.0, tz="GMT+3DST"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "1900-01-02 03:00:00.000000 +0300 GMT",
  )
  assert_eq(
    @date.format_date(@date.num2date(0.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1970-01-01 03:00:00.000000 +0300 GMT",
  )
  assert_eq(formatter.format_value(0.0), "1970-01-01 03:00:00.000000 +0300 GMT")
  assert_eq(
    @date.format_date(
      @date.num2date(0.0, tz="GMT+3DST"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "1970-01-01 03:00:00.000000 +0300 GMT",
  )
  assert_eq(
    @date.format_date(@date.num2date(19417.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2023-03-01 03:00:00.000000 +0300 GMT",
  )
  assert_eq(
    formatter.format_value(19417.0),
    "2023-03-01 03:00:00.000000 +0300 GMT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19417.0, tz="GMT+3DST"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2023-03-01 03:00:00.000000 +0300 GMT",
  )
  assert_eq(
    @date.format_date(@date.num2date(19781.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-02-28 03:00:00.000000 +0300 GMT",
  )
  assert_eq(
    formatter.format_value(19781.0),
    "2024-02-28 03:00:00.000000 +0300 GMT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19781.0, tz="GMT+3DST"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-02-28 03:00:00.000000 +0300 GMT",
  )
  assert_eq(
    @date.format_date(@date.num2date(19782.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-02-29 03:00:00.000000 +0300 GMT",
  )
  assert_eq(
    formatter.format_value(19782.0),
    "2024-02-29 03:00:00.000000 +0300 GMT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19782.0, tz="GMT+3DST"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-02-29 03:00:00.000000 +0300 GMT",
  )
  assert_eq(
    @date.format_date(@date.num2date(19783.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-03-01 03:00:00.000000 +0300 GMT",
  )
  assert_eq(
    formatter.format_value(19783.0),
    "2024-03-01 03:00:00.000000 +0300 GMT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19783.0, tz="GMT+3DST"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-01 03:00:00.000000 +0300 GMT",
  )
  assert_eq(
    @date.format_date(@date.num2date(19723.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-01-01 03:00:00.000000 +0300 GMT",
  )
  assert_eq(
    formatter.format_value(19723.0),
    "2024-01-01 03:00:00.000000 +0300 GMT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19723.0, tz="GMT+3DST"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-01-01 03:00:00.000000 +0300 GMT",
  )
  assert_eq(
    @date.format_date(@date.num2date(19905.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-07-01 04:00:00.000000 +0400 DST",
  )
  assert_eq(
    formatter.format_value(19905.0),
    "2024-07-01 04:00:00.000000 +0400 DST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19905.0, tz="GMT+3DST"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-07-01 04:00:00.000000 +0400 DST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666657),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 09:59:59.999999 +0300 GMT",
  )
  assert_eq(
    formatter.format_value(19792.291666666657),
    "2024-03-10 09:59:59.999999 +0300 GMT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666657, tz="GMT+3DST"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 09:59:59.999999 +0300 GMT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666668),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 10:00:00.000000 +0300 GMT",
  )
  assert_eq(
    formatter.format_value(19792.291666666668),
    "2024-03-10 10:00:00.000000 +0300 GMT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666668, tz="GMT+3DST"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 10:00:00.000000 +0300 GMT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.229166666668),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 08:30:00.000000 +0300 GMT",
  )
  assert_eq(
    formatter.format_value(20030.229166666668),
    "2024-11-03 08:30:00.000000 +0300 GMT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.229166666668, tz="GMT+3DST"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 08:30:00.000000 +0300 GMT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.270833333332),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 09:30:00.000000 +0300 GMT",
  )
  assert_eq(
    formatter.format_value(20030.270833333332),
    "2024-11-03 09:30:00.000000 +0300 GMT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.270833333332, tz="GMT+3DST"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 09:30:00.000000 +0300 GMT",
  )
  assert_eq(
    @date.format_date(@date.num2date(25018.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2038-07-01 04:00:00.000000 +0400 DST",
  )
  assert_eq(
    formatter.format_value(25018.0),
    "2038-07-01 04:00:00.000000 +0400 DST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(25018.0, tz="GMT+3DST"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2038-07-01 04:00:00.000000 +0400 DST",
  )
  assert_eq(
    @date.format_date(@date.num2date(157236.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2400-07-01 04:00:00.000000 +0400 DST",
  )
  assert_eq(
    formatter.format_value(157236.0),
    "2400-07-01 04:00:00.000000 +0400 DST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(157236.0, tz="GMT+3DST"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2400-07-01 04:00:00.000000 +0400 DST",
  )
  assert_eq(
    @date.format_date(@date.num2date(2932713.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "9999-07-01 04:00:00.000000 +0400 DST",
  )
  assert_eq(
    formatter.format_value(2932713.0),
    "9999-07-01 04:00:00.000000 +0400 DST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(2932713.0, tz="GMT+3DST"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "9999-07-01 04:00:00.000000 +0400 DST",
  )
}

///|
test "timezone original conversion UTC-3DST-5,M3.2.0,M11.1.0" {
  let previous = @config.timezone()
  defer @config.set_timezone(previous)
  @config.set_timezone("UTC-3DST-5,M3.2.0,M11.1.0")
  let formatter = @date.date_formatter("%Y-%m-%d %H:%M:%S.%f %z %Z")
  assert_eq(
    @date.format_date(@date.num2date(-719161.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "0001-01-01 21:00:00.000000 -0300 UTC",
  )
  assert_eq(
    formatter.format_value(-719161.0),
    "0001-01-01 21:00:00.000000 -0300 UTC",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(-719161.0, tz="UTC-3DST-5,M3.2.0,M11.1.0"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "0001-01-01 21:00:00.000000 -0300 UTC",
  )
  assert_eq(
    @date.format_date(@date.num2date(-62090.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1800-01-01 21:00:00.000000 -0300 UTC",
  )
  assert_eq(
    formatter.format_value(-62090.0),
    "1800-01-01 21:00:00.000000 -0300 UTC",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(-62090.0, tz="UTC-3DST-5,M3.2.0,M11.1.0"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "1800-01-01 21:00:00.000000 -0300 UTC",
  )
  assert_eq(
    @date.format_date(@date.num2date(-25566.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1900-01-01 21:00:00.000000 -0300 UTC",
  )
  assert_eq(
    formatter.format_value(-25566.0),
    "1900-01-01 21:00:00.000000 -0300 UTC",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(-25566.0, tz="UTC-3DST-5,M3.2.0,M11.1.0"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "1900-01-01 21:00:00.000000 -0300 UTC",
  )
  assert_eq(
    @date.format_date(@date.num2date(0.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1969-12-31 21:00:00.000000 -0300 UTC",
  )
  assert_eq(formatter.format_value(0.0), "1969-12-31 21:00:00.000000 -0300 UTC")
  assert_eq(
    @date.format_date(
      @date.num2date(0.0, tz="UTC-3DST-5,M3.2.0,M11.1.0"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "1969-12-31 21:00:00.000000 -0300 UTC",
  )
  assert_eq(
    @date.format_date(@date.num2date(19417.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2023-02-28 21:00:00.000000 -0300 UTC",
  )
  assert_eq(
    formatter.format_value(19417.0),
    "2023-02-28 21:00:00.000000 -0300 UTC",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19417.0, tz="UTC-3DST-5,M3.2.0,M11.1.0"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2023-02-28 21:00:00.000000 -0300 UTC",
  )
  assert_eq(
    @date.format_date(@date.num2date(19781.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-02-27 21:00:00.000000 -0300 UTC",
  )
  assert_eq(
    formatter.format_value(19781.0),
    "2024-02-27 21:00:00.000000 -0300 UTC",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19781.0, tz="UTC-3DST-5,M3.2.0,M11.1.0"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-02-27 21:00:00.000000 -0300 UTC",
  )
  assert_eq(
    @date.format_date(@date.num2date(19782.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-02-28 21:00:00.000000 -0300 UTC",
  )
  assert_eq(
    formatter.format_value(19782.0),
    "2024-02-28 21:00:00.000000 -0300 UTC",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19782.0, tz="UTC-3DST-5,M3.2.0,M11.1.0"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-02-28 21:00:00.000000 -0300 UTC",
  )
  assert_eq(
    @date.format_date(@date.num2date(19783.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-02-29 21:00:00.000000 -0300 UTC",
  )
  assert_eq(
    formatter.format_value(19783.0),
    "2024-02-29 21:00:00.000000 -0300 UTC",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19783.0, tz="UTC-3DST-5,M3.2.0,M11.1.0"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-02-29 21:00:00.000000 -0300 UTC",
  )
  assert_eq(
    @date.format_date(@date.num2date(19723.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2023-12-31 21:00:00.000000 -0300 UTC",
  )
  assert_eq(
    formatter.format_value(19723.0),
    "2023-12-31 21:00:00.000000 -0300 UTC",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19723.0, tz="UTC-3DST-5,M3.2.0,M11.1.0"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2023-12-31 21:00:00.000000 -0300 UTC",
  )
  assert_eq(
    @date.format_date(@date.num2date(19905.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-07-01 05:00:00.000000 +0500 DST",
  )
  assert_eq(
    formatter.format_value(19905.0),
    "2024-07-01 05:00:00.000000 +0500 DST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19905.0, tz="UTC-3DST-5,M3.2.0,M11.1.0"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-07-01 05:00:00.000000 +0500 DST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666657),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 11:59:59.999999 +0500 DST",
  )
  assert_eq(
    formatter.format_value(19792.291666666657),
    "2024-03-10 11:59:59.999999 +0500 DST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666657, tz="UTC-3DST-5,M3.2.0,M11.1.0"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 11:59:59.999999 +0500 DST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666668),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 12:00:00.000000 +0500 DST",
  )
  assert_eq(
    formatter.format_value(19792.291666666668),
    "2024-03-10 12:00:00.000000 +0500 DST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666668, tz="UTC-3DST-5,M3.2.0,M11.1.0"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 12:00:00.000000 +0500 DST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.229166666668),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 10:30:00.000000 +0500 DST",
  )
  assert_eq(
    formatter.format_value(20030.229166666668),
    "2024-11-03 10:30:00.000000 +0500 DST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.229166666668, tz="UTC-3DST-5,M3.2.0,M11.1.0"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 10:30:00.000000 +0500 DST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.270833333332),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 11:30:00.000000 +0500 DST",
  )
  assert_eq(
    formatter.format_value(20030.270833333332),
    "2024-11-03 11:30:00.000000 +0500 DST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.270833333332, tz="UTC-3DST-5,M3.2.0,M11.1.0"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 11:30:00.000000 +0500 DST",
  )
  assert_eq(
    @date.format_date(@date.num2date(25018.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2038-07-01 05:00:00.000000 +0500 DST",
  )
  assert_eq(
    formatter.format_value(25018.0),
    "2038-07-01 05:00:00.000000 +0500 DST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(25018.0, tz="UTC-3DST-5,M3.2.0,M11.1.0"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2038-07-01 05:00:00.000000 +0500 DST",
  )
  assert_eq(
    @date.format_date(@date.num2date(157236.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2400-07-01 05:00:00.000000 +0500 DST",
  )
  assert_eq(
    formatter.format_value(157236.0),
    "2400-07-01 05:00:00.000000 +0500 DST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(157236.0, tz="UTC-3DST-5,M3.2.0,M11.1.0"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2400-07-01 05:00:00.000000 +0500 DST",
  )
  assert_eq(
    @date.format_date(@date.num2date(2932713.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "9999-07-01 05:00:00.000000 +0500 DST",
  )
  assert_eq(
    formatter.format_value(2932713.0),
    "9999-07-01 05:00:00.000000 +0500 DST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(2932713.0, tz="UTC-3DST-5,M3.2.0,M11.1.0"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "9999-07-01 05:00:00.000000 +0500 DST",
  )
}

///|
test "timezone original conversion XST5XDT,J60/0,J300/0" {
  let previous = @config.timezone()
  defer @config.set_timezone(previous)
  @config.set_timezone("XST5XDT,J60/0,J300/0")
  let formatter = @date.date_formatter("%Y-%m-%d %H:%M:%S.%f %z %Z")
  assert_eq(
    @date.format_date(@date.num2date(-719161.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "0001-01-01 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    formatter.format_value(-719161.0),
    "0001-01-01 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(-719161.0, tz="XST5XDT,J60/0,J300/0"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "0001-01-01 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(-62090.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1800-01-01 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    formatter.format_value(-62090.0),
    "1800-01-01 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(-62090.0, tz="XST5XDT,J60/0,J300/0"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "1800-01-01 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(-25566.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1900-01-01 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    formatter.format_value(-25566.0),
    "1900-01-01 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(-25566.0, tz="XST5XDT,J60/0,J300/0"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "1900-01-01 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(0.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1969-12-31 19:00:00.000000 -0500 XST",
  )
  assert_eq(formatter.format_value(0.0), "1969-12-31 19:00:00.000000 -0500 XST")
  assert_eq(
    @date.format_date(
      @date.num2date(0.0, tz="XST5XDT,J60/0,J300/0"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "1969-12-31 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(19417.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2023-02-28 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    formatter.format_value(19417.0),
    "2023-02-28 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19417.0, tz="XST5XDT,J60/0,J300/0"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2023-02-28 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(19781.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-02-27 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    formatter.format_value(19781.0),
    "2024-02-27 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19781.0, tz="XST5XDT,J60/0,J300/0"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-02-27 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(19782.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-02-28 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    formatter.format_value(19782.0),
    "2024-02-28 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19782.0, tz="XST5XDT,J60/0,J300/0"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-02-28 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(19783.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-02-29 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    formatter.format_value(19783.0),
    "2024-02-29 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19783.0, tz="XST5XDT,J60/0,J300/0"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-02-29 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(19723.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2023-12-31 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    formatter.format_value(19723.0),
    "2023-12-31 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19723.0, tz="XST5XDT,J60/0,J300/0"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2023-12-31 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(19905.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-06-30 20:00:00.000000 -0400 XDT",
  )
  assert_eq(
    formatter.format_value(19905.0),
    "2024-06-30 20:00:00.000000 -0400 XDT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19905.0, tz="XST5XDT,J60/0,J300/0"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-06-30 20:00:00.000000 -0400 XDT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666657),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 02:59:59.999999 -0400 XDT",
  )
  assert_eq(
    formatter.format_value(19792.291666666657),
    "2024-03-10 02:59:59.999999 -0400 XDT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666657, tz="XST5XDT,J60/0,J300/0"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 02:59:59.999999 -0400 XDT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666668),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 03:00:00.000000 -0400 XDT",
  )
  assert_eq(
    formatter.format_value(19792.291666666668),
    "2024-03-10 03:00:00.000000 -0400 XDT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666668, tz="XST5XDT,J60/0,J300/0"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 03:00:00.000000 -0400 XDT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.229166666668),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 00:30:00.000000 -0500 XST",
  )
  assert_eq(
    formatter.format_value(20030.229166666668),
    "2024-11-03 00:30:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.229166666668, tz="XST5XDT,J60/0,J300/0"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 00:30:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.270833333332),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 01:30:00.000000 -0500 XST",
  )
  assert_eq(
    formatter.format_value(20030.270833333332),
    "2024-11-03 01:30:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.270833333332, tz="XST5XDT,J60/0,J300/0"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 01:30:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(25018.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2038-06-30 20:00:00.000000 -0400 XDT",
  )
  assert_eq(
    formatter.format_value(25018.0),
    "2038-06-30 20:00:00.000000 -0400 XDT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(25018.0, tz="XST5XDT,J60/0,J300/0"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2038-06-30 20:00:00.000000 -0400 XDT",
  )
  assert_eq(
    @date.format_date(@date.num2date(157236.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2400-06-30 20:00:00.000000 -0400 XDT",
  )
  assert_eq(
    formatter.format_value(157236.0),
    "2400-06-30 20:00:00.000000 -0400 XDT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(157236.0, tz="XST5XDT,J60/0,J300/0"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2400-06-30 20:00:00.000000 -0400 XDT",
  )
  assert_eq(
    @date.format_date(@date.num2date(2932713.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "9999-06-30 20:00:00.000000 -0400 XDT",
  )
  assert_eq(
    formatter.format_value(2932713.0),
    "9999-06-30 20:00:00.000000 -0400 XDT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(2932713.0, tz="XST5XDT,J60/0,J300/0"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "9999-06-30 20:00:00.000000 -0400 XDT",
  )
}

///|
test "timezone original conversion XST5XDT,59/0,300/0" {
  let previous = @config.timezone()
  defer @config.set_timezone(previous)
  @config.set_timezone("XST5XDT,59/0,300/0")
  let formatter = @date.date_formatter("%Y-%m-%d %H:%M:%S.%f %z %Z")
  assert_eq(
    @date.format_date(@date.num2date(-719161.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "0001-01-01 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    formatter.format_value(-719161.0),
    "0001-01-01 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(-719161.0, tz="XST5XDT,59/0,300/0"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "0001-01-01 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(-62090.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1800-01-01 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    formatter.format_value(-62090.0),
    "1800-01-01 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(-62090.0, tz="XST5XDT,59/0,300/0"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "1800-01-01 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(-25566.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1900-01-01 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    formatter.format_value(-25566.0),
    "1900-01-01 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(-25566.0, tz="XST5XDT,59/0,300/0"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "1900-01-01 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(0.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1969-12-31 19:00:00.000000 -0500 XST",
  )
  assert_eq(formatter.format_value(0.0), "1969-12-31 19:00:00.000000 -0500 XST")
  assert_eq(
    @date.format_date(
      @date.num2date(0.0, tz="XST5XDT,59/0,300/0"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "1969-12-31 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(19417.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2023-02-28 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    formatter.format_value(19417.0),
    "2023-02-28 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19417.0, tz="XST5XDT,59/0,300/0"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2023-02-28 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(19781.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-02-27 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    formatter.format_value(19781.0),
    "2024-02-27 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19781.0, tz="XST5XDT,59/0,300/0"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-02-27 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(19782.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-02-28 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    formatter.format_value(19782.0),
    "2024-02-28 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19782.0, tz="XST5XDT,59/0,300/0"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-02-28 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(19783.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-02-29 20:00:00.000000 -0400 XDT",
  )
  assert_eq(
    formatter.format_value(19783.0),
    "2024-02-29 20:00:00.000000 -0400 XDT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19783.0, tz="XST5XDT,59/0,300/0"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-02-29 20:00:00.000000 -0400 XDT",
  )
  assert_eq(
    @date.format_date(@date.num2date(19723.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2023-12-31 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    formatter.format_value(19723.0),
    "2023-12-31 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19723.0, tz="XST5XDT,59/0,300/0"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2023-12-31 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(19905.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-06-30 20:00:00.000000 -0400 XDT",
  )
  assert_eq(
    formatter.format_value(19905.0),
    "2024-06-30 20:00:00.000000 -0400 XDT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19905.0, tz="XST5XDT,59/0,300/0"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-06-30 20:00:00.000000 -0400 XDT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666657),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 02:59:59.999999 -0400 XDT",
  )
  assert_eq(
    formatter.format_value(19792.291666666657),
    "2024-03-10 02:59:59.999999 -0400 XDT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666657, tz="XST5XDT,59/0,300/0"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 02:59:59.999999 -0400 XDT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666668),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 03:00:00.000000 -0400 XDT",
  )
  assert_eq(
    formatter.format_value(19792.291666666668),
    "2024-03-10 03:00:00.000000 -0400 XDT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666668, tz="XST5XDT,59/0,300/0"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 03:00:00.000000 -0400 XDT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.229166666668),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 00:30:00.000000 -0500 XST",
  )
  assert_eq(
    formatter.format_value(20030.229166666668),
    "2024-11-03 00:30:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.229166666668, tz="XST5XDT,59/0,300/0"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 00:30:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.270833333332),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 01:30:00.000000 -0500 XST",
  )
  assert_eq(
    formatter.format_value(20030.270833333332),
    "2024-11-03 01:30:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.270833333332, tz="XST5XDT,59/0,300/0"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 01:30:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(25018.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2038-06-30 20:00:00.000000 -0400 XDT",
  )
  assert_eq(
    formatter.format_value(25018.0),
    "2038-06-30 20:00:00.000000 -0400 XDT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(25018.0, tz="XST5XDT,59/0,300/0"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2038-06-30 20:00:00.000000 -0400 XDT",
  )
  assert_eq(
    @date.format_date(@date.num2date(157236.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2400-06-30 20:00:00.000000 -0400 XDT",
  )
  assert_eq(
    formatter.format_value(157236.0),
    "2400-06-30 20:00:00.000000 -0400 XDT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(157236.0, tz="XST5XDT,59/0,300/0"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2400-06-30 20:00:00.000000 -0400 XDT",
  )
  assert_eq(
    @date.format_date(@date.num2date(2932713.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "9999-06-30 20:00:00.000000 -0400 XDT",
  )
  assert_eq(
    formatter.format_value(2932713.0),
    "9999-06-30 20:00:00.000000 -0400 XDT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(2932713.0, tz="XST5XDT,59/0,300/0"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "9999-06-30 20:00:00.000000 -0400 XDT",
  )
}

///|
test "timezone original conversion XST5XDT,365/0,180/0" {
  let previous = @config.timezone()
  defer @config.set_timezone(previous)
  @config.set_timezone("XST5XDT,365/0,180/0")
  let formatter = @date.date_formatter("%Y-%m-%d %H:%M:%S.%f %z %Z")
  assert_eq(
    @date.format_date(@date.num2date(-719161.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "0001-01-01 20:00:00.000000 -0400 XDT",
  )
  assert_eq(
    formatter.format_value(-719161.0),
    "0001-01-01 20:00:00.000000 -0400 XDT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(-719161.0, tz="XST5XDT,365/0,180/0"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "0001-01-01 20:00:00.000000 -0400 XDT",
  )
  assert_eq(
    @date.format_date(@date.num2date(-62090.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1800-01-01 20:00:00.000000 -0400 XDT",
  )
  assert_eq(
    formatter.format_value(-62090.0),
    "1800-01-01 20:00:00.000000 -0400 XDT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(-62090.0, tz="XST5XDT,365/0,180/0"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "1800-01-01 20:00:00.000000 -0400 XDT",
  )
  assert_eq(
    @date.format_date(@date.num2date(-25566.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1900-01-01 20:00:00.000000 -0400 XDT",
  )
  assert_eq(
    formatter.format_value(-25566.0),
    "1900-01-01 20:00:00.000000 -0400 XDT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(-25566.0, tz="XST5XDT,365/0,180/0"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "1900-01-01 20:00:00.000000 -0400 XDT",
  )
  assert_eq(
    @date.format_date(@date.num2date(0.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1969-12-31 20:00:00.000000 -0400 XDT",
  )
  assert_eq(formatter.format_value(0.0), "1969-12-31 20:00:00.000000 -0400 XDT")
  assert_eq(
    @date.format_date(
      @date.num2date(0.0, tz="XST5XDT,365/0,180/0"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "1969-12-31 20:00:00.000000 -0400 XDT",
  )
  assert_eq(
    @date.format_date(@date.num2date(19417.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2023-02-28 20:00:00.000000 -0400 XDT",
  )
  assert_eq(
    formatter.format_value(19417.0),
    "2023-02-28 20:00:00.000000 -0400 XDT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19417.0, tz="XST5XDT,365/0,180/0"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2023-02-28 20:00:00.000000 -0400 XDT",
  )
  assert_eq(
    @date.format_date(@date.num2date(19781.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-02-27 20:00:00.000000 -0400 XDT",
  )
  assert_eq(
    formatter.format_value(19781.0),
    "2024-02-27 20:00:00.000000 -0400 XDT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19781.0, tz="XST5XDT,365/0,180/0"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-02-27 20:00:00.000000 -0400 XDT",
  )
  assert_eq(
    @date.format_date(@date.num2date(19782.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-02-28 20:00:00.000000 -0400 XDT",
  )
  assert_eq(
    formatter.format_value(19782.0),
    "2024-02-28 20:00:00.000000 -0400 XDT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19782.0, tz="XST5XDT,365/0,180/0"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-02-28 20:00:00.000000 -0400 XDT",
  )
  assert_eq(
    @date.format_date(@date.num2date(19783.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-02-29 20:00:00.000000 -0400 XDT",
  )
  assert_eq(
    formatter.format_value(19783.0),
    "2024-02-29 20:00:00.000000 -0400 XDT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19783.0, tz="XST5XDT,365/0,180/0"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-02-29 20:00:00.000000 -0400 XDT",
  )
  assert_eq(
    @date.format_date(@date.num2date(19723.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2023-12-31 20:00:00.000000 -0400 XDT",
  )
  assert_eq(
    formatter.format_value(19723.0),
    "2023-12-31 20:00:00.000000 -0400 XDT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19723.0, tz="XST5XDT,365/0,180/0"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2023-12-31 20:00:00.000000 -0400 XDT",
  )
  assert_eq(
    @date.format_date(@date.num2date(19905.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-06-30 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    formatter.format_value(19905.0),
    "2024-06-30 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19905.0, tz="XST5XDT,365/0,180/0"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-06-30 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666657),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 02:59:59.999999 -0400 XDT",
  )
  assert_eq(
    formatter.format_value(19792.291666666657),
    "2024-03-10 02:59:59.999999 -0400 XDT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666657, tz="XST5XDT,365/0,180/0"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 02:59:59.999999 -0400 XDT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666668),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 03:00:00.000000 -0400 XDT",
  )
  assert_eq(
    formatter.format_value(19792.291666666668),
    "2024-03-10 03:00:00.000000 -0400 XDT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666668, tz="XST5XDT,365/0,180/0"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 03:00:00.000000 -0400 XDT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.229166666668),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 00:30:00.000000 -0500 XST",
  )
  assert_eq(
    formatter.format_value(20030.229166666668),
    "2024-11-03 00:30:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.229166666668, tz="XST5XDT,365/0,180/0"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 00:30:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.270833333332),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 01:30:00.000000 -0500 XST",
  )
  assert_eq(
    formatter.format_value(20030.270833333332),
    "2024-11-03 01:30:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.270833333332, tz="XST5XDT,365/0,180/0"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 01:30:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(25018.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2038-06-30 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    formatter.format_value(25018.0),
    "2038-06-30 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(25018.0, tz="XST5XDT,365/0,180/0"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2038-06-30 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(157236.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2400-06-30 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    formatter.format_value(157236.0),
    "2400-06-30 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(157236.0, tz="XST5XDT,365/0,180/0"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2400-06-30 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(2932713.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "9999-06-30 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    formatter.format_value(2932713.0),
    "9999-06-30 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(2932713.0, tz="XST5XDT,365/0,180/0"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "9999-06-30 19:00:00.000000 -0500 XST",
  )
}

///|
test "timezone original conversion XST5XDT,M3-2-0/0230,M11-1-0/02:00:30" {
  let previous = @config.timezone()
  defer @config.set_timezone(previous)
  @config.set_timezone("XST5XDT,M3-2-0/0230,M11-1-0/02:00:30")
  let formatter = @date.date_formatter("%Y-%m-%d %H:%M:%S.%f %z %Z")
  assert_eq(
    @date.format_date(@date.num2date(-719161.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "0001-01-01 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    formatter.format_value(-719161.0),
    "0001-01-01 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(-719161.0, tz="XST5XDT,M3-2-0/0230,M11-1-0/02:00:30"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "0001-01-01 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(-62090.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1800-01-01 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    formatter.format_value(-62090.0),
    "1800-01-01 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(-62090.0, tz="XST5XDT,M3-2-0/0230,M11-1-0/02:00:30"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "1800-01-01 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(-25566.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1900-01-01 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    formatter.format_value(-25566.0),
    "1900-01-01 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(-25566.0, tz="XST5XDT,M3-2-0/0230,M11-1-0/02:00:30"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "1900-01-01 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(0.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1969-12-31 19:00:00.000000 -0500 XST",
  )
  assert_eq(formatter.format_value(0.0), "1969-12-31 19:00:00.000000 -0500 XST")
  assert_eq(
    @date.format_date(
      @date.num2date(0.0, tz="XST5XDT,M3-2-0/0230,M11-1-0/02:00:30"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "1969-12-31 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(19417.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2023-02-28 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    formatter.format_value(19417.0),
    "2023-02-28 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19417.0, tz="XST5XDT,M3-2-0/0230,M11-1-0/02:00:30"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2023-02-28 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(19781.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-02-27 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    formatter.format_value(19781.0),
    "2024-02-27 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19781.0, tz="XST5XDT,M3-2-0/0230,M11-1-0/02:00:30"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-02-27 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(19782.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-02-28 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    formatter.format_value(19782.0),
    "2024-02-28 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19782.0, tz="XST5XDT,M3-2-0/0230,M11-1-0/02:00:30"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-02-28 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(19783.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-02-29 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    formatter.format_value(19783.0),
    "2024-02-29 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19783.0, tz="XST5XDT,M3-2-0/0230,M11-1-0/02:00:30"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-02-29 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(19723.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2023-12-31 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    formatter.format_value(19723.0),
    "2023-12-31 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19723.0, tz="XST5XDT,M3-2-0/0230,M11-1-0/02:00:30"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2023-12-31 19:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(19905.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-06-30 20:00:00.000000 -0400 XDT",
  )
  assert_eq(
    formatter.format_value(19905.0),
    "2024-06-30 20:00:00.000000 -0400 XDT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19905.0, tz="XST5XDT,M3-2-0/0230,M11-1-0/02:00:30"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-06-30 20:00:00.000000 -0400 XDT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666657),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 01:59:59.999999 -0500 XST",
  )
  assert_eq(
    formatter.format_value(19792.291666666657),
    "2024-03-10 01:59:59.999999 -0500 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(
        19792.291666666657,
        tz="XST5XDT,M3-2-0/0230,M11-1-0/02:00:30",
      ),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 01:59:59.999999 -0500 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666668),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 02:00:00.000000 -0500 XST",
  )
  assert_eq(
    formatter.format_value(19792.291666666668),
    "2024-03-10 02:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(
        19792.291666666668,
        tz="XST5XDT,M3-2-0/0230,M11-1-0/02:00:30",
      ),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 02:00:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.229166666668),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 01:30:00.000000 -0400 XDT",
  )
  assert_eq(
    formatter.format_value(20030.229166666668),
    "2024-11-03 01:30:00.000000 -0400 XDT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(
        20030.229166666668,
        tz="XST5XDT,M3-2-0/0230,M11-1-0/02:00:30",
      ),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 01:30:00.000000 -0400 XDT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.270833333332),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 01:30:00.000000 -0500 XST",
  )
  assert_eq(
    formatter.format_value(20030.270833333332),
    "2024-11-03 01:30:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(
        20030.270833333332,
        tz="XST5XDT,M3-2-0/0230,M11-1-0/02:00:30",
      ),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 01:30:00.000000 -0500 XST",
  )
  assert_eq(
    @date.format_date(@date.num2date(25018.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2038-06-30 20:00:00.000000 -0400 XDT",
  )
  assert_eq(
    formatter.format_value(25018.0),
    "2038-06-30 20:00:00.000000 -0400 XDT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(25018.0, tz="XST5XDT,M3-2-0/0230,M11-1-0/02:00:30"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2038-06-30 20:00:00.000000 -0400 XDT",
  )
  assert_eq(
    @date.format_date(@date.num2date(157236.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2400-06-30 20:00:00.000000 -0400 XDT",
  )
  assert_eq(
    formatter.format_value(157236.0),
    "2400-06-30 20:00:00.000000 -0400 XDT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(157236.0, tz="XST5XDT,M3-2-0/0230,M11-1-0/02:00:30"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2400-06-30 20:00:00.000000 -0400 XDT",
  )
  assert_eq(
    @date.format_date(@date.num2date(2932713.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "9999-06-30 20:00:00.000000 -0400 XDT",
  )
  assert_eq(
    formatter.format_value(2932713.0),
    "9999-06-30 20:00:00.000000 -0400 XDT",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(2932713.0, tz="XST5XDT,M3-2-0/0230,M11-1-0/02:00:30"),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "9999-06-30 20:00:00.000000 -0400 XDT",
  )
}

///|
test "timezone original capture/dynamic new_york.tzif -> XST-5:45" {
  let previous = @config.timezone()
  defer @config.set_timezone(previous)
  @date.register_timezone("new_york.tzif", tzif_new_york)
  defer @date.unregister_timezone("new_york.tzif")
  @config.set_timezone("new_york.tzif")
  let values = [19905.0, 19905.041666666668, 19905.083333333332]
  let fixed = @date.date_formatter("%Y-%m-%d %H:%M:%S.%f %z %Z")
  let locator = @date.AutoDateLocator::new()
  let info = @date.DateConverter::new().axisinfo()
  let auto = @date.AutoDateFormatter::new()
    .with_locator_unit(1.0 / 24.0)
    .with_scaled([(1.0 / 24.0, @date.Text("%Y-%m-%d %H:%M:%S.%f %z %Z"))])
  let explicit_auto = @date.AutoDateFormatter::new(tz="UTC")
    .with_locator_unit(1.0 / 24.0)
    .with_scaled([(1.0 / 24.0, @date.Text("%Y-%m-%d %H:%M:%S.%f %z %Z"))])
  let concise = @date.concise_date_formatter(
    formats=[
      "%Y-%m-%d %H:%M:%S.%f %z %Z", "%Y-%m-%d %H:%M:%S.%f %z %Z", "%Y-%m-%d %H:%M:%S.%f %z %Z",
      "%Y-%m-%d %H:%M:%S.%f %z %Z", "%Y-%m-%d %H:%M:%S.%f %z %Z", "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ],
    zero_formats=[
      "%Y-%m-%d %H:%M:%S.%f %z %Z", "%Y-%m-%d %H:%M:%S.%f %z %Z", "%Y-%m-%d %H:%M:%S.%f %z %Z",
      "%Y-%m-%d %H:%M:%S.%f %z %Z", "%Y-%m-%d %H:%M:%S.%f %z %Z", "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ],
    offset_formats=[
      "%Y-%m-%d %H:%M:%S.%f %z %Z", "%Y-%m-%d %H:%M:%S.%f %z %Z", "%Y-%m-%d %H:%M:%S.%f %z %Z",
      "%Y-%m-%d %H:%M:%S.%f %z %Z", "%Y-%m-%d %H:%M:%S.%f %z %Z", "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ],
  )
  @config.set_timezone("XST-5:45")
  assert_eq(fixed.format_values(values), [
    "2024-06-30 20:00:00.000000 -0400 EDT", "2024-06-30 21:00:00.000000 -0400 EDT",
    "2024-06-30 22:00:00.000000 -0400 EDT",
  ])
  assert_eq(auto.format_ticks(values), [
    "2024-07-01 05:45:00.000000 +0545 XST", "2024-07-01 06:45:00.000000 +0545 XST",
    "2024-07-01 07:45:00.000000 +0545 XST",
  ])
  assert_eq(concise.format_ticks(values), [
    "2024-07-01 05:45:00.000000 +0545 XST", "2024-07-01 06:45:00.000000 +0545 XST",
    "2024-07-01 07:45:00.000000 +0545 XST",
  ])
  assert_eq(concise.get_offset(), "2024-07-01 07:45:00.000000 +0545 XST")
  assert_eq(concise.format_data_short(values[0]), "2024-07-01 05:45:00")
  assert_eq(explicit_auto.format_ticks(values), [
    "2024-07-01 00:00:00.000000 +0000 UTC", "2024-07-01 01:00:00.000000 +0000 UTC",
    "2024-07-01 02:00:00.000000 +0000 UTC",
  ])
  assert_eq(info.major_formatter().format_values(values), [
    "2024", "2024", "2024",
  ])
  assert_eq(
    @date.format_date(
      locator.as_locator().timezone().unwrap().to_datetime(values[0]),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-06-30 20:00:00.000000 -0400 EDT",
  )
  assert_eq(
    @date.format_date(
      info.major_locator().timezone().unwrap().to_datetime(values[0]),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-06-30 20:00:00.000000 -0400 EDT",
  )
}

///|
test "timezone original capture/dynamic XST-5:45 -> UTC" {
  let previous = @config.timezone()
  defer @config.set_timezone(previous)
  @date.register_timezone("new_york.tzif", tzif_new_york)
  defer @date.unregister_timezone("new_york.tzif")
  @config.set_timezone("XST-5:45")
  let values = [19905.0, 19905.041666666668, 19905.083333333332]
  let fixed = @date.date_formatter("%Y-%m-%d %H:%M:%S.%f %z %Z")
  let locator = @date.AutoDateLocator::new()
  let info = @date.DateConverter::new().axisinfo()
  let auto = @date.AutoDateFormatter::new()
    .with_locator_unit(1.0 / 24.0)
    .with_scaled([(1.0 / 24.0, @date.Text("%Y-%m-%d %H:%M:%S.%f %z %Z"))])
  let explicit_auto = @date.AutoDateFormatter::new(tz="UTC")
    .with_locator_unit(1.0 / 24.0)
    .with_scaled([(1.0 / 24.0, @date.Text("%Y-%m-%d %H:%M:%S.%f %z %Z"))])
  let concise = @date.concise_date_formatter(
    formats=[
      "%Y-%m-%d %H:%M:%S.%f %z %Z", "%Y-%m-%d %H:%M:%S.%f %z %Z", "%Y-%m-%d %H:%M:%S.%f %z %Z",
      "%Y-%m-%d %H:%M:%S.%f %z %Z", "%Y-%m-%d %H:%M:%S.%f %z %Z", "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ],
    zero_formats=[
      "%Y-%m-%d %H:%M:%S.%f %z %Z", "%Y-%m-%d %H:%M:%S.%f %z %Z", "%Y-%m-%d %H:%M:%S.%f %z %Z",
      "%Y-%m-%d %H:%M:%S.%f %z %Z", "%Y-%m-%d %H:%M:%S.%f %z %Z", "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ],
    offset_formats=[
      "%Y-%m-%d %H:%M:%S.%f %z %Z", "%Y-%m-%d %H:%M:%S.%f %z %Z", "%Y-%m-%d %H:%M:%S.%f %z %Z",
      "%Y-%m-%d %H:%M:%S.%f %z %Z", "%Y-%m-%d %H:%M:%S.%f %z %Z", "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ],
  )
  @config.set_timezone("UTC")
  assert_eq(fixed.format_values(values), [
    "2024-07-01 05:45:00.000000 +0545 XST", "2024-07-01 06:45:00.000000 +0545 XST",
    "2024-07-01 07:45:00.000000 +0545 XST",
  ])
  assert_eq(auto.format_ticks(values), [
    "2024-07-01 00:00:00.000000 +0000 UTC", "2024-07-01 01:00:00.000000 +0000 UTC",
    "2024-07-01 02:00:00.000000 +0000 UTC",
  ])
  assert_eq(concise.format_ticks(values), [
    "2024-07-01 00:00:00.000000 +0000 UTC", "2024-07-01 01:00:00.000000 +0000 UTC",
    "2024-07-01 02:00:00.000000 +0000 UTC",
  ])
  assert_eq(concise.get_offset(), "2024-07-01 02:00:00.000000 +0000 UTC")
  assert_eq(concise.format_data_short(values[0]), "2024-07-01 00:00:00")
  assert_eq(explicit_auto.format_ticks(values), [
    "2024-07-01 00:00:00.000000 +0000 UTC", "2024-07-01 01:00:00.000000 +0000 UTC",
    "2024-07-01 02:00:00.000000 +0000 UTC",
  ])
  assert_eq(info.major_formatter().format_values(values), [
    "2024", "2024", "2024",
  ])
  assert_eq(
    @date.format_date(
      locator.as_locator().timezone().unwrap().to_datetime(values[0]),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-07-01 05:45:00.000000 +0545 XST",
  )
  assert_eq(
    @date.format_date(
      info.major_locator().timezone().unwrap().to_datetime(values[0]),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-07-01 05:45:00.000000 +0545 XST",
  )
}

///|
test "timezone original capture/dynamic UTC -> EST5EDT,M3.2.0,M11.1.0" {
  let previous = @config.timezone()
  defer @config.set_timezone(previous)
  @date.register_timezone("new_york.tzif", tzif_new_york)
  defer @date.unregister_timezone("new_york.tzif")
  @config.set_timezone("UTC")
  let values = [19905.0, 19905.041666666668, 19905.083333333332]
  let fixed = @date.date_formatter("%Y-%m-%d %H:%M:%S.%f %z %Z")
  let locator = @date.AutoDateLocator::new()
  let info = @date.DateConverter::new().axisinfo()
  let auto = @date.AutoDateFormatter::new()
    .with_locator_unit(1.0 / 24.0)
    .with_scaled([(1.0 / 24.0, @date.Text("%Y-%m-%d %H:%M:%S.%f %z %Z"))])
  let explicit_auto = @date.AutoDateFormatter::new(tz="UTC")
    .with_locator_unit(1.0 / 24.0)
    .with_scaled([(1.0 / 24.0, @date.Text("%Y-%m-%d %H:%M:%S.%f %z %Z"))])
  let concise = @date.concise_date_formatter(
    formats=[
      "%Y-%m-%d %H:%M:%S.%f %z %Z", "%Y-%m-%d %H:%M:%S.%f %z %Z", "%Y-%m-%d %H:%M:%S.%f %z %Z",
      "%Y-%m-%d %H:%M:%S.%f %z %Z", "%Y-%m-%d %H:%M:%S.%f %z %Z", "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ],
    zero_formats=[
      "%Y-%m-%d %H:%M:%S.%f %z %Z", "%Y-%m-%d %H:%M:%S.%f %z %Z", "%Y-%m-%d %H:%M:%S.%f %z %Z",
      "%Y-%m-%d %H:%M:%S.%f %z %Z", "%Y-%m-%d %H:%M:%S.%f %z %Z", "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ],
    offset_formats=[
      "%Y-%m-%d %H:%M:%S.%f %z %Z", "%Y-%m-%d %H:%M:%S.%f %z %Z", "%Y-%m-%d %H:%M:%S.%f %z %Z",
      "%Y-%m-%d %H:%M:%S.%f %z %Z", "%Y-%m-%d %H:%M:%S.%f %z %Z", "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ],
  )
  @config.set_timezone("EST5EDT,M3.2.0,M11.1.0")
  assert_eq(fixed.format_values(values), [
    "2024-07-01 00:00:00.000000 +0000 UTC", "2024-07-01 01:00:00.000000 +0000 UTC",
    "2024-07-01 02:00:00.000000 +0000 UTC",
  ])
  assert_eq(auto.format_ticks(values), [
    "2024-06-30 20:00:00.000000 -0400 EDT", "2024-06-30 21:00:00.000000 -0400 EDT",
    "2024-06-30 22:00:00.000000 -0400 EDT",
  ])
  assert_eq(concise.format_ticks(values), [
    "2024-06-30 20:00:00.000000 -0400 EDT", "2024-06-30 21:00:00.000000 -0400 EDT",
    "2024-06-30 22:00:00.000000 -0400 EDT",
  ])
  assert_eq(concise.get_offset(), "2024-06-30 22:00:00.000000 -0400 EDT")
  assert_eq(concise.format_data_short(values[0]), "2024-06-30 20:00:00")
  assert_eq(explicit_auto.format_ticks(values), [
    "2024-07-01 00:00:00.000000 +0000 UTC", "2024-07-01 01:00:00.000000 +0000 UTC",
    "2024-07-01 02:00:00.000000 +0000 UTC",
  ])
  assert_eq(info.major_formatter().format_values(values), [
    "2024", "2024", "2024",
  ])
  assert_eq(
    @date.format_date(
      locator.as_locator().timezone().unwrap().to_datetime(values[0]),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-07-01 00:00:00.000000 +0000 UTC",
  )
  assert_eq(
    @date.format_date(
      info.major_locator().timezone().unwrap().to_datetime(values[0]),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-07-01 00:00:00.000000 +0000 UTC",
  )
}

///|
test "timezone original all concrete locators capture defaults" {
  let previous = @config.timezone()
  defer @config.set_timezone(previous)
  @config.set_timezone("XST-5:45")
  let locators = [
    @date.day_locator(),
    @date.weekday_locator(),
    @date.month_locator(),
    @date.year_locator(),
    @date.hour_locator(),
    @date.minute_locator(),
    @date.second_locator(),
    @date.microsecond_locator(),
  ]
  @config.set_timezone("UTC")
  assert_eq(
    locators.map(locator => locator.timezone().unwrap().initial_offset_seconds()),
    [20700, 20700, 20700, 20700, 20700, 20700, 20700, 20700],
  )
}

///|
test "timezone original unknown and unsupported string rejection" {
  assert_true(
    try {
      ignore(@date.get_timezone(name="invalid/D12-zone"))
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(@date.get_timezone(name="XST0:09:21"))
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(@date.get_timezone(name="XST5XDT,M3.2.0/-1,M11.1.0"))
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(@date.get_timezone(name="XST5XDT,M3.2.0/2u,M11.1.0"))
      false
    } catch {
      _ => true
    },
  )
}
