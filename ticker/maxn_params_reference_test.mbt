// Generated original MaxNLocator state, validation and ndarray alias observations.

///|
fn verify_maxn_params_values(
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
fn verify_maxn_params_state(
  locator : @ticker.MaxNLocator,
  nbins : @ticker.MaxNBins,
  integer : Bool,
  symmetric : Bool,
  prune : String?,
  min_n_ticks : Int32,
  steps : Array[Double],
  extended : Array[Double],
) -> Unit raise {
  assert_eq(locator.nbins(), nbins)
  assert_eq(locator.integer(), integer)
  assert_eq(locator.symmetric(), symmetric)
  assert_eq(locator.prune(), prune)
  assert_eq(locator.min_n_ticks(), min_n_ticks)
  verify_maxn_params_values(locator.steps().to_array(), steps)
  verify_maxn_params_values(locator.extended_steps(), extended)
}

///|
test "MaxN original constructor state 0" {
  let locator = @ticker.MaxNLocator::new(
    min_n_ticks=-2147483648,
    integer=true,
    symmetric=true,
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(10),
    true,
    true,
    None,
    1,
    [1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0],
    [
      0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
      0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
    ],
  )
}

///|
test "MaxN original constructor state 1" {
  let locator = @ticker.MaxNLocator::new(
    min_n_ticks=0,
    integer=false,
    symmetric=false,
    prune="lower",
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(10),
    false,
    false,
    Some("lower"),
    1,
    [1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0],
    [
      0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
      0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
    ],
  )
}

///|
test "MaxN original constructor state 2" {
  let locator = @ticker.MaxNLocator::new(
    min_n_ticks=1,
    integer=true,
    symmetric=false,
    prune="upper",
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(10),
    true,
    false,
    Some("upper"),
    1,
    [1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0],
    [
      0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
      0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
    ],
  )
}

///|
test "MaxN original constructor state 3" {
  let locator = @ticker.MaxNLocator::new(
    min_n_ticks=2,
    integer=false,
    symmetric=true,
    prune="both",
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(10),
    false,
    true,
    Some("both"),
    2,
    [1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0],
    [
      0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
      0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
    ],
  )
}

///|
test "MaxN original constructor state 4" {
  let locator = @ticker.MaxNLocator::new(
    min_n_ticks=12,
    integer=true,
    symmetric=false,
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(10),
    true,
    false,
    None,
    12,
    [1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0],
    [
      0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
      0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
    ],
  )
}

///|
test "MaxN original constructor state 5" {
  let locator = @ticker.MaxNLocator::new(
    min_n_ticks=2147483647,
    integer=false,
    symmetric=false,
    prune="lower",
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(10),
    false,
    false,
    Some("lower"),
    2147483647,
    [1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0],
    [
      0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
      0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
    ],
  )
}

///|
test "MaxN original constructor state 6" {
  let locator = @ticker.MaxNLocator::new(
    nbins=@ticker.MaxNBins::Auto,
    min_n_ticks=-2147483648,
    integer=true,
    symmetric=true,
    prune="upper",
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Auto,
    true,
    true,
    Some("upper"),
    1,
    [1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0],
    [
      0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
      0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
    ],
  )
}

///|
test "MaxN original constructor state 7" {
  let locator = @ticker.MaxNLocator::new(
    nbins=@ticker.MaxNBins::Auto,
    min_n_ticks=0,
    integer=false,
    symmetric=false,
    prune="both",
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Auto,
    false,
    false,
    Some("both"),
    1,
    [1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0],
    [
      0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
      0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
    ],
  )
}

///|
test "MaxN original constructor state 8" {
  let locator = @ticker.MaxNLocator::new(
    nbins=@ticker.MaxNBins::Auto,
    min_n_ticks=1,
    integer=true,
    symmetric=false,
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Auto,
    true,
    false,
    None,
    1,
    [1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0],
    [
      0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
      0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
    ],
  )
}

///|
test "MaxN original constructor state 9" {
  let locator = @ticker.MaxNLocator::new(
    nbins=@ticker.MaxNBins::Auto,
    min_n_ticks=2,
    integer=false,
    symmetric=true,
    prune="lower",
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Auto,
    false,
    true,
    Some("lower"),
    2,
    [1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0],
    [
      0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
      0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
    ],
  )
}

///|
test "MaxN original constructor state 10" {
  let locator = @ticker.MaxNLocator::new(
    nbins=@ticker.MaxNBins::Auto,
    min_n_ticks=12,
    integer=true,
    symmetric=false,
    prune="upper",
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Auto,
    true,
    false,
    Some("upper"),
    12,
    [1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0],
    [
      0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
      0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
    ],
  )
}

///|
test "MaxN original constructor state 11" {
  let locator = @ticker.MaxNLocator::new(
    nbins=@ticker.MaxNBins::Auto,
    min_n_ticks=2147483647,
    integer=false,
    symmetric=false,
    prune="both",
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Auto,
    false,
    false,
    Some("both"),
    2147483647,
    [1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0],
    [
      0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
      0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
    ],
  )
}

///|
test "MaxN original constructor state 12" {
  let locator = @ticker.MaxNLocator::new(
    nbins=@ticker.MaxNBins::Count(-2147483648),
    min_n_ticks=-2147483648,
    integer=true,
    symmetric=true,
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(-2147483648),
    true,
    true,
    None,
    1,
    [1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0],
    [
      0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
      0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
    ],
  )
}

///|
test "MaxN original constructor state 13" {
  let locator = @ticker.MaxNLocator::new(
    nbins=@ticker.MaxNBins::Count(-2147483648),
    min_n_ticks=0,
    integer=false,
    symmetric=false,
    prune="lower",
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(-2147483648),
    false,
    false,
    Some("lower"),
    1,
    [1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0],
    [
      0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
      0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
    ],
  )
}

///|
test "MaxN original constructor state 14" {
  let locator = @ticker.MaxNLocator::new(
    nbins=@ticker.MaxNBins::Count(-2147483648),
    min_n_ticks=1,
    integer=true,
    symmetric=false,
    prune="upper",
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(-2147483648),
    true,
    false,
    Some("upper"),
    1,
    [1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0],
    [
      0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
      0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
    ],
  )
}

///|
test "MaxN original constructor state 15" {
  let locator = @ticker.MaxNLocator::new(
    nbins=@ticker.MaxNBins::Count(-2147483648),
    min_n_ticks=2,
    integer=false,
    symmetric=true,
    prune="both",
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(-2147483648),
    false,
    true,
    Some("both"),
    2,
    [1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0],
    [
      0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
      0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
    ],
  )
}

///|
test "MaxN original constructor state 16" {
  let locator = @ticker.MaxNLocator::new(
    nbins=@ticker.MaxNBins::Count(-2147483648),
    min_n_ticks=12,
    integer=true,
    symmetric=false,
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(-2147483648),
    true,
    false,
    None,
    12,
    [1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0],
    [
      0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
      0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
    ],
  )
}

///|
test "MaxN original constructor state 17" {
  let locator = @ticker.MaxNLocator::new(
    nbins=@ticker.MaxNBins::Count(-2147483648),
    min_n_ticks=2147483647,
    integer=false,
    symmetric=false,
    prune="lower",
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(-2147483648),
    false,
    false,
    Some("lower"),
    2147483647,
    [1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0],
    [
      0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
      0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
    ],
  )
}

///|
test "MaxN original constructor state 18" {
  let locator = @ticker.MaxNLocator::new(
    nbins=@ticker.MaxNBins::Count(-1),
    min_n_ticks=-2147483648,
    integer=true,
    symmetric=true,
    prune="upper",
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(-1),
    true,
    true,
    Some("upper"),
    1,
    [1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0],
    [
      0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
      0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
    ],
  )
}

///|
test "MaxN original constructor state 19" {
  let locator = @ticker.MaxNLocator::new(
    nbins=@ticker.MaxNBins::Count(-1),
    min_n_ticks=0,
    integer=false,
    symmetric=false,
    prune="both",
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(-1),
    false,
    false,
    Some("both"),
    1,
    [1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0],
    [
      0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
      0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
    ],
  )
}

///|
test "MaxN original constructor state 20" {
  let locator = @ticker.MaxNLocator::new(
    nbins=@ticker.MaxNBins::Count(-1),
    min_n_ticks=1,
    integer=true,
    symmetric=false,
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(-1),
    true,
    false,
    None,
    1,
    [1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0],
    [
      0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
      0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
    ],
  )
}

///|
test "MaxN original constructor state 21" {
  let locator = @ticker.MaxNLocator::new(
    nbins=@ticker.MaxNBins::Count(-1),
    min_n_ticks=2,
    integer=false,
    symmetric=true,
    prune="lower",
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(-1),
    false,
    true,
    Some("lower"),
    2,
    [1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0],
    [
      0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
      0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
    ],
  )
}

///|
test "MaxN original constructor state 22" {
  let locator = @ticker.MaxNLocator::new(
    nbins=@ticker.MaxNBins::Count(-1),
    min_n_ticks=12,
    integer=true,
    symmetric=false,
    prune="upper",
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(-1),
    true,
    false,
    Some("upper"),
    12,
    [1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0],
    [
      0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
      0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
    ],
  )
}

///|
test "MaxN original constructor state 23" {
  let locator = @ticker.MaxNLocator::new(
    nbins=@ticker.MaxNBins::Count(-1),
    min_n_ticks=2147483647,
    integer=false,
    symmetric=false,
    prune="both",
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(-1),
    false,
    false,
    Some("both"),
    2147483647,
    [1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0],
    [
      0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
      0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
    ],
  )
}

///|
test "MaxN original constructor state 24" {
  let locator = @ticker.MaxNLocator::new(
    nbins=@ticker.MaxNBins::Count(0),
    min_n_ticks=-2147483648,
    integer=true,
    symmetric=true,
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(0),
    true,
    true,
    None,
    1,
    [1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0],
    [
      0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
      0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
    ],
  )
}

///|
test "MaxN original constructor state 25" {
  let locator = @ticker.MaxNLocator::new(
    nbins=@ticker.MaxNBins::Count(0),
    min_n_ticks=0,
    integer=false,
    symmetric=false,
    prune="lower",
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(0),
    false,
    false,
    Some("lower"),
    1,
    [1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0],
    [
      0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
      0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
    ],
  )
}

///|
test "MaxN original constructor state 26" {
  let locator = @ticker.MaxNLocator::new(
    nbins=@ticker.MaxNBins::Count(0),
    min_n_ticks=1,
    integer=true,
    symmetric=false,
    prune="upper",
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(0),
    true,
    false,
    Some("upper"),
    1,
    [1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0],
    [
      0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
      0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
    ],
  )
}

///|
test "MaxN original constructor state 27" {
  let locator = @ticker.MaxNLocator::new(
    nbins=@ticker.MaxNBins::Count(0),
    min_n_ticks=2,
    integer=false,
    symmetric=true,
    prune="both",
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(0),
    false,
    true,
    Some("both"),
    2,
    [1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0],
    [
      0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
      0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
    ],
  )
}

///|
test "MaxN original constructor state 28" {
  let locator = @ticker.MaxNLocator::new(
    nbins=@ticker.MaxNBins::Count(0),
    min_n_ticks=12,
    integer=true,
    symmetric=false,
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(0),
    true,
    false,
    None,
    12,
    [1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0],
    [
      0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
      0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
    ],
  )
}

///|
test "MaxN original constructor state 29" {
  let locator = @ticker.MaxNLocator::new(
    nbins=@ticker.MaxNBins::Count(0),
    min_n_ticks=2147483647,
    integer=false,
    symmetric=false,
    prune="lower",
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(0),
    false,
    false,
    Some("lower"),
    2147483647,
    [1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0],
    [
      0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
      0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
    ],
  )
}

///|
test "MaxN original constructor state 30" {
  let locator = @ticker.MaxNLocator::new(
    nbins=@ticker.MaxNBins::Count(1),
    min_n_ticks=-2147483648,
    integer=true,
    symmetric=true,
    prune="upper",
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(1),
    true,
    true,
    Some("upper"),
    1,
    [1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0],
    [
      0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
      0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
    ],
  )
}

///|
test "MaxN original constructor state 31" {
  let locator = @ticker.MaxNLocator::new(
    nbins=@ticker.MaxNBins::Count(1),
    min_n_ticks=0,
    integer=false,
    symmetric=false,
    prune="both",
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(1),
    false,
    false,
    Some("both"),
    1,
    [1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0],
    [
      0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
      0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
    ],
  )
}

///|
test "MaxN original constructor state 32" {
  let locator = @ticker.MaxNLocator::new(
    nbins=@ticker.MaxNBins::Count(1),
    min_n_ticks=1,
    integer=true,
    symmetric=false,
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(1),
    true,
    false,
    None,
    1,
    [1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0],
    [
      0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
      0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
    ],
  )
}

///|
test "MaxN original constructor state 33" {
  let locator = @ticker.MaxNLocator::new(
    nbins=@ticker.MaxNBins::Count(1),
    min_n_ticks=2,
    integer=false,
    symmetric=true,
    prune="lower",
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(1),
    false,
    true,
    Some("lower"),
    2,
    [1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0],
    [
      0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
      0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
    ],
  )
}

///|
test "MaxN original constructor state 34" {
  let locator = @ticker.MaxNLocator::new(
    nbins=@ticker.MaxNBins::Count(1),
    min_n_ticks=12,
    integer=true,
    symmetric=false,
    prune="upper",
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(1),
    true,
    false,
    Some("upper"),
    12,
    [1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0],
    [
      0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
      0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
    ],
  )
}

///|
test "MaxN original constructor state 35" {
  let locator = @ticker.MaxNLocator::new(
    nbins=@ticker.MaxNBins::Count(1),
    min_n_ticks=2147483647,
    integer=false,
    symmetric=false,
    prune="both",
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(1),
    false,
    false,
    Some("both"),
    2147483647,
    [1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0],
    [
      0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
      0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
    ],
  )
}

///|
test "MaxN original constructor state 36" {
  let locator = @ticker.MaxNLocator::new(
    nbins=@ticker.MaxNBins::Count(10),
    min_n_ticks=-2147483648,
    integer=true,
    symmetric=true,
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(10),
    true,
    true,
    None,
    1,
    [1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0],
    [
      0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
      0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
    ],
  )
}

///|
test "MaxN original constructor state 37" {
  let locator = @ticker.MaxNLocator::new(
    nbins=@ticker.MaxNBins::Count(10),
    min_n_ticks=0,
    integer=false,
    symmetric=false,
    prune="lower",
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(10),
    false,
    false,
    Some("lower"),
    1,
    [1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0],
    [
      0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
      0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
    ],
  )
}

///|
test "MaxN original constructor state 38" {
  let locator = @ticker.MaxNLocator::new(
    nbins=@ticker.MaxNBins::Count(10),
    min_n_ticks=1,
    integer=true,
    symmetric=false,
    prune="upper",
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(10),
    true,
    false,
    Some("upper"),
    1,
    [1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0],
    [
      0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
      0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
    ],
  )
}

///|
test "MaxN original constructor state 39" {
  let locator = @ticker.MaxNLocator::new(
    nbins=@ticker.MaxNBins::Count(10),
    min_n_ticks=2,
    integer=false,
    symmetric=true,
    prune="both",
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(10),
    false,
    true,
    Some("both"),
    2,
    [1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0],
    [
      0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
      0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
    ],
  )
}

///|
test "MaxN original constructor state 40" {
  let locator = @ticker.MaxNLocator::new(
    nbins=@ticker.MaxNBins::Count(10),
    min_n_ticks=12,
    integer=true,
    symmetric=false,
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(10),
    true,
    false,
    None,
    12,
    [1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0],
    [
      0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
      0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
    ],
  )
}

///|
test "MaxN original constructor state 41" {
  let locator = @ticker.MaxNLocator::new(
    nbins=@ticker.MaxNBins::Count(10),
    min_n_ticks=2147483647,
    integer=false,
    symmetric=false,
    prune="lower",
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(10),
    false,
    false,
    Some("lower"),
    2147483647,
    [1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0],
    [
      0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
      0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
    ],
  )
}

///|
test "MaxN original constructor state 42" {
  let locator = @ticker.MaxNLocator::new(
    nbins=@ticker.MaxNBins::Count(2147483647),
    min_n_ticks=-2147483648,
    integer=true,
    symmetric=true,
    prune="upper",
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(2147483647),
    true,
    true,
    Some("upper"),
    1,
    [1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0],
    [
      0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
      0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
    ],
  )
}

///|
test "MaxN original constructor state 43" {
  let locator = @ticker.MaxNLocator::new(
    nbins=@ticker.MaxNBins::Count(2147483647),
    min_n_ticks=0,
    integer=false,
    symmetric=false,
    prune="both",
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(2147483647),
    false,
    false,
    Some("both"),
    1,
    [1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0],
    [
      0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
      0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
    ],
  )
}

///|
test "MaxN original constructor state 44" {
  let locator = @ticker.MaxNLocator::new(
    nbins=@ticker.MaxNBins::Count(2147483647),
    min_n_ticks=1,
    integer=true,
    symmetric=false,
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(2147483647),
    true,
    false,
    None,
    1,
    [1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0],
    [
      0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
      0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
    ],
  )
}

///|
test "MaxN original constructor state 45" {
  let locator = @ticker.MaxNLocator::new(
    nbins=@ticker.MaxNBins::Count(2147483647),
    min_n_ticks=2,
    integer=false,
    symmetric=true,
    prune="lower",
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(2147483647),
    false,
    true,
    Some("lower"),
    2,
    [1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0],
    [
      0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
      0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
    ],
  )
}

///|
test "MaxN original constructor state 46" {
  let locator = @ticker.MaxNLocator::new(
    nbins=@ticker.MaxNBins::Count(2147483647),
    min_n_ticks=12,
    integer=true,
    symmetric=false,
    prune="upper",
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(2147483647),
    true,
    false,
    Some("upper"),
    12,
    [1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0],
    [
      0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
      0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
    ],
  )
}

///|
test "MaxN original constructor state 47" {
  let locator = @ticker.MaxNLocator::new(
    nbins=@ticker.MaxNBins::Count(2147483647),
    min_n_ticks=2147483647,
    integer=false,
    symmetric=false,
    prune="both",
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(2147483647),
    false,
    false,
    Some("both"),
    2147483647,
    [1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0],
    [
      0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
      0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
    ],
  )
}

///|
test "MaxN original constructor invalid prune ''" {
  assert_true(
    try {
      ignore(@ticker.MaxNLocator::new(prune=""))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "MaxN original constructor invalid prune 'invalid'" {
  assert_true(
    try {
      ignore(@ticker.MaxNLocator::new(prune="invalid"))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "MaxN original constructor invalid prune 'LOWER'" {
  assert_true(
    try {
      ignore(@ticker.MaxNLocator::new(prune="LOWER"))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "MaxN original step validation 0 constructor" {
  assert_true(
    try {
      ignore(@ticker.MaxNLocator::new(steps=@ticker.TickValues::from_array([])))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "MaxN original step validation 1 set_params" {
  let locator = @ticker.MaxNLocator::new(
    nbins=@ticker.MaxNBins::Count(3),
    prune="lower",
  )
  assert_true(
    try {
      ignore(
        locator.set_params(
          nbins=@ticker.MaxNBins::Count(4),
          symmetric=true,
          prune=Some("upper"),
          min_n_ticks=5,
          steps=Some(@ticker.TickValues::from_array([])),
          integer=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(4),
    false,
    true,
    Some("upper"),
    5,
    [1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0],
    [
      0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
      0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
    ],
  )
}

///|
test "MaxN original step validation 2 constructor" {
  let locator = @ticker.MaxNLocator::new(
    steps=@ticker.TickValues::from_array([1.0]),
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(10),
    false,
    false,
    None,
    2,
    [1.0, 10.0],
    [0.1, 1.0, 10.0, 100.0],
  )
}

///|
test "MaxN original step validation 3 set_params" {
  let locator = @ticker.MaxNLocator::new(
    nbins=@ticker.MaxNBins::Count(3),
    prune="lower",
  )
  locator.set_params(
    nbins=@ticker.MaxNBins::Count(4),
    symmetric=true,
    prune=Some("upper"),
    min_n_ticks=5,
    steps=Some(@ticker.TickValues::from_array([1.0])),
    integer=true,
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(4),
    true,
    true,
    Some("upper"),
    5,
    [1.0, 10.0],
    [0.1, 1.0, 10.0, 100.0],
  )
}

///|
test "MaxN original step validation 4 constructor" {
  let locator = @ticker.MaxNLocator::new(
    steps=@ticker.TickValues::from_array([10.0]),
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(10),
    false,
    false,
    None,
    2,
    [1.0, 10.0],
    [0.1, 1.0, 10.0, 100.0],
  )
}

///|
test "MaxN original step validation 5 set_params" {
  let locator = @ticker.MaxNLocator::new(
    nbins=@ticker.MaxNBins::Count(3),
    prune="lower",
  )
  locator.set_params(
    nbins=@ticker.MaxNBins::Count(4),
    symmetric=true,
    prune=Some("upper"),
    min_n_ticks=5,
    steps=Some(@ticker.TickValues::from_array([10.0])),
    integer=true,
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(4),
    true,
    true,
    Some("upper"),
    5,
    [1.0, 10.0],
    [0.1, 1.0, 10.0, 100.0],
  )
}

///|
test "MaxN original step validation 6 constructor" {
  let locator = @ticker.MaxNLocator::new(
    steps=@ticker.TickValues::from_array([2.0]),
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(10),
    false,
    false,
    None,
    2,
    [1.0, 2.0, 10.0],
    [0.1, 0.2, 1.0, 2.0, 10.0, 20.0],
  )
}

///|
test "MaxN original step validation 7 set_params" {
  let locator = @ticker.MaxNLocator::new(
    nbins=@ticker.MaxNBins::Count(3),
    prune="lower",
  )
  locator.set_params(
    nbins=@ticker.MaxNBins::Count(4),
    symmetric=true,
    prune=Some("upper"),
    min_n_ticks=5,
    steps=Some(@ticker.TickValues::from_array([2.0])),
    integer=true,
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(4),
    true,
    true,
    Some("upper"),
    5,
    [1.0, 2.0, 10.0],
    [0.1, 0.2, 1.0, 2.0, 10.0, 20.0],
  )
}

///|
test "MaxN original step validation 8 constructor" {
  let locator = @ticker.MaxNLocator::new(
    steps=@ticker.TickValues::from_array([2.0, 4.0, 8.0]),
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(10),
    false,
    false,
    None,
    2,
    [1.0, 2.0, 4.0, 8.0, 10.0],
    [0.1, 0.2, 0.4, 0.8, 1.0, 2.0, 4.0, 8.0, 10.0, 20.0],
  )
}

///|
test "MaxN original step validation 9 set_params" {
  let locator = @ticker.MaxNLocator::new(
    nbins=@ticker.MaxNBins::Count(3),
    prune="lower",
  )
  locator.set_params(
    nbins=@ticker.MaxNBins::Count(4),
    symmetric=true,
    prune=Some("upper"),
    min_n_ticks=5,
    steps=Some(@ticker.TickValues::from_array([2.0, 4.0, 8.0])),
    integer=true,
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(4),
    true,
    true,
    Some("upper"),
    5,
    [1.0, 2.0, 4.0, 8.0, 10.0],
    [0.1, 0.2, 0.4, 0.8, 1.0, 2.0, 4.0, 8.0, 10.0, 20.0],
  )
}

///|
test "MaxN original step validation 10 constructor" {
  let locator = @ticker.MaxNLocator::new(
    steps=@ticker.TickValues::from_array([1.0, 2.0, 10.0]),
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(10),
    false,
    false,
    None,
    2,
    [1.0, 2.0, 10.0],
    [0.1, 0.2, 1.0, 2.0, 10.0, 20.0],
  )
}

///|
test "MaxN original step validation 11 set_params" {
  let locator = @ticker.MaxNLocator::new(
    nbins=@ticker.MaxNBins::Count(3),
    prune="lower",
  )
  locator.set_params(
    nbins=@ticker.MaxNBins::Count(4),
    symmetric=true,
    prune=Some("upper"),
    min_n_ticks=5,
    steps=Some(@ticker.TickValues::from_array([1.0, 2.0, 10.0])),
    integer=true,
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(4),
    true,
    true,
    Some("upper"),
    5,
    [1.0, 2.0, 10.0],
    [0.1, 0.2, 1.0, 2.0, 10.0, 20.0],
  )
}

///|
test "MaxN original step validation 12 constructor" {
  let locator = @ticker.MaxNLocator::new(
    steps=@ticker.TickValues::from_array([
      1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0,
    ]),
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(10),
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
test "MaxN original step validation 13 set_params" {
  let locator = @ticker.MaxNLocator::new(
    nbins=@ticker.MaxNBins::Count(3),
    prune="lower",
  )
  locator.set_params(
    nbins=@ticker.MaxNBins::Count(4),
    symmetric=true,
    prune=Some("upper"),
    min_n_ticks=5,
    steps=Some(
      @ticker.TickValues::from_array([
        1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0,
      ]),
    ),
    integer=true,
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(4),
    true,
    true,
    Some("upper"),
    5,
    [1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0],
    [
      0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
      0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
    ],
  )
}

///|
test "MaxN original step validation 14 constructor" {
  assert_true(
    try {
      ignore(
        @ticker.MaxNLocator::new(
          steps=@ticker.TickValues::from_array([0.0, 2.0, 10.0]),
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "MaxN original step validation 15 set_params" {
  let locator = @ticker.MaxNLocator::new(
    nbins=@ticker.MaxNBins::Count(3),
    prune="lower",
  )
  assert_true(
    try {
      ignore(
        locator.set_params(
          nbins=@ticker.MaxNBins::Count(4),
          symmetric=true,
          prune=Some("upper"),
          min_n_ticks=5,
          steps=Some(@ticker.TickValues::from_array([0.0, 2.0, 10.0])),
          integer=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(4),
    false,
    true,
    Some("upper"),
    5,
    [1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0],
    [
      0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
      0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
    ],
  )
}

///|
test "MaxN original step validation 16 constructor" {
  assert_true(
    try {
      ignore(
        @ticker.MaxNLocator::new(
          steps=@ticker.TickValues::from_array([1.0, 2.0, 11.0]),
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "MaxN original step validation 17 set_params" {
  let locator = @ticker.MaxNLocator::new(
    nbins=@ticker.MaxNBins::Count(3),
    prune="lower",
  )
  assert_true(
    try {
      ignore(
        locator.set_params(
          nbins=@ticker.MaxNBins::Count(4),
          symmetric=true,
          prune=Some("upper"),
          min_n_ticks=5,
          steps=Some(@ticker.TickValues::from_array([1.0, 2.0, 11.0])),
          integer=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(4),
    false,
    true,
    Some("upper"),
    5,
    [1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0],
    [
      0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
      0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
    ],
  )
}

///|
test "MaxN original step validation 18 constructor" {
  assert_true(
    try {
      ignore(
        @ticker.MaxNLocator::new(
          steps=@ticker.TickValues::from_array([1.0, 2.0, 2.0, 10.0]),
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "MaxN original step validation 19 set_params" {
  let locator = @ticker.MaxNLocator::new(
    nbins=@ticker.MaxNBins::Count(3),
    prune="lower",
  )
  assert_true(
    try {
      ignore(
        locator.set_params(
          nbins=@ticker.MaxNBins::Count(4),
          symmetric=true,
          prune=Some("upper"),
          min_n_ticks=5,
          steps=Some(@ticker.TickValues::from_array([1.0, 2.0, 2.0, 10.0])),
          integer=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(4),
    false,
    true,
    Some("upper"),
    5,
    [1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0],
    [
      0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
      0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
    ],
  )
}

///|
test "MaxN original step validation 20 constructor" {
  assert_true(
    try {
      ignore(
        @ticker.MaxNLocator::new(
          steps=@ticker.TickValues::from_array([10.0, 1.0]),
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "MaxN original step validation 21 set_params" {
  let locator = @ticker.MaxNLocator::new(
    nbins=@ticker.MaxNBins::Count(3),
    prune="lower",
  )
  assert_true(
    try {
      ignore(
        locator.set_params(
          nbins=@ticker.MaxNBins::Count(4),
          symmetric=true,
          prune=Some("upper"),
          min_n_ticks=5,
          steps=Some(@ticker.TickValues::from_array([10.0, 1.0])),
          integer=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(4),
    false,
    true,
    Some("upper"),
    5,
    [1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0],
    [
      0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
      0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
    ],
  )
}

///|
test "MaxN original step validation 22 constructor" {
  let locator = @ticker.MaxNLocator::new(
    steps=@ticker.TickValues::from_array([0.0 / 0.0]),
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(10),
    false,
    false,
    None,
    2,
    [1.0, 0.0 / 0.0, 10.0],
    [0.1, 0.0 / 0.0, 1.0, 0.0 / 0.0, 10.0, 0.0 / 0.0],
  )
}

///|
test "MaxN original step validation 23 set_params" {
  let locator = @ticker.MaxNLocator::new(
    nbins=@ticker.MaxNBins::Count(3),
    prune="lower",
  )
  locator.set_params(
    nbins=@ticker.MaxNBins::Count(4),
    symmetric=true,
    prune=Some("upper"),
    min_n_ticks=5,
    steps=Some(@ticker.TickValues::from_array([0.0 / 0.0])),
    integer=true,
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(4),
    true,
    true,
    Some("upper"),
    5,
    [1.0, 0.0 / 0.0, 10.0],
    [0.1, 0.0 / 0.0, 1.0, 0.0 / 0.0, 10.0, 0.0 / 0.0],
  )
}

///|
test "MaxN original step validation 24 constructor" {
  let locator = @ticker.MaxNLocator::new(
    steps=@ticker.TickValues::from_array([1.0, 0.0 / 0.0, 10.0]),
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(10),
    false,
    false,
    None,
    2,
    [1.0, 0.0 / 0.0, 10.0],
    [0.1, 0.0 / 0.0, 1.0, 0.0 / 0.0, 10.0, 0.0 / 0.0],
  )
}

///|
test "MaxN original step validation 25 set_params" {
  let locator = @ticker.MaxNLocator::new(
    nbins=@ticker.MaxNBins::Count(3),
    prune="lower",
  )
  locator.set_params(
    nbins=@ticker.MaxNBins::Count(4),
    symmetric=true,
    prune=Some("upper"),
    min_n_ticks=5,
    steps=Some(@ticker.TickValues::from_array([1.0, 0.0 / 0.0, 10.0])),
    integer=true,
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(4),
    true,
    true,
    Some("upper"),
    5,
    [1.0, 0.0 / 0.0, 10.0],
    [0.1, 0.0 / 0.0, 1.0, 0.0 / 0.0, 10.0, 0.0 / 0.0],
  )
}

///|
test "MaxN original step validation 26 constructor" {
  let locator = @ticker.MaxNLocator::new(
    steps=@ticker.TickValues::from_array([0.0 / 0.0, 5.0, 0.0 / 0.0]),
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(10),
    false,
    false,
    None,
    2,
    [1.0, 0.0 / 0.0, 5.0, 0.0 / 0.0, 10.0],
    [
      0.1,
      0.0 / 0.0,
      0.5,
      0.0 / 0.0,
      1.0,
      0.0 / 0.0,
      5.0,
      0.0 / 0.0,
      10.0,
      0.0 / 0.0,
    ],
  )
}

///|
test "MaxN original step validation 27 set_params" {
  let locator = @ticker.MaxNLocator::new(
    nbins=@ticker.MaxNBins::Count(3),
    prune="lower",
  )
  locator.set_params(
    nbins=@ticker.MaxNBins::Count(4),
    symmetric=true,
    prune=Some("upper"),
    min_n_ticks=5,
    steps=Some(@ticker.TickValues::from_array([0.0 / 0.0, 5.0, 0.0 / 0.0])),
    integer=true,
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(4),
    true,
    true,
    Some("upper"),
    5,
    [1.0, 0.0 / 0.0, 5.0, 0.0 / 0.0, 10.0],
    [
      0.1,
      0.0 / 0.0,
      0.5,
      0.0 / 0.0,
      1.0,
      0.0 / 0.0,
      5.0,
      0.0 / 0.0,
      10.0,
      0.0 / 0.0,
    ],
  )
}

///|
test "MaxN original step validation 28 constructor" {
  let locator = @ticker.MaxNLocator::new(
    steps=@ticker.TickValues::from_array([
      1.0,
      0.0 / 0.0,
      -1.0 / 0.0,
      0.0 / 0.0,
      10.0,
    ]),
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(10),
    false,
    false,
    None,
    2,
    [1.0, 0.0 / 0.0, -1.0 / 0.0, 0.0 / 0.0, 10.0],
    [
      0.1,
      0.0 / 0.0,
      -1.0 / 0.0,
      0.0 / 0.0,
      1.0,
      0.0 / 0.0,
      -1.0 / 0.0,
      0.0 / 0.0,
      10.0,
      0.0 / 0.0,
    ],
  )
}

///|
test "MaxN original step validation 29 set_params" {
  let locator = @ticker.MaxNLocator::new(
    nbins=@ticker.MaxNBins::Count(3),
    prune="lower",
  )
  locator.set_params(
    nbins=@ticker.MaxNBins::Count(4),
    symmetric=true,
    prune=Some("upper"),
    min_n_ticks=5,
    steps=Some(
      @ticker.TickValues::from_array([
        1.0,
        0.0 / 0.0,
        -1.0 / 0.0,
        0.0 / 0.0,
        10.0,
      ]),
    ),
    integer=true,
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(4),
    true,
    true,
    Some("upper"),
    5,
    [1.0, 0.0 / 0.0, -1.0 / 0.0, 0.0 / 0.0, 10.0],
    [
      0.1,
      0.0 / 0.0,
      -1.0 / 0.0,
      0.0 / 0.0,
      1.0,
      0.0 / 0.0,
      -1.0 / 0.0,
      0.0 / 0.0,
      10.0,
      0.0 / 0.0,
    ],
  )
}

///|
test "MaxN original step validation 30 constructor" {
  let locator = @ticker.MaxNLocator::new(
    steps=@ticker.TickValues::from_array([
      1.0,
      0.0 / 0.0,
      1.0 / 0.0,
      0.0 / 0.0,
      10.0,
    ]),
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(10),
    false,
    false,
    None,
    2,
    [1.0, 0.0 / 0.0, 1.0 / 0.0, 0.0 / 0.0, 10.0],
    [
      0.1,
      0.0 / 0.0,
      1.0 / 0.0,
      0.0 / 0.0,
      1.0,
      0.0 / 0.0,
      1.0 / 0.0,
      0.0 / 0.0,
      10.0,
      0.0 / 0.0,
    ],
  )
}

///|
test "MaxN original step validation 31 set_params" {
  let locator = @ticker.MaxNLocator::new(
    nbins=@ticker.MaxNBins::Count(3),
    prune="lower",
  )
  locator.set_params(
    nbins=@ticker.MaxNBins::Count(4),
    symmetric=true,
    prune=Some("upper"),
    min_n_ticks=5,
    steps=Some(
      @ticker.TickValues::from_array([
        1.0,
        0.0 / 0.0,
        1.0 / 0.0,
        0.0 / 0.0,
        10.0,
      ]),
    ),
    integer=true,
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(4),
    true,
    true,
    Some("upper"),
    5,
    [1.0, 0.0 / 0.0, 1.0 / 0.0, 0.0 / 0.0, 10.0],
    [
      0.1,
      0.0 / 0.0,
      1.0 / 0.0,
      0.0 / 0.0,
      1.0,
      0.0 / 0.0,
      1.0 / 0.0,
      0.0 / 0.0,
      10.0,
      0.0 / 0.0,
    ],
  )
}

///|
test "MaxN original step validation 32 constructor" {
  assert_true(
    try {
      ignore(
        @ticker.MaxNLocator::new(
          steps=@ticker.TickValues::from_array([1.0, -0.0, 10.0]),
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "MaxN original step validation 33 set_params" {
  let locator = @ticker.MaxNLocator::new(
    nbins=@ticker.MaxNBins::Count(3),
    prune="lower",
  )
  assert_true(
    try {
      ignore(
        locator.set_params(
          nbins=@ticker.MaxNBins::Count(4),
          symmetric=true,
          prune=Some("upper"),
          min_n_ticks=5,
          steps=Some(@ticker.TickValues::from_array([1.0, -0.0, 10.0])),
          integer=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(4),
    false,
    true,
    Some("upper"),
    5,
    [1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0],
    [
      0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
      0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
    ],
  )
}

///|
test "MaxN original step validation 34 constructor" {
  let locator = @ticker.MaxNLocator::new(
    steps=@ticker.TickValues::from_array([1.0, 1.0000000000000002, 10.0]),
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(10),
    false,
    false,
    None,
    2,
    [1.0, 1.0000000000000002, 10.0],
    [
      0.1, 0.10000000000000003, 1.0, 1.0000000000000002, 10.0, 10.000000000000002,
    ],
  )
}

///|
test "MaxN original step validation 35 set_params" {
  let locator = @ticker.MaxNLocator::new(
    nbins=@ticker.MaxNBins::Count(3),
    prune="lower",
  )
  locator.set_params(
    nbins=@ticker.MaxNBins::Count(4),
    symmetric=true,
    prune=Some("upper"),
    min_n_ticks=5,
    steps=Some(@ticker.TickValues::from_array([1.0, 1.0000000000000002, 10.0])),
    integer=true,
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(4),
    true,
    true,
    Some("upper"),
    5,
    [1.0, 1.0000000000000002, 10.0],
    [
      0.1, 0.10000000000000003, 1.0, 1.0000000000000002, 10.0, 10.000000000000002,
    ],
  )
}

///|
test "MaxN original step validation 36 constructor" {
  assert_true(
    try {
      ignore(
        @ticker.MaxNLocator::new(
          steps=@ticker.TickValues::from_array([1.0, 5.0e-324, 10.0]),
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "MaxN original step validation 37 set_params" {
  let locator = @ticker.MaxNLocator::new(
    nbins=@ticker.MaxNBins::Count(3),
    prune="lower",
  )
  assert_true(
    try {
      ignore(
        locator.set_params(
          nbins=@ticker.MaxNBins::Count(4),
          symmetric=true,
          prune=Some("upper"),
          min_n_ticks=5,
          steps=Some(@ticker.TickValues::from_array([1.0, 5.0e-324, 10.0])),
          integer=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(4),
    false,
    true,
    Some("upper"),
    5,
    [1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0],
    [
      0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
      0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
    ],
  )
}

///|
test "MaxN original step validation 38 constructor" {
  let locator = @ticker.MaxNLocator::new(
    steps=@ticker.TickValues::from_array([1.0, 9.999999999999998, 10.0]),
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(10),
    false,
    false,
    None,
    2,
    [1.0, 9.999999999999998, 10.0],
    [0.1, 0.9999999999999999, 1.0, 9.999999999999998, 10.0, 99.99999999999999],
  )
}

///|
test "MaxN original step validation 39 set_params" {
  let locator = @ticker.MaxNLocator::new(
    nbins=@ticker.MaxNBins::Count(3),
    prune="lower",
  )
  locator.set_params(
    nbins=@ticker.MaxNBins::Count(4),
    symmetric=true,
    prune=Some("upper"),
    min_n_ticks=5,
    steps=Some(@ticker.TickValues::from_array([1.0, 9.999999999999998, 10.0])),
    integer=true,
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(4),
    true,
    true,
    Some("upper"),
    5,
    [1.0, 9.999999999999998, 10.0],
    [0.1, 0.9999999999999999, 1.0, 9.999999999999998, 10.0, 99.99999999999999],
  )
}

///|
test "MaxN original ordered updates explicit resets and partial failures" {
  let locator = @ticker.MaxNLocator::new(
    steps=@ticker.TickValues::from_array([1.0, 2.0, 10.0]),
    prune="upper",
  )
  locator.set_params()
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(10),
    false,
    false,
    Some("upper"),
    2,
    [1.0, 2.0, 10.0],
    [0.1, 0.2, 1.0, 2.0, 10.0, 20.0],
  )
  locator.set_params(nbins=@ticker.MaxNBins::Auto)
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Auto,
    false,
    false,
    Some("upper"),
    2,
    [1.0, 2.0, 10.0],
    [0.1, 0.2, 1.0, 2.0, 10.0, 20.0],
  )
  locator.set_params(nbins=@ticker.MaxNBins::Count(0))
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(0),
    false,
    false,
    Some("upper"),
    2,
    [1.0, 2.0, 10.0],
    [0.1, 0.2, 1.0, 2.0, 10.0, 20.0],
  )
  locator.set_params(min_n_ticks=-9)
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(0),
    false,
    false,
    Some("upper"),
    1,
    [1.0, 2.0, 10.0],
    [0.1, 0.2, 1.0, 2.0, 10.0, 20.0],
  )
  locator.set_params(steps=None)
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(0),
    false,
    false,
    Some("upper"),
    1,
    [1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0],
    [
      0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
      0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
    ],
  )
  locator.set_params(prune=None)
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(0),
    false,
    false,
    None,
    1,
    [1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0],
    [
      0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
      0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
    ],
  )
  assert_true(
    try {
      ignore(
        locator.set_params(
          nbins=@ticker.MaxNBins::Count(7),
          symmetric=true,
          prune=Some("bad"),
          min_n_ticks=9,
          steps=Some(@ticker.TickValues::from_array([1.0, 5.0, 10.0])),
          integer=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(7),
    false,
    true,
    None,
    1,
    [1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0],
    [
      0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
      0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
    ],
  )
  assert_true(
    try {
      ignore(
        locator.set_params(
          nbins=@ticker.MaxNBins::Count(9),
          symmetric=false,
          prune=Some("both"),
          min_n_ticks=5,
          steps=Some(@ticker.TickValues::from_array([])),
          integer=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(9),
    false,
    false,
    Some("both"),
    5,
    [1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0],
    [
      0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
      0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
    ],
  )
  locator.set_params(
    steps=Some(@ticker.TickValues::from_array([2.0, 4.0, 8.0])),
    min_n_ticks=3,
    integer=true,
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(9),
    true,
    false,
    Some("both"),
    3,
    [1.0, 2.0, 4.0, 8.0, 10.0],
    [0.1, 0.2, 0.4, 0.8, 1.0, 2.0, 4.0, 8.0, 10.0, 20.0],
  )
  locator.set_params(integer=false, prune=None)
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(9),
    false,
    false,
    None,
    3,
    [1.0, 2.0, 4.0, 8.0, 10.0],
    [0.1, 0.2, 0.4, 0.8, 1.0, 2.0, 4.0, 8.0, 10.0, 20.0],
  )
  locator.set_params(steps=None, prune=Some("lower"))
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(9),
    false,
    false,
    Some("lower"),
    3,
    [1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0],
    [
      0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001,
      0.8, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0,
    ],
  )
  locator.set_params(
    steps=Some(@ticker.TickValues::from_array([1.0, 0.0 / 0.0, 10.0])),
    integer=true,
  )
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(9),
    true,
    false,
    Some("lower"),
    3,
    [1.0, 0.0 / 0.0, 10.0],
    [0.1, 0.0 / 0.0, 1.0, 0.0 / 0.0, 10.0, 0.0 / 0.0],
  )
}

///|
test "MaxN original step alias borrowed contiguous" {
  let owner = [1.0, 2.0, 5.0, 10.0]
  let selected = @ticker.TickValues::from_array(owner)
  let locator = @ticker.MaxNLocator::new(steps=selected)
  let shallow = locator.copy()
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(10),
    false,
    false,
    None,
    2,
    [1.0, 2.0, 5.0, 10.0],
    [0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0],
  )
  owner[0] = 1.125
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(10),
    false,
    false,
    None,
    2,
    [1.125, 2.0, 5.0, 10.0],
    [0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0],
  )
  locator.steps().set(-1, 9.0)
  verify_maxn_params_values(owner, [1.125, 2.0, 5.0, 9.0])
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(10),
    false,
    false,
    None,
    2,
    [1.125, 2.0, 5.0, 9.0],
    [0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0],
  )
  verify_maxn_params_state(
    shallow,
    @ticker.MaxNBins::Count(10),
    false,
    false,
    None,
    2,
    [1.125, 2.0, 5.0, 9.0],
    [0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0],
  )
  shallow.set_params(steps=None, integer=true)
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(10),
    false,
    false,
    None,
    2,
    [1.125, 2.0, 5.0, 9.0],
    [0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0],
  )
  verify_maxn_params_state(
    shallow,
    @ticker.MaxNBins::Count(10),
    true,
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
test "MaxN original step alias borrowed signed" {
  let owner = [10.0, 5.0, 2.0, 1.0]
  let selected = @ticker.TickValues::from_array(owner).view(-1, -1, 4)
  let locator = @ticker.MaxNLocator::new(steps=selected)
  let shallow = locator.copy()
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(10),
    false,
    false,
    None,
    2,
    [1.0, 2.0, 5.0, 10.0],
    [0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0],
  )
  owner[3] = 1.125
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(10),
    false,
    false,
    None,
    2,
    [1.125, 2.0, 5.0, 10.0],
    [0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0],
  )
  locator.steps().set(-1, 9.0)
  verify_maxn_params_values(owner, [9.0, 5.0, 2.0, 1.125])
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(10),
    false,
    false,
    None,
    2,
    [1.125, 2.0, 5.0, 9.0],
    [0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0],
  )
  verify_maxn_params_state(
    shallow,
    @ticker.MaxNBins::Count(10),
    false,
    false,
    None,
    2,
    [1.125, 2.0, 5.0, 9.0],
    [0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0],
  )
  shallow.set_params(steps=None, integer=true)
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(10),
    false,
    false,
    None,
    2,
    [1.125, 2.0, 5.0, 9.0],
    [0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0],
  )
  verify_maxn_params_state(
    shallow,
    @ticker.MaxNBins::Count(10),
    true,
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
test "MaxN original step alias borrowed nested" {
  let owner = [10.0, 0.0, 5.0, 0.0, 2.0, 0.0, 1.0]
  let selected = @ticker.TickValues::from_array(owner)
    .view(0, 1, 7)
    .view(6, -2, 4)
  let locator = @ticker.MaxNLocator::new(steps=selected)
  let shallow = locator.copy()
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(10),
    false,
    false,
    None,
    2,
    [1.0, 2.0, 5.0, 10.0],
    [0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0],
  )
  owner[6] = 1.125
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(10),
    false,
    false,
    None,
    2,
    [1.125, 2.0, 5.0, 10.0],
    [0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0],
  )
  locator.steps().set(-1, 9.0)
  verify_maxn_params_values(owner, [9.0, 0.0, 5.0, 0.0, 2.0, 0.0, 1.125])
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(10),
    false,
    false,
    None,
    2,
    [1.125, 2.0, 5.0, 9.0],
    [0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0],
  )
  verify_maxn_params_state(
    shallow,
    @ticker.MaxNBins::Count(10),
    false,
    false,
    None,
    2,
    [1.125, 2.0, 5.0, 9.0],
    [0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0],
  )
  shallow.set_params(steps=None, integer=true)
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(10),
    false,
    false,
    None,
    2,
    [1.125, 2.0, 5.0, 9.0],
    [0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0],
  )
  verify_maxn_params_state(
    shallow,
    @ticker.MaxNBins::Count(10),
    true,
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
test "MaxN original step alias borrowed NaN interior" {
  let owner = [1.0, 0.0 / 0.0, 10.0]
  let selected = @ticker.TickValues::from_array(owner)
  let locator = @ticker.MaxNLocator::new(steps=selected)
  let shallow = locator.copy()
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(10),
    false,
    false,
    None,
    2,
    [1.0, 0.0 / 0.0, 10.0],
    [0.1, 0.0 / 0.0, 1.0, 0.0 / 0.0, 10.0, 0.0 / 0.0],
  )
  owner[0] = 1.125
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(10),
    false,
    false,
    None,
    2,
    [1.125, 0.0 / 0.0, 10.0],
    [0.1, 0.0 / 0.0, 1.0, 0.0 / 0.0, 10.0, 0.0 / 0.0],
  )
  locator.steps().set(-1, 9.0)
  verify_maxn_params_values(owner, [1.125, 0.0 / 0.0, 9.0])
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(10),
    false,
    false,
    None,
    2,
    [1.125, 0.0 / 0.0, 9.0],
    [0.1, 0.0 / 0.0, 1.0, 0.0 / 0.0, 10.0, 0.0 / 0.0],
  )
  verify_maxn_params_state(
    shallow,
    @ticker.MaxNBins::Count(10),
    false,
    false,
    None,
    2,
    [1.125, 0.0 / 0.0, 9.0],
    [0.1, 0.0 / 0.0, 1.0, 0.0 / 0.0, 10.0, 0.0 / 0.0],
  )
  shallow.set_params(steps=None, integer=true)
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(10),
    false,
    false,
    None,
    2,
    [1.125, 0.0 / 0.0, 9.0],
    [0.1, 0.0 / 0.0, 1.0, 0.0 / 0.0, 10.0, 0.0 / 0.0],
  )
  verify_maxn_params_state(
    shallow,
    @ticker.MaxNBins::Count(10),
    true,
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
test "MaxN original step alias prepend copy" {
  let owner = [2.0, 4.0, 10.0]
  let selected = @ticker.TickValues::from_array(owner)
  let locator = @ticker.MaxNLocator::new(steps=selected)
  let shallow = locator.copy()
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(10),
    false,
    false,
    None,
    2,
    [1.0, 2.0, 4.0, 10.0],
    [0.1, 0.2, 0.4, 1.0, 2.0, 4.0, 10.0, 20.0],
  )
  owner[0] = 1.125
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(10),
    false,
    false,
    None,
    2,
    [1.0, 2.0, 4.0, 10.0],
    [0.1, 0.2, 0.4, 1.0, 2.0, 4.0, 10.0, 20.0],
  )
  locator.steps().set(-1, 9.0)
  verify_maxn_params_values(owner, [1.125, 4.0, 10.0])
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(10),
    false,
    false,
    None,
    2,
    [1.0, 2.0, 4.0, 9.0],
    [0.1, 0.2, 0.4, 1.0, 2.0, 4.0, 10.0, 20.0],
  )
  verify_maxn_params_state(
    shallow,
    @ticker.MaxNBins::Count(10),
    false,
    false,
    None,
    2,
    [1.0, 2.0, 4.0, 9.0],
    [0.1, 0.2, 0.4, 1.0, 2.0, 4.0, 10.0, 20.0],
  )
  shallow.set_params(steps=None, integer=true)
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(10),
    false,
    false,
    None,
    2,
    [1.0, 2.0, 4.0, 9.0],
    [0.1, 0.2, 0.4, 1.0, 2.0, 4.0, 10.0, 20.0],
  )
  verify_maxn_params_state(
    shallow,
    @ticker.MaxNBins::Count(10),
    true,
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
test "MaxN original step alias append copy" {
  let owner = [1.0, 2.0, 8.0]
  let selected = @ticker.TickValues::from_array(owner)
  let locator = @ticker.MaxNLocator::new(steps=selected)
  let shallow = locator.copy()
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(10),
    false,
    false,
    None,
    2,
    [1.0, 2.0, 8.0, 10.0],
    [0.1, 0.2, 0.8, 1.0, 2.0, 8.0, 10.0, 20.0],
  )
  owner[0] = 1.125
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(10),
    false,
    false,
    None,
    2,
    [1.0, 2.0, 8.0, 10.0],
    [0.1, 0.2, 0.8, 1.0, 2.0, 8.0, 10.0, 20.0],
  )
  locator.steps().set(-1, 9.0)
  verify_maxn_params_values(owner, [1.125, 2.0, 8.0])
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(10),
    false,
    false,
    None,
    2,
    [1.0, 2.0, 8.0, 9.0],
    [0.1, 0.2, 0.8, 1.0, 2.0, 8.0, 10.0, 20.0],
  )
  verify_maxn_params_state(
    shallow,
    @ticker.MaxNBins::Count(10),
    false,
    false,
    None,
    2,
    [1.0, 2.0, 8.0, 9.0],
    [0.1, 0.2, 0.8, 1.0, 2.0, 8.0, 10.0, 20.0],
  )
  shallow.set_params(steps=None, integer=true)
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(10),
    false,
    false,
    None,
    2,
    [1.0, 2.0, 8.0, 9.0],
    [0.1, 0.2, 0.8, 1.0, 2.0, 8.0, 10.0, 20.0],
  )
  verify_maxn_params_state(
    shallow,
    @ticker.MaxNBins::Count(10),
    true,
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
test "MaxN original step alias prepend append copy" {
  let owner = [2.0, 4.0, 8.0]
  let selected = @ticker.TickValues::from_array(owner)
  let locator = @ticker.MaxNLocator::new(steps=selected)
  let shallow = locator.copy()
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(10),
    false,
    false,
    None,
    2,
    [1.0, 2.0, 4.0, 8.0, 10.0],
    [0.1, 0.2, 0.4, 0.8, 1.0, 2.0, 4.0, 8.0, 10.0, 20.0],
  )
  owner[0] = 1.125
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(10),
    false,
    false,
    None,
    2,
    [1.0, 2.0, 4.0, 8.0, 10.0],
    [0.1, 0.2, 0.4, 0.8, 1.0, 2.0, 4.0, 8.0, 10.0, 20.0],
  )
  locator.steps().set(-1, 9.0)
  verify_maxn_params_values(owner, [1.125, 4.0, 8.0])
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(10),
    false,
    false,
    None,
    2,
    [1.0, 2.0, 4.0, 8.0, 9.0],
    [0.1, 0.2, 0.4, 0.8, 1.0, 2.0, 4.0, 8.0, 10.0, 20.0],
  )
  verify_maxn_params_state(
    shallow,
    @ticker.MaxNBins::Count(10),
    false,
    false,
    None,
    2,
    [1.0, 2.0, 4.0, 8.0, 9.0],
    [0.1, 0.2, 0.4, 0.8, 1.0, 2.0, 4.0, 8.0, 10.0, 20.0],
  )
  shallow.set_params(steps=None, integer=true)
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(10),
    false,
    false,
    None,
    2,
    [1.0, 2.0, 4.0, 8.0, 9.0],
    [0.1, 0.2, 0.4, 0.8, 1.0, 2.0, 4.0, 8.0, 10.0, 20.0],
  )
  verify_maxn_params_state(
    shallow,
    @ticker.MaxNBins::Count(10),
    true,
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
test "MaxN original step alias strided normalized copy" {
  let owner = [0.0, 2.0, 99.0, 4.0, 99.0, 8.0]
  let selected = @ticker.TickValues::from_array(owner).view(1, 2, 3)
  let locator = @ticker.MaxNLocator::new(steps=selected)
  let shallow = locator.copy()
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(10),
    false,
    false,
    None,
    2,
    [1.0, 2.0, 4.0, 8.0, 10.0],
    [0.1, 0.2, 0.4, 0.8, 1.0, 2.0, 4.0, 8.0, 10.0, 20.0],
  )
  owner[1] = 1.125
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(10),
    false,
    false,
    None,
    2,
    [1.0, 2.0, 4.0, 8.0, 10.0],
    [0.1, 0.2, 0.4, 0.8, 1.0, 2.0, 4.0, 8.0, 10.0, 20.0],
  )
  locator.steps().set(-1, 9.0)
  verify_maxn_params_values(owner, [0.0, 1.125, 99.0, 4.0, 99.0, 8.0])
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(10),
    false,
    false,
    None,
    2,
    [1.0, 2.0, 4.0, 8.0, 9.0],
    [0.1, 0.2, 0.4, 0.8, 1.0, 2.0, 4.0, 8.0, 10.0, 20.0],
  )
  verify_maxn_params_state(
    shallow,
    @ticker.MaxNBins::Count(10),
    false,
    false,
    None,
    2,
    [1.0, 2.0, 4.0, 8.0, 9.0],
    [0.1, 0.2, 0.4, 0.8, 1.0, 2.0, 4.0, 8.0, 10.0, 20.0],
  )
  shallow.set_params(steps=None, integer=true)
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(10),
    false,
    false,
    None,
    2,
    [1.0, 2.0, 4.0, 8.0, 9.0],
    [0.1, 0.2, 0.4, 0.8, 1.0, 2.0, 4.0, 8.0, 10.0, 20.0],
  )
  verify_maxn_params_state(
    shallow,
    @ticker.MaxNBins::Count(10),
    true,
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
test "MaxN original step alias zero stride NaN copy" {
  let owner = [0.0 / 0.0]
  let selected = @ticker.TickValues::from_array(owner).view(0, 0, 3)
  let locator = @ticker.MaxNLocator::new(steps=selected)
  let shallow = locator.copy()
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(10),
    false,
    false,
    None,
    2,
    [1.0, 0.0 / 0.0, 0.0 / 0.0, 0.0 / 0.0, 10.0],
    [
      0.1,
      0.0 / 0.0,
      0.0 / 0.0,
      0.0 / 0.0,
      1.0,
      0.0 / 0.0,
      0.0 / 0.0,
      0.0 / 0.0,
      10.0,
      0.0 / 0.0,
    ],
  )
  owner[0] = 1.125
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(10),
    false,
    false,
    None,
    2,
    [1.0, 0.0 / 0.0, 0.0 / 0.0, 0.0 / 0.0, 10.0],
    [
      0.1,
      0.0 / 0.0,
      0.0 / 0.0,
      0.0 / 0.0,
      1.0,
      0.0 / 0.0,
      0.0 / 0.0,
      0.0 / 0.0,
      10.0,
      0.0 / 0.0,
    ],
  )
  locator.steps().set(-1, 9.0)
  verify_maxn_params_values(owner, [1.125])
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(10),
    false,
    false,
    None,
    2,
    [1.0, 0.0 / 0.0, 0.0 / 0.0, 0.0 / 0.0, 9.0],
    [
      0.1,
      0.0 / 0.0,
      0.0 / 0.0,
      0.0 / 0.0,
      1.0,
      0.0 / 0.0,
      0.0 / 0.0,
      0.0 / 0.0,
      10.0,
      0.0 / 0.0,
    ],
  )
  verify_maxn_params_state(
    shallow,
    @ticker.MaxNBins::Count(10),
    false,
    false,
    None,
    2,
    [1.0, 0.0 / 0.0, 0.0 / 0.0, 0.0 / 0.0, 9.0],
    [
      0.1,
      0.0 / 0.0,
      0.0 / 0.0,
      0.0 / 0.0,
      1.0,
      0.0 / 0.0,
      0.0 / 0.0,
      0.0 / 0.0,
      10.0,
      0.0 / 0.0,
    ],
  )
  shallow.set_params(steps=None, integer=true)
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(10),
    false,
    false,
    None,
    2,
    [1.0, 0.0 / 0.0, 0.0 / 0.0, 0.0 / 0.0, 9.0],
    [
      0.1,
      0.0 / 0.0,
      0.0 / 0.0,
      0.0 / 0.0,
      1.0,
      0.0 / 0.0,
      0.0 / 0.0,
      0.0 / 0.0,
      10.0,
      0.0 / 0.0,
    ],
  )
  verify_maxn_params_state(
    shallow,
    @ticker.MaxNBins::Count(10),
    true,
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
test "MaxN original step alias zero stride single append copy" {
  let owner = [1.0]
  let selected = @ticker.TickValues::from_array(owner).view(0, 0, 1)
  let locator = @ticker.MaxNLocator::new(steps=selected)
  let shallow = locator.copy()
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(10),
    false,
    false,
    None,
    2,
    [1.0, 10.0],
    [0.1, 1.0, 10.0, 100.0],
  )
  owner[0] = 1.125
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(10),
    false,
    false,
    None,
    2,
    [1.0, 10.0],
    [0.1, 1.0, 10.0, 100.0],
  )
  locator.steps().set(-1, 9.0)
  verify_maxn_params_values(owner, [1.125])
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(10),
    false,
    false,
    None,
    2,
    [1.0, 9.0],
    [0.1, 1.0, 10.0, 100.0],
  )
  verify_maxn_params_state(
    shallow,
    @ticker.MaxNBins::Count(10),
    false,
    false,
    None,
    2,
    [1.0, 9.0],
    [0.1, 1.0, 10.0, 100.0],
  )
  shallow.set_params(steps=None, integer=true)
  verify_maxn_params_state(
    locator,
    @ticker.MaxNBins::Count(10),
    false,
    false,
    None,
    2,
    [1.0, 9.0],
    [0.1, 1.0, 10.0, 100.0],
  )
  verify_maxn_params_state(
    shallow,
    @ticker.MaxNBins::Count(10),
    true,
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
test "MaxN original shallow binding live context and independent copy rebind" {
  let space = Ref(5.0)
  let bounds = Ref((0.0, 1.0))
  let locator = @ticker.MaxNLocator::new()
  locator.bind_tick_space(() => space.val)
  locator.bind_view_interval(() => bounds.val)
  let shallow = locator.copy()
  assert_eq(locator.tick_space_provider().unwrap()(), 5.0)
  let view_locator_0 = locator.view_interval_provider().unwrap()()
  verify_maxn_params_values([view_locator_0.0, view_locator_0.1], [0.0, 1.0])
  assert_eq(shallow.tick_space_provider().unwrap()(), 5.0)
  let view_shallow_0 = shallow.view_interval_provider().unwrap()()
  verify_maxn_params_values([view_shallow_0.0, view_shallow_0.1], [0.0, 1.0])
  space.val = 7.0
  bounds.val = (1.0, 5.0)
  assert_eq(locator.tick_space_provider().unwrap()(), 7.0)
  let view_locator_1 = locator.view_interval_provider().unwrap()()
  verify_maxn_params_values([view_locator_1.0, view_locator_1.1], [1.0, 5.0])
  assert_eq(shallow.tick_space_provider().unwrap()(), 7.0)
  let view_shallow_1 = shallow.view_interval_provider().unwrap()()
  verify_maxn_params_values([view_shallow_1.0, view_shallow_1.1], [1.0, 5.0])
  shallow.bind_tick_space(() => 3.0)
  shallow.bind_view_interval(() => (-2.0, 4.0))
  assert_eq(locator.tick_space_provider().unwrap()(), 7.0)
  let view_locator_2 = locator.view_interval_provider().unwrap()()
  verify_maxn_params_values([view_locator_2.0, view_locator_2.1], [1.0, 5.0])
  assert_eq(shallow.tick_space_provider().unwrap()(), 3.0)
  let view_shallow_2 = shallow.view_interval_provider().unwrap()()
  verify_maxn_params_values([view_shallow_2.0, view_shallow_2.1], [-2.0, 4.0])
}
