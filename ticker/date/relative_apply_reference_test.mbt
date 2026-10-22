// Generated from original relativedelta.__add__ and reference datetime.timedelta.

///|
test "relative delta original application 0" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new()
  {
    let result = @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1, 1, 1, 0, 0, 0, 0, 0],
    )
  }
  {
    let result = @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [9999, 12, 31, 23, 59, 59, 999999, 0],
    )
  }
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2020, 1, 31, 23, 58, 57, 123457, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 2, 29, 12, 30, 0, 0, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1970, 1, 1, 0, 0, 0, 1, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 3, 9, 2, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 3, 10, 1, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 11, 2, 1, 30, 0, 0, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 11, 3, 1, 30, 0, 0, -14400],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2400, 3, 11, 2, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 10, 5, 2, 15, 0, 0, 37800],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 4, 7, 1, 45, 0, 0, 39600],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2400, 3, 11, 2, 30, 0, 0, -18000],
  )
}

///|
test "relative delta original application 1" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(months=1L)
  {
    let result = @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1, 2, 1, 0, 0, 0, 0, 0],
    )
  }
  assert_true(
    try {
      ignore(
        @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
          delta,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2020, 2, 29, 23, 58, 57, 123457, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 3, 29, 12, 30, 0, 0, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1970, 2, 1, 0, 0, 0, 1, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 4, 9, 2, 30, 0, 0, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 4, 10, 1, 30, 0, 0, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 12, 2, 1, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 12, 3, 1, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2400, 4, 11, 2, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 11, 5, 2, 15, 0, 0, 39600],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 5, 7, 1, 45, 0, 0, 37800],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2400, 4, 11, 2, 30, 0, 0, -14400],
  )
}

///|
test "relative delta original application 2" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(months=-1L)
  assert_true(
    try {
      ignore(
        @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  {
    let result = @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [9999, 11, 30, 23, 59, 59, 999999, 0],
    )
  }
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2019, 12, 31, 23, 58, 57, 123457, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 1, 29, 12, 30, 0, 0, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1969, 12, 1, 0, 0, 0, 1, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 2, 9, 2, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 2, 10, 1, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 10, 2, 1, 30, 0, 0, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 10, 3, 1, 30, 0, 0, -14400],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2400, 2, 11, 2, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 9, 5, 2, 15, 0, 0, 37800],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 3, 7, 1, 45, 0, 0, 39600],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2400, 2, 11, 2, 30, 0, 0, -18000],
  )
}

///|
test "relative delta original application 3" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(years=1L)
  {
    let result = @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2, 1, 1, 0, 0, 0, 0, 0],
    )
  }
  assert_true(
    try {
      ignore(
        @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
          delta,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2021, 1, 31, 23, 58, 57, 123457, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2025, 2, 28, 12, 30, 0, 0, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1971, 1, 1, 0, 0, 0, 1, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2025, 3, 9, 2, 30, 0, 0, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2025, 3, 10, 1, 30, 0, 0, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2025, 11, 2, 1, 30, 0, 0, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2025, 11, 3, 1, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2401, 3, 11, 2, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2025, 10, 5, 2, 15, 0, 0, 39600],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2025, 4, 7, 1, 45, 0, 0, 37800],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2401, 3, 11, 2, 30, 0, 0, -14400],
  )
}

///|
test "relative delta original application 4" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(years=-4L, months=13L)
  assert_true(
    try {
      ignore(
        @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  {
    let result = @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [9997, 1, 31, 23, 59, 59, 999999, 0],
    )
  }
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2017, 2, 28, 23, 58, 57, 123457, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2021, 3, 29, 12, 30, 0, 0, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1967, 2, 1, 0, 0, 0, 1, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2021, 4, 9, 2, 30, 0, 0, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2021, 4, 10, 1, 30, 0, 0, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2021, 12, 2, 1, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2021, 12, 3, 1, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2397, 4, 11, 2, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2021, 11, 5, 2, 15, 0, 0, 39600],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2021, 5, 7, 1, 45, 0, 0, 37800],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2397, 4, 11, 2, 30, 0, 0, -14400],
  )
}

///|
test "relative delta original application 5" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(year=0, month=0, day=0)
  {
    let result = @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1, 1, 1, 0, 0, 0, 0, 0],
    )
  }
  {
    let result = @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [9999, 12, 31, 23, 59, 59, 999999, 0],
    )
  }
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2020, 1, 31, 23, 58, 57, 123457, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 2, 29, 12, 30, 0, 0, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1970, 1, 1, 0, 0, 0, 1, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 3, 9, 2, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 3, 10, 1, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 11, 2, 1, 30, 0, 0, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 11, 3, 1, 30, 0, 0, -14400],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2400, 3, 11, 2, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 10, 5, 2, 15, 0, 0, 37800],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 4, 7, 1, 45, 0, 0, 39600],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2400, 3, 11, 2, 30, 0, 0, -18000],
  )
}

///|
test "relative delta original application 6" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(month=13)
  assert_true(
    try {
      ignore(
        @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
          delta,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
          delta,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
          delta,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("2024-03-09T02:30:00-05:00")
        .with_timezone(@date.get_timezone(name="D13/reference-NY"))
        .add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("2024-03-10T01:30:00-05:00")
        .with_timezone(@date.get_timezone(name="D13/reference-NY"))
        .add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("2024-11-02T01:30:00-04:00")
        .with_timezone(@date.get_timezone(name="D13/reference-NY"))
        .add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("2024-11-03T01:30:00-05:00")
        .with_timezone(@date.get_timezone(name="D13/reference-NY"))
        .add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("2400-03-11T02:30:00-05:00")
        .with_timezone(@date.get_timezone(name="D13/reference-NY"))
        .add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("2024-10-05T02:15:00+10:30")
        .with_timezone(@date.get_timezone(name="D13/reference-LH"))
        .add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("2024-04-07T01:45:00+10:30")
        .with_timezone(@date.get_timezone(name="D13/reference-LH"))
        .add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("2400-03-11T02:30:00-05:00")
        .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
        .add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
}

///|
test "relative delta original application 7" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(month=25, months=-11L)
  {
    let result = @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2, 2, 1, 0, 0, 0, 0, 0],
    )
  }
  assert_true(
    try {
      ignore(
        @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
          delta,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2021, 2, 28, 23, 58, 57, 123457, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2025, 2, 28, 12, 30, 0, 0, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1971, 2, 1, 0, 0, 0, 1, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2025, 2, 9, 2, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2025, 2, 10, 1, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2025, 2, 2, 1, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2025, 2, 3, 1, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2401, 2, 11, 2, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2025, 2, 5, 2, 15, 0, 0, 39600],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2025, 2, 7, 1, 45, 0, 0, 39600],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2401, 2, 11, 2, 30, 0, 0, -18000],
  )
}

///|
test "relative delta original application 8" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(year=0, years=1L)
  {
    let result = @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2, 1, 1, 0, 0, 0, 0, 0],
    )
  }
  assert_true(
    try {
      ignore(
        @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
          delta,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2021, 1, 31, 23, 58, 57, 123457, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2025, 2, 28, 12, 30, 0, 0, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1971, 1, 1, 0, 0, 0, 1, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2025, 3, 9, 2, 30, 0, 0, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2025, 3, 10, 1, 30, 0, 0, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2025, 11, 2, 1, 30, 0, 0, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2025, 11, 3, 1, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2401, 3, 11, 2, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2025, 10, 5, 2, 15, 0, 0, 39600],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2025, 4, 7, 1, 45, 0, 0, 37800],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2401, 3, 11, 2, 30, 0, 0, -14400],
  )
}

///|
test "relative delta original application 9" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(days=1.5, hours=2.25)
  {
    let result = @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1, 1, 2, 14, 15, 0, 0, 0],
    )
  }
  assert_true(
    try {
      ignore(
        @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
          delta,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2020, 2, 2, 14, 13, 57, 123457, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 3, 2, 2, 45, 0, 0, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1970, 1, 2, 14, 15, 0, 1, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 3, 10, 16, 45, 0, 0, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 3, 11, 15, 45, 0, 0, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 11, 3, 15, 45, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 11, 4, 15, 45, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2400, 3, 12, 16, 45, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 10, 6, 16, 30, 0, 0, 39600],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 4, 8, 16, 0, 0, 0, 37800],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2400, 3, 12, 16, 45, 0, 0, -14400],
  )
}

///|
test "relative delta original application 10" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(hours=25.0, day=1, weekday=0)
  {
    let result = @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1, 1, 8, 1, 0, 0, 0, 0],
    )
  }
  {
    let result = @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [9999, 12, 6, 0, 59, 59, 999999, 0],
    )
  }
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2020, 1, 6, 0, 58, 57, 123457, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 2, 5, 13, 30, 0, 0, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1970, 1, 5, 1, 0, 0, 1, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 3, 4, 3, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 3, 4, 2, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 11, 4, 2, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 11, 4, 2, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2400, 3, 6, 3, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 10, 7, 3, 15, 0, 0, 39600],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 4, 8, 2, 45, 0, 0, 37800],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2400, 3, 6, 3, 30, 0, 0, -18000],
  )
}

///|
test "relative delta original application 11" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(
    hours=-25.0,
    day=31,
    on_weekday=@date.RelativeWeekday::new(0, nth=-1),
  )
  {
    let result = @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1, 1, 29, 23, 0, 0, 0, 0],
    )
  }
  {
    let result = @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [9999, 12, 27, 22, 59, 59, 999999, 0],
    )
  }
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2020, 1, 27, 22, 58, 57, 123457, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 2, 26, 11, 30, 0, 0, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1970, 1, 26, 23, 0, 0, 1, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 3, 25, 1, 30, 0, 0, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 3, 25, 0, 30, 0, 0, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 11, 25, 0, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 11, 25, 0, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2400, 3, 27, 1, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 10, 28, 1, 15, 0, 0, 39600],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 4, 29, 0, 45, 0, 0, 37800],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2400, 3, 27, 1, 30, 0, 0, -14400],
  )
}

///|
test "relative delta original application 12" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(day=32)
  {
    let result = @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1, 1, 31, 0, 0, 0, 0, 0],
    )
  }
  {
    let result = @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [9999, 12, 31, 23, 59, 59, 999999, 0],
    )
  }
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2020, 1, 31, 23, 58, 57, 123457, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 2, 29, 12, 30, 0, 0, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1970, 1, 31, 0, 0, 0, 1, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 3, 31, 2, 30, 0, 0, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 3, 31, 1, 30, 0, 0, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 11, 30, 1, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 11, 30, 1, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2400, 3, 31, 2, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 10, 31, 2, 15, 0, 0, 39600],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 4, 30, 1, 45, 0, 0, 37800],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2400, 3, 31, 2, 30, 0, 0, -14400],
  )
}

///|
test "relative delta original application 13" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(day=0)
  {
    let result = @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1, 1, 1, 0, 0, 0, 0, 0],
    )
  }
  {
    let result = @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [9999, 12, 31, 23, 59, 59, 999999, 0],
    )
  }
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2020, 1, 31, 23, 58, 57, 123457, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 2, 29, 12, 30, 0, 0, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1970, 1, 1, 0, 0, 0, 1, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 3, 9, 2, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 3, 10, 1, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 11, 2, 1, 30, 0, 0, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 11, 3, 1, 30, 0, 0, -14400],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2400, 3, 11, 2, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 10, 5, 2, 15, 0, 0, 37800],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 4, 7, 1, 45, 0, 0, 39600],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2400, 3, 11, 2, 30, 0, 0, -18000],
  )
}

