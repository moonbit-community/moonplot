// Generated from pinned MultipleLocator, _Edge_integer, Locator.nonsingular
// and transforms._nonsingular. Finite values and infinities compare by bits.

///|
fn verify_multiple_reference_values(
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
fn verify_multiple_reference_limits(
  actual : (Double, Double),
  expected : Array[Double],
) -> Unit raise {
  verify_multiple_reference_values([actual.0, actual.1], expected)
}

///|
test "MultipleLocator original 0 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=0.1, offset=0.0)
  assert_eq(locator.base(), 0.1)
  assert_eq(locator.offset(), 0.0)
  verify_multiple_reference_values(
    locator.tick_values(-0.30000000000000004, 0.30000000000000004),
    [
      -0.4, -0.30000000000000004, -0.2, -0.09999999999999998, 0.0, 0.09999999999999998,
      0.20000000000000007, 0.30000000000000004, 0.4,
    ],
  )
  verify_multiple_reference_values(
    locator.tick_values(0.30000000000000004, -0.30000000000000004),
    [
      -0.4, -0.30000000000000004, -0.2, -0.09999999999999998, 0.0, 0.09999999999999998,
      0.20000000000000007, 0.30000000000000004, 0.4,
    ],
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-0.30000000000000004, 0.30000000000000004),
    [
      -0.4, -0.30000000000000004, -0.2, -0.09999999999999998, 0.0, 0.09999999999999998,
      0.20000000000000007, 0.30000000000000004, 0.4,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(-0.30000000000000004, 0.30000000000000004),
    [-0.30000000000000004, 0.30000000000000004],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(
    locator.view_limits(-0.30000000000000004, 0.30000000000000004),
    [-0.30000000000000004, 0.30000000000000004],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(-0.30000000000000004, 0.30000000000000004),
    [-0.30000000000000004, 0.30000000000000004],
  )
  verify_multiple_reference_limits(
    locator.nonsingular(-0.30000000000000004, 0.30000000000000004),
    [-0.30000000000000004, 0.30000000000000004],
  )
}

///|
test "MultipleLocator original 1 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=0.1, offset=0.0)
  assert_eq(locator.base(), 0.1)
  assert_eq(locator.offset(), 0.0)
  verify_multiple_reference_values(
    locator.tick_values(0.04000000000000001, 0.26),
    [0.0, 0.1, 0.2, 0.30000000000000004],
  )
  verify_multiple_reference_values(
    locator.tick_values(0.26, 0.04000000000000001),
    [0.0, 0.1, 0.2, 0.30000000000000004],
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(0.04000000000000001, 0.26),
    [0.0, 0.1, 0.2, 0.30000000000000004],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(0.04000000000000001, 0.26),
    [0.04000000000000001, 0.26],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(
    locator.view_limits(0.04000000000000001, 0.26),
    [0.0, 0.30000000000000004],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(0.04000000000000001, 0.26),
    [0.04000000000000001, 0.26],
  )
  verify_multiple_reference_limits(
    locator.nonsingular(0.04000000000000001, 0.26),
    [0.04000000000000001, 0.26],
  )
}

///|
test "MultipleLocator original 2 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=0.1, offset=0.0)
  assert_eq(locator.base(), 0.1)
  assert_eq(locator.offset(), 0.0)
  verify_multiple_reference_values(locator.tick_values(0.2, 0.2), [
    0.1, 0.2, 0.30000000000000004,
  ])
  verify_multiple_reference_values(locator.tick_values(0.2, 0.2), [
    0.1, 0.2, 0.30000000000000004,
  ])
  verify_multiple_reference_values(locator.as_locator().tick_values(0.2, 0.2), [
    0.1, 0.2, 0.30000000000000004,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(0.2, 0.2), [
    0.1998, 0.20020000000000002,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(0.2, 0.2), [-0.8, 1.2])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(0.2, 0.2), [
    0.1998, 0.20020000000000002,
  ])
  verify_multiple_reference_limits(locator.nonsingular(0.2, 0.2), [
    0.19, 0.21000000000000002,
  ])
}

///|
test "MultipleLocator original 3 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=0.1, offset=0.0)
  assert_eq(locator.base(), 0.1)
  assert_eq(locator.offset(), 0.0)
  verify_multiple_reference_values(locator.tick_values(-0.2, -0.2), [
    -0.30000000000000004, -0.20000000000000004, -0.10000000000000003,
  ])
  verify_multiple_reference_values(locator.tick_values(-0.2, -0.2), [
    -0.30000000000000004, -0.20000000000000004, -0.10000000000000003,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-0.2, -0.2),
    [-0.30000000000000004, -0.20000000000000004, -0.10000000000000003],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-0.2, -0.2), [
    -0.20020000000000002, -0.1998,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(-0.2, -0.2), [-1.2, 0.8])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-0.2, -0.2), [
    -0.20020000000000002, -0.1998,
  ])
  verify_multiple_reference_limits(locator.nonsingular(-0.2, -0.2), [
    -0.21000000000000002, -0.19,
  ])
}

///|
test "MultipleLocator original 4 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=0.1, offset=0.0)
  assert_eq(locator.base(), 0.1)
  assert_eq(locator.offset(), 0.0)
  verify_multiple_reference_values(
    locator.tick_values(0.30000000000000004, -0.1),
    [-0.2, -0.1, 0.0, 0.10000000000000003, 0.2, 0.3, 0.4000000000000001],
  )
  verify_multiple_reference_values(
    locator.tick_values(-0.1, 0.30000000000000004),
    [-0.2, -0.1, 0.0, 0.10000000000000003, 0.2, 0.3, 0.4000000000000001],
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(0.30000000000000004, -0.1),
    [0.4000000000000001, 0.3, 0.2, 0.10000000000000003, 0.0, -0.1, -0.2],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(0.30000000000000004, -0.1),
    [-0.1, 0.30000000000000004],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(
    locator.view_limits(0.30000000000000004, -0.1),
    [-0.1, 0.30000000000000004],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(0.30000000000000004, -0.1),
    [-0.1, 0.30000000000000004],
  )
  verify_multiple_reference_limits(
    locator.nonsingular(0.30000000000000004, -0.1),
    [-0.1, 0.30000000000000004],
  )
}

///|
test "MultipleLocator original 5 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=0.1, offset=0.1)
  assert_eq(locator.base(), 0.1)
  assert_eq(locator.offset(), 0.1)
  verify_multiple_reference_values(
    locator.tick_values(-0.20000000000000004, 0.4),
    [
      -0.30000000000000004, -0.20000000000000004, -0.1, 2.7755575615628914e-17, 0.1,
      0.19999999999999998, 0.30000000000000004, 0.4, 0.5,
    ],
  )
  verify_multiple_reference_values(
    locator.tick_values(0.4, -0.20000000000000004),
    [
      -0.30000000000000004, -0.20000000000000004, -0.1, 2.7755575615628914e-17, 0.1,
      0.19999999999999998, 0.30000000000000004, 0.4, 0.5,
    ],
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-0.20000000000000004, 0.4),
    [
      -0.30000000000000004, -0.20000000000000004, -0.1, 2.7755575615628914e-17, 0.1,
      0.19999999999999998, 0.30000000000000004, 0.4, 0.5,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(-0.20000000000000004, 0.4),
    [-0.20000000000000004, 0.4],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(
    locator.view_limits(-0.20000000000000004, 0.4),
    [-0.20000000000000004, 0.4],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(-0.20000000000000004, 0.4),
    [-0.20000000000000004, 0.4],
  )
  verify_multiple_reference_limits(
    locator.nonsingular(-0.20000000000000004, 0.4),
    [-0.20000000000000004, 0.4],
  )
}

///|
test "MultipleLocator original 6 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=0.1, offset=0.1)
  assert_eq(locator.base(), 0.1)
  assert_eq(locator.offset(), 0.1)
  verify_multiple_reference_values(locator.tick_values(0.14, 0.36), [
    0.1, 0.2, 0.30000000000000004, 0.4,
  ])
  verify_multiple_reference_values(locator.tick_values(0.36, 0.14), [
    0.1, 0.2, 0.30000000000000004, 0.4,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(0.14, 0.36),
    [0.1, 0.2, 0.30000000000000004, 0.4],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(0.14, 0.36), [0.14, 0.36])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(0.14, 0.36), [0.1, 0.4])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(0.14, 0.36), [0.14, 0.36])
  verify_multiple_reference_limits(locator.nonsingular(0.14, 0.36), [0.14, 0.36])
}

///|
test "MultipleLocator original 7 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=0.1, offset=0.1)
  assert_eq(locator.base(), 0.1)
  assert_eq(locator.offset(), 0.1)
  verify_multiple_reference_values(
    locator.tick_values(0.30000000000000004, 0.30000000000000004),
    [0.2, 0.30000000000000004, 0.4],
  )
  verify_multiple_reference_values(
    locator.tick_values(0.30000000000000004, 0.30000000000000004),
    [0.2, 0.30000000000000004, 0.4],
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(0.30000000000000004, 0.30000000000000004),
    [0.2, 0.30000000000000004, 0.4],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(0.30000000000000004, 0.30000000000000004),
    [0.2997, 0.30030000000000007],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(
    locator.view_limits(0.30000000000000004, 0.30000000000000004),
    [-0.7, 1.3],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(0.30000000000000004, 0.30000000000000004),
    [0.2997, 0.30030000000000007],
  )
  verify_multiple_reference_limits(
    locator.nonsingular(0.30000000000000004, 0.30000000000000004),
    [0.28500000000000003, 0.31500000000000006],
  )
}

///|
test "MultipleLocator original 8 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=0.1, offset=0.1)
  assert_eq(locator.base(), 0.1)
  assert_eq(locator.offset(), 0.1)
  verify_multiple_reference_values(locator.tick_values(-0.1, -0.1), [
    -0.20000000000000004, -0.10000000000000003, -2.7755575615628914e-17,
  ])
  verify_multiple_reference_values(locator.tick_values(-0.1, -0.1), [
    -0.20000000000000004, -0.10000000000000003, -2.7755575615628914e-17,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-0.1, -0.1),
    [-0.20000000000000004, -0.10000000000000003, -2.7755575615628914e-17],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-0.1, -0.1), [
    -0.10010000000000001, -0.0999,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(-0.1, -0.1), [-1.1, 0.9])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-0.1, -0.1), [
    -0.10010000000000001, -0.0999,
  ])
  verify_multiple_reference_limits(locator.nonsingular(-0.1, -0.1), [
    -0.10500000000000001, -0.095,
  ])
}

///|
test "MultipleLocator original 9 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=0.1, offset=0.1)
  assert_eq(locator.base(), 0.1)
  assert_eq(locator.offset(), 0.1)
  verify_multiple_reference_values(locator.tick_values(0.4, 0.0), [
    -0.1, 0.0, 0.1, 0.20000000000000004, 0.30000000000000004, 0.4, 0.5000000000000001,
  ])
  verify_multiple_reference_values(locator.tick_values(0.0, 0.4), [
    -0.1, 0.0, 0.1, 0.20000000000000004, 0.30000000000000004, 0.4, 0.5000000000000001,
  ])
  verify_multiple_reference_values(locator.as_locator().tick_values(0.4, 0.0), [
    0.5000000000000001, 0.4, 0.30000000000000004, 0.20000000000000004, 0.1, 0.0,
    -0.1,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(0.4, 0.0), [0.0, 0.4])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(0.4, 0.0), [0.0, 0.4])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(0.4, 0.0), [0.0, 0.4])
  verify_multiple_reference_limits(locator.nonsingular(0.4, 0.0), [0.0, 0.4])
}

///|
test "MultipleLocator original 10 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=0.1, offset=-0.35)
  assert_eq(locator.base(), 0.1)
  assert_eq(locator.offset(), -0.35)
  verify_multiple_reference_values(
    locator.tick_values(-0.65, -0.04999999999999993),
    [
      -0.75, -0.65, -0.55, -0.44999999999999996, -0.35, -0.25, -0.1499999999999999,
      -0.04999999999999993, 0.050000000000000044,
    ],
  )
  verify_multiple_reference_values(
    locator.tick_values(-0.04999999999999993, -0.65),
    [
      -0.75, -0.65, -0.55, -0.44999999999999996, -0.35, -0.25, -0.1499999999999999,
      -0.04999999999999993, 0.050000000000000044,
    ],
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-0.65, -0.04999999999999993),
    [
      -0.75, -0.65, -0.55, -0.44999999999999996, -0.35, -0.25, -0.1499999999999999,
      -0.04999999999999993, 0.050000000000000044,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(-0.65, -0.04999999999999993),
    [-0.65, -0.04999999999999993],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(
    locator.view_limits(-0.65, -0.04999999999999993),
    [-0.65, -0.04999999999999993],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(-0.65, -0.04999999999999993),
    [-0.65, -0.04999999999999993],
  )
  verify_multiple_reference_limits(
    locator.nonsingular(-0.65, -0.04999999999999993),
    [-0.65, -0.04999999999999993],
  )
}

///|
test "MultipleLocator original 11 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=0.1, offset=-0.35)
  assert_eq(locator.base(), 0.1)
  assert_eq(locator.offset(), -0.35)
  verify_multiple_reference_values(
    locator.tick_values(-0.30999999999999994, -0.08999999999999997),
    [-0.35, -0.24999999999999997, -0.14999999999999997, -0.04999999999999993],
  )
  verify_multiple_reference_values(
    locator.tick_values(-0.08999999999999997, -0.30999999999999994),
    [-0.35, -0.24999999999999997, -0.14999999999999997, -0.04999999999999993],
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-0.30999999999999994, -0.08999999999999997),
    [-0.35, -0.24999999999999997, -0.14999999999999997, -0.04999999999999993],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(-0.30999999999999994, -0.08999999999999997),
    [-0.30999999999999994, -0.08999999999999997],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(
    locator.view_limits(-0.30999999999999994, -0.08999999999999997),
    [-0.35, -0.04999999999999993],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(-0.30999999999999994, -0.08999999999999997),
    [-0.30999999999999994, -0.08999999999999997],
  )
  verify_multiple_reference_limits(
    locator.nonsingular(-0.30999999999999994, -0.08999999999999997),
    [-0.30999999999999994, -0.08999999999999997],
  )
}

///|
test "MultipleLocator original 12 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=0.1, offset=-0.35)
  assert_eq(locator.base(), 0.1)
  assert_eq(locator.offset(), -0.35)
  verify_multiple_reference_values(
    locator.tick_values(-0.14999999999999997, -0.14999999999999997),
    [-0.24999999999999997, -0.14999999999999997, -0.04999999999999993],
  )
  verify_multiple_reference_values(
    locator.tick_values(-0.14999999999999997, -0.14999999999999997),
    [-0.24999999999999997, -0.14999999999999997, -0.04999999999999993],
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-0.14999999999999997, -0.14999999999999997),
    [-0.24999999999999997, -0.14999999999999997, -0.04999999999999993],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(-0.14999999999999997, -0.14999999999999997),
    [-0.15014999999999998, -0.14984999999999996],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(
    locator.view_limits(-0.14999999999999997, -0.14999999999999997),
    [-1.15, 0.8500000000000001],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(-0.14999999999999997, -0.14999999999999997),
    [-0.15014999999999998, -0.14984999999999996],
  )
  verify_multiple_reference_limits(
    locator.nonsingular(-0.14999999999999997, -0.14999999999999997),
    [-0.15749999999999997, -0.14249999999999996],
  )
}

///|
test "MultipleLocator original 13 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=0.1, offset=-0.35)
  assert_eq(locator.base(), 0.1)
  assert_eq(locator.offset(), -0.35)
  verify_multiple_reference_values(locator.tick_values(-0.55, -0.55), [
    -0.65, -0.55, -0.45,
  ])
  verify_multiple_reference_values(locator.tick_values(-0.55, -0.55), [
    -0.65, -0.55, -0.45,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-0.55, -0.55),
    [-0.65, -0.55, -0.45],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-0.55, -0.55), [
    -0.5505500000000001, -0.54945,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(-0.55, -0.55), [
    -1.55, 0.44999999999999996,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-0.55, -0.55), [
    -0.5505500000000001, -0.54945,
  ])
  verify_multiple_reference_limits(locator.nonsingular(-0.55, -0.55), [
    -0.5775, -0.5225000000000001,
  ])
}

///|
test "MultipleLocator original 14 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=0.1, offset=-0.35)
  assert_eq(locator.base(), 0.1)
  assert_eq(locator.offset(), -0.35)
  verify_multiple_reference_values(
    locator.tick_values(-0.04999999999999993, -0.44999999999999996),
    [
      -0.55, -0.44999999999999996, -0.35, -0.24999999999999994, -0.14999999999999997,
      -0.04999999999999999, 0.0500000000000001,
    ],
  )
  verify_multiple_reference_values(
    locator.tick_values(-0.44999999999999996, -0.04999999999999993),
    [
      -0.55, -0.44999999999999996, -0.35, -0.24999999999999994, -0.14999999999999997,
      -0.04999999999999999, 0.0500000000000001,
    ],
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-0.04999999999999993, -0.44999999999999996),
    [
      0.0500000000000001, -0.04999999999999999, -0.14999999999999997, -0.24999999999999994,
      -0.35, -0.44999999999999996, -0.55,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(-0.04999999999999993, -0.44999999999999996),
    [-0.44999999999999996, -0.04999999999999993],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(
    locator.view_limits(-0.04999999999999993, -0.44999999999999996),
    [-0.44999999999999996, -0.04999999999999993],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(-0.04999999999999993, -0.44999999999999996),
    [-0.44999999999999996, -0.04999999999999993],
  )
  verify_multiple_reference_limits(
    locator.nonsingular(-0.04999999999999993, -0.44999999999999996),
    [-0.44999999999999996, -0.04999999999999993],
  )
}

///|
test "MultipleLocator original 15 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=0.25, offset=0.0)
  assert_eq(locator.base(), 0.25)
  assert_eq(locator.offset(), 0.0)
  verify_multiple_reference_values(locator.tick_values(-0.75, 0.75), [
    -1.0, -0.75, -0.5, -0.25, 0.0, 0.25, 0.5, 0.75, 1.0,
  ])
  verify_multiple_reference_values(locator.tick_values(0.75, -0.75), [
    -1.0, -0.75, -0.5, -0.25, 0.0, 0.25, 0.5, 0.75, 1.0,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-0.75, 0.75),
    [-1.0, -0.75, -0.5, -0.25, 0.0, 0.25, 0.5, 0.75, 1.0],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-0.75, 0.75), [
    -0.75, 0.75,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(-0.75, 0.75), [
    -0.75, 0.75,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-0.75, 0.75), [
    -0.75, 0.75,
  ])
  verify_multiple_reference_limits(locator.nonsingular(-0.75, 0.75), [
    -0.75, 0.75,
  ])
}

///|
test "MultipleLocator original 16 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=0.25, offset=0.0)
  assert_eq(locator.base(), 0.25)
  assert_eq(locator.offset(), 0.0)
  verify_multiple_reference_values(locator.tick_values(0.1, 0.65), [
    0.0, 0.25, 0.5, 0.75,
  ])
  verify_multiple_reference_values(locator.tick_values(0.65, 0.1), [
    0.0, 0.25, 0.5, 0.75,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(0.1, 0.65),
    [0.0, 0.25, 0.5, 0.75],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(0.1, 0.65), [0.1, 0.65])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(0.1, 0.65), [0.0, 0.75])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(0.1, 0.65), [0.1, 0.65])
  verify_multiple_reference_limits(locator.nonsingular(0.1, 0.65), [0.1, 0.65])
}

///|
test "MultipleLocator original 17 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=0.25, offset=0.0)
  assert_eq(locator.base(), 0.25)
  assert_eq(locator.offset(), 0.0)
  verify_multiple_reference_values(locator.tick_values(0.5, 0.5), [
    0.25, 0.5, 0.75,
  ])
  verify_multiple_reference_values(locator.tick_values(0.5, 0.5), [
    0.25, 0.5, 0.75,
  ])
  verify_multiple_reference_values(locator.as_locator().tick_values(0.5, 0.5), [
    0.25, 0.5, 0.75,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(0.5, 0.5), [
    0.4995, 0.5005,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(0.5, 0.5), [-0.5, 1.5])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(0.5, 0.5), [
    0.4995, 0.5005,
  ])
  verify_multiple_reference_limits(locator.nonsingular(0.5, 0.5), [0.475, 0.525])
}

///|
test "MultipleLocator original 18 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=0.25, offset=0.0)
  assert_eq(locator.base(), 0.25)
  assert_eq(locator.offset(), 0.0)
  verify_multiple_reference_values(locator.tick_values(-0.5, -0.5), [
    -0.75, -0.5, -0.25,
  ])
  verify_multiple_reference_values(locator.tick_values(-0.5, -0.5), [
    -0.75, -0.5, -0.25,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-0.5, -0.5),
    [-0.75, -0.5, -0.25],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-0.5, -0.5), [
    -0.5005, -0.4995,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(-0.5, -0.5), [-1.5, 0.5])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-0.5, -0.5), [
    -0.5005, -0.4995,
  ])
  verify_multiple_reference_limits(locator.nonsingular(-0.5, -0.5), [
    -0.525, -0.475,
  ])
}

///|
test "MultipleLocator original 19 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=0.25, offset=0.0)
  assert_eq(locator.base(), 0.25)
  assert_eq(locator.offset(), 0.0)
  verify_multiple_reference_values(locator.tick_values(0.75, -0.25), [
    -0.5, -0.25, 0.0, 0.25, 0.5, 0.75, 1.0,
  ])
  verify_multiple_reference_values(locator.tick_values(-0.25, 0.75), [
    -0.5, -0.25, 0.0, 0.25, 0.5, 0.75, 1.0,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(0.75, -0.25),
    [1.0, 0.75, 0.5, 0.25, 0.0, -0.25, -0.5],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(0.75, -0.25), [
    -0.25, 0.75,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(0.75, -0.25), [
    -0.25, 0.75,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(0.75, -0.25), [
    -0.25, 0.75,
  ])
  verify_multiple_reference_limits(locator.nonsingular(0.75, -0.25), [
    -0.25, 0.75,
  ])
}

///|
test "MultipleLocator original 20 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=0.25, offset=0.1)
  assert_eq(locator.base(), 0.25)
  assert_eq(locator.offset(), 0.1)
  verify_multiple_reference_values(locator.tick_values(-0.65, 0.85), [
    -0.9, -0.65, -0.4, -0.15, 0.1, 0.35, 0.6, 0.85, 1.1,
  ])
  verify_multiple_reference_values(locator.tick_values(0.85, -0.65), [
    -0.9, -0.65, -0.4, -0.15, 0.1, 0.35, 0.6, 0.85, 1.1,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-0.65, 0.85),
    [-0.9, -0.65, -0.4, -0.15, 0.1, 0.35, 0.6, 0.85, 1.1],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-0.65, 0.85), [
    -0.65, 0.85,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(-0.65, 0.85), [
    -0.65, 0.85,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-0.65, 0.85), [
    -0.65, 0.85,
  ])
  verify_multiple_reference_limits(locator.nonsingular(-0.65, 0.85), [
    -0.65, 0.85,
  ])
}

///|
test "MultipleLocator original 21 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=0.25, offset=0.1)
  assert_eq(locator.base(), 0.25)
  assert_eq(locator.offset(), 0.1)
  verify_multiple_reference_values(locator.tick_values(0.2, 0.75), [
    0.1, 0.35, 0.6, 0.85,
  ])
  verify_multiple_reference_values(locator.tick_values(0.75, 0.2), [
    0.1, 0.35, 0.6, 0.85,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(0.2, 0.75),
    [0.1, 0.35, 0.6, 0.85],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(0.2, 0.75), [0.2, 0.75])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(0.2, 0.75), [0.1, 0.85])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(0.2, 0.75), [0.2, 0.75])
  verify_multiple_reference_limits(locator.nonsingular(0.2, 0.75), [0.2, 0.75])
}

///|
test "MultipleLocator original 22 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=0.25, offset=0.1)
  assert_eq(locator.base(), 0.25)
  assert_eq(locator.offset(), 0.1)
  verify_multiple_reference_values(locator.tick_values(0.6, 0.6), [
    0.35, 0.6, 0.85,
  ])
  verify_multiple_reference_values(locator.tick_values(0.6, 0.6), [
    0.35, 0.6, 0.85,
  ])
  verify_multiple_reference_values(locator.as_locator().tick_values(0.6, 0.6), [
    0.35, 0.6, 0.85,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(0.6, 0.6), [
    0.5993999999999999, 0.6006,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(0.6, 0.6), [-0.4, 1.6])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(0.6, 0.6), [
    0.5993999999999999, 0.6006,
  ])
  verify_multiple_reference_limits(locator.nonsingular(0.6, 0.6), [0.57, 0.63])
}

///|
test "MultipleLocator original 23 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=0.25, offset=0.1)
  assert_eq(locator.base(), 0.25)
  assert_eq(locator.offset(), 0.1)
  verify_multiple_reference_values(locator.tick_values(-0.4, -0.4), [
    -0.65, -0.4, -0.15,
  ])
  verify_multiple_reference_values(locator.tick_values(-0.4, -0.4), [
    -0.65, -0.4, -0.15,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-0.4, -0.4),
    [-0.65, -0.4, -0.15],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-0.4, -0.4), [
    -0.40040000000000003, -0.3996,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(-0.4, -0.4), [-1.4, 0.6])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-0.4, -0.4), [
    -0.40040000000000003, -0.3996,
  ])
  verify_multiple_reference_limits(locator.nonsingular(-0.4, -0.4), [
    -0.42000000000000004, -0.38,
  ])
}

///|
test "MultipleLocator original 24 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=0.25, offset=0.1)
  assert_eq(locator.base(), 0.25)
  assert_eq(locator.offset(), 0.1)
  verify_multiple_reference_values(locator.tick_values(0.85, -0.15), [
    -0.4, -0.15, 0.1, 0.35, 0.6, 0.85, 1.1,
  ])
  verify_multiple_reference_values(locator.tick_values(-0.15, 0.85), [
    -0.4, -0.15, 0.1, 0.35, 0.6, 0.85, 1.1,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(0.85, -0.15),
    [1.1, 0.85, 0.6, 0.35, 0.1, -0.15, -0.4],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(0.85, -0.15), [
    -0.15, 0.85,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(0.85, -0.15), [
    -0.15, 0.85,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(0.85, -0.15), [
    -0.15, 0.85,
  ])
  verify_multiple_reference_limits(locator.nonsingular(0.85, -0.15), [
    -0.15, 0.85,
  ])
}

///|
test "MultipleLocator original 25 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=0.25, offset=-0.35)
  assert_eq(locator.base(), 0.25)
  assert_eq(locator.offset(), -0.35)
  verify_multiple_reference_values(locator.tick_values(-1.1, 0.4), [
    -1.35, -1.1, -0.85, -0.6, -0.35, -0.09999999999999998, 0.15000000000000002, 0.4,
    0.65,
  ])
  verify_multiple_reference_values(locator.tick_values(0.4, -1.1), [
    -1.35, -1.1, -0.85, -0.6, -0.35, -0.09999999999999998, 0.15000000000000002, 0.4,
    0.65,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-1.1, 0.4),
    [
      -1.35, -1.1, -0.85, -0.6, -0.35, -0.09999999999999998, 0.15000000000000002,
      0.4, 0.65,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-1.1, 0.4), [-1.1, 0.4])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(-1.1, 0.4), [-1.1, 0.4])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-1.1, 0.4), [-1.1, 0.4])
  verify_multiple_reference_limits(locator.nonsingular(-1.1, 0.4), [-1.1, 0.4])
}

///|
test "MultipleLocator original 26 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=0.25, offset=-0.35)
  assert_eq(locator.base(), 0.25)
  assert_eq(locator.offset(), -0.35)
  verify_multiple_reference_values(
    locator.tick_values(-0.24999999999999997, 0.30000000000000004),
    [-0.35, -0.09999999999999998, 0.15000000000000002, 0.4],
  )
  verify_multiple_reference_values(
    locator.tick_values(0.30000000000000004, -0.24999999999999997),
    [-0.35, -0.09999999999999998, 0.15000000000000002, 0.4],
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-0.24999999999999997, 0.30000000000000004),
    [-0.35, -0.09999999999999998, 0.15000000000000002, 0.4],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(-0.24999999999999997, 0.30000000000000004),
    [-0.24999999999999997, 0.30000000000000004],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(
    locator.view_limits(-0.24999999999999997, 0.30000000000000004),
    [-0.35, 0.4],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(-0.24999999999999997, 0.30000000000000004),
    [-0.24999999999999997, 0.30000000000000004],
  )
  verify_multiple_reference_limits(
    locator.nonsingular(-0.24999999999999997, 0.30000000000000004),
    [-0.24999999999999997, 0.30000000000000004],
  )
}

