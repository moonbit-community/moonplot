// Complete pinned LogitLocator and inherited MaxN object protocols.

///|
fn verify_logit_params_values(
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
fn verify_logit_params_state(
  state : @ticker.MaxNLocator,
  nbins : @ticker.MaxNBins,
  integer : Bool,
  symmetric : Bool,
  prune : String?,
  min_ticks : Int32,
  steps : Array[Double],
  extended : Array[Double],
) -> Unit raise {
  assert_eq(state.nbins(), nbins)
  assert_eq(state.integer(), integer)
  assert_eq(state.symmetric(), symmetric)
  assert_eq(state.prune(), prune)
  assert_eq(state.min_n_ticks(), min_ticks)
  verify_logit_params_values(state.steps().to_array(), steps)
  verify_logit_params_values(state.extended_steps(), extended)
}

///|
test "Logit original constructor 0" {
  let old = @config.classic_mode()
  defer @config.set_classic_mode(old)
  @config.set_classic_mode(false)
  let locator = @ticker.LogitLocator::new(minor=false)
  assert_eq(locator.minor(), false)
  verify_logit_params_state(
    locator.as_maxn_locator(),
    @ticker.MaxNBins::Auto,
    false,
    false,
    None,
    2,
    [1.0, 2.0, 5.0, 10.0],
    [0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0],
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Logit original constructor 1" {
  let old = @config.classic_mode()
  defer @config.set_classic_mode(old)
  @config.set_classic_mode(false)
  let locator = @ticker.LogitLocator::new(minor=false, nbins=None)
  assert_eq(locator.minor(), false)
  verify_logit_params_state(
    locator.as_maxn_locator(),
    @ticker.MaxNBins::Count(10),
    false,
    false,
    None,
    2,
    [1.0, 2.0, 5.0, 10.0],
    [0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0],
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Logit original constructor 2" {
  let old = @config.classic_mode()
  defer @config.set_classic_mode(old)
  @config.set_classic_mode(false)
  let locator = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Auto),
  )
  assert_eq(locator.minor(), false)
  verify_logit_params_state(
    locator.as_maxn_locator(),
    @ticker.MaxNBins::Auto,
    false,
    false,
    None,
    2,
    [1.0, 2.0, 5.0, 10.0],
    [0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0],
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Logit original constructor 3" {
  let old = @config.classic_mode()
  defer @config.set_classic_mode(old)
  @config.set_classic_mode(false)
  let locator = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Count(0)),
  )
  assert_eq(locator.minor(), false)
  verify_logit_params_state(
    locator.as_maxn_locator(),
    @ticker.MaxNBins::Count(0),
    false,
    false,
    None,
    2,
    [1.0, 2.0, 5.0, 10.0],
    [0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0],
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Logit original constructor 4" {
  let old = @config.classic_mode()
  defer @config.set_classic_mode(old)
  @config.set_classic_mode(false)
  let locator = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Count(-1)),
  )
  assert_eq(locator.minor(), false)
  verify_logit_params_state(
    locator.as_maxn_locator(),
    @ticker.MaxNBins::Count(-1),
    false,
    false,
    None,
    2,
    [1.0, 2.0, 5.0, 10.0],
    [0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0],
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Logit original constructor 5" {
  let old = @config.classic_mode()
  defer @config.set_classic_mode(old)
  @config.set_classic_mode(false)
  let locator = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Count(1)),
  )
  assert_eq(locator.minor(), false)
  verify_logit_params_state(
    locator.as_maxn_locator(),
    @ticker.MaxNBins::Count(1),
    false,
    false,
    None,
    2,
    [1.0, 2.0, 5.0, 10.0],
    [0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0],
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Logit original constructor 6" {
  let old = @config.classic_mode()
  defer @config.set_classic_mode(old)
  @config.set_classic_mode(false)
  let locator = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Count(3)),
  )
  assert_eq(locator.minor(), false)
  verify_logit_params_state(
    locator.as_maxn_locator(),
    @ticker.MaxNBins::Count(3),
    false,
    false,
    None,
    2,
    [1.0, 2.0, 5.0, 10.0],
    [0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0],
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Logit original constructor 7" {
  let old = @config.classic_mode()
  defer @config.set_classic_mode(old)
  @config.set_classic_mode(false)
  let locator = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Count(2147483647)),
  )
  assert_eq(locator.minor(), false)
  verify_logit_params_state(
    locator.as_maxn_locator(),
    @ticker.MaxNBins::Count(2147483647),
    false,
    false,
    None,
    2,
    [1.0, 2.0, 5.0, 10.0],
    [0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0],
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Logit original constructor 8" {
  let old = @config.classic_mode()
  defer @config.set_classic_mode(old)
  @config.set_classic_mode(false)
  let locator = @ticker.LogitLocator::new(minor=true)
  assert_eq(locator.minor(), true)
  verify_logit_params_state(
    locator.as_maxn_locator(),
    @ticker.MaxNBins::Auto,
    false,
    false,
    None,
    2,
    [1.0, 2.0, 5.0, 10.0],
    [0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0],
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Logit original constructor 9" {
  let old = @config.classic_mode()
  defer @config.set_classic_mode(old)
  @config.set_classic_mode(false)
  let locator = @ticker.LogitLocator::new(minor=true, nbins=None)
  assert_eq(locator.minor(), true)
  verify_logit_params_state(
    locator.as_maxn_locator(),
    @ticker.MaxNBins::Count(10),
    false,
    false,
    None,
    2,
    [1.0, 2.0, 5.0, 10.0],
    [0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0],
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Logit original constructor 10" {
  let old = @config.classic_mode()
  defer @config.set_classic_mode(old)
  @config.set_classic_mode(false)
  let locator = @ticker.LogitLocator::new(
    minor=true,
    nbins=Some(@ticker.MaxNBins::Auto),
  )
  assert_eq(locator.minor(), true)
  verify_logit_params_state(
    locator.as_maxn_locator(),
    @ticker.MaxNBins::Auto,
    false,
    false,
    None,
    2,
    [1.0, 2.0, 5.0, 10.0],
    [0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0],
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Logit original constructor 11" {
  let old = @config.classic_mode()
  defer @config.set_classic_mode(old)
  @config.set_classic_mode(false)
  let locator = @ticker.LogitLocator::new(
    minor=true,
    nbins=Some(@ticker.MaxNBins::Count(0)),
  )
  assert_eq(locator.minor(), true)
  verify_logit_params_state(
    locator.as_maxn_locator(),
    @ticker.MaxNBins::Count(0),
    false,
    false,
    None,
    2,
    [1.0, 2.0, 5.0, 10.0],
    [0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0],
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Logit original constructor 12" {
  let old = @config.classic_mode()
  defer @config.set_classic_mode(old)
  @config.set_classic_mode(false)
  let locator = @ticker.LogitLocator::new(
    minor=true,
    nbins=Some(@ticker.MaxNBins::Count(-1)),
  )
  assert_eq(locator.minor(), true)
  verify_logit_params_state(
    locator.as_maxn_locator(),
    @ticker.MaxNBins::Count(-1),
    false,
    false,
    None,
    2,
    [1.0, 2.0, 5.0, 10.0],
    [0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0],
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Logit original constructor 13" {
  let old = @config.classic_mode()
  defer @config.set_classic_mode(old)
  @config.set_classic_mode(false)
  let locator = @ticker.LogitLocator::new(
    minor=true,
    nbins=Some(@ticker.MaxNBins::Count(1)),
  )
  assert_eq(locator.minor(), true)
  verify_logit_params_state(
    locator.as_maxn_locator(),
    @ticker.MaxNBins::Count(1),
    false,
    false,
    None,
    2,
    [1.0, 2.0, 5.0, 10.0],
    [0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0],
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Logit original constructor 14" {
  let old = @config.classic_mode()
  defer @config.set_classic_mode(old)
  @config.set_classic_mode(false)
  let locator = @ticker.LogitLocator::new(
    minor=true,
    nbins=Some(@ticker.MaxNBins::Count(3)),
  )
  assert_eq(locator.minor(), true)
  verify_logit_params_state(
    locator.as_maxn_locator(),
    @ticker.MaxNBins::Count(3),
    false,
    false,
    None,
    2,
    [1.0, 2.0, 5.0, 10.0],
    [0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0],
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Logit original constructor 15" {
  let old = @config.classic_mode()
  defer @config.set_classic_mode(old)
  @config.set_classic_mode(false)
  let locator = @ticker.LogitLocator::new(
    minor=true,
    nbins=Some(@ticker.MaxNBins::Count(2147483647)),
  )
  assert_eq(locator.minor(), true)
  verify_logit_params_state(
    locator.as_maxn_locator(),
    @ticker.MaxNBins::Count(2147483647),
    false,
    false,
    None,
    2,
    [1.0, 2.0, 5.0, 10.0],
    [0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0],
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Logit original constructor 16" {
  let old = @config.classic_mode()
  defer @config.set_classic_mode(old)
  @config.set_classic_mode(true)
  let locator = @ticker.LogitLocator::new(minor=false)
  assert_eq(locator.minor(), false)
  verify_logit_params_state(
    locator.as_maxn_locator(),
    @ticker.MaxNBins::Auto,
    false,
    false,
    None,
    2,
    [1.0, 2.0, 5.0, 10.0],
    [0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0],
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Logit original constructor 17" {
  let old = @config.classic_mode()
  defer @config.set_classic_mode(old)
  @config.set_classic_mode(true)
  let locator = @ticker.LogitLocator::new(minor=false, nbins=None)
  assert_eq(locator.minor(), false)
  verify_logit_params_state(
    locator.as_maxn_locator(),
    @ticker.MaxNBins::Count(10),
    false,
    false,
    None,
    2,
    [1.0, 2.0, 5.0, 10.0],
    [0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0],
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Logit original constructor 18" {
  let old = @config.classic_mode()
  defer @config.set_classic_mode(old)
  @config.set_classic_mode(true)
  let locator = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Auto),
  )
  assert_eq(locator.minor(), false)
  verify_logit_params_state(
    locator.as_maxn_locator(),
    @ticker.MaxNBins::Auto,
    false,
    false,
    None,
    2,
    [1.0, 2.0, 5.0, 10.0],
    [0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0],
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Logit original constructor 19" {
  let old = @config.classic_mode()
  defer @config.set_classic_mode(old)
  @config.set_classic_mode(true)
  let locator = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Count(0)),
  )
  assert_eq(locator.minor(), false)
  verify_logit_params_state(
    locator.as_maxn_locator(),
    @ticker.MaxNBins::Count(0),
    false,
    false,
    None,
    2,
    [1.0, 2.0, 5.0, 10.0],
    [0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0],
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Logit original constructor 20" {
  let old = @config.classic_mode()
  defer @config.set_classic_mode(old)
  @config.set_classic_mode(true)
  let locator = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Count(-1)),
  )
  assert_eq(locator.minor(), false)
  verify_logit_params_state(
    locator.as_maxn_locator(),
    @ticker.MaxNBins::Count(-1),
    false,
    false,
    None,
    2,
    [1.0, 2.0, 5.0, 10.0],
    [0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0],
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Logit original constructor 21" {
  let old = @config.classic_mode()
  defer @config.set_classic_mode(old)
  @config.set_classic_mode(true)
  let locator = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Count(1)),
  )
  assert_eq(locator.minor(), false)
  verify_logit_params_state(
    locator.as_maxn_locator(),
    @ticker.MaxNBins::Count(1),
    false,
    false,
    None,
    2,
    [1.0, 2.0, 5.0, 10.0],
    [0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0],
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Logit original constructor 22" {
  let old = @config.classic_mode()
  defer @config.set_classic_mode(old)
  @config.set_classic_mode(true)
  let locator = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Count(3)),
  )
  assert_eq(locator.minor(), false)
  verify_logit_params_state(
    locator.as_maxn_locator(),
    @ticker.MaxNBins::Count(3),
    false,
    false,
    None,
    2,
    [1.0, 2.0, 5.0, 10.0],
    [0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0],
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Logit original constructor 23" {
  let old = @config.classic_mode()
  defer @config.set_classic_mode(old)
  @config.set_classic_mode(true)
  let locator = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Count(2147483647)),
  )
  assert_eq(locator.minor(), false)
  verify_logit_params_state(
    locator.as_maxn_locator(),
    @ticker.MaxNBins::Count(2147483647),
    false,
    false,
    None,
    2,
    [1.0, 2.0, 5.0, 10.0],
    [0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0],
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Logit original constructor 24" {
  let old = @config.classic_mode()
  defer @config.set_classic_mode(old)
  @config.set_classic_mode(true)
  let locator = @ticker.LogitLocator::new(minor=true)
  assert_eq(locator.minor(), true)
  verify_logit_params_state(
    locator.as_maxn_locator(),
    @ticker.MaxNBins::Auto,
    false,
    false,
    None,
    2,
    [1.0, 2.0, 5.0, 10.0],
    [0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0],
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Logit original constructor 25" {
  let old = @config.classic_mode()
  defer @config.set_classic_mode(old)
  @config.set_classic_mode(true)
  let locator = @ticker.LogitLocator::new(minor=true, nbins=None)
  assert_eq(locator.minor(), true)
  verify_logit_params_state(
    locator.as_maxn_locator(),
    @ticker.MaxNBins::Count(10),
    false,
    false,
    None,
    2,
    [1.0, 2.0, 5.0, 10.0],
    [0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0],
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Logit original constructor 26" {
  let old = @config.classic_mode()
  defer @config.set_classic_mode(old)
  @config.set_classic_mode(true)
  let locator = @ticker.LogitLocator::new(
    minor=true,
    nbins=Some(@ticker.MaxNBins::Auto),
  )
  assert_eq(locator.minor(), true)
  verify_logit_params_state(
    locator.as_maxn_locator(),
    @ticker.MaxNBins::Auto,
    false,
    false,
    None,
    2,
    [1.0, 2.0, 5.0, 10.0],
    [0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0],
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Logit original constructor 27" {
  let old = @config.classic_mode()
  defer @config.set_classic_mode(old)
  @config.set_classic_mode(true)
  let locator = @ticker.LogitLocator::new(
    minor=true,
    nbins=Some(@ticker.MaxNBins::Count(0)),
  )
  assert_eq(locator.minor(), true)
  verify_logit_params_state(
    locator.as_maxn_locator(),
    @ticker.MaxNBins::Count(0),
    false,
    false,
    None,
    2,
    [1.0, 2.0, 5.0, 10.0],
    [0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0],
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Logit original constructor 28" {
  let old = @config.classic_mode()
  defer @config.set_classic_mode(old)
  @config.set_classic_mode(true)
  let locator = @ticker.LogitLocator::new(
    minor=true,
    nbins=Some(@ticker.MaxNBins::Count(-1)),
  )
  assert_eq(locator.minor(), true)
  verify_logit_params_state(
    locator.as_maxn_locator(),
    @ticker.MaxNBins::Count(-1),
    false,
    false,
    None,
    2,
    [1.0, 2.0, 5.0, 10.0],
    [0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0],
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Logit original constructor 29" {
  let old = @config.classic_mode()
  defer @config.set_classic_mode(old)
  @config.set_classic_mode(true)
  let locator = @ticker.LogitLocator::new(
    minor=true,
    nbins=Some(@ticker.MaxNBins::Count(1)),
  )
  assert_eq(locator.minor(), true)
  verify_logit_params_state(
    locator.as_maxn_locator(),
    @ticker.MaxNBins::Count(1),
    false,
    false,
    None,
    2,
    [1.0, 2.0, 5.0, 10.0],
    [0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0],
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Logit original constructor 30" {
  let old = @config.classic_mode()
  defer @config.set_classic_mode(old)
  @config.set_classic_mode(true)
  let locator = @ticker.LogitLocator::new(
    minor=true,
    nbins=Some(@ticker.MaxNBins::Count(3)),
  )
  assert_eq(locator.minor(), true)
  verify_logit_params_state(
    locator.as_maxn_locator(),
    @ticker.MaxNBins::Count(3),
    false,
    false,
    None,
    2,
    [1.0, 2.0, 5.0, 10.0],
    [0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0],
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Logit original constructor 31" {
  let old = @config.classic_mode()
  defer @config.set_classic_mode(old)
  @config.set_classic_mode(true)
  let locator = @ticker.LogitLocator::new(
    minor=true,
    nbins=Some(@ticker.MaxNBins::Count(2147483647)),
  )
  assert_eq(locator.minor(), true)
  verify_logit_params_state(
    locator.as_maxn_locator(),
    @ticker.MaxNBins::Count(2147483647),
    false,
    false,
    None,
    2,
    [1.0, 2.0, 5.0, 10.0],
    [0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0],
  )
  assert_eq(locator.warnings(), [])
}

///|
test "Logit original partial update 0" {
  let locator = @ticker.LogitLocator::new()
  locator.set_params()
  assert_eq(locator.minor(), false)
  verify_logit_params_state(
    locator.as_maxn_locator(),
    @ticker.MaxNBins::Auto,
    false,
    false,
    None,
    2,
    [1.0, 2.0, 5.0, 10.0],
    [0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0],
  )
}

///|
test "Logit original partial update 1" {
  let locator = @ticker.LogitLocator::new()
  locator.set_params(minor=None)
  assert_eq(locator.minor(), false)
  verify_logit_params_state(
    locator.as_maxn_locator(),
    @ticker.MaxNBins::Auto,
    false,
    false,
    None,
    2,
    [1.0, 2.0, 5.0, 10.0],
    [0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0],
  )
}

///|
test "Logit original partial update 2" {
  let locator = @ticker.LogitLocator::new()
  locator.set_params(minor=Some(true))
  assert_eq(locator.minor(), true)
  verify_logit_params_state(
    locator.as_maxn_locator(),
    @ticker.MaxNBins::Auto,
    false,
    false,
    None,
    2,
    [1.0, 2.0, 5.0, 10.0],
    [0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0],
  )
}

///|
test "Logit original partial update 3" {
  let locator = @ticker.LogitLocator::new()
  locator.set_params(minor=Some(false), nbins=@ticker.MaxNBins::Count(3))
  assert_eq(locator.minor(), false)
  verify_logit_params_state(
    locator.as_maxn_locator(),
    @ticker.MaxNBins::Count(3),
    false,
    false,
    None,
    2,
    [1.0, 2.0, 5.0, 10.0],
    [0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0],
  )
}

///|
test "Logit original partial update 4" {
  let locator = @ticker.LogitLocator::new()
  locator.set_params(minor=Some(true), steps=None, prune=None)
  assert_eq(locator.minor(), true)
  verify_logit_params_state(
    locator.as_maxn_locator(),
    @ticker.MaxNBins::Auto,
    false,
    false,
    None,
    2,
    [1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0],
    [
      0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
      0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
    ],
  )
}

///|
test "Logit original partial update 5" {
  let locator = @ticker.LogitLocator::new()
  assert_true(
    try {
      ignore(
        locator.set_params(
          minor=Some(true),
          nbins=@ticker.MaxNBins::Count(3),
          symmetric=true,
          prune=Some("bad"),
          min_n_ticks=7,
          steps=Some(@ticker.TickValues::from_array([1.0, 2.0, 10.0])),
          integer=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(locator.minor(), true)
  verify_logit_params_state(
    locator.as_maxn_locator(),
    @ticker.MaxNBins::Count(3),
    false,
    true,
    None,
    2,
    [1.0, 2.0, 5.0, 10.0],
    [0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0],
  )
}

///|
test "Logit original partial update 6" {
  let locator = @ticker.LogitLocator::new()
  assert_true(
    try {
      ignore(
        locator.set_params(
          minor=Some(true),
          nbins=@ticker.MaxNBins::Count(3),
          symmetric=true,
          prune=Some("both"),
          min_n_ticks=7,
          steps=Some(@ticker.TickValues::from_array([2.0, 1.0])),
          integer=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(locator.minor(), true)
  verify_logit_params_state(
    locator.as_maxn_locator(),
    @ticker.MaxNBins::Count(3),
    false,
    true,
    Some("both"),
    7,
    [1.0, 2.0, 5.0, 10.0],
    [0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0],
  )
}

///|
test "Logit original partial update 7" {
  let locator = @ticker.LogitLocator::new()
  assert_true(
    try {
      ignore(
        locator.set_params(
          minor=Some(true),
          steps=Some(@ticker.TickValues::from_array([])),
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(locator.minor(), true)
  verify_logit_params_state(
    locator.as_maxn_locator(),
    @ticker.MaxNBins::Auto,
    false,
    false,
    None,
    2,
    [1.0, 2.0, 5.0, 10.0],
    [0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0],
  )
}

///|
test "Logit original partial update 8" {
  let locator = @ticker.LogitLocator::new()
  locator.set_params(
    minor=Some(true),
    steps=Some(@ticker.TickValues::from_array([1.0])),
  )
  assert_eq(locator.minor(), true)
  verify_logit_params_state(
    locator.as_maxn_locator(),
    @ticker.MaxNBins::Auto,
    false,
    false,
    None,
    2,
    [1.0, 10.0],
    [0.1, 1.0, 10.0, 100.0],
  )
}

///|
test "Logit original partial update 9" {
  let locator = @ticker.LogitLocator::new()
  locator.set_params(
    minor=Some(true),
    steps=Some(@ticker.TickValues::from_array([2.0, 4.0, 8.0])),
    integer=true,
  )
  assert_eq(locator.minor(), true)
  verify_logit_params_state(
    locator.as_maxn_locator(),
    @ticker.MaxNBins::Auto,
    true,
    false,
    None,
    2,
    [1.0, 2.0, 4.0, 8.0, 10.0],
    [0.1, 0.2, 0.4, 0.8, 1.0, 2.0, 4.0, 8.0, 10.0, 20.0],
  )
}

///|
test "Logit original partial update 10" {
  let locator = @ticker.LogitLocator::new()
  locator.set_params(
    minor=Some(true),
    steps=Some(@ticker.TickValues::from_array([1.0, 0.0 / 0.0, 10.0])),
  )
  assert_eq(locator.minor(), true)
  verify_logit_params_state(
    locator.as_maxn_locator(),
    @ticker.MaxNBins::Auto,
    false,
    false,
    None,
    2,
    [1.0, 0.0 / 0.0, 10.0],
    [0.1, 0.0 / 0.0, 1.0, 0.0 / 0.0, 10.0, 0.0 / 0.0],
  )
}

///|
test "Logit original partial update 11" {
  let locator = @ticker.LogitLocator::new()
  locator.set_params(minor=Some(true), min_n_ticks=0)
  assert_eq(locator.minor(), true)
  verify_logit_params_state(
    locator.as_maxn_locator(),
    @ticker.MaxNBins::Auto,
    false,
    false,
    None,
    1,
    [1.0, 2.0, 5.0, 10.0],
    [0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0],
  )
}

///|
test "Logit original partial update 12" {
  let locator = @ticker.LogitLocator::new()
  locator.set_params(minor=Some(true), min_n_ticks=-3)
  assert_eq(locator.minor(), true)
  verify_logit_params_state(
    locator.as_maxn_locator(),
    @ticker.MaxNBins::Auto,
    false,
    false,
    None,
    1,
    [1.0, 2.0, 5.0, 10.0],
    [0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0],
  )
}

///|
test "Logit original partial update 13" {
  let locator = @ticker.LogitLocator::new()
  locator.set_params(minor=Some(true), nbins=@ticker.MaxNBins::Count(0))
  assert_eq(locator.minor(), true)
  verify_logit_params_state(
    locator.as_maxn_locator(),
    @ticker.MaxNBins::Count(0),
    false,
    false,
    None,
    2,
    [1.0, 2.0, 5.0, 10.0],
    [0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0],
  )
}

///|
test "Logit original partial update 14" {
  let locator = @ticker.LogitLocator::new()
  locator.set_params(minor=Some(true), nbins=@ticker.MaxNBins::Count(-1))
  assert_eq(locator.minor(), true)
  verify_logit_params_state(
    locator.as_maxn_locator(),
    @ticker.MaxNBins::Count(-1),
    false,
    false,
    None,
    2,
    [1.0, 2.0, 5.0, 10.0],
    [0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0],
  )
}

///|
test "Logit original partial update 15" {
  let locator = @ticker.LogitLocator::new()
  locator.set_params(prune=Some("upper"), integer=true, symmetric=true)
  assert_eq(locator.minor(), false)
  verify_logit_params_state(
    locator.as_maxn_locator(),
    @ticker.MaxNBins::Auto,
    true,
    true,
    Some("upper"),
    2,
    [1.0, 2.0, 5.0, 10.0],
    [0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0],
  )
}

///|
test "Logit original partial update 16" {
  let locator = @ticker.LogitLocator::new()
  locator.set_params(steps=None)
  assert_eq(locator.minor(), false)
  verify_logit_params_state(
    locator.as_maxn_locator(),
    @ticker.MaxNBins::Auto,
    false,
    false,
    None,
    2,
    [1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0],
    [
      0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
      0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
    ],
  )
}

///|
test "Logit original minor property None keeps" {
  let locator = @ticker.LogitLocator::new()
  locator.set_minor(None)
  assert_eq(locator.minor(), false)
  verify_logit_params_state(
    locator.as_maxn_locator(),
    @ticker.MaxNBins::Auto,
    false,
    false,
    None,
    2,
    [1.0, 2.0, 5.0, 10.0],
    [0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0],
  )
  locator.set_minor(Some(true))
  assert_eq(locator.minor(), true)
  verify_logit_params_state(
    locator.as_maxn_locator(),
    @ticker.MaxNBins::Auto,
    false,
    false,
    None,
    2,
    [1.0, 2.0, 5.0, 10.0],
    [0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0],
  )
  locator.set_minor(None)
  assert_eq(locator.minor(), true)
  verify_logit_params_state(
    locator.as_maxn_locator(),
    @ticker.MaxNBins::Auto,
    false,
    false,
    None,
    2,
    [1.0, 2.0, 5.0, 10.0],
    [0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0],
  )
  locator.set_minor(Some(false))
  assert_eq(locator.minor(), false)
  verify_logit_params_state(
    locator.as_maxn_locator(),
    @ticker.MaxNBins::Auto,
    false,
    false,
    None,
    2,
    [1.0, 2.0, 5.0, 10.0],
    [0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0],
  )
}

///|
test "Logit original shared inherited steps float signed" {
  let owner = [10.0, 5.0, 2.0, 1.0]
  let locator = @ticker.LogitLocator::new()
  locator.set_params(
    steps=Some(@ticker.TickValues::from_array(owner).view(-1, -1, 4)),
  )
  let shallow = locator.copy()
  assert_eq(locator.minor(), false)
  verify_logit_params_state(
    locator.as_maxn_locator(),
    @ticker.MaxNBins::Auto,
    false,
    false,
    None,
    2,
    [1.0, 2.0, 5.0, 10.0],
    [0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0],
  )
  owner[3] = 1.25
  locator.as_maxn_locator().steps().set(1, 3.75)
  assert_eq(locator.minor(), false)
  verify_logit_params_state(
    locator.as_maxn_locator(),
    @ticker.MaxNBins::Auto,
    false,
    false,
    None,
    2,
    [1.25, 3.75, 5.0, 10.0],
    [0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0],
  )
  assert_eq(shallow.minor(), false)
  verify_logit_params_state(
    shallow.as_maxn_locator(),
    @ticker.MaxNBins::Auto,
    false,
    false,
    None,
    2,
    [1.25, 3.75, 5.0, 10.0],
    [0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0],
  )
  verify_logit_params_values(owner, [10.0, 5.0, 3.75, 1.25])
  shallow.set_params(
    minor=Some(true),
    nbins=@ticker.MaxNBins::Count(4),
    steps=None,
  )
  assert_eq(locator.minor(), false)
  verify_logit_params_state(
    locator.as_maxn_locator(),
    @ticker.MaxNBins::Auto,
    false,
    false,
    None,
    2,
    [1.25, 3.75, 5.0, 10.0],
    [0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0],
  )
  assert_eq(shallow.minor(), true)
  verify_logit_params_state(
    shallow.as_maxn_locator(),
    @ticker.MaxNBins::Count(4),
    false,
    false,
    None,
    2,
    [1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0],
    [
      0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
      0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
    ],
  )
}

///|
test "Logit original shared inherited steps integer signed" {
  let owner = [10L, 5L, 2L, 1L]
  let locator = @ticker.LogitLocator::new()
  locator.set_params(
    steps=Some(@ticker.TickValues::from_int64_array(owner).view(-1, -1, 4)),
  )
  let shallow = locator.copy()
  assert_eq(locator.minor(), false)
  verify_logit_params_state(
    locator.as_maxn_locator(),
    @ticker.MaxNBins::Auto,
    false,
    false,
    None,
    2,
    [1.0, 2.0, 5.0, 10.0],
    [0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0],
  )
  owner[3] = 1L
  locator.as_maxn_locator().steps().set(1, 3.75)
  assert_eq(locator.minor(), false)
  verify_logit_params_state(
    locator.as_maxn_locator(),
    @ticker.MaxNBins::Auto,
    false,
    false,
    None,
    2,
    [1.0, 3.0, 5.0, 10.0],
    [0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0],
  )
  assert_eq(shallow.minor(), false)
  verify_logit_params_state(
    shallow.as_maxn_locator(),
    @ticker.MaxNBins::Auto,
    false,
    false,
    None,
    2,
    [1.0, 3.0, 5.0, 10.0],
    [0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0],
  )
  assert_eq(owner, [10L, 5L, 3L, 1L])
  shallow.set_params(
    minor=Some(true),
    nbins=@ticker.MaxNBins::Count(4),
    steps=None,
  )
  assert_eq(locator.minor(), false)
  verify_logit_params_state(
    locator.as_maxn_locator(),
    @ticker.MaxNBins::Auto,
    false,
    false,
    None,
    2,
    [1.0, 3.0, 5.0, 10.0],
    [0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0],
  )
  assert_eq(shallow.minor(), true)
  verify_logit_params_state(
    shallow.as_maxn_locator(),
    @ticker.MaxNBins::Count(4),
    false,
    false,
    None,
    2,
    [1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0],
    [
      0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
      0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
    ],
  )
}

///|
test "Logit original shared inherited steps float normalized copy" {
  let owner = [2.0, 4.0, 8.0]
  let locator = @ticker.LogitLocator::new()
  locator.set_params(steps=Some(@ticker.TickValues::from_array(owner)))
  let shallow = locator.copy()
  assert_eq(locator.minor(), false)
  verify_logit_params_state(
    locator.as_maxn_locator(),
    @ticker.MaxNBins::Auto,
    false,
    false,
    None,
    2,
    [1.0, 2.0, 4.0, 8.0, 10.0],
    [0.1, 0.2, 0.4, 0.8, 1.0, 2.0, 4.0, 8.0, 10.0, 20.0],
  )
  owner[0] = 1.25
  locator.as_maxn_locator().steps().set(1, 3.75)
  assert_eq(locator.minor(), false)
  verify_logit_params_state(
    locator.as_maxn_locator(),
    @ticker.MaxNBins::Auto,
    false,
    false,
    None,
    2,
    [1.0, 3.75, 4.0, 8.0, 10.0],
    [0.1, 0.2, 0.4, 0.8, 1.0, 2.0, 4.0, 8.0, 10.0, 20.0],
  )
  assert_eq(shallow.minor(), false)
  verify_logit_params_state(
    shallow.as_maxn_locator(),
    @ticker.MaxNBins::Auto,
    false,
    false,
    None,
    2,
    [1.0, 3.75, 4.0, 8.0, 10.0],
    [0.1, 0.2, 0.4, 0.8, 1.0, 2.0, 4.0, 8.0, 10.0, 20.0],
  )
  verify_logit_params_values(owner, [1.25, 4.0, 8.0])
  shallow.set_params(
    minor=Some(true),
    nbins=@ticker.MaxNBins::Count(4),
    steps=None,
  )
  assert_eq(locator.minor(), false)
  verify_logit_params_state(
    locator.as_maxn_locator(),
    @ticker.MaxNBins::Auto,
    false,
    false,
    None,
    2,
    [1.0, 3.75, 4.0, 8.0, 10.0],
    [0.1, 0.2, 0.4, 0.8, 1.0, 2.0, 4.0, 8.0, 10.0, 20.0],
  )
  assert_eq(shallow.minor(), true)
  verify_logit_params_state(
    shallow.as_maxn_locator(),
    @ticker.MaxNBins::Count(4),
    false,
    false,
    None,
    2,
    [1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0],
    [
      0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
      0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
    ],
  )
}

///|
test "Logit original shared inherited steps integer normalized copy" {
  let owner = [2L, 4L, 8L]
  let locator = @ticker.LogitLocator::new()
  locator.set_params(steps=Some(@ticker.TickValues::from_int64_array(owner)))
  let shallow = locator.copy()
  assert_eq(locator.minor(), false)
  verify_logit_params_state(
    locator.as_maxn_locator(),
    @ticker.MaxNBins::Auto,
    false,
    false,
    None,
    2,
    [1.0, 2.0, 4.0, 8.0, 10.0],
    [0.1, 0.2, 0.4, 0.8, 1.0, 2.0, 4.0, 8.0, 10.0, 20.0],
  )
  owner[0] = 1L
  locator.as_maxn_locator().steps().set(1, 3.75)
  assert_eq(locator.minor(), false)
  verify_logit_params_state(
    locator.as_maxn_locator(),
    @ticker.MaxNBins::Auto,
    false,
    false,
    None,
    2,
    [1.0, 3.0, 4.0, 8.0, 10.0],
    [0.1, 0.2, 0.4, 0.8, 1.0, 2.0, 4.0, 8.0, 10.0, 20.0],
  )
  assert_eq(shallow.minor(), false)
  verify_logit_params_state(
    shallow.as_maxn_locator(),
    @ticker.MaxNBins::Auto,
    false,
    false,
    None,
    2,
    [1.0, 3.0, 4.0, 8.0, 10.0],
    [0.1, 0.2, 0.4, 0.8, 1.0, 2.0, 4.0, 8.0, 10.0, 20.0],
  )
  assert_eq(owner, [1L, 4L, 8L])
  shallow.set_params(
    minor=Some(true),
    nbins=@ticker.MaxNBins::Count(4),
    steps=None,
  )
  assert_eq(locator.minor(), false)
  verify_logit_params_state(
    locator.as_maxn_locator(),
    @ticker.MaxNBins::Auto,
    false,
    false,
    None,
    2,
    [1.0, 3.0, 4.0, 8.0, 10.0],
    [0.1, 0.2, 0.4, 0.8, 1.0, 2.0, 4.0, 8.0, 10.0, 20.0],
  )
  assert_eq(shallow.minor(), true)
  verify_logit_params_state(
    shallow.as_maxn_locator(),
    @ticker.MaxNBins::Count(4),
    false,
    false,
    None,
    2,
    [1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0],
    [
      0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
      0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
    ],
  )
}

///|
test "Logit original context and range 0" {
  let old = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old)
  @config.set_axes_autolimit_mode("data")
  let events : Array[String] = []
  let locator = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Auto),
  )
  let (lower, upper) = locator.nonsingular(0.0, 0.0)
  verify_logit_params_values([lower, upper], [1.0e-07, 0.9999999])
  assert_eq(locator.warnings(), [
    "Data has no values between 0 and 1, and therefore cannot be logit-scaled.",
  ])
  assert_eq(events, [])
}

///|
test "Logit original context and range 1" {
  let old = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old)
  @config.set_axes_autolimit_mode("data")
  let events : Array[String] = []
  let locator = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Auto),
  )
  let (lower, upper) = locator.nonsingular(1.0, 1.0)
  verify_logit_params_values([lower, upper], [1.0e-07, 0.9999999])
  assert_eq(locator.warnings(), [
    "Data has no values between 0 and 1, and therefore cannot be logit-scaled.",
  ])
  assert_eq(events, [])
}

///|
test "Logit original context and range 2" {
  let old = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old)
  @config.set_axes_autolimit_mode("data")
  let events : Array[String] = []
  let locator = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Auto),
  )
  let (lower, upper) = locator.nonsingular(-2.0, -1.0)
  verify_logit_params_values([lower, upper], [1.0e-07, 0.9999999])
  assert_eq(locator.warnings(), [
    "Data has no values between 0 and 1, and therefore cannot be logit-scaled.",
  ])
  assert_eq(events, [])
}

///|
test "Logit original context and range 3" {
  let old = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old)
  @config.set_axes_autolimit_mode("data")
  let events : Array[String] = []
  let locator = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Auto),
  )
  let (lower, upper) = locator.nonsingular(1.0, 2.0)
  verify_logit_params_values([lower, upper], [1.0e-07, 0.9999999])
  assert_eq(locator.warnings(), [
    "Data has no values between 0 and 1, and therefore cannot be logit-scaled.",
  ])
  assert_eq(events, [])
}

///|
test "Logit original context and range 4" {
  let old = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old)
  @config.set_axes_autolimit_mode("data")
  let events : Array[String] = []
  let locator = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Auto),
  )
  let (lower, upper) = locator.nonsingular(0.0 / 0.0, 0.8)
  verify_logit_params_values([lower, upper], [1.0e-07, 0.9999999])
  assert_eq(locator.warnings(), [])
  assert_eq(events, [])
}

///|
test "Logit original context and range 5" {
  let old = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old)
  @config.set_axes_autolimit_mode("data")
  let events : Array[String] = []
  let locator = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Auto),
  )
  let (lower, upper) = locator.nonsingular(-1.0 / 0.0, 1.0 / 0.0)
  verify_logit_params_values([lower, upper], [1.0e-07, 0.9999999])
  assert_eq(locator.warnings(), [])
  assert_eq(events, [])
}

///|
test "Logit original context and range 6" {
  let old = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old)
  @config.set_axes_autolimit_mode("data")
  let events : Array[String] = []
  let locator = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Auto),
  )
  let (lower, upper) = locator.nonsingular(0.2, 0.8)
  verify_logit_params_values([lower, upper], [0.2, 0.8])
  assert_eq(locator.warnings(), [])
  assert_eq(events, [])
}

///|
test "Logit original context and range 7" {
  let old = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old)
  @config.set_axes_autolimit_mode("data")
  let events : Array[String] = []
  let locator = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Auto),
  )
  let (lower, upper) = locator.nonsingular(0.5, 0.5)
  verify_logit_params_values([lower, upper], [0.05, 0.95])
  assert_eq(locator.warnings(), [])
  assert_eq(events, [])
}

