// Complete pinned ScalarFormatter state, actual RcParams and real descriptors.

///|
fn verify_scalar_param_number(
  actual : @ticker.ScalarNumber,
  expected : @ticker.ScalarNumber,
) -> Unit raise {
  match (actual, expected) {
    (@ticker.ScalarNumber::Number(left), @ticker.ScalarNumber::Number(right))
    | (
      @ticker.ScalarNumber::NumpyFloat64(left),
      @ticker.ScalarNumber::NumpyFloat64(right),
    ) =>
      if right.is_nan() {
        assert_true(left.is_nan())
      } else {
        assert_eq(left.reinterpret_as_uint64(), right.reinterpret_as_uint64())
      }
    _ => assert_eq(actual, expected)
  }
}

///|
fn verify_scalar_param_optional(
  actual : @ticker.ScalarNumber?,
  expected : @ticker.ScalarNumber?,
) -> Unit raise {
  match (actual, expected) {
    (Some(actual), Some(expected)) =>
      verify_scalar_param_number(actual, expected)
    (None, None) => ()
    _ => fail("unexpected optional scalar")
  }
}

///|
fn verify_scalar_param_limits(
  actual : @ticker.ScalarPowerLimits,
  expected : Array[@ticker.ScalarNumber],
) -> Unit raise {
  let values = match actual {
    Sequence(values) => values.map(value => @ticker.ScalarNumber::Number(value))
    Integers(values) =>
      values.map(value => @ticker.ScalarNumber::Integer(value))
    Values(values) => values
    NdArray(_) => abort("ndarray identity is checked separately")
  }
  assert_eq(values.length(), expected.length())
  for index, value in expected {
    verify_scalar_param_number(values[index], value)
  }
}

///|
test "scalar params original defaults" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = @ticker.ScalarFormatter::new()
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  assert_true(formatter.axis() is None)
  assert_eq(formatter.locations().length(), 0)
  assert_eq(formatter.get_offset(), "")
  assert_eq(formatter.call(2.0), "")
  assert_true(formatter.as_base_formatter().null_formatter() is None)
  assert_true(formatter.as_base_formatter().fixed_formatter() is None)
  assert_true(formatter.as_base_formatter().func_formatter() is None)
  assert_true(formatter.as_base_formatter().format_str_formatter() is None)
  assert_true(formatter.as_base_formatter().str_method_formatter() is None)
  assert_true(formatter.as_base_formatter().percent_formatter() is None)
}

///|
test "scalar params original constructor rc capture 0" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  @config.set_formatter_use_offset(false)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_text_usetex(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_string("4"))
  @config.set_formatter_limits([
    @bigint.BigInt::from_string("-5"),
    @bigint.BigInt::from_string("6"),
  ])
  let formatter = @ticker.ScalarFormatter::new()
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.get_use_offset(), false)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  let explicit = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(false)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  verify_scalar_param_optional(
    explicit.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(explicit.get_use_offset(), false)
  assert_eq(explicit.get_usetex(), false)
  assert_eq(explicit.get_use_math_text(), false)
  assert_eq(explicit.get_use_locale(), false)
  assert_eq(explicit.scientific(), true)
  assert_eq(explicit.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    explicit.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(explicit.format_pattern(), "")
  verify_scalar_param_limits(explicit.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
}

///|
test "scalar params original constructor rc capture 1" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(true)
  @config.set_formatter_use_locale(true)
  @config.set_text_usetex(true)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_string("-2"))
  @config.set_formatter_limits([
    @bigint.BigInt::from_string("-2"),
    @bigint.BigInt::from_string("3"),
  ])
  let formatter = @ticker.ScalarFormatter::new()
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), true)
  assert_eq(formatter.get_use_math_text(), true)
  assert_eq(formatter.get_use_locale(), true)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("-2"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-2")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("3")),
  ])
  let explicit = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(false)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  verify_scalar_param_optional(
    explicit.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(explicit.get_use_offset(), false)
  assert_eq(explicit.get_usetex(), false)
  assert_eq(explicit.get_use_math_text(), false)
  assert_eq(explicit.get_use_locale(), false)
  assert_eq(explicit.scientific(), true)
  assert_eq(explicit.offset_threshold(), @bigint.BigInt::from_string("-2"))
  verify_scalar_param_number(
    explicit.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(explicit.format_pattern(), "")
  verify_scalar_param_limits(explicit.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-2")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("3")),
  ])
}

///|
test "scalar params original constructor rc capture 2" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  @config.set_formatter_use_offset(false)
  @config.set_formatter_use_math_text(true)
  @config.set_formatter_use_locale(false)
  @config.set_text_usetex(true)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_string("0"))
  @config.set_formatter_limits([
    @bigint.BigInt::from_string("0"),
    @bigint.BigInt::from_string("0"),
  ])
  let formatter = @ticker.ScalarFormatter::new()
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.get_use_offset(), false)
  assert_eq(formatter.get_usetex(), true)
  assert_eq(formatter.get_use_math_text(), true)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("0"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  ])
  let explicit = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(false)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  verify_scalar_param_optional(
    explicit.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(explicit.get_use_offset(), false)
  assert_eq(explicit.get_usetex(), false)
  assert_eq(explicit.get_use_math_text(), false)
  assert_eq(explicit.get_use_locale(), false)
  assert_eq(explicit.scientific(), true)
  assert_eq(explicit.offset_threshold(), @bigint.BigInt::from_string("0"))
  verify_scalar_param_number(
    explicit.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(explicit.format_pattern(), "")
  verify_scalar_param_limits(explicit.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  ])
}

