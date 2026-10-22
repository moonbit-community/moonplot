// Generated original LinearLocator and NumPy linspace source observations.

///|
fn verify_linear_reference_values(
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
fn verify_linear_reference_limits(
  actual : (Double, Double),
  expected : Array[Double],
) -> Unit raise {
  verify_linear_reference_values([actual.0, actual.1], expected)
}

///|
test "LinearLocator original 0 count None" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new()
  assert_eq(locator.numticks(), 11)
  assert_eq(locator.configured_numticks(), None)
  verify_linear_reference_values(locator.tick_values(-1.0, 1.0).to_array(), [
    -1.0, -0.8, -0.6, -0.3999999999999999, -0.19999999999999996, 0.0, 0.20000000000000018,
    0.40000000000000013, 0.6000000000000001, 0.8, 1.0,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(-1.0, 1.0), [-1.0, 1.0])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_linear_reference_limits(locator.view_limits(-1.0, 1.0), [-1.0, 1.0])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(-1.0, 1.0), [-1.0, 1.0])
  verify_linear_reference_limits(locator.nonsingular(-1.0, 1.0), [-1.0, 1.0])
}

///|
test "LinearLocator original 1 count None" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new()
  assert_eq(locator.numticks(), 11)
  assert_eq(locator.configured_numticks(), None)
  verify_linear_reference_values(locator.tick_values(1.0, -1.0).to_array(), [
    -1.0, -0.8, -0.6, -0.3999999999999999, -0.19999999999999996, 0.0, 0.20000000000000018,
    0.40000000000000013, 0.6000000000000001, 0.8, 1.0,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(1.0, -1.0), [-1.0, 1.0])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_linear_reference_limits(locator.view_limits(1.0, -1.0), [-1.0, 1.0])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(1.0, -1.0), [-1.0, 1.0])
  verify_linear_reference_limits(locator.nonsingular(1.0, -1.0), [-1.0, 1.0])
}

///|
test "LinearLocator original 2 count None" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new()
  assert_eq(locator.numticks(), 11)
  assert_eq(locator.configured_numticks(), None)
  verify_linear_reference_values(locator.tick_values(0.0, 0.0).to_array(), [
    -0.05, -0.04, -0.030000000000000002, -0.020000000000000004, -0.010000000000000002,
    0.0, 0.009999999999999995, 0.020000000000000004, 0.03, 0.039999999999999994,
    0.05,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0, 0.0), [-1.0, 1.0])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_linear_reference_limits(locator.view_limits(0.0, 0.0), [-1.0, 1.0])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0, 0.0), [-1.0, 1.0])
  verify_linear_reference_limits(locator.nonsingular(0.0, 0.0), [-0.05, 0.05])
}

///|
test "LinearLocator original 3 count None" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new()
  assert_eq(locator.numticks(), 11)
  assert_eq(locator.configured_numticks(), None)
  verify_linear_reference_values(locator.tick_values(-0.0, -0.0).to_array(), [
    -0.05, -0.04, -0.030000000000000002, -0.020000000000000004, -0.010000000000000002,
    0.0, 0.009999999999999995, 0.020000000000000004, 0.03, 0.039999999999999994,
    0.05,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(-0.0, -0.0), [-1.0, 1.0])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_linear_reference_limits(locator.view_limits(-0.0, -0.0), [-1.0, 1.0])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(-0.0, -0.0), [-1.0, 1.0])
  verify_linear_reference_limits(locator.nonsingular(-0.0, -0.0), [-0.05, 0.05])
}

///|
test "LinearLocator original 4 count None" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new()
  assert_eq(locator.numticks(), 11)
  assert_eq(locator.configured_numticks(), None)
  verify_linear_reference_values(locator.tick_values(2.0, 2.0).to_array(), [
    1.9, 1.92, 1.94, 1.96, 1.98, 2.0, 2.02, 2.04, 2.06, 2.08, 2.1,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(2.0, 2.0), [1.0, 3.0])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_linear_reference_limits(locator.view_limits(2.0, 2.0), [1.0, 3.0])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(2.0, 2.0), [1.0, 3.0])
  verify_linear_reference_limits(locator.nonsingular(2.0, 2.0), [1.9, 2.1])
}

///|
test "LinearLocator original 5 count None" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new()
  assert_eq(locator.numticks(), 11)
  assert_eq(locator.configured_numticks(), None)
  verify_linear_reference_values(locator.tick_values(-2.0, -2.0).to_array(), [
    -2.1, -2.08, -2.06, -2.04, -2.02, -2.0, -1.98, -1.96, -1.94, -1.92, -1.9,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(-2.0, -2.0), [-3.0, -1.0])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_linear_reference_limits(locator.view_limits(-2.0, -2.0), [-3.0, -1.0])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(-2.0, -2.0), [-3.0, -1.0])
  verify_linear_reference_limits(locator.nonsingular(-2.0, -2.0), [-2.1, -1.9])
}

///|
test "LinearLocator original 6 count None" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new()
  assert_eq(locator.numticks(), 11)
  assert_eq(locator.configured_numticks(), None)
  verify_linear_reference_values(locator.tick_values(0.1, 0.9).to_array(), [
    0.1, 0.18, 0.26, 0.33999999999999997, 0.42000000000000004, 0.5, 0.58, 0.66, 0.74,
    0.82, 0.9,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.1, 0.9), [0.1, 0.9])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_linear_reference_limits(locator.view_limits(0.1, 0.9), [0.1, 0.9])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.1, 0.9), [0.1, 0.9])
  verify_linear_reference_limits(locator.nonsingular(0.1, 0.9), [0.1, 0.9])
}

///|
test "LinearLocator original 7 count None" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new()
  assert_eq(locator.numticks(), 11)
  assert_eq(locator.configured_numticks(), None)
  verify_linear_reference_values(
    locator.tick_values(12.0, 12.0000001).to_array(),
    [
      12.0, 12.00000001, 12.00000002, 12.000000029999999, 12.00000004, 12.00000005,
      12.00000006, 12.000000069999999, 12.00000008, 12.00000009, 12.0000001,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(12.0, 12.0000001), [
    12.0, 12.0000001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_linear_reference_limits(locator.view_limits(12.0, 12.0000001), [
    12.0, 12.0000001,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(12.0, 12.0000001), [
    12.0, 12.0000001,
  ])
  verify_linear_reference_limits(locator.nonsingular(12.0, 12.0000001), [
    12.0, 12.0000001,
  ])
}

///|
test "LinearLocator original 8 count None" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new()
  assert_eq(locator.numticks(), 11)
  assert_eq(locator.configured_numticks(), None)
  verify_linear_reference_values(
    locator.tick_values(1.0, 1.0000000000000002).to_array(),
    [
      0.95, 0.96, 0.97, 0.9800000000000001, 0.9900000000000001, 1.0, 1.0100000000000002,
      1.0200000000000002, 1.0300000000000002, 1.0400000000000003, 1.0500000000000003,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(1.0, 1.0000000000000002), [
    0.999, 1.0010000000000001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_linear_reference_limits(locator.view_limits(1.0, 1.0000000000000002), [
    0.999, 1.0010000000000001,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(1.0, 1.0000000000000002), [
    0.999, 1.0010000000000001,
  ])
  verify_linear_reference_limits(locator.nonsingular(1.0, 1.0000000000000002), [
    0.95, 1.0500000000000003,
  ])
}

///|
test "LinearLocator original 9 count None" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new()
  assert_eq(locator.numticks(), 11)
  assert_eq(locator.configured_numticks(), None)
  verify_linear_reference_values(
    locator.tick_values(1.0e-280, 1.0000000000000001e-280).to_array(),
    [
      9.499999999999999e-281, 9.599999999999999e-281, 9.7e-281, 9.8e-281, 9.9e-281,
      1.0e-280, 1.0100000000000001e-280, 1.02e-280, 1.03e-280, 1.0400000000000001e-280,
      1.0500000000000001e-280,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(1.0e-280, 1.0000000000000001e-280),
    [9.99e-281, 1.001e-280],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_linear_reference_limits(
    locator.view_limits(1.0e-280, 1.0000000000000001e-280),
    [9.99e-281, 1.0010000000000002e-280],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(1.0e-280, 1.0000000000000001e-280),
    [9.99e-281, 1.001e-280],
  )
  verify_linear_reference_limits(
    locator.nonsingular(1.0e-280, 1.0000000000000001e-280),
    [9.499999999999999e-281, 1.0500000000000001e-280],
  )
}

///|
test "LinearLocator original 10 count None" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new()
  assert_eq(locator.numticks(), 11)
  assert_eq(locator.configured_numticks(), None)
  verify_linear_reference_values(
    locator.tick_values(5.0e-324, -5.0e-324).to_array(),
    [
      -0.05, -0.04, -0.030000000000000002, -0.020000000000000004, -0.010000000000000002,
      0.0, 0.009999999999999995, 0.020000000000000004, 0.03, 0.039999999999999994,
      0.05,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(5.0e-324, -5.0e-324), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(5.0e-324, -5.0e-324))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(5.0e-324, -5.0e-324), [
    -0.001, 0.001,
  ])
  verify_linear_reference_limits(locator.nonsingular(5.0e-324, -5.0e-324), [
    -0.05, 0.05,
  ])
}

///|
test "LinearLocator original 11 count None" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new()
  assert_eq(locator.numticks(), 11)
  assert_eq(locator.configured_numticks(), None)
  verify_linear_reference_values(
    locator.tick_values(1.0e-288, 2.0e-288).to_array(),
    [
      -0.05, -0.04, -0.030000000000000002, -0.020000000000000004, -0.010000000000000002,
      0.0, 0.009999999999999995, 0.020000000000000004, 0.03, 0.039999999999999994,
      0.05,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(1.0e-288, 2.0e-288), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_linear_reference_limits(locator.view_limits(1.0e-288, 2.0e-288), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(1.0e-288, 2.0e-288), [
    -0.001, 0.001,
  ])
  verify_linear_reference_limits(locator.nonsingular(1.0e-288, 2.0e-288), [
    -0.05, 0.05,
  ])
}

///|
test "LinearLocator original 12 count None" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new()
  assert_eq(locator.numticks(), 11)
  assert_eq(locator.configured_numticks(), None)
  verify_linear_reference_values(
    locator
    .tick_values(1.7976931348623157e+308, 1.7976931348623157e+308)
    .to_array(),
    [
      0.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(1.7976931348623157e+308, 1.7976931348623157e+308),
    [1.7958954417274534e+308, 1.0 / 0.0],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(
        locator.view_limits(1.7976931348623157e+308, 1.7976931348623157e+308),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(1.7976931348623157e+308, 1.7976931348623157e+308),
    [1.7958954417274534e+308, 1.0 / 0.0],
  )
  verify_linear_reference_limits(
    locator.nonsingular(1.7976931348623157e+308, 1.7976931348623157e+308),
    [1.7078084781191998e+308, 1.0 / 0.0],
  )
}

///|
test "LinearLocator original 13 count None" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new()
  assert_eq(locator.numticks(), 11)
  assert_eq(locator.configured_numticks(), None)
  verify_linear_reference_values(
    locator
    .tick_values(-1.7976931348623157e+308, 1.7976931348623157e+308)
    .to_array(),
    [
      0.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
      1.7976931348623157e+308,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(-1.7976931348623157e+308, 1.7976931348623157e+308),
    [-1.7976931348623157e+308, 1.7976931348623157e+308],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(
        locator.view_limits(-1.7976931348623157e+308, 1.7976931348623157e+308),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(-1.7976931348623157e+308, 1.7976931348623157e+308),
    [-1.7976931348623157e+308, 1.7976931348623157e+308],
  )
  verify_linear_reference_limits(
    locator.nonsingular(-1.7976931348623157e+308, 1.7976931348623157e+308),
    [-1.7976931348623157e+308, 1.7976931348623157e+308],
  )
}

///|
test "LinearLocator original 14 count None" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new()
  assert_eq(locator.numticks(), 11)
  assert_eq(locator.configured_numticks(), None)
  verify_linear_reference_values(
    locator
    .tick_values(-1.7976931348623157e+308, -1.7976931348623157e+308)
    .to_array(),
    [
      0.0 / 0.0,
      0.0 / 0.0,
      0.0 / 0.0,
      0.0 / 0.0,
      0.0 / 0.0,
      0.0 / 0.0,
      0.0 / 0.0,
      0.0 / 0.0,
      0.0 / 0.0,
      0.0 / 0.0,
      -1.7078084781191998e+308,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(-1.7976931348623157e+308, -1.7976931348623157e+308),
    [-1.0 / 0.0, -1.7958954417274534e+308],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(
        locator.view_limits(-1.7976931348623157e+308, -1.7976931348623157e+308),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(-1.7976931348623157e+308, -1.7976931348623157e+308),
    [-1.0 / 0.0, -1.7958954417274534e+308],
  )
  verify_linear_reference_limits(
    locator.nonsingular(-1.7976931348623157e+308, -1.7976931348623157e+308),
    [-1.0 / 0.0, -1.7078084781191998e+308],
  )
}

///|
test "LinearLocator original 15 count None" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new()
  assert_eq(locator.numticks(), 11)
  assert_eq(locator.configured_numticks(), None)
  verify_linear_reference_values(
    locator.tick_values(1.0e+100, 1.0000000000000002e+100).to_array(),
    [
      9.500000000000001e+99, 9.6e+99, 9.700000000000002e+99, 9.800000000000001e+99,
      9.900000000000003e+99, 1.0000000000000002e+100, 1.0100000000000002e+100, 1.0200000000000003e+100,
      1.0300000000000002e+100, 1.0400000000000004e+100, 1.0500000000000003e+100,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(1.0e+100, 1.0000000000000002e+100),
    [9.99e+99, 1.0010000000000002e+100],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_linear_reference_limits(
    locator.view_limits(1.0e+100, 1.0000000000000002e+100),
    [9.99e+99, 1.0010000000000002e+100],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(1.0e+100, 1.0000000000000002e+100),
    [9.99e+99, 1.0010000000000002e+100],
  )
  verify_linear_reference_limits(
    locator.nonsingular(1.0e+100, 1.0000000000000002e+100),
    [9.500000000000001e+99, 1.0500000000000003e+100],
  )
}

///|
test "LinearLocator original 16 count None" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new()
  assert_eq(locator.numticks(), 11)
  assert_eq(locator.configured_numticks(), None)
  verify_linear_reference_values(
    locator.tick_values(0.0 / 0.0, 0.0).to_array(),
    [
      -0.05, -0.04, -0.030000000000000002, -0.020000000000000004, -0.010000000000000002,
      0.0, 0.009999999999999995, 0.020000000000000004, 0.03, 0.039999999999999994,
      0.05,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0 / 0.0, 0.0), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(0.0 / 0.0, 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0 / 0.0, 0.0), [
    -0.001, 0.001,
  ])
  verify_linear_reference_limits(locator.nonsingular(0.0 / 0.0, 0.0), [
    -0.05, 0.05,
  ])
}

///|
test "LinearLocator original 17 count None" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new()
  assert_eq(locator.numticks(), 11)
  assert_eq(locator.configured_numticks(), None)
  verify_linear_reference_values(
    locator.tick_values(0.0, 1.0 / 0.0).to_array(),
    [
      -0.05, -0.04, -0.030000000000000002, -0.020000000000000004, -0.010000000000000002,
      0.0, 0.009999999999999995, 0.020000000000000004, 0.03, 0.039999999999999994,
      0.05,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0, 1.0 / 0.0), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0, 1.0 / 0.0), [
    -0.001, 0.001,
  ])
  verify_linear_reference_limits(locator.nonsingular(0.0, 1.0 / 0.0), [
    -0.05, 0.05,
  ])
}

///|
test "LinearLocator original 18 count None" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new()
  assert_eq(locator.numticks(), 11)
  assert_eq(locator.configured_numticks(), None)
  verify_linear_reference_values(
    locator.tick_values(-1.0 / 0.0, 1.0 / 0.0).to_array(),
    [
      -0.05, -0.04, -0.030000000000000002, -0.020000000000000004, -0.010000000000000002,
      0.0, 0.009999999999999995, 0.020000000000000004, 0.03, 0.039999999999999994,
      0.05,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(-1.0 / 0.0, 1.0 / 0.0), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(-1.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(-1.0 / 0.0, 1.0 / 0.0), [
    -0.001, 0.001,
  ])
  verify_linear_reference_limits(locator.nonsingular(-1.0 / 0.0, 1.0 / 0.0), [
    -0.05, 0.05,
  ])
}

///|
test "LinearLocator original 19 count None" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new()
  assert_eq(locator.numticks(), 11)
  assert_eq(locator.configured_numticks(), None)
  verify_linear_reference_values(
    locator.tick_values(0.0 / 0.0, 0.0 / 0.0).to_array(),
    [
      -0.05, -0.04, -0.030000000000000002, -0.020000000000000004, -0.010000000000000002,
      0.0, 0.009999999999999995, 0.020000000000000004, 0.03, 0.039999999999999994,
      0.05,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0 / 0.0, 0.0 / 0.0), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(0.0 / 0.0, 0.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0 / 0.0, 0.0 / 0.0), [
    -0.001, 0.001,
  ])
  verify_linear_reference_limits(locator.nonsingular(0.0 / 0.0, 0.0 / 0.0), [
    -0.05, 0.05,
  ])
}

///|
test "LinearLocator original 20 count -1" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=-1)
  assert_eq(locator.numticks(), -1)
  assert_eq(locator.configured_numticks(), Some(-1))
  assert_true(
    try {
      ignore(locator.tick_values(-1.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(-1.0, 1.0), [-1.0, 1.0])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(-1.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(-1.0, 1.0), [-1.0, 1.0])
  verify_linear_reference_limits(locator.nonsingular(-1.0, 1.0), [-1.0, 1.0])
}

///|
test "LinearLocator original 21 count -1" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=-1)
  assert_eq(locator.numticks(), -1)
  assert_eq(locator.configured_numticks(), Some(-1))
  assert_true(
    try {
      ignore(locator.tick_values(1.0, -1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(1.0, -1.0), [-1.0, 1.0])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(1.0, -1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(1.0, -1.0), [-1.0, 1.0])
  verify_linear_reference_limits(locator.nonsingular(1.0, -1.0), [-1.0, 1.0])
}

///|
test "LinearLocator original 22 count -1" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=-1)
  assert_eq(locator.numticks(), -1)
  assert_eq(locator.configured_numticks(), Some(-1))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0, 0.0), [-1.0, 1.0])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(0.0, 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0, 0.0), [-1.0, 1.0])
  verify_linear_reference_limits(locator.nonsingular(0.0, 0.0), [-0.05, 0.05])
}

///|
test "LinearLocator original 23 count -1" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=-1)
  assert_eq(locator.numticks(), -1)
  assert_eq(locator.configured_numticks(), Some(-1))
  assert_true(
    try {
      ignore(locator.tick_values(-0.0, -0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(-0.0, -0.0), [-1.0, 1.0])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(-0.0, -0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(-0.0, -0.0), [-1.0, 1.0])
  verify_linear_reference_limits(locator.nonsingular(-0.0, -0.0), [-0.05, 0.05])
}

///|
test "LinearLocator original 24 count -1" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=-1)
  assert_eq(locator.numticks(), -1)
  assert_eq(locator.configured_numticks(), Some(-1))
  assert_true(
    try {
      ignore(locator.tick_values(2.0, 2.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(2.0, 2.0), [1.0, 3.0])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(2.0, 2.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(2.0, 2.0), [1.0, 3.0])
  verify_linear_reference_limits(locator.nonsingular(2.0, 2.0), [1.9, 2.1])
}

///|
test "LinearLocator original 25 count -1" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=-1)
  assert_eq(locator.numticks(), -1)
  assert_eq(locator.configured_numticks(), Some(-1))
  assert_true(
    try {
      ignore(locator.tick_values(-2.0, -2.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(-2.0, -2.0), [-3.0, -1.0])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(-2.0, -2.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(-2.0, -2.0), [-3.0, -1.0])
  verify_linear_reference_limits(locator.nonsingular(-2.0, -2.0), [-2.1, -1.9])
}

///|
test "LinearLocator original 26 count -1" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=-1)
  assert_eq(locator.numticks(), -1)
  assert_eq(locator.configured_numticks(), Some(-1))
  assert_true(
    try {
      ignore(locator.tick_values(0.1, 0.9))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.1, 0.9), [0.1, 0.9])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(0.1, 0.9))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.1, 0.9), [0.1, 0.9])
  verify_linear_reference_limits(locator.nonsingular(0.1, 0.9), [0.1, 0.9])
}

///|
test "LinearLocator original 27 count -1" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=-1)
  assert_eq(locator.numticks(), -1)
  assert_eq(locator.configured_numticks(), Some(-1))
  assert_true(
    try {
      ignore(locator.tick_values(12.0, 12.0000001))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(12.0, 12.0000001), [
    12.0, 12.0000001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(12.0, 12.0000001))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(12.0, 12.0000001), [
    12.0, 12.0000001,
  ])
  verify_linear_reference_limits(locator.nonsingular(12.0, 12.0000001), [
    12.0, 12.0000001,
  ])
}

///|
test "LinearLocator original 28 count -1" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=-1)
  assert_eq(locator.numticks(), -1)
  assert_eq(locator.configured_numticks(), Some(-1))
  assert_true(
    try {
      ignore(locator.tick_values(1.0, 1.0000000000000002))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(1.0, 1.0000000000000002), [
    0.999, 1.0010000000000001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(1.0, 1.0000000000000002))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(1.0, 1.0000000000000002), [
    0.999, 1.0010000000000001,
  ])
  verify_linear_reference_limits(locator.nonsingular(1.0, 1.0000000000000002), [
    0.95, 1.0500000000000003,
  ])
}

///|
test "LinearLocator original 29 count -1" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=-1)
  assert_eq(locator.numticks(), -1)
  assert_eq(locator.configured_numticks(), Some(-1))
  assert_true(
    try {
      ignore(locator.tick_values(1.0e-280, 1.0000000000000001e-280))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(1.0e-280, 1.0000000000000001e-280),
    [9.99e-281, 1.001e-280],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(1.0e-280, 1.0000000000000001e-280))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(1.0e-280, 1.0000000000000001e-280),
    [9.99e-281, 1.001e-280],
  )
  verify_linear_reference_limits(
    locator.nonsingular(1.0e-280, 1.0000000000000001e-280),
    [9.499999999999999e-281, 1.0500000000000001e-280],
  )
}