///|
test "MultipleLocator original 27 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=0.25, offset=-0.35)
  assert_eq(locator.base(), 0.25)
  assert_eq(locator.offset(), -0.35)
  verify_multiple_reference_values(
    locator.tick_values(0.15000000000000002, 0.15000000000000002),
    [-0.09999999999999998, 0.15000000000000002, 0.4],
  )
  verify_multiple_reference_values(
    locator.tick_values(0.15000000000000002, 0.15000000000000002),
    [-0.09999999999999998, 0.15000000000000002, 0.4],
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(0.15000000000000002, 0.15000000000000002),
    [-0.09999999999999998, 0.15000000000000002, 0.4],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(0.15000000000000002, 0.15000000000000002),
    [0.14985, 0.15015000000000003],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(
    locator.view_limits(0.15000000000000002, 0.15000000000000002),
    [-0.85, 1.15],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(0.15000000000000002, 0.15000000000000002),
    [0.14985, 0.15015000000000003],
  )
  verify_multiple_reference_limits(
    locator.nonsingular(0.15000000000000002, 0.15000000000000002),
    [0.14250000000000002, 0.15750000000000003],
  )
}

///|
test "MultipleLocator original 28 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=0.25, offset=-0.35)
  assert_eq(locator.base(), 0.25)
  assert_eq(locator.offset(), -0.35)
  verify_multiple_reference_values(locator.tick_values(-0.85, -0.85), [
    -1.1, -0.85, -0.6,
  ])
  verify_multiple_reference_values(locator.tick_values(-0.85, -0.85), [
    -1.1, -0.85, -0.6,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-0.85, -0.85),
    [-1.1, -0.85, -0.6],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-0.85, -0.85), [
    -0.85085, -0.84915,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(-0.85, -0.85), [
    -1.85, 0.15000000000000002,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-0.85, -0.85), [
    -0.85085, -0.84915,
  ])
  verify_multiple_reference_limits(locator.nonsingular(-0.85, -0.85), [
    -0.8925, -0.8075,
  ])
}

///|
test "MultipleLocator original 29 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=0.25, offset=-0.35)
  assert_eq(locator.base(), 0.25)
  assert_eq(locator.offset(), -0.35)
  verify_multiple_reference_values(locator.tick_values(0.4, -0.6), [
    -0.85, -0.6, -0.35, -0.09999999999999998, 0.15000000000000002, 0.4, 0.65,
  ])
  verify_multiple_reference_values(locator.tick_values(-0.6, 0.4), [
    -0.85, -0.6, -0.35, -0.09999999999999998, 0.15000000000000002, 0.4, 0.65,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(0.4, -0.6),
    [0.65, 0.4, 0.15000000000000002, -0.09999999999999998, -0.35, -0.6, -0.85],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(0.4, -0.6), [-0.6, 0.4])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(0.4, -0.6), [-0.6, 0.4])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(0.4, -0.6), [-0.6, 0.4])
  verify_multiple_reference_limits(locator.nonsingular(0.4, -0.6), [-0.6, 0.4])
}

///|
test "MultipleLocator original 30 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=0.5, offset=0.0)
  assert_eq(locator.base(), 0.5)
  assert_eq(locator.offset(), 0.0)
  verify_multiple_reference_values(locator.tick_values(-1.5, 1.5), [
    -2.0, -1.5, -1.0, -0.5, 0.0, 0.5, 1.0, 1.5, 2.0,
  ])
  verify_multiple_reference_values(locator.tick_values(1.5, -1.5), [
    -2.0, -1.5, -1.0, -0.5, 0.0, 0.5, 1.0, 1.5, 2.0,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-1.5, 1.5),
    [-2.0, -1.5, -1.0, -0.5, 0.0, 0.5, 1.0, 1.5, 2.0],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-1.5, 1.5), [-1.5, 1.5])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(-1.5, 1.5), [-1.5, 1.5])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-1.5, 1.5), [-1.5, 1.5])
  verify_multiple_reference_limits(locator.nonsingular(-1.5, 1.5), [-1.5, 1.5])
}

///|
test "MultipleLocator original 31 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=0.5, offset=0.0)
  assert_eq(locator.base(), 0.5)
  assert_eq(locator.offset(), 0.0)
  verify_multiple_reference_values(locator.tick_values(0.2, 1.3), [
    0.0, 0.5, 1.0, 1.5,
  ])
  verify_multiple_reference_values(locator.tick_values(1.3, 0.2), [
    0.0, 0.5, 1.0, 1.5,
  ])
  verify_multiple_reference_values(locator.as_locator().tick_values(0.2, 1.3), [
    0.0, 0.5, 1.0, 1.5,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(0.2, 1.3), [0.2, 1.3])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(0.2, 1.3), [0.0, 1.5])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(0.2, 1.3), [0.2, 1.3])
  verify_multiple_reference_limits(locator.nonsingular(0.2, 1.3), [0.2, 1.3])
}

///|
test "MultipleLocator original 32 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=0.5, offset=0.0)
  assert_eq(locator.base(), 0.5)
  assert_eq(locator.offset(), 0.0)
  verify_multiple_reference_values(locator.tick_values(1.0, 1.0), [
    0.5, 1.0, 1.5,
  ])
  verify_multiple_reference_values(locator.tick_values(1.0, 1.0), [
    0.5, 1.0, 1.5,
  ])
  verify_multiple_reference_values(locator.as_locator().tick_values(1.0, 1.0), [
    0.5, 1.0, 1.5,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(1.0, 1.0), [0.999, 1.001])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(1.0, 1.0), [0.0, 2.0])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(1.0, 1.0), [0.999, 1.001])
  verify_multiple_reference_limits(locator.nonsingular(1.0, 1.0), [0.95, 1.05])
}

///|
test "MultipleLocator original 33 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=0.5, offset=0.0)
  assert_eq(locator.base(), 0.5)
  assert_eq(locator.offset(), 0.0)
  verify_multiple_reference_values(locator.tick_values(-1.0, -1.0), [
    -1.5, -1.0, -0.5,
  ])
  verify_multiple_reference_values(locator.tick_values(-1.0, -1.0), [
    -1.5, -1.0, -0.5,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-1.0, -1.0),
    [-1.5, -1.0, -0.5],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-1.0, -1.0), [
    -1.001, -0.999,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(-1.0, -1.0), [-2.0, 0.0])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-1.0, -1.0), [
    -1.001, -0.999,
  ])
  verify_multiple_reference_limits(locator.nonsingular(-1.0, -1.0), [
    -1.05, -0.95,
  ])
}

///|
test "MultipleLocator original 34 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=0.5, offset=0.0)
  assert_eq(locator.base(), 0.5)
  assert_eq(locator.offset(), 0.0)
  verify_multiple_reference_values(locator.tick_values(1.5, -0.5), [
    -1.0, -0.5, 0.0, 0.5, 1.0, 1.5, 2.0,
  ])
  verify_multiple_reference_values(locator.tick_values(-0.5, 1.5), [
    -1.0, -0.5, 0.0, 0.5, 1.0, 1.5, 2.0,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(1.5, -0.5),
    [2.0, 1.5, 1.0, 0.5, 0.0, -0.5, -1.0],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(1.5, -0.5), [-0.5, 1.5])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(1.5, -0.5), [-0.5, 1.5])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(1.5, -0.5), [-0.5, 1.5])
  verify_multiple_reference_limits(locator.nonsingular(1.5, -0.5), [-0.5, 1.5])
}

///|
test "MultipleLocator original 35 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=0.5, offset=0.1)
  assert_eq(locator.base(), 0.5)
  assert_eq(locator.offset(), 0.1)
  verify_multiple_reference_values(locator.tick_values(-1.4, 1.6), [
    -1.9, -1.4, -0.9, -0.4, 0.1, 0.6, 1.1, 1.6, 2.1,
  ])
  verify_multiple_reference_values(locator.tick_values(1.6, -1.4), [
    -1.9, -1.4, -0.9, -0.4, 0.1, 0.6, 1.1, 1.6, 2.1,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-1.4, 1.6),
    [-1.9, -1.4, -0.9, -0.4, 0.1, 0.6, 1.1, 1.6, 2.1],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-1.4, 1.6), [-1.4, 1.6])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(-1.4, 1.6), [-1.4, 1.6])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-1.4, 1.6), [-1.4, 1.6])
  verify_multiple_reference_limits(locator.nonsingular(-1.4, 1.6), [-1.4, 1.6])
}

///|
test "MultipleLocator original 36 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=0.5, offset=0.1)
  assert_eq(locator.base(), 0.5)
  assert_eq(locator.offset(), 0.1)
  verify_multiple_reference_values(
    locator.tick_values(0.30000000000000004, 1.4000000000000001),
    [0.1, 0.6, 1.1, 1.6],
  )
  verify_multiple_reference_values(
    locator.tick_values(1.4000000000000001, 0.30000000000000004),
    [0.1, 0.6, 1.1, 1.6],
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(0.30000000000000004, 1.4000000000000001),
    [0.1, 0.6, 1.1, 1.6],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(0.30000000000000004, 1.4000000000000001),
    [0.30000000000000004, 1.4000000000000001],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(
    locator.view_limits(0.30000000000000004, 1.4000000000000001),
    [0.1, 1.6],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(0.30000000000000004, 1.4000000000000001),
    [0.30000000000000004, 1.4000000000000001],
  )
  verify_multiple_reference_limits(
    locator.nonsingular(0.30000000000000004, 1.4000000000000001),
    [0.30000000000000004, 1.4000000000000001],
  )
}

///|
test "MultipleLocator original 37 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=0.5, offset=0.1)
  assert_eq(locator.base(), 0.5)
  assert_eq(locator.offset(), 0.1)
  verify_multiple_reference_values(locator.tick_values(1.1, 1.1), [
    0.6, 1.1, 1.6,
  ])
  verify_multiple_reference_values(locator.tick_values(1.1, 1.1), [
    0.6, 1.1, 1.6,
  ])
  verify_multiple_reference_values(locator.as_locator().tick_values(1.1, 1.1), [
    0.6, 1.1, 1.6,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(1.1, 1.1), [
    1.0989, 1.1011000000000002,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(1.1, 1.1), [
    0.10000000000000009, 2.1,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(1.1, 1.1), [
    1.0989, 1.1011000000000002,
  ])
  verify_multiple_reference_limits(locator.nonsingular(1.1, 1.1), [
    1.0450000000000002, 1.155,
  ])
}

///|
test "MultipleLocator original 38 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=0.5, offset=0.1)
  assert_eq(locator.base(), 0.5)
  assert_eq(locator.offset(), 0.1)
  verify_multiple_reference_values(locator.tick_values(-0.9, -0.9), [
    -1.4, -0.9, -0.4,
  ])
  verify_multiple_reference_values(locator.tick_values(-0.9, -0.9), [
    -1.4, -0.9, -0.4,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-0.9, -0.9),
    [-1.4, -0.9, -0.4],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-0.9, -0.9), [
    -0.9009, -0.8991,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(-0.9, -0.9), [
    -1.9, 0.09999999999999998,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-0.9, -0.9), [
    -0.9009, -0.8991,
  ])
  verify_multiple_reference_limits(locator.nonsingular(-0.9, -0.9), [
    -0.9450000000000001, -0.855,
  ])
}

///|
test "MultipleLocator original 39 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=0.5, offset=0.1)
  assert_eq(locator.base(), 0.5)
  assert_eq(locator.offset(), 0.1)
  verify_multiple_reference_values(locator.tick_values(1.6, -0.4), [
    -0.9, -0.4, 0.1, 0.6, 1.1, 1.6, 2.1,
  ])
  verify_multiple_reference_values(locator.tick_values(-0.4, 1.6), [
    -0.9, -0.4, 0.1, 0.6, 1.1, 1.6, 2.1,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(1.6, -0.4),
    [2.1, 1.6, 1.1, 0.6, 0.1, -0.4, -0.9],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(1.6, -0.4), [-0.4, 1.6])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(1.6, -0.4), [-0.4, 1.6])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(1.6, -0.4), [-0.4, 1.6])
  verify_multiple_reference_limits(locator.nonsingular(1.6, -0.4), [-0.4, 1.6])
}

///|
test "MultipleLocator original 40 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=0.5, offset=-0.35)
  assert_eq(locator.base(), 0.5)
  assert_eq(locator.offset(), -0.35)
  verify_multiple_reference_values(locator.tick_values(-1.85, 1.15), [
    -2.35, -1.85, -1.35, -0.85, -0.35, 0.15000000000000002, 0.65, 1.15, 1.65,
  ])
  verify_multiple_reference_values(locator.tick_values(1.15, -1.85), [
    -2.35, -1.85, -1.35, -0.85, -0.35, 0.15000000000000002, 0.65, 1.15, 1.65,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-1.85, 1.15),
    [-2.35, -1.85, -1.35, -0.85, -0.35, 0.15000000000000002, 0.65, 1.15, 1.65],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-1.85, 1.15), [
    -1.85, 1.15,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(-1.85, 1.15), [
    -1.85, 1.15,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-1.85, 1.15), [
    -1.85, 1.15,
  ])
  verify_multiple_reference_limits(locator.nonsingular(-1.85, 1.15), [
    -1.85, 1.15,
  ])
}

///|
test "MultipleLocator original 41 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=0.5, offset=-0.35)
  assert_eq(locator.base(), 0.5)
  assert_eq(locator.offset(), -0.35)
  verify_multiple_reference_values(
    locator.tick_values(-0.14999999999999997, 0.9500000000000001),
    [-0.35, 0.15000000000000002, 0.65, 1.15],
  )
  verify_multiple_reference_values(
    locator.tick_values(0.9500000000000001, -0.14999999999999997),
    [-0.35, 0.15000000000000002, 0.65, 1.15],
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-0.14999999999999997, 0.9500000000000001),
    [-0.35, 0.15000000000000002, 0.65, 1.15],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(-0.14999999999999997, 0.9500000000000001),
    [-0.14999999999999997, 0.9500000000000001],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(
    locator.view_limits(-0.14999999999999997, 0.9500000000000001),
    [-0.35, 1.15],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(-0.14999999999999997, 0.9500000000000001),
    [-0.14999999999999997, 0.9500000000000001],
  )
  verify_multiple_reference_limits(
    locator.nonsingular(-0.14999999999999997, 0.9500000000000001),
    [-0.14999999999999997, 0.9500000000000001],
  )
}

///|
test "MultipleLocator original 42 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=0.5, offset=-0.35)
  assert_eq(locator.base(), 0.5)
  assert_eq(locator.offset(), -0.35)
  verify_multiple_reference_values(locator.tick_values(0.65, 0.65), [
    0.15000000000000002, 0.65, 1.15,
  ])
  verify_multiple_reference_values(locator.tick_values(0.65, 0.65), [
    0.15000000000000002, 0.65, 1.15,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(0.65, 0.65),
    [0.15000000000000002, 0.65, 1.15],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(0.65, 0.65), [
    0.64935, 0.6506500000000001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(0.65, 0.65), [
    -0.35, 1.65,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(0.65, 0.65), [
    0.64935, 0.6506500000000001,
  ])
  verify_multiple_reference_limits(locator.nonsingular(0.65, 0.65), [
    0.6175, 0.6825,
  ])
}

///|
test "MultipleLocator original 43 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=0.5, offset=-0.35)
  assert_eq(locator.base(), 0.5)
  assert_eq(locator.offset(), -0.35)
  verify_multiple_reference_values(locator.tick_values(-1.35, -1.35), [
    -1.85, -1.35, -0.85,
  ])
  verify_multiple_reference_values(locator.tick_values(-1.35, -1.35), [
    -1.85, -1.35, -0.85,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-1.35, -1.35),
    [-1.85, -1.35, -0.85],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-1.35, -1.35), [
    -1.35135, -1.3486500000000001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(-1.35, -1.35), [
    -2.35, -0.3500000000000001,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-1.35, -1.35), [
    -1.35135, -1.3486500000000001,
  ])
  verify_multiple_reference_limits(locator.nonsingular(-1.35, -1.35), [
    -1.4175, -1.2825000000000002,
  ])
}

///|
test "MultipleLocator original 44 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=0.5, offset=-0.35)
  assert_eq(locator.base(), 0.5)
  assert_eq(locator.offset(), -0.35)
  verify_multiple_reference_values(locator.tick_values(1.15, -0.85), [
    -1.35, -0.85, -0.35, 0.15000000000000002, 0.65, 1.15, 1.65,
  ])
  verify_multiple_reference_values(locator.tick_values(-0.85, 1.15), [
    -1.35, -0.85, -0.35, 0.15000000000000002, 0.65, 1.15, 1.65,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(1.15, -0.85),
    [1.65, 1.15, 0.65, 0.15000000000000002, -0.35, -0.85, -1.35],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(1.15, -0.85), [
    -0.85, 1.15,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(1.15, -0.85), [
    -0.85, 1.15,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(1.15, -0.85), [
    -0.85, 1.15,
  ])
  verify_multiple_reference_limits(locator.nonsingular(1.15, -0.85), [
    -0.85, 1.15,
  ])
}

///|
test "MultipleLocator original 45 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=1.0, offset=0.0)
  assert_eq(locator.base(), 1.0)
  assert_eq(locator.offset(), 0.0)
  verify_multiple_reference_values(locator.tick_values(-3.0, 3.0), [
    -4.0, -3.0, -2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0,
  ])
  verify_multiple_reference_values(locator.tick_values(3.0, -3.0), [
    -4.0, -3.0, -2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-3.0, 3.0),
    [-4.0, -3.0, -2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-3.0, 3.0), [-3.0, 3.0])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(-3.0, 3.0), [-3.0, 3.0])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-3.0, 3.0), [-3.0, 3.0])
  verify_multiple_reference_limits(locator.nonsingular(-3.0, 3.0), [-3.0, 3.0])
}

///|
test "MultipleLocator original 46 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=1.0, offset=0.0)
  assert_eq(locator.base(), 1.0)
  assert_eq(locator.offset(), 0.0)
  verify_multiple_reference_values(locator.tick_values(0.4, 2.6), [
    0.0, 1.0, 2.0, 3.0,
  ])
  verify_multiple_reference_values(locator.tick_values(2.6, 0.4), [
    0.0, 1.0, 2.0, 3.0,
  ])
  verify_multiple_reference_values(locator.as_locator().tick_values(0.4, 2.6), [
    0.0, 1.0, 2.0, 3.0,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(0.4, 2.6), [0.4, 2.6])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(0.4, 2.6), [0.0, 3.0])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(0.4, 2.6), [0.4, 2.6])
  verify_multiple_reference_limits(locator.nonsingular(0.4, 2.6), [0.4, 2.6])
}

///|
test "MultipleLocator original 47 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=1.0, offset=0.0)
  assert_eq(locator.base(), 1.0)
  assert_eq(locator.offset(), 0.0)
  verify_multiple_reference_values(locator.tick_values(2.0, 2.0), [
    1.0, 2.0, 3.0,
  ])
  verify_multiple_reference_values(locator.tick_values(2.0, 2.0), [
    1.0, 2.0, 3.0,
  ])
  verify_multiple_reference_values(locator.as_locator().tick_values(2.0, 2.0), [
    1.0, 2.0, 3.0,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(2.0, 2.0), [1.998, 2.002])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(2.0, 2.0), [1.0, 3.0])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(2.0, 2.0), [1.998, 2.002])
  verify_multiple_reference_limits(locator.nonsingular(2.0, 2.0), [1.9, 2.1])
}

///|
test "MultipleLocator original 48 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=1.0, offset=0.0)
  assert_eq(locator.base(), 1.0)
  assert_eq(locator.offset(), 0.0)
  verify_multiple_reference_values(locator.tick_values(-2.0, -2.0), [
    -3.0, -2.0, -1.0,
  ])
  verify_multiple_reference_values(locator.tick_values(-2.0, -2.0), [
    -3.0, -2.0, -1.0,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-2.0, -2.0),
    [-3.0, -2.0, -1.0],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-2.0, -2.0), [
    -2.002, -1.998,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(-2.0, -2.0), [-3.0, -1.0])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-2.0, -2.0), [
    -2.002, -1.998,
  ])
  verify_multiple_reference_limits(locator.nonsingular(-2.0, -2.0), [-2.1, -1.9])
}

///|
test "MultipleLocator original 49 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=1.0, offset=0.0)
  assert_eq(locator.base(), 1.0)
  assert_eq(locator.offset(), 0.0)
  verify_multiple_reference_values(locator.tick_values(3.0, -1.0), [
    -2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0,
  ])
  verify_multiple_reference_values(locator.tick_values(-1.0, 3.0), [
    -2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(3.0, -1.0),
    [4.0, 3.0, 2.0, 1.0, 0.0, -1.0, -2.0],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(3.0, -1.0), [-1.0, 3.0])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(3.0, -1.0), [-1.0, 3.0])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(3.0, -1.0), [-1.0, 3.0])
  verify_multiple_reference_limits(locator.nonsingular(3.0, -1.0), [-1.0, 3.0])
}

///|
test "MultipleLocator original 50 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=1.0, offset=0.1)
  assert_eq(locator.base(), 1.0)
  assert_eq(locator.offset(), 0.1)
  verify_multiple_reference_values(locator.tick_values(-2.9, 3.1), [
    -3.9, -2.9, -1.9, -0.9, 0.1, 1.1, 2.1, 3.1, 4.1,
  ])
  verify_multiple_reference_values(locator.tick_values(3.1, -2.9), [
    -3.9, -2.9, -1.9, -0.9, 0.1, 1.1, 2.1, 3.1, 4.1,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-2.9, 3.1),
    [-3.9, -2.9, -1.9, -0.9, 0.1, 1.1, 2.1, 3.1, 4.1],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-2.9, 3.1), [-2.9, 3.1])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(-2.9, 3.1), [-2.9, 3.1])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-2.9, 3.1), [-2.9, 3.1])
  verify_multiple_reference_limits(locator.nonsingular(-2.9, 3.1), [-2.9, 3.1])
}

///|
test "MultipleLocator original 51 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=1.0, offset=0.1)
  assert_eq(locator.base(), 1.0)
  assert_eq(locator.offset(), 0.1)
  verify_multiple_reference_values(locator.tick_values(0.5, 2.7), [
    0.1, 1.1, 2.1, 3.1,
  ])
  verify_multiple_reference_values(locator.tick_values(2.7, 0.5), [
    0.1, 1.1, 2.1, 3.1,
  ])
  verify_multiple_reference_values(locator.as_locator().tick_values(0.5, 2.7), [
    0.1, 1.1, 2.1, 3.1,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(0.5, 2.7), [0.5, 2.7])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(0.5, 2.7), [0.1, 3.1])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(0.5, 2.7), [0.5, 2.7])
  verify_multiple_reference_limits(locator.nonsingular(0.5, 2.7), [0.5, 2.7])
}

///|
test "MultipleLocator original 52 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=1.0, offset=0.1)
  assert_eq(locator.base(), 1.0)
  assert_eq(locator.offset(), 0.1)
  verify_multiple_reference_values(locator.tick_values(2.1, 2.1), [
    1.1, 2.1, 3.1,
  ])
  verify_multiple_reference_values(locator.tick_values(2.1, 2.1), [
    1.1, 2.1, 3.1,
  ])
  verify_multiple_reference_values(locator.as_locator().tick_values(2.1, 2.1), [
    1.1, 2.1, 3.1,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(2.1, 2.1), [
    2.0979, 2.1021,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(2.1, 2.1), [1.1, 3.1])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(2.1, 2.1), [
    2.0979, 2.1021,
  ])
  verify_multiple_reference_limits(locator.nonsingular(2.1, 2.1), [1.995, 2.205])
}

///|
test "MultipleLocator original 53 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=1.0, offset=0.1)
  assert_eq(locator.base(), 1.0)
  assert_eq(locator.offset(), 0.1)
  verify_multiple_reference_values(locator.tick_values(-1.9, -1.9), [
    -2.9, -1.9, -0.9,
  ])
  verify_multiple_reference_values(locator.tick_values(-1.9, -1.9), [
    -2.9, -1.9, -0.9,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-1.9, -1.9),
    [-2.9, -1.9, -0.9],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-1.9, -1.9), [
    -1.9019, -1.8981,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(-1.9, -1.9), [
    -2.9, -0.8999999999999999,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-1.9, -1.9), [
    -1.9019, -1.8981,
  ])
  verify_multiple_reference_limits(locator.nonsingular(-1.9, -1.9), [
    -1.9949999999999999, -1.805,
  ])
}

///|
test "MultipleLocator original 54 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=1.0, offset=0.1)
  assert_eq(locator.base(), 1.0)
  assert_eq(locator.offset(), 0.1)
  verify_multiple_reference_values(locator.tick_values(3.1, -0.9), [
    -1.9, -0.9, 0.1, 1.1, 2.1, 3.1, 4.1,
  ])
  verify_multiple_reference_values(locator.tick_values(-0.9, 3.1), [
    -1.9, -0.9, 0.1, 1.1, 2.1, 3.1, 4.1,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(3.1, -0.9),
    [4.1, 3.1, 2.1, 1.1, 0.1, -0.9, -1.9],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(3.1, -0.9), [-0.9, 3.1])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(3.1, -0.9), [-0.9, 3.1])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(3.1, -0.9), [-0.9, 3.1])
  verify_multiple_reference_limits(locator.nonsingular(3.1, -0.9), [-0.9, 3.1])
}

///|
test "MultipleLocator original 55 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=1.0, offset=-0.35)
  assert_eq(locator.base(), 1.0)
  assert_eq(locator.offset(), -0.35)
  verify_multiple_reference_values(locator.tick_values(-3.35, 2.65), [
    -4.35, -3.35, -2.35, -1.35, -0.35, 0.65, 1.65, 2.65, 3.65,
  ])
  verify_multiple_reference_values(locator.tick_values(2.65, -3.35), [
    -4.35, -3.35, -2.35, -1.35, -0.35, 0.65, 1.65, 2.65, 3.65,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-3.35, 2.65),
    [-4.35, -3.35, -2.35, -1.35, -0.35, 0.65, 1.65, 2.65, 3.65],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-3.35, 2.65), [
    -3.35, 2.65,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(-3.35, 2.65), [
    -3.35, 2.65,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-3.35, 2.65), [
    -3.35, 2.65,
  ])
  verify_multiple_reference_limits(locator.nonsingular(-3.35, 2.65), [
    -3.35, 2.65,
  ])
}

///|
test "MultipleLocator original 56 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=1.0, offset=-0.35)
  assert_eq(locator.base(), 1.0)
  assert_eq(locator.offset(), -0.35)
  verify_multiple_reference_values(
    locator.tick_values(0.050000000000000044, 2.25),
    [-0.35, 0.65, 1.65, 2.65],
  )
  verify_multiple_reference_values(
    locator.tick_values(2.25, 0.050000000000000044),
    [-0.35, 0.65, 1.65, 2.65],
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(0.050000000000000044, 2.25),
    [-0.35, 0.65, 1.65, 2.65],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(0.050000000000000044, 2.25),
    [0.050000000000000044, 2.25],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(
    locator.view_limits(0.050000000000000044, 2.25),
    [-0.35, 2.65],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(0.050000000000000044, 2.25),
    [0.050000000000000044, 2.25],
  )
  verify_multiple_reference_limits(
    locator.nonsingular(0.050000000000000044, 2.25),
    [0.050000000000000044, 2.25],
  )
}

