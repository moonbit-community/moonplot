///|
test "Null named adapters dispatch before finite bounds checks and preserve live diagnostics" {
  let locator = @ticker.NullLocator::new()
  let major = locator.as_locator()
  let minor = locator.as_minor_locator()
  let nan = 0.0 / 0.0
  let infinity = 1.0 / 0.0
  locator.set_params()
  assert_eq(locator.warnings().length(), 1)
  assert_eq(major.checked_tick_values(nan, infinity), [])
  assert_eq(locator.warnings(), [])
  assert_eq(minor.checked_tick_values([nan, infinity], nan, infinity), [])
  assert_eq(major.tick_values(nan, infinity), [])
  assert_eq(minor.tick_values([nan], infinity, nan), [])
  assert_eq(@ticker.Locator::Fixed([]).tick_values(0.0, 1.0), [])
  locator.set_params()
  ignore(locator.view_limits(0.0, 0.0))
  assert_eq(locator.warnings(), [])
  locator.set_params()
  ignore(locator.nonsingular(0.0, 0.0))
  assert_eq(locator.warnings(), [])
}

///|
test "AutoMinor direct tick values remains unsupported after a valid call" {
  let locator = @ticker.AutoMinorLocator::new(
    ndivs=Some(@config.MinorTickDivisions::Number(2.0)),
  )
  locator.bind_scale(() => "linear")
  locator.bind_axis_name(() => "x")
  locator.bind_major_ticks(() => @ticker.TickValues::from_array([0.0, 1.0]))
  locator.bind_view_interval(() => (0.0, 1.0))
  assert_eq(locator.call(), [0.0, 0.5, 1.0])
  assert_true(
    try {
      ignore(
        locator.as_minor_locator().checked_tick_values([0.0, 1.0], 0.0, 1.0),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}
