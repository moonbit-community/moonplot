// Original source physical rectangles; known SVG72 direction geometry.

///|
test "Scalar original axis 121 complete secondary physical geometry stages complete constructor before sync" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = figure(width=1000, height=800)
  let axes = figure.add_axes(0.04, 0.075, 0.1, 0.1)
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  let secondary = axes.secondary_xaxis(fn(value) { return value }, fn(value) {
    return value
  })
  secondary.set_locator(@ticker.NullLocator::new().as_locator())
  secondary.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  secondary.set_named_formatter(f.as_base_formatter())
  assert_eq(f.format_data_short(0.123456789), "0.123")
  let (origin, length) = secondary.formatter_geometry()
  assert_eq(origin, 0.0)
  assert_eq(length, 1000.0)
}

///|
test "Scalar original axis 122 complete secondary physical geometry stages direct apply_aspect(None)" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = figure(width=1000, height=800)
  let axes = figure.add_axes(0.04, 0.075, 0.1, 0.1)
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
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
  let (origin, length) = secondary.formatter_geometry()
  assert_eq(origin, 0.0)
  assert_eq(length, 1000.0)
}

///|
test "Scalar original axis 123 complete secondary physical geometry stages original Figure layout locator position" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = figure(width=1000, height=800)
  let axes = figure.add_axes(0.04, 0.075, 0.1, 0.1)
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
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
  let (origin, length) = secondary.formatter_geometry()
  assert_eq(origin, 40.0)
  assert_eq(length, 100.0)
}

///|
test "Scalar original axis 124 complete secondary physical geometry stages complete original child draw" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = figure(width=1000, height=800)
  let axes = figure.add_axes(0.04, 0.075, 0.1, 0.1)
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
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
  let (origin, length) = secondary.formatter_geometry()
  assert_eq(origin, 40.0)
  assert_eq(length, 100.0)
}

///|
test "Scalar original axis 125 complete secondary physical geometry stages direct apply_aspect(None) after frame" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = figure(width=1000, height=800)
  let axes = figure.add_axes(0.04, 0.075, 0.1, 0.1)
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
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
  let (origin, length) = secondary.formatter_geometry()
  assert_eq(origin, 0.0)
  assert_eq(length, 1000.0)
}

///|
test "Scalar original axis 126 complete secondary physical geometry stages complete constructor before sync" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = figure(width=1000, height=800)
  let axes = figure.add_axes(0.04, 0.075, 0.1, 0.1)
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  let secondary = axes.secondary_xaxis(value => value * 2.0 + 5.0, value => {
    (value - 5.0) / 2.0
  })
  secondary.set_locator(@ticker.NullLocator::new().as_locator())
  secondary.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  secondary.set_named_formatter(f.as_base_formatter())
  assert_eq(f.format_data_short(0.123456789), "0.1235")
  let (origin, length) = secondary.formatter_geometry()
  assert_eq(origin, 0.0)
  assert_eq(length, 1000.0)
}

///|
test "Scalar original axis 127 complete secondary physical geometry stages direct apply_aspect(None)" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = figure(width=1000, height=800)
  let axes = figure.add_axes(0.04, 0.075, 0.1, 0.1)
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
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
  let (origin, length) = secondary.formatter_geometry()
  assert_eq(origin, 0.0)
  assert_eq(length, 1000.0)
}

///|
test "Scalar original axis 128 complete secondary physical geometry stages original Figure layout locator position" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = figure(width=1000, height=800)
  let axes = figure.add_axes(0.04, 0.075, 0.1, 0.1)
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
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
  let (origin, length) = secondary.formatter_geometry()
  assert_eq(origin, 40.0)
  assert_eq(length, 100.0)
}

///|
test "Scalar original axis 129 complete secondary physical geometry stages complete original child draw" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = figure(width=1000, height=800)
  let axes = figure.add_axes(0.04, 0.075, 0.1, 0.1)
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
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
  let (origin, length) = secondary.formatter_geometry()
  assert_eq(origin, 40.0)
  assert_eq(length, 100.0)
}

///|
test "Scalar original axis 130 complete secondary physical geometry stages direct apply_aspect(None) after frame" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = figure(width=1000, height=800)
  let axes = figure.add_axes(0.04, 0.075, 0.1, 0.1)
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
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
  let (origin, length) = secondary.formatter_geometry()
  assert_eq(origin, 0.0)
  assert_eq(length, 1000.0)
}

