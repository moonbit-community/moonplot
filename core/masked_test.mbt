///|
test "masked arrays preserve values and expose plotting form" {
  let data = try! @core.masked_array([1.0, 2.0, 3.0], mask=[false, true, false])
  assert_eq(data.length(), 3)
  assert_eq(data.count(), 2)
  assert_true(data.is_masked(1))
  assert_eq(data.compressed(), [1.0, 3.0])
  let plotted = data.to_array()
  assert_eq(plotted[0], 1.0)
  assert_true(plotted[1].is_nan())
  assert_eq(data.filled(-1.0), [1.0, -1.0, 3.0])
}

///|
test "masked array operations propagate masks and invalid results" {
  let left = try! @core.masked_array([1.0, 2.0, 3.0], mask=[false, true, false])
  let right = try! @core.masked_array([4.0, 5.0, 6.0], mask=[false, false, true])
  let sum = try! left.zip_map(right, (x, y) => x + y)
  assert_eq(sum.values(), [5.0, 2.0, 3.0])
  assert_eq(sum.mask(), [false, true, true])
  let invalid = left.map(_ => 1.0 / 0.0)
  assert_eq(invalid.mask(), [true, true, true])
}

///|
test "masked matrix validates shape and copies rows" {
  let matrix = try! @core.masked_matrix([[1.0, 2.0], [3.0, 4.0]], mask=[
    [false, true],
    [false, false],
  ])
  assert_eq(matrix.rows(), 2)
  assert_eq(matrix.columns(), 2)
  assert_eq(matrix.count(), 3)
  assert_eq(matrix.filled(-1.0), [[1.0, -1.0], [3.0, 4.0]])
  let mapped = matrix.map(x => x * 2.0)
  assert_eq(mapped.values(), [[2.0, 2.0], [6.0, 8.0]])
  assert_eq(mapped.mask(), [[false, true], [false, false]])
}

///|
test "masked constructors reject incompatible masks" {
  try @core.masked_array([1.0, 2.0], mask=[true]) catch {
    @core.MaskError::InvalidShape(message~) =>
      assert_true(message.contains("same length"))
  } noraise {
    _ => fail("expected a masked array shape error")
  }
  try @core.masked_matrix([[1.0, 2.0]], mask=[[true]]) catch {
    @core.MaskError::InvalidShape(message~) =>
      assert_true(message.contains("match values"))
  } noraise {
    _ => fail("expected a masked matrix shape error")
  }
}

///|
test "masked constructors copy inputs and support empty shapes" {
  let values = [1.0, 2.0]
  let mask = [false, true]
  let data = try! @core.masked_array(values, mask~)
  values[0] = 99.0
  mask[0] = true
  data.values()[0] = -99.0
  data.mask()[1] = false
  data.filled(-1.0)[0] = -99.0
  assert_eq(data.values(), [1.0, 2.0])
  assert_eq(data.mask(), [false, true])

  let empty = try! @core.masked_array([], mask=[])
  assert_eq(empty.length(), 0)
  assert_true(empty.all_masked())
  let empty_matrix = try! @core.masked_matrix([], mask=[])
  assert_eq(empty_matrix.rows(), 0)
  assert_eq(empty_matrix.columns(), 0)
  assert_eq(empty_matrix.count(), 0)

  try @core.masked_array([1.0], mask=[]) catch {
    @core.MaskError::InvalidShape(message~) =>
      assert_true(message.contains("same length"))
  } noraise {
    _ => fail("expected an explicit empty mask to be rejected")
  }
  try @core.masked_matrix([[1.0], [2.0, 3.0]]) catch {
    @core.MaskError::InvalidShape(message~) =>
      assert_true(message.contains("equal length"))
  } noraise {
    _ => fail("expected ragged matrix values to be rejected")
  }
}

///|
test "mask propagation skips callbacks and rejects unequal operands" {
  let left = try! @core.masked_array([2.0, 0.0, 6.0, 8.0], mask=[
    false, true, false, false,
  ])
  let right = try! @core.masked_array([1.0, 0.0, 3.0, 0.0], mask=[
    false, false, true, false,
  ])
  let mut calls = 0
  let result = try! left.zip_map(right, (a, b) => {
    calls += 1
    a / b
  })
  assert_eq(calls, 2)
  assert_eq(result.mask(), [false, true, true, true])
  assert_eq(result.compressed(), [2.0])
  calls = 0
  let mapped = left.map(x => {
    calls += 1
    x * 2.0
  })
  assert_eq(calls, 3)
  assert_eq(mapped.compressed(), [4.0, 12.0, 16.0])
  let short = try! @core.masked_array([1.0])
  try left.zip_map(short, (a, b) => a + b) catch {
    @core.DataError::LengthMismatch(expected~, actual~) => {
      assert_eq(expected, 4)
      assert_eq(actual, 1)
    }
    _ => fail("expected unequal mask operands to be rejected")
  } noraise {
    _ => fail("expected a length error")
  }
}

///|
test "finite values differ from the explicit mask count" {
  let data = try! @core.masked_array(
    [2.0, 0.0 / 0.0, 1.0 / 0.0, 1000.0, -3.0],
    mask=[false, false, false, true, false],
  )
  assert_eq(data.count(), 4)
  assert_eq(data.compressed().length(), 4)
  assert_eq(data.finite_values(), [2.0, -3.0])
  assert_true(!data.all_masked())
  let missing = try! @core.masked_array([1.0, 2.0], mask=[true, true])
  assert_true(missing.all_masked())
  assert_eq(missing.compressed(), [])
  assert_eq(missing.finite_values(), [])
}
