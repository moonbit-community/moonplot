// Complete original scale-default methods and actual ticker constructors.

///|
fn scale_defaults_number(actual : Double, expected : Double) -> Unit raise {
  if expected.is_nan() {
    assert_true(actual.is_nan())
  } else {
    assert_eq(actual.reinterpret_as_uint64(), expected.reinterpret_as_uint64())
  }
}

///|
fn scale_defaults_case_0() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(true)
  @config.set_formatter_use_offset(false)
  @config.set_formatter_use_locale(true)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(true)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(2))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-2),
    @bigint.BigInt::from_int(3),
  ])
  let value = axis()
  value.set_tick_layout(400.0, true)
  value.set_scale(@scale.Scale::Linear)
  {
    let value = value.locator().unwrap().auto_locator().unwrap()
    assert_eq(value.nbins(), @ticker.MaxNBins::Count(9))
    assert_eq(value.steps().to_array(), [
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
    ])
  }
  {
    let value = value.named_formatter().unwrap().scalar_formatter().unwrap()
    assert_eq(value.get_use_offset(), false)
    assert_eq(value.get_use_locale(), true)
    assert_eq(value.get_use_math_text(), false)
    assert_eq(value.get_usetex(), false)
    assert_eq(value.offset_threshold(), @bigint.BigInt::from_string("2"))
    let limits = match value.power_limits() {
      @ticker.ScalarPowerLimits::Integers(values) => values
      _ => abort("integer limits")
    }
    assert_eq(limits, [
      @bigint.BigInt::from_string("-2"),
      @bigint.BigInt::from_string("3"),
    ])
  }
  assert_true(
    value.minor_named_formatter().unwrap().null_formatter() is Some(_),
  )
  let value = value.minor_locator().unwrap().auto_minor_locator().unwrap()
  assert_true(value.ndivs() is None)
}

///|
fn scale_defaults_case_1() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(false)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(true)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  let value = axis()
  value.set_tick_layout(400.0, true)
  value.set_scale(@scale.Scale::Linear)
  {
    let value = value.locator().unwrap().auto_locator().unwrap()
    assert_eq(value.nbins(), @ticker.MaxNBins::Auto)
    assert_eq(value.steps().to_array(), [
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4612811918334230528UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
    ])
  }
  {
    let value = value.named_formatter().unwrap().scalar_formatter().unwrap()
    assert_eq(value.get_use_offset(), true)
    assert_eq(value.get_use_locale(), false)
    assert_eq(value.get_use_math_text(), false)
    assert_eq(value.get_usetex(), false)
    assert_eq(value.offset_threshold(), @bigint.BigInt::from_string("4"))
    let limits = match value.power_limits() {
      @ticker.ScalarPowerLimits::Integers(values) => values
      _ => abort("integer limits")
    }
    assert_eq(limits, [
      @bigint.BigInt::from_string("-5"),
      @bigint.BigInt::from_string("6"),
    ])
  }
  assert_true(
    value.minor_named_formatter().unwrap().null_formatter() is Some(_),
  )
  let value = value.minor_locator().unwrap().auto_minor_locator().unwrap()
  assert_true(value.ndivs() is None)
}

///|
fn scale_defaults_case_2() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(true)
  @config.set_formatter_use_offset(false)
  @config.set_formatter_use_locale(true)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(true, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(2))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-2),
    @bigint.BigInt::from_int(3),
  ])
  let value = axis()
  value.set_tick_layout(400.0, true)
  value.set_scale(@scale.Scale::Linear)
  {
    let value = value.locator().unwrap().auto_locator().unwrap()
    assert_eq(value.nbins(), @ticker.MaxNBins::Count(9))
    assert_eq(value.steps().to_array(), [
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
    ])
  }
  {
    let value = value.named_formatter().unwrap().scalar_formatter().unwrap()
    assert_eq(value.get_use_offset(), false)
    assert_eq(value.get_use_locale(), true)
    assert_eq(value.get_use_math_text(), false)
    assert_eq(value.get_usetex(), false)
    assert_eq(value.offset_threshold(), @bigint.BigInt::from_string("2"))
    let limits = match value.power_limits() {
      @ticker.ScalarPowerLimits::Integers(values) => values
      _ => abort("integer limits")
    }
    assert_eq(limits, [
      @bigint.BigInt::from_string("-2"),
      @bigint.BigInt::from_string("3"),
    ])
  }
  assert_true(
    value.minor_named_formatter().unwrap().null_formatter() is Some(_),
  )
  assert_true(value.minor_locator().unwrap().null_locator() is Some(_))
}

///|
fn scale_defaults_case_3() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(false)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(true, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  let value = axis()
  value.set_tick_layout(400.0, true)
  value.set_scale(@scale.Scale::Linear)
  {
    let value = value.locator().unwrap().auto_locator().unwrap()
    assert_eq(value.nbins(), @ticker.MaxNBins::Auto)
    assert_eq(value.steps().to_array(), [
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4612811918334230528UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
    ])
  }
  {
    let value = value.named_formatter().unwrap().scalar_formatter().unwrap()
    assert_eq(value.get_use_offset(), true)
    assert_eq(value.get_use_locale(), false)
    assert_eq(value.get_use_math_text(), false)
    assert_eq(value.get_usetex(), false)
    assert_eq(value.offset_threshold(), @bigint.BigInt::from_string("4"))
    let limits = match value.power_limits() {
      @ticker.ScalarPowerLimits::Integers(values) => values
      _ => abort("integer limits")
    }
    assert_eq(limits, [
      @bigint.BigInt::from_string("-5"),
      @bigint.BigInt::from_string("6"),
    ])
  }
  assert_true(
    value.minor_named_formatter().unwrap().null_formatter() is Some(_),
  )
  assert_true(value.minor_locator().unwrap().null_locator() is Some(_))
}

///|
fn scale_defaults_case_4() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(true)
  @config.set_formatter_use_offset(false)
  @config.set_formatter_use_locale(true)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(true, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(2))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-2),
    @bigint.BigInt::from_int(3),
  ])
  let value = axis()
  value.set_tick_layout(400.0, false)
  value.set_scale(@scale.Scale::Linear)
  {
    let value = value.locator().unwrap().auto_locator().unwrap()
    assert_eq(value.nbins(), @ticker.MaxNBins::Count(9))
    assert_eq(value.steps().to_array(), [
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
    ])
  }
  {
    let value = value.named_formatter().unwrap().scalar_formatter().unwrap()
    assert_eq(value.get_use_offset(), false)
    assert_eq(value.get_use_locale(), true)
    assert_eq(value.get_use_math_text(), false)
    assert_eq(value.get_usetex(), false)
    assert_eq(value.offset_threshold(), @bigint.BigInt::from_string("2"))
    let limits = match value.power_limits() {
      @ticker.ScalarPowerLimits::Integers(values) => values
      _ => abort("integer limits")
    }
    assert_eq(limits, [
      @bigint.BigInt::from_string("-2"),
      @bigint.BigInt::from_string("3"),
    ])
  }
  assert_true(
    value.minor_named_formatter().unwrap().null_formatter() is Some(_),
  )
  let value = value.minor_locator().unwrap().auto_minor_locator().unwrap()
  assert_true(value.ndivs() is None)
}

///|
fn scale_defaults_case_5() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(false)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(true, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  let value = axis()
  value.set_tick_layout(400.0, false)
  value.set_scale(@scale.Scale::Linear)
  {
    let value = value.locator().unwrap().auto_locator().unwrap()
    assert_eq(value.nbins(), @ticker.MaxNBins::Auto)
    assert_eq(value.steps().to_array(), [
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4612811918334230528UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
    ])
  }
  {
    let value = value.named_formatter().unwrap().scalar_formatter().unwrap()
    assert_eq(value.get_use_offset(), true)
    assert_eq(value.get_use_locale(), false)
    assert_eq(value.get_use_math_text(), false)
    assert_eq(value.get_usetex(), false)
    assert_eq(value.offset_threshold(), @bigint.BigInt::from_string("4"))
    let limits = match value.power_limits() {
      @ticker.ScalarPowerLimits::Integers(values) => values
      _ => abort("integer limits")
    }
    assert_eq(limits, [
      @bigint.BigInt::from_string("-5"),
      @bigint.BigInt::from_string("6"),
    ])
  }
  assert_true(
    value.minor_named_formatter().unwrap().null_formatter() is Some(_),
  )
  let value = value.minor_locator().unwrap().auto_minor_locator().unwrap()
  assert_true(value.ndivs() is None)
}

///|
fn scale_defaults_case_6() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(true)
  @config.set_formatter_use_offset(false)
  @config.set_formatter_use_locale(true)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(true)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(2))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-2),
    @bigint.BigInt::from_int(3),
  ])
  let value = axis()
  value.set_tick_layout(400.0, false)
  value.set_scale(@scale.Scale::Linear)
  {
    let value = value.locator().unwrap().auto_locator().unwrap()
    assert_eq(value.nbins(), @ticker.MaxNBins::Count(9))
    assert_eq(value.steps().to_array(), [
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
    ])
  }
  {
    let value = value.named_formatter().unwrap().scalar_formatter().unwrap()
    assert_eq(value.get_use_offset(), false)
    assert_eq(value.get_use_locale(), true)
    assert_eq(value.get_use_math_text(), false)
    assert_eq(value.get_usetex(), false)
    assert_eq(value.offset_threshold(), @bigint.BigInt::from_string("2"))
    let limits = match value.power_limits() {
      @ticker.ScalarPowerLimits::Integers(values) => values
      _ => abort("integer limits")
    }
    assert_eq(limits, [
      @bigint.BigInt::from_string("-2"),
      @bigint.BigInt::from_string("3"),
    ])
  }
  assert_true(
    value.minor_named_formatter().unwrap().null_formatter() is Some(_),
  )
  assert_true(value.minor_locator().unwrap().null_locator() is Some(_))
}

///|
fn scale_defaults_case_7() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(false)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(true)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  let value = axis()
  value.set_tick_layout(400.0, false)
  value.set_scale(@scale.Scale::Linear)
  {
    let value = value.locator().unwrap().auto_locator().unwrap()
    assert_eq(value.nbins(), @ticker.MaxNBins::Auto)
    assert_eq(value.steps().to_array(), [
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4612811918334230528UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
    ])
  }
  {
    let value = value.named_formatter().unwrap().scalar_formatter().unwrap()
    assert_eq(value.get_use_offset(), true)
    assert_eq(value.get_use_locale(), false)
    assert_eq(value.get_use_math_text(), false)
    assert_eq(value.get_usetex(), false)
    assert_eq(value.offset_threshold(), @bigint.BigInt::from_string("4"))
    let limits = match value.power_limits() {
      @ticker.ScalarPowerLimits::Integers(values) => values
      _ => abort("integer limits")
    }
    assert_eq(limits, [
      @bigint.BigInt::from_string("-5"),
      @bigint.BigInt::from_string("6"),
    ])
  }
  assert_true(
    value.minor_named_formatter().unwrap().null_formatter() is Some(_),
  )
  assert_true(value.minor_locator().unwrap().null_locator() is Some(_))
}

///|
fn scale_defaults_case_8() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(true)
  @config.set_formatter_use_offset(false)
  @config.set_formatter_use_locale(true)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(true)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(2))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-2),
    @bigint.BigInt::from_int(3),
  ])
  let value = axis()
  value.set_tick_layout(400.0, true)
  value.set_scale(@scale.Scale::Log)
  {
    let value = value.locator().unwrap().log_locator().unwrap()
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
    )
    let subs = match value.subs() {
      @ticker.LogSubs::Values(values) => values
      _ => abort("numeric subs")
    }
    assert_eq(subs.to_array(), [4607182418800017408UL.reinterpret_as_double()])
  }
  {
    let value = value
      .named_formatter()
      .unwrap()
      .log_formatter_sci_notation()
      .unwrap()
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.label_only_base(),
      @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
    )
    assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
    let thresholds = match value.minor_thresholds() {
      Some(@ticker.LogMinorThresholds::Tuple(values)) => values
      _ => abort("tuple")
    }
    assert_eq(
      thresholds.get(0),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
      ),
    )
    assert_eq(
      thresholds.get(1),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
      ),
    )
  }
  {
    let value = value.minor_locator().unwrap().log_locator().unwrap()
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
    )
    let subs = match value.subs() {
      @ticker.LogSubs::Text(text) => text
      _ => abort("text subs")
    }
    assert_eq(subs, "auto")
  }
  let value = value
    .minor_named_formatter()
    .unwrap()
    .log_formatter_sci_notation()
    .unwrap()
  scale_defaults_number(
    value.base(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(
    value.label_only_base(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
  let thresholds = match value.minor_thresholds() {
    Some(@ticker.LogMinorThresholds::Tuple(values)) => values
    _ => abort("tuple")
  }
  assert_eq(
    thresholds.get(0),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
    ),
  )
  assert_eq(
    thresholds.get(1),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
    ),
  )
}

///|
fn scale_defaults_case_9() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(false)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(true)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  let value = axis()
  value.set_tick_layout(400.0, true)
  value.set_scale(@scale.Scale::Log)
  {
    let value = value.locator().unwrap().log_locator().unwrap()
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(value.numticks(), @ticker.LogNumTicks::Text("auto"))
    let subs = match value.subs() {
      @ticker.LogSubs::Values(values) => values
      _ => abort("numeric subs")
    }
    assert_eq(subs.to_array(), [4607182418800017408UL.reinterpret_as_double()])
  }
  {
    let value = value
      .named_formatter()
      .unwrap()
      .log_formatter_sci_notation()
      .unwrap()
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.label_only_base(),
      @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
    )
    assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
    let thresholds = match value.minor_thresholds() {
      Some(@ticker.LogMinorThresholds::Tuple(values)) => values
      _ => abort("tuple")
    }
    assert_eq(
      thresholds.get(0),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
      ),
    )
    assert_eq(
      thresholds.get(1),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Number(
          4600877379321698714UL.reinterpret_as_double(),
        ),
      ),
    )
  }
  {
    let value = value.minor_locator().unwrap().log_locator().unwrap()
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(value.numticks(), @ticker.LogNumTicks::Text("auto"))
    let subs = match value.subs() {
      @ticker.LogSubs::Text(text) => text
      _ => abort("text subs")
    }
    assert_eq(subs, "auto")
  }
  let value = value
    .minor_named_formatter()
    .unwrap()
    .log_formatter_sci_notation()
    .unwrap()
  scale_defaults_number(
    value.base(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(
    value.label_only_base(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
  let thresholds = match value.minor_thresholds() {
    Some(@ticker.LogMinorThresholds::Tuple(values)) => values
    _ => abort("tuple")
  }
  assert_eq(
    thresholds.get(0),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
    ),
  )
  assert_eq(
    thresholds.get(1),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Number(
        4600877379321698714UL.reinterpret_as_double(),
      ),
    ),
  )
}

///|
fn scale_defaults_case_10() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(true)
  @config.set_formatter_use_offset(false)
  @config.set_formatter_use_locale(true)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(true, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(2))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-2),
    @bigint.BigInt::from_int(3),
  ])
  let value = axis()
  value.set_tick_layout(400.0, true)
  value.set_scale(@scale.Scale::Log)
  {
    let value = value.locator().unwrap().log_locator().unwrap()
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
    )
    let subs = match value.subs() {
      @ticker.LogSubs::Values(values) => values
      _ => abort("numeric subs")
    }
    assert_eq(subs.to_array(), [4607182418800017408UL.reinterpret_as_double()])
  }
  {
    let value = value
      .named_formatter()
      .unwrap()
      .log_formatter_sci_notation()
      .unwrap()
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.label_only_base(),
      @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
    )
    assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
    let thresholds = match value.minor_thresholds() {
      Some(@ticker.LogMinorThresholds::Tuple(values)) => values
      _ => abort("tuple")
    }
    assert_eq(
      thresholds.get(0),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
      ),
    )
    assert_eq(
      thresholds.get(1),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
      ),
    )
  }
  {
    let value = value.minor_locator().unwrap().log_locator().unwrap()
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
    )
    let subs = match value.subs() {
      @ticker.LogSubs::Text(text) => text
      _ => abort("text subs")
    }
    assert_eq(subs, "auto")
  }
  let value = value
    .minor_named_formatter()
    .unwrap()
    .log_formatter_sci_notation()
    .unwrap()
  scale_defaults_number(
    value.base(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(
    value.label_only_base(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
  let thresholds = match value.minor_thresholds() {
    Some(@ticker.LogMinorThresholds::Tuple(values)) => values
    _ => abort("tuple")
  }
  assert_eq(
    thresholds.get(0),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
    ),
  )
  assert_eq(
    thresholds.get(1),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
    ),
  )
}

///|
fn scale_defaults_case_11() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(false)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(true, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  let value = axis()
  value.set_tick_layout(400.0, true)
  value.set_scale(@scale.Scale::Log)
  {
    let value = value.locator().unwrap().log_locator().unwrap()
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(value.numticks(), @ticker.LogNumTicks::Text("auto"))
    let subs = match value.subs() {
      @ticker.LogSubs::Values(values) => values
      _ => abort("numeric subs")
    }
    assert_eq(subs.to_array(), [4607182418800017408UL.reinterpret_as_double()])
  }
  {
    let value = value
      .named_formatter()
      .unwrap()
      .log_formatter_sci_notation()
      .unwrap()
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.label_only_base(),
      @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
    )
    assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
    let thresholds = match value.minor_thresholds() {
      Some(@ticker.LogMinorThresholds::Tuple(values)) => values
      _ => abort("tuple")
    }
    assert_eq(
      thresholds.get(0),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
      ),
    )
    assert_eq(
      thresholds.get(1),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Number(
          4600877379321698714UL.reinterpret_as_double(),
        ),
      ),
    )
  }
  {
    let value = value.minor_locator().unwrap().log_locator().unwrap()
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(value.numticks(), @ticker.LogNumTicks::Text("auto"))
    let subs = match value.subs() {
      @ticker.LogSubs::Text(text) => text
      _ => abort("text subs")
    }
    assert_eq(subs, "auto")
  }
  let value = value
    .minor_named_formatter()
    .unwrap()
    .log_formatter_sci_notation()
    .unwrap()
  scale_defaults_number(
    value.base(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(
    value.label_only_base(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
  let thresholds = match value.minor_thresholds() {
    Some(@ticker.LogMinorThresholds::Tuple(values)) => values
    _ => abort("tuple")
  }
  assert_eq(
    thresholds.get(0),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
    ),
  )
  assert_eq(
    thresholds.get(1),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Number(
        4600877379321698714UL.reinterpret_as_double(),
      ),
    ),
  )
}

///|
fn scale_defaults_case_12() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(true)
  @config.set_formatter_use_offset(false)
  @config.set_formatter_use_locale(true)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(true, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(2))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-2),
    @bigint.BigInt::from_int(3),
  ])
  let value = axis()
  value.set_tick_layout(400.0, false)
  value.set_scale(@scale.Scale::Log)
  {
    let value = value.locator().unwrap().log_locator().unwrap()
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
    )
    let subs = match value.subs() {
      @ticker.LogSubs::Values(values) => values
      _ => abort("numeric subs")
    }
    assert_eq(subs.to_array(), [4607182418800017408UL.reinterpret_as_double()])
  }
  {
    let value = value
      .named_formatter()
      .unwrap()
      .log_formatter_sci_notation()
      .unwrap()
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.label_only_base(),
      @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
    )
    assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
    let thresholds = match value.minor_thresholds() {
      Some(@ticker.LogMinorThresholds::Tuple(values)) => values
      _ => abort("tuple")
    }
    assert_eq(
      thresholds.get(0),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
      ),
    )
    assert_eq(
      thresholds.get(1),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
      ),
    )
  }
  {
    let value = value.minor_locator().unwrap().log_locator().unwrap()
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
    )
    let subs = match value.subs() {
      @ticker.LogSubs::Text(text) => text
      _ => abort("text subs")
    }
    assert_eq(subs, "auto")
  }
  let value = value
    .minor_named_formatter()
    .unwrap()
    .log_formatter_sci_notation()
    .unwrap()
  scale_defaults_number(
    value.base(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(
    value.label_only_base(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
  let thresholds = match value.minor_thresholds() {
    Some(@ticker.LogMinorThresholds::Tuple(values)) => values
    _ => abort("tuple")
  }
  assert_eq(
    thresholds.get(0),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
    ),
  )
  assert_eq(
    thresholds.get(1),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
    ),
  )
}

///|
fn scale_defaults_case_13() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(false)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(true, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  let value = axis()
  value.set_tick_layout(400.0, false)
  value.set_scale(@scale.Scale::Log)
  {
    let value = value.locator().unwrap().log_locator().unwrap()
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(value.numticks(), @ticker.LogNumTicks::Text("auto"))
    let subs = match value.subs() {
      @ticker.LogSubs::Values(values) => values
      _ => abort("numeric subs")
    }
    assert_eq(subs.to_array(), [4607182418800017408UL.reinterpret_as_double()])
  }
  {
    let value = value
      .named_formatter()
      .unwrap()
      .log_formatter_sci_notation()
      .unwrap()
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.label_only_base(),
      @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
    )
    assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
    let thresholds = match value.minor_thresholds() {
      Some(@ticker.LogMinorThresholds::Tuple(values)) => values
      _ => abort("tuple")
    }
    assert_eq(
      thresholds.get(0),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
      ),
    )
    assert_eq(
      thresholds.get(1),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Number(
          4600877379321698714UL.reinterpret_as_double(),
        ),
      ),
    )
  }
  {
    let value = value.minor_locator().unwrap().log_locator().unwrap()
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(value.numticks(), @ticker.LogNumTicks::Text("auto"))
    let subs = match value.subs() {
      @ticker.LogSubs::Text(text) => text
      _ => abort("text subs")
    }
    assert_eq(subs, "auto")
  }
  let value = value
    .minor_named_formatter()
    .unwrap()
    .log_formatter_sci_notation()
    .unwrap()
  scale_defaults_number(
    value.base(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(
    value.label_only_base(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
  let thresholds = match value.minor_thresholds() {
    Some(@ticker.LogMinorThresholds::Tuple(values)) => values
    _ => abort("tuple")
  }
  assert_eq(
    thresholds.get(0),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
    ),
  )
  assert_eq(
    thresholds.get(1),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Number(
        4600877379321698714UL.reinterpret_as_double(),
      ),
    ),
  )
}

///|
fn scale_defaults_case_14() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(true)
  @config.set_formatter_use_offset(false)
  @config.set_formatter_use_locale(true)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(true)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(2))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-2),
    @bigint.BigInt::from_int(3),
  ])
  let value = axis()
  value.set_tick_layout(400.0, false)
  value.set_scale(@scale.Scale::Log)
  {
    let value = value.locator().unwrap().log_locator().unwrap()
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
    )
    let subs = match value.subs() {
      @ticker.LogSubs::Values(values) => values
      _ => abort("numeric subs")
    }
    assert_eq(subs.to_array(), [4607182418800017408UL.reinterpret_as_double()])
  }
  {
    let value = value
      .named_formatter()
      .unwrap()
      .log_formatter_sci_notation()
      .unwrap()
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.label_only_base(),
      @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
    )
    assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
    let thresholds = match value.minor_thresholds() {
      Some(@ticker.LogMinorThresholds::Tuple(values)) => values
      _ => abort("tuple")
    }
    assert_eq(
      thresholds.get(0),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
      ),
    )
    assert_eq(
      thresholds.get(1),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
      ),
    )
  }
  {
    let value = value.minor_locator().unwrap().log_locator().unwrap()
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
    )
    let subs = match value.subs() {
      @ticker.LogSubs::Text(text) => text
      _ => abort("text subs")
    }
    assert_eq(subs, "auto")
  }
  let value = value
    .minor_named_formatter()
    .unwrap()
    .log_formatter_sci_notation()
    .unwrap()
  scale_defaults_number(
    value.base(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(
    value.label_only_base(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
  let thresholds = match value.minor_thresholds() {
    Some(@ticker.LogMinorThresholds::Tuple(values)) => values
    _ => abort("tuple")
  }
  assert_eq(
    thresholds.get(0),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
    ),
  )
  assert_eq(
    thresholds.get(1),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
    ),
  )
}

///|
fn scale_defaults_case_15() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(false)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(true)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  let value = axis()
  value.set_tick_layout(400.0, false)
  value.set_scale(@scale.Scale::Log)
  {
    let value = value.locator().unwrap().log_locator().unwrap()
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(value.numticks(), @ticker.LogNumTicks::Text("auto"))
    let subs = match value.subs() {
      @ticker.LogSubs::Values(values) => values
      _ => abort("numeric subs")
    }
    assert_eq(subs.to_array(), [4607182418800017408UL.reinterpret_as_double()])
  }
  {
    let value = value
      .named_formatter()
      .unwrap()
      .log_formatter_sci_notation()
      .unwrap()
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.label_only_base(),
      @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
    )
    assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
    let thresholds = match value.minor_thresholds() {
      Some(@ticker.LogMinorThresholds::Tuple(values)) => values
      _ => abort("tuple")
    }
    assert_eq(
      thresholds.get(0),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
      ),
    )
    assert_eq(
      thresholds.get(1),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Number(
          4600877379321698714UL.reinterpret_as_double(),
        ),
      ),
    )
  }
  {
    let value = value.minor_locator().unwrap().log_locator().unwrap()
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(value.numticks(), @ticker.LogNumTicks::Text("auto"))
    let subs = match value.subs() {
      @ticker.LogSubs::Text(text) => text
      _ => abort("text subs")
    }
    assert_eq(subs, "auto")
  }
  let value = value
    .minor_named_formatter()
    .unwrap()
    .log_formatter_sci_notation()
    .unwrap()
  scale_defaults_number(
    value.base(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(
    value.label_only_base(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
  let thresholds = match value.minor_thresholds() {
    Some(@ticker.LogMinorThresholds::Tuple(values)) => values
    _ => abort("tuple")
  }
  assert_eq(
    thresholds.get(0),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
    ),
  )
  assert_eq(
    thresholds.get(1),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Number(
        4600877379321698714UL.reinterpret_as_double(),
      ),
    ),
  )
}

///|
fn scale_defaults_case_16() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(true)
  @config.set_formatter_use_offset(false)
  @config.set_formatter_use_locale(true)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(true)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(2))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-2),
    @bigint.BigInt::from_int(3),
  ])
  let value = axis()
  value.set_tick_layout(400.0, true)
  value.set_scale(
    @scale.Scale::SymLog(
      linthresh=4607182418800017408UL.reinterpret_as_double(),
      linscale=4607182418800017408UL.reinterpret_as_double(),
      base=4621819117588971520UL.reinterpret_as_double(),
    ),
  )
  {
    let value = value.locator().unwrap().symlog_locator().unwrap()
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.linthresh(),
      4607182418800017408UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
    )
    let subs = match value.subs() {
      @ticker.SymLogSubs::Values(values) => values
      _ => abort("values")
    }
    assert_eq(subs.to_array(), [4607182418800017408UL.reinterpret_as_double()])
  }
  {
    let value = value
      .named_formatter()
      .unwrap()
      .log_formatter_sci_notation()
      .unwrap()
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.label_only_base(),
      @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
    )
    assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
    let thresholds = match value.minor_thresholds() {
      Some(@ticker.LogMinorThresholds::Tuple(values)) => values
      _ => abort("tuple")
    }
    assert_eq(
      thresholds.get(0),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
      ),
    )
    assert_eq(
      thresholds.get(1),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
      ),
    )
  }
  {
    let value = value.minor_locator().unwrap().symlog_locator().unwrap()
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.linthresh(),
      4607182418800017408UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
    )
    let subs = match value.subs() {
      @ticker.SymLogSubs::Values(values) => values
      _ => abort("values")
    }
    assert_eq(subs.to_array(), [4607182418800017408UL.reinterpret_as_double()])
  }
  assert_true(
    value.minor_named_formatter().unwrap().null_formatter() is Some(_),
  )
}

