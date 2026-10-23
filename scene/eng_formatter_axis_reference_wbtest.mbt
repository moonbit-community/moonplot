// Complete original EngFormatter and actual Axis lifecycle.

///|
// Original source case 86: complete original Eng secondary physical stage
fn eng_axis_physical_case_86() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = figure(width=1000, height=800)
  let axes = figure.add_axes(0.04, 0.075, 0.1, 0.1)
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(false)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  let secondary = axes.secondary_xaxis(fn(value) { return value }, fn(value) {
    return value
  })
  secondary.set_locator(@ticker.NullLocator::new().as_locator())
  secondary.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  secondary.set_named_formatter(f.as_base_formatter())
  assert_eq(f.format_data_short(0.123456789), "0.123")
  let (origin, length) = secondary.formatter_geometry
  assert_eq(origin, 0.0)
  assert_eq(length, 1000.0)
}

///|
// Original source case 87: complete original Eng secondary physical stage
fn eng_axis_physical_case_87() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = figure(width=1000, height=800)
  let axes = figure.add_axes(0.04, 0.075, 0.1, 0.1)
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(false)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  let secondary = axes.secondary_xaxis(fn(value) { return value }, fn(value) {
    return value
  })
  secondary.set_locator(@ticker.NullLocator::new().as_locator())
  secondary.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  secondary.set_named_formatter(f.as_base_formatter())
  secondary.apply_aspect()
  assert_eq(f.format_data_short(0.123456789), "0.123")
  let (origin, length) = secondary.formatter_geometry
  assert_eq(origin, 0.0)
  assert_eq(length, 1000.0)
}

///|
// Original source case 88: complete original Eng secondary physical stage
fn eng_axis_physical_case_88() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = figure(width=1000, height=800)
  let axes = figure.add_axes(0.04, 0.075, 0.1, 0.1)
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(false)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  let secondary = axes.secondary_xaxis(fn(value) { return value }, fn(value) {
    return value
  })
  secondary.set_locator(@ticker.NullLocator::new().as_locator())
  secondary.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  secondary.set_named_formatter(f.as_base_formatter())
  secondary.apply_aspect()
  ignore(figure.to_svg_checked())
  assert_eq(f.format_data_short(0.123456789), "0.12")
  let (origin, length) = secondary.formatter_geometry
  assert_eq(origin, 40.0)
  assert_eq(length, 100.0)
}

///|
// Original source case 89: complete original Eng secondary physical stage
fn eng_axis_physical_case_89() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = figure(width=1000, height=800)
  let axes = figure.add_axes(0.04, 0.075, 0.1, 0.1)
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(false)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  let secondary = axes.secondary_xaxis(fn(value) { return value }, fn(value) {
    return value
  })
  secondary.set_locator(@ticker.NullLocator::new().as_locator())
  secondary.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  secondary.set_named_formatter(f.as_base_formatter())
  secondary.apply_aspect()
  ignore(figure.to_svg_checked())
  assert_eq(f.format_data_short(0.123456789), "0.12")
  let (origin, length) = secondary.formatter_geometry
  assert_eq(origin, 40.0)
  assert_eq(length, 100.0)
}

///|
// Original source case 90: complete original Eng secondary physical stage
fn eng_axis_physical_case_90() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = figure(width=1000, height=800)
  let axes = figure.add_axes(0.04, 0.075, 0.1, 0.1)
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(false)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  let secondary = axes.secondary_xaxis(fn(value) { return value }, fn(value) {
    return value
  })
  secondary.set_locator(@ticker.NullLocator::new().as_locator())
  secondary.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  secondary.set_named_formatter(f.as_base_formatter())
  secondary.apply_aspect()
  ignore(figure.to_svg_checked())
  secondary.apply_aspect()
  assert_eq(f.format_data_short(0.123456789), "0.123")
  let (origin, length) = secondary.formatter_geometry
  assert_eq(origin, 0.0)
  assert_eq(length, 1000.0)
}

///|
// Original source case 91: complete original Eng secondary physical stage
fn eng_axis_physical_case_91() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = figure(width=1000, height=800)
  let axes = figure.add_axes(0.04, 0.075, 0.1, 0.1)
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(false)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  let secondary = axes.secondary_xaxis(value => value * 2.0 + 5.0, value => {
    (value - 5.0) / 2.0
  })
  secondary.set_locator(@ticker.NullLocator::new().as_locator())
  secondary.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  secondary.set_named_formatter(f.as_base_formatter())
  assert_eq(f.format_data_short(0.123456789), "0.1235")
  let (origin, length) = secondary.formatter_geometry
  assert_eq(origin, 0.0)
  assert_eq(length, 1000.0)
}