///|
test "Logit original context and range 8" {
  let old = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old)
  @config.set_axes_autolimit_mode("data")
  let events : Array[String] = []
  let locator = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Auto),
  )
  let (lower, upper) = locator.nonsingular(0.0, 1.0)
  verify_logit_params_values([lower, upper], [1.0e-07, 0.9999999])
  assert_eq(locator.warnings(), [])
  assert_eq(events, [])
}

///|
test "Logit original context and range 9" {
  let old = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old)
  @config.set_axes_autolimit_mode("data")
  let events : Array[String] = []
  let locator = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Auto),
  )
  let (lower, upper) = locator.nonsingular(0.8, 0.2)
  verify_logit_params_values([lower, upper], [0.2, 0.8])
  assert_eq(locator.warnings(), [])
  assert_eq(events, [])
}

///|
test "Logit original context and range 10" {
  let old = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old)
  @config.set_axes_autolimit_mode("data")
  let events : Array[String] = []
  let locator = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Auto),
  )
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.0
  })
  let (lower, upper) = locator.nonsingular(0.0, 1.0)
  verify_logit_params_values([lower, upper], [0.0, 1.0])
  assert_eq(locator.warnings(), [])
  assert_eq(events, ["minpos"])
}

///|
test "Logit original context and range 11" {
  let old = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old)
  @config.set_axes_autolimit_mode("data")
  let events : Array[String] = []
  let locator = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Auto),
  )
  locator.bind_minpos(fn() {
    events.push("minpos")
    -0.1
  })
  let (lower, upper) = locator.nonsingular(0.0, 1.0)
  verify_logit_params_values([lower, upper], [-0.1, 1.1])
  assert_eq(locator.warnings(), [])
  assert_eq(events, ["minpos"])
}

