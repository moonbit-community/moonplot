///|
test "named MaxN contour levels preserve live parameters and checked locator errors" {
  let previous = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous))
  @config.set_axes_autolimit_mode("data")
  let figure = @scene.figure()
  let data = [[0.0, 2.0], [8.0, 10.0]]
  let locator = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Count(0))
  assert_true(
    try {
      ignore(figure.contour(data, locator=locator.as_locator()))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  locator.set_params(nbins=@ticker.MaxNBins::Count(3))
  let first = figure.contour(data, locator=locator.as_locator())
  assert_eq(first.levels(), [0.0, 4.0, 8.0, 12.0])
  locator.set_params(nbins=@ticker.MaxNBins::Count(2))
  assert_eq(figure.contourf(data, locator=locator.as_locator()).levels(), [
    0.0, 5.0, 10.0,
  ])
  assert_eq(first.levels(), [0.0, 4.0, 8.0, 12.0])
}

///|
test "copied MaxN provider retains automatic detached axes views" {
  let previous = @config.axes_autolimit_mode()
  defer (try! @config.set_axes_autolimit_mode(previous))
  @config.set_axes_autolimit_mode("data")
  let figure = @scene.figure()
  let axes = figure.axes()
  axes.plot([20.0, 40.0], [20.0, 40.0])
  let locator = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Count(3))
  axes.set_x_locator(locator.as_locator())
  let copied = locator.copy()
  let original = copied.call()
  axes.remove()
  assert_eq(copied.call(), original)
  assert_eq(locator.call(), original)
  axes.plot([100.0], [100.0])
  assert_true(copied.call() != original)
}
