// Generated from complete fixed AutoLocator/MaxNLocator source and real _api validation.

///|
fn verify_auto_numeric_values(
  actual : Array[Double],
  expected : Array[Double],
) -> Unit raise {
  assert_eq(actual.length(), expected.length())
  for index, value in expected {
    if value.is_nan() {
      assert_true(actual[index].is_nan())
    } else {
      assert_eq(
        actual[index].reinterpret_as_uint64(),
        value.reinterpret_as_uint64(),
      )
    }
  }
}

///|
test "AutoLocator original 0 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0, 1.0), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.call())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
}

///|
test "AutoLocator original 1 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0, 1.0), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.call())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
}

///|
test "AutoLocator original 2 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-3.7, 14.2), [
    -4.0, -2.0, 0.0, 2.0, 4.0, 6.0, 8.0, 10.0, 12.0, 14.0, 16.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(14.2, -3.7), [
    -4.0, -2.0, 0.0, 2.0, 4.0, 6.0, 8.0, 10.0, 12.0, 14.0, 16.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-3.7, 14.2])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-3.7, 14.2])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.call())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
}

///|
test "AutoLocator original 3 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-3.7, 14.2), [
    -5.0, -2.5, 0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(14.2, -3.7), [
    -5.0, -2.5, 0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-5.0, 15.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-3.7, 14.2])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.call())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
}

///|
test "AutoLocator original 4 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000000.0, 10000000001.0),
    [
      10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8,
      10000000001.0,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000001.0, 10000000000.0),
    [
      10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8,
      10000000001.0,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.call())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
}

///|
test "AutoLocator original 5 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000000.0, 10000000001.0),
    [
      10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8,
      10000000001.0,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000001.0, 10000000000.0),
    [
      10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8,
      10000000001.0,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.call())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
}

///|
test "AutoLocator original 6 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [1.999999999998, 2.000000000002])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [1.9, 2.1])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.call())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
}

///|
test "AutoLocator original 7 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [
    1.9999999999979998, 2.000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [1.9, 2.1])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.call())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
}

///|
test "AutoLocator original 8 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-1.0e-290, 1.0e-290), [
    -1.0e-13, -7.500000000000001e-14, -5.0e-14, -2.4999999999999994e-14, 0.0, 2.4999999999999994e-14,
    5.0000000000000014e-14, 7.500000000000001e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0e-290, -1.0e-290), [
    -1.0e-13, -7.500000000000001e-14, -5.0e-14, -2.4999999999999994e-14, 0.0, 2.4999999999999994e-14,
    5.0000000000000014e-14, 7.500000000000001e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.call())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
}

///|
test "AutoLocator original 9 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-1.0e-290, 1.0e-290), [
    -1.0e-13, -7.500000000000001e-14, -5.0e-14, -2.4999999999999994e-14, 0.0, 2.4999999999999994e-14,
    5.0000000000000014e-14, 7.500000000000001e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0e-290, -1.0e-290), [
    -1.0e-13, -7.500000000000001e-14, -5.0e-14, -2.4999999999999994e-14, 0.0, 2.4999999999999994e-14,
    5.0000000000000014e-14, 7.500000000000001e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.call())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
}

///|
test "AutoLocator original 10 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.0e+150, 1.00000000000001e+150),
    [
      9.999999999999e+149, 9.99999999999925e+149, 9.9999999999995e+149, 9.999999999999749e+149,
      1.0e+150, 1.000000000000025e+150, 1.00000000000005e+150, 1.000000000000075e+150,
      1.0000000000001e+150,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.00000000000001e+150, 1.0e+150),
    [
      9.999999999999e+149, 9.99999999999925e+149, 9.9999999999995e+149, 9.999999999999749e+149,
      1.0e+150, 1.000000000000025e+150, 1.00000000000005e+150, 1.000000000000075e+150,
      1.0000000000001e+150,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [
    9.99999999999e+149, 1.00000000000101e+150,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [1.0e+150, 1.00000000000001e+150])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.call())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
}

///|
test "AutoLocator original 11 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.0e+150, 1.00000000000001e+150),
    [
      9.999999999999e+149, 9.99999999999925e+149, 9.9999999999995e+149, 9.999999999999749e+149,
      1.0e+150, 1.000000000000025e+150, 1.00000000000005e+150, 1.000000000000075e+150,
      1.0000000000001e+150,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.00000000000001e+150, 1.0e+150),
    [
      9.999999999999e+149, 9.99999999999925e+149, 9.9999999999995e+149, 9.999999999999749e+149,
      1.0e+150, 1.000000000000025e+150, 1.00000000000005e+150, 1.000000000000075e+150,
      1.0000000000001e+150,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [
    9.99999999999e+149, 1.000000000001e+150,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [1.0e+150, 1.00000000000001e+150])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.call())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
}

///|
test "AutoLocator original 12 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0 / 0.0, 1.0), [
    -1.0e-13, -7.500000000000001e-14, -5.0e-14, -2.4999999999999994e-14, 0.0, 2.4999999999999994e-14,
    5.0000000000000014e-14, 7.500000000000001e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0 / 0.0), [
    -1.0e-13, -7.500000000000001e-14, -5.0e-14, -2.4999999999999994e-14, 0.0, 2.4999999999999994e-14,
    5.0000000000000014e-14, 7.500000000000001e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.call())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
}

///|
test "AutoLocator original 13 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0 / 0.0, 1.0), [
    -1.0e-13, -7.500000000000001e-14, -5.0e-14, -2.4999999999999994e-14, 0.0, 2.4999999999999994e-14,
    5.0000000000000014e-14, 7.500000000000001e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0 / 0.0), [
    -1.0e-13, -7.500000000000001e-14, -5.0e-14, -2.4999999999999994e-14, 0.0, 2.4999999999999994e-14,
    5.0000000000000014e-14, 7.500000000000001e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.call())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
}