///|
test "relative delta original application 14" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(day=-1)
  assert_true(
    try {
      ignore(
        @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
          delta,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
          delta,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
          delta,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("2024-03-09T02:30:00-05:00")
        .with_timezone(@date.get_timezone(name="D13/reference-NY"))
        .add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("2024-03-10T01:30:00-05:00")
        .with_timezone(@date.get_timezone(name="D13/reference-NY"))
        .add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("2024-11-02T01:30:00-04:00")
        .with_timezone(@date.get_timezone(name="D13/reference-NY"))
        .add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("2024-11-03T01:30:00-05:00")
        .with_timezone(@date.get_timezone(name="D13/reference-NY"))
        .add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("2400-03-11T02:30:00-05:00")
        .with_timezone(@date.get_timezone(name="D13/reference-NY"))
        .add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("2024-10-05T02:15:00+10:30")
        .with_timezone(@date.get_timezone(name="D13/reference-LH"))
        .add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("2024-04-07T01:45:00+10:30")
        .with_timezone(@date.get_timezone(name="D13/reference-LH"))
        .add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("2400-03-11T02:30:00-05:00")
        .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
        .add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
}

///|
test "relative delta original application 15" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(hour=24)
  assert_true(
    try {
      ignore(
        @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
          delta,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
          delta,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
          delta,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("2024-03-09T02:30:00-05:00")
        .with_timezone(@date.get_timezone(name="D13/reference-NY"))
        .add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("2024-03-10T01:30:00-05:00")
        .with_timezone(@date.get_timezone(name="D13/reference-NY"))
        .add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("2024-11-02T01:30:00-04:00")
        .with_timezone(@date.get_timezone(name="D13/reference-NY"))
        .add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("2024-11-03T01:30:00-05:00")
        .with_timezone(@date.get_timezone(name="D13/reference-NY"))
        .add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("2400-03-11T02:30:00-05:00")
        .with_timezone(@date.get_timezone(name="D13/reference-NY"))
        .add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("2024-10-05T02:15:00+10:30")
        .with_timezone(@date.get_timezone(name="D13/reference-LH"))
        .add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("2024-04-07T01:45:00+10:30")
        .with_timezone(@date.get_timezone(name="D13/reference-LH"))
        .add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("2400-03-11T02:30:00-05:00")
        .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
        .add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
}

///|
test "relative delta original application 16" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(year=-1, years=2L)
  {
    let result = @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1, 1, 1, 0, 0, 0, 0, 0],
    )
  }
  {
    let result = @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1, 12, 31, 23, 59, 59, 999999, 0],
    )
  }
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1, 1, 31, 23, 58, 57, 123457, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1, 2, 28, 12, 30, 0, 0, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1, 1, 1, 0, 0, 0, 1, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1, 3, 9, 2, 30, 0, 0, -17762],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1, 3, 10, 1, 30, 0, 0, -17762],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1, 11, 2, 1, 30, 0, 0, -17762],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1, 11, 3, 1, 30, 0, 0, -17762],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1, 3, 11, 2, 30, 0, 0, -17762],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1, 10, 5, 2, 15, 0, 0, 38180],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1, 4, 7, 1, 45, 0, 0, 38180],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [1, 3, 11, 2, 30, 0, 0, -14400],
  )
}

///|
test "relative delta original application 17" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(year=2024, month=2, day=31)
  {
    let result = @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 2, 29, 0, 0, 0, 0, 0],
    )
  }
  {
    let result = @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 2, 29, 23, 59, 59, 999999, 0],
    )
  }
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 2, 29, 23, 58, 57, 123457, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 2, 29, 12, 30, 0, 0, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 2, 29, 0, 0, 0, 1, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 2, 29, 2, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 2, 29, 1, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 2, 29, 1, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 2, 29, 1, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 2, 29, 2, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 2, 29, 2, 15, 0, 0, 39600],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 2, 29, 1, 45, 0, 0, 39600],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2024, 2, 29, 2, 30, 0, 0, -18000],
  )
}

///|
test "relative delta original application 18" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(yearday=60)
  {
    let result = @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1, 3, 1, 0, 0, 0, 0, 0],
    )
  }
  {
    let result = @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [9999, 3, 1, 23, 59, 59, 999999, 0],
    )
  }
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2020, 2, 29, 23, 58, 57, 123457, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 2, 29, 12, 30, 0, 0, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1970, 3, 1, 0, 0, 0, 1, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 2, 29, 2, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 2, 29, 1, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 2, 29, 1, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 2, 29, 1, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2400, 2, 29, 2, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 2, 29, 2, 15, 0, 0, 39600],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 2, 29, 1, 45, 0, 0, 39600],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2400, 2, 29, 2, 30, 0, 0, -18000],
  )
}

///|
test "relative delta original application 19" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(yearday=366)
  {
    let result = @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1, 12, 31, 0, 0, 0, 0, 0],
    )
  }
  {
    let result = @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [9999, 12, 31, 23, 59, 59, 999999, 0],
    )
  }
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2020, 12, 30, 23, 58, 57, 123457, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 12, 30, 12, 30, 0, 0, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1970, 12, 31, 0, 0, 0, 1, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 12, 30, 2, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 12, 30, 1, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 12, 30, 1, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 12, 30, 1, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2400, 12, 30, 2, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 12, 30, 2, 15, 0, 0, 39600],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 12, 30, 1, 45, 0, 0, 39600],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2400, 12, 30, 2, 30, 0, 0, -18000],
  )
}

///|
test "relative delta original application 20" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(nlyearday=60)
  {
    let result = @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1, 3, 1, 0, 0, 0, 0, 0],
    )
  }
  {
    let result = @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [9999, 3, 1, 23, 59, 59, 999999, 0],
    )
  }
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2020, 3, 1, 23, 58, 57, 123457, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 3, 1, 12, 30, 0, 0, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1970, 3, 1, 0, 0, 0, 1, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 3, 1, 2, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 3, 1, 1, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 3, 1, 1, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 3, 1, 1, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2400, 3, 1, 2, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 3, 1, 2, 15, 0, 0, 39600],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 3, 1, 1, 45, 0, 0, 39600],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2400, 3, 1, 2, 30, 0, 0, -18000],
  )
}

///|
test "relative delta original application 21" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(leapdays=1.5)
  {
    let result = @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1, 1, 1, 0, 0, 0, 0, 0],
    )
  }
  {
    let result = @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [9999, 12, 31, 23, 59, 59, 999999, 0],
    )
  }
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2020, 1, 31, 23, 58, 57, 123457, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 2, 29, 12, 30, 0, 0, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1970, 1, 1, 0, 0, 0, 1, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 3, 10, 14, 30, 0, 0, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 3, 11, 13, 30, 0, 0, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 11, 3, 13, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 11, 4, 13, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2400, 3, 12, 14, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 10, 6, 14, 15, 0, 0, 39600],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 4, 8, 13, 45, 0, 0, 37800],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2400, 3, 12, 14, 30, 0, 0, -14400],
  )
}

///|
test "relative delta original application 22" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(days=1.0e+100, leapdays=-1.0e+100)
  assert_true(
    try {
      ignore(
        @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
          delta,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
          delta,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
          delta,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 3, 9, 2, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 3, 10, 1, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 11, 2, 1, 30, 0, 0, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 11, 3, 1, 30, 0, 0, -14400],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2400, 3, 11, 2, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 10, 5, 2, 15, 0, 0, 37800],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 4, 7, 1, 45, 0, 0, 39600],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2400, 3, 11, 2, 30, 0, 0, -18000],
  )
}

///|
test "relative delta original application 23" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(weekday=6)
  {
    let result = @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1, 1, 7, 0, 0, 0, 0, 0],
    )
  }
  assert_true(
    try {
      ignore(
        @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
          delta,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2020, 2, 2, 23, 58, 57, 123457, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 3, 3, 12, 30, 0, 0, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1970, 1, 4, 0, 0, 0, 1, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 3, 10, 2, 30, 0, 0, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 3, 10, 1, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 11, 3, 1, 30, 0, 0, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 11, 3, 1, 30, 0, 0, -14400],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2400, 3, 12, 2, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 10, 6, 2, 15, 0, 0, 39600],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 4, 7, 1, 45, 0, 0, 39600],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2400, 3, 12, 2, 30, 0, 0, -14400],
  )
}

///|
test "relative delta original application 24" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(
    on_weekday=@date.RelativeWeekday::new(0, nth=0),
  )
  {
    let result = @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1, 1, 1, 0, 0, 0, 0, 0],
    )
  }
  assert_true(
    try {
      ignore(
        @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
          delta,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2020, 2, 3, 23, 58, 57, 123457, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 3, 4, 12, 30, 0, 0, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1970, 1, 5, 0, 0, 0, 1, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 3, 11, 2, 30, 0, 0, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 3, 11, 1, 30, 0, 0, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 11, 4, 1, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 11, 4, 1, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2400, 3, 13, 2, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 10, 7, 2, 15, 0, 0, 39600],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 4, 8, 1, 45, 0, 0, 37800],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2400, 3, 13, 2, 30, 0, 0, -14400],
  )
}

///|
test "relative delta original application 25" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(
    on_weekday=@date.RelativeWeekday::new(-9999, nth=2),
  )
  {
    let result = @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1, 1, 12, 0, 0, 0, 0, 0],
    )
  }
  assert_true(
    try {
      ignore(
        @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
          delta,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2020, 2, 7, 23, 58, 57, 123457, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 3, 8, 12, 30, 0, 0, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1970, 1, 9, 0, 0, 0, 1, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 3, 22, 2, 30, 0, 0, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 3, 22, 1, 30, 0, 0, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 11, 15, 1, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 11, 15, 1, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2400, 3, 24, 2, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 10, 18, 2, 15, 0, 0, 39600],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 4, 19, 1, 45, 0, 0, 37800],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2400, 3, 24, 2, 30, 0, 0, -14400],
  )
}

///|
test "relative delta original application 26" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(
    on_weekday=@date.RelativeWeekday::new(6, nth=-2),
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  {
    let result = @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [9999, 12, 19, 23, 59, 59, 999999, 0],
    )
  }
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2020, 1, 19, 23, 58, 57, 123457, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 2, 18, 12, 30, 0, 0, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1969, 12, 21, 0, 0, 0, 1, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 2, 25, 2, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 3, 3, 1, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 10, 20, 1, 30, 0, 0, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 10, 27, 1, 30, 0, 0, -14400],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2400, 2, 27, 2, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 9, 22, 2, 15, 0, 0, 37800],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 3, 31, 1, 45, 0, 0, 39600],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2400, 2, 27, 2, 30, 0, 0, -18000],
  )
}

///|
test "relative delta original application 27" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(hours=1.0)
  {
    let result = @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1, 1, 1, 1, 0, 0, 0, 0],
    )
  }
  assert_true(
    try {
      ignore(
        @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
          delta,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2020, 2, 1, 0, 58, 57, 123457, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 2, 29, 13, 30, 0, 0, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1970, 1, 1, 1, 0, 0, 1, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 3, 9, 3, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 3, 10, 2, 30, 0, 0, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 11, 2, 2, 30, 0, 0, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 11, 3, 2, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2400, 3, 11, 3, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 10, 5, 3, 15, 0, 0, 37800],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 4, 7, 2, 45, 0, 0, 37800],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2400, 3, 11, 3, 30, 0, 0, -18000],
  )
}

///|
test "relative delta original application 28" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(days=1.0)
  {
    let result = @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1, 1, 2, 0, 0, 0, 0, 0],
    )
  }
  assert_true(
    try {
      ignore(
        @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
          delta,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2020, 2, 1, 23, 58, 57, 123457, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 3, 1, 12, 30, 0, 0, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1970, 1, 2, 0, 0, 0, 1, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 3, 10, 2, 30, 0, 0, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 3, 11, 1, 30, 0, 0, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 11, 3, 1, 30, 0, 0, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 11, 4, 1, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2400, 3, 12, 2, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 10, 6, 2, 15, 0, 0, 39600],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 4, 8, 1, 45, 0, 0, 37800],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2400, 3, 12, 2, 30, 0, 0, -14400],
  )
}

