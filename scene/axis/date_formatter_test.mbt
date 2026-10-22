///|
fn concise_axis_ticks() -> Array[Double] {
  [
    try! @date.datetime(2024, 1, 30).to_ordinal(),
    try! @date.datetime(2024, 2, 2).to_ordinal(),
  ]
}

///|
test "date formatter preserves fixed ticks and manual labels suppress shared text" {
  let axis = @axis.axis()
  let ticks = concise_axis_ticks()
  axis.set_ticks(ticks)
  axis.set_date_formatter(@date.concise_date_formatter().as_formatter())
  assert_eq(axis.tick_labels(ticks), ["30", "02"])
  assert_eq(axis.formatter_offset_label(ticks), "2024-Feb")
  assert_eq(axis.tick_values(@core.limits(0.0, 1.0)), ticks)
  axis.set_tick_labels(["left", "right"])
  assert_eq(axis.tick_labels(ticks), ["left", "right"])
  assert_eq(axis.formatter_offset_label(ticks), "")
  axis.clear_ticks()
  assert_eq(axis.formatter_offset_label(ticks), "2024-Feb")
  axis.set_date_format("%Y-%m-%d")
  assert_true(axis.date_formatter() is None)
  assert_eq(axis.tick_labels(ticks), ["2024-01-30", "2024-02-02"])
  assert_eq(axis.formatter_offset_label(ticks), "")
}

///|
test "inverted date axes select the same offset endpoint as upstream" {
  let axis = @axis.axis()
  let ticks = concise_axis_ticks()
  axis.set_date_formatter(@date.concise_date_formatter().as_formatter())
  axis.set_limits(ticks[1], ticks[0])
  let generated = axis.tick_values(@core.limits(0.0, 1.0))
  assert_true(generated[0] > generated[generated.length() - 1])
  assert_eq(axis.formatter_offset_label(generated), "2024-Jan-30")
  assert_eq(axis.tick_labels(generated)[0], "Feb-02")
  axis.set_ticks(ticks)
  assert_eq(axis.formatter_offset_label(ticks), "2024-Jan")
  axis.set_ticks(ticks.rev())
  assert_eq(axis.formatter_offset_label(ticks.rev()), "2024-Feb")
  assert_eq(
    axis.formatter_offset_label_with_view(
      ticks,
      Some(@core.limits(ticks[0], ticks[1])),
    ),
    "2024-Feb",
  )
}

///|
test "formatter timezone controls labels independently of locator timezone" {
  let axis = @axis.axis()
  let ticks = [
    @date.datetime(2024, 1, 1, hour=1).to_ordinal(),
    @date.datetime(2024, 1, 1, hour=2).to_ordinal(),
  ]
  axis.set_date_locator(@date.hour_locator())
  axis.set_date_formatter(
    @date.concise_date_formatter().with_offset(180).as_formatter(),
  )
  assert_eq(axis.date_locator().unwrap().offset_minutes(), 0)
  assert_eq(axis.tick_labels(ticks), ["04:00", "05:00"])
  axis.set_date_locator(@date.hour_locator(interval=2))
  assert_true(axis.date_formatter() is Some(_))
  axis.set_date_offset(-300)
  assert_eq(axis.date_formatter().unwrap().offset_minutes(), -300)
  assert_eq(axis.date_locator().unwrap().offset_minutes(), -300)
  assert_eq(axis.tick_labels(ticks), ["20:00", "21:00"])
  axis.set_date_timezone(@date.fixed_timezone_seconds(561))
  assert_eq(axis.tick_labels(ticks), ["01:09", "02:09"])
  axis.clear_date()
  assert_true(axis.date_formatter() is None)
  axis.set_date_formatter(@date.date_formatter("%Y"))
  axis.clear()
  assert_true(axis.date_formatter() is None)
}

///|
test "date formatter rejects incompatible axes without changing their settings" {
  let axis = @axis.axis()
  axis.set_scale(@scale.log_scale())
  assert_true(
    try {
      axis.set_date_formatter(@date.concise_date_formatter().as_formatter())
      false
    } catch {
      _ => true
    },
  )
  assert_true(axis.date_formatter() is None)
  assert_true(axis.date_format() is None)
  axis.set_scale(@scale.linear_scale())
  axis.set_categories(["a", "b"])
  assert_true(
    try {
      axis.set_date_formatter(@date.date_formatter("%Y"))
      false
    } catch {
      _ => true
    },
  )
  assert_eq(axis.categories(), Some(["a", "b"]))
  assert_true(axis.date_formatter() is None)
}