///|
fn scale_defaults_case_17() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(false)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(true)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  let value = axis()
  value.set_tick_layout(400.0, true)
  value.set_scale(
    @scale.Scale::SymLog(
      linthresh=4607182418800017408UL.reinterpret_as_double(),
      linscale=4607182418800017408UL.reinterpret_as_double(),
      base=4621819117588971520UL.reinterpret_as_double(),
    ),
  )
  {
    let value = value.locator().unwrap().symlog_locator().unwrap()
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.linthresh(),
      4607182418800017408UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
    )
    let subs = match value.subs() {
      @ticker.SymLogSubs::Values(values) => values
      _ => abort("values")
    }
    assert_eq(subs.to_array(), [4607182418800017408UL.reinterpret_as_double()])
  }
  {
    let value = value
      .named_formatter()
      .unwrap()
      .log_formatter_sci_notation()
      .unwrap()
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.label_only_base(),
      @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
    )
    assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
    let thresholds = match value.minor_thresholds() {
      Some(@ticker.LogMinorThresholds::Tuple(values)) => values
      _ => abort("tuple")
    }
    assert_eq(
      thresholds.get(0),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
      ),
    )
    assert_eq(
      thresholds.get(1),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Number(
          4600877379321698714UL.reinterpret_as_double(),
        ),
      ),
    )
  }
  {
    let value = value.minor_locator().unwrap().symlog_locator().unwrap()
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.linthresh(),
      4607182418800017408UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
    )
    let subs = match value.subs() {
      @ticker.SymLogSubs::Values(values) => values
      _ => abort("values")
    }
    assert_eq(subs.to_array(), [4607182418800017408UL.reinterpret_as_double()])
  }
  assert_true(
    value.minor_named_formatter().unwrap().null_formatter() is Some(_),
  )
}

///|
fn scale_defaults_case_18() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(true)
  @config.set_formatter_use_offset(false)
  @config.set_formatter_use_locale(true)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(true, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(2))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-2),
    @bigint.BigInt::from_int(3),
  ])
  let value = axis()
  value.set_tick_layout(400.0, true)
  value.set_scale(
    @scale.Scale::SymLog(
      linthresh=4607182418800017408UL.reinterpret_as_double(),
      linscale=4607182418800017408UL.reinterpret_as_double(),
      base=4621819117588971520UL.reinterpret_as_double(),
    ),
  )
  {
    let value = value.locator().unwrap().symlog_locator().unwrap()
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.linthresh(),
      4607182418800017408UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
    )
    let subs = match value.subs() {
      @ticker.SymLogSubs::Values(values) => values
      _ => abort("values")
    }
    assert_eq(subs.to_array(), [4607182418800017408UL.reinterpret_as_double()])
  }
  {
    let value = value
      .named_formatter()
      .unwrap()
      .log_formatter_sci_notation()
      .unwrap()
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.label_only_base(),
      @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
    )
    assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
    let thresholds = match value.minor_thresholds() {
      Some(@ticker.LogMinorThresholds::Tuple(values)) => values
      _ => abort("tuple")
    }
    assert_eq(
      thresholds.get(0),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
      ),
    )
    assert_eq(
      thresholds.get(1),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
      ),
    )
  }
  {
    let value = value.minor_locator().unwrap().symlog_locator().unwrap()
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.linthresh(),
      4607182418800017408UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
    )
    let subs = match value.subs() {
      @ticker.SymLogSubs::Values(values) => values
      _ => abort("values")
    }
    assert_eq(subs.to_array(), [4607182418800017408UL.reinterpret_as_double()])
  }
  assert_true(
    value.minor_named_formatter().unwrap().null_formatter() is Some(_),
  )
}

///|
fn scale_defaults_case_19() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(false)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(true, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  let value = axis()
  value.set_tick_layout(400.0, true)
  value.set_scale(
    @scale.Scale::SymLog(
      linthresh=4607182418800017408UL.reinterpret_as_double(),
      linscale=4607182418800017408UL.reinterpret_as_double(),
      base=4621819117588971520UL.reinterpret_as_double(),
    ),
  )
  {
    let value = value.locator().unwrap().symlog_locator().unwrap()
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.linthresh(),
      4607182418800017408UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
    )
    let subs = match value.subs() {
      @ticker.SymLogSubs::Values(values) => values
      _ => abort("values")
    }
    assert_eq(subs.to_array(), [4607182418800017408UL.reinterpret_as_double()])
  }
  {
    let value = value
      .named_formatter()
      .unwrap()
      .log_formatter_sci_notation()
      .unwrap()
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.label_only_base(),
      @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
    )
    assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
    let thresholds = match value.minor_thresholds() {
      Some(@ticker.LogMinorThresholds::Tuple(values)) => values
      _ => abort("tuple")
    }
    assert_eq(
      thresholds.get(0),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
      ),
    )
    assert_eq(
      thresholds.get(1),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Number(
          4600877379321698714UL.reinterpret_as_double(),
        ),
      ),
    )
  }
  {
    let value = value.minor_locator().unwrap().symlog_locator().unwrap()
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.linthresh(),
      4607182418800017408UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
    )
    let subs = match value.subs() {
      @ticker.SymLogSubs::Values(values) => values
      _ => abort("values")
    }
    assert_eq(subs.to_array(), [4607182418800017408UL.reinterpret_as_double()])
  }
  assert_true(
    value.minor_named_formatter().unwrap().null_formatter() is Some(_),
  )
}

///|
fn scale_defaults_case_20() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(true)
  @config.set_formatter_use_offset(false)
  @config.set_formatter_use_locale(true)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(true, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(2))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-2),
    @bigint.BigInt::from_int(3),
  ])
  let value = axis()
  value.set_tick_layout(400.0, false)
  value.set_scale(
    @scale.Scale::SymLog(
      linthresh=4607182418800017408UL.reinterpret_as_double(),
      linscale=4607182418800017408UL.reinterpret_as_double(),
      base=4621819117588971520UL.reinterpret_as_double(),
    ),
  )
  {
    let value = value.locator().unwrap().symlog_locator().unwrap()
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.linthresh(),
      4607182418800017408UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
    )
    let subs = match value.subs() {
      @ticker.SymLogSubs::Values(values) => values
      _ => abort("values")
    }
    assert_eq(subs.to_array(), [4607182418800017408UL.reinterpret_as_double()])
  }
  {
    let value = value
      .named_formatter()
      .unwrap()
      .log_formatter_sci_notation()
      .unwrap()
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.label_only_base(),
      @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
    )
    assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
    let thresholds = match value.minor_thresholds() {
      Some(@ticker.LogMinorThresholds::Tuple(values)) => values
      _ => abort("tuple")
    }
    assert_eq(
      thresholds.get(0),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
      ),
    )
    assert_eq(
      thresholds.get(1),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
      ),
    )
  }
  {
    let value = value.minor_locator().unwrap().symlog_locator().unwrap()
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.linthresh(),
      4607182418800017408UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
    )
    let subs = match value.subs() {
      @ticker.SymLogSubs::Values(values) => values
      _ => abort("values")
    }
    assert_eq(subs.to_array(), [4607182418800017408UL.reinterpret_as_double()])
  }
  assert_true(
    value.minor_named_formatter().unwrap().null_formatter() is Some(_),
  )
}

///|
fn scale_defaults_case_21() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(false)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(true, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  let value = axis()
  value.set_tick_layout(400.0, false)
  value.set_scale(
    @scale.Scale::SymLog(
      linthresh=4607182418800017408UL.reinterpret_as_double(),
      linscale=4607182418800017408UL.reinterpret_as_double(),
      base=4621819117588971520UL.reinterpret_as_double(),
    ),
  )
  {
    let value = value.locator().unwrap().symlog_locator().unwrap()
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.linthresh(),
      4607182418800017408UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
    )
    let subs = match value.subs() {
      @ticker.SymLogSubs::Values(values) => values
      _ => abort("values")
    }
    assert_eq(subs.to_array(), [4607182418800017408UL.reinterpret_as_double()])
  }
  {
    let value = value
      .named_formatter()
      .unwrap()
      .log_formatter_sci_notation()
      .unwrap()
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.label_only_base(),
      @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
    )
    assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
    let thresholds = match value.minor_thresholds() {
      Some(@ticker.LogMinorThresholds::Tuple(values)) => values
      _ => abort("tuple")
    }
    assert_eq(
      thresholds.get(0),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
      ),
    )
    assert_eq(
      thresholds.get(1),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Number(
          4600877379321698714UL.reinterpret_as_double(),
        ),
      ),
    )
  }
  {
    let value = value.minor_locator().unwrap().symlog_locator().unwrap()
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.linthresh(),
      4607182418800017408UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
    )
    let subs = match value.subs() {
      @ticker.SymLogSubs::Values(values) => values
      _ => abort("values")
    }
    assert_eq(subs.to_array(), [4607182418800017408UL.reinterpret_as_double()])
  }
  assert_true(
    value.minor_named_formatter().unwrap().null_formatter() is Some(_),
  )
}

///|
fn scale_defaults_case_22() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(true)
  @config.set_formatter_use_offset(false)
  @config.set_formatter_use_locale(true)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(true)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(2))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-2),
    @bigint.BigInt::from_int(3),
  ])
  let value = axis()
  value.set_tick_layout(400.0, false)
  value.set_scale(
    @scale.Scale::SymLog(
      linthresh=4607182418800017408UL.reinterpret_as_double(),
      linscale=4607182418800017408UL.reinterpret_as_double(),
      base=4621819117588971520UL.reinterpret_as_double(),
    ),
  )
  {
    let value = value.locator().unwrap().symlog_locator().unwrap()
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.linthresh(),
      4607182418800017408UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
    )
    let subs = match value.subs() {
      @ticker.SymLogSubs::Values(values) => values
      _ => abort("values")
    }
    assert_eq(subs.to_array(), [4607182418800017408UL.reinterpret_as_double()])
  }
  {
    let value = value
      .named_formatter()
      .unwrap()
      .log_formatter_sci_notation()
      .unwrap()
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.label_only_base(),
      @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
    )
    assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
    let thresholds = match value.minor_thresholds() {
      Some(@ticker.LogMinorThresholds::Tuple(values)) => values
      _ => abort("tuple")
    }
    assert_eq(
      thresholds.get(0),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
      ),
    )
    assert_eq(
      thresholds.get(1),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
      ),
    )
  }
  {
    let value = value.minor_locator().unwrap().symlog_locator().unwrap()
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.linthresh(),
      4607182418800017408UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
    )
    let subs = match value.subs() {
      @ticker.SymLogSubs::Values(values) => values
      _ => abort("values")
    }
    assert_eq(subs.to_array(), [4607182418800017408UL.reinterpret_as_double()])
  }
  assert_true(
    value.minor_named_formatter().unwrap().null_formatter() is Some(_),
  )
}

///|
fn scale_defaults_case_23() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(false)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(true)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  let value = axis()
  value.set_tick_layout(400.0, false)
  value.set_scale(
    @scale.Scale::SymLog(
      linthresh=4607182418800017408UL.reinterpret_as_double(),
      linscale=4607182418800017408UL.reinterpret_as_double(),
      base=4621819117588971520UL.reinterpret_as_double(),
    ),
  )
  {
    let value = value.locator().unwrap().symlog_locator().unwrap()
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.linthresh(),
      4607182418800017408UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
    )
    let subs = match value.subs() {
      @ticker.SymLogSubs::Values(values) => values
      _ => abort("values")
    }
    assert_eq(subs.to_array(), [4607182418800017408UL.reinterpret_as_double()])
  }
  {
    let value = value
      .named_formatter()
      .unwrap()
      .log_formatter_sci_notation()
      .unwrap()
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.label_only_base(),
      @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
    )
    assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
    let thresholds = match value.minor_thresholds() {
      Some(@ticker.LogMinorThresholds::Tuple(values)) => values
      _ => abort("tuple")
    }
    assert_eq(
      thresholds.get(0),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
      ),
    )
    assert_eq(
      thresholds.get(1),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Number(
          4600877379321698714UL.reinterpret_as_double(),
        ),
      ),
    )
  }
  {
    let value = value.minor_locator().unwrap().symlog_locator().unwrap()
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.linthresh(),
      4607182418800017408UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
    )
    let subs = match value.subs() {
      @ticker.SymLogSubs::Values(values) => values
      _ => abort("values")
    }
    assert_eq(subs.to_array(), [4607182418800017408UL.reinterpret_as_double()])
  }
  assert_true(
    value.minor_named_formatter().unwrap().null_formatter() is Some(_),
  )
}

///|
fn scale_defaults_case_24() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(true)
  @config.set_formatter_use_offset(false)
  @config.set_formatter_use_locale(true)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(true)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(2))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-2),
    @bigint.BigInt::from_int(3),
  ])
  let value = axis()
  value.set_tick_layout(400.0, true)
  value.set_scale(
    @scale.Scale::SymLog(
      linthresh=4611686018427387904UL.reinterpret_as_double(),
      linscale=4602678819172646912UL.reinterpret_as_double(),
      base=4611686018427387904UL.reinterpret_as_double(),
    ),
  )
  {
    let value = value.locator().unwrap().symlog_locator().unwrap()
    scale_defaults_number(
      value.base(),
      4611686018427387904UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.linthresh(),
      4611686018427387904UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
    )
    let subs = match value.subs() {
      @ticker.SymLogSubs::Values(values) => values
      _ => abort("values")
    }
    assert_eq(subs.to_array(), [4607182418800017408UL.reinterpret_as_double()])
  }
  {
    let value = value
      .named_formatter()
      .unwrap()
      .log_formatter_sci_notation()
      .unwrap()
    scale_defaults_number(
      value.base(),
      4611686018427387904UL.reinterpret_as_double(),
    )
    assert_eq(
      value.label_only_base(),
      @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
    )
    assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
    let thresholds = match value.minor_thresholds() {
      Some(@ticker.LogMinorThresholds::Tuple(values)) => values
      _ => abort("tuple")
    }
    assert_eq(
      thresholds.get(0),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
      ),
    )
    assert_eq(
      thresholds.get(1),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
      ),
    )
  }
  {
    let value = value.minor_locator().unwrap().symlog_locator().unwrap()
    scale_defaults_number(
      value.base(),
      4611686018427387904UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.linthresh(),
      4611686018427387904UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
    )
    let subs = match value.subs() {
      @ticker.SymLogSubs::Values(values) => values
      _ => abort("values")
    }
    assert_eq(subs.to_array(), [4607182418800017408UL.reinterpret_as_double()])
  }
  assert_true(
    value.minor_named_formatter().unwrap().null_formatter() is Some(_),
  )
}

///|
fn scale_defaults_case_25() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(false)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(true)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  let value = axis()
  value.set_tick_layout(400.0, true)
  value.set_scale(
    @scale.Scale::SymLog(
      linthresh=4611686018427387904UL.reinterpret_as_double(),
      linscale=4602678819172646912UL.reinterpret_as_double(),
      base=4611686018427387904UL.reinterpret_as_double(),
    ),
  )
  {
    let value = value.locator().unwrap().symlog_locator().unwrap()
    scale_defaults_number(
      value.base(),
      4611686018427387904UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.linthresh(),
      4611686018427387904UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
    )
    let subs = match value.subs() {
      @ticker.SymLogSubs::Values(values) => values
      _ => abort("values")
    }
    assert_eq(subs.to_array(), [4607182418800017408UL.reinterpret_as_double()])
  }
  {
    let value = value
      .named_formatter()
      .unwrap()
      .log_formatter_sci_notation()
      .unwrap()
    scale_defaults_number(
      value.base(),
      4611686018427387904UL.reinterpret_as_double(),
    )
    assert_eq(
      value.label_only_base(),
      @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
    )
    assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
    let thresholds = match value.minor_thresholds() {
      Some(@ticker.LogMinorThresholds::Tuple(values)) => values
      _ => abort("tuple")
    }
    assert_eq(
      thresholds.get(0),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
      ),
    )
    assert_eq(
      thresholds.get(1),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Number(
          4600877379321698714UL.reinterpret_as_double(),
        ),
      ),
    )
  }
  {
    let value = value.minor_locator().unwrap().symlog_locator().unwrap()
    scale_defaults_number(
      value.base(),
      4611686018427387904UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.linthresh(),
      4611686018427387904UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
    )
    let subs = match value.subs() {
      @ticker.SymLogSubs::Values(values) => values
      _ => abort("values")
    }
    assert_eq(subs.to_array(), [4607182418800017408UL.reinterpret_as_double()])
  }
  assert_true(
    value.minor_named_formatter().unwrap().null_formatter() is Some(_),
  )
}

///|
fn scale_defaults_case_26() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(true)
  @config.set_formatter_use_offset(false)
  @config.set_formatter_use_locale(true)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(true, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(2))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-2),
    @bigint.BigInt::from_int(3),
  ])
  let value = axis()
  value.set_tick_layout(400.0, true)
  value.set_scale(
    @scale.Scale::SymLog(
      linthresh=4611686018427387904UL.reinterpret_as_double(),
      linscale=4602678819172646912UL.reinterpret_as_double(),
      base=4611686018427387904UL.reinterpret_as_double(),
    ),
  )
  {
    let value = value.locator().unwrap().symlog_locator().unwrap()
    scale_defaults_number(
      value.base(),
      4611686018427387904UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.linthresh(),
      4611686018427387904UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
    )
    let subs = match value.subs() {
      @ticker.SymLogSubs::Values(values) => values
      _ => abort("values")
    }
    assert_eq(subs.to_array(), [4607182418800017408UL.reinterpret_as_double()])
  }
  {
    let value = value
      .named_formatter()
      .unwrap()
      .log_formatter_sci_notation()
      .unwrap()
    scale_defaults_number(
      value.base(),
      4611686018427387904UL.reinterpret_as_double(),
    )
    assert_eq(
      value.label_only_base(),
      @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
    )
    assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
    let thresholds = match value.minor_thresholds() {
      Some(@ticker.LogMinorThresholds::Tuple(values)) => values
      _ => abort("tuple")
    }
    assert_eq(
      thresholds.get(0),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
      ),
    )
    assert_eq(
      thresholds.get(1),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
      ),
    )
  }
  {
    let value = value.minor_locator().unwrap().symlog_locator().unwrap()
    scale_defaults_number(
      value.base(),
      4611686018427387904UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.linthresh(),
      4611686018427387904UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
    )
    let subs = match value.subs() {
      @ticker.SymLogSubs::Values(values) => values
      _ => abort("values")
    }
    assert_eq(subs.to_array(), [4607182418800017408UL.reinterpret_as_double()])
  }
  assert_true(
    value.minor_named_formatter().unwrap().null_formatter() is Some(_),
  )
}