///|
test "scalar params original constructor rc capture 3" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(true)
  @config.set_text_usetex(false)
  @config.set_formatter_offset_threshold(
    @bigint.BigInt::from_string(
      "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
  )
  @config.set_formatter_limits([
    @bigint.BigInt::from_string(
      "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    @bigint.BigInt::from_string(
      "-10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
  ])
  let formatter = @ticker.ScalarFormatter::new()
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), true)
  assert_eq(formatter.scientific(), true)
  assert_eq(
    formatter.offset_threshold(),
    @bigint.BigInt::from_string(
      "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
  )
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(
      @bigint.BigInt::from_string(
        "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
      ),
    ),
    @ticker.ScalarNumber::Integer(
      @bigint.BigInt::from_string(
        "-10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
      ),
    ),
  ])
  let explicit = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(false)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  verify_scalar_param_optional(
    explicit.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(explicit.get_use_offset(), false)
  assert_eq(explicit.get_usetex(), false)
  assert_eq(explicit.get_use_math_text(), false)
  assert_eq(explicit.get_use_locale(), false)
  assert_eq(explicit.scientific(), true)
  assert_eq(
    explicit.offset_threshold(),
    @bigint.BigInt::from_string(
      "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
  )
  verify_scalar_param_number(
    explicit.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(explicit.format_pattern(), "")
  verify_scalar_param_limits(explicit.power_limits(), [
    @ticker.ScalarNumber::Integer(
      @bigint.BigInt::from_string(
        "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
      ),
    ),
    @ticker.ScalarNumber::Integer(
      @bigint.BigInt::from_string(
        "-10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
      ),
    ),
  ])
}

///|
test "scalar params original offset mode 0" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = @ticker.ScalarFormatter::new(
    use_offset=None,
    use_math_text=Some(false),
  )
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  formatter.set_use_offset(None)
  verify_scalar_param_optional(formatter.offset(), None)
  assert_eq(formatter.get_use_offset(), false)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  assert_eq(
    formatter.call_value(@ticker.ScalarNumber::NumpyInt64(9007199254740993L)),
    "",
  )
}

///|
test "scalar params original offset mode 1" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
  )
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  formatter.set_use_offset(Some(@ticker.ScalarNumber::Boolean(true)))
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  assert_eq(
    formatter.call_value(@ticker.ScalarNumber::NumpyInt64(9007199254740993L)),
    "",
  )
}

///|
test "scalar params original offset mode 2" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(false)),
    use_math_text=Some(false),
  )
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.get_use_offset(), false)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  formatter.set_use_offset(Some(@ticker.ScalarNumber::Boolean(false)))
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.get_use_offset(), false)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  assert_eq(
    formatter.call_value(@ticker.ScalarNumber::NumpyInt64(9007199254740993L)),
    "",
  )
}

///|
test "scalar params original offset mode 3" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = @ticker.ScalarFormatter::new(
    use_offset=Some(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
    ),
    use_math_text=Some(false),
  )
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.get_use_offset(), false)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  formatter.set_use_offset(
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.get_use_offset(), false)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  assert_eq(
    formatter.call_value(@ticker.ScalarNumber::NumpyInt64(9007199254740993L)),
    "",
  )
}

///|
test "scalar params original offset mode 4" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = @ticker.ScalarFormatter::new(
    use_offset=Some(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
    ),
    use_math_text=Some(false),
  )
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("1"))),
  )
  assert_eq(formatter.get_use_offset(), false)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  formatter.set_use_offset(
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("1"))),
  )
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("1"))),
  )
  assert_eq(formatter.get_use_offset(), false)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  assert_eq(
    formatter.call_value(@ticker.ScalarNumber::NumpyInt64(9007199254740993L)),
    "",
  )
}

///|
test "scalar params original offset mode 5" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = @ticker.ScalarFormatter::new(
    use_offset=Some(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-1")),
    ),
    use_math_text=Some(false),
  )
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-1"))),
  )
  assert_eq(formatter.get_use_offset(), false)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  formatter.set_use_offset(
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-1"))),
  )
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-1"))),
  )
  assert_eq(formatter.get_use_offset(), false)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  assert_eq(
    formatter.call_value(@ticker.ScalarNumber::NumpyInt64(9007199254740993L)),
    "",
  )
}

///|
test "scalar params original offset mode 6" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = @ticker.ScalarFormatter::new(
    use_offset=Some(
      @ticker.ScalarNumber::Integer(
        @bigint.BigInt::from_string(
          "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
        ),
      ),
    ),
    use_math_text=Some(false),
  )
  verify_scalar_param_optional(
    formatter.offset(),
    Some(
      @ticker.ScalarNumber::Integer(
        @bigint.BigInt::from_string(
          "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
        ),
      ),
    ),
  )
  assert_eq(formatter.get_use_offset(), false)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  formatter.set_use_offset(
    Some(
      @ticker.ScalarNumber::Integer(
        @bigint.BigInt::from_string(
          "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
        ),
      ),
    ),
  )
  verify_scalar_param_optional(
    formatter.offset(),
    Some(
      @ticker.ScalarNumber::Integer(
        @bigint.BigInt::from_string(
          "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
        ),
      ),
    ),
  )
  assert_eq(formatter.get_use_offset(), false)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  assert_eq(
    formatter.call_value(@ticker.ScalarNumber::NumpyInt64(9007199254740993L)),
    "",
  )
}

///|
test "scalar params original offset mode 7" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = @ticker.ScalarFormatter::new(
    use_offset=Some(
      @ticker.ScalarNumber::Integer(
        @bigint.BigInt::from_string(
          "-10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
        ),
      ),
    ),
    use_math_text=Some(false),
  )
  verify_scalar_param_optional(
    formatter.offset(),
    Some(
      @ticker.ScalarNumber::Integer(
        @bigint.BigInt::from_string(
          "-10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
        ),
      ),
    ),
  )
  assert_eq(formatter.get_use_offset(), false)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  formatter.set_use_offset(
    Some(
      @ticker.ScalarNumber::Integer(
        @bigint.BigInt::from_string(
          "-10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
        ),
      ),
    ),
  )
  verify_scalar_param_optional(
    formatter.offset(),
    Some(
      @ticker.ScalarNumber::Integer(
        @bigint.BigInt::from_string(
          "-10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
        ),
      ),
    ),
  )
  assert_eq(formatter.get_use_offset(), false)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  assert_eq(
    formatter.call_value(@ticker.ScalarNumber::NumpyInt64(9007199254740993L)),
    "",
  )
}

///|
test "scalar params original offset mode 8" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Number(-0.0)),
    use_math_text=Some(false),
  )
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Number(-0.0)),
  )
  assert_eq(formatter.get_use_offset(), false)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  formatter.set_use_offset(Some(@ticker.ScalarNumber::Number(-0.0)))
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Number(-0.0)),
  )
  assert_eq(formatter.get_use_offset(), false)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  assert_eq(
    formatter.call_value(@ticker.ScalarNumber::NumpyInt64(9007199254740993L)),
    "",
  )
}

