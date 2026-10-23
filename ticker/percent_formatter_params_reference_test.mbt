// Complete pinned PercentFormatter object/state methods, with actual descriptor dependencies.

///|
fn verify_percent_params_double(
  actual : Double,
  expected : Double,
) -> Unit raise {
  if expected.is_nan() {
    assert_true(actual.is_nan())
  } else {
    assert_eq(actual.reinterpret_as_uint64(), expected.reinterpret_as_uint64())
  }
}

///|
fn verify_percent_params_xmax(
  actual : @ticker.PercentXMax,
  expected : @ticker.PercentXMax,
) -> Unit raise {
  match (actual, expected) {
    (@ticker.PercentXMax::Number(left), @ticker.PercentXMax::Number(right))
    | (
      @ticker.PercentXMax::NumpyFloat64(left),
      @ticker.PercentXMax::NumpyFloat64(right),
    ) => verify_percent_params_double(left, right)
    _ => assert_eq(actual, expected)
  }
}

///|
fn verify_percent_params_decimals(
  actual : @ticker.PercentDecimals,
  expected : @ticker.PercentDecimals,
) -> Unit raise {
  match (actual, expected) {
    (
      @ticker.PercentDecimals::Number(left),
      @ticker.PercentDecimals::Number(right),
    ) => verify_percent_params_double(left, right)
    _ => assert_eq(actual, expected)
  }
}

///|
fn verify_percent_params_locations(
  actual : @ticker.FormatterLocations,
  expected : Array[Double],
) -> Unit raise {
  assert_eq(actual.length(), expected.length())
  for index, value in expected {
    verify_percent_params_double(actual.get(index), value)
  }
}

///|
test "percent params original defaults" {
  let formatter = @ticker.PercentFormatter::new()
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::Number(100.0),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Automatic,
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
  assert_true(formatter.axis() is None)
  assert_eq(formatter.locations().length(), 0)
  let base = formatter.as_base_formatter()
  assert_true(base.percent_formatter() is Some(_))
  assert_true(base.null_formatter() is None)
  assert_true(base.fixed_formatter() is None)
  assert_true(base.func_formatter() is None)
  assert_true(base.format_str_formatter() is None)
  assert_true(base.str_method_formatter() is None)
}

///|
test "percent params original xmax constructor 0" {
  let formatter = @ticker.PercentFormatter::new(
    xmax=@ticker.PercentXMax::Number(100.0),
  )
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::Number(100.0),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Automatic,
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
}

///|
test "percent params original xmax constructor 1" {
  let formatter = @ticker.PercentFormatter::new(
    xmax=@ticker.PercentXMax::Number(-0.0),
  )
  verify_percent_params_xmax(formatter.xmax(), @ticker.PercentXMax::Number(0.0))
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Automatic,
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
}

///|
test "percent params original xmax constructor 2" {
  let formatter = @ticker.PercentFormatter::new(
    xmax=@ticker.PercentXMax::Number(0.0),
  )
  verify_percent_params_xmax(formatter.xmax(), @ticker.PercentXMax::Number(0.0))
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Automatic,
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
}

///|
test "percent params original xmax constructor 3" {
  let formatter = @ticker.PercentFormatter::new(
    xmax=@ticker.PercentXMax::Number(-1.0),
  )
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::Number(-1.0),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Automatic,
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
}

///|
test "percent params original xmax constructor 4" {
  let formatter = @ticker.PercentFormatter::new(
    xmax=@ticker.PercentXMax::Number(0.0 / 0.0),
  )
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::Number(0.0 / 0.0),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Automatic,
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
}

///|
test "percent params original xmax constructor 5" {
  let formatter = @ticker.PercentFormatter::new(
    xmax=@ticker.PercentXMax::Number(1.0 / 0.0),
  )
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::Number(1.0 / 0.0),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Automatic,
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
}

///|
test "percent params original xmax constructor 6" {
  let formatter = @ticker.PercentFormatter::new(
    xmax=@ticker.PercentXMax::Number(-1.0 / 0.0),
  )
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::Number(-1.0 / 0.0),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Automatic,
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
}

///|
test "percent params original xmax constructor 7" {
  let formatter = @ticker.PercentFormatter::new(
    xmax=@ticker.PercentXMax::Number(5.0e-324),
  )
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::Number(5.0e-324),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Automatic,
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
}

///|
test "percent params original xmax constructor 8" {
  let formatter = @ticker.PercentFormatter::new(
    xmax=@ticker.PercentXMax::Number(1.7976931348623157e+308),
  )
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::Number(1.7976931348623157e+308),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Automatic,
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
}

///|
test "percent params original xmax constructor 9" {
  let formatter = @ticker.PercentFormatter::new(
    xmax=@ticker.PercentXMax::Integer(
      @bigint.BigInt::from_string("1267650600228229401496703205376"),
    ),
  )
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::Number(1.2676506002282294e+30),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Automatic,
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
}

///|
test "percent params original xmax constructor 10" {
  let formatter = @ticker.PercentFormatter::new(
    xmax=@ticker.PercentXMax::Integer(
      @bigint.BigInt::from_string("-1267650600228229401496703205376"),
    ),
  )
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::Number(-1.2676506002282294e+30),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Automatic,
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
}

///|
test "percent params original xmax constructor 11" {
  let formatter = @ticker.PercentFormatter::new(
    xmax=@ticker.PercentXMax::Boolean(false),
  )
  verify_percent_params_xmax(formatter.xmax(), @ticker.PercentXMax::Number(0.0))
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Automatic,
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
}

///|
test "percent params original xmax constructor 12" {
  let formatter = @ticker.PercentFormatter::new(
    xmax=@ticker.PercentXMax::Boolean(true),
  )
  verify_percent_params_xmax(formatter.xmax(), @ticker.PercentXMax::Number(1.0))
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Automatic,
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
}

///|
test "percent params original xmax constructor 13" {
  let formatter = @ticker.PercentFormatter::new(
    xmax=@ticker.PercentXMax::NumpyFloat64(-0.0),
  )
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::NumpyFloat64(0.0),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Automatic,
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
}

///|
test "percent params original xmax constructor 14" {
  let formatter = @ticker.PercentFormatter::new(
    xmax=@ticker.PercentXMax::NumpyFloat64(0.0 / 0.0),
  )
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::NumpyFloat64(0.0 / 0.0),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Automatic,
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
}

///|
test "percent params original xmax constructor 15" {
  let formatter = @ticker.PercentFormatter::new(
    xmax=@ticker.PercentXMax::NumpyFloat64(1.0 / 0.0),
  )
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::NumpyFloat64(1.0 / 0.0),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Automatic,
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
}

///|
test "percent params original xmax constructor 16" {
  let formatter = @ticker.PercentFormatter::new(
    xmax=@ticker.PercentXMax::NumpyFloat64(1.25),
  )
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::NumpyFloat64(1.25),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Automatic,
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
}

///|
test "percent params original xmax constructor 17" {
  let formatter = @ticker.PercentFormatter::new(
    xmax=@ticker.PercentXMax::NumpyInt64(-9223372036854775808L),
  )
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::NumpyFloat64(-9.223372036854776e+18),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Automatic,
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
}

///|
test "percent params original xmax constructor 18" {
  let formatter = @ticker.PercentFormatter::new(
    xmax=@ticker.PercentXMax::NumpyInt64(9223372036854775807L),
  )
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::NumpyFloat64(9.223372036854776e+18),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Automatic,
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
}

///|
test "percent params original xmax constructor 19" {
  let formatter = @ticker.PercentFormatter::new(
    xmax=@ticker.PercentXMax::NumpyInt64(0L),
  )
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::NumpyFloat64(0.0),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Automatic,
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
}

