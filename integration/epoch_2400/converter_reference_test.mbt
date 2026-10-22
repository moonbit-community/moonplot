// Generated from pinned converter classes.

///|
fn verify_converter_epoch_reference(
  auto : @date.DateAxisInfo,
  concise : @date.DateAxisInfo,
) -> Unit raise {
  let ticks = auto.major_locator().tick_values(0.0, 1.6666666666666667)
  assert_eq(ticks, [
    0.0, 0.16666666666666666, 0.3333333333333333, 0.5, 0.6666666666666666, 0.8333333333333334,
    1.0, 1.1666666666666667, 1.3333333333333333, 1.5, 1.6666666666666667,
  ])
  assert_eq(auto.major_formatter().format_values(ticks), [
    "01-01 00", "01-01 04", "01-01 08", "01-01 12", "01-01 16", "01-01 20", "01-02 00",
    "01-02 04", "01-02 08", "01-02 12", "01-02 16",
  ])
  assert_eq(auto.major_formatter().offset_label(ticks), "")
  let ticks = concise.major_locator().tick_values(0.0, 1.6666666666666667)
  assert_eq(ticks, [
    0.0, 0.16666666666666666, 0.3333333333333333, 0.5, 0.6666666666666666, 0.8333333333333334,
    1.0, 1.1666666666666667, 1.3333333333333333, 1.5, 1.6666666666666667,
  ])
  assert_eq(concise.major_formatter().format_values(ticks), [
    "Jan-01", "04:00", "08:00", "12:00", "16:00", "20:00", "Jan-02", "04:00", "08:00",
    "12:00", "16:00",
  ])
  assert_eq(concise.major_formatter().offset_label(ticks), "2400-Jan-02")
}
