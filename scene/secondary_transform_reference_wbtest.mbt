// Generated from pinned original secondary location-transform profiles source; do not edit.

///|
fn secondary_transform_source_double(
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
fn secondary_transform_source_numbers(
  actual : Array[Double],
  expected : Array[Double],
) -> Unit raise {
  assert_eq(actual.length(), expected.length())
  for i in 0..<actual.length() {
    secondary_transform_source_double(actual[i], expected[i])
  }
}

///|
fn secondary_transform_source_major_class(value : @ticker.Locator) -> String {
  match value {
    @ticker.Locator::NamedAuto(_) => "AutoLocator"
    @ticker.Locator::NamedLog(_) => "LogLocator"
    @ticker.Locator::NamedFixed(_) => "FixedLocator"
    @ticker.Locator::Null(_) => "NullLocator"
    _ => "other"
  }
}

///|
fn secondary_transform_source_minor_class(
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
fn secondary_transform_source_formatter_class(
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
fn secondary_transform_source_case_0() -> Unit raise {
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
  let parent = fig.add_axes(0.2, 0.25, 0.5, 0.5)
  parent.set_xlim(1.0, 4.0)
  parent.set_ylim(10.0, 20.0)
  let child = parent.secondary_xaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Position(0.25),
    transform=None,
  )
  {
    secondary_transform_source_double(
      child.position(),
      4598175219545276416UL.reinterpret_as_double(),
    )
    guard child.location() is SecondaryAxisLocation::Position(raw_location) else {
      fail("expected numeric location")
    }
    secondary_transform_source_double(
      raw_location,
      4598175219545276416UL.reinterpret_as_double(),
    )
    assert_true(child.alignment() is SecondaryAxisAlignment::Bottom)
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    {
      let view = child.numeric_axis.stored_view_limits()
      secondary_transform_source_numbers([view.lower(), view.upper()], [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ])
    }
    let box = child.display_bounds()
    secondary_transform_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        0UL.reinterpret_as_double(),
        4642648265865560064UL.reinterpret_as_double(),
        4644337115725824000UL.reinterpret_as_double(),
        4582574750436065280UL.reinterpret_as_double(),
      ],
    )
  }
  child.positioned_aspect(64.0, 60.0, 160.0, 120.0)
  {
    secondary_transform_source_double(
      child.position(),
      4598175219545276416UL.reinterpret_as_double(),
    )
    guard child.location() is SecondaryAxisLocation::Position(raw_location) else {
      fail("expected numeric location")
    }
    secondary_transform_source_double(
      raw_location,
      4598175219545276416UL.reinterpret_as_double(),
    )
    assert_true(child.alignment() is SecondaryAxisAlignment::Bottom)
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    {
      let view = child.numeric_axis.stored_view_limits()
      secondary_transform_source_numbers([view.lower(), view.upper()], [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ])
    }
    let box = child.display_bounds()
    secondary_transform_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        4634204016564240384UL.reinterpret_as_double(),
        4636033603912859648UL.reinterpret_as_double(),
        4639833516098453504UL.reinterpret_as_double(),
        4488335184751493120UL.reinterpret_as_double(),
      ],
    )
  }
  secondary_transform_source_double(
    child.location_locator.position,
    4598175219545276416UL.reinterpret_as_double(),
  )
  assert_true(child.location_locator.transform is None)
}

///|
fn secondary_transform_source_case_1() -> Unit raise {
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
  let parent = fig.add_axes(0.2, 0.25, 0.5, 0.5)
  parent.set_xlim(1.0, 4.0)
  parent.set_ylim(10.0, 20.0)
  let child = parent.secondary_xaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Position(0.25),
    transform=Some(
      @transforms.affine_from_values(
        4607182418800017408UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4624633867356078080UL.reinterpret_as_double(),
        4627730092099895296UL.reinterpret_as_double(),
      ),
    ),
  )
  {
    secondary_transform_source_double(
      child.position(),
      4598175219545276416UL.reinterpret_as_double(),
    )
    guard child.location() is SecondaryAxisLocation::Position(raw_location) else {
      fail("expected numeric location")
    }
    secondary_transform_source_double(
      raw_location,
      4598175219545276416UL.reinterpret_as_double(),
    )
    assert_true(child.alignment() is SecondaryAxisAlignment::Bottom)
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    {
      let view = child.numeric_axis.stored_view_limits()
      secondary_transform_source_numbers([view.lower(), view.upper()], [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ])
    }
    let box = child.display_bounds()
    secondary_transform_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        0UL.reinterpret_as_double(),
        4642648265865560064UL.reinterpret_as_double(),
        4644337115725824000UL.reinterpret_as_double(),
        4582574750436065280UL.reinterpret_as_double(),
      ],
    )
  }
  child.positioned_aspect(64.0, 60.0, 160.0, 120.0)
  {
    secondary_transform_source_double(
      child.position(),
      4598175219545276416UL.reinterpret_as_double(),
    )
    guard child.location() is SecondaryAxisLocation::Position(raw_location) else {
      fail("expected numeric location")
    }
    secondary_transform_source_double(
      raw_location,
      4598175219545276416UL.reinterpret_as_double(),
    )
    assert_true(child.alignment() is SecondaryAxisAlignment::Bottom)
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    {
      let view = child.numeric_axis.stored_view_limits()
      secondary_transform_source_numbers([view.lower(), view.upper()], [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ])
    }
    let box = child.display_bounds()
    secondary_transform_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        4634204016564240384UL.reinterpret_as_double(),
        4627800460844072960UL.reinterpret_as_double(),
        4639833516098453504UL.reinterpret_as_double(),
        4457293695166709760UL.reinterpret_as_double(),
      ],
    )
  }
  secondary_transform_source_double(
    child.location_locator.position,
    4598175219545276416UL.reinterpret_as_double(),
  )
  let installed = child.location_locator.transform.unwrap()
  secondary_transform_source_numbers(
    [
      installed.a,
      installed.b,
      installed.c,
      installed.d,
      installed.e,
      installed.f,
    ],
    [
      4607182418800017408UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4624633867356078080UL.reinterpret_as_double(),
      4627730092099895296UL.reinterpret_as_double(),
    ],
  )
}

///|
fn secondary_transform_source_case_2() -> Unit raise {
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
  let parent = fig.add_axes(0.2, 0.25, 0.5, 0.5)
  parent.set_xlim(1.0, 4.0)
  parent.set_ylim(10.0, 20.0)
  let child = parent.secondary_xaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Position(0.25),
    transform=Some(
      @transforms.affine_from_values(
        4611686018427387904UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
      ),
    ),
  )
  {
    secondary_transform_source_double(
      child.position(),
      4598175219545276416UL.reinterpret_as_double(),
    )
    guard child.location() is SecondaryAxisLocation::Position(raw_location) else {
      fail("expected numeric location")
    }
    secondary_transform_source_double(
      raw_location,
      4598175219545276416UL.reinterpret_as_double(),
    )
    assert_true(child.alignment() is SecondaryAxisAlignment::Bottom)
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    {
      let view = child.numeric_axis.stored_view_limits()
      secondary_transform_source_numbers([view.lower(), view.upper()], [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ])
    }
    let box = child.display_bounds()
    secondary_transform_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        0UL.reinterpret_as_double(),
        4642648265865560064UL.reinterpret_as_double(),
        4644337115725824000UL.reinterpret_as_double(),
        4582574750436065280UL.reinterpret_as_double(),
      ],
    )
  }
  child.positioned_aspect(64.0, 60.0, 160.0, 120.0)
  {
    secondary_transform_source_double(
      child.position(),
      4598175219545276416UL.reinterpret_as_double(),
    )
    guard child.location() is SecondaryAxisLocation::Position(raw_location) else {
      fail("expected numeric location")
    }
    secondary_transform_source_double(
      raw_location,
      4598175219545276416UL.reinterpret_as_double(),
    )
    assert_true(child.alignment() is SecondaryAxisAlignment::Bottom)
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    {
      let view = child.numeric_axis.stored_view_limits()
      secondary_transform_source_numbers([view.lower(), view.upper()], [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ])
    }
    let box = child.display_bounds()
    secondary_transform_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        4634204016564240384UL.reinterpret_as_double(),
        4604930618986332160UL.reinterpret_as_double(),
        4639833516098453504UL.reinterpret_as_double(),
        4464366475511070720UL.reinterpret_as_double(),
      ],
    )
  }
  secondary_transform_source_double(
    child.location_locator.position,
    4598175219545276416UL.reinterpret_as_double(),
  )
  let installed = child.location_locator.transform.unwrap()
  secondary_transform_source_numbers(
    [
      installed.a,
      installed.b,
      installed.c,
      installed.d,
      installed.e,
      installed.f,
    ],
    [
      4611686018427387904UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
    ],
  )
}

///|
fn secondary_transform_source_case_3() -> Unit raise {
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
  let parent = fig.add_axes(0.2, 0.25, 0.5, 0.5)
  parent.set_xlim(1.0, 4.0)
  parent.set_ylim(10.0, 20.0)
  let child = parent.secondary_xaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Position(0.25),
    transform=Some(
      @transforms.affine_from_values(
        13835058055282163712UL.reinterpret_as_double(),
        9223372036854775808UL.reinterpret_as_double(),
        9223372036854775808UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4624633867356078080UL.reinterpret_as_double(),
        4627730092099895296UL.reinterpret_as_double(),
      ),
    ),
  )
  {
    secondary_transform_source_double(
      child.position(),
      4598175219545276416UL.reinterpret_as_double(),
    )
    guard child.location() is SecondaryAxisLocation::Position(raw_location) else {
      fail("expected numeric location")
    }
    secondary_transform_source_double(
      raw_location,
      4598175219545276416UL.reinterpret_as_double(),
    )
    assert_true(child.alignment() is SecondaryAxisAlignment::Bottom)
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    {
      let view = child.numeric_axis.stored_view_limits()
      secondary_transform_source_numbers([view.lower(), view.upper()], [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ])
    }
    let box = child.display_bounds()
    secondary_transform_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        0UL.reinterpret_as_double(),
        4642648265865560064UL.reinterpret_as_double(),
        4644337115725824000UL.reinterpret_as_double(),
        4582574750436065280UL.reinterpret_as_double(),
      ],
    )
  }
  child.positioned_aspect(64.0, 60.0, 160.0, 120.0)
  {
    secondary_transform_source_double(
      child.position(),
      4598175219545276416UL.reinterpret_as_double(),
    )
    guard child.location() is SecondaryAxisLocation::Position(raw_location) else {
      fail("expected numeric location")
    }
    secondary_transform_source_double(
      raw_location,
      4598175219545276416UL.reinterpret_as_double(),
    )
    assert_true(child.alignment() is SecondaryAxisAlignment::Bottom)
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    {
      let view = child.numeric_axis.stored_view_limits()
      secondary_transform_source_numbers([view.lower(), view.upper()], [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ])
    }
    let box = child.display_bounds()
    secondary_transform_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        4634204016564240384UL.reinterpret_as_double(),
        4627518985867277862UL.reinterpret_as_double(),
        4639833516098453504UL.reinterpret_as_double(),
        4464366441151332352UL.reinterpret_as_double(),
      ],
    )
  }
  secondary_transform_source_double(
    child.location_locator.position,
    4598175219545276416UL.reinterpret_as_double(),
  )
  let installed = child.location_locator.transform.unwrap()
  secondary_transform_source_numbers(
    [
      installed.a,
      installed.b,
      installed.c,
      installed.d,
      installed.e,
      installed.f,
    ],
    [
      13835058055282163712UL.reinterpret_as_double(),
      9223372036854775808UL.reinterpret_as_double(),
      9223372036854775808UL.reinterpret_as_double(),
      13837309855095848960UL.reinterpret_as_double(),
      4624633867356078080UL.reinterpret_as_double(),
      4627730092099895296UL.reinterpret_as_double(),
    ],
  )
}

///|
fn secondary_transform_source_case_4() -> Unit raise {
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
  let parent = fig.add_axes(0.2, 0.25, 0.5, 0.5)
  parent.set_xlim(1.0, 4.0)
  parent.set_ylim(10.0, 20.0)
  let child = parent.secondary_xaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Position(0.25),
    transform=Some(
      @transforms.affine_from_values(
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4624633867356078080UL.reinterpret_as_double(),
        4627730092099895296UL.reinterpret_as_double(),
      ),
    ),
  )
  {
    secondary_transform_source_double(
      child.position(),
      4598175219545276416UL.reinterpret_as_double(),
    )
    guard child.location() is SecondaryAxisLocation::Position(raw_location) else {
      fail("expected numeric location")
    }
    secondary_transform_source_double(
      raw_location,
      4598175219545276416UL.reinterpret_as_double(),
    )
    assert_true(child.alignment() is SecondaryAxisAlignment::Bottom)
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    {
      let view = child.numeric_axis.stored_view_limits()
      secondary_transform_source_numbers([view.lower(), view.upper()], [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ])
    }
    let box = child.display_bounds()
    secondary_transform_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        0UL.reinterpret_as_double(),
        4642648265865560064UL.reinterpret_as_double(),
        4644337115725824000UL.reinterpret_as_double(),
        4582574750436065280UL.reinterpret_as_double(),
      ],
    )
  }
  child.positioned_aspect(64.0, 60.0, 160.0, 120.0)
  {
    secondary_transform_source_double(
      child.position(),
      4598175219545276416UL.reinterpret_as_double(),
    )
    guard child.location() is SecondaryAxisLocation::Position(raw_location) else {
      fail("expected numeric location")
    }
    secondary_transform_source_double(
      raw_location,
      4598175219545276416UL.reinterpret_as_double(),
    )
    assert_true(child.alignment() is SecondaryAxisAlignment::Bottom)
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    {
      let view = child.numeric_axis.stored_view_limits()
      secondary_transform_source_numbers([view.lower(), view.upper()], [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ])
    }
    let box = child.display_bounds()
    secondary_transform_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        4634204016564240384UL.reinterpret_as_double(),
        4627730092099895296UL.reinterpret_as_double(),
        4639833516098453504UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
      ],
    )
  }
  secondary_transform_source_double(
    child.location_locator.position,
    4598175219545276416UL.reinterpret_as_double(),
  )
  let installed = child.location_locator.transform.unwrap()
  secondary_transform_source_numbers(
    [
      installed.a,
      installed.b,
      installed.c,
      installed.d,
      installed.e,
      installed.f,
    ],
    [
      0UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      4624633867356078080UL.reinterpret_as_double(),
      4627730092099895296UL.reinterpret_as_double(),
    ],
  )
}