///|
fn scale_defaults_case_27() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(false)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(true, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  let value = axis()
  value.set_tick_layout(400.0, true)
  value.set_scale(
    @scale.Scale::SymLog(
      linthresh=4611686018427387904UL.reinterpret_as_double(),
      linscale=4602678819172646912UL.reinterpret_as_double(),
      base=4611686018427387904UL.reinterpret_as_double(),
    ),
  )
  {
    let value = value.locator().unwrap().symlog_locator().unwrap()
    scale_defaults_number(
      value.base(),
      4611686018427387904UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.linthresh(),
      4611686018427387904UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
    )
    let subs = match value.subs() {
      @ticker.SymLogSubs::Values(values) => values
      _ => abort("values")
    }
    assert_eq(subs.to_array(), [4607182418800017408UL.reinterpret_as_double()])
  }
  {
    let value = value
      .named_formatter()
      .unwrap()
      .log_formatter_sci_notation()
      .unwrap()
    scale_defaults_number(
      value.base(),
      4611686018427387904UL.reinterpret_as_double(),
    )
    assert_eq(
      value.label_only_base(),
      @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
    )
    assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
    let thresholds = match value.minor_thresholds() {
      Some(@ticker.LogMinorThresholds::Tuple(values)) => values
      _ => abort("tuple")
    }
    assert_eq(
      thresholds.get(0),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
      ),
    )
    assert_eq(
      thresholds.get(1),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Number(
          4600877379321698714UL.reinterpret_as_double(),
        ),
      ),
    )
  }
  {
    let value = value.minor_locator().unwrap().symlog_locator().unwrap()
    scale_defaults_number(
      value.base(),
      4611686018427387904UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.linthresh(),
      4611686018427387904UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
    )
    let subs = match value.subs() {
      @ticker.SymLogSubs::Values(values) => values
      _ => abort("values")
    }
    assert_eq(subs.to_array(), [4607182418800017408UL.reinterpret_as_double()])
  }
  assert_true(
    value.minor_named_formatter().unwrap().null_formatter() is Some(_),
  )
}

///|
fn scale_defaults_case_28() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(true)
  @config.set_formatter_use_offset(false)
  @config.set_formatter_use_locale(true)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(true, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(2))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-2),
    @bigint.BigInt::from_int(3),
  ])
  let value = axis()
  value.set_tick_layout(400.0, false)
  value.set_scale(
    @scale.Scale::SymLog(
      linthresh=4611686018427387904UL.reinterpret_as_double(),
      linscale=4602678819172646912UL.reinterpret_as_double(),
      base=4611686018427387904UL.reinterpret_as_double(),
    ),
  )
  {
    let value = value.locator().unwrap().symlog_locator().unwrap()
    scale_defaults_number(
      value.base(),
      4611686018427387904UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.linthresh(),
      4611686018427387904UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
    )
    let subs = match value.subs() {
      @ticker.SymLogSubs::Values(values) => values
      _ => abort("values")
    }
    assert_eq(subs.to_array(), [4607182418800017408UL.reinterpret_as_double()])
  }
  {
    let value = value
      .named_formatter()
      .unwrap()
      .log_formatter_sci_notation()
      .unwrap()
    scale_defaults_number(
      value.base(),
      4611686018427387904UL.reinterpret_as_double(),
    )
    assert_eq(
      value.label_only_base(),
      @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
    )
    assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
    let thresholds = match value.minor_thresholds() {
      Some(@ticker.LogMinorThresholds::Tuple(values)) => values
      _ => abort("tuple")
    }
    assert_eq(
      thresholds.get(0),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
      ),
    )
    assert_eq(
      thresholds.get(1),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
      ),
    )
  }
  {
    let value = value.minor_locator().unwrap().symlog_locator().unwrap()
    scale_defaults_number(
      value.base(),
      4611686018427387904UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.linthresh(),
      4611686018427387904UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
    )
    let subs = match value.subs() {
      @ticker.SymLogSubs::Values(values) => values
      _ => abort("values")
    }
    assert_eq(subs.to_array(), [4607182418800017408UL.reinterpret_as_double()])
  }
  assert_true(
    value.minor_named_formatter().unwrap().null_formatter() is Some(_),
  )
}

///|
fn scale_defaults_case_29() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(false)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(true, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  let value = axis()
  value.set_tick_layout(400.0, false)
  value.set_scale(
    @scale.Scale::SymLog(
      linthresh=4611686018427387904UL.reinterpret_as_double(),
      linscale=4602678819172646912UL.reinterpret_as_double(),
      base=4611686018427387904UL.reinterpret_as_double(),
    ),
  )
  {
    let value = value.locator().unwrap().symlog_locator().unwrap()
    scale_defaults_number(
      value.base(),
      4611686018427387904UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.linthresh(),
      4611686018427387904UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
    )
    let subs = match value.subs() {
      @ticker.SymLogSubs::Values(values) => values
      _ => abort("values")
    }
    assert_eq(subs.to_array(), [4607182418800017408UL.reinterpret_as_double()])
  }
  {
    let value = value
      .named_formatter()
      .unwrap()
      .log_formatter_sci_notation()
      .unwrap()
    scale_defaults_number(
      value.base(),
      4611686018427387904UL.reinterpret_as_double(),
    )
    assert_eq(
      value.label_only_base(),
      @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
    )
    assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
    let thresholds = match value.minor_thresholds() {
      Some(@ticker.LogMinorThresholds::Tuple(values)) => values
      _ => abort("tuple")
    }
    assert_eq(
      thresholds.get(0),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
      ),
    )
    assert_eq(
      thresholds.get(1),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Number(
          4600877379321698714UL.reinterpret_as_double(),
        ),
      ),
    )
  }
  {
    let value = value.minor_locator().unwrap().symlog_locator().unwrap()
    scale_defaults_number(
      value.base(),
      4611686018427387904UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.linthresh(),
      4611686018427387904UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
    )
    let subs = match value.subs() {
      @ticker.SymLogSubs::Values(values) => values
      _ => abort("values")
    }
    assert_eq(subs.to_array(), [4607182418800017408UL.reinterpret_as_double()])
  }
  assert_true(
    value.minor_named_formatter().unwrap().null_formatter() is Some(_),
  )
}

///|
fn scale_defaults_case_30() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(true)
  @config.set_formatter_use_offset(false)
  @config.set_formatter_use_locale(true)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(true)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(2))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-2),
    @bigint.BigInt::from_int(3),
  ])
  let value = axis()
  value.set_tick_layout(400.0, false)
  value.set_scale(
    @scale.Scale::SymLog(
      linthresh=4611686018427387904UL.reinterpret_as_double(),
      linscale=4602678819172646912UL.reinterpret_as_double(),
      base=4611686018427387904UL.reinterpret_as_double(),
    ),
  )
  {
    let value = value.locator().unwrap().symlog_locator().unwrap()
    scale_defaults_number(
      value.base(),
      4611686018427387904UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.linthresh(),
      4611686018427387904UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
    )
    let subs = match value.subs() {
      @ticker.SymLogSubs::Values(values) => values
      _ => abort("values")
    }
    assert_eq(subs.to_array(), [4607182418800017408UL.reinterpret_as_double()])
  }
  {
    let value = value
      .named_formatter()
      .unwrap()
      .log_formatter_sci_notation()
      .unwrap()
    scale_defaults_number(
      value.base(),
      4611686018427387904UL.reinterpret_as_double(),
    )
    assert_eq(
      value.label_only_base(),
      @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
    )
    assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
    let thresholds = match value.minor_thresholds() {
      Some(@ticker.LogMinorThresholds::Tuple(values)) => values
      _ => abort("tuple")
    }
    assert_eq(
      thresholds.get(0),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
      ),
    )
    assert_eq(
      thresholds.get(1),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
      ),
    )
  }
  {
    let value = value.minor_locator().unwrap().symlog_locator().unwrap()
    scale_defaults_number(
      value.base(),
      4611686018427387904UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.linthresh(),
      4611686018427387904UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
    )
    let subs = match value.subs() {
      @ticker.SymLogSubs::Values(values) => values
      _ => abort("values")
    }
    assert_eq(subs.to_array(), [4607182418800017408UL.reinterpret_as_double()])
  }
  assert_true(
    value.minor_named_formatter().unwrap().null_formatter() is Some(_),
  )
}

///|
fn scale_defaults_case_31() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(false)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(true)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  let value = axis()
  value.set_tick_layout(400.0, false)
  value.set_scale(
    @scale.Scale::SymLog(
      linthresh=4611686018427387904UL.reinterpret_as_double(),
      linscale=4602678819172646912UL.reinterpret_as_double(),
      base=4611686018427387904UL.reinterpret_as_double(),
    ),
  )
  {
    let value = value.locator().unwrap().symlog_locator().unwrap()
    scale_defaults_number(
      value.base(),
      4611686018427387904UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.linthresh(),
      4611686018427387904UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
    )
    let subs = match value.subs() {
      @ticker.SymLogSubs::Values(values) => values
      _ => abort("values")
    }
    assert_eq(subs.to_array(), [4607182418800017408UL.reinterpret_as_double()])
  }
  {
    let value = value
      .named_formatter()
      .unwrap()
      .log_formatter_sci_notation()
      .unwrap()
    scale_defaults_number(
      value.base(),
      4611686018427387904UL.reinterpret_as_double(),
    )
    assert_eq(
      value.label_only_base(),
      @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
    )
    assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
    let thresholds = match value.minor_thresholds() {
      Some(@ticker.LogMinorThresholds::Tuple(values)) => values
      _ => abort("tuple")
    }
    assert_eq(
      thresholds.get(0),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
      ),
    )
    assert_eq(
      thresholds.get(1),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Number(
          4600877379321698714UL.reinterpret_as_double(),
        ),
      ),
    )
  }
  {
    let value = value.minor_locator().unwrap().symlog_locator().unwrap()
    scale_defaults_number(
      value.base(),
      4611686018427387904UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.linthresh(),
      4611686018427387904UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
    )
    let subs = match value.subs() {
      @ticker.SymLogSubs::Values(values) => values
      _ => abort("values")
    }
    assert_eq(subs.to_array(), [4607182418800017408UL.reinterpret_as_double()])
  }
  assert_true(
    value.minor_named_formatter().unwrap().null_formatter() is Some(_),
  )
}

