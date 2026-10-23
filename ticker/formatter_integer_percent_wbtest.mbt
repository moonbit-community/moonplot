///|
test "Percent integer batch divides raw huge integers before floating conversion" {
  let previous_tex = @config.text_usetex()
  defer @config.set_text_usetex(previous_tex)
  @config.set_text_usetex(false)
  let formatter = PercentFormatter::new(
    decimals=PercentDecimals::Integer(@bigint.BigInt::from_int(0)),
  )
  formatter.create_dummy_axis()
  let huge = decimal_power(400)
  formatter.set_xmax(PercentXMax::Integer(huge))
  assert_eq(formatter.base.format_ticks_integers([huge]), ["100%"])
}

///|
test "Percent integer batch preserves integer zero division for raw integer and bool maxima" {
  let formatter = PercentFormatter::new(
    decimals=PercentDecimals::Integer(@bigint.BigInt::from_int(0)),
  )
  formatter.create_dummy_axis()
  for
    xmax in [
      PercentXMax::Integer(@bigint.BigInt::from_int(0)),
      PercentXMax::Boolean(false),
    ] {
    formatter.set_xmax(xmax)
    assert_true(
      try {
        ignore(
          formatter.base.format_ticks_integers([@bigint.BigInt::from_int(1)]),
        )
        false
      } catch {
        @core.DataError::InvalidTicks(message~) =>
          message == "ZeroDivisionError: division by zero"
        _ => false
      },
    )
  }
}

///|
test "Percent huge integer batch converts before floating zero division" {
  let formatter = PercentFormatter::new(
    decimals=PercentDecimals::Integer(@bigint.BigInt::from_int(0)),
  )
  formatter.create_dummy_axis()
  formatter.set_xmax(PercentXMax::Number(0.0))
  assert_true(
    try {
      ignore(formatter.base.format_ticks_integers([decimal_power(400)]))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "OverflowError: int too large to convert to float"
      _ => false
    },
  )
}