///|
test "AutoLocator original 14 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [-1.0 / 0.0]
  let binding_view = [0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0, 1.0), [0.0, 1.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0), [0.0, 1.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [0.0, 1.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 15 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [-1.0 / 0.0]
  let binding_view = [0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0, 1.0), [0.0, 1.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0), [0.0, 1.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [0.0, 1.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 16 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [-1.0 / 0.0]
  let binding_view = [-3.7, 14.2]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-3.7, 14.2), [
    -10.0, 0.0, 10.0, 20.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(14.2, -3.7), [
    -10.0, 0.0, 10.0, 20.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-3.7, 14.2])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-3.7, 14.2])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [-10.0, 0.0, 10.0, 20.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 17 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [-1.0 / 0.0]
  let binding_view = [-3.7, 14.2]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-3.7, 14.2), [
    -10.0, 0.0, 10.0, 20.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(14.2, -3.7), [
    -10.0, 0.0, 10.0, 20.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-10.0, 20.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-3.7, 14.2])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [-10.0, 0.0, 10.0, 20.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 18 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [-1.0 / 0.0]
  let binding_view = [10000000000.0, 10000000001.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000000.0, 10000000001.0),
    [10000000000.0, 10000000001.0],
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000001.0, 10000000000.0),
    [10000000000.0, 10000000001.0],
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 19 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [-1.0 / 0.0]
  let binding_view = [10000000000.0, 10000000001.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000000.0, 10000000001.0),
    [10000000000.0, 10000000001.0],
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000001.0, 10000000000.0),
    [10000000000.0, 10000000001.0],
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 20 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [-1.0 / 0.0]
  let binding_view = [2.0, 2.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 2.0, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 2.0, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [1.999999999998, 2.000000000002])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [1.9, 2.1])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    1.9999999999998, 2.0, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 21 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [-1.0 / 0.0]
  let binding_view = [2.0, 2.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 2.0, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 2.0, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [
    1.9999999999979998, 2.000000000002,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [1.9, 2.1])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    1.9999999999998, 2.0, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 22 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [-1.0 / 0.0]
  let binding_view = [-1.0e-290, 1.0e-290]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-1.0e-290, 1.0e-290), [
    -1.0e-13, 0.0, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0e-290, -1.0e-290), [
    -1.0e-13, 0.0, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [-1.0e-13, 0.0, 1.0e-13])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 23 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [-1.0 / 0.0]
  let binding_view = [-1.0e-290, 1.0e-290]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-1.0e-290, 1.0e-290), [
    -1.0e-13, 0.0, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0e-290, -1.0e-290), [
    -1.0e-13, 0.0, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [-1.0e-13, 0.0, 1.0e-13])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 24 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [-1.0 / 0.0]
  let binding_view = [1.0e+150, 1.00000000000001e+150]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.0e+150, 1.00000000000001e+150),
    [9.999999999999e+149, 1.0e+150, 1.0000000000001e+150],
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.00000000000001e+150, 1.0e+150),
    [9.999999999999e+149, 1.0e+150, 1.0000000000001e+150],
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [
    9.99999999999e+149, 1.00000000000101e+150,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [1.0e+150, 1.00000000000001e+150])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    9.999999999999e+149, 1.0e+150, 1.0000000000001e+150,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 25 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [-1.0 / 0.0]
  let binding_view = [1.0e+150, 1.00000000000001e+150]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.0e+150, 1.00000000000001e+150),
    [9.999999999999e+149, 1.0e+150, 1.0000000000001e+150],
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.00000000000001e+150, 1.0e+150),
    [9.999999999999e+149, 1.0e+150, 1.0000000000001e+150],
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [
    9.99999999999e+149, 1.000000000001e+150,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [1.0e+150, 1.00000000000001e+150])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    9.999999999999e+149, 1.0e+150, 1.0000000000001e+150,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 26 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [-1.0 / 0.0]
  let binding_view = [0.0 / 0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0 / 0.0, 1.0), [
    -1.0e-13, 0.0, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0 / 0.0), [
    -1.0e-13, 0.0, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [-1.0e-13, 0.0, 1.0e-13])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 27 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [-1.0 / 0.0]
  let binding_view = [0.0 / 0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0 / 0.0, 1.0), [
    -1.0e-13, 0.0, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0 / 0.0), [
    -1.0e-13, 0.0, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [-1.0e-13, 0.0, 1.0e-13])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 28 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [-3.0]
  let binding_view = [0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0, 1.0), [0.0, 1.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0), [0.0, 1.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [0.0, 1.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 29 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [-3.0]
  let binding_view = [0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0, 1.0), [0.0, 1.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0), [0.0, 1.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [0.0, 1.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 30 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [-3.0]
  let binding_view = [-3.7, 14.2]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-3.7, 14.2), [
    -10.0, 0.0, 10.0, 20.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(14.2, -3.7), [
    -10.0, 0.0, 10.0, 20.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-3.7, 14.2])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-3.7, 14.2])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [-10.0, 0.0, 10.0, 20.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 31 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [-3.0]
  let binding_view = [-3.7, 14.2]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-3.7, 14.2), [
    -10.0, 0.0, 10.0, 20.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(14.2, -3.7), [
    -10.0, 0.0, 10.0, 20.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-10.0, 20.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-3.7, 14.2])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [-10.0, 0.0, 10.0, 20.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 32 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [-3.0]
  let binding_view = [10000000000.0, 10000000001.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000000.0, 10000000001.0),
    [10000000000.0, 10000000001.0],
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000001.0, 10000000000.0),
    [10000000000.0, 10000000001.0],
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 33 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [-3.0]
  let binding_view = [10000000000.0, 10000000001.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000000.0, 10000000001.0),
    [10000000000.0, 10000000001.0],
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000001.0, 10000000000.0),
    [10000000000.0, 10000000001.0],
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 34 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [-3.0]
  let binding_view = [2.0, 2.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 2.0, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 2.0, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [1.999999999998, 2.000000000002])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [1.9, 2.1])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    1.9999999999998, 2.0, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 35 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [-3.0]
  let binding_view = [2.0, 2.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 2.0, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 2.0, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [
    1.9999999999979998, 2.000000000002,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [1.9, 2.1])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    1.9999999999998, 2.0, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 36 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [-3.0]
  let binding_view = [-1.0e-290, 1.0e-290]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-1.0e-290, 1.0e-290), [
    -1.0e-13, 0.0, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0e-290, -1.0e-290), [
    -1.0e-13, 0.0, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [-1.0e-13, 0.0, 1.0e-13])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 37 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [-3.0]
  let binding_view = [-1.0e-290, 1.0e-290]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-1.0e-290, 1.0e-290), [
    -1.0e-13, 0.0, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0e-290, -1.0e-290), [
    -1.0e-13, 0.0, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [-1.0e-13, 0.0, 1.0e-13])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 38 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [-3.0]
  let binding_view = [1.0e+150, 1.00000000000001e+150]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.0e+150, 1.00000000000001e+150),
    [9.999999999999e+149, 1.0e+150, 1.0000000000001e+150],
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.00000000000001e+150, 1.0e+150),
    [9.999999999999e+149, 1.0e+150, 1.0000000000001e+150],
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [
    9.99999999999e+149, 1.00000000000101e+150,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [1.0e+150, 1.00000000000001e+150])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    9.999999999999e+149, 1.0e+150, 1.0000000000001e+150,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 39 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [-3.0]
  let binding_view = [1.0e+150, 1.00000000000001e+150]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.0e+150, 1.00000000000001e+150),
    [9.999999999999e+149, 1.0e+150, 1.0000000000001e+150],
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.00000000000001e+150, 1.0e+150),
    [9.999999999999e+149, 1.0e+150, 1.0000000000001e+150],
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [
    9.99999999999e+149, 1.000000000001e+150,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [1.0e+150, 1.00000000000001e+150])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    9.999999999999e+149, 1.0e+150, 1.0000000000001e+150,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 40 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [-3.0]
  let binding_view = [0.0 / 0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0 / 0.0, 1.0), [
    -1.0e-13, 0.0, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0 / 0.0), [
    -1.0e-13, 0.0, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [-1.0e-13, 0.0, 1.0e-13])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 41 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [-3.0]
  let binding_view = [0.0 / 0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0 / 0.0, 1.0), [
    -1.0e-13, 0.0, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0 / 0.0), [
    -1.0e-13, 0.0, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [-1.0e-13, 0.0, 1.0e-13])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 42 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [0.0]
  let binding_view = [0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0, 1.0), [0.0, 1.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0), [0.0, 1.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [0.0, 1.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 43 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [0.0]
  let binding_view = [0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0, 1.0), [0.0, 1.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0), [0.0, 1.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [0.0, 1.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 44 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [0.0]
  let binding_view = [-3.7, 14.2]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-3.7, 14.2), [
    -10.0, 0.0, 10.0, 20.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(14.2, -3.7), [
    -10.0, 0.0, 10.0, 20.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-3.7, 14.2])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-3.7, 14.2])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [-10.0, 0.0, 10.0, 20.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 45 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [0.0]
  let binding_view = [-3.7, 14.2]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-3.7, 14.2), [
    -10.0, 0.0, 10.0, 20.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(14.2, -3.7), [
    -10.0, 0.0, 10.0, 20.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-10.0, 20.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-3.7, 14.2])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [-10.0, 0.0, 10.0, 20.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 46 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [0.0]
  let binding_view = [10000000000.0, 10000000001.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000000.0, 10000000001.0),
    [10000000000.0, 10000000001.0],
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000001.0, 10000000000.0),
    [10000000000.0, 10000000001.0],
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 47 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [0.0]
  let binding_view = [10000000000.0, 10000000001.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000000.0, 10000000001.0),
    [10000000000.0, 10000000001.0],
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000001.0, 10000000000.0),
    [10000000000.0, 10000000001.0],
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 48 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [0.0]
  let binding_view = [2.0, 2.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 2.0, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 2.0, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [1.999999999998, 2.000000000002])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [1.9, 2.1])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    1.9999999999998, 2.0, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 49 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [0.0]
  let binding_view = [2.0, 2.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 2.0, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 2.0, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [
    1.9999999999979998, 2.000000000002,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [1.9, 2.1])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    1.9999999999998, 2.0, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 50 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [0.0]
  let binding_view = [-1.0e-290, 1.0e-290]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-1.0e-290, 1.0e-290), [
    -1.0e-13, 0.0, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0e-290, -1.0e-290), [
    -1.0e-13, 0.0, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [-1.0e-13, 0.0, 1.0e-13])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 51 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [0.0]
  let binding_view = [-1.0e-290, 1.0e-290]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-1.0e-290, 1.0e-290), [
    -1.0e-13, 0.0, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0e-290, -1.0e-290), [
    -1.0e-13, 0.0, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [-1.0e-13, 0.0, 1.0e-13])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 52 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [0.0]
  let binding_view = [1.0e+150, 1.00000000000001e+150]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.0e+150, 1.00000000000001e+150),
    [9.999999999999e+149, 1.0e+150, 1.0000000000001e+150],
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.00000000000001e+150, 1.0e+150),
    [9.999999999999e+149, 1.0e+150, 1.0000000000001e+150],
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [
    9.99999999999e+149, 1.00000000000101e+150,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [1.0e+150, 1.00000000000001e+150])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    9.999999999999e+149, 1.0e+150, 1.0000000000001e+150,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 53 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [0.0]
  let binding_view = [1.0e+150, 1.00000000000001e+150]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.0e+150, 1.00000000000001e+150),
    [9.999999999999e+149, 1.0e+150, 1.0000000000001e+150],
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.00000000000001e+150, 1.0e+150),
    [9.999999999999e+149, 1.0e+150, 1.0000000000001e+150],
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [
    9.99999999999e+149, 1.000000000001e+150,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [1.0e+150, 1.00000000000001e+150])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    9.999999999999e+149, 1.0e+150, 1.0000000000001e+150,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 54 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [0.0]
  let binding_view = [0.0 / 0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0 / 0.0, 1.0), [
    -1.0e-13, 0.0, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0 / 0.0), [
    -1.0e-13, 0.0, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [-1.0e-13, 0.0, 1.0e-13])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 55 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [0.0]
  let binding_view = [0.0 / 0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0 / 0.0, 1.0), [
    -1.0e-13, 0.0, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0 / 0.0), [
    -1.0e-13, 0.0, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [-1.0e-13, 0.0, 1.0e-13])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 56 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [1.0]
  let binding_view = [0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0, 1.0), [0.0, 1.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0), [0.0, 1.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [0.0, 1.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 57 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [1.0]
  let binding_view = [0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0, 1.0), [0.0, 1.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0), [0.0, 1.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [0.0, 1.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 58 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [1.0]
  let binding_view = [-3.7, 14.2]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-3.7, 14.2), [
    -10.0, 0.0, 10.0, 20.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(14.2, -3.7), [
    -10.0, 0.0, 10.0, 20.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-3.7, 14.2])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-3.7, 14.2])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [-10.0, 0.0, 10.0, 20.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 59 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [1.0]
  let binding_view = [-3.7, 14.2]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-3.7, 14.2), [
    -10.0, 0.0, 10.0, 20.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(14.2, -3.7), [
    -10.0, 0.0, 10.0, 20.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-10.0, 20.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-3.7, 14.2])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [-10.0, 0.0, 10.0, 20.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 60 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [1.0]
  let binding_view = [10000000000.0, 10000000001.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000000.0, 10000000001.0),
    [10000000000.0, 10000000001.0],
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000001.0, 10000000000.0),
    [10000000000.0, 10000000001.0],
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 61 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [1.0]
  let binding_view = [10000000000.0, 10000000001.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000000.0, 10000000001.0),
    [10000000000.0, 10000000001.0],
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000001.0, 10000000000.0),
    [10000000000.0, 10000000001.0],
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 62 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [1.0]
  let binding_view = [2.0, 2.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 2.0, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 2.0, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [1.999999999998, 2.000000000002])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [1.9, 2.1])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    1.9999999999998, 2.0, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 63 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [1.0]
  let binding_view = [2.0, 2.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 2.0, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 2.0, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [
    1.9999999999979998, 2.000000000002,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [1.9, 2.1])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    1.9999999999998, 2.0, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 64 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [1.0]
  let binding_view = [-1.0e-290, 1.0e-290]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-1.0e-290, 1.0e-290), [
    -1.0e-13, 0.0, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0e-290, -1.0e-290), [
    -1.0e-13, 0.0, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [-1.0e-13, 0.0, 1.0e-13])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 65 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [1.0]
  let binding_view = [-1.0e-290, 1.0e-290]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-1.0e-290, 1.0e-290), [
    -1.0e-13, 0.0, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0e-290, -1.0e-290), [
    -1.0e-13, 0.0, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [-1.0e-13, 0.0, 1.0e-13])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 66 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [1.0]
  let binding_view = [1.0e+150, 1.00000000000001e+150]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.0e+150, 1.00000000000001e+150),
    [9.999999999999e+149, 1.0e+150, 1.0000000000001e+150],
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.00000000000001e+150, 1.0e+150),
    [9.999999999999e+149, 1.0e+150, 1.0000000000001e+150],
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [
    9.99999999999e+149, 1.00000000000101e+150,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [1.0e+150, 1.00000000000001e+150])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    9.999999999999e+149, 1.0e+150, 1.0000000000001e+150,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 67 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [1.0]
  let binding_view = [1.0e+150, 1.00000000000001e+150]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.0e+150, 1.00000000000001e+150),
    [9.999999999999e+149, 1.0e+150, 1.0000000000001e+150],
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.00000000000001e+150, 1.0e+150),
    [9.999999999999e+149, 1.0e+150, 1.0000000000001e+150],
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [
    9.99999999999e+149, 1.000000000001e+150,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [1.0e+150, 1.00000000000001e+150])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    9.999999999999e+149, 1.0e+150, 1.0000000000001e+150,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 68 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [1.0]
  let binding_view = [0.0 / 0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0 / 0.0, 1.0), [
    -1.0e-13, 0.0, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0 / 0.0), [
    -1.0e-13, 0.0, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [-1.0e-13, 0.0, 1.0e-13])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 69 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [1.0]
  let binding_view = [0.0 / 0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0 / 0.0, 1.0), [
    -1.0e-13, 0.0, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0 / 0.0), [
    -1.0e-13, 0.0, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [-1.0e-13, 0.0, 1.0e-13])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 70 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [2.5]
  let binding_view = [0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0, 1.0), [0.0, 0.5, 1.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0), [0.0, 0.5, 1.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [0.0, 0.5, 1.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 71 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [2.5]
  let binding_view = [0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0, 1.0), [0.0, 0.5, 1.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0), [0.0, 0.5, 1.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [0.0, 0.5, 1.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 72 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [2.5]
  let binding_view = [-3.7, 14.2]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-3.7, 14.2), [
    -10.0, 0.0, 10.0, 20.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(14.2, -3.7), [
    -10.0, 0.0, 10.0, 20.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-3.7, 14.2])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-3.7, 14.2])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [-10.0, 0.0, 10.0, 20.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 73 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [2.5]
  let binding_view = [-3.7, 14.2]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-3.7, 14.2), [
    -10.0, 0.0, 10.0, 20.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(14.2, -3.7), [
    -10.0, 0.0, 10.0, 20.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-10.0, 20.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-3.7, 14.2])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [-10.0, 0.0, 10.0, 20.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 74 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [2.5]
  let binding_view = [10000000000.0, 10000000001.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000000.0, 10000000001.0),
    [10000000000.0, 10000000000.5, 10000000001.0],
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000001.0, 10000000000.0),
    [10000000000.0, 10000000000.5, 10000000001.0],
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    10000000000.0, 10000000000.5, 10000000001.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 75 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [2.5]
  let binding_view = [10000000000.0, 10000000001.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000000.0, 10000000001.0),
    [10000000000.0, 10000000000.5, 10000000001.0],
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000001.0, 10000000000.0),
    [10000000000.0, 10000000000.5, 10000000001.0],
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    10000000000.0, 10000000000.5, 10000000001.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 76 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [2.5]
  let binding_view = [2.0, 2.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 2.0, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 2.0, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [1.999999999998, 2.000000000002])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [1.9, 2.1])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    1.9999999999998, 2.0, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 77 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [2.5]
  let binding_view = [2.0, 2.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 2.0, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 2.0, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [
    1.9999999999979998, 2.000000000002,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [1.9, 2.1])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    1.9999999999998, 2.0, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 78 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [2.5]
  let binding_view = [-1.0e-290, 1.0e-290]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-1.0e-290, 1.0e-290), [
    -1.0e-13, 0.0, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0e-290, -1.0e-290), [
    -1.0e-13, 0.0, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [-1.0e-13, 0.0, 1.0e-13])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 79 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [2.5]
  let binding_view = [-1.0e-290, 1.0e-290]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-1.0e-290, 1.0e-290), [
    -1.0e-13, 0.0, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0e-290, -1.0e-290), [
    -1.0e-13, 0.0, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [-1.0e-13, 0.0, 1.0e-13])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 80 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [2.5]
  let binding_view = [1.0e+150, 1.00000000000001e+150]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.0e+150, 1.00000000000001e+150),
    [9.999999999999e+149, 1.0e+150, 1.0000000000001e+150],
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.00000000000001e+150, 1.0e+150),
    [9.999999999999e+149, 1.0e+150, 1.0000000000001e+150],
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [
    9.99999999999e+149, 1.00000000000101e+150,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [1.0e+150, 1.00000000000001e+150])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    9.999999999999e+149, 1.0e+150, 1.0000000000001e+150,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 81 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [2.5]
  let binding_view = [1.0e+150, 1.00000000000001e+150]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.0e+150, 1.00000000000001e+150),
    [9.999999999999e+149, 1.0e+150, 1.0000000000001e+150],
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.00000000000001e+150, 1.0e+150),
    [9.999999999999e+149, 1.0e+150, 1.0000000000001e+150],
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [
    9.99999999999e+149, 1.000000000001e+150,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [1.0e+150, 1.00000000000001e+150])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    9.999999999999e+149, 1.0e+150, 1.0000000000001e+150,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 82 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [2.5]
  let binding_view = [0.0 / 0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0 / 0.0, 1.0), [
    -1.0e-13, 0.0, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0 / 0.0), [
    -1.0e-13, 0.0, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [-1.0e-13, 0.0, 1.0e-13])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 83 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [2.5]
  let binding_view = [0.0 / 0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0 / 0.0, 1.0), [
    -1.0e-13, 0.0, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0 / 0.0), [
    -1.0e-13, 0.0, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [-1.0e-13, 0.0, 1.0e-13])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 84 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [4.0]
  let binding_view = [0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0, 1.0), [
    0.0, 0.25, 0.5, 0.75, 1.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0), [
    0.0, 0.25, 0.5, 0.75, 1.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [0.0, 0.25, 0.5, 0.75, 1.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 85 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [4.0]
  let binding_view = [0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0, 1.0), [
    0.0, 0.25, 0.5, 0.75, 1.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0), [
    0.0, 0.25, 0.5, 0.75, 1.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [0.0, 0.25, 0.5, 0.75, 1.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 86 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [4.0]
  let binding_view = [-3.7, 14.2]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-3.7, 14.2), [
    -5.0, 0.0, 5.0, 10.0, 15.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(14.2, -3.7), [
    -5.0, 0.0, 5.0, 10.0, 15.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-3.7, 14.2])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-3.7, 14.2])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [-5.0, 0.0, 5.0, 10.0, 15.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 87 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [4.0]
  let binding_view = [-3.7, 14.2]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-3.7, 14.2), [
    -5.0, 0.0, 5.0, 10.0, 15.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(14.2, -3.7), [
    -5.0, 0.0, 5.0, 10.0, 15.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-5.0, 15.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-3.7, 14.2])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [-5.0, 0.0, 5.0, 10.0, 15.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 88 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [4.0]
  let binding_view = [10000000000.0, 10000000001.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000000.0, 10000000001.0),
    [
      10000000000.0, 10000000000.25, 10000000000.5, 10000000000.75, 10000000001.0,
    ],
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000001.0, 10000000000.0),
    [
      10000000000.0, 10000000000.25, 10000000000.5, 10000000000.75, 10000000001.0,
    ],
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    10000000000.0, 10000000000.25, 10000000000.5, 10000000000.75, 10000000001.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 89 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [4.0]
  let binding_view = [10000000000.0, 10000000001.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000000.0, 10000000001.0),
    [
      10000000000.0, 10000000000.25, 10000000000.5, 10000000000.75, 10000000001.0,
    ],
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000001.0, 10000000000.0),
    [
      10000000000.0, 10000000000.25, 10000000000.5, 10000000000.75, 10000000001.0,
    ],
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    10000000000.0, 10000000000.25, 10000000000.5, 10000000000.75, 10000000001.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 90 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [4.0]
  let binding_view = [2.0, 2.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998002, 1.9999999999999, 2.0, 2.0000000000001, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998002, 1.9999999999999, 2.0, 2.0000000000001, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [1.999999999998, 2.000000000002])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [1.9, 2.1])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    1.9999999999998002, 1.9999999999999, 2.0, 2.0000000000001, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 91 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [4.0]
  let binding_view = [2.0, 2.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 2.0, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 2.0, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [
    1.9999999999979998, 2.000000000002,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [1.9, 2.1])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    1.9999999999998, 2.0, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 92 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [4.0]
  let binding_view = [-1.0e-290, 1.0e-290]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-1.0e-290, 1.0e-290), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0e-290, -1.0e-290), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 93 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [4.0]
  let binding_view = [-1.0e-290, 1.0e-290]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-1.0e-290, 1.0e-290), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0e-290, -1.0e-290), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 94 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [4.0]
  let binding_view = [1.0e+150, 1.00000000000001e+150]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.0e+150, 1.00000000000001e+150),
    [9.999999999999e+149, 1.0e+150, 1.0000000000001e+150],
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.00000000000001e+150, 1.0e+150),
    [9.999999999999e+149, 1.0e+150, 1.0000000000001e+150],
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [
    9.99999999999e+149, 1.00000000000101e+150,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [1.0e+150, 1.00000000000001e+150])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    9.999999999999e+149, 1.0e+150, 1.0000000000001e+150,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 95 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [4.0]
  let binding_view = [1.0e+150, 1.00000000000001e+150]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.0e+150, 1.00000000000001e+150),
    [9.999999999999e+149, 1.0e+150, 1.0000000000001e+150],
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.00000000000001e+150, 1.0e+150),
    [9.999999999999e+149, 1.0e+150, 1.0000000000001e+150],
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [
    9.99999999999e+149, 1.000000000001e+150,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [1.0e+150, 1.00000000000001e+150])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    9.999999999999e+149, 1.0e+150, 1.0000000000001e+150,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 96 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [4.0]
  let binding_view = [0.0 / 0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0 / 0.0, 1.0), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0 / 0.0), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 97 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [4.0]
  let binding_view = [0.0 / 0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0 / 0.0, 1.0), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0 / 0.0), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 98 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [9.0]
  let binding_view = [0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0, 1.0), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 99 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [9.0]
  let binding_view = [0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0, 1.0), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 100 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [9.0]
  let binding_view = [-3.7, 14.2]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-3.7, 14.2), [
    -4.0, -2.0, 0.0, 2.0, 4.0, 6.0, 8.0, 10.0, 12.0, 14.0, 16.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(14.2, -3.7), [
    -4.0, -2.0, 0.0, 2.0, 4.0, 6.0, 8.0, 10.0, 12.0, 14.0, 16.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-3.7, 14.2])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-3.7, 14.2])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -4.0, -2.0, 0.0, 2.0, 4.0, 6.0, 8.0, 10.0, 12.0, 14.0, 16.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 101 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [9.0]
  let binding_view = [-3.7, 14.2]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-3.7, 14.2), [
    -5.0, -2.5, 0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(14.2, -3.7), [
    -5.0, -2.5, 0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-5.0, 15.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-3.7, 14.2])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -5.0, -2.5, 0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 102 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [9.0]
  let binding_view = [10000000000.0, 10000000001.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000000.0, 10000000001.0),
    [
      10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8,
      10000000001.0,
    ],
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000001.0, 10000000000.0),
    [
      10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8,
      10000000001.0,
    ],
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8, 10000000001.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 103 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [9.0]
  let binding_view = [10000000000.0, 10000000001.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000000.0, 10000000001.0),
    [
      10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8,
      10000000001.0,
    ],
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000001.0, 10000000000.0),
    [
      10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8,
      10000000001.0,
    ],
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8, 10000000001.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 104 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [9.0]
  let binding_view = [2.0, 2.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [1.999999999998, 2.000000000002])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [1.9, 2.1])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 105 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [9.0]
  let binding_view = [2.0, 2.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [
    1.9999999999979998, 2.000000000002,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [1.9, 2.1])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 106 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [9.0]
  let binding_view = [-1.0e-290, 1.0e-290]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-1.0e-290, 1.0e-290), [
    -1.0e-13, -7.500000000000001e-14, -5.0e-14, -2.4999999999999994e-14, 0.0, 2.4999999999999994e-14,
    5.0000000000000014e-14, 7.500000000000001e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0e-290, -1.0e-290), [
    -1.0e-13, -7.500000000000001e-14, -5.0e-14, -2.4999999999999994e-14, 0.0, 2.4999999999999994e-14,
    5.0000000000000014e-14, 7.500000000000001e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -1.0e-13, -7.500000000000001e-14, -5.0e-14, -2.4999999999999994e-14, 0.0, 2.4999999999999994e-14,
    5.0000000000000014e-14, 7.500000000000001e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 107 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [9.0]
  let binding_view = [-1.0e-290, 1.0e-290]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-1.0e-290, 1.0e-290), [
    -1.0e-13, -7.500000000000001e-14, -5.0e-14, -2.4999999999999994e-14, 0.0, 2.4999999999999994e-14,
    5.0000000000000014e-14, 7.500000000000001e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0e-290, -1.0e-290), [
    -1.0e-13, -7.500000000000001e-14, -5.0e-14, -2.4999999999999994e-14, 0.0, 2.4999999999999994e-14,
    5.0000000000000014e-14, 7.500000000000001e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -1.0e-13, -7.500000000000001e-14, -5.0e-14, -2.4999999999999994e-14, 0.0, 2.4999999999999994e-14,
    5.0000000000000014e-14, 7.500000000000001e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 108 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [9.0]
  let binding_view = [1.0e+150, 1.00000000000001e+150]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.0e+150, 1.00000000000001e+150),
    [
      9.999999999999e+149, 9.99999999999925e+149, 9.9999999999995e+149, 9.999999999999749e+149,
      1.0e+150, 1.000000000000025e+150, 1.00000000000005e+150, 1.000000000000075e+150,
      1.0000000000001e+150,
    ],
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.00000000000001e+150, 1.0e+150),
    [
      9.999999999999e+149, 9.99999999999925e+149, 9.9999999999995e+149, 9.999999999999749e+149,
      1.0e+150, 1.000000000000025e+150, 1.00000000000005e+150, 1.000000000000075e+150,
      1.0000000000001e+150,
    ],
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [
    9.99999999999e+149, 1.00000000000101e+150,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [1.0e+150, 1.00000000000001e+150])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    9.999999999999e+149, 9.99999999999925e+149, 9.9999999999995e+149, 9.999999999999749e+149,
    1.0e+150, 1.000000000000025e+150, 1.00000000000005e+150, 1.000000000000075e+150,
    1.0000000000001e+150,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 109 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [9.0]
  let binding_view = [1.0e+150, 1.00000000000001e+150]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.0e+150, 1.00000000000001e+150),
    [
      9.999999999999e+149, 9.99999999999925e+149, 9.9999999999995e+149, 9.999999999999749e+149,
      1.0e+150, 1.000000000000025e+150, 1.00000000000005e+150, 1.000000000000075e+150,
      1.0000000000001e+150,
    ],
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.00000000000001e+150, 1.0e+150),
    [
      9.999999999999e+149, 9.99999999999925e+149, 9.9999999999995e+149, 9.999999999999749e+149,
      1.0e+150, 1.000000000000025e+150, 1.00000000000005e+150, 1.000000000000075e+150,
      1.0000000000001e+150,
    ],
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [
    9.99999999999e+149, 1.000000000001e+150,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [1.0e+150, 1.00000000000001e+150])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    9.999999999999e+149, 9.99999999999925e+149, 9.9999999999995e+149, 9.999999999999749e+149,
    1.0e+150, 1.000000000000025e+150, 1.00000000000005e+150, 1.000000000000075e+150,
    1.0000000000001e+150,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 110 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [9.0]
  let binding_view = [0.0 / 0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0 / 0.0, 1.0), [
    -1.0e-13, -7.500000000000001e-14, -5.0e-14, -2.4999999999999994e-14, 0.0, 2.4999999999999994e-14,
    5.0000000000000014e-14, 7.500000000000001e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0 / 0.0), [
    -1.0e-13, -7.500000000000001e-14, -5.0e-14, -2.4999999999999994e-14, 0.0, 2.4999999999999994e-14,
    5.0000000000000014e-14, 7.500000000000001e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -1.0e-13, -7.500000000000001e-14, -5.0e-14, -2.4999999999999994e-14, 0.0, 2.4999999999999994e-14,
    5.0000000000000014e-14, 7.500000000000001e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 111 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [9.0]
  let binding_view = [0.0 / 0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0 / 0.0, 1.0), [
    -1.0e-13, -7.500000000000001e-14, -5.0e-14, -2.4999999999999994e-14, 0.0, 2.4999999999999994e-14,
    5.0000000000000014e-14, 7.500000000000001e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0 / 0.0), [
    -1.0e-13, -7.500000000000001e-14, -5.0e-14, -2.4999999999999994e-14, 0.0, 2.4999999999999994e-14,
    5.0000000000000014e-14, 7.500000000000001e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -1.0e-13, -7.500000000000001e-14, -5.0e-14, -2.4999999999999994e-14, 0.0, 2.4999999999999994e-14,
    5.0000000000000014e-14, 7.500000000000001e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 112 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [20.0]
  let binding_view = [0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0, 1.0), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 113 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [20.0]
  let binding_view = [0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0, 1.0), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 114 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [20.0]
  let binding_view = [-3.7, 14.2]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-3.7, 14.2), [
    -4.0, -2.0, 0.0, 2.0, 4.0, 6.0, 8.0, 10.0, 12.0, 14.0, 16.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(14.2, -3.7), [
    -4.0, -2.0, 0.0, 2.0, 4.0, 6.0, 8.0, 10.0, 12.0, 14.0, 16.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-3.7, 14.2])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-3.7, 14.2])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -4.0, -2.0, 0.0, 2.0, 4.0, 6.0, 8.0, 10.0, 12.0, 14.0, 16.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 115 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [20.0]
  let binding_view = [-3.7, 14.2]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-3.7, 14.2), [
    -5.0, -2.5, 0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(14.2, -3.7), [
    -5.0, -2.5, 0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-5.0, 15.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-3.7, 14.2])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -5.0, -2.5, 0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 116 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [20.0]
  let binding_view = [10000000000.0, 10000000001.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000000.0, 10000000001.0),
    [
      10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8,
      10000000001.0,
    ],
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000001.0, 10000000000.0),
    [
      10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8,
      10000000001.0,
    ],
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8, 10000000001.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 117 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [20.0]
  let binding_view = [10000000000.0, 10000000001.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000000.0, 10000000001.0),
    [
      10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8,
      10000000001.0,
    ],
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000001.0, 10000000000.0),
    [
      10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8,
      10000000001.0,
    ],
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8, 10000000001.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 118 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [20.0]
  let binding_view = [2.0, 2.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [1.999999999998, 2.000000000002])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [1.9, 2.1])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 119 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [20.0]
  let binding_view = [2.0, 2.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [
    1.9999999999979998, 2.000000000002,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [1.9, 2.1])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 120 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [20.0]
  let binding_view = [-1.0e-290, 1.0e-290]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-1.0e-290, 1.0e-290), [
    -1.0e-13, -7.500000000000001e-14, -5.0e-14, -2.4999999999999994e-14, 0.0, 2.4999999999999994e-14,
    5.0000000000000014e-14, 7.500000000000001e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0e-290, -1.0e-290), [
    -1.0e-13, -7.500000000000001e-14, -5.0e-14, -2.4999999999999994e-14, 0.0, 2.4999999999999994e-14,
    5.0000000000000014e-14, 7.500000000000001e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -1.0e-13, -7.500000000000001e-14, -5.0e-14, -2.4999999999999994e-14, 0.0, 2.4999999999999994e-14,
    5.0000000000000014e-14, 7.500000000000001e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 121 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [20.0]
  let binding_view = [-1.0e-290, 1.0e-290]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-1.0e-290, 1.0e-290), [
    -1.0e-13, -7.500000000000001e-14, -5.0e-14, -2.4999999999999994e-14, 0.0, 2.4999999999999994e-14,
    5.0000000000000014e-14, 7.500000000000001e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0e-290, -1.0e-290), [
    -1.0e-13, -7.500000000000001e-14, -5.0e-14, -2.4999999999999994e-14, 0.0, 2.4999999999999994e-14,
    5.0000000000000014e-14, 7.500000000000001e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -1.0e-13, -7.500000000000001e-14, -5.0e-14, -2.4999999999999994e-14, 0.0, 2.4999999999999994e-14,
    5.0000000000000014e-14, 7.500000000000001e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 122 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [20.0]
  let binding_view = [1.0e+150, 1.00000000000001e+150]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.0e+150, 1.00000000000001e+150),
    [
      9.999999999999e+149, 9.99999999999925e+149, 9.9999999999995e+149, 9.999999999999749e+149,
      1.0e+150, 1.000000000000025e+150, 1.00000000000005e+150, 1.000000000000075e+150,
      1.0000000000001e+150,
    ],
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.00000000000001e+150, 1.0e+150),
    [
      9.999999999999e+149, 9.99999999999925e+149, 9.9999999999995e+149, 9.999999999999749e+149,
      1.0e+150, 1.000000000000025e+150, 1.00000000000005e+150, 1.000000000000075e+150,
      1.0000000000001e+150,
    ],
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [
    9.99999999999e+149, 1.00000000000101e+150,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [1.0e+150, 1.00000000000001e+150])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    9.999999999999e+149, 9.99999999999925e+149, 9.9999999999995e+149, 9.999999999999749e+149,
    1.0e+150, 1.000000000000025e+150, 1.00000000000005e+150, 1.000000000000075e+150,
    1.0000000000001e+150,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 123 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [20.0]
  let binding_view = [1.0e+150, 1.00000000000001e+150]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.0e+150, 1.00000000000001e+150),
    [
      9.999999999999e+149, 9.99999999999925e+149, 9.9999999999995e+149, 9.999999999999749e+149,
      1.0e+150, 1.000000000000025e+150, 1.00000000000005e+150, 1.000000000000075e+150,
      1.0000000000001e+150,
    ],
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.00000000000001e+150, 1.0e+150),
    [
      9.999999999999e+149, 9.99999999999925e+149, 9.9999999999995e+149, 9.999999999999749e+149,
      1.0e+150, 1.000000000000025e+150, 1.00000000000005e+150, 1.000000000000075e+150,
      1.0000000000001e+150,
    ],
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [
    9.99999999999e+149, 1.000000000001e+150,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [1.0e+150, 1.00000000000001e+150])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    9.999999999999e+149, 9.99999999999925e+149, 9.9999999999995e+149, 9.999999999999749e+149,
    1.0e+150, 1.000000000000025e+150, 1.00000000000005e+150, 1.000000000000075e+150,
    1.0000000000001e+150,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 124 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [20.0]
  let binding_view = [0.0 / 0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0 / 0.0, 1.0), [
    -1.0e-13, -7.500000000000001e-14, -5.0e-14, -2.4999999999999994e-14, 0.0, 2.4999999999999994e-14,
    5.0000000000000014e-14, 7.500000000000001e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0 / 0.0), [
    -1.0e-13, -7.500000000000001e-14, -5.0e-14, -2.4999999999999994e-14, 0.0, 2.4999999999999994e-14,
    5.0000000000000014e-14, 7.500000000000001e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -1.0e-13, -7.500000000000001e-14, -5.0e-14, -2.4999999999999994e-14, 0.0, 2.4999999999999994e-14,
    5.0000000000000014e-14, 7.500000000000001e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 125 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [20.0]
  let binding_view = [0.0 / 0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0 / 0.0, 1.0), [
    -1.0e-13, -7.500000000000001e-14, -5.0e-14, -2.4999999999999994e-14, 0.0, 2.4999999999999994e-14,
    5.0000000000000014e-14, 7.500000000000001e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0 / 0.0), [
    -1.0e-13, -7.500000000000001e-14, -5.0e-14, -2.4999999999999994e-14, 0.0, 2.4999999999999994e-14,
    5.0000000000000014e-14, 7.500000000000001e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -1.0e-13, -7.500000000000001e-14, -5.0e-14, -2.4999999999999994e-14, 0.0, 2.4999999999999994e-14,
    5.0000000000000014e-14, 7.500000000000001e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 126 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [1.0 / 0.0]
  let binding_view = [0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0, 1.0), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 127 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [1.0 / 0.0]
  let binding_view = [0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0, 1.0), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 128 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [1.0 / 0.0]
  let binding_view = [-3.7, 14.2]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-3.7, 14.2), [
    -4.0, -2.0, 0.0, 2.0, 4.0, 6.0, 8.0, 10.0, 12.0, 14.0, 16.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(14.2, -3.7), [
    -4.0, -2.0, 0.0, 2.0, 4.0, 6.0, 8.0, 10.0, 12.0, 14.0, 16.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-3.7, 14.2])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-3.7, 14.2])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -4.0, -2.0, 0.0, 2.0, 4.0, 6.0, 8.0, 10.0, 12.0, 14.0, 16.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 129 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [1.0 / 0.0]
  let binding_view = [-3.7, 14.2]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-3.7, 14.2), [
    -5.0, -2.5, 0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(14.2, -3.7), [
    -5.0, -2.5, 0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-5.0, 15.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-3.7, 14.2])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -5.0, -2.5, 0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 130 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [1.0 / 0.0]
  let binding_view = [10000000000.0, 10000000001.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000000.0, 10000000001.0),
    [
      10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8,
      10000000001.0,
    ],
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000001.0, 10000000000.0),
    [
      10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8,
      10000000001.0,
    ],
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8, 10000000001.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 131 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [1.0 / 0.0]
  let binding_view = [10000000000.0, 10000000001.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000000.0, 10000000001.0),
    [
      10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8,
      10000000001.0,
    ],
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000001.0, 10000000000.0),
    [
      10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8,
      10000000001.0,
    ],
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8, 10000000001.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 132 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [1.0 / 0.0]
  let binding_view = [2.0, 2.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [1.999999999998, 2.000000000002])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [1.9, 2.1])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 133 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [1.0 / 0.0]
  let binding_view = [2.0, 2.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [
    1.9999999999979998, 2.000000000002,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [1.9, 2.1])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 134 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [1.0 / 0.0]
  let binding_view = [-1.0e-290, 1.0e-290]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-1.0e-290, 1.0e-290), [
    -1.0e-13, -7.500000000000001e-14, -5.0e-14, -2.4999999999999994e-14, 0.0, 2.4999999999999994e-14,
    5.0000000000000014e-14, 7.500000000000001e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0e-290, -1.0e-290), [
    -1.0e-13, -7.500000000000001e-14, -5.0e-14, -2.4999999999999994e-14, 0.0, 2.4999999999999994e-14,
    5.0000000000000014e-14, 7.500000000000001e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -1.0e-13, -7.500000000000001e-14, -5.0e-14, -2.4999999999999994e-14, 0.0, 2.4999999999999994e-14,
    5.0000000000000014e-14, 7.500000000000001e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 135 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [1.0 / 0.0]
  let binding_view = [-1.0e-290, 1.0e-290]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-1.0e-290, 1.0e-290), [
    -1.0e-13, -7.500000000000001e-14, -5.0e-14, -2.4999999999999994e-14, 0.0, 2.4999999999999994e-14,
    5.0000000000000014e-14, 7.500000000000001e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0e-290, -1.0e-290), [
    -1.0e-13, -7.500000000000001e-14, -5.0e-14, -2.4999999999999994e-14, 0.0, 2.4999999999999994e-14,
    5.0000000000000014e-14, 7.500000000000001e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -1.0e-13, -7.500000000000001e-14, -5.0e-14, -2.4999999999999994e-14, 0.0, 2.4999999999999994e-14,
    5.0000000000000014e-14, 7.500000000000001e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 136 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [1.0 / 0.0]
  let binding_view = [1.0e+150, 1.00000000000001e+150]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.0e+150, 1.00000000000001e+150),
    [
      9.999999999999e+149, 9.99999999999925e+149, 9.9999999999995e+149, 9.999999999999749e+149,
      1.0e+150, 1.000000000000025e+150, 1.00000000000005e+150, 1.000000000000075e+150,
      1.0000000000001e+150,
    ],
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.00000000000001e+150, 1.0e+150),
    [
      9.999999999999e+149, 9.99999999999925e+149, 9.9999999999995e+149, 9.999999999999749e+149,
      1.0e+150, 1.000000000000025e+150, 1.00000000000005e+150, 1.000000000000075e+150,
      1.0000000000001e+150,
    ],
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [
    9.99999999999e+149, 1.00000000000101e+150,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [1.0e+150, 1.00000000000001e+150])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    9.999999999999e+149, 9.99999999999925e+149, 9.9999999999995e+149, 9.999999999999749e+149,
    1.0e+150, 1.000000000000025e+150, 1.00000000000005e+150, 1.000000000000075e+150,
    1.0000000000001e+150,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 137 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [1.0 / 0.0]
  let binding_view = [1.0e+150, 1.00000000000001e+150]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.0e+150, 1.00000000000001e+150),
    [
      9.999999999999e+149, 9.99999999999925e+149, 9.9999999999995e+149, 9.999999999999749e+149,
      1.0e+150, 1.000000000000025e+150, 1.00000000000005e+150, 1.000000000000075e+150,
      1.0000000000001e+150,
    ],
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.00000000000001e+150, 1.0e+150),
    [
      9.999999999999e+149, 9.99999999999925e+149, 9.9999999999995e+149, 9.999999999999749e+149,
      1.0e+150, 1.000000000000025e+150, 1.00000000000005e+150, 1.000000000000075e+150,
      1.0000000000001e+150,
    ],
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [
    9.99999999999e+149, 1.000000000001e+150,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [1.0e+150, 1.00000000000001e+150])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    9.999999999999e+149, 9.99999999999925e+149, 9.9999999999995e+149, 9.999999999999749e+149,
    1.0e+150, 1.000000000000025e+150, 1.00000000000005e+150, 1.000000000000075e+150,
    1.0000000000001e+150,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 138 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [1.0 / 0.0]
  let binding_view = [0.0 / 0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0 / 0.0, 1.0), [
    -1.0e-13, -7.500000000000001e-14, -5.0e-14, -2.4999999999999994e-14, 0.0, 2.4999999999999994e-14,
    5.0000000000000014e-14, 7.500000000000001e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0 / 0.0), [
    -1.0e-13, -7.500000000000001e-14, -5.0e-14, -2.4999999999999994e-14, 0.0, 2.4999999999999994e-14,
    5.0000000000000014e-14, 7.500000000000001e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -1.0e-13, -7.500000000000001e-14, -5.0e-14, -2.4999999999999994e-14, 0.0, 2.4999999999999994e-14,
    5.0000000000000014e-14, 7.500000000000001e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 139 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [1.0 / 0.0]
  let binding_view = [0.0 / 0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0 / 0.0, 1.0), [
    -1.0e-13, -7.500000000000001e-14, -5.0e-14, -2.4999999999999994e-14, 0.0, 2.4999999999999994e-14,
    5.0000000000000014e-14, 7.500000000000001e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0 / 0.0), [
    -1.0e-13, -7.500000000000001e-14, -5.0e-14, -2.4999999999999994e-14, 0.0, 2.4999999999999994e-14,
    5.0000000000000014e-14, 7.500000000000001e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -1.0e-13, -7.500000000000001e-14, -5.0e-14, -2.4999999999999994e-14, 0.0, 2.4999999999999994e-14,
    5.0000000000000014e-14, 7.500000000000001e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 140 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [0.0 / 0.0]
  let binding_view = [0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.tick_values(1.0, 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.call())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 141 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [0.0 / 0.0]
  let binding_view = [0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.tick_values(1.0, 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.view_limits(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.call())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 142 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [0.0 / 0.0]
  let binding_view = [-3.7, 14.2]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.tick_values(-3.7, 14.2))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.tick_values(14.2, -3.7))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-3.7, 14.2])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-3.7, 14.2])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.call())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 143 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [0.0 / 0.0]
  let binding_view = [-3.7, 14.2]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.tick_values(-3.7, 14.2))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.tick_values(14.2, -3.7))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.view_limits(-3.7, 14.2))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-3.7, 14.2])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.call())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 144 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [0.0 / 0.0]
  let binding_view = [10000000000.0, 10000000001.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.tick_values(10000000000.0, 10000000001.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.tick_values(10000000001.0, 10000000000.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.call())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 145 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [0.0 / 0.0]
  let binding_view = [10000000000.0, 10000000001.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.tick_values(10000000000.0, 10000000001.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.tick_values(10000000001.0, 10000000000.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.view_limits(10000000000.0, 10000000001.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.call())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 146 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [0.0 / 0.0]
  let binding_view = [2.0, 2.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.tick_values(2.0, 2.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.tick_values(2.0, 2.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [1.999999999998, 2.000000000002])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [1.9, 2.1])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.call())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 147 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [0.0 / 0.0]
  let binding_view = [2.0, 2.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.tick_values(2.0, 2.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.tick_values(2.0, 2.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.view_limits(2.0, 2.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [1.9, 2.1])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.call())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 148 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [0.0 / 0.0]
  let binding_view = [-1.0e-290, 1.0e-290]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.tick_values(-1.0e-290, 1.0e-290))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.tick_values(1.0e-290, -1.0e-290))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.call())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 149 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [0.0 / 0.0]
  let binding_view = [-1.0e-290, 1.0e-290]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.tick_values(-1.0e-290, 1.0e-290))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.tick_values(1.0e-290, -1.0e-290))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.view_limits(-1.0e-290, 1.0e-290))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.call())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 150 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [0.0 / 0.0]
  let binding_view = [1.0e+150, 1.00000000000001e+150]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.tick_values(1.0e+150, 1.00000000000001e+150))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.tick_values(1.00000000000001e+150, 1.0e+150))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [
    9.99999999999e+149, 1.00000000000101e+150,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [1.0e+150, 1.00000000000001e+150])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.call())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 151 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [0.0 / 0.0]
  let binding_view = [1.0e+150, 1.00000000000001e+150]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.tick_values(1.0e+150, 1.00000000000001e+150))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.tick_values(1.00000000000001e+150, 1.0e+150))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.view_limits(1.0e+150, 1.00000000000001e+150))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [1.0e+150, 1.00000000000001e+150])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.call())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 152 classic False data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [0.0 / 0.0]
  let binding_view = [0.0 / 0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.tick_values(1.0, 0.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.call())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 153 classic False round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [0.0 / 0.0]
  let binding_view = [0.0 / 0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.tick_values(1.0, 0.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.view_limits(0.0 / 0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.call())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 154 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0, 1.0), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.call())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
}

