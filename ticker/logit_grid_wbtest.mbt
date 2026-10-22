///|
test "Logit extreme dense minors preserve source zeros and repeated upper ticks" {
  let locator = LogitLocator::new(minor=true, nbins=Some(MaxNBins::Count(1000)))
  let ticks = locator.tick_values(4.9406564584124654e-324, 0.9999999999999999)
  assert_eq(ticks.length(), 2710)
  let mut zeros = 0
  let mut repeated_upper = 0
  for value in ticks {
    if value == 0.0 {
      zeros += 1
    }
    if value.reinterpret_as_uint64() == 0x3feffffffffffffbUL {
      repeated_upper += 1
    }
  }
  assert_eq(zeros, 8)
  assert_eq(repeated_upper, 2)
}

///|
test "Logit live MaxN state prunes fallback while keeping ideal subsampling" {
  let locator = LogitLocator::new(nbins=Some(MaxNBins::Count(9)))
  let state = locator.as_maxn_locator()
  state.set_params(nbins=MaxNBins::Count(2), prune=Some("both"))
  verify_logit_grid_bits(locator.tick_values(0.0001, 0.9999), [
    0.0001, 0.5, 0.9999,
  ])
  verify_logit_grid_bits(locator.tick_values(0.49, 0.51), [0.5])
}

///|
test "Logit middle minor blocks use source division instead of decimal multiplication" {
  let locator = LogitLocator::new(minor=true, nbins=Some(MaxNBins::Count(100)))
  let ticks = locator.tick_values(0.01, 0.99)
  assert_eq(ticks.length(), 22)
  assert_eq(ticks[9].reinterpret_as_uint64(), 0.3.reinterpret_as_uint64())
  assert_true(
    ticks[9].reinterpret_as_uint64() != (3.0 * 0.1).reinterpret_as_uint64(),
  )
}

///|
test "Logit second projection failure precedes the inherited empty integer staircase" {
  let locator = LogitLocator::new()
  locator.set_params(integer=true)
  let events : Array[String] = []
  locator.bind_tick_space(() => {
    events.push("space")
    0.0 / 0.0
  })
  locator.bind_minpos(() => {
    events.push("minpos")
    1.0e-7
  })
  let projection_reads = [0]
  locator.bind_projection(() => {
    events.push("projection")
    projection_reads[0] += 1
    if projection_reads[0] == 2 {
      raise @core.DataError::InvalidTicks(message="second projection")
    }
    "rectilinear"
  })
  assert_true(
    try {
      ignore(locator.tick_values(0.49, 0.51))
      false
    } catch {
      @core.DataError::InvalidTicks(message="second projection") => true
      _ => false
    },
  )
  assert_eq(events, ["projection", "space", "minpos", "space", "projection"])
}