///|
fn secondary_transform_source_case_5() -> Unit raise {
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
  let parent = fig.add_axes(0.2, 0.25, 0.5, 0.5)
  parent.set_xlim(1.0, 4.0)
  parent.set_ylim(10.0, 20.0)
  assert_true(
    try {
      ignore(
        parent.secondary_xaxis(
          value => value,
          value => value,
          location=SecondaryAxisLocation::Position(0.25),
          transform=Some(
            @transforms.affine_from_values(
              4605975682916830379UL.reinterpret_as_double(),
              4602678819172646911UL.reinterpret_as_double(),
              13826050856027422719UL.reinterpret_as_double(),
              4605975682916830379UL.reinterpret_as_double(),
              0UL.reinterpret_as_double(),
              0UL.reinterpret_as_double(),
            ),
          ),
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
fn secondary_transform_source_case_6() -> Unit raise {
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
  let parent = fig.add_axes(0.2, 0.25, 0.5, 0.5)
  parent.set_xlim(1.0, 4.0)
  parent.set_ylim(10.0, 20.0)
  assert_true(
    try {
      ignore(
        parent.secondary_xaxis(
          value => value,
          value => value,
          location=SecondaryAxisLocation::Position(0.25),
          transform=Some(
            @transforms.affine_from_values(
              4607182418800017408UL.reinterpret_as_double(),
              4600228324763566804UL.reinterpret_as_double(),
              4595520869287447484UL.reinterpret_as_double(),
              4607182418800017408UL.reinterpret_as_double(),
              0UL.reinterpret_as_double(),
              0UL.reinterpret_as_double(),
            ),
          ),
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
fn secondary_transform_source_case_10() -> Unit raise {
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
  let parent = fig.add_axes(0.2, 0.25, 0.5, 0.5)
  parent.set_xlim(1.0, 4.0)
  parent.set_ylim(10.0, 20.0)
  let child = parent.secondary_yaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Position(0.25),
    transform=None,
  )
  {
    secondary_transform_source_double(
      child.position(),
      4598175219545276416UL.reinterpret_as_double(),
    )
    guard child.location() is SecondaryAxisLocation::Position(raw_location) else {
      fail("expected numeric location")
    }
    secondary_transform_source_double(
      raw_location,
      4598175219545276416UL.reinterpret_as_double(),
    )
    assert_true(child.alignment() is SecondaryAxisAlignment::Left)
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    {
      let view = child.numeric_axis.stored_view_limits()
      secondary_transform_source_numbers([view.lower(), view.upper()], [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ])
    }
    let box = child.display_bounds()
    secondary_transform_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        0UL.reinterpret_as_double(),
        4642648265865560064UL.reinterpret_as_double(),
        4584772507054221820UL.reinterpret_as_double(),
        4642648265865560064UL.reinterpret_as_double(),
      ],
    )
  }
  child.positioned_aspect(64.0, 60.0, 160.0, 120.0)
  {
    secondary_transform_source_double(
      child.position(),
      4598175219545276416UL.reinterpret_as_double(),
    )
    guard child.location() is SecondaryAxisLocation::Position(raw_location) else {
      fail("expected numeric location")
    }
    secondary_transform_source_double(
      raw_location,
      4598175219545276416UL.reinterpret_as_double(),
    )
    assert_true(child.alignment() is SecondaryAxisAlignment::Left)
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    {
      let view = child.numeric_axis.stored_view_limits()
      secondary_transform_source_numbers([view.lower(), view.upper()], [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ])
    }
    let box = child.display_bounds()
    secondary_transform_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        4637018766331346944UL.reinterpret_as_double(),
        4633641066610819072UL.reinterpret_as_double(),
        4490420932539580416UL.reinterpret_as_double(),
        4638144666238189568UL.reinterpret_as_double(),
      ],
    )
  }
  secondary_transform_source_double(
    child.location_locator.position,
    4598175219545276416UL.reinterpret_as_double(),
  )
  assert_true(child.location_locator.transform is None)
}

///|
fn secondary_transform_source_case_11() -> Unit raise {
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
  let parent = fig.add_axes(0.2, 0.25, 0.5, 0.5)
  parent.set_xlim(1.0, 4.0)
  parent.set_ylim(10.0, 20.0)
  let child = parent.secondary_yaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Position(0.25),
    transform=Some(
      @transforms.affine_from_values(
        4607182418800017408UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4624633867356078080UL.reinterpret_as_double(),
        4627730092099895296UL.reinterpret_as_double(),
      ),
    ),
  )
  {
    secondary_transform_source_double(
      child.position(),
      4598175219545276416UL.reinterpret_as_double(),
    )
    guard child.location() is SecondaryAxisLocation::Position(raw_location) else {
      fail("expected numeric location")
    }
    secondary_transform_source_double(
      raw_location,
      4598175219545276416UL.reinterpret_as_double(),
    )
    assert_true(child.alignment() is SecondaryAxisAlignment::Left)
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    {
      let view = child.numeric_axis.stored_view_limits()
      secondary_transform_source_numbers([view.lower(), view.upper()], [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ])
    }
    let box = child.display_bounds()
    secondary_transform_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        0UL.reinterpret_as_double(),
        4642648265865560064UL.reinterpret_as_double(),
        4584772507054221820UL.reinterpret_as_double(),
        4642648265865560064UL.reinterpret_as_double(),
      ],
    )
  }
  child.positioned_aspect(64.0, 60.0, 160.0, 120.0)
  {
    secondary_transform_source_double(
      child.position(),
      4598175219545276416UL.reinterpret_as_double(),
    )
    guard child.location() is SecondaryAxisLocation::Position(raw_location) else {
      fail("expected numeric location")
    }
    secondary_transform_source_double(
      raw_location,
      4598175219545276416UL.reinterpret_as_double(),
    )
    assert_true(child.alignment() is SecondaryAxisAlignment::Left)
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    {
      let view = child.numeric_axis.stored_view_limits()
      secondary_transform_source_numbers([view.lower(), view.upper()], [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ])
    }
    let box = child.display_bounds()
    secondary_transform_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        4624774604844433408UL.reinterpret_as_double(),
        4633641066610819072UL.reinterpret_as_double(),
        4457293420288802816UL.reinterpret_as_double(),
        4638144666238189568UL.reinterpret_as_double(),
      ],
    )
  }
  secondary_transform_source_double(
    child.location_locator.position,
    4598175219545276416UL.reinterpret_as_double(),
  )
  let installed = child.location_locator.transform.unwrap()
  secondary_transform_source_numbers(
    [
      installed.a,
      installed.b,
      installed.c,
      installed.d,
      installed.e,
      installed.f,
    ],
    [
      4607182418800017408UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4624633867356078080UL.reinterpret_as_double(),
      4627730092099895296UL.reinterpret_as_double(),
    ],
  )
}

///|
fn secondary_transform_source_case_12() -> Unit raise {
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
  let parent = fig.add_axes(0.2, 0.25, 0.5, 0.5)
  parent.set_xlim(1.0, 4.0)
  parent.set_ylim(10.0, 20.0)
  let child = parent.secondary_yaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Position(0.25),
    transform=Some(
      @transforms.affine_from_values(
        4611686018427387904UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
      ),
    ),
  )
  {
    secondary_transform_source_double(
      child.position(),
      4598175219545276416UL.reinterpret_as_double(),
    )
    guard child.location() is SecondaryAxisLocation::Position(raw_location) else {
      fail("expected numeric location")
    }
    secondary_transform_source_double(
      raw_location,
      4598175219545276416UL.reinterpret_as_double(),
    )
    assert_true(child.alignment() is SecondaryAxisAlignment::Left)
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    {
      let view = child.numeric_axis.stored_view_limits()
      secondary_transform_source_numbers([view.lower(), view.upper()], [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ])
    }
    let box = child.display_bounds()
    secondary_transform_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        0UL.reinterpret_as_double(),
        4642648265865560064UL.reinterpret_as_double(),
        4584772507054221820UL.reinterpret_as_double(),
        4642648265865560064UL.reinterpret_as_double(),
      ],
    )
  }
  child.positioned_aspect(64.0, 60.0, 160.0, 120.0)
  {
    secondary_transform_source_double(
      child.position(),
      4598175219545276416UL.reinterpret_as_double(),
    )
    guard child.location() is SecondaryAxisLocation::Position(raw_location) else {
      fail("expected numeric location")
    }
    secondary_transform_source_double(
      raw_location,
      4598175219545276416UL.reinterpret_as_double(),
    )
    assert_true(child.alignment() is SecondaryAxisAlignment::Left)
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    {
      let view = child.numeric_axis.stored_view_limits()
      secondary_transform_source_numbers([view.lower(), view.upper()], [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ])
    }
    let box = child.display_bounds()
    secondary_transform_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        4602678819172646912UL.reinterpret_as_double(),
        4633641066610819072UL.reinterpret_as_double(),
        4461797157355126784UL.reinterpret_as_double(),
        4638144666238189568UL.reinterpret_as_double(),
      ],
    )
  }
  secondary_transform_source_double(
    child.location_locator.position,
    4598175219545276416UL.reinterpret_as_double(),
  )
  let installed = child.location_locator.transform.unwrap()
  secondary_transform_source_numbers(
    [
      installed.a,
      installed.b,
      installed.c,
      installed.d,
      installed.e,
      installed.f,
    ],
    [
      4611686018427387904UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
    ],
  )
}

///|
fn secondary_transform_source_case_13() -> Unit raise {
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
  let parent = fig.add_axes(0.2, 0.25, 0.5, 0.5)
  parent.set_xlim(1.0, 4.0)
  parent.set_ylim(10.0, 20.0)
  let child = parent.secondary_yaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Position(0.25),
    transform=Some(
      @transforms.affine_from_values(
        13835058055282163712UL.reinterpret_as_double(),
        9223372036854775808UL.reinterpret_as_double(),
        9223372036854775808UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4624633867356078080UL.reinterpret_as_double(),
        4627730092099895296UL.reinterpret_as_double(),
      ),
    ),
  )
  {
    secondary_transform_source_double(
      child.position(),
      4598175219545276416UL.reinterpret_as_double(),
    )
    guard child.location() is SecondaryAxisLocation::Position(raw_location) else {
      fail("expected numeric location")
    }
    secondary_transform_source_double(
      raw_location,
      4598175219545276416UL.reinterpret_as_double(),
    )
    assert_true(child.alignment() is SecondaryAxisAlignment::Left)
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    {
      let view = child.numeric_axis.stored_view_limits()
      secondary_transform_source_numbers([view.lower(), view.upper()], [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ])
    }
    let box = child.display_bounds()
    secondary_transform_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        0UL.reinterpret_as_double(),
        4642648265865560064UL.reinterpret_as_double(),
        4584772507054221820UL.reinterpret_as_double(),
        4642648265865560064UL.reinterpret_as_double(),
      ],
    )
  }
  child.positioned_aspect(64.0, 60.0, 160.0, 120.0)
  {
    secondary_transform_source_double(
      child.position(),
      4598175219545276416UL.reinterpret_as_double(),
    )
    guard child.location() is SecondaryAxisLocation::Position(raw_location) else {
      fail("expected numeric location")
    }
    secondary_transform_source_double(
      raw_location,
      4598175219545276416UL.reinterpret_as_double(),
    )
    assert_true(child.alignment() is SecondaryAxisAlignment::Left)
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    {
      let view = child.numeric_axis.stored_view_limits()
      secondary_transform_source_numbers([view.lower(), view.upper()], [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ])
    }
    let box = child.display_bounds()
    secondary_transform_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        4624352392379254834UL.reinterpret_as_double(),
        4633641066610819072UL.reinterpret_as_double(),
        4461797157355126784UL.reinterpret_as_double(),
        4638144666238189568UL.reinterpret_as_double(),
      ],
    )
  }
  secondary_transform_source_double(
    child.location_locator.position,
    4598175219545276416UL.reinterpret_as_double(),
  )
  let installed = child.location_locator.transform.unwrap()
  secondary_transform_source_numbers(
    [
      installed.a,
      installed.b,
      installed.c,
      installed.d,
      installed.e,
      installed.f,
    ],
    [
      13835058055282163712UL.reinterpret_as_double(),
      9223372036854775808UL.reinterpret_as_double(),
      9223372036854775808UL.reinterpret_as_double(),
      13837309855095848960UL.reinterpret_as_double(),
      4624633867356078080UL.reinterpret_as_double(),
      4627730092099895296UL.reinterpret_as_double(),
    ],
  )
}

///|
fn secondary_transform_source_case_14() -> Unit raise {
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
  let parent = fig.add_axes(0.2, 0.25, 0.5, 0.5)
  parent.set_xlim(1.0, 4.0)
  parent.set_ylim(10.0, 20.0)
  let child = parent.secondary_yaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Position(0.25),
    transform=Some(
      @transforms.affine_from_values(
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4624633867356078080UL.reinterpret_as_double(),
        4627730092099895296UL.reinterpret_as_double(),
      ),
    ),
  )
  {
    secondary_transform_source_double(
      child.position(),
      4598175219545276416UL.reinterpret_as_double(),
    )
    guard child.location() is SecondaryAxisLocation::Position(raw_location) else {
      fail("expected numeric location")
    }
    secondary_transform_source_double(
      raw_location,
      4598175219545276416UL.reinterpret_as_double(),
    )
    assert_true(child.alignment() is SecondaryAxisAlignment::Left)
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    {
      let view = child.numeric_axis.stored_view_limits()
      secondary_transform_source_numbers([view.lower(), view.upper()], [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ])
    }
    let box = child.display_bounds()
    secondary_transform_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        0UL.reinterpret_as_double(),
        4642648265865560064UL.reinterpret_as_double(),
        4584772507054221820UL.reinterpret_as_double(),
        4642648265865560064UL.reinterpret_as_double(),
      ],
    )
  }
  child.positioned_aspect(64.0, 60.0, 160.0, 120.0)
  {
    secondary_transform_source_double(
      child.position(),
      4598175219545276416UL.reinterpret_as_double(),
    )
    guard child.location() is SecondaryAxisLocation::Position(raw_location) else {
      fail("expected numeric location")
    }
    secondary_transform_source_double(
      raw_location,
      4598175219545276416UL.reinterpret_as_double(),
    )
    assert_true(child.alignment() is SecondaryAxisAlignment::Left)
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    {
      let view = child.numeric_axis.stored_view_limits()
      secondary_transform_source_numbers([view.lower(), view.upper()], [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ])
    }
    let box = child.display_bounds()
    secondary_transform_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        4624633867356078080UL.reinterpret_as_double(),
        4633641066610819072UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4638144666238189568UL.reinterpret_as_double(),
      ],
    )
  }
  secondary_transform_source_double(
    child.location_locator.position,
    4598175219545276416UL.reinterpret_as_double(),
  )
  let installed = child.location_locator.transform.unwrap()
  secondary_transform_source_numbers(
    [
      installed.a,
      installed.b,
      installed.c,
      installed.d,
      installed.e,
      installed.f,
    ],
    [
      0UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      4624633867356078080UL.reinterpret_as_double(),
      4627730092099895296UL.reinterpret_as_double(),
    ],
  )
}