///|
test "scalar params original offset mode 9" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Number(0.0 / 0.0)),
    use_math_text=Some(false),
  )
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Number(0.0 / 0.0)),
  )
  assert_eq(formatter.get_use_offset(), false)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  formatter.set_use_offset(Some(@ticker.ScalarNumber::Number(0.0 / 0.0)))
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Number(0.0 / 0.0)),
  )
  assert_eq(formatter.get_use_offset(), false)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  assert_eq(
    formatter.call_value(@ticker.ScalarNumber::NumpyInt64(9007199254740993L)),
    "",
  )
}

///|
test "scalar params original offset mode 10" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Number(1.0 / 0.0)),
    use_math_text=Some(false),
  )
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Number(1.0 / 0.0)),
  )
  assert_eq(formatter.get_use_offset(), false)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  formatter.set_use_offset(Some(@ticker.ScalarNumber::Number(1.0 / 0.0)))
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Number(1.0 / 0.0)),
  )
  assert_eq(formatter.get_use_offset(), false)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  assert_eq(
    formatter.call_value(@ticker.ScalarNumber::NumpyInt64(9007199254740993L)),
    "",
  )
}

///|
test "scalar params original offset mode 11" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Number(-1.0 / 0.0)),
    use_math_text=Some(false),
  )
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Number(-1.0 / 0.0)),
  )
  assert_eq(formatter.get_use_offset(), false)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  formatter.set_use_offset(Some(@ticker.ScalarNumber::Number(-1.0 / 0.0)))
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Number(-1.0 / 0.0)),
  )
  assert_eq(formatter.get_use_offset(), false)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  assert_eq(
    formatter.call_value(@ticker.ScalarNumber::NumpyInt64(9007199254740993L)),
    "",
  )
}

///|
test "scalar params original offset mode 12" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Number(1.7976931348623157e+308)),
    use_math_text=Some(false),
  )
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Number(1.7976931348623157e+308)),
  )
  assert_eq(formatter.get_use_offset(), false)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  formatter.set_use_offset(
    Some(@ticker.ScalarNumber::Number(1.7976931348623157e+308)),
  )
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Number(1.7976931348623157e+308)),
  )
  assert_eq(formatter.get_use_offset(), false)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  assert_eq(
    formatter.call_value(@ticker.ScalarNumber::NumpyInt64(9007199254740993L)),
    "",
  )
}

///|
test "scalar params original offset mode 13" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::NumpyFloat64(-0.0)),
    use_math_text=Some(false),
  )
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::NumpyFloat64(-0.0)),
  )
  assert_eq(formatter.get_use_offset(), false)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  formatter.set_use_offset(Some(@ticker.ScalarNumber::NumpyFloat64(-0.0)))
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::NumpyFloat64(-0.0)),
  )
  assert_eq(formatter.get_use_offset(), false)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  assert_eq(
    formatter.call_value(@ticker.ScalarNumber::NumpyInt64(9007199254740993L)),
    "",
  )
}

///|
test "scalar params original offset mode 14" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::NumpyFloat64(0.0 / 0.0)),
    use_math_text=Some(false),
  )
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::NumpyFloat64(0.0 / 0.0)),
  )
  assert_eq(formatter.get_use_offset(), false)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  formatter.set_use_offset(Some(@ticker.ScalarNumber::NumpyFloat64(0.0 / 0.0)))
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::NumpyFloat64(0.0 / 0.0)),
  )
  assert_eq(formatter.get_use_offset(), false)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  assert_eq(
    formatter.call_value(@ticker.ScalarNumber::NumpyInt64(9007199254740993L)),
    "",
  )
}

///|
test "scalar params original offset mode 15" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::NumpyFloat64(1.25)),
    use_math_text=Some(false),
  )
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::NumpyFloat64(1.25)),
  )
  assert_eq(formatter.get_use_offset(), false)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  formatter.set_use_offset(Some(@ticker.ScalarNumber::NumpyFloat64(1.25)))
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::NumpyFloat64(1.25)),
  )
  assert_eq(formatter.get_use_offset(), false)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  assert_eq(
    formatter.call_value(@ticker.ScalarNumber::NumpyInt64(9007199254740993L)),
    "",
  )
}

///|
test "scalar params original offset mode 16" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::NumpyInt64(-9223372036854775808L)),
    use_math_text=Some(false),
  )
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::NumpyInt64(-9223372036854775808L)),
  )
  assert_eq(formatter.get_use_offset(), false)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  formatter.set_use_offset(
    Some(@ticker.ScalarNumber::NumpyInt64(-9223372036854775808L)),
  )
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::NumpyInt64(-9223372036854775808L)),
  )
  assert_eq(formatter.get_use_offset(), false)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  assert_eq(
    formatter.call_value(@ticker.ScalarNumber::NumpyInt64(9007199254740993L)),
    "",
  )
}

///|
test "scalar params original offset mode 17" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::NumpyInt64(9007199254740993L)),
    use_math_text=Some(false),
  )
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::NumpyInt64(9007199254740993L)),
  )
  assert_eq(formatter.get_use_offset(), false)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  formatter.set_use_offset(
    Some(@ticker.ScalarNumber::NumpyInt64(9007199254740993L)),
  )
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::NumpyInt64(9007199254740993L)),
  )
  assert_eq(formatter.get_use_offset(), false)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  assert_eq(
    formatter.call_value(@ticker.ScalarNumber::NumpyInt64(9007199254740993L)),
    "",
  )
}

///|
test "scalar params original offset mode 18" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::NumpyBool(true)),
    use_math_text=Some(false),
  )
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::NumpyBool(true)),
  )
  assert_eq(formatter.get_use_offset(), false)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  formatter.set_use_offset(Some(@ticker.ScalarNumber::NumpyBool(true)))
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::NumpyBool(true)),
  )
  assert_eq(formatter.get_use_offset(), false)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  assert_eq(
    formatter.call_value(@ticker.ScalarNumber::NumpyInt64(9007199254740993L)),
    "",
  )
}

