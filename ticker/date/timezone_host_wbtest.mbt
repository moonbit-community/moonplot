///|
test "named timezone host files use the dateutil compatibility block and cache snapshots" {
  let path = @env.current_dir().unwrap() + "/testdata/tzif/new_york.tzif"
  let zone = get_timezone(name=path)
  assert_eq(zone.offset_seconds_at(0.0), -18000)
  assert_eq(zone.offset_seconds_at(datetime(2400, 7, 1).to_ordinal()), -18000)
  assert_eq(get_timezone(name=":" + path).offset_seconds_at(0.0), -18000)
  parser_with_test_tz(path, () => {
    assert_eq(get_timezone(name="").offset_seconds_at(0.0), -18000)
  })
  parser_with_test_tz("XST-5:45", () => {
    assert_eq(get_timezone(name="").offset_seconds_at(0.0), 20700)
  })
  assert_true(
    try {
      ignore(get_timezone(name="/D12/nonexistent.tzif"))
      false
    } catch {
      _ => true
    },
  )
}
