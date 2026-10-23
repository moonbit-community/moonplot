// Generated from pinned complete Secondary/numeric lifecycle source; do not edit.

///|
fn secondary_source_double(actual : Double, expected : Double) -> Unit raise {
  if expected.is_nan() {
    assert_true(actual.is_nan())
  } else {
    assert_eq(actual.reinterpret_as_uint64(), expected.reinterpret_as_uint64())
  }
}

///|
fn secondary_source_numbers(
  actual : Array[Double],
  expected : Array[Double],
) -> Unit raise {
  assert_eq(actual.length(), expected.length())
  for i in 0..<actual.length() {
    secondary_source_double(actual[i], expected[i])
  }
}

///|
fn secondary_source_major_class(value : @ticker.Locator) -> String {
  match value {
    @ticker.Locator::NamedAuto(_) => "AutoLocator"
    @ticker.Locator::NamedLog(_) => "LogLocator"
    @ticker.Locator::NamedFixed(_) => "FixedLocator"
    @ticker.Locator::Null(_) => "NullLocator"
    _ => "other"
  }
}

///|
fn secondary_source_minor_class(value : @ticker.MinorLocator) -> String {
  match value {
    @ticker.MinorLocator::NamedAutoMinor(_) => "AutoMinorLocator"
    @ticker.MinorLocator::NamedLog(_) => "LogLocator"
    @ticker.MinorLocator::NamedFixed(_) => "FixedLocator"
    @ticker.MinorLocator::Null(_) => "NullLocator"
    _ => "other"
  }
}

