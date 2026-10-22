///|
test "FixedLocator borrowing versus list ownership and uncapped view" {
  let positions = [3.0, 1.0, -2.0]
  let borrowed = @ticker.FixedLocator::new(positions)
  let copied_list = @ticker.FixedLocator::from_list(positions)
  positions[1] = 8.0
  assert_eq(borrowed.values().to_array(), [3.0, 8.0, -2.0])
  assert_eq(copied_list.values().to_array(), [3.0, 1.0, -2.0])
  let large = Array::makei(100005, index => Double::from_int(index))
  let view = @ticker.FixedLocator::new(large).values()
  assert_eq(view.length(), 100005)
  assert_eq(view.get(100004), 100004.0)
  view.set(100004, 2.5)
  assert_eq(large[100004], 2.5)
}

///|
test "FixedLocator parameter failures are delayed and None does not repair" {
  let locator = @ticker.FixedLocator::new([0.0, 1.0], nbins=0.0)
  assert_eq(locator.nbins(), Some(2.0))
  assert_eq(locator.values().to_array(), [0.0, 1.0])
  locator.set_params(nbins=0.0)
  locator.set_params()
  assert_eq(locator.nbins(), Some(0.0))
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(locator.view_limits(1.0, 1.0), (0.999, 1.001))
  locator.set_params(nbins=-1.0)
  assert_eq(locator.values().to_array(), [0.0, 1.0])
}

///|
test "FixedLocator old tick views retain shape and report external shrink" {
  let positions = [4.0, 1.0, 0.0, -1.0, -4.0]
  let locator = @ticker.FixedLocator::new(positions, nbins=2.0)
  let old = locator.values()
  assert_eq(old.length(), 1)
  positions.push(3.0)
  assert_eq(old.length(), 1)
  assert_eq(old.get(0), 0.0)
  positions.clear()
  assert_true(
    try {
      ignore(old.get(0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      old.set(0, 9.0)
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(old.to_array())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(locator.values())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "FixedLocator copy separates nbins and tick copy separates result values" {
  let positions = [4.0, 1.0, 0.0, -1.0, -4.0]
  let locator = @ticker.FixedLocator::new(positions, nbins=2.0)
  let shallow = locator.copy()
  let source_view = shallow.values()
  let independent = source_view.copy()
  source_view.set(0, 7.0)
  assert_eq(locator.locations().get(2), 7.0)
  assert_eq(independent.get(0), 0.0)
  independent.set(0, -8.0)
  assert_eq(positions[2], 7.0)
  shallow.set_params(nbins=-2.0)
  assert_eq(locator.nbins(), Some(2.0))
  assert_eq(shallow.values().to_array(), positions)
}

///|
test "FixedLocator borrows a strided input and composes result strides into the owner" {
  let owner = [9.0, 4.0, 7.0, 1.0, 6.0, 0.0, 5.0, -1.0, 3.0, -4.0]
  let supplied = @ticker.TickValues::from_array(owner).view(1, 2, 5)
  let locator = @ticker.FixedLocator::from_view(supplied, nbins=2.0)
  let shallow = locator.copy()
  let selected = locator.values()
  assert_eq(selected.to_array(), [0.0])
  selected.set(0, 42.25)
  assert_eq(owner, [9.0, 4.0, 7.0, 1.0, 6.0, 42.25, 5.0, -1.0, 3.0, -4.0])
  assert_eq(shallow.locations().get(2), 42.25)
  shallow.locations().set(-1, -99.5)
  assert_eq(owner[9], -99.5)
  owner[1] = 88.5
  assert_eq(locator.locations().get(0), 88.5)
  assert_eq(locator.locations().to_array(), [88.5, 1.0, 42.25, -1.0, -99.5])
}

///|
test "FixedLocator reverse input and sampled results preserve signed composed strides" {
  let owner = [4.0, 1.0, 0.0, -1.0, -4.0, 9.0]
  let supplied = @ticker.TickValues::from_array(owner).view(-2, -1, 5)
  let locator = @ticker.FixedLocator::from_view(supplied, nbins=3.0)
  let selected = locator.values()
  assert_eq(locator.locations().to_array(), [-4.0, -1.0, 0.0, 1.0, 4.0])
  assert_eq(selected.to_array(), [-4.0, 0.0, 4.0])
  selected.set(1, 7.5)
  assert_eq(owner[2], 7.5)
  let independent = selected.copy()
  selected.set(-1, 8.5)
  assert_eq(owner[0], 8.5)
  assert_eq(independent.to_array(), [-4.0, 7.5, 4.0])
  locator.locations().set(0, -8.5)
  assert_eq(owner[4], -8.5)
}

///|
test "FixedLocator zero stride aliases every logical location to one owner element" {
  let owner = [9.0, 4.0, 7.0]
  let supplied = @ticker.TickValues::from_array(owner).view(1, 0, 5)
  let locator = @ticker.FixedLocator::from_view(supplied, nbins=2.0)
  assert_eq(locator.locations().to_array(), [4.0, 4.0, 4.0, 4.0, 4.0])
  let selected = locator.values()
  assert_eq(selected.to_array(), [4.0, 4.0])
  selected.set(1, 0.25)
  assert_eq(owner, [9.0, 0.25, 7.0])
  assert_eq(selected.to_array(), [0.25, 0.25])
  assert_eq(locator.locations().to_array(), [0.25, 0.25, 0.25, 0.25, 0.25])
  let empty = @ticker.FixedLocator::from_view(supplied.view(0, -1, 0))
  assert_eq(empty.values().to_array(), [])
}
