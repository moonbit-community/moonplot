///|
test "logit default Int64 steps are fresh but copied inherited storage is shared" {
  let locator = @ticker.LogitLocator::new()
  let second = @ticker.LogitLocator::new()
  let shallow = locator.copy()
  let state = locator.as_maxn_locator()
  let extended = state.extended_steps()
  state.steps().set(1, 1.25)
  assert_eq(state.steps().to_array(), [1.0, 1.0, 5.0, 10.0])
  assert_eq(shallow.as_maxn_locator().steps().to_array(), [1.0, 1.0, 5.0, 10.0])
  assert_eq(second.as_maxn_locator().steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  assert_eq(state.extended_steps(), extended)
  state.set_params(nbins=@ticker.MaxNBins::Count(3))
  assert_eq(locator.as_maxn_locator().nbins(), @ticker.MaxNBins::Count(3))
  assert_eq(shallow.as_maxn_locator().nbins(), @ticker.MaxNBins::Auto)
  assert_eq(state.nonsingular(0.0, 0.0), (-0.05, 0.05))
  assert_eq(locator.nonsingular(0.0, 0.0), (1.0e-7, 1.0 - 1.0e-7))
}

///|
test "logit diagnostics are copied snapshots and updates preserve the last warning" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  @config.set_axes_autolimit_mode("data")
  let locator = @ticker.LogitLocator::new()
  ignore(locator.nonsingular(-1.0, 0.0))
  let message = "Data has no values between 0 and 1, and therefore cannot be logit-scaled."
  assert_eq(locator.warnings(), [message])
  let snapshot = locator.warnings()
  snapshot.clear()
  assert_eq(locator.warnings(), [message])
  let shallow = locator.copy()
  locator.set_params(minor=Some(true))
  assert_eq(locator.warnings(), [message])
  ignore(shallow.view_limits(-1.0, 2.0))
  assert_eq(shallow.warnings(), [])
  assert_eq(locator.warnings(), [message])
  locator.bind_view_interval(fn() raise @core.DataError {
    raise @core.DataError::InvalidTicks(message="logit checked view")
  })
  assert_true(
    try {
      ignore(locator.call())
      false
    } catch {
      @core.DataError::InvalidTicks(message~) => message == "logit checked view"
      _ => false
    },
  )
  assert_eq(locator.warnings(), [])
}

///|
test "logit bound missing providers fail late without invented standalone defaults" {
  let locator = @ticker.LogitLocator::new(
    nbins=Some(@ticker.MaxNBins::Count(3)),
  )
  let reads = Ref(0)
  locator.bind_projection(fn() raise @core.DataError {
    reads.val += 1
    raise @core.DataError::InvalidTicks(message="unexpected projection")
  })
  assert_true(
    try {
      ignore(locator.nonsingular(0.2, 0.8))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message.contains("minimum positive")
      _ => false
    },
  )
  assert_eq(reads.val, 0)
  assert_eq(locator.nonsingular(0.0 / 0.0, 0.8), (1.0e-7, 1.0 - 1.0e-7))
  assert_eq(reads.val, 0)
  locator.bind_minpos(fn() { 2.0 })
  assert_eq(locator.nonsingular(0.0, 1.0), (2.0, -1.0))
  assert_eq(reads.val, 0)
  assert_true(locator.tick_space_provider() is None)
  assert_true(locator.view_interval_provider() is None)
  assert_true(locator.minpos_provider() is Some(_))
  assert_true(locator.projection_provider() is Some(_))
}

///|
test "logit polar guard precedes raw bounds while call still reads its owner first" {
  let locator = @ticker.LogitLocator::new()
  let events : Array[String] = []
  locator.bind_projection(fn() {
    events.push("projection")
    "polar"
  })
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) => message.contains("Polar")
      _ => false
    },
  )
  assert_eq(events, ["projection"])
  locator.bind_view_interval(fn() raise @core.DataError {
    events.push("view")
    raise @core.DataError::InvalidTicks(message="view before projection")
  })
  assert_true(
    try {
      ignore(locator.call())
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "view before projection"
      _ => false
    },
  )
  assert_eq(events, ["projection", "view"])
}
