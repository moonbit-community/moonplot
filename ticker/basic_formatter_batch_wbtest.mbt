///|
test "named Func formatter passes NaN payload and signed Double bits unchanged" {
  let payload = 0x7ff8000000000123UL.reinterpret_as_double()
  let values = [payload, -0.0, 1.0 / 0.0, -1.0 / 0.0]
  let seen : Array[UInt64] = []
  let positions : Array[Int32?] = []
  let formatter = FuncFormatter::new((value, position) => {
    seen.push(value.reinterpret_as_uint64())
    positions.push(position)
    ""
  })
  assert_eq(formatter.format_data(payload), "")
  assert_eq(formatter.format_ticks(values), ["", "", "", ""])
  assert_eq(seen, [
    0x7ff8000000000123UL, 0x7ff8000000000123UL, 0x8000000000000000UL, 0x7ff0000000000000UL,
    0xfff0000000000000UL,
  ])
  assert_eq(positions, [None, Some(0), Some(1), Some(2), Some(3)])
}

///|
test "named formatter batch preserves the original callback Core error variant" {
  let seen : Array[Double] = []
  let formatter = FuncFormatter::new((value, position) => {
    seen.push(value)
    if position == Some(1) {
      raise @core.DataError::LengthMismatch(expected=7, actual=9)
    }
    "ok"
  })
  let values = [10.0, 20.0, 30.0]
  assert_true(
    try {
      ignore(formatter.format_ticks(values))
      false
    } catch {
      @core.DataError::LengthMismatch(expected=7, actual=9) => true
      _ => false
    },
  )
  assert_eq(seen, [10.0, 20.0])
  values[1] = 99.0
  assert_eq(formatter.locations().get(1), 99.0)
}

///|
test "named batch reads a newly installed raising callback at its next index" {
  let holder : Array[FuncFormatter?] = [None]
  let events : Array[String] = []
  let formatter = FuncFormatter::new((_, _) => {
    events.push("original")
    holder[0]
    .unwrap()
    .set_func((_, _) => {
      events.push("replacement")
      raise @core.DataError::InvalidReference(message="replacement callback")
    })
    "first"
  })
  holder[0] = Some(formatter)
  assert_true(
    try {
      ignore(formatter.format_ticks([1.0, 2.0, 3.0]))
      false
    } catch {
      @core.DataError::InvalidReference(message="replacement callback") => true
      _ => false
    },
  )
  assert_eq(events, ["original", "replacement"])
}

///|
test "named view batches retain Int64 storage while converting callback values" {
  let owner = [1L, 100L, 2L, 100L, 3L]
  let view = TickValues::from_int64_array(owner).view(0, 2, 3)
  let seen : Array[Double] = []
  let formatter = FuncFormatter::new((value, position) => {
    seen.push(value)
    if position == Some(0) {
      owner[2] = 20L
    }
    ""
  })
  assert_eq(formatter.format_ticks_view(view), ["", "", ""])
  assert_eq(seen, [1.0, 20.0, 3.0])
  match formatter.locations() {
    NdArray(retained) => {
      assert_true(retained.is_int64())
      assert_eq(retained.get_int64(1), 20L)
    }
    Sequence(_) | Integers(_) | Typed(_) =>
      fail("a numeric view must retain its storage")
  }
}