///|
test "LinearLocator original 30 count -1" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=-1)
  assert_eq(locator.numticks(), -1)
  assert_eq(locator.configured_numticks(), Some(-1))
  assert_true(
    try {
      ignore(locator.tick_values(5.0e-324, -5.0e-324))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(5.0e-324, -5.0e-324), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(5.0e-324, -5.0e-324))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(5.0e-324, -5.0e-324), [
    -0.001, 0.001,
  ])
  verify_linear_reference_limits(locator.nonsingular(5.0e-324, -5.0e-324), [
    -0.05, 0.05,
  ])
}

///|
test "LinearLocator original 31 count -1" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=-1)
  assert_eq(locator.numticks(), -1)
  assert_eq(locator.configured_numticks(), Some(-1))
  assert_true(
    try {
      ignore(locator.tick_values(1.0e-288, 2.0e-288))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(1.0e-288, 2.0e-288), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(1.0e-288, 2.0e-288))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(1.0e-288, 2.0e-288), [
    -0.001, 0.001,
  ])
  verify_linear_reference_limits(locator.nonsingular(1.0e-288, 2.0e-288), [
    -0.05, 0.05,
  ])
}

///|
test "LinearLocator original 32 count -1" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=-1)
  assert_eq(locator.numticks(), -1)
  assert_eq(locator.configured_numticks(), Some(-1))
  assert_true(
    try {
      ignore(
        locator.tick_values(1.7976931348623157e+308, 1.7976931348623157e+308),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(1.7976931348623157e+308, 1.7976931348623157e+308),
    [1.7958954417274534e+308, 1.0 / 0.0],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(
        locator.view_limits(1.7976931348623157e+308, 1.7976931348623157e+308),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(1.7976931348623157e+308, 1.7976931348623157e+308),
    [1.7958954417274534e+308, 1.0 / 0.0],
  )
  verify_linear_reference_limits(
    locator.nonsingular(1.7976931348623157e+308, 1.7976931348623157e+308),
    [1.7078084781191998e+308, 1.0 / 0.0],
  )
}

///|
test "LinearLocator original 33 count -1" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=-1)
  assert_eq(locator.numticks(), -1)
  assert_eq(locator.configured_numticks(), Some(-1))
  assert_true(
    try {
      ignore(
        locator.tick_values(-1.7976931348623157e+308, 1.7976931348623157e+308),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(-1.7976931348623157e+308, 1.7976931348623157e+308),
    [-1.7976931348623157e+308, 1.7976931348623157e+308],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(
        locator.view_limits(-1.7976931348623157e+308, 1.7976931348623157e+308),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(-1.7976931348623157e+308, 1.7976931348623157e+308),
    [-1.7976931348623157e+308, 1.7976931348623157e+308],
  )
  verify_linear_reference_limits(
    locator.nonsingular(-1.7976931348623157e+308, 1.7976931348623157e+308),
    [-1.7976931348623157e+308, 1.7976931348623157e+308],
  )
}

///|
test "LinearLocator original 34 count -1" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=-1)
  assert_eq(locator.numticks(), -1)
  assert_eq(locator.configured_numticks(), Some(-1))
  assert_true(
    try {
      ignore(
        locator.tick_values(-1.7976931348623157e+308, -1.7976931348623157e+308),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(-1.7976931348623157e+308, -1.7976931348623157e+308),
    [-1.0 / 0.0, -1.7958954417274534e+308],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(
        locator.view_limits(-1.7976931348623157e+308, -1.7976931348623157e+308),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(-1.7976931348623157e+308, -1.7976931348623157e+308),
    [-1.0 / 0.0, -1.7958954417274534e+308],
  )
  verify_linear_reference_limits(
    locator.nonsingular(-1.7976931348623157e+308, -1.7976931348623157e+308),
    [-1.0 / 0.0, -1.7078084781191998e+308],
  )
}

///|
test "LinearLocator original 35 count -1" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=-1)
  assert_eq(locator.numticks(), -1)
  assert_eq(locator.configured_numticks(), Some(-1))
  assert_true(
    try {
      ignore(locator.tick_values(1.0e+100, 1.0000000000000002e+100))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(1.0e+100, 1.0000000000000002e+100),
    [9.99e+99, 1.0010000000000002e+100],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(1.0e+100, 1.0000000000000002e+100))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(1.0e+100, 1.0000000000000002e+100),
    [9.99e+99, 1.0010000000000002e+100],
  )
  verify_linear_reference_limits(
    locator.nonsingular(1.0e+100, 1.0000000000000002e+100),
    [9.500000000000001e+99, 1.0500000000000003e+100],
  )
}

///|
test "LinearLocator original 36 count -1" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=-1)
  assert_eq(locator.numticks(), -1)
  assert_eq(locator.configured_numticks(), Some(-1))
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0 / 0.0, 0.0), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(0.0 / 0.0, 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0 / 0.0, 0.0), [
    -0.001, 0.001,
  ])
  verify_linear_reference_limits(locator.nonsingular(0.0 / 0.0, 0.0), [
    -0.05, 0.05,
  ])
}

///|
test "LinearLocator original 37 count -1" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=-1)
  assert_eq(locator.numticks(), -1)
  assert_eq(locator.configured_numticks(), Some(-1))
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0, 1.0 / 0.0), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0, 1.0 / 0.0), [
    -0.001, 0.001,
  ])
  verify_linear_reference_limits(locator.nonsingular(0.0, 1.0 / 0.0), [
    -0.05, 0.05,
  ])
}

///|
test "LinearLocator original 38 count -1" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=-1)
  assert_eq(locator.numticks(), -1)
  assert_eq(locator.configured_numticks(), Some(-1))
  assert_true(
    try {
      ignore(locator.tick_values(-1.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(-1.0 / 0.0, 1.0 / 0.0), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(-1.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(-1.0 / 0.0, 1.0 / 0.0), [
    -0.001, 0.001,
  ])
  verify_linear_reference_limits(locator.nonsingular(-1.0 / 0.0, 1.0 / 0.0), [
    -0.05, 0.05,
  ])
}

///|
test "LinearLocator original 39 count -1" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=-1)
  assert_eq(locator.numticks(), -1)
  assert_eq(locator.configured_numticks(), Some(-1))
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 0.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0 / 0.0, 0.0 / 0.0), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(0.0 / 0.0, 0.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0 / 0.0, 0.0 / 0.0), [
    -0.001, 0.001,
  ])
  verify_linear_reference_limits(locator.nonsingular(0.0 / 0.0, 0.0 / 0.0), [
    -0.05, 0.05,
  ])
}

///|
test "LinearLocator original 40 count 0" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=0)
  assert_eq(locator.numticks(), 0)
  assert_eq(locator.configured_numticks(), Some(0))
  verify_linear_reference_values(locator.tick_values(-1.0, 1.0).to_array(), [])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(-1.0, 1.0), [-1.0, 1.0])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(-1.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(-1.0, 1.0), [-1.0, 1.0])
  verify_linear_reference_limits(locator.nonsingular(-1.0, 1.0), [-1.0, 1.0])
}

///|
test "LinearLocator original 41 count 0" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=0)
  assert_eq(locator.numticks(), 0)
  assert_eq(locator.configured_numticks(), Some(0))
  verify_linear_reference_values(locator.tick_values(1.0, -1.0).to_array(), [])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(1.0, -1.0), [-1.0, 1.0])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(1.0, -1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(1.0, -1.0), [-1.0, 1.0])
  verify_linear_reference_limits(locator.nonsingular(1.0, -1.0), [-1.0, 1.0])
}

///|
test "LinearLocator original 42 count 0" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=0)
  assert_eq(locator.numticks(), 0)
  assert_eq(locator.configured_numticks(), Some(0))
  verify_linear_reference_values(locator.tick_values(0.0, 0.0).to_array(), [])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0, 0.0), [-1.0, 1.0])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(0.0, 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0, 0.0), [-1.0, 1.0])
  verify_linear_reference_limits(locator.nonsingular(0.0, 0.0), [-0.05, 0.05])
}

///|
test "LinearLocator original 43 count 0" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=0)
  assert_eq(locator.numticks(), 0)
  assert_eq(locator.configured_numticks(), Some(0))
  verify_linear_reference_values(locator.tick_values(-0.0, -0.0).to_array(), [])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(-0.0, -0.0), [-1.0, 1.0])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(-0.0, -0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(-0.0, -0.0), [-1.0, 1.0])
  verify_linear_reference_limits(locator.nonsingular(-0.0, -0.0), [-0.05, 0.05])
}

///|
test "LinearLocator original 44 count 0" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=0)
  assert_eq(locator.numticks(), 0)
  assert_eq(locator.configured_numticks(), Some(0))
  verify_linear_reference_values(locator.tick_values(2.0, 2.0).to_array(), [])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(2.0, 2.0), [1.0, 3.0])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(2.0, 2.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(2.0, 2.0), [1.0, 3.0])
  verify_linear_reference_limits(locator.nonsingular(2.0, 2.0), [1.9, 2.1])
}

///|
test "LinearLocator original 45 count 0" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=0)
  assert_eq(locator.numticks(), 0)
  assert_eq(locator.configured_numticks(), Some(0))
  verify_linear_reference_values(locator.tick_values(-2.0, -2.0).to_array(), [])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(-2.0, -2.0), [-3.0, -1.0])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(-2.0, -2.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(-2.0, -2.0), [-3.0, -1.0])
  verify_linear_reference_limits(locator.nonsingular(-2.0, -2.0), [-2.1, -1.9])
}

///|
test "LinearLocator original 46 count 0" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=0)
  assert_eq(locator.numticks(), 0)
  assert_eq(locator.configured_numticks(), Some(0))
  verify_linear_reference_values(locator.tick_values(0.1, 0.9).to_array(), [])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.1, 0.9), [0.1, 0.9])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(0.1, 0.9))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.1, 0.9), [0.1, 0.9])
  verify_linear_reference_limits(locator.nonsingular(0.1, 0.9), [0.1, 0.9])
}

///|
test "LinearLocator original 47 count 0" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=0)
  assert_eq(locator.numticks(), 0)
  assert_eq(locator.configured_numticks(), Some(0))
  verify_linear_reference_values(
    locator.tick_values(12.0, 12.0000001).to_array(),
    [],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(12.0, 12.0000001), [
    12.0, 12.0000001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(12.0, 12.0000001))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(12.0, 12.0000001), [
    12.0, 12.0000001,
  ])
  verify_linear_reference_limits(locator.nonsingular(12.0, 12.0000001), [
    12.0, 12.0000001,
  ])
}

///|
test "LinearLocator original 48 count 0" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=0)
  assert_eq(locator.numticks(), 0)
  assert_eq(locator.configured_numticks(), Some(0))
  verify_linear_reference_values(
    locator.tick_values(1.0, 1.0000000000000002).to_array(),
    [],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(1.0, 1.0000000000000002), [
    0.999, 1.0010000000000001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(1.0, 1.0000000000000002))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(1.0, 1.0000000000000002), [
    0.999, 1.0010000000000001,
  ])
  verify_linear_reference_limits(locator.nonsingular(1.0, 1.0000000000000002), [
    0.95, 1.0500000000000003,
  ])
}

///|
test "LinearLocator original 49 count 0" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=0)
  assert_eq(locator.numticks(), 0)
  assert_eq(locator.configured_numticks(), Some(0))
  verify_linear_reference_values(
    locator.tick_values(1.0e-280, 1.0000000000000001e-280).to_array(),
    [],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(1.0e-280, 1.0000000000000001e-280),
    [9.99e-281, 1.001e-280],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(1.0e-280, 1.0000000000000001e-280))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(1.0e-280, 1.0000000000000001e-280),
    [9.99e-281, 1.001e-280],
  )
  verify_linear_reference_limits(
    locator.nonsingular(1.0e-280, 1.0000000000000001e-280),
    [9.499999999999999e-281, 1.0500000000000001e-280],
  )
}

///|
test "LinearLocator original 50 count 0" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=0)
  assert_eq(locator.numticks(), 0)
  assert_eq(locator.configured_numticks(), Some(0))
  verify_linear_reference_values(
    locator.tick_values(5.0e-324, -5.0e-324).to_array(),
    [],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(5.0e-324, -5.0e-324), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(5.0e-324, -5.0e-324))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(5.0e-324, -5.0e-324), [
    -0.001, 0.001,
  ])
  verify_linear_reference_limits(locator.nonsingular(5.0e-324, -5.0e-324), [
    -0.05, 0.05,
  ])
}

///|
test "LinearLocator original 51 count 0" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=0)
  assert_eq(locator.numticks(), 0)
  assert_eq(locator.configured_numticks(), Some(0))
  verify_linear_reference_values(
    locator.tick_values(1.0e-288, 2.0e-288).to_array(),
    [],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(1.0e-288, 2.0e-288), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(1.0e-288, 2.0e-288))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(1.0e-288, 2.0e-288), [
    -0.001, 0.001,
  ])
  verify_linear_reference_limits(locator.nonsingular(1.0e-288, 2.0e-288), [
    -0.05, 0.05,
  ])
}

///|
test "LinearLocator original 52 count 0" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=0)
  assert_eq(locator.numticks(), 0)
  assert_eq(locator.configured_numticks(), Some(0))
  verify_linear_reference_values(
    locator
    .tick_values(1.7976931348623157e+308, 1.7976931348623157e+308)
    .to_array(),
    [],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(1.7976931348623157e+308, 1.7976931348623157e+308),
    [1.7958954417274534e+308, 1.0 / 0.0],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(
        locator.view_limits(1.7976931348623157e+308, 1.7976931348623157e+308),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(1.7976931348623157e+308, 1.7976931348623157e+308),
    [1.7958954417274534e+308, 1.0 / 0.0],
  )
  verify_linear_reference_limits(
    locator.nonsingular(1.7976931348623157e+308, 1.7976931348623157e+308),
    [1.7078084781191998e+308, 1.0 / 0.0],
  )
}

///|
test "LinearLocator original 53 count 0" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=0)
  assert_eq(locator.numticks(), 0)
  assert_eq(locator.configured_numticks(), Some(0))
  verify_linear_reference_values(
    locator
    .tick_values(-1.7976931348623157e+308, 1.7976931348623157e+308)
    .to_array(),
    [],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(-1.7976931348623157e+308, 1.7976931348623157e+308),
    [-1.7976931348623157e+308, 1.7976931348623157e+308],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(
        locator.view_limits(-1.7976931348623157e+308, 1.7976931348623157e+308),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(-1.7976931348623157e+308, 1.7976931348623157e+308),
    [-1.7976931348623157e+308, 1.7976931348623157e+308],
  )
  verify_linear_reference_limits(
    locator.nonsingular(-1.7976931348623157e+308, 1.7976931348623157e+308),
    [-1.7976931348623157e+308, 1.7976931348623157e+308],
  )
}

///|
test "LinearLocator original 54 count 0" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=0)
  assert_eq(locator.numticks(), 0)
  assert_eq(locator.configured_numticks(), Some(0))
  verify_linear_reference_values(
    locator
    .tick_values(-1.7976931348623157e+308, -1.7976931348623157e+308)
    .to_array(),
    [],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(-1.7976931348623157e+308, -1.7976931348623157e+308),
    [-1.0 / 0.0, -1.7958954417274534e+308],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(
        locator.view_limits(-1.7976931348623157e+308, -1.7976931348623157e+308),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(-1.7976931348623157e+308, -1.7976931348623157e+308),
    [-1.0 / 0.0, -1.7958954417274534e+308],
  )
  verify_linear_reference_limits(
    locator.nonsingular(-1.7976931348623157e+308, -1.7976931348623157e+308),
    [-1.0 / 0.0, -1.7078084781191998e+308],
  )
}

///|
test "LinearLocator original 55 count 0" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=0)
  assert_eq(locator.numticks(), 0)
  assert_eq(locator.configured_numticks(), Some(0))
  verify_linear_reference_values(
    locator.tick_values(1.0e+100, 1.0000000000000002e+100).to_array(),
    [],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(1.0e+100, 1.0000000000000002e+100),
    [9.99e+99, 1.0010000000000002e+100],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(1.0e+100, 1.0000000000000002e+100))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(1.0e+100, 1.0000000000000002e+100),
    [9.99e+99, 1.0010000000000002e+100],
  )
  verify_linear_reference_limits(
    locator.nonsingular(1.0e+100, 1.0000000000000002e+100),
    [9.500000000000001e+99, 1.0500000000000003e+100],
  )
}

///|
test "LinearLocator original 56 count 0" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=0)
  assert_eq(locator.numticks(), 0)
  assert_eq(locator.configured_numticks(), Some(0))
  verify_linear_reference_values(
    locator.tick_values(0.0 / 0.0, 0.0).to_array(),
    [],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0 / 0.0, 0.0), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(0.0 / 0.0, 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0 / 0.0, 0.0), [
    -0.001, 0.001,
  ])
  verify_linear_reference_limits(locator.nonsingular(0.0 / 0.0, 0.0), [
    -0.05, 0.05,
  ])
}

///|
test "LinearLocator original 57 count 0" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=0)
  assert_eq(locator.numticks(), 0)
  assert_eq(locator.configured_numticks(), Some(0))
  verify_linear_reference_values(
    locator.tick_values(0.0, 1.0 / 0.0).to_array(),
    [],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0, 1.0 / 0.0), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0, 1.0 / 0.0), [
    -0.001, 0.001,
  ])
  verify_linear_reference_limits(locator.nonsingular(0.0, 1.0 / 0.0), [
    -0.05, 0.05,
  ])
}

///|
test "LinearLocator original 58 count 0" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=0)
  assert_eq(locator.numticks(), 0)
  assert_eq(locator.configured_numticks(), Some(0))
  verify_linear_reference_values(
    locator.tick_values(-1.0 / 0.0, 1.0 / 0.0).to_array(),
    [],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(-1.0 / 0.0, 1.0 / 0.0), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(-1.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(-1.0 / 0.0, 1.0 / 0.0), [
    -0.001, 0.001,
  ])
  verify_linear_reference_limits(locator.nonsingular(-1.0 / 0.0, 1.0 / 0.0), [
    -0.05, 0.05,
  ])
}

///|
test "LinearLocator original 59 count 0" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=0)
  assert_eq(locator.numticks(), 0)
  assert_eq(locator.configured_numticks(), Some(0))
  verify_linear_reference_values(
    locator.tick_values(0.0 / 0.0, 0.0 / 0.0).to_array(),
    [],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0 / 0.0, 0.0 / 0.0), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(0.0 / 0.0, 0.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0 / 0.0, 0.0 / 0.0), [
    -0.001, 0.001,
  ])
  verify_linear_reference_limits(locator.nonsingular(0.0 / 0.0, 0.0 / 0.0), [
    -0.05, 0.05,
  ])
}

///|
test "LinearLocator original 60 count 1" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=1)
  assert_eq(locator.numticks(), 1)
  assert_eq(locator.configured_numticks(), Some(1))
  verify_linear_reference_values(locator.tick_values(-1.0, 1.0).to_array(), [
    -1.0,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(-1.0, 1.0), [-1.0, 1.0])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(-1.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(-1.0, 1.0), [-1.0, 1.0])
  verify_linear_reference_limits(locator.nonsingular(-1.0, 1.0), [-1.0, 1.0])
}

