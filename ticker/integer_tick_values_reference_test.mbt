// Fixed NumPy int64 scalar-write, real owner-view and MaxN dtype observations.

///|
fn verify_integer_tick_values(
  actual : Array[Double],
  expected : Array[Double],
) -> Unit raise {
  assert_eq(actual.length(), expected.length())
  for index, value in expected {
    if value.is_nan() {
      assert_true(actual[index].is_nan())
    } else {
      assert_eq(
        actual[index].reinterpret_as_uint64(),
        value.reinterpret_as_uint64(),
      )
    }
  }
}

///|
test "NumPy int64 scalar tick assignment 0 1.25" {
  let owner = [7L, 8L]
  let view = @ticker.TickValues::from_int64_array(owner)
  view.set(0, 1.25)
  assert_eq(owner, [1L, 8L])
  verify_integer_tick_values(view.to_array(), [1.0, 8.0])
  let doubles = @ticker.TickValues::from_array([7.0, 8.0])
  doubles.set(0, 1.25)
  verify_integer_tick_values(doubles.to_array(), [1.25, 8.0])
}

///|
test "NumPy int64 scalar tick assignment 1 -1.25" {
  let owner = [7L, 8L]
  let view = @ticker.TickValues::from_int64_array(owner)
  view.set(0, -1.25)
  assert_eq(owner, [-1L, 8L])
  verify_integer_tick_values(view.to_array(), [-1.0, 8.0])
  let doubles = @ticker.TickValues::from_array([7.0, 8.0])
  doubles.set(0, -1.25)
  verify_integer_tick_values(doubles.to_array(), [-1.25, 8.0])
}

///|
test "NumPy int64 scalar tick assignment 2 0.999" {
  let owner = [7L, 8L]
  let view = @ticker.TickValues::from_int64_array(owner)
  view.set(0, 0.999)
  assert_eq(owner, [0L, 8L])
  verify_integer_tick_values(view.to_array(), [0.0, 8.0])
  let doubles = @ticker.TickValues::from_array([7.0, 8.0])
  doubles.set(0, 0.999)
  verify_integer_tick_values(doubles.to_array(), [0.999, 8.0])
}

///|
test "NumPy int64 scalar tick assignment 3 -0.999" {
  let owner = [7L, 8L]
  let view = @ticker.TickValues::from_int64_array(owner)
  view.set(0, -0.999)
  assert_eq(owner, [0L, 8L])
  verify_integer_tick_values(view.to_array(), [0.0, 8.0])
  let doubles = @ticker.TickValues::from_array([7.0, 8.0])
  doubles.set(0, -0.999)
  verify_integer_tick_values(doubles.to_array(), [-0.999, 8.0])
}

///|
test "NumPy int64 scalar tick assignment 4 0.0" {
  let owner = [7L, 8L]
  let view = @ticker.TickValues::from_int64_array(owner)
  view.set(0, 0.0)
  assert_eq(owner, [0L, 8L])
  verify_integer_tick_values(view.to_array(), [0.0, 8.0])
  let doubles = @ticker.TickValues::from_array([7.0, 8.0])
  doubles.set(0, 0.0)
  verify_integer_tick_values(doubles.to_array(), [0.0, 8.0])
}

///|
test "NumPy int64 scalar tick assignment 5 -0.0" {
  let owner = [7L, 8L]
  let view = @ticker.TickValues::from_int64_array(owner)
  view.set(0, -0.0)
  assert_eq(owner, [0L, 8L])
  verify_integer_tick_values(view.to_array(), [0.0, 8.0])
  let doubles = @ticker.TickValues::from_array([7.0, 8.0])
  doubles.set(0, -0.0)
  verify_integer_tick_values(doubles.to_array(), [-0.0, 8.0])
}

///|
test "NumPy int64 scalar tick assignment 6 2.5" {
  let owner = [7L, 8L]
  let view = @ticker.TickValues::from_int64_array(owner)
  view.set(0, 2.5)
  assert_eq(owner, [2L, 8L])
  verify_integer_tick_values(view.to_array(), [2.0, 8.0])
  let doubles = @ticker.TickValues::from_array([7.0, 8.0])
  doubles.set(0, 2.5)
  verify_integer_tick_values(doubles.to_array(), [2.5, 8.0])
}

///|
test "NumPy int64 scalar tick assignment 7 -2.5" {
  let owner = [7L, 8L]
  let view = @ticker.TickValues::from_int64_array(owner)
  view.set(0, -2.5)
  assert_eq(owner, [-2L, 8L])
  verify_integer_tick_values(view.to_array(), [-2.0, 8.0])
  let doubles = @ticker.TickValues::from_array([7.0, 8.0])
  doubles.set(0, -2.5)
  verify_integer_tick_values(doubles.to_array(), [-2.5, 8.0])
}

///|
test "NumPy int64 scalar tick assignment 8 9.223372036854775e+18" {
  let owner = [7L, 8L]
  let view = @ticker.TickValues::from_int64_array(owner)
  view.set(0, 9.223372036854775e+18)
  assert_eq(owner, [9223372036854774784L, 8L])
  verify_integer_tick_values(view.to_array(), [9.223372036854775e+18, 8.0])
  let doubles = @ticker.TickValues::from_array([7.0, 8.0])
  doubles.set(0, 9.223372036854775e+18)
  verify_integer_tick_values(doubles.to_array(), [9.223372036854775e+18, 8.0])
}

