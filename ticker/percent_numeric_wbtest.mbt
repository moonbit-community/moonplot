///|
test "Percent fixed precision preflights the numeric body before a giant allocation" {
  let state : PercentFormatterState = {
    xmax: PercentXMax::Number(100.0),
    decimals: PercentDecimals::Integer(@bigint.BigInt::from_int(2147483647)),
    symbol: Some("%"),
    is_latex: false,
  }
  assert_true(
    try {
      ignore(percent_format_pct(state, PythonFloat(0.0), PythonFloat(1.0)))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message.has_prefix("ResourceError:")
      _ => false
    },
  )
}

///|
test "Percent reserves the actual UTF16 symbol length before fixed precision allocation" {
  let state : PercentFormatterState = {
    xmax: PercentXMax::Number(100.0),
    decimals: PercentDecimals::Integer(@bigint.BigInt::from_int(2147483645)),
    symbol: Some("😀"),
    is_latex: true,
  }
  assert_true(
    try {
      ignore(percent_format_pct(state, PythonFloat(0.0), PythonFloat(1.0)))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message.has_prefix("ResourceError:")
      _ => false
    },
  )
}

///|
test "Percent reserves TeX escaped symbol growth before fixed precision allocation" {
  let previous = @config.text_usetex()
  defer @config.set_text_usetex(previous)
  @config.set_text_usetex(true)
  let state : PercentFormatterState = {
    xmax: PercentXMax::Number(100.0),
    decimals: PercentDecimals::Integer(@bigint.BigInt::from_int(2147483644)),
    symbol: Some("%"),
    is_latex: false,
  }
  assert_true(
    try {
      ignore(percent_format_pct(state, PythonFloat(0.0), PythonFloat(1.0)))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message.has_prefix("ResourceError:")
      _ => false
    },
  )
}
