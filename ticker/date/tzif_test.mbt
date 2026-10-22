///|
fn tzif_text(
  zone : @date.DateTimeZone,
  value : @date.DateTime,
) -> String raise @date.DateError {
  @date.date_formatter("%Y-%m-%d %H:%M:%S %z %Z")
  .with_timezone(zone)
  .format_value(value.to_ordinal())
}

///|
test "seconds offset dates retain exact instants and microseconds" {
  let value = @date.datetime(
    2243,
    10,
    17,
    microsecond=123456,
    offset_seconds=561,
  )
  assert_eq(value.offset_seconds(), 561)
  assert_eq(value.offset_minutes(), 9)
  assert_eq(value.offset_minutes, 9)
  let utc = value.with_offset(0)
  assert_eq(
    @date.format_date(utc, "%Y-%m-%d %H:%M:%S.%f"),
    "2243-10-16 23:50:39.123456",
  )
  assert_eq(utc.with_offset_seconds(561).microsecond(), 123456)
  assert_eq(utc.with_offset_seconds(561).to_ordinal(), value.to_ordinal())
  let west = @date.datetime(1970, 1, 1, offset_seconds=-17762)
  assert_eq(west.offset_minutes(), -296)
  assert_eq(@date.format_date(west, "%z %Z"), "-045602 UTC-04:56:02")
  assert_eq(
    @date.num2date(value.to_ordinal(), offset_seconds=561).offset_seconds(),
    561,
  )
}

///|
test "seconds offset constructors reject invalid or conflicting units" {
  for offset in [-86400, 86400, -2147483648, 2147483647] {
    assert_true(
      try {
        ignore(@date.fixed_timezone_seconds(offset))
        false
      } catch {
        _ => true
      },
    )
    assert_true(
      try {
        ignore(@date.datetime(2024, 1, 1, offset_seconds=offset))
        false
      } catch {
        _ => true
      },
    )
  }
  assert_true(
    try {
      ignore(@date.datetime(2024, 1, 1, offset_minutes=1, offset_seconds=1))
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(@date.from_ordinal(0.0, offset_minutes=1, offset_seconds=1))
      false
    } catch {
      _ => true
    },
  )
}

///|
test "seconds transition zones preserve fold preference and copy isolation" {
  let at = @date.datetime(1911, 3, 10, hour=23, minute=50, second=39)
  let transition = @date.timezone_transition_seconds(at, 0)
  let transitions = [transition]
  let zone = @date.timezone_seconds(561, transitions~)
  transitions.clear()
  let wall = @date.datetime(1911, 3, 10, hour=23, minute=55, offset_seconds=561)
  assert_eq(zone.initial_offset_seconds(), 561)
  assert_eq(zone.transitions()[0].offset_seconds(), 0)
  assert_eq(zone.to_ordinal(wall), wall.to_ordinal())
  assert_eq(
    zone.to_ordinal(wall.with_offset_seconds(0).with_offset_seconds(561)),
    wall.to_ordinal(),
  )
  let late = @date.datetime(1911, 3, 10, hour=23, minute=55)
  assert_eq(zone.to_ordinal(late), late.to_ordinal())
  assert_eq(zone.to_datetime(wall.to_ordinal()).offset_seconds(), 561)
}

///|
test "IANA TZif retains Paris historical seconds and designation" {
  let zone = @date.tzif_timezone(tzif_paris)
  assert_eq(zone.initial_offset_seconds(), 561)
  let value = @date.datetime(1900, 1, 1)
  assert_eq(tzif_text(zone, value), "1900-01-01 00:09:21 +000921 PMT")
  let converted = value.with_timezone(zone)
  assert_eq(converted.timezone_abbreviation(), Some("PMT"))
  assert_eq(converted.to_ordinal(), value.to_ordinal())
  assert_eq(converted.with_offset(0).timezone_abbreviation(), None)
  assert_eq(zone.offset_seconds_at(value.to_ordinal()), 561)
  assert_eq(zone.offset_at(value.to_ordinal()), 9)
}

///|
test "IANA TZif New York boundaries skip gaps and select fold side" {
  let zone = @date.tzif_timezone(tzif_new_york)
  assert_eq(
    tzif_text(zone, @date.datetime(2024, 3, 10, hour=6, minute=59, second=59)),
    "2024-03-10 01:59:59 -0500 EST",
  )
  assert_eq(
    tzif_text(zone, @date.datetime(2024, 3, 10, hour=7)),
    "2024-03-10 03:00:00 -0400 EDT",
  )
  let gap = @date.datetime(2024, 3, 10, hour=2, minute=30)
  assert_true(
    try {
      ignore(zone.to_ordinal(gap))
      false
    } catch {
      _ => true
    },
  )
  for offset in [-240, -300] {
    let wall = @date.datetime(
      2024,
      11,
      3,
      hour=1,
      minute=30,
      offset_minutes=offset,
    )
    assert_eq(zone.to_ordinal(wall), wall.to_ordinal())
  }
  assert_eq(
    tzif_text(zone, @date.datetime(1800, 1, 1)),
    "1799-12-31 19:03:58 -045602 LMT",
  )
}

