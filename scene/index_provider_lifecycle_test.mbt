///|
test "Index axis context survives presentation clear and later artist replacement" {
  let figure = @scene.figure()
  let axes = figure.axes()
  axes.plot([0.0, 4.0], [10.0, 14.0])
  let x = @ticker.IndexLocator::new(base=2.0, offset=0.0)
  let y = @ticker.IndexLocator::new(base=2.0, offset=0.0)
  axes.set_x_locator(x.as_locator())
  axes.set_y_locator(y.as_locator())
  let x_copy = x.copy()
  let y_copy = y.copy()
  axes.x_axis().clear()
  axes.y_axis().clear()
  assert_eq(x.call(), [0.0, 2.0, 4.0])
  assert_eq(y.call(), [10.0, 12.0, 14.0])
  axes.clear()
  axes.plot([20.0, 24.0], [30.0, 34.0])
  // Existing handles observe new data without another axis getter or installation.
  assert_eq(x.call(), [20.0, 22.0, 24.0])
  assert_eq(y.call(), [30.0, 32.0, 34.0])
  assert_eq(x_copy.call(), [20.0, 22.0, 24.0])
  assert_eq(y_copy.call(), [30.0, 32.0, 34.0])
}