///|
test "LinearLocator original 61 count 1" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=1)
  assert_eq(locator.numticks(), 1)
  assert_eq(locator.configured_numticks(), Some(1))
  verify_linear_reference_values(locator.tick_values(1.0, -1.0).to_array(), [
    -1.0,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(1.0, -1.0), [-1.0, 1.0])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(1.0, -1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(1.0, -1.0), [-1.0, 1.0])
  verify_linear_reference_limits(locator.nonsingular(1.0, -1.0), [-1.0, 1.0])
}

///|
test "LinearLocator original 62 count 1" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=1)
  assert_eq(locator.numticks(), 1)
  assert_eq(locator.configured_numticks(), Some(1))
  verify_linear_reference_values(locator.tick_values(0.0, 0.0).to_array(), [
    -0.05,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0, 0.0), [-1.0, 1.0])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(0.0, 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0, 0.0), [-1.0, 1.0])
  verify_linear_reference_limits(locator.nonsingular(0.0, 0.0), [-0.05, 0.05])
}

///|
test "LinearLocator original 63 count 1" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=1)
  assert_eq(locator.numticks(), 1)
  assert_eq(locator.configured_numticks(), Some(1))
  verify_linear_reference_values(locator.tick_values(-0.0, -0.0).to_array(), [
    -0.05,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(-0.0, -0.0), [-1.0, 1.0])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(-0.0, -0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(-0.0, -0.0), [-1.0, 1.0])
  verify_linear_reference_limits(locator.nonsingular(-0.0, -0.0), [-0.05, 0.05])
}

///|
test "LinearLocator original 64 count 1" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=1)
  assert_eq(locator.numticks(), 1)
  assert_eq(locator.configured_numticks(), Some(1))
  verify_linear_reference_values(locator.tick_values(2.0, 2.0).to_array(), [1.9])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(2.0, 2.0), [1.0, 3.0])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(2.0, 2.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(2.0, 2.0), [1.0, 3.0])
  verify_linear_reference_limits(locator.nonsingular(2.0, 2.0), [1.9, 2.1])
}

///|
test "LinearLocator original 65 count 1" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=1)
  assert_eq(locator.numticks(), 1)
  assert_eq(locator.configured_numticks(), Some(1))
  verify_linear_reference_values(locator.tick_values(-2.0, -2.0).to_array(), [
    -2.1,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(-2.0, -2.0), [-3.0, -1.0])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(-2.0, -2.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(-2.0, -2.0), [-3.0, -1.0])
  verify_linear_reference_limits(locator.nonsingular(-2.0, -2.0), [-2.1, -1.9])
}

///|
test "LinearLocator original 66 count 1" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=1)
  assert_eq(locator.numticks(), 1)
  assert_eq(locator.configured_numticks(), Some(1))
  verify_linear_reference_values(locator.tick_values(0.1, 0.9).to_array(), [0.1])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.1, 0.9), [0.1, 0.9])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(0.1, 0.9))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.1, 0.9), [0.1, 0.9])
  verify_linear_reference_limits(locator.nonsingular(0.1, 0.9), [0.1, 0.9])
}

///|
test "LinearLocator original 67 count 1" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=1)
  assert_eq(locator.numticks(), 1)
  assert_eq(locator.configured_numticks(), Some(1))
  verify_linear_reference_values(
    locator.tick_values(12.0, 12.0000001).to_array(),
    [12.0],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(12.0, 12.0000001), [
    12.0, 12.0000001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(12.0, 12.0000001))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(12.0, 12.0000001), [
    12.0, 12.0000001,
  ])
  verify_linear_reference_limits(locator.nonsingular(12.0, 12.0000001), [
    12.0, 12.0000001,
  ])
}

///|
test "LinearLocator original 68 count 1" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=1)
  assert_eq(locator.numticks(), 1)
  assert_eq(locator.configured_numticks(), Some(1))
  verify_linear_reference_values(
    locator.tick_values(1.0, 1.0000000000000002).to_array(),
    [0.95],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(1.0, 1.0000000000000002), [
    0.999, 1.0010000000000001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(1.0, 1.0000000000000002))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(1.0, 1.0000000000000002), [
    0.999, 1.0010000000000001,
  ])
  verify_linear_reference_limits(locator.nonsingular(1.0, 1.0000000000000002), [
    0.95, 1.0500000000000003,
  ])
}

///|
test "LinearLocator original 69 count 1" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=1)
  assert_eq(locator.numticks(), 1)
  assert_eq(locator.configured_numticks(), Some(1))
  verify_linear_reference_values(
    locator.tick_values(1.0e-280, 1.0000000000000001e-280).to_array(),
    [9.499999999999999e-281],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(1.0e-280, 1.0000000000000001e-280),
    [9.99e-281, 1.001e-280],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(1.0e-280, 1.0000000000000001e-280))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(1.0e-280, 1.0000000000000001e-280),
    [9.99e-281, 1.001e-280],
  )
  verify_linear_reference_limits(
    locator.nonsingular(1.0e-280, 1.0000000000000001e-280),
    [9.499999999999999e-281, 1.0500000000000001e-280],
  )
}

///|
test "LinearLocator original 70 count 1" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=1)
  assert_eq(locator.numticks(), 1)
  assert_eq(locator.configured_numticks(), Some(1))
  verify_linear_reference_values(
    locator.tick_values(5.0e-324, -5.0e-324).to_array(),
    [-0.05],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(5.0e-324, -5.0e-324), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(5.0e-324, -5.0e-324))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(5.0e-324, -5.0e-324), [
    -0.001, 0.001,
  ])
  verify_linear_reference_limits(locator.nonsingular(5.0e-324, -5.0e-324), [
    -0.05, 0.05,
  ])
}

///|
test "LinearLocator original 71 count 1" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=1)
  assert_eq(locator.numticks(), 1)
  assert_eq(locator.configured_numticks(), Some(1))
  verify_linear_reference_values(
    locator.tick_values(1.0e-288, 2.0e-288).to_array(),
    [-0.05],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(1.0e-288, 2.0e-288), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(1.0e-288, 2.0e-288))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(1.0e-288, 2.0e-288), [
    -0.001, 0.001,
  ])
  verify_linear_reference_limits(locator.nonsingular(1.0e-288, 2.0e-288), [
    -0.05, 0.05,
  ])
}

///|
test "LinearLocator original 72 count 1" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=1)
  assert_eq(locator.numticks(), 1)
  assert_eq(locator.configured_numticks(), Some(1))
  verify_linear_reference_values(
    locator
    .tick_values(1.7976931348623157e+308, 1.7976931348623157e+308)
    .to_array(),
    [0.0 / 0.0],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(1.7976931348623157e+308, 1.7976931348623157e+308),
    [1.7958954417274534e+308, 1.0 / 0.0],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(
        locator.view_limits(1.7976931348623157e+308, 1.7976931348623157e+308),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(1.7976931348623157e+308, 1.7976931348623157e+308),
    [1.7958954417274534e+308, 1.0 / 0.0],
  )
  verify_linear_reference_limits(
    locator.nonsingular(1.7976931348623157e+308, 1.7976931348623157e+308),
    [1.7078084781191998e+308, 1.0 / 0.0],
  )
}

///|
test "LinearLocator original 73 count 1" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=1)
  assert_eq(locator.numticks(), 1)
  assert_eq(locator.configured_numticks(), Some(1))
  verify_linear_reference_values(
    locator
    .tick_values(-1.7976931348623157e+308, 1.7976931348623157e+308)
    .to_array(),
    [0.0 / 0.0],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(-1.7976931348623157e+308, 1.7976931348623157e+308),
    [-1.7976931348623157e+308, 1.7976931348623157e+308],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(
        locator.view_limits(-1.7976931348623157e+308, 1.7976931348623157e+308),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(-1.7976931348623157e+308, 1.7976931348623157e+308),
    [-1.7976931348623157e+308, 1.7976931348623157e+308],
  )
  verify_linear_reference_limits(
    locator.nonsingular(-1.7976931348623157e+308, 1.7976931348623157e+308),
    [-1.7976931348623157e+308, 1.7976931348623157e+308],
  )
}

///|
test "LinearLocator original 74 count 1" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=1)
  assert_eq(locator.numticks(), 1)
  assert_eq(locator.configured_numticks(), Some(1))
  verify_linear_reference_values(
    locator
    .tick_values(-1.7976931348623157e+308, -1.7976931348623157e+308)
    .to_array(),
    [0.0 / 0.0],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(-1.7976931348623157e+308, -1.7976931348623157e+308),
    [-1.0 / 0.0, -1.7958954417274534e+308],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(
        locator.view_limits(-1.7976931348623157e+308, -1.7976931348623157e+308),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(-1.7976931348623157e+308, -1.7976931348623157e+308),
    [-1.0 / 0.0, -1.7958954417274534e+308],
  )
  verify_linear_reference_limits(
    locator.nonsingular(-1.7976931348623157e+308, -1.7976931348623157e+308),
    [-1.0 / 0.0, -1.7078084781191998e+308],
  )
}

///|
test "LinearLocator original 75 count 1" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=1)
  assert_eq(locator.numticks(), 1)
  assert_eq(locator.configured_numticks(), Some(1))
  verify_linear_reference_values(
    locator.tick_values(1.0e+100, 1.0000000000000002e+100).to_array(),
    [9.500000000000001e+99],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(1.0e+100, 1.0000000000000002e+100),
    [9.99e+99, 1.0010000000000002e+100],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(1.0e+100, 1.0000000000000002e+100))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(1.0e+100, 1.0000000000000002e+100),
    [9.99e+99, 1.0010000000000002e+100],
  )
  verify_linear_reference_limits(
    locator.nonsingular(1.0e+100, 1.0000000000000002e+100),
    [9.500000000000001e+99, 1.0500000000000003e+100],
  )
}

///|
test "LinearLocator original 76 count 1" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=1)
  assert_eq(locator.numticks(), 1)
  assert_eq(locator.configured_numticks(), Some(1))
  verify_linear_reference_values(
    locator.tick_values(0.0 / 0.0, 0.0).to_array(),
    [-0.05],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0 / 0.0, 0.0), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(0.0 / 0.0, 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0 / 0.0, 0.0), [
    -0.001, 0.001,
  ])
  verify_linear_reference_limits(locator.nonsingular(0.0 / 0.0, 0.0), [
    -0.05, 0.05,
  ])
}

///|
test "LinearLocator original 77 count 1" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=1)
  assert_eq(locator.numticks(), 1)
  assert_eq(locator.configured_numticks(), Some(1))
  verify_linear_reference_values(
    locator.tick_values(0.0, 1.0 / 0.0).to_array(),
    [-0.05],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0, 1.0 / 0.0), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0, 1.0 / 0.0), [
    -0.001, 0.001,
  ])
  verify_linear_reference_limits(locator.nonsingular(0.0, 1.0 / 0.0), [
    -0.05, 0.05,
  ])
}

///|
test "LinearLocator original 78 count 1" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=1)
  assert_eq(locator.numticks(), 1)
  assert_eq(locator.configured_numticks(), Some(1))
  verify_linear_reference_values(
    locator.tick_values(-1.0 / 0.0, 1.0 / 0.0).to_array(),
    [-0.05],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(-1.0 / 0.0, 1.0 / 0.0), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(-1.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(-1.0 / 0.0, 1.0 / 0.0), [
    -0.001, 0.001,
  ])
  verify_linear_reference_limits(locator.nonsingular(-1.0 / 0.0, 1.0 / 0.0), [
    -0.05, 0.05,
  ])
}

///|
test "LinearLocator original 79 count 1" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=1)
  assert_eq(locator.numticks(), 1)
  assert_eq(locator.configured_numticks(), Some(1))
  verify_linear_reference_values(
    locator.tick_values(0.0 / 0.0, 0.0 / 0.0).to_array(),
    [-0.05],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0 / 0.0, 0.0 / 0.0), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(0.0 / 0.0, 0.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0 / 0.0, 0.0 / 0.0), [
    -0.001, 0.001,
  ])
  verify_linear_reference_limits(locator.nonsingular(0.0 / 0.0, 0.0 / 0.0), [
    -0.05, 0.05,
  ])
}

///|
test "LinearLocator original 80 count 2" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=2)
  assert_eq(locator.numticks(), 2)
  assert_eq(locator.configured_numticks(), Some(2))
  verify_linear_reference_values(locator.tick_values(-1.0, 1.0).to_array(), [
    -1.0, 1.0,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(-1.0, 1.0), [-1.0, 1.0])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(-1.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(-1.0, 1.0), [-1.0, 1.0])
  verify_linear_reference_limits(locator.nonsingular(-1.0, 1.0), [-1.0, 1.0])
}

///|
test "LinearLocator original 81 count 2" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=2)
  assert_eq(locator.numticks(), 2)
  assert_eq(locator.configured_numticks(), Some(2))
  verify_linear_reference_values(locator.tick_values(1.0, -1.0).to_array(), [
    -1.0, 1.0,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(1.0, -1.0), [-1.0, 1.0])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(1.0, -1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(1.0, -1.0), [-1.0, 1.0])
  verify_linear_reference_limits(locator.nonsingular(1.0, -1.0), [-1.0, 1.0])
}

///|
test "LinearLocator original 82 count 2" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=2)
  assert_eq(locator.numticks(), 2)
  assert_eq(locator.configured_numticks(), Some(2))
  verify_linear_reference_values(locator.tick_values(0.0, 0.0).to_array(), [
    -0.05, 0.05,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0, 0.0), [-1.0, 1.0])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(0.0, 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0, 0.0), [-1.0, 1.0])
  verify_linear_reference_limits(locator.nonsingular(0.0, 0.0), [-0.05, 0.05])
}

///|
test "LinearLocator original 83 count 2" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=2)
  assert_eq(locator.numticks(), 2)
  assert_eq(locator.configured_numticks(), Some(2))
  verify_linear_reference_values(locator.tick_values(-0.0, -0.0).to_array(), [
    -0.05, 0.05,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(-0.0, -0.0), [-1.0, 1.0])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(-0.0, -0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(-0.0, -0.0), [-1.0, 1.0])
  verify_linear_reference_limits(locator.nonsingular(-0.0, -0.0), [-0.05, 0.05])
}

///|
test "LinearLocator original 84 count 2" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=2)
  assert_eq(locator.numticks(), 2)
  assert_eq(locator.configured_numticks(), Some(2))
  verify_linear_reference_values(locator.tick_values(2.0, 2.0).to_array(), [
    1.9, 2.1,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(2.0, 2.0), [1.0, 3.0])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(2.0, 2.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(2.0, 2.0), [1.0, 3.0])
  verify_linear_reference_limits(locator.nonsingular(2.0, 2.0), [1.9, 2.1])
}

///|
test "LinearLocator original 85 count 2" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=2)
  assert_eq(locator.numticks(), 2)
  assert_eq(locator.configured_numticks(), Some(2))
  verify_linear_reference_values(locator.tick_values(-2.0, -2.0).to_array(), [
    -2.1, -1.9,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(-2.0, -2.0), [-3.0, -1.0])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(-2.0, -2.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(-2.0, -2.0), [-3.0, -1.0])
  verify_linear_reference_limits(locator.nonsingular(-2.0, -2.0), [-2.1, -1.9])
}

///|
test "LinearLocator original 86 count 2" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=2)
  assert_eq(locator.numticks(), 2)
  assert_eq(locator.configured_numticks(), Some(2))
  verify_linear_reference_values(locator.tick_values(0.1, 0.9).to_array(), [
    0.1, 0.9,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.1, 0.9), [0.1, 0.9])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(0.1, 0.9))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.1, 0.9), [0.1, 0.9])
  verify_linear_reference_limits(locator.nonsingular(0.1, 0.9), [0.1, 0.9])
}

///|
test "LinearLocator original 87 count 2" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=2)
  assert_eq(locator.numticks(), 2)
  assert_eq(locator.configured_numticks(), Some(2))
  verify_linear_reference_values(
    locator.tick_values(12.0, 12.0000001).to_array(),
    [12.0, 12.0000001],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(12.0, 12.0000001), [
    12.0, 12.0000001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(12.0, 12.0000001))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(12.0, 12.0000001), [
    12.0, 12.0000001,
  ])
  verify_linear_reference_limits(locator.nonsingular(12.0, 12.0000001), [
    12.0, 12.0000001,
  ])
}

///|
test "LinearLocator original 88 count 2" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=2)
  assert_eq(locator.numticks(), 2)
  assert_eq(locator.configured_numticks(), Some(2))
  verify_linear_reference_values(
    locator.tick_values(1.0, 1.0000000000000002).to_array(),
    [0.95, 1.0500000000000003],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(1.0, 1.0000000000000002), [
    0.999, 1.0010000000000001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(1.0, 1.0000000000000002))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(1.0, 1.0000000000000002), [
    0.999, 1.0010000000000001,
  ])
  verify_linear_reference_limits(locator.nonsingular(1.0, 1.0000000000000002), [
    0.95, 1.0500000000000003,
  ])
}

///|
test "LinearLocator original 89 count 2" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=2)
  assert_eq(locator.numticks(), 2)
  assert_eq(locator.configured_numticks(), Some(2))
  verify_linear_reference_values(
    locator.tick_values(1.0e-280, 1.0000000000000001e-280).to_array(),
    [9.499999999999999e-281, 1.0500000000000001e-280],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(1.0e-280, 1.0000000000000001e-280),
    [9.99e-281, 1.001e-280],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(1.0e-280, 1.0000000000000001e-280))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(1.0e-280, 1.0000000000000001e-280),
    [9.99e-281, 1.001e-280],
  )
  verify_linear_reference_limits(
    locator.nonsingular(1.0e-280, 1.0000000000000001e-280),
    [9.499999999999999e-281, 1.0500000000000001e-280],
  )
}

///|
test "LinearLocator original 90 count 2" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=2)
  assert_eq(locator.numticks(), 2)
  assert_eq(locator.configured_numticks(), Some(2))
  verify_linear_reference_values(
    locator.tick_values(5.0e-324, -5.0e-324).to_array(),
    [-0.05, 0.05],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(5.0e-324, -5.0e-324), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(5.0e-324, -5.0e-324))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(5.0e-324, -5.0e-324), [
    -0.001, 0.001,
  ])
  verify_linear_reference_limits(locator.nonsingular(5.0e-324, -5.0e-324), [
    -0.05, 0.05,
  ])
}

///|
test "LinearLocator original 91 count 2" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=2)
  assert_eq(locator.numticks(), 2)
  assert_eq(locator.configured_numticks(), Some(2))
  verify_linear_reference_values(
    locator.tick_values(1.0e-288, 2.0e-288).to_array(),
    [-0.05, 0.05],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(1.0e-288, 2.0e-288), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(1.0e-288, 2.0e-288))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(1.0e-288, 2.0e-288), [
    -0.001, 0.001,
  ])
  verify_linear_reference_limits(locator.nonsingular(1.0e-288, 2.0e-288), [
    -0.05, 0.05,
  ])
}

///|
test "LinearLocator original 92 count 2" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=2)
  assert_eq(locator.numticks(), 2)
  assert_eq(locator.configured_numticks(), Some(2))
  verify_linear_reference_values(
    locator
    .tick_values(1.7976931348623157e+308, 1.7976931348623157e+308)
    .to_array(),
    [0.0 / 0.0, 1.0 / 0.0],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(1.7976931348623157e+308, 1.7976931348623157e+308),
    [1.7958954417274534e+308, 1.0 / 0.0],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(
        locator.view_limits(1.7976931348623157e+308, 1.7976931348623157e+308),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(1.7976931348623157e+308, 1.7976931348623157e+308),
    [1.7958954417274534e+308, 1.0 / 0.0],
  )
  verify_linear_reference_limits(
    locator.nonsingular(1.7976931348623157e+308, 1.7976931348623157e+308),
    [1.7078084781191998e+308, 1.0 / 0.0],
  )
}

///|
test "LinearLocator original 93 count 2" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=2)
  assert_eq(locator.numticks(), 2)
  assert_eq(locator.configured_numticks(), Some(2))
  verify_linear_reference_values(
    locator
    .tick_values(-1.7976931348623157e+308, 1.7976931348623157e+308)
    .to_array(),
    [0.0 / 0.0, 1.7976931348623157e+308],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(-1.7976931348623157e+308, 1.7976931348623157e+308),
    [-1.7976931348623157e+308, 1.7976931348623157e+308],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(
        locator.view_limits(-1.7976931348623157e+308, 1.7976931348623157e+308),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(-1.7976931348623157e+308, 1.7976931348623157e+308),
    [-1.7976931348623157e+308, 1.7976931348623157e+308],
  )
  verify_linear_reference_limits(
    locator.nonsingular(-1.7976931348623157e+308, 1.7976931348623157e+308),
    [-1.7976931348623157e+308, 1.7976931348623157e+308],
  )
}