///|
// Original source case 92: complete original Eng secondary physical stage
fn eng_axis_physical_case_92() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = figure(width=1000, height=800)
  let axes = figure.add_axes(0.04, 0.075, 0.1, 0.1)
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(false)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  let secondary = axes.secondary_xaxis(value => value * 2.0 + 5.0, value => {
    (value - 5.0) / 2.0
  })
  secondary.set_locator(@ticker.NullLocator::new().as_locator())
  secondary.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  secondary.set_named_formatter(f.as_base_formatter())
  secondary.apply_aspect()
  assert_eq(f.format_data_short(6.123456789), "6.123")
  let (origin, length) = secondary.formatter_geometry
  assert_eq(origin, 0.0)
  assert_eq(length, 1000.0)
}

///|
// Original source case 93: complete original Eng secondary physical stage
fn eng_axis_physical_case_93() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = figure(width=1000, height=800)
  let axes = figure.add_axes(0.04, 0.075, 0.1, 0.1)
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(false)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  let secondary = axes.secondary_xaxis(value => value * 2.0 + 5.0, value => {
    (value - 5.0) / 2.0
  })
  secondary.set_locator(@ticker.NullLocator::new().as_locator())
  secondary.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  secondary.set_named_formatter(f.as_base_formatter())
  secondary.apply_aspect()
  ignore(figure.to_svg_checked())
  assert_eq(f.format_data_short(6.123456789), "6.12")
  let (origin, length) = secondary.formatter_geometry
  assert_eq(origin, 40.0)
  assert_eq(length, 100.0)
}

///|
// Original source case 94: complete original Eng secondary physical stage
fn eng_axis_physical_case_94() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = figure(width=1000, height=800)
  let axes = figure.add_axes(0.04, 0.075, 0.1, 0.1)
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(false)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  let secondary = axes.secondary_xaxis(value => value * 2.0 + 5.0, value => {
    (value - 5.0) / 2.0
  })
  secondary.set_locator(@ticker.NullLocator::new().as_locator())
  secondary.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  secondary.set_named_formatter(f.as_base_formatter())
  secondary.apply_aspect()
  ignore(figure.to_svg_checked())
  assert_eq(f.format_data_short(6.123456789), "6.12")
  let (origin, length) = secondary.formatter_geometry
  assert_eq(origin, 40.0)
  assert_eq(length, 100.0)
}

///|
// Original source case 95: complete original Eng secondary physical stage
fn eng_axis_physical_case_95() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = figure(width=1000, height=800)
  let axes = figure.add_axes(0.04, 0.075, 0.1, 0.1)
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(false)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  let secondary = axes.secondary_xaxis(value => value * 2.0 + 5.0, value => {
    (value - 5.0) / 2.0
  })
  secondary.set_locator(@ticker.NullLocator::new().as_locator())
  secondary.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  secondary.set_named_formatter(f.as_base_formatter())
  secondary.apply_aspect()
  ignore(figure.to_svg_checked())
  secondary.apply_aspect()
  assert_eq(f.format_data_short(6.123456789), "6.123")
  let (origin, length) = secondary.formatter_geometry
  assert_eq(origin, 0.0)
  assert_eq(length, 1000.0)
}

///|
// Original source case 96: complete original Eng secondary physical stage
fn eng_axis_physical_case_96() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = figure(width=1000, height=800)
  let axes = figure.add_axes(0.04, 0.075, 0.1, 0.1)
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(false)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  let secondary = axes.secondary_yaxis(fn(value) { return value }, fn(value) {
    return value
  })
  secondary.set_locator(@ticker.NullLocator::new().as_locator())
  secondary.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  secondary.set_named_formatter(f.as_base_formatter())
  assert_eq(f.format_data_short(0.123456789), "0.123")
  let (origin, length) = secondary.formatter_geometry
  assert_eq(origin, 800.0)
  assert_eq(length, 800.0)
}

///|
// Original source case 97: complete original Eng secondary physical stage
fn eng_axis_physical_case_97() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = figure(width=1000, height=800)
  let axes = figure.add_axes(0.04, 0.075, 0.1, 0.1)
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(false)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  let secondary = axes.secondary_yaxis(fn(value) { return value }, fn(value) {
    return value
  })
  secondary.set_locator(@ticker.NullLocator::new().as_locator())
  secondary.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  secondary.set_named_formatter(f.as_base_formatter())
  secondary.apply_aspect()
  assert_eq(f.format_data_short(0.123456789), "0.123")
  let (origin, length) = secondary.formatter_geometry
  assert_eq(origin, 800.0)
  assert_eq(length, 800.0)
}

