// Generated using original gettz and exact production IANA slim blobs.

///|
test "timezone original production slim America/New_York" {
  let previous = @config.timezone()
  defer @config.set_timezone(previous)
  @tzdb.register_timezone("America/New_York")
  defer @date.unregister_timezone("America/New_York")
  @config.set_timezone("America/New_York")
  assert_eq(
    @date.format_date(@date.num2date(-719161.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "0001-01-02 00:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(@date.num2date(-62090.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1800-01-02 00:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(@date.num2date(-25566.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1900-01-02 00:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(@date.num2date(0.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1970-01-01 00:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(@date.num2date(19417.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2023-03-01 00:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(@date.num2date(19781.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-02-28 00:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(@date.num2date(19782.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-02-29 00:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(@date.num2date(19783.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-03-01 00:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(@date.num2date(19723.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-01-01 00:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(@date.num2date(19905.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-07-01 00:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666657),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 06:59:59.999999 +0000 ",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666668),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 07:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.229166666668),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 05:30:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.270833333332),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 06:30:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(@date.num2date(25018.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2038-07-01 00:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(@date.num2date(157236.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2400-07-01 00:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(@date.num2date(2932713.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "9999-07-01 00:00:00.000000 +0000 ",
  )
}

///|
test "timezone original production slim Europe/Paris" {
  let previous = @config.timezone()
  defer @config.set_timezone(previous)
  @tzdb.register_timezone("Europe/Paris")
  defer @date.unregister_timezone("Europe/Paris")
  @config.set_timezone("Europe/Paris")
  assert_eq(
    @date.format_date(@date.num2date(-719161.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "0001-01-02 00:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(@date.num2date(-62090.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1800-01-02 00:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(@date.num2date(-25566.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1900-01-02 00:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(@date.num2date(0.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1970-01-01 00:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(@date.num2date(19417.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2023-03-01 00:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(@date.num2date(19781.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-02-28 00:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(@date.num2date(19782.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-02-29 00:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(@date.num2date(19783.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-03-01 00:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(@date.num2date(19723.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-01-01 00:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(@date.num2date(19905.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-07-01 00:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666657),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 06:59:59.999999 +0000 ",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666668),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 07:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.229166666668),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 05:30:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.270833333332),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 06:30:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(@date.num2date(25018.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2038-07-01 00:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(@date.num2date(157236.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2400-07-01 00:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(@date.num2date(2932713.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "9999-07-01 00:00:00.000000 +0000 ",
  )
}

///|
test "timezone original production slim Europe/Dublin" {
  let previous = @config.timezone()
  defer @config.set_timezone(previous)
  @tzdb.register_timezone("Europe/Dublin")
  defer @date.unregister_timezone("Europe/Dublin")
  @config.set_timezone("Europe/Dublin")
  assert_eq(
    @date.format_date(@date.num2date(-719161.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "0001-01-02 00:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(@date.num2date(-62090.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1800-01-02 00:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(@date.num2date(-25566.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1900-01-02 00:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(@date.num2date(0.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1970-01-01 00:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(@date.num2date(19417.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2023-03-01 00:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(@date.num2date(19781.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-02-28 00:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(@date.num2date(19782.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-02-29 00:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(@date.num2date(19783.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-03-01 00:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(@date.num2date(19723.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-01-01 00:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(@date.num2date(19905.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-07-01 00:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666657),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 06:59:59.999999 +0000 ",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666668),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 07:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.229166666668),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 05:30:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.270833333332),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 06:30:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(@date.num2date(25018.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2038-07-01 00:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(@date.num2date(157236.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2400-07-01 00:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(@date.num2date(2932713.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "9999-07-01 00:00:00.000000 +0000 ",
  )
}

///|
test "timezone original production slim Australia/Lord_Howe" {
  let previous = @config.timezone()
  defer @config.set_timezone(previous)
  @tzdb.register_timezone("Australia/Lord_Howe")
  defer @date.unregister_timezone("Australia/Lord_Howe")
  @config.set_timezone("Australia/Lord_Howe")
  assert_eq(
    @date.format_date(@date.num2date(-719161.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "0001-01-02 00:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(@date.num2date(-62090.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1800-01-02 00:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(@date.num2date(-25566.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1900-01-02 00:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(@date.num2date(0.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1970-01-01 00:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(@date.num2date(19417.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2023-03-01 00:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(@date.num2date(19781.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-02-28 00:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(@date.num2date(19782.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-02-29 00:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(@date.num2date(19783.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-03-01 00:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(@date.num2date(19723.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-01-01 00:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(@date.num2date(19905.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-07-01 00:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666657),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 06:59:59.999999 +0000 ",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666668),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 07:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.229166666668),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 05:30:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.270833333332),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 06:30:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(@date.num2date(25018.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2038-07-01 00:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(@date.num2date(157236.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2400-07-01 00:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(@date.num2date(2932713.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "9999-07-01 00:00:00.000000 +0000 ",
  )
}

///|
test "timezone original production slim Pacific/Apia" {
  let previous = @config.timezone()
  defer @config.set_timezone(previous)
  @tzdb.register_timezone("Pacific/Apia")
  defer @date.unregister_timezone("Pacific/Apia")
  @config.set_timezone("Pacific/Apia")
  assert_eq(
    @date.format_date(@date.num2date(-719161.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "0001-01-02 00:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(@date.num2date(-62090.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1800-01-02 00:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(@date.num2date(-25566.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1900-01-02 00:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(@date.num2date(0.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1970-01-01 00:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(@date.num2date(19417.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2023-03-01 00:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(@date.num2date(19781.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-02-28 00:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(@date.num2date(19782.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-02-29 00:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(@date.num2date(19783.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-03-01 00:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(@date.num2date(19723.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-01-01 00:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(@date.num2date(19905.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-07-01 00:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666657),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 06:59:59.999999 +0000 ",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666668),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 07:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.229166666668),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 05:30:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.270833333332),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 06:30:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(@date.num2date(25018.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2038-07-01 00:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(@date.num2date(157236.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2400-07-01 00:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(@date.num2date(2932713.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "9999-07-01 00:00:00.000000 +0000 ",
  )
}

///|
test "timezone original production slim Asia/Kolkata" {
  let previous = @config.timezone()
  defer @config.set_timezone(previous)
  @tzdb.register_timezone("Asia/Kolkata")
  defer @date.unregister_timezone("Asia/Kolkata")
  @config.set_timezone("Asia/Kolkata")
  assert_eq(
    @date.format_date(@date.num2date(-719161.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "0001-01-02 00:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(@date.num2date(-62090.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1800-01-02 00:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(@date.num2date(-25566.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1900-01-02 00:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(@date.num2date(0.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "1970-01-01 00:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(@date.num2date(19417.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2023-03-01 00:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(@date.num2date(19781.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-02-28 00:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(@date.num2date(19782.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-02-29 00:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(@date.num2date(19783.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-03-01 00:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(@date.num2date(19723.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-01-01 00:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(@date.num2date(19905.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2024-07-01 00:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666657),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 06:59:59.999999 +0000 ",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(19792.291666666668),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-03-10 07:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.229166666668),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 05:30:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(
      @date.num2date(20030.270833333332),
      "%Y-%m-%d %H:%M:%S.%f %z %Z",
    ),
    "2024-11-03 06:30:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(@date.num2date(25018.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2038-07-01 00:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(@date.num2date(157236.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "2400-07-01 00:00:00.000000 +0000 ",
  )
  assert_eq(
    @date.format_date(@date.num2date(2932713.0), "%Y-%m-%d %H:%M:%S.%f %z %Z"),
    "9999-07-01 00:00:00.000000 +0000 ",
  )
}
