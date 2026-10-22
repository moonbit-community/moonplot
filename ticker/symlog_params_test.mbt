///|
test "symlog defaults are fresh while a shallow copy retains the same subs" {
  let transform : @scale.Scale? = None
  let base : Double? = Some(10.0)
  let linthresh : Double? = Some(1.0)
  let first = @ticker.SymmetricalLogLocator::new(transform?, base?, linthresh?)
  let second = @ticker.SymmetricalLogLocator::new(base=10.0, linthresh=1.0)
  let shallow = first.copy()
  guard first.subs() is @ticker.SymLogSubs::Values(values) else {
    fail("expected numeric default subs")
  }
  values.set(0, 2.5)
  guard shallow.subs() is @ticker.SymLogSubs::Values(copied) else {
    fail("expected shared subs")
  }
  guard second.subs() is @ticker.SymLogSubs::Values(fresh) else {
    fail("expected independent default subs")
  }
  assert_eq(copied.to_array(), [2.5])
  assert_eq(fresh.to_array(), [1.0])
  let subs : @ticker.SymLogSubs? = None
  let numticks : @ticker.LogNumTicks? = None
  first.set_params(subs?, numticks?)
  assert_eq(values.to_array(), [2.5])
  assert_eq(
    first.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_int(15)),
  )
  shallow.set_params(
    subs=@ticker.SymLogSubs::Text("bad"),
    numticks=@ticker.LogNumTicks::Number(1.0),
  )
  assert_eq(
    first.numticks(),
    @ticker.LogNumTicks::Integer(@bigint.BigInt::from_int(15)),
  )
  assert_eq(values.to_array(), [2.5])
}

///|
test "symlog call requires its view before consuming invalid raw parameters" {
  let locator = @ticker.SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(@ticker.SymLogSubs::Text("auto")),
  )
  locator.set_numticks(@ticker.LogNumTicks::Text("auto"))
  assert_true(
    try {
      ignore(locator.call())
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message.contains("view interval")
      _ => false
    },
  )
  let reads = Ref(0)
  locator.bind_view_interval(fn() raise @core.DataError {
    reads.val += 1
    raise @core.DataError::InvalidTicks(message="symlog view failed")
  })
  assert_true(
    try {
      ignore(locator.call())
      false
    } catch {
      @core.DataError::InvalidTicks(message~) => message == "symlog view failed"
      _ => false
    },
  )
  assert_eq(reads.val, 1)
  let shallow = locator.copy()
  assert_true(shallow.view_interval_provider() is Some(_))
  assert_true(
    try {
      ignore(shallow.view_interval_provider().unwrap()())
      false
    } catch {
      @core.DataError::InvalidTicks(message~) => message == "symlog view failed"
      _ => false
    },
  )
  assert_eq(reads.val, 2)
  locator.bind_view_interval(fn() { (-0.5, 0.5) })
  assert_eq(locator.call(), [-0.5, 0.0, 0.5])
  assert_eq(locator.nonsingular(0.0, 0.0), (-0.05, 0.05))
}

///|
test "symlog result arrays are independent of retained subs buffers" {
  let owner = [1L, 2L]
  let locator = @ticker.SymmetricalLogLocator::new(
    base=10.0,
    linthresh=1.0,
    subs=Some(
      @ticker.SymLogSubs::Values(@ticker.TickValues::from_int64_array(owner)),
    ),
  )
  let result = locator.tick_values(-10.0, 10.0)
  result[0] = 123.0
  assert_eq(owner, [1L, 2L])
  guard locator.subs() is @ticker.SymLogSubs::Values(values) else {
    fail("expected retained integer subs")
  }
  values.set(0, 3.75)
  assert_eq(owner, [3L, 2L])
  assert_eq(result[0], 123.0)
}