///|
test "scalar params original offset mode 19" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::NumpyBool(false)),
    use_math_text=Some(false),
  )
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::NumpyBool(false)),
  )
  assert_eq(formatter.get_use_offset(), false)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  formatter.set_use_offset(Some(@ticker.ScalarNumber::NumpyBool(false)))
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::NumpyBool(false)),
  )
  assert_eq(formatter.get_use_offset(), false)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  assert_eq(
    formatter.call_value(@ticker.ScalarNumber::NumpyInt64(9007199254740993L)),
    "",
  )
}

///|
test "scalar params original captured flag usetex False" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = @ticker.ScalarFormatter::new(use_math_text=Some(false))
  formatter.set_usetex(Some(false))
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  @config.set_text_usetex(true)
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  formatter.set_usetex(None)
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), true)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  @config.set_text_usetex(false)
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), true)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
}

///|
test "scalar params original captured flag usetex True" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = @ticker.ScalarFormatter::new(use_math_text=Some(false))
  formatter.set_usetex(Some(true))
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), true)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  @config.set_text_usetex(true)
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), true)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  formatter.set_usetex(None)
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), true)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  @config.set_text_usetex(false)
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), true)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
}

///|
test "scalar params original captured flag usetex None" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = @ticker.ScalarFormatter::new(use_math_text=Some(false))
  formatter.set_usetex(None)
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  @config.set_text_usetex(true)
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  formatter.set_usetex(None)
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), true)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  @config.set_text_usetex(false)
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), true)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
}

///|
test "scalar params original captured flag use_math_text False" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = @ticker.ScalarFormatter::new(use_math_text=Some(false))
  formatter.set_use_math_text(Some(false))
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  @config.set_formatter_use_math_text(true)
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  formatter.set_use_math_text(None)
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), true)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  @config.set_formatter_use_math_text(false)
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), true)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
}

///|
test "scalar params original captured flag use_math_text True" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = @ticker.ScalarFormatter::new(use_math_text=Some(false))
  formatter.set_use_math_text(Some(true))
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), true)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  @config.set_formatter_use_math_text(true)
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), true)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  formatter.set_use_math_text(None)
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), true)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  @config.set_formatter_use_math_text(false)
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), true)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
}

///|
test "scalar params original captured flag use_math_text None" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = @ticker.ScalarFormatter::new(use_math_text=Some(false))
  formatter.set_use_math_text(None)
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  @config.set_formatter_use_math_text(true)
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  formatter.set_use_math_text(None)
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), true)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  @config.set_formatter_use_math_text(false)
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), true)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
}

///|
test "scalar params original captured flag use_locale False" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = @ticker.ScalarFormatter::new(use_math_text=Some(false))
  formatter.set_use_locale(Some(false))
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  @config.set_formatter_use_locale(true)
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  formatter.set_use_locale(None)
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), true)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  @config.set_formatter_use_locale(false)
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), true)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
}

///|
test "scalar params original captured flag use_locale True" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = @ticker.ScalarFormatter::new(use_math_text=Some(false))
  formatter.set_use_locale(Some(true))
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), true)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  @config.set_formatter_use_locale(true)
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), true)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  formatter.set_use_locale(None)
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), true)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  @config.set_formatter_use_locale(false)
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), true)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
}

///|
test "scalar params original captured flag use_locale None" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = @ticker.ScalarFormatter::new(use_math_text=Some(false))
  formatter.set_use_locale(None)
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  @config.set_formatter_use_locale(true)
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  formatter.set_use_locale(None)
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), true)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  @config.set_formatter_use_locale(false)
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), true)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
}

///|
test "scalar params original raw offset slot 0" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = @ticker.ScalarFormatter::new(use_math_text=Some(false))
  formatter.set_offset(None)
  verify_scalar_param_optional(formatter.offset(), None)
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
}

///|
test "scalar params original raw offset slot 1" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = @ticker.ScalarFormatter::new(use_math_text=Some(false))
  formatter.set_offset(Some(@ticker.ScalarNumber::Boolean(false)))
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
}

///|
test "scalar params original raw offset slot 2" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = @ticker.ScalarFormatter::new(use_math_text=Some(false))
  formatter.set_offset(Some(@ticker.ScalarNumber::Boolean(true)))
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Boolean(true)),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
}

///|
test "scalar params original raw offset slot 3" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = @ticker.ScalarFormatter::new(use_math_text=Some(false))
  formatter.set_offset(Some(@ticker.ScalarNumber::Number(-0.0)))
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Number(-0.0)),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
}

///|
test "scalar params original raw offset slot 4" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = @ticker.ScalarFormatter::new(use_math_text=Some(false))
  formatter.set_offset(Some(@ticker.ScalarNumber::Number(0.0 / 0.0)))
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Number(0.0 / 0.0)),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
}

///|
test "scalar params original raw offset slot 5" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = @ticker.ScalarFormatter::new(use_math_text=Some(false))
  formatter.set_offset(Some(@ticker.ScalarNumber::Number(1.0 / 0.0)))
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Number(1.0 / 0.0)),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
}

///|
test "scalar params original raw offset slot 6" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = @ticker.ScalarFormatter::new(use_math_text=Some(false))
  formatter.set_offset(
    Some(
      @ticker.ScalarNumber::Integer(
        @bigint.BigInt::from_string(
          "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
        ),
      ),
    ),
  )
  verify_scalar_param_optional(
    formatter.offset(),
    Some(
      @ticker.ScalarNumber::Integer(
        @bigint.BigInt::from_string(
          "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
        ),
      ),
    ),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
}

///|
test "scalar params original raw offset slot 7" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = @ticker.ScalarFormatter::new(use_math_text=Some(false))
  formatter.set_offset(Some(@ticker.ScalarNumber::NumpyFloat64(-0.0)))
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::NumpyFloat64(-0.0)),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
}

///|
test "scalar params original raw offset slot 8" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = @ticker.ScalarFormatter::new(use_math_text=Some(false))
  formatter.set_offset(
    Some(@ticker.ScalarNumber::NumpyInt64(9007199254740993L)),
  )
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::NumpyInt64(9007199254740993L)),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
}

///|
test "scalar params original raw offset slot 9" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = @ticker.ScalarFormatter::new(use_math_text=Some(false))
  formatter.set_offset(Some(@ticker.ScalarNumber::NumpyBool(true)))
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::NumpyBool(true)),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
}

///|
test "scalar params original raw cached order 0" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = @ticker.ScalarFormatter::new(use_math_text=Some(false))
  formatter.set_order_of_magnitude(
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  formatter.set_format_pattern("%r")
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "%r")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
}

