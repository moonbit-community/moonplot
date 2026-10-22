///|
test "minor subdivision defaults axis isolation snapshots and reset" {
  @config.reset()
  defer @config.reset()
  assert_eq(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Text("auto"),
  )
  assert_eq(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Text("auto"),
  )
  let before = @config.rc_params()
  @config.set_minor_tick_divisions(@config.MinorTickDivisions::Number(2.5))
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Text("AUTO"),
    horizontal=false,
  )
  let changed = @config.rc_params()
  @config.reset()
  assert_eq(
    before.minor_tick_divisions(),
    @config.MinorTickDivisions::Text("auto"),
  )
  assert_eq(
    changed.minor_tick_divisions(),
    @config.MinorTickDivisions::Integer(@bigint.BigInt::from_int(2)),
  )
  assert_eq(
    changed.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Text("AUTO"),
  )
  assert_eq(
    @config.minor_tick_divisions(),
    @config.MinorTickDivisions::Text("auto"),
  )
  assert_eq(
    @config.minor_tick_divisions(horizontal=false),
    @config.MinorTickDivisions::Text("auto"),
  )
}
