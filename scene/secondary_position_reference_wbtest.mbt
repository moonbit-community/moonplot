// Generated from pinned original secondary position profiles source; do not edit.

///|
fn secondary_position_source_double(
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
fn secondary_position_source_numbers(
  actual : Array[Double],
  expected : Array[Double],
) -> Unit raise {
  assert_eq(actual.length(), expected.length())
  for i in 0..<actual.length() {
    secondary_position_source_double(actual[i], expected[i])
  }
}

///|
fn secondary_position_source_major_class(value : @ticker.Locator) -> String {
  match value {
    @ticker.Locator::NamedAuto(_) => "AutoLocator"
    @ticker.Locator::NamedLog(_) => "LogLocator"
    @ticker.Locator::NamedFixed(_) => "FixedLocator"
    @ticker.Locator::Null(_) => "NullLocator"
    _ => "other"
  }
}

///|
fn secondary_position_source_minor_class(
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
fn secondary_position_source_formatter_class(
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
fn secondary_position_source_same_major(
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
fn secondary_position_source_same_minor(
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
fn secondary_position_source_case_0() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_classic_mode(previous.classic_mode())
    try! @config.set_axes_autolimit_mode(previous.axes_autolimit_mode())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=320, height=240)
  let parent = fig.add_axes(
    4596373779694328218UL.reinterpret_as_double(),
    4596373779694328218UL.reinterpret_as_double(),
    4600877379321698714UL.reinterpret_as_double(),
    4603579539098121011UL.reinterpret_as_double(),
  )
  parent.set_xlim(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  parent.set_ylim(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  let child = parent.secondary_xaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Top,
  )
  assert_true(child.location() is SecondaryAxisLocation::Top)
  secondary_position_source_double(
    child.position(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  assert_true(child.alignment() is SecondaryAxisAlignment::Top)
  assert_eq(child.parent_scale_name, Some("linear"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
  let view = child.numeric_axis.stored_view_limits()
  secondary_position_source_numbers([view.lower(), view.upper()], [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  assert_eq(
    [
      secondary_position_source_major_class(child.locator().unwrap()),
      secondary_position_source_minor_class(child.minor_locator().unwrap()),
      secondary_position_source_formatter_class(
        child.named_formatter().unwrap(),
      ),
      secondary_position_source_formatter_class(
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
  {
    let box = child.active_bounds
    secondary_position_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4547007122018942976UL.reinterpret_as_double(),
      ],
    )
  }
  let box = child.original_bounds
  secondary_position_source_numbers(
    [box.x0(), box.y0(), box.width(), box.height()],
    [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4547007122018942976UL.reinterpret_as_double(),
    ],
  )
}

///|
fn secondary_position_source_case_1() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_classic_mode(previous.classic_mode())
    try! @config.set_axes_autolimit_mode(previous.axes_autolimit_mode())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=320, height=240)
  let parent = fig.add_axes(
    4596373779694328218UL.reinterpret_as_double(),
    4596373779694328218UL.reinterpret_as_double(),
    4600877379321698714UL.reinterpret_as_double(),
    4603579539098121011UL.reinterpret_as_double(),
  )
  parent.set_xlim(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  parent.set_ylim(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  let child = parent.secondary_xaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Bottom,
  )
  assert_true(child.location() is SecondaryAxisLocation::Bottom)
  secondary_position_source_double(
    child.position(),
    0UL.reinterpret_as_double(),
  )
  assert_true(child.alignment() is SecondaryAxisAlignment::Bottom)
  assert_eq(child.parent_scale_name, Some("linear"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
  let view = child.numeric_axis.stored_view_limits()
  secondary_position_source_numbers([view.lower(), view.upper()], [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  assert_eq(
    [
      secondary_position_source_major_class(child.locator().unwrap()),
      secondary_position_source_minor_class(child.minor_locator().unwrap()),
      secondary_position_source_formatter_class(
        child.named_formatter().unwrap(),
      ),
      secondary_position_source_formatter_class(
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
  {
    let box = child.active_bounds
    secondary_position_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4547007122018942976UL.reinterpret_as_double(),
      ],
    )
  }
  let box = child.original_bounds
  secondary_position_source_numbers(
    [box.x0(), box.y0(), box.width(), box.height()],
    [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4547007122018942976UL.reinterpret_as_double(),
    ],
  )
}

///|
fn secondary_position_source_case_2() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_classic_mode(previous.classic_mode())
    try! @config.set_axes_autolimit_mode(previous.axes_autolimit_mode())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=320, height=240)
  let parent = fig.add_axes(
    4596373779694328218UL.reinterpret_as_double(),
    4596373779694328218UL.reinterpret_as_double(),
    4600877379321698714UL.reinterpret_as_double(),
    4603579539098121011UL.reinterpret_as_double(),
  )
  parent.set_xlim(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  parent.set_ylim(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  let child = parent.secondary_xaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Position(
      13821547256400052224UL.reinterpret_as_double(),
    ),
  )
  guard child.location() is SecondaryAxisLocation::Position(raw_position) else {
    fail("expected numeric raw location")
  }
  secondary_position_source_double(
    raw_position,
    13821547256400052224UL.reinterpret_as_double(),
  )
  secondary_position_source_double(
    child.position(),
    13821547256400052224UL.reinterpret_as_double(),
  )
  assert_true(child.alignment() is SecondaryAxisAlignment::Bottom)
  assert_eq(child.parent_scale_name, Some("linear"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
  let view = child.numeric_axis.stored_view_limits()
  secondary_position_source_numbers([view.lower(), view.upper()], [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  assert_eq(
    [
      secondary_position_source_major_class(child.locator().unwrap()),
      secondary_position_source_minor_class(child.minor_locator().unwrap()),
      secondary_position_source_formatter_class(
        child.named_formatter().unwrap(),
      ),
      secondary_position_source_formatter_class(
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
  {
    let box = child.active_bounds
    secondary_position_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4547007122018942976UL.reinterpret_as_double(),
      ],
    )
  }
  let box = child.original_bounds
  secondary_position_source_numbers(
    [box.x0(), box.y0(), box.width(), box.height()],
    [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4547007122018942976UL.reinterpret_as_double(),
    ],
  )
}

///|
fn secondary_position_source_case_3() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_classic_mode(previous.classic_mode())
    try! @config.set_axes_autolimit_mode(previous.axes_autolimit_mode())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=320, height=240)
  let parent = fig.add_axes(
    4596373779694328218UL.reinterpret_as_double(),
    4596373779694328218UL.reinterpret_as_double(),
    4600877379321698714UL.reinterpret_as_double(),
    4603579539098121011UL.reinterpret_as_double(),
  )
  parent.set_xlim(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  parent.set_ylim(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  let child = parent.secondary_xaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Position(
      4602678819172646911UL.reinterpret_as_double(),
    ),
  )
  guard child.location() is SecondaryAxisLocation::Position(raw_position) else {
    fail("expected numeric raw location")
  }
  secondary_position_source_double(
    raw_position,
    4602678819172646911UL.reinterpret_as_double(),
  )
  secondary_position_source_double(
    child.position(),
    4602678819172646911UL.reinterpret_as_double(),
  )
  assert_true(child.alignment() is SecondaryAxisAlignment::Bottom)
  assert_eq(child.parent_scale_name, Some("linear"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
  let view = child.numeric_axis.stored_view_limits()
  secondary_position_source_numbers([view.lower(), view.upper()], [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  assert_eq(
    [
      secondary_position_source_major_class(child.locator().unwrap()),
      secondary_position_source_minor_class(child.minor_locator().unwrap()),
      secondary_position_source_formatter_class(
        child.named_formatter().unwrap(),
      ),
      secondary_position_source_formatter_class(
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
  {
    let box = child.active_bounds
    secondary_position_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4547007122018942976UL.reinterpret_as_double(),
      ],
    )
  }
  let box = child.original_bounds
  secondary_position_source_numbers(
    [box.x0(), box.y0(), box.width(), box.height()],
    [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4547007122018942976UL.reinterpret_as_double(),
    ],
  )
}

///|
fn secondary_position_source_case_4() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_classic_mode(previous.classic_mode())
    try! @config.set_axes_autolimit_mode(previous.axes_autolimit_mode())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=320, height=240)
  let parent = fig.add_axes(
    4596373779694328218UL.reinterpret_as_double(),
    4596373779694328218UL.reinterpret_as_double(),
    4600877379321698714UL.reinterpret_as_double(),
    4603579539098121011UL.reinterpret_as_double(),
  )
  parent.set_xlim(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  parent.set_ylim(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  let child = parent.secondary_xaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Position(
      4602678819172646912UL.reinterpret_as_double(),
    ),
  )
  guard child.location() is SecondaryAxisLocation::Position(raw_position) else {
    fail("expected numeric raw location")
  }
  secondary_position_source_double(
    raw_position,
    4602678819172646912UL.reinterpret_as_double(),
  )
  secondary_position_source_double(
    child.position(),
    4602678819172646912UL.reinterpret_as_double(),
  )
  assert_true(child.alignment() is SecondaryAxisAlignment::Top)
  assert_eq(child.parent_scale_name, Some("linear"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
  let view = child.numeric_axis.stored_view_limits()
  secondary_position_source_numbers([view.lower(), view.upper()], [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  assert_eq(
    [
      secondary_position_source_major_class(child.locator().unwrap()),
      secondary_position_source_minor_class(child.minor_locator().unwrap()),
      secondary_position_source_formatter_class(
        child.named_formatter().unwrap(),
      ),
      secondary_position_source_formatter_class(
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
  {
    let box = child.active_bounds
    secondary_position_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4547007122018942976UL.reinterpret_as_double(),
      ],
    )
  }
  let box = child.original_bounds
  secondary_position_source_numbers(
    [box.x0(), box.y0(), box.width(), box.height()],
    [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4547007122018942976UL.reinterpret_as_double(),
    ],
  )
}

///|
fn secondary_position_source_case_5() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_classic_mode(previous.classic_mode())
    try! @config.set_axes_autolimit_mode(previous.axes_autolimit_mode())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=320, height=240)
  let parent = fig.add_axes(
    4596373779694328218UL.reinterpret_as_double(),
    4596373779694328218UL.reinterpret_as_double(),
    4600877379321698714UL.reinterpret_as_double(),
    4603579539098121011UL.reinterpret_as_double(),
  )
  parent.set_xlim(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  parent.set_ylim(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  let child = parent.secondary_xaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Position(
      4608308318706860032UL.reinterpret_as_double(),
    ),
  )
  guard child.location() is SecondaryAxisLocation::Position(raw_position) else {
    fail("expected numeric raw location")
  }
  secondary_position_source_double(
    raw_position,
    4608308318706860032UL.reinterpret_as_double(),
  )
  secondary_position_source_double(
    child.position(),
    4608308318706860032UL.reinterpret_as_double(),
  )
  assert_true(child.alignment() is SecondaryAxisAlignment::Top)
  assert_eq(child.parent_scale_name, Some("linear"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
  let view = child.numeric_axis.stored_view_limits()
  secondary_position_source_numbers([view.lower(), view.upper()], [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  assert_eq(
    [
      secondary_position_source_major_class(child.locator().unwrap()),
      secondary_position_source_minor_class(child.minor_locator().unwrap()),
      secondary_position_source_formatter_class(
        child.named_formatter().unwrap(),
      ),
      secondary_position_source_formatter_class(
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
  {
    let box = child.active_bounds
    secondary_position_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4547007122018942976UL.reinterpret_as_double(),
      ],
    )
  }
  let box = child.original_bounds
  secondary_position_source_numbers(
    [box.x0(), box.y0(), box.width(), box.height()],
    [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4547007122018942976UL.reinterpret_as_double(),
    ],
  )
}

///|
fn secondary_position_source_case_6() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_classic_mode(previous.classic_mode())
    try! @config.set_axes_autolimit_mode(previous.axes_autolimit_mode())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=320, height=240)
  let parent = fig.add_axes(
    4596373779694328218UL.reinterpret_as_double(),
    4596373779694328218UL.reinterpret_as_double(),
    4600877379321698714UL.reinterpret_as_double(),
    4603579539098121011UL.reinterpret_as_double(),
  )
  parent.set_xlim(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  parent.set_ylim(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  let child = parent.secondary_xaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Position(0.0 / 0.0),
  )
  guard child.location() is SecondaryAxisLocation::Position(raw_position) else {
    fail("expected numeric raw location")
  }
  secondary_position_source_double(raw_position, 0.0 / 0.0)
  secondary_position_source_double(child.position(), 0.0 / 0.0)
  assert_true(child.alignment() is SecondaryAxisAlignment::Top)
  assert_eq(child.parent_scale_name, Some("linear"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
  let view = child.numeric_axis.stored_view_limits()
  secondary_position_source_numbers([view.lower(), view.upper()], [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  assert_eq(
    [
      secondary_position_source_major_class(child.locator().unwrap()),
      secondary_position_source_minor_class(child.minor_locator().unwrap()),
      secondary_position_source_formatter_class(
        child.named_formatter().unwrap(),
      ),
      secondary_position_source_formatter_class(
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
  {
    let box = child.active_bounds
    secondary_position_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4547007122018942976UL.reinterpret_as_double(),
      ],
    )
  }
  let box = child.original_bounds
  secondary_position_source_numbers(
    [box.x0(), box.y0(), box.width(), box.height()],
    [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4547007122018942976UL.reinterpret_as_double(),
    ],
  )
}

///|
fn secondary_position_source_case_7() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_classic_mode(previous.classic_mode())
    try! @config.set_axes_autolimit_mode(previous.axes_autolimit_mode())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=320, height=240)
  let parent = fig.add_axes(
    4596373779694328218UL.reinterpret_as_double(),
    4596373779694328218UL.reinterpret_as_double(),
    4600877379321698714UL.reinterpret_as_double(),
    4603579539098121011UL.reinterpret_as_double(),
  )
  parent.set_xlim(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  parent.set_ylim(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  let child = parent.secondary_xaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Position(-1.0 / 0.0),
  )
  guard child.location() is SecondaryAxisLocation::Position(raw_position) else {
    fail("expected numeric raw location")
  }
  secondary_position_source_double(raw_position, -1.0 / 0.0)
  secondary_position_source_double(child.position(), -1.0 / 0.0)
  assert_true(child.alignment() is SecondaryAxisAlignment::Bottom)
  assert_eq(child.parent_scale_name, Some("linear"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
  let view = child.numeric_axis.stored_view_limits()
  secondary_position_source_numbers([view.lower(), view.upper()], [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  assert_eq(
    [
      secondary_position_source_major_class(child.locator().unwrap()),
      secondary_position_source_minor_class(child.minor_locator().unwrap()),
      secondary_position_source_formatter_class(
        child.named_formatter().unwrap(),
      ),
      secondary_position_source_formatter_class(
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
  {
    let box = child.active_bounds
    secondary_position_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4547007122018942976UL.reinterpret_as_double(),
      ],
    )
  }
  let box = child.original_bounds
  secondary_position_source_numbers(
    [box.x0(), box.y0(), box.width(), box.height()],
    [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4547007122018942976UL.reinterpret_as_double(),
    ],
  )
}

///|
fn secondary_position_source_case_8() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_classic_mode(previous.classic_mode())
    try! @config.set_axes_autolimit_mode(previous.axes_autolimit_mode())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=320, height=240)
  let parent = fig.add_axes(
    4596373779694328218UL.reinterpret_as_double(),
    4596373779694328218UL.reinterpret_as_double(),
    4600877379321698714UL.reinterpret_as_double(),
    4603579539098121011UL.reinterpret_as_double(),
  )
  parent.set_xlim(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  parent.set_ylim(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  let child = parent.secondary_xaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Position(1.0 / 0.0),
  )
  guard child.location() is SecondaryAxisLocation::Position(raw_position) else {
    fail("expected numeric raw location")
  }
  secondary_position_source_double(raw_position, 1.0 / 0.0)
  secondary_position_source_double(child.position(), 1.0 / 0.0)
  assert_true(child.alignment() is SecondaryAxisAlignment::Top)
  assert_eq(child.parent_scale_name, Some("linear"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
  let view = child.numeric_axis.stored_view_limits()
  secondary_position_source_numbers([view.lower(), view.upper()], [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  assert_eq(
    [
      secondary_position_source_major_class(child.locator().unwrap()),
      secondary_position_source_minor_class(child.minor_locator().unwrap()),
      secondary_position_source_formatter_class(
        child.named_formatter().unwrap(),
      ),
      secondary_position_source_formatter_class(
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
  {
    let box = child.active_bounds
    secondary_position_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4547007122018942976UL.reinterpret_as_double(),
      ],
    )
  }
  let box = child.original_bounds
  secondary_position_source_numbers(
    [box.x0(), box.y0(), box.width(), box.height()],
    [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4547007122018942976UL.reinterpret_as_double(),
    ],
  )
}

///|
fn secondary_position_source_case_9() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_classic_mode(previous.classic_mode())
    try! @config.set_axes_autolimit_mode(previous.axes_autolimit_mode())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=320, height=240)
  let parent = fig.add_axes(
    4596373779694328218UL.reinterpret_as_double(),
    4596373779694328218UL.reinterpret_as_double(),
    4600877379321698714UL.reinterpret_as_double(),
    4603579539098121011UL.reinterpret_as_double(),
  )
  parent.set_xlim(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  parent.set_ylim(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  let child = parent.secondary_yaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Right,
  )
  assert_true(child.location() is SecondaryAxisLocation::Right)
  secondary_position_source_double(
    child.position(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  assert_true(child.alignment() is SecondaryAxisAlignment::Right)
  assert_eq(child.parent_scale_name, Some("linear"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
  let view = child.numeric_axis.stored_view_limits()
  secondary_position_source_numbers([view.lower(), view.upper()], [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  assert_eq(
    [
      secondary_position_source_major_class(child.locator().unwrap()),
      secondary_position_source_minor_class(child.minor_locator().unwrap()),
      secondary_position_source_formatter_class(
        child.named_formatter().unwrap(),
      ),
      secondary_position_source_formatter_class(
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
  {
    let box = child.active_bounds
    secondary_position_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4547007122018943789UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
  }
  let box = child.original_bounds
  secondary_position_source_numbers(
    [box.x0(), box.y0(), box.width(), box.height()],
    [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4547007122018943789UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ],
  )
}

///|
fn secondary_position_source_case_10() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_classic_mode(previous.classic_mode())
    try! @config.set_axes_autolimit_mode(previous.axes_autolimit_mode())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=320, height=240)
  let parent = fig.add_axes(
    4596373779694328218UL.reinterpret_as_double(),
    4596373779694328218UL.reinterpret_as_double(),
    4600877379321698714UL.reinterpret_as_double(),
    4603579539098121011UL.reinterpret_as_double(),
  )
  parent.set_xlim(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  parent.set_ylim(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  let child = parent.secondary_yaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Left,
  )
  assert_true(child.location() is SecondaryAxisLocation::Left)
  secondary_position_source_double(
    child.position(),
    0UL.reinterpret_as_double(),
  )
  assert_true(child.alignment() is SecondaryAxisAlignment::Left)
  assert_eq(child.parent_scale_name, Some("linear"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
  let view = child.numeric_axis.stored_view_limits()
  secondary_position_source_numbers([view.lower(), view.upper()], [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  assert_eq(
    [
      secondary_position_source_major_class(child.locator().unwrap()),
      secondary_position_source_minor_class(child.minor_locator().unwrap()),
      secondary_position_source_formatter_class(
        child.named_formatter().unwrap(),
      ),
      secondary_position_source_formatter_class(
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
  {
    let box = child.active_bounds
    secondary_position_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4547007122018943789UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
  }
  let box = child.original_bounds
  secondary_position_source_numbers(
    [box.x0(), box.y0(), box.width(), box.height()],
    [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4547007122018943789UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ],
  )
}

///|
fn secondary_position_source_case_11() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_classic_mode(previous.classic_mode())
    try! @config.set_axes_autolimit_mode(previous.axes_autolimit_mode())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=320, height=240)
  let parent = fig.add_axes(
    4596373779694328218UL.reinterpret_as_double(),
    4596373779694328218UL.reinterpret_as_double(),
    4600877379321698714UL.reinterpret_as_double(),
    4603579539098121011UL.reinterpret_as_double(),
  )
  parent.set_xlim(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  parent.set_ylim(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  let child = parent.secondary_yaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Position(
      13821547256400052224UL.reinterpret_as_double(),
    ),
  )
  guard child.location() is SecondaryAxisLocation::Position(raw_position) else {
    fail("expected numeric raw location")
  }
  secondary_position_source_double(
    raw_position,
    13821547256400052224UL.reinterpret_as_double(),
  )
  secondary_position_source_double(
    child.position(),
    13821547256400052224UL.reinterpret_as_double(),
  )
  assert_true(child.alignment() is SecondaryAxisAlignment::Left)
  assert_eq(child.parent_scale_name, Some("linear"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
  let view = child.numeric_axis.stored_view_limits()
  secondary_position_source_numbers([view.lower(), view.upper()], [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  assert_eq(
    [
      secondary_position_source_major_class(child.locator().unwrap()),
      secondary_position_source_minor_class(child.minor_locator().unwrap()),
      secondary_position_source_formatter_class(
        child.named_formatter().unwrap(),
      ),
      secondary_position_source_formatter_class(
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
  {
    let box = child.active_bounds
    secondary_position_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4547007122018943789UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
  }
  let box = child.original_bounds
  secondary_position_source_numbers(
    [box.x0(), box.y0(), box.width(), box.height()],
    [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4547007122018943789UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ],
  )
}

///|
fn secondary_position_source_case_12() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_classic_mode(previous.classic_mode())
    try! @config.set_axes_autolimit_mode(previous.axes_autolimit_mode())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=320, height=240)
  let parent = fig.add_axes(
    4596373779694328218UL.reinterpret_as_double(),
    4596373779694328218UL.reinterpret_as_double(),
    4600877379321698714UL.reinterpret_as_double(),
    4603579539098121011UL.reinterpret_as_double(),
  )
  parent.set_xlim(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  parent.set_ylim(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  let child = parent.secondary_yaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Position(
      4602678819172646911UL.reinterpret_as_double(),
    ),
  )
  guard child.location() is SecondaryAxisLocation::Position(raw_position) else {
    fail("expected numeric raw location")
  }
  secondary_position_source_double(
    raw_position,
    4602678819172646911UL.reinterpret_as_double(),
  )
  secondary_position_source_double(
    child.position(),
    4602678819172646911UL.reinterpret_as_double(),
  )
  assert_true(child.alignment() is SecondaryAxisAlignment::Left)
  assert_eq(child.parent_scale_name, Some("linear"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
  let view = child.numeric_axis.stored_view_limits()
  secondary_position_source_numbers([view.lower(), view.upper()], [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  assert_eq(
    [
      secondary_position_source_major_class(child.locator().unwrap()),
      secondary_position_source_minor_class(child.minor_locator().unwrap()),
      secondary_position_source_formatter_class(
        child.named_formatter().unwrap(),
      ),
      secondary_position_source_formatter_class(
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
  {
    let box = child.active_bounds
    secondary_position_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4547007122018943789UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
  }
  let box = child.original_bounds
  secondary_position_source_numbers(
    [box.x0(), box.y0(), box.width(), box.height()],
    [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4547007122018943789UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ],
  )
}

///|
fn secondary_position_source_case_13() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_classic_mode(previous.classic_mode())
    try! @config.set_axes_autolimit_mode(previous.axes_autolimit_mode())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=320, height=240)
  let parent = fig.add_axes(
    4596373779694328218UL.reinterpret_as_double(),
    4596373779694328218UL.reinterpret_as_double(),
    4600877379321698714UL.reinterpret_as_double(),
    4603579539098121011UL.reinterpret_as_double(),
  )
  parent.set_xlim(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  parent.set_ylim(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  let child = parent.secondary_yaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Position(
      4602678819172646912UL.reinterpret_as_double(),
    ),
  )
  guard child.location() is SecondaryAxisLocation::Position(raw_position) else {
    fail("expected numeric raw location")
  }
  secondary_position_source_double(
    raw_position,
    4602678819172646912UL.reinterpret_as_double(),
  )
  secondary_position_source_double(
    child.position(),
    4602678819172646912UL.reinterpret_as_double(),
  )
  assert_true(child.alignment() is SecondaryAxisAlignment::Right)
  assert_eq(child.parent_scale_name, Some("linear"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
  let view = child.numeric_axis.stored_view_limits()
  secondary_position_source_numbers([view.lower(), view.upper()], [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  assert_eq(
    [
      secondary_position_source_major_class(child.locator().unwrap()),
      secondary_position_source_minor_class(child.minor_locator().unwrap()),
      secondary_position_source_formatter_class(
        child.named_formatter().unwrap(),
      ),
      secondary_position_source_formatter_class(
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
  {
    let box = child.active_bounds
    secondary_position_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4547007122018943789UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
  }
  let box = child.original_bounds
  secondary_position_source_numbers(
    [box.x0(), box.y0(), box.width(), box.height()],
    [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4547007122018943789UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ],
  )
}

///|
fn secondary_position_source_case_14() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_classic_mode(previous.classic_mode())
    try! @config.set_axes_autolimit_mode(previous.axes_autolimit_mode())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=320, height=240)
  let parent = fig.add_axes(
    4596373779694328218UL.reinterpret_as_double(),
    4596373779694328218UL.reinterpret_as_double(),
    4600877379321698714UL.reinterpret_as_double(),
    4603579539098121011UL.reinterpret_as_double(),
  )
  parent.set_xlim(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  parent.set_ylim(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  let child = parent.secondary_yaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Position(
      4608308318706860032UL.reinterpret_as_double(),
    ),
  )
  guard child.location() is SecondaryAxisLocation::Position(raw_position) else {
    fail("expected numeric raw location")
  }
  secondary_position_source_double(
    raw_position,
    4608308318706860032UL.reinterpret_as_double(),
  )
  secondary_position_source_double(
    child.position(),
    4608308318706860032UL.reinterpret_as_double(),
  )
  assert_true(child.alignment() is SecondaryAxisAlignment::Right)
  assert_eq(child.parent_scale_name, Some("linear"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
  let view = child.numeric_axis.stored_view_limits()
  secondary_position_source_numbers([view.lower(), view.upper()], [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  assert_eq(
    [
      secondary_position_source_major_class(child.locator().unwrap()),
      secondary_position_source_minor_class(child.minor_locator().unwrap()),
      secondary_position_source_formatter_class(
        child.named_formatter().unwrap(),
      ),
      secondary_position_source_formatter_class(
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
  {
    let box = child.active_bounds
    secondary_position_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4547007122018943789UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
  }
  let box = child.original_bounds
  secondary_position_source_numbers(
    [box.x0(), box.y0(), box.width(), box.height()],
    [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4547007122018943789UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ],
  )
}

///|
fn secondary_position_source_case_15() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_classic_mode(previous.classic_mode())
    try! @config.set_axes_autolimit_mode(previous.axes_autolimit_mode())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=320, height=240)
  let parent = fig.add_axes(
    4596373779694328218UL.reinterpret_as_double(),
    4596373779694328218UL.reinterpret_as_double(),
    4600877379321698714UL.reinterpret_as_double(),
    4603579539098121011UL.reinterpret_as_double(),
  )
  parent.set_xlim(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  parent.set_ylim(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  let child = parent.secondary_yaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Position(0.0 / 0.0),
  )
  guard child.location() is SecondaryAxisLocation::Position(raw_position) else {
    fail("expected numeric raw location")
  }
  secondary_position_source_double(raw_position, 0.0 / 0.0)
  secondary_position_source_double(child.position(), 0.0 / 0.0)
  assert_true(child.alignment() is SecondaryAxisAlignment::Right)
  assert_eq(child.parent_scale_name, Some("linear"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
  let view = child.numeric_axis.stored_view_limits()
  secondary_position_source_numbers([view.lower(), view.upper()], [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  assert_eq(
    [
      secondary_position_source_major_class(child.locator().unwrap()),
      secondary_position_source_minor_class(child.minor_locator().unwrap()),
      secondary_position_source_formatter_class(
        child.named_formatter().unwrap(),
      ),
      secondary_position_source_formatter_class(
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
  {
    let box = child.active_bounds
    secondary_position_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4547007122018943789UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
  }
  let box = child.original_bounds
  secondary_position_source_numbers(
    [box.x0(), box.y0(), box.width(), box.height()],
    [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4547007122018943789UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ],
  )
}

///|
fn secondary_position_source_case_16() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_classic_mode(previous.classic_mode())
    try! @config.set_axes_autolimit_mode(previous.axes_autolimit_mode())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=320, height=240)
  let parent = fig.add_axes(
    4596373779694328218UL.reinterpret_as_double(),
    4596373779694328218UL.reinterpret_as_double(),
    4600877379321698714UL.reinterpret_as_double(),
    4603579539098121011UL.reinterpret_as_double(),
  )
  parent.set_xlim(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  parent.set_ylim(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  let child = parent.secondary_yaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Position(-1.0 / 0.0),
  )
  guard child.location() is SecondaryAxisLocation::Position(raw_position) else {
    fail("expected numeric raw location")
  }
  secondary_position_source_double(raw_position, -1.0 / 0.0)
  secondary_position_source_double(child.position(), -1.0 / 0.0)
  assert_true(child.alignment() is SecondaryAxisAlignment::Left)
  assert_eq(child.parent_scale_name, Some("linear"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
  let view = child.numeric_axis.stored_view_limits()
  secondary_position_source_numbers([view.lower(), view.upper()], [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  assert_eq(
    [
      secondary_position_source_major_class(child.locator().unwrap()),
      secondary_position_source_minor_class(child.minor_locator().unwrap()),
      secondary_position_source_formatter_class(
        child.named_formatter().unwrap(),
      ),
      secondary_position_source_formatter_class(
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
  {
    let box = child.active_bounds
    secondary_position_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4547007122018943789UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
  }
  let box = child.original_bounds
  secondary_position_source_numbers(
    [box.x0(), box.y0(), box.width(), box.height()],
    [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4547007122018943789UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ],
  )
}

///|
fn secondary_position_source_case_17() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_classic_mode(previous.classic_mode())
    try! @config.set_axes_autolimit_mode(previous.axes_autolimit_mode())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=320, height=240)
  let parent = fig.add_axes(
    4596373779694328218UL.reinterpret_as_double(),
    4596373779694328218UL.reinterpret_as_double(),
    4600877379321698714UL.reinterpret_as_double(),
    4603579539098121011UL.reinterpret_as_double(),
  )
  parent.set_xlim(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  parent.set_ylim(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  let child = parent.secondary_yaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Position(1.0 / 0.0),
  )
  guard child.location() is SecondaryAxisLocation::Position(raw_position) else {
    fail("expected numeric raw location")
  }
  secondary_position_source_double(raw_position, 1.0 / 0.0)
  secondary_position_source_double(child.position(), 1.0 / 0.0)
  assert_true(child.alignment() is SecondaryAxisAlignment::Right)
  assert_eq(child.parent_scale_name, Some("linear"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
  let view = child.numeric_axis.stored_view_limits()
  secondary_position_source_numbers([view.lower(), view.upper()], [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  assert_eq(
    [
      secondary_position_source_major_class(child.locator().unwrap()),
      secondary_position_source_minor_class(child.minor_locator().unwrap()),
      secondary_position_source_formatter_class(
        child.named_formatter().unwrap(),
      ),
      secondary_position_source_formatter_class(
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
  {
    let box = child.active_bounds
    secondary_position_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4547007122018943789UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
  }
  let box = child.original_bounds
  secondary_position_source_numbers(
    [box.x0(), box.y0(), box.width(), box.height()],
    [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4547007122018943789UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ],
  )
}

///|
fn secondary_position_source_case_21() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_classic_mode(previous.classic_mode())
    try! @config.set_axes_autolimit_mode(previous.axes_autolimit_mode())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=320, height=240)
  let parent = fig.add_axes(
    4596373779694328218UL.reinterpret_as_double(),
    4596373779694328218UL.reinterpret_as_double(),
    4600877379321698714UL.reinterpret_as_double(),
    4603579539098121011UL.reinterpret_as_double(),
  )
  parent.set_xlim(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  parent.set_ylim(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  assert_true(
    try {
      ignore(
        parent.secondary_xaxis(
          value => value,
          value => value,
          location=SecondaryAxisLocation::Left,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
fn secondary_position_source_case_22() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_classic_mode(previous.classic_mode())
    try! @config.set_axes_autolimit_mode(previous.axes_autolimit_mode())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=320, height=240)
  let parent = fig.add_axes(
    4596373779694328218UL.reinterpret_as_double(),
    4596373779694328218UL.reinterpret_as_double(),
    4600877379321698714UL.reinterpret_as_double(),
    4603579539098121011UL.reinterpret_as_double(),
  )
  parent.set_xlim(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  parent.set_ylim(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  assert_true(
    try {
      ignore(
        parent.secondary_yaxis(
          value => value,
          value => value,
          location=SecondaryAxisLocation::Bottom,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
fn secondary_position_source_case_23() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_classic_mode(previous.classic_mode())
    try! @config.set_axes_autolimit_mode(previous.axes_autolimit_mode())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=320, height=240)
  let parent = fig.add_axes(
    4596373779694328218UL.reinterpret_as_double(),
    4596373779694328218UL.reinterpret_as_double(),
    4600877379321698714UL.reinterpret_as_double(),
    4603579539098121011UL.reinterpret_as_double(),
  )
  parent.set_xlim(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  parent.set_ylim(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  let child = parent.secondary_xaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Position(
      4598175219545276416UL.reinterpret_as_double(),
    ),
  )
  let old_major = child.locator().unwrap()
  let old_minor = child.minor_locator().unwrap()
  let old_major_formatter = child.named_formatter().unwrap()
  let old_minor_formatter = child.minor_named_formatter().unwrap()
  child.set_location(SecondaryAxisLocation::Top)
  assert_true(child.location() is SecondaryAxisLocation::Top)
  secondary_position_source_double(
    child.position(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  assert_true(child.alignment() is SecondaryAxisAlignment::Bottom)
  assert_eq(child.parent_scale_name, Some("linear"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
  let view = child.numeric_axis.stored_view_limits()
  secondary_position_source_numbers([view.lower(), view.upper()], [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  assert_eq(
    [
      secondary_position_source_major_class(child.locator().unwrap()),
      secondary_position_source_minor_class(child.minor_locator().unwrap()),
      secondary_position_source_formatter_class(
        child.named_formatter().unwrap(),
      ),
      secondary_position_source_formatter_class(
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
  {
    let box = child.active_bounds
    secondary_position_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4547007122018942976UL.reinterpret_as_double(),
      ],
    )
  }
  {
    let box = child.original_bounds
    secondary_position_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4547007122018942976UL.reinterpret_as_double(),
      ],
    )
  }
  assert_eq(
    [
      secondary_position_source_same_major(old_major, child.locator().unwrap()),
      secondary_position_source_same_minor(
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
}

///|
fn secondary_position_source_case_24() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_classic_mode(previous.classic_mode())
    try! @config.set_axes_autolimit_mode(previous.axes_autolimit_mode())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=320, height=240)
  let parent = fig.add_axes(
    4596373779694328218UL.reinterpret_as_double(),
    4596373779694328218UL.reinterpret_as_double(),
    4600877379321698714UL.reinterpret_as_double(),
    4603579539098121011UL.reinterpret_as_double(),
  )
  parent.set_xlim(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  parent.set_ylim(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  let child = parent.secondary_xaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Position(
      4598175219545276416UL.reinterpret_as_double(),
    ),
  )
  child.set_location(SecondaryAxisLocation::Top)
  let old_major = child.locator().unwrap()
  let old_minor = child.minor_locator().unwrap()
  let old_major_formatter = child.named_formatter().unwrap()
  let old_minor_formatter = child.minor_named_formatter().unwrap()
  child.set_alignment(SecondaryAxisAlignment::Top)
  assert_true(child.location() is SecondaryAxisLocation::Top)
  secondary_position_source_double(
    child.position(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  assert_true(child.alignment() is SecondaryAxisAlignment::Top)
  assert_eq(child.parent_scale_name, Some("linear"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
  let view = child.numeric_axis.stored_view_limits()
  secondary_position_source_numbers([view.lower(), view.upper()], [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  assert_eq(
    [
      secondary_position_source_major_class(child.locator().unwrap()),
      secondary_position_source_minor_class(child.minor_locator().unwrap()),
      secondary_position_source_formatter_class(
        child.named_formatter().unwrap(),
      ),
      secondary_position_source_formatter_class(
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
  {
    let box = child.active_bounds
    secondary_position_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4547007122018942976UL.reinterpret_as_double(),
      ],
    )
  }
  {
    let box = child.original_bounds
    secondary_position_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4547007122018942976UL.reinterpret_as_double(),
      ],
    )
  }
  assert_eq(
    [
      secondary_position_source_same_major(old_major, child.locator().unwrap()),
      secondary_position_source_same_minor(
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
}

///|
fn secondary_position_source_case_25() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_classic_mode(previous.classic_mode())
    try! @config.set_axes_autolimit_mode(previous.axes_autolimit_mode())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=320, height=240)
  let parent = fig.add_axes(
    4596373779694328218UL.reinterpret_as_double(),
    4596373779694328218UL.reinterpret_as_double(),
    4600877379321698714UL.reinterpret_as_double(),
    4603579539098121011UL.reinterpret_as_double(),
  )
  parent.set_xlim(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  parent.set_ylim(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  let child = parent.secondary_xaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Position(
      4598175219545276416UL.reinterpret_as_double(),
    ),
  )
  child.set_location(SecondaryAxisLocation::Top)
  child.set_alignment(SecondaryAxisAlignment::Top)
  let old_major = child.locator().unwrap()
  let old_minor = child.minor_locator().unwrap()
  let old_major_formatter = child.named_formatter().unwrap()
  let old_minor_formatter = child.minor_named_formatter().unwrap()
  child.set_location(SecondaryAxisLocation::Bottom)
  assert_true(child.location() is SecondaryAxisLocation::Bottom)
  secondary_position_source_double(
    child.position(),
    0UL.reinterpret_as_double(),
  )
  assert_true(child.alignment() is SecondaryAxisAlignment::Top)
  assert_eq(child.parent_scale_name, Some("linear"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
  let view = child.numeric_axis.stored_view_limits()
  secondary_position_source_numbers([view.lower(), view.upper()], [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  assert_eq(
    [
      secondary_position_source_major_class(child.locator().unwrap()),
      secondary_position_source_minor_class(child.minor_locator().unwrap()),
      secondary_position_source_formatter_class(
        child.named_formatter().unwrap(),
      ),
      secondary_position_source_formatter_class(
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
  {
    let box = child.active_bounds
    secondary_position_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4547007122018942976UL.reinterpret_as_double(),
      ],
    )
  }
  {
    let box = child.original_bounds
    secondary_position_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4547007122018942976UL.reinterpret_as_double(),
      ],
    )
  }
  assert_eq(
    [
      secondary_position_source_same_major(old_major, child.locator().unwrap()),
      secondary_position_source_same_minor(
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
}

///|
fn secondary_position_source_case_26() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_classic_mode(previous.classic_mode())
    try! @config.set_axes_autolimit_mode(previous.axes_autolimit_mode())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=320, height=240)
  let parent = fig.add_axes(
    4596373779694328218UL.reinterpret_as_double(),
    4596373779694328218UL.reinterpret_as_double(),
    4600877379321698714UL.reinterpret_as_double(),
    4603579539098121011UL.reinterpret_as_double(),
  )
  parent.set_xlim(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  parent.set_ylim(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  let child = parent.secondary_xaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Position(
      4598175219545276416UL.reinterpret_as_double(),
    ),
  )
  child.set_location(SecondaryAxisLocation::Top)
  child.set_alignment(SecondaryAxisAlignment::Top)
  child.set_location(SecondaryAxisLocation::Bottom)
  let old_major = child.locator().unwrap()
  let old_minor = child.minor_locator().unwrap()
  let old_major_formatter = child.named_formatter().unwrap()
  let old_minor_formatter = child.minor_named_formatter().unwrap()
  child.set_location(
    SecondaryAxisLocation::Position(
      4604930618986332160UL.reinterpret_as_double(),
    ),
  )
  guard child.location() is SecondaryAxisLocation::Position(raw_position) else {
    fail("expected numeric raw location")
  }
  secondary_position_source_double(
    raw_position,
    4604930618986332160UL.reinterpret_as_double(),
  )
  secondary_position_source_double(
    child.position(),
    4604930618986332160UL.reinterpret_as_double(),
  )
  assert_true(child.alignment() is SecondaryAxisAlignment::Top)
  assert_eq(child.parent_scale_name, Some("linear"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
  let view = child.numeric_axis.stored_view_limits()
  secondary_position_source_numbers([view.lower(), view.upper()], [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  assert_eq(
    [
      secondary_position_source_major_class(child.locator().unwrap()),
      secondary_position_source_minor_class(child.minor_locator().unwrap()),
      secondary_position_source_formatter_class(
        child.named_formatter().unwrap(),
      ),
      secondary_position_source_formatter_class(
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
  {
    let box = child.active_bounds
    secondary_position_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4547007122018942976UL.reinterpret_as_double(),
      ],
    )
  }
  {
    let box = child.original_bounds
    secondary_position_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4547007122018942976UL.reinterpret_as_double(),
      ],
    )
  }
  assert_eq(
    [
      secondary_position_source_same_major(old_major, child.locator().unwrap()),
      secondary_position_source_same_minor(
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
}

///|
fn secondary_position_source_case_27() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_classic_mode(previous.classic_mode())
    try! @config.set_axes_autolimit_mode(previous.axes_autolimit_mode())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=320, height=240)
  let parent = fig.add_axes(
    4596373779694328218UL.reinterpret_as_double(),
    4596373779694328218UL.reinterpret_as_double(),
    4600877379321698714UL.reinterpret_as_double(),
    4603579539098121011UL.reinterpret_as_double(),
  )
  parent.set_xlim(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  parent.set_ylim(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  let child = parent.secondary_xaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Position(
      4598175219545276416UL.reinterpret_as_double(),
    ),
  )
  child.set_location(SecondaryAxisLocation::Top)
  child.set_alignment(SecondaryAxisAlignment::Top)
  child.set_location(SecondaryAxisLocation::Bottom)
  child.set_location(
    SecondaryAxisLocation::Position(
      4604930618986332160UL.reinterpret_as_double(),
    ),
  )
  let old_major = child.locator().unwrap()
  let old_minor = child.minor_locator().unwrap()
  let old_major_formatter = child.named_formatter().unwrap()
  let old_minor_formatter = child.minor_named_formatter().unwrap()
  child.positioned_aspect(
    4634204016564240384UL.reinterpret_as_double(),
    4631952216750555136UL.reinterpret_as_double(),
    4638707616191610881UL.reinterpret_as_double(),
    4639270566145032192UL.reinterpret_as_double(),
  )
  guard child.location() is SecondaryAxisLocation::Position(raw_position) else {
    fail("expected numeric raw location")
  }
  secondary_position_source_double(
    raw_position,
    4604930618986332160UL.reinterpret_as_double(),
  )
  secondary_position_source_double(
    child.position(),
    4604930618986332160UL.reinterpret_as_double(),
  )
  assert_true(child.alignment() is SecondaryAxisAlignment::Top)
  assert_eq(child.parent_scale_name, Some("linear"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
  let view = child.numeric_axis.stored_view_limits()
  secondary_position_source_numbers([view.lower(), view.upper()], [
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  ])
  assert_eq(
    [
      secondary_position_source_major_class(child.locator().unwrap()),
      secondary_position_source_minor_class(child.minor_locator().unwrap()),
      secondary_position_source_formatter_class(
        child.named_formatter().unwrap(),
      ),
      secondary_position_source_formatter_class(
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
  {
    let box = child.active_bounds
    secondary_position_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        4596373779694328218UL.reinterpret_as_double(),
        4604029899060858060UL.reinterpret_as_double(),
        4600877379321698715UL.reinterpret_as_double(),
        4454198707373473792UL.reinterpret_as_double(),
      ],
    )
  }
  {
    let box = child.original_bounds
    secondary_position_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4547007122018942976UL.reinterpret_as_double(),
      ],
    )
  }
  assert_eq(
    [
      secondary_position_source_same_major(old_major, child.locator().unwrap()),
      secondary_position_source_same_minor(
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
}

///|
fn secondary_position_source_case_28() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_classic_mode(previous.classic_mode())
    try! @config.set_axes_autolimit_mode(previous.axes_autolimit_mode())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=320, height=240)
  let parent = fig.add_axes(
    4596373779694328218UL.reinterpret_as_double(),
    4596373779694328218UL.reinterpret_as_double(),
    4600877379321698714UL.reinterpret_as_double(),
    4603579539098121011UL.reinterpret_as_double(),
  )
  parent.set_xlim(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  parent.set_ylim(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  let child = parent.secondary_yaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Position(
      4598175219545276416UL.reinterpret_as_double(),
    ),
  )
  let old_major = child.locator().unwrap()
  let old_minor = child.minor_locator().unwrap()
  let old_major_formatter = child.named_formatter().unwrap()
  let old_minor_formatter = child.minor_named_formatter().unwrap()
  child.set_location(SecondaryAxisLocation::Right)
  assert_true(child.location() is SecondaryAxisLocation::Right)
  secondary_position_source_double(
    child.position(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  assert_true(child.alignment() is SecondaryAxisAlignment::Left)
  assert_eq(child.parent_scale_name, Some("linear"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
  let view = child.numeric_axis.stored_view_limits()
  secondary_position_source_numbers([view.lower(), view.upper()], [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  assert_eq(
    [
      secondary_position_source_major_class(child.locator().unwrap()),
      secondary_position_source_minor_class(child.minor_locator().unwrap()),
      secondary_position_source_formatter_class(
        child.named_formatter().unwrap(),
      ),
      secondary_position_source_formatter_class(
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
  {
    let box = child.active_bounds
    secondary_position_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4547007122018943789UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
  }
  {
    let box = child.original_bounds
    secondary_position_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4547007122018943789UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
  }
  assert_eq(
    [
      secondary_position_source_same_major(old_major, child.locator().unwrap()),
      secondary_position_source_same_minor(
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
}

///|
fn secondary_position_source_case_29() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_classic_mode(previous.classic_mode())
    try! @config.set_axes_autolimit_mode(previous.axes_autolimit_mode())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=320, height=240)
  let parent = fig.add_axes(
    4596373779694328218UL.reinterpret_as_double(),
    4596373779694328218UL.reinterpret_as_double(),
    4600877379321698714UL.reinterpret_as_double(),
    4603579539098121011UL.reinterpret_as_double(),
  )
  parent.set_xlim(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  parent.set_ylim(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  let child = parent.secondary_yaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Position(
      4598175219545276416UL.reinterpret_as_double(),
    ),
  )
  child.set_location(SecondaryAxisLocation::Right)
  let old_major = child.locator().unwrap()
  let old_minor = child.minor_locator().unwrap()
  let old_major_formatter = child.named_formatter().unwrap()
  let old_minor_formatter = child.minor_named_formatter().unwrap()
  child.set_alignment(SecondaryAxisAlignment::Right)
  assert_true(child.location() is SecondaryAxisLocation::Right)
  secondary_position_source_double(
    child.position(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  assert_true(child.alignment() is SecondaryAxisAlignment::Right)
  assert_eq(child.parent_scale_name, Some("linear"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
  let view = child.numeric_axis.stored_view_limits()
  secondary_position_source_numbers([view.lower(), view.upper()], [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  assert_eq(
    [
      secondary_position_source_major_class(child.locator().unwrap()),
      secondary_position_source_minor_class(child.minor_locator().unwrap()),
      secondary_position_source_formatter_class(
        child.named_formatter().unwrap(),
      ),
      secondary_position_source_formatter_class(
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
  {
    let box = child.active_bounds
    secondary_position_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4547007122018943789UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
  }
  {
    let box = child.original_bounds
    secondary_position_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4547007122018943789UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
  }
  assert_eq(
    [
      secondary_position_source_same_major(old_major, child.locator().unwrap()),
      secondary_position_source_same_minor(
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
}

///|
fn secondary_position_source_case_30() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_classic_mode(previous.classic_mode())
    try! @config.set_axes_autolimit_mode(previous.axes_autolimit_mode())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=320, height=240)
  let parent = fig.add_axes(
    4596373779694328218UL.reinterpret_as_double(),
    4596373779694328218UL.reinterpret_as_double(),
    4600877379321698714UL.reinterpret_as_double(),
    4603579539098121011UL.reinterpret_as_double(),
  )
  parent.set_xlim(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  parent.set_ylim(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  let child = parent.secondary_yaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Position(
      4598175219545276416UL.reinterpret_as_double(),
    ),
  )
  child.set_location(SecondaryAxisLocation::Right)
  child.set_alignment(SecondaryAxisAlignment::Right)
  let old_major = child.locator().unwrap()
  let old_minor = child.minor_locator().unwrap()
  let old_major_formatter = child.named_formatter().unwrap()
  let old_minor_formatter = child.minor_named_formatter().unwrap()
  child.set_location(SecondaryAxisLocation::Left)
  assert_true(child.location() is SecondaryAxisLocation::Left)
  secondary_position_source_double(
    child.position(),
    0UL.reinterpret_as_double(),
  )
  assert_true(child.alignment() is SecondaryAxisAlignment::Right)
  assert_eq(child.parent_scale_name, Some("linear"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
  let view = child.numeric_axis.stored_view_limits()
  secondary_position_source_numbers([view.lower(), view.upper()], [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  assert_eq(
    [
      secondary_position_source_major_class(child.locator().unwrap()),
      secondary_position_source_minor_class(child.minor_locator().unwrap()),
      secondary_position_source_formatter_class(
        child.named_formatter().unwrap(),
      ),
      secondary_position_source_formatter_class(
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
  {
    let box = child.active_bounds
    secondary_position_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4547007122018943789UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
  }
  {
    let box = child.original_bounds
    secondary_position_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4547007122018943789UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
  }
  assert_eq(
    [
      secondary_position_source_same_major(old_major, child.locator().unwrap()),
      secondary_position_source_same_minor(
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
}

///|
fn secondary_position_source_case_31() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_classic_mode(previous.classic_mode())
    try! @config.set_axes_autolimit_mode(previous.axes_autolimit_mode())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=320, height=240)
  let parent = fig.add_axes(
    4596373779694328218UL.reinterpret_as_double(),
    4596373779694328218UL.reinterpret_as_double(),
    4600877379321698714UL.reinterpret_as_double(),
    4603579539098121011UL.reinterpret_as_double(),
  )
  parent.set_xlim(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  parent.set_ylim(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  let child = parent.secondary_yaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Position(
      4598175219545276416UL.reinterpret_as_double(),
    ),
  )
  child.set_location(SecondaryAxisLocation::Right)
  child.set_alignment(SecondaryAxisAlignment::Right)
  child.set_location(SecondaryAxisLocation::Left)
  let old_major = child.locator().unwrap()
  let old_minor = child.minor_locator().unwrap()
  let old_major_formatter = child.named_formatter().unwrap()
  let old_minor_formatter = child.minor_named_formatter().unwrap()
  child.set_location(
    SecondaryAxisLocation::Position(
      4604930618986332160UL.reinterpret_as_double(),
    ),
  )
  guard child.location() is SecondaryAxisLocation::Position(raw_position) else {
    fail("expected numeric raw location")
  }
  secondary_position_source_double(
    raw_position,
    4604930618986332160UL.reinterpret_as_double(),
  )
  secondary_position_source_double(
    child.position(),
    4604930618986332160UL.reinterpret_as_double(),
  )
  assert_true(child.alignment() is SecondaryAxisAlignment::Right)
  assert_eq(child.parent_scale_name, Some("linear"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
  let view = child.numeric_axis.stored_view_limits()
  secondary_position_source_numbers([view.lower(), view.upper()], [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  assert_eq(
    [
      secondary_position_source_major_class(child.locator().unwrap()),
      secondary_position_source_minor_class(child.minor_locator().unwrap()),
      secondary_position_source_formatter_class(
        child.named_formatter().unwrap(),
      ),
      secondary_position_source_formatter_class(
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
  {
    let box = child.active_bounds
    secondary_position_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4547007122018943789UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
  }
  {
    let box = child.original_bounds
    secondary_position_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4547007122018943789UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
  }
  assert_eq(
    [
      secondary_position_source_same_major(old_major, child.locator().unwrap()),
      secondary_position_source_same_minor(
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
}

///|
fn secondary_position_source_case_32() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_classic_mode(previous.classic_mode())
    try! @config.set_axes_autolimit_mode(previous.axes_autolimit_mode())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=320, height=240)
  let parent = fig.add_axes(
    4596373779694328218UL.reinterpret_as_double(),
    4596373779694328218UL.reinterpret_as_double(),
    4600877379321698714UL.reinterpret_as_double(),
    4603579539098121011UL.reinterpret_as_double(),
  )
  parent.set_xlim(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  parent.set_ylim(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  let child = parent.secondary_yaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Position(
      4598175219545276416UL.reinterpret_as_double(),
    ),
  )
  child.set_location(SecondaryAxisLocation::Right)
  child.set_alignment(SecondaryAxisAlignment::Right)
  child.set_location(SecondaryAxisLocation::Left)
  child.set_location(
    SecondaryAxisLocation::Position(
      4604930618986332160UL.reinterpret_as_double(),
    ),
  )
  let old_major = child.locator().unwrap()
  let old_minor = child.minor_locator().unwrap()
  let old_major_formatter = child.named_formatter().unwrap()
  let old_minor_formatter = child.minor_named_formatter().unwrap()
  child.positioned_aspect(
    4634204016564240384UL.reinterpret_as_double(),
    4631952216750555136UL.reinterpret_as_double(),
    4638707616191610881UL.reinterpret_as_double(),
    4639270566145032192UL.reinterpret_as_double(),
  )
  guard child.location() is SecondaryAxisLocation::Position(raw_position) else {
    fail("expected numeric raw location")
  }
  secondary_position_source_double(
    raw_position,
    4604930618986332160UL.reinterpret_as_double(),
  )
  secondary_position_source_double(
    child.position(),
    4604930618986332160UL.reinterpret_as_double(),
  )
  assert_true(child.alignment() is SecondaryAxisAlignment::Right)
  assert_eq(child.parent_scale_name, Some("linear"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
  let view = child.numeric_axis.stored_view_limits()
  secondary_position_source_numbers([view.lower(), view.upper()], [
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  ])
  assert_eq(
    [
      secondary_position_source_major_class(child.locator().unwrap()),
      secondary_position_source_minor_class(child.minor_locator().unwrap()),
      secondary_position_source_formatter_class(
        child.named_formatter().unwrap(),
      ),
      secondary_position_source_formatter_class(
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
  {
    let box = child.active_bounds
    secondary_position_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        4602678819172646913UL.reinterpret_as_double(),
        4596373779694328218UL.reinterpret_as_double(),
        4451242532923244544UL.reinterpret_as_double(),
        4603579539098121012UL.reinterpret_as_double(),
      ],
    )
  }
  {
    let box = child.original_bounds
    secondary_position_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4547007122018943789UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
  }
  assert_eq(
    [
      secondary_position_source_same_major(old_major, child.locator().unwrap()),
      secondary_position_source_same_minor(
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
}

///|
fn secondary_position_source_case_33() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_classic_mode(previous.classic_mode())
    try! @config.set_axes_autolimit_mode(previous.axes_autolimit_mode())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=320, height=240)
  let parent = fig.add_axes(
    4596373779694328218UL.reinterpret_as_double(),
    4596373779694328218UL.reinterpret_as_double(),
    4600877379321698714UL.reinterpret_as_double(),
    4603579539098121011UL.reinterpret_as_double(),
  )
  parent.set_xlim(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  parent.set_ylim(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  let child = parent.secondary_xaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Position(
      4598175219545276416UL.reinterpret_as_double(),
    ),
  )
  let old_major = child.locator().unwrap()
  let old_minor = child.minor_locator().unwrap()
  let old_major_formatter = child.named_formatter().unwrap()
  let old_minor_formatter = child.minor_named_formatter().unwrap()
  // Native error wording is retained in JSON; the existing checked variant is projected here.
  assert_true(
    try {
      child.set_location(SecondaryAxisLocation::Left)
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  guard child.location() is SecondaryAxisLocation::Position(raw_position) else {
    fail("expected numeric raw location")
  }
  secondary_position_source_double(
    raw_position,
    4598175219545276416UL.reinterpret_as_double(),
  )
  secondary_position_source_double(
    child.position(),
    4598175219545276416UL.reinterpret_as_double(),
  )
  assert_true(child.alignment() is SecondaryAxisAlignment::Bottom)
  assert_eq(child.parent_scale_name, Some("linear"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
  let view = child.numeric_axis.stored_view_limits()
  secondary_position_source_numbers([view.lower(), view.upper()], [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  assert_eq(
    [
      secondary_position_source_major_class(child.locator().unwrap()),
      secondary_position_source_minor_class(child.minor_locator().unwrap()),
      secondary_position_source_formatter_class(
        child.named_formatter().unwrap(),
      ),
      secondary_position_source_formatter_class(
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
  {
    let box = child.active_bounds
    secondary_position_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4547007122018942976UL.reinterpret_as_double(),
      ],
    )
  }
  {
    let box = child.original_bounds
    secondary_position_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4547007122018942976UL.reinterpret_as_double(),
      ],
    )
  }
  assert_eq(
    [
      secondary_position_source_same_major(old_major, child.locator().unwrap()),
      secondary_position_source_same_minor(
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
}

///|
fn secondary_position_source_case_35() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_classic_mode(previous.classic_mode())
    try! @config.set_axes_autolimit_mode(previous.axes_autolimit_mode())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=320, height=240)
  let parent = fig.add_axes(
    4596373779694328218UL.reinterpret_as_double(),
    4596373779694328218UL.reinterpret_as_double(),
    4600877379321698714UL.reinterpret_as_double(),
    4603579539098121011UL.reinterpret_as_double(),
  )
  parent.set_xlim(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  parent.set_ylim(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  let child = parent.secondary_xaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Position(
      4598175219545276416UL.reinterpret_as_double(),
    ),
  )
  let old_major = child.locator().unwrap()
  let old_minor = child.minor_locator().unwrap()
  let old_major_formatter = child.named_formatter().unwrap()
  let old_minor_formatter = child.minor_named_formatter().unwrap()
  // Native error wording is retained in JSON; the existing checked variant is projected here.
  assert_true(
    try {
      child.set_alignment(SecondaryAxisAlignment::Left)
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  guard child.location() is SecondaryAxisLocation::Position(raw_position) else {
    fail("expected numeric raw location")
  }
  secondary_position_source_double(
    raw_position,
    4598175219545276416UL.reinterpret_as_double(),
  )
  secondary_position_source_double(
    child.position(),
    4598175219545276416UL.reinterpret_as_double(),
  )
  assert_true(child.alignment() is SecondaryAxisAlignment::Bottom)
  assert_eq(child.parent_scale_name, Some("linear"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
  let view = child.numeric_axis.stored_view_limits()
  secondary_position_source_numbers([view.lower(), view.upper()], [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  assert_eq(
    [
      secondary_position_source_major_class(child.locator().unwrap()),
      secondary_position_source_minor_class(child.minor_locator().unwrap()),
      secondary_position_source_formatter_class(
        child.named_formatter().unwrap(),
      ),
      secondary_position_source_formatter_class(
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
  {
    let box = child.active_bounds
    secondary_position_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4547007122018942976UL.reinterpret_as_double(),
      ],
    )
  }
  {
    let box = child.original_bounds
    secondary_position_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4547007122018942976UL.reinterpret_as_double(),
      ],
    )
  }
  assert_eq(
    [
      secondary_position_source_same_major(old_major, child.locator().unwrap()),
      secondary_position_source_same_minor(
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
}

///|
fn secondary_position_source_case_37() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_classic_mode(previous.classic_mode())
    try! @config.set_axes_autolimit_mode(previous.axes_autolimit_mode())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=320, height=240)
  let parent = fig.add_axes(
    4596373779694328218UL.reinterpret_as_double(),
    4596373779694328218UL.reinterpret_as_double(),
    4600877379321698714UL.reinterpret_as_double(),
    4603579539098121011UL.reinterpret_as_double(),
  )
  parent.set_xlim(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  parent.set_ylim(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  let child = parent.secondary_yaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Position(
      4598175219545276416UL.reinterpret_as_double(),
    ),
  )
  let old_major = child.locator().unwrap()
  let old_minor = child.minor_locator().unwrap()
  let old_major_formatter = child.named_formatter().unwrap()
  let old_minor_formatter = child.minor_named_formatter().unwrap()
  // Native error wording is retained in JSON; the existing checked variant is projected here.
  assert_true(
    try {
      child.set_location(SecondaryAxisLocation::Top)
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  guard child.location() is SecondaryAxisLocation::Position(raw_position) else {
    fail("expected numeric raw location")
  }
  secondary_position_source_double(
    raw_position,
    4598175219545276416UL.reinterpret_as_double(),
  )
  secondary_position_source_double(
    child.position(),
    4598175219545276416UL.reinterpret_as_double(),
  )
  assert_true(child.alignment() is SecondaryAxisAlignment::Left)
  assert_eq(child.parent_scale_name, Some("linear"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
  let view = child.numeric_axis.stored_view_limits()
  secondary_position_source_numbers([view.lower(), view.upper()], [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  assert_eq(
    [
      secondary_position_source_major_class(child.locator().unwrap()),
      secondary_position_source_minor_class(child.minor_locator().unwrap()),
      secondary_position_source_formatter_class(
        child.named_formatter().unwrap(),
      ),
      secondary_position_source_formatter_class(
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
  {
    let box = child.active_bounds
    secondary_position_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4547007122018943789UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
  }
  {
    let box = child.original_bounds
    secondary_position_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4547007122018943789UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
  }
  assert_eq(
    [
      secondary_position_source_same_major(old_major, child.locator().unwrap()),
      secondary_position_source_same_minor(
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
}

///|
fn secondary_position_source_case_39() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_classic_mode(previous.classic_mode())
    try! @config.set_axes_autolimit_mode(previous.axes_autolimit_mode())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=320, height=240)
  let parent = fig.add_axes(
    4596373779694328218UL.reinterpret_as_double(),
    4596373779694328218UL.reinterpret_as_double(),
    4600877379321698714UL.reinterpret_as_double(),
    4603579539098121011UL.reinterpret_as_double(),
  )
  parent.set_xlim(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  parent.set_ylim(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  let child = parent.secondary_yaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Position(
      4598175219545276416UL.reinterpret_as_double(),
    ),
  )
  let old_major = child.locator().unwrap()
  let old_minor = child.minor_locator().unwrap()
  let old_major_formatter = child.named_formatter().unwrap()
  let old_minor_formatter = child.minor_named_formatter().unwrap()
  // Native error wording is retained in JSON; the existing checked variant is projected here.
  assert_true(
    try {
      child.set_alignment(SecondaryAxisAlignment::Top)
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  guard child.location() is SecondaryAxisLocation::Position(raw_position) else {
    fail("expected numeric raw location")
  }
  secondary_position_source_double(
    raw_position,
    4598175219545276416UL.reinterpret_as_double(),
  )
  secondary_position_source_double(
    child.position(),
    4598175219545276416UL.reinterpret_as_double(),
  )
  assert_true(child.alignment() is SecondaryAxisAlignment::Left)
  assert_eq(child.parent_scale_name, Some("linear"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
  let view = child.numeric_axis.stored_view_limits()
  secondary_position_source_numbers([view.lower(), view.upper()], [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  assert_eq(
    [
      secondary_position_source_major_class(child.locator().unwrap()),
      secondary_position_source_minor_class(child.minor_locator().unwrap()),
      secondary_position_source_formatter_class(
        child.named_formatter().unwrap(),
      ),
      secondary_position_source_formatter_class(
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
  {
    let box = child.active_bounds
    secondary_position_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4547007122018943789UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
  }
  {
    let box = child.original_bounds
    secondary_position_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4547007122018943789UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
  }
  assert_eq(
    [
      secondary_position_source_same_major(old_major, child.locator().unwrap()),
      secondary_position_source_same_minor(
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
}

///|
fn secondary_position_source_case_41() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_classic_mode(previous.classic_mode())
    try! @config.set_axes_autolimit_mode(previous.axes_autolimit_mode())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=320, height=240)
  let parent = fig.add_axes(
    4596373779694328218UL.reinterpret_as_double(),
    4596373779694328218UL.reinterpret_as_double(),
    4600877379321698714UL.reinterpret_as_double(),
    4603579539098121011UL.reinterpret_as_double(),
  )
  parent.set_xlim(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  parent.set_ylim(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  let child = parent.secondary_xaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Top,
  )
  let old_major = child.locator().unwrap()
  let old_minor = child.minor_locator().unwrap()
  let old_major_formatter = child.named_formatter().unwrap()
  let old_minor_formatter = child.minor_named_formatter().unwrap()
  child.set_location(SecondaryAxisLocation::Position(0.0 / 0.0))
  guard child.location() is SecondaryAxisLocation::Position(raw_position) else {
    fail("expected numeric raw location")
  }
  secondary_position_source_double(raw_position, 0.0 / 0.0)
  secondary_position_source_double(child.position(), 0.0 / 0.0)
  assert_true(child.alignment() is SecondaryAxisAlignment::Top)
  assert_eq(child.parent_scale_name, Some("linear"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
  let view = child.numeric_axis.stored_view_limits()
  secondary_position_source_numbers([view.lower(), view.upper()], [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  assert_eq(
    [
      secondary_position_source_major_class(child.locator().unwrap()),
      secondary_position_source_minor_class(child.minor_locator().unwrap()),
      secondary_position_source_formatter_class(
        child.named_formatter().unwrap(),
      ),
      secondary_position_source_formatter_class(
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
  {
    let box = child.active_bounds
    secondary_position_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4547007122018942976UL.reinterpret_as_double(),
      ],
    )
  }
  {
    let box = child.original_bounds
    secondary_position_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4547007122018942976UL.reinterpret_as_double(),
      ],
    )
  }
  assert_eq(
    [
      secondary_position_source_same_major(old_major, child.locator().unwrap()),
      secondary_position_source_same_minor(
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
}

///|
fn secondary_position_source_case_42() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_classic_mode(previous.classic_mode())
    try! @config.set_axes_autolimit_mode(previous.axes_autolimit_mode())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=320, height=240)
  let parent = fig.add_axes(
    4596373779694328218UL.reinterpret_as_double(),
    4596373779694328218UL.reinterpret_as_double(),
    4600877379321698714UL.reinterpret_as_double(),
    4603579539098121011UL.reinterpret_as_double(),
  )
  parent.set_xlim(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  parent.set_ylim(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  let child = parent.secondary_xaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Top,
  )
  child.set_location(SecondaryAxisLocation::Position(0.0 / 0.0))
  let old_major = child.locator().unwrap()
  let old_minor = child.minor_locator().unwrap()
  let old_major_formatter = child.named_formatter().unwrap()
  let old_minor_formatter = child.minor_named_formatter().unwrap()
  child.positioned_aspect(
    4634204016564240384UL.reinterpret_as_double(),
    4631952216750555136UL.reinterpret_as_double(),
    4638707616191610881UL.reinterpret_as_double(),
    4639270566145032192UL.reinterpret_as_double(),
  )
  guard child.location() is SecondaryAxisLocation::Position(raw_position) else {
    fail("expected numeric raw location")
  }
  secondary_position_source_double(raw_position, 0.0 / 0.0)
  secondary_position_source_double(child.position(), 0.0 / 0.0)
  assert_true(child.alignment() is SecondaryAxisAlignment::Top)
  assert_eq(child.parent_scale_name, Some("linear"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
  let view = child.numeric_axis.stored_view_limits()
  secondary_position_source_numbers([view.lower(), view.upper()], [
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  ])
  assert_eq(
    [
      secondary_position_source_major_class(child.locator().unwrap()),
      secondary_position_source_minor_class(child.minor_locator().unwrap()),
      secondary_position_source_formatter_class(
        child.named_formatter().unwrap(),
      ),
      secondary_position_source_formatter_class(
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
  {
    let box = child.active_bounds
    secondary_position_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [0.0 / 0.0, 0.0 / 0.0, 0.0 / 0.0, 0.0 / 0.0],
    )
  }
  {
    let box = child.original_bounds
    secondary_position_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4547007122018942976UL.reinterpret_as_double(),
      ],
    )
  }
  assert_eq(
    [
      secondary_position_source_same_major(old_major, child.locator().unwrap()),
      secondary_position_source_same_minor(
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
}

///|
fn secondary_position_source_case_43() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_classic_mode(previous.classic_mode())
    try! @config.set_axes_autolimit_mode(previous.axes_autolimit_mode())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=320, height=240)
  let parent = fig.add_axes(
    4596373779694328218UL.reinterpret_as_double(),
    4598175219545276416UL.reinterpret_as_double(),
    4602678819172646912UL.reinterpret_as_double(),
    4602678819172646912UL.reinterpret_as_double(),
  )
  parent.set_xlim(
    4607182418800017408UL.reinterpret_as_double(),
    4616189618054758400UL.reinterpret_as_double(),
  )
  parent.set_ylim(
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  let child = parent.secondary_xaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Position(
      4604930618986332160UL.reinterpret_as_double(),
    ),
  )
  // constructor before locator application
  {
    guard child.location() is SecondaryAxisLocation::Position(raw_position) else {
      fail("expected numeric raw location")
    }
    secondary_position_source_double(
      raw_position,
      4604930618986332160UL.reinterpret_as_double(),
    )
    secondary_position_source_double(
      child.position(),
      4604930618986332160UL.reinterpret_as_double(),
    )
    assert_true(child.alignment() is SecondaryAxisAlignment::Top)
    let view = child.numeric_axis.stored_view_limits()
    secondary_position_source_numbers([view.lower(), view.upper()], [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
    let box = child.display_bounds()
    secondary_position_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        0UL.reinterpret_as_double(),
        4642648265865560064UL.reinterpret_as_double(),
        4644337115725824000UL.reinterpret_as_double(),
        4582574750436065280UL.reinterpret_as_double(),
      ],
    )
  }
  // positioned at .75
  child.positioned_aspect(
    4634204016564240384UL.reinterpret_as_double(),
    4633641066610819072UL.reinterpret_as_double(),
    4639833516098453504UL.reinterpret_as_double(),
    4638144666238189568UL.reinterpret_as_double(),
  )
  {
    guard child.location() is SecondaryAxisLocation::Position(raw_position) else {
      fail("expected numeric raw location")
    }
    secondary_position_source_double(
      raw_position,
      4604930618986332160UL.reinterpret_as_double(),
    )
    secondary_position_source_double(
      child.position(),
      4604930618986332160UL.reinterpret_as_double(),
    )
    assert_true(child.alignment() is SecondaryAxisAlignment::Top)
    let view = child.numeric_axis.stored_view_limits()
    secondary_position_source_numbers([view.lower(), view.upper()], [
      4607182418800017408UL.reinterpret_as_double(),
      4616189618054758400UL.reinterpret_as_double(),
    ])
    let box = child.display_bounds()
    secondary_position_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        4634204016564240384UL.reinterpret_as_double(),
        4639481672377565184UL.reinterpret_as_double(),
        4639833516098453504UL.reinterpret_as_double(),
        4488335176161558528UL.reinterpret_as_double(),
      ],
    )
  }
  // location assigned .25 before next aspect
  child.set_location(
    SecondaryAxisLocation::Position(
      4598175219545276416UL.reinterpret_as_double(),
    ),
  )
  {
    guard child.location() is SecondaryAxisLocation::Position(raw_position) else {
      fail("expected numeric raw location")
    }
    secondary_position_source_double(
      raw_position,
      4598175219545276416UL.reinterpret_as_double(),
    )
    secondary_position_source_double(
      child.position(),
      4598175219545276416UL.reinterpret_as_double(),
    )
    assert_true(child.alignment() is SecondaryAxisAlignment::Top)
    let view = child.numeric_axis.stored_view_limits()
    secondary_position_source_numbers([view.lower(), view.upper()], [
      4607182418800017408UL.reinterpret_as_double(),
      4616189618054758400UL.reinterpret_as_double(),
    ])
    let box = child.display_bounds()
    secondary_position_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        4634204016564240384UL.reinterpret_as_double(),
        4639481672377565184UL.reinterpret_as_double(),
        4639833516098453504UL.reinterpret_as_double(),
        4488335176161558528UL.reinterpret_as_double(),
      ],
    )
  }
  // positioned at .25 with prior alignment
  child.positioned_aspect(
    4634204016564240384UL.reinterpret_as_double(),
    4633641066610819072UL.reinterpret_as_double(),
    4639833516098453504UL.reinterpret_as_double(),
    4638144666238189568UL.reinterpret_as_double(),
  )
  {
    guard child.location() is SecondaryAxisLocation::Position(raw_position) else {
      fail("expected numeric raw location")
    }
    secondary_position_source_double(
      raw_position,
      4598175219545276416UL.reinterpret_as_double(),
    )
    secondary_position_source_double(
      child.position(),
      4598175219545276416UL.reinterpret_as_double(),
    )
    assert_true(child.alignment() is SecondaryAxisAlignment::Top)
    let view = child.numeric_axis.stored_view_limits()
    secondary_position_source_numbers([view.lower(), view.upper()], [
      4607182418800017408UL.reinterpret_as_double(),
      4616189618054758400UL.reinterpret_as_double(),
    ])
    let box = child.display_bounds()
    secondary_position_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        4634204016564240384UL.reinterpret_as_double(),
        4636033603912859648UL.reinterpret_as_double(),
        4639833516098453504UL.reinterpret_as_double(),
        4488335184751493120UL.reinterpret_as_double(),
      ],
    )
  }
  // alignment changed without moving active bbox
  child.set_alignment(SecondaryAxisAlignment::Bottom)
  guard child.location() is SecondaryAxisLocation::Position(raw_position) else {
    fail("expected numeric raw location")
  }
  secondary_position_source_double(
    raw_position,
    4598175219545276416UL.reinterpret_as_double(),
  )
  secondary_position_source_double(
    child.position(),
    4598175219545276416UL.reinterpret_as_double(),
  )
  assert_true(child.alignment() is SecondaryAxisAlignment::Bottom)
  let view = child.numeric_axis.stored_view_limits()
  secondary_position_source_numbers([view.lower(), view.upper()], [
    4607182418800017408UL.reinterpret_as_double(),
    4616189618054758400UL.reinterpret_as_double(),
  ])
  let box = child.display_bounds()
  secondary_position_source_numbers(
    [box.x0(), box.y0(), box.width(), box.height()],
    [
      4634204016564240384UL.reinterpret_as_double(),
      4636033603912859648UL.reinterpret_as_double(),
      4639833516098453504UL.reinterpret_as_double(),
      4488335184751493120UL.reinterpret_as_double(),
    ],
  )
}

///|
fn secondary_position_source_case_44() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_classic_mode(previous.classic_mode())
    try! @config.set_axes_autolimit_mode(previous.axes_autolimit_mode())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=320, height=240)
  let parent = fig.add_axes(
    4596373779694328218UL.reinterpret_as_double(),
    4598175219545276416UL.reinterpret_as_double(),
    4602678819172646912UL.reinterpret_as_double(),
    4602678819172646912UL.reinterpret_as_double(),
  )
  parent.set_xlim(
    4607182418800017408UL.reinterpret_as_double(),
    4616189618054758400UL.reinterpret_as_double(),
  )
  parent.set_ylim(
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  let child = parent.secondary_yaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Position(
      4604930618986332160UL.reinterpret_as_double(),
    ),
  )
  // constructor before locator application
  {
    guard child.location() is SecondaryAxisLocation::Position(raw_position) else {
      fail("expected numeric raw location")
    }
    secondary_position_source_double(
      raw_position,
      4604930618986332160UL.reinterpret_as_double(),
    )
    secondary_position_source_double(
      child.position(),
      4604930618986332160UL.reinterpret_as_double(),
    )
    assert_true(child.alignment() is SecondaryAxisAlignment::Right)
    let view = child.numeric_axis.stored_view_limits()
    secondary_position_source_numbers([view.lower(), view.upper()], [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
    let box = child.display_bounds()
    secondary_position_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        0UL.reinterpret_as_double(),
        4642648265865560064UL.reinterpret_as_double(),
        4584772507054221820UL.reinterpret_as_double(),
        4642648265865560064UL.reinterpret_as_double(),
      ],
    )
  }
  // positioned at .75
  child.positioned_aspect(
    4634204016564240384UL.reinterpret_as_double(),
    4633641066610819072UL.reinterpret_as_double(),
    4639833516098453504UL.reinterpret_as_double(),
    4638144666238189568UL.reinterpret_as_double(),
  )
  {
    guard child.location() is SecondaryAxisLocation::Position(raw_position) else {
      fail("expected numeric raw location")
    }
    secondary_position_source_double(
      raw_position,
      4604930618986332160UL.reinterpret_as_double(),
    )
    secondary_position_source_double(
      child.position(),
      4604930618986332160UL.reinterpret_as_double(),
    )
    assert_true(child.alignment() is SecondaryAxisAlignment::Right)
    let view = child.numeric_axis.stored_view_limits()
    secondary_position_source_numbers([view.lower(), view.upper()], [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
    let box = child.display_bounds()
    secondary_position_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        4640677941028585472UL.reinterpret_as_double(),
        4633641066610819072UL.reinterpret_as_double(),
        4490420932539580416UL.reinterpret_as_double(),
        4638144666238189568UL.reinterpret_as_double(),
      ],
    )
  }
  // location assigned .25 before next aspect
  child.set_location(
    SecondaryAxisLocation::Position(
      4598175219545276416UL.reinterpret_as_double(),
    ),
  )
  {
    guard child.location() is SecondaryAxisLocation::Position(raw_position) else {
      fail("expected numeric raw location")
    }
    secondary_position_source_double(
      raw_position,
      4598175219545276416UL.reinterpret_as_double(),
    )
    secondary_position_source_double(
      child.position(),
      4598175219545276416UL.reinterpret_as_double(),
    )
    assert_true(child.alignment() is SecondaryAxisAlignment::Right)
    let view = child.numeric_axis.stored_view_limits()
    secondary_position_source_numbers([view.lower(), view.upper()], [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
    let box = child.display_bounds()
    secondary_position_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        4640677941028585472UL.reinterpret_as_double(),
        4633641066610819072UL.reinterpret_as_double(),
        4490420932539580416UL.reinterpret_as_double(),
        4638144666238189568UL.reinterpret_as_double(),
      ],
    )
  }
  // positioned at .25 with prior alignment
  child.positioned_aspect(
    4634204016564240384UL.reinterpret_as_double(),
    4633641066610819072UL.reinterpret_as_double(),
    4639833516098453504UL.reinterpret_as_double(),
    4638144666238189568UL.reinterpret_as_double(),
  )
  {
    guard child.location() is SecondaryAxisLocation::Position(raw_position) else {
      fail("expected numeric raw location")
    }
    secondary_position_source_double(
      raw_position,
      4598175219545276416UL.reinterpret_as_double(),
    )
    secondary_position_source_double(
      child.position(),
      4598175219545276416UL.reinterpret_as_double(),
    )
    assert_true(child.alignment() is SecondaryAxisAlignment::Right)
    let view = child.numeric_axis.stored_view_limits()
    secondary_position_source_numbers([view.lower(), view.upper()], [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
    let box = child.display_bounds()
    secondary_position_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        4637018766331346944UL.reinterpret_as_double(),
        4633641066610819072UL.reinterpret_as_double(),
        4490420932539580416UL.reinterpret_as_double(),
        4638144666238189568UL.reinterpret_as_double(),
      ],
    )
  }
  // alignment changed without moving active bbox
  child.set_alignment(SecondaryAxisAlignment::Left)
  guard child.location() is SecondaryAxisLocation::Position(raw_position) else {
    fail("expected numeric raw location")
  }
  secondary_position_source_double(
    raw_position,
    4598175219545276416UL.reinterpret_as_double(),
  )
  secondary_position_source_double(
    child.position(),
    4598175219545276416UL.reinterpret_as_double(),
  )
  assert_true(child.alignment() is SecondaryAxisAlignment::Left)
  let view = child.numeric_axis.stored_view_limits()
  secondary_position_source_numbers([view.lower(), view.upper()], [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  let box = child.display_bounds()
  secondary_position_source_numbers(
    [box.x0(), box.y0(), box.width(), box.height()],
    [
      4637018766331346944UL.reinterpret_as_double(),
      4633641066610819072UL.reinterpret_as_double(),
      4490420932539580416UL.reinterpret_as_double(),
      4638144666238189568UL.reinterpret_as_double(),
    ],
  )
}

///|
fn secondary_position_source_case_45() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_classic_mode(previous.classic_mode())
    try! @config.set_axes_autolimit_mode(previous.axes_autolimit_mode())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=320, height=240)
  let parent = fig.add_axes(
    4596373779694328218UL.reinterpret_as_double(),
    4598175219545276416UL.reinterpret_as_double(),
    4602678819172646912UL.reinterpret_as_double(),
    4602678819172646912UL.reinterpret_as_double(),
  )
  parent.set_xlim(
    4607182418800017408UL.reinterpret_as_double(),
    4611686018427387904UL.reinterpret_as_double(),
  )
  parent.set_ylim(
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  let child = parent.secondary_xaxis(
    value => {
      ignore(value)
      4.0
    },
    value => {
      ignore(value)
      1.0
    },
    location=SecondaryAxisLocation::Top,
  )
  child.set_locator(@ticker.FixedLocator::new([2.0, 3.0]).as_locator())
  parent.set_x_scale(@scale.log_scale())
  child.prepare_draw()
  {
    let view = child.numeric_axis.stored_view_limits()
    secondary_position_source_numbers([view.lower(), view.upper()], [
      4615739258092021350UL.reinterpret_as_double(),
      4616414798036126925UL.reinterpret_as_double(),
    ])
  }
  child.positioned_aspect(
    4634204016564240384UL.reinterpret_as_double(),
    4633641066610819072UL.reinterpret_as_double(),
    4639833516098453504UL.reinterpret_as_double(),
    4638144666238189568UL.reinterpret_as_double(),
  )
  {
    let view = child.numeric_axis.stored_view_limits()
    secondary_position_source_numbers([view.lower(), view.upper()], [
      4607182418800017408UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
    ])
  }
  assert_eq(child.numeric_axis.coordinate_scale_name(), "functionlog")
  assert_eq(child.parent_scale_name, Some("log"))
  let box = child.display_bounds()
  secondary_position_source_numbers(
    [box.x0(), box.y0(), box.width(), box.height()],
    [
      4634204016564240384UL.reinterpret_as_double(),
      4640537203540230144UL.reinterpret_as_double(),
      4639833516098453504UL.reinterpret_as_double(),
      4488335176161558528UL.reinterpret_as_double(),
    ],
  )
}

///|
fn secondary_position_source_case_46() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_classic_mode(previous.classic_mode())
    try! @config.set_axes_autolimit_mode(previous.axes_autolimit_mode())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=320, height=240)
  let parent = fig.add_axes(
    4596373779694328218UL.reinterpret_as_double(),
    4598175219545276416UL.reinterpret_as_double(),
    4602678819172646912UL.reinterpret_as_double(),
    4602678819172646912UL.reinterpret_as_double(),
  )
  parent.set_xlim(
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  parent.set_ylim(
    4607182418800017408UL.reinterpret_as_double(),
    4611686018427387904UL.reinterpret_as_double(),
  )
  let child = parent.secondary_yaxis(
    value => {
      ignore(value)
      4.0
    },
    value => {
      ignore(value)
      1.0
    },
    location=SecondaryAxisLocation::Right,
  )
  child.set_locator(@ticker.FixedLocator::new([2.0, 3.0]).as_locator())
  parent.set_y_scale(@scale.log_scale())
  child.prepare_draw()
  {
    let view = child.numeric_axis.stored_view_limits()
    secondary_position_source_numbers([view.lower(), view.upper()], [
      4615739258092021350UL.reinterpret_as_double(),
      4616414798036126925UL.reinterpret_as_double(),
    ])
  }
  child.positioned_aspect(
    4634204016564240384UL.reinterpret_as_double(),
    4633641066610819072UL.reinterpret_as_double(),
    4639833516098453504UL.reinterpret_as_double(),
    4638144666238189568UL.reinterpret_as_double(),
  )
  {
    let view = child.numeric_axis.stored_view_limits()
    secondary_position_source_numbers([view.lower(), view.upper()], [
      4607182418800017408UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
    ])
  }
  assert_eq(child.numeric_axis.coordinate_scale_name(), "functionlog")
  assert_eq(child.parent_scale_name, Some("log"))
  let box = child.display_bounds()
  secondary_position_source_numbers(
    [box.x0(), box.y0(), box.width(), box.height()],
    [
      4642085315912138752UL.reinterpret_as_double(),
      4633641066610819072UL.reinterpret_as_double(),
      4490420932539580416UL.reinterpret_as_double(),
      4638144666238189568UL.reinterpret_as_double(),
    ],
  )
}

///|
fn secondary_position_source_case_47() -> Unit raise {
  let previous = @config.rc_params()
  defer {
    @config.set_minor_ticks_visible(previous.minor_ticks_visible())
    @config.set_minor_ticks_visible(
      previous.minor_ticks_visible(horizontal=false),
      horizontal=false,
    )
    @config.set_classic_mode(previous.classic_mode())
    try! @config.set_axes_autolimit_mode(previous.axes_autolimit_mode())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  let fig = figure(width=320, height=240)
  let parent = fig.add_axes(
    4596373779694328218UL.reinterpret_as_double(),
    4598175219545276416UL.reinterpret_as_double(),
    4602678819172646912UL.reinterpret_as_double(),
    4602678819172646912UL.reinterpret_as_double(),
  )
  parent.set_xlim(
    4607182418800017408UL.reinterpret_as_double(),
    4616189618054758400UL.reinterpret_as_double(),
  )
  parent.set_ylim(
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  let child = parent.secondary_xaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Position(
      4598175219545276416UL.reinterpret_as_double(),
    ),
  )
  child.set_functions(
    value => {
      try! child.set_location(
        SecondaryAxisLocation::Position(
          4604930618986332160UL.reinterpret_as_double(),
        ),
      )
      value
    },
    value => value,
  )
  child.positioned_aspect(
    4634204016564240384UL.reinterpret_as_double(),
    4633641066610819072UL.reinterpret_as_double(),
    4639833516098453504UL.reinterpret_as_double(),
    4638144666238189568UL.reinterpret_as_double(),
  )
  guard child.location() is SecondaryAxisLocation::Position(raw_position) else {
    fail("expected numeric raw location")
  }
  secondary_position_source_double(
    raw_position,
    4604930618986332160UL.reinterpret_as_double(),
  )
  secondary_position_source_double(
    child.position(),
    4604930618986332160UL.reinterpret_as_double(),
  )
  let view = child.numeric_axis.stored_view_limits()
  secondary_position_source_numbers([view.lower(), view.upper()], [
    4607182418800017408UL.reinterpret_as_double(),
    4616189618054758400UL.reinterpret_as_double(),
  ])
  let box = child.display_bounds()
  secondary_position_source_numbers(
    [box.x0(), box.y0(), box.width(), box.height()],
    [
      4634204016564240384UL.reinterpret_as_double(),
      4636033603912859648UL.reinterpret_as_double(),
      4639833516098453504UL.reinterpret_as_double(),
      4488335184751493120UL.reinterpret_as_double(),
    ],
  )
}

///|
test "original secondary position group 0" {
  secondary_position_source_case_0() catch {
    error =>
      fail(
        "secondary position source 0 [constructor x/default named]: " +
        error.to_string(),
      )
  }
  secondary_position_source_case_1() catch {
    error =>
      fail(
        "secondary position source 1 [constructor x/opposite named]: " +
        error.to_string(),
      )
  }
  secondary_position_source_case_2() catch {
    error =>
      fail(
        "secondary position source 2 [constructor x/negative outside]: " +
        error.to_string(),
      )
  }
  secondary_position_source_case_3() catch {
    error =>
      fail(
        "secondary position source 3 [constructor x/below half]: " +
        error.to_string(),
      )
  }
  secondary_position_source_case_4() catch {
    error =>
      fail(
        "secondary position source 4 [constructor x/exact half]: " +
        error.to_string(),
      )
  }
  secondary_position_source_case_5() catch {
    error =>
      fail(
        "secondary position source 5 [constructor x/above one]: " +
        error.to_string(),
      )
  }
  secondary_position_source_case_6() catch {
    error =>
      fail(
        "secondary position source 6 [constructor x/NaN]: " + error.to_string(),
      )
  }
  secondary_position_source_case_7() catch {
    error =>
      fail(
        "secondary position source 7 [constructor x/negative infinity]: " +
        error.to_string(),
      )
  }
  secondary_position_source_case_8() catch {
    error =>
      fail(
        "secondary position source 8 [constructor x/positive infinity]: " +
        error.to_string(),
      )
  }
  secondary_position_source_case_9() catch {
    error =>
      fail(
        "secondary position source 9 [constructor y/default named]: " +
        error.to_string(),
      )
  }
  secondary_position_source_case_10() catch {
    error =>
      fail(
        "secondary position source 10 [constructor y/opposite named]: " +
        error.to_string(),
      )
  }
  secondary_position_source_case_11() catch {
    error =>
      fail(
        "secondary position source 11 [constructor y/negative outside]: " +
        error.to_string(),
      )
  }
  secondary_position_source_case_12() catch {
    error =>
      fail(
        "secondary position source 12 [constructor y/below half]: " +
        error.to_string(),
      )
  }
  secondary_position_source_case_13() catch {
    error =>
      fail(
        "secondary position source 13 [constructor y/exact half]: " +
        error.to_string(),
      )
  }
  secondary_position_source_case_14() catch {
    error =>
      fail(
        "secondary position source 14 [constructor y/above one]: " +
        error.to_string(),
      )
  }
  secondary_position_source_case_15() catch {
    error =>
      fail(
        "secondary position source 15 [constructor y/NaN]: " + error.to_string(),
      )
  }
  secondary_position_source_case_16() catch {
    error =>
      fail(
        "secondary position source 16 [constructor y/negative infinity]: " +
        error.to_string(),
      )
  }
  secondary_position_source_case_17() catch {
    error =>
      fail(
        "secondary position source 17 [constructor y/positive infinity]: " +
        error.to_string(),
      )
  }
  secondary_position_source_case_21() catch {
    error =>
      fail(
        "secondary position source 21 [constructor wrong direction x]: " +
        error.to_string(),
      )
  }
  secondary_position_source_case_22() catch {
    error =>
      fail(
        "secondary position source 22 [constructor wrong direction y]: " +
        error.to_string(),
      )
  }
  secondary_position_source_case_23() catch {
    error =>
      fail(
        "secondary position source 23 [setter moves to first but keeps initial low alignment x]: " +
        error.to_string(),
      )
  }
  secondary_position_source_case_24() catch {
    error =>
      fail(
        "secondary position source 24 [explicit first alignment does not move location x]: " +
        error.to_string(),
      )
  }
  secondary_position_source_case_25() catch {
    error =>
      fail(
        "secondary position source 25 [setter moves to last but keeps explicit high alignment x]: " +
        error.to_string(),
      )
  }
  secondary_position_source_case_26() catch {
    error =>
      fail(
        "secondary position source 26 [numeric setter keeps explicit high alignment x]: " +
        error.to_string(),
      )
  }
  secondary_position_source_case_27() catch {
    error =>
      fail(
        "secondary position source 27 [apply positioned locator only now changes active rectangle x]: " +
        error.to_string(),
      )
  }
  secondary_position_source_case_28() catch {
    error =>
      fail(
        "secondary position source 28 [setter moves to first but keeps initial low alignment y]: " +
        error.to_string(),
      )
  }
  secondary_position_source_case_29() catch {
    error =>
      fail(
        "secondary position source 29 [explicit first alignment does not move location y]: " +
        error.to_string(),
      )
  }
  secondary_position_source_case_30() catch {
    error =>
      fail(
        "secondary position source 30 [setter moves to last but keeps explicit high alignment y]: " +
        error.to_string(),
      )
  }
  secondary_position_source_case_31() catch {
    error =>
      fail(
        "secondary position source 31 [numeric setter keeps explicit high alignment y]: " +
        error.to_string(),
      )
  }
  secondary_position_source_case_32() catch {
    error =>
      fail(
        "secondary position source 32 [apply positioned locator only now changes active rectangle y]: " +
        error.to_string(),
      )
  }
  secondary_position_source_case_33() catch {
    error =>
      fail(
        "secondary position source 33 [failed update x/wrong named location]: " +
        error.to_string(),
      )
  }
  secondary_position_source_case_35() catch {
    error =>
      fail(
        "secondary position source 35 [failed update x/wrong alignment]: " +
        error.to_string(),
      )
  }
}

///|
test "original secondary position group 1" {
  secondary_position_source_case_37() catch {
    error =>
      fail(
        "secondary position source 37 [failed update y/wrong named location]: " +
        error.to_string(),
      )
  }
  secondary_position_source_case_39() catch {
    error =>
      fail(
        "secondary position source 39 [failed update y/wrong alignment]: " +
        error.to_string(),
      )
  }
  secondary_position_source_case_41() catch {
    error =>
      fail(
        "secondary position source 41 [NaN location setter is accepted before locator evaluation]: " +
        error.to_string(),
      )
  }
  secondary_position_source_case_42() catch {
    error =>
      fail(
        "secondary position source 42 [NaN positioned aspect leaves geometric NaNs not a location validation error]: " +
        error.to_string(),
      )
  }
  secondary_position_source_case_43() catch {
    error =>
      fail(
        "secondary position source 43 [actual position/alignment geometry sequence x]: " +
        error.to_string(),
      )
  }
  secondary_position_source_case_44() catch {
    error =>
      fail(
        "secondary position source 44 [actual position/alignment geometry sequence y]: " +
        error.to_string(),
      )
  }
  secondary_position_source_case_45() catch {
    error =>
      fail(
        "secondary position source 45 [complete Base.draw second numeric aspect x]: " +
        error.to_string(),
      )
  }
  secondary_position_source_case_46() catch {
    error =>
      fail(
        "secondary position source 46 [complete Base.draw second numeric aspect y]: " +
        error.to_string(),
      )
  }
  secondary_position_source_case_47() catch {
    error =>
      fail(
        "secondary position source 47 [locator captured before forward changes location]: " +
        error.to_string(),
      )
  }
}