///|
test "scalar params original raw cached order 1" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = @ticker.ScalarFormatter::new(use_math_text=Some(false))
  formatter.set_order_of_magnitude(
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("2")),
  )
  formatter.set_format_pattern("%r")
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("2")),
  )
  assert_eq(formatter.format_pattern(), "%r")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
}

///|
test "scalar params original raw cached order 2" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = @ticker.ScalarFormatter::new(use_math_text=Some(false))
  formatter.set_order_of_magnitude(@ticker.ScalarNumber::Number(2.5))
  formatter.set_format_pattern("%r")
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Number(2.5),
  )
  assert_eq(formatter.format_pattern(), "%r")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
}

///|
test "scalar params original raw cached order 3" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = @ticker.ScalarFormatter::new(use_math_text=Some(false))
  formatter.set_order_of_magnitude(@ticker.ScalarNumber::Number(-0.0))
  formatter.set_format_pattern("%r")
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Number(-0.0),
  )
  assert_eq(formatter.format_pattern(), "%r")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
}

///|
test "scalar params original raw cached order 4" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = @ticker.ScalarFormatter::new(use_math_text=Some(false))
  formatter.set_order_of_magnitude(@ticker.ScalarNumber::Number(0.0 / 0.0))
  formatter.set_format_pattern("%r")
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Number(0.0 / 0.0),
  )
  assert_eq(formatter.format_pattern(), "%r")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
}

///|
test "scalar params original raw cached order 5" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = @ticker.ScalarFormatter::new(use_math_text=Some(false))
  formatter.set_order_of_magnitude(@ticker.ScalarNumber::Number(1.0 / 0.0))
  formatter.set_format_pattern("%r")
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Number(1.0 / 0.0),
  )
  assert_eq(formatter.format_pattern(), "%r")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
}

///|
test "scalar params original raw cached order 6" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = @ticker.ScalarFormatter::new(use_math_text=Some(false))
  formatter.set_order_of_magnitude(
    @ticker.ScalarNumber::Integer(
      @bigint.BigInt::from_string(
        "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
      ),
    ),
  )
  formatter.set_format_pattern("%r")
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(
      @bigint.BigInt::from_string(
        "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
      ),
    ),
  )
  assert_eq(formatter.format_pattern(), "%r")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
}

///|
test "scalar params original raw cached order 7" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = @ticker.ScalarFormatter::new(use_math_text=Some(false))
  formatter.set_order_of_magnitude(@ticker.ScalarNumber::NumpyFloat64(2.5))
  formatter.set_format_pattern("%r")
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::NumpyFloat64(2.5),
  )
  assert_eq(formatter.format_pattern(), "%r")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
}

///|
test "scalar params original raw cached order 8" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = @ticker.ScalarFormatter::new(use_math_text=Some(false))
  formatter.set_order_of_magnitude(
    @ticker.ScalarNumber::NumpyInt64(9007199254740993L),
  )
  formatter.set_format_pattern("%r")
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::NumpyInt64(9007199254740993L),
  )
  assert_eq(formatter.format_pattern(), "%r")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
}

///|
test "scalar params original raw cached order 9" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = @ticker.ScalarFormatter::new(use_math_text=Some(false))
  formatter.set_order_of_magnitude(@ticker.ScalarNumber::NumpyBool(true))
  formatter.set_format_pattern("%r")
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::NumpyBool(true),
  )
  assert_eq(formatter.format_pattern(), "%r")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
}

///|
test "scalar params original power limits 0" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = @ticker.ScalarFormatter::new(use_math_text=Some(false))
  let limits = []
  let error = try {
    ignore(
      formatter.set_power_limits(@ticker.ScalarPowerLimits::Sequence(limits)),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "ValueError: 'lims' must be a sequence of length 2")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_int(-5)),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_int(6)),
  ])
}

///|
test "scalar params original power limits 1" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = @ticker.ScalarFormatter::new(use_math_text=Some(false))
  let limits = [1.0]
  let error = try {
    ignore(
      formatter.set_power_limits(@ticker.ScalarPowerLimits::Sequence(limits)),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "ValueError: 'lims' must be a sequence of length 2")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_int(-5)),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_int(6)),
  ])
}

///|
test "scalar params original power limits 2" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = @ticker.ScalarFormatter::new(use_math_text=Some(false))
  let limits = [1.0, 2.0, 3.0]
  let error = try {
    ignore(
      formatter.set_power_limits(@ticker.ScalarPowerLimits::Sequence(limits)),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "ValueError: 'lims' must be a sequence of length 2")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_int(-5)),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_int(6)),
  ])
}

///|
test "scalar params original power limits 3" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = @ticker.ScalarFormatter::new(use_math_text=Some(false))
  let limits = [2.5, 2.5]
  formatter.set_power_limits(@ticker.ScalarPowerLimits::Sequence(limits))
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Number(2.5),
    @ticker.ScalarNumber::Number(2.5),
  ])
  match formatter.power_limits() {
    Sequence(retained) => assert_true(physical_equal(retained, limits))
    _ => fail("expected original power limits")
  }
}

///|
test "scalar params original power limits 4" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = @ticker.ScalarFormatter::new(use_math_text=Some(false))
  let limits = [0.0 / 0.0, 1.0 / 0.0]
  formatter.set_power_limits(@ticker.ScalarPowerLimits::Sequence(limits))
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Number(0.0 / 0.0),
    @ticker.ScalarNumber::Number(1.0 / 0.0),
  ])
  match formatter.power_limits() {
    Sequence(retained) => assert_true(physical_equal(retained, limits))
    _ => fail("expected original power limits")
  }
}

///|
test "scalar params original power limits 5" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = @ticker.ScalarFormatter::new(use_math_text=Some(false))
  let limits = [
    @bigint.BigInt::from_string("-5"),
    @bigint.BigInt::from_string("6"),
  ]
  formatter.set_power_limits(@ticker.ScalarPowerLimits::Integers(limits))
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  match formatter.power_limits() {
    Integers(retained) => assert_true(physical_equal(retained, limits))
    _ => fail("expected original power limits")
  }
}

