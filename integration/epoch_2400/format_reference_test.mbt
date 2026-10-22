// Generated from pinned DateFormatter.

///|
fn verify_format_epoch_reference(formatter : @date.DateFormatter) -> Unit raise {
  assert_eq(formatter.format_values([0.5416666666666666, 365.99998842592595]), [
    "2399-W52-6|001|00|00|01:00:00 PM|Sat Jan  1 13:00:00 2400|01/01/00|13:00:00|000000",
    "2400-W52-7|366|53|52|11:59:59 PM|Sun Dec 31 23:59:59 2400|12/31/00|23:59:59|000000",
  ])
}
