///|
fn range_zone(name : String) -> @date.DateTimeZone? {
  match name {
    "NY" => Some(try! @date.tzif_timezone(tzif_new_york))
    "LH" => Some(try! @date.tzif_timezone(tzif_lord_howe))
    "PARIS" => Some(try! @date.tzif_timezone(tzif_paris))
    _ => None
  }
}

///|
fn range_datetime(
  fields : Array[Int32],
  zone : @date.DateTimeZone?,
) -> @date.DateTime raise @date.DateError {
  let value = @date.datetime(
    fields[0],
    fields[1],
    fields[2],
    hour=fields[3],
    minute=fields[4],
    second=fields[5],
    microsecond=fields[6],
    offset_seconds=fields[7],
  )
  match zone {
    Some(zone) => value.with_timezone(zone)
    None => value
  }
}

///|
test "drange matches fixed upstream endpoint and linspace reference vectors" {
  for reference in range_references {
    let first_zone = range_zone(reference.start_zone)
    let last_zone = if reference.start_zone == reference.end_zone {
      first_zone
    } else {
      range_zone(reference.end_zone)
    }
    let start = range_datetime(reference.start, first_zone)
    let end = range_datetime(reference.end, last_zone)
    let delta = @date.timedelta(
      days=reference.delta[0],
      seconds=reference.delta[1].to_int64(),
      microseconds=reference.delta[2].to_int64(),
    )
    match reference.expected {
      Some(expected) =>
        assert_eq(
          @date.drange(start, end, delta),
          expected,
          msg=reference.label,
        )
      None =>
        assert_true(
          try {
            ignore(@date.drange(start, end, delta))
            false
          } catch {
            @date.DateError::InvalidDate(_) => true
            _ => false
          },
          msg=reference.label,
        )
    }
  }
}

///|
test "drange microsecond boundaries preserve the upstream half open interval" {
  let start = @date.datetime(2011, 1, 1)
  let end = @date.datetime(2011, 1, 2)
  let delta = @date.timedelta(hours=1)
  assert_eq(@date.drange(start, end, delta).length(), 24)
  assert_eq(
    @date.drange(
      start,
      end.add_timedelta(@date.timedelta(microseconds=-1L)),
      delta,
    ).length(),
    24,
  )
  assert_eq(
    @date.drange(
      start,
      end.add_timedelta(@date.timedelta(microseconds=1L)),
      delta,
    ).length(),
    25,
  )
}

///|
test "drange does not apply locator array caps and rejects unrepresentable counts" {
  let start = @date.datetime(1970, 1, 1)
  let end = start.add_timedelta(@date.timedelta(microseconds=100001L))
  // Fixed upstream also retains this end: ceil first overshoots by one, and
  // the single exact endpoint correction brings it back to the input end.
  let values = @date.drange(start, end, @date.timedelta(microseconds=1L))
  assert_eq(values.length(), 100002)
  assert_eq(values[100001], end.to_ordinal())
  assert_true(
    try {
      ignore(
        @date.drange(
          start,
          @date.datetime(2024, 1, 1),
          @date.timedelta(microseconds=1L),
        ),
      )
      false
    } catch {
      @date.DateError::InvalidDate(message~) => message.contains("array index")
      _ => false
    },
  )
}