///|
fn secondary_transform_source_case_15() -> Unit raise {
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
  let parent = fig.add_axes(0.2, 0.25, 0.5, 0.5)
  parent.set_xlim(1.0, 4.0)
  parent.set_ylim(10.0, 20.0)
  assert_true(
    try {
      ignore(
        parent.secondary_yaxis(
          value => value,
          value => value,
          location=SecondaryAxisLocation::Position(0.25),
          transform=Some(
            @transforms.affine_from_values(
              4605975682916830379UL.reinterpret_as_double(),
              4602678819172646911UL.reinterpret_as_double(),
              13826050856027422719UL.reinterpret_as_double(),
              4605975682916830379UL.reinterpret_as_double(),
              0UL.reinterpret_as_double(),
              0UL.reinterpret_as_double(),
            ),
          ),
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
fn secondary_transform_source_case_16() -> Unit raise {
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
  let parent = fig.add_axes(0.2, 0.25, 0.5, 0.5)
  parent.set_xlim(1.0, 4.0)
  parent.set_ylim(10.0, 20.0)
  assert_true(
    try {
      ignore(
        parent.secondary_yaxis(
          value => value,
          value => value,
          location=SecondaryAxisLocation::Position(0.25),
          transform=Some(
            @transforms.affine_from_values(
              4607182418800017408UL.reinterpret_as_double(),
              4600228324763566804UL.reinterpret_as_double(),
              4595520869287447484UL.reinterpret_as_double(),
              4607182418800017408UL.reinterpret_as_double(),
              0UL.reinterpret_as_double(),
              0UL.reinterpret_as_double(),
            ),
          ),
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
fn secondary_transform_source_case_20() -> Unit raise {
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
  let parent = fig.add_axes(0.2, 0.25, 0.5, 0.5)
  parent.set_xlim(1.0, 4.0)
  parent.set_ylim(10.0, 20.0)
  let child = parent.secondary_xaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Position(0.25),
    transform=None,
  )
  assert_true(
    try {
      child.set_location(
        SecondaryAxisLocation::Position(0.75),
        transform=Some(
          @transforms.affine_from_values(
            4605975682916830379UL.reinterpret_as_double(),
            4602678819172646911UL.reinterpret_as_double(),
            13826050856027422719UL.reinterpret_as_double(),
            4605975682916830379UL.reinterpret_as_double(),
            0UL.reinterpret_as_double(),
            0UL.reinterpret_as_double(),
          ),
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  {
    secondary_transform_source_double(
      child.position(),
      4604930618986332160UL.reinterpret_as_double(),
    )
    guard child.location() is SecondaryAxisLocation::Position(raw_location) else {
      fail("expected numeric location")
    }
    secondary_transform_source_double(
      raw_location,
      4604930618986332160UL.reinterpret_as_double(),
    )
    assert_true(child.alignment() is SecondaryAxisAlignment::Bottom)
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    {
      let view = child.numeric_axis.stored_view_limits()
      secondary_transform_source_numbers([view.lower(), view.upper()], [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ])
    }
    let box = child.display_bounds()
    secondary_transform_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        0UL.reinterpret_as_double(),
        4642648265865560064UL.reinterpret_as_double(),
        4644337115725824000UL.reinterpret_as_double(),
        4582574750436065280UL.reinterpret_as_double(),
      ],
    )
  }
  secondary_transform_source_double(
    child.location_locator.position,
    4598175219545276416UL.reinterpret_as_double(),
  )
  assert_true(child.location_locator.transform is None)
}

///|
fn secondary_transform_source_case_21() -> Unit raise {
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
  let parent = fig.add_axes(0.2, 0.25, 0.5, 0.5)
  parent.set_xlim(1.0, 4.0)
  parent.set_ylim(10.0, 20.0)
  let child = parent.secondary_yaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Position(0.25),
    transform=None,
  )
  assert_true(
    try {
      child.set_location(
        SecondaryAxisLocation::Position(0.75),
        transform=Some(
          @transforms.affine_from_values(
            4605975682916830379UL.reinterpret_as_double(),
            4602678819172646911UL.reinterpret_as_double(),
            13826050856027422719UL.reinterpret_as_double(),
            4605975682916830379UL.reinterpret_as_double(),
            0UL.reinterpret_as_double(),
            0UL.reinterpret_as_double(),
          ),
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  {
    secondary_transform_source_double(
      child.position(),
      4604930618986332160UL.reinterpret_as_double(),
    )
    guard child.location() is SecondaryAxisLocation::Position(raw_location) else {
      fail("expected numeric location")
    }
    secondary_transform_source_double(
      raw_location,
      4604930618986332160UL.reinterpret_as_double(),
    )
    assert_true(child.alignment() is SecondaryAxisAlignment::Left)
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    {
      let view = child.numeric_axis.stored_view_limits()
      secondary_transform_source_numbers([view.lower(), view.upper()], [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ])
    }
    let box = child.display_bounds()
    secondary_transform_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        0UL.reinterpret_as_double(),
        4642648265865560064UL.reinterpret_as_double(),
        4584772507054221820UL.reinterpret_as_double(),
        4642648265865560064UL.reinterpret_as_double(),
      ],
    )
  }
  secondary_transform_source_double(
    child.location_locator.position,
    4598175219545276416UL.reinterpret_as_double(),
  )
  assert_true(child.location_locator.transform is None)
}

///|
fn secondary_transform_source_case_22() -> Unit raise {
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
  let parent = fig.add_axes(0.2, 0.25, 0.5, 0.5)
  parent.set_xlim(1.0, 4.0)
  parent.set_ylim(10.0, 20.0)
  let child = parent.secondary_xaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Position(0.25),
    transform=Some(
      @transforms.affine_from_values(
        4611686018427387904UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
        4624633867356078080UL.reinterpret_as_double(),
        4627730092099895296UL.reinterpret_as_double(),
      ),
    ),
  )
  {
    secondary_transform_source_double(
      child.position(),
      4598175219545276416UL.reinterpret_as_double(),
    )
    guard child.location() is SecondaryAxisLocation::Position(raw_location) else {
      fail("expected numeric location")
    }
    secondary_transform_source_double(
      raw_location,
      4598175219545276416UL.reinterpret_as_double(),
    )
    assert_true(child.alignment() is SecondaryAxisAlignment::Bottom)
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    {
      let view = child.numeric_axis.stored_view_limits()
      secondary_transform_source_numbers([view.lower(), view.upper()], [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ])
    }
    let box = child.display_bounds()
    secondary_transform_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        0UL.reinterpret_as_double(),
        4642648265865560064UL.reinterpret_as_double(),
        4644337115725824000UL.reinterpret_as_double(),
        4582574750436065280UL.reinterpret_as_double(),
      ],
    )
  }
  child.set_location(SecondaryAxisLocation::Position(0.75))
  {
    secondary_transform_source_double(
      child.position(),
      4604930618986332160UL.reinterpret_as_double(),
    )
    guard child.location() is SecondaryAxisLocation::Position(raw_location) else {
      fail("expected numeric location")
    }
    secondary_transform_source_double(
      raw_location,
      4604930618986332160UL.reinterpret_as_double(),
    )
    assert_true(child.alignment() is SecondaryAxisAlignment::Bottom)
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    {
      let view = child.numeric_axis.stored_view_limits()
      secondary_transform_source_numbers([view.lower(), view.upper()], [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ])
    }
    let box = child.display_bounds()
    secondary_transform_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        0UL.reinterpret_as_double(),
        4642648265865560064UL.reinterpret_as_double(),
        4644337115725824000UL.reinterpret_as_double(),
        4582574750436065280UL.reinterpret_as_double(),
      ],
    )
  }
  secondary_transform_source_double(
    child.location_locator.position,
    4604930618986332160UL.reinterpret_as_double(),
  )
  assert_true(child.location_locator.transform is None)
  child.set_location(
    SecondaryAxisLocation::Position(0.5),
    transform=Some(
      @transforms.affine_from_values(
        4611686018427387904UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
        4624633867356078080UL.reinterpret_as_double(),
        4627730092099895296UL.reinterpret_as_double(),
      ),
    ),
  )
  child.set_location(SecondaryAxisLocation::Position(0.75), transform=None)
  {
    secondary_transform_source_double(
      child.position(),
      4604930618986332160UL.reinterpret_as_double(),
    )
    guard child.location() is SecondaryAxisLocation::Position(raw_location) else {
      fail("expected numeric location")
    }
    secondary_transform_source_double(
      raw_location,
      4604930618986332160UL.reinterpret_as_double(),
    )
    assert_true(child.alignment() is SecondaryAxisAlignment::Bottom)
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    {
      let view = child.numeric_axis.stored_view_limits()
      secondary_transform_source_numbers([view.lower(), view.upper()], [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ])
    }
    let box = child.display_bounds()
    secondary_transform_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        0UL.reinterpret_as_double(),
        4642648265865560064UL.reinterpret_as_double(),
        4644337115725824000UL.reinterpret_as_double(),
        4582574750436065280UL.reinterpret_as_double(),
      ],
    )
  }
  secondary_transform_source_double(
    child.location_locator.position,
    4604930618986332160UL.reinterpret_as_double(),
  )
  assert_true(child.location_locator.transform is None)
}

///|
fn secondary_transform_source_case_23() -> Unit raise {
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
  let parent = fig.add_axes(0.2, 0.25, 0.5, 0.5)
  parent.set_xlim(1.0, 4.0)
  parent.set_ylim(10.0, 20.0)
  let child = parent.secondary_yaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Position(0.25),
    transform=Some(
      @transforms.affine_from_values(
        4611686018427387904UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
        4624633867356078080UL.reinterpret_as_double(),
        4627730092099895296UL.reinterpret_as_double(),
      ),
    ),
  )
  {
    secondary_transform_source_double(
      child.position(),
      4598175219545276416UL.reinterpret_as_double(),
    )
    guard child.location() is SecondaryAxisLocation::Position(raw_location) else {
      fail("expected numeric location")
    }
    secondary_transform_source_double(
      raw_location,
      4598175219545276416UL.reinterpret_as_double(),
    )
    assert_true(child.alignment() is SecondaryAxisAlignment::Left)
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    {
      let view = child.numeric_axis.stored_view_limits()
      secondary_transform_source_numbers([view.lower(), view.upper()], [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ])
    }
    let box = child.display_bounds()
    secondary_transform_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        0UL.reinterpret_as_double(),
        4642648265865560064UL.reinterpret_as_double(),
        4584772507054221820UL.reinterpret_as_double(),
        4642648265865560064UL.reinterpret_as_double(),
      ],
    )
  }
  child.set_location(SecondaryAxisLocation::Position(0.75))
  {
    secondary_transform_source_double(
      child.position(),
      4604930618986332160UL.reinterpret_as_double(),
    )
    guard child.location() is SecondaryAxisLocation::Position(raw_location) else {
      fail("expected numeric location")
    }
    secondary_transform_source_double(
      raw_location,
      4604930618986332160UL.reinterpret_as_double(),
    )
    assert_true(child.alignment() is SecondaryAxisAlignment::Left)
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    {
      let view = child.numeric_axis.stored_view_limits()
      secondary_transform_source_numbers([view.lower(), view.upper()], [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ])
    }
    let box = child.display_bounds()
    secondary_transform_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        0UL.reinterpret_as_double(),
        4642648265865560064UL.reinterpret_as_double(),
        4584772507054221820UL.reinterpret_as_double(),
        4642648265865560064UL.reinterpret_as_double(),
      ],
    )
  }
  secondary_transform_source_double(
    child.location_locator.position,
    4604930618986332160UL.reinterpret_as_double(),
  )
  assert_true(child.location_locator.transform is None)
  child.set_location(
    SecondaryAxisLocation::Position(0.5),
    transform=Some(
      @transforms.affine_from_values(
        4611686018427387904UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
        4624633867356078080UL.reinterpret_as_double(),
        4627730092099895296UL.reinterpret_as_double(),
      ),
    ),
  )
  child.set_location(SecondaryAxisLocation::Position(0.75), transform=None)
  {
    secondary_transform_source_double(
      child.position(),
      4604930618986332160UL.reinterpret_as_double(),
    )
    guard child.location() is SecondaryAxisLocation::Position(raw_location) else {
      fail("expected numeric location")
    }
    secondary_transform_source_double(
      raw_location,
      4604930618986332160UL.reinterpret_as_double(),
    )
    assert_true(child.alignment() is SecondaryAxisAlignment::Left)
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    {
      let view = child.numeric_axis.stored_view_limits()
      secondary_transform_source_numbers([view.lower(), view.upper()], [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ])
    }
    let box = child.display_bounds()
    secondary_transform_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        0UL.reinterpret_as_double(),
        4642648265865560064UL.reinterpret_as_double(),
        4584772507054221820UL.reinterpret_as_double(),
        4642648265865560064UL.reinterpret_as_double(),
      ],
    )
  }
  secondary_transform_source_double(
    child.location_locator.position,
    4604930618986332160UL.reinterpret_as_double(),
  )
  assert_true(child.location_locator.transform is None)
}

