///|
test "masked matrices own rows and return independent copies" {
  let row = [1.0, 2.0]
  let mask_row = [false, true]
  let values = [row, row]
  let mask = [mask_row, mask_row]
  let data = try! @core.masked_matrix(values, mask~)
  row[0] = 99.0
  mask_row[0] = true
  values[1] = [100.0]
  mask[1] = [true]
  let exported_values = data.values()
  let exported_mask = data.mask()
  exported_values[0][0] = -99.0
  exported_mask[0][0] = true
  assert_eq(exported_values[1], [1.0, 2.0])
  assert_eq(exported_mask[1], [false, true])
  assert_eq(data.values(), [[1.0, 2.0], [1.0, 2.0]])
  assert_eq(data.mask(), [[false, true], [false, true]])
  assert_true(data.is_masked(1, 1))
  let filled = data.filled(-1.0)
  filled[0][0] = 99.0
  assert_eq(filled[1], [1.0, -1.0])
  assert_eq(data.finite_values(), [1.0, 1.0])
  assert_true(data.to_array()[1][1].is_nan())
}

///|
test "matrix masks reject missing rows and ragged widths" {
  for mask in [[], [[false, true]], [[false, true], [false]]] {
    try @core.masked_matrix([[1.0, 2.0], [3.0, 4.0]], mask~) catch {
      @core.MaskError::InvalidShape(_) => ()
    } noraise {
      _ => fail("expected invalid matrix mask shape")
    }
  }
  let zero_columns = try! @core.masked_matrix([[], []])
  assert_eq(zero_columns.rows(), 2)
  assert_eq(zero_columns.columns(), 0)
  assert_eq(zero_columns.mask(), [[], []])
  assert_eq(zero_columns.to_array(), [[], []])
}

///|
test "matrix maps mask invalid results without visiting masked cells" {
  let data = try! @core.masked_matrix([[1.0, 100.0], [0.0 / 0.0, 2.0]], mask=[
    [false, true],
    [false, false],
  ])
  assert_eq(data.count(), 3)
  assert_eq(data.finite_values(), [1.0, 2.0])
  let mut calls = 0
  let result = data.map(x => {
    calls += 1
    1.0 / (x - 1.0)
  })
  assert_eq(calls, 3)
  assert_eq(result.mask(), [[true, true], [true, false]])
  assert_eq(result.finite_values(), [1.0])
}
