///|
fn delta_tuple(value : @date.TimeDelta) -> (Int32, Int32, Int32) {
  (value.days(), value.seconds(), value.microseconds())
}

///|
test "duration conversion matches independent CPython and upstream vectors" {
  for (value, days, seconds, micros, total) in duration_references {
    let actual = @date.num2timedelta(value)
    assert_eq(
      delta_tuple(actual),
      (days, seconds, micros),
      msg="day count \{value}",
    )
    assert_eq(actual.total_seconds(), total, msg="total seconds for \{value}")
  }
}

///|
test "duration full range is not limited to Int64 total microseconds" {
  let minimum = @date.timedelta(days=-999999999)
  let maximum = @date.timedelta(
    days=999999999,
    seconds=86399L,
    microseconds=999999L,
  )
  assert_eq(delta_tuple(minimum), (-999999999, 0, 0))
  assert_eq(delta_tuple(maximum), (999999999, 86399, 999999))
  assert_eq(maximum.total_seconds(), 86399999999999.999999)
  assert_true(minimum < maximum)
  assert_eq(
    delta_tuple(@date.timedelta(days=106751992, microseconds=123456L)),
    (106751992, 0, 123456),
  )
  assert_eq(@date.timedelta(weeks=1, days=-7), @date.timedelta())
  assert_eq(
    @date.timedelta(days=1000000000, hours=-24),
    @date.timedelta(days=999999999),
  )
}

///|
test "duration components normalize without Int64 intermediate overflow" {
  assert_eq(delta_tuple(@date.timedelta(hours=-1)), (-1, 82800, 0))
  assert_eq(
    delta_tuple(@date.timedelta(seconds=-1L, microseconds=-1L)),
    (-1, 86398, 999999),
  )
  assert_eq(delta_tuple(@date.timedelta(milliseconds=-1L)), (-1, 86399, 999000))
  assert_eq(
    delta_tuple(@date.timedelta(microseconds=-9223372036854775808L)),
    (-106751992, 71945, 224192),
  )
  assert_eq(
    delta_tuple(@date.timedelta(microseconds=9223372036854775807L)),
    (106751991, 14454, 775807),
  )
  assert_true(
    try {
      ignore(@date.timedelta(seconds=9223372036854775807L))
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(@date.timedelta(seconds=-9223372036854775808L))
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(@date.timedelta(milliseconds=-9223372036854775808L))
      false
    } catch {
      _ => true
    },
  )
}

///|
test "duration conversion arrays copy values and reject invalid inputs" {
  let values = [1.0, 1.5, -1.0]
  let deltas = @date.num2timedeltas(values)
  values[0] = 9.0
  assert_eq(deltas.map(delta => delta_tuple(delta)), [
    (1, 0, 0),
    (1, 43200, 0),
    (-1, 0, 0),
  ])
  assert_true(@date.num2timedeltas([]).is_empty())
  for
    value in [
      0.0 / 0.0,
      1.0 / 0.0,
      -1.0 / 0.0,
      1000000000.0,
      -1000000000.0,
      -999999999.0000001,
    ] {
    assert_true(
      try {
        ignore(@date.num2timedelta(value))
        false
      } catch {
        @date.DateError::InvalidDate(_) => true
        _ => false
      },
    )
  }
  assert_true(
    try {
      ignore(@date.num2timedeltas([1.0, 0.0 / 0.0]))
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(@date.timedelta(days=999999999, hours=24))
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(@date.timedelta(days=-999999999, microseconds=-1L))
      false
    } catch {
      _ => true
    },
  )
}

///|
test "fixed offset duration addition preserves exact distant microseconds" {
  let start = @date.datetime(
    2243,
    10,
    17,
    microsecond=123456,
    offset_seconds=561,
  )
  let shifted = start.add_timedelta(
    @date.timedelta(days=-1, hours=2, microseconds=-1L),
  )
  assert_eq(
    @date.format_date(shifted, "%Y-%m-%d %H:%M:%S.%f %z"),
    "2243-10-16 02:00:00.123455 +000921",
  )
  assert_true(shifted.timezone() is None)
  assert_true(
    try {
      ignore(start.add_timedelta(@date.timedelta(days=999999999)))
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.datetime(1, 1, 1).add_timedelta(@date.timedelta(microseconds=-1L)),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.datetime(
          9999,
          12,
          31,
          hour=23,
          minute=59,
          second=59,
          microsecond=999999,
        ).add_timedelta(@date.timedelta(microseconds=1L)),
      )
      false
    } catch {
      _ => true
    },
  )
}

///|
test "retained rule arithmetic uses dateutil gap and fold offset semantics" {
  let zone = @date.tzif_timezone(tzif_new_york)
  let spring = @date.datetime(2024, 3, 10, hour=5).with_timezone(zone)
  assert_true(spring.timezone() is Some(_))
  let imaginary = spring.add_timedelta(@date.timedelta(hours=2))
  assert_eq(@date.format_date(imaginary, "%H:%M %Z %z"), "02:00 EDT -0400")
  assert_true(
    try {
      ignore(zone.to_ordinal(imaginary))
      false
    } catch {
      _ => true
    },
  )
  let fall = @date.datetime(2024, 11, 3, hour=6, minute=30).with_timezone(zone)
  assert_eq(@date.format_date(fall, "%H:%M %Z"), "01:30 EST")
  assert_eq(
    @date.format_date(fall.add_timedelta(@date.timedelta()), "%H:%M %Z"),
    "01:30 EDT",
  )
  assert_true(fall.with_offset(-300).timezone() is None)
}

///|
test "future footer arithmetic retains microseconds and resolves gaps" {
  let zone = @date.tzif_timezone(tzif_new_york)
  let start = @date.datetime(2400, 3, 12, hour=5).with_timezone(zone)
  let shifted = start.add_timedelta(
    @date.timedelta(hours=2, microseconds=123456L),
  )
  assert_eq(
    @date.format_date(shifted, "%Y-%m-%d %H:%M:%S.%f %Z"),
    "2400-03-12 02:00:00.123456 EDT",
  )
  let normal = @date.datetime(2400, 1, 1)
    .with_timezone(zone)
    .add_timedelta(@date.timedelta(microseconds=123456L))
  assert_eq(normal.microsecond(), 123456)
}

///|
test "rule arithmetic classifies the exact microsecond before distant transitions" {
  let zone = @date.tzif_timezone(tzif_new_york)
  for year in [2400, 9999] {
    let first_weekday = @date.datetime(year, 3, 1).weekday()
    let sunday = 8 + (6 - first_weekday + 7) % 7
    let start = @date.datetime(year, 3, sunday, hour=6, minute=59, second=59).with_timezone(
      zone,
    )
    let before = start.add_timedelta(@date.timedelta(microseconds=999999L))
    assert_eq(
      (
        before.hour(),
        before.minute(),
        before.second(),
        before.microsecond(),
        before.offset_seconds(),
      ),
      (1, 59, 59, 999999, -18000),
    )
    let at = before.add_timedelta(@date.timedelta(microseconds=1L))
    assert_eq(
      (
        at.hour(),
        at.minute(),
        at.second(),
        at.microsecond(),
        at.offset_seconds(),
      ),
      (2, 0, 0, 0, -14400),
    )
  }
}