///|
test "MultipleLocator original 57 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=1.0, offset=-0.35)
  assert_eq(locator.base(), 1.0)
  assert_eq(locator.offset(), -0.35)
  verify_multiple_reference_values(locator.tick_values(1.65, 1.65), [
    0.65, 1.65, 2.65,
  ])
  verify_multiple_reference_values(locator.tick_values(1.65, 1.65), [
    0.65, 1.65, 2.65,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(1.65, 1.65),
    [0.65, 1.65, 2.65],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(1.65, 1.65), [
    1.64835, 1.6516499999999998,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(1.65, 1.65), [
    0.6499999999999999, 2.65,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(1.65, 1.65), [
    1.64835, 1.6516499999999998,
  ])
  verify_multiple_reference_limits(locator.nonsingular(1.65, 1.65), [
    1.5675, 1.7325,
  ])
}

///|
test "MultipleLocator original 58 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=1.0, offset=-0.35)
  assert_eq(locator.base(), 1.0)
  assert_eq(locator.offset(), -0.35)
  verify_multiple_reference_values(locator.tick_values(-2.35, -2.35), [
    -3.35, -2.35, -1.35,
  ])
  verify_multiple_reference_values(locator.tick_values(-2.35, -2.35), [
    -3.35, -2.35, -1.35,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-2.35, -2.35),
    [-3.35, -2.35, -1.35],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-2.35, -2.35), [
    -2.35235, -2.3476500000000002,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(-2.35, -2.35), [
    -3.35, -1.35,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-2.35, -2.35), [
    -2.35235, -2.3476500000000002,
  ])
  verify_multiple_reference_limits(locator.nonsingular(-2.35, -2.35), [
    -2.4675000000000002, -2.2325,
  ])
}

///|
test "MultipleLocator original 59 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=1.0, offset=-0.35)
  assert_eq(locator.base(), 1.0)
  assert_eq(locator.offset(), -0.35)
  verify_multiple_reference_values(locator.tick_values(2.65, -1.35), [
    -2.35, -1.35, -0.35, 0.65, 1.65, 2.65, 3.65,
  ])
  verify_multiple_reference_values(locator.tick_values(-1.35, 2.65), [
    -2.35, -1.35, -0.35, 0.65, 1.65, 2.65, 3.65,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(2.65, -1.35),
    [3.65, 2.65, 1.65, 0.65, -0.35, -1.35, -2.35],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(2.65, -1.35), [
    -1.35, 2.65,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(2.65, -1.35), [
    -1.35, 2.65,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(2.65, -1.35), [
    -1.35, 2.65,
  ])
  verify_multiple_reference_limits(locator.nonsingular(2.65, -1.35), [
    -1.35, 2.65,
  ])
}

///|
test "MultipleLocator original 60 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=2.5, offset=0.0)
  assert_eq(locator.base(), 2.5)
  assert_eq(locator.offset(), 0.0)
  verify_multiple_reference_values(locator.tick_values(-7.5, 7.5), [
    -10.0, -7.5, -5.0, -2.5, 0.0, 2.5, 5.0, 7.5, 10.0,
  ])
  verify_multiple_reference_values(locator.tick_values(7.5, -7.5), [
    -10.0, -7.5, -5.0, -2.5, 0.0, 2.5, 5.0, 7.5, 10.0,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-7.5, 7.5),
    [-10.0, -7.5, -5.0, -2.5, 0.0, 2.5, 5.0, 7.5, 10.0],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-7.5, 7.5), [-7.5, 7.5])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(-7.5, 7.5), [-7.5, 7.5])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-7.5, 7.5), [-7.5, 7.5])
  verify_multiple_reference_limits(locator.nonsingular(-7.5, 7.5), [-7.5, 7.5])
}

///|
test "MultipleLocator original 61 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=2.5, offset=0.0)
  assert_eq(locator.base(), 2.5)
  assert_eq(locator.offset(), 0.0)
  verify_multiple_reference_values(locator.tick_values(1.0, 6.5), [
    0.0, 2.5, 5.0, 7.5,
  ])
  verify_multiple_reference_values(locator.tick_values(6.5, 1.0), [
    0.0, 2.5, 5.0, 7.5,
  ])
  verify_multiple_reference_values(locator.as_locator().tick_values(1.0, 6.5), [
    0.0, 2.5, 5.0, 7.5,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(1.0, 6.5), [1.0, 6.5])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(1.0, 6.5), [0.0, 7.5])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(1.0, 6.5), [1.0, 6.5])
  verify_multiple_reference_limits(locator.nonsingular(1.0, 6.5), [1.0, 6.5])
}

///|
test "MultipleLocator original 62 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=2.5, offset=0.0)
  assert_eq(locator.base(), 2.5)
  assert_eq(locator.offset(), 0.0)
  verify_multiple_reference_values(locator.tick_values(5.0, 5.0), [
    2.5, 5.0, 7.5,
  ])
  verify_multiple_reference_values(locator.tick_values(5.0, 5.0), [
    2.5, 5.0, 7.5,
  ])
  verify_multiple_reference_values(locator.as_locator().tick_values(5.0, 5.0), [
    2.5, 5.0, 7.5,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(5.0, 5.0), [4.995, 5.005])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(5.0, 5.0), [4.0, 6.0])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(5.0, 5.0), [4.995, 5.005])
  verify_multiple_reference_limits(locator.nonsingular(5.0, 5.0), [4.75, 5.25])
}

///|
test "MultipleLocator original 63 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=2.5, offset=0.0)
  assert_eq(locator.base(), 2.5)
  assert_eq(locator.offset(), 0.0)
  verify_multiple_reference_values(locator.tick_values(-5.0, -5.0), [
    -7.5, -5.0, -2.5,
  ])
  verify_multiple_reference_values(locator.tick_values(-5.0, -5.0), [
    -7.5, -5.0, -2.5,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-5.0, -5.0),
    [-7.5, -5.0, -2.5],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-5.0, -5.0), [
    -5.005, -4.995,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(-5.0, -5.0), [-6.0, -4.0])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-5.0, -5.0), [
    -5.005, -4.995,
  ])
  verify_multiple_reference_limits(locator.nonsingular(-5.0, -5.0), [
    -5.25, -4.75,
  ])
}

///|
test "MultipleLocator original 64 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=2.5, offset=0.0)
  assert_eq(locator.base(), 2.5)
  assert_eq(locator.offset(), 0.0)
  verify_multiple_reference_values(locator.tick_values(7.5, -2.5), [
    -5.0, -2.5, 0.0, 2.5, 5.0, 7.5, 10.0,
  ])
  verify_multiple_reference_values(locator.tick_values(-2.5, 7.5), [
    -5.0, -2.5, 0.0, 2.5, 5.0, 7.5, 10.0,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(7.5, -2.5),
    [10.0, 7.5, 5.0, 2.5, 0.0, -2.5, -5.0],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(7.5, -2.5), [-2.5, 7.5])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(7.5, -2.5), [-2.5, 7.5])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(7.5, -2.5), [-2.5, 7.5])
  verify_multiple_reference_limits(locator.nonsingular(7.5, -2.5), [-2.5, 7.5])
}

///|
test "MultipleLocator original 65 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=2.5, offset=0.1)
  assert_eq(locator.base(), 2.5)
  assert_eq(locator.offset(), 0.1)
  verify_multiple_reference_values(locator.tick_values(-7.4, 7.6), [
    -9.9, -7.4, -4.9, -2.4, 0.1, 2.6, 5.1, 7.6, 10.1,
  ])
  verify_multiple_reference_values(locator.tick_values(7.6, -7.4), [
    -9.9, -7.4, -4.9, -2.4, 0.1, 2.6, 5.1, 7.6, 10.1,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-7.4, 7.6),
    [-9.9, -7.4, -4.9, -2.4, 0.1, 2.6, 5.1, 7.6, 10.1],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-7.4, 7.6), [-7.4, 7.6])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(-7.4, 7.6), [-7.4, 7.6])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-7.4, 7.6), [-7.4, 7.6])
  verify_multiple_reference_limits(locator.nonsingular(-7.4, 7.6), [-7.4, 7.6])
}

///|
test "MultipleLocator original 66 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=2.5, offset=0.1)
  assert_eq(locator.base(), 2.5)
  assert_eq(locator.offset(), 0.1)
  verify_multiple_reference_values(locator.tick_values(1.1, 6.6), [
    0.1, 2.6, 5.1, 7.6,
  ])
  verify_multiple_reference_values(locator.tick_values(6.6, 1.1), [
    0.1, 2.6, 5.1, 7.6,
  ])
  verify_multiple_reference_values(locator.as_locator().tick_values(1.1, 6.6), [
    0.1, 2.6, 5.1, 7.6,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(1.1, 6.6), [1.1, 6.6])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(1.1, 6.6), [0.1, 7.6])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(1.1, 6.6), [1.1, 6.6])
  verify_multiple_reference_limits(locator.nonsingular(1.1, 6.6), [1.1, 6.6])
}

///|
test "MultipleLocator original 67 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=2.5, offset=0.1)
  assert_eq(locator.base(), 2.5)
  assert_eq(locator.offset(), 0.1)
  verify_multiple_reference_values(locator.tick_values(5.1, 5.1), [
    2.6, 5.1, 7.6,
  ])
  verify_multiple_reference_values(locator.tick_values(5.1, 5.1), [
    2.6, 5.1, 7.6,
  ])
  verify_multiple_reference_values(locator.as_locator().tick_values(5.1, 5.1), [
    2.6, 5.1, 7.6,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(5.1, 5.1), [
    5.0949, 5.105099999999999,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(5.1, 5.1), [4.1, 6.1])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(5.1, 5.1), [
    5.0949, 5.105099999999999,
  ])
  verify_multiple_reference_limits(locator.nonsingular(5.1, 5.1), [
    4.845, 5.3549999999999995,
  ])
}

///|
test "MultipleLocator original 68 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=2.5, offset=0.1)
  assert_eq(locator.base(), 2.5)
  assert_eq(locator.offset(), 0.1)
  verify_multiple_reference_values(locator.tick_values(-4.9, -4.9), [
    -7.4, -4.9, -2.4,
  ])
  verify_multiple_reference_values(locator.tick_values(-4.9, -4.9), [
    -7.4, -4.9, -2.4,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-4.9, -4.9),
    [-7.4, -4.9, -2.4],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-4.9, -4.9), [
    -4.9049000000000005, -4.8951,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(-4.9, -4.9), [
    -5.9, -3.9000000000000004,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-4.9, -4.9), [
    -4.9049000000000005, -4.8951,
  ])
  verify_multiple_reference_limits(locator.nonsingular(-4.9, -4.9), [
    -5.1450000000000005, -4.655,
  ])
}

///|
test "MultipleLocator original 69 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=2.5, offset=0.1)
  assert_eq(locator.base(), 2.5)
  assert_eq(locator.offset(), 0.1)
  verify_multiple_reference_values(locator.tick_values(7.6, -2.4), [
    -4.9, -2.4, 0.1, 2.6, 5.1, 7.6, 10.1,
  ])
  verify_multiple_reference_values(locator.tick_values(-2.4, 7.6), [
    -4.9, -2.4, 0.1, 2.6, 5.1, 7.6, 10.1,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(7.6, -2.4),
    [10.1, 7.6, 5.1, 2.6, 0.1, -2.4, -4.9],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(7.6, -2.4), [-2.4, 7.6])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(7.6, -2.4), [-2.4, 7.6])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(7.6, -2.4), [-2.4, 7.6])
  verify_multiple_reference_limits(locator.nonsingular(7.6, -2.4), [-2.4, 7.6])
}

///|
test "MultipleLocator original 70 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=2.5, offset=-0.35)
  assert_eq(locator.base(), 2.5)
  assert_eq(locator.offset(), -0.35)
  verify_multiple_reference_values(locator.tick_values(-7.85, 7.15), [
    -10.35, -7.85, -5.35, -2.85, -0.35, 2.15, 4.65, 7.15, 9.65,
  ])
  verify_multiple_reference_values(locator.tick_values(7.15, -7.85), [
    -10.35, -7.85, -5.35, -2.85, -0.35, 2.15, 4.65, 7.15, 9.65,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-7.85, 7.15),
    [-10.35, -7.85, -5.35, -2.85, -0.35, 2.15, 4.65, 7.15, 9.65],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-7.85, 7.15), [
    -7.85, 7.15,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(-7.85, 7.15), [
    -7.85, 7.15,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-7.85, 7.15), [
    -7.85, 7.15,
  ])
  verify_multiple_reference_limits(locator.nonsingular(-7.85, 7.15), [
    -7.85, 7.15,
  ])
}

///|
test "MultipleLocator original 71 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=2.5, offset=-0.35)
  assert_eq(locator.base(), 2.5)
  assert_eq(locator.offset(), -0.35)
  verify_multiple_reference_values(locator.tick_values(0.65, 6.15), [
    -0.35, 2.15, 4.65, 7.15,
  ])
  verify_multiple_reference_values(locator.tick_values(6.15, 0.65), [
    -0.35, 2.15, 4.65, 7.15,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(0.65, 6.15),
    [-0.35, 2.15, 4.65, 7.15],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(0.65, 6.15), [0.65, 6.15])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(0.65, 6.15), [
    -0.35, 7.15,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(0.65, 6.15), [0.65, 6.15])
  verify_multiple_reference_limits(locator.nonsingular(0.65, 6.15), [0.65, 6.15])
}

///|
test "MultipleLocator original 72 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=2.5, offset=-0.35)
  assert_eq(locator.base(), 2.5)
  assert_eq(locator.offset(), -0.35)
  verify_multiple_reference_values(locator.tick_values(4.65, 4.65), [
    2.15, 4.65, 7.15,
  ])
  verify_multiple_reference_values(locator.tick_values(4.65, 4.65), [
    2.15, 4.65, 7.15,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(4.65, 4.65),
    [2.15, 4.65, 7.15],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(4.65, 4.65), [
    4.6453500000000005, 4.65465,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(4.65, 4.65), [
    3.6500000000000004, 5.65,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(4.65, 4.65), [
    4.6453500000000005, 4.65465,
  ])
  verify_multiple_reference_limits(locator.nonsingular(4.65, 4.65), [
    4.4175, 4.8825,
  ])
}

///|
test "MultipleLocator original 73 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=2.5, offset=-0.35)
  assert_eq(locator.base(), 2.5)
  assert_eq(locator.offset(), -0.35)
  verify_multiple_reference_values(locator.tick_values(-5.35, -5.35), [
    -7.85, -5.35, -2.85,
  ])
  verify_multiple_reference_values(locator.tick_values(-5.35, -5.35), [
    -7.85, -5.35, -2.85,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-5.35, -5.35),
    [-7.85, -5.35, -2.85],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-5.35, -5.35), [
    -5.35535, -5.34465,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(-5.35, -5.35), [
    -6.35, -4.35,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-5.35, -5.35), [
    -5.35535, -5.34465,
  ])
  verify_multiple_reference_limits(locator.nonsingular(-5.35, -5.35), [
    -5.6175, -5.0825,
  ])
}

///|
test "MultipleLocator original 74 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=2.5, offset=-0.35)
  assert_eq(locator.base(), 2.5)
  assert_eq(locator.offset(), -0.35)
  verify_multiple_reference_values(locator.tick_values(7.15, -2.85), [
    -5.35, -2.85, -0.35, 2.15, 4.65, 7.15, 9.65,
  ])
  verify_multiple_reference_values(locator.tick_values(-2.85, 7.15), [
    -5.35, -2.85, -0.35, 2.15, 4.65, 7.15, 9.65,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(7.15, -2.85),
    [9.65, 7.15, 4.65, 2.15, -0.35, -2.85, -5.35],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(7.15, -2.85), [
    -2.85, 7.15,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(7.15, -2.85), [
    -2.85, 7.15,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(7.15, -2.85), [
    -2.85, 7.15,
  ])
  verify_multiple_reference_limits(locator.nonsingular(7.15, -2.85), [
    -2.85, 7.15,
  ])
}

///|
test "MultipleLocator original 75 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=7.0, offset=0.0)
  assert_eq(locator.base(), 7.0)
  assert_eq(locator.offset(), 0.0)
  verify_multiple_reference_values(locator.tick_values(-21.0, 21.0), [
    -28.0, -21.0, -14.0, -7.0, 0.0, 7.0, 14.0, 21.0, 28.0,
  ])
  verify_multiple_reference_values(locator.tick_values(21.0, -21.0), [
    -28.0, -21.0, -14.0, -7.0, 0.0, 7.0, 14.0, 21.0, 28.0,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-21.0, 21.0),
    [-28.0, -21.0, -14.0, -7.0, 0.0, 7.0, 14.0, 21.0, 28.0],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-21.0, 21.0), [
    -21.0, 21.0,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(-21.0, 21.0), [
    -21.0, 21.0,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-21.0, 21.0), [
    -21.0, 21.0,
  ])
  verify_multiple_reference_limits(locator.nonsingular(-21.0, 21.0), [
    -21.0, 21.0,
  ])
}

///|
test "MultipleLocator original 76 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=7.0, offset=0.0)
  assert_eq(locator.base(), 7.0)
  assert_eq(locator.offset(), 0.0)
  verify_multiple_reference_values(
    locator.tick_values(2.8000000000000003, 18.2),
    [0.0, 7.0, 14.0, 21.0],
  )
  verify_multiple_reference_values(
    locator.tick_values(18.2, 2.8000000000000003),
    [0.0, 7.0, 14.0, 21.0],
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(2.8000000000000003, 18.2),
    [0.0, 7.0, 14.0, 21.0],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(2.8000000000000003, 18.2),
    [2.8000000000000003, 18.2],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(
    locator.view_limits(2.8000000000000003, 18.2),
    [0.0, 21.0],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(2.8000000000000003, 18.2),
    [2.8000000000000003, 18.2],
  )
  verify_multiple_reference_limits(
    locator.nonsingular(2.8000000000000003, 18.2),
    [2.8000000000000003, 18.2],
  )
}

///|
test "MultipleLocator original 77 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=7.0, offset=0.0)
  assert_eq(locator.base(), 7.0)
  assert_eq(locator.offset(), 0.0)
  verify_multiple_reference_values(locator.tick_values(14.0, 14.0), [
    7.0, 14.0, 21.0,
  ])
  verify_multiple_reference_values(locator.tick_values(14.0, 14.0), [
    7.0, 14.0, 21.0,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(14.0, 14.0),
    [7.0, 14.0, 21.0],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(14.0, 14.0), [
    13.986, 14.014,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(14.0, 14.0), [13.0, 15.0])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(14.0, 14.0), [
    13.986, 14.014,
  ])
  verify_multiple_reference_limits(locator.nonsingular(14.0, 14.0), [13.3, 14.7])
}

///|
test "MultipleLocator original 78 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=7.0, offset=0.0)
  assert_eq(locator.base(), 7.0)
  assert_eq(locator.offset(), 0.0)
  verify_multiple_reference_values(locator.tick_values(-14.0, -14.0), [
    -21.0, -14.0, -7.0,
  ])
  verify_multiple_reference_values(locator.tick_values(-14.0, -14.0), [
    -21.0, -14.0, -7.0,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-14.0, -14.0),
    [-21.0, -14.0, -7.0],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-14.0, -14.0), [
    -14.014, -13.986,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(-14.0, -14.0), [
    -15.0, -13.0,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-14.0, -14.0), [
    -14.014, -13.986,
  ])
  verify_multiple_reference_limits(locator.nonsingular(-14.0, -14.0), [
    -14.7, -13.3,
  ])
}

///|
test "MultipleLocator original 79 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=7.0, offset=0.0)
  assert_eq(locator.base(), 7.0)
  assert_eq(locator.offset(), 0.0)
  verify_multiple_reference_values(locator.tick_values(21.0, -7.0), [
    -14.0, -7.0, 0.0, 7.0, 14.0, 21.0, 28.0,
  ])
  verify_multiple_reference_values(locator.tick_values(-7.0, 21.0), [
    -14.0, -7.0, 0.0, 7.0, 14.0, 21.0, 28.0,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(21.0, -7.0),
    [28.0, 21.0, 14.0, 7.0, 0.0, -7.0, -14.0],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(21.0, -7.0), [-7.0, 21.0])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(21.0, -7.0), [-7.0, 21.0])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(21.0, -7.0), [-7.0, 21.0])
  verify_multiple_reference_limits(locator.nonsingular(21.0, -7.0), [-7.0, 21.0])
}

///|
test "MultipleLocator original 80 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=7.0, offset=0.1)
  assert_eq(locator.base(), 7.0)
  assert_eq(locator.offset(), 0.1)
  verify_multiple_reference_values(locator.tick_values(-20.9, 21.1), [
    -27.9, -20.9, -13.9, -6.9, 0.1, 7.1, 14.1, 21.1, 28.1,
  ])
  verify_multiple_reference_values(locator.tick_values(21.1, -20.9), [
    -27.9, -20.9, -13.9, -6.9, 0.1, 7.1, 14.1, 21.1, 28.1,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-20.9, 21.1),
    [-27.9, -20.9, -13.9, -6.9, 0.1, 7.1, 14.1, 21.1, 28.1],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-20.9, 21.1), [
    -20.9, 21.1,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(-20.9, 21.1), [
    -20.9, 21.1,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-20.9, 21.1), [
    -20.9, 21.1,
  ])
  verify_multiple_reference_limits(locator.nonsingular(-20.9, 21.1), [
    -20.9, 21.1,
  ])
}

///|
test "MultipleLocator original 81 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=7.0, offset=0.1)
  assert_eq(locator.base(), 7.0)
  assert_eq(locator.offset(), 0.1)
  verify_multiple_reference_values(
    locator.tick_values(2.9000000000000004, 18.3),
    [0.1, 7.1, 14.1, 21.1],
  )
  verify_multiple_reference_values(
    locator.tick_values(18.3, 2.9000000000000004),
    [0.1, 7.1, 14.1, 21.1],
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(2.9000000000000004, 18.3),
    [0.1, 7.1, 14.1, 21.1],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(2.9000000000000004, 18.3),
    [2.9000000000000004, 18.3],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(
    locator.view_limits(2.9000000000000004, 18.3),
    [0.1, 21.1],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(2.9000000000000004, 18.3),
    [2.9000000000000004, 18.3],
  )
  verify_multiple_reference_limits(
    locator.nonsingular(2.9000000000000004, 18.3),
    [2.9000000000000004, 18.3],
  )
}

///|
test "MultipleLocator original 82 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=7.0, offset=0.1)
  assert_eq(locator.base(), 7.0)
  assert_eq(locator.offset(), 0.1)
  verify_multiple_reference_values(locator.tick_values(14.1, 14.1), [
    7.1, 14.1, 21.1,
  ])
  verify_multiple_reference_values(locator.tick_values(14.1, 14.1), [
    7.1, 14.1, 21.1,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(14.1, 14.1),
    [7.1, 14.1, 21.1],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(14.1, 14.1), [
    14.0859, 14.114099999999999,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(14.1, 14.1), [13.1, 15.1])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(14.1, 14.1), [
    14.0859, 14.114099999999999,
  ])
  verify_multiple_reference_limits(locator.nonsingular(14.1, 14.1), [
    13.395, 14.805,
  ])
}

///|
test "MultipleLocator original 83 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=7.0, offset=0.1)
  assert_eq(locator.base(), 7.0)
  assert_eq(locator.offset(), 0.1)
  verify_multiple_reference_values(locator.tick_values(-13.9, -13.9), [
    -20.9, -13.9, -6.9,
  ])
  verify_multiple_reference_values(locator.tick_values(-13.9, -13.9), [
    -20.9, -13.9, -6.9,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-13.9, -13.9),
    [-20.9, -13.9, -6.9],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-13.9, -13.9), [
    -13.9139, -13.8861,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(-13.9, -13.9), [
    -14.9, -12.9,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-13.9, -13.9), [
    -13.9139, -13.8861,
  ])
  verify_multiple_reference_limits(locator.nonsingular(-13.9, -13.9), [
    -14.595, -13.205,
  ])
}

///|
test "MultipleLocator original 84 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=7.0, offset=0.1)
  assert_eq(locator.base(), 7.0)
  assert_eq(locator.offset(), 0.1)
  verify_multiple_reference_values(locator.tick_values(21.1, -6.9), [
    -13.9, -6.9, 0.1, 7.1, 14.1, 21.1, 28.1,
  ])
  verify_multiple_reference_values(locator.tick_values(-6.9, 21.1), [
    -13.9, -6.9, 0.1, 7.1, 14.1, 21.1, 28.1,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(21.1, -6.9),
    [28.1, 21.1, 14.1, 7.1, 0.1, -6.9, -13.9],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(21.1, -6.9), [-6.9, 21.1])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(21.1, -6.9), [-6.9, 21.1])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(21.1, -6.9), [-6.9, 21.1])
  verify_multiple_reference_limits(locator.nonsingular(21.1, -6.9), [-6.9, 21.1])
}

///|
test "MultipleLocator original 85 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=7.0, offset=-0.35)
  assert_eq(locator.base(), 7.0)
  assert_eq(locator.offset(), -0.35)
  verify_multiple_reference_values(locator.tick_values(-21.35, 20.65), [
    -28.35, -21.35, -14.35, -7.35, -0.35, 6.65, 13.65, 20.65, 27.65,
  ])
  verify_multiple_reference_values(locator.tick_values(20.65, -21.35), [
    -28.35, -21.35, -14.35, -7.35, -0.35, 6.65, 13.65, 20.65, 27.65,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-21.35, 20.65),
    [-28.35, -21.35, -14.35, -7.35, -0.35, 6.65, 13.65, 20.65, 27.65],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-21.35, 20.65), [
    -21.35, 20.65,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(-21.35, 20.65), [
    -21.35, 20.65,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-21.35, 20.65), [
    -21.35, 20.65,
  ])
  verify_multiple_reference_limits(locator.nonsingular(-21.35, 20.65), [
    -21.35, 20.65,
  ])
}

///|
test "MultipleLocator original 86 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=7.0, offset=-0.35)
  assert_eq(locator.base(), 7.0)
  assert_eq(locator.offset(), -0.35)
  verify_multiple_reference_values(
    locator.tick_values(2.45, 17.849999999999998),
    [-0.35, 6.65, 13.65, 20.65],
  )
  verify_multiple_reference_values(
    locator.tick_values(17.849999999999998, 2.45),
    [-0.35, 6.65, 13.65, 20.65],
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(2.45, 17.849999999999998),
    [-0.35, 6.65, 13.65, 20.65],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(2.45, 17.849999999999998),
    [2.45, 17.849999999999998],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(
    locator.view_limits(2.45, 17.849999999999998),
    [-0.35, 20.65],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(2.45, 17.849999999999998),
    [2.45, 17.849999999999998],
  )
  verify_multiple_reference_limits(
    locator.nonsingular(2.45, 17.849999999999998),
    [2.45, 17.849999999999998],
  )
}

