///|
test "linear normalize maps values and can invert them" {
  let norm = try! @colors.normalize(vmin=-1.0, vmax=3.0)
  assert_eq(norm.transform(-1.0), 0.0)
  assert_eq(norm.transform(1.0), 0.5)
  assert_eq(norm.transform(3.0), 1.0)
  assert_eq(norm.transform(-3.0), -0.5)
  assert_eq(norm.inverse(0.25), 0.0)
}

///|
test "linear normalize clips and autoscale ignores non-finite data" {
  let norm = try! @colors.normalize(clip=true)
  try! norm.autoscale([@double.not_a_number, 2.0, 4.0, @double.infinity])
  assert_eq(norm.vmin(), Some(2.0))
  assert_eq(norm.vmax(), Some(4.0))
  assert_eq(norm.transform(0.0), 0.0)
  assert_eq(norm.transform(6.0), 1.0)
}

///|
test "log normalize maps positive values and rejects invalid bounds" {
  let norm = try! @colors.log_norm(vmin=1.0, vmax=100.0)
  assert_eq(norm.transform(1.0), 0.0)
  assert_eq(norm.transform(10.0), 0.5)
  assert_eq(norm.transform(100.0), 1.0)
  assert_eq(norm.inverse(0.5), 10.0)
  try @colors.log_norm(vmin=0.0) catch {
    @colors.NormalizeError::InvalidBounds(message~) =>
      assert_true(message.contains("positive"))
    _ => fail("expected positive bound error")
  } noraise {
    _ => fail("expected a normalization error")
  }
}

///|
test "color norm wraps linear and logarithmic implementations" {
  let linear = @colors.linear_color_norm(
    try! @colors.normalize(vmin=0.0, vmax=1.0),
  )
  let logarithmic = @colors.log_color_norm(
    try! @colors.log_norm(vmin=1.0, vmax=10.0),
  )
  assert_eq(linear.transform(0.5), 0.5)
  assert_eq(logarithmic.transform(10.0), 1.0)
  assert_true(!logarithmic.is_valid(0.0))
}

///|
test "boundary normalize maps intervals and is explicitly non-invertible" {
  let boundary = try! @colors.boundary_norm([0.0, 1.0, 3.0], 3)
  assert_eq(boundary.boundaries(), [0.0, 1.0, 3.0])
  assert_eq(boundary.index(0.5), 0)
  assert_eq(boundary.index(2.0), 2)
  assert_eq(boundary.transform(0.5), 0.0)
  assert_eq(boundary.transform(2.0), 1.0)
  assert_eq(boundary.index(3.0), 3)
  try boundary.inverse(0.5) catch {
    @colors.NormalizeError::NotInvertible => ()
    _ => fail("expected a non-invertible boundary norm")
  } noraise {
    _ => fail("expected a non-invertible boundary norm")
  }
  let norm = @colors.boundary_color_norm(boundary)
  assert_eq(norm.vmin(), Some(0.0))
  assert_eq(norm.vmax(), Some(3.0))
  assert_true(norm.scaled())
}

///|
test "boundary normalize validates boundaries" {
  try @colors.boundary_norm([0.0, 0.0], 2) catch {
    @colors.NormalizeError::InvalidBounds(message~) =>
      assert_true(message.contains("strictly increasing"))
    _ => fail("expected invalid boundary error")
  } noraise {
    _ => fail("expected a normalization error")
  }
  try @colors.boundary_norm([0.0, 1.0, 2.0, 3.0], 2) catch {
    @colors.NormalizeError::InvalidBounds(message~) =>
      assert_true(message.contains("ncolors"))
    _ => fail("expected an insufficient color count error")
  } noraise {
    _ => fail("expected an insufficient color count error")
  }
}

///|
test "boundary normalize stretches sparse bins across extra colors" {
  let boundary = try! @colors.boundary_norm([0.0, 1.0, 2.0, 3.0], 5)
  assert_eq(boundary.index(0.5), 0)
  assert_eq(boundary.index(1.5), 2)
  assert_eq(boundary.index(2.5), 4)
  let clipped = try! @colors.boundary_norm([0.0, 1.0, 2.0], 4, clip=true)
  assert_eq(clipped.index(-1.0), 0)
  assert_eq(clipped.index(4.0), 3)
}