///|
test "Scalar original axis 131 complete secondary physical geometry stages complete constructor before sync" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = figure(width=1000, height=800)
  let axes = figure.add_axes(0.04, 0.075, 0.1, 0.1)
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  let secondary = axes.secondary_yaxis(fn(value) { return value }, fn(value) {
    return value
  })
  secondary.set_locator(@ticker.NullLocator::new().as_locator())
  secondary.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  secondary.set_named_formatter(f.as_base_formatter())
  assert_eq(f.format_data_short(0.123456789), "0.123")
  let (origin, length) = secondary.formatter_geometry()
  assert_eq(origin, 800.0)
  assert_eq(length, 800.0)
}

///|
test "Scalar original axis 132 complete secondary physical geometry stages direct apply_aspect(None)" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = figure(width=1000, height=800)
  let axes = figure.add_axes(0.04, 0.075, 0.1, 0.1)
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
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
  let (origin, length) = secondary.formatter_geometry()
  assert_eq(origin, 800.0)
  assert_eq(length, 800.0)
}

///|
test "Scalar original axis 133 complete secondary physical geometry stages original Figure layout locator position" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = figure(width=1000, height=800)
  let axes = figure.add_axes(0.04, 0.075, 0.1, 0.1)
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
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
  let (origin, length) = secondary.formatter_geometry()
  assert_eq(origin, 60.0)
  assert_eq(length, 80.0)
}

///|
test "Scalar original axis 134 complete secondary physical geometry stages complete original child draw" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = figure(width=1000, height=800)
  let axes = figure.add_axes(0.04, 0.075, 0.1, 0.1)
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
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
  let (origin, length) = secondary.formatter_geometry()
  assert_eq(origin, 60.0)
  assert_eq(length, 80.0)
}

///|
test "Scalar original axis 135 complete secondary physical geometry stages direct apply_aspect(None) after frame" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = figure(width=1000, height=800)
  let axes = figure.add_axes(0.04, 0.075, 0.1, 0.1)
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
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
  let (origin, length) = secondary.formatter_geometry()
  assert_eq(origin, 800.0)
  assert_eq(length, 800.0)
}

///|
test "Scalar original axis 136 complete secondary physical geometry stages complete constructor before sync" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = figure(width=1000, height=800)
  let axes = figure.add_axes(0.04, 0.075, 0.1, 0.1)
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
    usetex=Some(false),
  )
  let secondary = axes.secondary_yaxis(value => value * 2.0 + 5.0, value => {
    (value - 5.0) / 2.0
  })
  secondary.set_locator(@ticker.NullLocator::new().as_locator())
  secondary.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  secondary.set_named_formatter(f.as_base_formatter())
  assert_eq(f.format_data_short(0.123456789), "0.123")
  let (origin, length) = secondary.formatter_geometry()
  assert_eq(origin, 800.0)
  assert_eq(length, 800.0)
}

///|
test "Scalar original axis 137 complete secondary physical geometry stages direct apply_aspect(None)" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = figure(width=1000, height=800)
  let axes = figure.add_axes(0.04, 0.075, 0.1, 0.1)
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
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
  let (origin, length) = secondary.formatter_geometry()
  assert_eq(origin, 800.0)
  assert_eq(length, 800.0)
}

///|
test "Scalar original axis 138 complete secondary physical geometry stages original Figure layout locator position" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = figure(width=1000, height=800)
  let axes = figure.add_axes(0.04, 0.075, 0.1, 0.1)
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
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
  let (origin, length) = secondary.formatter_geometry()
  assert_eq(origin, 60.0)
  assert_eq(length, 80.0)
}

///|
test "Scalar original axis 139 complete secondary physical geometry stages complete original child draw" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = figure(width=1000, height=800)
  let axes = figure.add_axes(0.04, 0.075, 0.1, 0.1)
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
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
  let (origin, length) = secondary.formatter_geometry()
  assert_eq(origin, 60.0)
  assert_eq(length, 80.0)
}

///|
test "Scalar original axis 140 complete secondary physical geometry stages direct apply_aspect(None) after frame" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = figure(width=1000, height=800)
  let axes = figure.add_axes(0.04, 0.075, 0.1, 0.1)
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let f = @ticker.ScalarFormatter::new(
    use_offset=Some(@ticker.ScalarNumber::Boolean(true)),
    use_math_text=Some(false),
    use_locale=Some(false),
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
  let (origin, length) = secondary.formatter_geometry()
  assert_eq(origin, 800.0)
  assert_eq(length, 800.0)
}