///|
fn secondary_transform_source_case_26() -> Unit raise {
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
  let parent = fig.add_axes(0.2, 0.25, 0.5, 0.5)
  parent.set_xlim(1.0, 4.0)
  parent.set_ylim(10.0, 20.0)
  let child = parent.secondary_xaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Position(0.25),
    transform=Some(
      @transforms.affine_from_values(
        4611686018427387904UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
        4624633867356078080UL.reinterpret_as_double(),
        4627730092099895296UL.reinterpret_as_double(),
      ),
    ),
  )
  child.set_functions(
    value => {
      try! child.set_location(
        SecondaryAxisLocation::Position(0.75),
        transform=Some(
          @transforms.affine_from_values(
            4607182418800017408UL.reinterpret_as_double(),
            0UL.reinterpret_as_double(),
            0UL.reinterpret_as_double(),
            4607182418800017408UL.reinterpret_as_double(),
            4636737291354636288UL.reinterpret_as_double(),
            4641240890982006784UL.reinterpret_as_double(),
          ),
        ),
      )
      value
    },
    value => value,
  )
  child.positioned_aspect(64.0, 60.0, 160.0, 120.0)
  {
    secondary_transform_source_double(
      child.position(),
      4604930618986332160UL.reinterpret_as_double(),
    )
    guard child.location() is SecondaryAxisLocation::Position(raw_location) else {
      fail("expected numeric location")
    }
    secondary_transform_source_double(
      raw_location,
      4604930618986332160UL.reinterpret_as_double(),
    )
    assert_true(child.alignment() is SecondaryAxisAlignment::Bottom)
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    {
      let view = child.numeric_axis.stored_view_limits()
      secondary_transform_source_numbers([view.lower(), view.upper()], [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ])
    }
    let box = child.display_bounds()
    secondary_transform_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        4634204016564240384UL.reinterpret_as_double(),
        4627941198332428288UL.reinterpret_as_double(),
        4639833516098453504UL.reinterpret_as_double(),
        4464366509870809088UL.reinterpret_as_double(),
      ],
    )
  }
  secondary_transform_source_double(
    child.location_locator.position,
    4604930618986332160UL.reinterpret_as_double(),
  )
  let installed = child.location_locator.transform.unwrap()
  secondary_transform_source_numbers(
    [
      installed.a,
      installed.b,
      installed.c,
      installed.d,
      installed.e,
      installed.f,
    ],
    [
      4607182418800017408UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4636737291354636288UL.reinterpret_as_double(),
      4641240890982006784UL.reinterpret_as_double(),
    ],
  )
}

///|
fn secondary_transform_source_case_28() -> Unit raise {
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
  let parent = fig.add_axes(0.2, 0.25, 0.5, 0.5)
  parent.set_xlim(1.0, 4.0)
  parent.set_ylim(10.0, 20.0)
  let child = parent.secondary_yaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Position(0.25),
    transform=Some(
      @transforms.affine_from_values(
        4611686018427387904UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
        4624633867356078080UL.reinterpret_as_double(),
        4627730092099895296UL.reinterpret_as_double(),
      ),
    ),
  )
  child.set_functions(
    value => {
      try! child.set_location(
        SecondaryAxisLocation::Position(0.75),
        transform=Some(
          @transforms.affine_from_values(
            4607182418800017408UL.reinterpret_as_double(),
            0UL.reinterpret_as_double(),
            0UL.reinterpret_as_double(),
            4607182418800017408UL.reinterpret_as_double(),
            4636737291354636288UL.reinterpret_as_double(),
            4641240890982006784UL.reinterpret_as_double(),
          ),
        ),
      )
      value
    },
    value => value,
  )
  child.positioned_aspect(64.0, 60.0, 160.0, 120.0)
  {
    secondary_transform_source_double(
      child.position(),
      4604930618986332160UL.reinterpret_as_double(),
    )
    guard child.location() is SecondaryAxisLocation::Position(raw_location) else {
      fail("expected numeric location")
    }
    secondary_transform_source_double(
      raw_location,
      4604930618986332160UL.reinterpret_as_double(),
    )
    assert_true(child.alignment() is SecondaryAxisAlignment::Left)
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    {
      let view = child.numeric_axis.stored_view_limits()
      secondary_transform_source_numbers([view.lower(), view.upper()], [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ])
    }
    let box = child.display_bounds()
    secondary_transform_source_numbers(
      [box.x0(), box.y0(), box.width(), box.height()],
      [
        4624915342332788736UL.reinterpret_as_double(),
        4633641066610819072UL.reinterpret_as_double(),
        4461797157355126784UL.reinterpret_as_double(),
        4638144666238189568UL.reinterpret_as_double(),
      ],
    )
  }
  secondary_transform_source_double(
    child.location_locator.position,
    4604930618986332160UL.reinterpret_as_double(),
  )
  let installed = child.location_locator.transform.unwrap()
  secondary_transform_source_numbers(
    [
      installed.a,
      installed.b,
      installed.c,
      installed.d,
      installed.e,
      installed.f,
    ],
    [
      4607182418800017408UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4636737291354636288UL.reinterpret_as_double(),
      4641240890982006784UL.reinterpret_as_double(),
    ],
  )
}