///|
test "MultipleLocator original 87 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=7.0, offset=-0.35)
  assert_eq(locator.base(), 7.0)
  assert_eq(locator.offset(), -0.35)
  verify_multiple_reference_values(locator.tick_values(13.65, 13.65), [
    6.65, 13.65, 20.65,
  ])
  verify_multiple_reference_values(locator.tick_values(13.65, 13.65), [
    6.65, 13.65, 20.65,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(13.65, 13.65),
    [6.65, 13.65, 20.65],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(13.65, 13.65), [
    13.63635, 13.66365,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(13.65, 13.65), [
    12.65, 14.65,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(13.65, 13.65), [
    13.63635, 13.66365,
  ])
  verify_multiple_reference_limits(locator.nonsingular(13.65, 13.65), [
    12.967500000000001, 14.3325,
  ])
}

///|
test "MultipleLocator original 88 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=7.0, offset=-0.35)
  assert_eq(locator.base(), 7.0)
  assert_eq(locator.offset(), -0.35)
  verify_multiple_reference_values(locator.tick_values(-14.35, -14.35), [
    -21.35, -14.35, -7.35,
  ])
  verify_multiple_reference_values(locator.tick_values(-14.35, -14.35), [
    -21.35, -14.35, -7.35,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-14.35, -14.35),
    [-21.35, -14.35, -7.35],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-14.35, -14.35), [
    -14.36435, -14.33565,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(-14.35, -14.35), [
    -15.35, -13.35,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-14.35, -14.35), [
    -14.36435, -14.33565,
  ])
  verify_multiple_reference_limits(locator.nonsingular(-14.35, -14.35), [
    -15.067499999999999, -13.6325,
  ])
}

///|
test "MultipleLocator original 89 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=7.0, offset=-0.35)
  assert_eq(locator.base(), 7.0)
  assert_eq(locator.offset(), -0.35)
  verify_multiple_reference_values(locator.tick_values(20.65, -7.35), [
    -14.35, -7.35, -0.35, 6.65, 13.65, 20.65, 27.65,
  ])
  verify_multiple_reference_values(locator.tick_values(-7.35, 20.65), [
    -14.35, -7.35, -0.35, 6.65, 13.65, 20.65, 27.65,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(20.65, -7.35),
    [27.65, 20.65, 13.65, 6.65, -0.35, -7.35, -14.35],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(20.65, -7.35), [
    -7.35, 20.65,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(20.65, -7.35), [
    -7.35, 20.65,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(20.65, -7.35), [
    -7.35, 20.65,
  ])
  verify_multiple_reference_limits(locator.nonsingular(20.65, -7.35), [
    -7.35, 20.65,
  ])
}

///|
test "MultipleLocator original 90 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=10.0, offset=0.0)
  assert_eq(locator.base(), 10.0)
  assert_eq(locator.offset(), 0.0)
  verify_multiple_reference_values(locator.tick_values(-30.0, 30.0), [
    -40.0, -30.0, -20.0, -10.0, 0.0, 10.0, 20.0, 30.0, 40.0,
  ])
  verify_multiple_reference_values(locator.tick_values(30.0, -30.0), [
    -40.0, -30.0, -20.0, -10.0, 0.0, 10.0, 20.0, 30.0, 40.0,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-30.0, 30.0),
    [-40.0, -30.0, -20.0, -10.0, 0.0, 10.0, 20.0, 30.0, 40.0],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-30.0, 30.0), [
    -30.0, 30.0,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(-30.0, 30.0), [
    -30.0, 30.0,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-30.0, 30.0), [
    -30.0, 30.0,
  ])
  verify_multiple_reference_limits(locator.nonsingular(-30.0, 30.0), [
    -30.0, 30.0,
  ])
}

///|
test "MultipleLocator original 91 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=10.0, offset=0.0)
  assert_eq(locator.base(), 10.0)
  assert_eq(locator.offset(), 0.0)
  verify_multiple_reference_values(locator.tick_values(4.0, 26.0), [
    0.0, 10.0, 20.0, 30.0,
  ])
  verify_multiple_reference_values(locator.tick_values(26.0, 4.0), [
    0.0, 10.0, 20.0, 30.0,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(4.0, 26.0),
    [0.0, 10.0, 20.0, 30.0],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(4.0, 26.0), [4.0, 26.0])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(4.0, 26.0), [0.0, 30.0])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(4.0, 26.0), [4.0, 26.0])
  verify_multiple_reference_limits(locator.nonsingular(4.0, 26.0), [4.0, 26.0])
}

///|
test "MultipleLocator original 92 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=10.0, offset=0.0)
  assert_eq(locator.base(), 10.0)
  assert_eq(locator.offset(), 0.0)
  verify_multiple_reference_values(locator.tick_values(20.0, 20.0), [
    10.0, 20.0, 30.0,
  ])
  verify_multiple_reference_values(locator.tick_values(20.0, 20.0), [
    10.0, 20.0, 30.0,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(20.0, 20.0),
    [10.0, 20.0, 30.0],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(20.0, 20.0), [
    19.98, 20.02,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(20.0, 20.0), [19.0, 21.0])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(20.0, 20.0), [
    19.98, 20.02,
  ])
  verify_multiple_reference_limits(locator.nonsingular(20.0, 20.0), [19.0, 21.0])
}

///|
test "MultipleLocator original 93 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=10.0, offset=0.0)
  assert_eq(locator.base(), 10.0)
  assert_eq(locator.offset(), 0.0)
  verify_multiple_reference_values(locator.tick_values(-20.0, -20.0), [
    -30.0, -20.0, -10.0,
  ])
  verify_multiple_reference_values(locator.tick_values(-20.0, -20.0), [
    -30.0, -20.0, -10.0,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-20.0, -20.0),
    [-30.0, -20.0, -10.0],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-20.0, -20.0), [
    -20.02, -19.98,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(-20.0, -20.0), [
    -21.0, -19.0,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-20.0, -20.0), [
    -20.02, -19.98,
  ])
  verify_multiple_reference_limits(locator.nonsingular(-20.0, -20.0), [
    -21.0, -19.0,
  ])
}

///|
test "MultipleLocator original 94 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=10.0, offset=0.0)
  assert_eq(locator.base(), 10.0)
  assert_eq(locator.offset(), 0.0)
  verify_multiple_reference_values(locator.tick_values(30.0, -10.0), [
    -20.0, -10.0, 0.0, 10.0, 20.0, 30.0, 40.0,
  ])
  verify_multiple_reference_values(locator.tick_values(-10.0, 30.0), [
    -20.0, -10.0, 0.0, 10.0, 20.0, 30.0, 40.0,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(30.0, -10.0),
    [40.0, 30.0, 20.0, 10.0, 0.0, -10.0, -20.0],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(30.0, -10.0), [
    -10.0, 30.0,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(30.0, -10.0), [
    -10.0, 30.0,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(30.0, -10.0), [
    -10.0, 30.0,
  ])
  verify_multiple_reference_limits(locator.nonsingular(30.0, -10.0), [
    -10.0, 30.0,
  ])
}

///|
test "MultipleLocator original 95 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=10.0, offset=0.1)
  assert_eq(locator.base(), 10.0)
  assert_eq(locator.offset(), 0.1)
  verify_multiple_reference_values(locator.tick_values(-29.9, 30.1), [
    -39.9, -29.9, -19.9, -9.9, 0.1, 10.1, 20.1, 30.1, 40.1,
  ])
  verify_multiple_reference_values(locator.tick_values(30.1, -29.9), [
    -39.9, -29.9, -19.9, -9.9, 0.1, 10.1, 20.1, 30.1, 40.1,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-29.9, 30.1),
    [-39.9, -29.9, -19.9, -9.9, 0.1, 10.1, 20.1, 30.1, 40.1],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-29.9, 30.1), [
    -29.9, 30.1,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(-29.9, 30.1), [
    -29.9, 30.1,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-29.9, 30.1), [
    -29.9, 30.1,
  ])
  verify_multiple_reference_limits(locator.nonsingular(-29.9, 30.1), [
    -29.9, 30.1,
  ])
}

///|
test "MultipleLocator original 96 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=10.0, offset=0.1)
  assert_eq(locator.base(), 10.0)
  assert_eq(locator.offset(), 0.1)
  verify_multiple_reference_values(locator.tick_values(4.1, 26.1), [
    0.1, 10.1, 20.1, 30.1,
  ])
  verify_multiple_reference_values(locator.tick_values(26.1, 4.1), [
    0.1, 10.1, 20.1, 30.1,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(4.1, 26.1),
    [0.1, 10.1, 20.1, 30.1],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(4.1, 26.1), [4.1, 26.1])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(4.1, 26.1), [0.1, 30.1])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(4.1, 26.1), [4.1, 26.1])
  verify_multiple_reference_limits(locator.nonsingular(4.1, 26.1), [4.1, 26.1])
}

///|
test "MultipleLocator original 97 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=10.0, offset=0.1)
  assert_eq(locator.base(), 10.0)
  assert_eq(locator.offset(), 0.1)
  verify_multiple_reference_values(locator.tick_values(20.1, 20.1), [
    10.1, 20.1, 30.1,
  ])
  verify_multiple_reference_values(locator.tick_values(20.1, 20.1), [
    10.1, 20.1, 30.1,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(20.1, 20.1),
    [10.1, 20.1, 30.1],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(20.1, 20.1), [
    20.079900000000002, 20.1201,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(20.1, 20.1), [19.1, 21.1])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(20.1, 20.1), [
    20.079900000000002, 20.1201,
  ])
  verify_multiple_reference_limits(locator.nonsingular(20.1, 20.1), [
    19.095000000000002, 21.105,
  ])
}

///|
test "MultipleLocator original 98 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=10.0, offset=0.1)
  assert_eq(locator.base(), 10.0)
  assert_eq(locator.offset(), 0.1)
  verify_multiple_reference_values(locator.tick_values(-19.9, -19.9), [
    -29.9, -19.9, -9.9,
  ])
  verify_multiple_reference_values(locator.tick_values(-19.9, -19.9), [
    -29.9, -19.9, -9.9,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-19.9, -19.9),
    [-29.9, -19.9, -9.9],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-19.9, -19.9), [
    -19.9199, -19.8801,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(-19.9, -19.9), [
    -20.9, -18.9,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-19.9, -19.9), [
    -19.9199, -19.8801,
  ])
  verify_multiple_reference_limits(locator.nonsingular(-19.9, -19.9), [
    -20.895, -18.904999999999998,
  ])
}

///|
test "MultipleLocator original 99 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=10.0, offset=0.1)
  assert_eq(locator.base(), 10.0)
  assert_eq(locator.offset(), 0.1)
  verify_multiple_reference_values(locator.tick_values(30.1, -9.9), [
    -19.9, -9.9, 0.1, 10.1, 20.1, 30.1, 40.1,
  ])
  verify_multiple_reference_values(locator.tick_values(-9.9, 30.1), [
    -19.9, -9.9, 0.1, 10.1, 20.1, 30.1, 40.1,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(30.1, -9.9),
    [40.1, 30.1, 20.1, 10.1, 0.1, -9.9, -19.9],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(30.1, -9.9), [-9.9, 30.1])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(30.1, -9.9), [-9.9, 30.1])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(30.1, -9.9), [-9.9, 30.1])
  verify_multiple_reference_limits(locator.nonsingular(30.1, -9.9), [-9.9, 30.1])
}

///|
test "MultipleLocator original 100 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=10.0, offset=-0.35)
  assert_eq(locator.base(), 10.0)
  assert_eq(locator.offset(), -0.35)
  verify_multiple_reference_values(locator.tick_values(-30.35, 29.65), [
    -40.35, -30.35, -20.35, -10.35, -0.35, 9.65, 19.65, 29.65, 39.65,
  ])
  verify_multiple_reference_values(locator.tick_values(29.65, -30.35), [
    -40.35, -30.35, -20.35, -10.35, -0.35, 9.65, 19.65, 29.65, 39.65,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-30.35, 29.65),
    [-40.35, -30.35, -20.35, -10.35, -0.35, 9.65, 19.65, 29.65, 39.65],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-30.35, 29.65), [
    -30.35, 29.65,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(-30.35, 29.65), [
    -30.35, 29.65,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-30.35, 29.65), [
    -30.35, 29.65,
  ])
  verify_multiple_reference_limits(locator.nonsingular(-30.35, 29.65), [
    -30.35, 29.65,
  ])
}