///|
test "LinearLocator original 94 count 2" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=2)
  assert_eq(locator.numticks(), 2)
  assert_eq(locator.configured_numticks(), Some(2))
  verify_linear_reference_values(
    locator
    .tick_values(-1.7976931348623157e+308, -1.7976931348623157e+308)
    .to_array(),
    [0.0 / 0.0, -1.7078084781191998e+308],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(-1.7976931348623157e+308, -1.7976931348623157e+308),
    [-1.0 / 0.0, -1.7958954417274534e+308],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(
        locator.view_limits(-1.7976931348623157e+308, -1.7976931348623157e+308),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(-1.7976931348623157e+308, -1.7976931348623157e+308),
    [-1.0 / 0.0, -1.7958954417274534e+308],
  )
  verify_linear_reference_limits(
    locator.nonsingular(-1.7976931348623157e+308, -1.7976931348623157e+308),
    [-1.0 / 0.0, -1.7078084781191998e+308],
  )
}

///|
test "LinearLocator original 95 count 2" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=2)
  assert_eq(locator.numticks(), 2)
  assert_eq(locator.configured_numticks(), Some(2))
  verify_linear_reference_values(
    locator.tick_values(1.0e+100, 1.0000000000000002e+100).to_array(),
    [9.500000000000001e+99, 1.0500000000000003e+100],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(1.0e+100, 1.0000000000000002e+100),
    [9.99e+99, 1.0010000000000002e+100],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(1.0e+100, 1.0000000000000002e+100))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(1.0e+100, 1.0000000000000002e+100),
    [9.99e+99, 1.0010000000000002e+100],
  )
  verify_linear_reference_limits(
    locator.nonsingular(1.0e+100, 1.0000000000000002e+100),
    [9.500000000000001e+99, 1.0500000000000003e+100],
  )
}

///|
test "LinearLocator original 96 count 2" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=2)
  assert_eq(locator.numticks(), 2)
  assert_eq(locator.configured_numticks(), Some(2))
  verify_linear_reference_values(
    locator.tick_values(0.0 / 0.0, 0.0).to_array(),
    [-0.05, 0.05],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0 / 0.0, 0.0), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(0.0 / 0.0, 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0 / 0.0, 0.0), [
    -0.001, 0.001,
  ])
  verify_linear_reference_limits(locator.nonsingular(0.0 / 0.0, 0.0), [
    -0.05, 0.05,
  ])
}

///|
test "LinearLocator original 97 count 2" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=2)
  assert_eq(locator.numticks(), 2)
  assert_eq(locator.configured_numticks(), Some(2))
  verify_linear_reference_values(
    locator.tick_values(0.0, 1.0 / 0.0).to_array(),
    [-0.05, 0.05],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0, 1.0 / 0.0), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0, 1.0 / 0.0), [
    -0.001, 0.001,
  ])
  verify_linear_reference_limits(locator.nonsingular(0.0, 1.0 / 0.0), [
    -0.05, 0.05,
  ])
}

///|
test "LinearLocator original 98 count 2" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=2)
  assert_eq(locator.numticks(), 2)
  assert_eq(locator.configured_numticks(), Some(2))
  verify_linear_reference_values(
    locator.tick_values(-1.0 / 0.0, 1.0 / 0.0).to_array(),
    [-0.05, 0.05],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(-1.0 / 0.0, 1.0 / 0.0), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(-1.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(-1.0 / 0.0, 1.0 / 0.0), [
    -0.001, 0.001,
  ])
  verify_linear_reference_limits(locator.nonsingular(-1.0 / 0.0, 1.0 / 0.0), [
    -0.05, 0.05,
  ])
}

///|
test "LinearLocator original 99 count 2" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=2)
  assert_eq(locator.numticks(), 2)
  assert_eq(locator.configured_numticks(), Some(2))
  verify_linear_reference_values(
    locator.tick_values(0.0 / 0.0, 0.0 / 0.0).to_array(),
    [-0.05, 0.05],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0 / 0.0, 0.0 / 0.0), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(0.0 / 0.0, 0.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0 / 0.0, 0.0 / 0.0), [
    -0.001, 0.001,
  ])
  verify_linear_reference_limits(locator.nonsingular(0.0 / 0.0, 0.0 / 0.0), [
    -0.05, 0.05,
  ])
}

///|
test "LinearLocator original 100 count 3" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=3)
  assert_eq(locator.numticks(), 3)
  assert_eq(locator.configured_numticks(), Some(3))
  verify_linear_reference_values(locator.tick_values(-1.0, 1.0).to_array(), [
    -1.0, 0.0, 1.0,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(-1.0, 1.0), [-1.0, 1.0])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_linear_reference_limits(locator.view_limits(-1.0, 1.0), [-1.0, 1.0])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(-1.0, 1.0), [-1.0, 1.0])
  verify_linear_reference_limits(locator.nonsingular(-1.0, 1.0), [-1.0, 1.0])
}

///|
test "LinearLocator original 101 count 3" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=3)
  assert_eq(locator.numticks(), 3)
  assert_eq(locator.configured_numticks(), Some(3))
  verify_linear_reference_values(locator.tick_values(1.0, -1.0).to_array(), [
    -1.0, 0.0, 1.0,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(1.0, -1.0), [-1.0, 1.0])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_linear_reference_limits(locator.view_limits(1.0, -1.0), [-1.0, 1.0])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(1.0, -1.0), [-1.0, 1.0])
  verify_linear_reference_limits(locator.nonsingular(1.0, -1.0), [-1.0, 1.0])
}

///|
test "LinearLocator original 102 count 3" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=3)
  assert_eq(locator.numticks(), 3)
  assert_eq(locator.configured_numticks(), Some(3))
  verify_linear_reference_values(locator.tick_values(0.0, 0.0).to_array(), [
    -0.05, 0.0, 0.05,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0, 0.0), [-1.0, 1.0])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_linear_reference_limits(locator.view_limits(0.0, 0.0), [-1.0, 1.0])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0, 0.0), [-1.0, 1.0])
  verify_linear_reference_limits(locator.nonsingular(0.0, 0.0), [-0.05, 0.05])
}

///|
test "LinearLocator original 103 count 3" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=3)
  assert_eq(locator.numticks(), 3)
  assert_eq(locator.configured_numticks(), Some(3))
  verify_linear_reference_values(locator.tick_values(-0.0, -0.0).to_array(), [
    -0.05, 0.0, 0.05,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(-0.0, -0.0), [-1.0, 1.0])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_linear_reference_limits(locator.view_limits(-0.0, -0.0), [-1.0, 1.0])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(-0.0, -0.0), [-1.0, 1.0])
  verify_linear_reference_limits(locator.nonsingular(-0.0, -0.0), [-0.05, 0.05])
}

///|
test "LinearLocator original 104 count 3" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=3)
  assert_eq(locator.numticks(), 3)
  assert_eq(locator.configured_numticks(), Some(3))
  verify_linear_reference_values(locator.tick_values(2.0, 2.0).to_array(), [
    1.9, 2.0, 2.1,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(2.0, 2.0), [1.0, 3.0])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_linear_reference_limits(locator.view_limits(2.0, 2.0), [1.0, 3.0])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(2.0, 2.0), [1.0, 3.0])
  verify_linear_reference_limits(locator.nonsingular(2.0, 2.0), [1.9, 2.1])
}

///|
test "LinearLocator original 105 count 3" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=3)
  assert_eq(locator.numticks(), 3)
  assert_eq(locator.configured_numticks(), Some(3))
  verify_linear_reference_values(locator.tick_values(-2.0, -2.0).to_array(), [
    -2.1, -2.0, -1.9,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(-2.0, -2.0), [-3.0, -1.0])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_linear_reference_limits(locator.view_limits(-2.0, -2.0), [-3.0, -1.0])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(-2.0, -2.0), [-3.0, -1.0])
  verify_linear_reference_limits(locator.nonsingular(-2.0, -2.0), [-2.1, -1.9])
}

///|
test "LinearLocator original 106 count 3" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=3)
  assert_eq(locator.numticks(), 3)
  assert_eq(locator.configured_numticks(), Some(3))
  verify_linear_reference_values(locator.tick_values(0.1, 0.9).to_array(), [
    0.1, 0.5, 0.9,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.1, 0.9), [0.1, 0.9])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_linear_reference_limits(locator.view_limits(0.1, 0.9), [0.0, 1.0])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.1, 0.9), [0.1, 0.9])
  verify_linear_reference_limits(locator.nonsingular(0.1, 0.9), [0.1, 0.9])
}

///|
test "LinearLocator original 107 count 3" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=3)
  assert_eq(locator.numticks(), 3)
  assert_eq(locator.configured_numticks(), Some(3))
  verify_linear_reference_values(
    locator.tick_values(12.0, 12.0000001).to_array(),
    [12.0, 12.00000005, 12.0000001],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(12.0, 12.0000001), [
    12.0, 12.0000001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_linear_reference_limits(locator.view_limits(12.0, 12.0000001), [
    12.0, 12.00000011920929,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(12.0, 12.0000001), [
    12.0, 12.0000001,
  ])
  verify_linear_reference_limits(locator.nonsingular(12.0, 12.0000001), [
    12.0, 12.0000001,
  ])
}

///|
test "LinearLocator original 108 count 3" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=3)
  assert_eq(locator.numticks(), 3)
  assert_eq(locator.configured_numticks(), Some(3))
  verify_linear_reference_values(
    locator.tick_values(1.0, 1.0000000000000002).to_array(),
    [0.95, 1.0, 1.0500000000000003],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(1.0, 1.0000000000000002), [
    0.999, 1.0010000000000001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_linear_reference_limits(locator.view_limits(1.0, 1.0000000000000002), [
    0.999, 1.0010000000000001,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(1.0, 1.0000000000000002), [
    0.999, 1.0010000000000001,
  ])
  verify_linear_reference_limits(locator.nonsingular(1.0, 1.0000000000000002), [
    0.95, 1.0500000000000003,
  ])
}

///|
test "LinearLocator original 109 count 3" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=3)
  assert_eq(locator.numticks(), 3)
  assert_eq(locator.configured_numticks(), Some(3))
  verify_linear_reference_values(
    locator.tick_values(1.0e-280, 1.0000000000000001e-280).to_array(),
    [9.499999999999999e-281, 1.0e-280, 1.0500000000000001e-280],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(1.0e-280, 1.0000000000000001e-280),
    [9.99e-281, 1.001e-280],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_linear_reference_limits(
    locator.view_limits(1.0e-280, 1.0000000000000001e-280),
    [9.99e-281, 1.001e-280],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(1.0e-280, 1.0000000000000001e-280),
    [9.99e-281, 1.001e-280],
  )
  verify_linear_reference_limits(
    locator.nonsingular(1.0e-280, 1.0000000000000001e-280),
    [9.499999999999999e-281, 1.0500000000000001e-280],
  )
}

///|
test "LinearLocator original 110 count 3" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=3)
  assert_eq(locator.numticks(), 3)
  assert_eq(locator.configured_numticks(), Some(3))
  verify_linear_reference_values(
    locator.tick_values(5.0e-324, -5.0e-324).to_array(),
    [-0.05, 0.0, 0.05],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(5.0e-324, -5.0e-324), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(5.0e-324, -5.0e-324))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(5.0e-324, -5.0e-324), [
    -0.001, 0.001,
  ])
  verify_linear_reference_limits(locator.nonsingular(5.0e-324, -5.0e-324), [
    -0.05, 0.05,
  ])
}

///|
test "LinearLocator original 111 count 3" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=3)
  assert_eq(locator.numticks(), 3)
  assert_eq(locator.configured_numticks(), Some(3))
  verify_linear_reference_values(
    locator.tick_values(1.0e-288, 2.0e-288).to_array(),
    [-0.05, 0.0, 0.05],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(1.0e-288, 2.0e-288), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_linear_reference_limits(locator.view_limits(1.0e-288, 2.0e-288), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(1.0e-288, 2.0e-288), [
    -0.001, 0.001,
  ])
  verify_linear_reference_limits(locator.nonsingular(1.0e-288, 2.0e-288), [
    -0.05, 0.05,
  ])
}

///|
test "LinearLocator original 112 count 3" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=3)
  assert_eq(locator.numticks(), 3)
  assert_eq(locator.configured_numticks(), Some(3))
  verify_linear_reference_values(
    locator
    .tick_values(1.7976931348623157e+308, 1.7976931348623157e+308)
    .to_array(),
    [0.0 / 0.0, 1.0 / 0.0, 1.0 / 0.0],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(1.7976931348623157e+308, 1.7976931348623157e+308),
    [1.7958954417274534e+308, 1.0 / 0.0],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(
        locator.view_limits(1.7976931348623157e+308, 1.7976931348623157e+308),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(1.7976931348623157e+308, 1.7976931348623157e+308),
    [1.7958954417274534e+308, 1.0 / 0.0],
  )
  verify_linear_reference_limits(
    locator.nonsingular(1.7976931348623157e+308, 1.7976931348623157e+308),
    [1.7078084781191998e+308, 1.0 / 0.0],
  )
}

///|
test "LinearLocator original 113 count 3" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=3)
  assert_eq(locator.numticks(), 3)
  assert_eq(locator.configured_numticks(), Some(3))
  verify_linear_reference_values(
    locator
    .tick_values(-1.7976931348623157e+308, 1.7976931348623157e+308)
    .to_array(),
    [0.0 / 0.0, 1.0 / 0.0, 1.7976931348623157e+308],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(-1.7976931348623157e+308, 1.7976931348623157e+308),
    [-1.7976931348623157e+308, 1.7976931348623157e+308],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(
        locator.view_limits(-1.7976931348623157e+308, 1.7976931348623157e+308),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(-1.7976931348623157e+308, 1.7976931348623157e+308),
    [-1.7976931348623157e+308, 1.7976931348623157e+308],
  )
  verify_linear_reference_limits(
    locator.nonsingular(-1.7976931348623157e+308, 1.7976931348623157e+308),
    [-1.7976931348623157e+308, 1.7976931348623157e+308],
  )
}

///|
test "LinearLocator original 114 count 3" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=3)
  assert_eq(locator.numticks(), 3)
  assert_eq(locator.configured_numticks(), Some(3))
  verify_linear_reference_values(
    locator
    .tick_values(-1.7976931348623157e+308, -1.7976931348623157e+308)
    .to_array(),
    [0.0 / 0.0, 0.0 / 0.0, -1.7078084781191998e+308],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(-1.7976931348623157e+308, -1.7976931348623157e+308),
    [-1.0 / 0.0, -1.7958954417274534e+308],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(
        locator.view_limits(-1.7976931348623157e+308, -1.7976931348623157e+308),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(-1.7976931348623157e+308, -1.7976931348623157e+308),
    [-1.0 / 0.0, -1.7958954417274534e+308],
  )
  verify_linear_reference_limits(
    locator.nonsingular(-1.7976931348623157e+308, -1.7976931348623157e+308),
    [-1.0 / 0.0, -1.7078084781191998e+308],
  )
}

///|
test "LinearLocator original 115 count 3" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=3)
  assert_eq(locator.numticks(), 3)
  assert_eq(locator.configured_numticks(), Some(3))
  verify_linear_reference_values(
    locator.tick_values(1.0e+100, 1.0000000000000002e+100).to_array(),
    [9.500000000000001e+99, 1.0000000000000002e+100, 1.0500000000000003e+100],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(1.0e+100, 1.0000000000000002e+100),
    [9.99e+99, 1.0010000000000002e+100],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_linear_reference_limits(
    locator.view_limits(1.0e+100, 1.0000000000000002e+100),
    [9.99e+99, 1.0010000000000002e+100],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(1.0e+100, 1.0000000000000002e+100),
    [9.99e+99, 1.0010000000000002e+100],
  )
  verify_linear_reference_limits(
    locator.nonsingular(1.0e+100, 1.0000000000000002e+100),
    [9.500000000000001e+99, 1.0500000000000003e+100],
  )
}

///|
test "LinearLocator original 116 count 3" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=3)
  assert_eq(locator.numticks(), 3)
  assert_eq(locator.configured_numticks(), Some(3))
  verify_linear_reference_values(
    locator.tick_values(0.0 / 0.0, 0.0).to_array(),
    [-0.05, 0.0, 0.05],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0 / 0.0, 0.0), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(0.0 / 0.0, 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0 / 0.0, 0.0), [
    -0.001, 0.001,
  ])
  verify_linear_reference_limits(locator.nonsingular(0.0 / 0.0, 0.0), [
    -0.05, 0.05,
  ])
}

///|
test "LinearLocator original 117 count 3" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=3)
  assert_eq(locator.numticks(), 3)
  assert_eq(locator.configured_numticks(), Some(3))
  verify_linear_reference_values(
    locator.tick_values(0.0, 1.0 / 0.0).to_array(),
    [-0.05, 0.0, 0.05],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0, 1.0 / 0.0), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0, 1.0 / 0.0), [
    -0.001, 0.001,
  ])
  verify_linear_reference_limits(locator.nonsingular(0.0, 1.0 / 0.0), [
    -0.05, 0.05,
  ])
}

///|
test "LinearLocator original 118 count 3" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=3)
  assert_eq(locator.numticks(), 3)
  assert_eq(locator.configured_numticks(), Some(3))
  verify_linear_reference_values(
    locator.tick_values(-1.0 / 0.0, 1.0 / 0.0).to_array(),
    [-0.05, 0.0, 0.05],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(-1.0 / 0.0, 1.0 / 0.0), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(-1.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(-1.0 / 0.0, 1.0 / 0.0), [
    -0.001, 0.001,
  ])
  verify_linear_reference_limits(locator.nonsingular(-1.0 / 0.0, 1.0 / 0.0), [
    -0.05, 0.05,
  ])
}

///|
test "LinearLocator original 119 count 3" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=3)
  assert_eq(locator.numticks(), 3)
  assert_eq(locator.configured_numticks(), Some(3))
  verify_linear_reference_values(
    locator.tick_values(0.0 / 0.0, 0.0 / 0.0).to_array(),
    [-0.05, 0.0, 0.05],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0 / 0.0, 0.0 / 0.0), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(0.0 / 0.0, 0.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0 / 0.0, 0.0 / 0.0), [
    -0.001, 0.001,
  ])
  verify_linear_reference_limits(locator.nonsingular(0.0 / 0.0, 0.0 / 0.0), [
    -0.05, 0.05,
  ])
}

///|
test "LinearLocator original 120 count 7" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=7)
  assert_eq(locator.numticks(), 7)
  assert_eq(locator.configured_numticks(), Some(7))
  verify_linear_reference_values(locator.tick_values(-1.0, 1.0).to_array(), [
    -1.0, -0.6666666666666667, -0.33333333333333337, 0.0, 0.33333333333333326, 0.6666666666666665,
    1.0,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(-1.0, 1.0), [-1.0, 1.0])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_linear_reference_limits(locator.view_limits(-1.0, 1.0), [-1.0, 1.0])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(-1.0, 1.0), [-1.0, 1.0])
  verify_linear_reference_limits(locator.nonsingular(-1.0, 1.0), [-1.0, 1.0])
}

///|
test "LinearLocator original 121 count 7" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=7)
  assert_eq(locator.numticks(), 7)
  assert_eq(locator.configured_numticks(), Some(7))
  verify_linear_reference_values(locator.tick_values(1.0, -1.0).to_array(), [
    -1.0, -0.6666666666666667, -0.33333333333333337, 0.0, 0.33333333333333326, 0.6666666666666665,
    1.0,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(1.0, -1.0), [-1.0, 1.0])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_linear_reference_limits(locator.view_limits(1.0, -1.0), [-1.0, 1.0])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(1.0, -1.0), [-1.0, 1.0])
  verify_linear_reference_limits(locator.nonsingular(1.0, -1.0), [-1.0, 1.0])
}

///|
test "LinearLocator original 122 count 7" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=7)
  assert_eq(locator.numticks(), 7)
  assert_eq(locator.configured_numticks(), Some(7))
  verify_linear_reference_values(locator.tick_values(0.0, 0.0).to_array(), [
    -0.05, -0.03333333333333334, -0.01666666666666667, 0.0, 0.016666666666666663,
    0.033333333333333326, 0.05,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0, 0.0), [-1.0, 1.0])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_linear_reference_limits(locator.view_limits(0.0, 0.0), [-1.0, 1.0])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0, 0.0), [-1.0, 1.0])
  verify_linear_reference_limits(locator.nonsingular(0.0, 0.0), [-0.05, 0.05])
}

///|
test "LinearLocator original 123 count 7" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=7)
  assert_eq(locator.numticks(), 7)
  assert_eq(locator.configured_numticks(), Some(7))
  verify_linear_reference_values(locator.tick_values(-0.0, -0.0).to_array(), [
    -0.05, -0.03333333333333334, -0.01666666666666667, 0.0, 0.016666666666666663,
    0.033333333333333326, 0.05,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(-0.0, -0.0), [-1.0, 1.0])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_linear_reference_limits(locator.view_limits(-0.0, -0.0), [-1.0, 1.0])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(-0.0, -0.0), [-1.0, 1.0])
  verify_linear_reference_limits(locator.nonsingular(-0.0, -0.0), [-0.05, 0.05])
}

