///|
test "automatic date scalar callbacks receive original values and positions and own TeX" {
  let calls : Array[(Double, Int32?)] = []
  let formatter = @date.AutoDateFormatter::new(usetex=true)
    .with_locator_unit(-11.0)
    .with_scale(
      -10.0,
      @date.Func(fn(value, pos) {
        calls.push((value, pos))
        match pos {
          None => "no-position"
          Some(0) => "first"
          Some(index) => "next=" + index.to_string()
        }
      }),
    )
    .with_offset(180)
  assert_eq(formatter.format_value(0.25), "no-position")
  assert_eq(formatter.format_ticks([0.25, 0.5]), ["first", "next=1"])
  assert_eq(calls, [(0.25, None), (0.25, Some(0)), (0.5, Some(1))])
  assert_eq(formatter.as_formatter().format_values([0.25, 0.5]), [
    "first", "next=1",
  ])
  assert_eq(formatter.as_formatter().offset_label([0.25, 0.5]), "")
  assert_eq(calls.length(), 5)
}

///|
test "automatic date array callbacks retain shape original date fields and optional position" {
  let formatter = @date.AutoDateFormatter::new()
    .with_locator_unit(-11.0)
    .with_scale(
      -10.0,
      @date.DatesFunc(fn(dates, pos) {
        assert_true(pos is Some(7)) catch {
          _ => abort("callback position")
        }
        dates.map(value => @date.format_date(value, "%d-%m//%Y"))
      }),
    )
  let date = @date.datetime(2014, 12, 25, offset_minutes=1380)
  assert_eq(formatter.format_dates([date], pos=7), ["25-12//2014"])
  assert_true(
    try {
      ignore(formatter.format_value(0.0))
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(formatter.format_array([0.0]))
      false
    } catch {
      _ => true
    },
  )
  let numeric = formatter.with_scale(
    -10.0,
    @date.ValuesFunc(fn(values, pos) {
      values.map(value => {
        if pos is None && value == 2.0 {
          "original"
        } else {
          "unexpected"
        }
      })
    }),
  )
  assert_eq(numeric.format_array([2.0, 2.0]), ["original", "original"])
  assert_true(
    try {
      ignore(numeric.format_ticks([2.0]))
      false
    } catch {
      _ => true
    },
  )
}

///|
test "automatic scale mappings copy storage normalize duplicate keys and validate atomically" {
  let entries : Array[(Double, @date.DateScaleFormat)] = [
    (1.0, @date.Text("one")),
    (1.0, @date.Text("last")),
  ]
  let original = @date.AutoDateFormatter::new().with_scaled(entries)
  entries[1] = (1.0, @date.Text("mutated"))
  original.scaled()[0] = (1.0, @date.Text("getter mutation"))
  assert_eq(original.scaled().length(), 1)
  assert_eq(original.format_value(0.0), "last")
  let changed = original.with_scale(1.0, @date.Text("copy"))
  assert_eq(original.format_value(0.0), "last")
  assert_eq(changed.format_value(0.0), "copy")
  assert_true(
    try {
      ignore(original.with_scale(0.0 / 0.0, @date.Text("NaN")))
      false
    } catch {
      _ => true
    },
  )
  assert_eq(original.format_value(0.0), "last")
  assert_eq(
    original.with_scaled([]).with_default_format("fallback").format_value(0.0),
    "fallback",
  )
}

///|
test "automatic rc formats are captured at construction and survive later config resets" {
  @config.reset()
  let snapshot = @config.rc_params()
  @config.set_date_autoformatter("minute", "first %H:%M")
  let locator = @date.minute_locator(interval=30)
  let original = @date.AutoDateFormatter::new(locator~)
  @config.set_date_autoformatter("minute", "second %H:%M")
  let changed = @date.AutoDateFormatter::new(locator~)
  @config.reset()
  assert_eq(snapshot.date_autoformatter("minute"), "%d %H:%M")
  assert_eq(original.format_value(0.0), "first 00:00")
  assert_eq(changed.format_value(0.0), "second 00:00")
  assert_eq(
    @date.AutoDateFormatter::new(locator~).format_value(0.0),
    "01 00:00",
  )
  assert_eq(
    original.with_locator(@date.hour_locator()).unit_scale(),
    1.0 / 24.0,
  )
  assert_eq(original.unit_scale(), 1.0 / 1440.0)
}

///|
test "automatic string entries retain exact timezone conversion and TeX copies" {
  let zone = @date.tzif_timezone(tzif_new_york)
  let formatter = @date.AutoDateFormatter::new(locator=@date.hour_locator())
    .with_scale(1.0 / 24.0, @date.Text("%H:%M %Z"))
    .with_timezone(zone)
  let ticks = [
    @date.datetime(2024, 11, 3, hour=5).to_ordinal(),
    @date.datetime(2024, 11, 3, hour=6).to_ordinal(),
  ]
  assert_eq(formatter.format_ticks(ticks), ["01:00 EDT", "01:00 EST"])
  assert_eq(formatter.with_usetex(true).format_ticks(ticks), [
    "$\\mathdefault{01{:}00\\;}$EDT", "$\\mathdefault{01{:}00\\;}$EST",
  ])
  assert_eq(formatter.with_offset(0).format_ticks(ticks), [
    "05:00 UTC", "06:00 UTC",
  ])
  assert_eq(formatter.format_ticks(ticks), ["01:00 EDT", "01:00 EST"])
}