///|
fn scale_defaults_case_32() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(true)
  @config.set_formatter_use_offset(false)
  @config.set_formatter_use_locale(true)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(true)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(2))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-2),
    @bigint.BigInt::from_int(3),
  ])
  let value = axis()
  value.set_tick_layout(400.0, true)
  value.set_scale(
    @scale.Scale::Asinh(
      linear_width=4602678819172646912UL.reinterpret_as_double(),
    ),
  )
  {
    let value = value.locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      4602678819172646912UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    assert_true(value.subs() is None)
  }
  {
    let value = value.minor_locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      4602678819172646912UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    let subs = match value.subs() {
      Some(@ticker.AsinhSubs::Tuple(values)) => values
      _ => abort("immutable tuple")
    }
    assert_eq(subs.length(), 2)
    assert_eq(subs.values(), [
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ])
    assert_eq(subs, @ticker.asinh_default_minor_subs())
  }
  assert_true(
    value.minor_named_formatter().unwrap().null_formatter() is Some(_),
  )
  let value = value
    .named_formatter()
    .unwrap()
    .log_formatter_sci_notation()
    .unwrap()
  scale_defaults_number(
    value.base(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(
    value.label_only_base(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
  let thresholds = match value.minor_thresholds() {
    Some(@ticker.LogMinorThresholds::Tuple(values)) => values
    _ => abort("tuple")
  }
  assert_eq(
    thresholds.get(0),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
    ),
  )
  assert_eq(
    thresholds.get(1),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
    ),
  )
}

///|
fn scale_defaults_case_33() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(false)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(true)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  let value = axis()
  value.set_tick_layout(400.0, true)
  value.set_scale(
    @scale.Scale::Asinh(
      linear_width=4602678819172646912UL.reinterpret_as_double(),
    ),
  )
  {
    let value = value.locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      4602678819172646912UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    assert_true(value.subs() is None)
  }
  {
    let value = value.minor_locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      4602678819172646912UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    let subs = match value.subs() {
      Some(@ticker.AsinhSubs::Tuple(values)) => values
      _ => abort("immutable tuple")
    }
    assert_eq(subs.length(), 2)
    assert_eq(subs.values(), [
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ])
    assert_eq(subs, @ticker.asinh_default_minor_subs())
  }
  assert_true(
    value.minor_named_formatter().unwrap().null_formatter() is Some(_),
  )
  let value = value
    .named_formatter()
    .unwrap()
    .log_formatter_sci_notation()
    .unwrap()
  scale_defaults_number(
    value.base(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(
    value.label_only_base(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
  let thresholds = match value.minor_thresholds() {
    Some(@ticker.LogMinorThresholds::Tuple(values)) => values
    _ => abort("tuple")
  }
  assert_eq(
    thresholds.get(0),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
    ),
  )
  assert_eq(
    thresholds.get(1),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Number(
        4600877379321698714UL.reinterpret_as_double(),
      ),
    ),
  )
}

///|
fn scale_defaults_case_34() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(true)
  @config.set_formatter_use_offset(false)
  @config.set_formatter_use_locale(true)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(true, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(2))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-2),
    @bigint.BigInt::from_int(3),
  ])
  let value = axis()
  value.set_tick_layout(400.0, true)
  value.set_scale(
    @scale.Scale::Asinh(
      linear_width=4602678819172646912UL.reinterpret_as_double(),
    ),
  )
  {
    let value = value.locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      4602678819172646912UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    assert_true(value.subs() is None)
  }
  {
    let value = value.minor_locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      4602678819172646912UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    let subs = match value.subs() {
      Some(@ticker.AsinhSubs::Tuple(values)) => values
      _ => abort("immutable tuple")
    }
    assert_eq(subs.length(), 2)
    assert_eq(subs.values(), [
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ])
    assert_eq(subs, @ticker.asinh_default_minor_subs())
  }
  assert_true(
    value.minor_named_formatter().unwrap().null_formatter() is Some(_),
  )
  let value = value
    .named_formatter()
    .unwrap()
    .log_formatter_sci_notation()
    .unwrap()
  scale_defaults_number(
    value.base(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(
    value.label_only_base(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
  let thresholds = match value.minor_thresholds() {
    Some(@ticker.LogMinorThresholds::Tuple(values)) => values
    _ => abort("tuple")
  }
  assert_eq(
    thresholds.get(0),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
    ),
  )
  assert_eq(
    thresholds.get(1),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
    ),
  )
}

///|
fn scale_defaults_case_35() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(false)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(true, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  let value = axis()
  value.set_tick_layout(400.0, true)
  value.set_scale(
    @scale.Scale::Asinh(
      linear_width=4602678819172646912UL.reinterpret_as_double(),
    ),
  )
  {
    let value = value.locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      4602678819172646912UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    assert_true(value.subs() is None)
  }
  {
    let value = value.minor_locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      4602678819172646912UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    let subs = match value.subs() {
      Some(@ticker.AsinhSubs::Tuple(values)) => values
      _ => abort("immutable tuple")
    }
    assert_eq(subs.length(), 2)
    assert_eq(subs.values(), [
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ])
    assert_eq(subs, @ticker.asinh_default_minor_subs())
  }
  assert_true(
    value.minor_named_formatter().unwrap().null_formatter() is Some(_),
  )
  let value = value
    .named_formatter()
    .unwrap()
    .log_formatter_sci_notation()
    .unwrap()
  scale_defaults_number(
    value.base(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(
    value.label_only_base(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
  let thresholds = match value.minor_thresholds() {
    Some(@ticker.LogMinorThresholds::Tuple(values)) => values
    _ => abort("tuple")
  }
  assert_eq(
    thresholds.get(0),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
    ),
  )
  assert_eq(
    thresholds.get(1),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Number(
        4600877379321698714UL.reinterpret_as_double(),
      ),
    ),
  )
}

///|
fn scale_defaults_case_36() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(true)
  @config.set_formatter_use_offset(false)
  @config.set_formatter_use_locale(true)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(true, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(2))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-2),
    @bigint.BigInt::from_int(3),
  ])
  let value = axis()
  value.set_tick_layout(400.0, false)
  value.set_scale(
    @scale.Scale::Asinh(
      linear_width=4602678819172646912UL.reinterpret_as_double(),
    ),
  )
  {
    let value = value.locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      4602678819172646912UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    assert_true(value.subs() is None)
  }
  {
    let value = value.minor_locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      4602678819172646912UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    let subs = match value.subs() {
      Some(@ticker.AsinhSubs::Tuple(values)) => values
      _ => abort("immutable tuple")
    }
    assert_eq(subs.length(), 2)
    assert_eq(subs.values(), [
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ])
    assert_eq(subs, @ticker.asinh_default_minor_subs())
  }
  assert_true(
    value.minor_named_formatter().unwrap().null_formatter() is Some(_),
  )
  let value = value
    .named_formatter()
    .unwrap()
    .log_formatter_sci_notation()
    .unwrap()
  scale_defaults_number(
    value.base(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(
    value.label_only_base(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
  let thresholds = match value.minor_thresholds() {
    Some(@ticker.LogMinorThresholds::Tuple(values)) => values
    _ => abort("tuple")
  }
  assert_eq(
    thresholds.get(0),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
    ),
  )
  assert_eq(
    thresholds.get(1),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
    ),
  )
}

///|
fn scale_defaults_case_37() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(false)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(true, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  let value = axis()
  value.set_tick_layout(400.0, false)
  value.set_scale(
    @scale.Scale::Asinh(
      linear_width=4602678819172646912UL.reinterpret_as_double(),
    ),
  )
  {
    let value = value.locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      4602678819172646912UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    assert_true(value.subs() is None)
  }
  {
    let value = value.minor_locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      4602678819172646912UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    let subs = match value.subs() {
      Some(@ticker.AsinhSubs::Tuple(values)) => values
      _ => abort("immutable tuple")
    }
    assert_eq(subs.length(), 2)
    assert_eq(subs.values(), [
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ])
    assert_eq(subs, @ticker.asinh_default_minor_subs())
  }
  assert_true(
    value.minor_named_formatter().unwrap().null_formatter() is Some(_),
  )
  let value = value
    .named_formatter()
    .unwrap()
    .log_formatter_sci_notation()
    .unwrap()
  scale_defaults_number(
    value.base(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(
    value.label_only_base(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
  let thresholds = match value.minor_thresholds() {
    Some(@ticker.LogMinorThresholds::Tuple(values)) => values
    _ => abort("tuple")
  }
  assert_eq(
    thresholds.get(0),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
    ),
  )
  assert_eq(
    thresholds.get(1),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Number(
        4600877379321698714UL.reinterpret_as_double(),
      ),
    ),
  )
}

///|
fn scale_defaults_case_38() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(true)
  @config.set_formatter_use_offset(false)
  @config.set_formatter_use_locale(true)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(true)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(2))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-2),
    @bigint.BigInt::from_int(3),
  ])
  let value = axis()
  value.set_tick_layout(400.0, false)
  value.set_scale(
    @scale.Scale::Asinh(
      linear_width=4602678819172646912UL.reinterpret_as_double(),
    ),
  )
  {
    let value = value.locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      4602678819172646912UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    assert_true(value.subs() is None)
  }
  {
    let value = value.minor_locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      4602678819172646912UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    let subs = match value.subs() {
      Some(@ticker.AsinhSubs::Tuple(values)) => values
      _ => abort("immutable tuple")
    }
    assert_eq(subs.length(), 2)
    assert_eq(subs.values(), [
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ])
    assert_eq(subs, @ticker.asinh_default_minor_subs())
  }
  assert_true(
    value.minor_named_formatter().unwrap().null_formatter() is Some(_),
  )
  let value = value
    .named_formatter()
    .unwrap()
    .log_formatter_sci_notation()
    .unwrap()
  scale_defaults_number(
    value.base(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(
    value.label_only_base(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
  let thresholds = match value.minor_thresholds() {
    Some(@ticker.LogMinorThresholds::Tuple(values)) => values
    _ => abort("tuple")
  }
  assert_eq(
    thresholds.get(0),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
    ),
  )
  assert_eq(
    thresholds.get(1),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
    ),
  )
}

///|
fn scale_defaults_case_39() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(false)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(true)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  let value = axis()
  value.set_tick_layout(400.0, false)
  value.set_scale(
    @scale.Scale::Asinh(
      linear_width=4602678819172646912UL.reinterpret_as_double(),
    ),
  )
  {
    let value = value.locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      4602678819172646912UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    assert_true(value.subs() is None)
  }
  {
    let value = value.minor_locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      4602678819172646912UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    let subs = match value.subs() {
      Some(@ticker.AsinhSubs::Tuple(values)) => values
      _ => abort("immutable tuple")
    }
    assert_eq(subs.length(), 2)
    assert_eq(subs.values(), [
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ])
    assert_eq(subs, @ticker.asinh_default_minor_subs())
  }
  assert_true(
    value.minor_named_formatter().unwrap().null_formatter() is Some(_),
  )
  let value = value
    .named_formatter()
    .unwrap()
    .log_formatter_sci_notation()
    .unwrap()
  scale_defaults_number(
    value.base(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(
    value.label_only_base(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
  let thresholds = match value.minor_thresholds() {
    Some(@ticker.LogMinorThresholds::Tuple(values)) => values
    _ => abort("tuple")
  }
  assert_eq(
    thresholds.get(0),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
    ),
  )
  assert_eq(
    thresholds.get(1),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Number(
        4600877379321698714UL.reinterpret_as_double(),
      ),
    ),
  )
}

///|
fn scale_defaults_case_40() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(true)
  @config.set_formatter_use_offset(false)
  @config.set_formatter_use_locale(true)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(true)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(2))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-2),
    @bigint.BigInt::from_int(3),
  ])
  let value = axis()
  value.set_tick_layout(400.0, true)
  value.set_scale(
    @scale.Scale::Asinh(
      linear_width=4607182418800017408UL.reinterpret_as_double(),
    ),
  )
  {
    let value = value.locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      4607182418800017408UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    assert_true(value.subs() is None)
  }
  {
    let value = value.minor_locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      4607182418800017408UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    let subs = match value.subs() {
      Some(@ticker.AsinhSubs::Tuple(values)) => values
      _ => abort("immutable tuple")
    }
    assert_eq(subs.length(), 2)
    assert_eq(subs.values(), [
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ])
    assert_eq(subs, @ticker.asinh_default_minor_subs())
  }
  assert_true(
    value.minor_named_formatter().unwrap().null_formatter() is Some(_),
  )
  let value = value
    .named_formatter()
    .unwrap()
    .log_formatter_sci_notation()
    .unwrap()
  scale_defaults_number(
    value.base(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(
    value.label_only_base(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
  let thresholds = match value.minor_thresholds() {
    Some(@ticker.LogMinorThresholds::Tuple(values)) => values
    _ => abort("tuple")
  }
  assert_eq(
    thresholds.get(0),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
    ),
  )
  assert_eq(
    thresholds.get(1),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
    ),
  )
}

///|
fn scale_defaults_case_41() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(false)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(true)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  let value = axis()
  value.set_tick_layout(400.0, true)
  value.set_scale(
    @scale.Scale::Asinh(
      linear_width=4607182418800017408UL.reinterpret_as_double(),
    ),
  )
  {
    let value = value.locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      4607182418800017408UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    assert_true(value.subs() is None)
  }
  {
    let value = value.minor_locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      4607182418800017408UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    let subs = match value.subs() {
      Some(@ticker.AsinhSubs::Tuple(values)) => values
      _ => abort("immutable tuple")
    }
    assert_eq(subs.length(), 2)
    assert_eq(subs.values(), [
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ])
    assert_eq(subs, @ticker.asinh_default_minor_subs())
  }
  assert_true(
    value.minor_named_formatter().unwrap().null_formatter() is Some(_),
  )
  let value = value
    .named_formatter()
    .unwrap()
    .log_formatter_sci_notation()
    .unwrap()
  scale_defaults_number(
    value.base(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(
    value.label_only_base(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
  let thresholds = match value.minor_thresholds() {
    Some(@ticker.LogMinorThresholds::Tuple(values)) => values
    _ => abort("tuple")
  }
  assert_eq(
    thresholds.get(0),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
    ),
  )
  assert_eq(
    thresholds.get(1),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Number(
        4600877379321698714UL.reinterpret_as_double(),
      ),
    ),
  )
}

///|
fn scale_defaults_case_42() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(true)
  @config.set_formatter_use_offset(false)
  @config.set_formatter_use_locale(true)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(true, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(2))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-2),
    @bigint.BigInt::from_int(3),
  ])
  let value = axis()
  value.set_tick_layout(400.0, true)
  value.set_scale(
    @scale.Scale::Asinh(
      linear_width=4607182418800017408UL.reinterpret_as_double(),
    ),
  )
  {
    let value = value.locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      4607182418800017408UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    assert_true(value.subs() is None)
  }
  {
    let value = value.minor_locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      4607182418800017408UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    let subs = match value.subs() {
      Some(@ticker.AsinhSubs::Tuple(values)) => values
      _ => abort("immutable tuple")
    }
    assert_eq(subs.length(), 2)
    assert_eq(subs.values(), [
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ])
    assert_eq(subs, @ticker.asinh_default_minor_subs())
  }
  assert_true(
    value.minor_named_formatter().unwrap().null_formatter() is Some(_),
  )
  let value = value
    .named_formatter()
    .unwrap()
    .log_formatter_sci_notation()
    .unwrap()
  scale_defaults_number(
    value.base(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(
    value.label_only_base(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
  let thresholds = match value.minor_thresholds() {
    Some(@ticker.LogMinorThresholds::Tuple(values)) => values
    _ => abort("tuple")
  }
  assert_eq(
    thresholds.get(0),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
    ),
  )
  assert_eq(
    thresholds.get(1),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
    ),
  )
}

///|
fn scale_defaults_case_43() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(false)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(true, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  let value = axis()
  value.set_tick_layout(400.0, true)
  value.set_scale(
    @scale.Scale::Asinh(
      linear_width=4607182418800017408UL.reinterpret_as_double(),
    ),
  )
  {
    let value = value.locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      4607182418800017408UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    assert_true(value.subs() is None)
  }
  {
    let value = value.minor_locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      4607182418800017408UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    let subs = match value.subs() {
      Some(@ticker.AsinhSubs::Tuple(values)) => values
      _ => abort("immutable tuple")
    }
    assert_eq(subs.length(), 2)
    assert_eq(subs.values(), [
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ])
    assert_eq(subs, @ticker.asinh_default_minor_subs())
  }
  assert_true(
    value.minor_named_formatter().unwrap().null_formatter() is Some(_),
  )
  let value = value
    .named_formatter()
    .unwrap()
    .log_formatter_sci_notation()
    .unwrap()
  scale_defaults_number(
    value.base(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(
    value.label_only_base(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
  let thresholds = match value.minor_thresholds() {
    Some(@ticker.LogMinorThresholds::Tuple(values)) => values
    _ => abort("tuple")
  }
  assert_eq(
    thresholds.get(0),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
    ),
  )
  assert_eq(
    thresholds.get(1),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Number(
        4600877379321698714UL.reinterpret_as_double(),
      ),
    ),
  )
}

///|
fn scale_defaults_case_44() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(true)
  @config.set_formatter_use_offset(false)
  @config.set_formatter_use_locale(true)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(true, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(2))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-2),
    @bigint.BigInt::from_int(3),
  ])
  let value = axis()
  value.set_tick_layout(400.0, false)
  value.set_scale(
    @scale.Scale::Asinh(
      linear_width=4607182418800017408UL.reinterpret_as_double(),
    ),
  )
  {
    let value = value.locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      4607182418800017408UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    assert_true(value.subs() is None)
  }
  {
    let value = value.minor_locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      4607182418800017408UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    let subs = match value.subs() {
      Some(@ticker.AsinhSubs::Tuple(values)) => values
      _ => abort("immutable tuple")
    }
    assert_eq(subs.length(), 2)
    assert_eq(subs.values(), [
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ])
    assert_eq(subs, @ticker.asinh_default_minor_subs())
  }
  assert_true(
    value.minor_named_formatter().unwrap().null_formatter() is Some(_),
  )
  let value = value
    .named_formatter()
    .unwrap()
    .log_formatter_sci_notation()
    .unwrap()
  scale_defaults_number(
    value.base(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(
    value.label_only_base(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
  let thresholds = match value.minor_thresholds() {
    Some(@ticker.LogMinorThresholds::Tuple(values)) => values
    _ => abort("tuple")
  }
  assert_eq(
    thresholds.get(0),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
    ),
  )
  assert_eq(
    thresholds.get(1),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
    ),
  )
}

///|
fn scale_defaults_case_45() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(false)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(true, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  let value = axis()
  value.set_tick_layout(400.0, false)
  value.set_scale(
    @scale.Scale::Asinh(
      linear_width=4607182418800017408UL.reinterpret_as_double(),
    ),
  )
  {
    let value = value.locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      4607182418800017408UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    assert_true(value.subs() is None)
  }
  {
    let value = value.minor_locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      4607182418800017408UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    let subs = match value.subs() {
      Some(@ticker.AsinhSubs::Tuple(values)) => values
      _ => abort("immutable tuple")
    }
    assert_eq(subs.length(), 2)
    assert_eq(subs.values(), [
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ])
    assert_eq(subs, @ticker.asinh_default_minor_subs())
  }
  assert_true(
    value.minor_named_formatter().unwrap().null_formatter() is Some(_),
  )
  let value = value
    .named_formatter()
    .unwrap()
    .log_formatter_sci_notation()
    .unwrap()
  scale_defaults_number(
    value.base(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(
    value.label_only_base(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
  let thresholds = match value.minor_thresholds() {
    Some(@ticker.LogMinorThresholds::Tuple(values)) => values
    _ => abort("tuple")
  }
  assert_eq(
    thresholds.get(0),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
    ),
  )
  assert_eq(
    thresholds.get(1),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Number(
        4600877379321698714UL.reinterpret_as_double(),
      ),
    ),
  )
}

///|
fn scale_defaults_case_46() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(true)
  @config.set_formatter_use_offset(false)
  @config.set_formatter_use_locale(true)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(true)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(2))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-2),
    @bigint.BigInt::from_int(3),
  ])
  let value = axis()
  value.set_tick_layout(400.0, false)
  value.set_scale(
    @scale.Scale::Asinh(
      linear_width=4607182418800017408UL.reinterpret_as_double(),
    ),
  )
  {
    let value = value.locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      4607182418800017408UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    assert_true(value.subs() is None)
  }
  {
    let value = value.minor_locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      4607182418800017408UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    let subs = match value.subs() {
      Some(@ticker.AsinhSubs::Tuple(values)) => values
      _ => abort("immutable tuple")
    }
    assert_eq(subs.length(), 2)
    assert_eq(subs.values(), [
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ])
    assert_eq(subs, @ticker.asinh_default_minor_subs())
  }
  assert_true(
    value.minor_named_formatter().unwrap().null_formatter() is Some(_),
  )
  let value = value
    .named_formatter()
    .unwrap()
    .log_formatter_sci_notation()
    .unwrap()
  scale_defaults_number(
    value.base(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(
    value.label_only_base(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
  let thresholds = match value.minor_thresholds() {
    Some(@ticker.LogMinorThresholds::Tuple(values)) => values
    _ => abort("tuple")
  }
  assert_eq(
    thresholds.get(0),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
    ),
  )
  assert_eq(
    thresholds.get(1),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
    ),
  )
}

///|
fn scale_defaults_case_47() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(false)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(true)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  let value = axis()
  value.set_tick_layout(400.0, false)
  value.set_scale(
    @scale.Scale::Asinh(
      linear_width=4607182418800017408UL.reinterpret_as_double(),
    ),
  )
  {
    let value = value.locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      4607182418800017408UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    assert_true(value.subs() is None)
  }
  {
    let value = value.minor_locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      4607182418800017408UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    let subs = match value.subs() {
      Some(@ticker.AsinhSubs::Tuple(values)) => values
      _ => abort("immutable tuple")
    }
    assert_eq(subs.length(), 2)
    assert_eq(subs.values(), [
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ])
    assert_eq(subs, @ticker.asinh_default_minor_subs())
  }
  assert_true(
    value.minor_named_formatter().unwrap().null_formatter() is Some(_),
  )
  let value = value
    .named_formatter()
    .unwrap()
    .log_formatter_sci_notation()
    .unwrap()
  scale_defaults_number(
    value.base(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(
    value.label_only_base(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
  let thresholds = match value.minor_thresholds() {
    Some(@ticker.LogMinorThresholds::Tuple(values)) => values
    _ => abort("tuple")
  }
  assert_eq(
    thresholds.get(0),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
    ),
  )
  assert_eq(
    thresholds.get(1),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Number(
        4600877379321698714UL.reinterpret_as_double(),
      ),
    ),
  )
}

///|
fn scale_defaults_case_48() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(true)
  @config.set_formatter_use_offset(false)
  @config.set_formatter_use_locale(true)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(true)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(2))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-2),
    @bigint.BigInt::from_int(3),
  ])
  let value = axis()
  value.set_tick_layout(400.0, true)
  value.set_scale(
    @scale.Scale::Asinh(
      linear_width=4613937818241073152UL.reinterpret_as_double(),
    ),
  )
  {
    let value = value.locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      4613937818241073152UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    assert_true(value.subs() is None)
  }
  {
    let value = value.minor_locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      4613937818241073152UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    let subs = match value.subs() {
      Some(@ticker.AsinhSubs::Tuple(values)) => values
      _ => abort("immutable tuple")
    }
    assert_eq(subs.length(), 2)
    assert_eq(subs.values(), [
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ])
    assert_eq(subs, @ticker.asinh_default_minor_subs())
  }
  assert_true(
    value.minor_named_formatter().unwrap().null_formatter() is Some(_),
  )
  let value = value
    .named_formatter()
    .unwrap()
    .log_formatter_sci_notation()
    .unwrap()
  scale_defaults_number(
    value.base(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(
    value.label_only_base(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
  let thresholds = match value.minor_thresholds() {
    Some(@ticker.LogMinorThresholds::Tuple(values)) => values
    _ => abort("tuple")
  }
  assert_eq(
    thresholds.get(0),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
    ),
  )
  assert_eq(
    thresholds.get(1),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
    ),
  )
}

///|
fn scale_defaults_case_49() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(false)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(true)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  let value = axis()
  value.set_tick_layout(400.0, true)
  value.set_scale(
    @scale.Scale::Asinh(
      linear_width=4613937818241073152UL.reinterpret_as_double(),
    ),
  )
  {
    let value = value.locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      4613937818241073152UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    assert_true(value.subs() is None)
  }
  {
    let value = value.minor_locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      4613937818241073152UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    let subs = match value.subs() {
      Some(@ticker.AsinhSubs::Tuple(values)) => values
      _ => abort("immutable tuple")
    }
    assert_eq(subs.length(), 2)
    assert_eq(subs.values(), [
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ])
    assert_eq(subs, @ticker.asinh_default_minor_subs())
  }
  assert_true(
    value.minor_named_formatter().unwrap().null_formatter() is Some(_),
  )
  let value = value
    .named_formatter()
    .unwrap()
    .log_formatter_sci_notation()
    .unwrap()
  scale_defaults_number(
    value.base(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(
    value.label_only_base(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
  let thresholds = match value.minor_thresholds() {
    Some(@ticker.LogMinorThresholds::Tuple(values)) => values
    _ => abort("tuple")
  }
  assert_eq(
    thresholds.get(0),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
    ),
  )
  assert_eq(
    thresholds.get(1),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Number(
        4600877379321698714UL.reinterpret_as_double(),
      ),
    ),
  )
}

///|
fn scale_defaults_case_50() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(true)
  @config.set_formatter_use_offset(false)
  @config.set_formatter_use_locale(true)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(true, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(2))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-2),
    @bigint.BigInt::from_int(3),
  ])
  let value = axis()
  value.set_tick_layout(400.0, true)
  value.set_scale(
    @scale.Scale::Asinh(
      linear_width=4613937818241073152UL.reinterpret_as_double(),
    ),
  )
  {
    let value = value.locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      4613937818241073152UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    assert_true(value.subs() is None)
  }
  {
    let value = value.minor_locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      4613937818241073152UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    let subs = match value.subs() {
      Some(@ticker.AsinhSubs::Tuple(values)) => values
      _ => abort("immutable tuple")
    }
    assert_eq(subs.length(), 2)
    assert_eq(subs.values(), [
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ])
    assert_eq(subs, @ticker.asinh_default_minor_subs())
  }
  assert_true(
    value.minor_named_formatter().unwrap().null_formatter() is Some(_),
  )
  let value = value
    .named_formatter()
    .unwrap()
    .log_formatter_sci_notation()
    .unwrap()
  scale_defaults_number(
    value.base(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(
    value.label_only_base(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
  let thresholds = match value.minor_thresholds() {
    Some(@ticker.LogMinorThresholds::Tuple(values)) => values
    _ => abort("tuple")
  }
  assert_eq(
    thresholds.get(0),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
    ),
  )
  assert_eq(
    thresholds.get(1),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
    ),
  )
}

///|
fn scale_defaults_case_51() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(false)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(true, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  let value = axis()
  value.set_tick_layout(400.0, true)
  value.set_scale(
    @scale.Scale::Asinh(
      linear_width=4613937818241073152UL.reinterpret_as_double(),
    ),
  )
  {
    let value = value.locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      4613937818241073152UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    assert_true(value.subs() is None)
  }
  {
    let value = value.minor_locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      4613937818241073152UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    let subs = match value.subs() {
      Some(@ticker.AsinhSubs::Tuple(values)) => values
      _ => abort("immutable tuple")
    }
    assert_eq(subs.length(), 2)
    assert_eq(subs.values(), [
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ])
    assert_eq(subs, @ticker.asinh_default_minor_subs())
  }
  assert_true(
    value.minor_named_formatter().unwrap().null_formatter() is Some(_),
  )
  let value = value
    .named_formatter()
    .unwrap()
    .log_formatter_sci_notation()
    .unwrap()
  scale_defaults_number(
    value.base(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(
    value.label_only_base(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
  let thresholds = match value.minor_thresholds() {
    Some(@ticker.LogMinorThresholds::Tuple(values)) => values
    _ => abort("tuple")
  }
  assert_eq(
    thresholds.get(0),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
    ),
  )
  assert_eq(
    thresholds.get(1),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Number(
        4600877379321698714UL.reinterpret_as_double(),
      ),
    ),
  )
}

///|
fn scale_defaults_case_52() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(true)
  @config.set_formatter_use_offset(false)
  @config.set_formatter_use_locale(true)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(true, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(2))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-2),
    @bigint.BigInt::from_int(3),
  ])
  let value = axis()
  value.set_tick_layout(400.0, false)
  value.set_scale(
    @scale.Scale::Asinh(
      linear_width=4613937818241073152UL.reinterpret_as_double(),
    ),
  )
  {
    let value = value.locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      4613937818241073152UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    assert_true(value.subs() is None)
  }
  {
    let value = value.minor_locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      4613937818241073152UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    let subs = match value.subs() {
      Some(@ticker.AsinhSubs::Tuple(values)) => values
      _ => abort("immutable tuple")
    }
    assert_eq(subs.length(), 2)
    assert_eq(subs.values(), [
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ])
    assert_eq(subs, @ticker.asinh_default_minor_subs())
  }
  assert_true(
    value.minor_named_formatter().unwrap().null_formatter() is Some(_),
  )
  let value = value
    .named_formatter()
    .unwrap()
    .log_formatter_sci_notation()
    .unwrap()
  scale_defaults_number(
    value.base(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(
    value.label_only_base(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
  let thresholds = match value.minor_thresholds() {
    Some(@ticker.LogMinorThresholds::Tuple(values)) => values
    _ => abort("tuple")
  }
  assert_eq(
    thresholds.get(0),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
    ),
  )
  assert_eq(
    thresholds.get(1),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
    ),
  )
}

///|
fn scale_defaults_case_53() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(false)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(true, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  let value = axis()
  value.set_tick_layout(400.0, false)
  value.set_scale(
    @scale.Scale::Asinh(
      linear_width=4613937818241073152UL.reinterpret_as_double(),
    ),
  )
  {
    let value = value.locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      4613937818241073152UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    assert_true(value.subs() is None)
  }
  {
    let value = value.minor_locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      4613937818241073152UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    let subs = match value.subs() {
      Some(@ticker.AsinhSubs::Tuple(values)) => values
      _ => abort("immutable tuple")
    }
    assert_eq(subs.length(), 2)
    assert_eq(subs.values(), [
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ])
    assert_eq(subs, @ticker.asinh_default_minor_subs())
  }
  assert_true(
    value.minor_named_formatter().unwrap().null_formatter() is Some(_),
  )
  let value = value
    .named_formatter()
    .unwrap()
    .log_formatter_sci_notation()
    .unwrap()
  scale_defaults_number(
    value.base(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(
    value.label_only_base(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
  let thresholds = match value.minor_thresholds() {
    Some(@ticker.LogMinorThresholds::Tuple(values)) => values
    _ => abort("tuple")
  }
  assert_eq(
    thresholds.get(0),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
    ),
  )
  assert_eq(
    thresholds.get(1),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Number(
        4600877379321698714UL.reinterpret_as_double(),
      ),
    ),
  )
}

///|
fn scale_defaults_case_54() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(true)
  @config.set_formatter_use_offset(false)
  @config.set_formatter_use_locale(true)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(true)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(2))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-2),
    @bigint.BigInt::from_int(3),
  ])
  let value = axis()
  value.set_tick_layout(400.0, false)
  value.set_scale(
    @scale.Scale::Asinh(
      linear_width=4613937818241073152UL.reinterpret_as_double(),
    ),
  )
  {
    let value = value.locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      4613937818241073152UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    assert_true(value.subs() is None)
  }
  {
    let value = value.minor_locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      4613937818241073152UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    let subs = match value.subs() {
      Some(@ticker.AsinhSubs::Tuple(values)) => values
      _ => abort("immutable tuple")
    }
    assert_eq(subs.length(), 2)
    assert_eq(subs.values(), [
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ])
    assert_eq(subs, @ticker.asinh_default_minor_subs())
  }
  assert_true(
    value.minor_named_formatter().unwrap().null_formatter() is Some(_),
  )
  let value = value
    .named_formatter()
    .unwrap()
    .log_formatter_sci_notation()
    .unwrap()
  scale_defaults_number(
    value.base(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(
    value.label_only_base(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
  let thresholds = match value.minor_thresholds() {
    Some(@ticker.LogMinorThresholds::Tuple(values)) => values
    _ => abort("tuple")
  }
  assert_eq(
    thresholds.get(0),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
    ),
  )
  assert_eq(
    thresholds.get(1),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
    ),
  )
}

///|
fn scale_defaults_case_55() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(false)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(true)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  let value = axis()
  value.set_tick_layout(400.0, false)
  value.set_scale(
    @scale.Scale::Asinh(
      linear_width=4613937818241073152UL.reinterpret_as_double(),
    ),
  )
  {
    let value = value.locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      4613937818241073152UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    assert_true(value.subs() is None)
  }
  {
    let value = value.minor_locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      4613937818241073152UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    let subs = match value.subs() {
      Some(@ticker.AsinhSubs::Tuple(values)) => values
      _ => abort("immutable tuple")
    }
    assert_eq(subs.length(), 2)
    assert_eq(subs.values(), [
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ])
    assert_eq(subs, @ticker.asinh_default_minor_subs())
  }
  assert_true(
    value.minor_named_formatter().unwrap().null_formatter() is Some(_),
  )
  let value = value
    .named_formatter()
    .unwrap()
    .log_formatter_sci_notation()
    .unwrap()
  scale_defaults_number(
    value.base(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(
    value.label_only_base(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
  let thresholds = match value.minor_thresholds() {
    Some(@ticker.LogMinorThresholds::Tuple(values)) => values
    _ => abort("tuple")
  }
  assert_eq(
    thresholds.get(0),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
    ),
  )
  assert_eq(
    thresholds.get(1),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Number(
        4600877379321698714UL.reinterpret_as_double(),
      ),
    ),
  )
}

///|
fn scale_defaults_case_56() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(true)
  @config.set_formatter_use_offset(false)
  @config.set_formatter_use_locale(true)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(true)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(2))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-2),
    @bigint.BigInt::from_int(3),
  ])
  let value = axis()
  value.set_tick_layout(400.0, true)
  value.set_scale(
    @scale.Scale::Asinh(
      linear_width=9221120237041090560UL.reinterpret_as_double(),
    ),
  )
  {
    let value = value.locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      9221120237041090560UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    assert_true(value.subs() is None)
  }
  {
    let value = value.minor_locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      9221120237041090560UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    let subs = match value.subs() {
      Some(@ticker.AsinhSubs::Tuple(values)) => values
      _ => abort("immutable tuple")
    }
    assert_eq(subs.length(), 2)
    assert_eq(subs.values(), [
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ])
    assert_eq(subs, @ticker.asinh_default_minor_subs())
  }
  assert_true(
    value.minor_named_formatter().unwrap().null_formatter() is Some(_),
  )
  let value = value
    .named_formatter()
    .unwrap()
    .log_formatter_sci_notation()
    .unwrap()
  scale_defaults_number(
    value.base(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(
    value.label_only_base(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
  let thresholds = match value.minor_thresholds() {
    Some(@ticker.LogMinorThresholds::Tuple(values)) => values
    _ => abort("tuple")
  }
  assert_eq(
    thresholds.get(0),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
    ),
  )
  assert_eq(
    thresholds.get(1),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
    ),
  )
}

///|
fn scale_defaults_case_57() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(false)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(true)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  let value = axis()
  value.set_tick_layout(400.0, true)
  value.set_scale(
    @scale.Scale::Asinh(
      linear_width=9221120237041090560UL.reinterpret_as_double(),
    ),
  )
  {
    let value = value.locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      9221120237041090560UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    assert_true(value.subs() is None)
  }
  {
    let value = value.minor_locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      9221120237041090560UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    let subs = match value.subs() {
      Some(@ticker.AsinhSubs::Tuple(values)) => values
      _ => abort("immutable tuple")
    }
    assert_eq(subs.length(), 2)
    assert_eq(subs.values(), [
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ])
    assert_eq(subs, @ticker.asinh_default_minor_subs())
  }
  assert_true(
    value.minor_named_formatter().unwrap().null_formatter() is Some(_),
  )
  let value = value
    .named_formatter()
    .unwrap()
    .log_formatter_sci_notation()
    .unwrap()
  scale_defaults_number(
    value.base(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(
    value.label_only_base(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
  let thresholds = match value.minor_thresholds() {
    Some(@ticker.LogMinorThresholds::Tuple(values)) => values
    _ => abort("tuple")
  }
  assert_eq(
    thresholds.get(0),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
    ),
  )
  assert_eq(
    thresholds.get(1),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Number(
        4600877379321698714UL.reinterpret_as_double(),
      ),
    ),
  )
}

///|
fn scale_defaults_case_58() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(true)
  @config.set_formatter_use_offset(false)
  @config.set_formatter_use_locale(true)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(true, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(2))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-2),
    @bigint.BigInt::from_int(3),
  ])
  let value = axis()
  value.set_tick_layout(400.0, true)
  value.set_scale(
    @scale.Scale::Asinh(
      linear_width=9221120237041090560UL.reinterpret_as_double(),
    ),
  )
  {
    let value = value.locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      9221120237041090560UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    assert_true(value.subs() is None)
  }
  {
    let value = value.minor_locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      9221120237041090560UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    let subs = match value.subs() {
      Some(@ticker.AsinhSubs::Tuple(values)) => values
      _ => abort("immutable tuple")
    }
    assert_eq(subs.length(), 2)
    assert_eq(subs.values(), [
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ])
    assert_eq(subs, @ticker.asinh_default_minor_subs())
  }
  assert_true(
    value.minor_named_formatter().unwrap().null_formatter() is Some(_),
  )
  let value = value
    .named_formatter()
    .unwrap()
    .log_formatter_sci_notation()
    .unwrap()
  scale_defaults_number(
    value.base(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(
    value.label_only_base(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
  let thresholds = match value.minor_thresholds() {
    Some(@ticker.LogMinorThresholds::Tuple(values)) => values
    _ => abort("tuple")
  }
  assert_eq(
    thresholds.get(0),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
    ),
  )
  assert_eq(
    thresholds.get(1),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
    ),
  )
}

///|
fn scale_defaults_case_59() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(false)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(true, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  let value = axis()
  value.set_tick_layout(400.0, true)
  value.set_scale(
    @scale.Scale::Asinh(
      linear_width=9221120237041090560UL.reinterpret_as_double(),
    ),
  )
  {
    let value = value.locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      9221120237041090560UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    assert_true(value.subs() is None)
  }
  {
    let value = value.minor_locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      9221120237041090560UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    let subs = match value.subs() {
      Some(@ticker.AsinhSubs::Tuple(values)) => values
      _ => abort("immutable tuple")
    }
    assert_eq(subs.length(), 2)
    assert_eq(subs.values(), [
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ])
    assert_eq(subs, @ticker.asinh_default_minor_subs())
  }
  assert_true(
    value.minor_named_formatter().unwrap().null_formatter() is Some(_),
  )
  let value = value
    .named_formatter()
    .unwrap()
    .log_formatter_sci_notation()
    .unwrap()
  scale_defaults_number(
    value.base(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(
    value.label_only_base(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
  let thresholds = match value.minor_thresholds() {
    Some(@ticker.LogMinorThresholds::Tuple(values)) => values
    _ => abort("tuple")
  }
  assert_eq(
    thresholds.get(0),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
    ),
  )
  assert_eq(
    thresholds.get(1),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Number(
        4600877379321698714UL.reinterpret_as_double(),
      ),
    ),
  )
}

///|
fn scale_defaults_case_60() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(true)
  @config.set_formatter_use_offset(false)
  @config.set_formatter_use_locale(true)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(true, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(2))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-2),
    @bigint.BigInt::from_int(3),
  ])
  let value = axis()
  value.set_tick_layout(400.0, false)
  value.set_scale(
    @scale.Scale::Asinh(
      linear_width=9221120237041090560UL.reinterpret_as_double(),
    ),
  )
  {
    let value = value.locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      9221120237041090560UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    assert_true(value.subs() is None)
  }
  {
    let value = value.minor_locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      9221120237041090560UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    let subs = match value.subs() {
      Some(@ticker.AsinhSubs::Tuple(values)) => values
      _ => abort("immutable tuple")
    }
    assert_eq(subs.length(), 2)
    assert_eq(subs.values(), [
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ])
    assert_eq(subs, @ticker.asinh_default_minor_subs())
  }
  assert_true(
    value.minor_named_formatter().unwrap().null_formatter() is Some(_),
  )
  let value = value
    .named_formatter()
    .unwrap()
    .log_formatter_sci_notation()
    .unwrap()
  scale_defaults_number(
    value.base(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(
    value.label_only_base(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
  let thresholds = match value.minor_thresholds() {
    Some(@ticker.LogMinorThresholds::Tuple(values)) => values
    _ => abort("tuple")
  }
  assert_eq(
    thresholds.get(0),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
    ),
  )
  assert_eq(
    thresholds.get(1),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
    ),
  )
}

///|
fn scale_defaults_case_61() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(false)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(true, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  let value = axis()
  value.set_tick_layout(400.0, false)
  value.set_scale(
    @scale.Scale::Asinh(
      linear_width=9221120237041090560UL.reinterpret_as_double(),
    ),
  )
  {
    let value = value.locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      9221120237041090560UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    assert_true(value.subs() is None)
  }
  {
    let value = value.minor_locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      9221120237041090560UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    let subs = match value.subs() {
      Some(@ticker.AsinhSubs::Tuple(values)) => values
      _ => abort("immutable tuple")
    }
    assert_eq(subs.length(), 2)
    assert_eq(subs.values(), [
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ])
    assert_eq(subs, @ticker.asinh_default_minor_subs())
  }
  assert_true(
    value.minor_named_formatter().unwrap().null_formatter() is Some(_),
  )
  let value = value
    .named_formatter()
    .unwrap()
    .log_formatter_sci_notation()
    .unwrap()
  scale_defaults_number(
    value.base(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(
    value.label_only_base(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
  let thresholds = match value.minor_thresholds() {
    Some(@ticker.LogMinorThresholds::Tuple(values)) => values
    _ => abort("tuple")
  }
  assert_eq(
    thresholds.get(0),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
    ),
  )
  assert_eq(
    thresholds.get(1),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Number(
        4600877379321698714UL.reinterpret_as_double(),
      ),
    ),
  )
}

///|
fn scale_defaults_case_62() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(true)
  @config.set_formatter_use_offset(false)
  @config.set_formatter_use_locale(true)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(true)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(2))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-2),
    @bigint.BigInt::from_int(3),
  ])
  let value = axis()
  value.set_tick_layout(400.0, false)
  value.set_scale(
    @scale.Scale::Asinh(
      linear_width=9221120237041090560UL.reinterpret_as_double(),
    ),
  )
  {
    let value = value.locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      9221120237041090560UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    assert_true(value.subs() is None)
  }
  {
    let value = value.minor_locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      9221120237041090560UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    let subs = match value.subs() {
      Some(@ticker.AsinhSubs::Tuple(values)) => values
      _ => abort("immutable tuple")
    }
    assert_eq(subs.length(), 2)
    assert_eq(subs.values(), [
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ])
    assert_eq(subs, @ticker.asinh_default_minor_subs())
  }
  assert_true(
    value.minor_named_formatter().unwrap().null_formatter() is Some(_),
  )
  let value = value
    .named_formatter()
    .unwrap()
    .log_formatter_sci_notation()
    .unwrap()
  scale_defaults_number(
    value.base(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(
    value.label_only_base(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
  let thresholds = match value.minor_thresholds() {
    Some(@ticker.LogMinorThresholds::Tuple(values)) => values
    _ => abort("tuple")
  }
  assert_eq(
    thresholds.get(0),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
    ),
  )
  assert_eq(
    thresholds.get(1),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
    ),
  )
}

///|
fn scale_defaults_case_63() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(false)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(true)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  let value = axis()
  value.set_tick_layout(400.0, false)
  value.set_scale(
    @scale.Scale::Asinh(
      linear_width=9221120237041090560UL.reinterpret_as_double(),
    ),
  )
  {
    let value = value.locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      9221120237041090560UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    assert_true(value.subs() is None)
  }
  {
    let value = value.minor_locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      9221120237041090560UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    let subs = match value.subs() {
      Some(@ticker.AsinhSubs::Tuple(values)) => values
      _ => abort("immutable tuple")
    }
    assert_eq(subs.length(), 2)
    assert_eq(subs.values(), [
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ])
    assert_eq(subs, @ticker.asinh_default_minor_subs())
  }
  assert_true(
    value.minor_named_formatter().unwrap().null_formatter() is Some(_),
  )
  let value = value
    .named_formatter()
    .unwrap()
    .log_formatter_sci_notation()
    .unwrap()
  scale_defaults_number(
    value.base(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(
    value.label_only_base(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
  let thresholds = match value.minor_thresholds() {
    Some(@ticker.LogMinorThresholds::Tuple(values)) => values
    _ => abort("tuple")
  }
  assert_eq(
    thresholds.get(0),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
    ),
  )
  assert_eq(
    thresholds.get(1),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Number(
        4600877379321698714UL.reinterpret_as_double(),
      ),
    ),
  )
}

///|
fn scale_defaults_case_64() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(true)
  @config.set_formatter_use_offset(false)
  @config.set_formatter_use_locale(true)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(true)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(2))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-2),
    @bigint.BigInt::from_int(3),
  ])
  let value = axis()
  value.set_tick_layout(400.0, true)
  value.set_scale(
    @scale.Scale::Asinh(
      linear_width=9218868437227405312UL.reinterpret_as_double(),
    ),
  )
  {
    let value = value.locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      9218868437227405312UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    assert_true(value.subs() is None)
  }
  {
    let value = value.minor_locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      9218868437227405312UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    let subs = match value.subs() {
      Some(@ticker.AsinhSubs::Tuple(values)) => values
      _ => abort("immutable tuple")
    }
    assert_eq(subs.length(), 2)
    assert_eq(subs.values(), [
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ])
    assert_eq(subs, @ticker.asinh_default_minor_subs())
  }
  assert_true(
    value.minor_named_formatter().unwrap().null_formatter() is Some(_),
  )
  let value = value
    .named_formatter()
    .unwrap()
    .log_formatter_sci_notation()
    .unwrap()
  scale_defaults_number(
    value.base(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(
    value.label_only_base(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
  let thresholds = match value.minor_thresholds() {
    Some(@ticker.LogMinorThresholds::Tuple(values)) => values
    _ => abort("tuple")
  }
  assert_eq(
    thresholds.get(0),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
    ),
  )
  assert_eq(
    thresholds.get(1),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
    ),
  )
}

///|
fn scale_defaults_case_65() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(false)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(true)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  let value = axis()
  value.set_tick_layout(400.0, true)
  value.set_scale(
    @scale.Scale::Asinh(
      linear_width=9218868437227405312UL.reinterpret_as_double(),
    ),
  )
  {
    let value = value.locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      9218868437227405312UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    assert_true(value.subs() is None)
  }
  {
    let value = value.minor_locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      9218868437227405312UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    let subs = match value.subs() {
      Some(@ticker.AsinhSubs::Tuple(values)) => values
      _ => abort("immutable tuple")
    }
    assert_eq(subs.length(), 2)
    assert_eq(subs.values(), [
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ])
    assert_eq(subs, @ticker.asinh_default_minor_subs())
  }
  assert_true(
    value.minor_named_formatter().unwrap().null_formatter() is Some(_),
  )
  let value = value
    .named_formatter()
    .unwrap()
    .log_formatter_sci_notation()
    .unwrap()
  scale_defaults_number(
    value.base(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(
    value.label_only_base(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
  let thresholds = match value.minor_thresholds() {
    Some(@ticker.LogMinorThresholds::Tuple(values)) => values
    _ => abort("tuple")
  }
  assert_eq(
    thresholds.get(0),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
    ),
  )
  assert_eq(
    thresholds.get(1),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Number(
        4600877379321698714UL.reinterpret_as_double(),
      ),
    ),
  )
}

///|
fn scale_defaults_case_66() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(true)
  @config.set_formatter_use_offset(false)
  @config.set_formatter_use_locale(true)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(true, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(2))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-2),
    @bigint.BigInt::from_int(3),
  ])
  let value = axis()
  value.set_tick_layout(400.0, true)
  value.set_scale(
    @scale.Scale::Asinh(
      linear_width=9218868437227405312UL.reinterpret_as_double(),
    ),
  )
  {
    let value = value.locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      9218868437227405312UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    assert_true(value.subs() is None)
  }
  {
    let value = value.minor_locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      9218868437227405312UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    let subs = match value.subs() {
      Some(@ticker.AsinhSubs::Tuple(values)) => values
      _ => abort("immutable tuple")
    }
    assert_eq(subs.length(), 2)
    assert_eq(subs.values(), [
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ])
    assert_eq(subs, @ticker.asinh_default_minor_subs())
  }
  assert_true(
    value.minor_named_formatter().unwrap().null_formatter() is Some(_),
  )
  let value = value
    .named_formatter()
    .unwrap()
    .log_formatter_sci_notation()
    .unwrap()
  scale_defaults_number(
    value.base(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(
    value.label_only_base(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
  let thresholds = match value.minor_thresholds() {
    Some(@ticker.LogMinorThresholds::Tuple(values)) => values
    _ => abort("tuple")
  }
  assert_eq(
    thresholds.get(0),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
    ),
  )
  assert_eq(
    thresholds.get(1),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
    ),
  )
}

///|
fn scale_defaults_case_67() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(false)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(true, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  let value = axis()
  value.set_tick_layout(400.0, true)
  value.set_scale(
    @scale.Scale::Asinh(
      linear_width=9218868437227405312UL.reinterpret_as_double(),
    ),
  )
  {
    let value = value.locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      9218868437227405312UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    assert_true(value.subs() is None)
  }
  {
    let value = value.minor_locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      9218868437227405312UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    let subs = match value.subs() {
      Some(@ticker.AsinhSubs::Tuple(values)) => values
      _ => abort("immutable tuple")
    }
    assert_eq(subs.length(), 2)
    assert_eq(subs.values(), [
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ])
    assert_eq(subs, @ticker.asinh_default_minor_subs())
  }
  assert_true(
    value.minor_named_formatter().unwrap().null_formatter() is Some(_),
  )
  let value = value
    .named_formatter()
    .unwrap()
    .log_formatter_sci_notation()
    .unwrap()
  scale_defaults_number(
    value.base(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(
    value.label_only_base(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
  let thresholds = match value.minor_thresholds() {
    Some(@ticker.LogMinorThresholds::Tuple(values)) => values
    _ => abort("tuple")
  }
  assert_eq(
    thresholds.get(0),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
    ),
  )
  assert_eq(
    thresholds.get(1),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Number(
        4600877379321698714UL.reinterpret_as_double(),
      ),
    ),
  )
}

///|
fn scale_defaults_case_68() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(true)
  @config.set_formatter_use_offset(false)
  @config.set_formatter_use_locale(true)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(true, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(2))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-2),
    @bigint.BigInt::from_int(3),
  ])
  let value = axis()
  value.set_tick_layout(400.0, false)
  value.set_scale(
    @scale.Scale::Asinh(
      linear_width=9218868437227405312UL.reinterpret_as_double(),
    ),
  )
  {
    let value = value.locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      9218868437227405312UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    assert_true(value.subs() is None)
  }
  {
    let value = value.minor_locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      9218868437227405312UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    let subs = match value.subs() {
      Some(@ticker.AsinhSubs::Tuple(values)) => values
      _ => abort("immutable tuple")
    }
    assert_eq(subs.length(), 2)
    assert_eq(subs.values(), [
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ])
    assert_eq(subs, @ticker.asinh_default_minor_subs())
  }
  assert_true(
    value.minor_named_formatter().unwrap().null_formatter() is Some(_),
  )
  let value = value
    .named_formatter()
    .unwrap()
    .log_formatter_sci_notation()
    .unwrap()
  scale_defaults_number(
    value.base(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(
    value.label_only_base(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
  let thresholds = match value.minor_thresholds() {
    Some(@ticker.LogMinorThresholds::Tuple(values)) => values
    _ => abort("tuple")
  }
  assert_eq(
    thresholds.get(0),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
    ),
  )
  assert_eq(
    thresholds.get(1),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
    ),
  )
}

///|
fn scale_defaults_case_69() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(false)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(true, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  let value = axis()
  value.set_tick_layout(400.0, false)
  value.set_scale(
    @scale.Scale::Asinh(
      linear_width=9218868437227405312UL.reinterpret_as_double(),
    ),
  )
  {
    let value = value.locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      9218868437227405312UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    assert_true(value.subs() is None)
  }
  {
    let value = value.minor_locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      9218868437227405312UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    let subs = match value.subs() {
      Some(@ticker.AsinhSubs::Tuple(values)) => values
      _ => abort("immutable tuple")
    }
    assert_eq(subs.length(), 2)
    assert_eq(subs.values(), [
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ])
    assert_eq(subs, @ticker.asinh_default_minor_subs())
  }
  assert_true(
    value.minor_named_formatter().unwrap().null_formatter() is Some(_),
  )
  let value = value
    .named_formatter()
    .unwrap()
    .log_formatter_sci_notation()
    .unwrap()
  scale_defaults_number(
    value.base(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(
    value.label_only_base(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
  let thresholds = match value.minor_thresholds() {
    Some(@ticker.LogMinorThresholds::Tuple(values)) => values
    _ => abort("tuple")
  }
  assert_eq(
    thresholds.get(0),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
    ),
  )
  assert_eq(
    thresholds.get(1),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Number(
        4600877379321698714UL.reinterpret_as_double(),
      ),
    ),
  )
}

///|
fn scale_defaults_case_70() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(true)
  @config.set_formatter_use_offset(false)
  @config.set_formatter_use_locale(true)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(true)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(2))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-2),
    @bigint.BigInt::from_int(3),
  ])
  let value = axis()
  value.set_tick_layout(400.0, false)
  value.set_scale(
    @scale.Scale::Asinh(
      linear_width=9218868437227405312UL.reinterpret_as_double(),
    ),
  )
  {
    let value = value.locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      9218868437227405312UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    assert_true(value.subs() is None)
  }
  {
    let value = value.minor_locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      9218868437227405312UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    let subs = match value.subs() {
      Some(@ticker.AsinhSubs::Tuple(values)) => values
      _ => abort("immutable tuple")
    }
    assert_eq(subs.length(), 2)
    assert_eq(subs.values(), [
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ])
    assert_eq(subs, @ticker.asinh_default_minor_subs())
  }
  assert_true(
    value.minor_named_formatter().unwrap().null_formatter() is Some(_),
  )
  let value = value
    .named_formatter()
    .unwrap()
    .log_formatter_sci_notation()
    .unwrap()
  scale_defaults_number(
    value.base(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(
    value.label_only_base(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
  let thresholds = match value.minor_thresholds() {
    Some(@ticker.LogMinorThresholds::Tuple(values)) => values
    _ => abort("tuple")
  }
  assert_eq(
    thresholds.get(0),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
    ),
  )
  assert_eq(
    thresholds.get(1),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
    ),
  )
}

///|
fn scale_defaults_case_71() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(false)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(true)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  let value = axis()
  value.set_tick_layout(400.0, false)
  value.set_scale(
    @scale.Scale::Asinh(
      linear_width=9218868437227405312UL.reinterpret_as_double(),
    ),
  )
  {
    let value = value.locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      9218868437227405312UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    assert_true(value.subs() is None)
  }
  {
    let value = value.minor_locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      9218868437227405312UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    let subs = match value.subs() {
      Some(@ticker.AsinhSubs::Tuple(values)) => values
      _ => abort("immutable tuple")
    }
    assert_eq(subs.length(), 2)
    assert_eq(subs.values(), [
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ])
    assert_eq(subs, @ticker.asinh_default_minor_subs())
  }
  assert_true(
    value.minor_named_formatter().unwrap().null_formatter() is Some(_),
  )
  let value = value
    .named_formatter()
    .unwrap()
    .log_formatter_sci_notation()
    .unwrap()
  scale_defaults_number(
    value.base(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(
    value.label_only_base(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
  let thresholds = match value.minor_thresholds() {
    Some(@ticker.LogMinorThresholds::Tuple(values)) => values
    _ => abort("tuple")
  }
  assert_eq(
    thresholds.get(0),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
    ),
  )
  assert_eq(
    thresholds.get(1),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Number(
        4600877379321698714UL.reinterpret_as_double(),
      ),
    ),
  )
}

///|
fn scale_defaults_case_72() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(true)
  @config.set_formatter_use_offset(false)
  @config.set_formatter_use_locale(true)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(true)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(2))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-2),
    @bigint.BigInt::from_int(3),
  ])
  let value = axis()
  value.set_tick_layout(400.0, true)
  value.set_scale(@scale.Scale::Logit(clip=false))
  {
    let value = value.locator().unwrap().logit_locator().unwrap()
    assert_eq(value.minor(), false)
    assert_eq(value.as_maxn_locator().nbins(), @ticker.MaxNBins::Auto)
    assert_eq(value.as_maxn_locator().steps().to_array(), [
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
    ])
  }
  {
    let value = value.named_formatter().unwrap().logit_formatter().unwrap()
    assert_eq(
      value.minor(),
      @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
    )
    assert_eq(value.one_half(), @ticker.LogValue::Text("\\frac{1}{2}"))
    assert_eq(
      value.overline(),
      @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
    )
    assert_eq(
      value.minor_threshold(),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("25")),
      ),
    )
    assert_eq(
      value.minor_number(),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
      ),
    )
  }
  {
    let value = value.minor_locator().unwrap().logit_locator().unwrap()
    assert_eq(value.minor(), true)
    assert_eq(value.as_maxn_locator().nbins(), @ticker.MaxNBins::Auto)
    assert_eq(value.as_maxn_locator().steps().to_array(), [
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
    ])
  }
  let value = value.minor_named_formatter().unwrap().logit_formatter().unwrap()
  assert_eq(
    value.minor(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(true)),
  )
  assert_eq(value.one_half(), @ticker.LogValue::Text("\\frac{1}{2}"))
  assert_eq(
    value.overline(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_eq(
    value.minor_threshold(),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("25")),
    ),
  )
  assert_eq(
    value.minor_number(),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
    ),
  )
}