///|
test "LinearLocator original 124 count 7" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=7)
  assert_eq(locator.numticks(), 7)
  assert_eq(locator.configured_numticks(), Some(7))
  verify_linear_reference_values(locator.tick_values(2.0, 2.0).to_array(), [
    1.9, 1.9333333333333333, 1.9666666666666666, 2.0, 2.033333333333333, 2.066666666666667,
    2.1,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(2.0, 2.0), [1.0, 3.0])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_linear_reference_limits(locator.view_limits(2.0, 2.0), [1.0, 3.0])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(2.0, 2.0), [1.0, 3.0])
  verify_linear_reference_limits(locator.nonsingular(2.0, 2.0), [1.9, 2.1])
}

///|
test "LinearLocator original 125 count 7" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=7)
  assert_eq(locator.numticks(), 7)
  assert_eq(locator.configured_numticks(), Some(7))
  verify_linear_reference_values(locator.tick_values(-2.0, -2.0).to_array(), [
    -2.1, -2.066666666666667, -2.033333333333333, -2.0, -1.9666666666666666, -1.9333333333333333,
    -1.9,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(-2.0, -2.0), [-3.0, -1.0])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_linear_reference_limits(locator.view_limits(-2.0, -2.0), [-3.0, -1.0])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(-2.0, -2.0), [-3.0, -1.0])
  verify_linear_reference_limits(locator.nonsingular(-2.0, -2.0), [-2.1, -1.9])
}

///|
test "LinearLocator original 126 count 7" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=7)
  assert_eq(locator.numticks(), 7)
  assert_eq(locator.configured_numticks(), Some(7))
  verify_linear_reference_values(locator.tick_values(0.1, 0.9).to_array(), [
    0.1, 0.23333333333333334, 0.3666666666666667, 0.5, 0.6333333333333333, 0.7666666666666666,
    0.9,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.1, 0.9), [0.1, 0.9])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_linear_reference_limits(locator.view_limits(0.1, 0.9), [0.0, 1.0])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.1, 0.9), [0.1, 0.9])
  verify_linear_reference_limits(locator.nonsingular(0.1, 0.9), [0.1, 0.9])
}

///|
test "LinearLocator original 127 count 7" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=7)
  assert_eq(locator.numticks(), 7)
  assert_eq(locator.configured_numticks(), Some(7))
  verify_linear_reference_values(
    locator.tick_values(12.0, 12.0000001).to_array(),
    [
      12.0, 12.000000016666666, 12.000000033333333, 12.00000005, 12.000000066666667,
      12.000000083333333, 12.0000001,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(12.0, 12.0000001), [
    12.0, 12.0000001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_linear_reference_limits(locator.view_limits(12.0, 12.0000001), [
    12.0, 12.000000115767202,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(12.0, 12.0000001), [
    12.0, 12.0000001,
  ])
  verify_linear_reference_limits(locator.nonsingular(12.0, 12.0000001), [
    12.0, 12.0000001,
  ])
}

///|
test "LinearLocator original 128 count 7" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=7)
  assert_eq(locator.numticks(), 7)
  assert_eq(locator.configured_numticks(), Some(7))
  verify_linear_reference_values(
    locator.tick_values(1.0, 1.0000000000000002).to_array(),
    [
      0.95, 0.9666666666666667, 0.9833333333333334, 1.0, 1.0166666666666668, 1.0333333333333337,
      1.0500000000000003,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(1.0, 1.0000000000000002), [
    0.999, 1.0010000000000001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_linear_reference_limits(locator.view_limits(1.0, 1.0000000000000002), [
    0.999, 1.0010000000000001,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(1.0, 1.0000000000000002), [
    0.999, 1.0010000000000001,
  ])
  verify_linear_reference_limits(locator.nonsingular(1.0, 1.0000000000000002), [
    0.95, 1.0500000000000003,
  ])
}

///|
test "LinearLocator original 129 count 7" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=7)
  assert_eq(locator.numticks(), 7)
  assert_eq(locator.configured_numticks(), Some(7))
  verify_linear_reference_values(
    locator.tick_values(1.0e-280, 1.0000000000000001e-280).to_array(),
    [
      9.499999999999999e-281, 9.666666666666666e-281, 9.833333333333334e-281, 1.0e-280,
      1.0166666666666667e-280, 1.0333333333333334e-280, 1.0500000000000001e-280,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(1.0e-280, 1.0000000000000001e-280),
    [9.99e-281, 1.001e-280],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_linear_reference_limits(
    locator.view_limits(1.0e-280, 1.0000000000000001e-280),
    [9.99e-281, 1.001e-280],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(1.0e-280, 1.0000000000000001e-280),
    [9.99e-281, 1.001e-280],
  )
  verify_linear_reference_limits(
    locator.nonsingular(1.0e-280, 1.0000000000000001e-280),
    [9.499999999999999e-281, 1.0500000000000001e-280],
  )
}

///|
test "LinearLocator original 130 count 7" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=7)
  assert_eq(locator.numticks(), 7)
  assert_eq(locator.configured_numticks(), Some(7))
  verify_linear_reference_values(
    locator.tick_values(5.0e-324, -5.0e-324).to_array(),
    [
      -0.05, -0.03333333333333334, -0.01666666666666667, 0.0, 0.016666666666666663,
      0.033333333333333326, 0.05,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(5.0e-324, -5.0e-324), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(5.0e-324, -5.0e-324))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(5.0e-324, -5.0e-324), [
    -0.001, 0.001,
  ])
  verify_linear_reference_limits(locator.nonsingular(5.0e-324, -5.0e-324), [
    -0.05, 0.05,
  ])
}

///|
test "LinearLocator original 131 count 7" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=7)
  assert_eq(locator.numticks(), 7)
  assert_eq(locator.configured_numticks(), Some(7))
  verify_linear_reference_values(
    locator.tick_values(1.0e-288, 2.0e-288).to_array(),
    [
      -0.05, -0.03333333333333334, -0.01666666666666667, 0.0, 0.016666666666666663,
      0.033333333333333326, 0.05,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(1.0e-288, 2.0e-288), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_linear_reference_limits(locator.view_limits(1.0e-288, 2.0e-288), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(1.0e-288, 2.0e-288), [
    -0.001, 0.001,
  ])
  verify_linear_reference_limits(locator.nonsingular(1.0e-288, 2.0e-288), [
    -0.05, 0.05,
  ])
}

///|
test "LinearLocator original 132 count 7" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=7)
  assert_eq(locator.numticks(), 7)
  assert_eq(locator.configured_numticks(), Some(7))
  verify_linear_reference_values(
    locator
    .tick_values(1.7976931348623157e+308, 1.7976931348623157e+308)
    .to_array(),
    [
      0.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(1.7976931348623157e+308, 1.7976931348623157e+308),
    [1.7958954417274534e+308, 1.0 / 0.0],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(
        locator.view_limits(1.7976931348623157e+308, 1.7976931348623157e+308),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(1.7976931348623157e+308, 1.7976931348623157e+308),
    [1.7958954417274534e+308, 1.0 / 0.0],
  )
  verify_linear_reference_limits(
    locator.nonsingular(1.7976931348623157e+308, 1.7976931348623157e+308),
    [1.7078084781191998e+308, 1.0 / 0.0],
  )
}

///|
test "LinearLocator original 133 count 7" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=7)
  assert_eq(locator.numticks(), 7)
  assert_eq(locator.configured_numticks(), Some(7))
  verify_linear_reference_values(
    locator
    .tick_values(-1.7976931348623157e+308, 1.7976931348623157e+308)
    .to_array(),
    [
      0.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
      1.7976931348623157e+308,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(-1.7976931348623157e+308, 1.7976931348623157e+308),
    [-1.7976931348623157e+308, 1.7976931348623157e+308],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(
        locator.view_limits(-1.7976931348623157e+308, 1.7976931348623157e+308),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(-1.7976931348623157e+308, 1.7976931348623157e+308),
    [-1.7976931348623157e+308, 1.7976931348623157e+308],
  )
  verify_linear_reference_limits(
    locator.nonsingular(-1.7976931348623157e+308, 1.7976931348623157e+308),
    [-1.7976931348623157e+308, 1.7976931348623157e+308],
  )
}

///|
test "LinearLocator original 134 count 7" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=7)
  assert_eq(locator.numticks(), 7)
  assert_eq(locator.configured_numticks(), Some(7))
  verify_linear_reference_values(
    locator
    .tick_values(-1.7976931348623157e+308, -1.7976931348623157e+308)
    .to_array(),
    [
      0.0 / 0.0,
      0.0 / 0.0,
      0.0 / 0.0,
      0.0 / 0.0,
      0.0 / 0.0,
      0.0 / 0.0,
      -1.7078084781191998e+308,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(-1.7976931348623157e+308, -1.7976931348623157e+308),
    [-1.0 / 0.0, -1.7958954417274534e+308],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(
        locator.view_limits(-1.7976931348623157e+308, -1.7976931348623157e+308),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(-1.7976931348623157e+308, -1.7976931348623157e+308),
    [-1.0 / 0.0, -1.7958954417274534e+308],
  )
  verify_linear_reference_limits(
    locator.nonsingular(-1.7976931348623157e+308, -1.7976931348623157e+308),
    [-1.0 / 0.0, -1.7078084781191998e+308],
  )
}

///|
test "LinearLocator original 135 count 7" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=7)
  assert_eq(locator.numticks(), 7)
  assert_eq(locator.configured_numticks(), Some(7))
  verify_linear_reference_values(
    locator.tick_values(1.0e+100, 1.0000000000000002e+100).to_array(),
    [
      9.500000000000001e+99, 9.666666666666668e+99, 9.833333333333335e+99, 1.0000000000000002e+100,
      1.016666666666667e+100, 1.0333333333333336e+100, 1.0500000000000003e+100,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(1.0e+100, 1.0000000000000002e+100),
    [9.99e+99, 1.0010000000000002e+100],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_linear_reference_limits(
    locator.view_limits(1.0e+100, 1.0000000000000002e+100),
    [9.99e+99, 1.0010000000000002e+100],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(1.0e+100, 1.0000000000000002e+100),
    [9.99e+99, 1.0010000000000002e+100],
  )
  verify_linear_reference_limits(
    locator.nonsingular(1.0e+100, 1.0000000000000002e+100),
    [9.500000000000001e+99, 1.0500000000000003e+100],
  )
}

///|
test "LinearLocator original 136 count 7" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=7)
  assert_eq(locator.numticks(), 7)
  assert_eq(locator.configured_numticks(), Some(7))
  verify_linear_reference_values(
    locator.tick_values(0.0 / 0.0, 0.0).to_array(),
    [
      -0.05, -0.03333333333333334, -0.01666666666666667, 0.0, 0.016666666666666663,
      0.033333333333333326, 0.05,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0 / 0.0, 0.0), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(0.0 / 0.0, 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0 / 0.0, 0.0), [
    -0.001, 0.001,
  ])
  verify_linear_reference_limits(locator.nonsingular(0.0 / 0.0, 0.0), [
    -0.05, 0.05,
  ])
}

///|
test "LinearLocator original 137 count 7" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=7)
  assert_eq(locator.numticks(), 7)
  assert_eq(locator.configured_numticks(), Some(7))
  verify_linear_reference_values(
    locator.tick_values(0.0, 1.0 / 0.0).to_array(),
    [
      -0.05, -0.03333333333333334, -0.01666666666666667, 0.0, 0.016666666666666663,
      0.033333333333333326, 0.05,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0, 1.0 / 0.0), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0, 1.0 / 0.0), [
    -0.001, 0.001,
  ])
  verify_linear_reference_limits(locator.nonsingular(0.0, 1.0 / 0.0), [
    -0.05, 0.05,
  ])
}

///|
test "LinearLocator original 138 count 7" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=7)
  assert_eq(locator.numticks(), 7)
  assert_eq(locator.configured_numticks(), Some(7))
  verify_linear_reference_values(
    locator.tick_values(-1.0 / 0.0, 1.0 / 0.0).to_array(),
    [
      -0.05, -0.03333333333333334, -0.01666666666666667, 0.0, 0.016666666666666663,
      0.033333333333333326, 0.05,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(-1.0 / 0.0, 1.0 / 0.0), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(-1.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(-1.0 / 0.0, 1.0 / 0.0), [
    -0.001, 0.001,
  ])
  verify_linear_reference_limits(locator.nonsingular(-1.0 / 0.0, 1.0 / 0.0), [
    -0.05, 0.05,
  ])
}

///|
test "LinearLocator original 139 count 7" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=7)
  assert_eq(locator.numticks(), 7)
  assert_eq(locator.configured_numticks(), Some(7))
  verify_linear_reference_values(
    locator.tick_values(0.0 / 0.0, 0.0 / 0.0).to_array(),
    [
      -0.05, -0.03333333333333334, -0.01666666666666667, 0.0, 0.016666666666666663,
      0.033333333333333326, 0.05,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0 / 0.0, 0.0 / 0.0), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(0.0 / 0.0, 0.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0 / 0.0, 0.0 / 0.0), [
    -0.001, 0.001,
  ])
  verify_linear_reference_limits(locator.nonsingular(0.0 / 0.0, 0.0 / 0.0), [
    -0.05, 0.05,
  ])
}

///|
test "LinearLocator original 140 count 11" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=11)
  assert_eq(locator.numticks(), 11)
  assert_eq(locator.configured_numticks(), Some(11))
  verify_linear_reference_values(locator.tick_values(-1.0, 1.0).to_array(), [
    -1.0, -0.8, -0.6, -0.3999999999999999, -0.19999999999999996, 0.0, 0.20000000000000018,
    0.40000000000000013, 0.6000000000000001, 0.8, 1.0,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(-1.0, 1.0), [-1.0, 1.0])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_linear_reference_limits(locator.view_limits(-1.0, 1.0), [-1.0, 1.0])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(-1.0, 1.0), [-1.0, 1.0])
  verify_linear_reference_limits(locator.nonsingular(-1.0, 1.0), [-1.0, 1.0])
}

///|
test "LinearLocator original 141 count 11" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=11)
  assert_eq(locator.numticks(), 11)
  assert_eq(locator.configured_numticks(), Some(11))
  verify_linear_reference_values(locator.tick_values(1.0, -1.0).to_array(), [
    -1.0, -0.8, -0.6, -0.3999999999999999, -0.19999999999999996, 0.0, 0.20000000000000018,
    0.40000000000000013, 0.6000000000000001, 0.8, 1.0,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(1.0, -1.0), [-1.0, 1.0])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_linear_reference_limits(locator.view_limits(1.0, -1.0), [-1.0, 1.0])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(1.0, -1.0), [-1.0, 1.0])
  verify_linear_reference_limits(locator.nonsingular(1.0, -1.0), [-1.0, 1.0])
}

///|
test "LinearLocator original 142 count 11" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=11)
  assert_eq(locator.numticks(), 11)
  assert_eq(locator.configured_numticks(), Some(11))
  verify_linear_reference_values(locator.tick_values(0.0, 0.0).to_array(), [
    -0.05, -0.04, -0.030000000000000002, -0.020000000000000004, -0.010000000000000002,
    0.0, 0.009999999999999995, 0.020000000000000004, 0.03, 0.039999999999999994,
    0.05,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0, 0.0), [-1.0, 1.0])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_linear_reference_limits(locator.view_limits(0.0, 0.0), [-1.0, 1.0])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0, 0.0), [-1.0, 1.0])
  verify_linear_reference_limits(locator.nonsingular(0.0, 0.0), [-0.05, 0.05])
}

///|
test "LinearLocator original 143 count 11" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=11)
  assert_eq(locator.numticks(), 11)
  assert_eq(locator.configured_numticks(), Some(11))
  verify_linear_reference_values(locator.tick_values(-0.0, -0.0).to_array(), [
    -0.05, -0.04, -0.030000000000000002, -0.020000000000000004, -0.010000000000000002,
    0.0, 0.009999999999999995, 0.020000000000000004, 0.03, 0.039999999999999994,
    0.05,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(-0.0, -0.0), [-1.0, 1.0])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_linear_reference_limits(locator.view_limits(-0.0, -0.0), [-1.0, 1.0])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(-0.0, -0.0), [-1.0, 1.0])
  verify_linear_reference_limits(locator.nonsingular(-0.0, -0.0), [-0.05, 0.05])
}

///|
test "LinearLocator original 144 count 11" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=11)
  assert_eq(locator.numticks(), 11)
  assert_eq(locator.configured_numticks(), Some(11))
  verify_linear_reference_values(locator.tick_values(2.0, 2.0).to_array(), [
    1.9, 1.92, 1.94, 1.96, 1.98, 2.0, 2.02, 2.04, 2.06, 2.08, 2.1,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(2.0, 2.0), [1.0, 3.0])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_linear_reference_limits(locator.view_limits(2.0, 2.0), [1.0, 3.0])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(2.0, 2.0), [1.0, 3.0])
  verify_linear_reference_limits(locator.nonsingular(2.0, 2.0), [1.9, 2.1])
}

///|
test "LinearLocator original 145 count 11" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=11)
  assert_eq(locator.numticks(), 11)
  assert_eq(locator.configured_numticks(), Some(11))
  verify_linear_reference_values(locator.tick_values(-2.0, -2.0).to_array(), [
    -2.1, -2.08, -2.06, -2.04, -2.02, -2.0, -1.98, -1.96, -1.94, -1.92, -1.9,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(-2.0, -2.0), [-3.0, -1.0])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_linear_reference_limits(locator.view_limits(-2.0, -2.0), [-3.0, -1.0])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(-2.0, -2.0), [-3.0, -1.0])
  verify_linear_reference_limits(locator.nonsingular(-2.0, -2.0), [-2.1, -1.9])
}

///|
test "LinearLocator original 146 count 11" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=11)
  assert_eq(locator.numticks(), 11)
  assert_eq(locator.configured_numticks(), Some(11))
  verify_linear_reference_values(locator.tick_values(0.1, 0.9).to_array(), [
    0.1, 0.18, 0.26, 0.33999999999999997, 0.42000000000000004, 0.5, 0.58, 0.66, 0.74,
    0.82, 0.9,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.1, 0.9), [0.1, 0.9])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_linear_reference_limits(locator.view_limits(0.1, 0.9), [0.1, 0.9])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.1, 0.9), [0.1, 0.9])
  verify_linear_reference_limits(locator.nonsingular(0.1, 0.9), [0.1, 0.9])
}