///|
test "NumPy int64 scalar tick assignment 9 -9.223372036854776e+18" {
  let owner = [7L, 8L]
  let view = @ticker.TickValues::from_int64_array(owner)
  view.set(0, -9.223372036854776e+18)
  assert_eq(owner, [-9223372036854775808L, 8L])
  verify_integer_tick_values(view.to_array(), [-9.223372036854776e+18, 8.0])
  let doubles = @ticker.TickValues::from_array([7.0, 8.0])
  doubles.set(0, -9.223372036854776e+18)
  verify_integer_tick_values(doubles.to_array(), [-9.223372036854776e+18, 8.0])
}

///|
test "NumPy int64 scalar tick assignment 10 9.223372036854776e+18" {
  let owner = [7L, 8L]
  let view = @ticker.TickValues::from_int64_array(owner)
  assert_true(
    try {
      view.set(0, 9.223372036854776e+18)
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(owner, [7L, 8L])
  verify_integer_tick_values(view.to_array(), [7.0, 8.0])
  let doubles = @ticker.TickValues::from_array([7.0, 8.0])
  doubles.set(0, 9.223372036854776e+18)
  verify_integer_tick_values(doubles.to_array(), [9.223372036854776e+18, 8.0])
}

///|
test "NumPy int64 scalar tick assignment 11 -9.223372036854778e+18" {
  let owner = [7L, 8L]
  let view = @ticker.TickValues::from_int64_array(owner)
  assert_true(
    try {
      view.set(0, -9.223372036854778e+18)
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(owner, [7L, 8L])
  verify_integer_tick_values(view.to_array(), [7.0, 8.0])
  let doubles = @ticker.TickValues::from_array([7.0, 8.0])
  doubles.set(0, -9.223372036854778e+18)
  verify_integer_tick_values(doubles.to_array(), [-9.223372036854778e+18, 8.0])
}

///|
test "NumPy int64 scalar tick assignment 12 nan" {
  let owner = [7L, 8L]
  let view = @ticker.TickValues::from_int64_array(owner)
  assert_true(
    try {
      view.set(0, 0.0 / 0.0)
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(owner, [7L, 8L])
  verify_integer_tick_values(view.to_array(), [7.0, 8.0])
  let doubles = @ticker.TickValues::from_array([7.0, 8.0])
  doubles.set(0, 0.0 / 0.0)
  verify_integer_tick_values(doubles.to_array(), [0.0 / 0.0, 8.0])
}

///|
test "NumPy int64 scalar tick assignment 13 inf" {
  let owner = [7L, 8L]
  let view = @ticker.TickValues::from_int64_array(owner)
  assert_true(
    try {
      view.set(0, 1.0 / 0.0)
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(owner, [7L, 8L])
  verify_integer_tick_values(view.to_array(), [7.0, 8.0])
  let doubles = @ticker.TickValues::from_array([7.0, 8.0])
  doubles.set(0, 1.0 / 0.0)
  verify_integer_tick_values(doubles.to_array(), [1.0 / 0.0, 8.0])
}

///|
test "NumPy int64 scalar tick assignment 14 -inf" {
  let owner = [7L, 8L]
  let view = @ticker.TickValues::from_int64_array(owner)
  assert_true(
    try {
      view.set(0, -1.0 / 0.0)
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(owner, [7L, 8L])
  verify_integer_tick_values(view.to_array(), [7.0, 8.0])
  let doubles = @ticker.TickValues::from_array([7.0, 8.0])
  doubles.set(0, -1.0 / 0.0)
  verify_integer_tick_values(doubles.to_array(), [-1.0 / 0.0, 8.0])
}

///|
test "NumPy int64 scalar tick assignment 15 1e+300" {
  let owner = [7L, 8L]
  let view = @ticker.TickValues::from_int64_array(owner)
  assert_true(
    try {
      view.set(0, 1.0e+300)
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(owner, [7L, 8L])
  verify_integer_tick_values(view.to_array(), [7.0, 8.0])
  let doubles = @ticker.TickValues::from_array([7.0, 8.0])
  doubles.set(0, 1.0e+300)
  verify_integer_tick_values(doubles.to_array(), [1.0e+300, 8.0])
}

///|
test "NumPy int64 scalar tick assignment 16 -1e+300" {
  let owner = [7L, 8L]
  let view = @ticker.TickValues::from_int64_array(owner)
  assert_true(
    try {
      view.set(0, -1.0e+300)
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(owner, [7L, 8L])
  verify_integer_tick_values(view.to_array(), [7.0, 8.0])
  let doubles = @ticker.TickValues::from_array([7.0, 8.0])
  doubles.set(0, -1.0e+300)
  verify_integer_tick_values(doubles.to_array(), [-1.0e+300, 8.0])
}

///|
test "NumPy int64 real tick view positive" {
  let owner = [0L, 1L, 2L, 3L, 4L, 5L, 6L, 7L, 8L, 9L, 10L, 11L]
  let selected = @ticker.TickValues::from_int64_array(owner).view(1, 2, 5)
  verify_integer_tick_values(selected.to_array(), [1.0, 3.0, 5.0, 7.0, 9.0])
  selected.set(-1, 1.75)
  assert_eq(owner, [0L, 1L, 2L, 3L, 4L, 5L, 6L, 7L, 8L, 1L, 10L, 11L])
  verify_integer_tick_values(selected.to_array(), [1.0, 3.0, 5.0, 7.0, 1.0])
  owner[1] = 9L
  verify_integer_tick_values(selected.to_array(), [9.0, 3.0, 5.0, 7.0, 1.0])
  let copied = selected.copy()
  copied.set(0, -1.75)
  assert_true(
    try {
      copied.set(0, 0.0 / 0.0)
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(owner, [0L, 9L, 2L, 3L, 4L, 5L, 6L, 7L, 8L, 1L, 10L, 11L])
  verify_integer_tick_values(selected.to_array(), [9.0, 3.0, 5.0, 7.0, 1.0])
  verify_integer_tick_values(copied.to_array(), [-1.0, 3.0, 5.0, 7.0, 1.0])
}

///|
test "NumPy int64 real tick view negative" {
  let owner = [0L, 1L, 2L, 3L, 4L, 5L, 6L, 7L, 8L, 9L, 10L, 11L]
  let selected = @ticker.TickValues::from_int64_array(owner).view(10, -2, 5)
  verify_integer_tick_values(selected.to_array(), [10.0, 8.0, 6.0, 4.0, 2.0])
  selected.set(-1, 1.75)
  assert_eq(owner, [0L, 1L, 1L, 3L, 4L, 5L, 6L, 7L, 8L, 9L, 10L, 11L])
  verify_integer_tick_values(selected.to_array(), [10.0, 8.0, 6.0, 4.0, 1.0])
  owner[10] = 9L
  verify_integer_tick_values(selected.to_array(), [9.0, 8.0, 6.0, 4.0, 1.0])
  let copied = selected.copy()
  copied.set(0, -1.75)
  assert_true(
    try {
      copied.set(0, 0.0 / 0.0)
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(owner, [0L, 1L, 1L, 3L, 4L, 5L, 6L, 7L, 8L, 9L, 9L, 11L])
  verify_integer_tick_values(selected.to_array(), [9.0, 8.0, 6.0, 4.0, 1.0])
  verify_integer_tick_values(copied.to_array(), [-1.0, 8.0, 6.0, 4.0, 1.0])
}

///|
test "NumPy int64 real tick view negative start" {
  let owner = [0L, 1L, 2L, 3L, 4L, 5L, 6L, 7L, 8L, 9L, 10L, 11L]
  let selected = @ticker.TickValues::from_int64_array(owner).view(-1, -3, 4)
  verify_integer_tick_values(selected.to_array(), [11.0, 8.0, 5.0, 2.0])
  selected.set(-1, 1.75)
  assert_eq(owner, [0L, 1L, 1L, 3L, 4L, 5L, 6L, 7L, 8L, 9L, 10L, 11L])
  verify_integer_tick_values(selected.to_array(), [11.0, 8.0, 5.0, 1.0])
  owner[11] = 9L
  verify_integer_tick_values(selected.to_array(), [9.0, 8.0, 5.0, 1.0])
  let copied = selected.copy()
  copied.set(0, -1.75)
  assert_true(
    try {
      copied.set(0, 0.0 / 0.0)
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(owner, [0L, 1L, 1L, 3L, 4L, 5L, 6L, 7L, 8L, 9L, 10L, 9L])
  verify_integer_tick_values(selected.to_array(), [9.0, 8.0, 5.0, 1.0])
  verify_integer_tick_values(copied.to_array(), [-1.0, 8.0, 5.0, 1.0])
}

///|
test "NumPy int64 real tick view empty" {
  let owner = [0L, 1L, 2L, 3L, 4L, 5L, 6L, 7L, 8L, 9L, 10L, 11L]
  let selected = @ticker.TickValues::from_int64_array(owner).view(2, 3, 0)
  verify_integer_tick_values(selected.to_array(), [])
  assert_eq(owner, [0L, 1L, 2L, 3L, 4L, 5L, 6L, 7L, 8L, 9L, 10L, 11L])
  verify_integer_tick_values(selected.to_array(), [])
  owner[0] = 9L
  verify_integer_tick_values(selected.to_array(), [])
  let copied = selected.copy()
  assert_eq(owner, [9L, 1L, 2L, 3L, 4L, 5L, 6L, 7L, 8L, 9L, 10L, 11L])
  verify_integer_tick_values(selected.to_array(), [])
  verify_integer_tick_values(copied.to_array(), [])
}

///|
test "NumPy int64 real tick view nested reverse" {
  let owner = [0L, 1L, 2L, 3L, 4L, 5L, 6L, 7L, 8L, 9L, 10L, 11L]
  let selected = @ticker.TickValues::from_int64_array(owner)
    .view(1, 2, 5)
    .view(-1, -2, 3)
  verify_integer_tick_values(selected.to_array(), [9.0, 5.0, 1.0])
  selected.set(-1, 1.75)
  assert_eq(owner, [0L, 1L, 2L, 3L, 4L, 5L, 6L, 7L, 8L, 9L, 10L, 11L])
  verify_integer_tick_values(selected.to_array(), [9.0, 5.0, 1.0])
  owner[9] = 9L
  verify_integer_tick_values(selected.to_array(), [9.0, 5.0, 1.0])
  let copied = selected.copy()
  copied.set(0, -1.75)
  assert_true(
    try {
      copied.set(0, 0.0 / 0.0)
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(owner, [0L, 1L, 2L, 3L, 4L, 5L, 6L, 7L, 8L, 9L, 10L, 11L])
  verify_integer_tick_values(selected.to_array(), [9.0, 5.0, 1.0])
  verify_integer_tick_values(copied.to_array(), [-1.0, 5.0, 1.0])
}

///|
test "NumPy int64 real tick view nested forward" {
  let owner = [0L, 1L, 2L, 3L, 4L, 5L, 6L, 7L, 8L, 9L, 10L, 11L]
  let selected = @ticker.TickValues::from_int64_array(owner)
    .view(10, -2, 5)
    .view(1, 2, 2)
  verify_integer_tick_values(selected.to_array(), [8.0, 4.0])
  selected.set(-1, 1.75)
  assert_eq(owner, [0L, 1L, 2L, 3L, 1L, 5L, 6L, 7L, 8L, 9L, 10L, 11L])
  verify_integer_tick_values(selected.to_array(), [8.0, 1.0])
  owner[8] = 9L
  verify_integer_tick_values(selected.to_array(), [9.0, 1.0])
  let copied = selected.copy()
  copied.set(0, -1.75)
  assert_true(
    try {
      copied.set(0, 0.0 / 0.0)
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(owner, [0L, 1L, 2L, 3L, 1L, 5L, 6L, 7L, 9L, 9L, 10L, 11L])
  verify_integer_tick_values(selected.to_array(), [9.0, 1.0])
  verify_integer_tick_values(copied.to_array(), [-1.0, 1.0])
}

///|
test "NumPy int64 real tick view writable zero stride" {
  let owner = [0L, 1L, 2L, 3L, 4L, 5L, 6L, 7L, 8L, 9L, 10L, 11L]
  let selected = @ticker.TickValues::from_int64_array(owner).view(2, 0, 4)
  verify_integer_tick_values(selected.to_array(), [2.0, 2.0, 2.0, 2.0])
  selected.set(-1, 1.75)
  assert_eq(owner, [0L, 1L, 1L, 3L, 4L, 5L, 6L, 7L, 8L, 9L, 10L, 11L])
  verify_integer_tick_values(selected.to_array(), [1.0, 1.0, 1.0, 1.0])
  owner[2] = 9L
  verify_integer_tick_values(selected.to_array(), [9.0, 9.0, 9.0, 9.0])
  let copied = selected.copy()
  copied.set(0, -1.75)
  assert_true(
    try {
      copied.set(0, 0.0 / 0.0)
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(owner, [0L, 1L, 9L, 3L, 4L, 5L, 6L, 7L, 8L, 9L, 10L, 11L])
  verify_integer_tick_values(selected.to_array(), [9.0, 9.0, 9.0, 9.0])
  verify_integer_tick_values(copied.to_array(), [-1.0, 9.0, 9.0, 9.0])
}

///|
test "MaxN original normalized step dtype [1, 2, 5, 10]" {
  let integer_owner = [1L, 2L, 5L, 10L]
  let floating_owner = [1.0, 2.0, 5.0, 10.0]
  let integer = @ticker.MaxNLocator::new(
    steps=@ticker.TickValues::from_int64_array(integer_owner),
  )
  let floating = @ticker.MaxNLocator::new(
    steps=@ticker.TickValues::from_array(floating_owner),
  )
  verify_integer_tick_values(integer.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  verify_integer_tick_values(floating.steps().to_array(), [1.0, 2.0, 5.0, 10.0])
  let reconstructed = @ticker.MaxNLocator::new(steps=integer.steps())
  verify_integer_tick_values(reconstructed.steps().to_array(), [
    1.0, 2.0, 5.0, 10.0,
  ])
  integer.steps().set(1, 1.25)
  floating.steps().set(1, 1.25)
  verify_integer_tick_values(integer.steps().to_array(), [1.0, 1.0, 5.0, 10.0])
  verify_integer_tick_values(floating.steps().to_array(), [1.0, 1.25, 5.0, 10.0])
  assert_eq(integer_owner, [1L, 1L, 5L, 10L])
  verify_integer_tick_values(floating_owner, [1.0, 1.25, 5.0, 10.0])
  integer.steps().set(-1, 9.75)
  floating.steps().set(-1, 9.75)
  verify_integer_tick_values(integer.steps().to_array(), [1.0, 1.0, 5.0, 9.0])
  verify_integer_tick_values(integer.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  verify_integer_tick_values(floating.steps().to_array(), [1.0, 1.25, 5.0, 9.75])
  verify_integer_tick_values(floating.extended_steps(), [
    0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0,
  ])
  assert_eq(integer_owner, [1L, 1L, 5L, 9L])
  verify_integer_tick_values(floating_owner, [1.0, 1.25, 5.0, 9.75])
}

///|
test "MaxN original normalized step dtype [2, 4, 8]" {
  let integer_owner = [2L, 4L, 8L]
  let floating_owner = [2.0, 4.0, 8.0]
  let integer = @ticker.MaxNLocator::new(
    steps=@ticker.TickValues::from_int64_array(integer_owner),
  )
  let floating = @ticker.MaxNLocator::new(
    steps=@ticker.TickValues::from_array(floating_owner),
  )
  verify_integer_tick_values(integer.steps().to_array(), [
    1.0, 2.0, 4.0, 8.0, 10.0,
  ])
  verify_integer_tick_values(floating.steps().to_array(), [
    1.0, 2.0, 4.0, 8.0, 10.0,
  ])
  let reconstructed = @ticker.MaxNLocator::new(steps=integer.steps())
  verify_integer_tick_values(reconstructed.steps().to_array(), [
    1.0, 2.0, 4.0, 8.0, 10.0,
  ])
  integer.steps().set(1, 1.25)
  floating.steps().set(1, 1.25)
  verify_integer_tick_values(integer.steps().to_array(), [
    1.0, 1.0, 4.0, 8.0, 10.0,
  ])
  verify_integer_tick_values(floating.steps().to_array(), [
    1.0, 1.25, 4.0, 8.0, 10.0,
  ])
  assert_eq(integer_owner, [2L, 4L, 8L])
  verify_integer_tick_values(floating_owner, [2.0, 4.0, 8.0])
  integer.steps().set(-1, 9.75)
  floating.steps().set(-1, 9.75)
  verify_integer_tick_values(integer.steps().to_array(), [
    1.0, 1.0, 4.0, 8.0, 9.0,
  ])
  verify_integer_tick_values(integer.extended_steps(), [
    0.1, 0.2, 0.4, 0.8, 1.0, 2.0, 4.0, 8.0, 10.0, 20.0,
  ])
  verify_integer_tick_values(floating.steps().to_array(), [
    1.0, 1.25, 4.0, 8.0, 9.75,
  ])
  verify_integer_tick_values(floating.extended_steps(), [
    0.1, 0.2, 0.4, 0.8, 1.0, 2.0, 4.0, 8.0, 10.0, 20.0,
  ])
  assert_eq(integer_owner, [2L, 4L, 8L])
  verify_integer_tick_values(floating_owner, [2.0, 4.0, 8.0])
}

///|
test "MaxN original normalized step dtype [2, 4, 10]" {
  let integer_owner = [2L, 4L, 10L]
  let floating_owner = [2.0, 4.0, 10.0]
  let integer = @ticker.MaxNLocator::new(
    steps=@ticker.TickValues::from_int64_array(integer_owner),
  )
  let floating = @ticker.MaxNLocator::new(
    steps=@ticker.TickValues::from_array(floating_owner),
  )
  verify_integer_tick_values(integer.steps().to_array(), [1.0, 2.0, 4.0, 10.0])
  verify_integer_tick_values(floating.steps().to_array(), [1.0, 2.0, 4.0, 10.0])
  let reconstructed = @ticker.MaxNLocator::new(steps=integer.steps())
  verify_integer_tick_values(reconstructed.steps().to_array(), [
    1.0, 2.0, 4.0, 10.0,
  ])
  integer.steps().set(1, 1.25)
  floating.steps().set(1, 1.25)
  verify_integer_tick_values(integer.steps().to_array(), [1.0, 1.0, 4.0, 10.0])
  verify_integer_tick_values(floating.steps().to_array(), [1.0, 1.25, 4.0, 10.0])
  assert_eq(integer_owner, [2L, 4L, 10L])
  verify_integer_tick_values(floating_owner, [2.0, 4.0, 10.0])
  integer.steps().set(-1, 9.75)
  floating.steps().set(-1, 9.75)
  verify_integer_tick_values(integer.steps().to_array(), [1.0, 1.0, 4.0, 9.0])
  verify_integer_tick_values(integer.extended_steps(), [
    0.1, 0.2, 0.4, 1.0, 2.0, 4.0, 10.0, 20.0,
  ])
  verify_integer_tick_values(floating.steps().to_array(), [1.0, 1.25, 4.0, 9.75])
  verify_integer_tick_values(floating.extended_steps(), [
    0.1, 0.2, 0.4, 1.0, 2.0, 4.0, 10.0, 20.0,
  ])
  assert_eq(integer_owner, [2L, 4L, 10L])
  verify_integer_tick_values(floating_owner, [2.0, 4.0, 10.0])
}

///|
test "MaxN original normalized step dtype [1, 2, 8]" {
  let integer_owner = [1L, 2L, 8L]
  let floating_owner = [1.0, 2.0, 8.0]
  let integer = @ticker.MaxNLocator::new(
    steps=@ticker.TickValues::from_int64_array(integer_owner),
  )
  let floating = @ticker.MaxNLocator::new(
    steps=@ticker.TickValues::from_array(floating_owner),
  )
  verify_integer_tick_values(integer.steps().to_array(), [1.0, 2.0, 8.0, 10.0])
  verify_integer_tick_values(floating.steps().to_array(), [1.0, 2.0, 8.0, 10.0])
  let reconstructed = @ticker.MaxNLocator::new(steps=integer.steps())
  verify_integer_tick_values(reconstructed.steps().to_array(), [
    1.0, 2.0, 8.0, 10.0,
  ])
  integer.steps().set(1, 1.25)
  floating.steps().set(1, 1.25)
  verify_integer_tick_values(integer.steps().to_array(), [1.0, 1.0, 8.0, 10.0])
  verify_integer_tick_values(floating.steps().to_array(), [1.0, 1.25, 8.0, 10.0])
  assert_eq(integer_owner, [1L, 2L, 8L])
  verify_integer_tick_values(floating_owner, [1.0, 2.0, 8.0])
  integer.steps().set(-1, 9.75)
  floating.steps().set(-1, 9.75)
  verify_integer_tick_values(integer.steps().to_array(), [1.0, 1.0, 8.0, 9.0])
  verify_integer_tick_values(integer.extended_steps(), [
    0.1, 0.2, 0.8, 1.0, 2.0, 8.0, 10.0, 20.0,
  ])
  verify_integer_tick_values(floating.steps().to_array(), [1.0, 1.25, 8.0, 9.75])
  verify_integer_tick_values(floating.extended_steps(), [
    0.1, 0.2, 0.8, 1.0, 2.0, 8.0, 10.0, 20.0,
  ])
  assert_eq(integer_owner, [1L, 2L, 8L])
  verify_integer_tick_values(floating_owner, [1.0, 2.0, 8.0])
}

///|
test "MaxN original normalized step dtype [1]" {
  let integer_owner = [1L]
  let floating_owner = [1.0]
  let integer = @ticker.MaxNLocator::new(
    steps=@ticker.TickValues::from_int64_array(integer_owner),
  )
  let floating = @ticker.MaxNLocator::new(
    steps=@ticker.TickValues::from_array(floating_owner),
  )
  verify_integer_tick_values(integer.steps().to_array(), [1.0, 10.0])
  verify_integer_tick_values(floating.steps().to_array(), [1.0, 10.0])
  let reconstructed = @ticker.MaxNLocator::new(steps=integer.steps())
  verify_integer_tick_values(reconstructed.steps().to_array(), [1.0, 10.0])
  integer.steps().set(1, 1.25)
  floating.steps().set(1, 1.25)
  verify_integer_tick_values(integer.steps().to_array(), [1.0, 1.0])
  verify_integer_tick_values(floating.steps().to_array(), [1.0, 1.25])
  assert_eq(integer_owner, [1L])
  verify_integer_tick_values(floating_owner, [1.0])
  integer.steps().set(-1, 9.75)
  floating.steps().set(-1, 9.75)
  verify_integer_tick_values(integer.steps().to_array(), [1.0, 9.0])
  verify_integer_tick_values(integer.extended_steps(), [0.1, 1.0, 10.0, 100.0])
  verify_integer_tick_values(floating.steps().to_array(), [1.0, 9.75])
  verify_integer_tick_values(floating.extended_steps(), [0.1, 1.0, 10.0, 100.0])
  assert_eq(integer_owner, [1L])
  verify_integer_tick_values(floating_owner, [1.0])
}

///|
test "MaxN original normalized step dtype [10]" {
  let integer_owner = [10L]
  let floating_owner = [10.0]
  let integer = @ticker.MaxNLocator::new(
    steps=@ticker.TickValues::from_int64_array(integer_owner),
  )
  let floating = @ticker.MaxNLocator::new(
    steps=@ticker.TickValues::from_array(floating_owner),
  )
  verify_integer_tick_values(integer.steps().to_array(), [1.0, 10.0])
  verify_integer_tick_values(floating.steps().to_array(), [1.0, 10.0])
  let reconstructed = @ticker.MaxNLocator::new(steps=integer.steps())
  verify_integer_tick_values(reconstructed.steps().to_array(), [1.0, 10.0])
  integer.steps().set(1, 1.25)
  floating.steps().set(1, 1.25)
  verify_integer_tick_values(integer.steps().to_array(), [1.0, 1.0])
  verify_integer_tick_values(floating.steps().to_array(), [1.0, 1.25])
  assert_eq(integer_owner, [10L])
  verify_integer_tick_values(floating_owner, [10.0])
  integer.steps().set(-1, 9.75)
  floating.steps().set(-1, 9.75)
  verify_integer_tick_values(integer.steps().to_array(), [1.0, 9.0])
  verify_integer_tick_values(integer.extended_steps(), [0.1, 1.0, 10.0, 100.0])
  verify_integer_tick_values(floating.steps().to_array(), [1.0, 9.75])
  verify_integer_tick_values(floating.extended_steps(), [0.1, 1.0, 10.0, 100.0])
  assert_eq(integer_owner, [10L])
  verify_integer_tick_values(floating_owner, [10.0])
}

///|
test "MaxN original normalized step dtype [1, -9223372036854775808, -1, 9223372036854775806, -3, 10]" {
  let integer_owner = [
    1L, -9223372036854775808L, -1L, 9223372036854775806L, -3L, 10L,
  ]
  let floating_owner = [
    1.0, -9.223372036854776e+18, -1.0, 9.223372036854776e+18, -3.0, 10.0,
  ]
  let integer = @ticker.MaxNLocator::new(
    steps=@ticker.TickValues::from_int64_array(integer_owner),
  )
  assert_true(
    try {
      ignore(
        @ticker.MaxNLocator::new(
          steps=@ticker.TickValues::from_array(floating_owner),
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  verify_integer_tick_values(integer.steps().to_array(), [
    1.0, -9.223372036854776e+18, -1.0, 9.223372036854776e+18, -3.0, 10.0,
  ])
  let reconstructed = @ticker.MaxNLocator::new(steps=integer.steps())
  verify_integer_tick_values(reconstructed.steps().to_array(), [
    1.0, -9.223372036854776e+18, -1.0, 9.223372036854776e+18, -3.0, 10.0,
  ])
  integer.steps().set(1, 1.25)
  verify_integer_tick_values(integer.steps().to_array(), [
    1.0, 1.0, -1.0, 9.223372036854776e+18, -3.0, 10.0,
  ])
  assert_eq(integer_owner, [1L, 1L, -1L, 9223372036854775806L, -3L, 10L])
  verify_integer_tick_values(floating_owner, [
    1.0, -9.223372036854776e+18, -1.0, 9.223372036854776e+18, -3.0, 10.0,
  ])
  integer.steps().set(-1, 9.75)
  verify_integer_tick_values(integer.steps().to_array(), [
    1.0, 1.0, -1.0, 9.223372036854776e+18, -3.0, 9.0,
  ])
  verify_integer_tick_values(integer.extended_steps(), [
    0.1, -9.223372036854776e+17, -0.1, 9.223372036854776e+17, -0.30000000000000004,
    1.0, -9.223372036854776e+18, -1.0, 9.223372036854776e+18, -3.0, 10.0, 0.0,
  ])
  assert_eq(integer_owner, [1L, 1L, -1L, 9223372036854775806L, -3L, 9L])
  verify_integer_tick_values(floating_owner, [
    1.0, -9.223372036854776e+18, -1.0, 9.223372036854776e+18, -3.0, 10.0,
  ])
}

///|
test "MaxN original normalized step dtype [1, -9223372036854775808, -1, 9223372036854775806, -3, 9]" {
  let integer_owner = [
    1L, -9223372036854775808L, -1L, 9223372036854775806L, -3L, 9L,
  ]
  let floating_owner = [
    1.0, -9.223372036854776e+18, -1.0, 9.223372036854776e+18, -3.0, 9.0,
  ]
  let integer = @ticker.MaxNLocator::new(
    steps=@ticker.TickValues::from_int64_array(integer_owner),
  )
  assert_true(
    try {
      ignore(
        @ticker.MaxNLocator::new(
          steps=@ticker.TickValues::from_array(floating_owner),
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  verify_integer_tick_values(integer.steps().to_array(), [
    1.0, -9.223372036854776e+18, -1.0, 9.223372036854776e+18, -3.0, 9.0, 10.0,
  ])
  let reconstructed = @ticker.MaxNLocator::new(steps=integer.steps())
  verify_integer_tick_values(reconstructed.steps().to_array(), [
    1.0, -9.223372036854776e+18, -1.0, 9.223372036854776e+18, -3.0, 9.0, 10.0,
  ])
  integer.steps().set(1, 1.25)
  verify_integer_tick_values(integer.steps().to_array(), [
    1.0, 1.0, -1.0, 9.223372036854776e+18, -3.0, 9.0, 10.0,
  ])
  assert_eq(integer_owner, [
    1L, -9223372036854775808L, -1L, 9223372036854775806L, -3L, 9L,
  ])
  verify_integer_tick_values(floating_owner, [
    1.0, -9.223372036854776e+18, -1.0, 9.223372036854776e+18, -3.0, 9.0,
  ])
  integer.steps().set(-1, 9.75)
  verify_integer_tick_values(integer.steps().to_array(), [
    1.0, 1.0, -1.0, 9.223372036854776e+18, -3.0, 9.0, 9.0,
  ])
  verify_integer_tick_values(integer.extended_steps(), [
    0.1, -9.223372036854776e+17, -0.1, 9.223372036854776e+17, -0.30000000000000004,
    0.9, 1.0, -9.223372036854776e+18, -1.0, 9.223372036854776e+18, -3.0, 9.0, 10.0,
    0.0,
  ])
  assert_eq(integer_owner, [
    1L, -9223372036854775808L, -1L, 9223372036854775806L, -3L, 9L,
  ])
  verify_integer_tick_values(floating_owner, [
    1.0, -9.223372036854776e+18, -1.0, 9.223372036854776e+18, -3.0, 9.0,
  ])
}

///|
test "MaxN original normalized step dtype [2, -9223372036854775808, -1, 9223372036854775806, -3, 10]" {
  let integer_owner = [
    2L, -9223372036854775808L, -1L, 9223372036854775806L, -3L, 10L,
  ]
  let floating_owner = [
    2.0, -9.223372036854776e+18, -1.0, 9.223372036854776e+18, -3.0, 10.0,
  ]
  let integer = @ticker.MaxNLocator::new(
    steps=@ticker.TickValues::from_int64_array(integer_owner),
  )
  assert_true(
    try {
      ignore(
        @ticker.MaxNLocator::new(
          steps=@ticker.TickValues::from_array(floating_owner),
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  verify_integer_tick_values(integer.steps().to_array(), [
    1.0, 2.0, -9.223372036854776e+18, -1.0, 9.223372036854776e+18, -3.0, 10.0,
  ])
  let reconstructed = @ticker.MaxNLocator::new(steps=integer.steps())
  verify_integer_tick_values(reconstructed.steps().to_array(), [
    1.0, 2.0, -9.223372036854776e+18, -1.0, 9.223372036854776e+18, -3.0, 10.0,
  ])
  integer.steps().set(1, 1.25)
  verify_integer_tick_values(integer.steps().to_array(), [
    1.0, 1.0, -9.223372036854776e+18, -1.0, 9.223372036854776e+18, -3.0, 10.0,
  ])
  assert_eq(integer_owner, [
    2L, -9223372036854775808L, -1L, 9223372036854775806L, -3L, 10L,
  ])
  verify_integer_tick_values(floating_owner, [
    2.0, -9.223372036854776e+18, -1.0, 9.223372036854776e+18, -3.0, 10.0,
  ])
  integer.steps().set(-1, 9.75)
  verify_integer_tick_values(integer.steps().to_array(), [
    1.0, 1.0, -9.223372036854776e+18, -1.0, 9.223372036854776e+18, -3.0, 9.0,
  ])
  verify_integer_tick_values(integer.extended_steps(), [
    0.1, 0.2, -9.223372036854776e+17, -0.1, 9.223372036854776e+17, -0.30000000000000004,
    1.0, 2.0, -9.223372036854776e+18, -1.0, 9.223372036854776e+18, -3.0, 10.0, 20.0,
  ])
  assert_eq(integer_owner, [
    2L, -9223372036854775808L, -1L, 9223372036854775806L, -3L, 10L,
  ])
  verify_integer_tick_values(floating_owner, [
    2.0, -9.223372036854776e+18, -1.0, 9.223372036854776e+18, -3.0, 10.0,
  ])
}

///|
test "MaxN original normalized step dtype [1, 9223372036854775807, -2, 10]" {
  let integer_owner = [1L, 9223372036854775807L, -2L, 10L]
  let floating_owner = [1.0, 9.223372036854776e+18, -2.0, 10.0]
  let integer = @ticker.MaxNLocator::new(
    steps=@ticker.TickValues::from_int64_array(integer_owner),
  )
  assert_true(
    try {
      ignore(
        @ticker.MaxNLocator::new(
          steps=@ticker.TickValues::from_array(floating_owner),
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  verify_integer_tick_values(integer.steps().to_array(), [
    1.0, 9.223372036854776e+18, -2.0, 10.0,
  ])
  let reconstructed = @ticker.MaxNLocator::new(steps=integer.steps())
  verify_integer_tick_values(reconstructed.steps().to_array(), [
    1.0, 9.223372036854776e+18, -2.0, 10.0,
  ])
  integer.steps().set(1, 1.25)
  verify_integer_tick_values(integer.steps().to_array(), [1.0, 1.0, -2.0, 10.0])
  assert_eq(integer_owner, [1L, 1L, -2L, 10L])
  verify_integer_tick_values(floating_owner, [
    1.0, 9.223372036854776e+18, -2.0, 10.0,
  ])
  integer.steps().set(-1, 9.75)
  verify_integer_tick_values(integer.steps().to_array(), [1.0, 1.0, -2.0, 9.0])
  verify_integer_tick_values(integer.extended_steps(), [
    0.1, 9.223372036854776e+17, -0.2, 1.0, 9.223372036854776e+18, -2.0, 10.0, -10.0,
  ])
  assert_eq(integer_owner, [1L, 1L, -2L, 9L])
  verify_integer_tick_values(floating_owner, [
    1.0, 9.223372036854776e+18, -2.0, 10.0,
  ])
}

///|
test "Fixed original Int64 phase minimum absolute value wraps" {
  let owner = [-9223372036854775808L, 0L, 1L, 2L]
  let locator = @ticker.FixedLocator::from_view(
    @ticker.TickValues::from_int64_array(owner),
    nbins=2.0,
  )
  let selected = locator.tick_values(0.0 / 0.0, 1.0 / 0.0)
  verify_integer_tick_values(selected.to_array(), [-9.223372036854776e+18, 1.0])
  selected.set(0, 1.25)
  assert_eq(owner, [1L, 0L, 1L, 2L])
  verify_integer_tick_values(selected.to_array(), [1.0, 1.0])
  selected.set(-1, -1.25)
  assert_eq(owner, [1L, 0L, -1L, 2L])
  verify_integer_tick_values(selected.to_array(), [1.0, -1.0])
}

///|
test "Fixed original Int64 phase phase distinguishes integers above double precision" {
  let owner = [
    9007199254740993L, 9007199254740992L, 9007199254740993L, 9007199254740992L,
  ]
  let locator = @ticker.FixedLocator::from_view(
    @ticker.TickValues::from_int64_array(owner),
    nbins=2.0,
  )
  let selected = locator.tick_values(0.0 / 0.0, 1.0 / 0.0)
  verify_integer_tick_values(selected.to_array(), [
    9007199254740992.0, 9007199254740992.0,
  ])
  selected.set(0, 1.25)
  assert_eq(owner, [9007199254740993L, 1L, 9007199254740993L, 9007199254740992L])
  verify_integer_tick_values(selected.to_array(), [1.0, 9007199254740992.0])
  selected.set(-1, -1.25)
  assert_eq(owner, [9007199254740993L, 1L, 9007199254740993L, -1L])
  verify_integer_tick_values(selected.to_array(), [1.0, -1.0])
}