///|
test "relative delta original application 29" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(weeks=1.5)
  {
    let result = @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1, 1, 11, 12, 0, 0, 0, 0],
    )
  }
  assert_true(
    try {
      ignore(
        @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
          delta,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2020, 2, 11, 11, 58, 57, 123457, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 3, 11, 0, 30, 0, 0, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1970, 1, 11, 12, 0, 0, 1, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 3, 19, 14, 30, 0, 0, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 3, 20, 13, 30, 0, 0, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 11, 12, 13, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 11, 13, 13, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2400, 3, 21, 14, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 10, 15, 14, 15, 0, 0, 39600],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 4, 17, 13, 45, 0, 0, 37800],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2400, 3, 21, 14, 30, 0, 0, -14400],
  )
}

///|
test "relative delta original application 30" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(microseconds=0.5)
  {
    let result = @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1, 1, 1, 0, 0, 0, 0, 0],
    )
  }
  {
    let result = @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [9999, 12, 31, 23, 59, 59, 999999, 0],
    )
  }
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2020, 1, 31, 23, 58, 57, 123457, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 2, 29, 12, 30, 0, 0, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1970, 1, 1, 0, 0, 0, 1, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 3, 9, 2, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 3, 10, 1, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 11, 2, 1, 30, 0, 0, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 11, 3, 1, 30, 0, 0, -14400],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2400, 3, 11, 2, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 10, 5, 2, 15, 0, 0, 37800],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 4, 7, 1, 45, 0, 0, 39600],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2400, 3, 11, 2, 30, 0, 0, -18000],
  )
}

///|
test "relative delta original application 31" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(microseconds=-0.5)
  {
    let result = @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1, 1, 1, 0, 0, 0, 0, 0],
    )
  }
  {
    let result = @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [9999, 12, 31, 23, 59, 59, 999999, 0],
    )
  }
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2020, 1, 31, 23, 58, 57, 123457, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 2, 29, 12, 30, 0, 0, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1970, 1, 1, 0, 0, 0, 1, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 3, 9, 2, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 3, 10, 1, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 11, 2, 1, 30, 0, 0, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 11, 3, 1, 30, 0, 0, -14400],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2400, 3, 11, 2, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 10, 5, 2, 15, 0, 0, 37800],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 4, 7, 1, 45, 0, 0, 39600],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2400, 3, 11, 2, 30, 0, 0, -18000],
  )
}

///|
test "relative delta original application 32" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(microseconds=0.49999999999999994)
  {
    let result = @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1, 1, 1, 0, 0, 0, 0, 0],
    )
  }
  {
    let result = @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [9999, 12, 31, 23, 59, 59, 999999, 0],
    )
  }
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2020, 1, 31, 23, 58, 57, 123457, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 2, 29, 12, 30, 0, 0, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1970, 1, 1, 0, 0, 0, 1, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 3, 9, 2, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 3, 10, 1, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 11, 2, 1, 30, 0, 0, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 11, 3, 1, 30, 0, 0, -14400],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2400, 3, 11, 2, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 10, 5, 2, 15, 0, 0, 37800],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 4, 7, 1, 45, 0, 0, 39600],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2400, 3, 11, 2, 30, 0, 0, -18000],
  )
}

///|
test "relative delta original application 33" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(microseconds=-0.49999999999999994)
  {
    let result = @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1, 1, 1, 0, 0, 0, 0, 0],
    )
  }
  {
    let result = @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [9999, 12, 31, 23, 59, 59, 999999, 0],
    )
  }
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2020, 1, 31, 23, 58, 57, 123457, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 2, 29, 12, 30, 0, 0, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1970, 1, 1, 0, 0, 0, 1, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 3, 9, 2, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 3, 10, 1, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 11, 2, 1, 30, 0, 0, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 11, 3, 1, 30, 0, 0, -14400],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2400, 3, 11, 2, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 10, 5, 2, 15, 0, 0, 37800],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 4, 7, 1, 45, 0, 0, 39600],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2400, 3, 11, 2, 30, 0, 0, -18000],
  )
}

///|
test "relative delta original application 34" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(seconds=5.0e-07)
  {
    let result = @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1, 1, 1, 0, 0, 0, 0, 0],
    )
  }
  {
    let result = @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [9999, 12, 31, 23, 59, 59, 999999, 0],
    )
  }
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2020, 1, 31, 23, 58, 57, 123457, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 2, 29, 12, 30, 0, 0, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1970, 1, 1, 0, 0, 0, 1, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 3, 9, 2, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 3, 10, 1, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 11, 2, 1, 30, 0, 0, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 11, 3, 1, 30, 0, 0, -14400],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2400, 3, 11, 2, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 10, 5, 2, 15, 0, 0, 37800],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 4, 7, 1, 45, 0, 0, 39600],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2400, 3, 11, 2, 30, 0, 0, -18000],
  )
}

///|
test "relative delta original application 35" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(days=5.787037e-12)
  {
    let result = @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1, 1, 1, 0, 0, 0, 0, 0],
    )
  }
  {
    let result = @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [9999, 12, 31, 23, 59, 59, 999999, 0],
    )
  }
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2020, 1, 31, 23, 58, 57, 123457, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 2, 29, 12, 30, 0, 0, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1970, 1, 1, 0, 0, 0, 1, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 3, 9, 2, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 3, 10, 1, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 11, 2, 1, 30, 0, 0, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 11, 3, 1, 30, 0, 0, -14400],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2400, 3, 11, 2, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 10, 5, 2, 15, 0, 0, 37800],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 4, 7, 1, 45, 0, 0, 39600],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2400, 3, 11, 2, 30, 0, 0, -18000],
  )
}

///|
test "relative delta original application 36" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(microseconds=1.5, seconds=-1.0e-06)
  {
    let result = @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1, 1, 1, 0, 0, 0, 0, 0],
    )
  }
  {
    let result = @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [9999, 12, 31, 23, 59, 59, 999999, 0],
    )
  }
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2020, 1, 31, 23, 58, 57, 123457, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 2, 29, 12, 30, 0, 0, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1970, 1, 1, 0, 0, 0, 1, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 3, 9, 2, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 3, 10, 1, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 11, 2, 1, 30, 0, 0, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 11, 3, 1, 30, 0, 0, -14400],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2400, 3, 11, 2, 30, 0, 0, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 10, 5, 2, 15, 0, 0, 37800],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 4, 7, 1, 45, 0, 0, 39600],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2400, 3, 11, 2, 30, 0, 0, -18000],
  )
}

///|
test "relative delta original application 37" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(years=9223372036854775807L)
  assert_true(
    try {
      ignore(
        @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
          delta,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
          delta,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
          delta,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("2024-03-09T02:30:00-05:00")
        .with_timezone(@date.get_timezone(name="D13/reference-NY"))
        .add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("2024-03-10T01:30:00-05:00")
        .with_timezone(@date.get_timezone(name="D13/reference-NY"))
        .add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("2024-11-02T01:30:00-04:00")
        .with_timezone(@date.get_timezone(name="D13/reference-NY"))
        .add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("2024-11-03T01:30:00-05:00")
        .with_timezone(@date.get_timezone(name="D13/reference-NY"))
        .add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("2400-03-11T02:30:00-05:00")
        .with_timezone(@date.get_timezone(name="D13/reference-NY"))
        .add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("2024-10-05T02:15:00+10:30")
        .with_timezone(@date.get_timezone(name="D13/reference-LH"))
        .add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("2024-04-07T01:45:00+10:30")
        .with_timezone(@date.get_timezone(name="D13/reference-LH"))
        .add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("2400-03-11T02:30:00-05:00")
        .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
        .add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
}

///|
test "relative delta original application 38" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(months=-9223372036854775808L)
  assert_true(
    try {
      ignore(
        @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
          delta,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
          delta,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
          delta,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("2024-03-09T02:30:00-05:00")
        .with_timezone(@date.get_timezone(name="D13/reference-NY"))
        .add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("2024-03-10T01:30:00-05:00")
        .with_timezone(@date.get_timezone(name="D13/reference-NY"))
        .add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("2024-11-02T01:30:00-04:00")
        .with_timezone(@date.get_timezone(name="D13/reference-NY"))
        .add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("2024-11-03T01:30:00-05:00")
        .with_timezone(@date.get_timezone(name="D13/reference-NY"))
        .add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("2400-03-11T02:30:00-05:00")
        .with_timezone(@date.get_timezone(name="D13/reference-NY"))
        .add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("2024-10-05T02:15:00+10:30")
        .with_timezone(@date.get_timezone(name="D13/reference-LH"))
        .add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("2024-04-07T01:45:00+10:30")
        .with_timezone(@date.get_timezone(name="D13/reference-LH"))
        .add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("2400-03-11T02:30:00-05:00")
        .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
        .add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
}

///|
test "relative delta original application 39" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(
    on_weekday=@date.RelativeWeekday::new(0, nth=-2147483648),
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
          delta,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
          delta,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
          delta,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("2024-03-09T02:30:00-05:00")
        .with_timezone(@date.get_timezone(name="D13/reference-NY"))
        .add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("2024-03-10T01:30:00-05:00")
        .with_timezone(@date.get_timezone(name="D13/reference-NY"))
        .add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("2024-11-02T01:30:00-04:00")
        .with_timezone(@date.get_timezone(name="D13/reference-NY"))
        .add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("2024-11-03T01:30:00-05:00")
        .with_timezone(@date.get_timezone(name="D13/reference-NY"))
        .add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("2400-03-11T02:30:00-05:00")
        .with_timezone(@date.get_timezone(name="D13/reference-NY"))
        .add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("2024-10-05T02:15:00+10:30")
        .with_timezone(@date.get_timezone(name="D13/reference-LH"))
        .add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("2024-04-07T01:45:00+10:30")
        .with_timezone(@date.get_timezone(name="D13/reference-LH"))
        .add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("2400-03-11T02:30:00-05:00")
        .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
        .add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
}

///|
test "relative delta original application 40" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(
    years=-2L,
    months=17L,
    days=-1.375,
    hours=-2.9,
    minutes=41.7,
    seconds=-1.0625,
    microseconds=95517.3,
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  {
    let result = @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [9999, 5, 30, 12, 47, 41, 33016, 0],
    )
  }
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2019, 6, 29, 12, 46, 38, 156474, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2023, 7, 28, 1, 17, 41, 33017, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1969, 5, 30, 12, 47, 41, 33018, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2023, 8, 7, 15, 17, 41, 33017, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2023, 8, 8, 14, 17, 41, 33017, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 3, 31, 14, 17, 41, 33017, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 4, 1, 14, 17, 41, 33017, -14400],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2399, 8, 9, 15, 17, 41, 33017, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 3, 3, 15, 2, 41, 33017, 39600],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2023, 9, 5, 14, 32, 41, 33017, 37800],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2399, 8, 9, 15, 17, 41, 33017, -14400],
  )
}

///|
test "relative delta original application 41" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(
    years=2L,
    months=-2L,
    days=5.125,
    hours=-4.7,
    minutes=40.6,
    seconds=1.3125,
    microseconds=-78018.5,
  )
  {
    let result = @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2, 11, 5, 22, 58, 37, 234481, 0],
    )
  }
  assert_true(
    try {
      ignore(
        @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
          delta,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2021, 12, 5, 22, 57, 34, 357938, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 1, 3, 11, 28, 37, 234481, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1971, 11, 5, 22, 58, 37, 234482, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 1, 14, 1, 28, 37, 234481, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 1, 15, 0, 28, 37, 234481, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 9, 7, 0, 28, 37, 234481, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 9, 8, 0, 28, 37, 234481, -14400],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2402, 1, 16, 1, 28, 37, 234481, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 8, 10, 1, 13, 37, 234481, 37800],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 2, 12, 0, 43, 37, 234481, 39600],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2402, 1, 16, 1, 28, 37, 234481, -18000],
  )
}