///|
test "LinearLocator original 147 count 11" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=11)
  assert_eq(locator.numticks(), 11)
  assert_eq(locator.configured_numticks(), Some(11))
  verify_linear_reference_values(
    locator.tick_values(12.0, 12.0000001).to_array(),
    [
      12.0, 12.00000001, 12.00000002, 12.000000029999999, 12.00000004, 12.00000005,
      12.00000006, 12.000000069999999, 12.00000008, 12.00000009, 12.0000001,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(12.0, 12.0000001), [
    12.0, 12.0000001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_linear_reference_limits(locator.view_limits(12.0, 12.0000001), [
    12.0, 12.0000001,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(12.0, 12.0000001), [
    12.0, 12.0000001,
  ])
  verify_linear_reference_limits(locator.nonsingular(12.0, 12.0000001), [
    12.0, 12.0000001,
  ])
}

///|
test "LinearLocator original 148 count 11" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=11)
  assert_eq(locator.numticks(), 11)
  assert_eq(locator.configured_numticks(), Some(11))
  verify_linear_reference_values(
    locator.tick_values(1.0, 1.0000000000000002).to_array(),
    [
      0.95, 0.96, 0.97, 0.9800000000000001, 0.9900000000000001, 1.0, 1.0100000000000002,
      1.0200000000000002, 1.0300000000000002, 1.0400000000000003, 1.0500000000000003,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(1.0, 1.0000000000000002), [
    0.999, 1.0010000000000001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_linear_reference_limits(locator.view_limits(1.0, 1.0000000000000002), [
    0.999, 1.0010000000000001,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(1.0, 1.0000000000000002), [
    0.999, 1.0010000000000001,
  ])
  verify_linear_reference_limits(locator.nonsingular(1.0, 1.0000000000000002), [
    0.95, 1.0500000000000003,
  ])
}

///|
test "LinearLocator original 149 count 11" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=11)
  assert_eq(locator.numticks(), 11)
  assert_eq(locator.configured_numticks(), Some(11))
  verify_linear_reference_values(
    locator.tick_values(1.0e-280, 1.0000000000000001e-280).to_array(),
    [
      9.499999999999999e-281, 9.599999999999999e-281, 9.7e-281, 9.8e-281, 9.9e-281,
      1.0e-280, 1.0100000000000001e-280, 1.02e-280, 1.03e-280, 1.0400000000000001e-280,
      1.0500000000000001e-280,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(1.0e-280, 1.0000000000000001e-280),
    [9.99e-281, 1.001e-280],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_linear_reference_limits(
    locator.view_limits(1.0e-280, 1.0000000000000001e-280),
    [9.99e-281, 1.0010000000000002e-280],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(1.0e-280, 1.0000000000000001e-280),
    [9.99e-281, 1.001e-280],
  )
  verify_linear_reference_limits(
    locator.nonsingular(1.0e-280, 1.0000000000000001e-280),
    [9.499999999999999e-281, 1.0500000000000001e-280],
  )
}

///|
test "LinearLocator original 150 count 11" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=11)
  assert_eq(locator.numticks(), 11)
  assert_eq(locator.configured_numticks(), Some(11))
  verify_linear_reference_values(
    locator.tick_values(5.0e-324, -5.0e-324).to_array(),
    [
      -0.05, -0.04, -0.030000000000000002, -0.020000000000000004, -0.010000000000000002,
      0.0, 0.009999999999999995, 0.020000000000000004, 0.03, 0.039999999999999994,
      0.05,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(5.0e-324, -5.0e-324), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(5.0e-324, -5.0e-324))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(5.0e-324, -5.0e-324), [
    -0.001, 0.001,
  ])
  verify_linear_reference_limits(locator.nonsingular(5.0e-324, -5.0e-324), [
    -0.05, 0.05,
  ])
}

///|
test "LinearLocator original 151 count 11" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=11)
  assert_eq(locator.numticks(), 11)
  assert_eq(locator.configured_numticks(), Some(11))
  verify_linear_reference_values(
    locator.tick_values(1.0e-288, 2.0e-288).to_array(),
    [
      -0.05, -0.04, -0.030000000000000002, -0.020000000000000004, -0.010000000000000002,
      0.0, 0.009999999999999995, 0.020000000000000004, 0.03, 0.039999999999999994,
      0.05,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(1.0e-288, 2.0e-288), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_linear_reference_limits(locator.view_limits(1.0e-288, 2.0e-288), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(1.0e-288, 2.0e-288), [
    -0.001, 0.001,
  ])
  verify_linear_reference_limits(locator.nonsingular(1.0e-288, 2.0e-288), [
    -0.05, 0.05,
  ])
}

///|
test "LinearLocator original 152 count 11" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=11)
  assert_eq(locator.numticks(), 11)
  assert_eq(locator.configured_numticks(), Some(11))
  verify_linear_reference_values(
    locator
    .tick_values(1.7976931348623157e+308, 1.7976931348623157e+308)
    .to_array(),
    [
      0.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(1.7976931348623157e+308, 1.7976931348623157e+308),
    [1.7958954417274534e+308, 1.0 / 0.0],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(
        locator.view_limits(1.7976931348623157e+308, 1.7976931348623157e+308),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(1.7976931348623157e+308, 1.7976931348623157e+308),
    [1.7958954417274534e+308, 1.0 / 0.0],
  )
  verify_linear_reference_limits(
    locator.nonsingular(1.7976931348623157e+308, 1.7976931348623157e+308),
    [1.7078084781191998e+308, 1.0 / 0.0],
  )
}

///|
test "LinearLocator original 153 count 11" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=11)
  assert_eq(locator.numticks(), 11)
  assert_eq(locator.configured_numticks(), Some(11))
  verify_linear_reference_values(
    locator
    .tick_values(-1.7976931348623157e+308, 1.7976931348623157e+308)
    .to_array(),
    [
      0.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
      1.7976931348623157e+308,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(-1.7976931348623157e+308, 1.7976931348623157e+308),
    [-1.7976931348623157e+308, 1.7976931348623157e+308],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(
        locator.view_limits(-1.7976931348623157e+308, 1.7976931348623157e+308),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(-1.7976931348623157e+308, 1.7976931348623157e+308),
    [-1.7976931348623157e+308, 1.7976931348623157e+308],
  )
  verify_linear_reference_limits(
    locator.nonsingular(-1.7976931348623157e+308, 1.7976931348623157e+308),
    [-1.7976931348623157e+308, 1.7976931348623157e+308],
  )
}

///|
test "LinearLocator original 154 count 11" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=11)
  assert_eq(locator.numticks(), 11)
  assert_eq(locator.configured_numticks(), Some(11))
  verify_linear_reference_values(
    locator
    .tick_values(-1.7976931348623157e+308, -1.7976931348623157e+308)
    .to_array(),
    [
      0.0 / 0.0,
      0.0 / 0.0,
      0.0 / 0.0,
      0.0 / 0.0,
      0.0 / 0.0,
      0.0 / 0.0,
      0.0 / 0.0,
      0.0 / 0.0,
      0.0 / 0.0,
      0.0 / 0.0,
      -1.7078084781191998e+308,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(-1.7976931348623157e+308, -1.7976931348623157e+308),
    [-1.0 / 0.0, -1.7958954417274534e+308],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(
        locator.view_limits(-1.7976931348623157e+308, -1.7976931348623157e+308),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(-1.7976931348623157e+308, -1.7976931348623157e+308),
    [-1.0 / 0.0, -1.7958954417274534e+308],
  )
  verify_linear_reference_limits(
    locator.nonsingular(-1.7976931348623157e+308, -1.7976931348623157e+308),
    [-1.0 / 0.0, -1.7078084781191998e+308],
  )
}

///|
test "LinearLocator original 155 count 11" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=11)
  assert_eq(locator.numticks(), 11)
  assert_eq(locator.configured_numticks(), Some(11))
  verify_linear_reference_values(
    locator.tick_values(1.0e+100, 1.0000000000000002e+100).to_array(),
    [
      9.500000000000001e+99, 9.6e+99, 9.700000000000002e+99, 9.800000000000001e+99,
      9.900000000000003e+99, 1.0000000000000002e+100, 1.0100000000000002e+100, 1.0200000000000003e+100,
      1.0300000000000002e+100, 1.0400000000000004e+100, 1.0500000000000003e+100,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(1.0e+100, 1.0000000000000002e+100),
    [9.99e+99, 1.0010000000000002e+100],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_linear_reference_limits(
    locator.view_limits(1.0e+100, 1.0000000000000002e+100),
    [9.99e+99, 1.0010000000000002e+100],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(1.0e+100, 1.0000000000000002e+100),
    [9.99e+99, 1.0010000000000002e+100],
  )
  verify_linear_reference_limits(
    locator.nonsingular(1.0e+100, 1.0000000000000002e+100),
    [9.500000000000001e+99, 1.0500000000000003e+100],
  )
}

///|
test "LinearLocator original 156 count 11" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=11)
  assert_eq(locator.numticks(), 11)
  assert_eq(locator.configured_numticks(), Some(11))
  verify_linear_reference_values(
    locator.tick_values(0.0 / 0.0, 0.0).to_array(),
    [
      -0.05, -0.04, -0.030000000000000002, -0.020000000000000004, -0.010000000000000002,
      0.0, 0.009999999999999995, 0.020000000000000004, 0.03, 0.039999999999999994,
      0.05,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0 / 0.0, 0.0), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(0.0 / 0.0, 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0 / 0.0, 0.0), [
    -0.001, 0.001,
  ])
  verify_linear_reference_limits(locator.nonsingular(0.0 / 0.0, 0.0), [
    -0.05, 0.05,
  ])
}

///|
test "LinearLocator original 157 count 11" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=11)
  assert_eq(locator.numticks(), 11)
  assert_eq(locator.configured_numticks(), Some(11))
  verify_linear_reference_values(
    locator.tick_values(0.0, 1.0 / 0.0).to_array(),
    [
      -0.05, -0.04, -0.030000000000000002, -0.020000000000000004, -0.010000000000000002,
      0.0, 0.009999999999999995, 0.020000000000000004, 0.03, 0.039999999999999994,
      0.05,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0, 1.0 / 0.0), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0, 1.0 / 0.0), [
    -0.001, 0.001,
  ])
  verify_linear_reference_limits(locator.nonsingular(0.0, 1.0 / 0.0), [
    -0.05, 0.05,
  ])
}

///|
test "LinearLocator original 158 count 11" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=11)
  assert_eq(locator.numticks(), 11)
  assert_eq(locator.configured_numticks(), Some(11))
  verify_linear_reference_values(
    locator.tick_values(-1.0 / 0.0, 1.0 / 0.0).to_array(),
    [
      -0.05, -0.04, -0.030000000000000002, -0.020000000000000004, -0.010000000000000002,
      0.0, 0.009999999999999995, 0.020000000000000004, 0.03, 0.039999999999999994,
      0.05,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(-1.0 / 0.0, 1.0 / 0.0), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(-1.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(-1.0 / 0.0, 1.0 / 0.0), [
    -0.001, 0.001,
  ])
  verify_linear_reference_limits(locator.nonsingular(-1.0 / 0.0, 1.0 / 0.0), [
    -0.05, 0.05,
  ])
}

///|
test "LinearLocator original 159 count 11" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=11)
  assert_eq(locator.numticks(), 11)
  assert_eq(locator.configured_numticks(), Some(11))
  verify_linear_reference_values(
    locator.tick_values(0.0 / 0.0, 0.0 / 0.0).to_array(),
    [
      -0.05, -0.04, -0.030000000000000002, -0.020000000000000004, -0.010000000000000002,
      0.0, 0.009999999999999995, 0.020000000000000004, 0.03, 0.039999999999999994,
      0.05,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0 / 0.0, 0.0 / 0.0), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(0.0 / 0.0, 0.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0 / 0.0, 0.0 / 0.0), [
    -0.001, 0.001,
  ])
  verify_linear_reference_limits(locator.nonsingular(0.0 / 0.0, 0.0 / 0.0), [
    -0.05, 0.05,
  ])
}

///|
test "LinearLocator original 160 count 17" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=17)
  assert_eq(locator.numticks(), 17)
  assert_eq(locator.configured_numticks(), Some(17))
  verify_linear_reference_values(locator.tick_values(-1.0, 1.0).to_array(), [
    -1.0, -0.875, -0.75, -0.625, -0.5, -0.375, -0.25, -0.125, 0.0, 0.125, 0.25, 0.375,
    0.5, 0.625, 0.75, 0.875, 1.0,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(-1.0, 1.0), [-1.0, 1.0])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_linear_reference_limits(locator.view_limits(-1.0, 1.0), [-1.0, 1.0])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(-1.0, 1.0), [-1.0, 1.0])
  verify_linear_reference_limits(locator.nonsingular(-1.0, 1.0), [-1.0, 1.0])
}

///|
test "LinearLocator original 161 count 17" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=17)
  assert_eq(locator.numticks(), 17)
  assert_eq(locator.configured_numticks(), Some(17))
  verify_linear_reference_values(locator.tick_values(1.0, -1.0).to_array(), [
    -1.0, -0.875, -0.75, -0.625, -0.5, -0.375, -0.25, -0.125, 0.0, 0.125, 0.25, 0.375,
    0.5, 0.625, 0.75, 0.875, 1.0,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(1.0, -1.0), [-1.0, 1.0])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_linear_reference_limits(locator.view_limits(1.0, -1.0), [-1.0, 1.0])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(1.0, -1.0), [-1.0, 1.0])
  verify_linear_reference_limits(locator.nonsingular(1.0, -1.0), [-1.0, 1.0])
}

///|
test "LinearLocator original 162 count 17" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=17)
  assert_eq(locator.numticks(), 17)
  assert_eq(locator.configured_numticks(), Some(17))
  verify_linear_reference_values(locator.tick_values(0.0, 0.0).to_array(), [
    -0.05, -0.043750000000000004, -0.037500000000000006, -0.03125, -0.025, -0.018750000000000003,
    -0.012499999999999997, -0.006249999999999999, 0.0, 0.006249999999999999, 0.012499999999999997,
    0.018750000000000003, 0.02500000000000001, 0.03125, 0.037500000000000006, 0.04375,
    0.05,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0, 0.0), [-1.0, 1.0])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_linear_reference_limits(locator.view_limits(0.0, 0.0), [-1.0, 1.0])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0, 0.0), [-1.0, 1.0])
  verify_linear_reference_limits(locator.nonsingular(0.0, 0.0), [-0.05, 0.05])
}

///|
test "LinearLocator original 163 count 17" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=17)
  assert_eq(locator.numticks(), 17)
  assert_eq(locator.configured_numticks(), Some(17))
  verify_linear_reference_values(locator.tick_values(-0.0, -0.0).to_array(), [
    -0.05, -0.043750000000000004, -0.037500000000000006, -0.03125, -0.025, -0.018750000000000003,
    -0.012499999999999997, -0.006249999999999999, 0.0, 0.006249999999999999, 0.012499999999999997,
    0.018750000000000003, 0.02500000000000001, 0.03125, 0.037500000000000006, 0.04375,
    0.05,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(-0.0, -0.0), [-1.0, 1.0])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_linear_reference_limits(locator.view_limits(-0.0, -0.0), [-1.0, 1.0])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(-0.0, -0.0), [-1.0, 1.0])
  verify_linear_reference_limits(locator.nonsingular(-0.0, -0.0), [-0.05, 0.05])
}

///|
test "LinearLocator original 164 count 17" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=17)
  assert_eq(locator.numticks(), 17)
  assert_eq(locator.configured_numticks(), Some(17))
  verify_linear_reference_values(locator.tick_values(2.0, 2.0).to_array(), [
    1.9, 1.9124999999999999, 1.9249999999999998, 1.9375, 1.95, 1.9625, 1.975, 1.9875,
    2.0, 2.0125, 2.025, 2.0375, 2.05, 2.0625, 2.075, 2.0875, 2.1,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(2.0, 2.0), [1.0, 3.0])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_linear_reference_limits(locator.view_limits(2.0, 2.0), [1.0, 3.0])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(2.0, 2.0), [1.0, 3.0])
  verify_linear_reference_limits(locator.nonsingular(2.0, 2.0), [1.9, 2.1])
}

///|
test "LinearLocator original 165 count 17" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=17)
  assert_eq(locator.numticks(), 17)
  assert_eq(locator.configured_numticks(), Some(17))
  verify_linear_reference_values(locator.tick_values(-2.0, -2.0).to_array(), [
    -2.1, -2.0875, -2.075, -2.0625, -2.05, -2.0375, -2.025, -2.0125, -2.0, -1.9875,
    -1.975, -1.9625, -1.95, -1.9375, -1.9249999999999998, -1.9124999999999999, -1.9,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(-2.0, -2.0), [-3.0, -1.0])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_linear_reference_limits(locator.view_limits(-2.0, -2.0), [-3.0, -1.0])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(-2.0, -2.0), [-3.0, -1.0])
  verify_linear_reference_limits(locator.nonsingular(-2.0, -2.0), [-2.1, -1.9])
}

///|
test "LinearLocator original 166 count 17" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=17)
  assert_eq(locator.numticks(), 17)
  assert_eq(locator.configured_numticks(), Some(17))
  verify_linear_reference_values(locator.tick_values(0.1, 0.9).to_array(), [
    0.1, 0.15000000000000002, 0.2, 0.25, 0.30000000000000004, 0.35, 0.4, 0.45000000000000007,
    0.5, 0.55, 0.6, 0.65, 0.7000000000000001, 0.75, 0.8, 0.85, 0.9,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.1, 0.9), [0.1, 0.9])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_linear_reference_limits(locator.view_limits(0.1, 0.9), [0.0625, 0.9375])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.1, 0.9), [0.1, 0.9])
  verify_linear_reference_limits(locator.nonsingular(0.1, 0.9), [0.1, 0.9])
}