///|
test "MultipleLocator original 101 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=10.0, offset=-0.35)
  assert_eq(locator.base(), 10.0)
  assert_eq(locator.offset(), -0.35)
  verify_multiple_reference_values(locator.tick_values(3.65, 25.65), [
    -0.35, 9.65, 19.65, 29.65,
  ])
  verify_multiple_reference_values(locator.tick_values(25.65, 3.65), [
    -0.35, 9.65, 19.65, 29.65,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(3.65, 25.65),
    [-0.35, 9.65, 19.65, 29.65],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(3.65, 25.65), [
    3.65, 25.65,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(3.65, 25.65), [
    -0.35, 29.65,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(3.65, 25.65), [
    3.65, 25.65,
  ])
  verify_multiple_reference_limits(locator.nonsingular(3.65, 25.65), [
    3.65, 25.65,
  ])
}

///|
test "MultipleLocator original 102 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=10.0, offset=-0.35)
  assert_eq(locator.base(), 10.0)
  assert_eq(locator.offset(), -0.35)
  verify_multiple_reference_values(locator.tick_values(19.65, 19.65), [
    9.65, 19.65, 29.65,
  ])
  verify_multiple_reference_values(locator.tick_values(19.65, 19.65), [
    9.65, 19.65, 29.65,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(19.65, 19.65),
    [9.65, 19.65, 29.65],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(19.65, 19.65), [
    19.63035, 19.669649999999997,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(19.65, 19.65), [
    18.65, 20.65,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(19.65, 19.65), [
    19.63035, 19.669649999999997,
  ])
  verify_multiple_reference_limits(locator.nonsingular(19.65, 19.65), [
    18.667499999999997, 20.6325,
  ])
}

///|
test "MultipleLocator original 103 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=10.0, offset=-0.35)
  assert_eq(locator.base(), 10.0)
  assert_eq(locator.offset(), -0.35)
  verify_multiple_reference_values(locator.tick_values(-20.35, -20.35), [
    -30.35, -20.35, -10.35,
  ])
  verify_multiple_reference_values(locator.tick_values(-20.35, -20.35), [
    -30.35, -20.35, -10.35,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-20.35, -20.35),
    [-30.35, -20.35, -10.35],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-20.35, -20.35), [
    -20.370350000000002, -20.32965,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(-20.35, -20.35), [
    -21.35, -19.35,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-20.35, -20.35), [
    -20.370350000000002, -20.32965,
  ])
  verify_multiple_reference_limits(locator.nonsingular(-20.35, -20.35), [
    -21.3675, -19.332500000000003,
  ])
}

///|
test "MultipleLocator original 104 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=10.0, offset=-0.35)
  assert_eq(locator.base(), 10.0)
  assert_eq(locator.offset(), -0.35)
  verify_multiple_reference_values(locator.tick_values(29.65, -10.35), [
    -20.35, -10.35, -0.35, 9.65, 19.65, 29.65, 39.65,
  ])
  verify_multiple_reference_values(locator.tick_values(-10.35, 29.65), [
    -20.35, -10.35, -0.35, 9.65, 19.65, 29.65, 39.65,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(29.65, -10.35),
    [39.65, 29.65, 19.65, 9.65, -0.35, -10.35, -20.35],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(29.65, -10.35), [
    -10.35, 29.65,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(29.65, -10.35), [
    -10.35, 29.65,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(29.65, -10.35), [
    -10.35, 29.65,
  ])
  verify_multiple_reference_limits(locator.nonsingular(29.65, -10.35), [
    -10.35, 29.65,
  ])
}

///|
test "MultipleLocator original 105 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=1.0e-09, offset=0.0)
  assert_eq(locator.base(), 1.0e-09)
  assert_eq(locator.offset(), 0.0)
  verify_multiple_reference_values(
    locator.tick_values(-3.0000000000000004e-09, 3.0000000000000004e-09),
    [
      -4.0e-09, -3.0000000000000004e-09, -2.0e-09, -9.999999999999999e-10, 0.0, 9.999999999999999e-10,
      2.0000000000000005e-09, 3.0000000000000004e-09, 4.0e-09,
    ],
  )
  verify_multiple_reference_values(
    locator.tick_values(3.0000000000000004e-09, -3.0000000000000004e-09),
    [
      -4.0e-09, -3.0000000000000004e-09, -2.0e-09, -9.999999999999999e-10, 0.0, 9.999999999999999e-10,
      2.0000000000000005e-09, 3.0000000000000004e-09, 4.0e-09,
    ],
  )
  verify_multiple_reference_values(
    locator
    .as_locator()
    .tick_values(-3.0000000000000004e-09, 3.0000000000000004e-09),
    [
      -4.0e-09, -3.0000000000000004e-09, -2.0e-09, -9.999999999999999e-10, 0.0, 9.999999999999999e-10,
      2.0000000000000005e-09, 3.0000000000000004e-09, 4.0e-09,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(-3.0000000000000004e-09, 3.0000000000000004e-09),
    [-3.0000000000000004e-09, 3.0000000000000004e-09],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(
    locator.view_limits(-3.0000000000000004e-09, 3.0000000000000004e-09),
    [-3.0000000000000004e-09, 3.0000000000000004e-09],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(-3.0000000000000004e-09, 3.0000000000000004e-09),
    [-3.0000000000000004e-09, 3.0000000000000004e-09],
  )
  verify_multiple_reference_limits(
    locator.nonsingular(-3.0000000000000004e-09, 3.0000000000000004e-09),
    [-3.0000000000000004e-09, 3.0000000000000004e-09],
  )
}

///|
test "MultipleLocator original 106 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=1.0e-09, offset=0.0)
  assert_eq(locator.base(), 1.0e-09)
  assert_eq(locator.offset(), 0.0)
  verify_multiple_reference_values(
    locator.tick_values(4.0000000000000007e-10, 2.6e-09),
    [0.0, 1.0e-09, 2.0e-09, 3.0000000000000004e-09],
  )
  verify_multiple_reference_values(
    locator.tick_values(2.6e-09, 4.0000000000000007e-10),
    [0.0, 1.0e-09, 2.0e-09, 3.0000000000000004e-09],
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(4.0000000000000007e-10, 2.6e-09),
    [0.0, 1.0e-09, 2.0e-09, 3.0000000000000004e-09],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(4.0000000000000007e-10, 2.6e-09),
    [4.0000000000000007e-10, 2.6e-09],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(
    locator.view_limits(4.0000000000000007e-10, 2.6e-09),
    [0.0, 3.0000000000000004e-09],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(4.0000000000000007e-10, 2.6e-09),
    [4.0000000000000007e-10, 2.6e-09],
  )
  verify_multiple_reference_limits(
    locator.nonsingular(4.0000000000000007e-10, 2.6e-09),
    [4.0000000000000007e-10, 2.6e-09],
  )
}

///|
test "MultipleLocator original 107 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=1.0e-09, offset=0.0)
  assert_eq(locator.base(), 1.0e-09)
  assert_eq(locator.offset(), 0.0)
  verify_multiple_reference_values(locator.tick_values(2.0e-09, 2.0e-09), [
    1.0e-09, 2.0e-09, 3.0000000000000004e-09,
  ])
  verify_multiple_reference_values(locator.tick_values(2.0e-09, 2.0e-09), [
    1.0e-09, 2.0e-09, 3.0000000000000004e-09,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(2.0e-09, 2.0e-09),
    [1.0e-09, 2.0e-09, 3.0000000000000004e-09],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(2.0e-09, 2.0e-09), [
    1.998e-09, 2.0020000000000003e-09,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(2.0e-09, 2.0e-09), [
    -0.999999998, 1.000000002,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(2.0e-09, 2.0e-09), [
    1.998e-09, 2.0020000000000003e-09,
  ])
  verify_multiple_reference_limits(locator.nonsingular(2.0e-09, 2.0e-09), [
    1.9e-09, 2.1e-09,
  ])
}

///|
test "MultipleLocator original 108 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=1.0e-09, offset=0.0)
  assert_eq(locator.base(), 1.0e-09)
  assert_eq(locator.offset(), 0.0)
  verify_multiple_reference_values(locator.tick_values(-2.0e-09, -2.0e-09), [
    -3.0000000000000004e-09, -2.0000000000000005e-09, -1.0000000000000003e-09,
  ])
  verify_multiple_reference_values(locator.tick_values(-2.0e-09, -2.0e-09), [
    -3.0000000000000004e-09, -2.0000000000000005e-09, -1.0000000000000003e-09,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-2.0e-09, -2.0e-09),
    [-3.0000000000000004e-09, -2.0000000000000005e-09, -1.0000000000000003e-09],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-2.0e-09, -2.0e-09), [
    -2.0020000000000003e-09, -1.998e-09,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(-2.0e-09, -2.0e-09), [
    -1.000000002, 0.999999998,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-2.0e-09, -2.0e-09), [
    -2.0020000000000003e-09, -1.998e-09,
  ])
  verify_multiple_reference_limits(locator.nonsingular(-2.0e-09, -2.0e-09), [
    -2.1e-09, -1.9e-09,
  ])
}

///|
test "MultipleLocator original 109 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=1.0e-09, offset=0.0)
  assert_eq(locator.base(), 1.0e-09)
  assert_eq(locator.offset(), 0.0)
  verify_multiple_reference_values(
    locator.tick_values(3.0000000000000004e-09, -1.0e-09),
    [
      -2.0e-09, -1.0e-09, 0.0, 1.0000000000000003e-09, 2.0e-09, 3.0e-09, 4.000000000000001e-09,
    ],
  )
  verify_multiple_reference_values(
    locator.tick_values(-1.0e-09, 3.0000000000000004e-09),
    [
      -2.0e-09, -1.0e-09, 0.0, 1.0000000000000003e-09, 2.0e-09, 3.0e-09, 4.000000000000001e-09,
    ],
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(3.0000000000000004e-09, -1.0e-09),
    [
      4.000000000000001e-09, 3.0e-09, 2.0e-09, 1.0000000000000003e-09, 0.0, -1.0e-09,
      -2.0e-09,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(3.0000000000000004e-09, -1.0e-09),
    [-1.0e-09, 3.0000000000000004e-09],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(
    locator.view_limits(3.0000000000000004e-09, -1.0e-09),
    [-1.0e-09, 3.0000000000000004e-09],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(3.0000000000000004e-09, -1.0e-09),
    [-1.0e-09, 3.0000000000000004e-09],
  )
  verify_multiple_reference_limits(
    locator.nonsingular(3.0000000000000004e-09, -1.0e-09),
    [-1.0e-09, 3.0000000000000004e-09],
  )
}

///|
test "MultipleLocator original 110 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=1.0e-09, offset=0.1)
  assert_eq(locator.base(), 1.0e-09)
  assert_eq(locator.offset(), 0.1)
  verify_multiple_reference_values(
    locator.tick_values(0.09999999700000001, 0.100000003),
    [
      0.09999999700000001, 0.099999998, 0.099999999, 0.1, 0.100000001, 0.100000002,
      0.100000003, 0.100000004,
    ],
  )
  verify_multiple_reference_values(
    locator.tick_values(0.100000003, 0.09999999700000001),
    [
      0.09999999700000001, 0.099999998, 0.099999999, 0.1, 0.100000001, 0.100000002,
      0.100000003, 0.100000004,
    ],
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(0.09999999700000001, 0.100000003),
    [
      0.09999999700000001, 0.099999998, 0.099999999, 0.1, 0.100000001, 0.100000002,
      0.100000003, 0.100000004,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(0.09999999700000001, 0.100000003),
    [0.09999999700000001, 0.100000003],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(
    locator.view_limits(0.09999999700000001, 0.100000003),
    [0.09999999700000001, 0.100000003],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(0.09999999700000001, 0.100000003),
    [0.09999999700000001, 0.100000003],
  )
  verify_multiple_reference_limits(
    locator.nonsingular(0.09999999700000001, 0.100000003),
    [0.09999999700000001, 0.100000003],
  )
}

///|
test "MultipleLocator original 111 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=1.0e-09, offset=0.1)
  assert_eq(locator.base(), 1.0e-09)
  assert_eq(locator.offset(), 0.1)
  verify_multiple_reference_values(
    locator.tick_values(0.10000000040000001, 0.1000000026),
    [0.1, 0.100000001, 0.100000002, 0.100000003],
  )
  verify_multiple_reference_values(
    locator.tick_values(0.1000000026, 0.10000000040000001),
    [0.1, 0.100000001, 0.100000002, 0.100000003],
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(0.10000000040000001, 0.1000000026),
    [0.1, 0.100000001, 0.100000002, 0.100000003],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(0.10000000040000001, 0.1000000026),
    [0.10000000040000001, 0.1000000026],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(
    locator.view_limits(0.10000000040000001, 0.1000000026),
    [0.1, 0.100000003],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(0.10000000040000001, 0.1000000026),
    [0.10000000040000001, 0.1000000026],
  )
  verify_multiple_reference_limits(
    locator.nonsingular(0.10000000040000001, 0.1000000026),
    [0.10000000040000001, 0.1000000026],
  )
}

///|
test "MultipleLocator original 112 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=1.0e-09, offset=0.1)
  assert_eq(locator.base(), 1.0e-09)
  assert_eq(locator.offset(), 0.1)
  verify_multiple_reference_values(
    locator.tick_values(0.100000002, 0.100000002),
    [0.100000001, 0.100000002, 0.100000003],
  )
  verify_multiple_reference_values(
    locator.tick_values(0.100000002, 0.100000002),
    [0.100000001, 0.100000002, 0.100000003],
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(0.100000002, 0.100000002),
    [0.100000001, 0.100000002, 0.100000003],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(0.100000002, 0.100000002),
    [0.099900001998, 0.100100002002],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(
    locator.view_limits(0.100000002, 0.100000002),
    [0.100000001, 0.100000002],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(0.100000002, 0.100000002),
    [0.099900001998, 0.100100002002],
  )
  verify_multiple_reference_limits(
    locator.nonsingular(0.100000002, 0.100000002),
    [0.0950000019, 0.1050000021],
  )
}

///|
test "MultipleLocator original 113 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=1.0e-09, offset=0.1)
  assert_eq(locator.base(), 1.0e-09)
  assert_eq(locator.offset(), 0.1)
  verify_multiple_reference_values(
    locator.tick_values(0.099999998, 0.099999998),
    [0.099999998, 0.099999999],
  )
  verify_multiple_reference_values(
    locator.tick_values(0.099999998, 0.099999998),
    [0.099999998, 0.099999999],
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(0.099999998, 0.099999998),
    [0.099999998, 0.099999999],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(0.099999998, 0.099999998),
    [0.099899998002, 0.10009999799800001],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(
    locator.view_limits(0.099999998, 0.099999998),
    [0.099999998, 0.099999999],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(0.099999998, 0.099999998),
    [0.099899998002, 0.10009999799800001],
  )
  verify_multiple_reference_limits(
    locator.nonsingular(0.099999998, 0.099999998),
    [0.09499999810000001, 0.1049999979],
  )
}

///|
test "MultipleLocator original 114 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=1.0e-09, offset=0.1)
  assert_eq(locator.base(), 1.0e-09)
  assert_eq(locator.offset(), 0.1)
  verify_multiple_reference_values(
    locator.tick_values(0.100000003, 0.099999999),
    [0.099999999, 0.1, 0.100000001, 0.100000002, 0.100000003, 0.100000004],
  )
  verify_multiple_reference_values(
    locator.tick_values(0.099999999, 0.100000003),
    [0.099999999, 0.1, 0.100000001, 0.100000002, 0.100000003, 0.100000004],
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(0.100000003, 0.099999999),
    [0.100000004, 0.100000003, 0.100000002, 0.100000001, 0.1, 0.099999999],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(0.100000003, 0.099999999),
    [0.099999999, 0.100000003],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(
    locator.view_limits(0.100000003, 0.099999999),
    [0.1, 0.100000002],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(0.100000003, 0.099999999),
    [0.099999999, 0.100000003],
  )
  verify_multiple_reference_limits(
    locator.nonsingular(0.100000003, 0.099999999),
    [0.099999999, 0.100000003],
  )
}

///|
test "MultipleLocator original 115 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=1.0e-09, offset=-0.35)
  assert_eq(locator.base(), 1.0e-09)
  assert_eq(locator.offset(), -0.35)
  verify_multiple_reference_values(
    locator.tick_values(-0.350000003, -0.34999999699999995),
    [
      -0.350000004, -0.350000003, -0.350000002, -0.350000001, -0.35, -0.34999999899999995,
      -0.349999998, -0.34999999699999995, -0.349999996,
    ],
  )
  verify_multiple_reference_values(
    locator.tick_values(-0.34999999699999995, -0.350000003),
    [
      -0.350000004, -0.350000003, -0.350000002, -0.350000001, -0.35, -0.34999999899999995,
      -0.349999998, -0.34999999699999995, -0.349999996,
    ],
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-0.350000003, -0.34999999699999995),
    [
      -0.350000004, -0.350000003, -0.350000002, -0.350000001, -0.35, -0.34999999899999995,
      -0.349999998, -0.34999999699999995, -0.349999996,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(-0.350000003, -0.34999999699999995),
    [-0.350000003, -0.34999999699999995],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(
    locator.view_limits(-0.350000003, -0.34999999699999995),
    [-0.350000004, -0.349999996],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(-0.350000003, -0.34999999699999995),
    [-0.350000003, -0.34999999699999995],
  )
  verify_multiple_reference_limits(
    locator.nonsingular(-0.350000003, -0.34999999699999995),
    [-0.350000003, -0.34999999699999995],
  )
}

///|
test "MultipleLocator original 116 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=1.0e-09, offset=-0.35)
  assert_eq(locator.base(), 1.0e-09)
  assert_eq(locator.offset(), -0.35)
  verify_multiple_reference_values(
    locator.tick_values(-0.3499999996, -0.3499999974),
    [-0.35, -0.34999999899999995, -0.349999998, -0.34999999699999995],
  )
  verify_multiple_reference_values(
    locator.tick_values(-0.3499999974, -0.3499999996),
    [-0.35, -0.34999999899999995, -0.349999998, -0.34999999699999995],
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-0.3499999996, -0.3499999974),
    [-0.35, -0.34999999899999995, -0.349999998, -0.34999999699999995],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(-0.3499999996, -0.3499999974),
    [-0.3499999996, -0.3499999974],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(
    locator.view_limits(-0.3499999996, -0.3499999974),
    [-0.35, -0.34999999699999995],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(-0.3499999996, -0.3499999974),
    [-0.3499999996, -0.3499999974],
  )
  verify_multiple_reference_limits(
    locator.nonsingular(-0.3499999996, -0.3499999974),
    [-0.3499999996, -0.3499999974],
  )
}

///|
test "MultipleLocator original 117 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=1.0e-09, offset=-0.35)
  assert_eq(locator.base(), 1.0e-09)
  assert_eq(locator.offset(), -0.35)
  verify_multiple_reference_values(
    locator.tick_values(-0.349999998, -0.349999998),
    [-0.34999999899999995, -0.349999998, -0.34999999699999995],
  )
  verify_multiple_reference_values(
    locator.tick_values(-0.349999998, -0.349999998),
    [-0.34999999899999995, -0.349999998, -0.34999999699999995],
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-0.349999998, -0.349999998),
    [-0.34999999899999995, -0.349999998, -0.34999999699999995],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(-0.349999998, -0.349999998),
    [-0.350349997998, -0.349649998002],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(
    locator.view_limits(-0.349999998, -0.349999998),
    [-0.34999999899999995, -0.349999998],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(-0.349999998, -0.349999998),
    [-0.350349997998, -0.349649998002],
  )
  verify_multiple_reference_limits(
    locator.nonsingular(-0.349999998, -0.349999998),
    [-0.3674999979, -0.33249999809999997],
  )
}

///|
test "MultipleLocator original 118 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=1.0e-09, offset=-0.35)
  assert_eq(locator.base(), 1.0e-09)
  assert_eq(locator.offset(), -0.35)
  verify_multiple_reference_values(
    locator.tick_values(-0.350000002, -0.350000002),
    [-0.350000002, -0.350000001],
  )
  verify_multiple_reference_values(
    locator.tick_values(-0.350000002, -0.350000002),
    [-0.350000002, -0.350000001],
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-0.350000002, -0.350000002),
    [-0.350000002, -0.350000001],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(-0.350000002, -0.350000002),
    [-0.35035000200199995, -0.349650001998],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(
    locator.view_limits(-0.350000002, -0.350000002),
    [-0.350000002, -0.350000001],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(-0.350000002, -0.350000002),
    [-0.35035000200199995, -0.349650001998],
  )
  verify_multiple_reference_limits(
    locator.nonsingular(-0.350000002, -0.350000002),
    [-0.3675000021, -0.33250000189999995],
  )
}

///|
test "MultipleLocator original 119 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=1.0e-09, offset=-0.35)
  assert_eq(locator.base(), 1.0e-09)
  assert_eq(locator.offset(), -0.35)
  verify_multiple_reference_values(
    locator.tick_values(-0.34999999699999995, -0.350000001),
    [
      -0.350000002, -0.350000001, -0.35, -0.34999999899999995, -0.349999998, -0.34999999699999995,
      -0.349999996,
    ],
  )
  verify_multiple_reference_values(
    locator.tick_values(-0.350000001, -0.34999999699999995),
    [
      -0.350000002, -0.350000001, -0.35, -0.34999999899999995, -0.349999998, -0.34999999699999995,
      -0.349999996,
    ],
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-0.34999999699999995, -0.350000001),
    [
      -0.349999996, -0.34999999699999995, -0.349999998, -0.34999999899999995, -0.35,
      -0.350000001, -0.350000002,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(-0.34999999699999995, -0.350000001),
    [-0.350000001, -0.34999999699999995],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(
    locator.view_limits(-0.34999999699999995, -0.350000001),
    [-0.350000001, -0.34999999699999995],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(-0.34999999699999995, -0.350000001),
    [-0.350000001, -0.34999999699999995],
  )
  verify_multiple_reference_limits(
    locator.nonsingular(-0.34999999699999995, -0.350000001),
    [-0.350000001, -0.34999999699999995],
  )
}

///|
test "MultipleLocator original 120 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=1000000000.0, offset=0.0)
  assert_eq(locator.base(), 1000000000.0)
  assert_eq(locator.offset(), 0.0)
  verify_multiple_reference_values(
    locator.tick_values(-3000000000.0, 3000000000.0),
    [
      -4000000000.0, -3000000000.0, -2000000000.0, -1000000000.0, 0.0, 1000000000.0,
      2000000000.0, 3000000000.0, 4000000000.0,
    ],
  )
  verify_multiple_reference_values(
    locator.tick_values(3000000000.0, -3000000000.0),
    [
      -4000000000.0, -3000000000.0, -2000000000.0, -1000000000.0, 0.0, 1000000000.0,
      2000000000.0, 3000000000.0, 4000000000.0,
    ],
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-3000000000.0, 3000000000.0),
    [
      -4000000000.0, -3000000000.0, -2000000000.0, -1000000000.0, 0.0, 1000000000.0,
      2000000000.0, 3000000000.0, 4000000000.0,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(-3000000000.0, 3000000000.0),
    [-3000000000.0, 3000000000.0],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(
    locator.view_limits(-3000000000.0, 3000000000.0),
    [-3000000000.0, 3000000000.0],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(-3000000000.0, 3000000000.0),
    [-3000000000.0, 3000000000.0],
  )
  verify_multiple_reference_limits(
    locator.nonsingular(-3000000000.0, 3000000000.0),
    [-3000000000.0, 3000000000.0],
  )
}

///|
test "MultipleLocator original 121 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=1000000000.0, offset=0.0)
  assert_eq(locator.base(), 1000000000.0)
  assert_eq(locator.offset(), 0.0)
  verify_multiple_reference_values(
    locator.tick_values(400000000.0, 2600000000.0),
    [0.0, 1000000000.0, 2000000000.0, 3000000000.0],
  )
  verify_multiple_reference_values(
    locator.tick_values(2600000000.0, 400000000.0),
    [0.0, 1000000000.0, 2000000000.0, 3000000000.0],
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(400000000.0, 2600000000.0),
    [0.0, 1000000000.0, 2000000000.0, 3000000000.0],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(400000000.0, 2600000000.0),
    [400000000.0, 2600000000.0],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(
    locator.view_limits(400000000.0, 2600000000.0),
    [0.0, 3000000000.0],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(400000000.0, 2600000000.0),
    [400000000.0, 2600000000.0],
  )
  verify_multiple_reference_limits(
    locator.nonsingular(400000000.0, 2600000000.0),
    [400000000.0, 2600000000.0],
  )
}

///|
test "MultipleLocator original 122 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=1000000000.0, offset=0.0)
  assert_eq(locator.base(), 1000000000.0)
  assert_eq(locator.offset(), 0.0)
  verify_multiple_reference_values(
    locator.tick_values(2000000000.0, 2000000000.0),
    [1000000000.0, 2000000000.0, 3000000000.0],
  )
  verify_multiple_reference_values(
    locator.tick_values(2000000000.0, 2000000000.0),
    [1000000000.0, 2000000000.0, 3000000000.0],
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(2000000000.0, 2000000000.0),
    [1000000000.0, 2000000000.0, 3000000000.0],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(2000000000.0, 2000000000.0),
    [1998000000.0, 2002000000.0],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(
    locator.view_limits(2000000000.0, 2000000000.0),
    [1999999999.0, 2000000001.0],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(2000000000.0, 2000000000.0),
    [1998000000.0, 2002000000.0],
  )
  verify_multiple_reference_limits(
    locator.nonsingular(2000000000.0, 2000000000.0),
    [1900000000.0, 2100000000.0],
  )
}

///|
test "MultipleLocator original 123 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=1000000000.0, offset=0.0)
  assert_eq(locator.base(), 1000000000.0)
  assert_eq(locator.offset(), 0.0)
  verify_multiple_reference_values(
    locator.tick_values(-2000000000.0, -2000000000.0),
    [-3000000000.0, -2000000000.0, -1000000000.0],
  )
  verify_multiple_reference_values(
    locator.tick_values(-2000000000.0, -2000000000.0),
    [-3000000000.0, -2000000000.0, -1000000000.0],
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-2000000000.0, -2000000000.0),
    [-3000000000.0, -2000000000.0, -1000000000.0],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(-2000000000.0, -2000000000.0),
    [-2002000000.0, -1998000000.0],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(
    locator.view_limits(-2000000000.0, -2000000000.0),
    [-2000000001.0, -1999999999.0],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(-2000000000.0, -2000000000.0),
    [-2002000000.0, -1998000000.0],
  )
  verify_multiple_reference_limits(
    locator.nonsingular(-2000000000.0, -2000000000.0),
    [-2100000000.0, -1900000000.0],
  )
}

///|
test "MultipleLocator original 124 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=1000000000.0, offset=0.0)
  assert_eq(locator.base(), 1000000000.0)
  assert_eq(locator.offset(), 0.0)
  verify_multiple_reference_values(
    locator.tick_values(3000000000.0, -1000000000.0),
    [
      -2000000000.0, -1000000000.0, 0.0, 1000000000.0, 2000000000.0, 3000000000.0,
      4000000000.0,
    ],
  )
  verify_multiple_reference_values(
    locator.tick_values(-1000000000.0, 3000000000.0),
    [
      -2000000000.0, -1000000000.0, 0.0, 1000000000.0, 2000000000.0, 3000000000.0,
      4000000000.0,
    ],
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(3000000000.0, -1000000000.0),
    [
      4000000000.0, 3000000000.0, 2000000000.0, 1000000000.0, 0.0, -1000000000.0,
      -2000000000.0,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(3000000000.0, -1000000000.0),
    [-1000000000.0, 3000000000.0],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(
    locator.view_limits(3000000000.0, -1000000000.0),
    [-1000000000.0, 3000000000.0],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(3000000000.0, -1000000000.0),
    [-1000000000.0, 3000000000.0],
  )
  verify_multiple_reference_limits(
    locator.nonsingular(3000000000.0, -1000000000.0),
    [-1000000000.0, 3000000000.0],
  )
}

///|
test "MultipleLocator original 125 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=1000000000.0, offset=0.1)
  assert_eq(locator.base(), 1000000000.0)
  assert_eq(locator.offset(), 0.1)
  verify_multiple_reference_values(
    locator.tick_values(-2999999999.9, 3000000000.1),
    [
      -3999999999.9, -2999999999.9, -1999999999.9, -999999999.9, 0.1, 1000000000.1,
      2000000000.1, 3000000000.1, 4000000000.1,
    ],
  )
  verify_multiple_reference_values(
    locator.tick_values(3000000000.1, -2999999999.9),
    [
      -3999999999.9, -2999999999.9, -1999999999.9, -999999999.9, 0.1, 1000000000.1,
      2000000000.1, 3000000000.1, 4000000000.1,
    ],
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-2999999999.9, 3000000000.1),
    [
      -3999999999.9, -2999999999.9, -1999999999.9, -999999999.9, 0.1, 1000000000.1,
      2000000000.1, 3000000000.1, 4000000000.1,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(-2999999999.9, 3000000000.1),
    [-2999999999.9, 3000000000.1],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(
    locator.view_limits(-2999999999.9, 3000000000.1),
    [-2999999999.9, 3000000000.1],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(-2999999999.9, 3000000000.1),
    [-2999999999.9, 3000000000.1],
  )
  verify_multiple_reference_limits(
    locator.nonsingular(-2999999999.9, 3000000000.1),
    [-2999999999.9, 3000000000.1],
  )
}

///|
test "MultipleLocator original 126 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=1000000000.0, offset=0.1)
  assert_eq(locator.base(), 1000000000.0)
  assert_eq(locator.offset(), 0.1)
  verify_multiple_reference_values(
    locator.tick_values(400000000.1, 2600000000.1),
    [0.1, 1000000000.1, 2000000000.1, 3000000000.1],
  )
  verify_multiple_reference_values(
    locator.tick_values(2600000000.1, 400000000.1),
    [0.1, 1000000000.1, 2000000000.1, 3000000000.1],
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(400000000.1, 2600000000.1),
    [0.1, 1000000000.1, 2000000000.1, 3000000000.1],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(400000000.1, 2600000000.1),
    [400000000.1, 2600000000.1],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(
    locator.view_limits(400000000.1, 2600000000.1),
    [0.1, 3000000000.1],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(400000000.1, 2600000000.1),
    [400000000.1, 2600000000.1],
  )
  verify_multiple_reference_limits(
    locator.nonsingular(400000000.1, 2600000000.1),
    [400000000.1, 2600000000.1],
  )
}

///|
test "MultipleLocator original 127 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=1000000000.0, offset=0.1)
  assert_eq(locator.base(), 1000000000.0)
  assert_eq(locator.offset(), 0.1)
  verify_multiple_reference_values(
    locator.tick_values(2000000000.1, 2000000000.1),
    [1000000000.1, 2000000000.1, 3000000000.1],
  )
  verify_multiple_reference_values(
    locator.tick_values(2000000000.1, 2000000000.1),
    [1000000000.1, 2000000000.1, 3000000000.1],
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(2000000000.1, 2000000000.1),
    [1000000000.1, 2000000000.1, 3000000000.1],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(2000000000.1, 2000000000.1),
    [1998000000.0999, 2002000000.1000998],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(
    locator.view_limits(2000000000.1, 2000000000.1),
    [1999999999.1, 2000000001.1],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(2000000000.1, 2000000000.1),
    [1998000000.0999, 2002000000.1000998],
  )
  verify_multiple_reference_limits(
    locator.nonsingular(2000000000.1, 2000000000.1),
    [1900000000.0949998, 2100000000.105],
  )
}

///|
test "MultipleLocator original 128 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=1000000000.0, offset=0.1)
  assert_eq(locator.base(), 1000000000.0)
  assert_eq(locator.offset(), 0.1)
  verify_multiple_reference_values(
    locator.tick_values(-1999999999.9, -1999999999.9),
    [-2999999999.9, -1999999999.9, -999999999.9],
  )
  verify_multiple_reference_values(
    locator.tick_values(-1999999999.9, -1999999999.9),
    [-2999999999.9, -1999999999.9, -999999999.9],
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-1999999999.9, -1999999999.9),
    [-2999999999.9, -1999999999.9, -999999999.9],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(-1999999999.9, -1999999999.9),
    [-2001999999.8999002, -1997999999.9001],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(
    locator.view_limits(-1999999999.9, -1999999999.9),
    [-2000000000.9, -1999999998.9],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(-1999999999.9, -1999999999.9),
    [-2001999999.8999002, -1997999999.9001],
  )
  verify_multiple_reference_limits(
    locator.nonsingular(-1999999999.9, -1999999999.9),
    [-2099999999.895, -1899999999.9050002],
  )
}

///|
test "MultipleLocator original 129 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=1000000000.0, offset=0.1)
  assert_eq(locator.base(), 1000000000.0)
  assert_eq(locator.offset(), 0.1)
  verify_multiple_reference_values(
    locator.tick_values(3000000000.1, -999999999.9),
    [
      -1999999999.9, -999999999.9, 0.1, 1000000000.1, 2000000000.1, 3000000000.1,
      4000000000.1,
    ],
  )
  verify_multiple_reference_values(
    locator.tick_values(-999999999.9, 3000000000.1),
    [
      -1999999999.9, -999999999.9, 0.1, 1000000000.1, 2000000000.1, 3000000000.1,
      4000000000.1,
    ],
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(3000000000.1, -999999999.9),
    [
      4000000000.1, 3000000000.1, 2000000000.1, 1000000000.1, 0.1, -999999999.9,
      -1999999999.9,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(3000000000.1, -999999999.9),
    [-999999999.9, 3000000000.1],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(
    locator.view_limits(3000000000.1, -999999999.9),
    [-999999999.9, 3000000000.1],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(3000000000.1, -999999999.9),
    [-999999999.9, 3000000000.1],
  )
  verify_multiple_reference_limits(
    locator.nonsingular(3000000000.1, -999999999.9),
    [-999999999.9, 3000000000.1],
  )
}

///|
test "MultipleLocator original 130 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=1000000000.0, offset=-0.35)
  assert_eq(locator.base(), 1000000000.0)
  assert_eq(locator.offset(), -0.35)
  verify_multiple_reference_values(
    locator.tick_values(-3000000000.35, 2999999999.65),
    [
      -4000000000.35, -3000000000.35, -2000000000.35, -1000000000.35, -0.35, 999999999.65,
      1999999999.65, 2999999999.65, 3999999999.65,
    ],
  )
  verify_multiple_reference_values(
    locator.tick_values(2999999999.65, -3000000000.35),
    [
      -4000000000.35, -3000000000.35, -2000000000.35, -1000000000.35, -0.35, 999999999.65,
      1999999999.65, 2999999999.65, 3999999999.65,
    ],
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-3000000000.35, 2999999999.65),
    [
      -4000000000.35, -3000000000.35, -2000000000.35, -1000000000.35, -0.35, 999999999.65,
      1999999999.65, 2999999999.65, 3999999999.65,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(-3000000000.35, 2999999999.65),
    [-3000000000.35, 2999999999.65],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(
    locator.view_limits(-3000000000.35, 2999999999.65),
    [-3000000000.35, 2999999999.65],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(-3000000000.35, 2999999999.65),
    [-3000000000.35, 2999999999.65],
  )
  verify_multiple_reference_limits(
    locator.nonsingular(-3000000000.35, 2999999999.65),
    [-3000000000.35, 2999999999.65],
  )
}

///|
test "MultipleLocator original 131 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=1000000000.0, offset=-0.35)
  assert_eq(locator.base(), 1000000000.0)
  assert_eq(locator.offset(), -0.35)
  verify_multiple_reference_values(
    locator.tick_values(399999999.65, 2599999999.65),
    [-0.35, 999999999.65, 1999999999.65, 2999999999.65],
  )
  verify_multiple_reference_values(
    locator.tick_values(2599999999.65, 399999999.65),
    [-0.35, 999999999.65, 1999999999.65, 2999999999.65],
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(399999999.65, 2599999999.65),
    [-0.35, 999999999.65, 1999999999.65, 2999999999.65],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(399999999.65, 2599999999.65),
    [399999999.65, 2599999999.65],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(
    locator.view_limits(399999999.65, 2599999999.65),
    [-0.35, 2999999999.65],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(399999999.65, 2599999999.65),
    [399999999.65, 2599999999.65],
  )
  verify_multiple_reference_limits(
    locator.nonsingular(399999999.65, 2599999999.65),
    [399999999.65, 2599999999.65],
  )
}

///|
test "MultipleLocator original 132 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=1000000000.0, offset=-0.35)
  assert_eq(locator.base(), 1000000000.0)
  assert_eq(locator.offset(), -0.35)
  verify_multiple_reference_values(
    locator.tick_values(1999999999.65, 1999999999.65),
    [999999999.65, 1999999999.65, 2999999999.65],
  )
  verify_multiple_reference_values(
    locator.tick_values(1999999999.65, 1999999999.65),
    [999999999.65, 1999999999.65, 2999999999.65],
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(1999999999.65, 1999999999.65),
    [999999999.65, 1999999999.65, 2999999999.65],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(1999999999.65, 1999999999.65),
    [1997999999.65035, 2001999999.64965],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(
    locator.view_limits(1999999999.65, 1999999999.65),
    [1999999998.65, 2000000000.65],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(1999999999.65, 1999999999.65),
    [1997999999.65035, 2001999999.64965],
  )
  verify_multiple_reference_limits(
    locator.nonsingular(1999999999.65, 1999999999.65),
    [1899999999.6675, 2099999999.6325002],
  )
}

///|
test "MultipleLocator original 133 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=1000000000.0, offset=-0.35)
  assert_eq(locator.base(), 1000000000.0)
  assert_eq(locator.offset(), -0.35)
  verify_multiple_reference_values(
    locator.tick_values(-2000000000.35, -2000000000.35),
    [-3000000000.35, -2000000000.35, -1000000000.35],
  )
  verify_multiple_reference_values(
    locator.tick_values(-2000000000.35, -2000000000.35),
    [-3000000000.35, -2000000000.35, -1000000000.35],
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-2000000000.35, -2000000000.35),
    [-3000000000.35, -2000000000.35, -1000000000.35],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(-2000000000.35, -2000000000.35),
    [-2002000000.35035, -1998000000.34965],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(
    locator.view_limits(-2000000000.35, -2000000000.35),
    [-2000000001.35, -1999999999.35],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(-2000000000.35, -2000000000.35),
    [-2002000000.35035, -1998000000.34965],
  )
  verify_multiple_reference_limits(
    locator.nonsingular(-2000000000.35, -2000000000.35),
    [-2100000000.3674998, -1900000000.3325],
  )
}

///|
test "MultipleLocator original 134 fraction / offset / direction" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=1000000000.0, offset=-0.35)
  assert_eq(locator.base(), 1000000000.0)
  assert_eq(locator.offset(), -0.35)
  verify_multiple_reference_values(
    locator.tick_values(2999999999.65, -1000000000.35),
    [
      -2000000000.35, -1000000000.35, -0.35, 999999999.65, 1999999999.65, 2999999999.65,
      3999999999.65,
    ],
  )
  verify_multiple_reference_values(
    locator.tick_values(-1000000000.35, 2999999999.65),
    [
      -2000000000.35, -1000000000.35, -0.35, 999999999.65, 1999999999.65, 2999999999.65,
      3999999999.65,
    ],
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(2999999999.65, -1000000000.35),
    [
      3999999999.65, 2999999999.65, 1999999999.65, 999999999.65, -0.35, -1000000000.35,
      -2000000000.35,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(2999999999.65, -1000000000.35),
    [-1000000000.35, 2999999999.65],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(
    locator.view_limits(2999999999.65, -1000000000.35),
    [-1000000000.35, 2999999999.65],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(2999999999.65, -1000000000.35),
    [-1000000000.35, 2999999999.65],
  )
  verify_multiple_reference_limits(
    locator.nonsingular(2999999999.65, -1000000000.35),
    [-1000000000.35, 2999999999.65],
  )
}

///|
test "MultipleLocator original 135 ULP near multiple" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=0.1, offset=0.0)
  assert_eq(locator.base(), 0.1)
  assert_eq(locator.offset(), 0.0)
  verify_multiple_reference_values(locator.tick_values(0.3, 0.5), [
    0.20000000000000004, 0.30000000000000004, 0.4, 0.5000000000000001, 0.6000000000000001,
  ])
  verify_multiple_reference_values(locator.tick_values(0.5, 0.3), [
    0.20000000000000004, 0.30000000000000004, 0.4, 0.5000000000000001, 0.6000000000000001,
  ])
  verify_multiple_reference_values(locator.as_locator().tick_values(0.3, 0.5), [
    0.20000000000000004, 0.30000000000000004, 0.4, 0.5000000000000001, 0.6000000000000001,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(0.3, 0.5), [0.3, 0.5])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(0.3, 0.5), [
    0.30000000000000004, 0.5,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(0.3, 0.5), [0.3, 0.5])
  verify_multiple_reference_limits(locator.nonsingular(0.3, 0.5), [0.3, 0.5])
}

///|
test "MultipleLocator original 136 ULP near multiple" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=0.1, offset=0.0)
  assert_eq(locator.base(), 0.1)
  assert_eq(locator.offset(), 0.0)
  verify_multiple_reference_values(
    locator.tick_values(0.30000000000000004, 0.5),
    [
      0.20000000000000004, 0.30000000000000004, 0.4, 0.5000000000000001, 0.6000000000000001,
    ],
  )
  verify_multiple_reference_values(
    locator.tick_values(0.5, 0.30000000000000004),
    [
      0.20000000000000004, 0.30000000000000004, 0.4, 0.5000000000000001, 0.6000000000000001,
    ],
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(0.30000000000000004, 0.5),
    [
      0.20000000000000004, 0.30000000000000004, 0.4, 0.5000000000000001, 0.6000000000000001,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(0.30000000000000004, 0.5),
    [0.30000000000000004, 0.5],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(
    locator.view_limits(0.30000000000000004, 0.5),
    [0.30000000000000004, 0.5],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(0.30000000000000004, 0.5),
    [0.30000000000000004, 0.5],
  )
  verify_multiple_reference_limits(
    locator.nonsingular(0.30000000000000004, 0.5),
    [0.30000000000000004, 0.5],
  )
}

///|
test "MultipleLocator original 137 ULP near multiple" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=0.1, offset=0.0)
  assert_eq(locator.base(), 0.1)
  assert_eq(locator.offset(), 0.0)
  verify_multiple_reference_values(
    locator.tick_values(0.3000000000000001, 0.5),
    [
      0.20000000000000004, 0.30000000000000004, 0.4, 0.5000000000000001, 0.6000000000000001,
    ],
  )
  verify_multiple_reference_values(
    locator.tick_values(0.5, 0.3000000000000001),
    [
      0.20000000000000004, 0.30000000000000004, 0.4, 0.5000000000000001, 0.6000000000000001,
    ],
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(0.3000000000000001, 0.5),
    [
      0.20000000000000004, 0.30000000000000004, 0.4, 0.5000000000000001, 0.6000000000000001,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(0.3000000000000001, 0.5),
    [0.3000000000000001, 0.5],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(
    locator.view_limits(0.3000000000000001, 0.5),
    [0.30000000000000004, 0.5],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(0.3000000000000001, 0.5),
    [0.3000000000000001, 0.5],
  )
  verify_multiple_reference_limits(
    locator.nonsingular(0.3000000000000001, 0.5),
    [0.3000000000000001, 0.5],
  )
}

///|
test "MultipleLocator original 138 ULP near multiple" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=0.1, offset=1000000.0)
  assert_eq(locator.base(), 0.1)
  assert_eq(locator.offset(), 1000000.0)
  verify_multiple_reference_values(
    locator.tick_values(1000000.2999999999, 1000000.5),
    [1000000.2, 1000000.3, 1000000.4, 1000000.5, 1000000.6],
  )
  verify_multiple_reference_values(
    locator.tick_values(1000000.5, 1000000.2999999999),
    [1000000.2, 1000000.3, 1000000.4, 1000000.5, 1000000.6],
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(1000000.2999999999, 1000000.5),
    [1000000.2, 1000000.3, 1000000.4, 1000000.5, 1000000.6],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(1000000.2999999999, 1000000.5),
    [1000000.2999999999, 1000000.5],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(
    locator.view_limits(1000000.2999999999, 1000000.5),
    [1000000.2, 1000000.5],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(1000000.2999999999, 1000000.5),
    [1000000.2999999999, 1000000.5],
  )
  verify_multiple_reference_limits(
    locator.nonsingular(1000000.2999999999, 1000000.5),
    [1000000.2999999999, 1000000.5],
  )
}

///|
test "MultipleLocator original 139 ULP near multiple" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=0.1, offset=1000000.0)
  assert_eq(locator.base(), 0.1)
  assert_eq(locator.offset(), 1000000.0)
  verify_multiple_reference_values(locator.tick_values(1000000.3, 1000000.5), [
    1000000.3, 1000000.4, 1000000.5, 1000000.6,
  ])
  verify_multiple_reference_values(locator.tick_values(1000000.5, 1000000.3), [
    1000000.3, 1000000.4, 1000000.5, 1000000.6,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(1000000.3, 1000000.5),
    [1000000.3, 1000000.4, 1000000.5, 1000000.6],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(1000000.3, 1000000.5), [
    1000000.3, 1000000.5,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(1000000.3, 1000000.5), [
    1000000.3, 1000000.5,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(1000000.3, 1000000.5), [
    1000000.3, 1000000.5,
  ])
  verify_multiple_reference_limits(locator.nonsingular(1000000.3, 1000000.5), [
    1000000.3, 1000000.5,
  ])
}

///|
test "MultipleLocator original 140 ULP near multiple" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=0.1, offset=1000000.0)
  assert_eq(locator.base(), 0.1)
  assert_eq(locator.offset(), 1000000.0)
  verify_multiple_reference_values(
    locator.tick_values(1000000.3000000002, 1000000.5),
    [1000000.3, 1000000.4, 1000000.5, 1000000.6],
  )
  verify_multiple_reference_values(
    locator.tick_values(1000000.5, 1000000.3000000002),
    [1000000.3, 1000000.4, 1000000.5, 1000000.6],
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(1000000.3000000002, 1000000.5),
    [1000000.3, 1000000.4, 1000000.5, 1000000.6],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(1000000.3000000002, 1000000.5),
    [1000000.3000000002, 1000000.5],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(
    locator.view_limits(1000000.3000000002, 1000000.5),
    [1000000.3, 1000000.5],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(1000000.3000000002, 1000000.5),
    [1000000.3000000002, 1000000.5],
  )
  verify_multiple_reference_limits(
    locator.nonsingular(1000000.3000000002, 1000000.5),
    [1000000.3000000002, 1000000.5],
  )
}

///|
test "MultipleLocator original 141 ULP near multiple" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=0.1, offset=-1000000.0)
  assert_eq(locator.base(), 0.1)
  assert_eq(locator.offset(), -1000000.0)
  verify_multiple_reference_values(
    locator.tick_values(-999999.7000000001, -999999.5),
    [-999999.8, -999999.7, -999999.6, -999999.5, -999999.4],
  )
  verify_multiple_reference_values(
    locator.tick_values(-999999.5, -999999.7000000001),
    [-999999.8, -999999.7, -999999.6, -999999.5, -999999.4],
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-999999.7000000001, -999999.5),
    [-999999.8, -999999.7, -999999.6, -999999.5, -999999.4],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(-999999.7000000001, -999999.5),
    [-999999.7000000001, -999999.5],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(
    locator.view_limits(-999999.7000000001, -999999.5),
    [-999999.8, -999999.5],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(-999999.7000000001, -999999.5),
    [-999999.7000000001, -999999.5],
  )
  verify_multiple_reference_limits(
    locator.nonsingular(-999999.7000000001, -999999.5),
    [-999999.7000000001, -999999.5],
  )
}

///|
test "MultipleLocator original 142 ULP near multiple" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=0.1, offset=-1000000.0)
  assert_eq(locator.base(), 0.1)
  assert_eq(locator.offset(), -1000000.0)
  verify_multiple_reference_values(locator.tick_values(-999999.7, -999999.5), [
    -999999.7, -999999.6, -999999.5, -999999.4,
  ])
  verify_multiple_reference_values(locator.tick_values(-999999.5, -999999.7), [
    -999999.7, -999999.6, -999999.5, -999999.4,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-999999.7, -999999.5),
    [-999999.7, -999999.6, -999999.5, -999999.4],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-999999.7, -999999.5), [
    -999999.7, -999999.5,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(-999999.7, -999999.5), [
    -999999.7, -999999.5,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-999999.7, -999999.5), [
    -999999.7, -999999.5,
  ])
  verify_multiple_reference_limits(locator.nonsingular(-999999.7, -999999.5), [
    -999999.7, -999999.5,
  ])
}

