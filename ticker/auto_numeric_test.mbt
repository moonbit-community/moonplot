///|
test "AutoLocator classic construction and RcParams snapshots are independent" {
  let previous = @config.classic_mode()
  defer @config.set_classic_mode(previous)
  @config.set_classic_mode(false)
  let snapshot = @config.rc_params()
  let modern = @ticker.AutoLocator::new()
  @config.set_classic_mode(true)
  let classic = @ticker.AutoLocator::new()
  assert_true(!snapshot.classic_mode())
  assert_true(@config.rc_params().classic_mode())
  @config.reset()
  assert_true(!@config.classic_mode())
  assert_eq(modern.nbins(), @ticker.MaxNBins::Auto)
  assert_eq(classic.nbins(), @ticker.MaxNBins::Count(9))
  assert_eq(modern.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  assert_eq(classic.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
}

///|
test "AutoLocator forwards inherited nested None and live MaxN updates" {
  let previous = @config.classic_mode()
  defer @config.set_classic_mode(previous)
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  let owner = [0.0, 1.0, 99.0, 2.0, 99.0, 5.0, 99.0, 10.0]
  let view = @ticker.TickValues::from_array(owner).view(1, 2, 4)
  locator.set_params(steps=Some(view), prune=Some("both"), min_n_ticks=4)
  let extended = locator.extended_steps()
  locator.set_params()
  assert_eq(live.prune(), Some("both"))
  assert_eq(live.min_n_ticks(), 4)
  let shallow = locator.copy()
  shallow.steps().set(1, 2.25)
  assert_eq(owner[3], 2.25)
  assert_eq(locator.steps().get(1), 2.25)
  assert_eq(locator.extended_steps(), extended)
  live.set_params(
    nbins=@ticker.MaxNBins::Count(7),
    integer=true,
    symmetric=true,
  )
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(7))
  assert_true(locator.integer() && locator.symmetric())
  assert_eq(shallow.nbins(), @ticker.MaxNBins::Auto)
  locator.set_params(steps=None, prune=None)
  assert_eq(locator.prune(), None)
  assert_eq(locator.steps().to_array(), [
    1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0,
  ])
  assert_eq(shallow.steps().get(1), 2.25)
}

///|
test "AutoLocator providers are live through MaxN and preserve checked view errors" {
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  let spaces = [4.0]
  let bounds = [0.0, 1.0]
  live.bind_tick_space(fn() { spaces[0] })
  live.bind_view_interval(fn() { (bounds[0], bounds[1]) })
  assert_true(locator.tick_space_provider() is Some(_))
  assert_true(locator.view_interval_provider() is Some(_))
  assert_eq(locator.call(), locator.tick_values(0.0, 1.0))
  let copied = locator.copy()
  bounds[0] = 3.0
  bounds[1] = 8.0
  spaces[0] = 2.0
  assert_eq(copied.call(), copied.tick_values(3.0, 8.0))
  locator.bind_view_interval(() => {
    raise @core.DataError::InvalidTicks(message="injected view error")
  })
  assert_true(
    try {
      ignore(locator.call())
      false
    } catch {
      @core.DataError::InvalidTicks(message="injected view error") => true
      _ => false
    },
  )
  assert_eq(copied.call(), copied.tick_values(3.0, 8.0))
}

///|
test "AutoLocator classic count bypasses tick-space callback until explicitly reset to Auto" {
  let previous = @config.classic_mode()
  defer @config.set_classic_mode(previous)
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let reads = [0]
  locator.bind_tick_space(fn() {
    reads[0] += 1
    0.0 / 0.0
  })
  ignore(locator.tick_values(0.0, 20.0))
  assert_eq(reads[0], 0)
  locator.set_params(nbins=@ticker.MaxNBins::Auto)
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 20.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(reads[0] > 0)
}