///|
// Original source case 98: complete original Eng secondary physical stage
fn eng_axis_physical_case_98() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = figure(width=1000, height=800)
  let axes = figure.add_axes(0.04, 0.075, 0.1, 0.1)
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(false)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  let secondary = axes.secondary_yaxis(fn(value) { return value }, fn(value) {
    return value
  })
  secondary.set_locator(@ticker.NullLocator::new().as_locator())
  secondary.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  secondary.set_named_formatter(f.as_base_formatter())
  secondary.apply_aspect()
  ignore(figure.to_svg_checked())
  assert_eq(f.format_data_short(0.123456789), "0.12")
  let (origin, length) = secondary.formatter_geometry
  assert_eq(origin, 60.0)
  assert_eq(length, 80.0)
}

///|
// Original source case 99: complete original Eng secondary physical stage
fn eng_axis_physical_case_99() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = figure(width=1000, height=800)
  let axes = figure.add_axes(0.04, 0.075, 0.1, 0.1)
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(false)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  let secondary = axes.secondary_yaxis(fn(value) { return value }, fn(value) {
    return value
  })
  secondary.set_locator(@ticker.NullLocator::new().as_locator())
  secondary.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  secondary.set_named_formatter(f.as_base_formatter())
  secondary.apply_aspect()
  ignore(figure.to_svg_checked())
  assert_eq(f.format_data_short(0.123456789), "0.12")
  let (origin, length) = secondary.formatter_geometry
  assert_eq(origin, 60.0)
  assert_eq(length, 80.0)
}

///|
// Original source case 100: complete original Eng secondary physical stage
fn eng_axis_physical_case_100() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = figure(width=1000, height=800)
  let axes = figure.add_axes(0.04, 0.075, 0.1, 0.1)
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(false)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  let secondary = axes.secondary_yaxis(fn(value) { return value }, fn(value) {
    return value
  })
  secondary.set_locator(@ticker.NullLocator::new().as_locator())
  secondary.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  secondary.set_named_formatter(f.as_base_formatter())
  secondary.apply_aspect()
  ignore(figure.to_svg_checked())
  secondary.apply_aspect()
  assert_eq(f.format_data_short(0.123456789), "0.123")
  let (origin, length) = secondary.formatter_geometry
  assert_eq(origin, 800.0)
  assert_eq(length, 800.0)
}

///|
// Original source case 101: complete original Eng secondary physical stage
fn eng_axis_physical_case_101() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = figure(width=1000, height=800)
  let axes = figure.add_axes(0.04, 0.075, 0.1, 0.1)
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(false)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  let secondary = axes.secondary_yaxis(value => value * 2.0 + 5.0, value => {
    (value - 5.0) / 2.0
  })
  secondary.set_locator(@ticker.NullLocator::new().as_locator())
  secondary.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  secondary.set_named_formatter(f.as_base_formatter())
  assert_eq(f.format_data_short(0.123456789), "0.123")
  let (origin, length) = secondary.formatter_geometry
  assert_eq(origin, 800.0)
  assert_eq(length, 800.0)
}

///|
// Original source case 102: complete original Eng secondary physical stage
fn eng_axis_physical_case_102() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = figure(width=1000, height=800)
  let axes = figure.add_axes(0.04, 0.075, 0.1, 0.1)
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(false)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  let secondary = axes.secondary_yaxis(value => value * 2.0 + 5.0, value => {
    (value - 5.0) / 2.0
  })
  secondary.set_locator(@ticker.NullLocator::new().as_locator())
  secondary.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  secondary.set_named_formatter(f.as_base_formatter())
  secondary.apply_aspect()
  assert_eq(f.format_data_short(6.123456789), "6.123")
  let (origin, length) = secondary.formatter_geometry
  assert_eq(origin, 800.0)
  assert_eq(length, 800.0)
}

///|
// Original source case 103: complete original Eng secondary physical stage
fn eng_axis_physical_case_103() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = figure(width=1000, height=800)
  let axes = figure.add_axes(0.04, 0.075, 0.1, 0.1)
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(false)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  let secondary = axes.secondary_yaxis(value => value * 2.0 + 5.0, value => {
    (value - 5.0) / 2.0
  })
  secondary.set_locator(@ticker.NullLocator::new().as_locator())
  secondary.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  secondary.set_named_formatter(f.as_base_formatter())
  secondary.apply_aspect()
  ignore(figure.to_svg_checked())
  assert_eq(f.format_data_short(6.123456789), "6.12")
  let (origin, length) = secondary.formatter_geometry
  assert_eq(origin, 60.0)
  assert_eq(length, 80.0)
}