///|
fn secondary_transform_source_case_34() -> Unit raise {
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
  let parent = fig.add_axes(0.2, 0.25, 0.5, 0.5)
  parent.set_xlim(1.0, 4.0)
  parent.set_ylim(10.0, 20.0)
  let child = parent.secondary_xaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Position(0.25),
    transform=None,
  )
  assert_true(
    try {
      child.set_location(
        SecondaryAxisLocation::Position(0.75),
        transform=Some(
          @transforms.affine_from_values(
            4605975682916830379UL.reinterpret_as_double(),
            4602678819172646911UL.reinterpret_as_double(),
            13826050856027422719UL.reinterpret_as_double(),
            4605975682916830379UL.reinterpret_as_double(),
            0UL.reinterpret_as_double(),
            0UL.reinterpret_as_double(),
          ),
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  {
    secondary_transform_source_double(
      child.position(),
      4604930618986332160UL.reinterpret_as_double(),
    )
    guard child.location() is SecondaryAxisLocation::Position(raw_location) else {
      fail("expected numeric location")
    }
    secondary_transform_source_double(
      raw_location,
      4604930618986332160UL.reinterpret_as_double(),
    )
    assert_true(child.alignment() is SecondaryAxisAlignment::Bottom)
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    {
      let view = child.numeric_axis.stored_view_limits()
      secondary_transform_source_numbers([view.lower(), view.upper()], [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ])
    }
    {
      let box = child.display_bounds()
      secondary_transform_source_numbers(
        [box.x0(), box.y0(), box.width(), box.height()],
        [
          0UL.reinterpret_as_double(),
          4642648265865560064UL.reinterpret_as_double(),
          4644337115725824000UL.reinterpret_as_double(),
          4582574750436065280UL.reinterpret_as_double(),
        ],
      )
    }
    assert_eq(
      [
        secondary_transform_source_major_class(child.locator().unwrap()),
        secondary_transform_source_minor_class(child.minor_locator().unwrap()),
        secondary_transform_source_formatter_class(
          child.named_formatter().unwrap(),
        ),
        secondary_transform_source_formatter_class(
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
  }
  secondary_transform_source_double(
    child.location_locator.position,
    4598175219545276416UL.reinterpret_as_double(),
  )
  assert_true(child.location_locator.transform is None)
  child.positioned_aspect(64.0, 60.0, 160.0, 120.0)
  {
    secondary_transform_source_double(
      child.position(),
      4604930618986332160UL.reinterpret_as_double(),
    )
    guard child.location() is SecondaryAxisLocation::Position(raw_location) else {
      fail("expected numeric location")
    }
    secondary_transform_source_double(
      raw_location,
      4604930618986332160UL.reinterpret_as_double(),
    )
    assert_true(child.alignment() is SecondaryAxisAlignment::Bottom)
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    {
      let view = child.numeric_axis.stored_view_limits()
      secondary_transform_source_numbers([view.lower(), view.upper()], [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ])
    }
    {
      let box = child.display_bounds()
      secondary_transform_source_numbers(
        [box.x0(), box.y0(), box.width(), box.height()],
        [
          4634204016564240384UL.reinterpret_as_double(),
          4636033603912859648UL.reinterpret_as_double(),
          4639833516098453504UL.reinterpret_as_double(),
          4488335184751493120UL.reinterpret_as_double(),
        ],
      )
    }
    assert_eq(
      [
        secondary_transform_source_major_class(child.locator().unwrap()),
        secondary_transform_source_minor_class(child.minor_locator().unwrap()),
        secondary_transform_source_formatter_class(
          child.named_formatter().unwrap(),
        ),
        secondary_transform_source_formatter_class(
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
  }
  secondary_transform_source_double(
    child.location_locator.position,
    4598175219545276416UL.reinterpret_as_double(),
  )
  assert_true(child.location_locator.transform is None)
}

///|
fn secondary_transform_source_case_35() -> Unit raise {
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
  let parent = fig.add_axes(0.2, 0.25, 0.5, 0.5)
  parent.set_xlim(1.0, 4.0)
  parent.set_ylim(10.0, 20.0)
  let child = parent.secondary_xaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Position(0.25),
    transform=Some(
      @transforms.affine_from_values(
        4607182418800017408UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        0.0 / 0.0,
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
      ),
    ),
  )
  {
    secondary_transform_source_double(
      child.position(),
      4598175219545276416UL.reinterpret_as_double(),
    )
    guard child.location() is SecondaryAxisLocation::Position(raw_location) else {
      fail("expected numeric location")
    }
    secondary_transform_source_double(
      raw_location,
      4598175219545276416UL.reinterpret_as_double(),
    )
    assert_true(child.alignment() is SecondaryAxisAlignment::Bottom)
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    {
      let view = child.numeric_axis.stored_view_limits()
      secondary_transform_source_numbers([view.lower(), view.upper()], [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ])
    }
    {
      let box = child.display_bounds()
      secondary_transform_source_numbers(
        [box.x0(), box.y0(), box.width(), box.height()],
        [
          0UL.reinterpret_as_double(),
          4642648265865560064UL.reinterpret_as_double(),
          4644337115725824000UL.reinterpret_as_double(),
          4582574750436065280UL.reinterpret_as_double(),
        ],
      )
    }
    assert_eq(
      [
        secondary_transform_source_major_class(child.locator().unwrap()),
        secondary_transform_source_minor_class(child.minor_locator().unwrap()),
        secondary_transform_source_formatter_class(
          child.named_formatter().unwrap(),
        ),
        secondary_transform_source_formatter_class(
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
  }
  child.positioned_aspect(64.0, 60.0, 160.0, 120.0)
  {
    secondary_transform_source_double(
      child.position(),
      4598175219545276416UL.reinterpret_as_double(),
    )
    guard child.location() is SecondaryAxisLocation::Position(raw_location) else {
      fail("expected numeric location")
    }
    secondary_transform_source_double(
      raw_location,
      4598175219545276416UL.reinterpret_as_double(),
    )
    assert_true(child.alignment() is SecondaryAxisAlignment::Bottom)
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    {
      let view = child.numeric_axis.stored_view_limits()
      secondary_transform_source_numbers([view.lower(), view.upper()], [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ])
    }
    {
      let box = child.display_bounds()
      secondary_transform_source_numbers(
        [box.x0(), box.y0(), box.width(), box.height()],
        [0.0 / 0.0, 0.0 / 0.0, 0.0 / 0.0, 0.0 / 0.0],
      )
    }
    assert_eq(
      [
        secondary_transform_source_major_class(child.locator().unwrap()),
        secondary_transform_source_minor_class(child.minor_locator().unwrap()),
        secondary_transform_source_formatter_class(
          child.named_formatter().unwrap(),
        ),
        secondary_transform_source_formatter_class(
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
  }
  secondary_transform_source_double(
    child.location_locator.position,
    4598175219545276416UL.reinterpret_as_double(),
  )
  let installed = child.location_locator.transform.unwrap()
  secondary_transform_source_numbers(
    [
      installed.a,
      installed.b,
      installed.c,
      installed.d,
      installed.e,
      installed.f,
    ],
    [
      4607182418800017408UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      0.0 / 0.0,
      0UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
    ],
  )
}

///|
fn secondary_transform_source_case_36() -> Unit raise {
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
  let parent = fig.add_axes(0.2, 0.25, 0.5, 0.5)
  parent.set_xlim(1.0, 4.0)
  parent.set_ylim(10.0, 20.0)
  let child = parent.secondary_xaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Position(0.25),
    transform=Some(
      @transforms.affine_from_values(
        4607182418800017408UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        1.0 / 0.0,
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
      ),
    ),
  )
  {
    secondary_transform_source_double(
      child.position(),
      4598175219545276416UL.reinterpret_as_double(),
    )
    guard child.location() is SecondaryAxisLocation::Position(raw_location) else {
      fail("expected numeric location")
    }
    secondary_transform_source_double(
      raw_location,
      4598175219545276416UL.reinterpret_as_double(),
    )
    assert_true(child.alignment() is SecondaryAxisAlignment::Bottom)
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    {
      let view = child.numeric_axis.stored_view_limits()
      secondary_transform_source_numbers([view.lower(), view.upper()], [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ])
    }
    {
      let box = child.display_bounds()
      secondary_transform_source_numbers(
        [box.x0(), box.y0(), box.width(), box.height()],
        [
          0UL.reinterpret_as_double(),
          4642648265865560064UL.reinterpret_as_double(),
          4644337115725824000UL.reinterpret_as_double(),
          4582574750436065280UL.reinterpret_as_double(),
        ],
      )
    }
    assert_eq(
      [
        secondary_transform_source_major_class(child.locator().unwrap()),
        secondary_transform_source_minor_class(child.minor_locator().unwrap()),
        secondary_transform_source_formatter_class(
          child.named_formatter().unwrap(),
        ),
        secondary_transform_source_formatter_class(
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
  }
  child.positioned_aspect(64.0, 60.0, 160.0, 120.0)
  {
    secondary_transform_source_double(
      child.position(),
      4598175219545276416UL.reinterpret_as_double(),
    )
    guard child.location() is SecondaryAxisLocation::Position(raw_location) else {
      fail("expected numeric location")
    }
    secondary_transform_source_double(
      raw_location,
      4598175219545276416UL.reinterpret_as_double(),
    )
    assert_true(child.alignment() is SecondaryAxisAlignment::Bottom)
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    {
      let view = child.numeric_axis.stored_view_limits()
      secondary_transform_source_numbers([view.lower(), view.upper()], [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ])
    }
    {
      let box = child.display_bounds()
      secondary_transform_source_numbers(
        [box.x0(), box.y0(), box.width(), box.height()],
        [0.0 / 0.0, 0.0 / 0.0, 0.0 / 0.0, 0.0 / 0.0],
      )
    }
    assert_eq(
      [
        secondary_transform_source_major_class(child.locator().unwrap()),
        secondary_transform_source_minor_class(child.minor_locator().unwrap()),
        secondary_transform_source_formatter_class(
          child.named_formatter().unwrap(),
        ),
        secondary_transform_source_formatter_class(
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
  }
  secondary_transform_source_double(
    child.location_locator.position,
    4598175219545276416UL.reinterpret_as_double(),
  )
  let installed = child.location_locator.transform.unwrap()
  secondary_transform_source_numbers(
    [
      installed.a,
      installed.b,
      installed.c,
      installed.d,
      installed.e,
      installed.f,
    ],
    [
      4607182418800017408UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      1.0 / 0.0,
      0UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
    ],
  )
}

///|
fn secondary_transform_source_case_37() -> Unit raise {
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
  let parent = fig.add_axes(0.2, 0.25, 0.5, 0.5)
  parent.set_xlim(1.0, 4.0)
  parent.set_ylim(10.0, 20.0)
  let child = parent.secondary_xaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Position(0.25),
    transform=Some(
      @transforms.affine_from_values(
        4607182418800017408UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        -1.0 / 0.0,
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
      ),
    ),
  )
  {
    secondary_transform_source_double(
      child.position(),
      4598175219545276416UL.reinterpret_as_double(),
    )
    guard child.location() is SecondaryAxisLocation::Position(raw_location) else {
      fail("expected numeric location")
    }
    secondary_transform_source_double(
      raw_location,
      4598175219545276416UL.reinterpret_as_double(),
    )
    assert_true(child.alignment() is SecondaryAxisAlignment::Bottom)
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    {
      let view = child.numeric_axis.stored_view_limits()
      secondary_transform_source_numbers([view.lower(), view.upper()], [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ])
    }
    {
      let box = child.display_bounds()
      secondary_transform_source_numbers(
        [box.x0(), box.y0(), box.width(), box.height()],
        [
          0UL.reinterpret_as_double(),
          4642648265865560064UL.reinterpret_as_double(),
          4644337115725824000UL.reinterpret_as_double(),
          4582574750436065280UL.reinterpret_as_double(),
        ],
      )
    }
    assert_eq(
      [
        secondary_transform_source_major_class(child.locator().unwrap()),
        secondary_transform_source_minor_class(child.minor_locator().unwrap()),
        secondary_transform_source_formatter_class(
          child.named_formatter().unwrap(),
        ),
        secondary_transform_source_formatter_class(
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
  }
  child.positioned_aspect(64.0, 60.0, 160.0, 120.0)
  {
    secondary_transform_source_double(
      child.position(),
      4598175219545276416UL.reinterpret_as_double(),
    )
    guard child.location() is SecondaryAxisLocation::Position(raw_location) else {
      fail("expected numeric location")
    }
    secondary_transform_source_double(
      raw_location,
      4598175219545276416UL.reinterpret_as_double(),
    )
    assert_true(child.alignment() is SecondaryAxisAlignment::Bottom)
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    {
      let view = child.numeric_axis.stored_view_limits()
      secondary_transform_source_numbers([view.lower(), view.upper()], [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ])
    }
    {
      let box = child.display_bounds()
      secondary_transform_source_numbers(
        [box.x0(), box.y0(), box.width(), box.height()],
        [0.0 / 0.0, 0.0 / 0.0, 0.0 / 0.0, 0.0 / 0.0],
      )
    }
    assert_eq(
      [
        secondary_transform_source_major_class(child.locator().unwrap()),
        secondary_transform_source_minor_class(child.minor_locator().unwrap()),
        secondary_transform_source_formatter_class(
          child.named_formatter().unwrap(),
        ),
        secondary_transform_source_formatter_class(
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
  }
  secondary_transform_source_double(
    child.location_locator.position,
    4598175219545276416UL.reinterpret_as_double(),
  )
  let installed = child.location_locator.transform.unwrap()
  secondary_transform_source_numbers(
    [
      installed.a,
      installed.b,
      installed.c,
      installed.d,
      installed.e,
      installed.f,
    ],
    [
      4607182418800017408UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      -1.0 / 0.0,
      0UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
    ],
  )
}

///|
fn secondary_transform_source_case_38() -> Unit raise {
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
  let parent = fig.add_axes(0.2, 0.25, 0.5, 0.5)
  parent.set_xlim(1.0, 4.0)
  parent.set_ylim(10.0, 20.0)
  let child = parent.secondary_xaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Position(0.25),
    transform=Some(
      @transforms.affine_from_values(
        4607182418800017408UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        0.0 / 0.0,
      ),
    ),
  )
  {
    secondary_transform_source_double(
      child.position(),
      4598175219545276416UL.reinterpret_as_double(),
    )
    guard child.location() is SecondaryAxisLocation::Position(raw_location) else {
      fail("expected numeric location")
    }
    secondary_transform_source_double(
      raw_location,
      4598175219545276416UL.reinterpret_as_double(),
    )
    assert_true(child.alignment() is SecondaryAxisAlignment::Bottom)
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    {
      let view = child.numeric_axis.stored_view_limits()
      secondary_transform_source_numbers([view.lower(), view.upper()], [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ])
    }
    {
      let box = child.display_bounds()
      secondary_transform_source_numbers(
        [box.x0(), box.y0(), box.width(), box.height()],
        [
          0UL.reinterpret_as_double(),
          4642648265865560064UL.reinterpret_as_double(),
          4644337115725824000UL.reinterpret_as_double(),
          4582574750436065280UL.reinterpret_as_double(),
        ],
      )
    }
    assert_eq(
      [
        secondary_transform_source_major_class(child.locator().unwrap()),
        secondary_transform_source_minor_class(child.minor_locator().unwrap()),
        secondary_transform_source_formatter_class(
          child.named_formatter().unwrap(),
        ),
        secondary_transform_source_formatter_class(
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
  }
  child.positioned_aspect(64.0, 60.0, 160.0, 120.0)
  {
    secondary_transform_source_double(
      child.position(),
      4598175219545276416UL.reinterpret_as_double(),
    )
    guard child.location() is SecondaryAxisLocation::Position(raw_location) else {
      fail("expected numeric location")
    }
    secondary_transform_source_double(
      raw_location,
      4598175219545276416UL.reinterpret_as_double(),
    )
    assert_true(child.alignment() is SecondaryAxisAlignment::Bottom)
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    {
      let view = child.numeric_axis.stored_view_limits()
      secondary_transform_source_numbers([view.lower(), view.upper()], [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ])
    }
    {
      let box = child.display_bounds()
      secondary_transform_source_numbers(
        [box.x0(), box.y0(), box.width(), box.height()],
        [0.0 / 0.0, 0.0 / 0.0, 0.0 / 0.0, 0.0 / 0.0],
      )
    }
    assert_eq(
      [
        secondary_transform_source_major_class(child.locator().unwrap()),
        secondary_transform_source_minor_class(child.minor_locator().unwrap()),
        secondary_transform_source_formatter_class(
          child.named_formatter().unwrap(),
        ),
        secondary_transform_source_formatter_class(
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
  }
  secondary_transform_source_double(
    child.location_locator.position,
    4598175219545276416UL.reinterpret_as_double(),
  )
  let installed = child.location_locator.transform.unwrap()
  secondary_transform_source_numbers(
    [
      installed.a,
      installed.b,
      installed.c,
      installed.d,
      installed.e,
      installed.f,
    ],
    [
      4607182418800017408UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      0.0 / 0.0,
    ],
  )
}

///|
fn secondary_transform_source_case_39() -> Unit raise {
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
  let parent = fig.add_axes(0.2, 0.25, 0.5, 0.5)
  parent.set_xlim(1.0, 4.0)
  parent.set_ylim(10.0, 20.0)
  let child = parent.secondary_xaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Position(0.25),
    transform=Some(
      @transforms.affine_from_values(
        4607182418800017408UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        1.0 / 0.0,
      ),
    ),
  )
  {
    secondary_transform_source_double(
      child.position(),
      4598175219545276416UL.reinterpret_as_double(),
    )
    guard child.location() is SecondaryAxisLocation::Position(raw_location) else {
      fail("expected numeric location")
    }
    secondary_transform_source_double(
      raw_location,
      4598175219545276416UL.reinterpret_as_double(),
    )
    assert_true(child.alignment() is SecondaryAxisAlignment::Bottom)
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    {
      let view = child.numeric_axis.stored_view_limits()
      secondary_transform_source_numbers([view.lower(), view.upper()], [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ])
    }
    {
      let box = child.display_bounds()
      secondary_transform_source_numbers(
        [box.x0(), box.y0(), box.width(), box.height()],
        [
          0UL.reinterpret_as_double(),
          4642648265865560064UL.reinterpret_as_double(),
          4644337115725824000UL.reinterpret_as_double(),
          4582574750436065280UL.reinterpret_as_double(),
        ],
      )
    }
    assert_eq(
      [
        secondary_transform_source_major_class(child.locator().unwrap()),
        secondary_transform_source_minor_class(child.minor_locator().unwrap()),
        secondary_transform_source_formatter_class(
          child.named_formatter().unwrap(),
        ),
        secondary_transform_source_formatter_class(
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
  }
  child.positioned_aspect(64.0, 60.0, 160.0, 120.0)
  {
    secondary_transform_source_double(
      child.position(),
      4598175219545276416UL.reinterpret_as_double(),
    )
    guard child.location() is SecondaryAxisLocation::Position(raw_location) else {
      fail("expected numeric location")
    }
    secondary_transform_source_double(
      raw_location,
      4598175219545276416UL.reinterpret_as_double(),
    )
    assert_true(child.alignment() is SecondaryAxisAlignment::Bottom)
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    {
      let view = child.numeric_axis.stored_view_limits()
      secondary_transform_source_numbers([view.lower(), view.upper()], [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ])
    }
    {
      let box = child.display_bounds()
      secondary_transform_source_numbers(
        [box.x0(), box.y0(), box.width(), box.height()],
        [0.0 / 0.0, 0.0 / 0.0, 0.0 / 0.0, 0.0 / 0.0],
      )
    }
    assert_eq(
      [
        secondary_transform_source_major_class(child.locator().unwrap()),
        secondary_transform_source_minor_class(child.minor_locator().unwrap()),
        secondary_transform_source_formatter_class(
          child.named_formatter().unwrap(),
        ),
        secondary_transform_source_formatter_class(
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
  }
  secondary_transform_source_double(
    child.location_locator.position,
    4598175219545276416UL.reinterpret_as_double(),
  )
  let installed = child.location_locator.transform.unwrap()
  secondary_transform_source_numbers(
    [
      installed.a,
      installed.b,
      installed.c,
      installed.d,
      installed.e,
      installed.f,
    ],
    [
      4607182418800017408UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      1.0 / 0.0,
    ],
  )
}

///|
fn secondary_transform_source_case_40() -> Unit raise {
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
  let parent = fig.add_axes(0.2, 0.25, 0.5, 0.5)
  parent.set_xlim(1.0, 4.0)
  parent.set_ylim(10.0, 20.0)
  let child = parent.secondary_xaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Position(0.25),
    transform=Some(
      @transforms.affine_from_values(
        4607182418800017408UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        -1.0 / 0.0,
      ),
    ),
  )
  {
    secondary_transform_source_double(
      child.position(),
      4598175219545276416UL.reinterpret_as_double(),
    )
    guard child.location() is SecondaryAxisLocation::Position(raw_location) else {
      fail("expected numeric location")
    }
    secondary_transform_source_double(
      raw_location,
      4598175219545276416UL.reinterpret_as_double(),
    )
    assert_true(child.alignment() is SecondaryAxisAlignment::Bottom)
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    {
      let view = child.numeric_axis.stored_view_limits()
      secondary_transform_source_numbers([view.lower(), view.upper()], [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ])
    }
    {
      let box = child.display_bounds()
      secondary_transform_source_numbers(
        [box.x0(), box.y0(), box.width(), box.height()],
        [
          0UL.reinterpret_as_double(),
          4642648265865560064UL.reinterpret_as_double(),
          4644337115725824000UL.reinterpret_as_double(),
          4582574750436065280UL.reinterpret_as_double(),
        ],
      )
    }
    assert_eq(
      [
        secondary_transform_source_major_class(child.locator().unwrap()),
        secondary_transform_source_minor_class(child.minor_locator().unwrap()),
        secondary_transform_source_formatter_class(
          child.named_formatter().unwrap(),
        ),
        secondary_transform_source_formatter_class(
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
  }
  child.positioned_aspect(64.0, 60.0, 160.0, 120.0)
  {
    secondary_transform_source_double(
      child.position(),
      4598175219545276416UL.reinterpret_as_double(),
    )
    guard child.location() is SecondaryAxisLocation::Position(raw_location) else {
      fail("expected numeric location")
    }
    secondary_transform_source_double(
      raw_location,
      4598175219545276416UL.reinterpret_as_double(),
    )
    assert_true(child.alignment() is SecondaryAxisAlignment::Bottom)
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    {
      let view = child.numeric_axis.stored_view_limits()
      secondary_transform_source_numbers([view.lower(), view.upper()], [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ])
    }
    {
      let box = child.display_bounds()
      secondary_transform_source_numbers(
        [box.x0(), box.y0(), box.width(), box.height()],
        [0.0 / 0.0, 0.0 / 0.0, 0.0 / 0.0, 0.0 / 0.0],
      )
    }
    assert_eq(
      [
        secondary_transform_source_major_class(child.locator().unwrap()),
        secondary_transform_source_minor_class(child.minor_locator().unwrap()),
        secondary_transform_source_formatter_class(
          child.named_formatter().unwrap(),
        ),
        secondary_transform_source_formatter_class(
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
  }
  secondary_transform_source_double(
    child.location_locator.position,
    4598175219545276416UL.reinterpret_as_double(),
  )
  let installed = child.location_locator.transform.unwrap()
  secondary_transform_source_numbers(
    [
      installed.a,
      installed.b,
      installed.c,
      installed.d,
      installed.e,
      installed.f,
    ],
    [
      4607182418800017408UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      -1.0 / 0.0,
    ],
  )
}

///|
fn secondary_transform_source_case_41() -> Unit raise {
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
  let parent = fig.add_axes(0.2, 0.25, 0.5, 0.5)
  parent.set_xlim(1.0, 4.0)
  parent.set_ylim(10.0, 20.0)
  let child = parent.secondary_xaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Position(0.25),
    transform=None,
  )
  assert_true(
    try {
      child.set_location(
        SecondaryAxisLocation::Position(0.75),
        transform=Some(
          @transforms.affine_from_values(
            4607182418800017408UL.reinterpret_as_double(),
            0.0 / 0.0,
            0UL.reinterpret_as_double(),
            4607182418800017408UL.reinterpret_as_double(),
            0UL.reinterpret_as_double(),
            0UL.reinterpret_as_double(),
          ),
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  {
    secondary_transform_source_double(
      child.position(),
      4604930618986332160UL.reinterpret_as_double(),
    )
    guard child.location() is SecondaryAxisLocation::Position(raw_location) else {
      fail("expected numeric location")
    }
    secondary_transform_source_double(
      raw_location,
      4604930618986332160UL.reinterpret_as_double(),
    )
    assert_true(child.alignment() is SecondaryAxisAlignment::Bottom)
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    {
      let view = child.numeric_axis.stored_view_limits()
      secondary_transform_source_numbers([view.lower(), view.upper()], [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ])
    }
    {
      let box = child.display_bounds()
      secondary_transform_source_numbers(
        [box.x0(), box.y0(), box.width(), box.height()],
        [
          0UL.reinterpret_as_double(),
          4642648265865560064UL.reinterpret_as_double(),
          4644337115725824000UL.reinterpret_as_double(),
          4582574750436065280UL.reinterpret_as_double(),
        ],
      )
    }
    assert_eq(
      [
        secondary_transform_source_major_class(child.locator().unwrap()),
        secondary_transform_source_minor_class(child.minor_locator().unwrap()),
        secondary_transform_source_formatter_class(
          child.named_formatter().unwrap(),
        ),
        secondary_transform_source_formatter_class(
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
  }
  secondary_transform_source_double(
    child.location_locator.position,
    4598175219545276416UL.reinterpret_as_double(),
  )
  assert_true(child.location_locator.transform is None)
  child.positioned_aspect(64.0, 60.0, 160.0, 120.0)
  {
    secondary_transform_source_double(
      child.position(),
      4604930618986332160UL.reinterpret_as_double(),
    )
    guard child.location() is SecondaryAxisLocation::Position(raw_location) else {
      fail("expected numeric location")
    }
    secondary_transform_source_double(
      raw_location,
      4604930618986332160UL.reinterpret_as_double(),
    )
    assert_true(child.alignment() is SecondaryAxisAlignment::Bottom)
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    {
      let view = child.numeric_axis.stored_view_limits()
      secondary_transform_source_numbers([view.lower(), view.upper()], [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ])
    }
    {
      let box = child.display_bounds()
      secondary_transform_source_numbers(
        [box.x0(), box.y0(), box.width(), box.height()],
        [
          4634204016564240384UL.reinterpret_as_double(),
          4636033603912859648UL.reinterpret_as_double(),
          4639833516098453504UL.reinterpret_as_double(),
          4488335184751493120UL.reinterpret_as_double(),
        ],
      )
    }
    assert_eq(
      [
        secondary_transform_source_major_class(child.locator().unwrap()),
        secondary_transform_source_minor_class(child.minor_locator().unwrap()),
        secondary_transform_source_formatter_class(
          child.named_formatter().unwrap(),
        ),
        secondary_transform_source_formatter_class(
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
  }
  secondary_transform_source_double(
    child.location_locator.position,
    4598175219545276416UL.reinterpret_as_double(),
  )
  assert_true(child.location_locator.transform is None)
}

///|
fn secondary_transform_source_case_42() -> Unit raise {
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
  let parent = fig.add_axes(0.2, 0.25, 0.5, 0.5)
  parent.set_xlim(1.0, 4.0)
  parent.set_ylim(10.0, 20.0)
  let child = parent.secondary_xaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Position(0.25),
    transform=None,
  )
  assert_true(
    try {
      child.set_location(
        SecondaryAxisLocation::Position(0.75),
        transform=Some(
          @transforms.affine_from_values(
            4607182418800017408UL.reinterpret_as_double(),
            0UL.reinterpret_as_double(),
            0.0 / 0.0,
            4607182418800017408UL.reinterpret_as_double(),
            0UL.reinterpret_as_double(),
            0UL.reinterpret_as_double(),
          ),
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  {
    secondary_transform_source_double(
      child.position(),
      4604930618986332160UL.reinterpret_as_double(),
    )
    guard child.location() is SecondaryAxisLocation::Position(raw_location) else {
      fail("expected numeric location")
    }
    secondary_transform_source_double(
      raw_location,
      4604930618986332160UL.reinterpret_as_double(),
    )
    assert_true(child.alignment() is SecondaryAxisAlignment::Bottom)
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    {
      let view = child.numeric_axis.stored_view_limits()
      secondary_transform_source_numbers([view.lower(), view.upper()], [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ])
    }
    {
      let box = child.display_bounds()
      secondary_transform_source_numbers(
        [box.x0(), box.y0(), box.width(), box.height()],
        [
          0UL.reinterpret_as_double(),
          4642648265865560064UL.reinterpret_as_double(),
          4644337115725824000UL.reinterpret_as_double(),
          4582574750436065280UL.reinterpret_as_double(),
        ],
      )
    }
    assert_eq(
      [
        secondary_transform_source_major_class(child.locator().unwrap()),
        secondary_transform_source_minor_class(child.minor_locator().unwrap()),
        secondary_transform_source_formatter_class(
          child.named_formatter().unwrap(),
        ),
        secondary_transform_source_formatter_class(
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
  }
  secondary_transform_source_double(
    child.location_locator.position,
    4598175219545276416UL.reinterpret_as_double(),
  )
  assert_true(child.location_locator.transform is None)
  child.positioned_aspect(64.0, 60.0, 160.0, 120.0)
  {
    secondary_transform_source_double(
      child.position(),
      4604930618986332160UL.reinterpret_as_double(),
    )
    guard child.location() is SecondaryAxisLocation::Position(raw_location) else {
      fail("expected numeric location")
    }
    secondary_transform_source_double(
      raw_location,
      4604930618986332160UL.reinterpret_as_double(),
    )
    assert_true(child.alignment() is SecondaryAxisAlignment::Bottom)
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    {
      let view = child.numeric_axis.stored_view_limits()
      secondary_transform_source_numbers([view.lower(), view.upper()], [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ])
    }
    {
      let box = child.display_bounds()
      secondary_transform_source_numbers(
        [box.x0(), box.y0(), box.width(), box.height()],
        [
          4634204016564240384UL.reinterpret_as_double(),
          4636033603912859648UL.reinterpret_as_double(),
          4639833516098453504UL.reinterpret_as_double(),
          4488335184751493120UL.reinterpret_as_double(),
        ],
      )
    }
    assert_eq(
      [
        secondary_transform_source_major_class(child.locator().unwrap()),
        secondary_transform_source_minor_class(child.minor_locator().unwrap()),
        secondary_transform_source_formatter_class(
          child.named_formatter().unwrap(),
        ),
        secondary_transform_source_formatter_class(
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
  }
  secondary_transform_source_double(
    child.location_locator.position,
    4598175219545276416UL.reinterpret_as_double(),
  )
  assert_true(child.location_locator.transform is None)
}

///|
fn secondary_transform_source_case_43() -> Unit raise {
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
  let parent = fig.add_axes(0.2, 0.25, 0.5, 0.5)
  parent.set_xlim(1.0, 4.0)
  parent.set_ylim(10.0, 20.0)
  let child = parent.secondary_yaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Position(0.25),
    transform=None,
  )
  assert_true(
    try {
      child.set_location(
        SecondaryAxisLocation::Position(0.75),
        transform=Some(
          @transforms.affine_from_values(
            4605975682916830379UL.reinterpret_as_double(),
            4602678819172646911UL.reinterpret_as_double(),
            13826050856027422719UL.reinterpret_as_double(),
            4605975682916830379UL.reinterpret_as_double(),
            0UL.reinterpret_as_double(),
            0UL.reinterpret_as_double(),
          ),
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  {
    secondary_transform_source_double(
      child.position(),
      4604930618986332160UL.reinterpret_as_double(),
    )
    guard child.location() is SecondaryAxisLocation::Position(raw_location) else {
      fail("expected numeric location")
    }
    secondary_transform_source_double(
      raw_location,
      4604930618986332160UL.reinterpret_as_double(),
    )
    assert_true(child.alignment() is SecondaryAxisAlignment::Left)
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    {
      let view = child.numeric_axis.stored_view_limits()
      secondary_transform_source_numbers([view.lower(), view.upper()], [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ])
    }
    {
      let box = child.display_bounds()
      secondary_transform_source_numbers(
        [box.x0(), box.y0(), box.width(), box.height()],
        [
          0UL.reinterpret_as_double(),
          4642648265865560064UL.reinterpret_as_double(),
          4584772507054221820UL.reinterpret_as_double(),
          4642648265865560064UL.reinterpret_as_double(),
        ],
      )
    }
    assert_eq(
      [
        secondary_transform_source_major_class(child.locator().unwrap()),
        secondary_transform_source_minor_class(child.minor_locator().unwrap()),
        secondary_transform_source_formatter_class(
          child.named_formatter().unwrap(),
        ),
        secondary_transform_source_formatter_class(
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
  }
  secondary_transform_source_double(
    child.location_locator.position,
    4598175219545276416UL.reinterpret_as_double(),
  )
  assert_true(child.location_locator.transform is None)
  child.positioned_aspect(64.0, 60.0, 160.0, 120.0)
  {
    secondary_transform_source_double(
      child.position(),
      4604930618986332160UL.reinterpret_as_double(),
    )
    guard child.location() is SecondaryAxisLocation::Position(raw_location) else {
      fail("expected numeric location")
    }
    secondary_transform_source_double(
      raw_location,
      4604930618986332160UL.reinterpret_as_double(),
    )
    assert_true(child.alignment() is SecondaryAxisAlignment::Left)
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    {
      let view = child.numeric_axis.stored_view_limits()
      secondary_transform_source_numbers([view.lower(), view.upper()], [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ])
    }
    {
      let box = child.display_bounds()
      secondary_transform_source_numbers(
        [box.x0(), box.y0(), box.width(), box.height()],
        [
          4637018766331346944UL.reinterpret_as_double(),
          4633641066610819072UL.reinterpret_as_double(),
          4490420932539580416UL.reinterpret_as_double(),
          4638144666238189568UL.reinterpret_as_double(),
        ],
      )
    }
    assert_eq(
      [
        secondary_transform_source_major_class(child.locator().unwrap()),
        secondary_transform_source_minor_class(child.minor_locator().unwrap()),
        secondary_transform_source_formatter_class(
          child.named_formatter().unwrap(),
        ),
        secondary_transform_source_formatter_class(
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
  }
  secondary_transform_source_double(
    child.location_locator.position,
    4598175219545276416UL.reinterpret_as_double(),
  )
  assert_true(child.location_locator.transform is None)
}

///|
fn secondary_transform_source_case_44() -> Unit raise {
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
  let parent = fig.add_axes(0.2, 0.25, 0.5, 0.5)
  parent.set_xlim(1.0, 4.0)
  parent.set_ylim(10.0, 20.0)
  let child = parent.secondary_yaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Position(0.25),
    transform=Some(
      @transforms.affine_from_values(
        0.0 / 0.0,
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
      ),
    ),
  )
  {
    secondary_transform_source_double(
      child.position(),
      4598175219545276416UL.reinterpret_as_double(),
    )
    guard child.location() is SecondaryAxisLocation::Position(raw_location) else {
      fail("expected numeric location")
    }
    secondary_transform_source_double(
      raw_location,
      4598175219545276416UL.reinterpret_as_double(),
    )
    assert_true(child.alignment() is SecondaryAxisAlignment::Left)
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    {
      let view = child.numeric_axis.stored_view_limits()
      secondary_transform_source_numbers([view.lower(), view.upper()], [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ])
    }
    {
      let box = child.display_bounds()
      secondary_transform_source_numbers(
        [box.x0(), box.y0(), box.width(), box.height()],
        [
          0UL.reinterpret_as_double(),
          4642648265865560064UL.reinterpret_as_double(),
          4584772507054221820UL.reinterpret_as_double(),
          4642648265865560064UL.reinterpret_as_double(),
        ],
      )
    }
    assert_eq(
      [
        secondary_transform_source_major_class(child.locator().unwrap()),
        secondary_transform_source_minor_class(child.minor_locator().unwrap()),
        secondary_transform_source_formatter_class(
          child.named_formatter().unwrap(),
        ),
        secondary_transform_source_formatter_class(
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
  }
  child.positioned_aspect(64.0, 60.0, 160.0, 120.0)
  {
    secondary_transform_source_double(
      child.position(),
      4598175219545276416UL.reinterpret_as_double(),
    )
    guard child.location() is SecondaryAxisLocation::Position(raw_location) else {
      fail("expected numeric location")
    }
    secondary_transform_source_double(
      raw_location,
      4598175219545276416UL.reinterpret_as_double(),
    )
    assert_true(child.alignment() is SecondaryAxisAlignment::Left)
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    {
      let view = child.numeric_axis.stored_view_limits()
      secondary_transform_source_numbers([view.lower(), view.upper()], [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ])
    }
    {
      let box = child.display_bounds()
      secondary_transform_source_numbers(
        [box.x0(), box.y0(), box.width(), box.height()],
        [0.0 / 0.0, 0.0 / 0.0, 0.0 / 0.0, 0.0 / 0.0],
      )
    }
    assert_eq(
      [
        secondary_transform_source_major_class(child.locator().unwrap()),
        secondary_transform_source_minor_class(child.minor_locator().unwrap()),
        secondary_transform_source_formatter_class(
          child.named_formatter().unwrap(),
        ),
        secondary_transform_source_formatter_class(
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
  }
  secondary_transform_source_double(
    child.location_locator.position,
    4598175219545276416UL.reinterpret_as_double(),
  )
  let installed = child.location_locator.transform.unwrap()
  secondary_transform_source_numbers(
    [
      installed.a,
      installed.b,
      installed.c,
      installed.d,
      installed.e,
      installed.f,
    ],
    [
      0.0 / 0.0,
      0UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
    ],
  )
}

///|
fn secondary_transform_source_case_45() -> Unit raise {
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
  let parent = fig.add_axes(0.2, 0.25, 0.5, 0.5)
  parent.set_xlim(1.0, 4.0)
  parent.set_ylim(10.0, 20.0)
  let child = parent.secondary_yaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Position(0.25),
    transform=Some(
      @transforms.affine_from_values(
        1.0 / 0.0,
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
      ),
    ),
  )
  {
    secondary_transform_source_double(
      child.position(),
      4598175219545276416UL.reinterpret_as_double(),
    )
    guard child.location() is SecondaryAxisLocation::Position(raw_location) else {
      fail("expected numeric location")
    }
    secondary_transform_source_double(
      raw_location,
      4598175219545276416UL.reinterpret_as_double(),
    )
    assert_true(child.alignment() is SecondaryAxisAlignment::Left)
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    {
      let view = child.numeric_axis.stored_view_limits()
      secondary_transform_source_numbers([view.lower(), view.upper()], [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ])
    }
    {
      let box = child.display_bounds()
      secondary_transform_source_numbers(
        [box.x0(), box.y0(), box.width(), box.height()],
        [
          0UL.reinterpret_as_double(),
          4642648265865560064UL.reinterpret_as_double(),
          4584772507054221820UL.reinterpret_as_double(),
          4642648265865560064UL.reinterpret_as_double(),
        ],
      )
    }
    assert_eq(
      [
        secondary_transform_source_major_class(child.locator().unwrap()),
        secondary_transform_source_minor_class(child.minor_locator().unwrap()),
        secondary_transform_source_formatter_class(
          child.named_formatter().unwrap(),
        ),
        secondary_transform_source_formatter_class(
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
  }
  child.positioned_aspect(64.0, 60.0, 160.0, 120.0)
  {
    secondary_transform_source_double(
      child.position(),
      4598175219545276416UL.reinterpret_as_double(),
    )
    guard child.location() is SecondaryAxisLocation::Position(raw_location) else {
      fail("expected numeric location")
    }
    secondary_transform_source_double(
      raw_location,
      4598175219545276416UL.reinterpret_as_double(),
    )
    assert_true(child.alignment() is SecondaryAxisAlignment::Left)
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    {
      let view = child.numeric_axis.stored_view_limits()
      secondary_transform_source_numbers([view.lower(), view.upper()], [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ])
    }
    {
      let box = child.display_bounds()
      secondary_transform_source_numbers(
        [box.x0(), box.y0(), box.width(), box.height()],
        [0.0 / 0.0, 0.0 / 0.0, 0.0 / 0.0, 0.0 / 0.0],
      )
    }
    assert_eq(
      [
        secondary_transform_source_major_class(child.locator().unwrap()),
        secondary_transform_source_minor_class(child.minor_locator().unwrap()),
        secondary_transform_source_formatter_class(
          child.named_formatter().unwrap(),
        ),
        secondary_transform_source_formatter_class(
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
  }
  secondary_transform_source_double(
    child.location_locator.position,
    4598175219545276416UL.reinterpret_as_double(),
  )
  let installed = child.location_locator.transform.unwrap()
  secondary_transform_source_numbers(
    [
      installed.a,
      installed.b,
      installed.c,
      installed.d,
      installed.e,
      installed.f,
    ],
    [
      1.0 / 0.0,
      0UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
    ],
  )
}

///|
fn secondary_transform_source_case_46() -> Unit raise {
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
  let parent = fig.add_axes(0.2, 0.25, 0.5, 0.5)
  parent.set_xlim(1.0, 4.0)
  parent.set_ylim(10.0, 20.0)
  let child = parent.secondary_yaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Position(0.25),
    transform=Some(
      @transforms.affine_from_values(
        -1.0 / 0.0,
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
      ),
    ),
  )
  {
    secondary_transform_source_double(
      child.position(),
      4598175219545276416UL.reinterpret_as_double(),
    )
    guard child.location() is SecondaryAxisLocation::Position(raw_location) else {
      fail("expected numeric location")
    }
    secondary_transform_source_double(
      raw_location,
      4598175219545276416UL.reinterpret_as_double(),
    )
    assert_true(child.alignment() is SecondaryAxisAlignment::Left)
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    {
      let view = child.numeric_axis.stored_view_limits()
      secondary_transform_source_numbers([view.lower(), view.upper()], [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ])
    }
    {
      let box = child.display_bounds()
      secondary_transform_source_numbers(
        [box.x0(), box.y0(), box.width(), box.height()],
        [
          0UL.reinterpret_as_double(),
          4642648265865560064UL.reinterpret_as_double(),
          4584772507054221820UL.reinterpret_as_double(),
          4642648265865560064UL.reinterpret_as_double(),
        ],
      )
    }
    assert_eq(
      [
        secondary_transform_source_major_class(child.locator().unwrap()),
        secondary_transform_source_minor_class(child.minor_locator().unwrap()),
        secondary_transform_source_formatter_class(
          child.named_formatter().unwrap(),
        ),
        secondary_transform_source_formatter_class(
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
  }
  child.positioned_aspect(64.0, 60.0, 160.0, 120.0)
  {
    secondary_transform_source_double(
      child.position(),
      4598175219545276416UL.reinterpret_as_double(),
    )
    guard child.location() is SecondaryAxisLocation::Position(raw_location) else {
      fail("expected numeric location")
    }
    secondary_transform_source_double(
      raw_location,
      4598175219545276416UL.reinterpret_as_double(),
    )
    assert_true(child.alignment() is SecondaryAxisAlignment::Left)
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    {
      let view = child.numeric_axis.stored_view_limits()
      secondary_transform_source_numbers([view.lower(), view.upper()], [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ])
    }
    {
      let box = child.display_bounds()
      secondary_transform_source_numbers(
        [box.x0(), box.y0(), box.width(), box.height()],
        [0.0 / 0.0, 0.0 / 0.0, 0.0 / 0.0, 0.0 / 0.0],
      )
    }
    assert_eq(
      [
        secondary_transform_source_major_class(child.locator().unwrap()),
        secondary_transform_source_minor_class(child.minor_locator().unwrap()),
        secondary_transform_source_formatter_class(
          child.named_formatter().unwrap(),
        ),
        secondary_transform_source_formatter_class(
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
  }
  secondary_transform_source_double(
    child.location_locator.position,
    4598175219545276416UL.reinterpret_as_double(),
  )
  let installed = child.location_locator.transform.unwrap()
  secondary_transform_source_numbers(
    [
      installed.a,
      installed.b,
      installed.c,
      installed.d,
      installed.e,
      installed.f,
    ],
    [
      -1.0 / 0.0,
      0UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
    ],
  )
}

///|
fn secondary_transform_source_case_47() -> Unit raise {
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
  let parent = fig.add_axes(0.2, 0.25, 0.5, 0.5)
  parent.set_xlim(1.0, 4.0)
  parent.set_ylim(10.0, 20.0)
  let child = parent.secondary_yaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Position(0.25),
    transform=Some(
      @transforms.affine_from_values(
        4607182418800017408UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        0.0 / 0.0,
        0UL.reinterpret_as_double(),
      ),
    ),
  )
  {
    secondary_transform_source_double(
      child.position(),
      4598175219545276416UL.reinterpret_as_double(),
    )
    guard child.location() is SecondaryAxisLocation::Position(raw_location) else {
      fail("expected numeric location")
    }
    secondary_transform_source_double(
      raw_location,
      4598175219545276416UL.reinterpret_as_double(),
    )
    assert_true(child.alignment() is SecondaryAxisAlignment::Left)
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    {
      let view = child.numeric_axis.stored_view_limits()
      secondary_transform_source_numbers([view.lower(), view.upper()], [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ])
    }
    {
      let box = child.display_bounds()
      secondary_transform_source_numbers(
        [box.x0(), box.y0(), box.width(), box.height()],
        [
          0UL.reinterpret_as_double(),
          4642648265865560064UL.reinterpret_as_double(),
          4584772507054221820UL.reinterpret_as_double(),
          4642648265865560064UL.reinterpret_as_double(),
        ],
      )
    }
    assert_eq(
      [
        secondary_transform_source_major_class(child.locator().unwrap()),
        secondary_transform_source_minor_class(child.minor_locator().unwrap()),
        secondary_transform_source_formatter_class(
          child.named_formatter().unwrap(),
        ),
        secondary_transform_source_formatter_class(
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
  }
  child.positioned_aspect(64.0, 60.0, 160.0, 120.0)
  {
    secondary_transform_source_double(
      child.position(),
      4598175219545276416UL.reinterpret_as_double(),
    )
    guard child.location() is SecondaryAxisLocation::Position(raw_location) else {
      fail("expected numeric location")
    }
    secondary_transform_source_double(
      raw_location,
      4598175219545276416UL.reinterpret_as_double(),
    )
    assert_true(child.alignment() is SecondaryAxisAlignment::Left)
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    {
      let view = child.numeric_axis.stored_view_limits()
      secondary_transform_source_numbers([view.lower(), view.upper()], [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ])
    }
    {
      let box = child.display_bounds()
      secondary_transform_source_numbers(
        [box.x0(), box.y0(), box.width(), box.height()],
        [0.0 / 0.0, 0.0 / 0.0, 0.0 / 0.0, 0.0 / 0.0],
      )
    }
    assert_eq(
      [
        secondary_transform_source_major_class(child.locator().unwrap()),
        secondary_transform_source_minor_class(child.minor_locator().unwrap()),
        secondary_transform_source_formatter_class(
          child.named_formatter().unwrap(),
        ),
        secondary_transform_source_formatter_class(
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
  }
  secondary_transform_source_double(
    child.location_locator.position,
    4598175219545276416UL.reinterpret_as_double(),
  )
  let installed = child.location_locator.transform.unwrap()
  secondary_transform_source_numbers(
    [
      installed.a,
      installed.b,
      installed.c,
      installed.d,
      installed.e,
      installed.f,
    ],
    [
      4607182418800017408UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      0.0 / 0.0,
      0UL.reinterpret_as_double(),
    ],
  )
}

///|
fn secondary_transform_source_case_48() -> Unit raise {
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
  let parent = fig.add_axes(0.2, 0.25, 0.5, 0.5)
  parent.set_xlim(1.0, 4.0)
  parent.set_ylim(10.0, 20.0)
  let child = parent.secondary_yaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Position(0.25),
    transform=Some(
      @transforms.affine_from_values(
        4607182418800017408UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        1.0 / 0.0,
        0UL.reinterpret_as_double(),
      ),
    ),
  )
  {
    secondary_transform_source_double(
      child.position(),
      4598175219545276416UL.reinterpret_as_double(),
    )
    guard child.location() is SecondaryAxisLocation::Position(raw_location) else {
      fail("expected numeric location")
    }
    secondary_transform_source_double(
      raw_location,
      4598175219545276416UL.reinterpret_as_double(),
    )
    assert_true(child.alignment() is SecondaryAxisAlignment::Left)
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    {
      let view = child.numeric_axis.stored_view_limits()
      secondary_transform_source_numbers([view.lower(), view.upper()], [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ])
    }
    {
      let box = child.display_bounds()
      secondary_transform_source_numbers(
        [box.x0(), box.y0(), box.width(), box.height()],
        [
          0UL.reinterpret_as_double(),
          4642648265865560064UL.reinterpret_as_double(),
          4584772507054221820UL.reinterpret_as_double(),
          4642648265865560064UL.reinterpret_as_double(),
        ],
      )
    }
    assert_eq(
      [
        secondary_transform_source_major_class(child.locator().unwrap()),
        secondary_transform_source_minor_class(child.minor_locator().unwrap()),
        secondary_transform_source_formatter_class(
          child.named_formatter().unwrap(),
        ),
        secondary_transform_source_formatter_class(
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
  }
  child.positioned_aspect(64.0, 60.0, 160.0, 120.0)
  {
    secondary_transform_source_double(
      child.position(),
      4598175219545276416UL.reinterpret_as_double(),
    )
    guard child.location() is SecondaryAxisLocation::Position(raw_location) else {
      fail("expected numeric location")
    }
    secondary_transform_source_double(
      raw_location,
      4598175219545276416UL.reinterpret_as_double(),
    )
    assert_true(child.alignment() is SecondaryAxisAlignment::Left)
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    {
      let view = child.numeric_axis.stored_view_limits()
      secondary_transform_source_numbers([view.lower(), view.upper()], [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ])
    }
    {
      let box = child.display_bounds()
      secondary_transform_source_numbers(
        [box.x0(), box.y0(), box.width(), box.height()],
        [0.0 / 0.0, 0.0 / 0.0, 0.0 / 0.0, 0.0 / 0.0],
      )
    }
    assert_eq(
      [
        secondary_transform_source_major_class(child.locator().unwrap()),
        secondary_transform_source_minor_class(child.minor_locator().unwrap()),
        secondary_transform_source_formatter_class(
          child.named_formatter().unwrap(),
        ),
        secondary_transform_source_formatter_class(
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
  }
  secondary_transform_source_double(
    child.location_locator.position,
    4598175219545276416UL.reinterpret_as_double(),
  )
  let installed = child.location_locator.transform.unwrap()
  secondary_transform_source_numbers(
    [
      installed.a,
      installed.b,
      installed.c,
      installed.d,
      installed.e,
      installed.f,
    ],
    [
      4607182418800017408UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      1.0 / 0.0,
      0UL.reinterpret_as_double(),
    ],
  )
}

///|
fn secondary_transform_source_case_49() -> Unit raise {
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
  let parent = fig.add_axes(0.2, 0.25, 0.5, 0.5)
  parent.set_xlim(1.0, 4.0)
  parent.set_ylim(10.0, 20.0)
  let child = parent.secondary_yaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Position(0.25),
    transform=Some(
      @transforms.affine_from_values(
        4607182418800017408UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        -1.0 / 0.0,
        0UL.reinterpret_as_double(),
      ),
    ),
  )
  {
    secondary_transform_source_double(
      child.position(),
      4598175219545276416UL.reinterpret_as_double(),
    )
    guard child.location() is SecondaryAxisLocation::Position(raw_location) else {
      fail("expected numeric location")
    }
    secondary_transform_source_double(
      raw_location,
      4598175219545276416UL.reinterpret_as_double(),
    )
    assert_true(child.alignment() is SecondaryAxisAlignment::Left)
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    {
      let view = child.numeric_axis.stored_view_limits()
      secondary_transform_source_numbers([view.lower(), view.upper()], [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ])
    }
    {
      let box = child.display_bounds()
      secondary_transform_source_numbers(
        [box.x0(), box.y0(), box.width(), box.height()],
        [
          0UL.reinterpret_as_double(),
          4642648265865560064UL.reinterpret_as_double(),
          4584772507054221820UL.reinterpret_as_double(),
          4642648265865560064UL.reinterpret_as_double(),
        ],
      )
    }
    assert_eq(
      [
        secondary_transform_source_major_class(child.locator().unwrap()),
        secondary_transform_source_minor_class(child.minor_locator().unwrap()),
        secondary_transform_source_formatter_class(
          child.named_formatter().unwrap(),
        ),
        secondary_transform_source_formatter_class(
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
  }
  child.positioned_aspect(64.0, 60.0, 160.0, 120.0)
  {
    secondary_transform_source_double(
      child.position(),
      4598175219545276416UL.reinterpret_as_double(),
    )
    guard child.location() is SecondaryAxisLocation::Position(raw_location) else {
      fail("expected numeric location")
    }
    secondary_transform_source_double(
      raw_location,
      4598175219545276416UL.reinterpret_as_double(),
    )
    assert_true(child.alignment() is SecondaryAxisAlignment::Left)
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    {
      let view = child.numeric_axis.stored_view_limits()
      secondary_transform_source_numbers([view.lower(), view.upper()], [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ])
    }
    {
      let box = child.display_bounds()
      secondary_transform_source_numbers(
        [box.x0(), box.y0(), box.width(), box.height()],
        [0.0 / 0.0, 0.0 / 0.0, 0.0 / 0.0, 0.0 / 0.0],
      )
    }
    assert_eq(
      [
        secondary_transform_source_major_class(child.locator().unwrap()),
        secondary_transform_source_minor_class(child.minor_locator().unwrap()),
        secondary_transform_source_formatter_class(
          child.named_formatter().unwrap(),
        ),
        secondary_transform_source_formatter_class(
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
  }
  secondary_transform_source_double(
    child.location_locator.position,
    4598175219545276416UL.reinterpret_as_double(),
  )
  let installed = child.location_locator.transform.unwrap()
  secondary_transform_source_numbers(
    [
      installed.a,
      installed.b,
      installed.c,
      installed.d,
      installed.e,
      installed.f,
    ],
    [
      4607182418800017408UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      -1.0 / 0.0,
      0UL.reinterpret_as_double(),
    ],
  )
}

///|
fn secondary_transform_source_case_50() -> Unit raise {
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
  let parent = fig.add_axes(0.2, 0.25, 0.5, 0.5)
  parent.set_xlim(1.0, 4.0)
  parent.set_ylim(10.0, 20.0)
  let child = parent.secondary_yaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Position(0.25),
    transform=None,
  )
  assert_true(
    try {
      child.set_location(
        SecondaryAxisLocation::Position(0.75),
        transform=Some(
          @transforms.affine_from_values(
            4607182418800017408UL.reinterpret_as_double(),
            0.0 / 0.0,
            0UL.reinterpret_as_double(),
            4607182418800017408UL.reinterpret_as_double(),
            0UL.reinterpret_as_double(),
            0UL.reinterpret_as_double(),
          ),
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  {
    secondary_transform_source_double(
      child.position(),
      4604930618986332160UL.reinterpret_as_double(),
    )
    guard child.location() is SecondaryAxisLocation::Position(raw_location) else {
      fail("expected numeric location")
    }
    secondary_transform_source_double(
      raw_location,
      4604930618986332160UL.reinterpret_as_double(),
    )
    assert_true(child.alignment() is SecondaryAxisAlignment::Left)
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    {
      let view = child.numeric_axis.stored_view_limits()
      secondary_transform_source_numbers([view.lower(), view.upper()], [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ])
    }
    {
      let box = child.display_bounds()
      secondary_transform_source_numbers(
        [box.x0(), box.y0(), box.width(), box.height()],
        [
          0UL.reinterpret_as_double(),
          4642648265865560064UL.reinterpret_as_double(),
          4584772507054221820UL.reinterpret_as_double(),
          4642648265865560064UL.reinterpret_as_double(),
        ],
      )
    }
    assert_eq(
      [
        secondary_transform_source_major_class(child.locator().unwrap()),
        secondary_transform_source_minor_class(child.minor_locator().unwrap()),
        secondary_transform_source_formatter_class(
          child.named_formatter().unwrap(),
        ),
        secondary_transform_source_formatter_class(
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
  }
  secondary_transform_source_double(
    child.location_locator.position,
    4598175219545276416UL.reinterpret_as_double(),
  )
  assert_true(child.location_locator.transform is None)
  child.positioned_aspect(64.0, 60.0, 160.0, 120.0)
  {
    secondary_transform_source_double(
      child.position(),
      4604930618986332160UL.reinterpret_as_double(),
    )
    guard child.location() is SecondaryAxisLocation::Position(raw_location) else {
      fail("expected numeric location")
    }
    secondary_transform_source_double(
      raw_location,
      4604930618986332160UL.reinterpret_as_double(),
    )
    assert_true(child.alignment() is SecondaryAxisAlignment::Left)
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    {
      let view = child.numeric_axis.stored_view_limits()
      secondary_transform_source_numbers([view.lower(), view.upper()], [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ])
    }
    {
      let box = child.display_bounds()
      secondary_transform_source_numbers(
        [box.x0(), box.y0(), box.width(), box.height()],
        [
          4637018766331346944UL.reinterpret_as_double(),
          4633641066610819072UL.reinterpret_as_double(),
          4490420932539580416UL.reinterpret_as_double(),
          4638144666238189568UL.reinterpret_as_double(),
        ],
      )
    }
    assert_eq(
      [
        secondary_transform_source_major_class(child.locator().unwrap()),
        secondary_transform_source_minor_class(child.minor_locator().unwrap()),
        secondary_transform_source_formatter_class(
          child.named_formatter().unwrap(),
        ),
        secondary_transform_source_formatter_class(
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
  }
  secondary_transform_source_double(
    child.location_locator.position,
    4598175219545276416UL.reinterpret_as_double(),
  )
  assert_true(child.location_locator.transform is None)
}

///|
fn secondary_transform_source_case_51() -> Unit raise {
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
  let parent = fig.add_axes(0.2, 0.25, 0.5, 0.5)
  parent.set_xlim(1.0, 4.0)
  parent.set_ylim(10.0, 20.0)
  let child = parent.secondary_yaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Position(0.25),
    transform=None,
  )
  assert_true(
    try {
      child.set_location(
        SecondaryAxisLocation::Position(0.75),
        transform=Some(
          @transforms.affine_from_values(
            4607182418800017408UL.reinterpret_as_double(),
            0UL.reinterpret_as_double(),
            0.0 / 0.0,
            4607182418800017408UL.reinterpret_as_double(),
            0UL.reinterpret_as_double(),
            0UL.reinterpret_as_double(),
          ),
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  {
    secondary_transform_source_double(
      child.position(),
      4604930618986332160UL.reinterpret_as_double(),
    )
    guard child.location() is SecondaryAxisLocation::Position(raw_location) else {
      fail("expected numeric location")
    }
    secondary_transform_source_double(
      raw_location,
      4604930618986332160UL.reinterpret_as_double(),
    )
    assert_true(child.alignment() is SecondaryAxisAlignment::Left)
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    {
      let view = child.numeric_axis.stored_view_limits()
      secondary_transform_source_numbers([view.lower(), view.upper()], [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ])
    }
    {
      let box = child.display_bounds()
      secondary_transform_source_numbers(
        [box.x0(), box.y0(), box.width(), box.height()],
        [
          0UL.reinterpret_as_double(),
          4642648265865560064UL.reinterpret_as_double(),
          4584772507054221820UL.reinterpret_as_double(),
          4642648265865560064UL.reinterpret_as_double(),
        ],
      )
    }
    assert_eq(
      [
        secondary_transform_source_major_class(child.locator().unwrap()),
        secondary_transform_source_minor_class(child.minor_locator().unwrap()),
        secondary_transform_source_formatter_class(
          child.named_formatter().unwrap(),
        ),
        secondary_transform_source_formatter_class(
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
  }
  secondary_transform_source_double(
    child.location_locator.position,
    4598175219545276416UL.reinterpret_as_double(),
  )
  assert_true(child.location_locator.transform is None)
  child.positioned_aspect(64.0, 60.0, 160.0, 120.0)
  {
    secondary_transform_source_double(
      child.position(),
      4604930618986332160UL.reinterpret_as_double(),
    )
    guard child.location() is SecondaryAxisLocation::Position(raw_location) else {
      fail("expected numeric location")
    }
    secondary_transform_source_double(
      raw_location,
      4604930618986332160UL.reinterpret_as_double(),
    )
    assert_true(child.alignment() is SecondaryAxisAlignment::Left)
    assert_eq(child.parent_scale_name, Some("linear"))
    assert_eq(child.numeric_axis.coordinate_scale_name(), "function")
    {
      let view = child.numeric_axis.stored_view_limits()
      secondary_transform_source_numbers([view.lower(), view.upper()], [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ])
    }
    {
      let box = child.display_bounds()
      secondary_transform_source_numbers(
        [box.x0(), box.y0(), box.width(), box.height()],
        [
          4637018766331346944UL.reinterpret_as_double(),
          4633641066610819072UL.reinterpret_as_double(),
          4490420932539580416UL.reinterpret_as_double(),
          4638144666238189568UL.reinterpret_as_double(),
        ],
      )
    }
    assert_eq(
      [
        secondary_transform_source_major_class(child.locator().unwrap()),
        secondary_transform_source_minor_class(child.minor_locator().unwrap()),
        secondary_transform_source_formatter_class(
          child.named_formatter().unwrap(),
        ),
        secondary_transform_source_formatter_class(
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
  }
  secondary_transform_source_double(
    child.location_locator.position,
    4598175219545276416UL.reinterpret_as_double(),
  )
  assert_true(child.location_locator.transform is None)
}

///|
test "original secondary transform group 0" {
  secondary_transform_source_case_0() catch {
    error =>
      fail("secondary transform 0 constructor x None: " + error.to_string())
  }
  secondary_transform_source_case_1() catch {
    error =>
      fail(
        "secondary transform 1 constructor x translation: " + error.to_string(),
      )
  }
  secondary_transform_source_case_2() catch {
    error =>
      fail("secondary transform 2 constructor x scale: " + error.to_string())
  }
  secondary_transform_source_case_3() catch {
    error =>
      fail(
        "secondary transform 3 constructor x negative_scale: " +
        error.to_string(),
      )
  }
  secondary_transform_source_case_4() catch {
    error =>
      fail(
        "secondary transform 4 constructor x zero_scale: " + error.to_string(),
      )
  }
  secondary_transform_source_case_5() catch {
    error =>
      fail("secondary transform 5 constructor x rotation: " + error.to_string())
  }
  secondary_transform_source_case_6() catch {
    error =>
      fail("secondary transform 6 constructor x skew: " + error.to_string())
  }
  secondary_transform_source_case_10() catch {
    error =>
      fail("secondary transform 10 constructor y None: " + error.to_string())
  }
  secondary_transform_source_case_11() catch {
    error =>
      fail(
        "secondary transform 11 constructor y translation: " + error.to_string(),
      )
  }
  secondary_transform_source_case_12() catch {
    error =>
      fail("secondary transform 12 constructor y scale: " + error.to_string())
  }
  secondary_transform_source_case_13() catch {
    error =>
      fail(
        "secondary transform 13 constructor y negative_scale: " +
        error.to_string(),
      )
  }
  secondary_transform_source_case_14() catch {
    error =>
      fail(
        "secondary transform 14 constructor y zero_scale: " + error.to_string(),
      )
  }
  secondary_transform_source_case_15() catch {
    error =>
      fail(
        "secondary transform 15 constructor y rotation: " + error.to_string(),
      )
  }
  secondary_transform_source_case_16() catch {
    error =>
      fail("secondary transform 16 constructor y skew: " + error.to_string())
  }
  secondary_transform_source_case_20() catch {
    error =>
      fail("secondary transform 20 failed_setter x : " + error.to_string())
  }
  secondary_transform_source_case_21() catch {
    error =>
      fail("secondary transform 21 failed_setter y : " + error.to_string())
  }
  secondary_transform_source_case_22() catch {
    error =>
      fail(
        "secondary transform 22 omitted_and_None_reset x : " + error.to_string(),
      )
  }
  secondary_transform_source_case_23() catch {
    error =>
      fail(
        "secondary transform 23 omitted_and_None_reset y : " + error.to_string(),
      )
  }
  secondary_transform_source_case_26() catch {
    error =>
      fail("secondary transform 26 callback_capture x : " + error.to_string())
  }
  secondary_transform_source_case_28() catch {
    error =>
      fail("secondary transform 28 callback_capture y : " + error.to_string())
  }
  secondary_transform_source_case_34() catch {
    error =>
      fail(
        "secondary transform 34 failed_setter_then_aspect x : " +
        error.to_string(),
      )
  }
  secondary_transform_source_case_35() catch {
    error =>
      fail(
        "secondary transform 35 nonfinite_constructor x selected_diagonal/NaN: " +
        error.to_string(),
      )
  }
  secondary_transform_source_case_36() catch {
    error =>
      fail(
        "secondary transform 36 nonfinite_constructor x selected_diagonal/positive infinity: " +
        error.to_string(),
      )
  }
  secondary_transform_source_case_37() catch {
    error =>
      fail(
        "secondary transform 37 nonfinite_constructor x selected_diagonal/negative infinity: " +
        error.to_string(),
      )
  }
  secondary_transform_source_case_38() catch {
    error =>
      fail(
        "secondary transform 38 nonfinite_constructor x selected_translation/NaN: " +
        error.to_string(),
      )
  }
  secondary_transform_source_case_39() catch {
    error =>
      fail(
        "secondary transform 39 nonfinite_constructor x selected_translation/positive infinity: " +
        error.to_string(),
      )
  }
  secondary_transform_source_case_40() catch {
    error =>
      fail(
        "secondary transform 40 nonfinite_constructor x selected_translation/negative infinity: " +
        error.to_string(),
      )
  }
  secondary_transform_source_case_41() catch {
    error =>
      fail(
        "secondary transform 41 nonfinite_failed_setter x NaN offdiagonal 1: " +
        error.to_string(),
      )
  }
  secondary_transform_source_case_42() catch {
    error =>
      fail(
        "secondary transform 42 nonfinite_failed_setter x NaN offdiagonal 2: " +
        error.to_string(),
      )
  }
  secondary_transform_source_case_43() catch {
    error =>
      fail(
        "secondary transform 43 failed_setter_then_aspect y : " +
        error.to_string(),
      )
  }
  secondary_transform_source_case_44() catch {
    error =>
      fail(
        "secondary transform 44 nonfinite_constructor y selected_diagonal/NaN: " +
        error.to_string(),
      )
  }
  secondary_transform_source_case_45() catch {
    error =>
      fail(
        "secondary transform 45 nonfinite_constructor y selected_diagonal/positive infinity: " +
        error.to_string(),
      )
  }
}

///|
test "original secondary transform group 1" {
  secondary_transform_source_case_46() catch {
    error =>
      fail(
        "secondary transform 46 nonfinite_constructor y selected_diagonal/negative infinity: " +
        error.to_string(),
      )
  }
  secondary_transform_source_case_47() catch {
    error =>
      fail(
        "secondary transform 47 nonfinite_constructor y selected_translation/NaN: " +
        error.to_string(),
      )
  }
  secondary_transform_source_case_48() catch {
    error =>
      fail(
        "secondary transform 48 nonfinite_constructor y selected_translation/positive infinity: " +
        error.to_string(),
      )
  }
  secondary_transform_source_case_49() catch {
    error =>
      fail(
        "secondary transform 49 nonfinite_constructor y selected_translation/negative infinity: " +
        error.to_string(),
      )
  }
  secondary_transform_source_case_50() catch {
    error =>
      fail(
        "secondary transform 50 nonfinite_failed_setter y NaN offdiagonal 1: " +
        error.to_string(),
      )
  }
  secondary_transform_source_case_51() catch {
    error =>
      fail(
        "secondary transform 51 nonfinite_failed_setter y NaN offdiagonal 2: " +
        error.to_string(),
      )
  }
}