///|
test "MultipleLocator original 143 ULP near multiple" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=0.1, offset=-1000000.0)
  assert_eq(locator.base(), 0.1)
  assert_eq(locator.offset(), -1000000.0)
  verify_multiple_reference_values(
    locator.tick_values(-999999.6999999998, -999999.5),
    [-999999.7, -999999.6, -999999.5, -999999.4],
  )
  verify_multiple_reference_values(
    locator.tick_values(-999999.5, -999999.6999999998),
    [-999999.7, -999999.6, -999999.5, -999999.4],
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-999999.6999999998, -999999.5),
    [-999999.7, -999999.6, -999999.5, -999999.4],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(-999999.6999999998, -999999.5),
    [-999999.6999999998, -999999.5],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(
    locator.view_limits(-999999.6999999998, -999999.5),
    [-999999.7, -999999.5],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(-999999.6999999998, -999999.5),
    [-999999.6999999998, -999999.5],
  )
  verify_multiple_reference_limits(
    locator.nonsingular(-999999.6999999998, -999999.5),
    [-999999.6999999998, -999999.5],
  )
}

///|
test "MultipleLocator original 144 ULP near multiple" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=0.3, offset=0.0)
  assert_eq(locator.base(), 0.3)
  assert_eq(locator.offset(), 0.0)
  verify_multiple_reference_values(
    locator.tick_values(0.8999999999999998, 1.5),
    [
      0.5999999999999999, 0.8999999999999999, 1.1999999999999997, 1.4999999999999998,
      1.7999999999999998,
    ],
  )
  verify_multiple_reference_values(
    locator.tick_values(1.5, 0.8999999999999998),
    [
      0.5999999999999999, 0.8999999999999999, 1.1999999999999997, 1.4999999999999998,
      1.7999999999999998,
    ],
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(0.8999999999999998, 1.5),
    [
      0.5999999999999999, 0.8999999999999999, 1.1999999999999997, 1.4999999999999998,
      1.7999999999999998,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(0.8999999999999998, 1.5),
    [0.8999999999999998, 1.5],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(
    locator.view_limits(0.8999999999999998, 1.5),
    [0.8999999999999999, 1.5],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(0.8999999999999998, 1.5),
    [0.8999999999999998, 1.5],
  )
  verify_multiple_reference_limits(
    locator.nonsingular(0.8999999999999998, 1.5),
    [0.8999999999999998, 1.5],
  )
}

///|
test "MultipleLocator original 145 ULP near multiple" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=0.3, offset=0.0)
  assert_eq(locator.base(), 0.3)
  assert_eq(locator.offset(), 0.0)
  verify_multiple_reference_values(
    locator.tick_values(0.8999999999999999, 1.5),
    [
      0.5999999999999999, 0.8999999999999999, 1.1999999999999997, 1.4999999999999998,
      1.7999999999999998,
    ],
  )
  verify_multiple_reference_values(
    locator.tick_values(1.5, 0.8999999999999999),
    [
      0.5999999999999999, 0.8999999999999999, 1.1999999999999997, 1.4999999999999998,
      1.7999999999999998,
    ],
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(0.8999999999999999, 1.5),
    [
      0.5999999999999999, 0.8999999999999999, 1.1999999999999997, 1.4999999999999998,
      1.7999999999999998,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(0.8999999999999999, 1.5),
    [0.8999999999999999, 1.5],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(
    locator.view_limits(0.8999999999999999, 1.5),
    [0.8999999999999999, 1.5],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(0.8999999999999999, 1.5),
    [0.8999999999999999, 1.5],
  )
  verify_multiple_reference_limits(
    locator.nonsingular(0.8999999999999999, 1.5),
    [0.8999999999999999, 1.5],
  )
}

///|
test "MultipleLocator original 146 ULP near multiple" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=0.3, offset=0.0)
  assert_eq(locator.base(), 0.3)
  assert_eq(locator.offset(), 0.0)
  verify_multiple_reference_values(locator.tick_values(0.9, 1.5), [
    0.5999999999999999, 0.8999999999999999, 1.1999999999999997, 1.4999999999999998,
    1.7999999999999998,
  ])
  verify_multiple_reference_values(locator.tick_values(1.5, 0.9), [
    0.5999999999999999, 0.8999999999999999, 1.1999999999999997, 1.4999999999999998,
    1.7999999999999998,
  ])
  verify_multiple_reference_values(locator.as_locator().tick_values(0.9, 1.5), [
    0.5999999999999999, 0.8999999999999999, 1.1999999999999997, 1.4999999999999998,
    1.7999999999999998,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(0.9, 1.5), [0.9, 1.5])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(0.9, 1.5), [
    0.8999999999999999, 1.5,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(0.9, 1.5), [0.9, 1.5])
  verify_multiple_reference_limits(locator.nonsingular(0.9, 1.5), [0.9, 1.5])
}

///|
test "MultipleLocator original 147 ULP near multiple" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=0.3, offset=1000000.0)
  assert_eq(locator.base(), 0.3)
  assert_eq(locator.offset(), 1000000.0)
  verify_multiple_reference_values(
    locator.tick_values(1000000.8999999999, 1000001.5),
    [1000000.6, 1000000.9, 1000001.2, 1000001.5, 1000001.8],
  )
  verify_multiple_reference_values(
    locator.tick_values(1000001.5, 1000000.8999999999),
    [1000000.6, 1000000.9, 1000001.2, 1000001.5, 1000001.8],
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(1000000.8999999999, 1000001.5),
    [1000000.6, 1000000.9, 1000001.2, 1000001.5, 1000001.8],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(1000000.8999999999, 1000001.5),
    [1000000.8999999999, 1000001.5],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(
    locator.view_limits(1000000.8999999999, 1000001.5),
    [1000000.6, 1000001.5],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(1000000.8999999999, 1000001.5),
    [1000000.8999999999, 1000001.5],
  )
  verify_multiple_reference_limits(
    locator.nonsingular(1000000.8999999999, 1000001.5),
    [1000000.8999999999, 1000001.5],
  )
}

///|
test "MultipleLocator original 148 ULP near multiple" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=0.3, offset=1000000.0)
  assert_eq(locator.base(), 0.3)
  assert_eq(locator.offset(), 1000000.0)
  verify_multiple_reference_values(locator.tick_values(1000000.9, 1000001.5), [
    1000000.6, 1000000.9, 1000001.2, 1000001.5, 1000001.8,
  ])
  verify_multiple_reference_values(locator.tick_values(1000001.5, 1000000.9), [
    1000000.6, 1000000.9, 1000001.2, 1000001.5, 1000001.8,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(1000000.9, 1000001.5),
    [1000000.6, 1000000.9, 1000001.2, 1000001.5, 1000001.8],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(1000000.9, 1000001.5), [
    1000000.9, 1000001.5,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(1000000.9, 1000001.5), [
    1000000.9, 1000001.5,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(1000000.9, 1000001.5), [
    1000000.9, 1000001.5,
  ])
  verify_multiple_reference_limits(locator.nonsingular(1000000.9, 1000001.5), [
    1000000.9, 1000001.5,
  ])
}

///|
test "MultipleLocator original 149 ULP near multiple" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=0.3, offset=1000000.0)
  assert_eq(locator.base(), 0.3)
  assert_eq(locator.offset(), 1000000.0)
  verify_multiple_reference_values(
    locator.tick_values(1000000.9000000001, 1000001.5),
    [1000000.9, 1000001.2, 1000001.5, 1000001.8],
  )
  verify_multiple_reference_values(
    locator.tick_values(1000001.5, 1000000.9000000001),
    [1000000.9, 1000001.2, 1000001.5, 1000001.8],
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(1000000.9000000001, 1000001.5),
    [1000000.9, 1000001.2, 1000001.5, 1000001.8],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(1000000.9000000001, 1000001.5),
    [1000000.9000000001, 1000001.5],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(
    locator.view_limits(1000000.9000000001, 1000001.5),
    [1000000.9, 1000001.5],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(1000000.9000000001, 1000001.5),
    [1000000.9000000001, 1000001.5],
  )
  verify_multiple_reference_limits(
    locator.nonsingular(1000000.9000000001, 1000001.5),
    [1000000.9000000001, 1000001.5],
  )
}

///|
test "MultipleLocator original 150 ULP near multiple" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=0.3, offset=-1000000.0)
  assert_eq(locator.base(), 0.3)
  assert_eq(locator.offset(), -1000000.0)
  verify_multiple_reference_values(
    locator.tick_values(-999999.1000000001, -999998.5),
    [-999999.4, -999999.1, -999998.8, -999998.5, -999998.2],
  )
  verify_multiple_reference_values(
    locator.tick_values(-999998.5, -999999.1000000001),
    [-999999.4, -999999.1, -999998.8, -999998.5, -999998.2],
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-999999.1000000001, -999998.5),
    [-999999.4, -999999.1, -999998.8, -999998.5, -999998.2],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(-999999.1000000001, -999998.5),
    [-999999.1000000001, -999998.5],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(
    locator.view_limits(-999999.1000000001, -999998.5),
    [-999999.4, -999998.5],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(-999999.1000000001, -999998.5),
    [-999999.1000000001, -999998.5],
  )
  verify_multiple_reference_limits(
    locator.nonsingular(-999999.1000000001, -999998.5),
    [-999999.1000000001, -999998.5],
  )
}

///|
test "MultipleLocator original 151 ULP near multiple" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=0.3, offset=-1000000.0)
  assert_eq(locator.base(), 0.3)
  assert_eq(locator.offset(), -1000000.0)
  verify_multiple_reference_values(locator.tick_values(-999999.1, -999998.5), [
    -999999.4, -999999.1, -999998.8, -999998.5, -999998.2,
  ])
  verify_multiple_reference_values(locator.tick_values(-999998.5, -999999.1), [
    -999999.4, -999999.1, -999998.8, -999998.5, -999998.2,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-999999.1, -999998.5),
    [-999999.4, -999999.1, -999998.8, -999998.5, -999998.2],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-999999.1, -999998.5), [
    -999999.1, -999998.5,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(-999999.1, -999998.5), [
    -999999.1, -999998.5,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-999999.1, -999998.5), [
    -999999.1, -999998.5,
  ])
  verify_multiple_reference_limits(locator.nonsingular(-999999.1, -999998.5), [
    -999999.1, -999998.5,
  ])
}

///|
test "MultipleLocator original 152 ULP near multiple" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=0.3, offset=-1000000.0)
  assert_eq(locator.base(), 0.3)
  assert_eq(locator.offset(), -1000000.0)
  verify_multiple_reference_values(
    locator.tick_values(-999999.0999999999, -999998.5),
    [-999999.1, -999998.8, -999998.5, -999998.2],
  )
  verify_multiple_reference_values(
    locator.tick_values(-999998.5, -999999.0999999999),
    [-999999.1, -999998.8, -999998.5, -999998.2],
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-999999.0999999999, -999998.5),
    [-999999.1, -999998.8, -999998.5, -999998.2],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(-999999.0999999999, -999998.5),
    [-999999.0999999999, -999998.5],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(
    locator.view_limits(-999999.0999999999, -999998.5),
    [-999999.1, -999998.5],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(-999999.0999999999, -999998.5),
    [-999999.0999999999, -999998.5],
  )
  verify_multiple_reference_limits(
    locator.nonsingular(-999999.0999999999, -999998.5),
    [-999999.0999999999, -999998.5],
  )
}

///|
test "MultipleLocator original 153 ULP near multiple" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=7.0, offset=0.0)
  assert_eq(locator.base(), 7.0)
  assert_eq(locator.offset(), 0.0)
  verify_multiple_reference_values(
    locator.tick_values(20.999999999999996, 35.0),
    [14.0, 21.0, 28.0, 35.0, 42.0],
  )
  verify_multiple_reference_values(
    locator.tick_values(35.0, 20.999999999999996),
    [14.0, 21.0, 28.0, 35.0, 42.0],
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(20.999999999999996, 35.0),
    [14.0, 21.0, 28.0, 35.0, 42.0],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(20.999999999999996, 35.0),
    [20.999999999999996, 35.0],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(
    locator.view_limits(20.999999999999996, 35.0),
    [21.0, 35.0],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(20.999999999999996, 35.0),
    [20.999999999999996, 35.0],
  )
  verify_multiple_reference_limits(
    locator.nonsingular(20.999999999999996, 35.0),
    [20.999999999999996, 35.0],
  )
}

///|
test "MultipleLocator original 154 ULP near multiple" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=7.0, offset=0.0)
  assert_eq(locator.base(), 7.0)
  assert_eq(locator.offset(), 0.0)
  verify_multiple_reference_values(locator.tick_values(21.0, 35.0), [
    14.0, 21.0, 28.0, 35.0, 42.0,
  ])
  verify_multiple_reference_values(locator.tick_values(35.0, 21.0), [
    14.0, 21.0, 28.0, 35.0, 42.0,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(21.0, 35.0),
    [14.0, 21.0, 28.0, 35.0, 42.0],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(21.0, 35.0), [21.0, 35.0])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(21.0, 35.0), [21.0, 35.0])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(21.0, 35.0), [21.0, 35.0])
  verify_multiple_reference_limits(locator.nonsingular(21.0, 35.0), [21.0, 35.0])
}

///|
test "MultipleLocator original 155 ULP near multiple" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=7.0, offset=0.0)
  assert_eq(locator.base(), 7.0)
  assert_eq(locator.offset(), 0.0)
  verify_multiple_reference_values(
    locator.tick_values(21.000000000000004, 35.0),
    [14.0, 21.0, 28.0, 35.0, 42.0],
  )
  verify_multiple_reference_values(
    locator.tick_values(35.0, 21.000000000000004),
    [14.0, 21.0, 28.0, 35.0, 42.0],
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(21.000000000000004, 35.0),
    [14.0, 21.0, 28.0, 35.0, 42.0],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(21.000000000000004, 35.0),
    [21.000000000000004, 35.0],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(
    locator.view_limits(21.000000000000004, 35.0),
    [21.0, 35.0],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(21.000000000000004, 35.0),
    [21.000000000000004, 35.0],
  )
  verify_multiple_reference_limits(
    locator.nonsingular(21.000000000000004, 35.0),
    [21.000000000000004, 35.0],
  )
}

///|
test "MultipleLocator original 156 ULP near multiple" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=7.0, offset=1000000.0)
  assert_eq(locator.base(), 7.0)
  assert_eq(locator.offset(), 1000000.0)
  verify_multiple_reference_values(
    locator.tick_values(1000020.9999999999, 1000035.0),
    [1000014.0, 1000021.0, 1000028.0, 1000035.0, 1000042.0],
  )
  verify_multiple_reference_values(
    locator.tick_values(1000035.0, 1000020.9999999999),
    [1000014.0, 1000021.0, 1000028.0, 1000035.0, 1000042.0],
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(1000020.9999999999, 1000035.0),
    [1000014.0, 1000021.0, 1000028.0, 1000035.0, 1000042.0],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(1000020.9999999999, 1000035.0),
    [1000020.9999999999, 1000035.0],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(
    locator.view_limits(1000020.9999999999, 1000035.0),
    [1000021.0, 1000035.0],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(1000020.9999999999, 1000035.0),
    [1000020.9999999999, 1000035.0],
  )
  verify_multiple_reference_limits(
    locator.nonsingular(1000020.9999999999, 1000035.0),
    [1000020.9999999999, 1000035.0],
  )
}

///|
test "MultipleLocator original 157 ULP near multiple" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=7.0, offset=1000000.0)
  assert_eq(locator.base(), 7.0)
  assert_eq(locator.offset(), 1000000.0)
  verify_multiple_reference_values(locator.tick_values(1000021.0, 1000035.0), [
    1000014.0, 1000021.0, 1000028.0, 1000035.0, 1000042.0,
  ])
  verify_multiple_reference_values(locator.tick_values(1000035.0, 1000021.0), [
    1000014.0, 1000021.0, 1000028.0, 1000035.0, 1000042.0,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(1000021.0, 1000035.0),
    [1000014.0, 1000021.0, 1000028.0, 1000035.0, 1000042.0],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(1000021.0, 1000035.0), [
    1000021.0, 1000035.0,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(1000021.0, 1000035.0), [
    1000021.0, 1000035.0,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(1000021.0, 1000035.0), [
    1000021.0, 1000035.0,
  ])
  verify_multiple_reference_limits(locator.nonsingular(1000021.0, 1000035.0), [
    1000021.0, 1000035.0,
  ])
}

///|
test "MultipleLocator original 158 ULP near multiple" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=7.0, offset=1000000.0)
  assert_eq(locator.base(), 7.0)
  assert_eq(locator.offset(), 1000000.0)
  verify_multiple_reference_values(
    locator.tick_values(1000021.0000000001, 1000035.0),
    [1000014.0, 1000021.0, 1000028.0, 1000035.0, 1000042.0],
  )
  verify_multiple_reference_values(
    locator.tick_values(1000035.0, 1000021.0000000001),
    [1000014.0, 1000021.0, 1000028.0, 1000035.0, 1000042.0],
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(1000021.0000000001, 1000035.0),
    [1000014.0, 1000021.0, 1000028.0, 1000035.0, 1000042.0],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(1000021.0000000001, 1000035.0),
    [1000021.0000000001, 1000035.0],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(
    locator.view_limits(1000021.0000000001, 1000035.0),
    [1000021.0, 1000035.0],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(1000021.0000000001, 1000035.0),
    [1000021.0000000001, 1000035.0],
  )
  verify_multiple_reference_limits(
    locator.nonsingular(1000021.0000000001, 1000035.0),
    [1000021.0000000001, 1000035.0],
  )
}

///|
test "MultipleLocator original 159 ULP near multiple" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=7.0, offset=-1000000.0)
  assert_eq(locator.base(), 7.0)
  assert_eq(locator.offset(), -1000000.0)
  verify_multiple_reference_values(
    locator.tick_values(-999979.0000000001, -999965.0),
    [-999986.0, -999979.0, -999972.0, -999965.0, -999958.0],
  )
  verify_multiple_reference_values(
    locator.tick_values(-999965.0, -999979.0000000001),
    [-999986.0, -999979.0, -999972.0, -999965.0, -999958.0],
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-999979.0000000001, -999965.0),
    [-999986.0, -999979.0, -999972.0, -999965.0, -999958.0],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(-999979.0000000001, -999965.0),
    [-999979.0000000001, -999965.0],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(
    locator.view_limits(-999979.0000000001, -999965.0),
    [-999979.0, -999965.0],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(-999979.0000000001, -999965.0),
    [-999979.0000000001, -999965.0],
  )
  verify_multiple_reference_limits(
    locator.nonsingular(-999979.0000000001, -999965.0),
    [-999979.0000000001, -999965.0],
  )
}

///|
test "MultipleLocator original 160 ULP near multiple" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=7.0, offset=-1000000.0)
  assert_eq(locator.base(), 7.0)
  assert_eq(locator.offset(), -1000000.0)
  verify_multiple_reference_values(locator.tick_values(-999979.0, -999965.0), [
    -999986.0, -999979.0, -999972.0, -999965.0, -999958.0,
  ])
  verify_multiple_reference_values(locator.tick_values(-999965.0, -999979.0), [
    -999986.0, -999979.0, -999972.0, -999965.0, -999958.0,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-999979.0, -999965.0),
    [-999986.0, -999979.0, -999972.0, -999965.0, -999958.0],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-999979.0, -999965.0), [
    -999979.0, -999965.0,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(-999979.0, -999965.0), [
    -999979.0, -999965.0,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-999979.0, -999965.0), [
    -999979.0, -999965.0,
  ])
  verify_multiple_reference_limits(locator.nonsingular(-999979.0, -999965.0), [
    -999979.0, -999965.0,
  ])
}

///|
test "MultipleLocator original 161 ULP near multiple" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=7.0, offset=-1000000.0)
  assert_eq(locator.base(), 7.0)
  assert_eq(locator.offset(), -1000000.0)
  verify_multiple_reference_values(
    locator.tick_values(-999978.9999999999, -999965.0),
    [-999986.0, -999979.0, -999972.0, -999965.0, -999958.0],
  )
  verify_multiple_reference_values(
    locator.tick_values(-999965.0, -999978.9999999999),
    [-999986.0, -999979.0, -999972.0, -999965.0, -999958.0],
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-999978.9999999999, -999965.0),
    [-999986.0, -999979.0, -999972.0, -999965.0, -999958.0],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(-999978.9999999999, -999965.0),
    [-999978.9999999999, -999965.0],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(
    locator.view_limits(-999978.9999999999, -999965.0),
    [-999979.0, -999965.0],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(-999978.9999999999, -999965.0),
    [-999978.9999999999, -999965.0],
  )
  verify_multiple_reference_limits(
    locator.nonsingular(-999978.9999999999, -999965.0),
    [-999978.9999999999, -999965.0],
  )
}