///|
fn scale_defaults_case_73() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(false)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(true)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  let value = axis()
  value.set_tick_layout(400.0, true)
  value.set_scale(@scale.Scale::Logit(clip=false))
  {
    let value = value.locator().unwrap().logit_locator().unwrap()
    assert_eq(value.minor(), false)
    assert_eq(value.as_maxn_locator().nbins(), @ticker.MaxNBins::Auto)
    assert_eq(value.as_maxn_locator().steps().to_array(), [
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
    ])
  }
  {
    let value = value.named_formatter().unwrap().logit_formatter().unwrap()
    assert_eq(
      value.minor(),
      @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
    )
    assert_eq(value.one_half(), @ticker.LogValue::Text("\\frac{1}{2}"))
    assert_eq(
      value.overline(),
      @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
    )
    assert_eq(
      value.minor_threshold(),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("25")),
      ),
    )
    assert_eq(
      value.minor_number(),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
      ),
    )
  }
  {
    let value = value.minor_locator().unwrap().logit_locator().unwrap()
    assert_eq(value.minor(), true)
    assert_eq(value.as_maxn_locator().nbins(), @ticker.MaxNBins::Auto)
    assert_eq(value.as_maxn_locator().steps().to_array(), [
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
    ])
  }
  let value = value.minor_named_formatter().unwrap().logit_formatter().unwrap()
  assert_eq(
    value.minor(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(true)),
  )
  assert_eq(value.one_half(), @ticker.LogValue::Text("\\frac{1}{2}"))
  assert_eq(
    value.overline(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_eq(
    value.minor_threshold(),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("25")),
    ),
  )
  assert_eq(
    value.minor_number(),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
    ),
  )
}

