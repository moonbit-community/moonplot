///|
test "MaxN full grid pruning keeps a complete eager prefix and full round endpoints" {
  let previous = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous))
  @config.set_axes_autolimit_mode("round_numbers")
  let locator = @ticker.MaxNLocator::new(
    nbins=@ticker.MaxNBins::Count(200000),
    prune="upper",
  )
  let upper = locator.tick_values(0.0, 1.0)
  assert_eq(upper.length(), 100000)
  assert_eq(upper[0], 0.0)
  assert_eq(upper[99999], 0.599994)
  locator.set_params(prune=Some("both"))
  let both = locator.tick_values(0.0, 1.0)
  assert_eq(both.length(), 100000)
  assert_eq(both[0], 0.000006)
  assert_eq(both[99999], 0.6)
  assert_eq(locator.view_limits(0.0, 1.0), (0.0, 1.000002))
}

///|
test "MaxN automatic budget and copied providers remain live while fixed bins skip tick space" {
  let previous = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous))
  @config.set_axes_autolimit_mode("data")
  let space = [2.0]
  let reads = [0]
  let view = [0.0, 20.0]
  let locator = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  locator.bind_tick_space(() => {
    reads[0] += 1
    space[0]
  })
  locator.bind_view_interval(() => (view[0], view[1]))
  assert_eq(locator.call(), [0.0, 10.0, 20.0])
  assert_eq(reads[0], 1)
  let copied = locator.copy()
  space[0] = 5.0
  assert_eq(copied.call(), [0.0, 4.0, 8.0, 12.0, 16.0, 20.0])
  assert_eq(reads[0], 2)
  copied.set_params(nbins=@ticker.MaxNBins::Count(3))
  assert_eq(copied.call(), [0.0, 8.0, 16.0, 24.0])
  assert_eq(reads[0], 2)
  assert_eq(locator.call(), [0.0, 4.0, 8.0, 12.0, 16.0, 20.0])
  assert_eq(reads[0], 3)
  copied.bind_view_interval(() => {
    raise @core.DataError::InvalidTicks(message="view provider failed")
  })
  assert_true(
    try {
      ignore(copied.call())
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "view provider failed"
      _ => false
    },
  )
}

///|
test "MaxN numeric queries use the captured staircase rather than a later mutated borrowed step array" {
  let previous = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous))
  @config.set_axes_autolimit_mode("data")
  let steps = @ticker.TickValues::from_array([1.0, 2.0, 5.0, 10.0])
  let locator = @ticker.MaxNLocator::new(
    nbins=@ticker.MaxNBins::Count(3),
    steps~,
  )
  assert_eq(locator.tick_values(0.0, 10.0), [0.0, 5.0, 10.0])
  steps.set(1, 9.0)
  assert_eq(locator.steps().get(1), 9.0)
  assert_eq(locator.tick_values(0.0, 10.0), [0.0, 5.0, 10.0])
  locator.set_params(steps=None)
  assert_eq(locator.tick_values(0.0, 10.0), [0.0, 4.0, 8.0, 12.0])
}

///|
test "MaxN invalid bin count is delayed and data view limits still succeed" {
  let previous = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous))
  let locator = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Count(0))
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.view_limits(0.0, 10.0), (0.0, 10.0))
  assert_eq(locator.nonsingular(0.0, 0.0), (-0.05, 0.05))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 10.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(0.0, 10.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  locator.set_params(nbins=@ticker.MaxNBins::Count(3))
  assert_eq(locator.tick_values(0.0, 10.0), [0.0, 4.0, 8.0, 12.0])
}