///|
test "MultipleLocator original 162 ULP near multiple" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=1.0e-12, offset=0.0)
  assert_eq(locator.base(), 1.0e-12)
  assert_eq(locator.offset(), 0.0)
  verify_multiple_reference_values(
    locator.tick_values(2.9999999999999997e-12, 5.0e-12),
    [
      2.0000000000000004e-12, 3.0e-12, 4.000000000000001e-12, 5.0000000000000005e-12,
      6.0e-12,
    ],
  )
  verify_multiple_reference_values(
    locator.tick_values(5.0e-12, 2.9999999999999997e-12),
    [
      2.0000000000000004e-12, 3.0e-12, 4.000000000000001e-12, 5.0000000000000005e-12,
      6.0e-12,
    ],
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(2.9999999999999997e-12, 5.0e-12),
    [
      2.0000000000000004e-12, 3.0e-12, 4.000000000000001e-12, 5.0000000000000005e-12,
      6.0e-12,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(2.9999999999999997e-12, 5.0e-12),
    [2.9999999999999997e-12, 5.0e-12],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(
    locator.view_limits(2.9999999999999997e-12, 5.0e-12),
    [3.0e-12, 5.0e-12],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(2.9999999999999997e-12, 5.0e-12),
    [2.9999999999999997e-12, 5.0e-12],
  )
  verify_multiple_reference_limits(
    locator.nonsingular(2.9999999999999997e-12, 5.0e-12),
    [2.9999999999999997e-12, 5.0e-12],
  )
}

///|
test "MultipleLocator original 163 ULP near multiple" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=1.0e-12, offset=0.0)
  assert_eq(locator.base(), 1.0e-12)
  assert_eq(locator.offset(), 0.0)
  verify_multiple_reference_values(locator.tick_values(3.0e-12, 5.0e-12), [
    2.0000000000000004e-12, 3.0e-12, 4.000000000000001e-12, 5.0000000000000005e-12,
    6.0e-12,
  ])
  verify_multiple_reference_values(locator.tick_values(5.0e-12, 3.0e-12), [
    2.0000000000000004e-12, 3.0e-12, 4.000000000000001e-12, 5.0000000000000005e-12,
    6.0e-12,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(3.0e-12, 5.0e-12),
    [
      2.0000000000000004e-12, 3.0e-12, 4.000000000000001e-12, 5.0000000000000005e-12,
      6.0e-12,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(3.0e-12, 5.0e-12), [
    3.0e-12, 5.0e-12,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(3.0e-12, 5.0e-12), [
    3.0e-12, 5.0e-12,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(3.0e-12, 5.0e-12), [
    3.0e-12, 5.0e-12,
  ])
  verify_multiple_reference_limits(locator.nonsingular(3.0e-12, 5.0e-12), [
    3.0e-12, 5.0e-12,
  ])
}

///|
test "MultipleLocator original 164 ULP near multiple" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=1.0e-12, offset=0.0)
  assert_eq(locator.base(), 1.0e-12)
  assert_eq(locator.offset(), 0.0)
  verify_multiple_reference_values(
    locator.tick_values(3.0000000000000005e-12, 5.0e-12),
    [
      2.0000000000000004e-12, 3.0e-12, 4.000000000000001e-12, 5.0000000000000005e-12,
      6.0e-12,
    ],
  )
  verify_multiple_reference_values(
    locator.tick_values(5.0e-12, 3.0000000000000005e-12),
    [
      2.0000000000000004e-12, 3.0e-12, 4.000000000000001e-12, 5.0000000000000005e-12,
      6.0e-12,
    ],
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(3.0000000000000005e-12, 5.0e-12),
    [
      2.0000000000000004e-12, 3.0e-12, 4.000000000000001e-12, 5.0000000000000005e-12,
      6.0e-12,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(3.0000000000000005e-12, 5.0e-12),
    [3.0000000000000005e-12, 5.0e-12],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(
    locator.view_limits(3.0000000000000005e-12, 5.0e-12),
    [3.0e-12, 5.0e-12],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(3.0000000000000005e-12, 5.0e-12),
    [3.0000000000000005e-12, 5.0e-12],
  )
  verify_multiple_reference_limits(
    locator.nonsingular(3.0000000000000005e-12, 5.0e-12),
    [3.0000000000000005e-12, 5.0e-12],
  )
}

///|
test "MultipleLocator original 165 ULP near multiple" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=1.0e-12, offset=1000000.0)
  assert_eq(locator.base(), 1.0e-12)
  assert_eq(locator.offset(), 1000000.0)
  verify_multiple_reference_values(
    locator.tick_values(999999.9999999999, 1000000.0),
    [
      999999.9999999999, 999999.9999999999, 999999.9999999999, 999999.9999999999,
      999999.9999999999, 999999.9999999999, 999999.9999999999, 999999.9999999999,
      999999.9999999999, 999999.9999999999, 999999.9999999999, 999999.9999999999,
      999999.9999999999, 999999.9999999999, 999999.9999999999, 999999.9999999999,
      999999.9999999999, 999999.9999999999, 999999.9999999999, 999999.9999999999,
      999999.9999999999, 999999.9999999999, 999999.9999999999, 999999.9999999999,
      999999.9999999999, 999999.9999999999, 999999.9999999999, 999999.9999999999,
      999999.9999999999, 999999.9999999999, 999999.9999999999, 999999.9999999999,
      999999.9999999999, 999999.9999999999, 999999.9999999999, 999999.9999999999,
      999999.9999999999, 999999.9999999999, 999999.9999999999, 999999.9999999999,
      999999.9999999999, 999999.9999999999, 999999.9999999999, 999999.9999999999,
      999999.9999999999, 999999.9999999999, 999999.9999999999, 999999.9999999999,
      999999.9999999999, 999999.9999999999, 999999.9999999999, 999999.9999999999,
      999999.9999999999, 999999.9999999999, 999999.9999999999, 999999.9999999999,
      999999.9999999999, 999999.9999999999, 999999.9999999999, 1000000.0, 1000000.0,
      1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0,
      1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0,
      1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0,
      1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0,
      1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0,
      1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0,
      1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0,
      1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0,
      1000000.0, 1000000.0,
    ],
  )
  verify_multiple_reference_values(
    locator.tick_values(1000000.0, 999999.9999999999),
    [
      999999.9999999999, 999999.9999999999, 999999.9999999999, 999999.9999999999,
      999999.9999999999, 999999.9999999999, 999999.9999999999, 999999.9999999999,
      999999.9999999999, 999999.9999999999, 999999.9999999999, 999999.9999999999,
      999999.9999999999, 999999.9999999999, 999999.9999999999, 999999.9999999999,
      999999.9999999999, 999999.9999999999, 999999.9999999999, 999999.9999999999,
      999999.9999999999, 999999.9999999999, 999999.9999999999, 999999.9999999999,
      999999.9999999999, 999999.9999999999, 999999.9999999999, 999999.9999999999,
      999999.9999999999, 999999.9999999999, 999999.9999999999, 999999.9999999999,
      999999.9999999999, 999999.9999999999, 999999.9999999999, 999999.9999999999,
      999999.9999999999, 999999.9999999999, 999999.9999999999, 999999.9999999999,
      999999.9999999999, 999999.9999999999, 999999.9999999999, 999999.9999999999,
      999999.9999999999, 999999.9999999999, 999999.9999999999, 999999.9999999999,
      999999.9999999999, 999999.9999999999, 999999.9999999999, 999999.9999999999,
      999999.9999999999, 999999.9999999999, 999999.9999999999, 999999.9999999999,
      999999.9999999999, 999999.9999999999, 999999.9999999999, 1000000.0, 1000000.0,
      1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0,
      1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0,
      1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0,
      1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0,
      1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0,
      1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0,
      1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0,
      1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0,
      1000000.0, 1000000.0,
    ],
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(999999.9999999999, 1000000.0),
    [
      999999.9999999999, 999999.9999999999, 999999.9999999999, 999999.9999999999,
      999999.9999999999, 999999.9999999999, 999999.9999999999, 999999.9999999999,
      999999.9999999999, 999999.9999999999, 999999.9999999999, 999999.9999999999,
      999999.9999999999, 999999.9999999999, 999999.9999999999, 999999.9999999999,
      999999.9999999999, 999999.9999999999, 999999.9999999999, 999999.9999999999,
      999999.9999999999, 999999.9999999999, 999999.9999999999, 999999.9999999999,
      999999.9999999999, 999999.9999999999, 999999.9999999999, 999999.9999999999,
      999999.9999999999, 999999.9999999999, 999999.9999999999, 999999.9999999999,
      999999.9999999999, 999999.9999999999, 999999.9999999999, 999999.9999999999,
      999999.9999999999, 999999.9999999999, 999999.9999999999, 999999.9999999999,
      999999.9999999999, 999999.9999999999, 999999.9999999999, 999999.9999999999,
      999999.9999999999, 999999.9999999999, 999999.9999999999, 999999.9999999999,
      999999.9999999999, 999999.9999999999, 999999.9999999999, 999999.9999999999,
      999999.9999999999, 999999.9999999999, 999999.9999999999, 999999.9999999999,
      999999.9999999999, 999999.9999999999, 999999.9999999999, 1000000.0, 1000000.0,
      1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0,
      1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0,
      1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0,
      1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0,
      1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0,
      1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0,
      1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0,
      1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0,
      1000000.0, 1000000.0,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(999999.9999999999, 1000000.0),
    [998999.9999999999, 1001000.0],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(
    locator.view_limits(999999.9999999999, 1000000.0),
    [998999.9999999999, 1001000.0],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(999999.9999999999, 1000000.0),
    [998999.9999999999, 1001000.0],
  )
  verify_multiple_reference_limits(
    locator.nonsingular(999999.9999999999, 1000000.0),
    [949999.9999999999, 1050000.0],
  )
}

///|
test "MultipleLocator original 166 ULP near multiple" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=1.0e-12, offset=1000000.0)
  assert_eq(locator.base(), 1.0e-12)
  assert_eq(locator.offset(), 1000000.0)
  verify_multiple_reference_values(locator.tick_values(1000000.0, 1000000.0), [
    1000000.0, 1000000.0, 1000000.0,
  ])
  verify_multiple_reference_values(locator.tick_values(1000000.0, 1000000.0), [
    1000000.0, 1000000.0, 1000000.0,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(1000000.0, 1000000.0),
    [1000000.0, 1000000.0, 1000000.0],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(1000000.0, 1000000.0), [
    999000.0, 1001000.0,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(1000000.0, 1000000.0), [
    999999.0, 1000001.0,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(1000000.0, 1000000.0), [
    999000.0, 1001000.0,
  ])
  verify_multiple_reference_limits(locator.nonsingular(1000000.0, 1000000.0), [
    950000.0, 1050000.0,
  ])
}

///|
test "MultipleLocator original 167 ULP near multiple" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=1.0e-12, offset=1000000.0)
  assert_eq(locator.base(), 1.0e-12)
  assert_eq(locator.offset(), 1000000.0)
  verify_multiple_reference_values(
    locator.tick_values(1000000.0000000001, 1000000.0),
    [
      1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0,
      1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0,
      1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0,
      1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0,
      1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0,
      1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0,
      1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0,
      1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0,
      1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0000000001, 1000000.0000000001,
      1000000.0000000001, 1000000.0000000001, 1000000.0000000001, 1000000.0000000001,
      1000000.0000000001, 1000000.0000000001, 1000000.0000000001, 1000000.0000000001,
      1000000.0000000001, 1000000.0000000001, 1000000.0000000001, 1000000.0000000001,
      1000000.0000000001, 1000000.0000000001, 1000000.0000000001, 1000000.0000000001,
      1000000.0000000001, 1000000.0000000001, 1000000.0000000001, 1000000.0000000001,
      1000000.0000000001, 1000000.0000000001, 1000000.0000000001, 1000000.0000000001,
      1000000.0000000001, 1000000.0000000001, 1000000.0000000001, 1000000.0000000001,
      1000000.0000000001, 1000000.0000000001, 1000000.0000000001, 1000000.0000000001,
      1000000.0000000001, 1000000.0000000001, 1000000.0000000001, 1000000.0000000001,
      1000000.0000000001, 1000000.0000000001, 1000000.0000000001, 1000000.0000000001,
      1000000.0000000001, 1000000.0000000001, 1000000.0000000001, 1000000.0000000001,
      1000000.0000000001, 1000000.0000000001, 1000000.0000000001, 1000000.0000000001,
      1000000.0000000001, 1000000.0000000001, 1000000.0000000001, 1000000.0000000001,
      1000000.0000000001, 1000000.0000000001, 1000000.0000000001, 1000000.0000000001,
      1000000.0000000001,
    ],
  )
  verify_multiple_reference_values(
    locator.tick_values(1000000.0, 1000000.0000000001),
    [
      1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0,
      1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0,
      1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0,
      1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0,
      1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0,
      1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0,
      1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0,
      1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0,
      1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0000000001, 1000000.0000000001,
      1000000.0000000001, 1000000.0000000001, 1000000.0000000001, 1000000.0000000001,
      1000000.0000000001, 1000000.0000000001, 1000000.0000000001, 1000000.0000000001,
      1000000.0000000001, 1000000.0000000001, 1000000.0000000001, 1000000.0000000001,
      1000000.0000000001, 1000000.0000000001, 1000000.0000000001, 1000000.0000000001,
      1000000.0000000001, 1000000.0000000001, 1000000.0000000001, 1000000.0000000001,
      1000000.0000000001, 1000000.0000000001, 1000000.0000000001, 1000000.0000000001,
      1000000.0000000001, 1000000.0000000001, 1000000.0000000001, 1000000.0000000001,
      1000000.0000000001, 1000000.0000000001, 1000000.0000000001, 1000000.0000000001,
      1000000.0000000001, 1000000.0000000001, 1000000.0000000001, 1000000.0000000001,
      1000000.0000000001, 1000000.0000000001, 1000000.0000000001, 1000000.0000000001,
      1000000.0000000001, 1000000.0000000001, 1000000.0000000001, 1000000.0000000001,
      1000000.0000000001, 1000000.0000000001, 1000000.0000000001, 1000000.0000000001,
      1000000.0000000001, 1000000.0000000001, 1000000.0000000001, 1000000.0000000001,
      1000000.0000000001, 1000000.0000000001, 1000000.0000000001, 1000000.0000000001,
      1000000.0000000001,
    ],
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(1000000.0000000001, 1000000.0),
    [
      1000000.0000000001, 1000000.0000000001, 1000000.0000000001, 1000000.0000000001,
      1000000.0000000001, 1000000.0000000001, 1000000.0000000001, 1000000.0000000001,
      1000000.0000000001, 1000000.0000000001, 1000000.0000000001, 1000000.0000000001,
      1000000.0000000001, 1000000.0000000001, 1000000.0000000001, 1000000.0000000001,
      1000000.0000000001, 1000000.0000000001, 1000000.0000000001, 1000000.0000000001,
      1000000.0000000001, 1000000.0000000001, 1000000.0000000001, 1000000.0000000001,
      1000000.0000000001, 1000000.0000000001, 1000000.0000000001, 1000000.0000000001,
      1000000.0000000001, 1000000.0000000001, 1000000.0000000001, 1000000.0000000001,
      1000000.0000000001, 1000000.0000000001, 1000000.0000000001, 1000000.0000000001,
      1000000.0000000001, 1000000.0000000001, 1000000.0000000001, 1000000.0000000001,
      1000000.0000000001, 1000000.0000000001, 1000000.0000000001, 1000000.0000000001,
      1000000.0000000001, 1000000.0000000001, 1000000.0000000001, 1000000.0000000001,
      1000000.0000000001, 1000000.0000000001, 1000000.0000000001, 1000000.0000000001,
      1000000.0000000001, 1000000.0000000001, 1000000.0000000001, 1000000.0000000001,
      1000000.0000000001, 1000000.0000000001, 1000000.0000000001, 1000000.0, 1000000.0,
      1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0,
      1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0,
      1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0,
      1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0,
      1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0,
      1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0,
      1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0,
      1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0, 1000000.0,
      1000000.0, 1000000.0,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(1000000.0000000001, 1000000.0),
    [999000.0, 1001000.0000000001],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(
    locator.view_limits(1000000.0000000001, 1000000.0),
    [999000.0, 1001000.0000000001],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(1000000.0000000001, 1000000.0),
    [999000.0, 1001000.0000000001],
  )
  verify_multiple_reference_limits(
    locator.nonsingular(1000000.0000000001, 1000000.0),
    [950000.0, 1050000.0000000002],
  )
}

///|
test "MultipleLocator original 168 ULP near multiple" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=1.0e-12, offset=-1000000.0)
  assert_eq(locator.base(), 1.0e-12)
  assert_eq(locator.offset(), -1000000.0)
  verify_multiple_reference_values(
    locator.tick_values(-1000000.0000000001, -1000000.0),
    [
      -1000000.0000000001, -1000000.0000000001, -1000000.0000000001, -1000000.0000000001,
      -1000000.0000000001, -1000000.0000000001, -1000000.0000000001, -1000000.0000000001,
      -1000000.0000000001, -1000000.0000000001, -1000000.0000000001, -1000000.0000000001,
      -1000000.0000000001, -1000000.0000000001, -1000000.0000000001, -1000000.0000000001,
      -1000000.0000000001, -1000000.0000000001, -1000000.0000000001, -1000000.0000000001,
      -1000000.0000000001, -1000000.0000000001, -1000000.0000000001, -1000000.0000000001,
      -1000000.0000000001, -1000000.0000000001, -1000000.0000000001, -1000000.0000000001,
      -1000000.0000000001, -1000000.0000000001, -1000000.0000000001, -1000000.0000000001,
      -1000000.0000000001, -1000000.0000000001, -1000000.0000000001, -1000000.0000000001,
      -1000000.0000000001, -1000000.0000000001, -1000000.0000000001, -1000000.0000000001,
      -1000000.0000000001, -1000000.0000000001, -1000000.0000000001, -1000000.0000000001,
      -1000000.0000000001, -1000000.0000000001, -1000000.0000000001, -1000000.0000000001,
      -1000000.0000000001, -1000000.0000000001, -1000000.0000000001, -1000000.0000000001,
      -1000000.0000000001, -1000000.0000000001, -1000000.0000000001, -1000000.0000000001,
      -1000000.0000000001, -1000000.0000000001, -1000000.0000000001, -1000000.0,
      -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0,
      -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0,
      -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0,
      -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0,
      -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0,
      -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0,
      -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0,
      -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0,
      -1000000.0, -1000000.0, -1000000.0,
    ],
  )
  verify_multiple_reference_values(
    locator.tick_values(-1000000.0, -1000000.0000000001),
    [
      -1000000.0000000001, -1000000.0000000001, -1000000.0000000001, -1000000.0000000001,
      -1000000.0000000001, -1000000.0000000001, -1000000.0000000001, -1000000.0000000001,
      -1000000.0000000001, -1000000.0000000001, -1000000.0000000001, -1000000.0000000001,
      -1000000.0000000001, -1000000.0000000001, -1000000.0000000001, -1000000.0000000001,
      -1000000.0000000001, -1000000.0000000001, -1000000.0000000001, -1000000.0000000001,
      -1000000.0000000001, -1000000.0000000001, -1000000.0000000001, -1000000.0000000001,
      -1000000.0000000001, -1000000.0000000001, -1000000.0000000001, -1000000.0000000001,
      -1000000.0000000001, -1000000.0000000001, -1000000.0000000001, -1000000.0000000001,
      -1000000.0000000001, -1000000.0000000001, -1000000.0000000001, -1000000.0000000001,
      -1000000.0000000001, -1000000.0000000001, -1000000.0000000001, -1000000.0000000001,
      -1000000.0000000001, -1000000.0000000001, -1000000.0000000001, -1000000.0000000001,
      -1000000.0000000001, -1000000.0000000001, -1000000.0000000001, -1000000.0000000001,
      -1000000.0000000001, -1000000.0000000001, -1000000.0000000001, -1000000.0000000001,
      -1000000.0000000001, -1000000.0000000001, -1000000.0000000001, -1000000.0000000001,
      -1000000.0000000001, -1000000.0000000001, -1000000.0000000001, -1000000.0,
      -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0,
      -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0,
      -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0,
      -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0,
      -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0,
      -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0,
      -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0,
      -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0,
      -1000000.0, -1000000.0, -1000000.0,
    ],
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-1000000.0000000001, -1000000.0),
    [
      -1000000.0000000001, -1000000.0000000001, -1000000.0000000001, -1000000.0000000001,
      -1000000.0000000001, -1000000.0000000001, -1000000.0000000001, -1000000.0000000001,
      -1000000.0000000001, -1000000.0000000001, -1000000.0000000001, -1000000.0000000001,
      -1000000.0000000001, -1000000.0000000001, -1000000.0000000001, -1000000.0000000001,
      -1000000.0000000001, -1000000.0000000001, -1000000.0000000001, -1000000.0000000001,
      -1000000.0000000001, -1000000.0000000001, -1000000.0000000001, -1000000.0000000001,
      -1000000.0000000001, -1000000.0000000001, -1000000.0000000001, -1000000.0000000001,
      -1000000.0000000001, -1000000.0000000001, -1000000.0000000001, -1000000.0000000001,
      -1000000.0000000001, -1000000.0000000001, -1000000.0000000001, -1000000.0000000001,
      -1000000.0000000001, -1000000.0000000001, -1000000.0000000001, -1000000.0000000001,
      -1000000.0000000001, -1000000.0000000001, -1000000.0000000001, -1000000.0000000001,
      -1000000.0000000001, -1000000.0000000001, -1000000.0000000001, -1000000.0000000001,
      -1000000.0000000001, -1000000.0000000001, -1000000.0000000001, -1000000.0000000001,
      -1000000.0000000001, -1000000.0000000001, -1000000.0000000001, -1000000.0000000001,
      -1000000.0000000001, -1000000.0000000001, -1000000.0000000001, -1000000.0,
      -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0,
      -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0,
      -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0,
      -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0,
      -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0,
      -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0,
      -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0,
      -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0,
      -1000000.0, -1000000.0, -1000000.0,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(-1000000.0000000001, -1000000.0),
    [-1001000.0000000001, -999000.0],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(
    locator.view_limits(-1000000.0000000001, -1000000.0),
    [-1001000.0000000001, -999000.0],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(-1000000.0000000001, -1000000.0),
    [-1001000.0000000001, -999000.0],
  )
  verify_multiple_reference_limits(
    locator.nonsingular(-1000000.0000000001, -1000000.0),
    [-1050000.0000000002, -950000.0],
  )
}

///|
test "MultipleLocator original 169 ULP near multiple" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=1.0e-12, offset=-1000000.0)
  assert_eq(locator.base(), 1.0e-12)
  assert_eq(locator.offset(), -1000000.0)
  verify_multiple_reference_values(
    locator.tick_values(-1000000.0, -1000000.0),
    [-1000000.0, -1000000.0, -1000000.0],
  )
  verify_multiple_reference_values(
    locator.tick_values(-1000000.0, -1000000.0),
    [-1000000.0, -1000000.0, -1000000.0],
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-1000000.0, -1000000.0),
    [-1000000.0, -1000000.0, -1000000.0],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(-1000000.0, -1000000.0),
    [-1001000.0, -999000.0],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(
    locator.view_limits(-1000000.0, -1000000.0),
    [-1000001.0, -999999.0],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(-1000000.0, -1000000.0),
    [-1001000.0, -999000.0],
  )
  verify_multiple_reference_limits(
    locator.nonsingular(-1000000.0, -1000000.0),
    [-1050000.0, -950000.0],
  )
}

///|
test "MultipleLocator original 170 ULP near multiple" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=1.0e-12, offset=-1000000.0)
  assert_eq(locator.base(), 1.0e-12)
  assert_eq(locator.offset(), -1000000.0)
  verify_multiple_reference_values(
    locator.tick_values(-999999.9999999999, -1000000.0),
    [
      -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0,
      -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0,
      -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0,
      -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0,
      -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0,
      -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0,
      -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0,
      -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0,
      -1000000.0, -1000000.0, -1000000.0, -1000000.0, -999999.9999999999, -999999.9999999999,
      -999999.9999999999, -999999.9999999999, -999999.9999999999, -999999.9999999999,
      -999999.9999999999, -999999.9999999999, -999999.9999999999, -999999.9999999999,
      -999999.9999999999, -999999.9999999999, -999999.9999999999, -999999.9999999999,
      -999999.9999999999, -999999.9999999999, -999999.9999999999, -999999.9999999999,
      -999999.9999999999, -999999.9999999999, -999999.9999999999, -999999.9999999999,
      -999999.9999999999, -999999.9999999999, -999999.9999999999, -999999.9999999999,
      -999999.9999999999, -999999.9999999999, -999999.9999999999, -999999.9999999999,
      -999999.9999999999, -999999.9999999999, -999999.9999999999, -999999.9999999999,
      -999999.9999999999, -999999.9999999999, -999999.9999999999, -999999.9999999999,
      -999999.9999999999, -999999.9999999999, -999999.9999999999, -999999.9999999999,
      -999999.9999999999, -999999.9999999999, -999999.9999999999, -999999.9999999999,
      -999999.9999999999, -999999.9999999999, -999999.9999999999, -999999.9999999999,
      -999999.9999999999, -999999.9999999999, -999999.9999999999, -999999.9999999999,
      -999999.9999999999, -999999.9999999999, -999999.9999999999, -999999.9999999999,
      -999999.9999999999,
    ],
  )
  verify_multiple_reference_values(
    locator.tick_values(-1000000.0, -999999.9999999999),
    [
      -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0,
      -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0,
      -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0,
      -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0,
      -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0,
      -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0,
      -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0,
      -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0,
      -1000000.0, -1000000.0, -1000000.0, -1000000.0, -999999.9999999999, -999999.9999999999,
      -999999.9999999999, -999999.9999999999, -999999.9999999999, -999999.9999999999,
      -999999.9999999999, -999999.9999999999, -999999.9999999999, -999999.9999999999,
      -999999.9999999999, -999999.9999999999, -999999.9999999999, -999999.9999999999,
      -999999.9999999999, -999999.9999999999, -999999.9999999999, -999999.9999999999,
      -999999.9999999999, -999999.9999999999, -999999.9999999999, -999999.9999999999,
      -999999.9999999999, -999999.9999999999, -999999.9999999999, -999999.9999999999,
      -999999.9999999999, -999999.9999999999, -999999.9999999999, -999999.9999999999,
      -999999.9999999999, -999999.9999999999, -999999.9999999999, -999999.9999999999,
      -999999.9999999999, -999999.9999999999, -999999.9999999999, -999999.9999999999,
      -999999.9999999999, -999999.9999999999, -999999.9999999999, -999999.9999999999,
      -999999.9999999999, -999999.9999999999, -999999.9999999999, -999999.9999999999,
      -999999.9999999999, -999999.9999999999, -999999.9999999999, -999999.9999999999,
      -999999.9999999999, -999999.9999999999, -999999.9999999999, -999999.9999999999,
      -999999.9999999999, -999999.9999999999, -999999.9999999999, -999999.9999999999,
      -999999.9999999999,
    ],
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-999999.9999999999, -1000000.0),
    [
      -999999.9999999999, -999999.9999999999, -999999.9999999999, -999999.9999999999,
      -999999.9999999999, -999999.9999999999, -999999.9999999999, -999999.9999999999,
      -999999.9999999999, -999999.9999999999, -999999.9999999999, -999999.9999999999,
      -999999.9999999999, -999999.9999999999, -999999.9999999999, -999999.9999999999,
      -999999.9999999999, -999999.9999999999, -999999.9999999999, -999999.9999999999,
      -999999.9999999999, -999999.9999999999, -999999.9999999999, -999999.9999999999,
      -999999.9999999999, -999999.9999999999, -999999.9999999999, -999999.9999999999,
      -999999.9999999999, -999999.9999999999, -999999.9999999999, -999999.9999999999,
      -999999.9999999999, -999999.9999999999, -999999.9999999999, -999999.9999999999,
      -999999.9999999999, -999999.9999999999, -999999.9999999999, -999999.9999999999,
      -999999.9999999999, -999999.9999999999, -999999.9999999999, -999999.9999999999,
      -999999.9999999999, -999999.9999999999, -999999.9999999999, -999999.9999999999,
      -999999.9999999999, -999999.9999999999, -999999.9999999999, -999999.9999999999,
      -999999.9999999999, -999999.9999999999, -999999.9999999999, -999999.9999999999,
      -999999.9999999999, -999999.9999999999, -999999.9999999999, -1000000.0, -1000000.0,
      -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0,
      -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0,
      -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0,
      -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0,
      -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0,
      -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0,
      -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0,
      -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0, -1000000.0,
      -1000000.0, -1000000.0,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(-999999.9999999999, -1000000.0),
    [-1001000.0, -998999.9999999999],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(
    locator.view_limits(-999999.9999999999, -1000000.0),
    [-1001000.0, -998999.9999999999],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(-999999.9999999999, -1000000.0),
    [-1001000.0, -998999.9999999999],
  )
  verify_multiple_reference_limits(
    locator.nonsingular(-999999.9999999999, -1000000.0),
    [-1050000.0, -949999.9999999999],
  )
}

///|
test "MultipleLocator original 171 extreme finite / duplicate / eager prefix" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=5.0e-324, offset=0.0)
  assert_eq(locator.base(), 5.0e-324)
  assert_eq(locator.offset(), 0.0)
  verify_multiple_reference_values(locator.tick_values(0.0, 0.0), [
    -5.0e-324, 0.0, 5.0e-324,
  ])
  verify_multiple_reference_values(locator.tick_values(0.0, 0.0), [
    -5.0e-324, 0.0, 5.0e-324,
  ])
  verify_multiple_reference_values(locator.as_locator().tick_values(0.0, 0.0), [
    -5.0e-324, 0.0, 5.0e-324,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(0.0, 0.0), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(0.0, 0.0), [-1.0, 1.0])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(0.0, 0.0), [
    -0.001, 0.001,
  ])
  verify_multiple_reference_limits(locator.nonsingular(0.0, 0.0), [-0.05, 0.05])
}

///|
test "MultipleLocator original 172 extreme finite / duplicate / eager prefix" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=1.0e-300, offset=0.0)
  assert_eq(locator.base(), 1.0e-300)
  assert_eq(locator.offset(), 0.0)
  verify_multiple_reference_values(locator.tick_values(0.0, 0.0), [
    -1.0e-300, 0.0, 1.0e-300,
  ])
  verify_multiple_reference_values(locator.tick_values(0.0, 0.0), [
    -1.0e-300, 0.0, 1.0e-300,
  ])
  verify_multiple_reference_values(locator.as_locator().tick_values(0.0, 0.0), [
    -1.0e-300, 0.0, 1.0e-300,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(0.0, 0.0), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(0.0, 0.0), [-1.0, 1.0])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(0.0, 0.0), [
    -0.001, 0.001,
  ])
  verify_multiple_reference_limits(locator.nonsingular(0.0, 0.0), [-0.05, 0.05])
}

///|
test "MultipleLocator original 173 extreme finite / duplicate / eager prefix" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=1.0e+300, offset=0.0)
  assert_eq(locator.base(), 1.0e+300)
  assert_eq(locator.offset(), 0.0)
  verify_multiple_reference_values(locator.tick_values(-1.0e+300, 1.0e+300), [
    -2.0e+300, -1.0e+300, 0.0, 1.0e+300, 2.0e+300,
  ])
  verify_multiple_reference_values(locator.tick_values(1.0e+300, -1.0e+300), [
    -2.0e+300, -1.0e+300, 0.0, 1.0e+300, 2.0e+300,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-1.0e+300, 1.0e+300),
    [-2.0e+300, -1.0e+300, 0.0, 1.0e+300, 2.0e+300],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-1.0e+300, 1.0e+300), [
    -1.0e+300, 1.0e+300,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(-1.0e+300, 1.0e+300), [
    -1.0e+300, 1.0e+300,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-1.0e+300, 1.0e+300), [
    -1.0e+300, 1.0e+300,
  ])
  verify_multiple_reference_limits(locator.nonsingular(-1.0e+300, 1.0e+300), [
    -1.0e+300, 1.0e+300,
  ])
}

///|
test "MultipleLocator original 174 extreme finite / duplicate / eager prefix" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=1.0e+308, offset=0.0)
  assert_eq(locator.base(), 1.0e+308)
  assert_eq(locator.offset(), 0.0)
  verify_multiple_reference_values(locator.tick_values(0.0, 0.0), [
    -1.0e+308,
    0.0,
    1.0 / 0.0,
  ])
  verify_multiple_reference_values(locator.tick_values(0.0, 0.0), [
    -1.0e+308,
    0.0,
    1.0 / 0.0,
  ])
  verify_multiple_reference_values(locator.as_locator().tick_values(0.0, 0.0), [
    -1.0e+308,
    0.0,
    1.0 / 0.0,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(0.0, 0.0), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(0.0, 0.0), [-1.0, 1.0])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(0.0, 0.0), [
    -0.001, 0.001,
  ])
  verify_multiple_reference_limits(locator.nonsingular(0.0, 0.0), [-0.05, 0.05])
}