///|
test "relative delta original application 42" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(
    years=3L,
    months=-20L,
    days=1.5,
    hours=4.4,
    minutes=-30.1,
    seconds=0.375,
    microseconds=109561.4,
  )
  {
    let result = @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2, 5, 2, 15, 53, 54, 484561, 0],
    )
  }
  assert_true(
    try {
      ignore(
        @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
          delta,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2021, 6, 2, 15, 52, 51, 608018, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2025, 7, 1, 4, 23, 54, 484561, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1971, 5, 2, 15, 53, 54, 484562, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2025, 7, 10, 18, 23, 54, 484561, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2025, 7, 11, 17, 23, 54, 484561, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 3, 3, 17, 23, 54, 484561, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 3, 4, 17, 23, 54, 484561, -18000],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2401, 7, 12, 18, 23, 54, 484561, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 2, 6, 18, 8, 54, 484561, 39600],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2025, 8, 8, 17, 38, 54, 484561, 37800],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2401, 7, 12, 18, 23, 54, 484561, -14400],
  )
}

///|
test "relative delta original application 43" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(
    years=3L,
    months=22L,
    days=0.875,
    hours=-1.2,
    minutes=25.1,
    seconds=-1.1875,
    microseconds=157627.5,
  )
  {
    let result = @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [5, 11, 1, 20, 13, 4, 970128, 0],
    )
  }
  assert_true(
    try {
      ignore(
        @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
          delta,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 12, 1, 20, 12, 2, 93585, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2028, 12, 30, 8, 43, 4, 970128, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1974, 11, 1, 20, 13, 4, 970129, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2029, 1, 9, 22, 43, 4, 970128, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2029, 1, 10, 21, 43, 4, 970128, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2029, 9, 2, 21, 43, 4, 970128, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2029, 9, 3, 21, 43, 4, 970128, -14400],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2405, 1, 11, 22, 43, 4, 970128, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2029, 8, 5, 22, 28, 4, 970128, 37800],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2029, 2, 7, 21, 58, 4, 970128, 39600],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2405, 1, 11, 22, 43, 4, 970128, -18000],
  )
}

///|
test "relative delta original application 44" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(
    years=2L,
    months=7L,
    days=4.125,
    hours=-3.8,
    minutes=-29.0,
    seconds=-4.625,
    microseconds=-166610.6,
  )
  {
    let result = @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [3, 8, 4, 22, 42, 55, 208389, 0],
    )
  }
  assert_true(
    try {
      ignore(
        @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
          delta,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2022, 9, 4, 22, 41, 52, 331846, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 10, 3, 11, 12, 55, 208389, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1972, 8, 4, 22, 42, 55, 208390, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 10, 13, 1, 12, 55, 208389, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 10, 14, 0, 12, 55, 208389, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2027, 6, 6, 0, 12, 55, 208389, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2027, 6, 7, 0, 12, 55, 208389, -14400],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2402, 10, 15, 1, 12, 55, 208389, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2027, 5, 9, 0, 57, 55, 208389, 37800],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 11, 11, 0, 27, 55, 208389, 39600],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2402, 10, 15, 1, 12, 55, 208389, -14400],
  )
}

///|
test "relative delta original application 45" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(
    years=-3L,
    months=10L,
    days=5.5,
    hours=-0.1,
    minutes=8.4,
    seconds=4.1875,
    microseconds=-61223.8,
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  {
    let result = @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [9997, 11, 6, 12, 2, 28, 126275, 0],
    )
  }
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2017, 12, 6, 12, 1, 25, 249733, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2022, 1, 4, 0, 32, 28, 126276, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1967, 11, 6, 12, 2, 28, 126277, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2022, 1, 14, 14, 32, 28, 126276, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2022, 1, 15, 13, 32, 28, 126276, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2022, 9, 7, 13, 32, 28, 126276, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2022, 9, 8, 13, 32, 28, 126276, -14400],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2398, 1, 16, 14, 32, 28, 126276, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2022, 8, 10, 14, 17, 28, 126276, 37800],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2022, 2, 12, 13, 47, 28, 126276, 39600],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2398, 1, 16, 14, 32, 28, 126276, -18000],
  )
}

///|
test "relative delta original application 46" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(
    years=3L,
    months=-6L,
    days=3.0,
    hours=-3.3,
    minutes=56.3,
    seconds=-5.9375,
    microseconds=26217.2,
  )
  {
    let result = @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [3, 7, 3, 21, 38, 12, 88717, 0],
    )
  }
  assert_true(
    try {
      ignore(
        @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
          delta,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2022, 8, 3, 21, 37, 9, 212174, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 9, 1, 10, 8, 12, 88717, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1972, 7, 3, 21, 38, 12, 88718, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 9, 12, 0, 8, 12, 88717, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 9, 12, 23, 8, 12, 88717, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2027, 5, 4, 23, 8, 12, 88717, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2027, 5, 5, 23, 8, 12, 88717, -14400],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2402, 9, 14, 0, 8, 12, 88717, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2027, 4, 7, 23, 53, 12, 88717, 37800],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 10, 9, 23, 23, 12, 88717, 39600],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2402, 9, 14, 0, 8, 12, 88717, -14400],
  )
}

///|
test "relative delta original application 47" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(
    years=0L,
    months=-4L,
    days=4.125,
    hours=0.3,
    minutes=-32.5,
    seconds=-4.0,
    microseconds=94273.9,
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  {
    let result = @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [9999, 9, 5, 2, 45, 26, 94273, 0],
    )
  }
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2019, 10, 5, 2, 44, 23, 217731, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2023, 11, 2, 15, 15, 26, 94274, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1969, 9, 5, 2, 45, 26, 94275, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2023, 11, 13, 5, 15, 26, 94274, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2023, 11, 14, 4, 15, 26, 94274, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 7, 6, 4, 15, 26, 94274, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 7, 7, 4, 15, 26, 94274, -14400],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2399, 11, 15, 5, 15, 26, 94274, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 6, 9, 5, 0, 26, 94274, 37800],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2023, 12, 11, 4, 30, 26, 94274, 39600],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2399, 11, 15, 5, 15, 26, 94274, -18000],
  )
}

///|
test "relative delta original application 48" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(
    years=1L,
    months=19L,
    days=5.875,
    hours=0.1,
    minutes=5.0,
    seconds=2.9375,
    microseconds=72207.6,
  )
  {
    let result = @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [3, 8, 6, 21, 11, 3, 9708, 0],
    )
  }
  assert_true(
    try {
      ignore(
        @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
          delta,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2022, 9, 6, 21, 10, 0, 133165, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 10, 5, 9, 41, 3, 9708, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1972, 8, 6, 21, 11, 3, 9709, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 10, 14, 23, 41, 3, 9708, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 10, 15, 22, 41, 3, 9708, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2027, 6, 7, 22, 41, 3, 9708, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2027, 6, 8, 22, 41, 3, 9708, -14400],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2402, 10, 16, 23, 41, 3, 9708, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2027, 5, 10, 23, 26, 3, 9708, 37800],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 11, 12, 22, 56, 3, 9708, 39600],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2402, 10, 16, 23, 41, 3, 9708, -14400],
  )
}

///|
test "relative delta original application 49" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(
    years=-4L,
    months=-3L,
    days=4.75,
    hours=3.4,
    minutes=40.6,
    seconds=6.5625,
    microseconds=-135107.6,
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  {
    let result = @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [9995, 10, 5, 22, 4, 42, 427391, 0],
    )
  }
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2015, 11, 5, 22, 3, 39, 550849, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2019, 12, 4, 10, 34, 42, 427392, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1965, 10, 5, 22, 4, 42, 427393, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2019, 12, 14, 0, 34, 42, 427392, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2019, 12, 14, 23, 34, 42, 427392, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2020, 8, 6, 23, 34, 42, 427392, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2020, 8, 7, 23, 34, 42, 427392, -14400],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2395, 12, 16, 0, 34, 42, 427392, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2020, 7, 10, 0, 19, 42, 427392, 37800],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2020, 1, 11, 23, 49, 42, 427392, 39600],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2395, 12, 16, 0, 34, 42, 427392, -18000],
  )
}

///|
test "relative delta original application 50" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(
    years=0L,
    months=-7L,
    days=-5.5,
    hours=3.2,
    minutes=-55.2,
    seconds=5.875,
    microseconds=120954.2,
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  {
    let result = @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [9999, 5, 26, 14, 16, 53, 995953, 0],
    )
  }
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2019, 6, 25, 14, 15, 51, 119411, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2023, 7, 24, 2, 46, 53, 995954, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1969, 5, 26, 14, 16, 53, 995955, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2023, 8, 3, 16, 46, 53, 995954, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2023, 8, 4, 15, 46, 53, 995954, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 3, 27, 15, 46, 53, 995954, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 3, 28, 15, 46, 53, 995954, -14400],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2399, 8, 5, 16, 46, 53, 995954, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 2, 28, 16, 31, 53, 995954, 39600],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2023, 9, 1, 16, 1, 53, 995954, 37800],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2399, 8, 5, 16, 46, 53, 995954, -14400],
  )
}

///|
test "relative delta original application 51" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(
    years=0L,
    months=21L,
    days=-4.25,
    hours=0.4,
    minutes=29.4,
    seconds=-6.0625,
    microseconds=179768.3,
  )
  {
    let result = @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2, 9, 26, 18, 53, 18, 117268, 0],
    )
  }
  assert_true(
    try {
      ignore(
        @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
          delta,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2021, 10, 27, 18, 52, 15, 240725, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2025, 11, 25, 7, 23, 18, 117268, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1971, 9, 26, 18, 53, 18, 117269, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2025, 12, 4, 21, 23, 18, 117268, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2025, 12, 5, 20, 23, 18, 117268, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 7, 28, 20, 23, 18, 117268, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 7, 29, 20, 23, 18, 117268, -14400],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2401, 12, 6, 21, 23, 18, 117268, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 6, 30, 21, 8, 18, 117268, 37800],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 1, 2, 20, 38, 18, 117268, 39600],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2401, 12, 6, 21, 23, 18, 117268, -18000],
  )
}

///|
test "relative delta original application 52" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(
    years=-1L,
    months=21L,
    days=6.25,
    hours=4.6,
    minutes=-22.9,
    seconds=3.125,
    microseconds=-180230.7,
  )
  {
    let result = @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1, 10, 7, 10, 13, 8, 944769, 0],
    )
  }
  assert_true(
    try {
      ignore(
        @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
          delta,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2020, 11, 7, 10, 12, 6, 68226, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 12, 5, 22, 43, 8, 944769, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1970, 10, 7, 10, 13, 8, 944770, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 12, 15, 12, 43, 8, 944769, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 12, 16, 11, 43, 8, 944769, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2025, 8, 8, 11, 43, 8, 944769, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2025, 8, 9, 11, 43, 8, 944769, -14400],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2400, 12, 17, 12, 43, 8, 944769, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2025, 7, 11, 12, 28, 8, 944769, 37800],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2025, 1, 13, 11, 58, 8, 944769, 39600],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2400, 12, 17, 12, 43, 8, 944769, -18000],
  )
}

///|
test "relative delta original application 53" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(
    years=4L,
    months=-13L,
    days=3.875,
    hours=-2.3,
    minutes=-46.6,
    seconds=1.6875,
    microseconds=61596.8,
  )
  {
    let result = @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [3, 12, 4, 17, 55, 25, 749097, 0],
    )
  }
  assert_true(
    try {
      ignore(
        @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
          delta,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2023, 1, 4, 17, 54, 22, 872554, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2027, 2, 2, 6, 25, 25, 749097, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1972, 12, 4, 17, 55, 25, 749098, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2027, 2, 12, 20, 25, 25, 749097, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2027, 2, 13, 19, 25, 25, 749097, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2027, 10, 5, 19, 25, 25, 749097, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2027, 10, 6, 19, 25, 25, 749097, -14400],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2403, 2, 14, 20, 25, 25, 749097, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2027, 9, 8, 20, 10, 25, 749097, 37800],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2027, 3, 10, 19, 40, 25, 749097, 39600],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2403, 2, 14, 20, 25, 25, 749097, -18000],
  )
}

