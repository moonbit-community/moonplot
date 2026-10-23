///|
test "integer location batches preserve Python repr type and arbitrary precision decimal formatting" {
  let value = decimal_power(30)
  let formatter = StrMethodFormatter::new("{x:d}/{x!r}/{x.__class__.__name__}").as_base_formatter()
  assert_eq(formatter.format_ticks_integers([value]), [
    "1000000000000000000000000000000/1000000000000000000000000000000/int",
  ])
  assert_eq(formatter.locations().dtype(), None)
  assert_eq(formatter.locations().get_value(0), ScalarNumber::Integer(value))
}

///|
test "null fixed and abstract formatters do not convert unused huge integer inputs" {
  let values = [decimal_power(400)]
  assert_eq(
    NullFormatter::new().as_base_formatter().format_ticks_integers(values),
    [""],
  )
  assert_eq(
    FixedFormatter::new(["a"]).as_base_formatter().format_ticks_integers(values),
    ["a"],
  )
  try BaseFormatter::new().format_ticks_integers(values) catch {
    @core.DataError::InvalidTicks(message="Derived must override") => ()
    _ =>
      fail("expected the abstract formatter error before floating conversion")
  } noraise {
    _ => fail("expected the abstract formatter error")
  }
}

///|
test "integer list formatting enforces the Python decimal limit only at the selected field" {
  let values = [decimal_power(4300)]
  for format in ["{x!r}", "{x!s}", "{x}", "{x:d}", "{x:n}"] {
    try
      StrMethodFormatter::new(format)
      .as_base_formatter()
      .format_ticks_integers(values)
    catch {
      @core.DataError::InvalidTicks(message~) =>
        assert_eq(
          message, "ValueError: Exceeds the limit (4300 digits) for integer string conversion; use sys.set_int_max_str_digits() to increase the limit",
        )
      _ => fail("expected the decimal conversion limit")
    } noraise {
      _ => fail("expected the decimal conversion limit")
    }
  }
  assert_eq(
    StrMethodFormatter::new("{pos:d}")
    .as_base_formatter()
    .format_ticks_integers(values),
    ["0"],
  )
  let hexadecimal = StrMethodFormatter::new("{x:x}")
    .as_base_formatter()
    .format_ticks_integers(values)
  assert_true(hexadecimal[0].length() > 3500)
}

///|
test "integer function batches retain the mutable list through callback enumeration" {
  let values = [@bigint.BigInt::from_int(1), @bigint.BigInt::from_int(2)]
  let seen : Array[Double] = []
  let formatter = FuncFormatter::new((value, position) => {
    seen.push(value)
    if position == Some(0) {
      values[1] = @bigint.BigInt::from_int(20)
      values.push(@bigint.BigInt::from_int(30))
    }
    ""
  }).as_base_formatter()
  assert_eq(formatter.format_ticks_integers(values), ["", "", ""])
  assert_eq(seen, [1.0, 20.0, 30.0])
  assert_eq(formatter.locations().length(), 3)
}
