///|
test "auto minor unbound providers fail at the first required operation" {
  let locator = @ticker.AutoMinorLocator::new()
  assert_true(
    try {
      ignore(locator.call())
      false
    } catch {
      @core.DataError::InvalidTicks(message~) => message.contains("scale")
      _ => false
    },
  )
  locator.bind_scale(fn() { "linear" })
  assert_true(
    try {
      ignore(locator.call())
      false
    } catch {
      @core.DataError::InvalidTicks(message~) => message.contains("major")
      _ => false
    },
  )
  locator.bind_major_ticks(fn() { @ticker.TickValues::from_array([0.0, 1.0]) })
  assert_true(
    try {
      ignore(locator.call())
      false
    } catch {
      @core.DataError::InvalidTicks(message~) => message.contains("name")
      _ => false
    },
  )
  assert_true(locator.ndivs() is None)
  locator.set_ndivs(Some(@config.MinorTickDivisions::Number(2.0)))
  assert_true(
    try {
      ignore(locator.call())
      false
    } catch {
      @core.DataError::InvalidTicks(message~) => message.contains("view")
      _ => false
    },
  )
  assert_eq(locator.ndivs(), Some(@config.MinorTickDivisions::Number(2.0)))
}

///|
test "auto minor inherited limit helpers preserve finite and nonfinite ranges" {
  let locator = @ticker.AutoMinorLocator::new()
  locator.set_params()
  assert_eq(locator.warnings().length(), 1)
  assert_eq(locator.view_limits(0.0, 0.0), (-0.001, 0.001))
  assert_eq(locator.warnings(), [])
  locator.set_params()
  assert_eq(locator.nonsingular(0.0, 0.0), (-0.05, 0.05))
  assert_eq(locator.warnings(), [])
  assert_eq(locator.view_limits(3.0, -1.0), (-1.0, 3.0))
  assert_eq(locator.nonsingular(3.0, -1.0), (-1.0, 3.0))
  assert_eq(locator.view_limits(0.0 / 0.0, 1.0 / 0.0), (-0.001, 0.001))
  assert_eq(locator.nonsingular(-1.0 / 0.0, 0.0), (-0.05, 0.05))
  locator.set_params()
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(locator.warnings(), [])
}

///|
test "auto minor provider getters share captured closures until independent rebind" {
  let locator = @ticker.AutoMinorLocator::new(
    ndivs=Some(@config.MinorTickDivisions::Number(2.0)),
  )
  let scale = Ref("linear")
  let name = Ref("x")
  let majors = [0L, 1L]
  let view = Ref((0.0, 1.0))
  locator.bind_scale(fn() { scale.val })
  locator.bind_axis_name(fn() { name.val })
  locator.bind_major_ticks(fn() { @ticker.TickValues::from_int64_array(majors) })
  locator.bind_view_interval(fn() { view.val })
  let shallow = locator.copy()
  scale.val = "symlog"
  name.val = "y"
  majors[1] = 2L
  view.val = (0.0, 2.0)
  assert_eq(shallow.scale_provider().unwrap()(), "symlog")
  assert_eq(shallow.axis_name_provider().unwrap()(), "y")
  assert_eq(shallow.major_ticks_provider().unwrap()().to_array(), [0.0, 2.0])
  assert_eq(shallow.view_interval_provider().unwrap()(), (0.0, 2.0))
  assert_eq(shallow.call(), [0.0, 1.0, 2.0])
  locator.bind_scale(fn() { "log" })
  assert_eq(locator.call(), [])
  assert_eq(shallow.call(), [0.0, 1.0, 2.0])
  shallow.set_ndivs(Some(@config.MinorTickDivisions::Number(4.0)))
  assert_eq(locator.ndivs(), Some(@config.MinorTickDivisions::Number(2.0)))
  assert_eq(shallow.call(), [0.0, 0.5, 1.0, 1.5, 2.0])
}