///|
test "Logit original context and range 12" {
  let old = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old)
  @config.set_axes_autolimit_mode("data")
  let events : Array[String] = []
  let locator = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Auto),
  )
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  let (lower, upper) = locator.nonsingular(0.0, 1.0)
  verify_logit_params_values([lower, upper], [0.01, 0.99])
  assert_eq(locator.warnings(), [])
  assert_eq(events, ["minpos"])
}

///|
test "Logit original context and range 13" {
  let old = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old)
  @config.set_axes_autolimit_mode("data")
  let events : Array[String] = []
  let locator = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Auto),
  )
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.0 / 0.0
  })
  let (lower, upper) = locator.nonsingular(0.0, 1.0)
  verify_logit_params_values([lower, upper], [1.0e-07, 0.9999999])
  assert_eq(locator.warnings(), [])
  assert_eq(events, ["minpos"])
}

///|
test "Logit original context and range 14" {
  let old = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old)
  @config.set_axes_autolimit_mode("data")
  let events : Array[String] = []
  let locator = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Auto),
  )
  locator.bind_minpos(fn() {
    events.push("minpos")
    1.0 / 0.0
  })
  let (lower, upper) = locator.nonsingular(0.0, 1.0)
  verify_logit_params_values([lower, upper], [1.0e-07, 0.9999999])
  assert_eq(locator.warnings(), [])
  assert_eq(events, ["minpos"])
}

