///|
test "linear locator returns stable endpoints" {
  let locator = @ticker.linear_locator(count=4)
  assert_eq(locator.tick_values(-1.0, 2.0), [-1.0, 0.0, 1.0, 2.0])
}

///|
test "fixed locator copies and filters values" {
  let values = [0.0, 1.0, 2.0]
  let locator = try! @ticker.fixed_locator(values)
  values[1] = 100.0
  assert_eq(locator.fixed_values(), [0.0, 1.0, 2.0])
  assert_eq(locator.tick_values(0.5, 1.5), [1.0])
  try @ticker.fixed_locator([0.0, 0.0]) catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_true(message.contains("strictly increasing"))
    _ => fail("expected fixed locator ordering error")
  } noraise {
    _ => fail("expected fixed locator ordering error")
  }
}

///|
test "log locator emits positive levels" {
  let locator = try! @ticker.log_locator(base=10.0)
  assert_eq(locator.tick_values(1.0, 1000.0), [1.0, 10.0, 100.0, 1000.0])
  assert_eq(locator.tick_values(1000.0, 1.0), [1000.0, 100.0, 10.0, 1.0])
  assert_eq(locator.tick_values(-1.0, 10.0), [])
}

///|
test "log locator supports per-decade subdivisions and decade limits" {
  let locator = try! @ticker.log_locator(
    base=10.0,
    subs=[1.0, 2.0, 5.0],
    numdecs=4,
  )
  assert_eq(locator.tick_values(1.0, 100.0), [
    1.0, 2.0, 5.0, 10.0, 20.0, 50.0, 100.0,
  ])
  assert_eq(locator.tick_values(100.0, 1.0), [
    100.0, 50.0, 20.0, 10.0, 5.0, 2.0, 1.0,
  ])
  let sparse = try! @ticker.log_locator(numdecs=2, subs=[1.0])
  assert_eq(sparse.tick_values(1.0, 1000000.0), [1.0, 1000.0, 1000000.0])
  try @ticker.log_locator(subs=[]) catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_true(message.contains("subs"))
    _ => fail("expected empty subs validation")
  } noraise {
    _ => fail("expected empty subs validation")
  }
  try @ticker.log_locator(numdecs=0) catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_true(message.contains("numdecs"))
    _ => fail("expected numdecs validation")
  } noraise {
    _ => fail("expected numdecs validation")
  }
}

///|
test "maxn locator chooses nice steps and preserves direction" {
  let locator = try! @ticker.maxn_locator(count=5)
  assert_eq(locator.tick_values(0.0, 10.0), [0.0, 2.5, 5.0, 7.5, 10.0])
  assert_eq(locator.tick_values(10.0, 0.0), [10.0, 7.5, 5.0, 2.5, 0.0])
}

///|
test "maxn locator supports integer, symmetric, and pruned ticks" {
  let integer = try! @ticker.maxn_locator(count=4, integer=true)
  assert_eq(integer.tick_values(0.2, 2.8), [1.0, 2.0])
  let symmetric = try! @ticker.maxn_locator(count=5, symmetric=true)
  assert_eq(symmetric.tick_values(-1.0, 3.0), [-2.0, 0.0, 2.0])
  let pruned = try! @ticker.maxn_locator(count=4, prune="both")
  assert_eq(pruned.tick_values(0.0, 10.0), [5.0])
}

///|
test "minor locators subdivide linear and logarithmic majors" {
  let auto = try! @ticker.auto_minor_locator(subdivisions=4)
  assert_eq(auto.tick_values([0.0, 1.0, 2.0], 0.0, 2.0), [
    0.25, 0.5, 0.75, 1.25, 1.5, 1.75,
  ])
  let log = try! @ticker.log_minor_locator(base=10.0)
  assert_eq(log.tick_values([1.0, 10.0, 100.0], 1.0, 100.0), [
    2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 20.0, 30.0, 40.0, 50.0, 60.0, 70.0, 80.0,
    90.0,
  ])
}

///|
test "minor locator validates constructor arguments" {
  try @ticker.auto_minor_locator(subdivisions=0) catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_true(message.contains("subdivisions"))
    _ => fail("expected minor subdivision error")
  } noraise {
    _ => fail("expected minor subdivision error")
  }
  try @ticker.maxn_locator(prune="invalid") catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_true(message.contains("prune"))
    _ => fail("expected prune error")
  } noraise {
    _ => fail("expected prune error")
  }
}
