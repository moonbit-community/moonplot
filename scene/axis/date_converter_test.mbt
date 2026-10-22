///|
test "date axis captures converter on enable and clear discards snapshot" {
  @config.reset()
  let axis = @axis.axis()
  @config.set_date_converter("concise")
  @config.set_date_interval_multiples(false)
  axis.set_date()
  @config.reset()
  let ticks = [
    @date.datetime(2024, 1, 30).to_ordinal(),
    @date.datetime(2024, 1, 31).to_ordinal(),
  ]
  assert_eq(axis.tick_labels(ticks), ["30", "31"])
  assert_true(axis.auto_date_locator().unwrap().interval_multiples())
  axis.set_date()
  assert_eq(axis.tick_labels(ticks), ["30", "31"])
  axis.clear_date()
  assert_true(axis.date_converter() is None)
  axis.set_date()
  assert_eq(axis.tick_labels(ticks), ["01-30 00", "01-31 00"])
}

///|
test "converter replacement preserves fixed ticks timezone labels and explicit locators atomically" {
  let axis = @axis.axis()
  axis.set_date_locator(@date.month_locator())
  axis.set_date_offset(120)
  axis.set_ticks([0.0, 1.0])
  axis.set_tick_labels(["a", "b"])
  axis.set_date_converter(
    @date.ConciseDateConverter::new(show_offset=false).as_converter(),
  )
  assert_eq(axis.ticks(), Some([0.0, 1.0]))
  assert_eq(axis.tick_labels([0.0, 1.0]), ["a", "b"])
  assert_eq(axis.date_offset_minutes(), 120)
  assert_true(axis.date_locator() is None)
  assert_true(
    try {
      axis.set_date_converter(
        @date.ConciseDateConverter::new(formats=["bad"]).as_converter(),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_eq(axis.tick_labels([0.0, 1.0]), ["a", "b"])
  axis.clear_ticks()
  axis.set_date_locator(@date.month_locator())
  axis.set_date_converter(@date.DateConverter::new(interval_multiples=false))
  assert_eq(axis.date_locator().unwrap().unit_scale(), 30.0)
  assert_true(!axis.auto_date_locator().unwrap().interval_multiples())
}
