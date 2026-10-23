// Complete original Formatter classes and real descriptor helper; callbacks are user fixtures.

///|
fn verify_basic_formatter_batch_values(
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
fn basic_formatter_batch_position(position : Int32?) -> String {
  match position {
    None => "none"
    Some(value) => "p" + value.to_string()
  }
}

///|
fn basic_formatter_batch_value(value : Double) -> String {
  if value.is_nan() {
    "nan"
  } else if value.is_inf() {
    if value < 0.0 {
      "negative infinity"
    } else {
      "positive infinity"
    }
  } else if value == 0.0 {
    if value.reinterpret_as_uint64() >> 63 == 1UL {
      "negative zero"
    } else {
      "zero"
    }
  } else {
    "finite"
  }
}

///|
test "Basic formatter batch 0 direct optional and negative position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = BaseFormatter::new()
  let base = formatter
  base.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(-0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "Derived must override"
      _ => false
    },
  )
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 1 direct optional and negative position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = BaseFormatter::new()
  let base = formatter
  base.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(-0.0, pos=-2147483648))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "Derived must override"
      _ => false
    },
  )
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 2 direct optional and negative position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = BaseFormatter::new()
  let base = formatter
  base.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(-0.0, pos=-4))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "Derived must override"
      _ => false
    },
  )
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 3 direct optional and negative position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = BaseFormatter::new()
  let base = formatter
  base.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(-0.0, pos=-3))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "Derived must override"
      _ => false
    },
  )
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 4 direct optional and negative position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = BaseFormatter::new()
  let base = formatter
  base.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(-0.0, pos=-1))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "Derived must override"
      _ => false
    },
  )
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 5 direct optional and negative position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = BaseFormatter::new()
  let base = formatter
  base.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(-0.0, pos=0))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "Derived must override"
      _ => false
    },
  )
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 6 direct optional and negative position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = BaseFormatter::new()
  let base = formatter
  base.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(-0.0, pos=2))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "Derived must override"
      _ => false
    },
  )
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 7 direct optional and negative position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = BaseFormatter::new()
  let base = formatter
  base.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(-0.0, pos=3))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "Derived must override"
      _ => false
    },
  )
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 8 direct optional and negative position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = BaseFormatter::new()
  let base = formatter
  base.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(-0.0, pos=2147483647))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "Derived must override"
      _ => false
    },
  )
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 9 data methods preserve prior locations and None position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = BaseFormatter::new()
  let base = formatter
  base.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.format_data(0.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "Derived must override"
      _ => false
    },
  )
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 10 data methods preserve prior locations and None position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = BaseFormatter::new()
  let base = formatter
  base.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.format_data_short(0.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "Derived must override"
      _ => false
    },
  )
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 11 data methods preserve prior locations and None position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = BaseFormatter::new()
  let base = formatter
  base.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.format_data(1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "Derived must override"
      _ => false
    },
  )
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 12 data methods preserve prior locations and None position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = BaseFormatter::new()
  let base = formatter
  base.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.format_data_short(1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "Derived must override"
      _ => false
    },
  )
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 13 data methods preserve prior locations and None position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = BaseFormatter::new()
  let base = formatter
  base.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.format_data(-1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "Derived must override"
      _ => false
    },
  )
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 14 data methods preserve prior locations and None position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = BaseFormatter::new()
  let base = formatter
  base.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.format_data_short(-1.0 / 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "Derived must override"
      _ => false
    },
  )
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 15 data methods preserve prior locations and None position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = BaseFormatter::new()
  let base = formatter
  base.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.format_data(0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "Derived must override"
      _ => false
    },
  )
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 16 data methods preserve prior locations and None position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = BaseFormatter::new()
  let base = formatter
  base.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.format_data_short(0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "Derived must override"
      _ => false
    },
  )
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 17 data methods preserve prior locations and None position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = BaseFormatter::new()
  let base = formatter
  base.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.format_data(-0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "Derived must override"
      _ => false
    },
  )
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 18 data methods preserve prior locations and None position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = BaseFormatter::new()
  let base = formatter
  base.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.format_data_short(-0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "Derived must override"
      _ => false
    },
  )
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 19 data methods preserve prior locations and None position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = BaseFormatter::new()
  let base = formatter
  base.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.format_data(1.5))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "Derived must override"
      _ => false
    },
  )
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 20 data methods preserve prior locations and None position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = BaseFormatter::new()
  let base = formatter
  base.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.format_data_short(1.5))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "Derived must override"
      _ => false
    },
  )
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 21 complete raw array batch" {
  let values = []
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = BaseFormatter::new()
  let base = formatter
  base.set_locs([91.0, 92.0])
  let labels = formatter.format_ticks(values)
  assert_eq(labels.length(), 0)
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 0)
  verify_basic_formatter_batch_values([], [])
  assert_eq(values.length(), 0)
  verify_basic_formatter_batch_values([], [])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 22 complete raw array batch" {
  let values = [0.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = BaseFormatter::new()
  let base = formatter
  base.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.format_ticks(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "Derived must override"
      _ => false
    },
  )
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 1)
  verify_basic_formatter_batch_values([locations.get(0)], [0.0])
  assert_eq(values.length(), 1)
  verify_basic_formatter_batch_values([values[0]], [0.0])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 23 complete raw array batch" {
  let values = [0.0, -0.0, 0.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = BaseFormatter::new()
  let base = formatter
  base.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.format_ticks(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "Derived must override"
      _ => false
    },
  )
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 5)
  verify_basic_formatter_batch_values(
    [
      locations.get(0),
      locations.get(1),
      locations.get(2),
      locations.get(3),
      locations.get(4),
    ],
    [0.0, -0.0, 0.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0],
  )
  assert_eq(values.length(), 5)
  verify_basic_formatter_batch_values(
    [values[0], values[1], values[2], values[3], values[4]],
    [0.0, -0.0, 0.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0],
  )
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 24 complete raw array batch" {
  let values = [3.0, 2.0, 1.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = BaseFormatter::new()
  let base = formatter
  base.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.format_ticks(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "Derived must override"
      _ => false
    },
  )
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 3)
  verify_basic_formatter_batch_values(
    [locations.get(0), locations.get(1), locations.get(2)],
    [3.0, 2.0, 1.0],
  )
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    3.0, 2.0, 1.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 25 complete raw array batch" {
  let values = [1.0, 1.0, 1.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = BaseFormatter::new()
  let base = formatter
  base.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.format_ticks(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "Derived must override"
      _ => false
    },
  )
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 3)
  verify_basic_formatter_batch_values(
    [locations.get(0), locations.get(1), locations.get(2)],
    [1.0, 1.0, 1.0],
  )
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 1.0, 1.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 26 complete raw array batch" {
  let values = [-2.0, -1.0, 0.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = BaseFormatter::new()
  let base = formatter
  base.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.format_ticks(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "Derived must override"
      _ => false
    },
  )
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 3)
  verify_basic_formatter_batch_values(
    [locations.get(0), locations.get(1), locations.get(2)],
    [-2.0, -1.0, 0.0],
  )
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    -2.0, -1.0, 0.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 27 borrowed strided reverse zero-stride or empty view" {
  let values = [99.0, 1.0, 99.0, 2.0, 99.0, 3.0]
  let selected = TickValues::from_array(values).view(1, 2, 3)
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = BaseFormatter::new()
  let base = formatter
  base.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(selected))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "Derived must override"
      _ => false
    },
  )
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is NdArray(_))
  assert_eq(locations.length(), 3)
  verify_basic_formatter_batch_values(
    [locations.get(0), locations.get(1), locations.get(2)],
    [1.0, 2.0, 3.0],
  )
  assert_eq(values.length(), 6)
  verify_basic_formatter_batch_values(
    [values[0], values[1], values[2], values[3], values[4], values[5]],
    [99.0, 1.0, 99.0, 2.0, 99.0, 3.0],
  )
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 28 borrowed strided reverse zero-stride or empty view" {
  let values = [99.0, 1.0, 99.0, 2.0, 99.0, 3.0]
  let selected = TickValues::from_array(values).view(5, -2, 3)
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = BaseFormatter::new()
  let base = formatter
  base.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(selected))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "Derived must override"
      _ => false
    },
  )
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is NdArray(_))
  assert_eq(locations.length(), 3)
  verify_basic_formatter_batch_values(
    [locations.get(0), locations.get(1), locations.get(2)],
    [3.0, 2.0, 1.0],
  )
  assert_eq(values.length(), 6)
  verify_basic_formatter_batch_values(
    [values[0], values[1], values[2], values[3], values[4], values[5]],
    [99.0, 1.0, 99.0, 2.0, 99.0, 3.0],
  )
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 29 borrowed strided reverse zero-stride or empty view" {
  let values = [99.0, 1.0, 99.0, 2.0, 99.0, 3.0]
  let selected = TickValues::from_array(values).view(2, 0, 4)
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = BaseFormatter::new()
  let base = formatter
  base.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(selected))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "Derived must override"
      _ => false
    },
  )
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is NdArray(_))
  assert_eq(locations.length(), 4)
  verify_basic_formatter_batch_values(
    [locations.get(0), locations.get(1), locations.get(2), locations.get(3)],
    [99.0, 99.0, 99.0, 99.0],
  )
  assert_eq(values.length(), 6)
  verify_basic_formatter_batch_values(
    [values[0], values[1], values[2], values[3], values[4], values[5]],
    [99.0, 1.0, 99.0, 2.0, 99.0, 3.0],
  )
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 30 borrowed strided reverse zero-stride or empty view" {
  let values = [99.0, 1.0, 99.0, 2.0, 99.0, 3.0]
  let selected = TickValues::from_array(values).view(0, 1, 0)
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = BaseFormatter::new()
  let base = formatter
  base.set_locs([91.0, 92.0])
  let labels = formatter.format_ticks_view(selected)
  assert_eq(labels.length(), 0)
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is NdArray(_))
  assert_eq(locations.length(), 0)
  verify_basic_formatter_batch_values([], [])
  assert_eq(values.length(), 6)
  verify_basic_formatter_batch_values(
    [values[0], values[1], values[2], values[3], values[4], values[5]],
    [99.0, 1.0, 99.0, 2.0, 99.0, 3.0],
  )
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 31 base adapter retains virtual dispatch" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = BaseFormatter::new()
  let base = formatter
  base.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(-0.0, pos=-1))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "Derived must override"
      _ => false
    },
  )
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 32 base adapter retains virtual dispatch" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = BaseFormatter::new()
  let base = formatter
  base.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.format_ticks(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "Derived must override"
      _ => false
    },
  )
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 3)
  verify_basic_formatter_batch_values(
    [locations.get(0), locations.get(1), locations.get(2)],
    [1.0, 2.0, 3.0],
  )
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 33 base adapter retains virtual dispatch" {
  let values = [1.0, 2.0, 3.0]
  let selected = TickValues::from_array(values).view(0, 1, 3)
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = BaseFormatter::new()
  let base = formatter
  base.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(selected))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "Derived must override"
      _ => false
    },
  )
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is NdArray(_))
  assert_eq(locations.length(), 3)
  verify_basic_formatter_batch_values(
    [locations.get(0), locations.get(1), locations.get(2)],
    [1.0, 2.0, 3.0],
  )
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 34 base adapter retains virtual dispatch" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = BaseFormatter::new()
  let base = formatter
  base.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.format_data(-0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "Derived must override"
      _ => false
    },
  )
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 35 base adapter retains virtual dispatch" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = BaseFormatter::new()
  let base = formatter
  base.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.format_data_short(-0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "Derived must override"
      _ => false
    },
  )
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 36 direct optional and negative position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = NullFormatter::new()
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0), "")
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 37 direct optional and negative position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = NullFormatter::new()
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-2147483648), "")
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 38 direct optional and negative position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = NullFormatter::new()
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-4), "")
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 39 direct optional and negative position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = NullFormatter::new()
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-3), "")
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 40 direct optional and negative position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = NullFormatter::new()
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-1), "")
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 41 direct optional and negative position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = NullFormatter::new()
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=0), "")
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 42 direct optional and negative position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = NullFormatter::new()
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=2), "")
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 43 direct optional and negative position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = NullFormatter::new()
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=3), "")
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 44 direct optional and negative position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = NullFormatter::new()
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=2147483647), "")
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 45 data methods preserve prior locations and None position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = NullFormatter::new()
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.format_data(0.0 / 0.0), "")
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 46 data methods preserve prior locations and None position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = NullFormatter::new()
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.format_data_short(0.0 / 0.0), "")
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 47 data methods preserve prior locations and None position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = NullFormatter::new()
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.format_data(1.0 / 0.0), "")
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 48 data methods preserve prior locations and None position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = NullFormatter::new()
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.format_data_short(1.0 / 0.0), "")
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 49 data methods preserve prior locations and None position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = NullFormatter::new()
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.format_data(-1.0 / 0.0), "")
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 50 data methods preserve prior locations and None position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = NullFormatter::new()
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.format_data_short(-1.0 / 0.0), "")
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 51 data methods preserve prior locations and None position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = NullFormatter::new()
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.format_data(0.0), "")
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 52 data methods preserve prior locations and None position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = NullFormatter::new()
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.format_data_short(0.0), "")
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 53 data methods preserve prior locations and None position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = NullFormatter::new()
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.format_data(-0.0), "")
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 54 data methods preserve prior locations and None position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = NullFormatter::new()
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.format_data_short(-0.0), "")
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 55 data methods preserve prior locations and None position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = NullFormatter::new()
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.format_data(1.5), "")
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 56 data methods preserve prior locations and None position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = NullFormatter::new()
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.format_data_short(1.5), "")
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 57 complete raw array batch" {
  let values = []
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = NullFormatter::new()
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  let labels = formatter.format_ticks(values)
  assert_eq(labels.length(), 0)
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 0)
  verify_basic_formatter_batch_values([], [])
  assert_eq(values.length(), 0)
  verify_basic_formatter_batch_values([], [])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 58 complete raw array batch" {
  let values = [0.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = NullFormatter::new()
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  let labels = formatter.format_ticks(values)
  assert_eq(labels.length(), 1)
  assert_eq([labels[0]], [""])
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 1)
  verify_basic_formatter_batch_values([locations.get(0)], [0.0])
  assert_eq(values.length(), 1)
  verify_basic_formatter_batch_values([values[0]], [0.0])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 59 complete raw array batch" {
  let values = [0.0, -0.0, 0.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = NullFormatter::new()
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  let labels = formatter.format_ticks(values)
  assert_eq(labels.length(), 5)
  assert_eq([labels[0], labels[1], labels[2], labels[3], labels[4]], [
    "", "", "", "", "",
  ])
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 5)
  verify_basic_formatter_batch_values(
    [
      locations.get(0),
      locations.get(1),
      locations.get(2),
      locations.get(3),
      locations.get(4),
    ],
    [0.0, -0.0, 0.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0],
  )
  assert_eq(values.length(), 5)
  verify_basic_formatter_batch_values(
    [values[0], values[1], values[2], values[3], values[4]],
    [0.0, -0.0, 0.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0],
  )
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 60 complete raw array batch" {
  let values = [3.0, 2.0, 1.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = NullFormatter::new()
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  let labels = formatter.format_ticks(values)
  assert_eq(labels.length(), 3)
  assert_eq([labels[0], labels[1], labels[2]], ["", "", ""])
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 3)
  verify_basic_formatter_batch_values(
    [locations.get(0), locations.get(1), locations.get(2)],
    [3.0, 2.0, 1.0],
  )
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    3.0, 2.0, 1.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 61 complete raw array batch" {
  let values = [1.0, 1.0, 1.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = NullFormatter::new()
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  let labels = formatter.format_ticks(values)
  assert_eq(labels.length(), 3)
  assert_eq([labels[0], labels[1], labels[2]], ["", "", ""])
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 3)
  verify_basic_formatter_batch_values(
    [locations.get(0), locations.get(1), locations.get(2)],
    [1.0, 1.0, 1.0],
  )
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 1.0, 1.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 62 complete raw array batch" {
  let values = [-2.0, -1.0, 0.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = NullFormatter::new()
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  let labels = formatter.format_ticks(values)
  assert_eq(labels.length(), 3)
  assert_eq([labels[0], labels[1], labels[2]], ["", "", ""])
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 3)
  verify_basic_formatter_batch_values(
    [locations.get(0), locations.get(1), locations.get(2)],
    [-2.0, -1.0, 0.0],
  )
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    -2.0, -1.0, 0.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 63 borrowed strided reverse zero-stride or empty view" {
  let values = [99.0, 1.0, 99.0, 2.0, 99.0, 3.0]
  let selected = TickValues::from_array(values).view(1, 2, 3)
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = NullFormatter::new()
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  let labels = formatter.format_ticks_view(selected)
  assert_eq(labels.length(), 3)
  assert_eq([labels[0], labels[1], labels[2]], ["", "", ""])
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is NdArray(_))
  assert_eq(locations.length(), 3)
  verify_basic_formatter_batch_values(
    [locations.get(0), locations.get(1), locations.get(2)],
    [1.0, 2.0, 3.0],
  )
  assert_eq(values.length(), 6)
  verify_basic_formatter_batch_values(
    [values[0], values[1], values[2], values[3], values[4], values[5]],
    [99.0, 1.0, 99.0, 2.0, 99.0, 3.0],
  )
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 64 borrowed strided reverse zero-stride or empty view" {
  let values = [99.0, 1.0, 99.0, 2.0, 99.0, 3.0]
  let selected = TickValues::from_array(values).view(5, -2, 3)
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = NullFormatter::new()
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  let labels = formatter.format_ticks_view(selected)
  assert_eq(labels.length(), 3)
  assert_eq([labels[0], labels[1], labels[2]], ["", "", ""])
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is NdArray(_))
  assert_eq(locations.length(), 3)
  verify_basic_formatter_batch_values(
    [locations.get(0), locations.get(1), locations.get(2)],
    [3.0, 2.0, 1.0],
  )
  assert_eq(values.length(), 6)
  verify_basic_formatter_batch_values(
    [values[0], values[1], values[2], values[3], values[4], values[5]],
    [99.0, 1.0, 99.0, 2.0, 99.0, 3.0],
  )
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 65 borrowed strided reverse zero-stride or empty view" {
  let values = [99.0, 1.0, 99.0, 2.0, 99.0, 3.0]
  let selected = TickValues::from_array(values).view(2, 0, 4)
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = NullFormatter::new()
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  let labels = formatter.format_ticks_view(selected)
  assert_eq(labels.length(), 4)
  assert_eq([labels[0], labels[1], labels[2], labels[3]], ["", "", "", ""])
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is NdArray(_))
  assert_eq(locations.length(), 4)
  verify_basic_formatter_batch_values(
    [locations.get(0), locations.get(1), locations.get(2), locations.get(3)],
    [99.0, 99.0, 99.0, 99.0],
  )
  assert_eq(values.length(), 6)
  verify_basic_formatter_batch_values(
    [values[0], values[1], values[2], values[3], values[4], values[5]],
    [99.0, 1.0, 99.0, 2.0, 99.0, 3.0],
  )
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 66 borrowed strided reverse zero-stride or empty view" {
  let values = [99.0, 1.0, 99.0, 2.0, 99.0, 3.0]
  let selected = TickValues::from_array(values).view(0, 1, 0)
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = NullFormatter::new()
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  let labels = formatter.format_ticks_view(selected)
  assert_eq(labels.length(), 0)
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is NdArray(_))
  assert_eq(locations.length(), 0)
  verify_basic_formatter_batch_values([], [])
  assert_eq(values.length(), 6)
  verify_basic_formatter_batch_values(
    [values[0], values[1], values[2], values[3], values[4], values[5]],
    [99.0, 1.0, 99.0, 2.0, 99.0, 3.0],
  )
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 67 base adapter retains virtual dispatch" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let wrapper = NullFormatter::new()
  let formatter = wrapper.as_base_formatter()
  let base = formatter
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-1), "")
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 68 base adapter retains virtual dispatch" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let wrapper = NullFormatter::new()
  let formatter = wrapper.as_base_formatter()
  let base = formatter
  base.set_locs([91.0, 92.0])
  let labels = formatter.format_ticks(values)
  assert_eq(labels.length(), 3)
  assert_eq([labels[0], labels[1], labels[2]], ["", "", ""])
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 3)
  verify_basic_formatter_batch_values(
    [locations.get(0), locations.get(1), locations.get(2)],
    [1.0, 2.0, 3.0],
  )
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 69 base adapter retains virtual dispatch" {
  let values = [1.0, 2.0, 3.0]
  let selected = TickValues::from_array(values).view(0, 1, 3)
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let wrapper = NullFormatter::new()
  let formatter = wrapper.as_base_formatter()
  let base = formatter
  base.set_locs([91.0, 92.0])
  let labels = formatter.format_ticks_view(selected)
  assert_eq(labels.length(), 3)
  assert_eq([labels[0], labels[1], labels[2]], ["", "", ""])
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is NdArray(_))
  assert_eq(locations.length(), 3)
  verify_basic_formatter_batch_values(
    [locations.get(0), locations.get(1), locations.get(2)],
    [1.0, 2.0, 3.0],
  )
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 70 base adapter retains virtual dispatch" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let wrapper = NullFormatter::new()
  let formatter = wrapper.as_base_formatter()
  let base = formatter
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.format_data(-0.0), "")
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 71 base adapter retains virtual dispatch" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let wrapper = NullFormatter::new()
  let formatter = wrapper.as_base_formatter()
  let base = formatter
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.format_data_short(-0.0), "")
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 72 direct optional and negative position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FixedFormatter::new(["A", "B", "C"])
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0), "")
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 73 direct optional and negative position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FixedFormatter::new(["A", "B", "C"])
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(-0.0, pos=-2147483648))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 74 direct optional and negative position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FixedFormatter::new(["A", "B", "C"])
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(-0.0, pos=-4))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 75 direct optional and negative position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FixedFormatter::new(["A", "B", "C"])
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-3), "A")
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 76 direct optional and negative position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FixedFormatter::new(["A", "B", "C"])
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-1), "C")
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 77 direct optional and negative position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FixedFormatter::new(["A", "B", "C"])
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=0), "A")
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 78 direct optional and negative position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FixedFormatter::new(["A", "B", "C"])
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=2), "C")
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 79 direct optional and negative position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FixedFormatter::new(["A", "B", "C"])
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=3), "")
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 80 direct optional and negative position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FixedFormatter::new(["A", "B", "C"])
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=2147483647), "")
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 81 data methods preserve prior locations and None position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FixedFormatter::new(["A", "B", "C"])
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.format_data(0.0 / 0.0), "")
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 82 data methods preserve prior locations and None position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FixedFormatter::new(["A", "B", "C"])
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.format_data_short(0.0 / 0.0), "")
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 83 data methods preserve prior locations and None position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FixedFormatter::new(["A", "B", "C"])
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.format_data(1.0 / 0.0), "")
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 84 data methods preserve prior locations and None position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FixedFormatter::new(["A", "B", "C"])
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.format_data_short(1.0 / 0.0), "")
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 85 data methods preserve prior locations and None position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FixedFormatter::new(["A", "B", "C"])
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.format_data(-1.0 / 0.0), "")
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 86 data methods preserve prior locations and None position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FixedFormatter::new(["A", "B", "C"])
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.format_data_short(-1.0 / 0.0), "")
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 87 data methods preserve prior locations and None position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FixedFormatter::new(["A", "B", "C"])
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.format_data(0.0), "")
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 88 data methods preserve prior locations and None position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FixedFormatter::new(["A", "B", "C"])
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.format_data_short(0.0), "")
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 89 data methods preserve prior locations and None position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FixedFormatter::new(["A", "B", "C"])
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.format_data(-0.0), "")
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 90 data methods preserve prior locations and None position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FixedFormatter::new(["A", "B", "C"])
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.format_data_short(-0.0), "")
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 91 data methods preserve prior locations and None position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FixedFormatter::new(["A", "B", "C"])
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.format_data(1.5), "")
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 92 data methods preserve prior locations and None position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FixedFormatter::new(["A", "B", "C"])
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.format_data_short(1.5), "")
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 93 complete raw array batch" {
  let values = []
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FixedFormatter::new(["A", "B", "C"])
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  let labels = formatter.format_ticks(values)
  assert_eq(labels.length(), 0)
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 0)
  verify_basic_formatter_batch_values([], [])
  assert_eq(values.length(), 0)
  verify_basic_formatter_batch_values([], [])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 94 complete raw array batch" {
  let values = [0.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FixedFormatter::new(["A", "B", "C"])
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  let labels = formatter.format_ticks(values)
  assert_eq(labels.length(), 1)
  assert_eq([labels[0]], ["A"])
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 1)
  verify_basic_formatter_batch_values([locations.get(0)], [0.0])
  assert_eq(values.length(), 1)
  verify_basic_formatter_batch_values([values[0]], [0.0])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 95 complete raw array batch" {
  let values = [0.0, -0.0, 0.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FixedFormatter::new(["A", "B", "C"])
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  let labels = formatter.format_ticks(values)
  assert_eq(labels.length(), 5)
  assert_eq([labels[0], labels[1], labels[2], labels[3], labels[4]], [
    "A", "B", "C", "", "",
  ])
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 5)
  verify_basic_formatter_batch_values(
    [
      locations.get(0),
      locations.get(1),
      locations.get(2),
      locations.get(3),
      locations.get(4),
    ],
    [0.0, -0.0, 0.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0],
  )
  assert_eq(values.length(), 5)
  verify_basic_formatter_batch_values(
    [values[0], values[1], values[2], values[3], values[4]],
    [0.0, -0.0, 0.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0],
  )
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 96 complete raw array batch" {
  let values = [3.0, 2.0, 1.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FixedFormatter::new(["A", "B", "C"])
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  let labels = formatter.format_ticks(values)
  assert_eq(labels.length(), 3)
  assert_eq([labels[0], labels[1], labels[2]], ["A", "B", "C"])
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 3)
  verify_basic_formatter_batch_values(
    [locations.get(0), locations.get(1), locations.get(2)],
    [3.0, 2.0, 1.0],
  )
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    3.0, 2.0, 1.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 97 complete raw array batch" {
  let values = [1.0, 1.0, 1.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FixedFormatter::new(["A", "B", "C"])
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  let labels = formatter.format_ticks(values)
  assert_eq(labels.length(), 3)
  assert_eq([labels[0], labels[1], labels[2]], ["A", "B", "C"])
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 3)
  verify_basic_formatter_batch_values(
    [locations.get(0), locations.get(1), locations.get(2)],
    [1.0, 1.0, 1.0],
  )
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 1.0, 1.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 98 complete raw array batch" {
  let values = [-2.0, -1.0, 0.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FixedFormatter::new(["A", "B", "C"])
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  let labels = formatter.format_ticks(values)
  assert_eq(labels.length(), 3)
  assert_eq([labels[0], labels[1], labels[2]], ["A", "B", "C"])
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 3)
  verify_basic_formatter_batch_values(
    [locations.get(0), locations.get(1), locations.get(2)],
    [-2.0, -1.0, 0.0],
  )
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    -2.0, -1.0, 0.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 99 borrowed strided reverse zero-stride or empty view" {
  let values = [99.0, 1.0, 99.0, 2.0, 99.0, 3.0]
  let selected = TickValues::from_array(values).view(1, 2, 3)
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FixedFormatter::new(["A", "B", "C"])
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  let labels = formatter.format_ticks_view(selected)
  assert_eq(labels.length(), 3)
  assert_eq([labels[0], labels[1], labels[2]], ["A", "B", "C"])
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is NdArray(_))
  assert_eq(locations.length(), 3)
  verify_basic_formatter_batch_values(
    [locations.get(0), locations.get(1), locations.get(2)],
    [1.0, 2.0, 3.0],
  )
  assert_eq(values.length(), 6)
  verify_basic_formatter_batch_values(
    [values[0], values[1], values[2], values[3], values[4], values[5]],
    [99.0, 1.0, 99.0, 2.0, 99.0, 3.0],
  )
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 100 borrowed strided reverse zero-stride or empty view" {
  let values = [99.0, 1.0, 99.0, 2.0, 99.0, 3.0]
  let selected = TickValues::from_array(values).view(5, -2, 3)
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FixedFormatter::new(["A", "B", "C"])
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  let labels = formatter.format_ticks_view(selected)
  assert_eq(labels.length(), 3)
  assert_eq([labels[0], labels[1], labels[2]], ["A", "B", "C"])
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is NdArray(_))
  assert_eq(locations.length(), 3)
  verify_basic_formatter_batch_values(
    [locations.get(0), locations.get(1), locations.get(2)],
    [3.0, 2.0, 1.0],
  )
  assert_eq(values.length(), 6)
  verify_basic_formatter_batch_values(
    [values[0], values[1], values[2], values[3], values[4], values[5]],
    [99.0, 1.0, 99.0, 2.0, 99.0, 3.0],
  )
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 101 borrowed strided reverse zero-stride or empty view" {
  let values = [99.0, 1.0, 99.0, 2.0, 99.0, 3.0]
  let selected = TickValues::from_array(values).view(2, 0, 4)
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FixedFormatter::new(["A", "B", "C"])
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  let labels = formatter.format_ticks_view(selected)
  assert_eq(labels.length(), 4)
  assert_eq([labels[0], labels[1], labels[2], labels[3]], ["A", "B", "C", ""])
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is NdArray(_))
  assert_eq(locations.length(), 4)
  verify_basic_formatter_batch_values(
    [locations.get(0), locations.get(1), locations.get(2), locations.get(3)],
    [99.0, 99.0, 99.0, 99.0],
  )
  assert_eq(values.length(), 6)
  verify_basic_formatter_batch_values(
    [values[0], values[1], values[2], values[3], values[4], values[5]],
    [99.0, 1.0, 99.0, 2.0, 99.0, 3.0],
  )
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 102 borrowed strided reverse zero-stride or empty view" {
  let values = [99.0, 1.0, 99.0, 2.0, 99.0, 3.0]
  let selected = TickValues::from_array(values).view(0, 1, 0)
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FixedFormatter::new(["A", "B", "C"])
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  let labels = formatter.format_ticks_view(selected)
  assert_eq(labels.length(), 0)
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is NdArray(_))
  assert_eq(locations.length(), 0)
  verify_basic_formatter_batch_values([], [])
  assert_eq(values.length(), 6)
  verify_basic_formatter_batch_values(
    [values[0], values[1], values[2], values[3], values[4], values[5]],
    [99.0, 1.0, 99.0, 2.0, 99.0, 3.0],
  )
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 103 base adapter retains virtual dispatch" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let wrapper = FixedFormatter::new(["A", "B", "C"])
  let formatter = wrapper.as_base_formatter()
  let base = formatter
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-1), "C")
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 104 base adapter retains virtual dispatch" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let wrapper = FixedFormatter::new(["A", "B", "C"])
  let formatter = wrapper.as_base_formatter()
  let base = formatter
  base.set_locs([91.0, 92.0])
  let labels = formatter.format_ticks(values)
  assert_eq(labels.length(), 3)
  assert_eq([labels[0], labels[1], labels[2]], ["A", "B", "C"])
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 3)
  verify_basic_formatter_batch_values(
    [locations.get(0), locations.get(1), locations.get(2)],
    [1.0, 2.0, 3.0],
  )
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 105 base adapter retains virtual dispatch" {
  let values = [1.0, 2.0, 3.0]
  let selected = TickValues::from_array(values).view(0, 1, 3)
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let wrapper = FixedFormatter::new(["A", "B", "C"])
  let formatter = wrapper.as_base_formatter()
  let base = formatter
  base.set_locs([91.0, 92.0])
  let labels = formatter.format_ticks_view(selected)
  assert_eq(labels.length(), 3)
  assert_eq([labels[0], labels[1], labels[2]], ["A", "B", "C"])
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is NdArray(_))
  assert_eq(locations.length(), 3)
  verify_basic_formatter_batch_values(
    [locations.get(0), locations.get(1), locations.get(2)],
    [1.0, 2.0, 3.0],
  )
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 106 base adapter retains virtual dispatch" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let wrapper = FixedFormatter::new(["A", "B", "C"])
  let formatter = wrapper.as_base_formatter()
  let base = formatter
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.format_data(-0.0), "")
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 107 base adapter retains virtual dispatch" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let wrapper = FixedFormatter::new(["A", "B", "C"])
  let formatter = wrapper.as_base_formatter()
  let base = formatter
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.format_data_short(-0.0), "")
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 108 direct optional and negative position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FuncFormatter::new((value, position) => {
    seen_values.push(value)
    seen_positions.push(position)
    basic_formatter_batch_position(position)
  })
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0), "none")
  verify_basic_formatter_batch_values(seen_values, [-0.0])
  assert_eq(seen_positions, [None])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 109 direct optional and negative position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FuncFormatter::new((value, position) => {
    seen_values.push(value)
    seen_positions.push(position)
    basic_formatter_batch_position(position)
  })
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-2147483648), "p-2147483648")
  verify_basic_formatter_batch_values(seen_values, [-0.0])
  assert_eq(seen_positions, [Some(-2147483648)])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 110 direct optional and negative position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FuncFormatter::new((value, position) => {
    seen_values.push(value)
    seen_positions.push(position)
    basic_formatter_batch_position(position)
  })
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-4), "p-4")
  verify_basic_formatter_batch_values(seen_values, [-0.0])
  assert_eq(seen_positions, [Some(-4)])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 111 direct optional and negative position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FuncFormatter::new((value, position) => {
    seen_values.push(value)
    seen_positions.push(position)
    basic_formatter_batch_position(position)
  })
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-3), "p-3")
  verify_basic_formatter_batch_values(seen_values, [-0.0])
  assert_eq(seen_positions, [Some(-3)])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 112 direct optional and negative position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FuncFormatter::new((value, position) => {
    seen_values.push(value)
    seen_positions.push(position)
    basic_formatter_batch_position(position)
  })
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-1), "p-1")
  verify_basic_formatter_batch_values(seen_values, [-0.0])
  assert_eq(seen_positions, [Some(-1)])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 113 direct optional and negative position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FuncFormatter::new((value, position) => {
    seen_values.push(value)
    seen_positions.push(position)
    basic_formatter_batch_position(position)
  })
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=0), "p0")
  verify_basic_formatter_batch_values(seen_values, [-0.0])
  assert_eq(seen_positions, [Some(0)])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 114 direct optional and negative position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FuncFormatter::new((value, position) => {
    seen_values.push(value)
    seen_positions.push(position)
    basic_formatter_batch_position(position)
  })
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=2), "p2")
  verify_basic_formatter_batch_values(seen_values, [-0.0])
  assert_eq(seen_positions, [Some(2)])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 115 direct optional and negative position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FuncFormatter::new((value, position) => {
    seen_values.push(value)
    seen_positions.push(position)
    basic_formatter_batch_position(position)
  })
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=3), "p3")
  verify_basic_formatter_batch_values(seen_values, [-0.0])
  assert_eq(seen_positions, [Some(3)])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 116 direct optional and negative position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FuncFormatter::new((value, position) => {
    seen_values.push(value)
    seen_positions.push(position)
    basic_formatter_batch_position(position)
  })
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=2147483647), "p2147483647")
  verify_basic_formatter_batch_values(seen_values, [-0.0])
  assert_eq(seen_positions, [Some(2147483647)])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 117 data methods preserve prior locations and None position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FuncFormatter::new((value, position) => {
    seen_values.push(value)
    seen_positions.push(position)
    basic_formatter_batch_value(value)
  })
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.format_data(0.0 / 0.0), "nan")
  verify_basic_formatter_batch_values(seen_values, [0.0 / 0.0])
  assert_eq(seen_positions, [None])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 118 data methods preserve prior locations and None position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FuncFormatter::new((value, position) => {
    seen_values.push(value)
    seen_positions.push(position)
    basic_formatter_batch_value(value)
  })
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.format_data_short(0.0 / 0.0), "nan")
  verify_basic_formatter_batch_values(seen_values, [0.0 / 0.0])
  assert_eq(seen_positions, [None])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 119 data methods preserve prior locations and None position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FuncFormatter::new((value, position) => {
    seen_values.push(value)
    seen_positions.push(position)
    basic_formatter_batch_value(value)
  })
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.format_data(1.0 / 0.0), "positive infinity")
  verify_basic_formatter_batch_values(seen_values, [1.0 / 0.0])
  assert_eq(seen_positions, [None])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 120 data methods preserve prior locations and None position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FuncFormatter::new((value, position) => {
    seen_values.push(value)
    seen_positions.push(position)
    basic_formatter_batch_value(value)
  })
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.format_data_short(1.0 / 0.0), "positive infinity")
  verify_basic_formatter_batch_values(seen_values, [1.0 / 0.0])
  assert_eq(seen_positions, [None])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 121 data methods preserve prior locations and None position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FuncFormatter::new((value, position) => {
    seen_values.push(value)
    seen_positions.push(position)
    basic_formatter_batch_value(value)
  })
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.format_data(-1.0 / 0.0), "negative infinity")
  verify_basic_formatter_batch_values(seen_values, [-1.0 / 0.0])
  assert_eq(seen_positions, [None])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 122 data methods preserve prior locations and None position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FuncFormatter::new((value, position) => {
    seen_values.push(value)
    seen_positions.push(position)
    basic_formatter_batch_value(value)
  })
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.format_data_short(-1.0 / 0.0), "negative infinity")
  verify_basic_formatter_batch_values(seen_values, [-1.0 / 0.0])
  assert_eq(seen_positions, [None])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 123 data methods preserve prior locations and None position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FuncFormatter::new((value, position) => {
    seen_values.push(value)
    seen_positions.push(position)
    basic_formatter_batch_value(value)
  })
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.format_data(0.0), "zero")
  verify_basic_formatter_batch_values(seen_values, [0.0])
  assert_eq(seen_positions, [None])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 124 data methods preserve prior locations and None position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FuncFormatter::new((value, position) => {
    seen_values.push(value)
    seen_positions.push(position)
    basic_formatter_batch_value(value)
  })
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.format_data_short(0.0), "zero")
  verify_basic_formatter_batch_values(seen_values, [0.0])
  assert_eq(seen_positions, [None])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 125 data methods preserve prior locations and None position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FuncFormatter::new((value, position) => {
    seen_values.push(value)
    seen_positions.push(position)
    basic_formatter_batch_value(value)
  })
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.format_data(-0.0), "negative zero")
  verify_basic_formatter_batch_values(seen_values, [-0.0])
  assert_eq(seen_positions, [None])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 126 data methods preserve prior locations and None position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FuncFormatter::new((value, position) => {
    seen_values.push(value)
    seen_positions.push(position)
    basic_formatter_batch_value(value)
  })
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.format_data_short(-0.0), "negative zero")
  verify_basic_formatter_batch_values(seen_values, [-0.0])
  assert_eq(seen_positions, [None])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 127 data methods preserve prior locations and None position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FuncFormatter::new((value, position) => {
    seen_values.push(value)
    seen_positions.push(position)
    basic_formatter_batch_value(value)
  })
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.format_data(1.5), "finite")
  verify_basic_formatter_batch_values(seen_values, [1.5])
  assert_eq(seen_positions, [None])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 128 data methods preserve prior locations and None position" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FuncFormatter::new((value, position) => {
    seen_values.push(value)
    seen_positions.push(position)
    basic_formatter_batch_value(value)
  })
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.format_data_short(1.5), "finite")
  verify_basic_formatter_batch_values(seen_values, [1.5])
  assert_eq(seen_positions, [None])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 129 complete raw array batch" {
  let values = []
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FuncFormatter::new((value, position) => {
    seen_values.push(value)
    seen_positions.push(position)
    basic_formatter_batch_value(value)
  })
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  let labels = formatter.format_ticks(values)
  assert_eq(labels.length(), 0)
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 0)
  verify_basic_formatter_batch_values([], [])
  assert_eq(values.length(), 0)
  verify_basic_formatter_batch_values([], [])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 130 complete raw array batch" {
  let values = [0.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FuncFormatter::new((value, position) => {
    seen_values.push(value)
    seen_positions.push(position)
    basic_formatter_batch_value(value)
  })
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  let labels = formatter.format_ticks(values)
  assert_eq(labels.length(), 1)
  assert_eq([labels[0]], ["zero"])
  verify_basic_formatter_batch_values(seen_values, [0.0])
  assert_eq(seen_positions, [Some(0)])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 1)
  verify_basic_formatter_batch_values([locations.get(0)], [0.0])
  assert_eq(values.length(), 1)
  verify_basic_formatter_batch_values([values[0]], [0.0])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 131 complete raw array batch" {
  let values = [0.0, -0.0, 0.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FuncFormatter::new((value, position) => {
    seen_values.push(value)
    seen_positions.push(position)
    basic_formatter_batch_value(value)
  })
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  let labels = formatter.format_ticks(values)
  assert_eq(labels.length(), 5)
  assert_eq([labels[0], labels[1], labels[2], labels[3], labels[4]], [
    "zero", "negative zero", "nan", "positive infinity", "negative infinity",
  ])
  verify_basic_formatter_batch_values(seen_values, [
    0.0,
    -0.0,
    0.0 / 0.0,
    1.0 / 0.0,
    -1.0 / 0.0,
  ])
  assert_eq(seen_positions, [Some(0), Some(1), Some(2), Some(3), Some(4)])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 5)
  verify_basic_formatter_batch_values(
    [
      locations.get(0),
      locations.get(1),
      locations.get(2),
      locations.get(3),
      locations.get(4),
    ],
    [0.0, -0.0, 0.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0],
  )
  assert_eq(values.length(), 5)
  verify_basic_formatter_batch_values(
    [values[0], values[1], values[2], values[3], values[4]],
    [0.0, -0.0, 0.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0],
  )
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 132 complete raw array batch" {
  let values = [3.0, 2.0, 1.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FuncFormatter::new((value, position) => {
    seen_values.push(value)
    seen_positions.push(position)
    basic_formatter_batch_value(value)
  })
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  let labels = formatter.format_ticks(values)
  assert_eq(labels.length(), 3)
  assert_eq([labels[0], labels[1], labels[2]], ["finite", "finite", "finite"])
  verify_basic_formatter_batch_values(seen_values, [3.0, 2.0, 1.0])
  assert_eq(seen_positions, [Some(0), Some(1), Some(2)])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 3)
  verify_basic_formatter_batch_values(
    [locations.get(0), locations.get(1), locations.get(2)],
    [3.0, 2.0, 1.0],
  )
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    3.0, 2.0, 1.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 133 complete raw array batch" {
  let values = [1.0, 1.0, 1.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FuncFormatter::new((value, position) => {
    seen_values.push(value)
    seen_positions.push(position)
    basic_formatter_batch_value(value)
  })
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  let labels = formatter.format_ticks(values)
  assert_eq(labels.length(), 3)
  assert_eq([labels[0], labels[1], labels[2]], ["finite", "finite", "finite"])
  verify_basic_formatter_batch_values(seen_values, [1.0, 1.0, 1.0])
  assert_eq(seen_positions, [Some(0), Some(1), Some(2)])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 3)
  verify_basic_formatter_batch_values(
    [locations.get(0), locations.get(1), locations.get(2)],
    [1.0, 1.0, 1.0],
  )
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 1.0, 1.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 134 complete raw array batch" {
  let values = [-2.0, -1.0, 0.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FuncFormatter::new((value, position) => {
    seen_values.push(value)
    seen_positions.push(position)
    basic_formatter_batch_value(value)
  })
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  let labels = formatter.format_ticks(values)
  assert_eq(labels.length(), 3)
  assert_eq([labels[0], labels[1], labels[2]], ["finite", "finite", "zero"])
  verify_basic_formatter_batch_values(seen_values, [-2.0, -1.0, 0.0])
  assert_eq(seen_positions, [Some(0), Some(1), Some(2)])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 3)
  verify_basic_formatter_batch_values(
    [locations.get(0), locations.get(1), locations.get(2)],
    [-2.0, -1.0, 0.0],
  )
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    -2.0, -1.0, 0.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 135 borrowed strided reverse zero-stride or empty view" {
  let values = [99.0, 1.0, 99.0, 2.0, 99.0, 3.0]
  let selected = TickValues::from_array(values).view(1, 2, 3)
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FuncFormatter::new((value, position) => {
    seen_values.push(value)
    seen_positions.push(position)
    basic_formatter_batch_position(position)
  })
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  let labels = formatter.format_ticks_view(selected)
  assert_eq(labels.length(), 3)
  assert_eq([labels[0], labels[1], labels[2]], ["p0", "p1", "p2"])
  verify_basic_formatter_batch_values(seen_values, [1.0, 2.0, 3.0])
  assert_eq(seen_positions, [Some(0), Some(1), Some(2)])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is NdArray(_))
  assert_eq(locations.length(), 3)
  verify_basic_formatter_batch_values(
    [locations.get(0), locations.get(1), locations.get(2)],
    [1.0, 2.0, 3.0],
  )
  assert_eq(values.length(), 6)
  verify_basic_formatter_batch_values(
    [values[0], values[1], values[2], values[3], values[4], values[5]],
    [99.0, 1.0, 99.0, 2.0, 99.0, 3.0],
  )
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 136 borrowed strided reverse zero-stride or empty view" {
  let values = [99.0, 1.0, 99.0, 2.0, 99.0, 3.0]
  let selected = TickValues::from_array(values).view(5, -2, 3)
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FuncFormatter::new((value, position) => {
    seen_values.push(value)
    seen_positions.push(position)
    basic_formatter_batch_position(position)
  })
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  let labels = formatter.format_ticks_view(selected)
  assert_eq(labels.length(), 3)
  assert_eq([labels[0], labels[1], labels[2]], ["p0", "p1", "p2"])
  verify_basic_formatter_batch_values(seen_values, [3.0, 2.0, 1.0])
  assert_eq(seen_positions, [Some(0), Some(1), Some(2)])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is NdArray(_))
  assert_eq(locations.length(), 3)
  verify_basic_formatter_batch_values(
    [locations.get(0), locations.get(1), locations.get(2)],
    [3.0, 2.0, 1.0],
  )
  assert_eq(values.length(), 6)
  verify_basic_formatter_batch_values(
    [values[0], values[1], values[2], values[3], values[4], values[5]],
    [99.0, 1.0, 99.0, 2.0, 99.0, 3.0],
  )
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 137 borrowed strided reverse zero-stride or empty view" {
  let values = [99.0, 1.0, 99.0, 2.0, 99.0, 3.0]
  let selected = TickValues::from_array(values).view(2, 0, 4)
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FuncFormatter::new((value, position) => {
    seen_values.push(value)
    seen_positions.push(position)
    basic_formatter_batch_position(position)
  })
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  let labels = formatter.format_ticks_view(selected)
  assert_eq(labels.length(), 4)
  assert_eq([labels[0], labels[1], labels[2], labels[3]], [
    "p0", "p1", "p2", "p3",
  ])
  verify_basic_formatter_batch_values(seen_values, [99.0, 99.0, 99.0, 99.0])
  assert_eq(seen_positions, [Some(0), Some(1), Some(2), Some(3)])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is NdArray(_))
  assert_eq(locations.length(), 4)
  verify_basic_formatter_batch_values(
    [locations.get(0), locations.get(1), locations.get(2), locations.get(3)],
    [99.0, 99.0, 99.0, 99.0],
  )
  assert_eq(values.length(), 6)
  verify_basic_formatter_batch_values(
    [values[0], values[1], values[2], values[3], values[4], values[5]],
    [99.0, 1.0, 99.0, 2.0, 99.0, 3.0],
  )
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 138 borrowed strided reverse zero-stride or empty view" {
  let values = [99.0, 1.0, 99.0, 2.0, 99.0, 3.0]
  let selected = TickValues::from_array(values).view(0, 1, 0)
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FuncFormatter::new((value, position) => {
    seen_values.push(value)
    seen_positions.push(position)
    basic_formatter_batch_position(position)
  })
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  let labels = formatter.format_ticks_view(selected)
  assert_eq(labels.length(), 0)
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is NdArray(_))
  assert_eq(locations.length(), 0)
  verify_basic_formatter_batch_values([], [])
  assert_eq(values.length(), 6)
  verify_basic_formatter_batch_values(
    [values[0], values[1], values[2], values[3], values[4], values[5]],
    [99.0, 1.0, 99.0, 2.0, 99.0, 3.0],
  )
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 139 base adapter retains virtual dispatch" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let wrapper = FuncFormatter::new((value, position) => {
    seen_values.push(value)
    seen_positions.push(position)
    basic_formatter_batch_position(position)
  })
  let formatter = wrapper.as_base_formatter()
  let base = formatter
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-1), "p-1")
  verify_basic_formatter_batch_values(seen_values, [-0.0])
  assert_eq(seen_positions, [Some(-1)])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 140 base adapter retains virtual dispatch" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let wrapper = FuncFormatter::new((value, position) => {
    seen_values.push(value)
    seen_positions.push(position)
    basic_formatter_batch_position(position)
  })
  let formatter = wrapper.as_base_formatter()
  let base = formatter
  base.set_locs([91.0, 92.0])
  let labels = formatter.format_ticks(values)
  assert_eq(labels.length(), 3)
  assert_eq([labels[0], labels[1], labels[2]], ["p0", "p1", "p2"])
  verify_basic_formatter_batch_values(seen_values, [1.0, 2.0, 3.0])
  assert_eq(seen_positions, [Some(0), Some(1), Some(2)])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 3)
  verify_basic_formatter_batch_values(
    [locations.get(0), locations.get(1), locations.get(2)],
    [1.0, 2.0, 3.0],
  )
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 141 base adapter retains virtual dispatch" {
  let values = [1.0, 2.0, 3.0]
  let selected = TickValues::from_array(values).view(0, 1, 3)
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let wrapper = FuncFormatter::new((value, position) => {
    seen_values.push(value)
    seen_positions.push(position)
    basic_formatter_batch_position(position)
  })
  let formatter = wrapper.as_base_formatter()
  let base = formatter
  base.set_locs([91.0, 92.0])
  let labels = formatter.format_ticks_view(selected)
  assert_eq(labels.length(), 3)
  assert_eq([labels[0], labels[1], labels[2]], ["p0", "p1", "p2"])
  verify_basic_formatter_batch_values(seen_values, [1.0, 2.0, 3.0])
  assert_eq(seen_positions, [Some(0), Some(1), Some(2)])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is NdArray(_))
  assert_eq(locations.length(), 3)
  verify_basic_formatter_batch_values(
    [locations.get(0), locations.get(1), locations.get(2)],
    [1.0, 2.0, 3.0],
  )
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 142 base adapter retains virtual dispatch" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let wrapper = FuncFormatter::new((value, position) => {
    seen_values.push(value)
    seen_positions.push(position)
    basic_formatter_batch_position(position)
  })
  let formatter = wrapper.as_base_formatter()
  let base = formatter
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.format_data(-0.0), "none")
  verify_basic_formatter_batch_values(seen_values, [-0.0])
  assert_eq(seen_positions, [None])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 143 base adapter retains virtual dispatch" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let wrapper = FuncFormatter::new((value, position) => {
    seen_values.push(value)
    seen_positions.push(position)
    basic_formatter_batch_position(position)
  })
  let formatter = wrapper.as_base_formatter()
  let base = formatter
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.format_data_short(-0.0), "none")
  verify_basic_formatter_batch_values(seen_values, [-0.0])
  assert_eq(seen_positions, [None])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 144 empty sequence uses source negative indexing" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FixedFormatter::new([])
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0), "")
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 145 empty sequence uses source negative indexing" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FixedFormatter::new([])
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(-0.0, pos=-2147483648))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 146 empty sequence uses source negative indexing" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FixedFormatter::new([])
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(-0.0, pos=-1))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 147 empty sequence uses source negative indexing" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FixedFormatter::new([])
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=0), "")
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 148 empty sequence uses source negative indexing" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FixedFormatter::new([])
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=2147483647), "")
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 149 callback error has exact message and retained side effects" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FuncFormatter::new((value, position) => {
    seen_values.push(value)
    seen_positions.push(position)
    if position is None {
      raise @core.DataError::InvalidTicks(message="fixture callback")
    }
    basic_formatter_batch_position(position)
  })
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(-0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) => message == "fixture callback"
      _ => false
    },
  )
  verify_basic_formatter_batch_values(seen_values, [-0.0])
  assert_eq(seen_positions, [None])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 150 callback error has exact message and retained side effects" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FuncFormatter::new((value, position) => {
    seen_values.push(value)
    seen_positions.push(position)
    if position == Some(0) {
      raise @core.DataError::InvalidTicks(message="fixture callback")
    }
    basic_formatter_batch_position(position)
  })
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(-0.0, pos=0))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) => message == "fixture callback"
      _ => false
    },
  )
  verify_basic_formatter_batch_values(seen_values, [-0.0])
  assert_eq(seen_positions, [Some(0)])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 151 callback error has exact message and retained side effects" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FuncFormatter::new((value, position) => {
    seen_values.push(value)
    seen_positions.push(position)
    if position == Some(1) {
      raise @core.DataError::InvalidTicks(message="fixture callback")
    }
    basic_formatter_batch_position(position)
  })
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(-0.0, pos=1))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) => message == "fixture callback"
      _ => false
    },
  )
  verify_basic_formatter_batch_values(seen_values, [-0.0])
  assert_eq(seen_positions, [Some(1)])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 152 callback error has exact message and retained side effects" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FuncFormatter::new((value, position) => {
    seen_values.push(value)
    seen_positions.push(position)
    if position is None {
      raise @core.DataError::InvalidTicks(message="fixture callback")
    }
    basic_formatter_batch_position(position)
  })
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.format_data(-0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) => message == "fixture callback"
      _ => false
    },
  )
  verify_basic_formatter_batch_values(seen_values, [-0.0])
  assert_eq(seen_positions, [None])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 153 callback error has exact message and retained side effects" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FuncFormatter::new((value, position) => {
    seen_values.push(value)
    seen_positions.push(position)
    if position == Some(0) {
      raise @core.DataError::InvalidTicks(message="fixture callback")
    }
    basic_formatter_batch_position(position)
  })
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.format_data(-0.0), "none")
  verify_basic_formatter_batch_values(seen_values, [-0.0])
  assert_eq(seen_positions, [None])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 154 callback error has exact message and retained side effects" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FuncFormatter::new((value, position) => {
    seen_values.push(value)
    seen_positions.push(position)
    if position == Some(1) {
      raise @core.DataError::InvalidTicks(message="fixture callback")
    }
    basic_formatter_batch_position(position)
  })
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.format_data(-0.0), "none")
  verify_basic_formatter_batch_values(seen_values, [-0.0])
  assert_eq(seen_positions, [None])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 155 callback error has exact message and retained side effects" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FuncFormatter::new((value, position) => {
    seen_values.push(value)
    seen_positions.push(position)
    if position is None {
      raise @core.DataError::InvalidTicks(message="fixture callback")
    }
    basic_formatter_batch_position(position)
  })
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.format_data_short(-0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) => message == "fixture callback"
      _ => false
    },
  )
  verify_basic_formatter_batch_values(seen_values, [-0.0])
  assert_eq(seen_positions, [None])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 156 callback error has exact message and retained side effects" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FuncFormatter::new((value, position) => {
    seen_values.push(value)
    seen_positions.push(position)
    if position == Some(0) {
      raise @core.DataError::InvalidTicks(message="fixture callback")
    }
    basic_formatter_batch_position(position)
  })
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.format_data_short(-0.0), "none")
  verify_basic_formatter_batch_values(seen_values, [-0.0])
  assert_eq(seen_positions, [None])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 157 callback error has exact message and retained side effects" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FuncFormatter::new((value, position) => {
    seen_values.push(value)
    seen_positions.push(position)
    if position == Some(1) {
      raise @core.DataError::InvalidTicks(message="fixture callback")
    }
    basic_formatter_batch_position(position)
  })
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_eq(formatter.format_data_short(-0.0), "none")
  verify_basic_formatter_batch_values(seen_values, [-0.0])
  assert_eq(seen_positions, [None])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    91.0, 92.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 158 callback error has exact message and retained side effects" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FuncFormatter::new((value, position) => {
    seen_values.push(value)
    seen_positions.push(position)
    if position is None {
      raise @core.DataError::InvalidTicks(message="fixture callback")
    }
    basic_formatter_batch_position(position)
  })
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  let labels = formatter.format_ticks(values)
  assert_eq(labels.length(), 3)
  assert_eq([labels[0], labels[1], labels[2]], ["p0", "p1", "p2"])
  verify_basic_formatter_batch_values(seen_values, [1.0, 2.0, 3.0])
  assert_eq(seen_positions, [Some(0), Some(1), Some(2)])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 3)
  verify_basic_formatter_batch_values(
    [locations.get(0), locations.get(1), locations.get(2)],
    [1.0, 2.0, 3.0],
  )
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 159 callback error has exact message and retained side effects" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FuncFormatter::new((value, position) => {
    seen_values.push(value)
    seen_positions.push(position)
    if position == Some(0) {
      raise @core.DataError::InvalidTicks(message="fixture callback")
    }
    basic_formatter_batch_position(position)
  })
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.format_ticks(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) => message == "fixture callback"
      _ => false
    },
  )
  verify_basic_formatter_batch_values(seen_values, [1.0])
  assert_eq(seen_positions, [Some(0)])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 3)
  verify_basic_formatter_batch_values(
    [locations.get(0), locations.get(1), locations.get(2)],
    [1.0, 2.0, 3.0],
  )
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 160 callback error has exact message and retained side effects" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FuncFormatter::new((value, position) => {
    seen_values.push(value)
    seen_positions.push(position)
    if position == Some(1) {
      raise @core.DataError::InvalidTicks(message="fixture callback")
    }
    basic_formatter_batch_position(position)
  })
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.format_ticks(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) => message == "fixture callback"
      _ => false
    },
  )
  verify_basic_formatter_batch_values(seen_values, [1.0, 2.0])
  assert_eq(seen_positions, [Some(0), Some(1)])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 3)
  verify_basic_formatter_batch_values(
    [locations.get(0), locations.get(1), locations.get(2)],
    [1.0, 2.0, 3.0],
  )
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 161 callback error has exact message and retained side effects" {
  let values = [1.0, 2.0, 3.0]
  let selected = TickValues::from_array(values).view(0, 1, 3)
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FuncFormatter::new((value, position) => {
    seen_values.push(value)
    seen_positions.push(position)
    if position is None {
      raise @core.DataError::InvalidTicks(message="fixture callback")
    }
    basic_formatter_batch_position(position)
  })
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  let labels = formatter.format_ticks_view(selected)
  assert_eq(labels.length(), 3)
  assert_eq([labels[0], labels[1], labels[2]], ["p0", "p1", "p2"])
  verify_basic_formatter_batch_values(seen_values, [1.0, 2.0, 3.0])
  assert_eq(seen_positions, [Some(0), Some(1), Some(2)])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is NdArray(_))
  assert_eq(locations.length(), 3)
  verify_basic_formatter_batch_values(
    [locations.get(0), locations.get(1), locations.get(2)],
    [1.0, 2.0, 3.0],
  )
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 162 callback error has exact message and retained side effects" {
  let values = [1.0, 2.0, 3.0]
  let selected = TickValues::from_array(values).view(0, 1, 3)
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FuncFormatter::new((value, position) => {
    seen_values.push(value)
    seen_positions.push(position)
    if position == Some(0) {
      raise @core.DataError::InvalidTicks(message="fixture callback")
    }
    basic_formatter_batch_position(position)
  })
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(selected))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) => message == "fixture callback"
      _ => false
    },
  )
  verify_basic_formatter_batch_values(seen_values, [1.0])
  assert_eq(seen_positions, [Some(0)])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is NdArray(_))
  assert_eq(locations.length(), 3)
  verify_basic_formatter_batch_values(
    [locations.get(0), locations.get(1), locations.get(2)],
    [1.0, 2.0, 3.0],
  )
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 163 callback error has exact message and retained side effects" {
  let values = [1.0, 2.0, 3.0]
  let selected = TickValues::from_array(values).view(0, 1, 3)
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FuncFormatter::new((value, position) => {
    seen_values.push(value)
    seen_positions.push(position)
    if position == Some(1) {
      raise @core.DataError::InvalidTicks(message="fixture callback")
    }
    basic_formatter_batch_position(position)
  })
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(selected))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) => message == "fixture callback"
      _ => false
    },
  )
  verify_basic_formatter_batch_values(seen_values, [1.0, 2.0])
  assert_eq(seen_positions, [Some(0), Some(1)])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is NdArray(_))
  assert_eq(locations.length(), 3)
  verify_basic_formatter_batch_values(
    [locations.get(0), locations.get(1), locations.get(2)],
    [1.0, 2.0, 3.0],
  )
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 164 live user program replace" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FuncFormatter::new((value, position) => {
    seen_values.push(value)
    seen_positions.push(position)
    if position == Some(0) {
      values[1] = 20.0
    }
    basic_formatter_batch_position(position)
  })
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  let labels = formatter.format_ticks(values)
  assert_eq(labels.length(), 3)
  assert_eq([labels[0], labels[1], labels[2]], ["p0", "p1", "p2"])
  verify_basic_formatter_batch_values(seen_values, [1.0, 20.0, 3.0])
  assert_eq(seen_positions, [Some(0), Some(1), Some(2)])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 3)
  verify_basic_formatter_batch_values(
    [locations.get(0), locations.get(1), locations.get(2)],
    [1.0, 20.0, 3.0],
  )
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 20.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 165 live user program append" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FuncFormatter::new((value, position) => {
    seen_values.push(value)
    seen_positions.push(position)
    if position == Some(0) {
      values.push(42.0)
    }
    basic_formatter_batch_position(position)
  })
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  let labels = formatter.format_ticks(values)
  assert_eq(labels.length(), 4)
  assert_eq([labels[0], labels[1], labels[2], labels[3]], [
    "p0", "p1", "p2", "p3",
  ])
  verify_basic_formatter_batch_values(seen_values, [1.0, 2.0, 3.0, 42.0])
  assert_eq(seen_positions, [Some(0), Some(1), Some(2), Some(3)])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 4)
  verify_basic_formatter_batch_values(
    [locations.get(0), locations.get(1), locations.get(2), locations.get(3)],
    [1.0, 2.0, 3.0, 42.0],
  )
  assert_eq(values.length(), 4)
  verify_basic_formatter_batch_values(
    [values[0], values[1], values[2], values[3]],
    [1.0, 2.0, 3.0, 42.0],
  )
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 166 live user program replace_append" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FuncFormatter::new((value, position) => {
    seen_values.push(value)
    seen_positions.push(position)
    if position == Some(0) {
      values[1] = 20.0
    }
    if position == Some(0) {
      values.push(42.0)
    }
    basic_formatter_batch_position(position)
  })
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  let labels = formatter.format_ticks(values)
  assert_eq(labels.length(), 4)
  assert_eq([labels[0], labels[1], labels[2], labels[3]], [
    "p0", "p1", "p2", "p3",
  ])
  verify_basic_formatter_batch_values(seen_values, [1.0, 20.0, 3.0, 42.0])
  assert_eq(seen_positions, [Some(0), Some(1), Some(2), Some(3)])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 4)
  verify_basic_formatter_batch_values(
    [locations.get(0), locations.get(1), locations.get(2), locations.get(3)],
    [1.0, 20.0, 3.0, 42.0],
  )
  assert_eq(values.length(), 4)
  verify_basic_formatter_batch_values(
    [values[0], values[1], values[2], values[3]],
    [1.0, 20.0, 3.0, 42.0],
  )
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 167 live user program clear" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FuncFormatter::new((value, position) => {
    seen_values.push(value)
    seen_positions.push(position)
    if position == Some(0) {
      values.clear()
    }
    basic_formatter_batch_position(position)
  })
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  let labels = formatter.format_ticks(values)
  assert_eq(labels.length(), 1)
  assert_eq([labels[0]], ["p0"])
  verify_basic_formatter_batch_values(seen_values, [1.0])
  assert_eq(seen_positions, [Some(0)])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 0)
  verify_basic_formatter_batch_values([], [])
  assert_eq(values.length(), 0)
  verify_basic_formatter_batch_values([], [])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 168 live user program append_error" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FuncFormatter::new((value, position) => {
    seen_values.push(value)
    seen_positions.push(position)
    if position == Some(0) {
      values.push(42.0)
    }
    if position == Some(1) {
      raise @core.DataError::InvalidTicks(message="fixture callback")
    }
    basic_formatter_batch_position(position)
  })
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.format_ticks(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) => message == "fixture callback"
      _ => false
    },
  )
  verify_basic_formatter_batch_values(seen_values, [1.0, 2.0])
  assert_eq(seen_positions, [Some(0), Some(1)])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 4)
  verify_basic_formatter_batch_values(
    [locations.get(0), locations.get(1), locations.get(2), locations.get(3)],
    [1.0, 2.0, 3.0, 42.0],
  )
  assert_eq(values.length(), 4)
  verify_basic_formatter_batch_values(
    [values[0], values[1], values[2], values[3]],
    [1.0, 2.0, 3.0, 42.0],
  )
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 169 live user program set_locs" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let holder : Array[FuncFormatter?] = [None]
  let formatter = FuncFormatter::new((value, position) => {
    seen_values.push(value)
    seen_positions.push(position)
    if position == Some(0) {
      holder[0].unwrap().set_locs([7.0, 8.0])
    }
    basic_formatter_batch_position(position)
  })
  holder[0] = Some(formatter)
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  let labels = formatter.format_ticks(values)
  assert_eq(labels.length(), 3)
  assert_eq([labels[0], labels[1], labels[2]], ["p0", "p1", "p2"])
  verify_basic_formatter_batch_values(seen_values, [1.0, 2.0, 3.0])
  assert_eq(seen_positions, [Some(0), Some(1), Some(2)])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 2)
  verify_basic_formatter_batch_values([locations.get(0), locations.get(1)], [
    7.0, 8.0,
  ])
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 170 live user program reentrant" {
  let values = [10.0, 20.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let holder : Array[FuncFormatter?] = [None]
  let depth = [false]
  let formatter = FuncFormatter::new((value, position) => {
    seen_values.push(value)
    seen_positions.push(position)
    if position == Some(0) && !depth[0] {
      depth[0] = true
      nested.push(holder[0].unwrap().format_ticks([7.0]))
      depth[0] = false
    }
    basic_formatter_batch_position(position)
  })
  holder[0] = Some(formatter)
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  let labels = formatter.format_ticks(values)
  assert_eq(labels.length(), 2)
  assert_eq([labels[0], labels[1]], ["p0", "p1"])
  verify_basic_formatter_batch_values(seen_values, [10.0, 7.0, 20.0])
  assert_eq(seen_positions, [Some(0), Some(0), Some(1)])
  assert_eq(nested, [["p0"]])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 1)
  verify_basic_formatter_batch_values([locations.get(0)], [7.0])
  assert_eq(values.length(), 2)
  verify_basic_formatter_batch_values([values[0], values[1]], [10.0, 20.0])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 171 live user program reentrant_caught" {
  let values = [10.0, 20.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let holder : Array[FuncFormatter?] = [None]
  let depth = [false]
  let formatter = FuncFormatter::new((value, position) => {
    seen_values.push(value)
    seen_positions.push(position)
    if value == 7.0 {
      raise @core.DataError::InvalidTicks(message="inner callback")
    }
    if position == Some(0) && !depth[0] {
      depth[0] = true
      nested.push(holder[0].unwrap().format_ticks([7.0])) catch {
        @core.DataError::InvalidTicks(message~) => caught.push(message)
        error => raise error
      }
      depth[0] = false
    }
    basic_formatter_batch_position(position)
  })
  holder[0] = Some(formatter)
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  let labels = formatter.format_ticks(values)
  assert_eq(labels.length(), 2)
  assert_eq([labels[0], labels[1]], ["p0", "p1"])
  verify_basic_formatter_batch_values(seen_values, [10.0, 7.0, 20.0])
  assert_eq(seen_positions, [Some(0), Some(0), Some(1)])
  assert_eq(nested, [])
  assert_eq(caught, ["inner callback"])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 1)
  verify_basic_formatter_batch_values([locations.get(0)], [7.0])
  assert_eq(values.length(), 2)
  verify_basic_formatter_batch_values([values[0], values[1]], [10.0, 20.0])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 172 live user program reentrant_propagates" {
  let values = [10.0, 20.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let holder : Array[FuncFormatter?] = [None]
  let depth = [false]
  let formatter = FuncFormatter::new((value, position) => {
    seen_values.push(value)
    seen_positions.push(position)
    if value == 7.0 {
      raise @core.DataError::InvalidTicks(message="inner callback")
    }
    if position == Some(0) && !depth[0] {
      depth[0] = true
      nested.push(holder[0].unwrap().format_ticks([7.0]))
      depth[0] = false
    }
    basic_formatter_batch_position(position)
  })
  holder[0] = Some(formatter)
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.format_ticks(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) => message == "inner callback"
      _ => false
    },
  )
  verify_basic_formatter_batch_values(seen_values, [10.0, 7.0])
  assert_eq(seen_positions, [Some(0), Some(0)])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 1)
  verify_basic_formatter_batch_values([locations.get(0)], [7.0])
  assert_eq(values.length(), 2)
  verify_basic_formatter_batch_values([values[0], values[1]], [10.0, 20.0])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 173 live user program rebind" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let holder : Array[FuncFormatter?] = [None]
  let formatter = FuncFormatter::new((value, position) => {
    seen_values.push(value)
    seen_positions.push(position)
    if position == Some(0) {
      holder[0]
      .unwrap()
      .set_func((next_value, next_position) => {
        seen_values.push(next_value)
        seen_positions.push(next_position)
        "replacement"
      })
    }
    "original"
  })
  holder[0] = Some(formatter)
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  let labels = formatter.format_ticks(values)
  assert_eq(labels.length(), 3)
  assert_eq([labels[0], labels[1], labels[2]], [
    "original", "replacement", "replacement",
  ])
  verify_basic_formatter_batch_values(seen_values, [1.0, 2.0, 3.0])
  assert_eq(seen_positions, [Some(0), Some(1), Some(2)])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 3)
  verify_basic_formatter_batch_values(
    [locations.get(0), locations.get(1), locations.get(2)],
    [1.0, 2.0, 3.0],
  )
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 174 live user program offset" {
  let values = [1.0, 2.0, 3.0]
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let holder : Array[FuncFormatter?] = [None]
  let formatter = FuncFormatter::new((value, position) => {
    seen_values.push(value)
    seen_positions.push(position)
    holder[0]
    .unwrap()
    .set_offset_string(basic_formatter_batch_position(position))
    basic_formatter_batch_position(position)
  })
  holder[0] = Some(formatter)
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  let labels = formatter.format_ticks(values)
  assert_eq(labels.length(), 3)
  assert_eq([labels[0], labels[1], labels[2]], ["p0", "p1", "p2"])
  verify_basic_formatter_batch_values(seen_values, [1.0, 2.0, 3.0])
  assert_eq(seen_positions, [Some(0), Some(1), Some(2)])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 3)
  verify_basic_formatter_batch_values(
    [locations.get(0), locations.get(1), locations.get(2)],
    [1.0, 2.0, 3.0],
  )
  assert_eq(values.length(), 3)
  verify_basic_formatter_batch_values([values[0], values[1], values[2]], [
    1.0, 2.0, 3.0,
  ])
  assert_eq(base.get_offset(), "p2")
}