///|
test "AutoLocator original 155 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0, 1.0), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.call())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
}

///|
test "AutoLocator original 156 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-3.7, 14.2), [
    -4.0, -2.0, 0.0, 2.0, 4.0, 6.0, 8.0, 10.0, 12.0, 14.0, 16.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(14.2, -3.7), [
    -4.0, -2.0, 0.0, 2.0, 4.0, 6.0, 8.0, 10.0, 12.0, 14.0, 16.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-3.7, 14.2])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-3.7, 14.2])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.call())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
}

///|
test "AutoLocator original 157 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-3.7, 14.2), [
    -5.0, 0.0, 5.0, 10.0, 15.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(14.2, -3.7), [
    -5.0, 0.0, 5.0, 10.0, 15.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-5.0, 15.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-3.7, 14.2])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.call())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
}

///|
test "AutoLocator original 158 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000000.0, 10000000001.0),
    [
      10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8,
      10000000001.0,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000001.0, 10000000000.0),
    [
      10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8,
      10000000001.0,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.call())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
}

///|
test "AutoLocator original 159 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000000.0, 10000000001.0),
    [
      10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8,
      10000000001.0,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000001.0, 10000000000.0),
    [
      10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8,
      10000000001.0,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.call())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
}

///|
test "AutoLocator original 160 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [1.999999999998, 2.000000000002])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [1.9, 2.1])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.call())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
}