///|
fn scale_defaults_case_74() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(true)
  @config.set_formatter_use_offset(false)
  @config.set_formatter_use_locale(true)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(true, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(2))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-2),
    @bigint.BigInt::from_int(3),
  ])
  let value = axis()
  value.set_tick_layout(400.0, true)
  value.set_scale(@scale.Scale::Logit(clip=false))
  {
    let value = value.locator().unwrap().logit_locator().unwrap()
    assert_eq(value.minor(), false)
    assert_eq(value.as_maxn_locator().nbins(), @ticker.MaxNBins::Auto)
    assert_eq(value.as_maxn_locator().steps().to_array(), [
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
    ])
  }
  {
    let value = value.named_formatter().unwrap().logit_formatter().unwrap()
    assert_eq(
      value.minor(),
      @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
    )
    assert_eq(value.one_half(), @ticker.LogValue::Text("\\frac{1}{2}"))
    assert_eq(
      value.overline(),
      @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
    )
    assert_eq(
      value.minor_threshold(),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("25")),
      ),
    )
    assert_eq(
      value.minor_number(),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
      ),
    )
  }
  {
    let value = value.minor_locator().unwrap().logit_locator().unwrap()
    assert_eq(value.minor(), true)
    assert_eq(value.as_maxn_locator().nbins(), @ticker.MaxNBins::Auto)
    assert_eq(value.as_maxn_locator().steps().to_array(), [
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
    ])
  }
  let value = value.minor_named_formatter().unwrap().logit_formatter().unwrap()
  assert_eq(
    value.minor(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(true)),
  )
  assert_eq(value.one_half(), @ticker.LogValue::Text("\\frac{1}{2}"))
  assert_eq(
    value.overline(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_eq(
    value.minor_threshold(),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("25")),
    ),
  )
  assert_eq(
    value.minor_number(),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
    ),
  )
}

///|
fn scale_defaults_case_75() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(false)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(true, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  let value = axis()
  value.set_tick_layout(400.0, true)
  value.set_scale(@scale.Scale::Logit(clip=false))
  {
    let value = value.locator().unwrap().logit_locator().unwrap()
    assert_eq(value.minor(), false)
    assert_eq(value.as_maxn_locator().nbins(), @ticker.MaxNBins::Auto)
    assert_eq(value.as_maxn_locator().steps().to_array(), [
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
    ])
  }
  {
    let value = value.named_formatter().unwrap().logit_formatter().unwrap()
    assert_eq(
      value.minor(),
      @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
    )
    assert_eq(value.one_half(), @ticker.LogValue::Text("\\frac{1}{2}"))
    assert_eq(
      value.overline(),
      @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
    )
    assert_eq(
      value.minor_threshold(),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("25")),
      ),
    )
    assert_eq(
      value.minor_number(),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
      ),
    )
  }
  {
    let value = value.minor_locator().unwrap().logit_locator().unwrap()
    assert_eq(value.minor(), true)
    assert_eq(value.as_maxn_locator().nbins(), @ticker.MaxNBins::Auto)
    assert_eq(value.as_maxn_locator().steps().to_array(), [
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
    ])
  }
  let value = value.minor_named_formatter().unwrap().logit_formatter().unwrap()
  assert_eq(
    value.minor(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(true)),
  )
  assert_eq(value.one_half(), @ticker.LogValue::Text("\\frac{1}{2}"))
  assert_eq(
    value.overline(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_eq(
    value.minor_threshold(),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("25")),
    ),
  )
  assert_eq(
    value.minor_number(),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
    ),
  )
}

///|
fn scale_defaults_case_76() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(true)
  @config.set_formatter_use_offset(false)
  @config.set_formatter_use_locale(true)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(true, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(2))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-2),
    @bigint.BigInt::from_int(3),
  ])
  let value = axis()
  value.set_tick_layout(400.0, false)
  value.set_scale(@scale.Scale::Logit(clip=false))
  {
    let value = value.locator().unwrap().logit_locator().unwrap()
    assert_eq(value.minor(), false)
    assert_eq(value.as_maxn_locator().nbins(), @ticker.MaxNBins::Auto)
    assert_eq(value.as_maxn_locator().steps().to_array(), [
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
    ])
  }
  {
    let value = value.named_formatter().unwrap().logit_formatter().unwrap()
    assert_eq(
      value.minor(),
      @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
    )
    assert_eq(value.one_half(), @ticker.LogValue::Text("\\frac{1}{2}"))
    assert_eq(
      value.overline(),
      @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
    )
    assert_eq(
      value.minor_threshold(),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("25")),
      ),
    )
    assert_eq(
      value.minor_number(),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
      ),
    )
  }
  {
    let value = value.minor_locator().unwrap().logit_locator().unwrap()
    assert_eq(value.minor(), true)
    assert_eq(value.as_maxn_locator().nbins(), @ticker.MaxNBins::Auto)
    assert_eq(value.as_maxn_locator().steps().to_array(), [
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
    ])
  }
  let value = value.minor_named_formatter().unwrap().logit_formatter().unwrap()
  assert_eq(
    value.minor(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(true)),
  )
  assert_eq(value.one_half(), @ticker.LogValue::Text("\\frac{1}{2}"))
  assert_eq(
    value.overline(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_eq(
    value.minor_threshold(),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("25")),
    ),
  )
  assert_eq(
    value.minor_number(),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
    ),
  )
}

///|
fn scale_defaults_case_77() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(false)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(true, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  let value = axis()
  value.set_tick_layout(400.0, false)
  value.set_scale(@scale.Scale::Logit(clip=false))
  {
    let value = value.locator().unwrap().logit_locator().unwrap()
    assert_eq(value.minor(), false)
    assert_eq(value.as_maxn_locator().nbins(), @ticker.MaxNBins::Auto)
    assert_eq(value.as_maxn_locator().steps().to_array(), [
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
    ])
  }
  {
    let value = value.named_formatter().unwrap().logit_formatter().unwrap()
    assert_eq(
      value.minor(),
      @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
    )
    assert_eq(value.one_half(), @ticker.LogValue::Text("\\frac{1}{2}"))
    assert_eq(
      value.overline(),
      @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
    )
    assert_eq(
      value.minor_threshold(),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("25")),
      ),
    )
    assert_eq(
      value.minor_number(),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
      ),
    )
  }
  {
    let value = value.minor_locator().unwrap().logit_locator().unwrap()
    assert_eq(value.minor(), true)
    assert_eq(value.as_maxn_locator().nbins(), @ticker.MaxNBins::Auto)
    assert_eq(value.as_maxn_locator().steps().to_array(), [
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
    ])
  }
  let value = value.minor_named_formatter().unwrap().logit_formatter().unwrap()
  assert_eq(
    value.minor(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(true)),
  )
  assert_eq(value.one_half(), @ticker.LogValue::Text("\\frac{1}{2}"))
  assert_eq(
    value.overline(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_eq(
    value.minor_threshold(),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("25")),
    ),
  )
  assert_eq(
    value.minor_number(),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
    ),
  )
}

///|
fn scale_defaults_case_78() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(true)
  @config.set_formatter_use_offset(false)
  @config.set_formatter_use_locale(true)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(true)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(2))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-2),
    @bigint.BigInt::from_int(3),
  ])
  let value = axis()
  value.set_tick_layout(400.0, false)
  value.set_scale(@scale.Scale::Logit(clip=false))
  {
    let value = value.locator().unwrap().logit_locator().unwrap()
    assert_eq(value.minor(), false)
    assert_eq(value.as_maxn_locator().nbins(), @ticker.MaxNBins::Auto)
    assert_eq(value.as_maxn_locator().steps().to_array(), [
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
    ])
  }
  {
    let value = value.named_formatter().unwrap().logit_formatter().unwrap()
    assert_eq(
      value.minor(),
      @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
    )
    assert_eq(value.one_half(), @ticker.LogValue::Text("\\frac{1}{2}"))
    assert_eq(
      value.overline(),
      @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
    )
    assert_eq(
      value.minor_threshold(),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("25")),
      ),
    )
    assert_eq(
      value.minor_number(),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
      ),
    )
  }
  {
    let value = value.minor_locator().unwrap().logit_locator().unwrap()
    assert_eq(value.minor(), true)
    assert_eq(value.as_maxn_locator().nbins(), @ticker.MaxNBins::Auto)
    assert_eq(value.as_maxn_locator().steps().to_array(), [
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
    ])
  }
  let value = value.minor_named_formatter().unwrap().logit_formatter().unwrap()
  assert_eq(
    value.minor(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(true)),
  )
  assert_eq(value.one_half(), @ticker.LogValue::Text("\\frac{1}{2}"))
  assert_eq(
    value.overline(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_eq(
    value.minor_threshold(),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("25")),
    ),
  )
  assert_eq(
    value.minor_number(),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
    ),
  )
}

///|
fn scale_defaults_case_79() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(false)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(true)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  let value = axis()
  value.set_tick_layout(400.0, false)
  value.set_scale(@scale.Scale::Logit(clip=false))
  {
    let value = value.locator().unwrap().logit_locator().unwrap()
    assert_eq(value.minor(), false)
    assert_eq(value.as_maxn_locator().nbins(), @ticker.MaxNBins::Auto)
    assert_eq(value.as_maxn_locator().steps().to_array(), [
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
    ])
  }
  {
    let value = value.named_formatter().unwrap().logit_formatter().unwrap()
    assert_eq(
      value.minor(),
      @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
    )
    assert_eq(value.one_half(), @ticker.LogValue::Text("\\frac{1}{2}"))
    assert_eq(
      value.overline(),
      @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
    )
    assert_eq(
      value.minor_threshold(),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("25")),
      ),
    )
    assert_eq(
      value.minor_number(),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
      ),
    )
  }
  {
    let value = value.minor_locator().unwrap().logit_locator().unwrap()
    assert_eq(value.minor(), true)
    assert_eq(value.as_maxn_locator().nbins(), @ticker.MaxNBins::Auto)
    assert_eq(value.as_maxn_locator().steps().to_array(), [
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
    ])
  }
  let value = value.minor_named_formatter().unwrap().logit_formatter().unwrap()
  assert_eq(
    value.minor(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(true)),
  )
  assert_eq(value.one_half(), @ticker.LogValue::Text("\\frac{1}{2}"))
  assert_eq(
    value.overline(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_eq(
    value.minor_threshold(),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("25")),
    ),
  )
  assert_eq(
    value.minor_number(),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
    ),
  )
}

///|
fn scale_defaults_case_80() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(true)
  @config.set_formatter_use_offset(false)
  @config.set_formatter_use_locale(true)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(true)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(2))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-2),
    @bigint.BigInt::from_int(3),
  ])
  let value = axis()
  value.set_tick_layout(400.0, true)
  value.set_scale(@scale.Scale::Logit(clip=true))
  {
    let value = value.locator().unwrap().logit_locator().unwrap()
    assert_eq(value.minor(), false)
    assert_eq(value.as_maxn_locator().nbins(), @ticker.MaxNBins::Auto)
    assert_eq(value.as_maxn_locator().steps().to_array(), [
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
    ])
  }
  {
    let value = value.named_formatter().unwrap().logit_formatter().unwrap()
    assert_eq(
      value.minor(),
      @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
    )
    assert_eq(value.one_half(), @ticker.LogValue::Text("\\frac{1}{2}"))
    assert_eq(
      value.overline(),
      @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
    )
    assert_eq(
      value.minor_threshold(),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("25")),
      ),
    )
    assert_eq(
      value.minor_number(),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
      ),
    )
  }
  {
    let value = value.minor_locator().unwrap().logit_locator().unwrap()
    assert_eq(value.minor(), true)
    assert_eq(value.as_maxn_locator().nbins(), @ticker.MaxNBins::Auto)
    assert_eq(value.as_maxn_locator().steps().to_array(), [
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
    ])
  }
  let value = value.minor_named_formatter().unwrap().logit_formatter().unwrap()
  assert_eq(
    value.minor(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(true)),
  )
  assert_eq(value.one_half(), @ticker.LogValue::Text("\\frac{1}{2}"))
  assert_eq(
    value.overline(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_eq(
    value.minor_threshold(),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("25")),
    ),
  )
  assert_eq(
    value.minor_number(),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
    ),
  )
}

///|
fn scale_defaults_case_81() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(false)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(true)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  let value = axis()
  value.set_tick_layout(400.0, true)
  value.set_scale(@scale.Scale::Logit(clip=true))
  {
    let value = value.locator().unwrap().logit_locator().unwrap()
    assert_eq(value.minor(), false)
    assert_eq(value.as_maxn_locator().nbins(), @ticker.MaxNBins::Auto)
    assert_eq(value.as_maxn_locator().steps().to_array(), [
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
    ])
  }
  {
    let value = value.named_formatter().unwrap().logit_formatter().unwrap()
    assert_eq(
      value.minor(),
      @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
    )
    assert_eq(value.one_half(), @ticker.LogValue::Text("\\frac{1}{2}"))
    assert_eq(
      value.overline(),
      @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
    )
    assert_eq(
      value.minor_threshold(),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("25")),
      ),
    )
    assert_eq(
      value.minor_number(),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
      ),
    )
  }
  {
    let value = value.minor_locator().unwrap().logit_locator().unwrap()
    assert_eq(value.minor(), true)
    assert_eq(value.as_maxn_locator().nbins(), @ticker.MaxNBins::Auto)
    assert_eq(value.as_maxn_locator().steps().to_array(), [
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
    ])
  }
  let value = value.minor_named_formatter().unwrap().logit_formatter().unwrap()
  assert_eq(
    value.minor(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(true)),
  )
  assert_eq(value.one_half(), @ticker.LogValue::Text("\\frac{1}{2}"))
  assert_eq(
    value.overline(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_eq(
    value.minor_threshold(),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("25")),
    ),
  )
  assert_eq(
    value.minor_number(),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
    ),
  )
}

///|
fn scale_defaults_case_82() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(true)
  @config.set_formatter_use_offset(false)
  @config.set_formatter_use_locale(true)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(true, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(2))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-2),
    @bigint.BigInt::from_int(3),
  ])
  let value = axis()
  value.set_tick_layout(400.0, true)
  value.set_scale(@scale.Scale::Logit(clip=true))
  {
    let value = value.locator().unwrap().logit_locator().unwrap()
    assert_eq(value.minor(), false)
    assert_eq(value.as_maxn_locator().nbins(), @ticker.MaxNBins::Auto)
    assert_eq(value.as_maxn_locator().steps().to_array(), [
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
    ])
  }
  {
    let value = value.named_formatter().unwrap().logit_formatter().unwrap()
    assert_eq(
      value.minor(),
      @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
    )
    assert_eq(value.one_half(), @ticker.LogValue::Text("\\frac{1}{2}"))
    assert_eq(
      value.overline(),
      @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
    )
    assert_eq(
      value.minor_threshold(),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("25")),
      ),
    )
    assert_eq(
      value.minor_number(),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
      ),
    )
  }
  {
    let value = value.minor_locator().unwrap().logit_locator().unwrap()
    assert_eq(value.minor(), true)
    assert_eq(value.as_maxn_locator().nbins(), @ticker.MaxNBins::Auto)
    assert_eq(value.as_maxn_locator().steps().to_array(), [
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
    ])
  }
  let value = value.minor_named_formatter().unwrap().logit_formatter().unwrap()
  assert_eq(
    value.minor(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(true)),
  )
  assert_eq(value.one_half(), @ticker.LogValue::Text("\\frac{1}{2}"))
  assert_eq(
    value.overline(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_eq(
    value.minor_threshold(),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("25")),
    ),
  )
  assert_eq(
    value.minor_number(),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
    ),
  )
}

///|
fn scale_defaults_case_83() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(false)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(true, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  let value = axis()
  value.set_tick_layout(400.0, true)
  value.set_scale(@scale.Scale::Logit(clip=true))
  {
    let value = value.locator().unwrap().logit_locator().unwrap()
    assert_eq(value.minor(), false)
    assert_eq(value.as_maxn_locator().nbins(), @ticker.MaxNBins::Auto)
    assert_eq(value.as_maxn_locator().steps().to_array(), [
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
    ])
  }
  {
    let value = value.named_formatter().unwrap().logit_formatter().unwrap()
    assert_eq(
      value.minor(),
      @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
    )
    assert_eq(value.one_half(), @ticker.LogValue::Text("\\frac{1}{2}"))
    assert_eq(
      value.overline(),
      @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
    )
    assert_eq(
      value.minor_threshold(),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("25")),
      ),
    )
    assert_eq(
      value.minor_number(),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
      ),
    )
  }
  {
    let value = value.minor_locator().unwrap().logit_locator().unwrap()
    assert_eq(value.minor(), true)
    assert_eq(value.as_maxn_locator().nbins(), @ticker.MaxNBins::Auto)
    assert_eq(value.as_maxn_locator().steps().to_array(), [
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
    ])
  }
  let value = value.minor_named_formatter().unwrap().logit_formatter().unwrap()
  assert_eq(
    value.minor(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(true)),
  )
  assert_eq(value.one_half(), @ticker.LogValue::Text("\\frac{1}{2}"))
  assert_eq(
    value.overline(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_eq(
    value.minor_threshold(),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("25")),
    ),
  )
  assert_eq(
    value.minor_number(),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
    ),
  )
}

///|
fn scale_defaults_case_84() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(true)
  @config.set_formatter_use_offset(false)
  @config.set_formatter_use_locale(true)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(true, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(2))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-2),
    @bigint.BigInt::from_int(3),
  ])
  let value = axis()
  value.set_tick_layout(400.0, false)
  value.set_scale(@scale.Scale::Logit(clip=true))
  {
    let value = value.locator().unwrap().logit_locator().unwrap()
    assert_eq(value.minor(), false)
    assert_eq(value.as_maxn_locator().nbins(), @ticker.MaxNBins::Auto)
    assert_eq(value.as_maxn_locator().steps().to_array(), [
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
    ])
  }
  {
    let value = value.named_formatter().unwrap().logit_formatter().unwrap()
    assert_eq(
      value.minor(),
      @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
    )
    assert_eq(value.one_half(), @ticker.LogValue::Text("\\frac{1}{2}"))
    assert_eq(
      value.overline(),
      @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
    )
    assert_eq(
      value.minor_threshold(),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("25")),
      ),
    )
    assert_eq(
      value.minor_number(),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
      ),
    )
  }
  {
    let value = value.minor_locator().unwrap().logit_locator().unwrap()
    assert_eq(value.minor(), true)
    assert_eq(value.as_maxn_locator().nbins(), @ticker.MaxNBins::Auto)
    assert_eq(value.as_maxn_locator().steps().to_array(), [
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
    ])
  }
  let value = value.minor_named_formatter().unwrap().logit_formatter().unwrap()
  assert_eq(
    value.minor(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(true)),
  )
  assert_eq(value.one_half(), @ticker.LogValue::Text("\\frac{1}{2}"))
  assert_eq(
    value.overline(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_eq(
    value.minor_threshold(),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("25")),
    ),
  )
  assert_eq(
    value.minor_number(),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
    ),
  )
}

///|
fn scale_defaults_case_85() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(false)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(true, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  let value = axis()
  value.set_tick_layout(400.0, false)
  value.set_scale(@scale.Scale::Logit(clip=true))
  {
    let value = value.locator().unwrap().logit_locator().unwrap()
    assert_eq(value.minor(), false)
    assert_eq(value.as_maxn_locator().nbins(), @ticker.MaxNBins::Auto)
    assert_eq(value.as_maxn_locator().steps().to_array(), [
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
    ])
  }
  {
    let value = value.named_formatter().unwrap().logit_formatter().unwrap()
    assert_eq(
      value.minor(),
      @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
    )
    assert_eq(value.one_half(), @ticker.LogValue::Text("\\frac{1}{2}"))
    assert_eq(
      value.overline(),
      @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
    )
    assert_eq(
      value.minor_threshold(),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("25")),
      ),
    )
    assert_eq(
      value.minor_number(),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
      ),
    )
  }
  {
    let value = value.minor_locator().unwrap().logit_locator().unwrap()
    assert_eq(value.minor(), true)
    assert_eq(value.as_maxn_locator().nbins(), @ticker.MaxNBins::Auto)
    assert_eq(value.as_maxn_locator().steps().to_array(), [
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
    ])
  }
  let value = value.minor_named_formatter().unwrap().logit_formatter().unwrap()
  assert_eq(
    value.minor(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(true)),
  )
  assert_eq(value.one_half(), @ticker.LogValue::Text("\\frac{1}{2}"))
  assert_eq(
    value.overline(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_eq(
    value.minor_threshold(),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("25")),
    ),
  )
  assert_eq(
    value.minor_number(),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
    ),
  )
}