///|
test "IANA footer extrapolates northern and southern seasons through year 9999" {
  let north = @date.tzif_timezone(tzif_new_york)
  let south = @date.tzif_timezone(tzif_lord_howe)
  for year in [2400, 9999] {
    assert_eq(
      north.offset_seconds_at(@date.datetime(year, 1, 2).to_ordinal()),
      -18000,
    )
    assert_eq(
      north.offset_seconds_at(@date.datetime(year, 7, 1).to_ordinal()),
      -14400,
    )
    assert_eq(
      south.offset_seconds_at(@date.datetime(year, 1, 2).to_ordinal()),
      39600,
    )
    assert_eq(
      south.offset_seconds_at(@date.datetime(year, 7, 1).to_ordinal()),
      37800,
    )
  }
}

///|
test "IANA Lord Howe keeps half hour seasonal gap and fold" {
  let zone = @date.tzif_timezone(tzif_lord_howe)
  let first = @date.datetime(2024, 4, 6, hour=14, minute=30).to_ordinal()
  let last = @date.datetime(2024, 4, 6, hour=15).to_ordinal()
  let ticks = @date.minute_locator(byminute=[30])
    .with_timezone(zone)
    .tick_values(first, last)
  assert_eq(ticks, [first, last])
  assert_eq(@date.format_date_ticks(ticks, format="%H:%M %z", timezone=zone), [
    "01:30 +1100", "01:30 +1030",
  ])
  let gap = @date.datetime(2024, 10, 6, hour=2, minute=15)
  assert_true(
    try {
      ignore(zone.to_ordinal(gap))
      false
    } catch {
      _ => true
    },
  )
}

///|
test "IANA v3 Nuuk signed transition hours remain active in future" {
  let zone = @date.tzif_timezone(tzif_nuuk)
  assert_eq(
    zone.offset_seconds_at(@date.datetime(2400, 1, 1).to_ordinal()),
    -7200,
  )
  assert_eq(
    zone.offset_seconds_at(@date.datetime(2400, 7, 1).to_ordinal()),
    -3600,
  )
  // Last Sunday of March 2400 is the 26th; -1 wall standard hour means 01 UTC.
  let at = @date.datetime(2400, 3, 26, hour=1).to_ordinal()
  assert_eq(zone.offset_seconds_at(at - 1.0 / 86400.0), -7200)
  assert_eq(zone.offset_seconds_at(at), -3600)
}

///|
test "IANA recurrence skips spring gap before applying count" {
  let zone = @date.tzif_timezone(tzif_new_york)
  let start = @date.datetime(2024, 3, 9, hour=7)
  let values = @date.rrule(@date.Daily, start, count=3)
    .with_timezone(zone)
    .all()
  assert_eq(
    values.map(value => @date.format_date(value, "%Y-%m-%d %H:%M %Z")),
    ["2024-03-09 02:00 EST", "2024-03-11 02:00 EDT", "2024-03-12 02:00 EDT"],
  )
}

///|
test "IANA historical seconds propagate through recurrence and RRuleSet keys" {
  let zone = @date.tzif_timezone(tzif_paris)
  let start = @date.datetime(1900, 1, 1)
  let rule = @date.rrule(@date.Daily, start, count=2).with_timezone(zone)
  let values = rule.all()
  assert_eq(values.map(value => @date.format_date(value, "%H:%M:%S %z %Z")), [
    "00:09:21 +000921 PMT", "00:09:21 +000921 PMT",
  ])
  assert_eq(values[0].to_ordinal(), start.to_ordinal())
  let set = @date.rruleset()
  set.rrule(rule)
  set.rdate(start)
  assert_eq(set.all().length(), 2)
  let fixed = @date.rrule(
    @date.Daily,
    @date.datetime(1900, 1, 1, offset_seconds=561),
    count=2,
  )
  assert_eq(fixed.all().map(value => value.offset_seconds()), [561, 561])
}

///|
test "IANA future recurrence preserves inferred phase and repeated hour order" {
  let zone = @date.tzif_timezone(tzif_new_york)
  let first = @date.datetime(2400, 1, 2, hour=5).to_ordinal()
  let last = @date.datetime(2400, 1, 2, hour=7).to_ordinal()
  let rule = @date.rrule_locator(@date.Minutely, interval=7, bysecond=[0])
  assert_eq(
    rule.with_timezone(zone).tick_values(first, last),
    rule.with_offset(-300).tick_values(first, last),
  )
  let fold = @date.rrule(
      @date.Minutely,
      @date.datetime(2400, 11, 5, hour=5),
      interval=30,
      count=4,
    )
    .with_timezone(zone)
    .all()
  assert_eq(fold.map(value => @date.format_date(value, "%H:%M %Z")), [
    "01:00 EDT", "01:30 EDT", "01:00 EST", "01:30 EST",
  ])
}