///|
test "percent params original xmax constructor 20" {
  let error = try {
    ignore(
      @ticker.PercentFormatter::new(
        xmax=@ticker.PercentXMax::Integer(
          @bigint.BigInt::from_string(
            "114813069527425452423283320117768198402231770208869520047764273682576626139237031385665948631650626991844596463898746277344711896086305533142593135616665318539129989145312280000688779148240044871428926990063486244781615463646388363947317026040466353970904996558162398808944629605623311649536164221970332681344168908984458505602379484807914058900934776500429002716706625830522008132236281291761267883317206598995396418127021779858404042159853183251540889433902091920554957783589672039160081957216630582755380425583726015528348786419432054508915275783882625175435528800822842770817965453762184851149029376",
          ),
        ),
      ),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "OverflowError: int too large to convert to float")
}

///|
test "percent params original raw xmax slot 0" {
  let formatter = @ticker.PercentFormatter::new()
  let shallow = formatter.copy()
  formatter.set_xmax(@ticker.PercentXMax::Number(-0.0))
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::Number(-0.0),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Automatic,
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
  verify_percent_params_xmax(shallow.xmax(), @ticker.PercentXMax::Number(100.0))
  verify_percent_params_decimals(
    shallow.decimals(),
    @ticker.PercentDecimals::Automatic,
  )
  assert_eq(shallow.raw_symbol(), Some("%"))
  assert_eq(shallow.is_latex(), false)
  assert_eq(shallow.get_offset(), "")
}

///|
test "percent params original raw xmax slot 1" {
  let formatter = @ticker.PercentFormatter::new()
  let shallow = formatter.copy()
  formatter.set_xmax(@ticker.PercentXMax::Number(0.0 / 0.0))
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::Number(0.0 / 0.0),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Automatic,
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
  verify_percent_params_xmax(shallow.xmax(), @ticker.PercentXMax::Number(100.0))
  verify_percent_params_decimals(
    shallow.decimals(),
    @ticker.PercentDecimals::Automatic,
  )
  assert_eq(shallow.raw_symbol(), Some("%"))
  assert_eq(shallow.is_latex(), false)
  assert_eq(shallow.get_offset(), "")
}

///|
test "percent params original raw xmax slot 2" {
  let formatter = @ticker.PercentFormatter::new()
  let shallow = formatter.copy()
  formatter.set_xmax(@ticker.PercentXMax::Number(1.0 / 0.0))
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::Number(1.0 / 0.0),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Automatic,
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
  verify_percent_params_xmax(shallow.xmax(), @ticker.PercentXMax::Number(100.0))
  verify_percent_params_decimals(
    shallow.decimals(),
    @ticker.PercentDecimals::Automatic,
  )
  assert_eq(shallow.raw_symbol(), Some("%"))
  assert_eq(shallow.is_latex(), false)
  assert_eq(shallow.get_offset(), "")
}

///|
test "percent params original raw xmax slot 3" {
  let formatter = @ticker.PercentFormatter::new()
  let shallow = formatter.copy()
  formatter.set_xmax(@ticker.PercentXMax::Number(-1.0 / 0.0))
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::Number(-1.0 / 0.0),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Automatic,
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
  verify_percent_params_xmax(shallow.xmax(), @ticker.PercentXMax::Number(100.0))
  verify_percent_params_decimals(
    shallow.decimals(),
    @ticker.PercentDecimals::Automatic,
  )
  assert_eq(shallow.raw_symbol(), Some("%"))
  assert_eq(shallow.is_latex(), false)
  assert_eq(shallow.get_offset(), "")
}

///|
test "percent params original raw xmax slot 4" {
  let formatter = @ticker.PercentFormatter::new()
  let shallow = formatter.copy()
  formatter.set_xmax(
    @ticker.PercentXMax::Integer(
      @bigint.BigInt::from_string("-1267650600228229401496703205376"),
    ),
  )
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::Integer(
      @bigint.BigInt::from_string("-1267650600228229401496703205376"),
    ),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Automatic,
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
  verify_percent_params_xmax(shallow.xmax(), @ticker.PercentXMax::Number(100.0))
  verify_percent_params_decimals(
    shallow.decimals(),
    @ticker.PercentDecimals::Automatic,
  )
  assert_eq(shallow.raw_symbol(), Some("%"))
  assert_eq(shallow.is_latex(), false)
  assert_eq(shallow.get_offset(), "")
}

///|
test "percent params original raw xmax slot 5" {
  let formatter = @ticker.PercentFormatter::new()
  let shallow = formatter.copy()
  formatter.set_xmax(
    @ticker.PercentXMax::Integer(
      @bigint.BigInt::from_string(
        "114813069527425452423283320117768198402231770208869520047764273682576626139237031385665948631650626991844596463898746277344711896086305533142593135616665318539129989145312280000688779148240044871428926990063486244781615463646388363947317026040466353970904996558162398808944629605623311649536164221970332681344168908984458505602379484807914058900934776500429002716706625830522008132236281291761267883317206598995396418127021779858404042159853183251540889433902091920554957783589672039160081957216630582755380425583726015528348786419432054508915275783882625175435528800822842770817965453762184851149029376",
      ),
    ),
  )
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::Integer(
      @bigint.BigInt::from_string(
        "114813069527425452423283320117768198402231770208869520047764273682576626139237031385665948631650626991844596463898746277344711896086305533142593135616665318539129989145312280000688779148240044871428926990063486244781615463646388363947317026040466353970904996558162398808944629605623311649536164221970332681344168908984458505602379484807914058900934776500429002716706625830522008132236281291761267883317206598995396418127021779858404042159853183251540889433902091920554957783589672039160081957216630582755380425583726015528348786419432054508915275783882625175435528800822842770817965453762184851149029376",
      ),
    ),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Automatic,
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
  verify_percent_params_xmax(shallow.xmax(), @ticker.PercentXMax::Number(100.0))
  verify_percent_params_decimals(
    shallow.decimals(),
    @ticker.PercentDecimals::Automatic,
  )
  assert_eq(shallow.raw_symbol(), Some("%"))
  assert_eq(shallow.is_latex(), false)
  assert_eq(shallow.get_offset(), "")
}

///|
test "percent params original raw xmax slot 6" {
  let formatter = @ticker.PercentFormatter::new()
  let shallow = formatter.copy()
  formatter.set_xmax(@ticker.PercentXMax::Boolean(false))
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::Boolean(false),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Automatic,
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
  verify_percent_params_xmax(shallow.xmax(), @ticker.PercentXMax::Number(100.0))
  verify_percent_params_decimals(
    shallow.decimals(),
    @ticker.PercentDecimals::Automatic,
  )
  assert_eq(shallow.raw_symbol(), Some("%"))
  assert_eq(shallow.is_latex(), false)
  assert_eq(shallow.get_offset(), "")
}

///|
test "percent params original raw xmax slot 7" {
  let formatter = @ticker.PercentFormatter::new()
  let shallow = formatter.copy()
  formatter.set_xmax(@ticker.PercentXMax::Boolean(true))
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::Boolean(true),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Automatic,
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
  verify_percent_params_xmax(shallow.xmax(), @ticker.PercentXMax::Number(100.0))
  verify_percent_params_decimals(
    shallow.decimals(),
    @ticker.PercentDecimals::Automatic,
  )
  assert_eq(shallow.raw_symbol(), Some("%"))
  assert_eq(shallow.is_latex(), false)
  assert_eq(shallow.get_offset(), "")
}

///|
test "percent params original raw xmax slot 8" {
  let formatter = @ticker.PercentFormatter::new()
  let shallow = formatter.copy()
  formatter.set_xmax(@ticker.PercentXMax::NumpyFloat64(-0.0))
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::NumpyFloat64(-0.0),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Automatic,
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
  verify_percent_params_xmax(shallow.xmax(), @ticker.PercentXMax::Number(100.0))
  verify_percent_params_decimals(
    shallow.decimals(),
    @ticker.PercentDecimals::Automatic,
  )
  assert_eq(shallow.raw_symbol(), Some("%"))
  assert_eq(shallow.is_latex(), false)
  assert_eq(shallow.get_offset(), "")
}

///|
test "percent params original raw xmax slot 9" {
  let formatter = @ticker.PercentFormatter::new()
  let shallow = formatter.copy()
  formatter.set_xmax(@ticker.PercentXMax::NumpyFloat64(0.0))
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::NumpyFloat64(0.0),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Automatic,
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
  verify_percent_params_xmax(shallow.xmax(), @ticker.PercentXMax::Number(100.0))
  verify_percent_params_decimals(
    shallow.decimals(),
    @ticker.PercentDecimals::Automatic,
  )
  assert_eq(shallow.raw_symbol(), Some("%"))
  assert_eq(shallow.is_latex(), false)
  assert_eq(shallow.get_offset(), "")
}

///|
test "percent params original raw xmax slot 10" {
  let formatter = @ticker.PercentFormatter::new()
  let shallow = formatter.copy()
  formatter.set_xmax(@ticker.PercentXMax::NumpyInt64(-9223372036854775808L))
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::NumpyInt64(-9223372036854775808L),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Automatic,
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
  verify_percent_params_xmax(shallow.xmax(), @ticker.PercentXMax::Number(100.0))
  verify_percent_params_decimals(
    shallow.decimals(),
    @ticker.PercentDecimals::Automatic,
  )
  assert_eq(shallow.raw_symbol(), Some("%"))
  assert_eq(shallow.is_latex(), false)
  assert_eq(shallow.get_offset(), "")
}

///|
test "percent params original raw xmax slot 11" {
  let formatter = @ticker.PercentFormatter::new()
  let shallow = formatter.copy()
  formatter.set_xmax(@ticker.PercentXMax::NumpyInt64(9223372036854775807L))
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::NumpyInt64(9223372036854775807L),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Automatic,
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
  verify_percent_params_xmax(shallow.xmax(), @ticker.PercentXMax::Number(100.0))
  verify_percent_params_decimals(
    shallow.decimals(),
    @ticker.PercentDecimals::Automatic,
  )
  assert_eq(shallow.raw_symbol(), Some("%"))
  assert_eq(shallow.is_latex(), false)
  assert_eq(shallow.get_offset(), "")
}

///|
test "percent params original deferred decimals 0" {
  let formatter = @ticker.PercentFormatter::new(
    decimals=@ticker.PercentDecimals::Automatic,
  )
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::Number(100.0),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Automatic,
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
  assert_eq(formatter.format_pct(1.25, 100.0), "1%")
  formatter.set_decimals(@ticker.PercentDecimals::Automatic)
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::Number(100.0),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Automatic,
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
  assert_eq(formatter.format_pct(1.25, 100.0), "1%")
}

///|
test "percent params original deferred decimals 1" {
  let formatter = @ticker.PercentFormatter::new(
    decimals=@ticker.PercentDecimals::Number(0.0),
  )
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::Number(100.0),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Number(0.0),
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
  assert_eq(formatter.format_pct(1.25, 0.0 / 0.0), "1%")
  formatter.set_decimals(@ticker.PercentDecimals::Automatic)
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::Number(100.0),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Automatic,
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
  assert_eq(formatter.format_pct(1.25, 100.0), "1%")
}

///|
test "percent params original deferred decimals 2" {
  let formatter = @ticker.PercentFormatter::new(
    decimals=@ticker.PercentDecimals::Number(-0.0),
  )
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::Number(100.0),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Number(-0.0),
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
  assert_eq(formatter.format_pct(1.25, 0.0 / 0.0), "1%")
  formatter.set_decimals(@ticker.PercentDecimals::Automatic)
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::Number(100.0),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Automatic,
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
  assert_eq(formatter.format_pct(1.25, 100.0), "1%")
}

///|
test "percent params original deferred decimals 3" {
  let formatter = @ticker.PercentFormatter::new(
    decimals=@ticker.PercentDecimals::Number(2.9),
  )
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::Number(100.0),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Number(2.9),
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
  assert_eq(formatter.format_pct(1.25, 0.0 / 0.0), "1.25%")
  formatter.set_decimals(@ticker.PercentDecimals::Automatic)
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::Number(100.0),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Automatic,
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
  assert_eq(formatter.format_pct(1.25, 100.0), "1%")
}

///|
test "percent params original deferred decimals 4" {
  let formatter = @ticker.PercentFormatter::new(
    decimals=@ticker.PercentDecimals::Number(-0.9),
  )
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::Number(100.0),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Number(-0.9),
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
  assert_eq(formatter.format_pct(1.25, 0.0 / 0.0), "1%")
  formatter.set_decimals(@ticker.PercentDecimals::Automatic)
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::Number(100.0),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Automatic,
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
  assert_eq(formatter.format_pct(1.25, 100.0), "1%")
}

///|
test "percent params original deferred decimals 5" {
  let formatter = @ticker.PercentFormatter::new(
    decimals=@ticker.PercentDecimals::Number(-1.9),
  )
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::Number(100.0),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Number(-1.9),
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
  let error = try {
    ignore(formatter.format_pct(1.25, 0.0 / 0.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "ValueError: Format specifier missing precision")
  formatter.set_decimals(@ticker.PercentDecimals::Automatic)
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::Number(100.0),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Automatic,
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
  assert_eq(formatter.format_pct(1.25, 100.0), "1%")
}

///|
test "percent params original deferred decimals 6" {
  let formatter = @ticker.PercentFormatter::new(
    decimals=@ticker.PercentDecimals::Number(0.0 / 0.0),
  )
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::Number(100.0),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Number(0.0 / 0.0),
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
  let error = try {
    ignore(formatter.format_pct(1.25, 0.0 / 0.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "ValueError: cannot convert float NaN to integer")
  formatter.set_decimals(@ticker.PercentDecimals::Automatic)
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::Number(100.0),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Automatic,
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
  assert_eq(formatter.format_pct(1.25, 100.0), "1%")
}

///|
test "percent params original deferred decimals 7" {
  let formatter = @ticker.PercentFormatter::new(
    decimals=@ticker.PercentDecimals::Number(1.0 / 0.0),
  )
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::Number(100.0),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Number(1.0 / 0.0),
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
  let error = try {
    ignore(formatter.format_pct(1.25, 0.0 / 0.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "OverflowError: cannot convert float infinity to integer")
  formatter.set_decimals(@ticker.PercentDecimals::Automatic)
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::Number(100.0),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Automatic,
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
  assert_eq(formatter.format_pct(1.25, 100.0), "1%")
}

///|
test "percent params original deferred decimals 8" {
  let formatter = @ticker.PercentFormatter::new(
    decimals=@ticker.PercentDecimals::Number(-1.0 / 0.0),
  )
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::Number(100.0),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Number(-1.0 / 0.0),
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
  let error = try {
    ignore(formatter.format_pct(1.25, 0.0 / 0.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "OverflowError: cannot convert float infinity to integer")
  formatter.set_decimals(@ticker.PercentDecimals::Automatic)
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::Number(100.0),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Automatic,
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
  assert_eq(formatter.format_pct(1.25, 100.0), "1%")
}

///|
test "percent params original deferred decimals 9" {
  let formatter = @ticker.PercentFormatter::new(
    decimals=@ticker.PercentDecimals::Number(1.7976931348623157e+308),
  )
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::Number(100.0),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Number(1.7976931348623157e+308),
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
  let error = try {
    ignore(formatter.format_pct(1.25, 0.0 / 0.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "ValueError: Too many decimal digits in format string")
  formatter.set_decimals(@ticker.PercentDecimals::Automatic)
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::Number(100.0),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Automatic,
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
  assert_eq(formatter.format_pct(1.25, 100.0), "1%")
}

///|
test "percent params original deferred decimals 10" {
  let formatter = @ticker.PercentFormatter::new(
    decimals=@ticker.PercentDecimals::Integer(@bigint.BigInt::from_string("0")),
  )
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::Number(100.0),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
  assert_eq(formatter.format_pct(1.25, 0.0 / 0.0), "1%")
  formatter.set_decimals(@ticker.PercentDecimals::Automatic)
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::Number(100.0),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Automatic,
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
  assert_eq(formatter.format_pct(1.25, 100.0), "1%")
}

///|
test "percent params original deferred decimals 11" {
  let formatter = @ticker.PercentFormatter::new(
    decimals=@ticker.PercentDecimals::Integer(@bigint.BigInt::from_string("-1")),
  )
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::Number(100.0),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Integer(@bigint.BigInt::from_string("-1")),
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
  let error = try {
    ignore(formatter.format_pct(1.25, 0.0 / 0.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "ValueError: Format specifier missing precision")
  formatter.set_decimals(@ticker.PercentDecimals::Automatic)
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::Number(100.0),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Automatic,
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
  assert_eq(formatter.format_pct(1.25, 100.0), "1%")
}

///|
test "percent params original deferred decimals 12" {
  let formatter = @ticker.PercentFormatter::new(
    decimals=@ticker.PercentDecimals::Integer(@bigint.BigInt::from_string("2")),
  )
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::Number(100.0),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Integer(@bigint.BigInt::from_string("2")),
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
  assert_eq(formatter.format_pct(1.25, 0.0 / 0.0), "1.25%")
  formatter.set_decimals(@ticker.PercentDecimals::Automatic)
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::Number(100.0),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Automatic,
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
  assert_eq(formatter.format_pct(1.25, 100.0), "1%")
}

///|
test "percent params original deferred decimals 13" {
  let formatter = @ticker.PercentFormatter::new(
    decimals=@ticker.PercentDecimals::Integer(
      @bigint.BigInt::from_string("1267650600228229401496703205376"),
    ),
  )
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::Number(100.0),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Integer(
      @bigint.BigInt::from_string("1267650600228229401496703205376"),
    ),
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
  let error = try {
    ignore(formatter.format_pct(1.25, 0.0 / 0.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "ValueError: Too many decimal digits in format string")
  formatter.set_decimals(@ticker.PercentDecimals::Automatic)
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::Number(100.0),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Automatic,
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
  assert_eq(formatter.format_pct(1.25, 100.0), "1%")
}

///|
test "percent params original deferred decimals 14" {
  let formatter = @ticker.PercentFormatter::new(
    decimals=@ticker.PercentDecimals::Boolean(false),
  )
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::Number(100.0),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Boolean(false),
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
  assert_eq(formatter.format_pct(1.25, 0.0 / 0.0), "1%")
  formatter.set_decimals(@ticker.PercentDecimals::Automatic)
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::Number(100.0),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Automatic,
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
  assert_eq(formatter.format_pct(1.25, 100.0), "1%")
}

///|
test "percent params original deferred decimals 15" {
  let formatter = @ticker.PercentFormatter::new(
    decimals=@ticker.PercentDecimals::Boolean(true),
  )
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::Number(100.0),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Boolean(true),
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
  assert_eq(formatter.format_pct(1.25, 0.0 / 0.0), "1.2%")
  formatter.set_decimals(@ticker.PercentDecimals::Automatic)
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::Number(100.0),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Automatic,
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
  assert_eq(formatter.format_pct(1.25, 100.0), "1%")
}

///|
test "percent params original deferred decimals 16" {
  let formatter = @ticker.PercentFormatter::new(
    decimals=@ticker.PercentDecimals::Text("2"),
  )
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::Number(100.0),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Text("2"),
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
  assert_eq(formatter.format_pct(1.25, 0.0 / 0.0), "1.25%")
  formatter.set_decimals(@ticker.PercentDecimals::Automatic)
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::Number(100.0),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Automatic,
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
  assert_eq(formatter.format_pct(1.25, 100.0), "1%")
}

///|
test "percent params original deferred decimals 17" {
  let formatter = @ticker.PercentFormatter::new(
    decimals=@ticker.PercentDecimals::Text(" +02 "),
  )
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::Number(100.0),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Text(" +02 "),
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
  assert_eq(formatter.format_pct(1.25, 0.0 / 0.0), "1.25%")
  formatter.set_decimals(@ticker.PercentDecimals::Automatic)
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::Number(100.0),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Automatic,
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
  assert_eq(formatter.format_pct(1.25, 100.0), "1%")
}

///|
test "percent params original deferred decimals 18" {
  let formatter = @ticker.PercentFormatter::new(
    decimals=@ticker.PercentDecimals::Text("٢"),
  )
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::Number(100.0),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Text("٢"),
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
  assert_eq(formatter.format_pct(1.25, 0.0 / 0.0), "1.25%")
  formatter.set_decimals(@ticker.PercentDecimals::Automatic)
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::Number(100.0),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Automatic,
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
  assert_eq(formatter.format_pct(1.25, 100.0), "1%")
}

///|
test "percent params original deferred decimals 19" {
  let formatter = @ticker.PercentFormatter::new(
    decimals=@ticker.PercentDecimals::Text("1_0"),
  )
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::Number(100.0),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Text("1_0"),
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
  assert_eq(formatter.format_pct(1.25, 0.0 / 0.0), "1.2500000000%")
  formatter.set_decimals(@ticker.PercentDecimals::Automatic)
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::Number(100.0),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Automatic,
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
  assert_eq(formatter.format_pct(1.25, 100.0), "1%")
}

///|
test "percent params original deferred decimals 20" {
  let formatter = @ticker.PercentFormatter::new(
    decimals=@ticker.PercentDecimals::Text("2.0"),
  )
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::Number(100.0),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Text("2.0"),
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
  let error = try {
    ignore(formatter.format_pct(1.25, 0.0 / 0.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "ValueError: invalid literal for int() with base 10: '2.0'")
  formatter.set_decimals(@ticker.PercentDecimals::Automatic)
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::Number(100.0),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Automatic,
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
  assert_eq(formatter.format_pct(1.25, 100.0), "1%")
}

///|
test "percent params original deferred decimals 21" {
  let formatter = @ticker.PercentFormatter::new(
    decimals=@ticker.PercentDecimals::Text("-1"),
  )
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::Number(100.0),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Text("-1"),
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
  let error = try {
    ignore(formatter.format_pct(1.25, 0.0 / 0.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "ValueError: Format specifier missing precision")
  formatter.set_decimals(@ticker.PercentDecimals::Automatic)
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::Number(100.0),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Automatic,
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
  assert_eq(formatter.format_pct(1.25, 100.0), "1%")
}

///|
test "percent params original deferred decimals 22" {
  let formatter = @ticker.PercentFormatter::new(
    decimals=@ticker.PercentDecimals::Text(""),
  )
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::Number(100.0),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Text(""),
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
  let error = try {
    ignore(formatter.format_pct(1.25, 0.0 / 0.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "ValueError: invalid literal for int() with base 10: ''")
  formatter.set_decimals(@ticker.PercentDecimals::Automatic)
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::Number(100.0),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Automatic,
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
  assert_eq(formatter.format_pct(1.25, 100.0), "1%")
}

///|
test "percent params original deferred decimals 23" {
  let formatter = @ticker.PercentFormatter::new(
    decimals=@ticker.PercentDecimals::Text("\u001c2"),
  )
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::Number(100.0),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Text("\u001c2"),
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
  let error = try {
    ignore(formatter.format_pct(1.25, 0.0 / 0.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    error, "ValueError: invalid literal for int() with base 10: '\\x1c2'",
  )
  formatter.set_decimals(@ticker.PercentDecimals::Automatic)
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::Number(100.0),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Automatic,
  )
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.is_latex(), false)
  assert_eq(formatter.get_offset(), "")
  assert_eq(formatter.format_pct(1.25, 100.0), "1%")
}

///|
test "percent params original dynamic symbol 0 False" {
  let previous = @config.text_usetex()
  defer @config.set_text_usetex(previous)
  let formatter = @ticker.PercentFormatter::new(
    decimals=@ticker.PercentDecimals::Integer(@bigint.BigInt::from_int(0)),
    symbol=None,
    is_latex=false,
  )
  @config.set_text_usetex(false)
  assert_eq(formatter.symbol(), "")
  assert_eq(formatter.raw_symbol(), None)
  assert_eq(formatter.format_pct(1.0, 100.0), "1")
  @config.set_text_usetex(true)
  assert_eq(formatter.symbol(), "")
  assert_eq(formatter.raw_symbol(), None)
  assert_eq(formatter.format_pct(1.0, 100.0), "1")
  @config.set_text_usetex(false)
  assert_eq(formatter.symbol(), "")
  assert_eq(formatter.raw_symbol(), None)
  assert_eq(formatter.format_pct(1.0, 100.0), "1")
}

///|
test "percent params original dynamic symbol 0 True" {
  let previous = @config.text_usetex()
  defer @config.set_text_usetex(previous)
  let formatter = @ticker.PercentFormatter::new(
    decimals=@ticker.PercentDecimals::Integer(@bigint.BigInt::from_int(0)),
    symbol=None,
    is_latex=true,
  )
  @config.set_text_usetex(false)
  assert_eq(formatter.symbol(), "")
  assert_eq(formatter.raw_symbol(), None)
  assert_eq(formatter.format_pct(1.0, 100.0), "1")
  @config.set_text_usetex(true)
  assert_eq(formatter.symbol(), "")
  assert_eq(formatter.raw_symbol(), None)
  assert_eq(formatter.format_pct(1.0, 100.0), "1")
  @config.set_text_usetex(false)
  assert_eq(formatter.symbol(), "")
  assert_eq(formatter.raw_symbol(), None)
  assert_eq(formatter.format_pct(1.0, 100.0), "1")
}

///|
test "percent params original dynamic symbol 1 False" {
  let previous = @config.text_usetex()
  defer @config.set_text_usetex(previous)
  let formatter = @ticker.PercentFormatter::new(
    decimals=@ticker.PercentDecimals::Integer(@bigint.BigInt::from_int(0)),
    symbol=Some(""),
    is_latex=false,
  )
  @config.set_text_usetex(false)
  assert_eq(formatter.symbol(), "")
  assert_eq(formatter.raw_symbol(), Some(""))
  assert_eq(formatter.format_pct(1.0, 100.0), "1")
  @config.set_text_usetex(true)
  assert_eq(formatter.symbol(), "")
  assert_eq(formatter.raw_symbol(), Some(""))
  assert_eq(formatter.format_pct(1.0, 100.0), "1")
  @config.set_text_usetex(false)
  assert_eq(formatter.symbol(), "")
  assert_eq(formatter.raw_symbol(), Some(""))
  assert_eq(formatter.format_pct(1.0, 100.0), "1")
}

///|
test "percent params original dynamic symbol 1 True" {
  let previous = @config.text_usetex()
  defer @config.set_text_usetex(previous)
  let formatter = @ticker.PercentFormatter::new(
    decimals=@ticker.PercentDecimals::Integer(@bigint.BigInt::from_int(0)),
    symbol=Some(""),
    is_latex=true,
  )
  @config.set_text_usetex(false)
  assert_eq(formatter.symbol(), "")
  assert_eq(formatter.raw_symbol(), Some(""))
  assert_eq(formatter.format_pct(1.0, 100.0), "1")
  @config.set_text_usetex(true)
  assert_eq(formatter.symbol(), "")
  assert_eq(formatter.raw_symbol(), Some(""))
  assert_eq(formatter.format_pct(1.0, 100.0), "1")
  @config.set_text_usetex(false)
  assert_eq(formatter.symbol(), "")
  assert_eq(formatter.raw_symbol(), Some(""))
  assert_eq(formatter.format_pct(1.0, 100.0), "1")
}

///|
test "percent params original dynamic symbol 2 False" {
  let previous = @config.text_usetex()
  defer @config.set_text_usetex(previous)
  let formatter = @ticker.PercentFormatter::new(
    decimals=@ticker.PercentDecimals::Integer(@bigint.BigInt::from_int(0)),
    symbol=Some("%"),
    is_latex=false,
  )
  @config.set_text_usetex(false)
  assert_eq(formatter.symbol(), "%")
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.format_pct(1.0, 100.0), "1%")
  @config.set_text_usetex(true)
  assert_eq(formatter.symbol(), "\\%")
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.format_pct(1.0, 100.0), "1\\%")
  @config.set_text_usetex(false)
  assert_eq(formatter.symbol(), "%")
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.format_pct(1.0, 100.0), "1%")
}

///|
test "percent params original dynamic symbol 2 True" {
  let previous = @config.text_usetex()
  defer @config.set_text_usetex(previous)
  let formatter = @ticker.PercentFormatter::new(
    decimals=@ticker.PercentDecimals::Integer(@bigint.BigInt::from_int(0)),
    symbol=Some("%"),
    is_latex=true,
  )
  @config.set_text_usetex(false)
  assert_eq(formatter.symbol(), "%")
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.format_pct(1.0, 100.0), "1%")
  @config.set_text_usetex(true)
  assert_eq(formatter.symbol(), "%")
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.format_pct(1.0, 100.0), "1%")
  @config.set_text_usetex(false)
  assert_eq(formatter.symbol(), "%")
  assert_eq(formatter.raw_symbol(), Some("%"))
  assert_eq(formatter.format_pct(1.0, 100.0), "1%")
}

///|
test "percent params original dynamic symbol 3 False" {
  let previous = @config.text_usetex()
  defer @config.set_text_usetex(previous)
  let formatter = @ticker.PercentFormatter::new(
    decimals=@ticker.PercentDecimals::Integer(@bigint.BigInt::from_int(0)),
    symbol=Some("\\%"),
    is_latex=false,
  )
  @config.set_text_usetex(false)
  assert_eq(formatter.symbol(), "\\%")
  assert_eq(formatter.raw_symbol(), Some("\\%"))
  assert_eq(formatter.format_pct(1.0, 100.0), "1\\%")
  @config.set_text_usetex(true)
  assert_eq(formatter.symbol(), "\\\\\\%")
  assert_eq(formatter.raw_symbol(), Some("\\%"))
  assert_eq(formatter.format_pct(1.0, 100.0), "1\\\\\\%")
  @config.set_text_usetex(false)
  assert_eq(formatter.symbol(), "\\%")
  assert_eq(formatter.raw_symbol(), Some("\\%"))
  assert_eq(formatter.format_pct(1.0, 100.0), "1\\%")
}

///|
test "percent params original dynamic symbol 3 True" {
  let previous = @config.text_usetex()
  defer @config.set_text_usetex(previous)
  let formatter = @ticker.PercentFormatter::new(
    decimals=@ticker.PercentDecimals::Integer(@bigint.BigInt::from_int(0)),
    symbol=Some("\\%"),
    is_latex=true,
  )
  @config.set_text_usetex(false)
  assert_eq(formatter.symbol(), "\\%")
  assert_eq(formatter.raw_symbol(), Some("\\%"))
  assert_eq(formatter.format_pct(1.0, 100.0), "1\\%")
  @config.set_text_usetex(true)
  assert_eq(formatter.symbol(), "\\%")
  assert_eq(formatter.raw_symbol(), Some("\\%"))
  assert_eq(formatter.format_pct(1.0, 100.0), "1\\%")
  @config.set_text_usetex(false)
  assert_eq(formatter.symbol(), "\\%")
  assert_eq(formatter.raw_symbol(), Some("\\%"))
  assert_eq(formatter.format_pct(1.0, 100.0), "1\\%")
}

///|
test "percent params original dynamic symbol 4 False" {
  let previous = @config.text_usetex()
  defer @config.set_text_usetex(previous)
  let formatter = @ticker.PercentFormatter::new(
    decimals=@ticker.PercentDecimals::Integer(@bigint.BigInt::from_int(0)),
    symbol=Some("\\#$%&~_^{}"),
    is_latex=false,
  )
  @config.set_text_usetex(false)
  assert_eq(formatter.symbol(), "\\#$%&~_^{}")
  assert_eq(formatter.raw_symbol(), Some("\\#$%&~_^{}"))
  assert_eq(formatter.format_pct(1.0, 100.0), "1\\#$%&~_^{}")
  @config.set_text_usetex(true)
  assert_eq(formatter.symbol(), "\\\\\\#\\$\\%\\&\\~\\_\\^\\{\\}")
  assert_eq(formatter.raw_symbol(), Some("\\#$%&~_^{}"))
  assert_eq(
    formatter.format_pct(1.0, 100.0),
    "1\\\\\\#\\$\\%\\&\\~\\_\\^\\{\\}",
  )
  @config.set_text_usetex(false)
  assert_eq(formatter.symbol(), "\\#$%&~_^{}")
  assert_eq(formatter.raw_symbol(), Some("\\#$%&~_^{}"))
  assert_eq(formatter.format_pct(1.0, 100.0), "1\\#$%&~_^{}")
}

///|
test "percent params original dynamic symbol 4 True" {
  let previous = @config.text_usetex()
  defer @config.set_text_usetex(previous)
  let formatter = @ticker.PercentFormatter::new(
    decimals=@ticker.PercentDecimals::Integer(@bigint.BigInt::from_int(0)),
    symbol=Some("\\#$%&~_^{}"),
    is_latex=true,
  )
  @config.set_text_usetex(false)
  assert_eq(formatter.symbol(), "\\#$%&~_^{}")
  assert_eq(formatter.raw_symbol(), Some("\\#$%&~_^{}"))
  assert_eq(formatter.format_pct(1.0, 100.0), "1\\#$%&~_^{}")
  @config.set_text_usetex(true)
  assert_eq(formatter.symbol(), "\\#$%&~_^{}")
  assert_eq(formatter.raw_symbol(), Some("\\#$%&~_^{}"))
  assert_eq(formatter.format_pct(1.0, 100.0), "1\\#$%&~_^{}")
  @config.set_text_usetex(false)
  assert_eq(formatter.symbol(), "\\#$%&~_^{}")
  assert_eq(formatter.raw_symbol(), Some("\\#$%&~_^{}"))
  assert_eq(formatter.format_pct(1.0, 100.0), "1\\#$%&~_^{}")
}

///|
test "percent params original dynamic symbol 5 False" {
  let previous = @config.text_usetex()
  defer @config.set_text_usetex(previous)
  let formatter = @ticker.PercentFormatter::new(
    decimals=@ticker.PercentDecimals::Integer(@bigint.BigInt::from_int(0)),
    symbol=Some("-%"),
    is_latex=false,
  )
  @config.set_text_usetex(false)
  assert_eq(formatter.symbol(), "-%")
  assert_eq(formatter.raw_symbol(), Some("-%"))
  assert_eq(formatter.format_pct(1.0, 100.0), "1-%")
  @config.set_text_usetex(true)
  assert_eq(formatter.symbol(), "-\\%")
  assert_eq(formatter.raw_symbol(), Some("-%"))
  assert_eq(formatter.format_pct(1.0, 100.0), "1-\\%")
  @config.set_text_usetex(false)
  assert_eq(formatter.symbol(), "-%")
  assert_eq(formatter.raw_symbol(), Some("-%"))
  assert_eq(formatter.format_pct(1.0, 100.0), "1-%")
}

///|
test "percent params original dynamic symbol 5 True" {
  let previous = @config.text_usetex()
  defer @config.set_text_usetex(previous)
  let formatter = @ticker.PercentFormatter::new(
    decimals=@ticker.PercentDecimals::Integer(@bigint.BigInt::from_int(0)),
    symbol=Some("-%"),
    is_latex=true,
  )
  @config.set_text_usetex(false)
  assert_eq(formatter.symbol(), "-%")
  assert_eq(formatter.raw_symbol(), Some("-%"))
  assert_eq(formatter.format_pct(1.0, 100.0), "1-%")
  @config.set_text_usetex(true)
  assert_eq(formatter.symbol(), "-%")
  assert_eq(formatter.raw_symbol(), Some("-%"))
  assert_eq(formatter.format_pct(1.0, 100.0), "1-%")
  @config.set_text_usetex(false)
  assert_eq(formatter.symbol(), "-%")
  assert_eq(formatter.raw_symbol(), Some("-%"))
  assert_eq(formatter.format_pct(1.0, 100.0), "1-%")
}

///|
test "percent params original dynamic symbol 6 False" {
  let previous = @config.text_usetex()
  defer @config.set_text_usetex(previous)
  let formatter = @ticker.PercentFormatter::new(
    decimals=@ticker.PercentDecimals::Integer(@bigint.BigInt::from_int(0)),
    symbol=Some("𝄞 café"),
    is_latex=false,
  )
  @config.set_text_usetex(false)
  assert_eq(formatter.symbol(), "𝄞 café")
  assert_eq(formatter.raw_symbol(), Some("𝄞 café"))
  assert_eq(formatter.format_pct(1.0, 100.0), "1𝄞 café")
  @config.set_text_usetex(true)
  assert_eq(formatter.symbol(), "𝄞 café")
  assert_eq(formatter.raw_symbol(), Some("𝄞 café"))
  assert_eq(formatter.format_pct(1.0, 100.0), "1𝄞 café")
  @config.set_text_usetex(false)
  assert_eq(formatter.symbol(), "𝄞 café")
  assert_eq(formatter.raw_symbol(), Some("𝄞 café"))
  assert_eq(formatter.format_pct(1.0, 100.0), "1𝄞 café")
}

///|
test "percent params original dynamic symbol 6 True" {
  let previous = @config.text_usetex()
  defer @config.set_text_usetex(previous)
  let formatter = @ticker.PercentFormatter::new(
    decimals=@ticker.PercentDecimals::Integer(@bigint.BigInt::from_int(0)),
    symbol=Some("𝄞 café"),
    is_latex=true,
  )
  @config.set_text_usetex(false)
  assert_eq(formatter.symbol(), "𝄞 café")
  assert_eq(formatter.raw_symbol(), Some("𝄞 café"))
  assert_eq(formatter.format_pct(1.0, 100.0), "1𝄞 café")
  @config.set_text_usetex(true)
  assert_eq(formatter.symbol(), "𝄞 café")
  assert_eq(formatter.raw_symbol(), Some("𝄞 café"))
  assert_eq(formatter.format_pct(1.0, 100.0), "1𝄞 café")
  @config.set_text_usetex(false)
  assert_eq(formatter.symbol(), "𝄞 café")
  assert_eq(formatter.raw_symbol(), Some("𝄞 café"))
  assert_eq(formatter.format_pct(1.0, 100.0), "1𝄞 café")
}

///|
test "percent params original dynamic symbol 7 False" {
  let previous = @config.text_usetex()
  defer @config.set_text_usetex(previous)
  let formatter = @ticker.PercentFormatter::new(
    decimals=@ticker.PercentDecimals::Integer(@bigint.BigInt::from_int(0)),
    symbol=Some("{value}"),
    is_latex=false,
  )
  @config.set_text_usetex(false)
  assert_eq(formatter.symbol(), "{value}")
  assert_eq(formatter.raw_symbol(), Some("{value}"))
  assert_eq(formatter.format_pct(1.0, 100.0), "1{value}")
  @config.set_text_usetex(true)
  assert_eq(formatter.symbol(), "\\{value\\}")
  assert_eq(formatter.raw_symbol(), Some("{value}"))
  assert_eq(formatter.format_pct(1.0, 100.0), "1\\{value\\}")
  @config.set_text_usetex(false)
  assert_eq(formatter.symbol(), "{value}")
  assert_eq(formatter.raw_symbol(), Some("{value}"))
  assert_eq(formatter.format_pct(1.0, 100.0), "1{value}")
}

///|
test "percent params original dynamic symbol 7 True" {
  let previous = @config.text_usetex()
  defer @config.set_text_usetex(previous)
  let formatter = @ticker.PercentFormatter::new(
    decimals=@ticker.PercentDecimals::Integer(@bigint.BigInt::from_int(0)),
    symbol=Some("{value}"),
    is_latex=true,
  )
  @config.set_text_usetex(false)
  assert_eq(formatter.symbol(), "{value}")
  assert_eq(formatter.raw_symbol(), Some("{value}"))
  assert_eq(formatter.format_pct(1.0, 100.0), "1{value}")
  @config.set_text_usetex(true)
  assert_eq(formatter.symbol(), "{value}")
  assert_eq(formatter.raw_symbol(), Some("{value}"))
  assert_eq(formatter.format_pct(1.0, 100.0), "1{value}")
  @config.set_text_usetex(false)
  assert_eq(formatter.symbol(), "{value}")
  assert_eq(formatter.raw_symbol(), Some("{value}"))
  assert_eq(formatter.format_pct(1.0, 100.0), "1{value}")
}

///|
test "percent params original dynamic symbol 8 False" {
  let previous = @config.text_usetex()
  defer @config.set_text_usetex(previous)
  let formatter = @ticker.PercentFormatter::new(
    decimals=@ticker.PercentDecimals::Integer(@bigint.BigInt::from_int(0)),
    symbol=Some("%%__"),
    is_latex=false,
  )
  @config.set_text_usetex(false)
  assert_eq(formatter.symbol(), "%%__")
  assert_eq(formatter.raw_symbol(), Some("%%__"))
  assert_eq(formatter.format_pct(1.0, 100.0), "1%%__")
  @config.set_text_usetex(true)
  assert_eq(formatter.symbol(), "\\%\\%\\_\\_")
  assert_eq(formatter.raw_symbol(), Some("%%__"))
  assert_eq(formatter.format_pct(1.0, 100.0), "1\\%\\%\\_\\_")
  @config.set_text_usetex(false)
  assert_eq(formatter.symbol(), "%%__")
  assert_eq(formatter.raw_symbol(), Some("%%__"))
  assert_eq(formatter.format_pct(1.0, 100.0), "1%%__")
}

///|
test "percent params original dynamic symbol 8 True" {
  let previous = @config.text_usetex()
  defer @config.set_text_usetex(previous)
  let formatter = @ticker.PercentFormatter::new(
    decimals=@ticker.PercentDecimals::Integer(@bigint.BigInt::from_int(0)),
    symbol=Some("%%__"),
    is_latex=true,
  )
  @config.set_text_usetex(false)
  assert_eq(formatter.symbol(), "%%__")
  assert_eq(formatter.raw_symbol(), Some("%%__"))
  assert_eq(formatter.format_pct(1.0, 100.0), "1%%__")
  @config.set_text_usetex(true)
  assert_eq(formatter.symbol(), "%%__")
  assert_eq(formatter.raw_symbol(), Some("%%__"))
  assert_eq(formatter.format_pct(1.0, 100.0), "1%%__")
  @config.set_text_usetex(false)
  assert_eq(formatter.symbol(), "%%__")
  assert_eq(formatter.raw_symbol(), Some("%%__"))
  assert_eq(formatter.format_pct(1.0, 100.0), "1%%__")
}

///|
test "percent params original shallow slots 0" {
  let formatter = @ticker.PercentFormatter::new(
    xmax=@ticker.PercentXMax::Number(1.0),
    decimals=@ticker.PercentDecimals::Integer(@bigint.BigInt::from_int(2)),
    symbol=Some("old"),
  )
  let axis = @ticker.FormatterAxisBinding::new()
  let locations = [1.0, 2.0]
  formatter.set_axis(Some(axis))
  formatter.set_locs(locations)
  let shallow = formatter.copy()
  formatter.set_xmax(@ticker.PercentXMax::NumpyInt64(7L))
  formatter.set_decimals(@ticker.PercentDecimals::Text("3"))
  formatter.set_symbol(None)
  formatter.set_is_latex(true)
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::NumpyInt64(7L),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Text("3"),
  )
  assert_eq(formatter.raw_symbol(), None)
  assert_eq(formatter.is_latex(), true)
  assert_eq(formatter.get_offset(), "")
  verify_percent_params_xmax(shallow.xmax(), @ticker.PercentXMax::Number(1.0))
  verify_percent_params_decimals(
    shallow.decimals(),
    @ticker.PercentDecimals::Integer(@bigint.BigInt::from_string("2")),
  )
  assert_eq(shallow.raw_symbol(), Some("old"))
  assert_eq(shallow.is_latex(), false)
  assert_eq(shallow.get_offset(), "")
  locations.push(3.0)
  verify_percent_params_locations(formatter.locations(), [1.0, 2.0, 3.0])
  verify_percent_params_locations(shallow.locations(), [1.0, 2.0, 3.0])
  assert_eq(shallow.axis(), Some(axis))
  formatter.set_locs([9.0])
  formatter.set_axis(None)
  verify_percent_params_locations(formatter.locations(), [9.0])
  verify_percent_params_locations(shallow.locations(), [1.0, 2.0, 3.0])
  assert_true(formatter.axis() is None)
  assert_eq(shallow.axis(), Some(axis))
}

///|
test "percent params original shallow slots 1" {
  let formatter = @ticker.PercentFormatter::new(
    xmax=@ticker.PercentXMax::Number(1.0),
    decimals=@ticker.PercentDecimals::Integer(@bigint.BigInt::from_int(2)),
    symbol=Some("old"),
  )
  let axis = @ticker.FormatterAxisBinding::new()
  let locations = [1.0, 2.0]
  formatter.set_axis(Some(axis))
  formatter.set_locs(locations)
  let shallow = formatter.copy()
  formatter.set_xmax(@ticker.PercentXMax::NumpyInt64(7L))
  formatter.set_decimals(@ticker.PercentDecimals::Text("3"))
  formatter.set_symbol(Some(""))
  formatter.set_is_latex(true)
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::NumpyInt64(7L),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Text("3"),
  )
  assert_eq(formatter.raw_symbol(), Some(""))
  assert_eq(formatter.is_latex(), true)
  assert_eq(formatter.get_offset(), "")
  verify_percent_params_xmax(shallow.xmax(), @ticker.PercentXMax::Number(1.0))
  verify_percent_params_decimals(
    shallow.decimals(),
    @ticker.PercentDecimals::Integer(@bigint.BigInt::from_string("2")),
  )
  assert_eq(shallow.raw_symbol(), Some("old"))
  assert_eq(shallow.is_latex(), false)
  assert_eq(shallow.get_offset(), "")
  locations.push(3.0)
  verify_percent_params_locations(formatter.locations(), [1.0, 2.0, 3.0])
  verify_percent_params_locations(shallow.locations(), [1.0, 2.0, 3.0])
  assert_eq(shallow.axis(), Some(axis))
  formatter.set_locs([9.0])
  formatter.set_axis(None)
  verify_percent_params_locations(formatter.locations(), [9.0])
  verify_percent_params_locations(shallow.locations(), [1.0, 2.0, 3.0])
  assert_true(formatter.axis() is None)
  assert_eq(shallow.axis(), Some(axis))
}

///|
test "percent params original shallow slots 2" {
  let formatter = @ticker.PercentFormatter::new(
    xmax=@ticker.PercentXMax::Number(1.0),
    decimals=@ticker.PercentDecimals::Integer(@bigint.BigInt::from_int(2)),
    symbol=Some("old"),
  )
  let axis = @ticker.FormatterAxisBinding::new()
  let locations = [1.0, 2.0]
  formatter.set_axis(Some(axis))
  formatter.set_locs(locations)
  let shallow = formatter.copy()
  formatter.set_xmax(@ticker.PercentXMax::NumpyInt64(7L))
  formatter.set_decimals(@ticker.PercentDecimals::Text("3"))
  formatter.set_symbol(Some("\\%"))
  formatter.set_is_latex(true)
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::NumpyInt64(7L),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Text("3"),
  )
  assert_eq(formatter.raw_symbol(), Some("\\%"))
  assert_eq(formatter.is_latex(), true)
  assert_eq(formatter.get_offset(), "")
  verify_percent_params_xmax(shallow.xmax(), @ticker.PercentXMax::Number(1.0))
  verify_percent_params_decimals(
    shallow.decimals(),
    @ticker.PercentDecimals::Integer(@bigint.BigInt::from_string("2")),
  )
  assert_eq(shallow.raw_symbol(), Some("old"))
  assert_eq(shallow.is_latex(), false)
  assert_eq(shallow.get_offset(), "")
  locations.push(3.0)
  verify_percent_params_locations(formatter.locations(), [1.0, 2.0, 3.0])
  verify_percent_params_locations(shallow.locations(), [1.0, 2.0, 3.0])
  assert_eq(shallow.axis(), Some(axis))
  formatter.set_locs([9.0])
  formatter.set_axis(None)
  verify_percent_params_locations(formatter.locations(), [9.0])
  verify_percent_params_locations(shallow.locations(), [1.0, 2.0, 3.0])
  assert_true(formatter.axis() is None)
  assert_eq(shallow.axis(), Some(axis))
}

///|
test "percent params original shallow slots 3" {
  let formatter = @ticker.PercentFormatter::new(
    xmax=@ticker.PercentXMax::Number(1.0),
    decimals=@ticker.PercentDecimals::Integer(@bigint.BigInt::from_int(2)),
    symbol=Some("old"),
  )
  let axis = @ticker.FormatterAxisBinding::new()
  let locations = [1.0, 2.0]
  formatter.set_axis(Some(axis))
  formatter.set_locs(locations)
  let shallow = formatter.copy()
  formatter.set_xmax(@ticker.PercentXMax::NumpyInt64(7L))
  formatter.set_decimals(@ticker.PercentDecimals::Text("3"))
  formatter.set_symbol(Some("-new"))
  formatter.set_is_latex(true)
  verify_percent_params_xmax(
    formatter.xmax(),
    @ticker.PercentXMax::NumpyInt64(7L),
  )
  verify_percent_params_decimals(
    formatter.decimals(),
    @ticker.PercentDecimals::Text("3"),
  )
  assert_eq(formatter.raw_symbol(), Some("-new"))
  assert_eq(formatter.is_latex(), true)
  assert_eq(formatter.get_offset(), "")
  verify_percent_params_xmax(shallow.xmax(), @ticker.PercentXMax::Number(1.0))
  verify_percent_params_decimals(
    shallow.decimals(),
    @ticker.PercentDecimals::Integer(@bigint.BigInt::from_string("2")),
  )
  assert_eq(shallow.raw_symbol(), Some("old"))
  assert_eq(shallow.is_latex(), false)
  assert_eq(shallow.get_offset(), "")
  locations.push(3.0)
  verify_percent_params_locations(formatter.locations(), [1.0, 2.0, 3.0])
  verify_percent_params_locations(shallow.locations(), [1.0, 2.0, 3.0])
  assert_eq(shallow.axis(), Some(axis))
  formatter.set_locs([9.0])
  formatter.set_axis(None)
  verify_percent_params_locations(formatter.locations(), [9.0])
  verify_percent_params_locations(shallow.locations(), [1.0, 2.0, 3.0])
  assert_true(formatter.axis() is None)
  assert_eq(shallow.axis(), Some(axis))
}

///|
test "percent params original retained view float64 full" {
  let owner = [-0.0, 1.25, 3.5, -7.0]
  let view = @ticker.TickValues::from_array(owner).view(0, 1, 4)
  let formatter = @ticker.PercentFormatter::new()
  formatter.set_locs_view(view)
  let shallow = formatter.copy()
  verify_percent_params_locations(shallow.locations(), [-0.0, 1.25, 3.5, -7.0])
  owner[0] = 11.0
  view.set(-1, 13.0)
  assert_eq(owner, [11.0, 1.25, 3.5, 13.0])
  verify_percent_params_locations(shallow.locations(), [11.0, 1.25, 3.5, 13.0])
  match shallow.locations() {
    NdArray(retained) => assert_true(physical_equal(retained, view))
    _ => fail("expected retained view")
  }
  formatter.set_locs([9.0])
  formatter.set_decimals(
    @ticker.PercentDecimals::Integer(@bigint.BigInt::from_int(4)),
  )
  verify_percent_params_locations(shallow.locations(), [11.0, 1.25, 3.5, 13.0])
  assert_eq(shallow.decimals(), @ticker.PercentDecimals::Automatic)
}

///|
test "percent params original retained view float64 reverse" {
  let owner = [-0.0, 1.25, 3.5, -7.0]
  let view = @ticker.TickValues::from_array(owner).view(3, -1, 4)
  let formatter = @ticker.PercentFormatter::new()
  formatter.set_locs_view(view)
  let shallow = formatter.copy()
  verify_percent_params_locations(shallow.locations(), [-7.0, 3.5, 1.25, -0.0])
  owner[3] = 11.0
  view.set(-1, 13.0)
  assert_eq(owner, [13.0, 1.25, 3.5, 11.0])
  verify_percent_params_locations(shallow.locations(), [11.0, 3.5, 1.25, 13.0])
  match shallow.locations() {
    NdArray(retained) => assert_true(physical_equal(retained, view))
    _ => fail("expected retained view")
  }
  formatter.set_locs([9.0])
  formatter.set_decimals(
    @ticker.PercentDecimals::Integer(@bigint.BigInt::from_int(4)),
  )
  verify_percent_params_locations(shallow.locations(), [11.0, 3.5, 1.25, 13.0])
  assert_eq(shallow.decimals(), @ticker.PercentDecimals::Automatic)
}

///|
test "percent params original retained view float64 nested" {
  let owner = [-0.0, 1.25, 3.5, -7.0]
  let view = @ticker.TickValues::from_array(owner).view(1, 2, 2).view(1, -1, 2)
  let formatter = @ticker.PercentFormatter::new()
  formatter.set_locs_view(view)
  let shallow = formatter.copy()
  verify_percent_params_locations(shallow.locations(), [-7.0, 1.25])
  owner[3] = 11.0
  view.set(-1, 13.0)
  assert_eq(owner, [-0.0, 13.0, 3.5, 11.0])
  verify_percent_params_locations(shallow.locations(), [11.0, 13.0])
  match shallow.locations() {
    NdArray(retained) => assert_true(physical_equal(retained, view))
    _ => fail("expected retained view")
  }
  formatter.set_locs([9.0])
  formatter.set_decimals(
    @ticker.PercentDecimals::Integer(@bigint.BigInt::from_int(4)),
  )
  verify_percent_params_locations(shallow.locations(), [11.0, 13.0])
  assert_eq(shallow.decimals(), @ticker.PercentDecimals::Automatic)
}

///|
test "percent params original retained view float64 zero" {
  let owner = [-0.0, 1.25, 3.5, -7.0]
  let view = @ticker.TickValues::from_array(owner).view(2, 0, 3)
  let formatter = @ticker.PercentFormatter::new()
  formatter.set_locs_view(view)
  let shallow = formatter.copy()
  verify_percent_params_locations(shallow.locations(), [3.5, 3.5, 3.5])
  owner[2] = 11.0
  view.set(-1, 13.0)
  assert_eq(owner, [-0.0, 1.25, 13.0, -7.0])
  verify_percent_params_locations(shallow.locations(), [13.0, 13.0, 13.0])
  match shallow.locations() {
    NdArray(retained) => assert_true(physical_equal(retained, view))
    _ => fail("expected retained view")
  }
  formatter.set_locs([9.0])
  formatter.set_decimals(
    @ticker.PercentDecimals::Integer(@bigint.BigInt::from_int(4)),
  )
  verify_percent_params_locations(shallow.locations(), [13.0, 13.0, 13.0])
  assert_eq(shallow.decimals(), @ticker.PercentDecimals::Automatic)
}

///|
test "percent params original retained view float64 empty" {
  let owner = [-0.0, 1.25, 3.5, -7.0]
  let view = @ticker.TickValues::from_array(owner).view(0, 1, 0)
  let formatter = @ticker.PercentFormatter::new()
  formatter.set_locs_view(view)
  let shallow = formatter.copy()
  verify_percent_params_locations(shallow.locations(), [])
  assert_eq(owner, [-0.0, 1.25, 3.5, -7.0])
  verify_percent_params_locations(shallow.locations(), [])
  match shallow.locations() {
    NdArray(retained) => assert_true(physical_equal(retained, view))
    _ => fail("expected retained view")
  }
  formatter.set_locs([9.0])
  formatter.set_decimals(
    @ticker.PercentDecimals::Integer(@bigint.BigInt::from_int(4)),
  )
  verify_percent_params_locations(shallow.locations(), [])
  assert_eq(shallow.decimals(), @ticker.PercentDecimals::Automatic)
}

///|
test "percent params original retained view int64 full" {
  let owner = [9007199254740993L, -9223372036854775808L, 7L, -1L]
  let view = @ticker.TickValues::from_int64_array(owner).view(0, 1, 4)
  let formatter = @ticker.PercentFormatter::new()
  formatter.set_locs_view(view)
  let shallow = formatter.copy()
  verify_percent_params_locations(shallow.locations(), [
    9007199254740992.0, -9.223372036854776e+18, 7.0, -1.0,
  ])
  owner[0] = 11L
  view.set(-1, 13.0)
  assert_eq(owner, [11L, -9223372036854775808L, 7L, 13L])
  verify_percent_params_locations(shallow.locations(), [
    11.0, -9.223372036854776e+18, 7.0, 13.0,
  ])
  match shallow.locations() {
    NdArray(retained) => assert_true(physical_equal(retained, view))
    _ => fail("expected retained view")
  }
  formatter.set_locs([9.0])
  formatter.set_decimals(
    @ticker.PercentDecimals::Integer(@bigint.BigInt::from_int(4)),
  )
  verify_percent_params_locations(shallow.locations(), [
    11.0, -9.223372036854776e+18, 7.0, 13.0,
  ])
  assert_eq(shallow.decimals(), @ticker.PercentDecimals::Automatic)
}

///|
test "percent params original retained view int64 reverse" {
  let owner = [9007199254740993L, -9223372036854775808L, 7L, -1L]
  let view = @ticker.TickValues::from_int64_array(owner).view(3, -1, 4)
  let formatter = @ticker.PercentFormatter::new()
  formatter.set_locs_view(view)
  let shallow = formatter.copy()
  verify_percent_params_locations(shallow.locations(), [
    -1.0, 7.0, -9.223372036854776e+18, 9007199254740992.0,
  ])
  owner[3] = 11L
  view.set(-1, 13.0)
  assert_eq(owner, [13L, -9223372036854775808L, 7L, 11L])
  verify_percent_params_locations(shallow.locations(), [
    11.0, 7.0, -9.223372036854776e+18, 13.0,
  ])
  match shallow.locations() {
    NdArray(retained) => assert_true(physical_equal(retained, view))
    _ => fail("expected retained view")
  }
  formatter.set_locs([9.0])
  formatter.set_decimals(
    @ticker.PercentDecimals::Integer(@bigint.BigInt::from_int(4)),
  )
  verify_percent_params_locations(shallow.locations(), [
    11.0, 7.0, -9.223372036854776e+18, 13.0,
  ])
  assert_eq(shallow.decimals(), @ticker.PercentDecimals::Automatic)
}

///|
test "percent params original retained view int64 nested" {
  let owner = [9007199254740993L, -9223372036854775808L, 7L, -1L]
  let view = @ticker.TickValues::from_int64_array(owner)
    .view(1, 2, 2)
    .view(1, -1, 2)
  let formatter = @ticker.PercentFormatter::new()
  formatter.set_locs_view(view)
  let shallow = formatter.copy()
  verify_percent_params_locations(shallow.locations(), [
    -1.0, -9.223372036854776e+18,
  ])
  owner[3] = 11L
  view.set(-1, 13.0)
  assert_eq(owner, [9007199254740993L, 13L, 7L, 11L])
  verify_percent_params_locations(shallow.locations(), [11.0, 13.0])
  match shallow.locations() {
    NdArray(retained) => assert_true(physical_equal(retained, view))
    _ => fail("expected retained view")
  }
  formatter.set_locs([9.0])
  formatter.set_decimals(
    @ticker.PercentDecimals::Integer(@bigint.BigInt::from_int(4)),
  )
  verify_percent_params_locations(shallow.locations(), [11.0, 13.0])
  assert_eq(shallow.decimals(), @ticker.PercentDecimals::Automatic)
}

///|
test "percent params original retained view int64 zero" {
  let owner = [9007199254740993L, -9223372036854775808L, 7L, -1L]
  let view = @ticker.TickValues::from_int64_array(owner).view(2, 0, 3)
  let formatter = @ticker.PercentFormatter::new()
  formatter.set_locs_view(view)
  let shallow = formatter.copy()
  verify_percent_params_locations(shallow.locations(), [7.0, 7.0, 7.0])
  owner[2] = 11L
  view.set(-1, 13.0)
  assert_eq(owner, [9007199254740993L, -9223372036854775808L, 13L, -1L])
  verify_percent_params_locations(shallow.locations(), [13.0, 13.0, 13.0])
  match shallow.locations() {
    NdArray(retained) => assert_true(physical_equal(retained, view))
    _ => fail("expected retained view")
  }
  formatter.set_locs([9.0])
  formatter.set_decimals(
    @ticker.PercentDecimals::Integer(@bigint.BigInt::from_int(4)),
  )
  verify_percent_params_locations(shallow.locations(), [13.0, 13.0, 13.0])
  assert_eq(shallow.decimals(), @ticker.PercentDecimals::Automatic)
}

///|
test "percent params original retained view int64 empty" {
  let owner = [9007199254740993L, -9223372036854775808L, 7L, -1L]
  let view = @ticker.TickValues::from_int64_array(owner).view(0, 1, 0)
  let formatter = @ticker.PercentFormatter::new()
  formatter.set_locs_view(view)
  let shallow = formatter.copy()
  verify_percent_params_locations(shallow.locations(), [])
  assert_eq(owner, [9007199254740993L, -9223372036854775808L, 7L, -1L])
  verify_percent_params_locations(shallow.locations(), [])
  match shallow.locations() {
    NdArray(retained) => assert_true(physical_equal(retained, view))
    _ => fail("expected retained view")
  }
  formatter.set_locs([9.0])
  formatter.set_decimals(
    @ticker.PercentDecimals::Integer(@bigint.BigInt::from_int(4)),
  )
  verify_percent_params_locations(shallow.locations(), [])
  assert_eq(shallow.decimals(), @ticker.PercentDecimals::Automatic)
}

///|
test "percent params original common default locations" {
  let previous = @ticker.NullFormatter::new()
  let formatter = @ticker.PercentFormatter::new()
  let shared = match previous.locations() {
    Sequence(values) => values
    _ => abort("expected default list")
  }
  defer shared.clear()
  shared.push(7.0)
  verify_percent_params_locations(formatter.locations(), [7.0])
}

///|
test "percent params original late error keeps batch state" {
  let formatter = @ticker.PercentFormatter::new(
    xmax=@ticker.PercentXMax::Number(0.0),
    decimals=@ticker.PercentDecimals::Integer(@bigint.BigInt::from_int(-1)),
  )
  formatter.set_locs([9.0])
  let error = try {
    ignore(formatter.call(1.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    error, "AttributeError: 'NoneType' object has no attribute 'get_view_interval'",
  )
  let values = [1.0, 2.0]
  let error = try {
    ignore(formatter.format_ticks(values))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    error, "AttributeError: 'NoneType' object has no attribute 'get_view_interval'",
  )
  match formatter.locations() {
    Sequence(retained) => assert_true(physical_equal(retained, values))
    _ => fail("expected installed list")
  }
  verify_percent_params_locations(formatter.locations(), [1.0, 2.0])
  formatter.set_xmax(@ticker.PercentXMax::Number(100.0))
  formatter.set_decimals(
    @ticker.PercentDecimals::Integer(@bigint.BigInt::from_int(0)),
  )
  assert_eq(formatter.format_pct(1.0, 100.0), "1%")
}
