///|
test "named percentage base adapters keep live raw slots and independent copied slots" {
  let formatter = @ticker.PercentFormatter::new()
  let base = formatter.as_base_formatter()
  let retained = base.percent_formatter().unwrap()
  assert_true(physical_equal(base, retained.as_base_formatter()))
  retained.set_xmax(@ticker.PercentXMax::NumpyInt64(9007199254740993L))
  retained.set_decimals(@ticker.PercentDecimals::Text("2"))
  retained.set_symbol(None)
  retained.set_is_latex(true)
  assert_eq(
    formatter.xmax(),
    @ticker.PercentXMax::NumpyInt64(9007199254740993L),
  )
  assert_eq(formatter.decimals(), @ticker.PercentDecimals::Text("2"))
  assert_eq(formatter.raw_symbol(), None)
  assert_true(formatter.is_latex())
  let copied = base.copy().percent_formatter().unwrap()
  copied.set_xmax(@ticker.PercentXMax::Boolean(false))
  copied.set_decimals(@ticker.PercentDecimals::Automatic)
  copied.set_symbol(Some("new"))
  copied.set_is_latex(false)
  assert_eq(
    formatter.xmax(),
    @ticker.PercentXMax::NumpyInt64(9007199254740993L),
  )
  assert_eq(formatter.decimals(), @ticker.PercentDecimals::Text("2"))
  assert_eq(formatter.raw_symbol(), None)
  assert_true(formatter.is_latex())
  assert_true(!physical_equal(base, copied.as_base_formatter()))
  assert_eq(base.get_offset(), "")
  assert_eq(copied.get_offset(), "")
}

///|
test "named percentage copies share live axis views while precision remains independent" {
  let extent = [100.0]
  let axis = @ticker.FormatterAxisBinding::new()
  axis.bind_view_interval(() => {
    @ticker.FormatterViewInterval::Sequence([0.0, extent[0]])
  })
  let formatter = @ticker.PercentFormatter::new()
  formatter.set_axis(Some(axis))
  let copied = formatter.copy()
  assert_eq(formatter.call(1.25), "1%")
  extent[0] = 1.0
  assert_eq(formatter.call(1.25), "1.25%")
  assert_eq(copied.call(1.25), "1.25%")
  copied.set_decimals(
    @ticker.PercentDecimals::Integer(@bigint.BigInt::from_int(3)),
  )
  assert_eq(copied.call(1.25), "1.250%")
  assert_eq(formatter.call(1.25), "1.25%")
  formatter.set_axis(None)
  assert_eq(copied.axis(), Some(axis))
  assert_eq(copied.call(1.25), "1.250%")
}

///|
test "named percentage fixes minus after appending the dynamically escaped symbol" {
  let previous_tex = @config.text_usetex()
  let previous_minus = @config.unicode_minus()
  defer @config.set_text_usetex(previous_tex)
  defer @config.set_unicode_minus(previous_minus)
  @config.set_text_usetex(true)
  @config.set_unicode_minus(true)
  let formatter = @ticker.PercentFormatter::new(
    decimals=@ticker.PercentDecimals::Integer(@bigint.BigInt::from_int(0)),
    symbol=Some("-%"),
  )
  formatter.create_dummy_axis()
  assert_eq(formatter.format_pct(-1.0, 100.0), "-1-\\%")
  assert_eq(formatter.call(-1.0), "−1−\\%")
  @config.set_unicode_minus(false)
  assert_eq(formatter.call(-1.0), "-1-\\%")
  formatter.set_is_latex(true)
  assert_eq(formatter.symbol(), "-%")
  formatter.set_symbol(None)
  assert_eq(formatter.raw_symbol(), None)
  assert_eq(formatter.symbol(), "")
}

///|
test "named percentage retains deferred source errors separately from old pure factories" {
  assert_true(
    try {
      ignore(@ticker.percent_formatter(xmax=0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  let formatter = @ticker.PercentFormatter::new(
    xmax=@ticker.PercentXMax::Number(0.0),
  )
  assert_eq(formatter.xmax(), @ticker.PercentXMax::Number(0.0))
  assert_eq(formatter.format_ticks([]), [])
  let error = try {
    ignore(formatter.convert_to_pct(1.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "ZeroDivisionError: float division by zero")
  formatter.set_xmax(@ticker.PercentXMax::Number(1.0e308))
  formatter.set_decimals(
    @ticker.PercentDecimals::Integer(@bigint.BigInt::from_int(0)),
  )
  assert_eq(formatter.format_pct(1.0e308, 100.0), "100%")
}