///|
fn secondary_source_formatter_class(value : @ticker.BaseFormatter) -> String {
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
fn secondary_source_same_major(
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
fn secondary_source_same_minor(
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
fn secondary_source_case_0() -> Unit raise {
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
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  @config.set_x_margin(0.05)
  @config.set_y_margin(0.05)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_text_usetex(false)
  let figure = figure(width=320, height=240)
  let parent = figure.axes()
  parent.set_x_scale(@scale.linear_scale())
  parent.set_xlim(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  let child = parent.secondary_xaxis(value => 2.0 * value + 5.0, value => {
    (value - 5.0) / 2.0
  })
  {
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    let view = child.numeric_axis.stored_view_limits()
    secondary_source_numbers([view.lower(), view.upper()], [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
    secondary_source_numbers(
      [
        child.numeric_axis.data_interval().lower(),
        child.numeric_axis.data_interval().upper(),
      ],
      [
        9218868437227405312UL.reinterpret_as_double(),
        18442240474082181120UL.reinterpret_as_double(),
      ],
    )
    secondary_source_double(
      child.numeric_axis.get_minpos(),
      9218868437227405312UL.reinterpret_as_double(),
    )
    secondary_source_double(
      child.get_tick_space(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    secondary_source_numbers(
      [child.formatter_geometry().0, child.formatter_geometry().1],
      [
        0UL.reinterpret_as_double(),
        4644337115725824000UL.reinterpret_as_double(),
      ],
    )
    assert_eq(child.numeric_axis.autoscale_on(), true)
    assert_eq(child.numeric_axis.autoscale_stale(), false)
    assert_eq(child.ticks_set, false)
    assert_eq(
      [
        secondary_source_major_class(child.numeric_axis.locator().unwrap()),
        secondary_source_minor_class(
          child.numeric_axis.minor_locator().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.named_formatter().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.minor_named_formatter().unwrap(),
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
    secondary_source_numbers(child.tick_values_checked(), [
      0UL.reinterpret_as_double(),
      4596373779694328218UL.reinterpret_as_double(),
      4600877379321698714UL.reinterpret_as_double(),
      4603579539098121012UL.reinterpret_as_double(),
      4605380978949069210UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
    assert_true(
      physical_equal(
        child.numeric_axis.named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
    assert_true(
      physical_equal(
        child.numeric_axis.minor_named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
  }
  child.apply_aspect()
  {
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    let view = child.numeric_axis.stored_view_limits()
    secondary_source_numbers([view.lower(), view.upper()], [
      4627730092099895296UL.reinterpret_as_double(),
      4631530004285489152UL.reinterpret_as_double(),
    ])
    secondary_source_numbers(
      [
        child.numeric_axis.data_interval().lower(),
        child.numeric_axis.data_interval().upper(),
      ],
      [
        9218868437227405312UL.reinterpret_as_double(),
        18442240474082181120UL.reinterpret_as_double(),
      ],
    )
    secondary_source_double(
      child.numeric_axis.get_minpos(),
      9218868437227405312UL.reinterpret_as_double(),
    )
    secondary_source_double(
      child.get_tick_space(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    secondary_source_numbers(
      [child.formatter_geometry().0, child.formatter_geometry().1],
      [
        0UL.reinterpret_as_double(),
        4644337115725824000UL.reinterpret_as_double(),
      ],
    )
    assert_eq(child.numeric_axis.autoscale_on(), false)
    assert_eq(child.numeric_axis.autoscale_stale(), false)
    assert_eq(child.ticks_set, false)
    assert_eq(
      [
        secondary_source_major_class(child.numeric_axis.locator().unwrap()),
        secondary_source_minor_class(
          child.numeric_axis.minor_locator().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.named_formatter().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.minor_named_formatter().unwrap(),
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
    secondary_source_numbers(child.tick_values_checked(), [
      4627730092099895296UL.reinterpret_as_double(),
      4628433779541671936UL.reinterpret_as_double(),
      4629137466983448576UL.reinterpret_as_double(),
      4629770785681047552UL.reinterpret_as_double(),
      4630122629401935872UL.reinterpret_as_double(),
      4630474473122824192UL.reinterpret_as_double(),
      4630826316843712512UL.reinterpret_as_double(),
      4631178160564600832UL.reinterpret_as_double(),
      4631530004285489152UL.reinterpret_as_double(),
    ])
    assert_true(
      physical_equal(
        child.numeric_axis.named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
    assert_true(
      physical_equal(
        child.numeric_axis.minor_named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
  }
  parent
  .x_axis()
  .bind_formatter_geometry(() => {
    (
      4634204016564240384UL.reinterpret_as_double(),
      4638707616191610881UL.reinterpret_as_double(),
    )
  })
  child.synchronize_formatter_frame()
  {
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    let view = child.numeric_axis.stored_view_limits()
    secondary_source_numbers([view.lower(), view.upper()], [
      4627730092099895296UL.reinterpret_as_double(),
      4631530004285489152UL.reinterpret_as_double(),
    ])
    secondary_source_numbers(
      [
        child.numeric_axis.data_interval().lower(),
        child.numeric_axis.data_interval().upper(),
      ],
      [
        9218868437227405312UL.reinterpret_as_double(),
        18442240474082181120UL.reinterpret_as_double(),
      ],
    )
    secondary_source_double(
      child.numeric_axis.get_minpos(),
      9218868437227405312UL.reinterpret_as_double(),
    )
    secondary_source_double(
      child.get_tick_space(),
      4616189618054758400UL.reinterpret_as_double(),
    )
    secondary_source_numbers(
      [child.formatter_geometry().0, child.formatter_geometry().1],
      [
        4634204016564240384UL.reinterpret_as_double(),
        4638707616191610881UL.reinterpret_as_double(),
      ],
    )
    assert_eq(child.numeric_axis.autoscale_on(), false)
    assert_eq(child.numeric_axis.autoscale_stale(), false)
    assert_eq(child.ticks_set, false)
    assert_eq(
      [
        secondary_source_major_class(child.numeric_axis.locator().unwrap()),
        secondary_source_minor_class(
          child.numeric_axis.minor_locator().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.named_formatter().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.minor_named_formatter().unwrap(),
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
    secondary_source_numbers(child.tick_values_checked(), [
      4627730092099895296UL.reinterpret_as_double(),
      4629137466983448576UL.reinterpret_as_double(),
      4630122629401935872UL.reinterpret_as_double(),
      4630826316843712512UL.reinterpret_as_double(),
      4631530004285489152UL.reinterpret_as_double(),
    ])
    assert_true(
      physical_equal(
        child.numeric_axis.named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
    assert_true(
      physical_equal(
        child.numeric_axis.minor_named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
  }
  child.prepare_draw()
  assert_eq(child.parent_scale_name, Some("linear"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
  let view = child.numeric_axis.stored_view_limits()
  secondary_source_numbers([view.lower(), view.upper()], [
    4627730092099895296UL.reinterpret_as_double(),
    4631530004285489152UL.reinterpret_as_double(),
  ])
  secondary_source_numbers(
    [
      child.numeric_axis.data_interval().lower(),
      child.numeric_axis.data_interval().upper(),
    ],
    [
      9218868437227405312UL.reinterpret_as_double(),
      18442240474082181120UL.reinterpret_as_double(),
    ],
  )
  secondary_source_double(
    child.numeric_axis.get_minpos(),
    9218868437227405312UL.reinterpret_as_double(),
  )
  secondary_source_double(
    child.get_tick_space(),
    4616189618054758400UL.reinterpret_as_double(),
  )
  secondary_source_numbers(
    [child.formatter_geometry().0, child.formatter_geometry().1],
    [
      4634204016564240384UL.reinterpret_as_double(),
      4638707616191610881UL.reinterpret_as_double(),
    ],
  )
  assert_eq(child.numeric_axis.autoscale_on(), false)
  assert_eq(child.numeric_axis.autoscale_stale(), false)
  assert_eq(child.ticks_set, false)
  assert_eq(
    [
      secondary_source_major_class(child.numeric_axis.locator().unwrap()),
      secondary_source_minor_class(child.numeric_axis.minor_locator().unwrap()),
      secondary_source_formatter_class(
        child.numeric_axis.named_formatter().unwrap(),
      ),
      secondary_source_formatter_class(
        child.numeric_axis.minor_named_formatter().unwrap(),
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
  secondary_source_numbers(child.tick_values_checked(), [
    4627730092099895296UL.reinterpret_as_double(),
    4629137466983448576UL.reinterpret_as_double(),
    4630122629401935872UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
    4631530004285489152UL.reinterpret_as_double(),
  ])
  assert_true(
    physical_equal(
      child.numeric_axis.named_formatter().unwrap().axis().unwrap(),
      child.numeric_axis.formatter_axis_binding(),
    ),
  )
  assert_true(
    physical_equal(
      child.numeric_axis.minor_named_formatter().unwrap().axis().unwrap(),
      child.numeric_axis.formatter_axis_binding(),
    ),
  )
}

///|
fn secondary_source_case_1() -> Unit raise {
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
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  @config.set_x_margin(0.05)
  @config.set_y_margin(0.05)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_text_usetex(false)
  let figure = figure(width=320, height=240)
  let parent = figure.axes()
  parent.set_x_scale(@scale.log_scale())
  parent.set_xlim(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  let child = parent.secondary_xaxis(value => 2.0 * value + 5.0, value => {
    (value - 5.0) / 2.0
  })
  {
    assert_eq(child.parent_scale_name, Some("log"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "functionlog")
    let view = child.numeric_axis.stored_view_limits()
    secondary_source_numbers([view.lower(), view.upper()], [
      4617315517961601024UL.reinterpret_as_double(),
      5365584237798168794UL.reinterpret_as_double(),
    ])
    secondary_source_numbers(
      [
        child.numeric_axis.data_interval().lower(),
        child.numeric_axis.data_interval().upper(),
      ],
      [
        9218868437227405312UL.reinterpret_as_double(),
        18442240474082181120UL.reinterpret_as_double(),
      ],
    )
    secondary_source_double(
      child.numeric_axis.get_minpos(),
      9218868437227405312UL.reinterpret_as_double(),
    )
    secondary_source_double(
      child.get_tick_space(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    secondary_source_numbers(
      [child.formatter_geometry().0, child.formatter_geometry().1],
      [
        0UL.reinterpret_as_double(),
        4644337115725824000UL.reinterpret_as_double(),
      ],
    )
    assert_eq(child.numeric_axis.autoscale_on(), true)
    assert_eq(child.numeric_axis.autoscale_stale(), false)
    assert_eq(child.ticks_set, false)
    assert_eq(
      [
        secondary_source_major_class(child.numeric_axis.locator().unwrap()),
        secondary_source_minor_class(
          child.numeric_axis.minor_locator().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.named_formatter().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.minor_named_formatter().unwrap(),
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
    secondary_source_numbers(child.tick_values_checked(), [
      4532020583610935537UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4711630319722168320UL.reinterpret_as_double(),
      4801453603149578240UL.reinterpret_as_double(),
      4891288408196988160UL.reinterpret_as_double(),
      4981134201117475473UL.reinterpret_as_double(),
      5070927765361438756UL.reinterpret_as_double(),
      5160588303184390427UL.reinterpret_as_double(),
      5250267901928720505UL.reinterpret_as_double(),
      5339965678584216207UL.reinterpret_as_double(),
      5429680791046716481UL.reinterpret_as_double(),
    ])
    assert_true(
      physical_equal(
        child.numeric_axis.named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
    assert_true(
      physical_equal(
        child.numeric_axis.minor_named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
  }
  child.apply_aspect()
  {
    assert_eq(child.parent_scale_name, Some("log"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "functionlog")
    let view = child.numeric_axis.stored_view_limits()
    secondary_source_numbers([view.lower(), view.upper()], [
      4627730092099895296UL.reinterpret_as_double(),
      4631530004285489152UL.reinterpret_as_double(),
    ])
    secondary_source_numbers(
      [
        child.numeric_axis.data_interval().lower(),
        child.numeric_axis.data_interval().upper(),
      ],
      [
        9218868437227405312UL.reinterpret_as_double(),
        18442240474082181120UL.reinterpret_as_double(),
      ],
    )
    secondary_source_double(
      child.numeric_axis.get_minpos(),
      9218868437227405312UL.reinterpret_as_double(),
    )
    secondary_source_double(
      child.get_tick_space(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    secondary_source_numbers(
      [child.formatter_geometry().0, child.formatter_geometry().1],
      [
        0UL.reinterpret_as_double(),
        4644337115725824000UL.reinterpret_as_double(),
      ],
    )
    assert_eq(child.numeric_axis.autoscale_on(), false)
    assert_eq(child.numeric_axis.autoscale_stale(), false)
    assert_eq(child.ticks_set, false)
    assert_eq(
      [
        secondary_source_major_class(child.numeric_axis.locator().unwrap()),
        secondary_source_minor_class(
          child.numeric_axis.minor_locator().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.named_formatter().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.minor_named_formatter().unwrap(),
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
    secondary_source_numbers(child.tick_values_checked(), [
      4621819117588971520UL.reinterpret_as_double(),
      4636737291354636288UL.reinterpret_as_double(),
    ])
    assert_true(
      physical_equal(
        child.numeric_axis.named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
    assert_true(
      physical_equal(
        child.numeric_axis.minor_named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
  }
  parent
  .x_axis()
  .bind_formatter_geometry(() => {
    (
      4634204016564240384UL.reinterpret_as_double(),
      4638707616191610881UL.reinterpret_as_double(),
    )
  })
  child.synchronize_formatter_frame()
  {
    assert_eq(child.parent_scale_name, Some("log"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "functionlog")
    let view = child.numeric_axis.stored_view_limits()
    secondary_source_numbers([view.lower(), view.upper()], [
      4627730092099895296UL.reinterpret_as_double(),
      4631530004285489152UL.reinterpret_as_double(),
    ])
    secondary_source_numbers(
      [
        child.numeric_axis.data_interval().lower(),
        child.numeric_axis.data_interval().upper(),
      ],
      [
        9218868437227405312UL.reinterpret_as_double(),
        18442240474082181120UL.reinterpret_as_double(),
      ],
    )
    secondary_source_double(
      child.numeric_axis.get_minpos(),
      9218868437227405312UL.reinterpret_as_double(),
    )
    secondary_source_double(
      child.get_tick_space(),
      4616189618054758400UL.reinterpret_as_double(),
    )
    secondary_source_numbers(
      [child.formatter_geometry().0, child.formatter_geometry().1],
      [
        4634204016564240384UL.reinterpret_as_double(),
        4638707616191610881UL.reinterpret_as_double(),
      ],
    )
    assert_eq(child.numeric_axis.autoscale_on(), false)
    assert_eq(child.numeric_axis.autoscale_stale(), false)
    assert_eq(child.ticks_set, false)
    assert_eq(
      [
        secondary_source_major_class(child.numeric_axis.locator().unwrap()),
        secondary_source_minor_class(
          child.numeric_axis.minor_locator().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.named_formatter().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.minor_named_formatter().unwrap(),
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
    secondary_source_numbers(child.tick_values_checked(), [
      4621819117588971520UL.reinterpret_as_double(),
      4636737291354636288UL.reinterpret_as_double(),
    ])
    assert_true(
      physical_equal(
        child.numeric_axis.named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
    assert_true(
      physical_equal(
        child.numeric_axis.minor_named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
  }
  child.prepare_draw()
  assert_eq(child.parent_scale_name, Some("log"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "functionlog")
  let view = child.numeric_axis.stored_view_limits()
  secondary_source_numbers([view.lower(), view.upper()], [
    4627730092099895296UL.reinterpret_as_double(),
    4631530004285489152UL.reinterpret_as_double(),
  ])
  secondary_source_numbers(
    [
      child.numeric_axis.data_interval().lower(),
      child.numeric_axis.data_interval().upper(),
    ],
    [
      9218868437227405312UL.reinterpret_as_double(),
      18442240474082181120UL.reinterpret_as_double(),
    ],
  )
  secondary_source_double(
    child.numeric_axis.get_minpos(),
    9218868437227405312UL.reinterpret_as_double(),
  )
  secondary_source_double(
    child.get_tick_space(),
    4616189618054758400UL.reinterpret_as_double(),
  )
  secondary_source_numbers(
    [child.formatter_geometry().0, child.formatter_geometry().1],
    [
      4634204016564240384UL.reinterpret_as_double(),
      4638707616191610881UL.reinterpret_as_double(),
    ],
  )
  assert_eq(child.numeric_axis.autoscale_on(), false)
  assert_eq(child.numeric_axis.autoscale_stale(), false)
  assert_eq(child.ticks_set, false)
  assert_eq(
    [
      secondary_source_major_class(child.numeric_axis.locator().unwrap()),
      secondary_source_minor_class(child.numeric_axis.minor_locator().unwrap()),
      secondary_source_formatter_class(
        child.numeric_axis.named_formatter().unwrap(),
      ),
      secondary_source_formatter_class(
        child.numeric_axis.minor_named_formatter().unwrap(),
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
  secondary_source_numbers(child.tick_values_checked(), [
    4621819117588971520UL.reinterpret_as_double(),
    4636737291354636288UL.reinterpret_as_double(),
  ])
  assert_true(
    physical_equal(
      child.numeric_axis.named_formatter().unwrap().axis().unwrap(),
      child.numeric_axis.formatter_axis_binding(),
    ),
  )
  assert_true(
    physical_equal(
      child.numeric_axis.minor_named_formatter().unwrap().axis().unwrap(),
      child.numeric_axis.formatter_axis_binding(),
    ),
  )
}

///|
fn secondary_source_case_2() -> Unit raise {
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
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  @config.set_x_margin(0.05)
  @config.set_y_margin(0.05)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_text_usetex(false)
  let figure = figure(width=320, height=240)
  let parent = figure.axes()
  parent.set_x_scale(@scale.symlog_scale(linthresh=2.0))
  parent.set_xlim(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  let child = parent.secondary_xaxis(value => 2.0 * value + 5.0, value => {
    (value - 5.0) / 2.0
  })
  {
    assert_eq(child.parent_scale_name, Some("symlog"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    let view = child.numeric_axis.stored_view_limits()
    secondary_source_numbers([view.lower(), view.upper()], [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
    secondary_source_numbers(
      [
        child.numeric_axis.data_interval().lower(),
        child.numeric_axis.data_interval().upper(),
      ],
      [
        9218868437227405312UL.reinterpret_as_double(),
        18442240474082181120UL.reinterpret_as_double(),
      ],
    )
    secondary_source_double(
      child.numeric_axis.get_minpos(),
      9218868437227405312UL.reinterpret_as_double(),
    )
    secondary_source_double(
      child.get_tick_space(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    secondary_source_numbers(
      [child.formatter_geometry().0, child.formatter_geometry().1],
      [
        0UL.reinterpret_as_double(),
        4644337115725824000UL.reinterpret_as_double(),
      ],
    )
    assert_eq(child.numeric_axis.autoscale_on(), true)
    assert_eq(child.numeric_axis.autoscale_stale(), false)
    assert_eq(child.ticks_set, false)
    assert_eq(
      [
        secondary_source_major_class(child.numeric_axis.locator().unwrap()),
        secondary_source_minor_class(
          child.numeric_axis.minor_locator().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.named_formatter().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.minor_named_formatter().unwrap(),
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
    secondary_source_numbers(child.tick_values_checked(), [
      0UL.reinterpret_as_double(),
      4596373779694328218UL.reinterpret_as_double(),
      4600877379321698714UL.reinterpret_as_double(),
      4603579539098121012UL.reinterpret_as_double(),
      4605380978949069210UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
    assert_true(
      physical_equal(
        child.numeric_axis.named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
    assert_true(
      physical_equal(
        child.numeric_axis.minor_named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
  }
  child.apply_aspect()
  {
    assert_eq(child.parent_scale_name, Some("symlog"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    let view = child.numeric_axis.stored_view_limits()
    secondary_source_numbers([view.lower(), view.upper()], [
      4627730092099895296UL.reinterpret_as_double(),
      4631530004285489152UL.reinterpret_as_double(),
    ])
    secondary_source_numbers(
      [
        child.numeric_axis.data_interval().lower(),
        child.numeric_axis.data_interval().upper(),
      ],
      [
        9218868437227405312UL.reinterpret_as_double(),
        18442240474082181120UL.reinterpret_as_double(),
      ],
    )
    secondary_source_double(
      child.numeric_axis.get_minpos(),
      9218868437227405312UL.reinterpret_as_double(),
    )
    secondary_source_double(
      child.get_tick_space(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    secondary_source_numbers(
      [child.formatter_geometry().0, child.formatter_geometry().1],
      [
        0UL.reinterpret_as_double(),
        4644337115725824000UL.reinterpret_as_double(),
      ],
    )
    assert_eq(child.numeric_axis.autoscale_on(), false)
    assert_eq(child.numeric_axis.autoscale_stale(), false)
    assert_eq(child.ticks_set, false)
    assert_eq(
      [
        secondary_source_major_class(child.numeric_axis.locator().unwrap()),
        secondary_source_minor_class(
          child.numeric_axis.minor_locator().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.named_formatter().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.minor_named_formatter().unwrap(),
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
    secondary_source_numbers(child.tick_values_checked(), [
      4627730092099895296UL.reinterpret_as_double(),
      4628433779541671936UL.reinterpret_as_double(),
      4629137466983448576UL.reinterpret_as_double(),
      4629770785681047552UL.reinterpret_as_double(),
      4630122629401935872UL.reinterpret_as_double(),
      4630474473122824192UL.reinterpret_as_double(),
      4630826316843712512UL.reinterpret_as_double(),
      4631178160564600832UL.reinterpret_as_double(),
      4631530004285489152UL.reinterpret_as_double(),
    ])
    assert_true(
      physical_equal(
        child.numeric_axis.named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
    assert_true(
      physical_equal(
        child.numeric_axis.minor_named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
  }
  parent
  .x_axis()
  .bind_formatter_geometry(() => {
    (
      4634204016564240384UL.reinterpret_as_double(),
      4638707616191610881UL.reinterpret_as_double(),
    )
  })
  child.synchronize_formatter_frame()
  {
    assert_eq(child.parent_scale_name, Some("symlog"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    let view = child.numeric_axis.stored_view_limits()
    secondary_source_numbers([view.lower(), view.upper()], [
      4627730092099895296UL.reinterpret_as_double(),
      4631530004285489152UL.reinterpret_as_double(),
    ])
    secondary_source_numbers(
      [
        child.numeric_axis.data_interval().lower(),
        child.numeric_axis.data_interval().upper(),
      ],
      [
        9218868437227405312UL.reinterpret_as_double(),
        18442240474082181120UL.reinterpret_as_double(),
      ],
    )
    secondary_source_double(
      child.numeric_axis.get_minpos(),
      9218868437227405312UL.reinterpret_as_double(),
    )
    secondary_source_double(
      child.get_tick_space(),
      4616189618054758400UL.reinterpret_as_double(),
    )
    secondary_source_numbers(
      [child.formatter_geometry().0, child.formatter_geometry().1],
      [
        4634204016564240384UL.reinterpret_as_double(),
        4638707616191610881UL.reinterpret_as_double(),
      ],
    )
    assert_eq(child.numeric_axis.autoscale_on(), false)
    assert_eq(child.numeric_axis.autoscale_stale(), false)
    assert_eq(child.ticks_set, false)
    assert_eq(
      [
        secondary_source_major_class(child.numeric_axis.locator().unwrap()),
        secondary_source_minor_class(
          child.numeric_axis.minor_locator().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.named_formatter().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.minor_named_formatter().unwrap(),
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
    secondary_source_numbers(child.tick_values_checked(), [
      4627730092099895296UL.reinterpret_as_double(),
      4629137466983448576UL.reinterpret_as_double(),
      4630122629401935872UL.reinterpret_as_double(),
      4630826316843712512UL.reinterpret_as_double(),
      4631530004285489152UL.reinterpret_as_double(),
    ])
    assert_true(
      physical_equal(
        child.numeric_axis.named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
    assert_true(
      physical_equal(
        child.numeric_axis.minor_named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
  }
  child.prepare_draw()
  assert_eq(child.parent_scale_name, Some("symlog"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
  let view = child.numeric_axis.stored_view_limits()
  secondary_source_numbers([view.lower(), view.upper()], [
    4627730092099895296UL.reinterpret_as_double(),
    4631530004285489152UL.reinterpret_as_double(),
  ])
  secondary_source_numbers(
    [
      child.numeric_axis.data_interval().lower(),
      child.numeric_axis.data_interval().upper(),
    ],
    [
      9218868437227405312UL.reinterpret_as_double(),
      18442240474082181120UL.reinterpret_as_double(),
    ],
  )
  secondary_source_double(
    child.numeric_axis.get_minpos(),
    9218868437227405312UL.reinterpret_as_double(),
  )
  secondary_source_double(
    child.get_tick_space(),
    4616189618054758400UL.reinterpret_as_double(),
  )
  secondary_source_numbers(
    [child.formatter_geometry().0, child.formatter_geometry().1],
    [
      4634204016564240384UL.reinterpret_as_double(),
      4638707616191610881UL.reinterpret_as_double(),
    ],
  )
  assert_eq(child.numeric_axis.autoscale_on(), false)
  assert_eq(child.numeric_axis.autoscale_stale(), false)
  assert_eq(child.ticks_set, false)
  assert_eq(
    [
      secondary_source_major_class(child.numeric_axis.locator().unwrap()),
      secondary_source_minor_class(child.numeric_axis.minor_locator().unwrap()),
      secondary_source_formatter_class(
        child.numeric_axis.named_formatter().unwrap(),
      ),
      secondary_source_formatter_class(
        child.numeric_axis.minor_named_formatter().unwrap(),
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
  secondary_source_numbers(child.tick_values_checked(), [
    4627730092099895296UL.reinterpret_as_double(),
    4629137466983448576UL.reinterpret_as_double(),
    4630122629401935872UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
    4631530004285489152UL.reinterpret_as_double(),
  ])
  assert_true(
    physical_equal(
      child.numeric_axis.named_formatter().unwrap().axis().unwrap(),
      child.numeric_axis.formatter_axis_binding(),
    ),
  )
  assert_true(
    physical_equal(
      child.numeric_axis.minor_named_formatter().unwrap().axis().unwrap(),
      child.numeric_axis.formatter_axis_binding(),
    ),
  )
}

///|
fn secondary_source_case_3() -> Unit raise {
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
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  @config.set_x_margin(0.05)
  @config.set_y_margin(0.05)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_text_usetex(false)
  let figure = figure(width=320, height=240)
  let parent = figure.axes()
  parent.set_x_scale(@scale.asinh_scale())
  parent.set_xlim(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  let child = parent.secondary_xaxis(value => 2.0 * value + 5.0, value => {
    (value - 5.0) / 2.0
  })
  {
    assert_eq(child.parent_scale_name, Some("asinh"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    let view = child.numeric_axis.stored_view_limits()
    secondary_source_numbers([view.lower(), view.upper()], [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
    secondary_source_numbers(
      [
        child.numeric_axis.data_interval().lower(),
        child.numeric_axis.data_interval().upper(),
      ],
      [
        9218868437227405312UL.reinterpret_as_double(),
        18442240474082181120UL.reinterpret_as_double(),
      ],
    )
    secondary_source_double(
      child.numeric_axis.get_minpos(),
      9218868437227405312UL.reinterpret_as_double(),
    )
    secondary_source_double(
      child.get_tick_space(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    secondary_source_numbers(
      [child.formatter_geometry().0, child.formatter_geometry().1],
      [
        0UL.reinterpret_as_double(),
        4644337115725824000UL.reinterpret_as_double(),
      ],
    )
    assert_eq(child.numeric_axis.autoscale_on(), true)
    assert_eq(child.numeric_axis.autoscale_stale(), false)
    assert_eq(child.ticks_set, false)
    assert_eq(
      [
        secondary_source_major_class(child.numeric_axis.locator().unwrap()),
        secondary_source_minor_class(
          child.numeric_axis.minor_locator().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.named_formatter().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.minor_named_formatter().unwrap(),
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
    secondary_source_numbers(child.tick_values_checked(), [
      0UL.reinterpret_as_double(),
      4596373779694328218UL.reinterpret_as_double(),
      4600877379321698714UL.reinterpret_as_double(),
      4603579539098121012UL.reinterpret_as_double(),
      4605380978949069210UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
    assert_true(
      physical_equal(
        child.numeric_axis.named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
    assert_true(
      physical_equal(
        child.numeric_axis.minor_named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
  }
  child.apply_aspect()
  {
    assert_eq(child.parent_scale_name, Some("asinh"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    let view = child.numeric_axis.stored_view_limits()
    secondary_source_numbers([view.lower(), view.upper()], [
      4627730092099895296UL.reinterpret_as_double(),
      4631530004285489152UL.reinterpret_as_double(),
    ])
    secondary_source_numbers(
      [
        child.numeric_axis.data_interval().lower(),
        child.numeric_axis.data_interval().upper(),
      ],
      [
        9218868437227405312UL.reinterpret_as_double(),
        18442240474082181120UL.reinterpret_as_double(),
      ],
    )
    secondary_source_double(
      child.numeric_axis.get_minpos(),
      9218868437227405312UL.reinterpret_as_double(),
    )
    secondary_source_double(
      child.get_tick_space(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    secondary_source_numbers(
      [child.formatter_geometry().0, child.formatter_geometry().1],
      [
        0UL.reinterpret_as_double(),
        4644337115725824000UL.reinterpret_as_double(),
      ],
    )
    assert_eq(child.numeric_axis.autoscale_on(), false)
    assert_eq(child.numeric_axis.autoscale_stale(), false)
    assert_eq(child.ticks_set, false)
    assert_eq(
      [
        secondary_source_major_class(child.numeric_axis.locator().unwrap()),
        secondary_source_minor_class(
          child.numeric_axis.minor_locator().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.named_formatter().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.minor_named_formatter().unwrap(),
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
    secondary_source_numbers(child.tick_values_checked(), [
      4627730092099895296UL.reinterpret_as_double(),
      4628433779541671936UL.reinterpret_as_double(),
      4629137466983448576UL.reinterpret_as_double(),
      4629770785681047552UL.reinterpret_as_double(),
      4630122629401935872UL.reinterpret_as_double(),
      4630474473122824192UL.reinterpret_as_double(),
      4630826316843712512UL.reinterpret_as_double(),
      4631178160564600832UL.reinterpret_as_double(),
      4631530004285489152UL.reinterpret_as_double(),
    ])
    assert_true(
      physical_equal(
        child.numeric_axis.named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
    assert_true(
      physical_equal(
        child.numeric_axis.minor_named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
  }
  parent
  .x_axis()
  .bind_formatter_geometry(() => {
    (
      4634204016564240384UL.reinterpret_as_double(),
      4638707616191610881UL.reinterpret_as_double(),
    )
  })
  child.synchronize_formatter_frame()
  {
    assert_eq(child.parent_scale_name, Some("asinh"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    let view = child.numeric_axis.stored_view_limits()
    secondary_source_numbers([view.lower(), view.upper()], [
      4627730092099895296UL.reinterpret_as_double(),
      4631530004285489152UL.reinterpret_as_double(),
    ])
    secondary_source_numbers(
      [
        child.numeric_axis.data_interval().lower(),
        child.numeric_axis.data_interval().upper(),
      ],
      [
        9218868437227405312UL.reinterpret_as_double(),
        18442240474082181120UL.reinterpret_as_double(),
      ],
    )
    secondary_source_double(
      child.numeric_axis.get_minpos(),
      9218868437227405312UL.reinterpret_as_double(),
    )
    secondary_source_double(
      child.get_tick_space(),
      4616189618054758400UL.reinterpret_as_double(),
    )
    secondary_source_numbers(
      [child.formatter_geometry().0, child.formatter_geometry().1],
      [
        4634204016564240384UL.reinterpret_as_double(),
        4638707616191610881UL.reinterpret_as_double(),
      ],
    )
    assert_eq(child.numeric_axis.autoscale_on(), false)
    assert_eq(child.numeric_axis.autoscale_stale(), false)
    assert_eq(child.ticks_set, false)
    assert_eq(
      [
        secondary_source_major_class(child.numeric_axis.locator().unwrap()),
        secondary_source_minor_class(
          child.numeric_axis.minor_locator().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.named_formatter().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.minor_named_formatter().unwrap(),
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
    secondary_source_numbers(child.tick_values_checked(), [
      4627730092099895296UL.reinterpret_as_double(),
      4629137466983448576UL.reinterpret_as_double(),
      4630122629401935872UL.reinterpret_as_double(),
      4630826316843712512UL.reinterpret_as_double(),
      4631530004285489152UL.reinterpret_as_double(),
    ])
    assert_true(
      physical_equal(
        child.numeric_axis.named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
    assert_true(
      physical_equal(
        child.numeric_axis.minor_named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
  }
  child.prepare_draw()
  assert_eq(child.parent_scale_name, Some("asinh"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
  let view = child.numeric_axis.stored_view_limits()
  secondary_source_numbers([view.lower(), view.upper()], [
    4627730092099895296UL.reinterpret_as_double(),
    4631530004285489152UL.reinterpret_as_double(),
  ])
  secondary_source_numbers(
    [
      child.numeric_axis.data_interval().lower(),
      child.numeric_axis.data_interval().upper(),
    ],
    [
      9218868437227405312UL.reinterpret_as_double(),
      18442240474082181120UL.reinterpret_as_double(),
    ],
  )
  secondary_source_double(
    child.numeric_axis.get_minpos(),
    9218868437227405312UL.reinterpret_as_double(),
  )
  secondary_source_double(
    child.get_tick_space(),
    4616189618054758400UL.reinterpret_as_double(),
  )
  secondary_source_numbers(
    [child.formatter_geometry().0, child.formatter_geometry().1],
    [
      4634204016564240384UL.reinterpret_as_double(),
      4638707616191610881UL.reinterpret_as_double(),
    ],
  )
  assert_eq(child.numeric_axis.autoscale_on(), false)
  assert_eq(child.numeric_axis.autoscale_stale(), false)
  assert_eq(child.ticks_set, false)
  assert_eq(
    [
      secondary_source_major_class(child.numeric_axis.locator().unwrap()),
      secondary_source_minor_class(child.numeric_axis.minor_locator().unwrap()),
      secondary_source_formatter_class(
        child.numeric_axis.named_formatter().unwrap(),
      ),
      secondary_source_formatter_class(
        child.numeric_axis.minor_named_formatter().unwrap(),
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
  secondary_source_numbers(child.tick_values_checked(), [
    4627730092099895296UL.reinterpret_as_double(),
    4629137466983448576UL.reinterpret_as_double(),
    4630122629401935872UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
    4631530004285489152UL.reinterpret_as_double(),
  ])
  assert_true(
    physical_equal(
      child.numeric_axis.named_formatter().unwrap().axis().unwrap(),
      child.numeric_axis.formatter_axis_binding(),
    ),
  )
  assert_true(
    physical_equal(
      child.numeric_axis.minor_named_formatter().unwrap().axis().unwrap(),
      child.numeric_axis.formatter_axis_binding(),
    ),
  )
}

///|
fn secondary_source_case_4() -> Unit raise {
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
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  @config.set_x_margin(0.05)
  @config.set_y_margin(0.05)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_text_usetex(false)
  let figure = figure(width=320, height=240)
  let parent = figure.axes()
  parent.set_x_scale(@scale.logit_scale())
  parent.set_xlim(
    4591870180066957722UL.reinterpret_as_double(),
    4605380978949069210UL.reinterpret_as_double(),
  )
  let child = parent.secondary_xaxis(value => 2.0 * value + 5.0, value => {
    (value - 5.0) / 2.0
  })
  {
    assert_eq(child.parent_scale_name, Some("logit"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    let view = child.numeric_axis.stored_view_limits()
    secondary_source_numbers([view.lower(), view.upper()], [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
    secondary_source_numbers(
      [
        child.numeric_axis.data_interval().lower(),
        child.numeric_axis.data_interval().upper(),
      ],
      [
        9218868437227405312UL.reinterpret_as_double(),
        18442240474082181120UL.reinterpret_as_double(),
      ],
    )
    secondary_source_double(
      child.numeric_axis.get_minpos(),
      9218868437227405312UL.reinterpret_as_double(),
    )
    secondary_source_double(
      child.get_tick_space(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    secondary_source_numbers(
      [child.formatter_geometry().0, child.formatter_geometry().1],
      [
        0UL.reinterpret_as_double(),
        4644337115725824000UL.reinterpret_as_double(),
      ],
    )
    assert_eq(child.numeric_axis.autoscale_on(), true)
    assert_eq(child.numeric_axis.autoscale_stale(), false)
    assert_eq(child.ticks_set, false)
    assert_eq(
      [
        secondary_source_major_class(child.numeric_axis.locator().unwrap()),
        secondary_source_minor_class(
          child.numeric_axis.minor_locator().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.named_formatter().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.minor_named_formatter().unwrap(),
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
    secondary_source_numbers(child.tick_values_checked(), [
      0UL.reinterpret_as_double(),
      4596373779694328218UL.reinterpret_as_double(),
      4600877379321698714UL.reinterpret_as_double(),
      4603579539098121012UL.reinterpret_as_double(),
      4605380978949069210UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
    assert_true(
      physical_equal(
        child.numeric_axis.named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
    assert_true(
      physical_equal(
        child.numeric_axis.minor_named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
  }
  child.apply_aspect()
  {
    assert_eq(child.parent_scale_name, Some("logit"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    let view = child.numeric_axis.stored_view_limits()
    secondary_source_numbers([view.lower(), view.upper()], [
      4617540697942969549UL.reinterpret_as_double(),
      4619116957812549222UL.reinterpret_as_double(),
    ])
    secondary_source_numbers(
      [
        child.numeric_axis.data_interval().lower(),
        child.numeric_axis.data_interval().upper(),
      ],
      [
        9218868437227405312UL.reinterpret_as_double(),
        18442240474082181120UL.reinterpret_as_double(),
      ],
    )
    secondary_source_double(
      child.numeric_axis.get_minpos(),
      9218868437227405312UL.reinterpret_as_double(),
    )
    secondary_source_double(
      child.get_tick_space(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    secondary_source_numbers(
      [child.formatter_geometry().0, child.formatter_geometry().1],
      [
        0UL.reinterpret_as_double(),
        4644337115725824000UL.reinterpret_as_double(),
      ],
    )
    assert_eq(child.numeric_axis.autoscale_on(), false)
    assert_eq(child.numeric_axis.autoscale_stale(), false)
    assert_eq(child.ticks_set, false)
    assert_eq(
      [
        secondary_source_major_class(child.numeric_axis.locator().unwrap()),
        secondary_source_minor_class(
          child.numeric_axis.minor_locator().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.named_formatter().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.minor_named_formatter().unwrap(),
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
    secondary_source_numbers(child.tick_values_checked(), [
      4617540697942969549UL.reinterpret_as_double(),
      4617765877924338074UL.reinterpret_as_double(),
      4617991057905706598UL.reinterpret_as_double(),
      4618216237887075123UL.reinterpret_as_double(),
      4618441417868443648UL.reinterpret_as_double(),
      4618666597849812173UL.reinterpret_as_double(),
      4618891777831180698UL.reinterpret_as_double(),
      4619116957812549222UL.reinterpret_as_double(),
    ])
    assert_true(
      physical_equal(
        child.numeric_axis.named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
    assert_true(
      physical_equal(
        child.numeric_axis.minor_named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
  }
  parent
  .x_axis()
  .bind_formatter_geometry(() => {
    (
      4634204016564240384UL.reinterpret_as_double(),
      4638707616191610881UL.reinterpret_as_double(),
    )
  })
  child.synchronize_formatter_frame()
  {
    assert_eq(child.parent_scale_name, Some("logit"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    let view = child.numeric_axis.stored_view_limits()
    secondary_source_numbers([view.lower(), view.upper()], [
      4617540697942969549UL.reinterpret_as_double(),
      4619116957812549222UL.reinterpret_as_double(),
    ])
    secondary_source_numbers(
      [
        child.numeric_axis.data_interval().lower(),
        child.numeric_axis.data_interval().upper(),
      ],
      [
        9218868437227405312UL.reinterpret_as_double(),
        18442240474082181120UL.reinterpret_as_double(),
      ],
    )
    secondary_source_double(
      child.numeric_axis.get_minpos(),
      9218868437227405312UL.reinterpret_as_double(),
    )
    secondary_source_double(
      child.get_tick_space(),
      4616189618054758400UL.reinterpret_as_double(),
    )
    secondary_source_numbers(
      [child.formatter_geometry().0, child.formatter_geometry().1],
      [
        4634204016564240384UL.reinterpret_as_double(),
        4638707616191610881UL.reinterpret_as_double(),
      ],
    )
    assert_eq(child.numeric_axis.autoscale_on(), false)
    assert_eq(child.numeric_axis.autoscale_stale(), false)
    assert_eq(child.ticks_set, false)
    assert_eq(
      [
        secondary_source_major_class(child.numeric_axis.locator().unwrap()),
        secondary_source_minor_class(
          child.numeric_axis.minor_locator().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.named_formatter().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.minor_named_formatter().unwrap(),
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
    secondary_source_numbers(child.tick_values_checked(), [
      4617315517961601024UL.reinterpret_as_double(),
      4617878467915022336UL.reinterpret_as_double(),
      4618441417868443648UL.reinterpret_as_double(),
      4619004367821864960UL.reinterpret_as_double(),
      4619567317775286272UL.reinterpret_as_double(),
    ])
    assert_true(
      physical_equal(
        child.numeric_axis.named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
    assert_true(
      physical_equal(
        child.numeric_axis.minor_named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
  }
  child.prepare_draw()
  assert_eq(child.parent_scale_name, Some("logit"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
  let view = child.numeric_axis.stored_view_limits()
  secondary_source_numbers([view.lower(), view.upper()], [
    4617540697942969549UL.reinterpret_as_double(),
    4619116957812549222UL.reinterpret_as_double(),
  ])
  secondary_source_numbers(
    [
      child.numeric_axis.data_interval().lower(),
      child.numeric_axis.data_interval().upper(),
    ],
    [
      9218868437227405312UL.reinterpret_as_double(),
      18442240474082181120UL.reinterpret_as_double(),
    ],
  )
  secondary_source_double(
    child.numeric_axis.get_minpos(),
    9218868437227405312UL.reinterpret_as_double(),
  )
  secondary_source_double(
    child.get_tick_space(),
    4616189618054758400UL.reinterpret_as_double(),
  )
  secondary_source_numbers(
    [child.formatter_geometry().0, child.formatter_geometry().1],
    [
      4634204016564240384UL.reinterpret_as_double(),
      4638707616191610881UL.reinterpret_as_double(),
    ],
  )
  assert_eq(child.numeric_axis.autoscale_on(), false)
  assert_eq(child.numeric_axis.autoscale_stale(), false)
  assert_eq(child.ticks_set, false)
  assert_eq(
    [
      secondary_source_major_class(child.numeric_axis.locator().unwrap()),
      secondary_source_minor_class(child.numeric_axis.minor_locator().unwrap()),
      secondary_source_formatter_class(
        child.numeric_axis.named_formatter().unwrap(),
      ),
      secondary_source_formatter_class(
        child.numeric_axis.minor_named_formatter().unwrap(),
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
  secondary_source_numbers(child.tick_values_checked(), [
    4617315517961601024UL.reinterpret_as_double(),
    4617878467915022336UL.reinterpret_as_double(),
    4618441417868443648UL.reinterpret_as_double(),
    4619004367821864960UL.reinterpret_as_double(),
    4619567317775286272UL.reinterpret_as_double(),
  ])
  assert_true(
    physical_equal(
      child.numeric_axis.named_formatter().unwrap().axis().unwrap(),
      child.numeric_axis.formatter_axis_binding(),
    ),
  )
  assert_true(
    physical_equal(
      child.numeric_axis.minor_named_formatter().unwrap().axis().unwrap(),
      child.numeric_axis.formatter_axis_binding(),
    ),
  )
}

///|
fn secondary_source_case_5() -> Unit raise {
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
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  @config.set_x_margin(0.05)
  @config.set_y_margin(0.05)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_text_usetex(false)
  let figure = figure(width=320, height=240)
  let parent = figure.axes()
  parent.set_y_scale(@scale.linear_scale())
  parent.set_ylim(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  let child = parent.secondary_yaxis(value => 2.0 * value + 5.0, value => {
    (value - 5.0) / 2.0
  })
  {
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    let view = child.numeric_axis.stored_view_limits()
    secondary_source_numbers([view.lower(), view.upper()], [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
    secondary_source_numbers(
      [
        child.numeric_axis.data_interval().lower(),
        child.numeric_axis.data_interval().upper(),
      ],
      [
        9218868437227405312UL.reinterpret_as_double(),
        18442240474082181120UL.reinterpret_as_double(),
      ],
    )
    secondary_source_double(
      child.numeric_axis.get_minpos(),
      9218868437227405312UL.reinterpret_as_double(),
    )
    secondary_source_double(
      child.get_tick_space(),
      4622382067542392832UL.reinterpret_as_double(),
    )
    secondary_source_numbers(
      [child.formatter_geometry().0, child.formatter_geometry().1],
      [
        4642648265865560064UL.reinterpret_as_double(),
        4642648265865560064UL.reinterpret_as_double(),
      ],
    )
    assert_eq(child.numeric_axis.autoscale_on(), true)
    assert_eq(child.numeric_axis.autoscale_stale(), false)
    assert_eq(child.ticks_set, false)
    assert_eq(
      [
        secondary_source_major_class(child.numeric_axis.locator().unwrap()),
        secondary_source_minor_class(
          child.numeric_axis.minor_locator().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.named_formatter().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.minor_named_formatter().unwrap(),
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
    secondary_source_numbers(child.tick_values_checked(), [
      0UL.reinterpret_as_double(),
      4596373779694328218UL.reinterpret_as_double(),
      4600877379321698714UL.reinterpret_as_double(),
      4603579539098121012UL.reinterpret_as_double(),
      4605380978949069210UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
    assert_true(
      physical_equal(
        child.numeric_axis.named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
    assert_true(
      physical_equal(
        child.numeric_axis.minor_named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
  }
  child.apply_aspect()
  {
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    let view = child.numeric_axis.stored_view_limits()
    secondary_source_numbers([view.lower(), view.upper()], [
      4627730092099895296UL.reinterpret_as_double(),
      4631530004285489152UL.reinterpret_as_double(),
    ])
    secondary_source_numbers(
      [
        child.numeric_axis.data_interval().lower(),
        child.numeric_axis.data_interval().upper(),
      ],
      [
        9218868437227405312UL.reinterpret_as_double(),
        18442240474082181120UL.reinterpret_as_double(),
      ],
    )
    secondary_source_double(
      child.numeric_axis.get_minpos(),
      9218868437227405312UL.reinterpret_as_double(),
    )
    secondary_source_double(
      child.get_tick_space(),
      4622382067542392832UL.reinterpret_as_double(),
    )
    secondary_source_numbers(
      [child.formatter_geometry().0, child.formatter_geometry().1],
      [
        4642648265865560064UL.reinterpret_as_double(),
        4642648265865560064UL.reinterpret_as_double(),
      ],
    )
    assert_eq(child.numeric_axis.autoscale_on(), false)
    assert_eq(child.numeric_axis.autoscale_stale(), false)
    assert_eq(child.ticks_set, false)
    assert_eq(
      [
        secondary_source_major_class(child.numeric_axis.locator().unwrap()),
        secondary_source_minor_class(
          child.numeric_axis.minor_locator().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.named_formatter().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.minor_named_formatter().unwrap(),
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
    secondary_source_numbers(child.tick_values_checked(), [
      4627730092099895296UL.reinterpret_as_double(),
      4628433779541671936UL.reinterpret_as_double(),
      4629137466983448576UL.reinterpret_as_double(),
      4629770785681047552UL.reinterpret_as_double(),
      4630122629401935872UL.reinterpret_as_double(),
      4630474473122824192UL.reinterpret_as_double(),
      4630826316843712512UL.reinterpret_as_double(),
      4631178160564600832UL.reinterpret_as_double(),
      4631530004285489152UL.reinterpret_as_double(),
    ])
    assert_true(
      physical_equal(
        child.numeric_axis.named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
    assert_true(
      physical_equal(
        child.numeric_axis.minor_named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
  }
  parent
  .y_axis()
  .bind_formatter_geometry(() => {
    (
      4631952216750555136UL.reinterpret_as_double(),
      4639270566145032192UL.reinterpret_as_double(),
    )
  })
  child.synchronize_formatter_frame()
  {
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    let view = child.numeric_axis.stored_view_limits()
    secondary_source_numbers([view.lower(), view.upper()], [
      4627730092099895296UL.reinterpret_as_double(),
      4631530004285489152UL.reinterpret_as_double(),
    ])
    secondary_source_numbers(
      [
        child.numeric_axis.data_interval().lower(),
        child.numeric_axis.data_interval().upper(),
      ],
      [
        9218868437227405312UL.reinterpret_as_double(),
        18442240474082181120UL.reinterpret_as_double(),
      ],
    )
    secondary_source_double(
      child.numeric_axis.get_minpos(),
      9218868437227405312UL.reinterpret_as_double(),
    )
    secondary_source_double(
      child.get_tick_space(),
      4619567317775286272UL.reinterpret_as_double(),
    )
    secondary_source_numbers(
      [child.formatter_geometry().0, child.formatter_geometry().1],
      [
        4631952216750555136UL.reinterpret_as_double(),
        4639270566145032192UL.reinterpret_as_double(),
      ],
    )
    assert_eq(child.numeric_axis.autoscale_on(), false)
    assert_eq(child.numeric_axis.autoscale_stale(), false)
    assert_eq(child.ticks_set, false)
    assert_eq(
      [
        secondary_source_major_class(child.numeric_axis.locator().unwrap()),
        secondary_source_minor_class(
          child.numeric_axis.minor_locator().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.named_formatter().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.minor_named_formatter().unwrap(),
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
    secondary_source_numbers(child.tick_values_checked(), [
      4627730092099895296UL.reinterpret_as_double(),
      4629137466983448576UL.reinterpret_as_double(),
      4630122629401935872UL.reinterpret_as_double(),
      4630826316843712512UL.reinterpret_as_double(),
      4631530004285489152UL.reinterpret_as_double(),
    ])
    assert_true(
      physical_equal(
        child.numeric_axis.named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
    assert_true(
      physical_equal(
        child.numeric_axis.minor_named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
  }
  child.prepare_draw()
  assert_eq(child.parent_scale_name, Some("linear"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
  let view = child.numeric_axis.stored_view_limits()
  secondary_source_numbers([view.lower(), view.upper()], [
    4627730092099895296UL.reinterpret_as_double(),
    4631530004285489152UL.reinterpret_as_double(),
  ])
  secondary_source_numbers(
    [
      child.numeric_axis.data_interval().lower(),
      child.numeric_axis.data_interval().upper(),
    ],
    [
      9218868437227405312UL.reinterpret_as_double(),
      18442240474082181120UL.reinterpret_as_double(),
    ],
  )
  secondary_source_double(
    child.numeric_axis.get_minpos(),
    9218868437227405312UL.reinterpret_as_double(),
  )
  secondary_source_double(
    child.get_tick_space(),
    4619567317775286272UL.reinterpret_as_double(),
  )
  secondary_source_numbers(
    [child.formatter_geometry().0, child.formatter_geometry().1],
    [
      4631952216750555136UL.reinterpret_as_double(),
      4639270566145032192UL.reinterpret_as_double(),
    ],
  )
  assert_eq(child.numeric_axis.autoscale_on(), false)
  assert_eq(child.numeric_axis.autoscale_stale(), false)
  assert_eq(child.ticks_set, false)
  assert_eq(
    [
      secondary_source_major_class(child.numeric_axis.locator().unwrap()),
      secondary_source_minor_class(child.numeric_axis.minor_locator().unwrap()),
      secondary_source_formatter_class(
        child.numeric_axis.named_formatter().unwrap(),
      ),
      secondary_source_formatter_class(
        child.numeric_axis.minor_named_formatter().unwrap(),
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
  secondary_source_numbers(child.tick_values_checked(), [
    4627730092099895296UL.reinterpret_as_double(),
    4629137466983448576UL.reinterpret_as_double(),
    4630122629401935872UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
    4631530004285489152UL.reinterpret_as_double(),
  ])
  assert_true(
    physical_equal(
      child.numeric_axis.named_formatter().unwrap().axis().unwrap(),
      child.numeric_axis.formatter_axis_binding(),
    ),
  )
  assert_true(
    physical_equal(
      child.numeric_axis.minor_named_formatter().unwrap().axis().unwrap(),
      child.numeric_axis.formatter_axis_binding(),
    ),
  )
}

///|
fn secondary_source_case_6() -> Unit raise {
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
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  @config.set_x_margin(0.05)
  @config.set_y_margin(0.05)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_text_usetex(false)
  let figure = figure(width=320, height=240)
  let parent = figure.axes()
  parent.set_y_scale(@scale.log_scale())
  parent.set_ylim(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  let child = parent.secondary_yaxis(value => 2.0 * value + 5.0, value => {
    (value - 5.0) / 2.0
  })
  {
    assert_eq(child.parent_scale_name, Some("log"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "functionlog")
    let view = child.numeric_axis.stored_view_limits()
    secondary_source_numbers([view.lower(), view.upper()], [
      4617315517961601024UL.reinterpret_as_double(),
      5365584237798168794UL.reinterpret_as_double(),
    ])
    secondary_source_numbers(
      [
        child.numeric_axis.data_interval().lower(),
        child.numeric_axis.data_interval().upper(),
      ],
      [
        9218868437227405312UL.reinterpret_as_double(),
        18442240474082181120UL.reinterpret_as_double(),
      ],
    )
    secondary_source_double(
      child.numeric_axis.get_minpos(),
      9218868437227405312UL.reinterpret_as_double(),
    )
    secondary_source_double(
      child.get_tick_space(),
      4622382067542392832UL.reinterpret_as_double(),
    )
    secondary_source_numbers(
      [child.formatter_geometry().0, child.formatter_geometry().1],
      [
        4642648265865560064UL.reinterpret_as_double(),
        4642648265865560064UL.reinterpret_as_double(),
      ],
    )
    assert_eq(child.numeric_axis.autoscale_on(), true)
    assert_eq(child.numeric_axis.autoscale_stale(), false)
    assert_eq(child.ticks_set, false)
    assert_eq(
      [
        secondary_source_major_class(child.numeric_axis.locator().unwrap()),
        secondary_source_minor_class(
          child.numeric_axis.minor_locator().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.named_formatter().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.minor_named_formatter().unwrap(),
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
    secondary_source_numbers(child.tick_values_checked(), [
      4532020583610935537UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4711630319722168320UL.reinterpret_as_double(),
      4801453603149578240UL.reinterpret_as_double(),
      4891288408196988160UL.reinterpret_as_double(),
      4981134201117475473UL.reinterpret_as_double(),
      5070927765361438756UL.reinterpret_as_double(),
      5160588303184390427UL.reinterpret_as_double(),
      5250267901928720505UL.reinterpret_as_double(),
      5339965678584216207UL.reinterpret_as_double(),
      5429680791046716481UL.reinterpret_as_double(),
    ])
    assert_true(
      physical_equal(
        child.numeric_axis.named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
    assert_true(
      physical_equal(
        child.numeric_axis.minor_named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
  }
  child.apply_aspect()
  {
    assert_eq(child.parent_scale_name, Some("log"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "functionlog")
    let view = child.numeric_axis.stored_view_limits()
    secondary_source_numbers([view.lower(), view.upper()], [
      4627730092099895296UL.reinterpret_as_double(),
      4631530004285489152UL.reinterpret_as_double(),
    ])
    secondary_source_numbers(
      [
        child.numeric_axis.data_interval().lower(),
        child.numeric_axis.data_interval().upper(),
      ],
      [
        9218868437227405312UL.reinterpret_as_double(),
        18442240474082181120UL.reinterpret_as_double(),
      ],
    )
    secondary_source_double(
      child.numeric_axis.get_minpos(),
      9218868437227405312UL.reinterpret_as_double(),
    )
    secondary_source_double(
      child.get_tick_space(),
      4622382067542392832UL.reinterpret_as_double(),
    )
    secondary_source_numbers(
      [child.formatter_geometry().0, child.formatter_geometry().1],
      [
        4642648265865560064UL.reinterpret_as_double(),
        4642648265865560064UL.reinterpret_as_double(),
      ],
    )
    assert_eq(child.numeric_axis.autoscale_on(), false)
    assert_eq(child.numeric_axis.autoscale_stale(), false)
    assert_eq(child.ticks_set, false)
    assert_eq(
      [
        secondary_source_major_class(child.numeric_axis.locator().unwrap()),
        secondary_source_minor_class(
          child.numeric_axis.minor_locator().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.named_formatter().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.minor_named_formatter().unwrap(),
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
    secondary_source_numbers(child.tick_values_checked(), [
      4621819117588971520UL.reinterpret_as_double(),
      4636737291354636288UL.reinterpret_as_double(),
    ])
    assert_true(
      physical_equal(
        child.numeric_axis.named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
    assert_true(
      physical_equal(
        child.numeric_axis.minor_named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
  }
  parent
  .y_axis()
  .bind_formatter_geometry(() => {
    (
      4631952216750555136UL.reinterpret_as_double(),
      4639270566145032192UL.reinterpret_as_double(),
    )
  })
  child.synchronize_formatter_frame()
  {
    assert_eq(child.parent_scale_name, Some("log"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "functionlog")
    let view = child.numeric_axis.stored_view_limits()
    secondary_source_numbers([view.lower(), view.upper()], [
      4627730092099895296UL.reinterpret_as_double(),
      4631530004285489152UL.reinterpret_as_double(),
    ])
    secondary_source_numbers(
      [
        child.numeric_axis.data_interval().lower(),
        child.numeric_axis.data_interval().upper(),
      ],
      [
        9218868437227405312UL.reinterpret_as_double(),
        18442240474082181120UL.reinterpret_as_double(),
      ],
    )
    secondary_source_double(
      child.numeric_axis.get_minpos(),
      9218868437227405312UL.reinterpret_as_double(),
    )
    secondary_source_double(
      child.get_tick_space(),
      4619567317775286272UL.reinterpret_as_double(),
    )
    secondary_source_numbers(
      [child.formatter_geometry().0, child.formatter_geometry().1],
      [
        4631952216750555136UL.reinterpret_as_double(),
        4639270566145032192UL.reinterpret_as_double(),
      ],
    )
    assert_eq(child.numeric_axis.autoscale_on(), false)
    assert_eq(child.numeric_axis.autoscale_stale(), false)
    assert_eq(child.ticks_set, false)
    assert_eq(
      [
        secondary_source_major_class(child.numeric_axis.locator().unwrap()),
        secondary_source_minor_class(
          child.numeric_axis.minor_locator().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.named_formatter().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.minor_named_formatter().unwrap(),
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
    secondary_source_numbers(child.tick_values_checked(), [
      4621819117588971520UL.reinterpret_as_double(),
      4636737291354636288UL.reinterpret_as_double(),
    ])
    assert_true(
      physical_equal(
        child.numeric_axis.named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
    assert_true(
      physical_equal(
        child.numeric_axis.minor_named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
  }
  child.prepare_draw()
  assert_eq(child.parent_scale_name, Some("log"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "functionlog")
  let view = child.numeric_axis.stored_view_limits()
  secondary_source_numbers([view.lower(), view.upper()], [
    4627730092099895296UL.reinterpret_as_double(),
    4631530004285489152UL.reinterpret_as_double(),
  ])
  secondary_source_numbers(
    [
      child.numeric_axis.data_interval().lower(),
      child.numeric_axis.data_interval().upper(),
    ],
    [
      9218868437227405312UL.reinterpret_as_double(),
      18442240474082181120UL.reinterpret_as_double(),
    ],
  )
  secondary_source_double(
    child.numeric_axis.get_minpos(),
    9218868437227405312UL.reinterpret_as_double(),
  )
  secondary_source_double(
    child.get_tick_space(),
    4619567317775286272UL.reinterpret_as_double(),
  )
  secondary_source_numbers(
    [child.formatter_geometry().0, child.formatter_geometry().1],
    [
      4631952216750555136UL.reinterpret_as_double(),
      4639270566145032192UL.reinterpret_as_double(),
    ],
  )
  assert_eq(child.numeric_axis.autoscale_on(), false)
  assert_eq(child.numeric_axis.autoscale_stale(), false)
  assert_eq(child.ticks_set, false)
  assert_eq(
    [
      secondary_source_major_class(child.numeric_axis.locator().unwrap()),
      secondary_source_minor_class(child.numeric_axis.minor_locator().unwrap()),
      secondary_source_formatter_class(
        child.numeric_axis.named_formatter().unwrap(),
      ),
      secondary_source_formatter_class(
        child.numeric_axis.minor_named_formatter().unwrap(),
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
  secondary_source_numbers(child.tick_values_checked(), [
    4621819117588971520UL.reinterpret_as_double(),
    4636737291354636288UL.reinterpret_as_double(),
  ])
  assert_true(
    physical_equal(
      child.numeric_axis.named_formatter().unwrap().axis().unwrap(),
      child.numeric_axis.formatter_axis_binding(),
    ),
  )
  assert_true(
    physical_equal(
      child.numeric_axis.minor_named_formatter().unwrap().axis().unwrap(),
      child.numeric_axis.formatter_axis_binding(),
    ),
  )
}

///|
fn secondary_source_case_7() -> Unit raise {
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
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  @config.set_x_margin(0.05)
  @config.set_y_margin(0.05)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_text_usetex(false)
  let figure = figure(width=320, height=240)
  let parent = figure.axes()
  parent.set_y_scale(@scale.symlog_scale(linthresh=2.0))
  parent.set_ylim(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  let child = parent.secondary_yaxis(value => 2.0 * value + 5.0, value => {
    (value - 5.0) / 2.0
  })
  {
    assert_eq(child.parent_scale_name, Some("symlog"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    let view = child.numeric_axis.stored_view_limits()
    secondary_source_numbers([view.lower(), view.upper()], [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
    secondary_source_numbers(
      [
        child.numeric_axis.data_interval().lower(),
        child.numeric_axis.data_interval().upper(),
      ],
      [
        9218868437227405312UL.reinterpret_as_double(),
        18442240474082181120UL.reinterpret_as_double(),
      ],
    )
    secondary_source_double(
      child.numeric_axis.get_minpos(),
      9218868437227405312UL.reinterpret_as_double(),
    )
    secondary_source_double(
      child.get_tick_space(),
      4622382067542392832UL.reinterpret_as_double(),
    )
    secondary_source_numbers(
      [child.formatter_geometry().0, child.formatter_geometry().1],
      [
        4642648265865560064UL.reinterpret_as_double(),
        4642648265865560064UL.reinterpret_as_double(),
      ],
    )
    assert_eq(child.numeric_axis.autoscale_on(), true)
    assert_eq(child.numeric_axis.autoscale_stale(), false)
    assert_eq(child.ticks_set, false)
    assert_eq(
      [
        secondary_source_major_class(child.numeric_axis.locator().unwrap()),
        secondary_source_minor_class(
          child.numeric_axis.minor_locator().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.named_formatter().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.minor_named_formatter().unwrap(),
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
    secondary_source_numbers(child.tick_values_checked(), [
      0UL.reinterpret_as_double(),
      4596373779694328218UL.reinterpret_as_double(),
      4600877379321698714UL.reinterpret_as_double(),
      4603579539098121012UL.reinterpret_as_double(),
      4605380978949069210UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
    assert_true(
      physical_equal(
        child.numeric_axis.named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
    assert_true(
      physical_equal(
        child.numeric_axis.minor_named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
  }
  child.apply_aspect()
  {
    assert_eq(child.parent_scale_name, Some("symlog"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    let view = child.numeric_axis.stored_view_limits()
    secondary_source_numbers([view.lower(), view.upper()], [
      4627730092099895296UL.reinterpret_as_double(),
      4631530004285489152UL.reinterpret_as_double(),
    ])
    secondary_source_numbers(
      [
        child.numeric_axis.data_interval().lower(),
        child.numeric_axis.data_interval().upper(),
      ],
      [
        9218868437227405312UL.reinterpret_as_double(),
        18442240474082181120UL.reinterpret_as_double(),
      ],
    )
    secondary_source_double(
      child.numeric_axis.get_minpos(),
      9218868437227405312UL.reinterpret_as_double(),
    )
    secondary_source_double(
      child.get_tick_space(),
      4622382067542392832UL.reinterpret_as_double(),
    )
    secondary_source_numbers(
      [child.formatter_geometry().0, child.formatter_geometry().1],
      [
        4642648265865560064UL.reinterpret_as_double(),
        4642648265865560064UL.reinterpret_as_double(),
      ],
    )
    assert_eq(child.numeric_axis.autoscale_on(), false)
    assert_eq(child.numeric_axis.autoscale_stale(), false)
    assert_eq(child.ticks_set, false)
    assert_eq(
      [
        secondary_source_major_class(child.numeric_axis.locator().unwrap()),
        secondary_source_minor_class(
          child.numeric_axis.minor_locator().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.named_formatter().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.minor_named_formatter().unwrap(),
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
    secondary_source_numbers(child.tick_values_checked(), [
      4627730092099895296UL.reinterpret_as_double(),
      4628433779541671936UL.reinterpret_as_double(),
      4629137466983448576UL.reinterpret_as_double(),
      4629770785681047552UL.reinterpret_as_double(),
      4630122629401935872UL.reinterpret_as_double(),
      4630474473122824192UL.reinterpret_as_double(),
      4630826316843712512UL.reinterpret_as_double(),
      4631178160564600832UL.reinterpret_as_double(),
      4631530004285489152UL.reinterpret_as_double(),
    ])
    assert_true(
      physical_equal(
        child.numeric_axis.named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
    assert_true(
      physical_equal(
        child.numeric_axis.minor_named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
  }
  parent
  .y_axis()
  .bind_formatter_geometry(() => {
    (
      4631952216750555136UL.reinterpret_as_double(),
      4639270566145032192UL.reinterpret_as_double(),
    )
  })
  child.synchronize_formatter_frame()
  {
    assert_eq(child.parent_scale_name, Some("symlog"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    let view = child.numeric_axis.stored_view_limits()
    secondary_source_numbers([view.lower(), view.upper()], [
      4627730092099895296UL.reinterpret_as_double(),
      4631530004285489152UL.reinterpret_as_double(),
    ])
    secondary_source_numbers(
      [
        child.numeric_axis.data_interval().lower(),
        child.numeric_axis.data_interval().upper(),
      ],
      [
        9218868437227405312UL.reinterpret_as_double(),
        18442240474082181120UL.reinterpret_as_double(),
      ],
    )
    secondary_source_double(
      child.numeric_axis.get_minpos(),
      9218868437227405312UL.reinterpret_as_double(),
    )
    secondary_source_double(
      child.get_tick_space(),
      4619567317775286272UL.reinterpret_as_double(),
    )
    secondary_source_numbers(
      [child.formatter_geometry().0, child.formatter_geometry().1],
      [
        4631952216750555136UL.reinterpret_as_double(),
        4639270566145032192UL.reinterpret_as_double(),
      ],
    )
    assert_eq(child.numeric_axis.autoscale_on(), false)
    assert_eq(child.numeric_axis.autoscale_stale(), false)
    assert_eq(child.ticks_set, false)
    assert_eq(
      [
        secondary_source_major_class(child.numeric_axis.locator().unwrap()),
        secondary_source_minor_class(
          child.numeric_axis.minor_locator().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.named_formatter().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.minor_named_formatter().unwrap(),
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
    secondary_source_numbers(child.tick_values_checked(), [
      4627730092099895296UL.reinterpret_as_double(),
      4629137466983448576UL.reinterpret_as_double(),
      4630122629401935872UL.reinterpret_as_double(),
      4630826316843712512UL.reinterpret_as_double(),
      4631530004285489152UL.reinterpret_as_double(),
    ])
    assert_true(
      physical_equal(
        child.numeric_axis.named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
    assert_true(
      physical_equal(
        child.numeric_axis.minor_named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
  }
  child.prepare_draw()
  assert_eq(child.parent_scale_name, Some("symlog"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
  let view = child.numeric_axis.stored_view_limits()
  secondary_source_numbers([view.lower(), view.upper()], [
    4627730092099895296UL.reinterpret_as_double(),
    4631530004285489152UL.reinterpret_as_double(),
  ])
  secondary_source_numbers(
    [
      child.numeric_axis.data_interval().lower(),
      child.numeric_axis.data_interval().upper(),
    ],
    [
      9218868437227405312UL.reinterpret_as_double(),
      18442240474082181120UL.reinterpret_as_double(),
    ],
  )
  secondary_source_double(
    child.numeric_axis.get_minpos(),
    9218868437227405312UL.reinterpret_as_double(),
  )
  secondary_source_double(
    child.get_tick_space(),
    4619567317775286272UL.reinterpret_as_double(),
  )
  secondary_source_numbers(
    [child.formatter_geometry().0, child.formatter_geometry().1],
    [
      4631952216750555136UL.reinterpret_as_double(),
      4639270566145032192UL.reinterpret_as_double(),
    ],
  )
  assert_eq(child.numeric_axis.autoscale_on(), false)
  assert_eq(child.numeric_axis.autoscale_stale(), false)
  assert_eq(child.ticks_set, false)
  assert_eq(
    [
      secondary_source_major_class(child.numeric_axis.locator().unwrap()),
      secondary_source_minor_class(child.numeric_axis.minor_locator().unwrap()),
      secondary_source_formatter_class(
        child.numeric_axis.named_formatter().unwrap(),
      ),
      secondary_source_formatter_class(
        child.numeric_axis.minor_named_formatter().unwrap(),
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
  secondary_source_numbers(child.tick_values_checked(), [
    4627730092099895296UL.reinterpret_as_double(),
    4629137466983448576UL.reinterpret_as_double(),
    4630122629401935872UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
    4631530004285489152UL.reinterpret_as_double(),
  ])
  assert_true(
    physical_equal(
      child.numeric_axis.named_formatter().unwrap().axis().unwrap(),
      child.numeric_axis.formatter_axis_binding(),
    ),
  )
  assert_true(
    physical_equal(
      child.numeric_axis.minor_named_formatter().unwrap().axis().unwrap(),
      child.numeric_axis.formatter_axis_binding(),
    ),
  )
}

///|
fn secondary_source_case_8() -> Unit raise {
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
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  @config.set_x_margin(0.05)
  @config.set_y_margin(0.05)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_text_usetex(false)
  let figure = figure(width=320, height=240)
  let parent = figure.axes()
  parent.set_y_scale(@scale.asinh_scale())
  parent.set_ylim(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  let child = parent.secondary_yaxis(value => 2.0 * value + 5.0, value => {
    (value - 5.0) / 2.0
  })
  {
    assert_eq(child.parent_scale_name, Some("asinh"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    let view = child.numeric_axis.stored_view_limits()
    secondary_source_numbers([view.lower(), view.upper()], [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
    secondary_source_numbers(
      [
        child.numeric_axis.data_interval().lower(),
        child.numeric_axis.data_interval().upper(),
      ],
      [
        9218868437227405312UL.reinterpret_as_double(),
        18442240474082181120UL.reinterpret_as_double(),
      ],
    )
    secondary_source_double(
      child.numeric_axis.get_minpos(),
      9218868437227405312UL.reinterpret_as_double(),
    )
    secondary_source_double(
      child.get_tick_space(),
      4622382067542392832UL.reinterpret_as_double(),
    )
    secondary_source_numbers(
      [child.formatter_geometry().0, child.formatter_geometry().1],
      [
        4642648265865560064UL.reinterpret_as_double(),
        4642648265865560064UL.reinterpret_as_double(),
      ],
    )
    assert_eq(child.numeric_axis.autoscale_on(), true)
    assert_eq(child.numeric_axis.autoscale_stale(), false)
    assert_eq(child.ticks_set, false)
    assert_eq(
      [
        secondary_source_major_class(child.numeric_axis.locator().unwrap()),
        secondary_source_minor_class(
          child.numeric_axis.minor_locator().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.named_formatter().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.minor_named_formatter().unwrap(),
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
    secondary_source_numbers(child.tick_values_checked(), [
      0UL.reinterpret_as_double(),
      4596373779694328218UL.reinterpret_as_double(),
      4600877379321698714UL.reinterpret_as_double(),
      4603579539098121012UL.reinterpret_as_double(),
      4605380978949069210UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
    assert_true(
      physical_equal(
        child.numeric_axis.named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
    assert_true(
      physical_equal(
        child.numeric_axis.minor_named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
  }
  child.apply_aspect()
  {
    assert_eq(child.parent_scale_name, Some("asinh"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    let view = child.numeric_axis.stored_view_limits()
    secondary_source_numbers([view.lower(), view.upper()], [
      4627730092099895296UL.reinterpret_as_double(),
      4631530004285489152UL.reinterpret_as_double(),
    ])
    secondary_source_numbers(
      [
        child.numeric_axis.data_interval().lower(),
        child.numeric_axis.data_interval().upper(),
      ],
      [
        9218868437227405312UL.reinterpret_as_double(),
        18442240474082181120UL.reinterpret_as_double(),
      ],
    )
    secondary_source_double(
      child.numeric_axis.get_minpos(),
      9218868437227405312UL.reinterpret_as_double(),
    )
    secondary_source_double(
      child.get_tick_space(),
      4622382067542392832UL.reinterpret_as_double(),
    )
    secondary_source_numbers(
      [child.formatter_geometry().0, child.formatter_geometry().1],
      [
        4642648265865560064UL.reinterpret_as_double(),
        4642648265865560064UL.reinterpret_as_double(),
      ],
    )
    assert_eq(child.numeric_axis.autoscale_on(), false)
    assert_eq(child.numeric_axis.autoscale_stale(), false)
    assert_eq(child.ticks_set, false)
    assert_eq(
      [
        secondary_source_major_class(child.numeric_axis.locator().unwrap()),
        secondary_source_minor_class(
          child.numeric_axis.minor_locator().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.named_formatter().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.minor_named_formatter().unwrap(),
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
    secondary_source_numbers(child.tick_values_checked(), [
      4627730092099895296UL.reinterpret_as_double(),
      4628433779541671936UL.reinterpret_as_double(),
      4629137466983448576UL.reinterpret_as_double(),
      4629770785681047552UL.reinterpret_as_double(),
      4630122629401935872UL.reinterpret_as_double(),
      4630474473122824192UL.reinterpret_as_double(),
      4630826316843712512UL.reinterpret_as_double(),
      4631178160564600832UL.reinterpret_as_double(),
      4631530004285489152UL.reinterpret_as_double(),
    ])
    assert_true(
      physical_equal(
        child.numeric_axis.named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
    assert_true(
      physical_equal(
        child.numeric_axis.minor_named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
  }
  parent
  .y_axis()
  .bind_formatter_geometry(() => {
    (
      4631952216750555136UL.reinterpret_as_double(),
      4639270566145032192UL.reinterpret_as_double(),
    )
  })
  child.synchronize_formatter_frame()
  {
    assert_eq(child.parent_scale_name, Some("asinh"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    let view = child.numeric_axis.stored_view_limits()
    secondary_source_numbers([view.lower(), view.upper()], [
      4627730092099895296UL.reinterpret_as_double(),
      4631530004285489152UL.reinterpret_as_double(),
    ])
    secondary_source_numbers(
      [
        child.numeric_axis.data_interval().lower(),
        child.numeric_axis.data_interval().upper(),
      ],
      [
        9218868437227405312UL.reinterpret_as_double(),
        18442240474082181120UL.reinterpret_as_double(),
      ],
    )
    secondary_source_double(
      child.numeric_axis.get_minpos(),
      9218868437227405312UL.reinterpret_as_double(),
    )
    secondary_source_double(
      child.get_tick_space(),
      4619567317775286272UL.reinterpret_as_double(),
    )
    secondary_source_numbers(
      [child.formatter_geometry().0, child.formatter_geometry().1],
      [
        4631952216750555136UL.reinterpret_as_double(),
        4639270566145032192UL.reinterpret_as_double(),
      ],
    )
    assert_eq(child.numeric_axis.autoscale_on(), false)
    assert_eq(child.numeric_axis.autoscale_stale(), false)
    assert_eq(child.ticks_set, false)
    assert_eq(
      [
        secondary_source_major_class(child.numeric_axis.locator().unwrap()),
        secondary_source_minor_class(
          child.numeric_axis.minor_locator().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.named_formatter().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.minor_named_formatter().unwrap(),
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
    secondary_source_numbers(child.tick_values_checked(), [
      4627730092099895296UL.reinterpret_as_double(),
      4629137466983448576UL.reinterpret_as_double(),
      4630122629401935872UL.reinterpret_as_double(),
      4630826316843712512UL.reinterpret_as_double(),
      4631530004285489152UL.reinterpret_as_double(),
    ])
    assert_true(
      physical_equal(
        child.numeric_axis.named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
    assert_true(
      physical_equal(
        child.numeric_axis.minor_named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
  }
  child.prepare_draw()
  assert_eq(child.parent_scale_name, Some("asinh"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
  let view = child.numeric_axis.stored_view_limits()
  secondary_source_numbers([view.lower(), view.upper()], [
    4627730092099895296UL.reinterpret_as_double(),
    4631530004285489152UL.reinterpret_as_double(),
  ])
  secondary_source_numbers(
    [
      child.numeric_axis.data_interval().lower(),
      child.numeric_axis.data_interval().upper(),
    ],
    [
      9218868437227405312UL.reinterpret_as_double(),
      18442240474082181120UL.reinterpret_as_double(),
    ],
  )
  secondary_source_double(
    child.numeric_axis.get_minpos(),
    9218868437227405312UL.reinterpret_as_double(),
  )
  secondary_source_double(
    child.get_tick_space(),
    4619567317775286272UL.reinterpret_as_double(),
  )
  secondary_source_numbers(
    [child.formatter_geometry().0, child.formatter_geometry().1],
    [
      4631952216750555136UL.reinterpret_as_double(),
      4639270566145032192UL.reinterpret_as_double(),
    ],
  )
  assert_eq(child.numeric_axis.autoscale_on(), false)
  assert_eq(child.numeric_axis.autoscale_stale(), false)
  assert_eq(child.ticks_set, false)
  assert_eq(
    [
      secondary_source_major_class(child.numeric_axis.locator().unwrap()),
      secondary_source_minor_class(child.numeric_axis.minor_locator().unwrap()),
      secondary_source_formatter_class(
        child.numeric_axis.named_formatter().unwrap(),
      ),
      secondary_source_formatter_class(
        child.numeric_axis.minor_named_formatter().unwrap(),
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
  secondary_source_numbers(child.tick_values_checked(), [
    4627730092099895296UL.reinterpret_as_double(),
    4629137466983448576UL.reinterpret_as_double(),
    4630122629401935872UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
    4631530004285489152UL.reinterpret_as_double(),
  ])
  assert_true(
    physical_equal(
      child.numeric_axis.named_formatter().unwrap().axis().unwrap(),
      child.numeric_axis.formatter_axis_binding(),
    ),
  )
  assert_true(
    physical_equal(
      child.numeric_axis.minor_named_formatter().unwrap().axis().unwrap(),
      child.numeric_axis.formatter_axis_binding(),
    ),
  )
}

///|
fn secondary_source_case_9() -> Unit raise {
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
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  @config.set_x_margin(0.05)
  @config.set_y_margin(0.05)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_text_usetex(false)
  let figure = figure(width=320, height=240)
  let parent = figure.axes()
  parent.set_y_scale(@scale.logit_scale())
  parent.set_ylim(
    4591870180066957722UL.reinterpret_as_double(),
    4605380978949069210UL.reinterpret_as_double(),
  )
  let child = parent.secondary_yaxis(value => 2.0 * value + 5.0, value => {
    (value - 5.0) / 2.0
  })
  {
    assert_eq(child.parent_scale_name, Some("logit"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    let view = child.numeric_axis.stored_view_limits()
    secondary_source_numbers([view.lower(), view.upper()], [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
    secondary_source_numbers(
      [
        child.numeric_axis.data_interval().lower(),
        child.numeric_axis.data_interval().upper(),
      ],
      [
        9218868437227405312UL.reinterpret_as_double(),
        18442240474082181120UL.reinterpret_as_double(),
      ],
    )
    secondary_source_double(
      child.numeric_axis.get_minpos(),
      9218868437227405312UL.reinterpret_as_double(),
    )
    secondary_source_double(
      child.get_tick_space(),
      4622382067542392832UL.reinterpret_as_double(),
    )
    secondary_source_numbers(
      [child.formatter_geometry().0, child.formatter_geometry().1],
      [
        4642648265865560064UL.reinterpret_as_double(),
        4642648265865560064UL.reinterpret_as_double(),
      ],
    )
    assert_eq(child.numeric_axis.autoscale_on(), true)
    assert_eq(child.numeric_axis.autoscale_stale(), false)
    assert_eq(child.ticks_set, false)
    assert_eq(
      [
        secondary_source_major_class(child.numeric_axis.locator().unwrap()),
        secondary_source_minor_class(
          child.numeric_axis.minor_locator().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.named_formatter().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.minor_named_formatter().unwrap(),
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
    secondary_source_numbers(child.tick_values_checked(), [
      0UL.reinterpret_as_double(),
      4596373779694328218UL.reinterpret_as_double(),
      4600877379321698714UL.reinterpret_as_double(),
      4603579539098121012UL.reinterpret_as_double(),
      4605380978949069210UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
    assert_true(
      physical_equal(
        child.numeric_axis.named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
    assert_true(
      physical_equal(
        child.numeric_axis.minor_named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
  }
  child.apply_aspect()
  {
    assert_eq(child.parent_scale_name, Some("logit"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    let view = child.numeric_axis.stored_view_limits()
    secondary_source_numbers([view.lower(), view.upper()], [
      4617540697942969549UL.reinterpret_as_double(),
      4619116957812549222UL.reinterpret_as_double(),
    ])
    secondary_source_numbers(
      [
        child.numeric_axis.data_interval().lower(),
        child.numeric_axis.data_interval().upper(),
      ],
      [
        9218868437227405312UL.reinterpret_as_double(),
        18442240474082181120UL.reinterpret_as_double(),
      ],
    )
    secondary_source_double(
      child.numeric_axis.get_minpos(),
      9218868437227405312UL.reinterpret_as_double(),
    )
    secondary_source_double(
      child.get_tick_space(),
      4622382067542392832UL.reinterpret_as_double(),
    )
    secondary_source_numbers(
      [child.formatter_geometry().0, child.formatter_geometry().1],
      [
        4642648265865560064UL.reinterpret_as_double(),
        4642648265865560064UL.reinterpret_as_double(),
      ],
    )
    assert_eq(child.numeric_axis.autoscale_on(), false)
    assert_eq(child.numeric_axis.autoscale_stale(), false)
    assert_eq(child.ticks_set, false)
    assert_eq(
      [
        secondary_source_major_class(child.numeric_axis.locator().unwrap()),
        secondary_source_minor_class(
          child.numeric_axis.minor_locator().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.named_formatter().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.minor_named_formatter().unwrap(),
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
    secondary_source_numbers(child.tick_values_checked(), [
      4617540697942969549UL.reinterpret_as_double(),
      4617765877924338074UL.reinterpret_as_double(),
      4617991057905706598UL.reinterpret_as_double(),
      4618216237887075123UL.reinterpret_as_double(),
      4618441417868443648UL.reinterpret_as_double(),
      4618666597849812173UL.reinterpret_as_double(),
      4618891777831180698UL.reinterpret_as_double(),
      4619116957812549222UL.reinterpret_as_double(),
    ])
    assert_true(
      physical_equal(
        child.numeric_axis.named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
    assert_true(
      physical_equal(
        child.numeric_axis.minor_named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
  }
  parent
  .y_axis()
  .bind_formatter_geometry(() => {
    (
      4631952216750555136UL.reinterpret_as_double(),
      4639270566145032192UL.reinterpret_as_double(),
    )
  })
  child.synchronize_formatter_frame()
  {
    assert_eq(child.parent_scale_name, Some("logit"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    let view = child.numeric_axis.stored_view_limits()
    secondary_source_numbers([view.lower(), view.upper()], [
      4617540697942969549UL.reinterpret_as_double(),
      4619116957812549222UL.reinterpret_as_double(),
    ])
    secondary_source_numbers(
      [
        child.numeric_axis.data_interval().lower(),
        child.numeric_axis.data_interval().upper(),
      ],
      [
        9218868437227405312UL.reinterpret_as_double(),
        18442240474082181120UL.reinterpret_as_double(),
      ],
    )
    secondary_source_double(
      child.numeric_axis.get_minpos(),
      9218868437227405312UL.reinterpret_as_double(),
    )
    secondary_source_double(
      child.get_tick_space(),
      4619567317775286272UL.reinterpret_as_double(),
    )
    secondary_source_numbers(
      [child.formatter_geometry().0, child.formatter_geometry().1],
      [
        4631952216750555136UL.reinterpret_as_double(),
        4639270566145032192UL.reinterpret_as_double(),
      ],
    )
    assert_eq(child.numeric_axis.autoscale_on(), false)
    assert_eq(child.numeric_axis.autoscale_stale(), false)
    assert_eq(child.ticks_set, false)
    assert_eq(
      [
        secondary_source_major_class(child.numeric_axis.locator().unwrap()),
        secondary_source_minor_class(
          child.numeric_axis.minor_locator().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.named_formatter().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.minor_named_formatter().unwrap(),
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
    secondary_source_numbers(child.tick_values_checked(), [
      4617540697942969549UL.reinterpret_as_double(),
      4617765877924338074UL.reinterpret_as_double(),
      4617991057905706598UL.reinterpret_as_double(),
      4618216237887075123UL.reinterpret_as_double(),
      4618441417868443648UL.reinterpret_as_double(),
      4618666597849812173UL.reinterpret_as_double(),
      4618891777831180698UL.reinterpret_as_double(),
      4619116957812549222UL.reinterpret_as_double(),
    ])
    assert_true(
      physical_equal(
        child.numeric_axis.named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
    assert_true(
      physical_equal(
        child.numeric_axis.minor_named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
  }
  child.prepare_draw()
  assert_eq(child.parent_scale_name, Some("logit"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
  let view = child.numeric_axis.stored_view_limits()
  secondary_source_numbers([view.lower(), view.upper()], [
    4617540697942969549UL.reinterpret_as_double(),
    4619116957812549222UL.reinterpret_as_double(),
  ])
  secondary_source_numbers(
    [
      child.numeric_axis.data_interval().lower(),
      child.numeric_axis.data_interval().upper(),
    ],
    [
      9218868437227405312UL.reinterpret_as_double(),
      18442240474082181120UL.reinterpret_as_double(),
    ],
  )
  secondary_source_double(
    child.numeric_axis.get_minpos(),
    9218868437227405312UL.reinterpret_as_double(),
  )
  secondary_source_double(
    child.get_tick_space(),
    4619567317775286272UL.reinterpret_as_double(),
  )
  secondary_source_numbers(
    [child.formatter_geometry().0, child.formatter_geometry().1],
    [
      4631952216750555136UL.reinterpret_as_double(),
      4639270566145032192UL.reinterpret_as_double(),
    ],
  )
  assert_eq(child.numeric_axis.autoscale_on(), false)
  assert_eq(child.numeric_axis.autoscale_stale(), false)
  assert_eq(child.ticks_set, false)
  assert_eq(
    [
      secondary_source_major_class(child.numeric_axis.locator().unwrap()),
      secondary_source_minor_class(child.numeric_axis.minor_locator().unwrap()),
      secondary_source_formatter_class(
        child.numeric_axis.named_formatter().unwrap(),
      ),
      secondary_source_formatter_class(
        child.numeric_axis.minor_named_formatter().unwrap(),
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
  secondary_source_numbers(child.tick_values_checked(), [
    4617540697942969549UL.reinterpret_as_double(),
    4617765877924338074UL.reinterpret_as_double(),
    4617991057905706598UL.reinterpret_as_double(),
    4618216237887075123UL.reinterpret_as_double(),
    4618441417868443648UL.reinterpret_as_double(),
    4618666597849812173UL.reinterpret_as_double(),
    4618891777831180698UL.reinterpret_as_double(),
    4619116957812549222UL.reinterpret_as_double(),
  ])
  assert_true(
    physical_equal(
      child.numeric_axis.named_formatter().unwrap().axis().unwrap(),
      child.numeric_axis.formatter_axis_binding(),
    ),
  )
  assert_true(
    physical_equal(
      child.numeric_axis.minor_named_formatter().unwrap().axis().unwrap(),
      child.numeric_axis.formatter_axis_binding(),
    ),
  )
}

///|
fn secondary_source_case_10() -> Unit raise {
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
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  @config.set_x_margin(0.05)
  @config.set_y_margin(0.05)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_text_usetex(false)
  let figure = figure(width=320, height=240)
  let parent = figure.axes()
  parent.set_x_scale(@scale.linear_scale())
  parent.set_xlim(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  let child = parent.secondary_xaxis(
    value => {
      ignore(value)
      4.0
    },
    value => value,
  )
  child.set_locator(@ticker.FixedLocator::new([]).as_locator())
  parent.set_x_scale(@scale.log_scale())
  parent.set_xlim(10.0, 20.0)
  child.prepare_draw()
  assert_eq(child.parent_scale_name, Some("log"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "functionlog")
  let view = child.numeric_axis.stored_view_limits()
  secondary_source_numbers([view.lower(), view.upper()], [
    4615739258092021350UL.reinterpret_as_double(),
    4616414798036126925UL.reinterpret_as_double(),
  ])
  secondary_source_numbers(
    [
      child.numeric_axis.data_interval().lower(),
      child.numeric_axis.data_interval().upper(),
    ],
    [
      9218868437227405312UL.reinterpret_as_double(),
      18442240474082181120UL.reinterpret_as_double(),
    ],
  )
  secondary_source_double(
    child.numeric_axis.get_minpos(),
    9218868437227405312UL.reinterpret_as_double(),
  )
  secondary_source_double(
    child.get_tick_space(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  secondary_source_numbers(
    [child.formatter_geometry().0, child.formatter_geometry().1],
    [0UL.reinterpret_as_double(), 4644337115725824000UL.reinterpret_as_double()],
  )
  assert_eq(child.numeric_axis.autoscale_on(), false)
  assert_eq(child.numeric_axis.autoscale_stale(), false)
  assert_eq(child.ticks_set, false)
  assert_eq(
    [
      secondary_source_major_class(child.numeric_axis.locator().unwrap()),
      secondary_source_minor_class(child.numeric_axis.minor_locator().unwrap()),
      secondary_source_formatter_class(
        child.numeric_axis.named_formatter().unwrap(),
      ),
      secondary_source_formatter_class(
        child.numeric_axis.minor_named_formatter().unwrap(),
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
  secondary_source_numbers(child.tick_values_checked(), [
    4607182418800017408UL.reinterpret_as_double(),
    4621819117588971520UL.reinterpret_as_double(),
  ])
  assert_true(
    physical_equal(
      child.numeric_axis.named_formatter().unwrap().axis().unwrap(),
      child.numeric_axis.formatter_axis_binding(),
    ),
  )
  assert_true(
    physical_equal(
      child.numeric_axis.minor_named_formatter().unwrap().axis().unwrap(),
      child.numeric_axis.formatter_axis_binding(),
    ),
  )
}

///|
fn secondary_source_case_11() -> Unit raise {
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
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  @config.set_x_margin(0.05)
  @config.set_y_margin(0.05)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_text_usetex(false)
  let figure = figure(width=320, height=240)
  let parent = figure.axes()
  parent.set_x_scale(@scale.linear_scale())
  parent.set_xlim(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  let child = parent.secondary_xaxis(
    value => {
      ignore(value)
      0.0 / 0.0
    },
    value => value,
  )
  parent.set_x_scale(@scale.log_scale())
  parent.set_xlim(10.0, 20.0)
  let failed = try {
    child.prepare_draw()
    false
  } catch {
    @core.DataError::InvalidTicks(message~) =>
      message == "ValueError: Axis limits cannot be NaN or Inf"
    _ => false
  }
  assert_true(failed)
  assert_eq(child.parent_scale_name, Some("linear"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
  let view = child.numeric_axis.stored_view_limits()
  secondary_source_numbers([view.lower(), view.upper()], [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  secondary_source_numbers(
    [
      child.numeric_axis.data_interval().lower(),
      child.numeric_axis.data_interval().upper(),
    ],
    [
      9218868437227405312UL.reinterpret_as_double(),
      18442240474082181120UL.reinterpret_as_double(),
    ],
  )
  secondary_source_double(
    child.numeric_axis.get_minpos(),
    9218868437227405312UL.reinterpret_as_double(),
  )
  secondary_source_double(
    child.get_tick_space(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  secondary_source_numbers(
    [child.formatter_geometry().0, child.formatter_geometry().1],
    [0UL.reinterpret_as_double(), 4644337115725824000UL.reinterpret_as_double()],
  )
  assert_eq(child.numeric_axis.autoscale_on(), true)
  assert_eq(child.numeric_axis.autoscale_stale(), false)
  assert_eq(child.ticks_set, false)
  assert_eq(
    [
      secondary_source_major_class(child.numeric_axis.locator().unwrap()),
      secondary_source_minor_class(child.numeric_axis.minor_locator().unwrap()),
      secondary_source_formatter_class(
        child.numeric_axis.named_formatter().unwrap(),
      ),
      secondary_source_formatter_class(
        child.numeric_axis.minor_named_formatter().unwrap(),
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
  secondary_source_numbers(child.tick_values_checked(), [
    0UL.reinterpret_as_double(),
    4596373779694328218UL.reinterpret_as_double(),
    4600877379321698714UL.reinterpret_as_double(),
    4603579539098121012UL.reinterpret_as_double(),
    4605380978949069210UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  assert_true(
    physical_equal(
      child.numeric_axis.named_formatter().unwrap().axis().unwrap(),
      child.numeric_axis.formatter_axis_binding(),
    ),
  )
  assert_true(
    physical_equal(
      child.numeric_axis.minor_named_formatter().unwrap().axis().unwrap(),
      child.numeric_axis.formatter_axis_binding(),
    ),
  )
}

///|
fn secondary_source_case_12() -> Unit raise {
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
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  @config.set_x_margin(0.05)
  @config.set_y_margin(0.05)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_text_usetex(false)
  let figure = figure(width=320, height=240)
  let parent = figure.axes()
  parent.set_x_scale(@scale.linear_scale())
  parent.set_xlim(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  let child = parent.secondary_xaxis(value => 2.0 * value + 5.0, value => {
    (value - 5.0) / 2.0
  })
  {
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    let view = child.numeric_axis.stored_view_limits()
    secondary_source_numbers([view.lower(), view.upper()], [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
    secondary_source_numbers(
      [
        child.numeric_axis.data_interval().lower(),
        child.numeric_axis.data_interval().upper(),
      ],
      [
        9218868437227405312UL.reinterpret_as_double(),
        18442240474082181120UL.reinterpret_as_double(),
      ],
    )
    secondary_source_double(
      child.numeric_axis.get_minpos(),
      9218868437227405312UL.reinterpret_as_double(),
    )
    secondary_source_double(
      child.get_tick_space(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    secondary_source_numbers(
      [child.formatter_geometry().0, child.formatter_geometry().1],
      [
        0UL.reinterpret_as_double(),
        4644337115725824000UL.reinterpret_as_double(),
      ],
    )
    assert_eq(child.numeric_axis.autoscale_on(), true)
    assert_eq(child.numeric_axis.autoscale_stale(), false)
    assert_eq(child.ticks_set, false)
    assert_eq(
      [
        secondary_source_major_class(child.numeric_axis.locator().unwrap()),
        secondary_source_minor_class(
          child.numeric_axis.minor_locator().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.named_formatter().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.minor_named_formatter().unwrap(),
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
    secondary_source_numbers(child.tick_values_checked(), [
      0UL.reinterpret_as_double(),
      4596373779694328218UL.reinterpret_as_double(),
      4600877379321698714UL.reinterpret_as_double(),
      4603579539098121012UL.reinterpret_as_double(),
      4605380978949069210UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
    assert_true(
      physical_equal(
        child.numeric_axis.named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
    assert_true(
      physical_equal(
        child.numeric_axis.minor_named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
  }
  let old_major = child.numeric_axis.locator().unwrap()
  let old_minor = child.numeric_axis.minor_locator().unwrap()
  let old_major_formatter = child.numeric_axis.named_formatter().unwrap()
  let old_minor_formatter = child.numeric_axis.minor_named_formatter().unwrap()
  @config.set_minor_ticks_visible(true, horizontal=true)
  child.prepare_draw()
  {
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    let view = child.numeric_axis.stored_view_limits()
    secondary_source_numbers([view.lower(), view.upper()], [
      4627730092099895296UL.reinterpret_as_double(),
      4631530004285489152UL.reinterpret_as_double(),
    ])
    secondary_source_numbers(
      [
        child.numeric_axis.data_interval().lower(),
        child.numeric_axis.data_interval().upper(),
      ],
      [
        9218868437227405312UL.reinterpret_as_double(),
        18442240474082181120UL.reinterpret_as_double(),
      ],
    )
    secondary_source_double(
      child.numeric_axis.get_minpos(),
      9218868437227405312UL.reinterpret_as_double(),
    )
    secondary_source_double(
      child.get_tick_space(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    secondary_source_numbers(
      [child.formatter_geometry().0, child.formatter_geometry().1],
      [
        0UL.reinterpret_as_double(),
        4644337115725824000UL.reinterpret_as_double(),
      ],
    )
    assert_eq(child.numeric_axis.autoscale_on(), false)
    assert_eq(child.numeric_axis.autoscale_stale(), false)
    assert_eq(child.ticks_set, false)
    assert_eq(
      [
        secondary_source_major_class(child.numeric_axis.locator().unwrap()),
        secondary_source_minor_class(
          child.numeric_axis.minor_locator().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.named_formatter().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.minor_named_formatter().unwrap(),
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
    secondary_source_numbers(child.tick_values_checked(), [
      4627730092099895296UL.reinterpret_as_double(),
      4628433779541671936UL.reinterpret_as_double(),
      4629137466983448576UL.reinterpret_as_double(),
      4629770785681047552UL.reinterpret_as_double(),
      4630122629401935872UL.reinterpret_as_double(),
      4630474473122824192UL.reinterpret_as_double(),
      4630826316843712512UL.reinterpret_as_double(),
      4631178160564600832UL.reinterpret_as_double(),
      4631530004285489152UL.reinterpret_as_double(),
    ])
    assert_true(
      physical_equal(
        child.numeric_axis.named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
    assert_true(
      physical_equal(
        child.numeric_axis.minor_named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
  }
  assert_eq(
    [
      secondary_source_same_major(
        old_major,
        child.numeric_axis.locator().unwrap(),
      ),
      secondary_source_same_minor(
        old_minor,
        child.numeric_axis.minor_locator().unwrap(),
      ),
      physical_equal(
        old_major_formatter,
        child.numeric_axis.named_formatter().unwrap(),
      ),
      physical_equal(
        old_minor_formatter,
        child.numeric_axis.minor_named_formatter().unwrap(),
      ),
    ],
    [true, true, true, true],
  )
  assert_true(
    physical_equal(
      old_major_formatter.axis().unwrap(),
      child.numeric_axis.formatter_axis_binding(),
    ),
  )
  assert_true(
    physical_equal(
      old_minor_formatter.axis().unwrap(),
      child.numeric_axis.formatter_axis_binding(),
    ),
  )
}

///|
fn secondary_source_case_13() -> Unit raise {
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
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  @config.set_x_margin(0.05)
  @config.set_y_margin(0.05)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_text_usetex(false)
  let figure = figure(width=320, height=240)
  let parent = figure.axes()
  parent.set_x_scale(@scale.linear_scale())
  parent.set_xlim(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  let child = parent.secondary_xaxis(value => 2.0 * value + 5.0, value => {
    (value - 5.0) / 2.0
  })
  child.set_locator(@ticker.FixedLocator::new([4.0, 7.0]).as_locator())
  child.set_minor_locator(@ticker.FixedLocator::new([5.0]).as_minor_locator())
  child.set_named_formatter(
    @ticker.FixedFormatter::new(["A", "B"]).as_base_formatter(),
  )
  child.set_minor_named_formatter(
    @ticker.FuncFormatter::new((_, _) => "minor").as_base_formatter(),
  )
  {
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    let view = child.numeric_axis.stored_view_limits()
    secondary_source_numbers([view.lower(), view.upper()], [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
    secondary_source_numbers(
      [
        child.numeric_axis.data_interval().lower(),
        child.numeric_axis.data_interval().upper(),
      ],
      [
        9218868437227405312UL.reinterpret_as_double(),
        18442240474082181120UL.reinterpret_as_double(),
      ],
    )
    secondary_source_double(
      child.numeric_axis.get_minpos(),
      9218868437227405312UL.reinterpret_as_double(),
    )
    secondary_source_double(
      child.get_tick_space(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    secondary_source_numbers(
      [child.formatter_geometry().0, child.formatter_geometry().1],
      [
        0UL.reinterpret_as_double(),
        4644337115725824000UL.reinterpret_as_double(),
      ],
    )
    assert_eq(child.numeric_axis.autoscale_on(), true)
    assert_eq(child.numeric_axis.autoscale_stale(), false)
    assert_eq(child.ticks_set, false)
    assert_eq(
      [
        secondary_source_major_class(child.numeric_axis.locator().unwrap()),
        secondary_source_minor_class(
          child.numeric_axis.minor_locator().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.named_formatter().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.minor_named_formatter().unwrap(),
        ),
      ],
      ["FixedLocator", "FixedLocator", "FixedFormatter", "FuncFormatter"],
    )
    assert_eq(
      [
        child.numeric_axis.is_default_locator(),
        child.numeric_axis.is_default_locator(minor=true),
        child.numeric_axis.is_default_formatter(),
        child.numeric_axis.is_default_formatter(minor=true),
      ],
      [false, false, false, false],
    )
    secondary_source_numbers(child.tick_values_checked(), [
      4616189618054758400UL.reinterpret_as_double(),
      4619567317775286272UL.reinterpret_as_double(),
    ])
    assert_true(
      physical_equal(
        child.numeric_axis.named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
    assert_true(
      physical_equal(
        child.numeric_axis.minor_named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
  }
  let old_major = child.numeric_axis.locator().unwrap()
  let old_minor = child.numeric_axis.minor_locator().unwrap()
  let old_major_formatter = child.numeric_axis.named_formatter().unwrap()
  let old_minor_formatter = child.numeric_axis.minor_named_formatter().unwrap()
  @config.set_minor_ticks_visible(true, horizontal=true)
  parent.set_x_scale(@scale.symlog_scale(linthresh=2.0))
  parent.set_xlim(10.0, 20.0)
  child.prepare_draw()
  {
    assert_eq(child.parent_scale_name, Some("symlog"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    let view = child.numeric_axis.stored_view_limits()
    secondary_source_numbers([view.lower(), view.upper()], [
      4627730092099895296UL.reinterpret_as_double(),
      4631530004285489152UL.reinterpret_as_double(),
    ])
    secondary_source_numbers(
      [
        child.numeric_axis.data_interval().lower(),
        child.numeric_axis.data_interval().upper(),
      ],
      [
        9218868437227405312UL.reinterpret_as_double(),
        18442240474082181120UL.reinterpret_as_double(),
      ],
    )
    secondary_source_double(
      child.numeric_axis.get_minpos(),
      9218868437227405312UL.reinterpret_as_double(),
    )
    secondary_source_double(
      child.get_tick_space(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    secondary_source_numbers(
      [child.formatter_geometry().0, child.formatter_geometry().1],
      [
        0UL.reinterpret_as_double(),
        4644337115725824000UL.reinterpret_as_double(),
      ],
    )
    assert_eq(child.numeric_axis.autoscale_on(), false)
    assert_eq(child.numeric_axis.autoscale_stale(), false)
    assert_eq(child.ticks_set, false)
    assert_eq(
      [
        secondary_source_major_class(child.numeric_axis.locator().unwrap()),
        secondary_source_minor_class(
          child.numeric_axis.minor_locator().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.named_formatter().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.minor_named_formatter().unwrap(),
        ),
      ],
      ["AutoLocator", "AutoMinorLocator", "ScalarFormatter", "NullFormatter"],
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
    secondary_source_numbers(child.tick_values_checked(), [
      4627730092099895296UL.reinterpret_as_double(),
      4628433779541671936UL.reinterpret_as_double(),
      4629137466983448576UL.reinterpret_as_double(),
      4629770785681047552UL.reinterpret_as_double(),
      4630122629401935872UL.reinterpret_as_double(),
      4630474473122824192UL.reinterpret_as_double(),
      4630826316843712512UL.reinterpret_as_double(),
      4631178160564600832UL.reinterpret_as_double(),
      4631530004285489152UL.reinterpret_as_double(),
    ])
    assert_true(
      physical_equal(
        child.numeric_axis.named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
    assert_true(
      physical_equal(
        child.numeric_axis.minor_named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
  }
  assert_eq(
    [
      secondary_source_same_major(
        old_major,
        child.numeric_axis.locator().unwrap(),
      ),
      secondary_source_same_minor(
        old_minor,
        child.numeric_axis.minor_locator().unwrap(),
      ),
      physical_equal(
        old_major_formatter,
        child.numeric_axis.named_formatter().unwrap(),
      ),
      physical_equal(
        old_minor_formatter,
        child.numeric_axis.minor_named_formatter().unwrap(),
      ),
    ],
    [false, false, false, false],
  )
  assert_true(
    physical_equal(
      old_major_formatter.axis().unwrap(),
      child.numeric_axis.formatter_axis_binding(),
    ),
  )
  assert_true(
    physical_equal(
      old_minor_formatter.axis().unwrap(),
      child.numeric_axis.formatter_axis_binding(),
    ),
  )
}

///|
fn secondary_source_case_14() -> Unit raise {
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
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  @config.set_x_margin(0.05)
  @config.set_y_margin(0.05)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_text_usetex(false)
  let figure = figure(width=320, height=240)
  let parent = figure.axes()
  parent.set_x_scale(@scale.linear_scale())
  parent.set_xlim(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  let child = parent.secondary_xaxis(value => 2.0 * value + 5.0, value => {
    (value - 5.0) / 2.0
  })
  child.set_locator(@ticker.FixedLocator::new([4.0, 7.0]).as_locator())
  child.set_minor_locator(@ticker.FixedLocator::new([5.0]).as_minor_locator())
  child.set_named_formatter(
    @ticker.FixedFormatter::new(["A", "B"]).as_base_formatter(),
  )
  child.set_minor_named_formatter(
    @ticker.FuncFormatter::new((_, _) => "minor").as_base_formatter(),
  )
  {
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    let view = child.numeric_axis.stored_view_limits()
    secondary_source_numbers([view.lower(), view.upper()], [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
    secondary_source_numbers(
      [
        child.numeric_axis.data_interval().lower(),
        child.numeric_axis.data_interval().upper(),
      ],
      [
        9218868437227405312UL.reinterpret_as_double(),
        18442240474082181120UL.reinterpret_as_double(),
      ],
    )
    secondary_source_double(
      child.numeric_axis.get_minpos(),
      9218868437227405312UL.reinterpret_as_double(),
    )
    secondary_source_double(
      child.get_tick_space(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    secondary_source_numbers(
      [child.formatter_geometry().0, child.formatter_geometry().1],
      [
        0UL.reinterpret_as_double(),
        4644337115725824000UL.reinterpret_as_double(),
      ],
    )
    assert_eq(child.numeric_axis.autoscale_on(), true)
    assert_eq(child.numeric_axis.autoscale_stale(), false)
    assert_eq(child.ticks_set, false)
    assert_eq(
      [
        secondary_source_major_class(child.numeric_axis.locator().unwrap()),
        secondary_source_minor_class(
          child.numeric_axis.minor_locator().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.named_formatter().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.minor_named_formatter().unwrap(),
        ),
      ],
      ["FixedLocator", "FixedLocator", "FixedFormatter", "FuncFormatter"],
    )
    assert_eq(
      [
        child.numeric_axis.is_default_locator(),
        child.numeric_axis.is_default_locator(minor=true),
        child.numeric_axis.is_default_formatter(),
        child.numeric_axis.is_default_formatter(minor=true),
      ],
      [false, false, false, false],
    )
    secondary_source_numbers(child.tick_values_checked(), [
      4616189618054758400UL.reinterpret_as_double(),
      4619567317775286272UL.reinterpret_as_double(),
    ])
    assert_true(
      physical_equal(
        child.numeric_axis.named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
    assert_true(
      physical_equal(
        child.numeric_axis.minor_named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
  }
  let old_major = child.numeric_axis.locator().unwrap()
  let old_minor = child.numeric_axis.minor_locator().unwrap()
  let old_major_formatter = child.numeric_axis.named_formatter().unwrap()
  let old_minor_formatter = child.numeric_axis.minor_named_formatter().unwrap()
  @config.set_minor_ticks_visible(true, horizontal=true)
  parent.set_x_scale(@scale.log_scale())
  parent.set_xlim(10.0, 20.0)
  child.prepare_draw()
  {
    assert_eq(child.parent_scale_name, Some("log"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "functionlog")
    let view = child.numeric_axis.stored_view_limits()
    secondary_source_numbers([view.lower(), view.upper()], [
      4627730092099895296UL.reinterpret_as_double(),
      4631530004285489152UL.reinterpret_as_double(),
    ])
    secondary_source_numbers(
      [
        child.numeric_axis.data_interval().lower(),
        child.numeric_axis.data_interval().upper(),
      ],
      [
        9218868437227405312UL.reinterpret_as_double(),
        18442240474082181120UL.reinterpret_as_double(),
      ],
    )
    secondary_source_double(
      child.numeric_axis.get_minpos(),
      9218868437227405312UL.reinterpret_as_double(),
    )
    secondary_source_double(
      child.get_tick_space(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    secondary_source_numbers(
      [child.formatter_geometry().0, child.formatter_geometry().1],
      [
        0UL.reinterpret_as_double(),
        4644337115725824000UL.reinterpret_as_double(),
      ],
    )
    assert_eq(child.numeric_axis.autoscale_on(), false)
    assert_eq(child.numeric_axis.autoscale_stale(), false)
    assert_eq(child.ticks_set, false)
    assert_eq(
      [
        secondary_source_major_class(child.numeric_axis.locator().unwrap()),
        secondary_source_minor_class(
          child.numeric_axis.minor_locator().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.named_formatter().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.minor_named_formatter().unwrap(),
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
    secondary_source_numbers(child.tick_values_checked(), [
      4621819117588971520UL.reinterpret_as_double(),
      4636737291354636288UL.reinterpret_as_double(),
    ])
    assert_true(
      physical_equal(
        child.numeric_axis.named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
    assert_true(
      physical_equal(
        child.numeric_axis.minor_named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
  }
  assert_eq(
    [
      secondary_source_same_major(
        old_major,
        child.numeric_axis.locator().unwrap(),
      ),
      secondary_source_same_minor(
        old_minor,
        child.numeric_axis.minor_locator().unwrap(),
      ),
      physical_equal(
        old_major_formatter,
        child.numeric_axis.named_formatter().unwrap(),
      ),
      physical_equal(
        old_minor_formatter,
        child.numeric_axis.minor_named_formatter().unwrap(),
      ),
    ],
    [false, false, false, false],
  )
  assert_true(
    physical_equal(
      old_major_formatter.axis().unwrap(),
      child.numeric_axis.formatter_axis_binding(),
    ),
  )
  assert_true(
    physical_equal(
      old_minor_formatter.axis().unwrap(),
      child.numeric_axis.formatter_axis_binding(),
    ),
  )
}

///|
fn secondary_source_case_15() -> Unit raise {
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
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  @config.set_x_margin(0.05)
  @config.set_y_margin(0.05)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_text_usetex(false)
  let figure = figure(width=320, height=240)
  let parent = figure.axes()
  parent.set_x_scale(@scale.linear_scale())
  parent.set_xlim(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  let child = parent.secondary_xaxis(value => 2.0 * value + 5.0, value => {
    (value - 5.0) / 2.0
  })
  child.set_ticks([2.0, 3.0])
  child.set_locator(@ticker.FixedLocator::new([4.0, 7.0]).as_locator())
  child.set_minor_locator(@ticker.FixedLocator::new([5.0]).as_minor_locator())
  child.set_named_formatter(
    @ticker.FixedFormatter::new(["A", "B"]).as_base_formatter(),
  )
  child.set_minor_named_formatter(
    @ticker.FuncFormatter::new((_, _) => "minor").as_base_formatter(),
  )
  {
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    let view = child.numeric_axis.stored_view_limits()
    secondary_source_numbers([view.lower(), view.upper()], [
      0UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
    ])
    secondary_source_numbers(
      [
        child.numeric_axis.data_interval().lower(),
        child.numeric_axis.data_interval().upper(),
      ],
      [
        9218868437227405312UL.reinterpret_as_double(),
        18442240474082181120UL.reinterpret_as_double(),
      ],
    )
    secondary_source_double(
      child.numeric_axis.get_minpos(),
      9218868437227405312UL.reinterpret_as_double(),
    )
    secondary_source_double(
      child.get_tick_space(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    secondary_source_numbers(
      [child.formatter_geometry().0, child.formatter_geometry().1],
      [
        0UL.reinterpret_as_double(),
        4644337115725824000UL.reinterpret_as_double(),
      ],
    )
    assert_eq(child.numeric_axis.autoscale_on(), true)
    assert_eq(child.numeric_axis.autoscale_stale(), false)
    assert_eq(child.ticks_set, true)
    assert_eq(
      [
        secondary_source_major_class(child.numeric_axis.locator().unwrap()),
        secondary_source_minor_class(
          child.numeric_axis.minor_locator().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.named_formatter().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.minor_named_formatter().unwrap(),
        ),
      ],
      ["FixedLocator", "FixedLocator", "FixedFormatter", "FuncFormatter"],
    )
    assert_eq(
      [
        child.numeric_axis.is_default_locator(),
        child.numeric_axis.is_default_locator(minor=true),
        child.numeric_axis.is_default_formatter(),
        child.numeric_axis.is_default_formatter(minor=true),
      ],
      [false, false, false, false],
    )
    secondary_source_numbers(child.tick_values_checked(), [
      4616189618054758400UL.reinterpret_as_double(),
      4619567317775286272UL.reinterpret_as_double(),
    ])
    assert_true(
      physical_equal(
        child.numeric_axis.named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
    assert_true(
      physical_equal(
        child.numeric_axis.minor_named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
  }
  let old_major = child.numeric_axis.locator().unwrap()
  let old_minor = child.numeric_axis.minor_locator().unwrap()
  let old_major_formatter = child.numeric_axis.named_formatter().unwrap()
  let old_minor_formatter = child.numeric_axis.minor_named_formatter().unwrap()
  @config.set_minor_ticks_visible(true, horizontal=true)
  parent.set_x_scale(@scale.log_scale())
  parent.set_xlim(10.0, 20.0)
  child.prepare_draw()
  {
    assert_eq(child.parent_scale_name, Some("log"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "functionlog")
    let view = child.numeric_axis.stored_view_limits()
    secondary_source_numbers([view.lower(), view.upper()], [
      4627730092099895296UL.reinterpret_as_double(),
      4631530004285489152UL.reinterpret_as_double(),
    ])
    secondary_source_numbers(
      [
        child.numeric_axis.data_interval().lower(),
        child.numeric_axis.data_interval().upper(),
      ],
      [
        9218868437227405312UL.reinterpret_as_double(),
        18442240474082181120UL.reinterpret_as_double(),
      ],
    )
    secondary_source_double(
      child.numeric_axis.get_minpos(),
      9218868437227405312UL.reinterpret_as_double(),
    )
    secondary_source_double(
      child.get_tick_space(),
      4621819117588971520UL.reinterpret_as_double(),
    )
    secondary_source_numbers(
      [child.formatter_geometry().0, child.formatter_geometry().1],
      [
        0UL.reinterpret_as_double(),
        4644337115725824000UL.reinterpret_as_double(),
      ],
    )
    assert_eq(child.numeric_axis.autoscale_on(), false)
    assert_eq(child.numeric_axis.autoscale_stale(), false)
    assert_eq(child.ticks_set, true)
    assert_eq(
      [
        secondary_source_major_class(child.numeric_axis.locator().unwrap()),
        secondary_source_minor_class(
          child.numeric_axis.minor_locator().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.named_formatter().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.minor_named_formatter().unwrap(),
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
    secondary_source_numbers(child.tick_values_checked(), [
      4616189618054758400UL.reinterpret_as_double(),
      4619567317775286272UL.reinterpret_as_double(),
    ])
    assert_true(
      physical_equal(
        child.numeric_axis.named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
    assert_true(
      physical_equal(
        child.numeric_axis.minor_named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
  }
  assert_eq(
    [
      secondary_source_same_major(
        old_major,
        child.numeric_axis.locator().unwrap(),
      ),
      secondary_source_same_minor(
        old_minor,
        child.numeric_axis.minor_locator().unwrap(),
      ),
      physical_equal(
        old_major_formatter,
        child.numeric_axis.named_formatter().unwrap(),
      ),
      physical_equal(
        old_minor_formatter,
        child.numeric_axis.minor_named_formatter().unwrap(),
      ),
    ],
    [false, false, false, false],
  )
  assert_true(
    physical_equal(
      old_major_formatter.axis().unwrap(),
      child.numeric_axis.formatter_axis_binding(),
    ),
  )
  assert_true(
    physical_equal(
      old_minor_formatter.axis().unwrap(),
      child.numeric_axis.formatter_axis_binding(),
    ),
  )
}

///|
fn secondary_source_case_16() -> Unit raise {
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
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  @config.set_x_margin(0.05)
  @config.set_y_margin(0.05)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_text_usetex(false)
  let figure = figure(width=320, height=240)
  let parent = figure.axes()
  parent.set_y_scale(@scale.linear_scale())
  parent.set_ylim(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  let child = parent.secondary_yaxis(value => 2.0 * value + 5.0, value => {
    (value - 5.0) / 2.0
  })
  {
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    let view = child.numeric_axis.stored_view_limits()
    secondary_source_numbers([view.lower(), view.upper()], [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
    secondary_source_numbers(
      [
        child.numeric_axis.data_interval().lower(),
        child.numeric_axis.data_interval().upper(),
      ],
      [
        9218868437227405312UL.reinterpret_as_double(),
        18442240474082181120UL.reinterpret_as_double(),
      ],
    )
    secondary_source_double(
      child.numeric_axis.get_minpos(),
      9218868437227405312UL.reinterpret_as_double(),
    )
    secondary_source_double(
      child.get_tick_space(),
      4622382067542392832UL.reinterpret_as_double(),
    )
    secondary_source_numbers(
      [child.formatter_geometry().0, child.formatter_geometry().1],
      [
        4642648265865560064UL.reinterpret_as_double(),
        4642648265865560064UL.reinterpret_as_double(),
      ],
    )
    assert_eq(child.numeric_axis.autoscale_on(), true)
    assert_eq(child.numeric_axis.autoscale_stale(), false)
    assert_eq(child.ticks_set, false)
    assert_eq(
      [
        secondary_source_major_class(child.numeric_axis.locator().unwrap()),
        secondary_source_minor_class(
          child.numeric_axis.minor_locator().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.named_formatter().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.minor_named_formatter().unwrap(),
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
    secondary_source_numbers(child.tick_values_checked(), [
      0UL.reinterpret_as_double(),
      4596373779694328218UL.reinterpret_as_double(),
      4600877379321698714UL.reinterpret_as_double(),
      4603579539098121012UL.reinterpret_as_double(),
      4605380978949069210UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
    assert_true(
      physical_equal(
        child.numeric_axis.named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
    assert_true(
      physical_equal(
        child.numeric_axis.minor_named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
  }
  let old_major = child.numeric_axis.locator().unwrap()
  let old_minor = child.numeric_axis.minor_locator().unwrap()
  let old_major_formatter = child.numeric_axis.named_formatter().unwrap()
  let old_minor_formatter = child.numeric_axis.minor_named_formatter().unwrap()
  @config.set_minor_ticks_visible(true, horizontal=false)
  child.prepare_draw()
  {
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    let view = child.numeric_axis.stored_view_limits()
    secondary_source_numbers([view.lower(), view.upper()], [
      4627730092099895296UL.reinterpret_as_double(),
      4631530004285489152UL.reinterpret_as_double(),
    ])
    secondary_source_numbers(
      [
        child.numeric_axis.data_interval().lower(),
        child.numeric_axis.data_interval().upper(),
      ],
      [
        9218868437227405312UL.reinterpret_as_double(),
        18442240474082181120UL.reinterpret_as_double(),
      ],
    )
    secondary_source_double(
      child.numeric_axis.get_minpos(),
      9218868437227405312UL.reinterpret_as_double(),
    )
    secondary_source_double(
      child.get_tick_space(),
      4622382067542392832UL.reinterpret_as_double(),
    )
    secondary_source_numbers(
      [child.formatter_geometry().0, child.formatter_geometry().1],
      [
        4642648265865560064UL.reinterpret_as_double(),
        4642648265865560064UL.reinterpret_as_double(),
      ],
    )
    assert_eq(child.numeric_axis.autoscale_on(), false)
    assert_eq(child.numeric_axis.autoscale_stale(), false)
    assert_eq(child.ticks_set, false)
    assert_eq(
      [
        secondary_source_major_class(child.numeric_axis.locator().unwrap()),
        secondary_source_minor_class(
          child.numeric_axis.minor_locator().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.named_formatter().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.minor_named_formatter().unwrap(),
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
    secondary_source_numbers(child.tick_values_checked(), [
      4627730092099895296UL.reinterpret_as_double(),
      4628433779541671936UL.reinterpret_as_double(),
      4629137466983448576UL.reinterpret_as_double(),
      4629770785681047552UL.reinterpret_as_double(),
      4630122629401935872UL.reinterpret_as_double(),
      4630474473122824192UL.reinterpret_as_double(),
      4630826316843712512UL.reinterpret_as_double(),
      4631178160564600832UL.reinterpret_as_double(),
      4631530004285489152UL.reinterpret_as_double(),
    ])
    assert_true(
      physical_equal(
        child.numeric_axis.named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
    assert_true(
      physical_equal(
        child.numeric_axis.minor_named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
  }
  assert_eq(
    [
      secondary_source_same_major(
        old_major,
        child.numeric_axis.locator().unwrap(),
      ),
      secondary_source_same_minor(
        old_minor,
        child.numeric_axis.minor_locator().unwrap(),
      ),
      physical_equal(
        old_major_formatter,
        child.numeric_axis.named_formatter().unwrap(),
      ),
      physical_equal(
        old_minor_formatter,
        child.numeric_axis.minor_named_formatter().unwrap(),
      ),
    ],
    [true, true, true, true],
  )
  assert_true(
    physical_equal(
      old_major_formatter.axis().unwrap(),
      child.numeric_axis.formatter_axis_binding(),
    ),
  )
  assert_true(
    physical_equal(
      old_minor_formatter.axis().unwrap(),
      child.numeric_axis.formatter_axis_binding(),
    ),
  )
}

///|
fn secondary_source_case_17() -> Unit raise {
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
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  @config.set_x_margin(0.05)
  @config.set_y_margin(0.05)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_text_usetex(false)
  let figure = figure(width=320, height=240)
  let parent = figure.axes()
  parent.set_y_scale(@scale.linear_scale())
  parent.set_ylim(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  let child = parent.secondary_yaxis(value => 2.0 * value + 5.0, value => {
    (value - 5.0) / 2.0
  })
  child.set_locator(@ticker.FixedLocator::new([4.0, 7.0]).as_locator())
  child.set_minor_locator(@ticker.FixedLocator::new([5.0]).as_minor_locator())
  child.set_named_formatter(
    @ticker.FixedFormatter::new(["A", "B"]).as_base_formatter(),
  )
  child.set_minor_named_formatter(
    @ticker.FuncFormatter::new((_, _) => "minor").as_base_formatter(),
  )
  {
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    let view = child.numeric_axis.stored_view_limits()
    secondary_source_numbers([view.lower(), view.upper()], [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
    secondary_source_numbers(
      [
        child.numeric_axis.data_interval().lower(),
        child.numeric_axis.data_interval().upper(),
      ],
      [
        9218868437227405312UL.reinterpret_as_double(),
        18442240474082181120UL.reinterpret_as_double(),
      ],
    )
    secondary_source_double(
      child.numeric_axis.get_minpos(),
      9218868437227405312UL.reinterpret_as_double(),
    )
    secondary_source_double(
      child.get_tick_space(),
      4622382067542392832UL.reinterpret_as_double(),
    )
    secondary_source_numbers(
      [child.formatter_geometry().0, child.formatter_geometry().1],
      [
        4642648265865560064UL.reinterpret_as_double(),
        4642648265865560064UL.reinterpret_as_double(),
      ],
    )
    assert_eq(child.numeric_axis.autoscale_on(), true)
    assert_eq(child.numeric_axis.autoscale_stale(), false)
    assert_eq(child.ticks_set, false)
    assert_eq(
      [
        secondary_source_major_class(child.numeric_axis.locator().unwrap()),
        secondary_source_minor_class(
          child.numeric_axis.minor_locator().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.named_formatter().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.minor_named_formatter().unwrap(),
        ),
      ],
      ["FixedLocator", "FixedLocator", "FixedFormatter", "FuncFormatter"],
    )
    assert_eq(
      [
        child.numeric_axis.is_default_locator(),
        child.numeric_axis.is_default_locator(minor=true),
        child.numeric_axis.is_default_formatter(),
        child.numeric_axis.is_default_formatter(minor=true),
      ],
      [false, false, false, false],
    )
    secondary_source_numbers(child.tick_values_checked(), [
      4616189618054758400UL.reinterpret_as_double(),
      4619567317775286272UL.reinterpret_as_double(),
    ])
    assert_true(
      physical_equal(
        child.numeric_axis.named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
    assert_true(
      physical_equal(
        child.numeric_axis.minor_named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
  }
  let old_major = child.numeric_axis.locator().unwrap()
  let old_minor = child.numeric_axis.minor_locator().unwrap()
  let old_major_formatter = child.numeric_axis.named_formatter().unwrap()
  let old_minor_formatter = child.numeric_axis.minor_named_formatter().unwrap()
  @config.set_minor_ticks_visible(true, horizontal=false)
  parent.set_y_scale(@scale.symlog_scale(linthresh=2.0))
  parent.set_ylim(10.0, 20.0)
  child.prepare_draw()
  {
    assert_eq(child.parent_scale_name, Some("symlog"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    let view = child.numeric_axis.stored_view_limits()
    secondary_source_numbers([view.lower(), view.upper()], [
      4627730092099895296UL.reinterpret_as_double(),
      4631530004285489152UL.reinterpret_as_double(),
    ])
    secondary_source_numbers(
      [
        child.numeric_axis.data_interval().lower(),
        child.numeric_axis.data_interval().upper(),
      ],
      [
        9218868437227405312UL.reinterpret_as_double(),
        18442240474082181120UL.reinterpret_as_double(),
      ],
    )
    secondary_source_double(
      child.numeric_axis.get_minpos(),
      9218868437227405312UL.reinterpret_as_double(),
    )
    secondary_source_double(
      child.get_tick_space(),
      4622382067542392832UL.reinterpret_as_double(),
    )
    secondary_source_numbers(
      [child.formatter_geometry().0, child.formatter_geometry().1],
      [
        4642648265865560064UL.reinterpret_as_double(),
        4642648265865560064UL.reinterpret_as_double(),
      ],
    )
    assert_eq(child.numeric_axis.autoscale_on(), false)
    assert_eq(child.numeric_axis.autoscale_stale(), false)
    assert_eq(child.ticks_set, false)
    assert_eq(
      [
        secondary_source_major_class(child.numeric_axis.locator().unwrap()),
        secondary_source_minor_class(
          child.numeric_axis.minor_locator().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.named_formatter().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.minor_named_formatter().unwrap(),
        ),
      ],
      ["AutoLocator", "AutoMinorLocator", "ScalarFormatter", "NullFormatter"],
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
    secondary_source_numbers(child.tick_values_checked(), [
      4627730092099895296UL.reinterpret_as_double(),
      4628433779541671936UL.reinterpret_as_double(),
      4629137466983448576UL.reinterpret_as_double(),
      4629770785681047552UL.reinterpret_as_double(),
      4630122629401935872UL.reinterpret_as_double(),
      4630474473122824192UL.reinterpret_as_double(),
      4630826316843712512UL.reinterpret_as_double(),
      4631178160564600832UL.reinterpret_as_double(),
      4631530004285489152UL.reinterpret_as_double(),
    ])
    assert_true(
      physical_equal(
        child.numeric_axis.named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
    assert_true(
      physical_equal(
        child.numeric_axis.minor_named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
  }
  assert_eq(
    [
      secondary_source_same_major(
        old_major,
        child.numeric_axis.locator().unwrap(),
      ),
      secondary_source_same_minor(
        old_minor,
        child.numeric_axis.minor_locator().unwrap(),
      ),
      physical_equal(
        old_major_formatter,
        child.numeric_axis.named_formatter().unwrap(),
      ),
      physical_equal(
        old_minor_formatter,
        child.numeric_axis.minor_named_formatter().unwrap(),
      ),
    ],
    [false, false, false, false],
  )
  assert_true(
    physical_equal(
      old_major_formatter.axis().unwrap(),
      child.numeric_axis.formatter_axis_binding(),
    ),
  )
  assert_true(
    physical_equal(
      old_minor_formatter.axis().unwrap(),
      child.numeric_axis.formatter_axis_binding(),
    ),
  )
}

///|
fn secondary_source_case_18() -> Unit raise {
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
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  @config.set_x_margin(0.05)
  @config.set_y_margin(0.05)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_text_usetex(false)
  let figure = figure(width=320, height=240)
  let parent = figure.axes()
  parent.set_y_scale(@scale.linear_scale())
  parent.set_ylim(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  let child = parent.secondary_yaxis(value => 2.0 * value + 5.0, value => {
    (value - 5.0) / 2.0
  })
  child.set_locator(@ticker.FixedLocator::new([4.0, 7.0]).as_locator())
  child.set_minor_locator(@ticker.FixedLocator::new([5.0]).as_minor_locator())
  child.set_named_formatter(
    @ticker.FixedFormatter::new(["A", "B"]).as_base_formatter(),
  )
  child.set_minor_named_formatter(
    @ticker.FuncFormatter::new((_, _) => "minor").as_base_formatter(),
  )
  {
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    let view = child.numeric_axis.stored_view_limits()
    secondary_source_numbers([view.lower(), view.upper()], [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
    secondary_source_numbers(
      [
        child.numeric_axis.data_interval().lower(),
        child.numeric_axis.data_interval().upper(),
      ],
      [
        9218868437227405312UL.reinterpret_as_double(),
        18442240474082181120UL.reinterpret_as_double(),
      ],
    )
    secondary_source_double(
      child.numeric_axis.get_minpos(),
      9218868437227405312UL.reinterpret_as_double(),
    )
    secondary_source_double(
      child.get_tick_space(),
      4622382067542392832UL.reinterpret_as_double(),
    )
    secondary_source_numbers(
      [child.formatter_geometry().0, child.formatter_geometry().1],
      [
        4642648265865560064UL.reinterpret_as_double(),
        4642648265865560064UL.reinterpret_as_double(),
      ],
    )
    assert_eq(child.numeric_axis.autoscale_on(), true)
    assert_eq(child.numeric_axis.autoscale_stale(), false)
    assert_eq(child.ticks_set, false)
    assert_eq(
      [
        secondary_source_major_class(child.numeric_axis.locator().unwrap()),
        secondary_source_minor_class(
          child.numeric_axis.minor_locator().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.named_formatter().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.minor_named_formatter().unwrap(),
        ),
      ],
      ["FixedLocator", "FixedLocator", "FixedFormatter", "FuncFormatter"],
    )
    assert_eq(
      [
        child.numeric_axis.is_default_locator(),
        child.numeric_axis.is_default_locator(minor=true),
        child.numeric_axis.is_default_formatter(),
        child.numeric_axis.is_default_formatter(minor=true),
      ],
      [false, false, false, false],
    )
    secondary_source_numbers(child.tick_values_checked(), [
      4616189618054758400UL.reinterpret_as_double(),
      4619567317775286272UL.reinterpret_as_double(),
    ])
    assert_true(
      physical_equal(
        child.numeric_axis.named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
    assert_true(
      physical_equal(
        child.numeric_axis.minor_named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
  }
  let old_major = child.numeric_axis.locator().unwrap()
  let old_minor = child.numeric_axis.minor_locator().unwrap()
  let old_major_formatter = child.numeric_axis.named_formatter().unwrap()
  let old_minor_formatter = child.numeric_axis.minor_named_formatter().unwrap()
  @config.set_minor_ticks_visible(true, horizontal=false)
  parent.set_y_scale(@scale.log_scale())
  parent.set_ylim(10.0, 20.0)
  child.prepare_draw()
  {
    assert_eq(child.parent_scale_name, Some("log"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "functionlog")
    let view = child.numeric_axis.stored_view_limits()
    secondary_source_numbers([view.lower(), view.upper()], [
      4627730092099895296UL.reinterpret_as_double(),
      4631530004285489152UL.reinterpret_as_double(),
    ])
    secondary_source_numbers(
      [
        child.numeric_axis.data_interval().lower(),
        child.numeric_axis.data_interval().upper(),
      ],
      [
        9218868437227405312UL.reinterpret_as_double(),
        18442240474082181120UL.reinterpret_as_double(),
      ],
    )
    secondary_source_double(
      child.numeric_axis.get_minpos(),
      9218868437227405312UL.reinterpret_as_double(),
    )
    secondary_source_double(
      child.get_tick_space(),
      4622382067542392832UL.reinterpret_as_double(),
    )
    secondary_source_numbers(
      [child.formatter_geometry().0, child.formatter_geometry().1],
      [
        4642648265865560064UL.reinterpret_as_double(),
        4642648265865560064UL.reinterpret_as_double(),
      ],
    )
    assert_eq(child.numeric_axis.autoscale_on(), false)
    assert_eq(child.numeric_axis.autoscale_stale(), false)
    assert_eq(child.ticks_set, false)
    assert_eq(
      [
        secondary_source_major_class(child.numeric_axis.locator().unwrap()),
        secondary_source_minor_class(
          child.numeric_axis.minor_locator().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.named_formatter().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.minor_named_formatter().unwrap(),
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
    secondary_source_numbers(child.tick_values_checked(), [
      4621819117588971520UL.reinterpret_as_double(),
      4636737291354636288UL.reinterpret_as_double(),
    ])
    assert_true(
      physical_equal(
        child.numeric_axis.named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
    assert_true(
      physical_equal(
        child.numeric_axis.minor_named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
  }
  assert_eq(
    [
      secondary_source_same_major(
        old_major,
        child.numeric_axis.locator().unwrap(),
      ),
      secondary_source_same_minor(
        old_minor,
        child.numeric_axis.minor_locator().unwrap(),
      ),
      physical_equal(
        old_major_formatter,
        child.numeric_axis.named_formatter().unwrap(),
      ),
      physical_equal(
        old_minor_formatter,
        child.numeric_axis.minor_named_formatter().unwrap(),
      ),
    ],
    [false, false, false, false],
  )
  assert_true(
    physical_equal(
      old_major_formatter.axis().unwrap(),
      child.numeric_axis.formatter_axis_binding(),
    ),
  )
  assert_true(
    physical_equal(
      old_minor_formatter.axis().unwrap(),
      child.numeric_axis.formatter_axis_binding(),
    ),
  )
}

///|
fn secondary_source_case_19() -> Unit raise {
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
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  @config.set_x_margin(0.05)
  @config.set_y_margin(0.05)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_text_usetex(false)
  let figure = figure(width=320, height=240)
  let parent = figure.axes()
  parent.set_y_scale(@scale.linear_scale())
  parent.set_ylim(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  let child = parent.secondary_yaxis(value => 2.0 * value + 5.0, value => {
    (value - 5.0) / 2.0
  })
  child.set_ticks([2.0, 3.0])
  child.set_locator(@ticker.FixedLocator::new([4.0, 7.0]).as_locator())
  child.set_minor_locator(@ticker.FixedLocator::new([5.0]).as_minor_locator())
  child.set_named_formatter(
    @ticker.FixedFormatter::new(["A", "B"]).as_base_formatter(),
  )
  child.set_minor_named_formatter(
    @ticker.FuncFormatter::new((_, _) => "minor").as_base_formatter(),
  )
  {
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    let view = child.numeric_axis.stored_view_limits()
    secondary_source_numbers([view.lower(), view.upper()], [
      0UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
    ])
    secondary_source_numbers(
      [
        child.numeric_axis.data_interval().lower(),
        child.numeric_axis.data_interval().upper(),
      ],
      [
        9218868437227405312UL.reinterpret_as_double(),
        18442240474082181120UL.reinterpret_as_double(),
      ],
    )
    secondary_source_double(
      child.numeric_axis.get_minpos(),
      9218868437227405312UL.reinterpret_as_double(),
    )
    secondary_source_double(
      child.get_tick_space(),
      4622382067542392832UL.reinterpret_as_double(),
    )
    secondary_source_numbers(
      [child.formatter_geometry().0, child.formatter_geometry().1],
      [
        4642648265865560064UL.reinterpret_as_double(),
        4642648265865560064UL.reinterpret_as_double(),
      ],
    )
    assert_eq(child.numeric_axis.autoscale_on(), true)
    assert_eq(child.numeric_axis.autoscale_stale(), false)
    assert_eq(child.ticks_set, true)
    assert_eq(
      [
        secondary_source_major_class(child.numeric_axis.locator().unwrap()),
        secondary_source_minor_class(
          child.numeric_axis.minor_locator().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.named_formatter().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.minor_named_formatter().unwrap(),
        ),
      ],
      ["FixedLocator", "FixedLocator", "FixedFormatter", "FuncFormatter"],
    )
    assert_eq(
      [
        child.numeric_axis.is_default_locator(),
        child.numeric_axis.is_default_locator(minor=true),
        child.numeric_axis.is_default_formatter(),
        child.numeric_axis.is_default_formatter(minor=true),
      ],
      [false, false, false, false],
    )
    secondary_source_numbers(child.tick_values_checked(), [
      4616189618054758400UL.reinterpret_as_double(),
      4619567317775286272UL.reinterpret_as_double(),
    ])
    assert_true(
      physical_equal(
        child.numeric_axis.named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
    assert_true(
      physical_equal(
        child.numeric_axis.minor_named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
  }
  let old_major = child.numeric_axis.locator().unwrap()
  let old_minor = child.numeric_axis.minor_locator().unwrap()
  let old_major_formatter = child.numeric_axis.named_formatter().unwrap()
  let old_minor_formatter = child.numeric_axis.minor_named_formatter().unwrap()
  @config.set_minor_ticks_visible(true, horizontal=false)
  parent.set_y_scale(@scale.log_scale())
  parent.set_ylim(10.0, 20.0)
  child.prepare_draw()
  {
    assert_eq(child.parent_scale_name, Some("log"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "functionlog")
    let view = child.numeric_axis.stored_view_limits()
    secondary_source_numbers([view.lower(), view.upper()], [
      4627730092099895296UL.reinterpret_as_double(),
      4631530004285489152UL.reinterpret_as_double(),
    ])
    secondary_source_numbers(
      [
        child.numeric_axis.data_interval().lower(),
        child.numeric_axis.data_interval().upper(),
      ],
      [
        9218868437227405312UL.reinterpret_as_double(),
        18442240474082181120UL.reinterpret_as_double(),
      ],
    )
    secondary_source_double(
      child.numeric_axis.get_minpos(),
      9218868437227405312UL.reinterpret_as_double(),
    )
    secondary_source_double(
      child.get_tick_space(),
      4622382067542392832UL.reinterpret_as_double(),
    )
    secondary_source_numbers(
      [child.formatter_geometry().0, child.formatter_geometry().1],
      [
        4642648265865560064UL.reinterpret_as_double(),
        4642648265865560064UL.reinterpret_as_double(),
      ],
    )
    assert_eq(child.numeric_axis.autoscale_on(), false)
    assert_eq(child.numeric_axis.autoscale_stale(), false)
    assert_eq(child.ticks_set, true)
    assert_eq(
      [
        secondary_source_major_class(child.numeric_axis.locator().unwrap()),
        secondary_source_minor_class(
          child.numeric_axis.minor_locator().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.named_formatter().unwrap(),
        ),
        secondary_source_formatter_class(
          child.numeric_axis.minor_named_formatter().unwrap(),
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
    secondary_source_numbers(child.tick_values_checked(), [
      4616189618054758400UL.reinterpret_as_double(),
      4619567317775286272UL.reinterpret_as_double(),
    ])
    assert_true(
      physical_equal(
        child.numeric_axis.named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
    assert_true(
      physical_equal(
        child.numeric_axis.minor_named_formatter().unwrap().axis().unwrap(),
        child.numeric_axis.formatter_axis_binding(),
      ),
    )
  }
  assert_eq(
    [
      secondary_source_same_major(
        old_major,
        child.numeric_axis.locator().unwrap(),
      ),
      secondary_source_same_minor(
        old_minor,
        child.numeric_axis.minor_locator().unwrap(),
      ),
      physical_equal(
        old_major_formatter,
        child.numeric_axis.named_formatter().unwrap(),
      ),
      physical_equal(
        old_minor_formatter,
        child.numeric_axis.minor_named_formatter().unwrap(),
      ),
    ],
    [false, false, false, false],
  )
  assert_true(
    physical_equal(
      old_major_formatter.axis().unwrap(),
      child.numeric_axis.formatter_axis_binding(),
    ),
  )
  assert_true(
    physical_equal(
      old_minor_formatter.axis().unwrap(),
      child.numeric_axis.formatter_axis_binding(),
    ),
  )
}

///|
fn secondary_source_case_20() -> Unit raise {
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
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  @config.set_x_margin(0.05)
  @config.set_y_margin(0.05)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_text_usetex(false)
  let figure = figure(width=320, height=240)
  let parent = figure.axes()
  parent.set_x_scale(@scale.linear_scale())
  parent.set_xlim(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  let child = parent.secondary_xaxis(value => -value, value => -value)
  parent
  .x_axis()
  .bind_formatter_geometry(() => {
    (0UL.reinterpret_as_double(), 4638707616191610880UL.reinterpret_as_double())
  })
  child.synchronize_formatter_frame()
  assert_eq(child.parent_scale_name, Some("linear"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
  let view = child.numeric_axis.stored_view_limits()
  secondary_source_numbers([view.lower(), view.upper()], [
    13849694754071117824UL.reinterpret_as_double(),
    13845191154443747328UL.reinterpret_as_double(),
  ])
  secondary_source_numbers(
    [
      child.numeric_axis.data_interval().lower(),
      child.numeric_axis.data_interval().upper(),
    ],
    [
      9218868437227405312UL.reinterpret_as_double(),
      18442240474082181120UL.reinterpret_as_double(),
    ],
  )
  secondary_source_double(
    child.numeric_axis.get_minpos(),
    9218868437227405312UL.reinterpret_as_double(),
  )
  secondary_source_double(
    child.get_tick_space(),
    4616189618054758400UL.reinterpret_as_double(),
  )
  secondary_source_numbers(
    [child.formatter_geometry().0, child.formatter_geometry().1],
    [0UL.reinterpret_as_double(), 4638707616191610880UL.reinterpret_as_double()],
  )
  assert_eq(child.numeric_axis.autoscale_on(), false)
  assert_eq(child.numeric_axis.autoscale_stale(), false)
  assert_eq(child.ticks_set, false)
  assert_eq(
    [
      secondary_source_major_class(child.numeric_axis.locator().unwrap()),
      secondary_source_minor_class(child.numeric_axis.minor_locator().unwrap()),
      secondary_source_formatter_class(
        child.numeric_axis.named_formatter().unwrap(),
      ),
      secondary_source_formatter_class(
        child.numeric_axis.minor_named_formatter().unwrap(),
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
  secondary_source_numbers(child.tick_values_checked(), [
    13849694754071117824UL.reinterpret_as_double(),
    13848991066629341184UL.reinterpret_as_double(),
    13848005904210853888UL.reinterpret_as_double(),
    13846598529327300608UL.reinterpret_as_double(),
    13845191154443747328UL.reinterpret_as_double(),
  ])
  assert_true(
    physical_equal(
      child.numeric_axis.named_formatter().unwrap().axis().unwrap(),
      child.numeric_axis.formatter_axis_binding(),
    ),
  )
  assert_true(
    physical_equal(
      child.numeric_axis.minor_named_formatter().unwrap().axis().unwrap(),
      child.numeric_axis.formatter_axis_binding(),
    ),
  )
}

///|
fn secondary_source_case_21() -> Unit raise {
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
    @config.set_formatter_use_offset(previous.formatter_use_offset())
    @config.set_formatter_use_math_text(previous.formatter_use_math_text())
    @config.set_formatter_use_locale(previous.formatter_use_locale())
    @config.set_text_usetex(previous.text_usetex())
  }
  @config.set_minor_ticks_visible(false)
  @config.set_minor_ticks_visible(false, horizontal=false)
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  @config.set_x_margin(0.05)
  @config.set_y_margin(0.05)
  @config.set_formatter_use_offset(true)
  @config.set_formatter_use_math_text(false)
  @config.set_formatter_use_locale(false)
  @config.set_text_usetex(false)
  let figure = figure(width=320, height=240)
  let parent = figure.axes()
  parent.set_x_scale(@scale.linear_scale())
  parent.set_xlim(
    4626322717216342016UL.reinterpret_as_double(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  let child = parent.secondary_xaxis(value => -value, value => -value)
  parent
  .x_axis()
  .bind_formatter_geometry(() => {
    (0UL.reinterpret_as_double(), 4638707616191610880UL.reinterpret_as_double())
  })
  child.synchronize_formatter_frame()
  assert_eq(child.parent_scale_name, Some("linear"))
  assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
  let view = child.numeric_axis.stored_view_limits()
  secondary_source_numbers([view.lower(), view.upper()], [
    13845191154443747328UL.reinterpret_as_double(),
    13849694754071117824UL.reinterpret_as_double(),
  ])
  secondary_source_numbers(
    [
      child.numeric_axis.data_interval().lower(),
      child.numeric_axis.data_interval().upper(),
    ],
    [
      9218868437227405312UL.reinterpret_as_double(),
      18442240474082181120UL.reinterpret_as_double(),
    ],
  )
  secondary_source_double(
    child.numeric_axis.get_minpos(),
    9218868437227405312UL.reinterpret_as_double(),
  )
  secondary_source_double(
    child.get_tick_space(),
    4616189618054758400UL.reinterpret_as_double(),
  )
  secondary_source_numbers(
    [child.formatter_geometry().0, child.formatter_geometry().1],
    [0UL.reinterpret_as_double(), 4638707616191610880UL.reinterpret_as_double()],
  )
  assert_eq(child.numeric_axis.autoscale_on(), false)
  assert_eq(child.numeric_axis.autoscale_stale(), false)
  assert_eq(child.ticks_set, false)
  assert_eq(
    [
      secondary_source_major_class(child.numeric_axis.locator().unwrap()),
      secondary_source_minor_class(child.numeric_axis.minor_locator().unwrap()),
      secondary_source_formatter_class(
        child.numeric_axis.named_formatter().unwrap(),
      ),
      secondary_source_formatter_class(
        child.numeric_axis.minor_named_formatter().unwrap(),
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
  secondary_source_numbers(child.tick_values_checked(), [
    13849694754071117824UL.reinterpret_as_double(),
    13848991066629341184UL.reinterpret_as_double(),
    13848005904210853888UL.reinterpret_as_double(),
    13846598529327300608UL.reinterpret_as_double(),
    13845191154443747328UL.reinterpret_as_double(),
  ])
  assert_true(
    physical_equal(
      child.numeric_axis.named_formatter().unwrap().axis().unwrap(),
      child.numeric_axis.formatter_axis_binding(),
    ),
  )
  assert_true(
    physical_equal(
      child.numeric_axis.minor_named_formatter().unwrap().axis().unwrap(),
      child.numeric_axis.formatter_axis_binding(),
    ),
  )
}

///|
test "original secondary lifecycle group 0" {
  secondary_source_case_0() catch {
    error =>
      fail(
        "secondary source case 0 [complete numeric lifecycle x/linear]: " +
        error.to_string(),
      )
  }
  secondary_source_case_1() catch {
    error =>
      fail(
        "secondary source case 1 [complete numeric lifecycle x/log]: " +
        error.to_string(),
      )
  }
  secondary_source_case_2() catch {
    error =>
      fail(
        "secondary source case 2 [complete numeric lifecycle x/symlog]: " +
        error.to_string(),
      )
  }
  secondary_source_case_3() catch {
    error =>
      fail(
        "secondary source case 3 [complete numeric lifecycle x/asinh]: " +
        error.to_string(),
      )
  }
  secondary_source_case_4() catch {
    error =>
      fail(
        "secondary source case 4 [complete numeric lifecycle x/logit]: " +
        error.to_string(),
      )
  }
  secondary_source_case_5() catch {
    error =>
      fail(
        "secondary source case 5 [complete numeric lifecycle y/linear]: " +
        error.to_string(),
      )
  }
  secondary_source_case_6() catch {
    error =>
      fail(
        "secondary source case 6 [complete numeric lifecycle y/log]: " +
        error.to_string(),
      )
  }
  secondary_source_case_7() catch {
    error =>
      fail(
        "secondary source case 7 [complete numeric lifecycle y/symlog]: " +
        error.to_string(),
      )
  }
  secondary_source_case_8() catch {
    error =>
      fail(
        "secondary source case 8 [complete numeric lifecycle y/asinh]: " +
        error.to_string(),
      )
  }
  secondary_source_case_9() catch {
    error =>
      fail(
        "secondary source case 9 [complete numeric lifecycle y/logit]: " +
        error.to_string(),
      )
  }
  secondary_source_case_10() catch {
    error =>
      fail(
        "secondary source case 10 [name-changing draw uses old Fixed nonsingular on constant endpoints]: " +
        error.to_string(),
      )
  }
  secondary_source_case_11() catch {
    error =>
      fail(
        "secondary source case 11 [name-changing draw finite validation fails before scale installation]: " +
        error.to_string(),
      )
  }
  secondary_source_case_12() catch {
    error =>
      fail(
        "secondary source case 12 [source slot/latch x/same_name_rc]: " +
        error.to_string(),
      )
  }
  secondary_source_case_13() catch {
    error =>
      fail(
        "secondary source case 13 [source slot/latch x/changed_nonlog_rc]: " +
        error.to_string(),
      )
  }
  secondary_source_case_14() catch {
    error =>
      fail(
        "secondary source case 14 [source slot/latch x/changed_no_latch]: " +
        error.to_string(),
      )
  }
  secondary_source_case_15() catch {
    error =>
      fail(
        "secondary source case 15 [source slot/latch x/latched_current_custom]: " +
        error.to_string(),
      )
  }
  secondary_source_case_16() catch {
    error =>
      fail(
        "secondary source case 16 [source slot/latch y/same_name_rc]: " +
        error.to_string(),
      )
  }
  secondary_source_case_17() catch {
    error =>
      fail(
        "secondary source case 17 [source slot/latch y/changed_nonlog_rc]: " +
        error.to_string(),
      )
  }
  secondary_source_case_18() catch {
    error =>
      fail(
        "secondary source case 18 [source slot/latch y/changed_no_latch]: " +
        error.to_string(),
      )
  }
  secondary_source_case_19() catch {
    error =>
      fail(
        "secondary source case 19 [source slot/latch y/latched_current_custom]: " +
        error.to_string(),
      )
  }
  secondary_source_case_20() catch {
    error =>
      fail(
        "secondary source case 20 [actual decreasing transData positions False]: " +
        error.to_string(),
      )
  }
  secondary_source_case_21() catch {
    error =>
      fail(
        "secondary source case 21 [actual decreasing transData positions True]: " +
        error.to_string(),
      )
  }
}