///|
test "LinearLocator original 167 count 17" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=17)
  assert_eq(locator.numticks(), 17)
  assert_eq(locator.configured_numticks(), Some(17))
  verify_linear_reference_values(
    locator.tick_values(12.0, 12.0000001).to_array(),
    [
      12.0, 12.00000000625, 12.0000000125, 12.00000001875, 12.000000025, 12.00000003125,
      12.0000000375, 12.00000004375, 12.00000005, 12.00000005625, 12.0000000625,
      12.00000006875, 12.000000074999999, 12.000000081249999, 12.0000000875, 12.00000009375,
      12.0000001,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(12.0, 12.0000001), [
    12.0, 12.0000001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_linear_reference_limits(locator.view_limits(12.0, 12.0000001), [
    12.0, 12.000000100582838,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(12.0, 12.0000001), [
    12.0, 12.0000001,
  ])
  verify_linear_reference_limits(locator.nonsingular(12.0, 12.0000001), [
    12.0, 12.0000001,
  ])
}

///|
test "LinearLocator original 168 count 17" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=17)
  assert_eq(locator.numticks(), 17)
  assert_eq(locator.configured_numticks(), Some(17))
  verify_linear_reference_values(
    locator.tick_values(1.0, 1.0000000000000002).to_array(),
    [
      0.95, 0.9562499999999999, 0.9625, 0.96875, 0.9750000000000001, 0.9812500000000001,
      0.9875, 0.9937500000000001, 1.0, 1.00625, 1.0125000000000002, 1.0187500000000003,
      1.0250000000000001, 1.0312500000000002, 1.0375000000000003, 1.0437500000000002,
      1.0500000000000003,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(1.0, 1.0000000000000002), [
    0.999, 1.0010000000000001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_linear_reference_limits(locator.view_limits(1.0, 1.0000000000000002), [
    0.999, 1.0010000000000001,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(1.0, 1.0000000000000002), [
    0.999, 1.0010000000000001,
  ])
  verify_linear_reference_limits(locator.nonsingular(1.0, 1.0000000000000002), [
    0.95, 1.0500000000000003,
  ])
}

///|
test "LinearLocator original 169 count 17" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=17)
  assert_eq(locator.numticks(), 17)
  assert_eq(locator.configured_numticks(), Some(17))
  verify_linear_reference_values(
    locator.tick_values(1.0e-280, 1.0000000000000001e-280).to_array(),
    [
      9.499999999999999e-281, 9.562499999999999e-281, 9.625e-281, 9.6875e-281, 9.75e-281,
      9.8125e-281, 9.875e-281, 9.9375e-281, 1.0e-280, 1.00625e-280, 1.0125e-280,
      1.01875e-280, 1.025e-280, 1.0312500000000001e-280, 1.0375000000000001e-280,
      1.0437500000000001e-280, 1.0500000000000001e-280,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(1.0e-280, 1.0000000000000001e-280),
    [9.99e-281, 1.001e-280],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_linear_reference_limits(
    locator.view_limits(1.0e-280, 1.0000000000000001e-280),
    [9.99e-281, 1.001e-280],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(1.0e-280, 1.0000000000000001e-280),
    [9.99e-281, 1.001e-280],
  )
  verify_linear_reference_limits(
    locator.nonsingular(1.0e-280, 1.0000000000000001e-280),
    [9.499999999999999e-281, 1.0500000000000001e-280],
  )
}

///|
test "LinearLocator original 170 count 17" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=17)
  assert_eq(locator.numticks(), 17)
  assert_eq(locator.configured_numticks(), Some(17))
  verify_linear_reference_values(
    locator.tick_values(5.0e-324, -5.0e-324).to_array(),
    [
      -0.05, -0.043750000000000004, -0.037500000000000006, -0.03125, -0.025, -0.018750000000000003,
      -0.012499999999999997, -0.006249999999999999, 0.0, 0.006249999999999999, 0.012499999999999997,
      0.018750000000000003, 0.02500000000000001, 0.03125, 0.037500000000000006, 0.04375,
      0.05,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(5.0e-324, -5.0e-324), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(5.0e-324, -5.0e-324))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(5.0e-324, -5.0e-324), [
    -0.001, 0.001,
  ])
  verify_linear_reference_limits(locator.nonsingular(5.0e-324, -5.0e-324), [
    -0.05, 0.05,
  ])
}

///|
test "LinearLocator original 171 count 17" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=17)
  assert_eq(locator.numticks(), 17)
  assert_eq(locator.configured_numticks(), Some(17))
  verify_linear_reference_values(
    locator.tick_values(1.0e-288, 2.0e-288).to_array(),
    [
      -0.05, -0.043750000000000004, -0.037500000000000006, -0.03125, -0.025, -0.018750000000000003,
      -0.012499999999999997, -0.006249999999999999, 0.0, 0.006249999999999999, 0.012499999999999997,
      0.018750000000000003, 0.02500000000000001, 0.03125, 0.037500000000000006, 0.04375,
      0.05,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(1.0e-288, 2.0e-288), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_linear_reference_limits(locator.view_limits(1.0e-288, 2.0e-288), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(1.0e-288, 2.0e-288), [
    -0.001, 0.001,
  ])
  verify_linear_reference_limits(locator.nonsingular(1.0e-288, 2.0e-288), [
    -0.05, 0.05,
  ])
}

///|
test "LinearLocator original 172 count 17" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=17)
  assert_eq(locator.numticks(), 17)
  assert_eq(locator.configured_numticks(), Some(17))
  verify_linear_reference_values(
    locator
    .tick_values(1.7976931348623157e+308, 1.7976931348623157e+308)
    .to_array(),
    [
      0.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(1.7976931348623157e+308, 1.7976931348623157e+308),
    [1.7958954417274534e+308, 1.0 / 0.0],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(
        locator.view_limits(1.7976931348623157e+308, 1.7976931348623157e+308),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(1.7976931348623157e+308, 1.7976931348623157e+308),
    [1.7958954417274534e+308, 1.0 / 0.0],
  )
  verify_linear_reference_limits(
    locator.nonsingular(1.7976931348623157e+308, 1.7976931348623157e+308),
    [1.7078084781191998e+308, 1.0 / 0.0],
  )
}

///|
test "LinearLocator original 173 count 17" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=17)
  assert_eq(locator.numticks(), 17)
  assert_eq(locator.configured_numticks(), Some(17))
  verify_linear_reference_values(
    locator
    .tick_values(-1.7976931348623157e+308, 1.7976931348623157e+308)
    .to_array(),
    [
      0.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
      1.7976931348623157e+308,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(-1.7976931348623157e+308, 1.7976931348623157e+308),
    [-1.7976931348623157e+308, 1.7976931348623157e+308],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(
        locator.view_limits(-1.7976931348623157e+308, 1.7976931348623157e+308),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(-1.7976931348623157e+308, 1.7976931348623157e+308),
    [-1.7976931348623157e+308, 1.7976931348623157e+308],
  )
  verify_linear_reference_limits(
    locator.nonsingular(-1.7976931348623157e+308, 1.7976931348623157e+308),
    [-1.7976931348623157e+308, 1.7976931348623157e+308],
  )
}

///|
test "LinearLocator original 174 count 17" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=17)
  assert_eq(locator.numticks(), 17)
  assert_eq(locator.configured_numticks(), Some(17))
  verify_linear_reference_values(
    locator
    .tick_values(-1.7976931348623157e+308, -1.7976931348623157e+308)
    .to_array(),
    [
      0.0 / 0.0,
      0.0 / 0.0,
      0.0 / 0.0,
      0.0 / 0.0,
      0.0 / 0.0,
      0.0 / 0.0,
      0.0 / 0.0,
      0.0 / 0.0,
      0.0 / 0.0,
      0.0 / 0.0,
      0.0 / 0.0,
      0.0 / 0.0,
      0.0 / 0.0,
      0.0 / 0.0,
      0.0 / 0.0,
      0.0 / 0.0,
      -1.7078084781191998e+308,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(-1.7976931348623157e+308, -1.7976931348623157e+308),
    [-1.0 / 0.0, -1.7958954417274534e+308],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(
        locator.view_limits(-1.7976931348623157e+308, -1.7976931348623157e+308),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(-1.7976931348623157e+308, -1.7976931348623157e+308),
    [-1.0 / 0.0, -1.7958954417274534e+308],
  )
  verify_linear_reference_limits(
    locator.nonsingular(-1.7976931348623157e+308, -1.7976931348623157e+308),
    [-1.0 / 0.0, -1.7078084781191998e+308],
  )
}

///|
test "LinearLocator original 175 count 17" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=17)
  assert_eq(locator.numticks(), 17)
  assert_eq(locator.configured_numticks(), Some(17))
  verify_linear_reference_values(
    locator.tick_values(1.0e+100, 1.0000000000000002e+100).to_array(),
    [
      9.500000000000001e+99, 9.5625e+99, 9.625e+99, 9.687500000000002e+99, 9.750000000000002e+99,
      9.812500000000001e+99, 9.875000000000003e+99, 9.937500000000002e+99, 1.0000000000000002e+100,
      1.0062500000000002e+100, 1.0125000000000001e+100, 1.0187500000000003e+100,
      1.0250000000000003e+100, 1.0312500000000002e+100, 1.0375000000000004e+100,
      1.0437500000000004e+100, 1.0500000000000003e+100,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(1.0e+100, 1.0000000000000002e+100),
    [9.99e+99, 1.0010000000000002e+100],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_linear_reference_limits(
    locator.view_limits(1.0e+100, 1.0000000000000002e+100),
    [9.99e+99, 1.0010000000000002e+100],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(1.0e+100, 1.0000000000000002e+100),
    [9.99e+99, 1.0010000000000002e+100],
  )
  verify_linear_reference_limits(
    locator.nonsingular(1.0e+100, 1.0000000000000002e+100),
    [9.500000000000001e+99, 1.0500000000000003e+100],
  )
}

///|
test "LinearLocator original 176 count 17" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=17)
  assert_eq(locator.numticks(), 17)
  assert_eq(locator.configured_numticks(), Some(17))
  verify_linear_reference_values(
    locator.tick_values(0.0 / 0.0, 0.0).to_array(),
    [
      -0.05, -0.043750000000000004, -0.037500000000000006, -0.03125, -0.025, -0.018750000000000003,
      -0.012499999999999997, -0.006249999999999999, 0.0, 0.006249999999999999, 0.012499999999999997,
      0.018750000000000003, 0.02500000000000001, 0.03125, 0.037500000000000006, 0.04375,
      0.05,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0 / 0.0, 0.0), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(0.0 / 0.0, 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0 / 0.0, 0.0), [
    -0.001, 0.001,
  ])
  verify_linear_reference_limits(locator.nonsingular(0.0 / 0.0, 0.0), [
    -0.05, 0.05,
  ])
}

///|
test "LinearLocator original 177 count 17" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=17)
  assert_eq(locator.numticks(), 17)
  assert_eq(locator.configured_numticks(), Some(17))
  verify_linear_reference_values(
    locator.tick_values(0.0, 1.0 / 0.0).to_array(),
    [
      -0.05, -0.043750000000000004, -0.037500000000000006, -0.03125, -0.025, -0.018750000000000003,
      -0.012499999999999997, -0.006249999999999999, 0.0, 0.006249999999999999, 0.012499999999999997,
      0.018750000000000003, 0.02500000000000001, 0.03125, 0.037500000000000006, 0.04375,
      0.05,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0, 1.0 / 0.0), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0, 1.0 / 0.0), [
    -0.001, 0.001,
  ])
  verify_linear_reference_limits(locator.nonsingular(0.0, 1.0 / 0.0), [
    -0.05, 0.05,
  ])
}

///|
test "LinearLocator original 178 count 17" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=17)
  assert_eq(locator.numticks(), 17)
  assert_eq(locator.configured_numticks(), Some(17))
  verify_linear_reference_values(
    locator.tick_values(-1.0 / 0.0, 1.0 / 0.0).to_array(),
    [
      -0.05, -0.043750000000000004, -0.037500000000000006, -0.03125, -0.025, -0.018750000000000003,
      -0.012499999999999997, -0.006249999999999999, 0.0, 0.006249999999999999, 0.012499999999999997,
      0.018750000000000003, 0.02500000000000001, 0.03125, 0.037500000000000006, 0.04375,
      0.05,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(-1.0 / 0.0, 1.0 / 0.0), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(-1.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(-1.0 / 0.0, 1.0 / 0.0), [
    -0.001, 0.001,
  ])
  verify_linear_reference_limits(locator.nonsingular(-1.0 / 0.0, 1.0 / 0.0), [
    -0.05, 0.05,
  ])
}

///|
test "LinearLocator original 179 count 17" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=17)
  assert_eq(locator.numticks(), 17)
  assert_eq(locator.configured_numticks(), Some(17))
  verify_linear_reference_values(
    locator.tick_values(0.0 / 0.0, 0.0 / 0.0).to_array(),
    [
      -0.05, -0.043750000000000004, -0.037500000000000006, -0.03125, -0.025, -0.018750000000000003,
      -0.012499999999999997, -0.006249999999999999, 0.0, 0.006249999999999999, 0.012499999999999997,
      0.018750000000000003, 0.02500000000000001, 0.03125, 0.037500000000000006, 0.04375,
      0.05,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0 / 0.0, 0.0 / 0.0), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(0.0 / 0.0, 0.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0 / 0.0, 0.0 / 0.0), [
    -0.001, 0.001,
  ])
  verify_linear_reference_limits(locator.nonsingular(0.0 / 0.0, 0.0 / 0.0), [
    -0.05, 0.05,
  ])
}

///|
test "LinearLocator original 180 count -2147483648" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=-2147483648)
  assert_eq(locator.numticks(), -2147483648)
  assert_eq(locator.configured_numticks(), Some(-2147483648))
  assert_true(
    try {
      ignore(locator.tick_values(-1.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(-1.0, 1.0), [-1.0, 1.0])
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(locator.view_limits(-1.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(-1.0, 1.0), [-1.0, 1.0])
  verify_linear_reference_limits(locator.nonsingular(-1.0, 1.0), [-1.0, 1.0])
}

///|
test "LinearLocator original 181 count 100001" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=100001)
  assert_eq(locator.numticks(), 100001)
  assert_eq(locator.configured_numticks(), Some(100001))
  let values = locator.tick_values(0.0, 1.0)
  assert_eq(values.length(), 100000)
  verify_linear_reference_values(
    [
      values.get(0),
      values.get(1),
      values.get(2),
      values.get(3),
      values.get(4),
      values.get(5),
      values.get(6),
      values.get(7),
      values.get(99998),
      values.get(99999),
    ],
    [
      0.0, 1.0e-05, 2.0e-05, 3.0000000000000004e-05, 4.0e-05, 5.0e-05, 6.000000000000001e-05,
      7.000000000000001e-05, 0.9999800000000001, 0.99999,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0, 1.0), [0.0, 1.0])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_linear_reference_limits(locator.view_limits(0.0, 1.0), [0.0, 1.0])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0, 1.0), [0.0, 1.0])
  verify_linear_reference_limits(locator.nonsingular(0.0, 1.0), [0.0, 1.0])
}

///|
test "LinearLocator original 182 count 2147483647" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=2147483647)
  assert_eq(locator.numticks(), 2147483647)
  assert_eq(locator.configured_numticks(), Some(2147483647))
  let values = locator.tick_values(0.0, 1.0)
  assert_eq(values.length(), 100000)
  verify_linear_reference_values(
    [
      values.get(0),
      values.get(1),
      values.get(2),
      values.get(3),
      values.get(4),
      values.get(5),
      values.get(6),
      values.get(7),
      values.get(99998),
      values.get(99999),
    ],
    [
      0.0, 4.656612877414201e-10, 9.313225754828403e-10, 1.3969838632242604e-09,
      1.8626451509656805e-09, 2.3283064387071006e-09, 2.7939677264485208e-09, 3.259629014189941e-09,
      4.656519745156653e-05, 4.656566311285427e-05,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0, 1.0), [0.0, 1.0])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_linear_reference_limits(locator.view_limits(0.0, 1.0), [0.0, 1.0])
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(locator.view_limits(0.0, 1.0), [0.0, 1.0])
  verify_linear_reference_limits(locator.nonsingular(0.0, 1.0), [0.0, 1.0])
}

///|
test "LinearLocator original 183 count 2147483647" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.LinearLocator::new(numticks=2147483647)
  assert_eq(locator.numticks(), 2147483647)
  assert_eq(locator.configured_numticks(), Some(2147483647))
  let values = locator.tick_values(
    -1.7976931348623157e+308, 1.7976931348623157e+308,
  )
  assert_eq(values.length(), 100000)
  verify_linear_reference_values(
    [
      values.get(0),
      values.get(1),
      values.get(2),
      values.get(3),
      values.get(4),
      values.get(5),
      values.get(6),
      values.get(7),
      values.get(99998),
      values.get(99999),
    ],
    [
      0.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
      1.0 / 0.0,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(-1.7976931348623157e+308, 1.7976931348623157e+308),
    [-1.7976931348623157e+308, 1.7976931348623157e+308],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(
        locator.view_limits(-1.7976931348623157e+308, 1.7976931348623157e+308),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_linear_reference_limits(
    locator.view_limits(-1.7976931348623157e+308, 1.7976931348623157e+308),
    [-1.7976931348623157e+308, 1.7976931348623157e+308],
  )
  verify_linear_reference_limits(
    locator.nonsingular(-1.7976931348623157e+308, 1.7976931348623157e+308),
    [-1.7976931348623157e+308, 1.7976931348623157e+308],
  )
}

///|
test "LinearLocator preset precedence count None bounds (0.0, 0.0)" {
  let presets = @ticker.LinearLocatorPresets::new()
  presets.set(-0.05, 0.05, [3.0, 2.0, 1.0])
  presets.set(1.9, 2.1, [8.0, 8.0, -1.0])
  presets.set(1.0, 3.0, [1.0 / 0.0, 0.0 / 0.0, -1.0 / 0.0])
  presets.set(2.0, 1.0, [99.0])
  let locator = @ticker.LinearLocator::new(presets~)
  verify_linear_reference_values(locator.tick_values(0.0, 0.0).to_array(), [
    3.0, 2.0, 1.0,
  ])
}

///|
test "LinearLocator preset precedence count None bounds (2.0, 2.0)" {
  let presets = @ticker.LinearLocatorPresets::new()
  presets.set(-0.05, 0.05, [3.0, 2.0, 1.0])
  presets.set(1.9, 2.1, [8.0, 8.0, -1.0])
  presets.set(1.0, 3.0, [1.0 / 0.0, 0.0 / 0.0, -1.0 / 0.0])
  presets.set(2.0, 1.0, [99.0])
  let locator = @ticker.LinearLocator::new(presets~)
  verify_linear_reference_values(locator.tick_values(2.0, 2.0).to_array(), [
    8.0, 8.0, -1.0,
  ])
}

///|
test "LinearLocator preset precedence count None bounds (3.0, 1.0)" {
  let presets = @ticker.LinearLocatorPresets::new()
  presets.set(-0.05, 0.05, [3.0, 2.0, 1.0])
  presets.set(1.9, 2.1, [8.0, 8.0, -1.0])
  presets.set(1.0, 3.0, [1.0 / 0.0, 0.0 / 0.0, -1.0 / 0.0])
  presets.set(2.0, 1.0, [99.0])
  let locator = @ticker.LinearLocator::new(presets~)
  verify_linear_reference_values(locator.tick_values(3.0, 1.0).to_array(), [
    1.0 / 0.0,
    0.0 / 0.0,
    -1.0 / 0.0,
  ])
}

///|
test "LinearLocator preset precedence count None bounds (nan, inf)" {
  let presets = @ticker.LinearLocatorPresets::new()
  presets.set(-0.05, 0.05, [3.0, 2.0, 1.0])
  presets.set(1.9, 2.1, [8.0, 8.0, -1.0])
  presets.set(1.0, 3.0, [1.0 / 0.0, 0.0 / 0.0, -1.0 / 0.0])
  presets.set(2.0, 1.0, [99.0])
  let locator = @ticker.LinearLocator::new(presets~)
  verify_linear_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [3.0, 2.0, 1.0],
  )
}

///|
test "LinearLocator preset precedence count None bounds (1.0, 2.0)" {
  let presets = @ticker.LinearLocatorPresets::new()
  presets.set(-0.05, 0.05, [3.0, 2.0, 1.0])
  presets.set(1.9, 2.1, [8.0, 8.0, -1.0])
  presets.set(1.0, 3.0, [1.0 / 0.0, 0.0 / 0.0, -1.0 / 0.0])
  presets.set(2.0, 1.0, [99.0])
  let locator = @ticker.LinearLocator::new(presets~)
  verify_linear_reference_values(locator.tick_values(1.0, 2.0).to_array(), [
    1.0, 1.1, 1.2, 1.3, 1.4, 1.5, 1.6, 1.7000000000000002, 1.8, 1.9, 2.0,
  ])
}

///|
test "LinearLocator preset precedence count -1 bounds (0.0, 0.0)" {
  let presets = @ticker.LinearLocatorPresets::new()
  presets.set(-0.05, 0.05, [3.0, 2.0, 1.0])
  presets.set(1.9, 2.1, [8.0, 8.0, -1.0])
  presets.set(1.0, 3.0, [1.0 / 0.0, 0.0 / 0.0, -1.0 / 0.0])
  presets.set(2.0, 1.0, [99.0])
  let locator = @ticker.LinearLocator::new(presets~, numticks=-1)
  verify_linear_reference_values(locator.tick_values(0.0, 0.0).to_array(), [
    3.0, 2.0, 1.0,
  ])
}

///|
test "LinearLocator preset precedence count -1 bounds (2.0, 2.0)" {
  let presets = @ticker.LinearLocatorPresets::new()
  presets.set(-0.05, 0.05, [3.0, 2.0, 1.0])
  presets.set(1.9, 2.1, [8.0, 8.0, -1.0])
  presets.set(1.0, 3.0, [1.0 / 0.0, 0.0 / 0.0, -1.0 / 0.0])
  presets.set(2.0, 1.0, [99.0])
  let locator = @ticker.LinearLocator::new(presets~, numticks=-1)
  verify_linear_reference_values(locator.tick_values(2.0, 2.0).to_array(), [
    8.0, 8.0, -1.0,
  ])
}

///|
test "LinearLocator preset precedence count -1 bounds (3.0, 1.0)" {
  let presets = @ticker.LinearLocatorPresets::new()
  presets.set(-0.05, 0.05, [3.0, 2.0, 1.0])
  presets.set(1.9, 2.1, [8.0, 8.0, -1.0])
  presets.set(1.0, 3.0, [1.0 / 0.0, 0.0 / 0.0, -1.0 / 0.0])
  presets.set(2.0, 1.0, [99.0])
  let locator = @ticker.LinearLocator::new(presets~, numticks=-1)
  verify_linear_reference_values(locator.tick_values(3.0, 1.0).to_array(), [
    1.0 / 0.0,
    0.0 / 0.0,
    -1.0 / 0.0,
  ])
}

///|
test "LinearLocator preset precedence count -1 bounds (nan, inf)" {
  let presets = @ticker.LinearLocatorPresets::new()
  presets.set(-0.05, 0.05, [3.0, 2.0, 1.0])
  presets.set(1.9, 2.1, [8.0, 8.0, -1.0])
  presets.set(1.0, 3.0, [1.0 / 0.0, 0.0 / 0.0, -1.0 / 0.0])
  presets.set(2.0, 1.0, [99.0])
  let locator = @ticker.LinearLocator::new(presets~, numticks=-1)
  verify_linear_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [3.0, 2.0, 1.0],
  )
}