///|
test "Logit original context and range 15" {
  let old = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old)
  @config.set_axes_autolimit_mode("data")
  let events : Array[String] = []
  let locator = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Auto),
  )
  locator.bind_minpos(fn() {
    events.push("minpos")
    -1.0 / 0.0
  })
  let (lower, upper) = locator.nonsingular(0.0, 1.0)
  verify_logit_params_values([lower, upper], [1.0e-07, 0.9999999])
  assert_eq(locator.warnings(), [])
  assert_eq(events, ["minpos"])
}

///|
test "Logit original context and range 16" {
  let old = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old)
  @config.set_axes_autolimit_mode("data")
  let events : Array[String] = []
  let locator = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Auto),
  )
  locator.bind_minpos(fn() {
    events.push("minpos")
    1.0
  })
  let (lower, upper) = locator.nonsingular(0.0, 1.0)
  verify_logit_params_values([lower, upper], [1.0, 0.0])
  assert_eq(locator.warnings(), [])
  assert_eq(events, ["minpos"])
}

///|
test "Logit original context and range 17" {
  let old = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old)
  @config.set_axes_autolimit_mode("data")
  let events : Array[String] = []
  let locator = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Auto),
  )
  locator.bind_minpos(fn() {
    events.push("minpos")
    2.0
  })
  let (lower, upper) = locator.nonsingular(0.0, 1.0)
  verify_logit_params_values([lower, upper], [2.0, -1.0])
  assert_eq(locator.warnings(), [])
  assert_eq(events, ["minpos"])
}