///|
test "scalar params original power limits 6" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = @ticker.ScalarFormatter::new(use_math_text=Some(false))
  let limits = [
    @bigint.BigInt::from_string(
      "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    @bigint.BigInt::from_string(
      "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
  ]
  formatter.set_power_limits(@ticker.ScalarPowerLimits::Integers(limits))
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(
      @bigint.BigInt::from_string(
        "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
      ),
    ),
    @ticker.ScalarNumber::Integer(
      @bigint.BigInt::from_string(
        "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
      ),
    ),
  ])
  match formatter.power_limits() {
    Integers(retained) => assert_true(physical_equal(retained, limits))
    _ => fail("expected original power limits")
  }
}

///|
test "scalar params original power limits 7" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = @ticker.ScalarFormatter::new(use_math_text=Some(false))
  let limits = [
    @ticker.ScalarNumber::NumpyBool(true),
    @ticker.ScalarNumber::NumpyInt64(9007199254740993L),
  ]
  formatter.set_power_limits(@ticker.ScalarPowerLimits::Values(limits))
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::NumpyBool(true),
    @ticker.ScalarNumber::NumpyInt64(9007199254740993L),
  ])
  match formatter.power_limits() {
    Values(retained) => assert_true(physical_equal(retained, limits))
    _ => fail("expected original power limits")
  }
}

///|
test "scalar params original power limits 8" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = @ticker.ScalarFormatter::new(use_math_text=Some(false))
  let limits = [
    @ticker.ScalarNumber::Number(2.5),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("3")),
  ]
  formatter.set_power_limits(@ticker.ScalarPowerLimits::Values(limits))
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Number(2.5),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("3")),
  ])
  match formatter.power_limits() {
    Values(retained) => assert_true(physical_equal(retained, limits))
    _ => fail("expected original power limits")
  }
}

///|
test "scalar params original power limits copy Sequence" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = @ticker.ScalarFormatter::new(use_math_text=Some(false))
  let limits = [-3.0, 4.0]
  formatter.set_power_limits(@ticker.ScalarPowerLimits::Sequence(limits))
  let shallow = formatter.copy()
  limits.push(8.0)
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Number(-3.0),
    @ticker.ScalarNumber::Number(4.0),
    @ticker.ScalarNumber::Number(8.0),
  ])
  verify_scalar_param_optional(
    shallow.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(shallow.get_use_offset(), true)
  assert_eq(shallow.get_usetex(), false)
  assert_eq(shallow.get_use_math_text(), false)
  assert_eq(shallow.get_use_locale(), false)
  assert_eq(shallow.scientific(), true)
  assert_eq(shallow.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    shallow.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(shallow.format_pattern(), "")
  verify_scalar_param_limits(shallow.power_limits(), [
    @ticker.ScalarNumber::Number(-3.0),
    @ticker.ScalarNumber::Number(4.0),
    @ticker.ScalarNumber::Number(8.0),
  ])
  shallow.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(1),
      @bigint.BigInt::from_int(1),
    ]),
  )
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Number(-3.0),
    @ticker.ScalarNumber::Number(4.0),
    @ticker.ScalarNumber::Number(8.0),
  ])
  verify_scalar_param_optional(
    shallow.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(shallow.get_use_offset(), true)
  assert_eq(shallow.get_usetex(), false)
  assert_eq(shallow.get_use_math_text(), false)
  assert_eq(shallow.get_use_locale(), false)
  assert_eq(shallow.scientific(), true)
  assert_eq(shallow.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    shallow.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(shallow.format_pattern(), "")
  verify_scalar_param_limits(shallow.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
  ])
}

///|
test "scalar params original power limits copy Integers" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = @ticker.ScalarFormatter::new(use_math_text=Some(false))
  let limits = [
    @bigint.BigInt::from_string("-3"),
    @bigint.BigInt::from_string("4"),
  ]
  formatter.set_power_limits(@ticker.ScalarPowerLimits::Integers(limits))
  let shallow = formatter.copy()
  limits.push(@bigint.BigInt::from_int(8))
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-3")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("4")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("8")),
  ])
  verify_scalar_param_optional(
    shallow.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(shallow.get_use_offset(), true)
  assert_eq(shallow.get_usetex(), false)
  assert_eq(shallow.get_use_math_text(), false)
  assert_eq(shallow.get_use_locale(), false)
  assert_eq(shallow.scientific(), true)
  assert_eq(shallow.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    shallow.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(shallow.format_pattern(), "")
  verify_scalar_param_limits(shallow.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-3")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("4")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("8")),
  ])
  shallow.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(1),
      @bigint.BigInt::from_int(1),
    ]),
  )
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-3")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("4")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("8")),
  ])
  verify_scalar_param_optional(
    shallow.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(shallow.get_use_offset(), true)
  assert_eq(shallow.get_usetex(), false)
  assert_eq(shallow.get_use_math_text(), false)
  assert_eq(shallow.get_use_locale(), false)
  assert_eq(shallow.scientific(), true)
  assert_eq(shallow.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    shallow.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(shallow.format_pattern(), "")
  verify_scalar_param_limits(shallow.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
  ])
}

///|
test "scalar params original power limits copy Values" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = @ticker.ScalarFormatter::new(use_math_text=Some(false))
  let limits = [
    @ticker.ScalarNumber::NumpyInt64(1L),
    @ticker.ScalarNumber::Number(2.5),
  ]
  formatter.set_power_limits(@ticker.ScalarPowerLimits::Values(limits))
  let shallow = formatter.copy()
  limits.push(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_int(8)))
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::NumpyInt64(1L),
    @ticker.ScalarNumber::Number(2.5),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("8")),
  ])
  verify_scalar_param_optional(
    shallow.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(shallow.get_use_offset(), true)
  assert_eq(shallow.get_usetex(), false)
  assert_eq(shallow.get_use_math_text(), false)
  assert_eq(shallow.get_use_locale(), false)
  assert_eq(shallow.scientific(), true)
  assert_eq(shallow.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    shallow.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(shallow.format_pattern(), "")
  verify_scalar_param_limits(shallow.power_limits(), [
    @ticker.ScalarNumber::NumpyInt64(1L),
    @ticker.ScalarNumber::Number(2.5),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("8")),
  ])
  shallow.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(1),
      @bigint.BigInt::from_int(1),
    ]),
  )
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::NumpyInt64(1L),
    @ticker.ScalarNumber::Number(2.5),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("8")),
  ])
  verify_scalar_param_optional(
    shallow.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(shallow.get_use_offset(), true)
  assert_eq(shallow.get_usetex(), false)
  assert_eq(shallow.get_use_math_text(), false)
  assert_eq(shallow.get_use_locale(), false)
  assert_eq(shallow.scientific(), true)
  assert_eq(shallow.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    shallow.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(shallow.format_pattern(), "")
  verify_scalar_param_limits(shallow.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
  ])
}