///|
test "relative delta original application 54" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(
    years=2L,
    months=-24L,
    days=1.375,
    hours=-0.1,
    minutes=16.0,
    seconds=-4.125,
    microseconds=-135683.6,
  )
  {
    let result = @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1, 1, 2, 9, 9, 55, 739316, 0],
    )
  }
  assert_true(
    try {
      ignore(
        @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
          delta,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2020, 2, 2, 9, 8, 52, 862773, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 3, 1, 21, 39, 55, 739316, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1970, 1, 2, 9, 9, 55, 739317, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 3, 10, 11, 39, 55, 739316, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 3, 11, 10, 39, 55, 739316, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 11, 3, 10, 39, 55, 739316, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 11, 4, 10, 39, 55, 739316, -18000],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2400, 3, 12, 11, 39, 55, 739316, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 10, 6, 11, 24, 55, 739316, 39600],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 4, 8, 10, 54, 55, 739316, 37800],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2400, 3, 12, 11, 39, 55, 739316, -14400],
  )
}

///|
test "relative delta original application 55" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(
    years=-4L,
    months=-3L,
    days=-4.375,
    hours=-5.6,
    minutes=11.5,
    seconds=6.875,
    microseconds=187380.5,
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  {
    let result = @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [9995, 9, 26, 9, 35, 37, 62380, 0],
    )
  }
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2015, 10, 27, 9, 34, 34, 185838, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2019, 11, 24, 22, 5, 37, 62381, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1965, 9, 26, 9, 35, 37, 62382, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2019, 12, 4, 12, 5, 37, 62381, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2019, 12, 5, 11, 5, 37, 62381, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2020, 7, 28, 11, 5, 37, 62381, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2020, 7, 29, 11, 5, 37, 62381, -14400],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2395, 12, 6, 12, 5, 37, 62381, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2020, 6, 30, 11, 50, 37, 62381, 37800],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2020, 1, 2, 11, 20, 37, 62381, 39600],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2395, 12, 6, 12, 5, 37, 62381, -18000],
  )
}

///|
test "relative delta original application 56" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(
    years=4L,
    months=24L,
    days=5.125,
    hours=-5.9,
    minutes=-50.1,
    seconds=-2.375,
    microseconds=106696.6,
  )
  {
    let result = @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [7, 1, 5, 20, 15, 51, 731697, 0],
    )
  }
  assert_true(
    try {
      ignore(
        @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
          delta,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 2, 5, 20, 14, 48, 855154, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2030, 3, 5, 8, 45, 51, 731697, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1976, 1, 5, 20, 15, 51, 731698, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2030, 3, 13, 22, 45, 51, 731697, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2030, 3, 14, 21, 45, 51, 731697, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2030, 11, 6, 21, 45, 51, 731697, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2030, 11, 7, 21, 45, 51, 731697, -18000],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2406, 3, 15, 22, 45, 51, 731697, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2030, 10, 9, 22, 30, 51, 731697, 39600],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2030, 4, 11, 22, 0, 51, 731697, 37800],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2406, 3, 15, 22, 45, 51, 731697, -14400],
  )
}

///|
test "relative delta original application 57" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(
    years=3L,
    months=21L,
    days=-1.0,
    hours=-0.6,
    minutes=-13.3,
    seconds=6.625,
    microseconds=13961.5,
  )
  {
    let result = @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [5, 9, 29, 23, 10, 48, 638961, 0],
    )
  }
  assert_true(
    try {
      ignore(
        @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
          delta,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 10, 30, 23, 9, 45, 762418, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2028, 11, 28, 11, 40, 48, 638961, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1974, 9, 29, 23, 10, 48, 638962, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2028, 12, 8, 1, 40, 48, 638961, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2028, 12, 9, 0, 40, 48, 638961, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2029, 8, 1, 0, 40, 48, 638961, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2029, 8, 2, 0, 40, 48, 638961, -14400],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2404, 12, 10, 1, 40, 48, 638961, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2029, 7, 4, 1, 25, 48, 638961, 37800],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2029, 1, 6, 0, 55, 48, 638961, 39600],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2404, 12, 10, 1, 40, 48, 638961, -18000],
  )
}

///|
test "relative delta original application 58" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(
    years=3L,
    months=-3L,
    days=6.125,
    hours=-0.1,
    minutes=48.2,
    seconds=2.6875,
    microseconds=-192784.2,
  )
  {
    let result = @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [3, 10, 7, 3, 42, 14, 494716, 0],
    )
  }
  assert_true(
    try {
      ignore(
        @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
          delta,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2022, 11, 7, 3, 41, 11, 618173, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 12, 5, 16, 12, 14, 494716, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1972, 10, 7, 3, 42, 14, 494717, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 12, 15, 6, 12, 14, 494716, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 12, 16, 5, 12, 14, 494716, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2027, 8, 8, 5, 12, 14, 494716, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2027, 8, 9, 5, 12, 14, 494716, -14400],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2402, 12, 17, 6, 12, 14, 494716, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2027, 7, 11, 5, 57, 14, 494716, 37800],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2027, 1, 13, 5, 27, 14, 494716, 39600],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2402, 12, 17, 6, 12, 14, 494716, -18000],
  )
}

///|
test "relative delta original application 59" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(
    years=-3L,
    months=-19L,
    days=1.0,
    hours=-0.3,
    minutes=-19.9,
    seconds=4.625,
    microseconds=-10135.3,
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  {
    let result = @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [9995, 6, 1, 23, 22, 10, 614864, 0],
    )
  }
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2015, 7, 1, 23, 21, 7, 738322, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2019, 7, 30, 11, 52, 10, 614865, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1965, 6, 1, 23, 22, 10, 614866, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2019, 8, 10, 1, 52, 10, 614865, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2019, 8, 11, 0, 52, 10, 614865, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2020, 4, 3, 0, 52, 10, 614865, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2020, 4, 4, 0, 52, 10, 614865, -14400],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2395, 8, 12, 1, 52, 10, 614865, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2020, 3, 6, 1, 37, 10, 614865, 39600],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2019, 9, 8, 1, 7, 10, 614865, 37800],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2395, 8, 12, 1, 52, 10, 614865, -14400],
  )
}

///|
test "relative delta original application 60" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(
    years=0L,
    months=17L,
    days=-5.625,
    hours=-2.0,
    minutes=4.5,
    seconds=-6.1875,
    microseconds=-39075.6,
  )
  {
    let result = @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2, 5, 26, 7, 4, 23, 773424, 0],
    )
  }
  assert_true(
    try {
      ignore(
        @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
          delta,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2021, 6, 25, 7, 3, 20, 896881, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2025, 7, 23, 19, 34, 23, 773424, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1971, 5, 26, 7, 4, 23, 773425, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2025, 8, 3, 9, 34, 23, 773424, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2025, 8, 4, 8, 34, 23, 773424, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 3, 27, 8, 34, 23, 773424, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 3, 28, 8, 34, 23, 773424, -14400],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2401, 8, 5, 9, 34, 23, 773424, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 2, 27, 9, 19, 23, 773424, 39600],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2025, 9, 1, 8, 49, 23, 773424, 37800],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2401, 8, 5, 9, 34, 23, 773424, -14400],
  )
}

///|
test "relative delta original application 61" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(
    years=4L,
    months=-11L,
    days=0.5,
    hours=-4.5,
    minutes=42.5,
    seconds=7.4375,
    microseconds=-78877.1,
  )
  {
    let result = @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [4, 2, 1, 8, 12, 37, 358623, 0],
    )
  }
  assert_true(
    try {
      ignore(
        @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
          delta,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2023, 3, 1, 8, 11, 34, 482080, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2027, 3, 29, 20, 42, 37, 358623, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1973, 2, 1, 8, 12, 37, 358624, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2027, 4, 9, 10, 42, 37, 358623, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2027, 4, 10, 9, 42, 37, 358623, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2027, 12, 2, 9, 42, 37, 358623, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2027, 12, 3, 9, 42, 37, 358623, -18000],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2403, 4, 11, 10, 42, 37, 358623, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2027, 11, 5, 10, 27, 37, 358623, 39600],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2027, 5, 7, 9, 57, 37, 358623, 37800],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2403, 4, 11, 10, 42, 37, 358623, -14400],
  )
}

///|
test "relative delta original application 62" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(
    years=-3L,
    months=15L,
    days=-1.5,
    hours=-5.6,
    minutes=23.5,
    seconds=5.6875,
    microseconds=-6016.4,
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  {
    let result = @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [9998, 3, 30, 6, 47, 35, 681483, 0],
    )
  }
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2018, 4, 29, 6, 46, 32, 804941, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2022, 5, 27, 19, 17, 35, 681484, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1968, 3, 30, 6, 47, 35, 681485, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2022, 6, 7, 9, 17, 35, 681484, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2022, 6, 8, 8, 17, 35, 681484, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2023, 1, 31, 8, 17, 35, 681484, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2023, 2, 1, 8, 17, 35, 681484, -18000],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2398, 6, 9, 9, 17, 35, 681484, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2023, 1, 3, 9, 2, 35, 681484, 39600],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2022, 7, 5, 8, 32, 35, 681484, 37800],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2398, 6, 9, 9, 17, 35, 681484, -14400],
  )
}

///|
test "relative delta original application 63" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(
    years=3L,
    months=-3L,
    days=1.75,
    hours=5.8,
    minutes=3.9,
    seconds=0.5625,
    microseconds=-117728.3,
  )
  {
    let result = @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [3, 10, 2, 23, 51, 54, 444772, 0],
    )
  }
  assert_true(
    try {
      ignore(
        @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
          delta,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2022, 11, 2, 23, 50, 51, 568229, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 12, 1, 12, 21, 54, 444772, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1972, 10, 2, 23, 51, 54, 444773, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 12, 11, 2, 21, 54, 444772, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 12, 12, 1, 21, 54, 444772, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2027, 8, 4, 1, 21, 54, 444772, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2027, 8, 5, 1, 21, 54, 444772, -14400],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2402, 12, 13, 2, 21, 54, 444772, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2027, 7, 7, 2, 6, 54, 444772, 37800],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2027, 1, 9, 1, 36, 54, 444772, 39600],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2402, 12, 13, 2, 21, 54, 444772, -18000],
  )
}

///|
test "relative delta original application 64" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(
    years=-4L,
    months=-7L,
    days=-1.25,
    hours=-3.5,
    minutes=-4.3,
    seconds=1.5625,
    microseconds=-88065.1,
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  {
    let result = @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [9995, 5, 30, 14, 25, 43, 474434, 0],
    )
  }
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2015, 6, 29, 14, 24, 40, 597892, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2019, 7, 28, 2, 55, 43, 474435, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1965, 5, 30, 14, 25, 43, 474436, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2019, 8, 7, 16, 55, 43, 474435, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2019, 8, 8, 15, 55, 43, 474435, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2020, 3, 31, 15, 55, 43, 474435, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2020, 4, 1, 15, 55, 43, 474435, -14400],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2395, 8, 9, 16, 55, 43, 474435, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2020, 3, 3, 16, 40, 43, 474435, 39600],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2019, 9, 5, 16, 10, 43, 474435, 37800],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2395, 8, 9, 16, 55, 43, 474435, -14400],
  )
}

///|
test "relative delta original application 65" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(
    years=-1L,
    months=-3L,
    days=-0.375,
    hours=3.9,
    minutes=54.2,
    seconds=1.0,
    microseconds=-168330.6,
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  {
    let result = @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [9998, 9, 30, 19, 48, 12, 831668, 0],
    )
  }
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2018, 10, 31, 19, 47, 9, 955126, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2022, 11, 29, 8, 18, 12, 831669, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1968, 9, 30, 19, 48, 12, 831670, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2022, 12, 8, 22, 18, 12, 831669, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2022, 12, 9, 21, 18, 12, 831669, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2023, 8, 1, 21, 18, 12, 831669, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2023, 8, 2, 21, 18, 12, 831669, -14400],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2398, 12, 10, 22, 18, 12, 831669, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2023, 7, 4, 22, 3, 12, 831669, 37800],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2023, 1, 6, 21, 33, 12, 831669, 39600],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2398, 12, 10, 22, 18, 12, 831669, -18000],
  )
}

