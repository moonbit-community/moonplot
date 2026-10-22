// Generated from original pinned NullLocator and transforms AST.

///|
fn verify_null_axis_numbers(
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
test "Null original range 0" {
  let locator = @ticker.NullLocator::new()
  assert_eq(locator.call(), [])
  assert_eq(locator.tick_values(0.0, 0.0), [])
  let (lower, upper) = locator.view_limits(0.0, 0.0)
  verify_null_axis_numbers([lower, upper], [-0.001, 0.001])
  let (lower, upper) = locator.nonsingular(0.0, 0.0)
  verify_null_axis_numbers([lower, upper], [-0.05, 0.05])
}

///|
test "Null original range 1" {
  let locator = @ticker.NullLocator::new()
  assert_eq(locator.call(), [])
  assert_eq(locator.tick_values(1.0, 1.0), [])
  let (lower, upper) = locator.view_limits(1.0, 1.0)
  verify_null_axis_numbers([lower, upper], [0.999, 1.001])
  let (lower, upper) = locator.nonsingular(1.0, 1.0)
  verify_null_axis_numbers([lower, upper], [0.95, 1.05])
}

///|
test "Null original range 2" {
  let locator = @ticker.NullLocator::new()
  assert_eq(locator.call(), [])
  assert_eq(locator.tick_values(-1.0, -1.0), [])
  let (lower, upper) = locator.view_limits(-1.0, -1.0)
  verify_null_axis_numbers([lower, upper], [-1.001, -0.999])
  let (lower, upper) = locator.nonsingular(-1.0, -1.0)
  verify_null_axis_numbers([lower, upper], [-1.05, -0.95])
}

///|
test "Null original range 3" {
  let locator = @ticker.NullLocator::new()
  assert_eq(locator.call(), [])
  assert_eq(locator.tick_values(2.0, -3.0), [])
  let (lower, upper) = locator.view_limits(2.0, -3.0)
  verify_null_axis_numbers([lower, upper], [-3.0, 2.0])
  let (lower, upper) = locator.nonsingular(2.0, -3.0)
  verify_null_axis_numbers([lower, upper], [-3.0, 2.0])
}

///|
test "Null original range 4" {
  let locator = @ticker.NullLocator::new()
  assert_eq(locator.call(), [])
  assert_eq(locator.tick_values(0.0 / 0.0, 1.0 / 0.0), [])
  let (lower, upper) = locator.view_limits(0.0 / 0.0, 1.0 / 0.0)
  verify_null_axis_numbers([lower, upper], [-0.001, 0.001])
  let (lower, upper) = locator.nonsingular(0.0 / 0.0, 1.0 / 0.0)
  verify_null_axis_numbers([lower, upper], [-0.05, 0.05])
}

///|
test "Null original range 5" {
  let locator = @ticker.NullLocator::new()
  assert_eq(locator.call(), [])
  assert_eq(locator.tick_values(1.0 / 0.0, -1.0 / 0.0), [])
  let (lower, upper) = locator.view_limits(1.0 / 0.0, -1.0 / 0.0)
  verify_null_axis_numbers([lower, upper], [-0.001, 0.001])
  let (lower, upper) = locator.nonsingular(1.0 / 0.0, -1.0 / 0.0)
  verify_null_axis_numbers([lower, upper], [-0.05, 0.05])
}

///|
test "Null original range 6" {
  let locator = @ticker.NullLocator::new()
  assert_eq(locator.call(), [])
  assert_eq(locator.tick_values(-0.0, 0.0), [])
  let (lower, upper) = locator.view_limits(-0.0, 0.0)
  verify_null_axis_numbers([lower, upper], [-0.001, 0.001])
  let (lower, upper) = locator.nonsingular(-0.0, 0.0)
  verify_null_axis_numbers([lower, upper], [-0.05, 0.05])
}

///|
test "Null original range 7" {
  let locator = @ticker.NullLocator::new()
  assert_eq(locator.call(), [])
  assert_eq(locator.tick_values(5.0e-324, 5.0e-324), [])
  let (lower, upper) = locator.view_limits(5.0e-324, 5.0e-324)
  verify_null_axis_numbers([lower, upper], [-0.001, 0.001])
  let (lower, upper) = locator.nonsingular(5.0e-324, 5.0e-324)
  verify_null_axis_numbers([lower, upper], [-0.05, 0.05])
}

///|
test "Null original range 8" {
  let locator = @ticker.NullLocator::new()
  assert_eq(locator.call(), [])
  assert_eq(locator.tick_values(1.0e-300, 2.0e-300), [])
  let (lower, upper) = locator.view_limits(1.0e-300, 2.0e-300)
  verify_null_axis_numbers([lower, upper], [-0.001, 0.001])
  let (lower, upper) = locator.nonsingular(1.0e-300, 2.0e-300)
  verify_null_axis_numbers([lower, upper], [-0.05, 0.05])
}

///|
test "Null original range 9" {
  let locator = @ticker.NullLocator::new()
  assert_eq(locator.call(), [])
  assert_eq(locator.tick_values(1000000000000.0, 1000000000000.0001), [])
  let (lower, upper) = locator.view_limits(1000000000000.0, 1000000000000.0001)
  verify_null_axis_numbers([lower, upper], [999000000000.0, 1001000000000.0001])
  let (lower, upper) = locator.nonsingular(1000000000000.0, 1000000000000.0001)
  verify_null_axis_numbers([lower, upper], [950000000000.0, 1050000000000.0001])
}

///|
test "Null original range 10" {
  let locator = @ticker.NullLocator::new()
  assert_eq(locator.call(), [])
  assert_eq(locator.tick_values(-1.0e+308, 1.0e+308), [])
  let (lower, upper) = locator.view_limits(-1.0e+308, 1.0e+308)
  verify_null_axis_numbers([lower, upper], [-1.0e+308, 1.0e+308])
  let (lower, upper) = locator.nonsingular(-1.0e+308, 1.0e+308)
  verify_null_axis_numbers([lower, upper], [-1.0e+308, 1.0e+308])
}

///|
test "Null inherited set params warning is a no op and warning snapshots are copied" {
  let locator = @ticker.NullLocator::new()
  locator.set_params()
  assert_eq(locator.warnings(), [
    "'set_params()' not defined for locator of type <class 'matplotlib.ticker.NullLocator'>",
  ])
  let previous = locator.warnings()
  previous.clear()
  assert_eq(locator.warnings().length(), 1)
  let copied = locator.copy()
  copied.set_params()
  assert_eq(copied.warnings().length(), 1)
  assert_eq(locator.warnings().length(), 1)
  assert_eq(copied.call(), [])
  assert_eq(copied.warnings(), [])
  assert_eq(locator.warnings().length(), 1)
  assert_eq(locator.tick_values(0.0 / 0.0, 1.0 / 0.0), [])
  assert_eq(locator.warnings(), [])
}
