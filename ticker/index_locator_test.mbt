///|
test "index locator providers stay live and independent copies retain their existing binding" {
  let interval = [0.0, 4.0]
  let locator = @ticker.IndexLocator::new(base=1.0, offset=0.0)
  locator.bind_data_interval(() => (interval[0], interval[1]))
  let copied = locator.copy()
  locator.bind_data_interval(() => (10.0, 12.0))
  locator.set_params(base=2.0)
  assert_eq(locator.call(), [10.0, 12.0])
  assert_eq(copied.call(), [0.0, 1.0, 2.0, 3.0, 4.0])
  interval[0] = 2.0
  interval[1] = 5.0
  assert_eq(copied.call(), [2.0, 3.0, 4.0, 5.0])
  assert_eq(locator.call(), [10.0, 12.0])
}

///|
test "index locator tiny grids cap without losing the NumPy rounded fill step" {
  let locator = @ticker.IndexLocator::new(base=1.0e-6, offset=0.0)
  let values = locator.tick_values(0.0, 1.0)
  assert_eq(values.length(), 100000)
  assert_eq(values[0], 0.0)
  assert_eq(values[1], 1.0e-6)
  assert_eq(values[99999], 99999.0 * 1.0e-6)
  locator.set_params(base=0.1)
  assert_eq(
    locator.tick_values(1.0e16, 1.0e16 + 4.0),
    Array::makei(40, _ => 1.0e16),
  )
}

///|
test "index locator construction and updates do not sample a bound data interval" {
  let reads = [0]
  let locator = @ticker.IndexLocator::new(base=0.0, offset=0.0 / 0.0)
  locator.bind_data_interval(() => {
    reads[0] += 1
    (0.0, 1.0)
  })
  let independent = locator.copy()
  locator.set_params(base=-1.0, offset=0.25)
  assert_eq(reads[0], 0)
  assert_eq(locator.tick_values(3.0, 0.0), [3.25, 2.25, 1.25, 0.25])
  assert_eq(reads[0], 0)
  assert_true(
    try {
      ignore(independent.call())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(reads[0], 1)
}

///|
test "index locator fill preserves the fixed NumPy fused multiply add profile" {
  let locator = @ticker.IndexLocator::new(base=0.1, offset=0.0)
  let values = locator.tick_values(0.2, 3.2)
  assert_eq(
    values[7].reinterpret_as_uint64(),
    0.9000000000000002.reinterpret_as_uint64(),
  )
  assert_eq(
    values[14].reinterpret_as_uint64(),
    1.6000000000000005.reinterpret_as_uint64(),
  )
  assert_eq(
    values[15].reinterpret_as_uint64(),
    1.7000000000000006.reinterpret_as_uint64(),
  )
}