///|
test "scalar params original ndarray power limits float64 forward" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let owner = [-0.0, 1.25, 3.5, -7.0]
  let view = @ticker.TickValues::from_array(owner).view(0, 1, 2)
  let formatter = @ticker.ScalarFormatter::new(use_math_text=Some(false))
  formatter.set_power_limits(@ticker.ScalarPowerLimits::NdArray(view))
  let shallow = formatter.copy()
  view.set(-1, 13.0)
  owner[0] = 11.0
  assert_eq(owner, [11.0, 13.0, 3.5, -7.0])
  formatter.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(2),
      @bigint.BigInt::from_int(2),
    ]),
  )
  match shallow.power_limits() {
    NdArray(retained) => assert_true(physical_equal(retained, view))
    _ => fail("expected retained view")
  }
}

///|
test "scalar params original ndarray power limits float64 reverse" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let owner = [-0.0, 1.25, 3.5, -7.0]
  let view = @ticker.TickValues::from_array(owner).view(1, -1, 2)
  let formatter = @ticker.ScalarFormatter::new(use_math_text=Some(false))
  formatter.set_power_limits(@ticker.ScalarPowerLimits::NdArray(view))
  let shallow = formatter.copy()
  view.set(-1, 13.0)
  owner[0] = 11.0
  assert_eq(owner, [11.0, 1.25, 3.5, -7.0])
  formatter.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(2),
      @bigint.BigInt::from_int(2),
    ]),
  )
  match shallow.power_limits() {
    NdArray(retained) => assert_true(physical_equal(retained, view))
    _ => fail("expected retained view")
  }
}

///|
test "scalar params original ndarray power limits float64 nested" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let owner = [-0.0, 1.25, 3.5, -7.0]
  let view = @ticker.TickValues::from_array(owner).view(0, 2, 2).view(1, -1, 2)
  let formatter = @ticker.ScalarFormatter::new(use_math_text=Some(false))
  formatter.set_power_limits(@ticker.ScalarPowerLimits::NdArray(view))
  let shallow = formatter.copy()
  view.set(-1, 13.0)
  owner[0] = 11.0
  assert_eq(owner, [11.0, 1.25, 3.5, -7.0])
  formatter.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(2),
      @bigint.BigInt::from_int(2),
    ]),
  )
  match shallow.power_limits() {
    NdArray(retained) => assert_true(physical_equal(retained, view))
    _ => fail("expected retained view")
  }
}

///|
test "scalar params original ndarray power limits float64 zero" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let owner = [-0.0, 1.25, 3.5, -7.0]
  let view = @ticker.TickValues::from_array(owner).view(1, 0, 2)
  let formatter = @ticker.ScalarFormatter::new(use_math_text=Some(false))
  formatter.set_power_limits(@ticker.ScalarPowerLimits::NdArray(view))
  let shallow = formatter.copy()
  view.set(-1, 13.0)
  owner[0] = 11.0
  assert_eq(owner, [11.0, 13.0, 3.5, -7.0])
  formatter.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(2),
      @bigint.BigInt::from_int(2),
    ]),
  )
  match shallow.power_limits() {
    NdArray(retained) => assert_true(physical_equal(retained, view))
    _ => fail("expected retained view")
  }
}

///|
test "scalar params original ndarray power limits int64 forward" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let owner = [9007199254740993L, -9223372036854775808L, 7L, -1L]
  let view = @ticker.TickValues::from_int64_array(owner).view(0, 1, 2)
  let formatter = @ticker.ScalarFormatter::new(use_math_text=Some(false))
  formatter.set_power_limits(@ticker.ScalarPowerLimits::NdArray(view))
  let shallow = formatter.copy()
  view.set(-1, 13.0)
  owner[0] = 11L
  assert_eq(owner, [11L, 13L, 7L, -1L])
  formatter.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(2),
      @bigint.BigInt::from_int(2),
    ]),
  )
  match shallow.power_limits() {
    NdArray(retained) => assert_true(physical_equal(retained, view))
    _ => fail("expected retained view")
  }
}

///|
test "scalar params original ndarray power limits int64 reverse" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let owner = [9007199254740993L, -9223372036854775808L, 7L, -1L]
  let view = @ticker.TickValues::from_int64_array(owner).view(1, -1, 2)
  let formatter = @ticker.ScalarFormatter::new(use_math_text=Some(false))
  formatter.set_power_limits(@ticker.ScalarPowerLimits::NdArray(view))
  let shallow = formatter.copy()
  view.set(-1, 13.0)
  owner[0] = 11L
  assert_eq(owner, [11L, -9223372036854775808L, 7L, -1L])
  formatter.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(2),
      @bigint.BigInt::from_int(2),
    ]),
  )
  match shallow.power_limits() {
    NdArray(retained) => assert_true(physical_equal(retained, view))
    _ => fail("expected retained view")
  }
}

///|
test "scalar params original ndarray power limits int64 nested" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let owner = [9007199254740993L, -9223372036854775808L, 7L, -1L]
  let view = @ticker.TickValues::from_int64_array(owner)
    .view(0, 2, 2)
    .view(1, -1, 2)
  let formatter = @ticker.ScalarFormatter::new(use_math_text=Some(false))
  formatter.set_power_limits(@ticker.ScalarPowerLimits::NdArray(view))
  let shallow = formatter.copy()
  view.set(-1, 13.0)
  owner[0] = 11L
  assert_eq(owner, [11L, -9223372036854775808L, 7L, -1L])
  formatter.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(2),
      @bigint.BigInt::from_int(2),
    ]),
  )
  match shallow.power_limits() {
    NdArray(retained) => assert_true(physical_equal(retained, view))
    _ => fail("expected retained view")
  }
}

