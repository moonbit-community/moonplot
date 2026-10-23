// Generated from pinned complete Secondary control-function source; do not edit.

///|
fn secondary_functions_source_double(
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
fn secondary_functions_source_numbers(
  actual : Array[Double],
  expected : Array[Double],
) -> Unit raise {
  assert_eq(actual.length(), expected.length())
  for i in 0..<actual.length() {
    secondary_functions_source_double(actual[i], expected[i])
  }
}

///|
fn secondary_functions_source_major_class(value : @ticker.Locator) -> String {
  match value {
    @ticker.Locator::NamedAuto(_) => "AutoLocator"
    @ticker.Locator::NamedLog(_) => "LogLocator"
    @ticker.Locator::NamedFixed(_) => "FixedLocator"
    @ticker.Locator::Null(_) => "NullLocator"
    _ => "other"
  }
}

///|
fn secondary_functions_source_minor_class(
  value : @ticker.MinorLocator,
) -> String {
  match value {
    @ticker.MinorLocator::NamedAutoMinor(_) => "AutoMinorLocator"
    @ticker.MinorLocator::NamedLog(_) => "LogLocator"
    @ticker.MinorLocator::NamedFixed(_) => "FixedLocator"
    @ticker.MinorLocator::Null(_) => "NullLocator"
    _ => "other"
  }
}

///|
fn secondary_functions_source_formatter_class(
  value : @ticker.BaseFormatter,
) -> String {
  if value.scalar_formatter() is Some(_) {
    "ScalarFormatter"
  } else if value.log_formatter_sci_notation() is Some(_) {
    "LogFormatterSciNotation"
  } else if value.null_formatter() is Some(_) {
    "NullFormatter"
  } else if value.fixed_formatter() is Some(_) {
    "FixedFormatter"
  } else if value.func_formatter() is Some(_) {
    "FuncFormatter"
  } else {
    "other"
  }
}

///|
fn secondary_functions_source_same_major(
  first : @ticker.Locator,
  last : @ticker.Locator,
) -> Bool {
  match (first, last) {
    (@ticker.Locator::NamedAuto(a), @ticker.Locator::NamedAuto(b)) =>
      physical_equal(a, b)
    (@ticker.Locator::NamedLog(a), @ticker.Locator::NamedLog(b)) =>
      physical_equal(a, b)
    (@ticker.Locator::NamedFixed(a), @ticker.Locator::NamedFixed(b)) =>
      physical_equal(a, b)
    (@ticker.Locator::Null(a), @ticker.Locator::Null(b)) => physical_equal(a, b)
    _ => false
  }
}

///|
fn secondary_functions_source_same_minor(
  first : @ticker.MinorLocator,
  last : @ticker.MinorLocator,
) -> Bool {
  match (first, last) {
    (
      @ticker.MinorLocator::NamedAutoMinor(a),
      @ticker.MinorLocator::NamedAutoMinor(b),
    ) => physical_equal(a, b)
    (@ticker.MinorLocator::NamedLog(a), @ticker.MinorLocator::NamedLog(b)) =>
      physical_equal(a, b)
    (@ticker.MinorLocator::NamedFixed(a), @ticker.MinorLocator::NamedFixed(b)) =>
      physical_equal(a, b)
    (@ticker.MinorLocator::Null(a), @ticker.MinorLocator::Null(b)) =>
      physical_equal(a, b)
    _ => false
  }
}

///|
fn secondary_functions_source_case_0() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_classic_mode(previous.classic_mode())
    try! @config.set_axes_autolimit_mode(previous.axes_autolimit_mode())
    try! @config.set_x_margin(previous.x_margin())
    try! @config.set_y_margin(previous.y_margin())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  @config.set_x_margin(0.05)
  @config.set_y_margin(0.05)
  let fig = figure(width=320, height=240)
  let parent = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  parent.set_xlim(1.0, 4.0)
  let child = parent.secondary_xaxis(value => 2.0 * value, value => value / 2.0)
  assert_eq(child.parent_scale_name, Some("linear"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
  let view = child.numeric_axis.stored_view_limits()
  secondary_functions_source_numbers([view.lower(), view.upper()], [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  assert_eq(child.ticks_set, false)
  assert_true(child.location() is SecondaryAxisLocation::Top)
  assert_eq(
    [
      secondary_functions_source_major_class(child.locator().unwrap()),
      secondary_functions_source_minor_class(child.minor_locator().unwrap()),
      secondary_functions_source_formatter_class(
        child.named_formatter().unwrap(),
      ),
      secondary_functions_source_formatter_class(
        child.minor_named_formatter().unwrap(),
      ),
    ],
    ["AutoLocator", "NullLocator", "ScalarFormatter", "NullFormatter"],
  )
  assert_eq(
    [
      child.numeric_axis.is_default_locator(),
      child.numeric_axis.is_default_locator(minor=true),
      child.numeric_axis.is_default_formatter(),
      child.numeric_axis.is_default_formatter(minor=true),
    ],
    [true, true, true, true],
  )
  let transform = child.numeric_axis.coordinate_transform()
  secondary_functions_source_numbers([transform(9.0)], [
    4616752568008179712UL.reinterpret_as_double(),
  ])
  let forward = child.forward()
  let inverse = child.inverse()
  secondary_functions_source_numbers([forward(1.0), forward(4.0)], [
    4611686018427387904UL.reinterpret_as_double(),
    4620693217682128896UL.reinterpret_as_double(),
  ])
  secondary_functions_source_numbers([inverse(1.0), inverse(4.0)], [
    4602678819172646912UL.reinterpret_as_double(),
    4611686018427387904UL.reinterpret_as_double(),
  ])
  assert_eq(
    child.named_formatter().unwrap().axis(),
    Some(child.formatter_axis_binding()),
  )
  assert_eq(
    child.minor_named_formatter().unwrap().axis(),
    Some(child.formatter_axis_binding()),
  )
}

///|
fn secondary_functions_source_case_1() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_classic_mode(previous.classic_mode())
    try! @config.set_axes_autolimit_mode(previous.axes_autolimit_mode())
    try! @config.set_x_margin(previous.x_margin())
    try! @config.set_y_margin(previous.y_margin())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  @config.set_x_margin(0.05)
  @config.set_y_margin(0.05)
  let fig = figure(width=320, height=240)
  let parent = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  parent.set_xlim(1.0, 4.0)
  let child = parent.secondary_xaxis(value => value, value => value)
  assert_eq(child.parent_scale_name, Some("linear"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
  let view = child.numeric_axis.stored_view_limits()
  secondary_functions_source_numbers([view.lower(), view.upper()], [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  assert_eq(child.ticks_set, false)
  assert_true(child.location() is SecondaryAxisLocation::Top)
  assert_eq(
    [
      secondary_functions_source_major_class(child.locator().unwrap()),
      secondary_functions_source_minor_class(child.minor_locator().unwrap()),
      secondary_functions_source_formatter_class(
        child.named_formatter().unwrap(),
      ),
      secondary_functions_source_formatter_class(
        child.minor_named_formatter().unwrap(),
      ),
    ],
    ["AutoLocator", "NullLocator", "ScalarFormatter", "NullFormatter"],
  )
  assert_eq(
    [
      child.numeric_axis.is_default_locator(),
      child.numeric_axis.is_default_locator(minor=true),
      child.numeric_axis.is_default_formatter(),
      child.numeric_axis.is_default_formatter(minor=true),
    ],
    [true, true, true, true],
  )
  let transform = child.numeric_axis.coordinate_transform()
  secondary_functions_source_numbers([transform(9.0)], [
    4621256167635550208UL.reinterpret_as_double(),
  ])
  let forward = child.forward()
  let inverse = child.inverse()
  secondary_functions_source_numbers([forward(1.0), forward(4.0)], [
    4607182418800017408UL.reinterpret_as_double(),
    4616189618054758400UL.reinterpret_as_double(),
  ])
  secondary_functions_source_numbers([inverse(1.0), inverse(4.0)], [
    4607182418800017408UL.reinterpret_as_double(),
    4616189618054758400UL.reinterpret_as_double(),
  ])
  assert_eq(
    child.named_formatter().unwrap().axis(),
    Some(child.formatter_axis_binding()),
  )
  assert_eq(
    child.minor_named_formatter().unwrap().axis(),
    Some(child.formatter_axis_binding()),
  )
}

///|
fn secondary_functions_source_case_3() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_classic_mode(previous.classic_mode())
    try! @config.set_axes_autolimit_mode(previous.axes_autolimit_mode())
    try! @config.set_x_margin(previous.x_margin())
    try! @config.set_y_margin(previous.y_margin())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  @config.set_x_margin(0.05)
  @config.set_y_margin(0.05)
  let fig = figure(width=320, height=240)
  let parent = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  parent.set_ylim(1.0, 4.0)
  let child = parent.secondary_yaxis(value => 2.0 * value, value => value / 2.0)
  assert_eq(child.parent_scale_name, Some("linear"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
  let view = child.numeric_axis.stored_view_limits()
  secondary_functions_source_numbers([view.lower(), view.upper()], [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  assert_eq(child.ticks_set, false)
  assert_true(child.location() is SecondaryAxisLocation::Right)
  assert_eq(
    [
      secondary_functions_source_major_class(child.locator().unwrap()),
      secondary_functions_source_minor_class(child.minor_locator().unwrap()),
      secondary_functions_source_formatter_class(
        child.named_formatter().unwrap(),
      ),
      secondary_functions_source_formatter_class(
        child.minor_named_formatter().unwrap(),
      ),
    ],
    ["AutoLocator", "NullLocator", "ScalarFormatter", "NullFormatter"],
  )
  assert_eq(
    [
      child.numeric_axis.is_default_locator(),
      child.numeric_axis.is_default_locator(minor=true),
      child.numeric_axis.is_default_formatter(),
      child.numeric_axis.is_default_formatter(minor=true),
    ],
    [true, true, true, true],
  )
  let transform = child.numeric_axis.coordinate_transform()
  secondary_functions_source_numbers([transform(9.0)], [
    4616752568008179712UL.reinterpret_as_double(),
  ])
  let forward = child.forward()
  let inverse = child.inverse()
  secondary_functions_source_numbers([forward(1.0), forward(4.0)], [
    4611686018427387904UL.reinterpret_as_double(),
    4620693217682128896UL.reinterpret_as_double(),
  ])
  secondary_functions_source_numbers([inverse(1.0), inverse(4.0)], [
    4602678819172646912UL.reinterpret_as_double(),
    4611686018427387904UL.reinterpret_as_double(),
  ])
  assert_eq(
    child.named_formatter().unwrap().axis(),
    Some(child.formatter_axis_binding()),
  )
  assert_eq(
    child.minor_named_formatter().unwrap().axis(),
    Some(child.formatter_axis_binding()),
  )
}

///|
fn secondary_functions_source_case_4() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_classic_mode(previous.classic_mode())
    try! @config.set_axes_autolimit_mode(previous.axes_autolimit_mode())
    try! @config.set_x_margin(previous.x_margin())
    try! @config.set_y_margin(previous.y_margin())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  @config.set_x_margin(0.05)
  @config.set_y_margin(0.05)
  let fig = figure(width=320, height=240)
  let parent = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  parent.set_ylim(1.0, 4.0)
  let child = parent.secondary_yaxis(value => value, value => value)
  assert_eq(child.parent_scale_name, Some("linear"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
  let view = child.numeric_axis.stored_view_limits()
  secondary_functions_source_numbers([view.lower(), view.upper()], [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  assert_eq(child.ticks_set, false)
  assert_true(child.location() is SecondaryAxisLocation::Right)
  assert_eq(
    [
      secondary_functions_source_major_class(child.locator().unwrap()),
      secondary_functions_source_minor_class(child.minor_locator().unwrap()),
      secondary_functions_source_formatter_class(
        child.named_formatter().unwrap(),
      ),
      secondary_functions_source_formatter_class(
        child.minor_named_formatter().unwrap(),
      ),
    ],
    ["AutoLocator", "NullLocator", "ScalarFormatter", "NullFormatter"],
  )
  assert_eq(
    [
      child.numeric_axis.is_default_locator(),
      child.numeric_axis.is_default_locator(minor=true),
      child.numeric_axis.is_default_formatter(),
      child.numeric_axis.is_default_formatter(minor=true),
    ],
    [true, true, true, true],
  )
  let transform = child.numeric_axis.coordinate_transform()
  secondary_functions_source_numbers([transform(9.0)], [
    4621256167635550208UL.reinterpret_as_double(),
  ])
  let forward = child.forward()
  let inverse = child.inverse()
  secondary_functions_source_numbers([forward(1.0), forward(4.0)], [
    4607182418800017408UL.reinterpret_as_double(),
    4616189618054758400UL.reinterpret_as_double(),
  ])
  secondary_functions_source_numbers([inverse(1.0), inverse(4.0)], [
    4607182418800017408UL.reinterpret_as_double(),
    4616189618054758400UL.reinterpret_as_double(),
  ])
  assert_eq(
    child.named_formatter().unwrap().axis(),
    Some(child.formatter_axis_binding()),
  )
  assert_eq(
    child.minor_named_formatter().unwrap().axis(),
    Some(child.formatter_axis_binding()),
  )
}

///|
fn secondary_functions_source_case_18() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_classic_mode(previous.classic_mode())
    try! @config.set_axes_autolimit_mode(previous.axes_autolimit_mode())
    try! @config.set_x_margin(previous.x_margin())
    try! @config.set_y_margin(previous.y_margin())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  @config.set_x_margin(0.05)
  @config.set_y_margin(0.05)
  let fig = figure(width=320, height=240)
  let parent = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  parent.set_xlim(1.0, 4.0)
  let child = parent.secondary_xaxis(value => 2.0 * value, value => value / 2.0)
  let old_major = child.locator().unwrap()
  let old_minor = child.minor_locator().unwrap()
  let old_major_formatter = child.named_formatter().unwrap()
  let old_minor_formatter = child.minor_named_formatter().unwrap()
  child.set_functions(value => value * value, value => value.sqrt())
  assert_eq(child.parent_scale_name, Some("linear"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
  let view = child.numeric_axis.stored_view_limits()
  secondary_functions_source_numbers([view.lower(), view.upper()], [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  assert_eq(child.ticks_set, false)
  assert_true(child.location() is SecondaryAxisLocation::Top)
  assert_eq(
    [
      secondary_functions_source_major_class(child.locator().unwrap()),
      secondary_functions_source_minor_class(child.minor_locator().unwrap()),
      secondary_functions_source_formatter_class(
        child.named_formatter().unwrap(),
      ),
      secondary_functions_source_formatter_class(
        child.minor_named_formatter().unwrap(),
      ),
    ],
    ["AutoLocator", "NullLocator", "ScalarFormatter", "NullFormatter"],
  )
  assert_eq(
    [
      child.numeric_axis.is_default_locator(),
      child.numeric_axis.is_default_locator(minor=true),
      child.numeric_axis.is_default_formatter(),
      child.numeric_axis.is_default_formatter(minor=true),
    ],
    [true, true, true, true],
  )
  let transform = child.numeric_axis.coordinate_transform()
  secondary_functions_source_numbers([transform(9.0)], [
    4616752568008179712UL.reinterpret_as_double(),
  ])
  let forward = child.forward()
  let inverse = child.inverse()
  secondary_functions_source_numbers([forward(1.0), forward(4.0)], [
    4607182418800017408UL.reinterpret_as_double(),
    4625196817309499392UL.reinterpret_as_double(),
  ])
  secondary_functions_source_numbers([inverse(1.0), inverse(4.0)], [
    4607182418800017408UL.reinterpret_as_double(),
    4611686018427387904UL.reinterpret_as_double(),
  ])
  assert_eq(
    [
      secondary_functions_source_same_major(old_major, child.locator().unwrap()),
      secondary_functions_source_same_minor(
        old_minor,
        child.minor_locator().unwrap(),
      ),
      physical_equal(old_major_formatter, child.named_formatter().unwrap()),
      physical_equal(
        old_minor_formatter,
        child.minor_named_formatter().unwrap(),
      ),
    ],
    [true, true, true, true],
  )
  assert_eq(
    child.named_formatter().unwrap().axis(),
    Some(child.formatter_axis_binding()),
  )
  assert_eq(
    child.minor_named_formatter().unwrap().axis(),
    Some(child.formatter_axis_binding()),
  )
}

///|
fn secondary_functions_source_case_19() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_classic_mode(previous.classic_mode())
    try! @config.set_axes_autolimit_mode(previous.axes_autolimit_mode())
    try! @config.set_x_margin(previous.x_margin())
    try! @config.set_y_margin(previous.y_margin())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  @config.set_x_margin(0.05)
  @config.set_y_margin(0.05)
  let fig = figure(width=320, height=240)
  let parent = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  parent.set_xlim(1.0, 4.0)
  let child = parent.secondary_xaxis(value => 2.0 * value, value => value / 2.0)
  let old_major = child.locator().unwrap()
  let old_minor = child.minor_locator().unwrap()
  let old_major_formatter = child.named_formatter().unwrap()
  let old_minor_formatter = child.minor_named_formatter().unwrap()
  child.reset_functions()
  assert_eq(child.parent_scale_name, Some("linear"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
  let view = child.numeric_axis.stored_view_limits()
  secondary_functions_source_numbers([view.lower(), view.upper()], [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  assert_eq(child.ticks_set, false)
  assert_true(child.location() is SecondaryAxisLocation::Top)
  assert_eq(
    [
      secondary_functions_source_major_class(child.locator().unwrap()),
      secondary_functions_source_minor_class(child.minor_locator().unwrap()),
      secondary_functions_source_formatter_class(
        child.named_formatter().unwrap(),
      ),
      secondary_functions_source_formatter_class(
        child.minor_named_formatter().unwrap(),
      ),
    ],
    ["AutoLocator", "NullLocator", "ScalarFormatter", "NullFormatter"],
  )
  assert_eq(
    [
      child.numeric_axis.is_default_locator(),
      child.numeric_axis.is_default_locator(minor=true),
      child.numeric_axis.is_default_formatter(),
      child.numeric_axis.is_default_formatter(minor=true),
    ],
    [true, true, true, true],
  )
  let transform = child.numeric_axis.coordinate_transform()
  secondary_functions_source_numbers([transform(9.0)], [
    4616752568008179712UL.reinterpret_as_double(),
  ])
  let forward = child.forward()
  let inverse = child.inverse()
  secondary_functions_source_numbers([forward(1.0), forward(4.0)], [
    4607182418800017408UL.reinterpret_as_double(),
    4616189618054758400UL.reinterpret_as_double(),
  ])
  secondary_functions_source_numbers([inverse(1.0), inverse(4.0)], [
    4607182418800017408UL.reinterpret_as_double(),
    4616189618054758400UL.reinterpret_as_double(),
  ])
  assert_eq(
    [
      secondary_functions_source_same_major(old_major, child.locator().unwrap()),
      secondary_functions_source_same_minor(
        old_minor,
        child.minor_locator().unwrap(),
      ),
      physical_equal(old_major_formatter, child.named_formatter().unwrap()),
      physical_equal(
        old_minor_formatter,
        child.minor_named_formatter().unwrap(),
      ),
    ],
    [true, true, true, true],
  )
  assert_eq(
    child.named_formatter().unwrap().axis(),
    Some(child.formatter_axis_binding()),
  )
  assert_eq(
    child.minor_named_formatter().unwrap().axis(),
    Some(child.formatter_axis_binding()),
  )
}

///|
fn secondary_functions_source_case_20() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_classic_mode(previous.classic_mode())
    try! @config.set_axes_autolimit_mode(previous.axes_autolimit_mode())
    try! @config.set_x_margin(previous.x_margin())
    try! @config.set_y_margin(previous.y_margin())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  @config.set_x_margin(0.05)
  @config.set_y_margin(0.05)
  let fig = figure(width=320, height=240)
  let parent = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  parent.set_ylim(1.0, 4.0)
  let child = parent.secondary_yaxis(value => 2.0 * value, value => value / 2.0)
  let old_major = child.locator().unwrap()
  let old_minor = child.minor_locator().unwrap()
  let old_major_formatter = child.named_formatter().unwrap()
  let old_minor_formatter = child.minor_named_formatter().unwrap()
  child.set_functions(value => value * value, value => value.sqrt())
  assert_eq(child.parent_scale_name, Some("linear"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
  let view = child.numeric_axis.stored_view_limits()
  secondary_functions_source_numbers([view.lower(), view.upper()], [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  assert_eq(child.ticks_set, false)
  assert_true(child.location() is SecondaryAxisLocation::Right)
  assert_eq(
    [
      secondary_functions_source_major_class(child.locator().unwrap()),
      secondary_functions_source_minor_class(child.minor_locator().unwrap()),
      secondary_functions_source_formatter_class(
        child.named_formatter().unwrap(),
      ),
      secondary_functions_source_formatter_class(
        child.minor_named_formatter().unwrap(),
      ),
    ],
    ["AutoLocator", "NullLocator", "ScalarFormatter", "NullFormatter"],
  )
  assert_eq(
    [
      child.numeric_axis.is_default_locator(),
      child.numeric_axis.is_default_locator(minor=true),
      child.numeric_axis.is_default_formatter(),
      child.numeric_axis.is_default_formatter(minor=true),
    ],
    [true, true, true, true],
  )
  let transform = child.numeric_axis.coordinate_transform()
  secondary_functions_source_numbers([transform(9.0)], [
    4616752568008179712UL.reinterpret_as_double(),
  ])
  let forward = child.forward()
  let inverse = child.inverse()
  secondary_functions_source_numbers([forward(1.0), forward(4.0)], [
    4607182418800017408UL.reinterpret_as_double(),
    4625196817309499392UL.reinterpret_as_double(),
  ])
  secondary_functions_source_numbers([inverse(1.0), inverse(4.0)], [
    4607182418800017408UL.reinterpret_as_double(),
    4611686018427387904UL.reinterpret_as_double(),
  ])
  assert_eq(
    [
      secondary_functions_source_same_major(old_major, child.locator().unwrap()),
      secondary_functions_source_same_minor(
        old_minor,
        child.minor_locator().unwrap(),
      ),
      physical_equal(old_major_formatter, child.named_formatter().unwrap()),
      physical_equal(
        old_minor_formatter,
        child.minor_named_formatter().unwrap(),
      ),
    ],
    [true, true, true, true],
  )
  assert_eq(
    child.named_formatter().unwrap().axis(),
    Some(child.formatter_axis_binding()),
  )
  assert_eq(
    child.minor_named_formatter().unwrap().axis(),
    Some(child.formatter_axis_binding()),
  )
}

///|
fn secondary_functions_source_case_21() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_classic_mode(previous.classic_mode())
    try! @config.set_axes_autolimit_mode(previous.axes_autolimit_mode())
    try! @config.set_x_margin(previous.x_margin())
    try! @config.set_y_margin(previous.y_margin())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  @config.set_x_margin(0.05)
  @config.set_y_margin(0.05)
  let fig = figure(width=320, height=240)
  let parent = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  parent.set_ylim(1.0, 4.0)
  let child = parent.secondary_yaxis(value => 2.0 * value, value => value / 2.0)
  let old_major = child.locator().unwrap()
  let old_minor = child.minor_locator().unwrap()
  let old_major_formatter = child.named_formatter().unwrap()
  let old_minor_formatter = child.minor_named_formatter().unwrap()
  child.reset_functions()
  assert_eq(child.parent_scale_name, Some("linear"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
  let view = child.numeric_axis.stored_view_limits()
  secondary_functions_source_numbers([view.lower(), view.upper()], [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  assert_eq(child.ticks_set, false)
  assert_true(child.location() is SecondaryAxisLocation::Right)
  assert_eq(
    [
      secondary_functions_source_major_class(child.locator().unwrap()),
      secondary_functions_source_minor_class(child.minor_locator().unwrap()),
      secondary_functions_source_formatter_class(
        child.named_formatter().unwrap(),
      ),
      secondary_functions_source_formatter_class(
        child.minor_named_formatter().unwrap(),
      ),
    ],
    ["AutoLocator", "NullLocator", "ScalarFormatter", "NullFormatter"],
  )
  assert_eq(
    [
      child.numeric_axis.is_default_locator(),
      child.numeric_axis.is_default_locator(minor=true),
      child.numeric_axis.is_default_formatter(),
      child.numeric_axis.is_default_formatter(minor=true),
    ],
    [true, true, true, true],
  )
  let transform = child.numeric_axis.coordinate_transform()
  secondary_functions_source_numbers([transform(9.0)], [
    4616752568008179712UL.reinterpret_as_double(),
  ])
  let forward = child.forward()
  let inverse = child.inverse()
  secondary_functions_source_numbers([forward(1.0), forward(4.0)], [
    4607182418800017408UL.reinterpret_as_double(),
    4616189618054758400UL.reinterpret_as_double(),
  ])
  secondary_functions_source_numbers([inverse(1.0), inverse(4.0)], [
    4607182418800017408UL.reinterpret_as_double(),
    4616189618054758400UL.reinterpret_as_double(),
  ])
  assert_eq(
    [
      secondary_functions_source_same_major(old_major, child.locator().unwrap()),
      secondary_functions_source_same_minor(
        old_minor,
        child.minor_locator().unwrap(),
      ),
      physical_equal(old_major_formatter, child.named_formatter().unwrap()),
      physical_equal(
        old_minor_formatter,
        child.minor_named_formatter().unwrap(),
      ),
    ],
    [true, true, true, true],
  )
  assert_eq(
    child.named_formatter().unwrap().axis(),
    Some(child.formatter_axis_binding()),
  )
  assert_eq(
    child.minor_named_formatter().unwrap().axis(),
    Some(child.formatter_axis_binding()),
  )
}

///|
fn secondary_functions_source_case_22() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_classic_mode(previous.classic_mode())
    try! @config.set_axes_autolimit_mode(previous.axes_autolimit_mode())
    try! @config.set_x_margin(previous.x_margin())
    try! @config.set_y_margin(previous.y_margin())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  @config.set_x_margin(0.05)
  @config.set_y_margin(0.05)
  let fig = figure(width=320, height=240)
  let parent = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  parent.set_xlim(1.0, 4.0)
  let child = parent.secondary_xaxis(value => 2.0 * value, value => value / 2.0)
  let old_major = child.locator().unwrap()
  let old_minor = child.minor_locator().unwrap()
  let old_major_formatter = child.named_formatter().unwrap()
  let old_minor_formatter = child.minor_named_formatter().unwrap()
  parent.set_x_scale(@scale.symlog_scale(linthresh=2.0))
  parent.set_xlim(1.0, 4.0)
  child.set_functions(value => value * value, value => value.sqrt())
  assert_eq(child.parent_scale_name, Some("symlog"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
  let view = child.numeric_axis.stored_view_limits()
  secondary_functions_source_numbers([view.lower(), view.upper()], [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  assert_eq(child.ticks_set, false)
  assert_true(child.location() is SecondaryAxisLocation::Top)
  assert_eq(
    [
      secondary_functions_source_major_class(child.locator().unwrap()),
      secondary_functions_source_minor_class(child.minor_locator().unwrap()),
      secondary_functions_source_formatter_class(
        child.named_formatter().unwrap(),
      ),
      secondary_functions_source_formatter_class(
        child.minor_named_formatter().unwrap(),
      ),
    ],
    ["AutoLocator", "NullLocator", "ScalarFormatter", "NullFormatter"],
  )
  assert_eq(
    [
      child.numeric_axis.is_default_locator(),
      child.numeric_axis.is_default_locator(minor=true),
      child.numeric_axis.is_default_formatter(),
      child.numeric_axis.is_default_formatter(minor=true),
    ],
    [true, true, true, true],
  )
  let transform = child.numeric_axis.coordinate_transform()
  secondary_functions_source_numbers([transform(9.0)], [
    4613937818241073152UL.reinterpret_as_double(),
  ])
  let forward = child.forward()
  let inverse = child.inverse()
  secondary_functions_source_numbers([forward(1.0), forward(4.0)], [
    4607182418800017408UL.reinterpret_as_double(),
    4625196817309499392UL.reinterpret_as_double(),
  ])
  secondary_functions_source_numbers([inverse(1.0), inverse(4.0)], [
    4607182418800017408UL.reinterpret_as_double(),
    4611686018427387904UL.reinterpret_as_double(),
  ])
  assert_eq(
    [
      secondary_functions_source_same_major(old_major, child.locator().unwrap()),
      secondary_functions_source_same_minor(
        old_minor,
        child.minor_locator().unwrap(),
      ),
      physical_equal(old_major_formatter, child.named_formatter().unwrap()),
      physical_equal(
        old_minor_formatter,
        child.minor_named_formatter().unwrap(),
      ),
    ],
    [false, false, false, false],
  )
  assert_eq(
    child.named_formatter().unwrap().axis(),
    Some(child.formatter_axis_binding()),
  )
  assert_eq(
    child.minor_named_formatter().unwrap().axis(),
    Some(child.formatter_axis_binding()),
  )
}

///|
fn secondary_functions_source_case_23() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_classic_mode(previous.classic_mode())
    try! @config.set_axes_autolimit_mode(previous.axes_autolimit_mode())
    try! @config.set_x_margin(previous.x_margin())
    try! @config.set_y_margin(previous.y_margin())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  @config.set_x_margin(0.05)
  @config.set_y_margin(0.05)
  let fig = figure(width=320, height=240)
  let parent = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  parent.set_xlim(1.0, 4.0)
  let child = parent.secondary_xaxis(value => 2.0 * value, value => value / 2.0)
  let old_major = child.locator().unwrap()
  let old_minor = child.minor_locator().unwrap()
  let old_major_formatter = child.named_formatter().unwrap()
  let old_minor_formatter = child.minor_named_formatter().unwrap()
  parent.set_x_scale(@scale.log_scale())
  parent.set_xlim(1.0, 4.0)
  child.set_functions(value => value * value, value => value.sqrt())
  assert_eq(child.parent_scale_name, Some("log"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "functionlog")
  let view = child.numeric_axis.stored_view_limits()
  secondary_functions_source_numbers([view.lower(), view.upper()], [
    4606202894331021899UL.reinterpret_as_double(),
    4622506020420629830UL.reinterpret_as_double(),
  ])
  assert_eq(child.ticks_set, false)
  assert_true(child.location() is SecondaryAxisLocation::Top)
  assert_eq(
    [
      secondary_functions_source_major_class(child.locator().unwrap()),
      secondary_functions_source_minor_class(child.minor_locator().unwrap()),
      secondary_functions_source_formatter_class(
        child.named_formatter().unwrap(),
      ),
      secondary_functions_source_formatter_class(
        child.minor_named_formatter().unwrap(),
      ),
    ],
    [
      "LogLocator", "LogLocator", "LogFormatterSciNotation", "LogFormatterSciNotation",
    ],
  )
  assert_eq(
    [
      child.numeric_axis.is_default_locator(),
      child.numeric_axis.is_default_locator(minor=true),
      child.numeric_axis.is_default_formatter(),
      child.numeric_axis.is_default_formatter(minor=true),
    ],
    [true, true, true, true],
  )
  let transform = child.numeric_axis.coordinate_transform()
  secondary_functions_source_numbers([transform(9.0)], [
    4602266672337769981UL.reinterpret_as_double(),
  ])
  let forward = child.forward()
  let inverse = child.inverse()
  secondary_functions_source_numbers([forward(1.0), forward(4.0)], [
    4607182418800017408UL.reinterpret_as_double(),
    4625196817309499392UL.reinterpret_as_double(),
  ])
  secondary_functions_source_numbers([inverse(1.0), inverse(4.0)], [
    4607182418800017408UL.reinterpret_as_double(),
    4611686018427387904UL.reinterpret_as_double(),
  ])
  assert_eq(
    [
      secondary_functions_source_same_major(old_major, child.locator().unwrap()),
      secondary_functions_source_same_minor(
        old_minor,
        child.minor_locator().unwrap(),
      ),
      physical_equal(old_major_formatter, child.named_formatter().unwrap()),
      physical_equal(
        old_minor_formatter,
        child.minor_named_formatter().unwrap(),
      ),
    ],
    [false, false, false, false],
  )
  assert_eq(
    child.named_formatter().unwrap().axis(),
    Some(child.formatter_axis_binding()),
  )
  assert_eq(
    child.minor_named_formatter().unwrap().axis(),
    Some(child.formatter_axis_binding()),
  )
}

///|
fn secondary_functions_source_case_24() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_classic_mode(previous.classic_mode())
    try! @config.set_axes_autolimit_mode(previous.axes_autolimit_mode())
    try! @config.set_x_margin(previous.x_margin())
    try! @config.set_y_margin(previous.y_margin())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  @config.set_x_margin(0.05)
  @config.set_y_margin(0.05)
  let fig = figure(width=320, height=240)
  let parent = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  parent.set_xlim(1.0, 4.0)
  let child = parent.secondary_xaxis(value => 2.0 * value, value => value / 2.0)
  let old_major = child.locator().unwrap()
  let old_minor = child.minor_locator().unwrap()
  let old_major_formatter = child.named_formatter().unwrap()
  let old_minor_formatter = child.minor_named_formatter().unwrap()
  parent.set_x_scale(@scale.symlog_scale(linthresh=2.0))
  parent.set_xlim(1.0, 4.0)
  child.reset_functions()
  assert_eq(child.parent_scale_name, Some("symlog"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
  let view = child.numeric_axis.stored_view_limits()
  secondary_functions_source_numbers([view.lower(), view.upper()], [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  assert_eq(child.ticks_set, false)
  assert_true(child.location() is SecondaryAxisLocation::Top)
  assert_eq(
    [
      secondary_functions_source_major_class(child.locator().unwrap()),
      secondary_functions_source_minor_class(child.minor_locator().unwrap()),
      secondary_functions_source_formatter_class(
        child.named_formatter().unwrap(),
      ),
      secondary_functions_source_formatter_class(
        child.minor_named_formatter().unwrap(),
      ),
    ],
    ["AutoLocator", "NullLocator", "ScalarFormatter", "NullFormatter"],
  )
  assert_eq(
    [
      child.numeric_axis.is_default_locator(),
      child.numeric_axis.is_default_locator(minor=true),
      child.numeric_axis.is_default_formatter(),
      child.numeric_axis.is_default_formatter(minor=true),
    ],
    [true, true, true, true],
  )
  let transform = child.numeric_axis.coordinate_transform()
  secondary_functions_source_numbers([transform(9.0)], [
    4621256167635550208UL.reinterpret_as_double(),
  ])
  let forward = child.forward()
  let inverse = child.inverse()
  secondary_functions_source_numbers([forward(1.0), forward(4.0)], [
    4607182418800017408UL.reinterpret_as_double(),
    4616189618054758400UL.reinterpret_as_double(),
  ])
  secondary_functions_source_numbers([inverse(1.0), inverse(4.0)], [
    4607182418800017408UL.reinterpret_as_double(),
    4616189618054758400UL.reinterpret_as_double(),
  ])
  assert_eq(
    [
      secondary_functions_source_same_major(old_major, child.locator().unwrap()),
      secondary_functions_source_same_minor(
        old_minor,
        child.minor_locator().unwrap(),
      ),
      physical_equal(old_major_formatter, child.named_formatter().unwrap()),
      physical_equal(
        old_minor_formatter,
        child.minor_named_formatter().unwrap(),
      ),
    ],
    [false, false, false, false],
  )
  assert_eq(
    child.named_formatter().unwrap().axis(),
    Some(child.formatter_axis_binding()),
  )
  assert_eq(
    child.minor_named_formatter().unwrap().axis(),
    Some(child.formatter_axis_binding()),
  )
}

///|
fn secondary_functions_source_case_25() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_classic_mode(previous.classic_mode())
    try! @config.set_axes_autolimit_mode(previous.axes_autolimit_mode())
    try! @config.set_x_margin(previous.x_margin())
    try! @config.set_y_margin(previous.y_margin())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  @config.set_x_margin(0.05)
  @config.set_y_margin(0.05)
  let fig = figure(width=320, height=240)
  let parent = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  parent.set_ylim(1.0, 4.0)
  let child = parent.secondary_yaxis(value => 2.0 * value, value => value / 2.0)
  let old_major = child.locator().unwrap()
  let old_minor = child.minor_locator().unwrap()
  let old_major_formatter = child.named_formatter().unwrap()
  let old_minor_formatter = child.minor_named_formatter().unwrap()
  parent.set_y_scale(@scale.symlog_scale(linthresh=2.0))
  parent.set_ylim(1.0, 4.0)
  child.set_functions(value => value * value, value => value.sqrt())
  assert_eq(child.parent_scale_name, Some("symlog"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
  let view = child.numeric_axis.stored_view_limits()
  secondary_functions_source_numbers([view.lower(), view.upper()], [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  assert_eq(child.ticks_set, false)
  assert_true(child.location() is SecondaryAxisLocation::Right)
  assert_eq(
    [
      secondary_functions_source_major_class(child.locator().unwrap()),
      secondary_functions_source_minor_class(child.minor_locator().unwrap()),
      secondary_functions_source_formatter_class(
        child.named_formatter().unwrap(),
      ),
      secondary_functions_source_formatter_class(
        child.minor_named_formatter().unwrap(),
      ),
    ],
    ["AutoLocator", "NullLocator", "ScalarFormatter", "NullFormatter"],
  )
  assert_eq(
    [
      child.numeric_axis.is_default_locator(),
      child.numeric_axis.is_default_locator(minor=true),
      child.numeric_axis.is_default_formatter(),
      child.numeric_axis.is_default_formatter(minor=true),
    ],
    [true, true, true, true],
  )
  let transform = child.numeric_axis.coordinate_transform()
  secondary_functions_source_numbers([transform(9.0)], [
    4613937818241073152UL.reinterpret_as_double(),
  ])
  let forward = child.forward()
  let inverse = child.inverse()
  secondary_functions_source_numbers([forward(1.0), forward(4.0)], [
    4607182418800017408UL.reinterpret_as_double(),
    4625196817309499392UL.reinterpret_as_double(),
  ])
  secondary_functions_source_numbers([inverse(1.0), inverse(4.0)], [
    4607182418800017408UL.reinterpret_as_double(),
    4611686018427387904UL.reinterpret_as_double(),
  ])
  assert_eq(
    [
      secondary_functions_source_same_major(old_major, child.locator().unwrap()),
      secondary_functions_source_same_minor(
        old_minor,
        child.minor_locator().unwrap(),
      ),
      physical_equal(old_major_formatter, child.named_formatter().unwrap()),
      physical_equal(
        old_minor_formatter,
        child.minor_named_formatter().unwrap(),
      ),
    ],
    [false, false, false, false],
  )
  assert_eq(
    child.named_formatter().unwrap().axis(),
    Some(child.formatter_axis_binding()),
  )
  assert_eq(
    child.minor_named_formatter().unwrap().axis(),
    Some(child.formatter_axis_binding()),
  )
}

///|
fn secondary_functions_source_case_26() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_classic_mode(previous.classic_mode())
    try! @config.set_axes_autolimit_mode(previous.axes_autolimit_mode())
    try! @config.set_x_margin(previous.x_margin())
    try! @config.set_y_margin(previous.y_margin())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  @config.set_x_margin(0.05)
  @config.set_y_margin(0.05)
  let fig = figure(width=320, height=240)
  let parent = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  parent.set_ylim(1.0, 4.0)
  let child = parent.secondary_yaxis(value => 2.0 * value, value => value / 2.0)
  let old_major = child.locator().unwrap()
  let old_minor = child.minor_locator().unwrap()
  let old_major_formatter = child.named_formatter().unwrap()
  let old_minor_formatter = child.minor_named_formatter().unwrap()
  parent.set_y_scale(@scale.log_scale())
  parent.set_ylim(1.0, 4.0)
  child.set_functions(value => value * value, value => value.sqrt())
  assert_eq(child.parent_scale_name, Some("log"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "functionlog")
  let view = child.numeric_axis.stored_view_limits()
  secondary_functions_source_numbers([view.lower(), view.upper()], [
    4606202894331021899UL.reinterpret_as_double(),
    4622506020420629830UL.reinterpret_as_double(),
  ])
  assert_eq(child.ticks_set, false)
  assert_true(child.location() is SecondaryAxisLocation::Right)
  assert_eq(
    [
      secondary_functions_source_major_class(child.locator().unwrap()),
      secondary_functions_source_minor_class(child.minor_locator().unwrap()),
      secondary_functions_source_formatter_class(
        child.named_formatter().unwrap(),
      ),
      secondary_functions_source_formatter_class(
        child.minor_named_formatter().unwrap(),
      ),
    ],
    [
      "LogLocator", "LogLocator", "LogFormatterSciNotation", "LogFormatterSciNotation",
    ],
  )
  assert_eq(
    [
      child.numeric_axis.is_default_locator(),
      child.numeric_axis.is_default_locator(minor=true),
      child.numeric_axis.is_default_formatter(),
      child.numeric_axis.is_default_formatter(minor=true),
    ],
    [true, true, true, true],
  )
  let transform = child.numeric_axis.coordinate_transform()
  secondary_functions_source_numbers([transform(9.0)], [
    4602266672337769981UL.reinterpret_as_double(),
  ])
  let forward = child.forward()
  let inverse = child.inverse()
  secondary_functions_source_numbers([forward(1.0), forward(4.0)], [
    4607182418800017408UL.reinterpret_as_double(),
    4625196817309499392UL.reinterpret_as_double(),
  ])
  secondary_functions_source_numbers([inverse(1.0), inverse(4.0)], [
    4607182418800017408UL.reinterpret_as_double(),
    4611686018427387904UL.reinterpret_as_double(),
  ])
  assert_eq(
    [
      secondary_functions_source_same_major(old_major, child.locator().unwrap()),
      secondary_functions_source_same_minor(
        old_minor,
        child.minor_locator().unwrap(),
      ),
      physical_equal(old_major_formatter, child.named_formatter().unwrap()),
      physical_equal(
        old_minor_formatter,
        child.minor_named_formatter().unwrap(),
      ),
    ],
    [false, false, false, false],
  )
  assert_eq(
    child.named_formatter().unwrap().axis(),
    Some(child.formatter_axis_binding()),
  )
  assert_eq(
    child.minor_named_formatter().unwrap().axis(),
    Some(child.formatter_axis_binding()),
  )
}

///|
fn secondary_functions_source_case_27() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_classic_mode(previous.classic_mode())
    try! @config.set_axes_autolimit_mode(previous.axes_autolimit_mode())
    try! @config.set_x_margin(previous.x_margin())
    try! @config.set_y_margin(previous.y_margin())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  @config.set_x_margin(0.05)
  @config.set_y_margin(0.05)
  let fig = figure(width=320, height=240)
  let parent = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  parent.set_ylim(1.0, 4.0)
  let child = parent.secondary_yaxis(value => 2.0 * value, value => value / 2.0)
  let old_major = child.locator().unwrap()
  let old_minor = child.minor_locator().unwrap()
  let old_major_formatter = child.named_formatter().unwrap()
  let old_minor_formatter = child.minor_named_formatter().unwrap()
  parent.set_y_scale(@scale.symlog_scale(linthresh=2.0))
  parent.set_ylim(1.0, 4.0)
  child.reset_functions()
  assert_eq(child.parent_scale_name, Some("symlog"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
  let view = child.numeric_axis.stored_view_limits()
  secondary_functions_source_numbers([view.lower(), view.upper()], [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  assert_eq(child.ticks_set, false)
  assert_true(child.location() is SecondaryAxisLocation::Right)
  assert_eq(
    [
      secondary_functions_source_major_class(child.locator().unwrap()),
      secondary_functions_source_minor_class(child.minor_locator().unwrap()),
      secondary_functions_source_formatter_class(
        child.named_formatter().unwrap(),
      ),
      secondary_functions_source_formatter_class(
        child.minor_named_formatter().unwrap(),
      ),
    ],
    ["AutoLocator", "NullLocator", "ScalarFormatter", "NullFormatter"],
  )
  assert_eq(
    [
      child.numeric_axis.is_default_locator(),
      child.numeric_axis.is_default_locator(minor=true),
      child.numeric_axis.is_default_formatter(),
      child.numeric_axis.is_default_formatter(minor=true),
    ],
    [true, true, true, true],
  )
  let transform = child.numeric_axis.coordinate_transform()
  secondary_functions_source_numbers([transform(9.0)], [
    4621256167635550208UL.reinterpret_as_double(),
  ])
  let forward = child.forward()
  let inverse = child.inverse()
  secondary_functions_source_numbers([forward(1.0), forward(4.0)], [
    4607182418800017408UL.reinterpret_as_double(),
    4616189618054758400UL.reinterpret_as_double(),
  ])
  secondary_functions_source_numbers([inverse(1.0), inverse(4.0)], [
    4607182418800017408UL.reinterpret_as_double(),
    4616189618054758400UL.reinterpret_as_double(),
  ])
  assert_eq(
    [
      secondary_functions_source_same_major(old_major, child.locator().unwrap()),
      secondary_functions_source_same_minor(
        old_minor,
        child.minor_locator().unwrap(),
      ),
      physical_equal(old_major_formatter, child.named_formatter().unwrap()),
      physical_equal(
        old_minor_formatter,
        child.minor_named_formatter().unwrap(),
      ),
    ],
    [false, false, false, false],
  )
  assert_eq(
    child.named_formatter().unwrap().axis(),
    Some(child.formatter_axis_binding()),
  )
  assert_eq(
    child.minor_named_formatter().unwrap().axis(),
    Some(child.formatter_axis_binding()),
  )
}

///|
fn secondary_functions_source_case_28() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_classic_mode(previous.classic_mode())
    try! @config.set_axes_autolimit_mode(previous.axes_autolimit_mode())
    try! @config.set_x_margin(previous.x_margin())
    try! @config.set_y_margin(previous.y_margin())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  @config.set_x_margin(0.05)
  @config.set_y_margin(0.05)
  let fig = figure(width=320, height=240)
  let parent = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  parent.set_xlim(1.0, 4.0)
  let child = parent.secondary_xaxis(value => 2.0 * value, value => value / 2.0)
  child.set_ticks([2.0, 3.0])
  let owner : Array[Int64] = [1L, 4L, 7L, 9L]
  let current_view = @ticker.TickValues::from_int64_array(owner).view(1, 1, 2)
  let old_fixed = @ticker.FixedLocator::from_view(current_view)
  child.set_locator(old_fixed.as_locator())
  let old_major = child.locator().unwrap()
  let old_minor = child.minor_locator().unwrap()
  let old_major_formatter = child.named_formatter().unwrap()
  let old_minor_formatter = child.minor_named_formatter().unwrap()
  parent.set_x_scale(@scale.log_scale())
  parent.set_xlim(1.0, 4.0)
  child.set_functions(value => value * value, value => value.sqrt())
  assert_eq(child.parent_scale_name, Some("log"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "functionlog")
  let view = child.numeric_axis.stored_view_limits()
  secondary_functions_source_numbers([view.lower(), view.upper()], [
    0UL.reinterpret_as_double(),
    4613937818241073152UL.reinterpret_as_double(),
  ])
  assert_eq(child.ticks_set, true)
  assert_true(child.location() is SecondaryAxisLocation::Top)
  assert_eq(
    [
      secondary_functions_source_major_class(child.locator().unwrap()),
      secondary_functions_source_minor_class(child.minor_locator().unwrap()),
      secondary_functions_source_formatter_class(
        child.named_formatter().unwrap(),
      ),
      secondary_functions_source_formatter_class(
        child.minor_named_formatter().unwrap(),
      ),
    ],
    [
      "FixedLocator", "LogLocator", "LogFormatterSciNotation", "LogFormatterSciNotation",
    ],
  )
  assert_eq(
    [
      child.numeric_axis.is_default_locator(),
      child.numeric_axis.is_default_locator(minor=true),
      child.numeric_axis.is_default_formatter(),
      child.numeric_axis.is_default_formatter(minor=true),
    ],
    [false, true, true, true],
  )
  let transform = child.numeric_axis.coordinate_transform()
  secondary_functions_source_numbers([transform(9.0)], [
    4602266672337769981UL.reinterpret_as_double(),
  ])
  let forward = child.forward()
  let inverse = child.inverse()
  secondary_functions_source_numbers([forward(1.0), forward(4.0)], [
    4607182418800017408UL.reinterpret_as_double(),
    4625196817309499392UL.reinterpret_as_double(),
  ])
  secondary_functions_source_numbers([inverse(1.0), inverse(4.0)], [
    4607182418800017408UL.reinterpret_as_double(),
    4611686018427387904UL.reinterpret_as_double(),
  ])
  assert_eq(
    [
      secondary_functions_source_same_major(old_major, child.locator().unwrap()),
      secondary_functions_source_same_minor(
        old_minor,
        child.minor_locator().unwrap(),
      ),
      physical_equal(old_major_formatter, child.named_formatter().unwrap()),
      physical_equal(
        old_minor_formatter,
        child.minor_named_formatter().unwrap(),
      ),
    ],
    [false, false, false, false],
  )
  let current_fixed = child.locator().unwrap().fixed_locator().unwrap()
  secondary_functions_source_numbers(current_fixed.locations().to_array(), [
    4, 7,
  ])
  assert_eq(
    child.named_formatter().unwrap().axis(),
    Some(child.formatter_axis_binding()),
  )
  assert_eq(
    child.minor_named_formatter().unwrap().axis(),
    Some(child.formatter_axis_binding()),
  )
  assert_true(physical_equal(current_fixed.locations(), current_view))
  current_fixed.locations().set(0, 6.0)
  assert_eq(owner, [1L, 6L, 7L, 9L])
  secondary_functions_source_numbers(old_fixed.locations().to_array(), [6, 7])
  secondary_functions_source_numbers(old_fixed.values().to_array(), [6, 7])
}

///|
fn secondary_functions_source_case_29() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_classic_mode(previous.classic_mode())
    try! @config.set_axes_autolimit_mode(previous.axes_autolimit_mode())
    try! @config.set_x_margin(previous.x_margin())
    try! @config.set_y_margin(previous.y_margin())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  @config.set_x_margin(0.05)
  @config.set_y_margin(0.05)
  let fig = figure(width=320, height=240)
  let parent = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  parent.set_ylim(1.0, 4.0)
  let child = parent.secondary_yaxis(value => 2.0 * value, value => value / 2.0)
  child.set_ticks([2.0, 3.0])
  let owner : Array[Int64] = [1L, 4L, 7L, 9L]
  let current_view = @ticker.TickValues::from_int64_array(owner).view(1, 1, 2)
  let old_fixed = @ticker.FixedLocator::from_view(current_view)
  child.set_locator(old_fixed.as_locator())
  let old_major = child.locator().unwrap()
  let old_minor = child.minor_locator().unwrap()
  let old_major_formatter = child.named_formatter().unwrap()
  let old_minor_formatter = child.minor_named_formatter().unwrap()
  parent.set_y_scale(@scale.log_scale())
  parent.set_ylim(1.0, 4.0)
  child.set_functions(value => value * value, value => value.sqrt())
  assert_eq(child.parent_scale_name, Some("log"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "functionlog")
  let view = child.numeric_axis.stored_view_limits()
  secondary_functions_source_numbers([view.lower(), view.upper()], [
    0UL.reinterpret_as_double(),
    4613937818241073152UL.reinterpret_as_double(),
  ])
  assert_eq(child.ticks_set, true)
  assert_true(child.location() is SecondaryAxisLocation::Right)
  assert_eq(
    [
      secondary_functions_source_major_class(child.locator().unwrap()),
      secondary_functions_source_minor_class(child.minor_locator().unwrap()),
      secondary_functions_source_formatter_class(
        child.named_formatter().unwrap(),
      ),
      secondary_functions_source_formatter_class(
        child.minor_named_formatter().unwrap(),
      ),
    ],
    [
      "FixedLocator", "LogLocator", "LogFormatterSciNotation", "LogFormatterSciNotation",
    ],
  )
  assert_eq(
    [
      child.numeric_axis.is_default_locator(),
      child.numeric_axis.is_default_locator(minor=true),
      child.numeric_axis.is_default_formatter(),
      child.numeric_axis.is_default_formatter(minor=true),
    ],
    [false, true, true, true],
  )
  let transform = child.numeric_axis.coordinate_transform()
  secondary_functions_source_numbers([transform(9.0)], [
    4602266672337769981UL.reinterpret_as_double(),
  ])
  let forward = child.forward()
  let inverse = child.inverse()
  secondary_functions_source_numbers([forward(1.0), forward(4.0)], [
    4607182418800017408UL.reinterpret_as_double(),
    4625196817309499392UL.reinterpret_as_double(),
  ])
  secondary_functions_source_numbers([inverse(1.0), inverse(4.0)], [
    4607182418800017408UL.reinterpret_as_double(),
    4611686018427387904UL.reinterpret_as_double(),
  ])
  assert_eq(
    [
      secondary_functions_source_same_major(old_major, child.locator().unwrap()),
      secondary_functions_source_same_minor(
        old_minor,
        child.minor_locator().unwrap(),
      ),
      physical_equal(old_major_formatter, child.named_formatter().unwrap()),
      physical_equal(
        old_minor_formatter,
        child.minor_named_formatter().unwrap(),
      ),
    ],
    [false, false, false, false],
  )
  let current_fixed = child.locator().unwrap().fixed_locator().unwrap()
  secondary_functions_source_numbers(current_fixed.locations().to_array(), [
    4, 7,
  ])
  assert_eq(
    child.named_formatter().unwrap().axis(),
    Some(child.formatter_axis_binding()),
  )
  assert_eq(
    child.minor_named_formatter().unwrap().axis(),
    Some(child.formatter_axis_binding()),
  )
  assert_true(physical_equal(current_fixed.locations(), current_view))
  current_fixed.locations().set(0, 6.0)
  assert_eq(owner, [1L, 6L, 7L, 9L])
  secondary_functions_source_numbers(old_fixed.locations().to_array(), [6, 7])
  secondary_functions_source_numbers(old_fixed.values().to_array(), [6, 7])
}

///|
fn secondary_functions_source_case_30() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_classic_mode(previous.classic_mode())
    try! @config.set_axes_autolimit_mode(previous.axes_autolimit_mode())
    try! @config.set_x_margin(previous.x_margin())
    try! @config.set_y_margin(previous.y_margin())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  @config.set_x_margin(0.05)
  @config.set_y_margin(0.05)
  let fig = figure(width=320, height=240)
  let parent = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  parent.set_xlim(1.0, 4.0)
  let child = parent.secondary_xaxis(value => 2.0 * value, value => value / 2.0)
  child.set_ticks([0.0, 1.0])
  child.set_locator(@ticker.LogLocator::new().as_locator())
  let old_major = child.locator().unwrap()
  let old_minor = child.minor_locator().unwrap()
  let old_major_formatter = child.named_formatter().unwrap()
  let old_minor_formatter = child.minor_named_formatter().unwrap()
  parent.set_x_scale(@scale.log_scale())
  parent.set_xlim(1.0, 4.0)
  // Source native error text is retained in JSON; Core projects its checked variant.
  assert_true(
    try {
      child.set_functions(value => value * value, value => value.sqrt())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(child.parent_scale_name, Some("linear"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
  let view = child.numeric_axis.stored_view_limits()
  secondary_functions_source_numbers([view.lower(), view.upper()], [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  assert_eq(child.ticks_set, true)
  assert_true(child.location() is SecondaryAxisLocation::Top)
  assert_eq(
    [
      secondary_functions_source_major_class(child.locator().unwrap()),
      secondary_functions_source_minor_class(child.minor_locator().unwrap()),
      secondary_functions_source_formatter_class(
        child.named_formatter().unwrap(),
      ),
      secondary_functions_source_formatter_class(
        child.minor_named_formatter().unwrap(),
      ),
    ],
    ["LogLocator", "NullLocator", "ScalarFormatter", "NullFormatter"],
  )
  assert_eq(
    [
      child.numeric_axis.is_default_locator(),
      child.numeric_axis.is_default_locator(minor=true),
      child.numeric_axis.is_default_formatter(),
      child.numeric_axis.is_default_formatter(minor=true),
    ],
    [false, true, true, true],
  )
  let transform = child.numeric_axis.coordinate_transform()
  secondary_functions_source_numbers([transform(9.0)], [
    4616752568008179712UL.reinterpret_as_double(),
  ])
  let forward = child.forward()
  let inverse = child.inverse()
  secondary_functions_source_numbers([forward(1.0), forward(4.0)], [
    4607182418800017408UL.reinterpret_as_double(),
    4625196817309499392UL.reinterpret_as_double(),
  ])
  secondary_functions_source_numbers([inverse(1.0), inverse(4.0)], [
    4607182418800017408UL.reinterpret_as_double(),
    4611686018427387904UL.reinterpret_as_double(),
  ])
  assert_eq(
    [
      secondary_functions_source_same_major(old_major, child.locator().unwrap()),
      secondary_functions_source_same_minor(
        old_minor,
        child.minor_locator().unwrap(),
      ),
      physical_equal(old_major_formatter, child.named_formatter().unwrap()),
      physical_equal(
        old_minor_formatter,
        child.minor_named_formatter().unwrap(),
      ),
    ],
    [true, true, true, true],
  )
  assert_eq(
    child.named_formatter().unwrap().axis(),
    Some(child.formatter_axis_binding()),
  )
  assert_eq(
    child.minor_named_formatter().unwrap().axis(),
    Some(child.formatter_axis_binding()),
  )
}

///|
fn secondary_functions_source_case_31() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_classic_mode(previous.classic_mode())
    try! @config.set_axes_autolimit_mode(previous.axes_autolimit_mode())
    try! @config.set_x_margin(previous.x_margin())
    try! @config.set_y_margin(previous.y_margin())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  @config.set_x_margin(0.05)
  @config.set_y_margin(0.05)
  let fig = figure(width=320, height=240)
  let parent = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  parent.set_xlim(1.0, 4.0)
  let child = parent.secondary_xaxis(value => 2.0 * value, value => value / 2.0)
  child.set_ticks([0.0, 1.0])
  child.set_locator(@ticker.LogLocator::new().as_locator())
  let old_major = child.locator().unwrap()
  let old_minor = child.minor_locator().unwrap()
  let old_major_formatter = child.named_formatter().unwrap()
  let old_minor_formatter = child.minor_named_formatter().unwrap()
  parent.set_x_scale(@scale.log_scale())
  parent.set_xlim(1.0, 4.0)
  // Source native error text is retained in JSON; Core projects its checked variant.
  assert_true(
    try {
      child.reset_functions()
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(child.parent_scale_name, Some("linear"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
  let view = child.numeric_axis.stored_view_limits()
  secondary_functions_source_numbers([view.lower(), view.upper()], [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  assert_eq(child.ticks_set, true)
  assert_true(child.location() is SecondaryAxisLocation::Top)
  assert_eq(
    [
      secondary_functions_source_major_class(child.locator().unwrap()),
      secondary_functions_source_minor_class(child.minor_locator().unwrap()),
      secondary_functions_source_formatter_class(
        child.named_formatter().unwrap(),
      ),
      secondary_functions_source_formatter_class(
        child.minor_named_formatter().unwrap(),
      ),
    ],
    ["LogLocator", "NullLocator", "ScalarFormatter", "NullFormatter"],
  )
  assert_eq(
    [
      child.numeric_axis.is_default_locator(),
      child.numeric_axis.is_default_locator(minor=true),
      child.numeric_axis.is_default_formatter(),
      child.numeric_axis.is_default_formatter(minor=true),
    ],
    [false, true, true, true],
  )
  let transform = child.numeric_axis.coordinate_transform()
  secondary_functions_source_numbers([transform(9.0)], [
    4616752568008179712UL.reinterpret_as_double(),
  ])
  let forward = child.forward()
  let inverse = child.inverse()
  secondary_functions_source_numbers([forward(1.0), forward(4.0)], [
    4607182418800017408UL.reinterpret_as_double(),
    4616189618054758400UL.reinterpret_as_double(),
  ])
  secondary_functions_source_numbers([inverse(1.0), inverse(4.0)], [
    4607182418800017408UL.reinterpret_as_double(),
    4616189618054758400UL.reinterpret_as_double(),
  ])
  assert_eq(
    [
      secondary_functions_source_same_major(old_major, child.locator().unwrap()),
      secondary_functions_source_same_minor(
        old_minor,
        child.minor_locator().unwrap(),
      ),
      physical_equal(old_major_formatter, child.named_formatter().unwrap()),
      physical_equal(
        old_minor_formatter,
        child.minor_named_formatter().unwrap(),
      ),
    ],
    [true, true, true, true],
  )
  assert_eq(
    child.named_formatter().unwrap().axis(),
    Some(child.formatter_axis_binding()),
  )
  assert_eq(
    child.minor_named_formatter().unwrap().axis(),
    Some(child.formatter_axis_binding()),
  )
}

///|
fn secondary_functions_source_case_32() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_classic_mode(previous.classic_mode())
    try! @config.set_axes_autolimit_mode(previous.axes_autolimit_mode())
    try! @config.set_x_margin(previous.x_margin())
    try! @config.set_y_margin(previous.y_margin())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  @config.set_x_margin(0.05)
  @config.set_y_margin(0.05)
  let fig = figure(width=320, height=240)
  let parent = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  parent.set_ylim(1.0, 4.0)
  let child = parent.secondary_yaxis(value => 2.0 * value, value => value / 2.0)
  child.set_ticks([0.0, 1.0])
  child.set_locator(@ticker.LogLocator::new().as_locator())
  let old_major = child.locator().unwrap()
  let old_minor = child.minor_locator().unwrap()
  let old_major_formatter = child.named_formatter().unwrap()
  let old_minor_formatter = child.minor_named_formatter().unwrap()
  parent.set_y_scale(@scale.log_scale())
  parent.set_ylim(1.0, 4.0)
  // Source native error text is retained in JSON; Core projects its checked variant.
  assert_true(
    try {
      child.set_functions(value => value * value, value => value.sqrt())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(child.parent_scale_name, Some("linear"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
  let view = child.numeric_axis.stored_view_limits()
  secondary_functions_source_numbers([view.lower(), view.upper()], [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  assert_eq(child.ticks_set, true)
  assert_true(child.location() is SecondaryAxisLocation::Right)
  assert_eq(
    [
      secondary_functions_source_major_class(child.locator().unwrap()),
      secondary_functions_source_minor_class(child.minor_locator().unwrap()),
      secondary_functions_source_formatter_class(
        child.named_formatter().unwrap(),
      ),
      secondary_functions_source_formatter_class(
        child.minor_named_formatter().unwrap(),
      ),
    ],
    ["LogLocator", "NullLocator", "ScalarFormatter", "NullFormatter"],
  )
  assert_eq(
    [
      child.numeric_axis.is_default_locator(),
      child.numeric_axis.is_default_locator(minor=true),
      child.numeric_axis.is_default_formatter(),
      child.numeric_axis.is_default_formatter(minor=true),
    ],
    [false, true, true, true],
  )
  let transform = child.numeric_axis.coordinate_transform()
  secondary_functions_source_numbers([transform(9.0)], [
    4616752568008179712UL.reinterpret_as_double(),
  ])
  let forward = child.forward()
  let inverse = child.inverse()
  secondary_functions_source_numbers([forward(1.0), forward(4.0)], [
    4607182418800017408UL.reinterpret_as_double(),
    4625196817309499392UL.reinterpret_as_double(),
  ])
  secondary_functions_source_numbers([inverse(1.0), inverse(4.0)], [
    4607182418800017408UL.reinterpret_as_double(),
    4611686018427387904UL.reinterpret_as_double(),
  ])
  assert_eq(
    [
      secondary_functions_source_same_major(old_major, child.locator().unwrap()),
      secondary_functions_source_same_minor(
        old_minor,
        child.minor_locator().unwrap(),
      ),
      physical_equal(old_major_formatter, child.named_formatter().unwrap()),
      physical_equal(
        old_minor_formatter,
        child.minor_named_formatter().unwrap(),
      ),
    ],
    [true, true, true, true],
  )
  assert_eq(
    child.named_formatter().unwrap().axis(),
    Some(child.formatter_axis_binding()),
  )
  assert_eq(
    child.minor_named_formatter().unwrap().axis(),
    Some(child.formatter_axis_binding()),
  )
}

///|
fn secondary_functions_source_case_33() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_classic_mode(previous.classic_mode())
    try! @config.set_axes_autolimit_mode(previous.axes_autolimit_mode())
    try! @config.set_x_margin(previous.x_margin())
    try! @config.set_y_margin(previous.y_margin())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  @config.set_x_margin(0.05)
  @config.set_y_margin(0.05)
  let fig = figure(width=320, height=240)
  let parent = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  parent.set_ylim(1.0, 4.0)
  let child = parent.secondary_yaxis(value => 2.0 * value, value => value / 2.0)
  child.set_ticks([0.0, 1.0])
  child.set_locator(@ticker.LogLocator::new().as_locator())
  let old_major = child.locator().unwrap()
  let old_minor = child.minor_locator().unwrap()
  let old_major_formatter = child.named_formatter().unwrap()
  let old_minor_formatter = child.minor_named_formatter().unwrap()
  parent.set_y_scale(@scale.log_scale())
  parent.set_ylim(1.0, 4.0)
  // Source native error text is retained in JSON; Core projects its checked variant.
  assert_true(
    try {
      child.reset_functions()
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(child.parent_scale_name, Some("linear"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
  let view = child.numeric_axis.stored_view_limits()
  secondary_functions_source_numbers([view.lower(), view.upper()], [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  assert_eq(child.ticks_set, true)
  assert_true(child.location() is SecondaryAxisLocation::Right)
  assert_eq(
    [
      secondary_functions_source_major_class(child.locator().unwrap()),
      secondary_functions_source_minor_class(child.minor_locator().unwrap()),
      secondary_functions_source_formatter_class(
        child.named_formatter().unwrap(),
      ),
      secondary_functions_source_formatter_class(
        child.minor_named_formatter().unwrap(),
      ),
    ],
    ["LogLocator", "NullLocator", "ScalarFormatter", "NullFormatter"],
  )
  assert_eq(
    [
      child.numeric_axis.is_default_locator(),
      child.numeric_axis.is_default_locator(minor=true),
      child.numeric_axis.is_default_formatter(),
      child.numeric_axis.is_default_formatter(minor=true),
    ],
    [false, true, true, true],
  )
  let transform = child.numeric_axis.coordinate_transform()
  secondary_functions_source_numbers([transform(9.0)], [
    4616752568008179712UL.reinterpret_as_double(),
  ])
  let forward = child.forward()
  let inverse = child.inverse()
  secondary_functions_source_numbers([forward(1.0), forward(4.0)], [
    4607182418800017408UL.reinterpret_as_double(),
    4616189618054758400UL.reinterpret_as_double(),
  ])
  secondary_functions_source_numbers([inverse(1.0), inverse(4.0)], [
    4607182418800017408UL.reinterpret_as_double(),
    4616189618054758400UL.reinterpret_as_double(),
  ])
  assert_eq(
    [
      secondary_functions_source_same_major(old_major, child.locator().unwrap()),
      secondary_functions_source_same_minor(
        old_minor,
        child.minor_locator().unwrap(),
      ),
      physical_equal(old_major_formatter, child.named_formatter().unwrap()),
      physical_equal(
        old_minor_formatter,
        child.minor_named_formatter().unwrap(),
      ),
    ],
    [true, true, true, true],
  )
  assert_eq(
    child.named_formatter().unwrap().axis(),
    Some(child.formatter_axis_binding()),
  )
  assert_eq(
    child.minor_named_formatter().unwrap().axis(),
    Some(child.formatter_axis_binding()),
  )
}

///|
fn secondary_functions_source_case_34() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_classic_mode(previous.classic_mode())
    try! @config.set_axes_autolimit_mode(previous.axes_autolimit_mode())
    try! @config.set_x_margin(previous.x_margin())
    try! @config.set_y_margin(previous.y_margin())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  @config.set_x_margin(0.05)
  @config.set_y_margin(0.05)
  let fig = figure(width=320, height=240)
  let parent = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  parent.set_xlim(1.0, 4.0)
  let child = parent.secondary_xaxis(value => 2.0 * value, value => value / 2.0)
  let old_major = child.locator().unwrap()
  let old_minor = child.minor_locator().unwrap()
  let old_major_formatter = child.named_formatter().unwrap()
  let old_minor_formatter = child.minor_named_formatter().unwrap()
  parent.set_x_scale(@scale.log_scale())
  parent.set_xlim(1.0, 4.0)
  child.set_functions(
    value => {
      ignore(value)
      0.0 / 0.0
    },
    value => value,
  )
  assert_eq(child.parent_scale_name, Some("log"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "functionlog")
  let view = child.numeric_axis.stored_view_limits()
  secondary_functions_source_numbers([view.lower(), view.upper()], [
    4607182418800017408UL.reinterpret_as_double(),
    4621819117588971520UL.reinterpret_as_double(),
  ])
  assert_eq(child.ticks_set, false)
  assert_true(child.location() is SecondaryAxisLocation::Top)
  assert_eq(
    [
      secondary_functions_source_major_class(child.locator().unwrap()),
      secondary_functions_source_minor_class(child.minor_locator().unwrap()),
      secondary_functions_source_formatter_class(
        child.named_formatter().unwrap(),
      ),
      secondary_functions_source_formatter_class(
        child.minor_named_formatter().unwrap(),
      ),
    ],
    [
      "LogLocator", "LogLocator", "LogFormatterSciNotation", "LogFormatterSciNotation",
    ],
  )
  assert_eq(
    [
      child.numeric_axis.is_default_locator(),
      child.numeric_axis.is_default_locator(minor=true),
      child.numeric_axis.is_default_formatter(),
      child.numeric_axis.is_default_formatter(minor=true),
    ],
    [true, true, true, true],
  )
  let transform = child.numeric_axis.coordinate_transform()
  secondary_functions_source_numbers([transform(9.0)], [
    4606770271965140477UL.reinterpret_as_double(),
  ])
  let forward = child.forward()
  let inverse = child.inverse()
  secondary_functions_source_numbers([forward(1.0), forward(4.0)], [
    0.0 / 0.0,
    0.0 / 0.0,
  ])
  secondary_functions_source_numbers([inverse(1.0), inverse(4.0)], [
    4607182418800017408UL.reinterpret_as_double(),
    4616189618054758400UL.reinterpret_as_double(),
  ])
  assert_eq(
    [
      secondary_functions_source_same_major(old_major, child.locator().unwrap()),
      secondary_functions_source_same_minor(
        old_minor,
        child.minor_locator().unwrap(),
      ),
      physical_equal(old_major_formatter, child.named_formatter().unwrap()),
      physical_equal(
        old_minor_formatter,
        child.minor_named_formatter().unwrap(),
      ),
    ],
    [false, false, false, false],
  )
  assert_eq(
    child.named_formatter().unwrap().axis(),
    Some(child.formatter_axis_binding()),
  )
  assert_eq(
    child.minor_named_formatter().unwrap().axis(),
    Some(child.formatter_axis_binding()),
  )
}

///|
fn secondary_functions_source_case_35() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_classic_mode(previous.classic_mode())
    try! @config.set_axes_autolimit_mode(previous.axes_autolimit_mode())
    try! @config.set_x_margin(previous.x_margin())
    try! @config.set_y_margin(previous.y_margin())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  @config.set_x_margin(0.05)
  @config.set_y_margin(0.05)
  let fig = figure(width=320, height=240)
  let parent = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  parent.set_ylim(1.0, 4.0)
  let child = parent.secondary_yaxis(value => 2.0 * value, value => value / 2.0)
  let old_major = child.locator().unwrap()
  let old_minor = child.minor_locator().unwrap()
  let old_major_formatter = child.named_formatter().unwrap()
  let old_minor_formatter = child.minor_named_formatter().unwrap()
  parent.set_y_scale(@scale.log_scale())
  parent.set_ylim(1.0, 4.0)
  child.set_functions(
    value => {
      ignore(value)
      0.0 / 0.0
    },
    value => value,
  )
  assert_eq(child.parent_scale_name, Some("log"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "functionlog")
  let view = child.numeric_axis.stored_view_limits()
  secondary_functions_source_numbers([view.lower(), view.upper()], [
    4607182418800017408UL.reinterpret_as_double(),
    4621819117588971520UL.reinterpret_as_double(),
  ])
  assert_eq(child.ticks_set, false)
  assert_true(child.location() is SecondaryAxisLocation::Right)
  assert_eq(
    [
      secondary_functions_source_major_class(child.locator().unwrap()),
      secondary_functions_source_minor_class(child.minor_locator().unwrap()),
      secondary_functions_source_formatter_class(
        child.named_formatter().unwrap(),
      ),
      secondary_functions_source_formatter_class(
        child.minor_named_formatter().unwrap(),
      ),
    ],
    [
      "LogLocator", "LogLocator", "LogFormatterSciNotation", "LogFormatterSciNotation",
    ],
  )
  assert_eq(
    [
      child.numeric_axis.is_default_locator(),
      child.numeric_axis.is_default_locator(minor=true),
      child.numeric_axis.is_default_formatter(),
      child.numeric_axis.is_default_formatter(minor=true),
    ],
    [true, true, true, true],
  )
  let transform = child.numeric_axis.coordinate_transform()
  secondary_functions_source_numbers([transform(9.0)], [
    4606770271965140477UL.reinterpret_as_double(),
  ])
  let forward = child.forward()
  let inverse = child.inverse()
  secondary_functions_source_numbers([forward(1.0), forward(4.0)], [
    0.0 / 0.0,
    0.0 / 0.0,
  ])
  secondary_functions_source_numbers([inverse(1.0), inverse(4.0)], [
    4607182418800017408UL.reinterpret_as_double(),
    4616189618054758400UL.reinterpret_as_double(),
  ])
  assert_eq(
    [
      secondary_functions_source_same_major(old_major, child.locator().unwrap()),
      secondary_functions_source_same_minor(
        old_minor,
        child.minor_locator().unwrap(),
      ),
      physical_equal(old_major_formatter, child.named_formatter().unwrap()),
      physical_equal(
        old_minor_formatter,
        child.minor_named_formatter().unwrap(),
      ),
    ],
    [false, false, false, false],
  )
  assert_eq(
    child.named_formatter().unwrap().axis(),
    Some(child.formatter_axis_binding()),
  )
  assert_eq(
    child.minor_named_formatter().unwrap().axis(),
    Some(child.formatter_axis_binding()),
  )
}

///|
fn secondary_functions_source_case_36() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_classic_mode(previous.classic_mode())
    try! @config.set_axes_autolimit_mode(previous.axes_autolimit_mode())
    try! @config.set_x_margin(previous.x_margin())
    try! @config.set_y_margin(previous.y_margin())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  @config.set_x_margin(0.05)
  @config.set_y_margin(0.05)
  let fig = figure(width=320, height=240)
  let parent = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  parent.set_xlim(1.0, 4.0)
  let child = parent.secondary_xaxis(value => 2.0 * value, value => value / 2.0)
  let old_major = child.locator().unwrap()
  let old_minor = child.minor_locator().unwrap()
  let old_major_formatter = child.named_formatter().unwrap()
  let old_minor_formatter = child.minor_named_formatter().unwrap()
  child.set_functions(
    value => {
      ignore(value)
      0.0 / 0.0
    },
    value => value,
  )
  assert_eq(child.parent_scale_name, Some("linear"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
  let view = child.numeric_axis.stored_view_limits()
  secondary_functions_source_numbers([view.lower(), view.upper()], [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  assert_eq(child.ticks_set, false)
  assert_true(child.location() is SecondaryAxisLocation::Top)
  assert_eq(
    [
      secondary_functions_source_major_class(child.locator().unwrap()),
      secondary_functions_source_minor_class(child.minor_locator().unwrap()),
      secondary_functions_source_formatter_class(
        child.named_formatter().unwrap(),
      ),
      secondary_functions_source_formatter_class(
        child.minor_named_formatter().unwrap(),
      ),
    ],
    ["AutoLocator", "NullLocator", "ScalarFormatter", "NullFormatter"],
  )
  assert_eq(
    [
      child.numeric_axis.is_default_locator(),
      child.numeric_axis.is_default_locator(minor=true),
      child.numeric_axis.is_default_formatter(),
      child.numeric_axis.is_default_formatter(minor=true),
    ],
    [true, true, true, true],
  )
  let transform = child.numeric_axis.coordinate_transform()
  secondary_functions_source_numbers([transform(9.0)], [
    4616752568008179712UL.reinterpret_as_double(),
  ])
  let forward = child.forward()
  let inverse = child.inverse()
  secondary_functions_source_numbers([forward(1.0), forward(4.0)], [
    0.0 / 0.0,
    0.0 / 0.0,
  ])
  secondary_functions_source_numbers([inverse(1.0), inverse(4.0)], [
    4607182418800017408UL.reinterpret_as_double(),
    4616189618054758400UL.reinterpret_as_double(),
  ])
  assert_eq(
    [
      secondary_functions_source_same_major(old_major, child.locator().unwrap()),
      secondary_functions_source_same_minor(
        old_minor,
        child.minor_locator().unwrap(),
      ),
      physical_equal(old_major_formatter, child.named_formatter().unwrap()),
      physical_equal(
        old_minor_formatter,
        child.minor_named_formatter().unwrap(),
      ),
    ],
    [true, true, true, true],
  )
  assert_eq(
    child.named_formatter().unwrap().axis(),
    Some(child.formatter_axis_binding()),
  )
  assert_eq(
    child.minor_named_formatter().unwrap().axis(),
    Some(child.formatter_axis_binding()),
  )
}

///|
fn secondary_functions_source_case_37() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_classic_mode(previous.classic_mode())
    try! @config.set_axes_autolimit_mode(previous.axes_autolimit_mode())
    try! @config.set_x_margin(previous.x_margin())
    try! @config.set_y_margin(previous.y_margin())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  @config.set_x_margin(0.05)
  @config.set_y_margin(0.05)
  let fig = figure(width=320, height=240)
  let parent = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  parent.set_xlim(1.0, 4.0)
  let child = parent.secondary_xaxis(value => 2.0 * value, value => value / 2.0)
  let old_major = child.locator().unwrap()
  let old_minor = child.minor_locator().unwrap()
  let old_major_formatter = child.named_formatter().unwrap()
  let old_minor_formatter = child.minor_named_formatter().unwrap()
  child.set_functions(
    value => {
      ignore(value)
      0.0 / 0.0
    },
    value => value,
  )
  // Source native error text is retained in JSON; Core projects its checked variant.
  assert_true(
    try {
      child.apply_aspect()
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(child.parent_scale_name, Some("linear"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
  let view = child.numeric_axis.stored_view_limits()
  secondary_functions_source_numbers([view.lower(), view.upper()], [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  assert_eq(child.ticks_set, false)
  assert_true(child.location() is SecondaryAxisLocation::Top)
  assert_eq(
    [
      secondary_functions_source_major_class(child.locator().unwrap()),
      secondary_functions_source_minor_class(child.minor_locator().unwrap()),
      secondary_functions_source_formatter_class(
        child.named_formatter().unwrap(),
      ),
      secondary_functions_source_formatter_class(
        child.minor_named_formatter().unwrap(),
      ),
    ],
    ["AutoLocator", "NullLocator", "ScalarFormatter", "NullFormatter"],
  )
  assert_eq(
    [
      child.numeric_axis.is_default_locator(),
      child.numeric_axis.is_default_locator(minor=true),
      child.numeric_axis.is_default_formatter(),
      child.numeric_axis.is_default_formatter(minor=true),
    ],
    [true, true, true, true],
  )
  let transform = child.numeric_axis.coordinate_transform()
  secondary_functions_source_numbers([transform(9.0)], [
    4616752568008179712UL.reinterpret_as_double(),
  ])
  let forward = child.forward()
  let inverse = child.inverse()
  secondary_functions_source_numbers([forward(1.0), forward(4.0)], [
    0.0 / 0.0,
    0.0 / 0.0,
  ])
  secondary_functions_source_numbers([inverse(1.0), inverse(4.0)], [
    4607182418800017408UL.reinterpret_as_double(),
    4616189618054758400UL.reinterpret_as_double(),
  ])
  assert_eq(
    [
      secondary_functions_source_same_major(old_major, child.locator().unwrap()),
      secondary_functions_source_same_minor(
        old_minor,
        child.minor_locator().unwrap(),
      ),
      physical_equal(old_major_formatter, child.named_formatter().unwrap()),
      physical_equal(
        old_minor_formatter,
        child.minor_named_formatter().unwrap(),
      ),
    ],
    [true, true, true, true],
  )
  assert_eq(
    child.named_formatter().unwrap().axis(),
    Some(child.formatter_axis_binding()),
  )
  assert_eq(
    child.minor_named_formatter().unwrap().axis(),
    Some(child.formatter_axis_binding()),
  )
}

///|
fn secondary_functions_source_case_38() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_classic_mode(previous.classic_mode())
    try! @config.set_axes_autolimit_mode(previous.axes_autolimit_mode())
    try! @config.set_x_margin(previous.x_margin())
    try! @config.set_y_margin(previous.y_margin())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  @config.set_x_margin(0.05)
  @config.set_y_margin(0.05)
  let fig = figure(width=320, height=240)
  let parent = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  parent.set_ylim(1.0, 4.0)
  let child = parent.secondary_yaxis(value => 2.0 * value, value => value / 2.0)
  let old_major = child.locator().unwrap()
  let old_minor = child.minor_locator().unwrap()
  let old_major_formatter = child.named_formatter().unwrap()
  let old_minor_formatter = child.minor_named_formatter().unwrap()
  child.set_functions(
    value => {
      ignore(value)
      0.0 / 0.0
    },
    value => value,
  )
  assert_eq(child.parent_scale_name, Some("linear"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
  let view = child.numeric_axis.stored_view_limits()
  secondary_functions_source_numbers([view.lower(), view.upper()], [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  assert_eq(child.ticks_set, false)
  assert_true(child.location() is SecondaryAxisLocation::Right)
  assert_eq(
    [
      secondary_functions_source_major_class(child.locator().unwrap()),
      secondary_functions_source_minor_class(child.minor_locator().unwrap()),
      secondary_functions_source_formatter_class(
        child.named_formatter().unwrap(),
      ),
      secondary_functions_source_formatter_class(
        child.minor_named_formatter().unwrap(),
      ),
    ],
    ["AutoLocator", "NullLocator", "ScalarFormatter", "NullFormatter"],
  )
  assert_eq(
    [
      child.numeric_axis.is_default_locator(),
      child.numeric_axis.is_default_locator(minor=true),
      child.numeric_axis.is_default_formatter(),
      child.numeric_axis.is_default_formatter(minor=true),
    ],
    [true, true, true, true],
  )
  let transform = child.numeric_axis.coordinate_transform()
  secondary_functions_source_numbers([transform(9.0)], [
    4616752568008179712UL.reinterpret_as_double(),
  ])
  let forward = child.forward()
  let inverse = child.inverse()
  secondary_functions_source_numbers([forward(1.0), forward(4.0)], [
    0.0 / 0.0,
    0.0 / 0.0,
  ])
  secondary_functions_source_numbers([inverse(1.0), inverse(4.0)], [
    4607182418800017408UL.reinterpret_as_double(),
    4616189618054758400UL.reinterpret_as_double(),
  ])
  assert_eq(
    [
      secondary_functions_source_same_major(old_major, child.locator().unwrap()),
      secondary_functions_source_same_minor(
        old_minor,
        child.minor_locator().unwrap(),
      ),
      physical_equal(old_major_formatter, child.named_formatter().unwrap()),
      physical_equal(
        old_minor_formatter,
        child.minor_named_formatter().unwrap(),
      ),
    ],
    [true, true, true, true],
  )
  assert_eq(
    child.named_formatter().unwrap().axis(),
    Some(child.formatter_axis_binding()),
  )
  assert_eq(
    child.minor_named_formatter().unwrap().axis(),
    Some(child.formatter_axis_binding()),
  )
}

///|
fn secondary_functions_source_case_39() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_classic_mode(previous.classic_mode())
    try! @config.set_axes_autolimit_mode(previous.axes_autolimit_mode())
    try! @config.set_x_margin(previous.x_margin())
    try! @config.set_y_margin(previous.y_margin())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  @config.set_x_margin(0.05)
  @config.set_y_margin(0.05)
  let fig = figure(width=320, height=240)
  let parent = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  parent.set_ylim(1.0, 4.0)
  let child = parent.secondary_yaxis(value => 2.0 * value, value => value / 2.0)
  let old_major = child.locator().unwrap()
  let old_minor = child.minor_locator().unwrap()
  let old_major_formatter = child.named_formatter().unwrap()
  let old_minor_formatter = child.minor_named_formatter().unwrap()
  child.set_functions(
    value => {
      ignore(value)
      0.0 / 0.0
    },
    value => value,
  )
  // Source native error text is retained in JSON; Core projects its checked variant.
  assert_true(
    try {
      child.apply_aspect()
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  assert_eq(child.parent_scale_name, Some("linear"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
  let view = child.numeric_axis.stored_view_limits()
  secondary_functions_source_numbers([view.lower(), view.upper()], [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  assert_eq(child.ticks_set, false)
  assert_true(child.location() is SecondaryAxisLocation::Right)
  assert_eq(
    [
      secondary_functions_source_major_class(child.locator().unwrap()),
      secondary_functions_source_minor_class(child.minor_locator().unwrap()),
      secondary_functions_source_formatter_class(
        child.named_formatter().unwrap(),
      ),
      secondary_functions_source_formatter_class(
        child.minor_named_formatter().unwrap(),
      ),
    ],
    ["AutoLocator", "NullLocator", "ScalarFormatter", "NullFormatter"],
  )
  assert_eq(
    [
      child.numeric_axis.is_default_locator(),
      child.numeric_axis.is_default_locator(minor=true),
      child.numeric_axis.is_default_formatter(),
      child.numeric_axis.is_default_formatter(minor=true),
    ],
    [true, true, true, true],
  )
  let transform = child.numeric_axis.coordinate_transform()
  secondary_functions_source_numbers([transform(9.0)], [
    4616752568008179712UL.reinterpret_as_double(),
  ])
  let forward = child.forward()
  let inverse = child.inverse()
  secondary_functions_source_numbers([forward(1.0), forward(4.0)], [
    0.0 / 0.0,
    0.0 / 0.0,
  ])
  secondary_functions_source_numbers([inverse(1.0), inverse(4.0)], [
    4607182418800017408UL.reinterpret_as_double(),
    4616189618054758400UL.reinterpret_as_double(),
  ])
  assert_eq(
    [
      secondary_functions_source_same_major(old_major, child.locator().unwrap()),
      secondary_functions_source_same_minor(
        old_minor,
        child.minor_locator().unwrap(),
      ),
      physical_equal(old_major_formatter, child.named_formatter().unwrap()),
      physical_equal(
        old_minor_formatter,
        child.minor_named_formatter().unwrap(),
      ),
    ],
    [true, true, true, true],
  )
  assert_eq(
    child.named_formatter().unwrap().axis(),
    Some(child.formatter_axis_binding()),
  )
  assert_eq(
    child.minor_named_formatter().unwrap().axis(),
    Some(child.formatter_axis_binding()),
  )
}

///|
fn secondary_functions_source_case_40() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_classic_mode(previous.classic_mode())
    try! @config.set_axes_autolimit_mode(previous.axes_autolimit_mode())
    try! @config.set_x_margin(previous.x_margin())
    try! @config.set_y_margin(previous.y_margin())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  @config.set_x_margin(0.05)
  @config.set_y_margin(0.05)
  let fig = figure(width=320, height=240)
  let parent = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  parent.set_xlim(1.0, 4.0)
  let child = parent.secondary_xaxis(value => 2.0 * value, value => value / 2.0)
  // initial applied affine pair
  child.apply_aspect()
  {
    let view = child.numeric_axis.stored_view_limits()
    secondary_functions_source_numbers([view.lower(), view.upper()], [
      4611686018427387904UL.reinterpret_as_double(),
      4620693217682128896UL.reinterpret_as_double(),
    ])
    assert_eq(child.parent_scale_name, Some("linear"))
    let transform = child.numeric_axis.coordinate_transform()
    secondary_functions_source_numbers(
      [transform(4616189618054758400UL.reinterpret_as_double())],
      [4611686018427387904UL.reinterpret_as_double()],
    )
    secondary_functions_source_numbers(
      [transform(view.lower()), transform(view.upper())],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
    )
    let forward = child.forward()
    secondary_functions_source_numbers([forward(1.0), forward(4.0)], [
      4611686018427387904UL.reinterpret_as_double(),
      4620693217682128896UL.reinterpret_as_double(),
    ])
  }
  // same-name setter changes functions only
  child.set_functions(value => value * value, value => value.sqrt())
  {
    let view = child.numeric_axis.stored_view_limits()
    secondary_functions_source_numbers([view.lower(), view.upper()], [
      4611686018427387904UL.reinterpret_as_double(),
      4620693217682128896UL.reinterpret_as_double(),
    ])
    assert_eq(child.parent_scale_name, Some("linear"))
    let transform = child.numeric_axis.coordinate_transform()
    secondary_functions_source_numbers(
      [transform(4616189618054758400UL.reinterpret_as_double())],
      [4611686018427387904UL.reinterpret_as_double()],
    )
    secondary_functions_source_numbers(
      [transform(view.lower()), transform(view.upper())],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
    )
    let forward = child.forward()
    secondary_functions_source_numbers([forward(1.0), forward(4.0)], [
      4607182418800017408UL.reinterpret_as_double(),
      4625196817309499392UL.reinterpret_as_double(),
    ])
  }
  // aspect maps new endpoints while retaining old installed transform
  child.apply_aspect()
  {
    let view = child.numeric_axis.stored_view_limits()
    secondary_functions_source_numbers([view.lower(), view.upper()], [
      4607182418800017408UL.reinterpret_as_double(),
      4625196817309499392UL.reinterpret_as_double(),
    ])
    assert_eq(child.parent_scale_name, Some("linear"))
    let transform = child.numeric_axis.coordinate_transform()
    secondary_functions_source_numbers(
      [transform(4616189618054758400UL.reinterpret_as_double())],
      [4611686018427387904UL.reinterpret_as_double()],
    )
    secondary_functions_source_numbers(
      [transform(view.lower()), transform(view.upper())],
      [
        4602678819172646912UL.reinterpret_as_double(),
        4620693217682128896UL.reinterpret_as_double(),
      ],
    )
    let forward = child.forward()
    secondary_functions_source_numbers([forward(1.0), forward(4.0)], [
      4607182418800017408UL.reinterpret_as_double(),
      4625196817309499392UL.reinterpret_as_double(),
    ])
  }
  // same-name draw still retains old installed transform
  child.prepare_draw()
  {
    let view = child.numeric_axis.stored_view_limits()
    secondary_functions_source_numbers([view.lower(), view.upper()], [
      4607182418800017408UL.reinterpret_as_double(),
      4625196817309499392UL.reinterpret_as_double(),
    ])
    assert_eq(child.parent_scale_name, Some("linear"))
    let transform = child.numeric_axis.coordinate_transform()
    secondary_functions_source_numbers(
      [transform(4616189618054758400UL.reinterpret_as_double())],
      [4611686018427387904UL.reinterpret_as_double()],
    )
    secondary_functions_source_numbers(
      [transform(view.lower()), transform(view.upper())],
      [
        4602678819172646912UL.reinterpret_as_double(),
        4620693217682128896UL.reinterpret_as_double(),
      ],
    )
    let forward = child.forward()
    secondary_functions_source_numbers([forward(1.0), forward(4.0)], [
      4607182418800017408UL.reinterpret_as_double(),
      4625196817309499392UL.reinterpret_as_double(),
    ])
  }
  // changed nonlog parent name installs new nonlinear pair
  parent.set_x_scale(@scale.symlog_scale(linthresh=2.0))
  child.prepare_draw()
  {
    let view = child.numeric_axis.stored_view_limits()
    secondary_functions_source_numbers([view.lower(), view.upper()], [
      4607182418800017408UL.reinterpret_as_double(),
      4625196817309499392UL.reinterpret_as_double(),
    ])
    assert_eq(child.parent_scale_name, Some("symlog"))
    let transform = child.numeric_axis.coordinate_transform()
    secondary_functions_source_numbers(
      [transform(4616189618054758400UL.reinterpret_as_double())],
      [4611686018427387904UL.reinterpret_as_double()],
    )
    secondary_functions_source_numbers(
      [transform(view.lower()), transform(view.upper())],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
    )
    let forward = child.forward()
    secondary_functions_source_numbers([forward(1.0), forward(4.0)], [
      4607182418800017408UL.reinterpret_as_double(),
      4625196817309499392UL.reinterpret_as_double(),
    ])
  }
  // None restores identity limit functions but keeps prior transform
  child.reset_functions()
  child.apply_aspect()
  let view = child.numeric_axis.stored_view_limits()
  secondary_functions_source_numbers([view.lower(), view.upper()], [
    4607182418800017408UL.reinterpret_as_double(),
    4616189618054758400UL.reinterpret_as_double(),
  ])
  assert_eq(child.parent_scale_name, Some("symlog"))
  let transform = child.numeric_axis.coordinate_transform()
  secondary_functions_source_numbers(
    [transform(4612248968380809216UL.reinterpret_as_double())],
    [4609434218613702656UL.reinterpret_as_double()],
  )
  secondary_functions_source_numbers(
    [transform(view.lower()), transform(view.upper())],
    [
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
    ],
  )
  let forward = child.forward()
  secondary_functions_source_numbers([forward(1.0), forward(4.0)], [
    4607182418800017408UL.reinterpret_as_double(),
    4616189618054758400UL.reinterpret_as_double(),
  ])
}

///|
test "original secondary control functions group 0" {
  secondary_functions_source_case_0() catch {
    error =>
      fail(
        "secondary functions source 0 [constructor x/pair]: " +
        error.to_string(),
      )
  }
  secondary_functions_source_case_1() catch {
    error =>
      fail(
        "secondary functions source 1 [constructor x/None]: " +
        error.to_string(),
      )
  }
  secondary_functions_source_case_3() catch {
    error =>
      fail(
        "secondary functions source 3 [constructor y/pair]: " +
        error.to_string(),
      )
  }
  secondary_functions_source_case_4() catch {
    error =>
      fail(
        "secondary functions source 4 [constructor y/None]: " +
        error.to_string(),
      )
  }
  secondary_functions_source_case_18() catch {
    error =>
      fail(
        "secondary functions source 18 [same name x/pair]: " + error.to_string(),
      )
  }
  secondary_functions_source_case_19() catch {
    error =>
      fail(
        "secondary functions source 19 [same name x/None]: " + error.to_string(),
      )
  }
  secondary_functions_source_case_20() catch {
    error =>
      fail(
        "secondary functions source 20 [same name y/pair]: " + error.to_string(),
      )
  }
  secondary_functions_source_case_21() catch {
    error =>
      fail(
        "secondary functions source 21 [same name y/None]: " + error.to_string(),
      )
  }
  secondary_functions_source_case_22() catch {
    error =>
      fail(
        "secondary functions source 22 [changed name x/symlog/pair]: " +
        error.to_string(),
      )
  }
  secondary_functions_source_case_23() catch {
    error =>
      fail(
        "secondary functions source 23 [changed name x/log/pair]: " +
        error.to_string(),
      )
  }
  secondary_functions_source_case_24() catch {
    error =>
      fail(
        "secondary functions source 24 [changed name x/symlog/None]: " +
        error.to_string(),
      )
  }
  secondary_functions_source_case_25() catch {
    error =>
      fail(
        "secondary functions source 25 [changed name y/symlog/pair]: " +
        error.to_string(),
      )
  }
  secondary_functions_source_case_26() catch {
    error =>
      fail(
        "secondary functions source 26 [changed name y/log/pair]: " +
        error.to_string(),
      )
  }
  secondary_functions_source_case_27() catch {
    error =>
      fail(
        "secondary functions source 27 [changed name y/symlog/None]: " +
        error.to_string(),
      )
  }
  secondary_functions_source_case_28() catch {
    error =>
      fail(
        "secondary functions source 28 [latch CURRENT Int64 view x]: " +
        error.to_string(),
      )
  }
  secondary_functions_source_case_29() catch {
    error =>
      fail(
        "secondary functions source 29 [latch CURRENT Int64 view y]: " +
        error.to_string(),
      )
  }
  secondary_functions_source_case_30() catch {
    error =>
      fail(
        "secondary functions source 30 [CURRENT locator failure x/pair]: " +
        error.to_string(),
      )
  }
  secondary_functions_source_case_31() catch {
    error =>
      fail(
        "secondary functions source 31 [CURRENT locator failure x/None]: " +
        error.to_string(),
      )
  }
  secondary_functions_source_case_32() catch {
    error =>
      fail(
        "secondary functions source 32 [CURRENT locator failure y/pair]: " +
        error.to_string(),
      )
  }
  secondary_functions_source_case_33() catch {
    error =>
      fail(
        "secondary functions source 33 [CURRENT locator failure y/None]: " +
        error.to_string(),
      )
  }
  secondary_functions_source_case_34() catch {
    error =>
      fail(
        "secondary functions source 34 [post-install NaN forward fallback success x]: " +
        error.to_string(),
      )
  }
  secondary_functions_source_case_35() catch {
    error =>
      fail(
        "secondary functions source 35 [post-install NaN forward fallback success y]: " +
        error.to_string(),
      )
  }
  secondary_functions_source_case_36() catch {
    error =>
      fail(
        "secondary functions source 36 [same-name accepts NaN function x]: " +
        error.to_string(),
      )
  }
  secondary_functions_source_case_37() catch {
    error =>
      fail(
        "secondary functions source 37 [later aspect rejects NaN function x]: " +
        error.to_string(),
      )
  }
  secondary_functions_source_case_38() catch {
    error =>
      fail(
        "secondary functions source 38 [same-name accepts NaN function y]: " +
        error.to_string(),
      )
  }
  secondary_functions_source_case_39() catch {
    error =>
      fail(
        "secondary functions source 39 [later aspect rejects NaN function y]: " +
        error.to_string(),
      )
  }
  secondary_functions_source_case_40() catch {
    error =>
      fail(
        "secondary functions source 40 [sequential nonlinear installed-transform lifecycle]: " +
        error.to_string(),
      )
  }
}