///|
test "Basic formatter batch 175 user mutates future view element through owner" {
  let values = [99.0, 1.0, 99.0, 2.0, 99.0, 3.0]
  let selected = TickValues::from_array(values).view(1, 2, 3)
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FuncFormatter::new((value, position) => {
    seen_values.push(value)
    seen_positions.push(position)
    if position == Some(0) {
      values[3] = 20.0
    }
    basic_formatter_batch_value(value)
  })
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  let labels = formatter.format_ticks_view(selected)
  assert_eq(labels.length(), 3)
  assert_eq([labels[0], labels[1], labels[2]], ["finite", "finite", "finite"])
  verify_basic_formatter_batch_values(seen_values, [1.0, 20.0, 3.0])
  assert_eq(seen_positions, [Some(0), Some(1), Some(2)])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is NdArray(_))
  assert_eq(locations.length(), 3)
  verify_basic_formatter_batch_values(
    [locations.get(0), locations.get(1), locations.get(2)],
    [1.0, 20.0, 3.0],
  )
  assert_eq(values.length(), 6)
  verify_basic_formatter_batch_values(
    [values[0], values[1], values[2], values[3], values[4], values[5]],
    [99.0, 1.0, 99.0, 20.0, 99.0, 3.0],
  )
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 176 user mutates future view element through owner" {
  let values = [99.0, 1.0, 99.0, 2.0, 99.0, 3.0]
  let selected = TickValues::from_array(values).view(5, -2, 3)
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FuncFormatter::new((value, position) => {
    seen_values.push(value)
    seen_positions.push(position)
    if position == Some(0) {
      values[3] = 20.0
    }
    basic_formatter_batch_value(value)
  })
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  let labels = formatter.format_ticks_view(selected)
  assert_eq(labels.length(), 3)
  assert_eq([labels[0], labels[1], labels[2]], ["finite", "finite", "finite"])
  verify_basic_formatter_batch_values(seen_values, [3.0, 20.0, 1.0])
  assert_eq(seen_positions, [Some(0), Some(1), Some(2)])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is NdArray(_))
  assert_eq(locations.length(), 3)
  verify_basic_formatter_batch_values(
    [locations.get(0), locations.get(1), locations.get(2)],
    [3.0, 20.0, 1.0],
  )
  assert_eq(values.length(), 6)
  verify_basic_formatter_batch_values(
    [values[0], values[1], values[2], values[3], values[4], values[5]],
    [99.0, 1.0, 99.0, 20.0, 99.0, 3.0],
  )
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 177 user mutates future view element through owner" {
  let values = [99.0, 1.0, 99.0, 2.0, 99.0, 3.0]
  let selected = TickValues::from_array(values).view(2, 0, 4)
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FuncFormatter::new((value, position) => {
    seen_values.push(value)
    seen_positions.push(position)
    if position == Some(0) {
      values[2] = 20.0
    }
    basic_formatter_batch_value(value)
  })
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  let labels = formatter.format_ticks_view(selected)
  assert_eq(labels.length(), 4)
  assert_eq([labels[0], labels[1], labels[2], labels[3]], [
    "finite", "finite", "finite", "finite",
  ])
  verify_basic_formatter_batch_values(seen_values, [99.0, 20.0, 20.0, 20.0])
  assert_eq(seen_positions, [Some(0), Some(1), Some(2), Some(3)])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is NdArray(_))
  assert_eq(locations.length(), 4)
  verify_basic_formatter_batch_values(
    [locations.get(0), locations.get(1), locations.get(2), locations.get(3)],
    [20.0, 20.0, 20.0, 20.0],
  )
  assert_eq(values.length(), 6)
  verify_basic_formatter_batch_values(
    [values[0], values[1], values[2], values[3], values[4], values[5]],
    [99.0, 1.0, 20.0, 2.0, 99.0, 3.0],
  )
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 178 actual full125001 batch has no locator prefix cap" {
  let values = Array::make(125001, 0.0)
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = NullFormatter::new()
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  let labels = formatter.format_ticks(values)
  assert_eq(labels.length(), 125001)
  assert_eq(
    [
      labels[0],
      labels[1],
      labels[2],
      labels[99999],
      labels[100000],
      labels[125000],
    ],
    ["", "", "", "", "", ""],
  )
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 125001)
  verify_basic_formatter_batch_values(
    [
      locations.get(0),
      locations.get(1),
      locations.get(2),
      locations.get(99999),
      locations.get(100000),
      locations.get(125000),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(values.length(), 125001)
  verify_basic_formatter_batch_values(
    [
      values[0],
      values[1],
      values[2],
      values[99999],
      values[100000],
      values[125000],
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter batch 179 actual full125001 batch has no locator prefix cap" {
  let values = Array::make(125001, 0.0)
  let seen_values : Array[Double] = []
  let seen_positions : Array[Int32?] = []
  let nested : Array[Array[String]] = []
  let caught : Array[String] = []
  let formatter = FixedFormatter::new(["A", "B", "C"])
  let base = formatter.as_base_formatter()
  base.set_locs([91.0, 92.0])
  let labels = formatter.format_ticks(values)
  assert_eq(labels.length(), 125001)
  assert_eq(
    [
      labels[0],
      labels[1],
      labels[2],
      labels[99999],
      labels[100000],
      labels[125000],
    ],
    ["A", "B", "C", "", "", ""],
  )
  verify_basic_formatter_batch_values(seen_values, [])
  assert_eq(seen_positions, [])
  assert_eq(nested, [])
  assert_eq(caught, [])
  let locations = base.locations()
  assert_true(locations is Sequence(_))
  assert_eq(locations.length(), 125001)
  verify_basic_formatter_batch_values(
    [
      locations.get(0),
      locations.get(1),
      locations.get(2),
      locations.get(99999),
      locations.get(100000),
      locations.get(125000),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(values.length(), 125001)
  verify_basic_formatter_batch_values(
    [
      values[0],
      values[1],
      values[2],
      values[99999],
      values[100000],
      values[125000],
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(base.get_offset(), "")
}

///|
test "Basic formatter explicit minus 1" {
  let previous = @config.unicode_minus()
  defer @config.set_unicode_minus(previous)
  @config.set_unicode_minus(false)
  assert_eq(BaseFormatter::fix_minus(""), "")
}

///|
test "Basic formatter explicit minus 2" {
  let previous = @config.unicode_minus()
  defer @config.set_unicode_minus(previous)
  @config.set_unicode_minus(false)
  assert_eq(BaseFormatter::fix_minus("-"), "-")
}

///|
test "Basic formatter explicit minus 3" {
  let previous = @config.unicode_minus()
  defer @config.set_unicode_minus(previous)
  @config.set_unicode_minus(false)
  assert_eq(BaseFormatter::fix_minus("a-b--2−‐"), "a-b--2−‐")
}

///|
test "Basic formatter explicit minus 4" {
  let previous = @config.unicode_minus()
  defer @config.set_unicode_minus(previous)
  @config.set_unicode_minus(false)
  assert_eq(BaseFormatter::fix_minus("$-1$"), "$-1$")
}

///|
test "Basic formatter explicit minus 5" {
  let previous = @config.unicode_minus()
  defer @config.set_unicode_minus(previous)
  @config.set_unicode_minus(false)
  assert_eq(BaseFormatter::fix_minus("plain"), "plain")
}

///|
test "Basic formatter explicit minus 6" {
  let previous = @config.unicode_minus()
  defer @config.set_unicode_minus(previous)
  @config.set_unicode_minus(false)
  assert_eq(BaseFormatter::fix_minus("−"), "−")
}

///|
test "Basic formatter explicit minus 7" {
  let previous = @config.unicode_minus()
  defer @config.set_unicode_minus(previous)
  @config.set_unicode_minus(true)
  assert_eq(BaseFormatter::fix_minus(""), "")
}

///|
test "Basic formatter explicit minus 8" {
  let previous = @config.unicode_minus()
  defer @config.set_unicode_minus(previous)
  @config.set_unicode_minus(true)
  assert_eq(BaseFormatter::fix_minus("-"), "−")
}

///|
test "Basic formatter explicit minus 9" {
  let previous = @config.unicode_minus()
  defer @config.set_unicode_minus(previous)
  @config.set_unicode_minus(true)
  assert_eq(BaseFormatter::fix_minus("a-b--2−‐"), "a−b−−2−‐")
}

///|
test "Basic formatter explicit minus 10" {
  let previous = @config.unicode_minus()
  defer @config.set_unicode_minus(previous)
  @config.set_unicode_minus(true)
  assert_eq(BaseFormatter::fix_minus("$-1$"), "$−1$")
}

///|
test "Basic formatter explicit minus 11" {
  let previous = @config.unicode_minus()
  defer @config.set_unicode_minus(previous)
  @config.set_unicode_minus(true)
  assert_eq(BaseFormatter::fix_minus("plain"), "plain")
}

///|
test "Basic formatter explicit minus 12" {
  let previous = @config.unicode_minus()
  defer @config.set_unicode_minus(previous)
  @config.set_unicode_minus(true)
  assert_eq(BaseFormatter::fix_minus("−"), "−")
}