///|
test "relative delta original application 66" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(
    years=-2L,
    months=-7L,
    days=3.25,
    hours=1.3,
    minutes=48.8,
    seconds=-1.5,
    microseconds=-79629.6,
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  {
    let result = @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [9997, 6, 4, 8, 6, 46, 420369, 0],
    )
  }
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2017, 7, 4, 8, 5, 43, 543827, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2021, 8, 1, 20, 36, 46, 420370, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1967, 6, 4, 8, 6, 46, 420371, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2021, 8, 12, 10, 36, 46, 420370, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2021, 8, 13, 9, 36, 46, 420370, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2022, 4, 5, 9, 36, 46, 420370, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2022, 4, 6, 9, 36, 46, 420370, -14400],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2397, 8, 14, 10, 36, 46, 420370, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2022, 3, 8, 10, 21, 46, 420370, 39600],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2021, 9, 10, 9, 51, 46, 420370, 37800],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2397, 8, 14, 10, 36, 46, 420370, -14400],
  )
}

///|
test "relative delta original application 67" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(
    years=0L,
    months=22L,
    days=0.0,
    hours=1.3,
    minutes=12.9,
    seconds=-0.375,
    microseconds=105337.7,
  )
  {
    let result = @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2, 11, 1, 1, 30, 53, 730338, 0],
    )
  }
  assert_true(
    try {
      ignore(
        @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
          delta,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2021, 12, 1, 1, 29, 50, 853795, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2025, 12, 29, 14, 0, 53, 730338, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1971, 11, 1, 1, 30, 53, 730339, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 1, 9, 4, 0, 53, 730338, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 1, 10, 3, 0, 53, 730338, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 9, 2, 3, 0, 53, 730338, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 9, 3, 3, 0, 53, 730338, -14400],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2402, 1, 11, 4, 0, 53, 730338, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 8, 5, 3, 45, 53, 730338, 37800],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 2, 7, 3, 15, 53, 730338, 39600],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2402, 1, 11, 4, 0, 53, 730338, -18000],
  )
}

///|
test "relative delta original application 68" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(
    years=3L,
    months=-20L,
    days=-1.25,
    hours=-3.4,
    minutes=3.9,
    seconds=-0.875,
    microseconds=-20783.0,
  )
  {
    let result = @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2, 4, 29, 14, 39, 53, 104217, 0],
    )
  }
  assert_true(
    try {
      ignore(
        @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
          delta,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2021, 5, 30, 14, 38, 50, 227674, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2025, 6, 28, 3, 9, 53, 104217, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1971, 4, 29, 14, 39, 53, 104218, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2025, 7, 7, 17, 9, 53, 104217, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2025, 7, 8, 16, 9, 53, 104217, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 2, 28, 16, 9, 53, 104217, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 3, 1, 16, 9, 53, 104217, -18000],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2401, 7, 9, 17, 9, 53, 104217, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 2, 3, 16, 54, 53, 104217, 39600],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2025, 8, 5, 16, 24, 53, 104217, 37800],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2401, 7, 9, 17, 9, 53, 104217, -14400],
  )
}

///|
test "relative delta original application 69" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(
    years=-2L,
    months=23L,
    days=-2.375,
    hours=2.0,
    minutes=-19.8,
    seconds=-5.125,
    microseconds=-22056.2,
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  {
    let result = @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [9999, 11, 28, 16, 40, 6, 852943, 0],
    )
  }
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2019, 12, 29, 16, 39, 3, 976401, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 1, 27, 5, 10, 6, 852944, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1969, 11, 28, 16, 40, 6, 852945, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 2, 6, 19, 10, 6, 852944, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 2, 7, 18, 10, 6, 852944, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 9, 29, 18, 10, 6, 852944, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 9, 30, 18, 10, 6, 852944, -14400],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2400, 2, 8, 19, 10, 6, 852944, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 9, 2, 18, 55, 6, 852944, 37800],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 3, 4, 18, 25, 6, 852944, 39600],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2400, 2, 8, 19, 10, 6, 852944, -18000],
  )
}

///|
test "relative delta original application 70" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(
    years=4L,
    months=20L,
    days=-3.375,
    hours=3.0,
    minutes=52.2,
    seconds=3.5,
    microseconds=-89237.0,
  )
  {
    let result = @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [6, 8, 28, 18, 52, 15, 410763, 0],
    )
  }
  assert_true(
    try {
      ignore(
        @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
          delta,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2025, 9, 27, 18, 51, 12, 534220, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2029, 10, 26, 7, 22, 15, 410763, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1975, 8, 28, 18, 52, 15, 410764, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2029, 11, 5, 21, 22, 15, 410763, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2029, 11, 6, 20, 22, 15, 410763, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2030, 6, 28, 20, 22, 15, 410763, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2030, 6, 29, 20, 22, 15, 410763, -14400],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2405, 11, 7, 21, 22, 15, 410763, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2030, 6, 1, 21, 7, 15, 410763, 37800],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2029, 12, 3, 20, 37, 15, 410763, 39600],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2405, 11, 7, 21, 22, 15, 410763, -18000],
  )
}

///|
test "relative delta original application 71" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(
    years=-1L,
    months=-19L,
    days=-0.625,
    hours=-0.8,
    minutes=28.2,
    seconds=6.1875,
    microseconds=-42611.4,
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  {
    let result = @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [9997, 5, 31, 8, 40, 18, 144888, 0],
    )
  }
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2017, 6, 30, 8, 39, 15, 268346, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2021, 7, 28, 21, 10, 18, 144889, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1967, 5, 31, 8, 40, 18, 144890, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2021, 8, 8, 11, 10, 18, 144889, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2021, 8, 9, 10, 10, 18, 144889, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2022, 4, 1, 10, 10, 18, 144889, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2022, 4, 2, 10, 10, 18, 144889, -14400],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2397, 8, 10, 11, 10, 18, 144889, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2022, 3, 4, 10, 55, 18, 144889, 39600],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2021, 9, 6, 10, 25, 18, 144889, 37800],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2397, 8, 10, 11, 10, 18, 144889, -14400],
  )
}

///|
test "relative delta original application 72" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(
    years=-2L,
    months=-11L,
    days=-6.125,
    hours=4.2,
    minutes=-23.8,
    seconds=1.125,
    microseconds=-190345.2,
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  {
    let result = @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [9997, 1, 26, 0, 48, 12, 934654, 0],
    )
  }
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2017, 2, 23, 0, 47, 10, 58112, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2021, 3, 23, 13, 18, 12, 934655, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1967, 1, 26, 0, 48, 12, 934656, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2021, 4, 3, 3, 18, 12, 934655, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2021, 4, 4, 2, 18, 12, 934655, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2021, 11, 26, 2, 18, 12, 934655, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2021, 11, 27, 2, 18, 12, 934655, -18000],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2397, 4, 5, 3, 18, 12, 934655, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2021, 10, 30, 3, 3, 12, 934655, 39600],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2021, 5, 1, 2, 33, 12, 934655, 37800],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2397, 4, 5, 3, 18, 12, 934655, -14400],
  )
}

///|
test "relative delta original application 73" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(
    years=-3L,
    months=17L,
    days=-7.375,
    hours=-5.6,
    minutes=-32.4,
    seconds=0.6875,
    microseconds=-30552.8,
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  {
    let result = @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [9998, 5, 24, 8, 51, 36, 656946, 0],
    )
  }
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2018, 6, 23, 8, 50, 33, 780404, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2022, 7, 21, 21, 21, 36, 656947, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1968, 5, 24, 8, 51, 36, 656948, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2022, 8, 1, 11, 21, 36, 656947, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2022, 8, 2, 10, 21, 36, 656947, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2023, 3, 25, 10, 21, 36, 656947, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2023, 3, 26, 10, 21, 36, 656947, -14400],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2398, 8, 3, 11, 21, 36, 656947, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2023, 2, 25, 11, 6, 36, 656947, 39600],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2022, 8, 30, 10, 36, 36, 656947, 37800],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2398, 8, 3, 11, 21, 36, 656947, -14400],
  )
}

///|
test "relative delta original application 74" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(
    years=2L,
    months=7L,
    days=1.625,
    hours=4.5,
    minutes=-51.6,
    seconds=4.875,
    microseconds=-133101.2,
  )
  {
    let result = @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [3, 8, 2, 18, 38, 28, 741899, 0],
    )
  }
  assert_true(
    try {
      ignore(
        @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
          delta,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2022, 9, 2, 18, 37, 25, 865356, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 10, 1, 7, 8, 28, 741899, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1972, 8, 2, 18, 38, 28, 741900, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 10, 10, 21, 8, 28, 741899, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 10, 11, 20, 8, 28, 741899, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2027, 6, 3, 20, 8, 28, 741899, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2027, 6, 4, 20, 8, 28, 741899, -14400],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2402, 10, 12, 21, 8, 28, 741899, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2027, 5, 6, 20, 53, 28, 741899, 37800],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 11, 8, 20, 23, 28, 741899, 39600],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2402, 10, 12, 21, 8, 28, 741899, -14400],
  )
}

///|
test "relative delta original application 75" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(
    years=3L,
    months=-15L,
    days=4.25,
    hours=-2.3,
    minutes=-34.4,
    seconds=-0.3125,
    microseconds=-11415.2,
  )
  {
    let result = @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2, 10, 5, 3, 7, 35, 676085, 0],
    )
  }
  assert_true(
    try {
      ignore(
        @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
          delta,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2021, 11, 5, 3, 6, 32, 799542, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2025, 12, 3, 15, 37, 35, 676085, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1971, 10, 5, 3, 7, 35, 676086, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2025, 12, 13, 5, 37, 35, 676085, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2025, 12, 14, 4, 37, 35, 676085, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 8, 6, 4, 37, 35, 676085, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 8, 7, 4, 37, 35, 676085, -14400],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2401, 12, 15, 5, 37, 35, 676085, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 7, 9, 5, 22, 35, 676085, 37800],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 1, 11, 4, 52, 35, 676085, 39600],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2401, 12, 15, 5, 37, 35, 676085, -18000],
  )
}

///|
test "relative delta original application 76" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(
    years=-3L,
    months=2L,
    days=-3.0,
    hours=5.5,
    minutes=9.5,
    seconds=-6.8125,
    microseconds=-170049.2,
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  {
    let result = @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [9997, 2, 26, 5, 39, 23, 17450, 0],
    )
  }
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2017, 3, 29, 5, 38, 20, 140908, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2021, 4, 26, 18, 9, 23, 17451, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1967, 2, 26, 5, 39, 23, 17452, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2021, 5, 6, 8, 9, 23, 17451, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2021, 5, 7, 7, 9, 23, 17451, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2021, 12, 30, 7, 9, 23, 17451, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2021, 12, 31, 7, 9, 23, 17451, -18000],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2397, 5, 8, 8, 9, 23, 17451, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2021, 12, 2, 7, 54, 23, 17451, 39600],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2021, 6, 4, 7, 24, 23, 17451, 37800],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2397, 5, 8, 8, 9, 23, 17451, -14400],
  )
}

///|
test "relative delta original application 77" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(
    years=2L,
    months=-6L,
    days=-1.5,
    hours=0.4,
    minutes=11.9,
    seconds=-4.4375,
    microseconds=-90519.3,
  )
  {
    let result = @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2, 6, 29, 12, 35, 49, 471981, 0],
    )
  }
  assert_true(
    try {
      ignore(
        @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
          delta,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2021, 7, 30, 12, 34, 46, 595438, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2025, 8, 28, 1, 5, 49, 471981, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1971, 6, 29, 12, 35, 49, 471982, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2025, 9, 7, 15, 5, 49, 471981, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2025, 9, 8, 14, 5, 49, 471981, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 4, 30, 14, 5, 49, 471981, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 5, 1, 14, 5, 49, 471981, -14400],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2401, 9, 9, 15, 5, 49, 471981, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 4, 3, 14, 50, 49, 471981, 39600],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2025, 10, 5, 14, 20, 49, 471981, 39600],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2401, 9, 9, 15, 5, 49, 471981, -14400],
  )
}