///|
test "AutoLocator original 161 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [
    1.9999999999979998, 2.000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [1.9, 2.1])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.call())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
}

///|
test "AutoLocator original 162 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-1.0e-290, 1.0e-290), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0e-290, -1.0e-290), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.call())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
}

///|
test "AutoLocator original 163 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-1.0e-290, 1.0e-290), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0e-290, -1.0e-290), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.call())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
}

///|
test "AutoLocator original 164 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.0e+150, 1.00000000000001e+150),
    [
      9.999999999999e+149, 9.9999999999995e+149, 1.0e+150, 1.00000000000005e+150,
      1.0000000000001e+150,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.00000000000001e+150, 1.0e+150),
    [
      9.999999999999e+149, 9.9999999999995e+149, 1.0e+150, 1.00000000000005e+150,
      1.0000000000001e+150,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [
    9.99999999999e+149, 1.00000000000101e+150,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [1.0e+150, 1.00000000000001e+150])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.call())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
}

///|
test "AutoLocator original 165 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.0e+150, 1.00000000000001e+150),
    [
      9.999999999999e+149, 9.9999999999995e+149, 1.0e+150, 1.00000000000005e+150,
      1.0000000000001e+150,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.00000000000001e+150, 1.0e+150),
    [
      9.999999999999e+149, 9.9999999999995e+149, 1.0e+150, 1.00000000000005e+150,
      1.0000000000001e+150,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [
    9.99999999999e+149, 1.000000000001e+150,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [1.0e+150, 1.00000000000001e+150])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.call())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
}

///|
test "AutoLocator original 166 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0 / 0.0, 1.0), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0 / 0.0), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.call())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
}

///|
test "AutoLocator original 167 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0 / 0.0, 1.0), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0 / 0.0), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.call())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
}