///|
test "automatic IANA ticks align historical wall clocks and future folds" {
  let paris = @date.tzif_timezone(tzif_paris)
  let first = @date.datetime(1900, 1, 1).to_ordinal()
  let ticks = @date.date_tick_values(
    first,
    first + 2.0 / 24.0,
    count=3,
    timezone=paris,
  )
  assert_eq(
    @date.format_date_ticks(ticks, format="%H:%M:%S %Z", timezone=paris),
    ["01:00:00 PMT", "02:00:00 PMT"],
  )
  assert_eq(
    @date.date_tick_values(first + 2.0 / 24.0, first, count=3, timezone=paris),
    ticks.rev(),
  )
  let zone = @date.tzif_timezone(tzif_new_york)
  let start = @date.datetime(2400, 11, 5, hour=5).to_ordinal()
  let end = @date.datetime(2400, 11, 5, hour=7).to_ordinal()
  let fold = @date.date_tick_values(start, end, count=3, timezone=zone)
  assert_eq(@date.format_date_ticks(fold, format="%H:%M %Z", timezone=zone), [
    "01:00 EDT", "01:00 EST", "02:00 EST",
  ])
}

///|
test "TZif parser errors use DateError and never partially accept input" {
  for data in [b"", b"TZif2", tzif_new_york[:30].to_owned()] {
    assert_true(
      try {
        ignore(@date.tzif_timezone(data))
        false
      } catch {
        @date.DateError::InvalidDate(_) => true
        _ => false
      },
    )
  }
  for version in [b'\x00', b'4'] {
    let bytes = tzif_new_york.to_array()
    bytes[4] = version
    assert_true(
      try {
        ignore(@date.tzif_timezone(Bytes::from_array(bytes)))
        false
      } catch {
        _ => true
      },
    )
  }
}

///|
test "TZif rejects leap-second clocks and overlarge offsets explicitly" {
  assert_true(
    try {
      ignore(@date.tzif_timezone(tzif_leap))
      false
    } catch {
      @date.DateError::InvalidDate(message~) => message.contains("leap-second")
      _ => false
    },
  )
  assert_true(
    try {
      ignore(@date.tzif_timezone(tzif_outsize_offset))
      false
    } catch {
      @date.DateError::InvalidDate(message~) =>
        message.contains("offset_seconds")
      _ => false
    },
  )
}

///|
test "TZif empty footer retains last type and rule-only files use future rules" {
  let fixed = @date.tzif_timezone(tzif_fixed)
  assert_eq(
    fixed.offset_seconds_at(@date.datetime(9000, 1, 1).to_ordinal()),
    561,
  )
  let rules = @date.tzif_timezone(tzif_rule_only)
  assert_eq(
    rules.offset_seconds_at(@date.datetime(1800, 7, 1).to_ordinal()),
    -14400,
  )
  assert_eq(
    rules.offset_seconds_at(@date.datetime(2400, 1, 1).to_ordinal()),
    -18000,
  )
  let zone = @date.tzif_timezone(tzif_outside_calendar)
  assert_eq(zone.initial_offset_seconds(), 3600)
  assert_true(zone.transitions().is_empty())
  assert_eq(
    zone.offset_seconds_at(@date.datetime(9999, 12, 31).to_ordinal()),
    3600,
  )
  assert_true(
    try {
      ignore(zone.offset_seconds_at(1.0 / 0.0))
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        fixed.to_datetime(
          @date.datetime(9999, 12, 31, hour=23, minute=59).to_ordinal(),
        ),
      )
      false
    } catch {
      _ => true
    },
  )
}

///|
test "ISO exact offset suffixes preserve historical seconds" {
  for suffix in ["+000921", "+00:09:21"] {
    let date = @date.parse_iso("1900-01-01T00:09:21" + suffix)
    assert_eq(date.offset_seconds(), 561)
    assert_eq(date.to_ordinal(), @date.datetime(1900, 1, 1).to_ordinal())
  }
  assert_eq(
    @date.parse_iso("1800-01-01T00:00:00-04:56:02").offset_seconds(),
    -17762,
  )
  for suffix in ["+00:09:60", "+000961", "+24:00:00", "+00:09:2", "+00:09:xx"] {
    assert_true(
      try {
        ignore(@date.parse_iso("1900-01-01T00:00:00" + suffix))
        false
      } catch {
        _ => true
      },
    )
  }
}