///|
test "relative delta original application 78" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(
    years=-1L,
    months=21L,
    days=4.25,
    hours=3.3,
    minutes=-45.1,
    seconds=1.75,
    microseconds=80490.4,
  )
  {
    let result = @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1, 10, 5, 8, 32, 55, 830490, 0],
    )
  }
  assert_true(
    try {
      ignore(
        @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
          delta,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2020, 11, 5, 8, 31, 52, 953947, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 12, 3, 21, 2, 55, 830490, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1970, 10, 5, 8, 32, 55, 830491, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 12, 13, 11, 2, 55, 830490, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 12, 14, 10, 2, 55, 830490, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2025, 8, 6, 10, 2, 55, 830490, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2025, 8, 7, 10, 2, 55, 830490, -14400],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2400, 12, 15, 11, 2, 55, 830490, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2025, 7, 9, 10, 47, 55, 830490, 37800],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2025, 1, 11, 10, 17, 55, 830490, 39600],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2400, 12, 15, 11, 2, 55, 830490, -18000],
  )
}

///|
test "relative delta original application 79" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(
    years=-3L,
    months=4L,
    days=4.625,
    hours=-2.7,
    minutes=-33.0,
    seconds=-3.3125,
    microseconds=32194.0,
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  {
    let result = @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [9997, 5, 5, 11, 44, 56, 719693, 0],
    )
  }
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2017, 6, 5, 11, 43, 53, 843151, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2021, 7, 4, 0, 14, 56, 719694, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1967, 5, 5, 11, 44, 56, 719695, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2021, 7, 13, 14, 14, 56, 719694, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2021, 7, 14, 13, 14, 56, 719694, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2022, 3, 6, 13, 14, 56, 719694, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2022, 3, 7, 13, 14, 56, 719694, -18000],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2397, 7, 15, 14, 14, 56, 719694, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2022, 2, 9, 13, 59, 56, 719694, 39600],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2021, 8, 11, 13, 29, 56, 719694, 37800],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2397, 7, 15, 14, 14, 56, 719694, -14400],
  )
}

///|
test "relative delta original application 80" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(
    years=0L,
    months=23L,
    days=7.125,
    hours=-0.3,
    minutes=40.4,
    seconds=-0.1875,
    microseconds=-9405.8,
  )
  {
    let result = @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2, 12, 8, 3, 22, 23, 803094, 0],
    )
  }
  assert_true(
    try {
      ignore(
        @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
          delta,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2022, 1, 8, 3, 21, 20, 926551, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 2, 5, 15, 52, 23, 803094, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1971, 12, 8, 3, 22, 23, 803095, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 2, 16, 5, 52, 23, 803094, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 2, 17, 4, 52, 23, 803094, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 10, 9, 4, 52, 23, 803094, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 10, 10, 4, 52, 23, 803094, -14400],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2402, 2, 18, 5, 52, 23, 803094, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 9, 12, 5, 37, 23, 803094, 37800],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 3, 14, 5, 7, 23, 803094, 39600],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2402, 2, 18, 5, 52, 23, 803094, -18000],
  )
}

///|
test "relative delta original application 81" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(
    years=2L,
    months=-23L,
    days=4.625,
    hours=-4.4,
    minutes=2.3,
    seconds=3.6875,
    microseconds=69922.2,
  )
  {
    let result = @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1, 2, 5, 10, 38, 21, 757422, 0],
    )
  }
  assert_true(
    try {
      ignore(
        @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
          delta,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2020, 3, 5, 10, 37, 18, 880879, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 4, 2, 23, 8, 21, 757422, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1970, 2, 5, 10, 38, 21, 757423, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 4, 13, 13, 8, 21, 757422, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 4, 14, 12, 8, 21, 757422, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 12, 6, 12, 8, 21, 757422, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 12, 7, 12, 8, 21, 757422, -18000],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2400, 4, 15, 13, 8, 21, 757422, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 11, 9, 12, 53, 21, 757422, 39600],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 5, 11, 12, 23, 21, 757422, 37800],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2400, 4, 15, 13, 8, 21, 757422, -14400],
  )
}

///|
test "relative delta original application 82" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(
    years=4L,
    months=-21L,
    days=5.75,
    hours=-0.6,
    minutes=22.8,
    seconds=0.5,
    microseconds=-134688.1,
  )
  {
    let result = @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [3, 4, 6, 17, 46, 48, 365312, 0],
    )
  }
  assert_true(
    try {
      ignore(
        @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
          delta,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2022, 5, 6, 17, 45, 45, 488769, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 6, 4, 6, 16, 48, 365312, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1972, 4, 6, 17, 46, 48, 365313, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 6, 14, 20, 16, 48, 365312, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 6, 15, 19, 16, 48, 365312, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2027, 2, 7, 19, 16, 48, 365312, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2027, 2, 8, 19, 16, 48, 365312, -18000],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2402, 6, 16, 20, 16, 48, 365312, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2027, 1, 10, 20, 1, 48, 365312, 39600],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 7, 12, 19, 31, 48, 365312, 37800],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2402, 6, 16, 20, 16, 48, 365312, -14400],
  )
}

///|
test "relative delta original application 83" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(
    years=1L,
    months=18L,
    days=-6.75,
    hours=-5.4,
    minutes=46.2,
    seconds=-0.4375,
    microseconds=101233.5,
  )
  {
    let result = @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [3, 6, 24, 1, 22, 11, 663733, 0],
    )
  }
  assert_true(
    try {
      ignore(
        @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
          delta,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2022, 7, 25, 1, 21, 8, 787190, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 8, 22, 13, 52, 11, 663733, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1972, 6, 24, 1, 22, 11, 663734, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 9, 2, 3, 52, 11, 663733, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 9, 3, 2, 52, 11, 663733, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2027, 4, 25, 2, 52, 11, 663733, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2027, 4, 26, 2, 52, 11, 663733, -14400],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2402, 9, 4, 3, 52, 11, 663733, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2027, 3, 29, 3, 37, 11, 663733, 39600],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 9, 30, 3, 7, 11, 663733, 37800],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2402, 9, 4, 3, 52, 11, 663733, -14400],
  )
}

///|
test "relative delta original application 84" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(
    years=2L,
    months=22L,
    days=5.625,
    hours=0.4,
    minutes=36.0,
    seconds=4.6875,
    microseconds=185964.5,
  )
  {
    let result = @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [4, 11, 6, 16, 0, 4, 873464, 0],
    )
  }
  assert_true(
    try {
      ignore(
        @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
          delta,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2023, 12, 6, 15, 59, 1, 996921, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2028, 1, 4, 4, 30, 4, 873464, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1973, 11, 6, 16, 0, 4, 873465, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2028, 1, 14, 18, 30, 4, 873464, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2028, 1, 15, 17, 30, 4, 873464, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2028, 9, 7, 17, 30, 4, 873464, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2028, 9, 8, 17, 30, 4, 873464, -14400],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2404, 1, 16, 18, 30, 4, 873464, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2028, 8, 10, 18, 15, 4, 873464, 37800],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2028, 2, 12, 17, 45, 4, 873464, 39600],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2404, 1, 16, 18, 30, 4, 873464, -18000],
  )
}

///|
test "relative delta original application 85" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(
    years=3L,
    months=21L,
    days=-0.875,
    hours=-1.5,
    minutes=-15.3,
    seconds=3.9375,
    microseconds=150961.2,
  )
  {
    let result = @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [5, 9, 30, 1, 14, 46, 88461, 0],
    )
  }
  assert_true(
    try {
      ignore(
        @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
          delta,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 10, 31, 1, 13, 43, 211918, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2028, 11, 28, 13, 44, 46, 88461, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1974, 9, 30, 1, 14, 46, 88462, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2028, 12, 8, 3, 44, 46, 88461, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2028, 12, 9, 2, 44, 46, 88461, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2029, 8, 1, 2, 44, 46, 88461, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2029, 8, 2, 2, 44, 46, 88461, -14400],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2404, 12, 10, 3, 44, 46, 88461, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2029, 7, 4, 3, 29, 46, 88461, 37800],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2029, 1, 6, 2, 59, 46, 88461, 39600],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2404, 12, 10, 3, 44, 46, 88461, -18000],
  )
}

///|
test "relative delta original application 86" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(
    years=-4L,
    months=-15L,
    days=-6.375,
    hours=4.4,
    minutes=-48.6,
    seconds=-5.875,
    microseconds=71715.5,
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  {
    let result = @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [9994, 9, 24, 18, 35, 18, 196715, 0],
    )
  }
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2014, 10, 25, 18, 34, 15, 320173, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2018, 11, 23, 7, 5, 18, 196716, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1964, 9, 24, 18, 35, 18, 196717, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2018, 12, 2, 21, 5, 18, 196716, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2018, 12, 3, 20, 5, 18, 196716, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2019, 7, 26, 20, 5, 18, 196716, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2019, 7, 27, 20, 5, 18, 196716, -14400],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2394, 12, 4, 21, 5, 18, 196716, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2019, 6, 28, 20, 50, 18, 196716, 37800],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2018, 12, 31, 20, 20, 18, 196716, 39600],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2394, 12, 4, 21, 5, 18, 196716, -18000],
  )
}

///|
test "relative delta original application 87" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(
    years=-3L,
    months=15L,
    days=6.375,
    hours=0.2,
    minutes=-2.8,
    seconds=4.4375,
    microseconds=-34511.9,
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  {
    let result = @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [9998, 4, 7, 9, 9, 16, 402987, 0],
    )
  }
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2018, 5, 7, 9, 8, 13, 526445, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2022, 6, 4, 21, 39, 16, 402988, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1968, 4, 7, 9, 9, 16, 402989, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2022, 6, 15, 11, 39, 16, 402988, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2022, 6, 16, 10, 39, 16, 402988, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2023, 2, 8, 10, 39, 16, 402988, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2023, 2, 9, 10, 39, 16, 402988, -18000],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2398, 6, 17, 11, 39, 16, 402988, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2023, 1, 11, 11, 24, 16, 402988, 39600],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2022, 7, 13, 10, 54, 16, 402988, 37800],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2398, 6, 17, 11, 39, 16, 402988, -14400],
  )
}

///|
test "relative delta original application 88" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(
    years=-4L,
    months=-14L,
    days=0.375,
    hours=-3.0,
    minutes=-58.2,
    seconds=-3.0625,
    microseconds=189250.0,
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  {
    let result = @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [9994, 11, 1, 5, 1, 45, 126749, 0],
    )
  }
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2014, 12, 1, 5, 0, 42, 250207, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2018, 12, 29, 17, 31, 45, 126750, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1964, 11, 1, 5, 1, 45, 126751, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2019, 1, 9, 7, 31, 45, 126750, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2019, 1, 10, 6, 31, 45, 126750, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2019, 9, 2, 6, 31, 45, 126750, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2019, 9, 3, 6, 31, 45, 126750, -14400],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2395, 1, 11, 7, 31, 45, 126750, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2019, 8, 5, 7, 16, 45, 126750, 37800],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2019, 2, 7, 6, 46, 45, 126750, 39600],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2395, 1, 11, 7, 31, 45, 126750, -18000],
  )
}

///|
test "relative delta original application 89" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(
    years=3L,
    months=-18L,
    days=-1.625,
    hours=5.8,
    minutes=5.5,
    seconds=5.125,
    microseconds=104770.8,
  )
  {
    let result = @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2, 6, 29, 14, 53, 35, 229771, 0],
    )
  }
  assert_true(
    try {
      ignore(
        @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
          delta,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2021, 7, 30, 14, 52, 32, 353228, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2025, 8, 28, 3, 23, 35, 229771, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1971, 6, 29, 14, 53, 35, 229772, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2025, 9, 7, 17, 23, 35, 229771, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2025, 9, 8, 16, 23, 35, 229771, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 4, 30, 16, 23, 35, 229771, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 5, 1, 16, 23, 35, 229771, -14400],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2401, 9, 9, 17, 23, 35, 229771, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 4, 3, 17, 8, 35, 229771, 39600],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2025, 10, 5, 16, 38, 35, 229771, 39600],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2401, 9, 9, 17, 23, 35, 229771, -14400],
  )
}