///|
test "boundary normalize supports extension bins" {
  let extended = try! @colors.boundary_norm(
    [0.0, 1.0, 2.0],
    4,
    extend_mode="both",
  )
  assert_eq(extended.index(-1.0), -1)
  assert_eq(extended.index(0.5), 1)
  assert_eq(extended.index(1.5), 2)
  assert_eq(extended.index(3.0), 4)
  try
    @colors.boundary_norm([0.0, 1.0, 2.0], 4, clip=true, extend_mode="min")
  catch {
    @colors.NormalizeError::InvalidBounds(message~) =>
      assert_true(message.contains("not compatible"))
    _ => fail("expected incompatible clip and extend error")
  } noraise {
    _ => fail("expected incompatible clip and extend error")
  }
}

///|
test "symmetric-log normalize maps both signs and inverts" {
  let norm = try! @colors.symlog_norm(1.0, vmin=-100.0, vmax=100.0)
  assert_true(Double::abs(norm.transform(-100.0) - 0.0) < 1.0e-12)
  assert_true(Double::abs(norm.transform(-10.0) - 0.1607142857142857) < 1.0e-12)
  assert_true(Double::abs(norm.transform(-1.0) - 0.3214285714285714) < 1.0e-12)
  assert_eq(norm.transform(0.0), 0.5)
  assert_true(Double::abs(norm.transform(10.0) - 0.8392857142857143) < 1.0e-12)
  assert_true(Double::abs(norm.inverse(0.1607142857142857) + 10.0) < 1.0e-10)
  let wrapped = @colors.symlog_color_norm(norm)
  assert_true(
    Double::abs(wrapped.transform(1.0) - 0.6785714285714286) < 1.0e-12,
  )
}

///|
test "symmetric-log normalize validates parameters and autoscaling" {
  let norm = try! @colors.symlog_norm(2.0)
  try! norm.autoscale([@double.not_a_number, -4.0, 8.0, @double.infinity])
  assert_eq(norm.vmin(), Some(-4.0))
  assert_eq(norm.vmax(), Some(8.0))
  assert_true(norm.transform(0.0) >= 0.0)
  try @colors.symlog_norm(0.0) catch {
    @colors.NormalizeError::InvalidBounds(message~) =>
      assert_true(message.contains("linthresh"))
    _ => fail("expected an invalid threshold error")
  } noraise {
    _ => fail("expected a normalization error")
  }
  try @colors.symlog_norm(1.0, base=1.0) catch {
    @colors.NormalizeError::InvalidBase(message~) =>
      assert_true(message.contains("greater than 1"))
    _ => fail("expected an invalid base error")
  } noraise {
    _ => fail("expected a normalization error")
  }
}

///|
test "two-slope normalize preserves a diverging center" {
  let norm = try! @colors.two_slope_norm(0.0, vmin=-4.0, vmax=10.0)
  assert_eq(norm.vcenter(), 0.0)
  assert_eq(norm.transform(-4.0), 0.0)
  assert_eq(norm.transform(0.0), 0.5)
  assert_eq(norm.transform(10.0), 1.0)
  assert_eq(norm.transform(-2.0), 0.25)
  assert_eq(norm.transform(5.0), 0.75)
  assert_eq(norm.transform_array([-4.0, 0.0, 10.0]), [0.0, 0.5, 1.0])
  assert_eq(norm.inverse(0.25), -2.0)
  assert_eq(norm.inverse(0.75), 5.0)
  let wrapped = @colors.two_slope_color_norm(norm)
  assert_eq(wrapped.transform(0.0), 0.5)
}