///|
test "scalar params original ndarray power limits int64 zero" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let owner = [9007199254740993L, -9223372036854775808L, 7L, -1L]
  let view = @ticker.TickValues::from_int64_array(owner).view(1, 0, 2)
  let formatter = @ticker.ScalarFormatter::new(use_math_text=Some(false))
  formatter.set_power_limits(@ticker.ScalarPowerLimits::NdArray(view))
  let shallow = formatter.copy()
  view.set(-1, 13.0)
  owner[0] = 11L
  assert_eq(owner, [11L, 13L, 7L, -1L])
  formatter.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(2),
      @bigint.BigInt::from_int(2),
    ]),
  )
  match shallow.power_limits() {
    NdArray(retained) => assert_true(physical_equal(retained, view))
    _ => fail("expected retained view")
  }
}

///|
test "scalar params original rc capture and shallow aliases" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = @ticker.ScalarFormatter::new(use_math_text=Some(false))
  let shallow = formatter.copy()
  let snapshot = @config.rc_params()
  let shared = @config.formatter_limits()
  shared.push(@bigint.BigInt::from_int(8))
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("8")),
  ])
  verify_scalar_param_optional(
    shallow.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(shallow.get_use_offset(), true)
  assert_eq(shallow.get_usetex(), false)
  assert_eq(shallow.get_use_math_text(), false)
  assert_eq(shallow.get_use_locale(), false)
  assert_eq(shallow.scientific(), true)
  assert_eq(shallow.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    shallow.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(shallow.format_pattern(), "")
  verify_scalar_param_limits(shallow.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("8")),
  ])
  assert_true(physical_equal(snapshot.formatter_limits(), shared))
  ignore(shared.pop())
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(2),
    @bigint.BigInt::from_int(2),
  ])
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(7))
  let replacement = @ticker.ScalarFormatter::new(use_math_text=Some(false))
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), false)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(formatter.format_pattern(), "")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  verify_scalar_param_optional(
    replacement.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(replacement.get_use_offset(), true)
  assert_eq(replacement.get_usetex(), false)
  assert_eq(replacement.get_use_math_text(), false)
  assert_eq(replacement.get_use_locale(), false)
  assert_eq(replacement.scientific(), true)
  assert_eq(replacement.offset_threshold(), @bigint.BigInt::from_string("7"))
  verify_scalar_param_number(
    replacement.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(replacement.format_pattern(), "")
  verify_scalar_param_limits(replacement.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("2")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("2")),
  ])
}

///|
test "scalar params original cached fields do not recompute and copies stay independent" {
  let previous = @config.rc_params()
  let previous_limits = @config.formatter_limits().copy()
  defer {
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous_limits)
    @config.set_text_usetex(previous.text_usetex())
    @config.set_unicode_minus(previous.unicode_minus())
  }
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  @config.set_text_usetex(false)
  @config.set_unicode_minus(true)
  let formatter = @ticker.ScalarFormatter::new(use_math_text=Some(false))
  let locations : Array[Double] = []
  formatter.set_locs(locations)
  formatter.create_dummy_axis()
  let shallow = formatter.copy()
  formatter.set_offset(
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_int(17))),
  )
  formatter.set_order_of_magnitude(
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_int(3)),
  )
  formatter.set_format_pattern("%1.2f")
  formatter.set_usetex(Some(true))
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("17"))),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), true)
  assert_eq(formatter.get_use_math_text(), false)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("3")),
  )
  assert_eq(formatter.format_pattern(), "%1.2f")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  formatter.set_use_math_text(Some(true))
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("17"))),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), true)
  assert_eq(formatter.get_use_math_text(), true)
  assert_eq(formatter.get_use_locale(), false)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("3")),
  )
  assert_eq(formatter.format_pattern(), "%1.2f")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  formatter.set_use_locale(Some(true))
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("17"))),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), true)
  assert_eq(formatter.get_use_math_text(), true)
  assert_eq(formatter.get_use_locale(), true)
  assert_eq(formatter.scientific(), true)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("3")),
  )
  assert_eq(formatter.format_pattern(), "%1.2f")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  formatter.set_scientific(false)
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("17"))),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), true)
  assert_eq(formatter.get_use_math_text(), true)
  assert_eq(formatter.get_use_locale(), true)
  assert_eq(formatter.scientific(), false)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("3")),
  )
  assert_eq(formatter.format_pattern(), "%1.2f")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  formatter.set_power_limits(
    @ticker.ScalarPowerLimits::Integers([
      @bigint.BigInt::from_int(2),
      @bigint.BigInt::from_int(2),
    ]),
  )
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("17"))),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), true)
  assert_eq(formatter.get_use_math_text(), true)
  assert_eq(formatter.get_use_locale(), true)
  assert_eq(formatter.scientific(), false)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("3")),
  )
  assert_eq(formatter.format_pattern(), "%1.2f")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("2")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("2")),
  ])
  formatter.set_use_offset(Some(@ticker.ScalarNumber::Boolean(true)))
  verify_scalar_param_optional(
    formatter.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(formatter.get_use_offset(), true)
  assert_eq(formatter.get_usetex(), true)
  assert_eq(formatter.get_use_math_text(), true)
  assert_eq(formatter.get_use_locale(), true)
  assert_eq(formatter.scientific(), false)
  assert_eq(formatter.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    formatter.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("3")),
  )
  assert_eq(formatter.format_pattern(), "%1.2f")
  verify_scalar_param_limits(formatter.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("2")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("2")),
  ])
  verify_scalar_param_optional(
    shallow.offset(),
    Some(@ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0"))),
  )
  assert_eq(shallow.get_use_offset(), true)
  assert_eq(shallow.get_usetex(), false)
  assert_eq(shallow.get_use_math_text(), false)
  assert_eq(shallow.get_use_locale(), false)
  assert_eq(shallow.scientific(), true)
  assert_eq(shallow.offset_threshold(), @bigint.BigInt::from_string("4"))
  verify_scalar_param_number(
    shallow.order_of_magnitude(),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
  )
  assert_eq(shallow.format_pattern(), "")
  verify_scalar_param_limits(shallow.power_limits(), [
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("-5")),
    @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
  ])
  assert_eq(shallow.axis(), formatter.axis())
  locations.push(7.0)
  assert_eq(shallow.locations().get(0), 7.0)
  formatter.set_axis(None)
  assert_true(shallow.axis() is Some(_))
}