///|
test "relative delta original application 90" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(
    years=2L,
    months=-17L,
    days=4.875,
    hours=-1.4,
    minutes=-28.3,
    seconds=-4.875,
    microseconds=197762.0,
  )
  {
    let result = @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1, 8, 5, 19, 7, 37, 322762, 0],
    )
  }
  assert_true(
    try {
      ignore(
        @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
          delta,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2020, 9, 5, 19, 6, 34, 446219, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 10, 4, 7, 37, 37, 322762, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1970, 8, 5, 19, 7, 37, 322763, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 10, 13, 21, 37, 37, 322762, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 10, 14, 20, 37, 37, 322762, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2025, 6, 6, 20, 37, 37, 322762, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2025, 6, 7, 20, 37, 37, 322762, -14400],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2400, 10, 15, 21, 37, 37, 322762, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2025, 5, 9, 21, 22, 37, 322762, 37800],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 11, 11, 20, 52, 37, 322762, 39600],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2400, 10, 15, 21, 37, 37, 322762, -14400],
  )
}

///|
test "relative delta original application 91" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(
    years=4L,
    months=-20L,
    days=-0.25,
    hours=2.1,
    minutes=-50.3,
    seconds=0.8125,
    microseconds=174846.5,
  )
  {
    let result = @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [3, 4, 30, 19, 15, 42, 987347, 0],
    )
  }
  assert_true(
    try {
      ignore(
        @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
          delta,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2022, 5, 31, 19, 14, 40, 110804, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 6, 29, 7, 45, 42, 987347, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1972, 4, 30, 19, 15, 42, 987348, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 7, 8, 21, 45, 42, 987347, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 7, 9, 20, 45, 42, 987347, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2027, 3, 1, 20, 45, 42, 987347, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2027, 3, 2, 20, 45, 42, 987347, -18000],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2402, 7, 10, 21, 45, 42, 987347, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2027, 2, 4, 21, 30, 42, 987347, 39600],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 8, 6, 21, 0, 42, 987347, 37800],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2402, 7, 10, 21, 45, 42, 987347, -14400],
  )
}

///|
test "relative delta original application 92" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(
    years=0L,
    months=-14L,
    days=3.375,
    hours=-0.3,
    minutes=2.8,
    seconds=0.4375,
    microseconds=-71588.1,
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  {
    let result = @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [9998, 11, 4, 8, 44, 48, 365911, 0],
    )
  }
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2018, 12, 4, 8, 43, 45, 489369, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2023, 1, 1, 21, 14, 48, 365912, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1968, 11, 4, 8, 44, 48, 365913, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2023, 1, 12, 11, 14, 48, 365912, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2023, 1, 13, 10, 14, 48, 365912, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2023, 9, 5, 10, 14, 48, 365912, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2023, 9, 6, 10, 14, 48, 365912, -14400],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2399, 1, 14, 11, 14, 48, 365912, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2023, 8, 8, 10, 59, 48, 365912, 37800],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2023, 2, 10, 10, 29, 48, 365912, 39600],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2399, 1, 14, 11, 14, 48, 365912, -18000],
  )
}

///|
test "relative delta original application 93" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(
    years=-4L,
    months=-6L,
    days=-0.625,
    hours=-1.9,
    minutes=-13.5,
    seconds=-3.5625,
    microseconds=-189966.5,
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  {
    let result = @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [9995, 6, 30, 6, 52, 26, 247533, 0],
    )
  }
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2015, 7, 31, 6, 51, 23, 370991, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2019, 8, 28, 19, 22, 26, 247534, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1965, 6, 30, 6, 52, 26, 247535, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2019, 9, 8, 9, 22, 26, 247534, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2019, 9, 9, 8, 22, 26, 247534, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2020, 5, 1, 8, 22, 26, 247534, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2020, 5, 2, 8, 22, 26, 247534, -14400],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2395, 9, 10, 9, 22, 26, 247534, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2020, 4, 4, 9, 7, 26, 247534, 39600],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2019, 10, 6, 8, 37, 26, 247534, 39600],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2395, 9, 10, 9, 22, 26, 247534, -14400],
  )
}

///|
test "relative delta original application 94" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(
    years=-3L,
    months=24L,
    days=3.5,
    hours=4.6,
    minutes=37.2,
    seconds=-0.4375,
    microseconds=-194371.4,
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  {
    let result = @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [9999, 1, 4, 17, 13, 11, 368128, 0],
    )
  }
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2019, 2, 4, 17, 12, 8, 491586, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2023, 3, 4, 5, 43, 11, 368129, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1969, 1, 4, 17, 13, 11, 368130, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2023, 3, 12, 19, 43, 11, 368129, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2023, 3, 13, 18, 43, 11, 368129, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2023, 11, 5, 18, 43, 11, 368129, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2023, 11, 6, 18, 43, 11, 368129, -18000],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2399, 3, 14, 19, 43, 11, 368129, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2023, 10, 8, 19, 28, 11, 368129, 39600],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2023, 4, 10, 18, 58, 11, 368129, 37800],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2399, 3, 14, 19, 43, 11, 368129, -14400],
  )
}

///|
test "relative delta original application 95" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(
    years=-1L,
    months=20L,
    days=-1.875,
    hours=-3.2,
    minutes=-35.4,
    seconds=-1.6875,
    microseconds=-77470.7,
  )
  {
    let result = @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1, 8, 29, 23, 12, 34, 235029, 0],
    )
  }
  assert_true(
    try {
      ignore(
        @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
          delta,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2020, 9, 28, 23, 11, 31, 358486, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 10, 27, 11, 42, 34, 235029, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1970, 8, 29, 23, 12, 34, 235030, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 11, 7, 1, 42, 34, 235029, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 11, 8, 0, 42, 34, 235029, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2025, 6, 30, 0, 42, 34, 235029, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2025, 7, 1, 0, 42, 34, 235029, -14400],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2400, 11, 9, 1, 42, 34, 235029, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2025, 6, 3, 1, 27, 34, 235029, 37800],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 12, 5, 0, 57, 34, 235029, 39600],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2400, 11, 9, 1, 42, 34, 235029, -18000],
  )
}

///|
test "relative delta original application 96" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(
    years=-2L,
    months=16L,
    days=5.25,
    hours=2.5,
    minutes=-40.4,
    seconds=4.0625,
    microseconds=-61475.7,
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  {
    let result = @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [9999, 5, 6, 7, 49, 40, 1023, 0],
    )
  }
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2019, 6, 6, 7, 48, 37, 124481, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2023, 7, 4, 20, 19, 40, 1024, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1969, 5, 6, 7, 49, 40, 1025, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2023, 7, 14, 10, 19, 40, 1024, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2023, 7, 15, 9, 19, 40, 1024, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 3, 7, 9, 19, 40, 1024, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 3, 8, 9, 19, 40, 1024, -18000],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2399, 7, 16, 10, 19, 40, 1024, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 2, 10, 10, 4, 40, 1024, 39600],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2023, 8, 12, 9, 34, 40, 1024, 37800],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2399, 7, 16, 10, 19, 40, 1024, -14400],
  )
}

///|
test "relative delta original application 97" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(
    years=2L,
    months=2L,
    days=-4.0,
    hours=1.2,
    minutes=35.4,
    seconds=0.25,
    microseconds=-172176.5,
  )
  {
    let result = @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [3, 2, 25, 1, 47, 24, 77823, 0],
    )
  }
  assert_true(
    try {
      ignore(
        @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
          delta,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2022, 3, 28, 1, 46, 21, 201280, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 4, 25, 14, 17, 24, 77823, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1972, 2, 26, 1, 47, 24, 77824, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 5, 5, 4, 17, 24, 77823, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 5, 6, 3, 17, 24, 77823, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 12, 29, 3, 17, 24, 77823, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 12, 30, 3, 17, 24, 77823, -18000],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2402, 5, 7, 4, 17, 24, 77823, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 12, 1, 4, 2, 24, 77823, 39600],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2026, 6, 3, 3, 32, 24, 77823, 37800],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2402, 5, 7, 4, 17, 24, 77823, -14400],
  )
}

///|
test "relative delta original application 98" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(
    years=-2L,
    months=5L,
    days=3.25,
    hours=-5.6,
    minutes=40.8,
    seconds=-6.5625,
    microseconds=165351.5,
  )
  assert_true(
    try {
      ignore(
        @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(delta),
      )
      false
    } catch {
      _ => true
    },
  )
  {
    let result = @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [9998, 6, 4, 1, 4, 41, 602851, 0],
    )
  }
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2018, 7, 4, 1, 3, 38, 726309, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2022, 8, 1, 13, 34, 41, 602852, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1968, 6, 4, 1, 4, 41, 602853, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2022, 8, 12, 3, 34, 41, 602852, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2022, 8, 13, 2, 34, 41, 602852, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2023, 4, 5, 2, 34, 41, 602852, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2023, 4, 6, 2, 34, 41, 602852, -14400],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2398, 8, 14, 3, 34, 41, 602852, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2023, 3, 8, 3, 19, 41, 602852, 39600],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2022, 9, 10, 2, 49, 41, 602852, 37800],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2398, 8, 14, 3, 34, 41, 602852, -14400],
  )
}

///|
test "relative delta original application 99" {
  @date.register_timezone("D13/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D13/reference-NY")
  @date.register_timezone("D13/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D13/reference-LH")
  let delta = @date.RelativeDelta::new(
    years=2L,
    months=24L,
    days=-7.5,
    hours=0.9,
    minutes=54.7,
    seconds=-4.1875,
    microseconds=178518.9,
  )
  {
    let result = @date.parse_iso("0001-01-01T00:00:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [4, 12, 24, 13, 48, 37, 991019, 0],
    )
  }
  assert_true(
    try {
      ignore(
        @date.parse_iso("9999-12-31T23:59:59.999999+00:00").add_relative_delta(
          delta,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
  {
    let result = @date.parse_iso("2020-01-31T23:58:57.123457+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2024, 1, 24, 13, 47, 35, 114476, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-02-29T12:30:00+00:00").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2028, 2, 22, 2, 18, 37, 991019, 0],
    )
  }
  {
    let result = @date.parse_iso("1970-01-01T00:00:00.000001+00:09:21").add_relative_delta(
      delta,
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [1973, 12, 24, 13, 48, 37, 991020, 561],
    )
  }
  {
    let result = @date.parse_iso("2024-03-09T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2028, 3, 1, 16, 18, 37, 991019, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-03-10T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2028, 3, 2, 15, 18, 37, 991019, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-11-02T01:30:00-04:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2028, 10, 25, 15, 18, 37, 991019, -14400],
    )
  }
  {
    let result = @date.parse_iso("2024-11-03T01:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2028, 10, 26, 15, 18, 37, 991019, -14400],
    )
  }
  {
    let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
      .with_timezone(@date.get_timezone(name="D13/reference-NY"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2404, 3, 3, 16, 18, 37, 991019, -18000],
    )
  }
  {
    let result = @date.parse_iso("2024-10-05T02:15:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2028, 9, 27, 16, 3, 37, 991019, 37800],
    )
  }
  {
    let result = @date.parse_iso("2024-04-07T01:45:00+10:30")
      .with_timezone(@date.get_timezone(name="D13/reference-LH"))
      .add_relative_delta(delta)
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
        result.offset_seconds(),
      ],
      [2028, 3, 30, 15, 33, 37, 991019, 39600],
    )
  }
  let result = @date.parse_iso("2400-03-11T02:30:00-05:00")
    .with_timezone(@date.get_timezone(name="EST5EDT,M3.2.0,M11.1.0"))
    .add_relative_delta(delta)
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
      result.offset_seconds(),
    ],
    [2404, 3, 3, 16, 18, 37, 991019, -18000],
  )
}