///|
test "two-slope normalize includes the center when autoscaling one-sided data" {
  let positive = try! @colors.two_slope_norm(0.0)
  positive.autoscale_none([1.0, 2.0])
  assert_eq(positive.vmin(), Some(0.0))
  assert_eq(positive.vmax(), Some(2.0))
  assert_eq(positive.transform(1.0), 0.75)

  let negative = try! @colors.two_slope_norm(0.0)
  negative.autoscale_none([-2.0, -1.0])
  assert_eq(negative.vmin(), Some(-2.0))
  assert_eq(negative.vmax(), Some(0.0))
  assert_eq(negative.transform(-1.0), 0.25)

  try @colors.two_slope_norm(0.0, vmin=0.0, vmax=1.0) catch {
    @colors.NormalizeError::InvalidBounds(message~) =>
      assert_true(message.contains("vmin"))
    _ => fail("expected a strict center ordering error")
  } noraise {
    _ => fail("expected a normalization error")
  }
}

///|
test "power normalize applies an exponent and inverts it" {
  let norm = try! @colors.power_norm(2.0, vmin=0.0, vmax=4.0)
  assert_eq(norm.gamma(), 2.0)
  assert_eq(norm.transform(0.0), 0.0)
  assert_eq(norm.transform(2.0), 0.25)
  assert_eq(norm.transform(4.0), 1.0)
  assert_eq(norm.inverse(0.25), 2.0)
  let clipped = try! @colors.power_norm(2.0, vmin=0.0, vmax=4.0, clip=true)
  assert_eq(clipped.transform(6.0), 1.0)
  let wrapped = @colors.power_color_norm(norm)
  assert_eq(wrapped.transform(2.0), 0.25)
}

///|
test "power normalize rejects invalid exponents and clamps below the lower bound" {
  let norm = try! @colors.power_norm(0.5, vmin=2.0, vmax=6.0)
  assert_eq(norm.transform(1.0), 0.0)
  assert_true(norm.transform(4.0) > 0.0)
  try @colors.power_norm(0.0) catch {
    @colors.NormalizeError::InvalidBounds(message~) =>
      assert_true(message.contains("gamma"))
    _ => fail("expected an invalid gamma error")
  } noraise {
    _ => fail("expected a normalization error")
  }
  try norm.inverse(-0.1) catch {
    @colors.NormalizeError::InvalidValue(message~) =>
      assert_true(message.contains("non-negative"))
    _ => fail("expected an invalid inverse value error")
  } noraise {
    _ => fail("expected a normalization error")
  }
}

///|
test "color norm autoscale dispatches to its concrete normalization" {
  let norm = @colors.power_color_norm(try! @colors.power_norm(2.0))
  try! norm.autoscale([@double.not_a_number, 1.0, 3.0, @double.infinity])
  assert_eq(norm.vmin(), Some(1.0))
  assert_eq(norm.vmax(), Some(3.0))
  assert_eq(norm.transform(2.0), 0.25)
}

///|
test "centered normalize derives a symmetric range around its center" {
  let norm = try! @colors.centered_norm(vcenter=1.0)
  norm.autoscale_none([-1.0, 0.0, 1.0, 4.0])
  assert_eq(norm.vcenter(), 1.0)
  assert_eq(norm.halfrange(), Some(3.0))
  assert_eq(norm.vmin(), Some(-2.0))
  assert_eq(norm.vmax(), Some(4.0))
  assert_eq(norm.transform(-2.0), 0.0)
  assert_eq(norm.transform(1.0), 0.5)
  assert_eq(norm.transform(4.0), 1.0)
  assert_eq(norm.inverse(0.25), -0.5)
  let wrapped = @colors.centered_color_norm(norm)
  assert_eq(wrapped.transform(1.0), 0.5)
}

///|
test "centered normalize supports explicit half-range and updates with the center" {
  let norm = try! @colors.centered_norm(vcenter=0.0, halfrange=2.0, clip=true)
  assert_eq(norm.vmin(), Some(-2.0))
  assert_eq(norm.vmax(), Some(2.0))
  assert_eq(norm.transform(3.0), 1.0)
  norm.set_vcenter(5.0)
  assert_eq(norm.vmin(), Some(3.0))
  assert_eq(norm.vmax(), Some(7.0))
  try! norm.set_halfrange(None)
  assert_true(!norm.scaled())
  try @colors.centered_norm(halfrange=-1.0) catch {
    @colors.NormalizeError::InvalidBounds(message~) =>
      assert_true(message.contains("halfrange"))
    _ => fail("expected an invalid half-range error")
  } noraise {
    _ => fail("expected a normalization error")
  }
}