///|
fn scale_defaults_case_86() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(true)
  @config.set_formatter_use_offset(false)
  @config.set_formatter_use_locale(true)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(true)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(2))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-2),
    @bigint.BigInt::from_int(3),
  ])
  let value = axis()
  value.set_tick_layout(400.0, false)
  value.set_scale(@scale.Scale::Logit(clip=true))
  {
    let value = value.locator().unwrap().logit_locator().unwrap()
    assert_eq(value.minor(), false)
    assert_eq(value.as_maxn_locator().nbins(), @ticker.MaxNBins::Auto)
    assert_eq(value.as_maxn_locator().steps().to_array(), [
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
    ])
  }
  {
    let value = value.named_formatter().unwrap().logit_formatter().unwrap()
    assert_eq(
      value.minor(),
      @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
    )
    assert_eq(value.one_half(), @ticker.LogValue::Text("\\frac{1}{2}"))
    assert_eq(
      value.overline(),
      @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
    )
    assert_eq(
      value.minor_threshold(),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("25")),
      ),
    )
    assert_eq(
      value.minor_number(),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
      ),
    )
  }
  {
    let value = value.minor_locator().unwrap().logit_locator().unwrap()
    assert_eq(value.minor(), true)
    assert_eq(value.as_maxn_locator().nbins(), @ticker.MaxNBins::Auto)
    assert_eq(value.as_maxn_locator().steps().to_array(), [
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
    ])
  }
  let value = value.minor_named_formatter().unwrap().logit_formatter().unwrap()
  assert_eq(
    value.minor(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(true)),
  )
  assert_eq(value.one_half(), @ticker.LogValue::Text("\\frac{1}{2}"))
  assert_eq(
    value.overline(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_eq(
    value.minor_threshold(),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("25")),
    ),
  )
  assert_eq(
    value.minor_number(),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
    ),
  )
}

///|
fn scale_defaults_case_87() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(false)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(true)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  let value = axis()
  value.set_tick_layout(400.0, false)
  value.set_scale(@scale.Scale::Logit(clip=true))
  {
    let value = value.locator().unwrap().logit_locator().unwrap()
    assert_eq(value.minor(), false)
    assert_eq(value.as_maxn_locator().nbins(), @ticker.MaxNBins::Auto)
    assert_eq(value.as_maxn_locator().steps().to_array(), [
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
    ])
  }
  {
    let value = value.named_formatter().unwrap().logit_formatter().unwrap()
    assert_eq(
      value.minor(),
      @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
    )
    assert_eq(value.one_half(), @ticker.LogValue::Text("\\frac{1}{2}"))
    assert_eq(
      value.overline(),
      @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
    )
    assert_eq(
      value.minor_threshold(),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("25")),
      ),
    )
    assert_eq(
      value.minor_number(),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
      ),
    )
  }
  {
    let value = value.minor_locator().unwrap().logit_locator().unwrap()
    assert_eq(value.minor(), true)
    assert_eq(value.as_maxn_locator().nbins(), @ticker.MaxNBins::Auto)
    assert_eq(value.as_maxn_locator().steps().to_array(), [
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
    ])
  }
  let value = value.minor_named_formatter().unwrap().logit_formatter().unwrap()
  assert_eq(
    value.minor(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(true)),
  )
  assert_eq(value.one_half(), @ticker.LogValue::Text("\\frac{1}{2}"))
  assert_eq(
    value.overline(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_eq(
    value.minor_threshold(),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("25")),
    ),
  )
  assert_eq(
    value.minor_number(),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
    ),
  )
}

///|
fn scale_defaults_case_88() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(false)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  let value = axis()
  let geometry = @scale.Scale::Linear
  value.set_scale(geometry)
  let major = value.named_formatter().unwrap()
  let minor = value.minor_named_formatter().unwrap()
  value.set_scale(geometry)
  assert_true(!physical_equal(major, value.named_formatter().unwrap()))
  assert_true(!physical_equal(minor, value.minor_named_formatter().unwrap()))
  {
    let value = value.locator().unwrap().auto_locator().unwrap()
    assert_eq(value.nbins(), @ticker.MaxNBins::Auto)
    assert_eq(value.steps().to_array(), [
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4612811918334230528UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
    ])
  }
  {
    let value = value.named_formatter().unwrap().scalar_formatter().unwrap()
    assert_eq(value.get_use_offset(), true)
    assert_eq(value.get_use_locale(), false)
    assert_eq(value.get_use_math_text(), false)
    assert_eq(value.get_usetex(), false)
    assert_eq(value.offset_threshold(), @bigint.BigInt::from_string("4"))
    let limits = match value.power_limits() {
      @ticker.ScalarPowerLimits::Integers(values) => values
      _ => abort("integer limits")
    }
    assert_eq(limits, [
      @bigint.BigInt::from_string("-5"),
      @bigint.BigInt::from_string("6"),
    ])
  }
  assert_true(
    value.minor_named_formatter().unwrap().null_formatter() is Some(_),
  )
  assert_true(value.minor_locator().unwrap().null_locator() is Some(_))
}

///|
fn scale_defaults_case_89() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(false)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  let value = axis()
  let geometry = @scale.Scale::Log
  value.set_scale(geometry)
  let major = value.named_formatter().unwrap()
  let minor = value.minor_named_formatter().unwrap()
  value.set_scale(geometry)
  assert_true(!physical_equal(major, value.named_formatter().unwrap()))
  assert_true(!physical_equal(minor, value.minor_named_formatter().unwrap()))
  {
    let value = value.locator().unwrap().log_locator().unwrap()
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(value.numticks(), @ticker.LogNumTicks::Text("auto"))
    let subs = match value.subs() {
      @ticker.LogSubs::Values(values) => values
      _ => abort("numeric subs")
    }
    assert_eq(subs.to_array(), [4607182418800017408UL.reinterpret_as_double()])
  }
  {
    let value = value
      .named_formatter()
      .unwrap()
      .log_formatter_sci_notation()
      .unwrap()
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.label_only_base(),
      @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
    )
    assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
    let thresholds = match value.minor_thresholds() {
      Some(@ticker.LogMinorThresholds::Tuple(values)) => values
      _ => abort("tuple")
    }
    assert_eq(
      thresholds.get(0),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
      ),
    )
    assert_eq(
      thresholds.get(1),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Number(
          4600877379321698714UL.reinterpret_as_double(),
        ),
      ),
    )
  }
  {
    let value = value.minor_locator().unwrap().log_locator().unwrap()
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(value.numticks(), @ticker.LogNumTicks::Text("auto"))
    let subs = match value.subs() {
      @ticker.LogSubs::Text(text) => text
      _ => abort("text subs")
    }
    assert_eq(subs, "auto")
  }
  let value = value
    .minor_named_formatter()
    .unwrap()
    .log_formatter_sci_notation()
    .unwrap()
  scale_defaults_number(
    value.base(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(
    value.label_only_base(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
  let thresholds = match value.minor_thresholds() {
    Some(@ticker.LogMinorThresholds::Tuple(values)) => values
    _ => abort("tuple")
  }
  assert_eq(
    thresholds.get(0),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
    ),
  )
  assert_eq(
    thresholds.get(1),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Number(
        4600877379321698714UL.reinterpret_as_double(),
      ),
    ),
  )
}

///|
fn scale_defaults_case_90() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(false)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  let value = axis()
  let geometry = @scale.Scale::SymLog(
    linthresh=4607182418800017408UL.reinterpret_as_double(),
    linscale=4607182418800017408UL.reinterpret_as_double(),
    base=4621819117588971520UL.reinterpret_as_double(),
  )
  value.set_scale(geometry)
  let major = value.named_formatter().unwrap()
  let minor = value.minor_named_formatter().unwrap()
  value.set_scale(geometry)
  assert_true(!physical_equal(major, value.named_formatter().unwrap()))
  assert_true(!physical_equal(minor, value.minor_named_formatter().unwrap()))
  {
    let value = value.locator().unwrap().symlog_locator().unwrap()
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.linthresh(),
      4607182418800017408UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
    )
    let subs = match value.subs() {
      @ticker.SymLogSubs::Values(values) => values
      _ => abort("values")
    }
    assert_eq(subs.to_array(), [4607182418800017408UL.reinterpret_as_double()])
  }
  {
    let value = value
      .named_formatter()
      .unwrap()
      .log_formatter_sci_notation()
      .unwrap()
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.label_only_base(),
      @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
    )
    assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
    let thresholds = match value.minor_thresholds() {
      Some(@ticker.LogMinorThresholds::Tuple(values)) => values
      _ => abort("tuple")
    }
    assert_eq(
      thresholds.get(0),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
      ),
    )
    assert_eq(
      thresholds.get(1),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Number(
          4600877379321698714UL.reinterpret_as_double(),
        ),
      ),
    )
  }
  {
    let value = value.minor_locator().unwrap().symlog_locator().unwrap()
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.linthresh(),
      4607182418800017408UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
    )
    let subs = match value.subs() {
      @ticker.SymLogSubs::Values(values) => values
      _ => abort("values")
    }
    assert_eq(subs.to_array(), [4607182418800017408UL.reinterpret_as_double()])
  }
  assert_true(
    value.minor_named_formatter().unwrap().null_formatter() is Some(_),
  )
}

///|
fn scale_defaults_case_91() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(false)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  let value = axis()
  let geometry = @scale.Scale::SymLog(
    linthresh=4611686018427387904UL.reinterpret_as_double(),
    linscale=4602678819172646912UL.reinterpret_as_double(),
    base=4611686018427387904UL.reinterpret_as_double(),
  )
  value.set_scale(geometry)
  let major = value.named_formatter().unwrap()
  let minor = value.minor_named_formatter().unwrap()
  value.set_scale(geometry)
  assert_true(!physical_equal(major, value.named_formatter().unwrap()))
  assert_true(!physical_equal(minor, value.minor_named_formatter().unwrap()))
  {
    let value = value.locator().unwrap().symlog_locator().unwrap()
    scale_defaults_number(
      value.base(),
      4611686018427387904UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.linthresh(),
      4611686018427387904UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
    )
    let subs = match value.subs() {
      @ticker.SymLogSubs::Values(values) => values
      _ => abort("values")
    }
    assert_eq(subs.to_array(), [4607182418800017408UL.reinterpret_as_double()])
  }
  {
    let value = value
      .named_formatter()
      .unwrap()
      .log_formatter_sci_notation()
      .unwrap()
    scale_defaults_number(
      value.base(),
      4611686018427387904UL.reinterpret_as_double(),
    )
    assert_eq(
      value.label_only_base(),
      @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
    )
    assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
    let thresholds = match value.minor_thresholds() {
      Some(@ticker.LogMinorThresholds::Tuple(values)) => values
      _ => abort("tuple")
    }
    assert_eq(
      thresholds.get(0),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
      ),
    )
    assert_eq(
      thresholds.get(1),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Number(
          4600877379321698714UL.reinterpret_as_double(),
        ),
      ),
    )
  }
  {
    let value = value.minor_locator().unwrap().symlog_locator().unwrap()
    scale_defaults_number(
      value.base(),
      4611686018427387904UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.linthresh(),
      4611686018427387904UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
    )
    let subs = match value.subs() {
      @ticker.SymLogSubs::Values(values) => values
      _ => abort("values")
    }
    assert_eq(subs.to_array(), [4607182418800017408UL.reinterpret_as_double()])
  }
  assert_true(
    value.minor_named_formatter().unwrap().null_formatter() is Some(_),
  )
}

///|
fn scale_defaults_case_92() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(false)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  let value = axis()
  let geometry = @scale.Scale::Asinh(
    linear_width=4602678819172646912UL.reinterpret_as_double(),
  )
  value.set_scale(geometry)
  let major = value.named_formatter().unwrap()
  let minor = value.minor_named_formatter().unwrap()
  value.set_scale(geometry)
  assert_true(!physical_equal(major, value.named_formatter().unwrap()))
  assert_true(!physical_equal(minor, value.minor_named_formatter().unwrap()))
  {
    let value = value.locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      4602678819172646912UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    assert_true(value.subs() is None)
  }
  {
    let value = value.minor_locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      4602678819172646912UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    let subs = match value.subs() {
      Some(@ticker.AsinhSubs::Tuple(values)) => values
      _ => abort("immutable tuple")
    }
    assert_eq(subs.length(), 2)
    assert_eq(subs.values(), [
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ])
    assert_eq(subs, @ticker.asinh_default_minor_subs())
  }
  assert_true(
    value.minor_named_formatter().unwrap().null_formatter() is Some(_),
  )
  let value = value
    .named_formatter()
    .unwrap()
    .log_formatter_sci_notation()
    .unwrap()
  scale_defaults_number(
    value.base(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(
    value.label_only_base(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
  let thresholds = match value.minor_thresholds() {
    Some(@ticker.LogMinorThresholds::Tuple(values)) => values
    _ => abort("tuple")
  }
  assert_eq(
    thresholds.get(0),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
    ),
  )
  assert_eq(
    thresholds.get(1),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Number(
        4600877379321698714UL.reinterpret_as_double(),
      ),
    ),
  )
}

///|
fn scale_defaults_case_93() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(false)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  let value = axis()
  let geometry = @scale.Scale::Asinh(
    linear_width=4607182418800017408UL.reinterpret_as_double(),
  )
  value.set_scale(geometry)
  let major = value.named_formatter().unwrap()
  let minor = value.minor_named_formatter().unwrap()
  value.set_scale(geometry)
  assert_true(!physical_equal(major, value.named_formatter().unwrap()))
  assert_true(!physical_equal(minor, value.minor_named_formatter().unwrap()))
  {
    let value = value.locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      4607182418800017408UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    assert_true(value.subs() is None)
  }
  {
    let value = value.minor_locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      4607182418800017408UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    let subs = match value.subs() {
      Some(@ticker.AsinhSubs::Tuple(values)) => values
      _ => abort("immutable tuple")
    }
    assert_eq(subs.length(), 2)
    assert_eq(subs.values(), [
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ])
    assert_eq(subs, @ticker.asinh_default_minor_subs())
  }
  assert_true(
    value.minor_named_formatter().unwrap().null_formatter() is Some(_),
  )
  let value = value
    .named_formatter()
    .unwrap()
    .log_formatter_sci_notation()
    .unwrap()
  scale_defaults_number(
    value.base(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(
    value.label_only_base(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
  let thresholds = match value.minor_thresholds() {
    Some(@ticker.LogMinorThresholds::Tuple(values)) => values
    _ => abort("tuple")
  }
  assert_eq(
    thresholds.get(0),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
    ),
  )
  assert_eq(
    thresholds.get(1),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Number(
        4600877379321698714UL.reinterpret_as_double(),
      ),
    ),
  )
}

///|
fn scale_defaults_case_94() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(false)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  let value = axis()
  let geometry = @scale.Scale::Asinh(
    linear_width=4613937818241073152UL.reinterpret_as_double(),
  )
  value.set_scale(geometry)
  let major = value.named_formatter().unwrap()
  let minor = value.minor_named_formatter().unwrap()
  value.set_scale(geometry)
  assert_true(!physical_equal(major, value.named_formatter().unwrap()))
  assert_true(!physical_equal(minor, value.minor_named_formatter().unwrap()))
  {
    let value = value.locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      4613937818241073152UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    assert_true(value.subs() is None)
  }
  {
    let value = value.minor_locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      4613937818241073152UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    let subs = match value.subs() {
      Some(@ticker.AsinhSubs::Tuple(values)) => values
      _ => abort("immutable tuple")
    }
    assert_eq(subs.length(), 2)
    assert_eq(subs.values(), [
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ])
    assert_eq(subs, @ticker.asinh_default_minor_subs())
  }
  assert_true(
    value.minor_named_formatter().unwrap().null_formatter() is Some(_),
  )
  let value = value
    .named_formatter()
    .unwrap()
    .log_formatter_sci_notation()
    .unwrap()
  scale_defaults_number(
    value.base(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(
    value.label_only_base(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
  let thresholds = match value.minor_thresholds() {
    Some(@ticker.LogMinorThresholds::Tuple(values)) => values
    _ => abort("tuple")
  }
  assert_eq(
    thresholds.get(0),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
    ),
  )
  assert_eq(
    thresholds.get(1),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Number(
        4600877379321698714UL.reinterpret_as_double(),
      ),
    ),
  )
}

///|
fn scale_defaults_case_95() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(false)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  let value = axis()
  let geometry = @scale.Scale::Asinh(
    linear_width=9221120237041090560UL.reinterpret_as_double(),
  )
  value.set_scale(geometry)
  let major = value.named_formatter().unwrap()
  let minor = value.minor_named_formatter().unwrap()
  value.set_scale(geometry)
  assert_true(!physical_equal(major, value.named_formatter().unwrap()))
  assert_true(!physical_equal(minor, value.minor_named_formatter().unwrap()))
  {
    let value = value.locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      9221120237041090560UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    assert_true(value.subs() is None)
  }
  {
    let value = value.minor_locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      9221120237041090560UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    let subs = match value.subs() {
      Some(@ticker.AsinhSubs::Tuple(values)) => values
      _ => abort("immutable tuple")
    }
    assert_eq(subs.length(), 2)
    assert_eq(subs.values(), [
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ])
    assert_eq(subs, @ticker.asinh_default_minor_subs())
  }
  assert_true(
    value.minor_named_formatter().unwrap().null_formatter() is Some(_),
  )
  let value = value
    .named_formatter()
    .unwrap()
    .log_formatter_sci_notation()
    .unwrap()
  scale_defaults_number(
    value.base(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(
    value.label_only_base(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
  let thresholds = match value.minor_thresholds() {
    Some(@ticker.LogMinorThresholds::Tuple(values)) => values
    _ => abort("tuple")
  }
  assert_eq(
    thresholds.get(0),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
    ),
  )
  assert_eq(
    thresholds.get(1),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Number(
        4600877379321698714UL.reinterpret_as_double(),
      ),
    ),
  )
}

///|
fn scale_defaults_case_96() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(false)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  let value = axis()
  let geometry = @scale.Scale::Asinh(
    linear_width=9218868437227405312UL.reinterpret_as_double(),
  )
  value.set_scale(geometry)
  let major = value.named_formatter().unwrap()
  let minor = value.minor_named_formatter().unwrap()
  value.set_scale(geometry)
  assert_true(!physical_equal(major, value.named_formatter().unwrap()))
  assert_true(!physical_equal(minor, value.minor_named_formatter().unwrap()))
  {
    let value = value.locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      9218868437227405312UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    assert_true(value.subs() is None)
  }
  {
    let value = value.minor_locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      9218868437227405312UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    let subs = match value.subs() {
      Some(@ticker.AsinhSubs::Tuple(values)) => values
      _ => abort("immutable tuple")
    }
    assert_eq(subs.length(), 2)
    assert_eq(subs.values(), [
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ])
    assert_eq(subs, @ticker.asinh_default_minor_subs())
  }
  assert_true(
    value.minor_named_formatter().unwrap().null_formatter() is Some(_),
  )
  let value = value
    .named_formatter()
    .unwrap()
    .log_formatter_sci_notation()
    .unwrap()
  scale_defaults_number(
    value.base(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(
    value.label_only_base(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
  let thresholds = match value.minor_thresholds() {
    Some(@ticker.LogMinorThresholds::Tuple(values)) => values
    _ => abort("tuple")
  }
  assert_eq(
    thresholds.get(0),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("1")),
    ),
  )
  assert_eq(
    thresholds.get(1),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Number(
        4600877379321698714UL.reinterpret_as_double(),
      ),
    ),
  )
}

///|
fn scale_defaults_case_97() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(false)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  let value = axis()
  let geometry = @scale.Scale::Logit(clip=false)
  value.set_scale(geometry)
  let major = value.named_formatter().unwrap()
  let minor = value.minor_named_formatter().unwrap()
  value.set_scale(geometry)
  assert_true(!physical_equal(major, value.named_formatter().unwrap()))
  assert_true(!physical_equal(minor, value.minor_named_formatter().unwrap()))
  {
    let value = value.locator().unwrap().logit_locator().unwrap()
    assert_eq(value.minor(), false)
    assert_eq(value.as_maxn_locator().nbins(), @ticker.MaxNBins::Auto)
    assert_eq(value.as_maxn_locator().steps().to_array(), [
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
    ])
  }
  {
    let value = value.named_formatter().unwrap().logit_formatter().unwrap()
    assert_eq(
      value.minor(),
      @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
    )
    assert_eq(value.one_half(), @ticker.LogValue::Text("\\frac{1}{2}"))
    assert_eq(
      value.overline(),
      @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
    )
    assert_eq(
      value.minor_threshold(),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("25")),
      ),
    )
    assert_eq(
      value.minor_number(),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
      ),
    )
  }
  {
    let value = value.minor_locator().unwrap().logit_locator().unwrap()
    assert_eq(value.minor(), true)
    assert_eq(value.as_maxn_locator().nbins(), @ticker.MaxNBins::Auto)
    assert_eq(value.as_maxn_locator().steps().to_array(), [
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
    ])
  }
  let value = value.minor_named_formatter().unwrap().logit_formatter().unwrap()
  assert_eq(
    value.minor(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(true)),
  )
  assert_eq(value.one_half(), @ticker.LogValue::Text("\\frac{1}{2}"))
  assert_eq(
    value.overline(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_eq(
    value.minor_threshold(),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("25")),
    ),
  )
  assert_eq(
    value.minor_number(),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
    ),
  )
}

///|
fn scale_defaults_case_98() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(false)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  let value = axis()
  let geometry = @scale.Scale::Logit(clip=true)
  value.set_scale(geometry)
  let major = value.named_formatter().unwrap()
  let minor = value.minor_named_formatter().unwrap()
  value.set_scale(geometry)
  assert_true(!physical_equal(major, value.named_formatter().unwrap()))
  assert_true(!physical_equal(minor, value.minor_named_formatter().unwrap()))
  {
    let value = value.locator().unwrap().logit_locator().unwrap()
    assert_eq(value.minor(), false)
    assert_eq(value.as_maxn_locator().nbins(), @ticker.MaxNBins::Auto)
    assert_eq(value.as_maxn_locator().steps().to_array(), [
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
    ])
  }
  {
    let value = value.named_formatter().unwrap().logit_formatter().unwrap()
    assert_eq(
      value.minor(),
      @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
    )
    assert_eq(value.one_half(), @ticker.LogValue::Text("\\frac{1}{2}"))
    assert_eq(
      value.overline(),
      @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
    )
    assert_eq(
      value.minor_threshold(),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("25")),
      ),
    )
    assert_eq(
      value.minor_number(),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
      ),
    )
  }
  {
    let value = value.minor_locator().unwrap().logit_locator().unwrap()
    assert_eq(value.minor(), true)
    assert_eq(value.as_maxn_locator().nbins(), @ticker.MaxNBins::Auto)
    assert_eq(value.as_maxn_locator().steps().to_array(), [
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
    ])
  }
  let value = value.minor_named_formatter().unwrap().logit_formatter().unwrap()
  assert_eq(
    value.minor(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(true)),
  )
  assert_eq(value.one_half(), @ticker.LogValue::Text("\\frac{1}{2}"))
  assert_eq(
    value.overline(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_eq(
    value.minor_threshold(),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("25")),
    ),
  )
  assert_eq(
    value.minor_number(),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
    ),
  )
}