///|
test "Logit original context and range 18" {
  let old = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old)
  @config.set_axes_autolimit_mode("data")
  let events : Array[String] = []
  let locator = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Auto),
  )
  locator.bind_projection(fn() {
    events.push("projection")
    "rectilinear"
  })
  assert_true(
    try {
      ignore(locator.nonsingular(0.2, 0.8))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(locator.warnings(), [])
  assert_eq(events, [])
}

///|
test "Logit original context and range 19" {
  let old = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old)
  @config.set_axes_autolimit_mode("data")
  let events : Array[String] = []
  let locator = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Auto),
  )
  locator.bind_projection(fn() {
    events.push("projection")
    "rectilinear"
  })
  let (lower, upper) = locator.nonsingular(0.0 / 0.0, 0.8)
  verify_logit_params_values([lower, upper], [1.0e-07, 0.9999999])
  assert_eq(locator.warnings(), [])
  assert_eq(events, [])
}

///|
test "Logit original context and range 20" {
  let old = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old)
  @config.set_axes_autolimit_mode("data")
  let events : Array[String] = []
  let locator = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Auto),
  )
  locator.bind_projection(fn() {
    events.push("projection")
    "rectilinear"
  })
  let (lower, upper) = locator.nonsingular(-2.0, -1.0)
  verify_logit_params_values([lower, upper], [1.0e-07, 0.9999999])
  assert_eq(locator.warnings(), [
    "Data has no values between 0 and 1, and therefore cannot be logit-scaled.",
  ])
  assert_eq(events, [])
}

