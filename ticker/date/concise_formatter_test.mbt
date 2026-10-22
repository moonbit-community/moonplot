///|
test "concise format arrays validate and copy inputs and getter results" {
  for length in [1, 2, 5, 7] {
    let values = Array::make(length, "%Y")
    assert_true(
      try {
        ignore(@date.concise_date_formatter(formats=values))
        false
      } catch {
        _ => true
      },
    )
    assert_true(
      try {
        ignore(@date.concise_date_formatter(zero_formats=values))
        false
      } catch {
        _ => true
      },
    )
    assert_true(
      try {
        ignore(@date.concise_date_formatter(offset_formats=values))
        false
      } catch {
        _ => true
      },
    )
  }
  let formats = ["%Y", "%b", "%d", "%H:%M", "%H:%M", "%S.%f"]
  let zeros = ["", "%Y", "%b", "%d", "%H:%M", "%H:%M"]
  let offsets = ["", "%Y", "%Y-%b", "%Y-%b-%d", "%Y-%b-%d", "%Y-%b-%d %H:%M"]
  let formatter = @date.concise_date_formatter(
    formats~,
    zero_formats=zeros,
    offset_formats=offsets,
  )
  formats[2] = "changed"
  zeros[2] = "changed"
  offsets[2] = "changed"
  formatter.formats()[2] = "changed again"
  formatter.zero_formats()[2] = "changed again"
  formatter.offset_formats()[2] = "changed again"
  assert_eq(formatter.formats()[2], "%d")
  assert_eq(formatter.zero_formats()[2], "%b")
  assert_eq(formatter.offset_formats()[2], "%Y-%b")
}

///|
test "concise offset state refreshes on zoom and clears for empty or suppressed batches" {
  let formatter = @date.concise_date_formatter()
  assert_eq(formatter.get_offset(), "")
  let january = [
    @date.datetime(2024, 1, 5).to_ordinal(),
    @date.datetime(2024, 1, 6).to_ordinal(),
  ]
  assert_eq(formatter.format_ticks(january), ["05", "06"])
  assert_eq(formatter.get_offset(), "2024-Jan")
  let months = [
    @date.datetime(2024, 2, 1).to_ordinal(),
    @date.datetime(2024, 3, 1).to_ordinal(),
  ]
  assert_eq(formatter.format_ticks(months), ["Feb", "Mar"])
  assert_eq(formatter.get_offset(), "2024")
  ignore(
    formatter.format_ticks([
      @date.datetime(2024, 1, 1).to_ordinal(),
      @date.datetime(2024, 2, 1).to_ordinal(),
    ]),
  )
  assert_eq(formatter.get_offset(), "")
  ignore(formatter.format_ticks(january))
  assert_eq(formatter.format_ticks([]), [])
  assert_eq(formatter.get_offset(), "")
  let hidden = formatter.with_show_offset(false)
  assert_true(!hidden.show_offset())
  assert_eq(hidden.format_ticks(january), ["05", "06"])
  assert_eq(hidden.get_offset(), "")
  assert_true(formatter.show_offset())
}

///|
test "invalid concise batches leave last successful offset intact" {
  let formatter = @date.concise_date_formatter()
  let ticks = [
    @date.datetime(2024, 1, 5).to_ordinal(),
    @date.datetime(2024, 1, 6).to_ordinal(),
  ]
  ignore(formatter.format_ticks(ticks))
  for value in [0.0 / 0.0, 1.0 / 0.0, 1.0e100] {
    assert_true(
      try {
        ignore(formatter.format_ticks([ticks[0], value]))
        false
      } catch {
        _ => true
      },
    )
    assert_eq(formatter.get_offset(), "2024-Jan")
    assert_eq(formatter.as_formatter().offset_label([ticks[0], value]), "")
  }
}

///|
test "scalar and concise formatter copies retain independent label conversion" {
  let ticks = [
    @date.datetime(2024, 1, 1, hour=1).to_ordinal(),
    @date.datetime(2024, 1, 1, hour=2).to_ordinal(),
  ]
  let original = @date.concise_date_formatter()
  let east = original.with_offset(180)
  assert_eq(original.format_ticks(ticks), ["01:00", "02:00"])
  assert_eq(east.format_ticks(ticks), ["04:00", "05:00"])
  let scalar = @date.date_formatter("%H:%M").with_offset(180)
  assert_eq(scalar.copy().format_values(ticks), ["04:00", "05:00"])
  assert_eq(scalar.offset_label(ticks), "")
  assert_eq(scalar.with_usetex(true).format_values(ticks), [
    "$\\mathdefault{04{:}00}$", "$\\mathdefault{05{:}00}$",
  ])
  assert_eq(scalar.format_values(ticks), ["04:00", "05:00"])
  assert_eq(
    original.as_formatter().copy().with_offset(-300).format_values(ticks),
    ["20:00", "21:00"],
  )
  assert_eq(original.format_data_short(ticks[0]), "2024-01-01 01:00:00")
  assert_eq(original.get_offset(), "2024-Jan-01")
  assert_eq(original.default_format(), "%Y")
  let detailed = original.with_default_format("%m/%d %H:%M")
  assert_eq(detailed.format_value(ticks[0]), "01/01 01:00")
  assert_eq(detailed.format_ticks(ticks), ["01:00", "02:00"])
  assert_eq(detailed.format_data_short(ticks[0]), "2024-01-01 01:00:00")
  assert_eq(original.format_value(ticks[0]), "2024")
  assert_eq(
    original.with_usetex(true).format_value(ticks[0]),
    "$\\mathdefault{2024}$",
  )
}
