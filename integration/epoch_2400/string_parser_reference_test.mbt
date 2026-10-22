// Generated from original datestr2num under a fixed custom epoch.

///|
fn verify_string_parser_epoch_reference(
  parser : @date.DateStringParser,
) -> Unit raise {
  assert_eq(
    @date.datestr2num("January 1, 2400 00:00:00.123456", parser~),
    1.4288888888888888e-06,
  )
  assert_eq(
    @date.datestrs2num(["2400-01-01 13:00 UTC", "Jan 2 2400 10:00"], parser~),
    [0.5416666666666666, 1.4166666666666667],
  )
  assert_eq(@date.datestrs2num(["10:00", "11:00"], parser~), [
    0.4166666666666667, 0.4583333333333333,
  ])
}