///|
test "AutoLocator original 168 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [-1.0 / 0.0]
  let binding_view = [0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0, 1.0), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 169 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [-1.0 / 0.0]
  let binding_view = [0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0, 1.0), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 170 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [-1.0 / 0.0]
  let binding_view = [-3.7, 14.2]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-3.7, 14.2), [
    -4.0, -2.0, 0.0, 2.0, 4.0, 6.0, 8.0, 10.0, 12.0, 14.0, 16.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(14.2, -3.7), [
    -4.0, -2.0, 0.0, 2.0, 4.0, 6.0, 8.0, 10.0, 12.0, 14.0, 16.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-3.7, 14.2])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-3.7, 14.2])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -4.0, -2.0, 0.0, 2.0, 4.0, 6.0, 8.0, 10.0, 12.0, 14.0, 16.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 171 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [-1.0 / 0.0]
  let binding_view = [-3.7, 14.2]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-3.7, 14.2), [
    -5.0, 0.0, 5.0, 10.0, 15.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(14.2, -3.7), [
    -5.0, 0.0, 5.0, 10.0, 15.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-5.0, 15.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-3.7, 14.2])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [-5.0, 0.0, 5.0, 10.0, 15.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 172 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [-1.0 / 0.0]
  let binding_view = [10000000000.0, 10000000001.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000000.0, 10000000001.0),
    [
      10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8,
      10000000001.0,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000001.0, 10000000000.0),
    [
      10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8,
      10000000001.0,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8, 10000000001.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 173 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [-1.0 / 0.0]
  let binding_view = [10000000000.0, 10000000001.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000000.0, 10000000001.0),
    [
      10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8,
      10000000001.0,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000001.0, 10000000000.0),
    [
      10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8,
      10000000001.0,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8, 10000000001.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 174 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [-1.0 / 0.0]
  let binding_view = [2.0, 2.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [1.999999999998, 2.000000000002])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [1.9, 2.1])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 175 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [-1.0 / 0.0]
  let binding_view = [2.0, 2.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [
    1.9999999999979998, 2.000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [1.9, 2.1])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 176 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [-1.0 / 0.0]
  let binding_view = [-1.0e-290, 1.0e-290]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-1.0e-290, 1.0e-290), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0e-290, -1.0e-290), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 177 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [-1.0 / 0.0]
  let binding_view = [-1.0e-290, 1.0e-290]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-1.0e-290, 1.0e-290), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0e-290, -1.0e-290), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 178 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [-1.0 / 0.0]
  let binding_view = [1.0e+150, 1.00000000000001e+150]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.0e+150, 1.00000000000001e+150),
    [
      9.999999999999e+149, 9.9999999999995e+149, 1.0e+150, 1.00000000000005e+150,
      1.0000000000001e+150,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.00000000000001e+150, 1.0e+150),
    [
      9.999999999999e+149, 9.9999999999995e+149, 1.0e+150, 1.00000000000005e+150,
      1.0000000000001e+150,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [
    9.99999999999e+149, 1.00000000000101e+150,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [1.0e+150, 1.00000000000001e+150])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    9.999999999999e+149, 9.9999999999995e+149, 1.0e+150, 1.00000000000005e+150, 1.0000000000001e+150,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 179 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [-1.0 / 0.0]
  let binding_view = [1.0e+150, 1.00000000000001e+150]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.0e+150, 1.00000000000001e+150),
    [
      9.999999999999e+149, 9.9999999999995e+149, 1.0e+150, 1.00000000000005e+150,
      1.0000000000001e+150,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.00000000000001e+150, 1.0e+150),
    [
      9.999999999999e+149, 9.9999999999995e+149, 1.0e+150, 1.00000000000005e+150,
      1.0000000000001e+150,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [
    9.99999999999e+149, 1.000000000001e+150,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [1.0e+150, 1.00000000000001e+150])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    9.999999999999e+149, 9.9999999999995e+149, 1.0e+150, 1.00000000000005e+150, 1.0000000000001e+150,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 180 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [-1.0 / 0.0]
  let binding_view = [0.0 / 0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0 / 0.0, 1.0), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0 / 0.0), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 181 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [-1.0 / 0.0]
  let binding_view = [0.0 / 0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0 / 0.0, 1.0), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0 / 0.0), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 182 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [-3.0]
  let binding_view = [0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0, 1.0), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 183 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [-3.0]
  let binding_view = [0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0, 1.0), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 184 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [-3.0]
  let binding_view = [-3.7, 14.2]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-3.7, 14.2), [
    -4.0, -2.0, 0.0, 2.0, 4.0, 6.0, 8.0, 10.0, 12.0, 14.0, 16.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(14.2, -3.7), [
    -4.0, -2.0, 0.0, 2.0, 4.0, 6.0, 8.0, 10.0, 12.0, 14.0, 16.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-3.7, 14.2])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-3.7, 14.2])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -4.0, -2.0, 0.0, 2.0, 4.0, 6.0, 8.0, 10.0, 12.0, 14.0, 16.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 185 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [-3.0]
  let binding_view = [-3.7, 14.2]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-3.7, 14.2), [
    -5.0, 0.0, 5.0, 10.0, 15.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(14.2, -3.7), [
    -5.0, 0.0, 5.0, 10.0, 15.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-5.0, 15.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-3.7, 14.2])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [-5.0, 0.0, 5.0, 10.0, 15.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 186 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [-3.0]
  let binding_view = [10000000000.0, 10000000001.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000000.0, 10000000001.0),
    [
      10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8,
      10000000001.0,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000001.0, 10000000000.0),
    [
      10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8,
      10000000001.0,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8, 10000000001.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 187 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [-3.0]
  let binding_view = [10000000000.0, 10000000001.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000000.0, 10000000001.0),
    [
      10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8,
      10000000001.0,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000001.0, 10000000000.0),
    [
      10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8,
      10000000001.0,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8, 10000000001.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 188 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [-3.0]
  let binding_view = [2.0, 2.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [1.999999999998, 2.000000000002])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [1.9, 2.1])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 189 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [-3.0]
  let binding_view = [2.0, 2.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [
    1.9999999999979998, 2.000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [1.9, 2.1])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 190 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [-3.0]
  let binding_view = [-1.0e-290, 1.0e-290]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-1.0e-290, 1.0e-290), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0e-290, -1.0e-290), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 191 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [-3.0]
  let binding_view = [-1.0e-290, 1.0e-290]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-1.0e-290, 1.0e-290), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0e-290, -1.0e-290), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 192 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [-3.0]
  let binding_view = [1.0e+150, 1.00000000000001e+150]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.0e+150, 1.00000000000001e+150),
    [
      9.999999999999e+149, 9.9999999999995e+149, 1.0e+150, 1.00000000000005e+150,
      1.0000000000001e+150,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.00000000000001e+150, 1.0e+150),
    [
      9.999999999999e+149, 9.9999999999995e+149, 1.0e+150, 1.00000000000005e+150,
      1.0000000000001e+150,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [
    9.99999999999e+149, 1.00000000000101e+150,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [1.0e+150, 1.00000000000001e+150])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    9.999999999999e+149, 9.9999999999995e+149, 1.0e+150, 1.00000000000005e+150, 1.0000000000001e+150,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 193 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [-3.0]
  let binding_view = [1.0e+150, 1.00000000000001e+150]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.0e+150, 1.00000000000001e+150),
    [
      9.999999999999e+149, 9.9999999999995e+149, 1.0e+150, 1.00000000000005e+150,
      1.0000000000001e+150,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.00000000000001e+150, 1.0e+150),
    [
      9.999999999999e+149, 9.9999999999995e+149, 1.0e+150, 1.00000000000005e+150,
      1.0000000000001e+150,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [
    9.99999999999e+149, 1.000000000001e+150,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [1.0e+150, 1.00000000000001e+150])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    9.999999999999e+149, 9.9999999999995e+149, 1.0e+150, 1.00000000000005e+150, 1.0000000000001e+150,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 194 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [-3.0]
  let binding_view = [0.0 / 0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0 / 0.0, 1.0), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0 / 0.0), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 195 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [-3.0]
  let binding_view = [0.0 / 0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0 / 0.0, 1.0), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0 / 0.0), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 196 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [0.0]
  let binding_view = [0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0, 1.0), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 197 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [0.0]
  let binding_view = [0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0, 1.0), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 198 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [0.0]
  let binding_view = [-3.7, 14.2]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-3.7, 14.2), [
    -4.0, -2.0, 0.0, 2.0, 4.0, 6.0, 8.0, 10.0, 12.0, 14.0, 16.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(14.2, -3.7), [
    -4.0, -2.0, 0.0, 2.0, 4.0, 6.0, 8.0, 10.0, 12.0, 14.0, 16.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-3.7, 14.2])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-3.7, 14.2])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -4.0, -2.0, 0.0, 2.0, 4.0, 6.0, 8.0, 10.0, 12.0, 14.0, 16.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 199 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [0.0]
  let binding_view = [-3.7, 14.2]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-3.7, 14.2), [
    -5.0, 0.0, 5.0, 10.0, 15.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(14.2, -3.7), [
    -5.0, 0.0, 5.0, 10.0, 15.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-5.0, 15.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-3.7, 14.2])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [-5.0, 0.0, 5.0, 10.0, 15.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 200 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [0.0]
  let binding_view = [10000000000.0, 10000000001.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000000.0, 10000000001.0),
    [
      10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8,
      10000000001.0,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000001.0, 10000000000.0),
    [
      10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8,
      10000000001.0,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8, 10000000001.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 201 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [0.0]
  let binding_view = [10000000000.0, 10000000001.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000000.0, 10000000001.0),
    [
      10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8,
      10000000001.0,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000001.0, 10000000000.0),
    [
      10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8,
      10000000001.0,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8, 10000000001.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 202 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [0.0]
  let binding_view = [2.0, 2.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [1.999999999998, 2.000000000002])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [1.9, 2.1])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 203 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [0.0]
  let binding_view = [2.0, 2.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [
    1.9999999999979998, 2.000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [1.9, 2.1])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 204 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [0.0]
  let binding_view = [-1.0e-290, 1.0e-290]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-1.0e-290, 1.0e-290), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0e-290, -1.0e-290), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 205 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [0.0]
  let binding_view = [-1.0e-290, 1.0e-290]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-1.0e-290, 1.0e-290), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0e-290, -1.0e-290), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 206 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [0.0]
  let binding_view = [1.0e+150, 1.00000000000001e+150]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.0e+150, 1.00000000000001e+150),
    [
      9.999999999999e+149, 9.9999999999995e+149, 1.0e+150, 1.00000000000005e+150,
      1.0000000000001e+150,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.00000000000001e+150, 1.0e+150),
    [
      9.999999999999e+149, 9.9999999999995e+149, 1.0e+150, 1.00000000000005e+150,
      1.0000000000001e+150,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [
    9.99999999999e+149, 1.00000000000101e+150,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [1.0e+150, 1.00000000000001e+150])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    9.999999999999e+149, 9.9999999999995e+149, 1.0e+150, 1.00000000000005e+150, 1.0000000000001e+150,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 207 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [0.0]
  let binding_view = [1.0e+150, 1.00000000000001e+150]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.0e+150, 1.00000000000001e+150),
    [
      9.999999999999e+149, 9.9999999999995e+149, 1.0e+150, 1.00000000000005e+150,
      1.0000000000001e+150,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.00000000000001e+150, 1.0e+150),
    [
      9.999999999999e+149, 9.9999999999995e+149, 1.0e+150, 1.00000000000005e+150,
      1.0000000000001e+150,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [
    9.99999999999e+149, 1.000000000001e+150,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [1.0e+150, 1.00000000000001e+150])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    9.999999999999e+149, 9.9999999999995e+149, 1.0e+150, 1.00000000000005e+150, 1.0000000000001e+150,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 208 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [0.0]
  let binding_view = [0.0 / 0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0 / 0.0, 1.0), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0 / 0.0), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 209 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [0.0]
  let binding_view = [0.0 / 0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0 / 0.0, 1.0), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0 / 0.0), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 210 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [1.0]
  let binding_view = [0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0, 1.0), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 211 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [1.0]
  let binding_view = [0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0, 1.0), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 212 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [1.0]
  let binding_view = [-3.7, 14.2]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-3.7, 14.2), [
    -4.0, -2.0, 0.0, 2.0, 4.0, 6.0, 8.0, 10.0, 12.0, 14.0, 16.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(14.2, -3.7), [
    -4.0, -2.0, 0.0, 2.0, 4.0, 6.0, 8.0, 10.0, 12.0, 14.0, 16.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-3.7, 14.2])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-3.7, 14.2])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -4.0, -2.0, 0.0, 2.0, 4.0, 6.0, 8.0, 10.0, 12.0, 14.0, 16.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 213 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [1.0]
  let binding_view = [-3.7, 14.2]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-3.7, 14.2), [
    -5.0, 0.0, 5.0, 10.0, 15.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(14.2, -3.7), [
    -5.0, 0.0, 5.0, 10.0, 15.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-5.0, 15.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-3.7, 14.2])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [-5.0, 0.0, 5.0, 10.0, 15.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 214 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [1.0]
  let binding_view = [10000000000.0, 10000000001.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000000.0, 10000000001.0),
    [
      10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8,
      10000000001.0,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000001.0, 10000000000.0),
    [
      10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8,
      10000000001.0,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8, 10000000001.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 215 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [1.0]
  let binding_view = [10000000000.0, 10000000001.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000000.0, 10000000001.0),
    [
      10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8,
      10000000001.0,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000001.0, 10000000000.0),
    [
      10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8,
      10000000001.0,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8, 10000000001.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 216 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [1.0]
  let binding_view = [2.0, 2.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [1.999999999998, 2.000000000002])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [1.9, 2.1])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 217 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [1.0]
  let binding_view = [2.0, 2.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [
    1.9999999999979998, 2.000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [1.9, 2.1])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 218 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [1.0]
  let binding_view = [-1.0e-290, 1.0e-290]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-1.0e-290, 1.0e-290), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0e-290, -1.0e-290), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 219 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [1.0]
  let binding_view = [-1.0e-290, 1.0e-290]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-1.0e-290, 1.0e-290), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0e-290, -1.0e-290), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 220 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [1.0]
  let binding_view = [1.0e+150, 1.00000000000001e+150]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.0e+150, 1.00000000000001e+150),
    [
      9.999999999999e+149, 9.9999999999995e+149, 1.0e+150, 1.00000000000005e+150,
      1.0000000000001e+150,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.00000000000001e+150, 1.0e+150),
    [
      9.999999999999e+149, 9.9999999999995e+149, 1.0e+150, 1.00000000000005e+150,
      1.0000000000001e+150,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [
    9.99999999999e+149, 1.00000000000101e+150,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [1.0e+150, 1.00000000000001e+150])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    9.999999999999e+149, 9.9999999999995e+149, 1.0e+150, 1.00000000000005e+150, 1.0000000000001e+150,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 221 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [1.0]
  let binding_view = [1.0e+150, 1.00000000000001e+150]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.0e+150, 1.00000000000001e+150),
    [
      9.999999999999e+149, 9.9999999999995e+149, 1.0e+150, 1.00000000000005e+150,
      1.0000000000001e+150,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.00000000000001e+150, 1.0e+150),
    [
      9.999999999999e+149, 9.9999999999995e+149, 1.0e+150, 1.00000000000005e+150,
      1.0000000000001e+150,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [
    9.99999999999e+149, 1.000000000001e+150,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [1.0e+150, 1.00000000000001e+150])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    9.999999999999e+149, 9.9999999999995e+149, 1.0e+150, 1.00000000000005e+150, 1.0000000000001e+150,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 222 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [1.0]
  let binding_view = [0.0 / 0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0 / 0.0, 1.0), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0 / 0.0), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 223 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [1.0]
  let binding_view = [0.0 / 0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0 / 0.0, 1.0), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0 / 0.0), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 224 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [2.5]
  let binding_view = [0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0, 1.0), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 225 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [2.5]
  let binding_view = [0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0, 1.0), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 226 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [2.5]
  let binding_view = [-3.7, 14.2]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-3.7, 14.2), [
    -4.0, -2.0, 0.0, 2.0, 4.0, 6.0, 8.0, 10.0, 12.0, 14.0, 16.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(14.2, -3.7), [
    -4.0, -2.0, 0.0, 2.0, 4.0, 6.0, 8.0, 10.0, 12.0, 14.0, 16.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-3.7, 14.2])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-3.7, 14.2])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -4.0, -2.0, 0.0, 2.0, 4.0, 6.0, 8.0, 10.0, 12.0, 14.0, 16.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 227 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [2.5]
  let binding_view = [-3.7, 14.2]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-3.7, 14.2), [
    -5.0, 0.0, 5.0, 10.0, 15.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(14.2, -3.7), [
    -5.0, 0.0, 5.0, 10.0, 15.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-5.0, 15.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-3.7, 14.2])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [-5.0, 0.0, 5.0, 10.0, 15.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 228 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [2.5]
  let binding_view = [10000000000.0, 10000000001.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000000.0, 10000000001.0),
    [
      10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8,
      10000000001.0,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000001.0, 10000000000.0),
    [
      10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8,
      10000000001.0,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8, 10000000001.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 229 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [2.5]
  let binding_view = [10000000000.0, 10000000001.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000000.0, 10000000001.0),
    [
      10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8,
      10000000001.0,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000001.0, 10000000000.0),
    [
      10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8,
      10000000001.0,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8, 10000000001.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 230 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [2.5]
  let binding_view = [2.0, 2.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [1.999999999998, 2.000000000002])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [1.9, 2.1])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 231 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [2.5]
  let binding_view = [2.0, 2.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [
    1.9999999999979998, 2.000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [1.9, 2.1])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 232 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [2.5]
  let binding_view = [-1.0e-290, 1.0e-290]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-1.0e-290, 1.0e-290), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0e-290, -1.0e-290), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 233 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [2.5]
  let binding_view = [-1.0e-290, 1.0e-290]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-1.0e-290, 1.0e-290), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0e-290, -1.0e-290), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 234 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [2.5]
  let binding_view = [1.0e+150, 1.00000000000001e+150]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.0e+150, 1.00000000000001e+150),
    [
      9.999999999999e+149, 9.9999999999995e+149, 1.0e+150, 1.00000000000005e+150,
      1.0000000000001e+150,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.00000000000001e+150, 1.0e+150),
    [
      9.999999999999e+149, 9.9999999999995e+149, 1.0e+150, 1.00000000000005e+150,
      1.0000000000001e+150,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [
    9.99999999999e+149, 1.00000000000101e+150,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [1.0e+150, 1.00000000000001e+150])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    9.999999999999e+149, 9.9999999999995e+149, 1.0e+150, 1.00000000000005e+150, 1.0000000000001e+150,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 235 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [2.5]
  let binding_view = [1.0e+150, 1.00000000000001e+150]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.0e+150, 1.00000000000001e+150),
    [
      9.999999999999e+149, 9.9999999999995e+149, 1.0e+150, 1.00000000000005e+150,
      1.0000000000001e+150,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.00000000000001e+150, 1.0e+150),
    [
      9.999999999999e+149, 9.9999999999995e+149, 1.0e+150, 1.00000000000005e+150,
      1.0000000000001e+150,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [
    9.99999999999e+149, 1.000000000001e+150,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [1.0e+150, 1.00000000000001e+150])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    9.999999999999e+149, 9.9999999999995e+149, 1.0e+150, 1.00000000000005e+150, 1.0000000000001e+150,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 236 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [2.5]
  let binding_view = [0.0 / 0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0 / 0.0, 1.0), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0 / 0.0), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 237 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [2.5]
  let binding_view = [0.0 / 0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0 / 0.0, 1.0), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0 / 0.0), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 238 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [4.0]
  let binding_view = [0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0, 1.0), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 239 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [4.0]
  let binding_view = [0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0, 1.0), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 240 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [4.0]
  let binding_view = [-3.7, 14.2]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-3.7, 14.2), [
    -4.0, -2.0, 0.0, 2.0, 4.0, 6.0, 8.0, 10.0, 12.0, 14.0, 16.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(14.2, -3.7), [
    -4.0, -2.0, 0.0, 2.0, 4.0, 6.0, 8.0, 10.0, 12.0, 14.0, 16.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-3.7, 14.2])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-3.7, 14.2])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -4.0, -2.0, 0.0, 2.0, 4.0, 6.0, 8.0, 10.0, 12.0, 14.0, 16.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 241 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [4.0]
  let binding_view = [-3.7, 14.2]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-3.7, 14.2), [
    -5.0, 0.0, 5.0, 10.0, 15.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(14.2, -3.7), [
    -5.0, 0.0, 5.0, 10.0, 15.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-5.0, 15.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-3.7, 14.2])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [-5.0, 0.0, 5.0, 10.0, 15.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 242 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [4.0]
  let binding_view = [10000000000.0, 10000000001.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000000.0, 10000000001.0),
    [
      10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8,
      10000000001.0,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000001.0, 10000000000.0),
    [
      10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8,
      10000000001.0,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8, 10000000001.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 243 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [4.0]
  let binding_view = [10000000000.0, 10000000001.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000000.0, 10000000001.0),
    [
      10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8,
      10000000001.0,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000001.0, 10000000000.0),
    [
      10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8,
      10000000001.0,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8, 10000000001.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 244 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [4.0]
  let binding_view = [2.0, 2.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [1.999999999998, 2.000000000002])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [1.9, 2.1])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 245 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [4.0]
  let binding_view = [2.0, 2.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [
    1.9999999999979998, 2.000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [1.9, 2.1])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 246 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [4.0]
  let binding_view = [-1.0e-290, 1.0e-290]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-1.0e-290, 1.0e-290), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0e-290, -1.0e-290), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 247 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [4.0]
  let binding_view = [-1.0e-290, 1.0e-290]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-1.0e-290, 1.0e-290), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0e-290, -1.0e-290), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 248 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [4.0]
  let binding_view = [1.0e+150, 1.00000000000001e+150]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.0e+150, 1.00000000000001e+150),
    [
      9.999999999999e+149, 9.9999999999995e+149, 1.0e+150, 1.00000000000005e+150,
      1.0000000000001e+150,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.00000000000001e+150, 1.0e+150),
    [
      9.999999999999e+149, 9.9999999999995e+149, 1.0e+150, 1.00000000000005e+150,
      1.0000000000001e+150,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [
    9.99999999999e+149, 1.00000000000101e+150,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [1.0e+150, 1.00000000000001e+150])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    9.999999999999e+149, 9.9999999999995e+149, 1.0e+150, 1.00000000000005e+150, 1.0000000000001e+150,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 249 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [4.0]
  let binding_view = [1.0e+150, 1.00000000000001e+150]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.0e+150, 1.00000000000001e+150),
    [
      9.999999999999e+149, 9.9999999999995e+149, 1.0e+150, 1.00000000000005e+150,
      1.0000000000001e+150,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.00000000000001e+150, 1.0e+150),
    [
      9.999999999999e+149, 9.9999999999995e+149, 1.0e+150, 1.00000000000005e+150,
      1.0000000000001e+150,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [
    9.99999999999e+149, 1.000000000001e+150,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [1.0e+150, 1.00000000000001e+150])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    9.999999999999e+149, 9.9999999999995e+149, 1.0e+150, 1.00000000000005e+150, 1.0000000000001e+150,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 250 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [4.0]
  let binding_view = [0.0 / 0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0 / 0.0, 1.0), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0 / 0.0), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 251 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [4.0]
  let binding_view = [0.0 / 0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0 / 0.0, 1.0), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0 / 0.0), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 252 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [9.0]
  let binding_view = [0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0, 1.0), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 253 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [9.0]
  let binding_view = [0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0, 1.0), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 254 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [9.0]
  let binding_view = [-3.7, 14.2]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-3.7, 14.2), [
    -4.0, -2.0, 0.0, 2.0, 4.0, 6.0, 8.0, 10.0, 12.0, 14.0, 16.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(14.2, -3.7), [
    -4.0, -2.0, 0.0, 2.0, 4.0, 6.0, 8.0, 10.0, 12.0, 14.0, 16.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-3.7, 14.2])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-3.7, 14.2])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -4.0, -2.0, 0.0, 2.0, 4.0, 6.0, 8.0, 10.0, 12.0, 14.0, 16.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 255 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [9.0]
  let binding_view = [-3.7, 14.2]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-3.7, 14.2), [
    -5.0, 0.0, 5.0, 10.0, 15.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(14.2, -3.7), [
    -5.0, 0.0, 5.0, 10.0, 15.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-5.0, 15.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-3.7, 14.2])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [-5.0, 0.0, 5.0, 10.0, 15.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 256 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [9.0]
  let binding_view = [10000000000.0, 10000000001.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000000.0, 10000000001.0),
    [
      10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8,
      10000000001.0,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000001.0, 10000000000.0),
    [
      10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8,
      10000000001.0,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8, 10000000001.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 257 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [9.0]
  let binding_view = [10000000000.0, 10000000001.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000000.0, 10000000001.0),
    [
      10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8,
      10000000001.0,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000001.0, 10000000000.0),
    [
      10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8,
      10000000001.0,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8, 10000000001.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 258 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [9.0]
  let binding_view = [2.0, 2.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [1.999999999998, 2.000000000002])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [1.9, 2.1])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 259 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [9.0]
  let binding_view = [2.0, 2.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [
    1.9999999999979998, 2.000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [1.9, 2.1])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 260 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [9.0]
  let binding_view = [-1.0e-290, 1.0e-290]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-1.0e-290, 1.0e-290), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0e-290, -1.0e-290), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 261 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [9.0]
  let binding_view = [-1.0e-290, 1.0e-290]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-1.0e-290, 1.0e-290), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0e-290, -1.0e-290), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 262 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [9.0]
  let binding_view = [1.0e+150, 1.00000000000001e+150]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.0e+150, 1.00000000000001e+150),
    [
      9.999999999999e+149, 9.9999999999995e+149, 1.0e+150, 1.00000000000005e+150,
      1.0000000000001e+150,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.00000000000001e+150, 1.0e+150),
    [
      9.999999999999e+149, 9.9999999999995e+149, 1.0e+150, 1.00000000000005e+150,
      1.0000000000001e+150,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [
    9.99999999999e+149, 1.00000000000101e+150,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [1.0e+150, 1.00000000000001e+150])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    9.999999999999e+149, 9.9999999999995e+149, 1.0e+150, 1.00000000000005e+150, 1.0000000000001e+150,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 263 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [9.0]
  let binding_view = [1.0e+150, 1.00000000000001e+150]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.0e+150, 1.00000000000001e+150),
    [
      9.999999999999e+149, 9.9999999999995e+149, 1.0e+150, 1.00000000000005e+150,
      1.0000000000001e+150,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.00000000000001e+150, 1.0e+150),
    [
      9.999999999999e+149, 9.9999999999995e+149, 1.0e+150, 1.00000000000005e+150,
      1.0000000000001e+150,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [
    9.99999999999e+149, 1.000000000001e+150,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [1.0e+150, 1.00000000000001e+150])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    9.999999999999e+149, 9.9999999999995e+149, 1.0e+150, 1.00000000000005e+150, 1.0000000000001e+150,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 264 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [9.0]
  let binding_view = [0.0 / 0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0 / 0.0, 1.0), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0 / 0.0), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 265 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [9.0]
  let binding_view = [0.0 / 0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0 / 0.0, 1.0), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0 / 0.0), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 266 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [20.0]
  let binding_view = [0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0, 1.0), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 267 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [20.0]
  let binding_view = [0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0, 1.0), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 268 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [20.0]
  let binding_view = [-3.7, 14.2]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-3.7, 14.2), [
    -4.0, -2.0, 0.0, 2.0, 4.0, 6.0, 8.0, 10.0, 12.0, 14.0, 16.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(14.2, -3.7), [
    -4.0, -2.0, 0.0, 2.0, 4.0, 6.0, 8.0, 10.0, 12.0, 14.0, 16.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-3.7, 14.2])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-3.7, 14.2])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -4.0, -2.0, 0.0, 2.0, 4.0, 6.0, 8.0, 10.0, 12.0, 14.0, 16.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 269 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [20.0]
  let binding_view = [-3.7, 14.2]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-3.7, 14.2), [
    -5.0, 0.0, 5.0, 10.0, 15.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(14.2, -3.7), [
    -5.0, 0.0, 5.0, 10.0, 15.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-5.0, 15.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-3.7, 14.2])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [-5.0, 0.0, 5.0, 10.0, 15.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 270 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [20.0]
  let binding_view = [10000000000.0, 10000000001.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000000.0, 10000000001.0),
    [
      10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8,
      10000000001.0,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000001.0, 10000000000.0),
    [
      10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8,
      10000000001.0,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8, 10000000001.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 271 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [20.0]
  let binding_view = [10000000000.0, 10000000001.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000000.0, 10000000001.0),
    [
      10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8,
      10000000001.0,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000001.0, 10000000000.0),
    [
      10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8,
      10000000001.0,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8, 10000000001.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 272 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [20.0]
  let binding_view = [2.0, 2.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [1.999999999998, 2.000000000002])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [1.9, 2.1])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 273 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [20.0]
  let binding_view = [2.0, 2.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [
    1.9999999999979998, 2.000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [1.9, 2.1])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 274 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [20.0]
  let binding_view = [-1.0e-290, 1.0e-290]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-1.0e-290, 1.0e-290), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0e-290, -1.0e-290), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 275 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [20.0]
  let binding_view = [-1.0e-290, 1.0e-290]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-1.0e-290, 1.0e-290), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0e-290, -1.0e-290), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 276 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [20.0]
  let binding_view = [1.0e+150, 1.00000000000001e+150]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.0e+150, 1.00000000000001e+150),
    [
      9.999999999999e+149, 9.9999999999995e+149, 1.0e+150, 1.00000000000005e+150,
      1.0000000000001e+150,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.00000000000001e+150, 1.0e+150),
    [
      9.999999999999e+149, 9.9999999999995e+149, 1.0e+150, 1.00000000000005e+150,
      1.0000000000001e+150,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [
    9.99999999999e+149, 1.00000000000101e+150,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [1.0e+150, 1.00000000000001e+150])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    9.999999999999e+149, 9.9999999999995e+149, 1.0e+150, 1.00000000000005e+150, 1.0000000000001e+150,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 277 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [20.0]
  let binding_view = [1.0e+150, 1.00000000000001e+150]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.0e+150, 1.00000000000001e+150),
    [
      9.999999999999e+149, 9.9999999999995e+149, 1.0e+150, 1.00000000000005e+150,
      1.0000000000001e+150,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.00000000000001e+150, 1.0e+150),
    [
      9.999999999999e+149, 9.9999999999995e+149, 1.0e+150, 1.00000000000005e+150,
      1.0000000000001e+150,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [
    9.99999999999e+149, 1.000000000001e+150,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [1.0e+150, 1.00000000000001e+150])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    9.999999999999e+149, 9.9999999999995e+149, 1.0e+150, 1.00000000000005e+150, 1.0000000000001e+150,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 278 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [20.0]
  let binding_view = [0.0 / 0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0 / 0.0, 1.0), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0 / 0.0), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 279 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [20.0]
  let binding_view = [0.0 / 0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0 / 0.0, 1.0), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0 / 0.0), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 280 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [1.0 / 0.0]
  let binding_view = [0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0, 1.0), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 281 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [1.0 / 0.0]
  let binding_view = [0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0, 1.0), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 282 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [1.0 / 0.0]
  let binding_view = [-3.7, 14.2]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-3.7, 14.2), [
    -4.0, -2.0, 0.0, 2.0, 4.0, 6.0, 8.0, 10.0, 12.0, 14.0, 16.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(14.2, -3.7), [
    -4.0, -2.0, 0.0, 2.0, 4.0, 6.0, 8.0, 10.0, 12.0, 14.0, 16.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-3.7, 14.2])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-3.7, 14.2])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -4.0, -2.0, 0.0, 2.0, 4.0, 6.0, 8.0, 10.0, 12.0, 14.0, 16.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 283 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [1.0 / 0.0]
  let binding_view = [-3.7, 14.2]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-3.7, 14.2), [
    -5.0, 0.0, 5.0, 10.0, 15.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(14.2, -3.7), [
    -5.0, 0.0, 5.0, 10.0, 15.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-5.0, 15.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-3.7, 14.2])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [-5.0, 0.0, 5.0, 10.0, 15.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 284 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [1.0 / 0.0]
  let binding_view = [10000000000.0, 10000000001.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000000.0, 10000000001.0),
    [
      10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8,
      10000000001.0,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000001.0, 10000000000.0),
    [
      10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8,
      10000000001.0,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8, 10000000001.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 285 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [1.0 / 0.0]
  let binding_view = [10000000000.0, 10000000001.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000000.0, 10000000001.0),
    [
      10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8,
      10000000001.0,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000001.0, 10000000000.0),
    [
      10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8,
      10000000001.0,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8, 10000000001.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 286 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [1.0 / 0.0]
  let binding_view = [2.0, 2.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [1.999999999998, 2.000000000002])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [1.9, 2.1])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 287 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [1.0 / 0.0]
  let binding_view = [2.0, 2.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [
    1.9999999999979998, 2.000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [1.9, 2.1])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 288 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [1.0 / 0.0]
  let binding_view = [-1.0e-290, 1.0e-290]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-1.0e-290, 1.0e-290), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0e-290, -1.0e-290), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 289 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [1.0 / 0.0]
  let binding_view = [-1.0e-290, 1.0e-290]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-1.0e-290, 1.0e-290), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0e-290, -1.0e-290), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 290 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [1.0 / 0.0]
  let binding_view = [1.0e+150, 1.00000000000001e+150]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.0e+150, 1.00000000000001e+150),
    [
      9.999999999999e+149, 9.9999999999995e+149, 1.0e+150, 1.00000000000005e+150,
      1.0000000000001e+150,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.00000000000001e+150, 1.0e+150),
    [
      9.999999999999e+149, 9.9999999999995e+149, 1.0e+150, 1.00000000000005e+150,
      1.0000000000001e+150,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [
    9.99999999999e+149, 1.00000000000101e+150,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [1.0e+150, 1.00000000000001e+150])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    9.999999999999e+149, 9.9999999999995e+149, 1.0e+150, 1.00000000000005e+150, 1.0000000000001e+150,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 291 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [1.0 / 0.0]
  let binding_view = [1.0e+150, 1.00000000000001e+150]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.0e+150, 1.00000000000001e+150),
    [
      9.999999999999e+149, 9.9999999999995e+149, 1.0e+150, 1.00000000000005e+150,
      1.0000000000001e+150,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.00000000000001e+150, 1.0e+150),
    [
      9.999999999999e+149, 9.9999999999995e+149, 1.0e+150, 1.00000000000005e+150,
      1.0000000000001e+150,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [
    9.99999999999e+149, 1.000000000001e+150,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [1.0e+150, 1.00000000000001e+150])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    9.999999999999e+149, 9.9999999999995e+149, 1.0e+150, 1.00000000000005e+150, 1.0000000000001e+150,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 292 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [1.0 / 0.0]
  let binding_view = [0.0 / 0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0 / 0.0, 1.0), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0 / 0.0), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 293 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [1.0 / 0.0]
  let binding_view = [0.0 / 0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0 / 0.0, 1.0), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0 / 0.0), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 294 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [0.0 / 0.0]
  let binding_view = [0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0, 1.0), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 295 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [0.0 / 0.0]
  let binding_view = [0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0, 1.0), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [0.0, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    0.0, 0.2, 0.4, 0.6000000000000001, 0.8, 1.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 296 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [0.0 / 0.0]
  let binding_view = [-3.7, 14.2]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-3.7, 14.2), [
    -4.0, -2.0, 0.0, 2.0, 4.0, 6.0, 8.0, 10.0, 12.0, 14.0, 16.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(14.2, -3.7), [
    -4.0, -2.0, 0.0, 2.0, 4.0, 6.0, 8.0, 10.0, 12.0, 14.0, 16.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-3.7, 14.2])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-3.7, 14.2])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -4.0, -2.0, 0.0, 2.0, 4.0, 6.0, 8.0, 10.0, 12.0, 14.0, 16.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 297 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [0.0 / 0.0]
  let binding_view = [-3.7, 14.2]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-3.7, 14.2), [
    -5.0, 0.0, 5.0, 10.0, 15.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(14.2, -3.7), [
    -5.0, 0.0, 5.0, 10.0, 15.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-5.0, 15.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-3.7, 14.2)
  verify_auto_numeric_values([pair.0, pair.1], [-3.7, 14.2])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [-5.0, 0.0, 5.0, 10.0, 15.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 298 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [0.0 / 0.0]
  let binding_view = [10000000000.0, 10000000001.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000000.0, 10000000001.0),
    [
      10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8,
      10000000001.0,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000001.0, 10000000000.0),
    [
      10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8,
      10000000001.0,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8, 10000000001.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 299 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [0.0 / 0.0]
  let binding_view = [10000000000.0, 10000000001.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000000.0, 10000000001.0),
    [
      10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8,
      10000000001.0,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(10000000001.0, 10000000000.0),
    [
      10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8,
      10000000001.0,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(10000000000.0, 10000000001.0)
  verify_auto_numeric_values([pair.0, pair.1], [10000000000.0, 10000000001.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    10000000000.0, 10000000000.2, 10000000000.4, 10000000000.6, 10000000000.8, 10000000001.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 300 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [0.0 / 0.0]
  let binding_view = [2.0, 2.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [1.999999999998, 2.000000000002])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [1.9, 2.1])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 301 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [0.0 / 0.0]
  let binding_view = [2.0, 2.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(2.0, 2.0), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [
    1.9999999999979998, 2.000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(2.0, 2.0)
  verify_auto_numeric_values([pair.0, pair.1], [1.9, 2.1])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    1.9999999999998, 1.99999999999985, 1.9999999999999, 1.9999999999999498, 2.0,
    2.0000000000000497, 2.0000000000001, 2.00000000000015, 2.0000000000002,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 302 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [0.0 / 0.0]
  let binding_view = [-1.0e-290, 1.0e-290]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-1.0e-290, 1.0e-290), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0e-290, -1.0e-290), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 303 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [0.0 / 0.0]
  let binding_view = [-1.0e-290, 1.0e-290]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(-1.0e-290, 1.0e-290), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0e-290, -1.0e-290), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(-1.0e-290, 1.0e-290)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 304 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [0.0 / 0.0]
  let binding_view = [1.0e+150, 1.00000000000001e+150]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.0e+150, 1.00000000000001e+150),
    [
      9.999999999999e+149, 9.9999999999995e+149, 1.0e+150, 1.00000000000005e+150,
      1.0000000000001e+150,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.00000000000001e+150, 1.0e+150),
    [
      9.999999999999e+149, 9.9999999999995e+149, 1.0e+150, 1.00000000000005e+150,
      1.0000000000001e+150,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [
    9.99999999999e+149, 1.00000000000101e+150,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [1.0e+150, 1.00000000000001e+150])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    9.999999999999e+149, 9.9999999999995e+149, 1.0e+150, 1.00000000000005e+150, 1.0000000000001e+150,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 305 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [0.0 / 0.0]
  let binding_view = [1.0e+150, 1.00000000000001e+150]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.0e+150, 1.00000000000001e+150),
    [
      9.999999999999e+149, 9.9999999999995e+149, 1.0e+150, 1.00000000000005e+150,
      1.0000000000001e+150,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(
    locator.tick_values(1.00000000000001e+150, 1.0e+150),
    [
      9.999999999999e+149, 9.9999999999995e+149, 1.0e+150, 1.00000000000005e+150,
      1.0000000000001e+150,
    ],
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [
    9.99999999999e+149, 1.000000000001e+150,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(1.0e+150, 1.00000000000001e+150)
  verify_auto_numeric_values([pair.0, pair.1], [1.0e+150, 1.00000000000001e+150])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    9.999999999999e+149, 9.9999999999995e+149, 1.0e+150, 1.00000000000005e+150, 1.0000000000001e+150,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 306 classic True data" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [0.0 / 0.0]
  let binding_view = [0.0 / 0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0 / 0.0, 1.0), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0 / 0.0), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original 307 classic True round_numbers" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("round_numbers")
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  let binding_space = [0.0 / 0.0]
  let binding_view = [0.0 / 0.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(0.0 / 0.0, 1.0), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.tick_values(1.0, 0.0 / 0.0), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.view_limits(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-1.0e-12, 1.0e-12])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  let pair = locator.nonsingular(0.0 / 0.0, 1.0)
  verify_auto_numeric_values([pair.0, pair.1], [-0.05, 0.05])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 0)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -1.0e-13, -5.0e-14, 0.0, 5.0000000000000014e-14, 1.0e-13,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original inherited updates classic False" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  let binding_space = [3.0]
  let binding_view = [-2.7, 9.1]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  locator.set_params(
    nbins=@ticker.MaxNBins::Count(3),
    integer=true,
    symmetric=true,
    prune=Some("both"),
    min_n_ticks=4,
    steps=Some(@ticker.TickValues::from_array([1.0, 3.0, 6.0, 10.0])),
  )
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(3))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 3.0, 6.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.30000000000000004, 0.6000000000000001, 1.0, 3.0, 6.0, 10.0, 30.0,
  ])
  assert_eq(locator.integer(), true)
  assert_eq(locator.symmetric(), true)
  assert_eq(locator.min_n_ticks(), 4)
  assert_eq(locator.prune(), Some("both"))
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(3))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 3.0, 6.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.30000000000000004, 0.6000000000000001, 1.0, 3.0, 6.0, 10.0, 30.0,
  ])
  assert_eq(live.integer(), true)
  assert_eq(live.symmetric(), true)
  assert_eq(live.min_n_ticks(), 4)
  assert_eq(live.prune(), Some("both"))
  @config.set_axes_autolimit_mode("data")
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -9.0, -6.0, -3.0, 0.0, 3.0, 6.0, 9.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
  @config.set_axes_autolimit_mode("round_numbers")
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -9.0, -6.0, -3.0, 0.0, 3.0, 6.0, 9.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
  locator.set_params(steps=None, prune=None)
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(3))
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
    0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
  ])
  assert_eq(locator.integer(), true)
  assert_eq(locator.symmetric(), true)
  assert_eq(locator.min_n_ticks(), 4)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(3))
  verify_auto_numeric_values(live.steps().to_array(), [
    1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0,
  ])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
    0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
  ])
  assert_eq(live.integer(), true)
  assert_eq(live.symmetric(), true)
  assert_eq(live.min_n_ticks(), 4)
  assert_eq(live.prune(), None)
  @config.set_axes_autolimit_mode("data")
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -12.0, -8.0, -4.0, 0.0, 4.0, 8.0, 12.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
  @config.set_axes_autolimit_mode("round_numbers")
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -12.0, -8.0, -4.0, 0.0, 4.0, 8.0, 12.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
  locator.set_params()
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(3))
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
    0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
  ])
  assert_eq(locator.integer(), true)
  assert_eq(locator.symmetric(), true)
  assert_eq(locator.min_n_ticks(), 4)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(3))
  verify_auto_numeric_values(live.steps().to_array(), [
    1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0,
  ])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
    0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
  ])
  assert_eq(live.integer(), true)
  assert_eq(live.symmetric(), true)
  assert_eq(live.min_n_ticks(), 4)
  assert_eq(live.prune(), None)
  @config.set_axes_autolimit_mode("data")
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -12.0, -8.0, -4.0, 0.0, 4.0, 8.0, 12.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
  @config.set_axes_autolimit_mode("round_numbers")
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -12.0, -8.0, -4.0, 0.0, 4.0, 8.0, 12.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
  locator.set_params(
    nbins=@ticker.MaxNBins::Auto,
    min_n_ticks=20,
    integer=false,
    symmetric=false,
    prune=Some("upper"),
  )
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
    0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 20)
  assert_eq(locator.prune(), Some("upper"))
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [
    1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0,
  ])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
    0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 20)
  assert_eq(live.prune(), Some("upper"))
  @config.set_axes_autolimit_mode("data")
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -3.0000000000000004, -2.4000000000000004, -1.8000000000000003, -1.2000000000000002,
    -0.6000000000000001, 0.0, 0.6000000000000001, 1.2000000000000006, 1.8000000000000003,
    2.4, 3.0000000000000004, 3.600000000000001, 4.200000000000001, 4.800000000000001,
    5.400000000000002, 6.000000000000002, 6.600000000000001, 7.200000000000001, 7.800000000000001,
    8.400000000000002, 9.000000000000002,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
  @config.set_axes_autolimit_mode("round_numbers")
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -3.0000000000000004, -2.4000000000000004, -1.8000000000000003, -1.2000000000000002,
    -0.6000000000000001, 0.0, 0.6000000000000001, 1.2000000000000006, 1.8000000000000003,
    2.4, 3.0000000000000004, 3.600000000000001, 4.200000000000001, 4.800000000000001,
    5.400000000000002, 6.000000000000002, 6.600000000000001, 7.200000000000001, 7.800000000000001,
    8.400000000000002, 9.000000000000002,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
  locator.set_params(nbins=@ticker.MaxNBins::Count(0), integer=true, prune=None)
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(0))
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
    0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
  ])
  assert_eq(locator.integer(), true)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 20)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(0))
  verify_auto_numeric_values(live.steps().to_array(), [
    1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0,
  ])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
    0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
  ])
  assert_eq(live.integer(), true)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 20)
  assert_eq(live.prune(), None)
  @config.set_axes_autolimit_mode("data")
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.call())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
  @config.set_axes_autolimit_mode("round_numbers")
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.call())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
  assert_true(
    try {
      locator.set_params(
        nbins=@ticker.MaxNBins::Count(4),
        prune=Some("invalid"),
        min_n_ticks=9,
        steps=Some(@ticker.TickValues::from_array([1.0, 2.0, 10.0])),
        integer=false,
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(4))
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
    0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
  ])
  assert_eq(locator.integer(), true)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 20)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(4))
  verify_auto_numeric_values(live.steps().to_array(), [
    1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0,
  ])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
    0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
  ])
  assert_eq(live.integer(), true)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 20)
  assert_eq(live.prune(), None)
  @config.set_axes_autolimit_mode("data")
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -3.0000000000000004, -2.4000000000000004, -1.8000000000000003, -1.2000000000000002,
    -0.6000000000000001, 0.0, 0.6000000000000001, 1.2000000000000006, 1.8000000000000003,
    2.4, 3.0000000000000004, 3.600000000000001, 4.200000000000001, 4.800000000000001,
    5.400000000000002, 6.000000000000002, 6.600000000000001, 7.200000000000001, 7.800000000000001,
    8.400000000000002, 9.000000000000002, 9.600000000000001,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
  @config.set_axes_autolimit_mode("round_numbers")
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -3.0000000000000004, -2.4000000000000004, -1.8000000000000003, -1.2000000000000002,
    -0.6000000000000001, 0.0, 0.6000000000000001, 1.2000000000000006, 1.8000000000000003,
    2.4, 3.0000000000000004, 3.600000000000001, 4.200000000000001, 4.800000000000001,
    5.400000000000002, 6.000000000000002, 6.600000000000001, 7.200000000000001, 7.800000000000001,
    8.400000000000002, 9.000000000000002, 9.600000000000001,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
  assert_true(
    try {
      locator.set_params(
        symmetric=true,
        min_n_ticks=4,
        steps=Some(@ticker.TickValues::from_array([1.0, 1.0, 10.0])),
        integer=false,
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(4))
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
    0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
  ])
  assert_eq(locator.integer(), true)
  assert_eq(locator.symmetric(), true)
  assert_eq(locator.min_n_ticks(), 4)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(4))
  verify_auto_numeric_values(live.steps().to_array(), [
    1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0,
  ])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
    0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
  ])
  assert_eq(live.integer(), true)
  assert_eq(live.symmetric(), true)
  assert_eq(live.min_n_ticks(), 4)
  assert_eq(live.prune(), None)
  @config.set_axes_autolimit_mode("data")
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -12.0, -8.0, -4.0, 0.0, 4.0, 8.0, 12.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
  @config.set_axes_autolimit_mode("round_numbers")
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -12.0, -8.0, -4.0, 0.0, 4.0, 8.0, 12.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
  locator.set_params(
    steps=Some(@ticker.TickValues::from_array([1.0, 2.0, 2.5, 5.0, 10.0])),
    integer=false,
  )
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(4))
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), true)
  assert_eq(locator.min_n_ticks(), 4)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(4))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), true)
  assert_eq(live.min_n_ticks(), 4)
  assert_eq(live.prune(), None)
  @config.set_axes_autolimit_mode("data")
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -10.0, -7.5, -5.0, -2.5, 0.0, 2.5, 5.0, 7.5, 10.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
  @config.set_axes_autolimit_mode("round_numbers")
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -10.0, -7.5, -5.0, -2.5, 0.0, 2.5, 5.0, 7.5, 10.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original provider copy rebind classic False" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(true)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  let binding_space = [2.0]
  let binding_view = [0.0, 20.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  let independent = locator.copy()
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [0.0, 10.0, 20.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(independent.call(), [0.0, 10.0, 20.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(independent.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(independent.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(independent.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(independent.integer(), false)
  assert_eq(independent.symmetric(), false)
  assert_eq(independent.min_n_ticks(), 2)
  assert_eq(independent.prune(), None)
  binding_space[0] = 6.0
  binding_view[0] = 1.0
  binding_view[1] = 4.0
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [1.0, 1.5, 2.0, 2.5, 3.0, 3.5, 4.0])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(independent.call(), [
    1.0, 1.5, 2.0, 2.5, 3.0, 3.5, 4.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(independent.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(independent.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(independent.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(independent.integer(), false)
  assert_eq(independent.symmetric(), false)
  assert_eq(independent.min_n_ticks(), 2)
  assert_eq(independent.prune(), None)
  let replacement_space = [8.0]
  let replacement_view = [-1.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    replacement_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (replacement_view[0], replacement_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -1.0, -0.75, -0.5, -0.25, 0.0, 0.25, 0.5, 0.75, 1.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(independent.call(), [
    1.0, 1.5, 2.0, 2.5, 3.0, 3.5, 4.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(independent.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(independent.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(independent.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(independent.integer(), false)
  assert_eq(independent.symmetric(), false)
  assert_eq(independent.min_n_ticks(), 2)
  assert_eq(independent.prune(), None)
  independent.set_params(
    nbins=@ticker.MaxNBins::Count(2),
    prune=Some("lower"),
    integer=true,
  )
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -1.0, -0.75, -0.5, -0.25, 0.0, 0.25, 0.5, 0.75, 1.0,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(independent.call(), [2.0, 4.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(independent.nbins(), @ticker.MaxNBins::Count(2))
  verify_auto_numeric_values(independent.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(independent.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(independent.integer(), true)
  assert_eq(independent.symmetric(), false)
  assert_eq(independent.min_n_ticks(), 2)
  assert_eq(independent.prune(), Some("lower"))
  locator.steps().set(1, 1.25)
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 1.25, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [
    1.0, 1.25, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  assert_eq(independent.nbins(), @ticker.MaxNBins::Count(2))
  verify_auto_numeric_values(independent.steps().to_array(), [
    1.0, 1.25, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(independent.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(independent.integer(), true)
  assert_eq(independent.symmetric(), false)
  assert_eq(independent.min_n_ticks(), 2)
  assert_eq(independent.prune(), Some("lower"))
}

///|
test "AutoLocator original inherited updates classic True" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  let binding_space = [3.0]
  let binding_view = [-2.7, 9.1]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  locator.set_params(
    nbins=@ticker.MaxNBins::Count(3),
    integer=true,
    symmetric=true,
    prune=Some("both"),
    min_n_ticks=4,
    steps=Some(@ticker.TickValues::from_array([1.0, 3.0, 6.0, 10.0])),
  )
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(3))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 3.0, 6.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.30000000000000004, 0.6000000000000001, 1.0, 3.0, 6.0, 10.0, 30.0,
  ])
  assert_eq(locator.integer(), true)
  assert_eq(locator.symmetric(), true)
  assert_eq(locator.min_n_ticks(), 4)
  assert_eq(locator.prune(), Some("both"))
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(3))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 3.0, 6.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.30000000000000004, 0.6000000000000001, 1.0, 3.0, 6.0, 10.0, 30.0,
  ])
  assert_eq(live.integer(), true)
  assert_eq(live.symmetric(), true)
  assert_eq(live.min_n_ticks(), 4)
  assert_eq(live.prune(), Some("both"))
  @config.set_axes_autolimit_mode("data")
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -9.0, -6.0, -3.0, 0.0, 3.0, 6.0, 9.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
  @config.set_axes_autolimit_mode("round_numbers")
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -9.0, -6.0, -3.0, 0.0, 3.0, 6.0, 9.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
  locator.set_params(steps=None, prune=None)
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(3))
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
    0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
  ])
  assert_eq(locator.integer(), true)
  assert_eq(locator.symmetric(), true)
  assert_eq(locator.min_n_ticks(), 4)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(3))
  verify_auto_numeric_values(live.steps().to_array(), [
    1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0,
  ])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
    0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
  ])
  assert_eq(live.integer(), true)
  assert_eq(live.symmetric(), true)
  assert_eq(live.min_n_ticks(), 4)
  assert_eq(live.prune(), None)
  @config.set_axes_autolimit_mode("data")
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -12.0, -8.0, -4.0, 0.0, 4.0, 8.0, 12.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
  @config.set_axes_autolimit_mode("round_numbers")
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -12.0, -8.0, -4.0, 0.0, 4.0, 8.0, 12.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
  locator.set_params()
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(3))
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
    0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
  ])
  assert_eq(locator.integer(), true)
  assert_eq(locator.symmetric(), true)
  assert_eq(locator.min_n_ticks(), 4)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(3))
  verify_auto_numeric_values(live.steps().to_array(), [
    1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0,
  ])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
    0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
  ])
  assert_eq(live.integer(), true)
  assert_eq(live.symmetric(), true)
  assert_eq(live.min_n_ticks(), 4)
  assert_eq(live.prune(), None)
  @config.set_axes_autolimit_mode("data")
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -12.0, -8.0, -4.0, 0.0, 4.0, 8.0, 12.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
  @config.set_axes_autolimit_mode("round_numbers")
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -12.0, -8.0, -4.0, 0.0, 4.0, 8.0, 12.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
  locator.set_params(
    nbins=@ticker.MaxNBins::Auto,
    min_n_ticks=20,
    integer=false,
    symmetric=false,
    prune=Some("upper"),
  )
  assert_eq(locator.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
    0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 20)
  assert_eq(locator.prune(), Some("upper"))
  assert_eq(live.nbins(), @ticker.MaxNBins::Auto)
  verify_auto_numeric_values(live.steps().to_array(), [
    1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0,
  ])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
    0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 20)
  assert_eq(live.prune(), Some("upper"))
  @config.set_axes_autolimit_mode("data")
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -3.0000000000000004, -2.4000000000000004, -1.8000000000000003, -1.2000000000000002,
    -0.6000000000000001, 0.0, 0.6000000000000001, 1.2000000000000006, 1.8000000000000003,
    2.4, 3.0000000000000004, 3.600000000000001, 4.200000000000001, 4.800000000000001,
    5.400000000000002, 6.000000000000002, 6.600000000000001, 7.200000000000001, 7.800000000000001,
    8.400000000000002, 9.000000000000002,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
  @config.set_axes_autolimit_mode("round_numbers")
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -3.0000000000000004, -2.4000000000000004, -1.8000000000000003, -1.2000000000000002,
    -0.6000000000000001, 0.0, 0.6000000000000001, 1.2000000000000006, 1.8000000000000003,
    2.4, 3.0000000000000004, 3.600000000000001, 4.200000000000001, 4.800000000000001,
    5.400000000000002, 6.000000000000002, 6.600000000000001, 7.200000000000001, 7.800000000000001,
    8.400000000000002, 9.000000000000002,
  ])
  assert_eq(space_reads[0], 1)
  assert_eq(view_reads[0], 1)
  locator.set_params(nbins=@ticker.MaxNBins::Count(0), integer=true, prune=None)
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(0))
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
    0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
  ])
  assert_eq(locator.integer(), true)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 20)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(0))
  verify_auto_numeric_values(live.steps().to_array(), [
    1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0,
  ])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
    0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
  ])
  assert_eq(live.integer(), true)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 20)
  assert_eq(live.prune(), None)
  @config.set_axes_autolimit_mode("data")
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.call())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
  @config.set_axes_autolimit_mode("round_numbers")
  space_reads[0] = 0
  view_reads[0] = 0
  assert_true(
    try {
      ignore(locator.call())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
  assert_true(
    try {
      locator.set_params(
        nbins=@ticker.MaxNBins::Count(4),
        prune=Some("invalid"),
        min_n_ticks=9,
        steps=Some(@ticker.TickValues::from_array([1.0, 2.0, 10.0])),
        integer=false,
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(4))
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
    0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
  ])
  assert_eq(locator.integer(), true)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 20)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(4))
  verify_auto_numeric_values(live.steps().to_array(), [
    1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0,
  ])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
    0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
  ])
  assert_eq(live.integer(), true)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 20)
  assert_eq(live.prune(), None)
  @config.set_axes_autolimit_mode("data")
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -3.0000000000000004, -2.4000000000000004, -1.8000000000000003, -1.2000000000000002,
    -0.6000000000000001, 0.0, 0.6000000000000001, 1.2000000000000006, 1.8000000000000003,
    2.4, 3.0000000000000004, 3.600000000000001, 4.200000000000001, 4.800000000000001,
    5.400000000000002, 6.000000000000002, 6.600000000000001, 7.200000000000001, 7.800000000000001,
    8.400000000000002, 9.000000000000002, 9.600000000000001,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
  @config.set_axes_autolimit_mode("round_numbers")
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -3.0000000000000004, -2.4000000000000004, -1.8000000000000003, -1.2000000000000002,
    -0.6000000000000001, 0.0, 0.6000000000000001, 1.2000000000000006, 1.8000000000000003,
    2.4, 3.0000000000000004, 3.600000000000001, 4.200000000000001, 4.800000000000001,
    5.400000000000002, 6.000000000000002, 6.600000000000001, 7.200000000000001, 7.800000000000001,
    8.400000000000002, 9.000000000000002, 9.600000000000001,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
  assert_true(
    try {
      locator.set_params(
        symmetric=true,
        min_n_ticks=4,
        steps=Some(@ticker.TickValues::from_array([1.0, 1.0, 10.0])),
        integer=false,
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(4))
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
    0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
  ])
  assert_eq(locator.integer(), true)
  assert_eq(locator.symmetric(), true)
  assert_eq(locator.min_n_ticks(), 4)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(4))
  verify_auto_numeric_values(live.steps().to_array(), [
    1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0,
  ])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
    0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
  ])
  assert_eq(live.integer(), true)
  assert_eq(live.symmetric(), true)
  assert_eq(live.min_n_ticks(), 4)
  assert_eq(live.prune(), None)
  @config.set_axes_autolimit_mode("data")
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -12.0, -8.0, -4.0, 0.0, 4.0, 8.0, 12.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
  @config.set_axes_autolimit_mode("round_numbers")
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -12.0, -8.0, -4.0, 0.0, 4.0, 8.0, 12.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
  locator.set_params(
    steps=Some(@ticker.TickValues::from_array([1.0, 2.0, 2.5, 5.0, 10.0])),
    integer=false,
  )
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(4))
  verify_auto_numeric_values(locator.steps().to_array(), [
    1.0, 2.0, 2.5, 5.0, 10.0,
  ])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), true)
  assert_eq(locator.min_n_ticks(), 4)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(4))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 2.0, 2.5, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.25, 0.5, 1.0, 2.0, 2.5, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), true)
  assert_eq(live.min_n_ticks(), 4)
  assert_eq(live.prune(), None)
  @config.set_axes_autolimit_mode("data")
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -10.0, -7.5, -5.0, -2.5, 0.0, 2.5, 5.0, 7.5, 10.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
  @config.set_axes_autolimit_mode("round_numbers")
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [
    -10.0, -7.5, -5.0, -2.5, 0.0, 2.5, 5.0, 7.5, 10.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
}