///|
test "Logit original context and range 21" {
  let old = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old)
  @config.set_axes_autolimit_mode("data")
  let events : Array[String] = []
  let locator = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Auto),
  )
  locator.bind_tick_space(fn() {
    events.push("space")
    9.0
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_view_interval(fn() {
    events.push("view")
    (0.01, 0.99)
  })
  locator.bind_projection(fn() {
    events.push("projection")
    "rectilinear"
  })
  verify_logit_params_values(locator.tick_values(0.01, 0.99), [
    0.01, 0.1, 0.5, 0.9, 0.99,
  ])
  assert_eq(locator.warnings(), [])
  assert_eq(events, ["projection", "space", "minpos"])
}

///|
test "Logit original context and range 22" {
  let old = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old)
  @config.set_axes_autolimit_mode("data")
  let events : Array[String] = []
  let locator = @ticker.LogitLocator::new(
    minor=true,
    nbins=Some(@ticker.MaxNBins::Auto),
  )
  locator.bind_tick_space(fn() {
    events.push("space")
    9.0
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_view_interval(fn() {
    events.push("view")
    (0.01, 0.99)
  })
  locator.bind_projection(fn() {
    events.push("projection")
    "rectilinear"
  })
  verify_logit_params_values(locator.tick_values(0.4, 0.6), [])
  assert_eq(locator.warnings(), [])
  assert_eq(events, ["projection", "space", "minpos"])
}

///|
test "Logit original context and range 23" {
  let old = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old)
  @config.set_axes_autolimit_mode("data")
  let events : Array[String] = []
  let locator = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Auto),
  )
  locator.bind_tick_space(fn() {
    events.push("space")
    9.0
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_view_interval(fn() {
    events.push("view")
    (0.01, 0.99)
  })
  locator.bind_projection(fn() {
    events.push("projection")
    "rectilinear"
  })
  verify_logit_params_values(locator.tick_values(0.4, 0.6), [
    0.4, 0.45, 0.5, 0.55, 0.6000000000000001,
  ])
  assert_eq(locator.warnings(), [])
  assert_eq(events, ["projection", "space", "minpos", "space", "projection"])
}

///|
test "Logit original context and range 24" {
  let old = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old)
  @config.set_axes_autolimit_mode("data")
  let events : Array[String] = []
  let locator = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Count(4)),
  )
  locator.bind_tick_space(fn() {
    events.push("space")
    9.0
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_view_interval(fn() {
    events.push("view")
    (0.01, 0.99)
  })
  locator.bind_projection(fn() {
    events.push("projection")
    "rectilinear"
  })
  verify_logit_params_values(locator.tick_values(0.4, 0.6), [
    0.4, 0.45, 0.5, 0.55, 0.6000000000000001,
  ])
  assert_eq(locator.warnings(), [])
  assert_eq(events, ["projection", "minpos", "projection"])
}

///|
test "Logit original context and range 25" {
  let old = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old)
  @config.set_axes_autolimit_mode("data")
  let events : Array[String] = []
  let locator = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Auto),
  )
  locator.bind_tick_space(fn() {
    events.push("space")
    9.0
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_view_interval(fn() {
    events.push("view")
    (0.01, 0.99)
  })
  locator.bind_projection(fn() {
    events.push("projection")
    "rectilinear"
  })
  verify_logit_params_values(locator.call(), [0.01, 0.1, 0.5, 0.9, 0.99])
  assert_eq(locator.warnings(), [])
  assert_eq(events, ["view", "projection", "space", "minpos"])
}

///|
test "Logit original context and range 26" {
  let old = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old)
  @config.set_axes_autolimit_mode("data")
  let events : Array[String] = []
  let locator = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Auto),
  )
  locator.bind_tick_space(fn() {
    events.push("space")
    9.0
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_view_interval(fn() {
    events.push("view")
    (0.01, 0.99)
  })
  locator.bind_projection(fn() {
    events.push("projection")
    "rectilinear"
  })
  let (lower, upper) = locator.view_limits(0.4, 0.6)
  verify_logit_params_values([lower, upper], [0.4, 0.6])
  assert_eq(locator.warnings(), [])
  assert_eq(events, [])
}

///|
test "Logit original context and range 27" {
  let old = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old)
  @config.set_axes_autolimit_mode("round_numbers")
  let events : Array[String] = []
  let locator = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Auto),
  )
  locator.bind_tick_space(fn() {
    events.push("space")
    9.0
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_view_interval(fn() {
    events.push("view")
    (0.01, 0.99)
  })
  locator.bind_projection(fn() {
    events.push("projection")
    "rectilinear"
  })
  let (lower, upper) = locator.view_limits(0.4, 0.6)
  verify_logit_params_values([lower, upper], [0.4, 0.6000000000000001])
  assert_eq(locator.warnings(), [])
  assert_eq(events, ["space", "projection"])
}

///|
test "Logit original context and range 28" {
  let old = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old)
  @config.set_axes_autolimit_mode("data")
  let events : Array[String] = []
  let locator = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Auto),
  )
  locator.bind_tick_space(fn() {
    events.push("space")
    9.0
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_view_interval(fn() {
    events.push("view")
    (0.01, 0.99)
  })
  locator.bind_projection(fn() {
    events.push("projection")
    "polar"
  })
  assert_true(
    try {
      ignore(locator.tick_values(0.01, 0.99))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(locator.warnings(), [])
  assert_eq(events, ["projection"])
}

///|
test "Logit original context and range 29" {
  let old = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old)
  @config.set_axes_autolimit_mode("data")
  let events : Array[String] = []
  let locator = @ticker.LogitLocator::new(
    minor=true,
    nbins=Some(@ticker.MaxNBins::Auto),
  )
  locator.bind_tick_space(fn() {
    events.push("space")
    9.0
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_view_interval(fn() {
    events.push("view")
    (0.01, 0.99)
  })
  locator.bind_projection(fn() {
    events.push("projection")
    "polar"
  })
  assert_true(
    try {
      ignore(locator.tick_values(0.4, 0.6))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(locator.warnings(), [])
  assert_eq(events, ["projection"])
}

///|
test "Logit original context and range 30" {
  let old = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old)
  @config.set_axes_autolimit_mode("data")
  let events : Array[String] = []
  let locator = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Auto),
  )
  locator.bind_tick_space(fn() {
    events.push("space")
    9.0
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_view_interval(fn() {
    events.push("view")
    (0.01, 0.99)
  })
  locator.bind_projection(fn() {
    events.push("projection")
    "polar"
  })
  assert_true(
    try {
      ignore(locator.tick_values(0.4, 0.6))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(locator.warnings(), [])
  assert_eq(events, ["projection"])
}

///|
test "Logit original context and range 31" {
  let old = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old)
  @config.set_axes_autolimit_mode("data")
  let events : Array[String] = []
  let locator = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Count(4)),
  )
  locator.bind_tick_space(fn() {
    events.push("space")
    9.0
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_view_interval(fn() {
    events.push("view")
    (0.01, 0.99)
  })
  locator.bind_projection(fn() {
    events.push("projection")
    "polar"
  })
  assert_true(
    try {
      ignore(locator.tick_values(0.4, 0.6))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(locator.warnings(), [])
  assert_eq(events, ["projection"])
}

///|
test "Logit original context and range 32" {
  let old = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old)
  @config.set_axes_autolimit_mode("data")
  let events : Array[String] = []
  let locator = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Auto),
  )
  locator.bind_tick_space(fn() {
    events.push("space")
    9.0
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_view_interval(fn() {
    events.push("view")
    (0.01, 0.99)
  })
  locator.bind_projection(fn() {
    events.push("projection")
    "polar"
  })
  assert_true(
    try {
      ignore(locator.call())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(locator.warnings(), [])
  assert_eq(events, ["view", "projection"])
}

///|
test "Logit original context and range 33" {
  let old = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old)
  @config.set_axes_autolimit_mode("data")
  let events : Array[String] = []
  let locator = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Auto),
  )
  locator.bind_tick_space(fn() {
    events.push("space")
    9.0
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_view_interval(fn() {
    events.push("view")
    (0.01, 0.99)
  })
  locator.bind_projection(fn() {
    events.push("projection")
    "polar"
  })
  let (lower, upper) = locator.view_limits(0.4, 0.6)
  verify_logit_params_values([lower, upper], [0.4, 0.6])
  assert_eq(locator.warnings(), [])
  assert_eq(events, [])
}

///|
test "Logit original context and range 34" {
  let old = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old)
  @config.set_axes_autolimit_mode("round_numbers")
  let events : Array[String] = []
  let locator = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Auto),
  )
  locator.bind_tick_space(fn() {
    events.push("space")
    9.0
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_view_interval(fn() {
    events.push("view")
    (0.01, 0.99)
  })
  locator.bind_projection(fn() {
    events.push("projection")
    "polar"
  })
  let (lower, upper) = locator.view_limits(0.4, 0.6)
  verify_logit_params_values([lower, upper], [0.4, 0.6000000000000001])
  assert_eq(locator.warnings(), [])
  assert_eq(events, ["space", "projection"])
}

///|
test "Logit original context and range 35" {
  let old = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old)
  @config.set_axes_autolimit_mode("data")
  let events : Array[String] = []
  let locator = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Auto),
  )
  locator.bind_tick_space(fn() {
    events.push("space")
    9.0
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_view_interval(fn() {
    events.push("view")
    (0.01, 0.99)
  })
  locator.bind_projection(fn() {
    events.push("projection")
    "3d"
  })
  verify_logit_params_values(locator.tick_values(0.01, 0.99), [
    0.01, 0.1, 0.5, 0.9, 0.99,
  ])
  assert_eq(locator.warnings(), [])
  assert_eq(events, ["projection", "space", "minpos"])
}

///|
test "Logit original context and range 36" {
  let old = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old)
  @config.set_axes_autolimit_mode("data")
  let events : Array[String] = []
  let locator = @ticker.LogitLocator::new(
    minor=true,
    nbins=Some(@ticker.MaxNBins::Auto),
  )
  locator.bind_tick_space(fn() {
    events.push("space")
    9.0
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_view_interval(fn() {
    events.push("view")
    (0.01, 0.99)
  })
  locator.bind_projection(fn() {
    events.push("projection")
    "3d"
  })
  verify_logit_params_values(locator.tick_values(0.4, 0.6), [])
  assert_eq(locator.warnings(), [])
  assert_eq(events, ["projection", "space", "minpos"])
}

///|
test "Logit original context and range 37" {
  let old = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old)
  @config.set_axes_autolimit_mode("data")
  let events : Array[String] = []
  let locator = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Auto),
  )
  locator.bind_tick_space(fn() {
    events.push("space")
    9.0
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_view_interval(fn() {
    events.push("view")
    (0.01, 0.99)
  })
  locator.bind_projection(fn() {
    events.push("projection")
    "3d"
  })
  verify_logit_params_values(locator.tick_values(0.4, 0.6), [
    0.4, 0.45, 0.5, 0.55, 0.6000000000000001,
  ])
  assert_eq(locator.warnings(), [])
  assert_eq(events, ["projection", "space", "minpos", "space", "projection"])
}

///|
test "Logit original context and range 38" {
  let old = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old)
  @config.set_axes_autolimit_mode("data")
  let events : Array[String] = []
  let locator = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Count(4)),
  )
  locator.bind_tick_space(fn() {
    events.push("space")
    9.0
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_view_interval(fn() {
    events.push("view")
    (0.01, 0.99)
  })
  locator.bind_projection(fn() {
    events.push("projection")
    "3d"
  })
  verify_logit_params_values(locator.tick_values(0.4, 0.6), [
    0.4, 0.45, 0.5, 0.55, 0.6000000000000001,
  ])
  assert_eq(locator.warnings(), [])
  assert_eq(events, ["projection", "minpos", "projection"])
}

///|
test "Logit original context and range 39" {
  let old = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old)
  @config.set_axes_autolimit_mode("data")
  let events : Array[String] = []
  let locator = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Auto),
  )
  locator.bind_tick_space(fn() {
    events.push("space")
    9.0
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_view_interval(fn() {
    events.push("view")
    (0.01, 0.99)
  })
  locator.bind_projection(fn() {
    events.push("projection")
    "3d"
  })
  verify_logit_params_values(locator.call(), [0.01, 0.1, 0.5, 0.9, 0.99])
  assert_eq(locator.warnings(), [])
  assert_eq(events, ["view", "projection", "space", "minpos"])
}

///|
test "Logit original context and range 40" {
  let old = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old)
  @config.set_axes_autolimit_mode("data")
  let events : Array[String] = []
  let locator = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Auto),
  )
  locator.bind_tick_space(fn() {
    events.push("space")
    9.0
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_view_interval(fn() {
    events.push("view")
    (0.01, 0.99)
  })
  locator.bind_projection(fn() {
    events.push("projection")
    "3d"
  })
  let (lower, upper) = locator.view_limits(0.4, 0.6)
  verify_logit_params_values([lower, upper], [0.4, 0.6])
  assert_eq(locator.warnings(), [])
  assert_eq(events, [])
}

///|
test "Logit original context and range 41" {
  let old = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old)
  @config.set_axes_autolimit_mode("round_numbers")
  let events : Array[String] = []
  let locator = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Auto),
  )
  locator.bind_tick_space(fn() {
    events.push("space")
    9.0
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_view_interval(fn() {
    events.push("view")
    (0.01, 0.99)
  })
  locator.bind_projection(fn() {
    events.push("projection")
    "3d"
  })
  let (lower, upper) = locator.view_limits(0.4, 0.6)
  verify_logit_params_values([lower, upper], [0.4, 0.6000000000000001])
  assert_eq(locator.warnings(), [])
  assert_eq(events, ["space", "projection"])
}

///|
test "Logit original context and range 42" {
  let old = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old)
  @config.set_axes_autolimit_mode("data")
  let events : Array[String] = []
  let locator = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Auto),
  )
  locator.bind_tick_space(fn() {
    events.push("space")
    0.0
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  verify_logit_params_values(locator.tick_values(0.01, 0.99), [0.01, 0.5, 0.99])
  assert_eq(locator.warnings(), [])
  assert_eq(events, ["space", "minpos"])
}

///|
test "Logit original context and range 43" {
  let old = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old)
  @config.set_axes_autolimit_mode("data")
  let events : Array[String] = []
  let locator = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Auto),
  )
  locator.bind_tick_space(fn() {
    events.push("space")
    0.0
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  verify_logit_params_values(locator.tick_values(0.4, 0.6), [
    0.4, 0.5, 0.6000000000000001,
  ])
  assert_eq(locator.warnings(), [])
  assert_eq(events, ["space", "minpos", "space"])
}

///|
test "Logit original context and range 44" {
  let old = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old)
  @config.set_axes_autolimit_mode("data")
  let events : Array[String] = []
  let locator = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Auto),
  )
  locator.bind_tick_space(fn() {
    events.push("space")
    2.5
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  verify_logit_params_values(locator.tick_values(0.01, 0.99), [0.01, 0.5, 0.99])
  assert_eq(locator.warnings(), [])
  assert_eq(events, ["space", "minpos"])
}

///|
test "Logit original context and range 45" {
  let old = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old)
  @config.set_axes_autolimit_mode("data")
  let events : Array[String] = []
  let locator = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Auto),
  )
  locator.bind_tick_space(fn() {
    events.push("space")
    2.5
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  verify_logit_params_values(locator.tick_values(0.4, 0.6), [
    0.4, 0.5, 0.6000000000000001,
  ])
  assert_eq(locator.warnings(), [])
  assert_eq(events, ["space", "minpos", "space"])
}

///|
test "Logit original context and range 46" {
  let old = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old)
  @config.set_axes_autolimit_mode("data")
  let events : Array[String] = []
  let locator = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Auto),
  )
  locator.bind_tick_space(fn() {
    events.push("space")
    100.0
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  verify_logit_params_values(locator.tick_values(0.01, 0.99), [
    0.01, 0.1, 0.5, 0.9, 0.99,
  ])
  assert_eq(locator.warnings(), [])
  assert_eq(events, ["space", "minpos"])
}

///|
test "Logit original context and range 47" {
  let old = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old)
  @config.set_axes_autolimit_mode("data")
  let events : Array[String] = []
  let locator = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Auto),
  )
  locator.bind_tick_space(fn() {
    events.push("space")
    100.0
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  verify_logit_params_values(locator.tick_values(0.4, 0.6), [
    0.4, 0.45, 0.5, 0.55, 0.6000000000000001,
  ])
  assert_eq(locator.warnings(), [])
  assert_eq(events, ["space", "minpos", "space"])
}

///|
test "Logit original context and range 48" {
  let old = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old)
  @config.set_axes_autolimit_mode("data")
  let events : Array[String] = []
  let locator = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Auto),
  )
  locator.bind_tick_space(fn() {
    events.push("space")
    0.0 / 0.0
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  verify_logit_params_values(locator.tick_values(0.01, 0.99), [
    0.01, 0.1, 0.5, 0.9, 0.99,
  ])
  assert_eq(locator.warnings(), [])
  assert_eq(events, ["space", "minpos"])
}

///|
test "Logit original context and range 49" {
  let old = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old)
  @config.set_axes_autolimit_mode("data")
  let events : Array[String] = []
  let locator = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Auto),
  )
  locator.bind_tick_space(fn() {
    events.push("space")
    0.0 / 0.0
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  assert_true(
    try {
      ignore(locator.tick_values(0.4, 0.6))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(locator.warnings(), [])
  assert_eq(events, ["space", "minpos", "space"])
}

///|
test "Logit original context and range 50" {
  let old = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old)
  @config.set_axes_autolimit_mode("data")
  let events : Array[String] = []
  let locator = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Auto),
  )
  locator.bind_tick_space(fn() {
    events.push("space")
    1.0 / 0.0
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  verify_logit_params_values(locator.tick_values(0.01, 0.99), [
    0.01, 0.1, 0.5, 0.9, 0.99,
  ])
  assert_eq(locator.warnings(), [])
  assert_eq(events, ["space", "minpos"])
}

///|
test "Logit original context and range 51" {
  let old = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old)
  @config.set_axes_autolimit_mode("data")
  let events : Array[String] = []
  let locator = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Auto),
  )
  locator.bind_tick_space(fn() {
    events.push("space")
    1.0 / 0.0
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  verify_logit_params_values(locator.tick_values(0.4, 0.6), [
    0.4, 0.45, 0.5, 0.55, 0.6000000000000001,
  ])
  assert_eq(locator.warnings(), [])
  assert_eq(events, ["space", "minpos", "space"])
}

///|
test "Logit original context and range 52" {
  let old = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old)
  @config.set_axes_autolimit_mode("data")
  let events : Array[String] = []
  let locator = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Auto),
  )
  locator.bind_tick_space(fn() {
    events.push("space")
    -1.0 / 0.0
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  verify_logit_params_values(locator.tick_values(0.01, 0.99), [0.01, 0.5, 0.99])
  assert_eq(locator.warnings(), [])
  assert_eq(events, ["space", "minpos"])
}

///|
test "Logit original context and range 53" {
  let old = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old)
  @config.set_axes_autolimit_mode("data")
  let events : Array[String] = []
  let locator = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Auto),
  )
  locator.bind_tick_space(fn() {
    events.push("space")
    -1.0 / 0.0
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  verify_logit_params_values(locator.tick_values(0.4, 0.6), [
    0.4, 0.5, 0.6000000000000001,
  ])
  assert_eq(locator.warnings(), [])
  assert_eq(events, ["space", "minpos", "space"])
}

///|
test "Logit original context and range 54" {
  let old = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old)
  @config.set_axes_autolimit_mode("data")
  let events : Array[String] = []
  let locator = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Auto),
  )
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  assert_true(
    try {
      ignore(locator.tick_values(0.2, 0.8))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(locator.warnings(), [])
  assert_eq(events, [])
}

///|
test "Logit original context and range 55" {
  let old = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old)
  @config.set_axes_autolimit_mode("data")
  let events : Array[String] = []
  let locator = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Auto),
  )
  locator.bind_tick_space(fn() {
    events.push("space")
    9.0
  })
  assert_true(
    try {
      ignore(locator.tick_values(0.2, 0.8))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(locator.warnings(), [])
  assert_eq(events, ["space"])
}

///|
test "Logit original context and range 56" {
  let old = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old)
  @config.set_axes_autolimit_mode("data")
  let events : Array[String] = []
  let locator = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Auto),
  )
  locator.bind_view_interval(fn() {
    events.push("view")
    (0.2, 0.8)
  })
  assert_true(
    try {
      ignore(locator.call())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(locator.warnings(), [])
  assert_eq(events, ["view"])
}

///|
test "Logit original context and range 57" {
  let old = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old)
  @config.set_axes_autolimit_mode("data")
  let events : Array[String] = []
  let locator = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Auto),
  )
  locator.bind_tick_space(fn() {
    events.push("space")
    9.0
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  let view_reads = Ref(0)
  locator.bind_view_interval(fn() raise @core.DataError {
    events.push("view")
    view_reads.val += 1
    if view_reads.val == 1 {
      raise @core.DataError::InvalidTicks(message="fixture view")
    }
    (0.2, 0.8)
  })
  locator.bind_projection(fn() {
    events.push("projection")
    "rectilinear"
  })
  assert_true(
    try {
      ignore(locator.call())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(locator.warnings(), [])
  assert_eq(events, ["view"])
}

///|
test "Logit original context and range 58" {
  let old = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old)
  @config.set_axes_autolimit_mode("data")
  let events : Array[String] = []
  let locator = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Auto),
  )
  locator.bind_tick_space(fn() {
    events.push("space")
    9.0
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  locator.bind_view_interval(fn() {
    events.push("view")
    (0.2, 0.8)
  })
  let projection_reads = Ref(0)
  locator.bind_projection(fn() raise @core.DataError {
    events.push("projection")
    projection_reads.val += 1
    if projection_reads.val == 1 {
      raise @core.DataError::InvalidTicks(message="fixture projection")
    }
    "rectilinear"
  })
  assert_true(
    try {
      ignore(locator.call())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(locator.warnings(), [])
  assert_eq(events, ["view", "projection"])
}

///|
test "Logit original context and range 59" {
  let old = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old)
  @config.set_axes_autolimit_mode("data")
  let events : Array[String] = []
  let locator = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Auto),
  )
  locator.bind_tick_space(fn() {
    events.push("space")
    9.0
  })
  let minpos_reads = Ref(0)
  locator.bind_minpos(fn() raise @core.DataError {
    events.push("minpos")
    minpos_reads.val += 1
    if minpos_reads.val == 1 {
      raise @core.DataError::InvalidTicks(message="fixture minpos")
    }
    0.01
  })
  locator.bind_view_interval(fn() {
    events.push("view")
    (0.2, 0.8)
  })
  locator.bind_projection(fn() {
    events.push("projection")
    "rectilinear"
  })
  assert_true(
    try {
      ignore(locator.call())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(locator.warnings(), [])
  assert_eq(events, ["view", "projection", "space", "minpos"])
}

///|
test "Logit original context and range 60" {
  let old = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old)
  @config.set_axes_autolimit_mode("data")
  let events : Array[String] = []
  let locator = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Auto),
  )
  locator.bind_tick_space(fn() {
    events.push("space")
    9.0
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  let projection_reads = Ref(0)
  locator.bind_projection(fn() raise @core.DataError {
    events.push("projection")
    projection_reads.val += 1
    if projection_reads.val == 2 {
      raise @core.DataError::InvalidTicks(message="fixture projection")
    }
    "rectilinear"
  })
  assert_true(
    try {
      ignore(locator.tick_values(0.4, 0.6))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(locator.warnings(), [])
  assert_eq(events, ["projection", "space", "minpos", "space", "projection"])
}

///|
test "Logit original context and range 61" {
  let old = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(old)
  @config.set_axes_autolimit_mode("round_numbers")
  let events : Array[String] = []
  let locator = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Auto),
  )
  locator.bind_tick_space(fn() {
    events.push("space")
    9.0
  })
  locator.bind_minpos(fn() {
    events.push("minpos")
    0.01
  })
  let projection_reads = Ref(0)
  locator.bind_projection(fn() raise @core.DataError {
    events.push("projection")
    projection_reads.val += 1
    if projection_reads.val == 1 {
      raise @core.DataError::InvalidTicks(message="fixture projection")
    }
    "rectilinear"
  })
  assert_true(
    try {
      ignore(locator.view_limits(0.4, 0.6))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(locator.warnings(), [])
  assert_eq(events, ["space", "projection"])
}

///|
test "Logit original provider closure copy and rebind" {
  let events : Array[String] = []
  let minimum = Ref(0.01)
  let locator = @ticker.LogitLocator::new()
  locator.bind_minpos(fn() {
    events.push("first")
    minimum.val
  })
  let shallow = locator.copy()
  let (lower, upper) = locator.nonsingular(0.0, 1.0)
  verify_logit_params_values([lower, upper], [0.01, 0.99])
  assert_eq(locator.warnings(), [])
  minimum.val = 0.02
  let (lower, upper) = shallow.nonsingular(0.0, 1.0)
  verify_logit_params_values([lower, upper], [0.02, 0.98])
  assert_eq(locator.warnings(), [])
  locator.bind_minpos(fn() {
    events.push("second")
    0.2
  })
  let (lower, upper) = locator.nonsingular(0.0, 1.0)
  verify_logit_params_values([lower, upper], [0.2, 0.8])
  assert_eq(locator.warnings(), [])
  let (lower, upper) = shallow.nonsingular(0.0, 1.0)
  verify_logit_params_values([lower, upper], [0.02, 0.98])
  assert_eq(locator.warnings(), [])
  assert_eq(events, ["first", "first", "second", "first"])
}