///|
test "LinearLocator preset precedence count -1 bounds (1.0, 2.0)" {
  let presets = @ticker.LinearLocatorPresets::new()
  presets.set(-0.05, 0.05, [3.0, 2.0, 1.0])
  presets.set(1.9, 2.1, [8.0, 8.0, -1.0])
  presets.set(1.0, 3.0, [1.0 / 0.0, 0.0 / 0.0, -1.0 / 0.0])
  presets.set(2.0, 1.0, [99.0])
  let locator = @ticker.LinearLocator::new(presets~, numticks=-1)
  assert_true(
    try {
      ignore(locator.tick_values(1.0, 2.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "LinearLocator preset precedence count 0 bounds (0.0, 0.0)" {
  let presets = @ticker.LinearLocatorPresets::new()
  presets.set(-0.05, 0.05, [3.0, 2.0, 1.0])
  presets.set(1.9, 2.1, [8.0, 8.0, -1.0])
  presets.set(1.0, 3.0, [1.0 / 0.0, 0.0 / 0.0, -1.0 / 0.0])
  presets.set(2.0, 1.0, [99.0])
  let locator = @ticker.LinearLocator::new(presets~, numticks=0)
  verify_linear_reference_values(locator.tick_values(0.0, 0.0).to_array(), [
    3.0, 2.0, 1.0,
  ])
}

///|
test "LinearLocator preset precedence count 0 bounds (2.0, 2.0)" {
  let presets = @ticker.LinearLocatorPresets::new()
  presets.set(-0.05, 0.05, [3.0, 2.0, 1.0])
  presets.set(1.9, 2.1, [8.0, 8.0, -1.0])
  presets.set(1.0, 3.0, [1.0 / 0.0, 0.0 / 0.0, -1.0 / 0.0])
  presets.set(2.0, 1.0, [99.0])
  let locator = @ticker.LinearLocator::new(presets~, numticks=0)
  verify_linear_reference_values(locator.tick_values(2.0, 2.0).to_array(), [
    8.0, 8.0, -1.0,
  ])
}

///|
test "LinearLocator preset precedence count 0 bounds (3.0, 1.0)" {
  let presets = @ticker.LinearLocatorPresets::new()
  presets.set(-0.05, 0.05, [3.0, 2.0, 1.0])
  presets.set(1.9, 2.1, [8.0, 8.0, -1.0])
  presets.set(1.0, 3.0, [1.0 / 0.0, 0.0 / 0.0, -1.0 / 0.0])
  presets.set(2.0, 1.0, [99.0])
  let locator = @ticker.LinearLocator::new(presets~, numticks=0)
  verify_linear_reference_values(locator.tick_values(3.0, 1.0).to_array(), [
    1.0 / 0.0,
    0.0 / 0.0,
    -1.0 / 0.0,
  ])
}

///|
test "LinearLocator preset precedence count 0 bounds (nan, inf)" {
  let presets = @ticker.LinearLocatorPresets::new()
  presets.set(-0.05, 0.05, [3.0, 2.0, 1.0])
  presets.set(1.9, 2.1, [8.0, 8.0, -1.0])
  presets.set(1.0, 3.0, [1.0 / 0.0, 0.0 / 0.0, -1.0 / 0.0])
  presets.set(2.0, 1.0, [99.0])
  let locator = @ticker.LinearLocator::new(presets~, numticks=0)
  verify_linear_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [3.0, 2.0, 1.0],
  )
}

///|
test "LinearLocator preset precedence count 0 bounds (1.0, 2.0)" {
  let presets = @ticker.LinearLocatorPresets::new()
  presets.set(-0.05, 0.05, [3.0, 2.0, 1.0])
  presets.set(1.9, 2.1, [8.0, 8.0, -1.0])
  presets.set(1.0, 3.0, [1.0 / 0.0, 0.0 / 0.0, -1.0 / 0.0])
  presets.set(2.0, 1.0, [99.0])
  let locator = @ticker.LinearLocator::new(presets~, numticks=0)
  verify_linear_reference_values(locator.tick_values(1.0, 2.0).to_array(), [])
}

///|
test "LinearLocator preset precedence count 1 bounds (0.0, 0.0)" {
  let presets = @ticker.LinearLocatorPresets::new()
  presets.set(-0.05, 0.05, [3.0, 2.0, 1.0])
  presets.set(1.9, 2.1, [8.0, 8.0, -1.0])
  presets.set(1.0, 3.0, [1.0 / 0.0, 0.0 / 0.0, -1.0 / 0.0])
  presets.set(2.0, 1.0, [99.0])
  let locator = @ticker.LinearLocator::new(presets~, numticks=1)
  verify_linear_reference_values(locator.tick_values(0.0, 0.0).to_array(), [
    3.0, 2.0, 1.0,
  ])
}

///|
test "LinearLocator preset precedence count 1 bounds (2.0, 2.0)" {
  let presets = @ticker.LinearLocatorPresets::new()
  presets.set(-0.05, 0.05, [3.0, 2.0, 1.0])
  presets.set(1.9, 2.1, [8.0, 8.0, -1.0])
  presets.set(1.0, 3.0, [1.0 / 0.0, 0.0 / 0.0, -1.0 / 0.0])
  presets.set(2.0, 1.0, [99.0])
  let locator = @ticker.LinearLocator::new(presets~, numticks=1)
  verify_linear_reference_values(locator.tick_values(2.0, 2.0).to_array(), [
    8.0, 8.0, -1.0,
  ])
}

///|
test "LinearLocator preset precedence count 1 bounds (3.0, 1.0)" {
  let presets = @ticker.LinearLocatorPresets::new()
  presets.set(-0.05, 0.05, [3.0, 2.0, 1.0])
  presets.set(1.9, 2.1, [8.0, 8.0, -1.0])
  presets.set(1.0, 3.0, [1.0 / 0.0, 0.0 / 0.0, -1.0 / 0.0])
  presets.set(2.0, 1.0, [99.0])
  let locator = @ticker.LinearLocator::new(presets~, numticks=1)
  verify_linear_reference_values(locator.tick_values(3.0, 1.0).to_array(), [
    1.0 / 0.0,
    0.0 / 0.0,
    -1.0 / 0.0,
  ])
}

///|
test "LinearLocator preset precedence count 1 bounds (nan, inf)" {
  let presets = @ticker.LinearLocatorPresets::new()
  presets.set(-0.05, 0.05, [3.0, 2.0, 1.0])
  presets.set(1.9, 2.1, [8.0, 8.0, -1.0])
  presets.set(1.0, 3.0, [1.0 / 0.0, 0.0 / 0.0, -1.0 / 0.0])
  presets.set(2.0, 1.0, [99.0])
  let locator = @ticker.LinearLocator::new(presets~, numticks=1)
  verify_linear_reference_values(
    locator.tick_values(0.0 / 0.0, 1.0 / 0.0).to_array(),
    [3.0, 2.0, 1.0],
  )
}

///|
test "LinearLocator preset precedence count 1 bounds (1.0, 2.0)" {
  let presets = @ticker.LinearLocatorPresets::new()
  presets.set(-0.05, 0.05, [3.0, 2.0, 1.0])
  presets.set(1.9, 2.1, [8.0, 8.0, -1.0])
  presets.set(1.0, 3.0, [1.0 / 0.0, 0.0 / 0.0, -1.0 / 0.0])
  presets.set(2.0, 1.0, [99.0])
  let locator = @ticker.LinearLocator::new(presets~, numticks=1)
  verify_linear_reference_values(locator.tick_values(1.0, 2.0).to_array(), [1.0])
}

///|
test "LinearLocator original preset dictionary result and shallow copy aliases" {
  let values = [3.0, 2.0, 1.0]
  let presets = @ticker.LinearLocatorPresets::new()
  presets.set(-0.05, 0.05, values)
  let locator = @ticker.LinearLocator::new(numticks=-1, presets~)
  let shallow = locator.copy()
  let old_view = locator.tick_values(0.0, 0.0)
  old_view.set(1, 9.0)
  values[0] = 10.0
  verify_linear_reference_values(locator.tick_values(0.0, 0.0).to_array(), [
    10.0, 9.0, 1.0,
  ])
  verify_linear_reference_values(shallow.tick_values(0.0, 0.0).to_array(), [
    10.0, 9.0, 1.0,
  ])
  presets.set(-0.05, 0.05, [77.0])
  verify_linear_reference_values(locator.tick_values(0.0, 0.0).to_array(), [
    77.0,
  ])
  verify_linear_reference_values(shallow.tick_values(0.0, 0.0).to_array(), [
    77.0,
  ])
  verify_linear_reference_values(old_view.to_array(), [10.0, 9.0, 1.0])
  let replacement = @ticker.LinearLocatorPresets::new()
  replacement.set(-0.05, 0.05, [88.0])
  shallow.set_params(presets=replacement)
  presets.set(-0.05, 0.05, [99.0])
  verify_linear_reference_values(locator.tick_values(0.0, 0.0).to_array(), [
    99.0,
  ])
  verify_linear_reference_values(shallow.tick_values(0.0, 0.0).to_array(), [
    88.0,
  ])
}

///|
test "LinearLocator original count updates None omission and property reset" {
  let locator = @ticker.LinearLocator::new()
  locator.set_params(numticks=0)
  assert_eq(locator.numticks(), 0)
  verify_linear_reference_values(locator.tick_values(-0.5, 0.5).to_array(), [])
  locator.set_params()
  assert_eq(locator.numticks(), 0)
  verify_linear_reference_values(locator.tick_values(-0.5, 0.5).to_array(), [])
  locator.set_params(numticks=1)
  assert_eq(locator.numticks(), 1)
  verify_linear_reference_values(locator.tick_values(-0.5, 0.5).to_array(), [
    -0.5,
  ])
  locator.set_params()
  assert_eq(locator.numticks(), 1)
  verify_linear_reference_values(locator.tick_values(-0.5, 0.5).to_array(), [
    -0.5,
  ])
  locator.set_params(numticks=-1)
  assert_eq(locator.numticks(), -1)
  assert_true(
    try {
      ignore(locator.tick_values(-0.5, 0.5))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  locator.set_params(numticks=3)
  assert_eq(locator.numticks(), 3)
  verify_linear_reference_values(locator.tick_values(-0.5, 0.5).to_array(), [
    -0.5, 0.0, 0.5,
  ])
  locator.set_numticks(None)
  assert_eq(locator.numticks(), 11)
  assert_eq(locator.configured_numticks(), None)
}

///|
test "LinearLocator original strided preset positive stride" {
  let owner = [0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0]
  let selected = @ticker.TickValues::from_array(owner).view(1, 2, 5)
  let presets = @ticker.LinearLocatorPresets::new()
  presets.set_view(0.0, 1.0, selected)
  let locator = @ticker.LinearLocator::new(numticks=-1, presets~)
  let shallow = locator.copy()
  let old_view = locator.tick_values(0.0, 1.0)
  verify_linear_reference_values(old_view.to_array(), [1.0, 3.0, 5.0, 7.0, 9.0])
  old_view.set(-1, old_view.get(-1) + 100.0)
  verify_linear_reference_values(owner, [
    0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 109.0, 10.0, 11.0,
  ])
  verify_linear_reference_values(shallow.tick_values(0.0, 1.0).to_array(), [
    1.0, 3.0, 5.0, 7.0, 109.0,
  ])
  owner[1] -= 50.0
  verify_linear_reference_values(old_view.to_array(), [
    -49.0, 3.0, 5.0, 7.0, 109.0,
  ])
  verify_linear_reference_values(presets.get(0.0, 1.0).unwrap().to_array(), [
    -49.0, 3.0, 5.0, 7.0, 109.0,
  ])
  presets.set(0.0, 1.0, [77.0, 88.0])
  verify_linear_reference_values(shallow.tick_values(0.0, 1.0).to_array(), [
    77.0, 88.0,
  ])
  let replacement = @ticker.LinearLocatorPresets::new()
  replacement.set(0.0, 1.0, [99.0])
  shallow.set_params(presets=replacement)
  owner[11] += 0.5
  verify_linear_reference_values(owner, [
    0.0, -49.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 109.0, 10.0, 11.5,
  ])
  verify_linear_reference_values(old_view.to_array(), [
    -49.0, 3.0, 5.0, 7.0, 109.0,
  ])
  verify_linear_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    77.0, 88.0,
  ])
  verify_linear_reference_values(shallow.tick_values(0.0, 1.0).to_array(), [
    99.0,
  ])
}

///|
test "LinearLocator original strided preset negative stride" {
  let owner = [0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0]
  let selected = @ticker.TickValues::from_array(owner).view(10, -2, 5)
  let presets = @ticker.LinearLocatorPresets::new()
  presets.set_view(0.0, 1.0, selected)
  let locator = @ticker.LinearLocator::new(numticks=-1, presets~)
  let shallow = locator.copy()
  let old_view = locator.tick_values(0.0, 1.0)
  verify_linear_reference_values(old_view.to_array(), [10.0, 8.0, 6.0, 4.0, 2.0])
  old_view.set(-1, old_view.get(-1) + 100.0)
  verify_linear_reference_values(owner, [
    0.0, 1.0, 102.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0,
  ])
  verify_linear_reference_values(shallow.tick_values(0.0, 1.0).to_array(), [
    10.0, 8.0, 6.0, 4.0, 102.0,
  ])
  owner[10] -= 50.0
  verify_linear_reference_values(old_view.to_array(), [
    -40.0, 8.0, 6.0, 4.0, 102.0,
  ])
  verify_linear_reference_values(presets.get(0.0, 1.0).unwrap().to_array(), [
    -40.0, 8.0, 6.0, 4.0, 102.0,
  ])
  presets.set(0.0, 1.0, [77.0, 88.0])
  verify_linear_reference_values(shallow.tick_values(0.0, 1.0).to_array(), [
    77.0, 88.0,
  ])
  let replacement = @ticker.LinearLocatorPresets::new()
  replacement.set(0.0, 1.0, [99.0])
  shallow.set_params(presets=replacement)
  owner[11] += 0.5
  verify_linear_reference_values(owner, [
    0.0, 1.0, 102.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, -40.0, 11.5,
  ])
  verify_linear_reference_values(old_view.to_array(), [
    -40.0, 8.0, 6.0, 4.0, 102.0,
  ])
  verify_linear_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    77.0, 88.0,
  ])
  verify_linear_reference_values(shallow.tick_values(0.0, 1.0).to_array(), [
    99.0,
  ])
}

///|
test "LinearLocator original strided preset negative start" {
  let owner = [0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0]
  let selected = @ticker.TickValues::from_array(owner).view(-1, -3, 4)
  let presets = @ticker.LinearLocatorPresets::new()
  presets.set_view(0.0, 1.0, selected)
  let locator = @ticker.LinearLocator::new(numticks=-1, presets~)
  let shallow = locator.copy()
  let old_view = locator.tick_values(0.0, 1.0)
  verify_linear_reference_values(old_view.to_array(), [11.0, 8.0, 5.0, 2.0])
  old_view.set(-1, old_view.get(-1) + 100.0)
  verify_linear_reference_values(owner, [
    0.0, 1.0, 102.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0,
  ])
  verify_linear_reference_values(shallow.tick_values(0.0, 1.0).to_array(), [
    11.0, 8.0, 5.0, 102.0,
  ])
  owner[11] -= 50.0
  verify_linear_reference_values(old_view.to_array(), [-39.0, 8.0, 5.0, 102.0])
  verify_linear_reference_values(presets.get(0.0, 1.0).unwrap().to_array(), [
    -39.0, 8.0, 5.0, 102.0,
  ])
  presets.set(0.0, 1.0, [77.0, 88.0])
  verify_linear_reference_values(shallow.tick_values(0.0, 1.0).to_array(), [
    77.0, 88.0,
  ])
  let replacement = @ticker.LinearLocatorPresets::new()
  replacement.set(0.0, 1.0, [99.0])
  shallow.set_params(presets=replacement)
  owner[11] += 0.5
  verify_linear_reference_values(owner, [
    0.0, 1.0, 102.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, -38.5,
  ])
  verify_linear_reference_values(old_view.to_array(), [-38.5, 8.0, 5.0, 102.0])
  verify_linear_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    77.0, 88.0,
  ])
  verify_linear_reference_values(shallow.tick_values(0.0, 1.0).to_array(), [
    99.0,
  ])
}

///|
test "LinearLocator original strided preset empty view" {
  let owner = [0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0]
  let selected = @ticker.TickValues::from_array(owner).view(2, 3, 0)
  let presets = @ticker.LinearLocatorPresets::new()
  presets.set_view(0.0, 1.0, selected)
  let locator = @ticker.LinearLocator::new(numticks=-1, presets~)
  let shallow = locator.copy()
  let old_view = locator.tick_values(0.0, 1.0)
  verify_linear_reference_values(old_view.to_array(), [])
  verify_linear_reference_values(owner, [
    0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0,
  ])
  verify_linear_reference_values(shallow.tick_values(0.0, 1.0).to_array(), [])
  owner[0] -= 50.0
  verify_linear_reference_values(old_view.to_array(), [])
  verify_linear_reference_values(presets.get(0.0, 1.0).unwrap().to_array(), [])
  presets.set(0.0, 1.0, [77.0, 88.0])
  verify_linear_reference_values(shallow.tick_values(0.0, 1.0).to_array(), [
    77.0, 88.0,
  ])
  let replacement = @ticker.LinearLocatorPresets::new()
  replacement.set(0.0, 1.0, [99.0])
  shallow.set_params(presets=replacement)
  owner[11] += 0.5
  verify_linear_reference_values(owner, [
    -50.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.5,
  ])
  verify_linear_reference_values(old_view.to_array(), [])
  verify_linear_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    77.0, 88.0,
  ])
  verify_linear_reference_values(shallow.tick_values(0.0, 1.0).to_array(), [
    99.0,
  ])
}

///|
test "LinearLocator original strided preset composed reverse" {
  let owner = [0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0]
  let selected = @ticker.TickValues::from_array(owner)
    .view(1, 2, 5)
    .view(-1, -2, 3)
  let presets = @ticker.LinearLocatorPresets::new()
  presets.set_view(0.0, 1.0, selected)
  let locator = @ticker.LinearLocator::new(numticks=-1, presets~)
  let shallow = locator.copy()
  let old_view = locator.tick_values(0.0, 1.0)
  verify_linear_reference_values(old_view.to_array(), [9.0, 5.0, 1.0])
  old_view.set(-1, old_view.get(-1) + 100.0)
  verify_linear_reference_values(owner, [
    0.0, 101.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0,
  ])
  verify_linear_reference_values(shallow.tick_values(0.0, 1.0).to_array(), [
    9.0, 5.0, 101.0,
  ])
  owner[9] -= 50.0
  verify_linear_reference_values(old_view.to_array(), [-41.0, 5.0, 101.0])
  verify_linear_reference_values(presets.get(0.0, 1.0).unwrap().to_array(), [
    -41.0, 5.0, 101.0,
  ])
  presets.set(0.0, 1.0, [77.0, 88.0])
  verify_linear_reference_values(shallow.tick_values(0.0, 1.0).to_array(), [
    77.0, 88.0,
  ])
  let replacement = @ticker.LinearLocatorPresets::new()
  replacement.set(0.0, 1.0, [99.0])
  shallow.set_params(presets=replacement)
  owner[11] += 0.5
  verify_linear_reference_values(owner, [
    0.0, 101.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, -41.0, 10.0, 11.5,
  ])
  verify_linear_reference_values(old_view.to_array(), [-41.0, 5.0, 101.0])
  verify_linear_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    77.0, 88.0,
  ])
  verify_linear_reference_values(shallow.tick_values(0.0, 1.0).to_array(), [
    99.0,
  ])
}

///|
test "LinearLocator original strided preset composed forward" {
  let owner = [0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0]
  let selected = @ticker.TickValues::from_array(owner)
    .view(10, -2, 5)
    .view(1, 2, 2)
  let presets = @ticker.LinearLocatorPresets::new()
  presets.set_view(0.0, 1.0, selected)
  let locator = @ticker.LinearLocator::new(numticks=-1, presets~)
  let shallow = locator.copy()
  let old_view = locator.tick_values(0.0, 1.0)
  verify_linear_reference_values(old_view.to_array(), [8.0, 4.0])
  old_view.set(-1, old_view.get(-1) + 100.0)
  verify_linear_reference_values(owner, [
    0.0, 1.0, 2.0, 3.0, 104.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0,
  ])
  verify_linear_reference_values(shallow.tick_values(0.0, 1.0).to_array(), [
    8.0, 104.0,
  ])
  owner[8] -= 50.0
  verify_linear_reference_values(old_view.to_array(), [-42.0, 104.0])
  verify_linear_reference_values(presets.get(0.0, 1.0).unwrap().to_array(), [
    -42.0, 104.0,
  ])
  presets.set(0.0, 1.0, [77.0, 88.0])
  verify_linear_reference_values(shallow.tick_values(0.0, 1.0).to_array(), [
    77.0, 88.0,
  ])
  let replacement = @ticker.LinearLocatorPresets::new()
  replacement.set(0.0, 1.0, [99.0])
  shallow.set_params(presets=replacement)
  owner[11] += 0.5
  verify_linear_reference_values(owner, [
    0.0, 1.0, 2.0, 3.0, 104.0, 5.0, 6.0, 7.0, -42.0, 9.0, 10.0, 11.5,
  ])
  verify_linear_reference_values(old_view.to_array(), [-42.0, 104.0])
  verify_linear_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    77.0, 88.0,
  ])
  verify_linear_reference_values(shallow.tick_values(0.0, 1.0).to_array(), [
    99.0,
  ])
}

///|
test "LinearLocator original strided preset writable zero stride" {
  let owner = [0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0]
  let selected = @ticker.TickValues::from_array(owner).view(2, 0, 4)
  let presets = @ticker.LinearLocatorPresets::new()
  presets.set_view(0.0, 1.0, selected)
  let locator = @ticker.LinearLocator::new(numticks=-1, presets~)
  let shallow = locator.copy()
  let old_view = locator.tick_values(0.0, 1.0)
  verify_linear_reference_values(old_view.to_array(), [2.0, 2.0, 2.0, 2.0])
  old_view.set(-1, old_view.get(-1) + 100.0)
  verify_linear_reference_values(owner, [
    0.0, 1.0, 102.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0,
  ])
  verify_linear_reference_values(shallow.tick_values(0.0, 1.0).to_array(), [
    102.0, 102.0, 102.0, 102.0,
  ])
  owner[2] -= 50.0
  verify_linear_reference_values(old_view.to_array(), [52.0, 52.0, 52.0, 52.0])
  verify_linear_reference_values(presets.get(0.0, 1.0).unwrap().to_array(), [
    52.0, 52.0, 52.0, 52.0,
  ])
  presets.set(0.0, 1.0, [77.0, 88.0])
  verify_linear_reference_values(shallow.tick_values(0.0, 1.0).to_array(), [
    77.0, 88.0,
  ])
  let replacement = @ticker.LinearLocatorPresets::new()
  replacement.set(0.0, 1.0, [99.0])
  shallow.set_params(presets=replacement)
  owner[11] += 0.5
  verify_linear_reference_values(owner, [
    0.0, 1.0, 52.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.5,
  ])
  verify_linear_reference_values(old_view.to_array(), [52.0, 52.0, 52.0, 52.0])
  verify_linear_reference_values(locator.tick_values(0.0, 1.0).to_array(), [
    77.0, 88.0,
  ])
  verify_linear_reference_values(shallow.tick_values(0.0, 1.0).to_array(), [
    99.0,
  ])
}