///|
test "AutoLocator original provider copy rebind classic True" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(true)
  let locator = @ticker.AutoLocator::new()
  let live = locator.as_maxn_locator()
  @config.set_classic_mode(false)
  let space_reads = [0]
  let view_reads = [0]
  @config.set_axes_autolimit_mode("data")
  let binding_space = [2.0]
  let binding_view = [0.0, 20.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    binding_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (binding_view[0], binding_view[1])
  })
  let independent = locator.copy()
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [0.0, 5.0, 10.0, 15.0, 20.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(independent.call(), [0.0, 5.0, 10.0, 15.0, 20.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(independent.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(independent.steps().to_array(), [
    1.0, 2.0, 5.0, 10.0,
  ])
  verify_auto_numeric_values(independent.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(independent.integer(), false)
  assert_eq(independent.symmetric(), false)
  assert_eq(independent.min_n_ticks(), 2)
  assert_eq(independent.prune(), None)
  binding_space[0] = 6.0
  binding_view[0] = 1.0
  binding_view[1] = 4.0
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [1.0, 1.5, 2.0, 2.5, 3.0, 3.5, 4.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(independent.call(), [
    1.0, 1.5, 2.0, 2.5, 3.0, 3.5, 4.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(independent.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(independent.steps().to_array(), [
    1.0, 2.0, 5.0, 10.0,
  ])
  verify_auto_numeric_values(independent.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(independent.integer(), false)
  assert_eq(independent.symmetric(), false)
  assert_eq(independent.min_n_ticks(), 2)
  assert_eq(independent.prune(), None)
  let replacement_space = [8.0]
  let replacement_view = [-1.0, 1.0]
  locator.bind_tick_space(fn() {
    space_reads[0] += 1
    replacement_space[0]
  })
  locator.bind_view_interval(fn() {
    view_reads[0] += 1
    (replacement_view[0], replacement_view[1])
  })
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [-1.0, -0.5, 0.0, 0.5, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(independent.call(), [
    1.0, 1.5, 2.0, 2.5, 3.0, 3.5, 4.0,
  ])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(independent.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(independent.steps().to_array(), [
    1.0, 2.0, 5.0, 10.0,
  ])
  verify_auto_numeric_values(independent.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(independent.integer(), false)
  assert_eq(independent.symmetric(), false)
  assert_eq(independent.min_n_ticks(), 2)
  assert_eq(independent.prune(), None)
  independent.set_params(
    nbins=@ticker.MaxNBins::Count(2),
    prune=Some("lower"),
    integer=true,
  )
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(locator.call(), [-1.0, -0.5, 0.0, 0.5, 1.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
  space_reads[0] = 0
  view_reads[0] = 0
  verify_auto_numeric_values(independent.call(), [2.0, 4.0])
  assert_eq(space_reads[0], 0)
  assert_eq(view_reads[0], 1)
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(independent.nbins(), @ticker.MaxNBins::Count(2))
  verify_auto_numeric_values(independent.steps().to_array(), [
    1.0, 2.0, 5.0, 10.0,
  ])
  verify_auto_numeric_values(independent.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(independent.integer(), true)
  assert_eq(independent.symmetric(), false)
  assert_eq(independent.min_n_ticks(), 2)
  assert_eq(independent.prune(), Some("lower"))
  locator.steps().set(1, 1.25)
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(locator.steps().to_array(), [1.0, 1.0, 5.0, 10.0])
  verify_auto_numeric_values(locator.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(locator.integer(), false)
  assert_eq(locator.symmetric(), false)
  assert_eq(locator.min_n_ticks(), 2)
  assert_eq(locator.prune(), None)
  assert_eq(live.nbins(), @ticker.MaxNBins::Count(9))
  verify_auto_numeric_values(live.steps().to_array(), [1.0, 1.0, 5.0, 10.0])
  verify_auto_numeric_values(live.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(live.integer(), false)
  assert_eq(live.symmetric(), false)
  assert_eq(live.min_n_ticks(), 2)
  assert_eq(live.prune(), None)
  assert_eq(independent.nbins(), @ticker.MaxNBins::Count(2))
  verify_auto_numeric_values(independent.steps().to_array(), [
    1.0, 1.0, 5.0, 10.0,
  ])
  verify_auto_numeric_values(independent.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(independent.integer(), true)
  assert_eq(independent.symmetric(), false)
  assert_eq(independent.min_n_ticks(), 2)
  assert_eq(independent.prune(), Some("lower"))
}
