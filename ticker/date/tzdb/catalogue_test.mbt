///|
test "all bundled IANA names match independent historical and future offsets" {
  assert_eq(
    @tzdb.available_timezones(),
    reference_offsets.map(entry => entry.0),
  )
  assert_eq(reference_offsets.length(), 598)
  for (name, offsets) in reference_offsets {
    let zone = @tzdb.timezone(name)
    assert_eq(offsets.length(), reference_instants.length())
    for index in 0..<reference_instants.length() {
      let actual = zone.offset_seconds_at(reference_instants[index])
      assert_true(
        actual == offsets[index],
        msg="\{name} at probe \{index}: \{actual} != \{offsets[index]}",
      )
    }
  }
}

///|
test "all IANA compatibility aliases resolve to the same rule data" {
  for (name, canonical) in reference_aliases {
    let linked = @tzdb.timezone(name)
    let zone = @tzdb.timezone(canonical)
    assert_eq(linked.initial_offset_seconds(), zone.initial_offset_seconds())
    assert_eq(
      linked.transitions().map(value => (value.at(), value.offset_seconds())),
      zone.transitions().map(value => (value.at(), value.offset_seconds())),
    )
  }
}

///|
test "named catalogue returns isolated arrays and immutable cached zones" {
  let names = @tzdb.available_timezones()
  let original_first = names[0]
  names[0] = "corrupted"
  names.clear()
  assert_eq(@tzdb.available_timezones()[0], original_first)
  let zone = @tzdb.timezone("America/New_York")
  let transitions = zone.transitions()
  transitions.clear()
  let again = @tzdb.timezone("US/Eastern")
  assert_true(!again.transitions().is_empty())
  assert_eq(
    again.offset_seconds_at(@date.datetime(2024, 7, 1).to_ordinal()),
    -14400,
  )
}

///|
test "unknown names are explicit errors and do not alter the catalogue" {
  let before = @tzdb.available_timezones()
  for
    name in [
      "", "Europe/Atlantis", "america/new_york", " America/New_York", "UTC ", "../UTC",
      "/usr/share/zoneinfo/UTC", "Etc//UTC", "America/New_York\u{0000}", "EST5EDT,M3.2.0,M11.1.0",
    ] {
    assert_true(
      try {
        ignore(@tzdb.timezone(name))
        false
      } catch {
        @date.DateError::InvalidDate(message~) =>
          message.contains("unknown IANA timezone")
        _ => false
      },
    )
  }
  assert_eq(@tzdb.available_timezones(), before)
  assert_eq(@tzdb.timezone("UTC").offset_seconds_at(0.0), 0)
}

///|
test "IANA Etc names preserve POSIX signs and UTC aliases" {
  assert_eq(@tzdb.timezone("Etc/GMT+5").offset_seconds_at(0.0), -18000)
  assert_eq(@tzdb.timezone("Etc/GMT-14").offset_seconds_at(0.0), 50400)
  for name in ["UTC", "Etc/UTC", "UCT", "Zulu", "Universal"] {
    let zone = @tzdb.timezone(name)
    assert_eq(zone.offset_seconds_at(0.0), 0)
    assert_eq(
      @date.date_formatter("%Z").with_timezone(zone).format_value(0.0),
      "UTC",
    )
  }
}

///|
test "IANA 2026e Manitoba policy is included beyond the final table event" {
  let zone = @tzdb.timezone("America/Winnipeg")
  assert_eq(
    zone.offset_seconds_at(@date.datetime(2026, 1, 1).to_ordinal()),
    -21600,
  )
  assert_eq(
    zone.offset_seconds_at(@date.datetime(2027, 1, 1).to_ordinal()),
    -18000,
  )
  assert_eq(
    zone.offset_seconds_at(@date.datetime(2400, 1, 1).to_ordinal()),
    -18000,
  )
}

///|
test "named IANA history and aliases reach formatter and automatic ticks" {
  let zone = @tzdb.timezone("Europe/Paris")
  let first = @date.datetime(1900, 1, 1).to_ordinal()
  let ticks = @date.date_tick_values(
    first,
    first + 2.0 / 24.0,
    count=3,
    timezone=zone,
  )
  assert_eq(
    @date.format_date_ticks(ticks, format="%H:%M:%S %z %Z", timezone=zone),
    ["01:00:00 +000921 PMT", "02:00:00 +000921 PMT"],
  )
  let linked = @tzdb.timezone("Asia/Calcutta")
  assert_eq(
    linked.offset_seconds_at(@date.datetime(2024, 1, 1).to_ordinal()),
    19800,
  )
  assert_eq(
    @tzdb.timezone("Asia/Kathmandu").offset_seconds_at(
      @date.datetime(2024, 1, 1).to_ordinal(),
    ),
    20700,
  )
}

///|
test "named IANA recurrence skips gaps and retains both future fold instants" {
  let zone = @tzdb.timezone("US/Eastern")
  let spring = @date.rrule(
      @date.Daily,
      @date.datetime(2024, 3, 9, hour=7),
      count=3,
    )
    .with_timezone(zone)
    .all()
  assert_eq(
    spring.map(value => @date.format_date(value, "%Y-%m-%d %H:%M %Z")),
    ["2024-03-09 02:00 EST", "2024-03-11 02:00 EDT", "2024-03-12 02:00 EDT"],
  )
  let fall = @date.rrule(
      @date.Minutely,
      @date.datetime(2400, 11, 5, hour=5),
      interval=30,
      count=4,
    )
    .with_timezone(zone)
    .all()
  assert_eq(fall.map(value => @date.format_date(value, "%H:%M %Z")), [
    "01:00 EDT", "01:30 EDT", "01:00 EST", "01:30 EST",
  ])
}