///|
fn scale_defaults_case_99() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(false)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  let value = axis()
  let geometry = @scale.Scale::Linear
  value.set_scale(geometry)
  let retained_major = value.named_formatter().unwrap()
  @config.set_classic_mode(true)
  @config.set_minor_ticks_visible(true)
  @config.set_minor_ticks_visible(true, horizontal=false)
  @config.set_formatter_use_offset(false)
  @config.set_formatter_use_locale(true)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(2))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-2),
    @bigint.BigInt::from_int(3),
  ])
  value.set_scale(geometry)
  assert_true(!physical_equal(retained_major, value.named_formatter().unwrap()))
  {
    let value = value.locator().unwrap().auto_locator().unwrap()
    assert_eq(value.nbins(), @ticker.MaxNBins::Count(9))
    assert_eq(value.steps().to_array(), [
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
    ])
  }
  {
    let value = value.named_formatter().unwrap().scalar_formatter().unwrap()
    assert_eq(value.get_use_offset(), false)
    assert_eq(value.get_use_locale(), true)
    assert_eq(value.get_use_math_text(), false)
    assert_eq(value.get_usetex(), false)
    assert_eq(value.offset_threshold(), @bigint.BigInt::from_string("2"))
    let limits = match value.power_limits() {
      @ticker.ScalarPowerLimits::Integers(values) => values
      _ => abort("integer limits")
    }
    assert_eq(limits, [
      @bigint.BigInt::from_string("-2"),
      @bigint.BigInt::from_string("3"),
    ])
  }
  assert_true(
    value.minor_named_formatter().unwrap().null_formatter() is Some(_),
  )
  {
    let value = value.minor_locator().unwrap().auto_minor_locator().unwrap()
    assert_true(value.ndivs() is None)
  }
  let retained = retained_major.scalar_formatter().unwrap()
  assert_true(retained.get_use_offset())
  assert_true(!retained.get_use_locale())
  assert_eq(retained.offset_threshold(), @bigint.BigInt::from_int(4))
}

///|
fn scale_defaults_case_100() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(false)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  let value = axis()
  let geometry = @scale.Scale::Log
  value.set_scale(geometry)
  let retained_major = value.named_formatter().unwrap()
  @config.set_classic_mode(true)
  @config.set_minor_ticks_visible(true)
  @config.set_minor_ticks_visible(true, horizontal=false)
  @config.set_formatter_use_offset(false)
  @config.set_formatter_use_locale(true)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(2))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-2),
    @bigint.BigInt::from_int(3),
  ])
  value.set_scale(geometry)
  assert_true(!physical_equal(retained_major, value.named_formatter().unwrap()))
  {
    let value = value.locator().unwrap().log_locator().unwrap()
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
    )
    let subs = match value.subs() {
      @ticker.LogSubs::Values(values) => values
      _ => abort("numeric subs")
    }
    assert_eq(subs.to_array(), [4607182418800017408UL.reinterpret_as_double()])
  }
  {
    let value = value
      .named_formatter()
      .unwrap()
      .log_formatter_sci_notation()
      .unwrap()
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.label_only_base(),
      @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
    )
    assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
    let thresholds = match value.minor_thresholds() {
      Some(@ticker.LogMinorThresholds::Tuple(values)) => values
      _ => abort("tuple")
    }
    assert_eq(
      thresholds.get(0),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
      ),
    )
    assert_eq(
      thresholds.get(1),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
      ),
    )
  }
  {
    let value = value.minor_locator().unwrap().log_locator().unwrap()
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
    )
    let subs = match value.subs() {
      @ticker.LogSubs::Text(text) => text
      _ => abort("text subs")
    }
    assert_eq(subs, "auto")
  }
  {
    let value = value
      .minor_named_formatter()
      .unwrap()
      .log_formatter_sci_notation()
      .unwrap()
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.label_only_base(),
      @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
    )
    assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
    let thresholds = match value.minor_thresholds() {
      Some(@ticker.LogMinorThresholds::Tuple(values)) => values
      _ => abort("tuple")
    }
    assert_eq(
      thresholds.get(0),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
      ),
    )
    assert_eq(
      thresholds.get(1),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
      ),
    )
  }
  let retained = retained_major.log_formatter_sci_notation().unwrap()
  let thresholds = match retained.minor_thresholds() {
    Some(@ticker.LogMinorThresholds::Tuple(values)) => values
    _ => abort("tuple")
  }
  assert_eq(
    thresholds.get(0),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_int(1)),
    ),
  )
}

///|
fn scale_defaults_case_101() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(false)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  let value = axis()
  let geometry = @scale.Scale::SymLog(
    linthresh=4607182418800017408UL.reinterpret_as_double(),
    linscale=4607182418800017408UL.reinterpret_as_double(),
    base=4621819117588971520UL.reinterpret_as_double(),
  )
  value.set_scale(geometry)
  let retained_major = value.named_formatter().unwrap()
  @config.set_classic_mode(true)
  @config.set_minor_ticks_visible(true)
  @config.set_minor_ticks_visible(true, horizontal=false)
  @config.set_formatter_use_offset(false)
  @config.set_formatter_use_locale(true)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(2))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-2),
    @bigint.BigInt::from_int(3),
  ])
  value.set_scale(geometry)
  assert_true(!physical_equal(retained_major, value.named_formatter().unwrap()))
  {
    let value = value.locator().unwrap().symlog_locator().unwrap()
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.linthresh(),
      4607182418800017408UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
    )
    let subs = match value.subs() {
      @ticker.SymLogSubs::Values(values) => values
      _ => abort("values")
    }
    assert_eq(subs.to_array(), [4607182418800017408UL.reinterpret_as_double()])
  }
  {
    let value = value
      .named_formatter()
      .unwrap()
      .log_formatter_sci_notation()
      .unwrap()
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.label_only_base(),
      @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
    )
    assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
    let thresholds = match value.minor_thresholds() {
      Some(@ticker.LogMinorThresholds::Tuple(values)) => values
      _ => abort("tuple")
    }
    assert_eq(
      thresholds.get(0),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
      ),
    )
    assert_eq(
      thresholds.get(1),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
      ),
    )
  }
  {
    let value = value.minor_locator().unwrap().symlog_locator().unwrap()
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.linthresh(),
      4607182418800017408UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("15")),
    )
    let subs = match value.subs() {
      @ticker.SymLogSubs::Values(values) => values
      _ => abort("values")
    }
    assert_eq(subs.to_array(), [4607182418800017408UL.reinterpret_as_double()])
  }
  assert_true(
    value.minor_named_formatter().unwrap().null_formatter() is Some(_),
  )
  let retained = retained_major.log_formatter_sci_notation().unwrap()
  let thresholds = match retained.minor_thresholds() {
    Some(@ticker.LogMinorThresholds::Tuple(values)) => values
    _ => abort("tuple")
  }
  assert_eq(
    thresholds.get(0),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_int(1)),
    ),
  )
}

///|
fn scale_defaults_case_102() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(false)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  let value = axis()
  let geometry = @scale.Scale::Asinh(
    linear_width=4607182418800017408UL.reinterpret_as_double(),
  )
  value.set_scale(geometry)
  let retained_major = value.named_formatter().unwrap()
  @config.set_classic_mode(true)
  @config.set_minor_ticks_visible(true)
  @config.set_minor_ticks_visible(true, horizontal=false)
  @config.set_formatter_use_offset(false)
  @config.set_formatter_use_locale(true)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(2))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-2),
    @bigint.BigInt::from_int(3),
  ])
  value.set_scale(geometry)
  assert_true(!physical_equal(retained_major, value.named_formatter().unwrap()))
  {
    let value = value.locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      4607182418800017408UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    assert_true(value.subs() is None)
  }
  {
    let value = value.minor_locator().unwrap().asinh_locator().unwrap()
    scale_defaults_number(
      value.linear_width(),
      4607182418800017408UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.symthresh(),
      4596373779694328218UL.reinterpret_as_double(),
    )
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.numticks().unwrap(),
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11")),
    )
    let subs = match value.subs() {
      Some(@ticker.AsinhSubs::Tuple(values)) => values
      _ => abort("immutable tuple")
    }
    assert_eq(subs.length(), 2)
    assert_eq(subs.values(), [
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ])
    assert_eq(subs, @ticker.asinh_default_minor_subs())
  }
  assert_true(
    value.minor_named_formatter().unwrap().null_formatter() is Some(_),
  )
  {
    let value = value
      .named_formatter()
      .unwrap()
      .log_formatter_sci_notation()
      .unwrap()
    scale_defaults_number(
      value.base(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    assert_eq(
      value.label_only_base(),
      @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
    )
    assert_eq(value.linthresh(), @ticker.LogValue::NoneValue)
    let thresholds = match value.minor_thresholds() {
      Some(@ticker.LogMinorThresholds::Tuple(values)) => values
      _ => abort("tuple")
    }
    assert_eq(
      thresholds.get(0),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
      ),
    )
    assert_eq(
      thresholds.get(1),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
      ),
    )
  }
  let retained = retained_major.log_formatter_sci_notation().unwrap()
  let thresholds = match retained.minor_thresholds() {
    Some(@ticker.LogMinorThresholds::Tuple(values)) => values
    _ => abort("tuple")
  }
  assert_eq(
    thresholds.get(0),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_int(1)),
    ),
  )
}

///|
fn scale_defaults_case_103() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_classic_mode(previous.classic_mode())
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_offset_threshold(
      previous.formatter_offset_threshold(),
    )
    @config.set_formatter_limits(previous.formatter_limits())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_classic_mode(false)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_locale(false)
  @config.set_formatter_use_math_text(false)
  @config.set_text_usetex(false)
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(4))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-5),
    @bigint.BigInt::from_int(6),
  ])
  let value = axis()
  let geometry = @scale.Scale::Logit(clip=true)
  value.set_scale(geometry)
  let retained_major = value.named_formatter().unwrap()
  @config.set_classic_mode(true)
  @config.set_minor_ticks_visible(true)
  @config.set_minor_ticks_visible(true, horizontal=false)
  @config.set_formatter_use_offset(false)
  @config.set_formatter_use_locale(true)
  @config.set_formatter_offset_threshold(@bigint.BigInt::from_int(2))
  @config.set_formatter_limits([
    @bigint.BigInt::from_int(-2),
    @bigint.BigInt::from_int(3),
  ])
  value.set_scale(geometry)
  assert_true(!physical_equal(retained_major, value.named_formatter().unwrap()))
  {
    let value = value.locator().unwrap().logit_locator().unwrap()
    assert_eq(value.minor(), false)
    assert_eq(value.as_maxn_locator().nbins(), @ticker.MaxNBins::Auto)
    assert_eq(value.as_maxn_locator().steps().to_array(), [
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
    ])
  }
  {
    let value = value.named_formatter().unwrap().logit_formatter().unwrap()
    assert_eq(
      value.minor(),
      @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
    )
    assert_eq(value.one_half(), @ticker.LogValue::Text("\\frac{1}{2}"))
    assert_eq(
      value.overline(),
      @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
    )
    assert_eq(
      value.minor_threshold(),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("25")),
      ),
    )
    assert_eq(
      value.minor_number(),
      @ticker.LogValue::Numeric(
        @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
      ),
    )
  }
  {
    let value = value.minor_locator().unwrap().logit_locator().unwrap()
    assert_eq(value.minor(), true)
    assert_eq(value.as_maxn_locator().nbins(), @ticker.MaxNBins::Auto)
    assert_eq(value.as_maxn_locator().steps().to_array(), [
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
    ])
  }
  let value = value.minor_named_formatter().unwrap().logit_formatter().unwrap()
  assert_eq(
    value.minor(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(true)),
  )
  assert_eq(value.one_half(), @ticker.LogValue::Text("\\frac{1}{2}"))
  assert_eq(
    value.overline(),
    @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_eq(
    value.minor_threshold(),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("25")),
    ),
  )
  assert_eq(
    value.minor_number(),
    @ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Integer(@bigint.BigInt::from_string("6")),
    ),
  )
}

///|
fn scale_defaults_case_104() -> Unit raise {
  let owner = []
  let tuple = @ticker.AsinhSubsTuple::new(owner)
  let locator = @ticker.AsinhLocator::new(
    1.0,
    subs=Some(@ticker.AsinhSubs::Tuple(tuple)),
  )
  let copied = locator.copy()
  let copy_tuple = match copied.subs() {
    Some(@ticker.AsinhSubs::Tuple(value)) => value
    _ => abort("tuple")
  }
  assert_eq(copy_tuple, tuple)
  let exported = tuple.values()
  exported.clear()
  assert_eq(tuple.length(), 0)
  owner.clear()
  assert_eq(tuple.length(), 0)
  locator.set_params(
    subs=Some(@ticker.AsinhSubs::Tuple(@ticker.AsinhSubsTuple::new([]))),
  )
  assert_true(locator.subs() is None)
  assert_eq(copy_tuple.length(), 0)
}

///|
fn scale_defaults_case_105() -> Unit raise {
  let owner = [
    4611686018427387904UL.reinterpret_as_double(),
    4617315517961601024UL.reinterpret_as_double(),
  ]
  let tuple = @ticker.AsinhSubsTuple::new(owner)
  let locator = @ticker.AsinhLocator::new(
    1.0,
    subs=Some(@ticker.AsinhSubs::Tuple(tuple)),
  )
  let copied = locator.copy()
  let copy_tuple = match copied.subs() {
    Some(@ticker.AsinhSubs::Tuple(value)) => value
    _ => abort("tuple")
  }
  assert_eq(copy_tuple, tuple)
  let exported = tuple.values()
  exported.clear()
  assert_eq(tuple.length(), 2)
  owner.clear()
  assert_eq(tuple.length(), 2)
  locator.set_params(
    subs=Some(@ticker.AsinhSubs::Tuple(@ticker.AsinhSubsTuple::new([]))),
  )
  assert_true(locator.subs() is None)
  assert_eq(copy_tuple.length(), 2)
}

///|
fn scale_defaults_case_106() -> Unit raise {
  let owner = [0UL.reinterpret_as_double()]
  let tuple = @ticker.AsinhSubsTuple::new(owner)
  let locator = @ticker.AsinhLocator::new(
    1.0,
    subs=Some(@ticker.AsinhSubs::Tuple(tuple)),
  )
  let copied = locator.copy()
  let copy_tuple = match copied.subs() {
    Some(@ticker.AsinhSubs::Tuple(value)) => value
    _ => abort("tuple")
  }
  assert_eq(copy_tuple, tuple)
  let exported = tuple.values()
  exported.clear()
  assert_eq(tuple.length(), 1)
  owner.clear()
  assert_eq(tuple.length(), 1)
  locator.set_params(
    subs=Some(@ticker.AsinhSubs::Tuple(@ticker.AsinhSubsTuple::new([]))),
  )
  assert_true(locator.subs() is None)
  assert_eq(copy_tuple.length(), 1)
}

///|
fn scale_defaults_case_107() -> Unit raise {
  let owner = [
    9221120237041090560UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ]
  let tuple = @ticker.AsinhSubsTuple::new(owner)
  let locator = @ticker.AsinhLocator::new(
    1.0,
    subs=Some(@ticker.AsinhSubs::Tuple(tuple)),
  )
  let copied = locator.copy()
  let copy_tuple = match copied.subs() {
    Some(@ticker.AsinhSubs::Tuple(value)) => value
    _ => abort("tuple")
  }
  assert_eq(copy_tuple, tuple)
  let exported = tuple.values()
  exported.clear()
  assert_eq(tuple.length(), 2)
  owner.clear()
  assert_eq(tuple.length(), 2)
  locator.set_params(
    subs=Some(@ticker.AsinhSubs::Tuple(@ticker.AsinhSubsTuple::new([]))),
  )
  assert_true(locator.subs() is None)
  assert_eq(copy_tuple.length(), 2)
}

///|
fn scale_defaults_case_108() -> Unit raise {
  let locator = @ticker.AsinhLocator::new(
    1.0,
    subs=Some(@ticker.AsinhSubs::Tuple(@ticker.AsinhSubsTuple::new([]))),
  )
  let values = locator.tick_values(-100.0, 100.0)
  let expected = [
    13860109328209412096UL.reinterpret_as_double(),
    13845191154443747328UL.reinterpret_as_double(),
    13830554455654793216UL.reinterpret_as_double(),
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
    4621819117588971520UL.reinterpret_as_double(),
    4636737291354636288UL.reinterpret_as_double(),
  ]
  assert_eq(values.length(), expected.length())
  for index, value in values {
    scale_defaults_number(value, expected[index])
  }
}

///|
fn scale_defaults_case_109() -> Unit raise {
  let locator = @ticker.AsinhLocator::new(
    1.0,
    subs=Some(
      @ticker.AsinhSubs::Tuple(
        @ticker.AsinhSubsTuple::new([
          4611686018427387904UL.reinterpret_as_double(),
          4617315517961601024UL.reinterpret_as_double(),
        ]),
      ),
    ),
  )
  let values = locator.tick_values(-100.0, 100.0)
  let expected = [
    13870875746068594688UL.reinterpret_as_double(),
    13864612927836782592UL.reinterpret_as_double(),
    13855605728582041600UL.reinterpret_as_double(),
    13849694754071117824UL.reinterpret_as_double(),
    13840687554816376832UL.reinterpret_as_double(),
    13835058055282163712UL.reinterpret_as_double(),
    0UL.reinterpret_as_double(),
    4611686018427387904UL.reinterpret_as_double(),
    4617315517961601024UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
    4632233691727265792UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
    4647503709213818880UL.reinterpret_as_double(),
  ]
  assert_eq(values.length(), expected.length())
  for index, value in values {
    scale_defaults_number(value, expected[index])
  }
}

///|
fn scale_defaults_case_110() -> Unit raise {
  let locator = @ticker.AsinhLocator::new(
    1.0,
    subs=Some(
      @ticker.AsinhSubs::Tuple(
        @ticker.AsinhSubsTuple::new([0UL.reinterpret_as_double()]),
      ),
    ),
  )
  let values = locator.tick_values(-100.0, 100.0)
  let expected = [
    13860109328209412096UL.reinterpret_as_double(),
    13858701953325858816UL.reinterpret_as_double(),
    13857013103465594880UL.reinterpret_as_double(),
    13854198353698488320UL.reinterpret_as_double(),
    13849694754071117824UL.reinterpret_as_double(),
    0UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
    4633641066610819072UL.reinterpret_as_double(),
    4635329916471083008UL.reinterpret_as_double(),
    4636737291354636288UL.reinterpret_as_double(),
  ]
  assert_eq(values.length(), expected.length())
  for index, value in values {
    scale_defaults_number(value, expected[index])
  }
}

///|
fn scale_defaults_case_111() -> Unit raise {
  let locator = @ticker.AsinhLocator::new(
    1.0,
    subs=Some(
      @ticker.AsinhSubs::Tuple(
        @ticker.AsinhSubsTuple::new([
          13830554455654793216UL.reinterpret_as_double(),
          4607182418800017408UL.reinterpret_as_double(),
        ]),
      ),
    ),
  )
  let values = locator.tick_values(-100.0, 100.0)
  let expected = [
    13860109328209412096UL.reinterpret_as_double(),
    13845191154443747328UL.reinterpret_as_double(),
    13830554455654793216UL.reinterpret_as_double(),
    9223372036854775808UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
    4621819117588971520UL.reinterpret_as_double(),
    4636737291354636288UL.reinterpret_as_double(),
  ]
  assert_eq(values.length(), expected.length())
  for index, value in values {
    scale_defaults_number(value, expected[index])
  }
}

///|
test "scale default parameters source group 0" {
  scale_defaults_case_0()
  scale_defaults_case_1()
  scale_defaults_case_2()
  scale_defaults_case_3()
  scale_defaults_case_4()
  scale_defaults_case_5()
  scale_defaults_case_6()
  scale_defaults_case_7()
  scale_defaults_case_8()
  scale_defaults_case_9()
  scale_defaults_case_10()
  scale_defaults_case_11()
  scale_defaults_case_12()
  scale_defaults_case_13()
  scale_defaults_case_14()
  scale_defaults_case_15()
  scale_defaults_case_16()
  scale_defaults_case_17()
  scale_defaults_case_18()
  scale_defaults_case_19()
  scale_defaults_case_20()
  scale_defaults_case_21()
  scale_defaults_case_22()
  scale_defaults_case_23()
  scale_defaults_case_24()
  scale_defaults_case_25()
  scale_defaults_case_26()
  scale_defaults_case_27()
  scale_defaults_case_28()
  scale_defaults_case_29()
  scale_defaults_case_30()
  scale_defaults_case_31()
}

///|
test "scale default parameters source group 1" {
  scale_defaults_case_32()
  scale_defaults_case_33()
  scale_defaults_case_34()
  scale_defaults_case_35()
  scale_defaults_case_36()
  scale_defaults_case_37()
  scale_defaults_case_38()
  scale_defaults_case_39()
  scale_defaults_case_40()
  scale_defaults_case_41()
  scale_defaults_case_42()
  scale_defaults_case_43()
  scale_defaults_case_44()
  scale_defaults_case_45()
  scale_defaults_case_46()
  scale_defaults_case_47()
  scale_defaults_case_48()
  scale_defaults_case_49()
  scale_defaults_case_50()
  scale_defaults_case_51()
  scale_defaults_case_52()
  scale_defaults_case_53()
  scale_defaults_case_54()
  scale_defaults_case_55()
  scale_defaults_case_56()
  scale_defaults_case_57()
  scale_defaults_case_58()
  scale_defaults_case_59()
  scale_defaults_case_60()
  scale_defaults_case_61()
  scale_defaults_case_62()
  scale_defaults_case_63()
}

///|
test "scale default parameters source group 2" {
  scale_defaults_case_64()
  scale_defaults_case_65()
  scale_defaults_case_66()
  scale_defaults_case_67()
  scale_defaults_case_68()
  scale_defaults_case_69()
  scale_defaults_case_70()
  scale_defaults_case_71()
  scale_defaults_case_72()
  scale_defaults_case_73()
  scale_defaults_case_74()
  scale_defaults_case_75()
  scale_defaults_case_76()
  scale_defaults_case_77()
  scale_defaults_case_78()
  scale_defaults_case_79()
  scale_defaults_case_80()
  scale_defaults_case_81()
  scale_defaults_case_82()
  scale_defaults_case_83()
  scale_defaults_case_84()
  scale_defaults_case_85()
  scale_defaults_case_86()
  scale_defaults_case_87()
  scale_defaults_case_88()
  scale_defaults_case_89()
  scale_defaults_case_90()
  scale_defaults_case_91()
  scale_defaults_case_92()
  scale_defaults_case_93()
  scale_defaults_case_94()
  scale_defaults_case_95()
}

///|
test "scale default parameters source group 3" {
  scale_defaults_case_96()
  scale_defaults_case_97()
  scale_defaults_case_98()
  scale_defaults_case_99()
  scale_defaults_case_100()
  scale_defaults_case_101()
  scale_defaults_case_102()
  scale_defaults_case_103()
  scale_defaults_case_104()
  scale_defaults_case_105()
  scale_defaults_case_106()
  scale_defaults_case_107()
  scale_defaults_case_108()
  scale_defaults_case_109()
  scale_defaults_case_110()
  scale_defaults_case_111()
}