///|
// Original source case 104: complete original Eng secondary physical stage
fn eng_axis_physical_case_104() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = figure(width=1000, height=800)
  let axes = figure.add_axes(0.04, 0.075, 0.1, 0.1)
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(false)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  let secondary = axes.secondary_yaxis(value => value * 2.0 + 5.0, value => {
    (value - 5.0) / 2.0
  })
  secondary.set_locator(@ticker.NullLocator::new().as_locator())
  secondary.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  secondary.set_named_formatter(f.as_base_formatter())
  secondary.apply_aspect()
  ignore(figure.to_svg_checked())
  assert_eq(f.format_data_short(6.123456789), "6.12")
  let (origin, length) = secondary.formatter_geometry
  assert_eq(origin, 60.0)
  assert_eq(length, 80.0)
}

///|
// Original source case 105: complete original Eng secondary physical stage
fn eng_axis_physical_case_105() -> Unit raise {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = figure(width=1000, height=800)
  let axes = figure.add_axes(0.04, 0.075, 0.1, 0.1)
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let f = @ticker.EngFormatter::new(
    unit="Hz",
    use_offset=Some(@ticker.ScalarNumber::Boolean(false)),
    use_math_text=Some(false),
    usetex=Some(false),
  )
  let secondary = axes.secondary_yaxis(value => value * 2.0 + 5.0, value => {
    (value - 5.0) / 2.0
  })
  secondary.set_locator(@ticker.NullLocator::new().as_locator())
  secondary.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  secondary.set_named_formatter(f.as_base_formatter())
  secondary.apply_aspect()
  ignore(figure.to_svg_checked())
  secondary.apply_aspect()
  assert_eq(f.format_data_short(6.123456789), "6.123")
  let (origin, length) = secondary.formatter_geometry
  assert_eq(origin, 800.0)
  assert_eq(length, 800.0)
}

///|
test "Eng original physical axis cases 86..105" {
  eng_axis_physical_case_86() catch {
    error => fail("Eng original axis case 86 failed: " + error.to_string())
  }
  eng_axis_physical_case_87() catch {
    error => fail("Eng original axis case 87 failed: " + error.to_string())
  }
  eng_axis_physical_case_88() catch {
    error => fail("Eng original axis case 88 failed: " + error.to_string())
  }
  eng_axis_physical_case_89() catch {
    error => fail("Eng original axis case 89 failed: " + error.to_string())
  }
  eng_axis_physical_case_90() catch {
    error => fail("Eng original axis case 90 failed: " + error.to_string())
  }
  eng_axis_physical_case_91() catch {
    error => fail("Eng original axis case 91 failed: " + error.to_string())
  }
  eng_axis_physical_case_92() catch {
    error => fail("Eng original axis case 92 failed: " + error.to_string())
  }
  eng_axis_physical_case_93() catch {
    error => fail("Eng original axis case 93 failed: " + error.to_string())
  }
  eng_axis_physical_case_94() catch {
    error => fail("Eng original axis case 94 failed: " + error.to_string())
  }
  eng_axis_physical_case_95() catch {
    error => fail("Eng original axis case 95 failed: " + error.to_string())
  }
  eng_axis_physical_case_96() catch {
    error => fail("Eng original axis case 96 failed: " + error.to_string())
  }
  eng_axis_physical_case_97() catch {
    error => fail("Eng original axis case 97 failed: " + error.to_string())
  }
  eng_axis_physical_case_98() catch {
    error => fail("Eng original axis case 98 failed: " + error.to_string())
  }
  eng_axis_physical_case_99() catch {
    error => fail("Eng original axis case 99 failed: " + error.to_string())
  }
  eng_axis_physical_case_100() catch {
    error => fail("Eng original axis case 100 failed: " + error.to_string())
  }
  eng_axis_physical_case_101() catch {
    error => fail("Eng original axis case 101 failed: " + error.to_string())
  }
  eng_axis_physical_case_102() catch {
    error => fail("Eng original axis case 102 failed: " + error.to_string())
  }
  eng_axis_physical_case_103() catch {
    error => fail("Eng original axis case 103 failed: " + error.to_string())
  }
  eng_axis_physical_case_104() catch {
    error => fail("Eng original axis case 104 failed: " + error.to_string())
  }
  eng_axis_physical_case_105() catch {
    error => fail("Eng original axis case 105 failed: " + error.to_string())
  }
}
