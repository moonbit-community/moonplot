///|
test "series preserves samples and computes finite bounds" {
  let nan = 0.0 / 0.0
  let pos_inf = 1.0 / 0.0
  let values = try! @core.series([1.0, nan, 3.0], [2.0, pos_inf, -4.0])
  assert_eq(values.length(), 3)
  assert_true(values.x()[1].is_nan())
  assert_true(values.y()[1].is_inf())
  match values.finite_bounds() {
    Some(limits) => {
      assert_true(limits.xmin() == 1.0)
      assert_true(limits.xmax() == 3.0)
      assert_true(limits.ymin() == -4.0)
      assert_true(limits.ymax() == 2.0)
    }
    None => fail("finite samples should produce bounds")
  }
}

///|
test "series owns its arrays" {
  let xs = [1.0, 2.0]
  let ys = [3.0, 4.0]
  let values = try! @core.series(xs, ys)
  xs.push(5.0)
  let returned = values.x()
  returned.push(6.0)
  assert_eq(values.length(), 2)
  assert_eq(values.x().length(), 2)
}

///|
test "series rejects mismatched lengths" {
  try @core.series([1.0, 2.0], [3.0]) catch {
    @core.DataError::LengthMismatch(expected~, actual~) => {
      assert_eq(expected, 2)
      assert_eq(actual, 1)
    }
    @core.DataError::NonFiniteLimit(_) => fail("unexpected limit error")
    @core.DataError::InvalidErrorBar(_) => fail("unexpected error bar error")
    @core.DataError::InvalidBins => fail("unexpected histogram error")
    @core.DataError::InvalidImage(_) => fail("unexpected image error")
    @core.DataError::InvalidPie(_) => fail("unexpected pie error")
    @core.DataError::InvalidBoxPlot(_) => fail("unexpected boxplot error")
    @core.DataError::InvalidQuiver(_) => fail("unexpected quiver error")
    @core.DataError::InvalidViolin(_) => fail("unexpected violin error")
    @core.DataError::InvalidReference(_) => fail("unexpected reference error")
    @core.DataError::InvalidContour(_) => fail("unexpected contour error")
    @core.DataError::InvalidAnnotation(_) => fail("unexpected annotation error")
    @core.DataError::InvalidStreamplot(_) => fail("unexpected streamplot error")
    @core.DataError::InvalidStatistics(_) => fail("unexpected statistics error")
    @core.DataError::InvalidTicks(_) => fail("unexpected tick error")
    @core.DataError::InvalidCollection(_) => fail("unexpected collection error")
  } noraise {
    _ => fail("expected a length mismatch")
  }
}

///|
test "bounds from points ignores missing samples" {
  let missing = @core.point(0.0 / 0.0, 4.0)
  match
    @core.bounds_from_points([
      missing,
      @core.point(-2.0, 1.0),
      @core.point(5.0, 3.0),
    ]) {
    Some(limits) => {
      assert_true(limits.xmin() == -2.0)
      assert_true(limits.xmax() == 5.0)
      assert_true(limits.ymin() == 1.0)
      assert_true(limits.ymax() == 3.0)
    }
    None => fail("finite points should produce bounds")
  }
}

///|
test "limits preserve reversed direction" {
  let axis = @core.limits(10.0, 0.0)
  assert_true(axis.lower() == 10.0)
  assert_true(axis.upper() == 0.0)
  assert_true(axis.is_finite())
}