///|
test "MultipleLocator original 175 extreme finite / duplicate / eager prefix" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=1.0e+308, offset=0.0)
  assert_eq(locator.base(), 1.0e+308)
  assert_eq(locator.offset(), 0.0)
  assert_true(
    try {
      ignore(locator.tick_values(-1.0e+308, 1.0e+308))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(1.0e+308, -1.0e+308))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-1.0e+308, 1.0e+308),
    [],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-1.0e+308, 1.0e+308), [
    -1.0e+308, 1.0e+308,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(-1.0e+308, 1.0e+308), [
    -1.0e+308, 1.0e+308,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-1.0e+308, 1.0e+308), [
    -1.0e+308, 1.0e+308,
  ])
  verify_multiple_reference_limits(locator.nonsingular(-1.0e+308, 1.0e+308), [
    -1.0e+308, 1.0e+308,
  ])
}

///|
test "MultipleLocator original 176 extreme finite / duplicate / eager prefix" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=1.0e+308, offset=1.0e+308)
  assert_eq(locator.base(), 1.0e+308)
  assert_eq(locator.offset(), 1.0e+308)
  verify_multiple_reference_values(locator.tick_values(1.0e+308, 1.0e+308), [
    0.0,
    1.0e+308,
    1.0 / 0.0,
  ])
  verify_multiple_reference_values(locator.tick_values(1.0e+308, 1.0e+308), [
    0.0,
    1.0e+308,
    1.0 / 0.0,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(1.0e+308, 1.0e+308),
    [0.0, 1.0e+308, 1.0 / 0.0],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(1.0e+308, 1.0e+308), [
    9.99e+307, 1.001e+308,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(1.0e+308, 1.0e+308), [
    9.99e+307, 1.001e+308,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(1.0e+308, 1.0e+308), [
    9.99e+307, 1.001e+308,
  ])
  verify_multiple_reference_limits(locator.nonsingular(1.0e+308, 1.0e+308), [
    9.5e+307, 1.05e+308,
  ])
}

///|
test "MultipleLocator original 177 extreme finite / duplicate / eager prefix" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=1.0e-300, offset=1.0e+308)
  assert_eq(locator.base(), 1.0e-300)
  assert_eq(locator.offset(), 1.0e+308)
  verify_multiple_reference_values(locator.tick_values(1.0e+308, 1.0e+308), [
    1.0e+308, 1.0e+308, 1.0e+308,
  ])
  verify_multiple_reference_values(locator.tick_values(1.0e+308, 1.0e+308), [
    1.0e+308, 1.0e+308, 1.0e+308,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(1.0e+308, 1.0e+308),
    [1.0e+308, 1.0e+308, 1.0e+308],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(1.0e+308, 1.0e+308), [
    9.99e+307, 1.001e+308,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(1.0e+308, 1.0e+308), [
    9.99e+307, 1.001e+308,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(1.0e+308, 1.0e+308), [
    9.99e+307, 1.001e+308,
  ])
  verify_multiple_reference_limits(locator.nonsingular(1.0e+308, 1.0e+308), [
    9.5e+307, 1.05e+308,
  ])
}

///|
test "MultipleLocator original 178 extreme finite / duplicate / eager prefix" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=1.0e-300, offset=0.0)
  assert_eq(locator.base(), 1.0e-300)
  assert_eq(locator.offset(), 0.0)
  assert_true(
    try {
      ignore(locator.tick_values(1.0e+308, 1.0e+308))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(1.0e+308, 1.0e+308))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(1.0e+308, 1.0e+308),
    [],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(1.0e+308, 1.0e+308), [
    9.99e+307, 1.001e+308,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(1.0e+308, 1.0e+308), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(1.0e+308, 1.0e+308), [
    9.99e+307, 1.001e+308,
  ])
  verify_multiple_reference_limits(locator.nonsingular(1.0e+308, 1.0e+308), [
    9.5e+307, 1.05e+308,
  ])
}

///|
test "MultipleLocator original 179 extreme finite / duplicate / eager prefix" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=1.0, offset=1.0e+308)
  assert_eq(locator.base(), 1.0)
  assert_eq(locator.offset(), 1.0e+308)
  assert_true(
    try {
      ignore(locator.tick_values(-1.0e+308, -1.0e+308))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(-1.0e+308, -1.0e+308))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-1.0e+308, -1.0e+308),
    [],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-1.0e+308, -1.0e+308), [
    -1.001e+308, -9.99e+307,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(-1.0e+308, -1.0e+308), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-1.0e+308, -1.0e+308), [
    -1.001e+308, -9.99e+307,
  ])
  verify_multiple_reference_limits(locator.nonsingular(-1.0e+308, -1.0e+308), [
    -1.05e+308, -9.5e+307,
  ])
}

///|
test "MultipleLocator original 180 extreme finite / duplicate / eager prefix" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=1.0e+308, offset=-1.0e+308)
  assert_eq(locator.base(), 1.0e+308)
  assert_eq(locator.offset(), -1.0e+308)
  assert_true(
    try {
      ignore(locator.tick_values(1.0e+308, 1.0e+308))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(1.0e+308, 1.0e+308))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(1.0e+308, 1.0e+308),
    [],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(1.0e+308, 1.0e+308), [
    9.99e+307, 1.001e+308,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(1.0e+308, 1.0e+308), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(1.0e+308, 1.0e+308), [
    9.99e+307, 1.001e+308,
  ])
  verify_multiple_reference_limits(locator.nonsingular(1.0e+308, 1.0e+308), [
    9.5e+307, 1.05e+308,
  ])
}

///|
test "MultipleLocator original 181 extreme finite / duplicate / eager prefix" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=1.0e-290, offset=0.0)
  assert_eq(locator.base(), 1.0e-290)
  assert_eq(locator.offset(), 0.0)
  verify_multiple_reference_values(locator.tick_values(-1.0e-300, 1.0e-300), [
    -1.0e-290, 0.0, 1.0e-290,
  ])
  verify_multiple_reference_values(locator.tick_values(1.0e-300, -1.0e-300), [
    -1.0e-290, 0.0, 1.0e-290,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-1.0e-300, 1.0e-300),
    [-1.0e-290, 0.0, 1.0e-290],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-1.0e-300, 1.0e-300), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(-1.0e-300, 1.0e-300), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-1.0e-300, 1.0e-300), [
    -0.001, 0.001,
  ])
  verify_multiple_reference_limits(locator.nonsingular(-1.0e-300, 1.0e-300), [
    -0.05, 0.05,
  ])
}

///|
test "MultipleLocator original 182 extreme finite / duplicate / eager prefix" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=1.0e-300, offset=0.0)
  assert_eq(locator.base(), 1.0e-300)
  assert_eq(locator.offset(), 0.0)
  verify_multiple_reference_values(locator.tick_values(-1.0e-299, 1.0e-299), [
    -1.1e-299, -1.0e-299, -9.0e-300, -7.999999999999999e-300, -7.0e-300, -5.999999999999999e-300,
    -4.999999999999999e-300, -3.9999999999999994e-300, -2.9999999999999996e-300,
    -1.9999999999999997e-300, -9.999999999999999e-301, 0.0, 1.0000000000000012e-300,
    1.9999999999999997e-300, 3.000000000000001e-300, 3.9999999999999994e-300, 5.0000000000000006e-300,
    6.000000000000002e-300, 7.0e-300, 8.000000000000002e-300, 9.0e-300, 1.0000000000000001e-299,
    1.1e-299,
  ])
  verify_multiple_reference_values(locator.tick_values(1.0e-299, -1.0e-299), [
    -1.1e-299, -1.0e-299, -9.0e-300, -7.999999999999999e-300, -7.0e-300, -5.999999999999999e-300,
    -4.999999999999999e-300, -3.9999999999999994e-300, -2.9999999999999996e-300,
    -1.9999999999999997e-300, -9.999999999999999e-301, 0.0, 1.0000000000000012e-300,
    1.9999999999999997e-300, 3.000000000000001e-300, 3.9999999999999994e-300, 5.0000000000000006e-300,
    6.000000000000002e-300, 7.0e-300, 8.000000000000002e-300, 9.0e-300, 1.0000000000000001e-299,
    1.1e-299,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-1.0e-299, 1.0e-299),
    [
      -1.1e-299, -1.0e-299, -9.0e-300, -7.999999999999999e-300, -7.0e-300, -5.999999999999999e-300,
      -4.999999999999999e-300, -3.9999999999999994e-300, -2.9999999999999996e-300,
      -1.9999999999999997e-300, -9.999999999999999e-301, 0.0, 1.0000000000000012e-300,
      1.9999999999999997e-300, 3.000000000000001e-300, 3.9999999999999994e-300, 5.0000000000000006e-300,
      6.000000000000002e-300, 7.0e-300, 8.000000000000002e-300, 9.0e-300, 1.0000000000000001e-299,
      1.1e-299,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-1.0e-299, 1.0e-299), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(-1.0e-299, 1.0e-299), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-1.0e-299, 1.0e-299), [
    -0.001, 0.001,
  ])
  verify_multiple_reference_limits(locator.nonsingular(-1.0e-299, 1.0e-299), [
    -0.05, 0.05,
  ])
}

///|
test "MultipleLocator original 183 extreme finite / duplicate / eager prefix" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(
    base=1.7976931348623157e+308,
    offset=0.0,
  )
  assert_eq(locator.base(), 1.7976931348623157e+308)
  assert_eq(locator.offset(), 0.0)
  verify_multiple_reference_values(
    locator.tick_values(1.7976931348623157e+308, 1.7976931348623157e+308),
    [0.0, 1.7976931348623157e+308, 1.0 / 0.0],
  )
  verify_multiple_reference_values(
    locator.tick_values(1.7976931348623157e+308, 1.7976931348623157e+308),
    [0.0, 1.7976931348623157e+308, 1.0 / 0.0],
  )
  verify_multiple_reference_values(
    locator
    .as_locator()
    .tick_values(1.7976931348623157e+308, 1.7976931348623157e+308),
    [0.0, 1.7976931348623157e+308, 1.0 / 0.0],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(1.7976931348623157e+308, 1.7976931348623157e+308),
    [1.7958954417274534e+308, 1.0 / 0.0],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(
    locator.view_limits(1.7976931348623157e+308, 1.7976931348623157e+308),
    [1.7958954417274534e+308, 1.0 / 0.0],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(1.7976931348623157e+308, 1.7976931348623157e+308),
    [1.7958954417274534e+308, 1.0 / 0.0],
  )
  verify_multiple_reference_limits(
    locator.nonsingular(1.7976931348623157e+308, 1.7976931348623157e+308),
    [1.7078084781191998e+308, 1.0 / 0.0],
  )
}

///|
test "MultipleLocator original 184 extreme finite / duplicate / eager prefix" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=1.0, offset=0.0)
  assert_eq(locator.base(), 1.0)
  assert_eq(locator.offset(), 0.0)
  verify_multiple_reference_values(
    locator.tick_values(9999999999999998.0, 1.0000000000000002e+16),
    [
      9999999999999996.0, 9999999999999996.0, 9999999999999998.0, 1.0e+16, 1.0e+16,
      1.0e+16, 1.0000000000000002e+16,
    ],
  )
  verify_multiple_reference_values(
    locator.tick_values(1.0000000000000002e+16, 9999999999999998.0),
    [
      9999999999999996.0, 9999999999999996.0, 9999999999999998.0, 1.0e+16, 1.0e+16,
      1.0e+16, 1.0000000000000002e+16,
    ],
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(9999999999999998.0, 1.0000000000000002e+16),
    [
      9999999999999996.0, 9999999999999996.0, 9999999999999998.0, 1.0e+16, 1.0e+16,
      1.0e+16, 1.0000000000000002e+16,
    ],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(9999999999999998.0, 1.0000000000000002e+16),
    [9989999999999998.0, 1.0010000000000002e+16],
  )
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(
    locator.view_limits(9999999999999998.0, 1.0000000000000002e+16),
    [9989999999999998.0, 1.0010000000000002e+16],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(
    locator.view_limits(9999999999999998.0, 1.0000000000000002e+16),
    [9989999999999998.0, 1.0010000000000002e+16],
  )
  verify_multiple_reference_limits(
    locator.nonsingular(9999999999999998.0, 1.0000000000000002e+16),
    [9499999999999998.0, 1.0500000000000002e+16],
  )
}

///|
test "MultipleLocator original 185 extreme finite / duplicate / eager prefix" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=1.0e+16, offset=0.0)
  assert_eq(locator.base(), 1.0e+16)
  assert_eq(locator.offset(), 0.0)
  verify_multiple_reference_values(locator.tick_values(-5.0e-324, 5.0e-324), [
    -1.0e+16, 0.0, 1.0e+16,
  ])
  verify_multiple_reference_values(locator.tick_values(5.0e-324, -5.0e-324), [
    -1.0e+16, 0.0, 1.0e+16,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-5.0e-324, 5.0e-324),
    [-1.0e+16, 0.0, 1.0e+16],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-5.0e-324, 5.0e-324), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(-5.0e-324, 5.0e-324), [
    -1.0, 1.0,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-5.0e-324, 5.0e-324), [
    -0.001, 0.001,
  ])
  verify_multiple_reference_limits(locator.nonsingular(-5.0e-324, 5.0e-324), [
    -0.05, 0.05,
  ])
}

///|
test "MultipleLocator original 186 extreme finite / duplicate / eager prefix" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=1.0, offset=-0.0)
  assert_eq(locator.base(), 1.0)
  assert_eq(locator.offset(), -0.0)
  verify_multiple_reference_values(locator.tick_values(-0.0, -0.0), [
    -1.0, 0.0, 1.0,
  ])
  verify_multiple_reference_values(locator.tick_values(-0.0, -0.0), [
    -1.0, 0.0, 1.0,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-0.0, -0.0),
    [-1.0, 0.0, 1.0],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-0.0, -0.0), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(-0.0, -0.0), [-1.0, 1.0])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-0.0, -0.0), [
    -0.001, 0.001,
  ])
  verify_multiple_reference_limits(locator.nonsingular(-0.0, -0.0), [
    -0.05, 0.05,
  ])
}

///|
test "MultipleLocator original 187 extreme finite / duplicate / eager prefix" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=0.1, offset=0.0)
  assert_eq(locator.base(), 0.1)
  assert_eq(locator.offset(), 0.0)
  verify_multiple_reference_values(locator.tick_values(-0.0, 0.0), [
    -0.1, 0.0, 0.1,
  ])
  verify_multiple_reference_values(locator.tick_values(0.0, -0.0), [
    -0.1, 0.0, 0.1,
  ])
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-0.0, 0.0),
    [-0.1, 0.0, 0.1],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-0.0, 0.0), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(-0.0, 0.0), [-1.0, 1.0])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-0.0, 0.0), [
    -0.001, 0.001,
  ])
  verify_multiple_reference_limits(locator.nonsingular(-0.0, 0.0), [-0.05, 0.05])
}

///|
test "MultipleLocator original 188 extreme finite / duplicate / eager prefix" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=5.0e-324, offset=0.0)
  assert_eq(locator.base(), 5.0e-324)
  assert_eq(locator.offset(), 0.0)
  let values = locator.tick_values(0.0, 1.0e-318)
  assert_eq(values.length(), 100000)
  verify_multiple_reference_values(Array::makei(8, index => values[index]), [
    -5.0e-324, 0.0, 5.0e-324, 1.0e-323, 1.5e-323, 2.0e-323, 2.5e-323, 3.0e-323,
  ])
  let reversed_values = locator.tick_values(1.0e-318, 0.0)
  assert_eq(reversed_values.length(), 100000)
  verify_multiple_reference_values(
    Array::makei(8, index => reversed_values[index]),
    [-5.0e-324, 0.0, 5.0e-324, 1.0e-323, 1.5e-323, 2.0e-323, 2.5e-323, 3.0e-323],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(0.0, 1.0e-318), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(0.0, 1.0e-318), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(0.0, 1.0e-318), [
    -0.001, 0.001,
  ])
  verify_multiple_reference_limits(locator.nonsingular(0.0, 1.0e-318), [
    -0.05, 0.05,
  ])
}

///|
test "MultipleLocator original 189 extreme finite / duplicate / eager prefix" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=1.0, offset=0.25)
  assert_eq(locator.base(), 1.0)
  assert_eq(locator.offset(), 0.25)
  let values = locator.tick_values(0.0, 200000.0)
  assert_eq(values.length(), 100000)
  verify_multiple_reference_values(Array::makei(8, index => values[index]), [
    -0.75, 0.25, 1.25, 2.25, 3.25, 4.25, 5.25, 6.25,
  ])
  let reversed_values = locator.tick_values(200000.0, 0.0)
  assert_eq(reversed_values.length(), 100000)
  verify_multiple_reference_values(
    Array::makei(8, index => reversed_values[index]),
    [-0.75, 0.25, 1.25, 2.25, 3.25, 4.25, 5.25, 6.25],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(0.0, 200000.0), [
    0.0, 200000.0,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(0.0, 200000.0), [
    -0.75, 200000.25,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(0.0, 200000.0), [
    0.0, 200000.0,
  ])
  verify_multiple_reference_limits(locator.nonsingular(0.0, 200000.0), [
    0.0, 200000.0,
  ])
}

///|
test "MultipleLocator original 190 nonfinite bounds" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=0.5, offset=-0.25)
  assert_eq(locator.base(), 0.5)
  assert_eq(locator.offset(), -0.25)
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 0.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(0.0 / 0.0, 0.0),
    [],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(0.0 / 0.0, 0.0), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(0.0 / 0.0, 0.0), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(0.0 / 0.0, 0.0), [
    -0.001, 0.001,
  ])
  verify_multiple_reference_limits(locator.nonsingular(0.0 / 0.0, 0.0), [
    -0.05, 0.05,
  ])
}

///|
test "MultipleLocator original 191 nonfinite bounds" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=0.5, offset=-0.25)
  assert_eq(locator.base(), 0.5)
  assert_eq(locator.offset(), -0.25)
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 0.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(0.0, 0.0 / 0.0),
    [],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(0.0, 0.0 / 0.0), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(0.0, 0.0 / 0.0), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(0.0, 0.0 / 0.0), [
    -0.001, 0.001,
  ])
  verify_multiple_reference_limits(locator.nonsingular(0.0, 0.0 / 0.0), [
    -0.05, 0.05,
  ])
}

///|
test "MultipleLocator original 192 nonfinite bounds" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=0.5, offset=-0.25)
  assert_eq(locator.base(), 0.5)
  assert_eq(locator.offset(), -0.25)
  assert_true(
    try {
      ignore(locator.tick_values(1.0 / 0.0, 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(1.0 / 0.0, 0.0),
    [],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(1.0 / 0.0, 0.0), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(1.0 / 0.0, 0.0), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(1.0 / 0.0, 0.0), [
    -0.001, 0.001,
  ])
  verify_multiple_reference_limits(locator.nonsingular(1.0 / 0.0, 0.0), [
    -0.05, 0.05,
  ])
}

///|
test "MultipleLocator original 193 nonfinite bounds" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=0.5, offset=-0.25)
  assert_eq(locator.base(), 0.5)
  assert_eq(locator.offset(), -0.25)
  assert_true(
    try {
      ignore(locator.tick_values(-1.0 / 0.0, 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0, -1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(-1.0 / 0.0, 0.0),
    [],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-1.0 / 0.0, 0.0), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(-1.0 / 0.0, 0.0), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(-1.0 / 0.0, 0.0), [
    -0.001, 0.001,
  ])
  verify_multiple_reference_limits(locator.nonsingular(-1.0 / 0.0, 0.0), [
    -0.05, 0.05,
  ])
}

///|
test "MultipleLocator original 194 nonfinite bounds" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=0.5, offset=-0.25)
  assert_eq(locator.base(), 0.5)
  assert_eq(locator.offset(), -0.25)
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(1.0 / 0.0, 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(0.0, 1.0 / 0.0),
    [],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(0.0, 1.0 / 0.0), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(0.0, 1.0 / 0.0), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(0.0, 1.0 / 0.0), [
    -0.001, 0.001,
  ])
  verify_multiple_reference_limits(locator.nonsingular(0.0, 1.0 / 0.0), [
    -0.05, 0.05,
  ])
}

///|
test "MultipleLocator original 195 nonfinite bounds" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=0.5, offset=-0.25)
  assert_eq(locator.base(), 0.5)
  assert_eq(locator.offset(), -0.25)
  assert_true(
    try {
      ignore(locator.tick_values(0.0, -1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(-1.0 / 0.0, 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(0.0, -1.0 / 0.0),
    [],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(0.0, -1.0 / 0.0), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(0.0, -1.0 / 0.0), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(0.0, -1.0 / 0.0), [
    -0.001, 0.001,
  ])
  verify_multiple_reference_limits(locator.nonsingular(0.0, -1.0 / 0.0), [
    -0.05, 0.05,
  ])
}

///|
test "MultipleLocator original 196 nonfinite bounds" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=0.5, offset=-0.25)
  assert_eq(locator.base(), 0.5)
  assert_eq(locator.offset(), -0.25)
  assert_true(
    try {
      ignore(locator.tick_values(1.0 / 0.0, -1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(-1.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(1.0 / 0.0, -1.0 / 0.0),
    [],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(1.0 / 0.0, -1.0 / 0.0), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(1.0 / 0.0, -1.0 / 0.0), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(1.0 / 0.0, -1.0 / 0.0), [
    -0.001, 0.001,
  ])
  verify_multiple_reference_limits(locator.nonsingular(1.0 / 0.0, -1.0 / 0.0), [
    -0.05, 0.05,
  ])
}

///|
test "MultipleLocator original 197 nonfinite bounds" {
  let previous_mode = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous_mode))
  let locator = @ticker.MultipleLocator::new(base=0.5, offset=-0.25)
  assert_eq(locator.base(), 0.5)
  assert_eq(locator.offset(), -0.25)
  assert_true(
    try {
      ignore(locator.tick_values(0.0 / 0.0, 1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.tick_values(1.0 / 0.0, 0.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  verify_multiple_reference_values(
    locator.as_locator().tick_values(0.0 / 0.0, 1.0 / 0.0),
    [],
  )
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(0.0 / 0.0, 1.0 / 0.0), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("round_numbers")
  verify_multiple_reference_limits(locator.view_limits(0.0 / 0.0, 1.0 / 0.0), [
    -0.001, 0.001,
  ])
  @config.set_axes_autolimit_mode("data")
  verify_multiple_reference_limits(locator.view_limits(0.0 / 0.0, 1.0 / 0.0), [
    -0.001, 0.001,
  ])
  verify_multiple_reference_limits(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), [
    -0.05, 0.05,
  ])
}

///|
test "MultipleLocator original successful and failed parameter updates" {
  let locator = @ticker.MultipleLocator::new(base=2.5, offset=0.75)
  let independent = locator.copy()
  let live = locator.as_locator().copy()
  locator.set_params(base=0.5)
  assert_eq(locator.base(), 0.5)
  assert_eq(locator.offset(), 0.75)
  verify_multiple_reference_values(locator.tick_values(-1.0, 1.0), [
    -1.25, -0.75, -0.25, 0.25, 0.75, 1.25,
  ])
  assert_eq(live.multiple_locator().unwrap().base(), locator.base())
  assert_eq(live.multiple_locator().unwrap().offset(), locator.offset())
  assert_eq(independent.base(), 2.5)
  assert_eq(independent.offset(), 0.75)
  locator.set_params(offset=0.25)
  assert_eq(locator.base(), 0.5)
  assert_eq(locator.offset(), 0.25)
  verify_multiple_reference_values(locator.tick_values(-1.0, 1.0), [
    -1.25, -0.75, -0.25, 0.25, 0.75, 1.25,
  ])
  assert_eq(live.multiple_locator().unwrap().base(), locator.base())
  assert_eq(live.multiple_locator().unwrap().offset(), locator.offset())
  assert_eq(independent.base(), 2.5)
  assert_eq(independent.offset(), 0.75)
  locator.set_params()
  assert_eq(locator.base(), 0.5)
  assert_eq(locator.offset(), 0.25)
  verify_multiple_reference_values(locator.tick_values(-1.0, 1.0), [
    -1.25, -0.75, -0.25, 0.25, 0.75, 1.25,
  ])
  assert_eq(live.multiple_locator().unwrap().base(), locator.base())
  assert_eq(live.multiple_locator().unwrap().offset(), locator.offset())
  assert_eq(independent.base(), 2.5)
  assert_eq(independent.offset(), 0.75)
  locator.set_params(base=7.0, offset=-3.0)
  assert_eq(locator.base(), 7.0)
  assert_eq(locator.offset(), -3.0)
  verify_multiple_reference_values(locator.tick_values(-1.0, 1.0), [-3.0, 4.0])
  assert_eq(live.multiple_locator().unwrap().base(), locator.base())
  assert_eq(live.multiple_locator().unwrap().offset(), locator.offset())
  assert_eq(independent.base(), 2.5)
  assert_eq(independent.offset(), 0.75)
  assert_true(
    try {
      locator.set_params(base=0.0, offset=100.0)
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(locator.base(), 7.0)
  assert_eq(locator.offset(), -3.0)
  verify_multiple_reference_values(locator.tick_values(-1.0, 1.0), [-3.0, 4.0])
  assert_eq(live.multiple_locator().unwrap().base(), locator.base())
  assert_eq(live.multiple_locator().unwrap().offset(), locator.offset())
  assert_eq(independent.base(), 2.5)
  assert_eq(independent.offset(), 0.75)
  locator.set_params()
  assert_eq(locator.base(), 7.0)
  assert_eq(locator.offset(), -3.0)
  verify_multiple_reference_values(locator.tick_values(-1.0, 1.0), [-3.0, 4.0])
  assert_eq(live.multiple_locator().unwrap().base(), locator.base())
  assert_eq(live.multiple_locator().unwrap().offset(), locator.offset())
  assert_eq(independent.base(), 2.5)
  assert_eq(independent.offset(), 0.75)
  locator.set_params()
  assert_eq(locator.base(), 7.0)
  assert_eq(locator.offset(), -3.0)
  verify_multiple_reference_values(locator.tick_values(-1.0, 1.0), [-3.0, 4.0])
  assert_eq(live.multiple_locator().unwrap().base(), locator.base())
  assert_eq(live.multiple_locator().unwrap().offset(), locator.offset())
  assert_eq(independent.base(), 2.5)
  assert_eq(independent.offset(), 0.75)
  assert_true(
    try {
      locator.set_params(base=-0.1)
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(locator.base(), 7.0)
  assert_eq(locator.offset(), -3.0)
  verify_multiple_reference_values(locator.tick_values(-1.0, 1.0), [-3.0, 4.0])
  assert_eq(live.multiple_locator().unwrap().base(), locator.base())
  assert_eq(live.multiple_locator().unwrap().offset(), locator.offset())
  assert_eq(independent.base(), 2.5)
  assert_eq(independent.offset(), 0.75)
  locator.set_params(base=0.1, offset=0.0)
  assert_eq(locator.base(), 0.1)
  assert_eq(locator.offset(), 0.0)
  verify_multiple_reference_values(locator.tick_values(-1.0, 1.0), [
    -1.1, -1.0, -0.9000000000000001, -0.8, -0.7000000000000001, -0.6000000000000001,
    -0.5, -0.4, -0.30000000000000004, -0.20000000000000007, -0.10000000000000009,
    0.0, 0.10000000000000009, 0.19999999999999996, 0.30000000000000004, 0.3999999999999999,
    0.5, 0.6000000000000001, 0.7, 0.8, 0.8999999999999999, 1.0, 1.1,
  ])
  assert_eq(live.multiple_locator().unwrap().base(), locator.base())
  assert_eq(live.multiple_locator().unwrap().offset(), locator.offset())
  assert_eq(independent.base(), 2.5)
  assert_eq(independent.offset(), 0.75)
}

///|
test "MultipleLocator original rejects nonpositive base 0.0" {
  assert_true(
    try {
      ignore(@ticker.MultipleLocator::new(base=0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "MultipleLocator original rejects nonpositive base -1.0" {
  assert_true(
    try {
      ignore(@ticker.MultipleLocator::new(base=-1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "MultipleLocator original rejects nonpositive base -5e-324" {
  assert_true(
    try {
      ignore(@ticker.MultipleLocator::new(base=-5.0e-324))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}
