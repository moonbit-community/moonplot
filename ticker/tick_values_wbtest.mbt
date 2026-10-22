///|
test "tick views retain mutable strides and copies survive borrowed buffer resizing" {
  let values = [1.0, 2.0, 3.0, 4.0, 5.0]
  let full = TickValues::from_array(values)
  let strided = tick_values_view(values, 0, 2, 3)
  assert_eq(strided.to_array(), [1.0, 3.0, 5.0])
  strided.set(1, 30.0)
  assert_eq(full.get(2), 30.0)
  strided.set(-1, 50.0)
  assert_eq(values[4], 50.0)
  let independent = strided.copy()
  full.set(0, 10.0)
  assert_eq(independent.to_array(), [1.0, 30.0, 50.0])
  for index in [3, -4] {
    assert_true(
      try {
        ignore(strided.get(index))
        false
      } catch {
        _ => true
      },
    )
  }
  values.clear()
  assert_eq(strided.length(), 3)
  assert_true(
    try {
      ignore(strided.to_array())
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      strided.set(0, 0.0)
      false
    } catch {
      _ => true
    },
  )
  assert_eq(independent.get(-1), 50.0)
}

///|
test "tick subviews compose negative strides without flattening their owner" {
  let owner = [0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0]
  let full = TickValues::from_array(owner)
  let odd = full.view(1, 2, 4)
  let reversed = odd.view(-1, -1, 4)
  assert_eq(reversed.to_array(), [7.0, 5.0, 3.0, 1.0])
  let nested = reversed.view(1, 2, 2)
  nested.set(1, 10.0)
  assert_eq(owner[1], 10.0)
  owner[5] = 50.0
  assert_eq(nested.to_array(), [50.0, 10.0])
  let same = full.view(2, 0, 3)
  same.set(-1, 20.0)
  assert_eq(same.to_array(), [20.0, 20.0, 20.0])
  assert_eq(full.view(2147483647, -2147483648, 0).length(), 0)
  assert_eq(full.view(-1, -2147483648, 1).to_array(), [8.0])
  for
    (start, stride, length) in [
      (0, 1, -1),
      (9, 1, 1),
      (-10, 1, 1),
      (0, -1, 2),
      (0, 2147483647, 3),
    ] {
    assert_true(
      try {
        ignore(full.view(start, stride, length))
        false
      } catch {
        _ => true
      },
    )
  }
  owner.clear()
  assert_true(
    try {
      ignore(nested.view(0, 1, 1))
      false
    } catch {
      _ => true
    },
  )
}
