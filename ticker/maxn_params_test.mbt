///|
test "MaxN defaults own distinct arrays while shallow copies share steps and getter copies staircase" {
  let first = @ticker.MaxNLocator::new()
  let second = @ticker.MaxNLocator::new()
  let shallow = first.copy()
  first.steps().set(0, 1.25)
  assert_eq(first.steps().get(0), 1.25)
  assert_eq(shallow.steps().get(0), 1.25)
  assert_eq(second.steps().get(0), 1.0)
  assert_eq(first.extended_steps()[0], 0.1)
  let returned = first.extended_steps()
  returned[0] = 777.0
  assert_eq(first.extended_steps()[0], 0.1)
  assert_eq(shallow.extended_steps()[0], 0.1)
}

///|
test "MaxN nested optional payloads keep omission separate from explicit reset" {
  let locator = @ticker.MaxNLocator::new(prune="lower")
  let custom = @ticker.TickValues::from_array([1.0, 2.0, 10.0])
  locator.set_params(steps=Some(custom), prune=Some("both"))
  locator.set_params()
  assert_eq(locator.steps().to_array(), [1.0, 2.0, 10.0])
  assert_eq(locator.prune(), Some("both"))
  let reset_steps : @ticker.TickValues? = None
  let reset_prune : String? = None
  locator.set_params(steps=reset_steps, prune=reset_prune)
  assert_eq(locator.steps().to_array(), [
    1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0,
  ])
  assert_eq(locator.prune(), None)
}

///|
test "MaxN copies retain checked view providers and independent rebinding" {
  let locator = @ticker.MaxNLocator::new()
  locator.bind_view_interval(() => {
    raise @core.DataError::InvalidTicks(message="checked provider failure")
  })
  let shallow = locator.copy()
  assert_true(
    try {
      ignore(shallow.view_interval_provider().unwrap()())
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "checked provider failure"
      _ => false
    },
  )
  shallow.bind_view_interval(() => (2.0, 4.0))
  assert_eq(shallow.view_interval_provider().unwrap()(), (2.0, 4.0))
  assert_true(
    try {
      ignore(locator.view_interval_provider().unwrap()())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "MaxN malformed borrowed input reports shape errors after earlier parameter updates" {
  let locator = @ticker.MaxNLocator::new()
  let buffer = [1.0, 2.0, 10.0]
  let steps = @ticker.TickValues::from_array(buffer)
  ignore(buffer.pop())
  assert_true(
    try {
      locator.set_params(
        nbins=@ticker.MaxNBins::Count(7),
        symmetric=true,
        prune=Some("both"),
        min_n_ticks=5,
        steps=Some(steps),
        integer=true,
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(locator.nbins(), @ticker.MaxNBins::Count(7))
  assert_true(locator.symmetric())
  assert_eq(locator.prune(), Some("both"))
  assert_eq(locator.min_n_ticks(), 5)
  assert_true(!locator.integer())
  assert_eq(locator.steps().length(), 10)
}
