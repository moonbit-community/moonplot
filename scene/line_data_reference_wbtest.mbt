// Generated from pinned original Line data/cache methods; do not edit.

///|
fn line_data_source_double(actual : Double, expected : Double) -> Unit raise {
  if expected.is_nan() {
    assert_true(actual.is_nan())
  } else {
    assert_eq(actual.reinterpret_as_uint64(), expected.reinterpret_as_uint64())
  }
}

///|
fn line_data_source_numbers(
  actual : Array[Double],
  expected : Array[Double],
) -> Unit raise {
  assert_eq(actual.length(), expected.length())
  for index in 0..<actual.length() {
    line_data_source_double(actual[index], expected[index])
  }
}

///|
fn line_data_source_original(value : LineData) -> Array[Double] raise {
  guard value is LineData::Numeric(values) else {
    fail("expected Numeric original")
  }
  values
}

///|
fn line_data_source_aliases(
  first : @ticker.TickValues,
  second : @ticker.TickValues,
) -> Bool raise {
  let old = first.get(0)
  first.set(0, -999.5)
  let aliases = second.get(0) == -999.5
  first.set(0, old)
  aliases
}

///|
// Controlled owner=None fixture, not a public unattached Line constructor.
// Python's uninitialized optional cache is projected to an inaccessible empty
// generation; public refresh outcome, flags and original data are compared.
fn line_data_source_detached(x : LineData, y : LineData) -> Line2D {
  let cache = line2d_cache_from_flat([])
  {
    points: [],
    x: x.copy(),
    y: y.copy(),
    cache,
    drawstyle: "default",
    path_values: cache.flat,
    invalid_x: true,
    invalid_y: true,
    owner: None,
    removal_parent: None,
    style: @core.style("#1f77b4"),
    source_color: false,
    unscaled_dash_pattern: { offset: 0.0, dashes: None, },
    scaled_dashes_as_list: true,
    visible: true,
    stale: true,
  }
}

///|
fn line_data_source_sequence_0() -> Unit raise {
  let axes = figure().axes()
  let line = axes.plot_line(
    LineData::Numeric([0.0, 1.0]),
    LineData::Numeric([10.0, 20.0]),
  )
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  // Match the source host's explicitly consumed initial drawing-stale flag.
  line.mark_drawn()
  // 0 set_xdata copies list, sets only x invalid and line stale, no range event
  {
    line_data_source_numbers(line_data_source_original(line.get_xdata()), [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line_data_source_original(line.get_ydata()), [
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    // Read the retained cache directly; recording must not trigger a lazy getter.
    line_data_source_numbers(line.cache.xs.to_array(), [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line.cache.ys.to_array(), [
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line.cache.flat.to_array(), [
      0UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    assert_eq([line.invalid_x, line.invalid_y], [false, false])
    assert_eq(line.stale(), false)
    assert_eq(axes.x_axis().autoscale_stale(), false)
    assert_eq(axes.y_axis().autoscale_stale(), false)
    line_data_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
        axes.data_minpos(horizontal=true),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line_data_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
        axes.data_minpos(horizontal=false),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
      ],
    )
  }
  let incoming = [4.0, 5.0]
  line.set_xdata(LineData::Numeric(incoming))
  {
    line_data_source_numbers(line_data_source_original(line.get_xdata()), [
      4616189618054758400UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line_data_source_original(line.get_ydata()), [
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    // Read the retained cache directly; recording must not trigger a lazy getter.
    line_data_source_numbers(line.cache.xs.to_array(), [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line.cache.ys.to_array(), [
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line.cache.flat.to_array(), [
      0UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    assert_eq([line.invalid_x, line.invalid_y], [true, false])
    assert_eq(line.stale(), true)
    assert_eq(axes.x_axis().autoscale_stale(), false)
    assert_eq(axes.y_axis().autoscale_stale(), false)
    line_data_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
        axes.data_minpos(horizontal=true),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line_data_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
        axes.data_minpos(horizontal=false),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
      ],
    )
  }
  // 1 caller list mutation cannot change copied original; original getter is direct
  {
    line_data_source_numbers(line_data_source_original(line.get_xdata()), [
      4616189618054758400UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line_data_source_original(line.get_ydata()), [
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    // Read the retained cache directly; recording must not trigger a lazy getter.
    line_data_source_numbers(line.cache.xs.to_array(), [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line.cache.ys.to_array(), [
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line.cache.flat.to_array(), [
      0UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    assert_eq([line.invalid_x, line.invalid_y], [true, false])
    assert_eq(line.stale(), true)
    assert_eq(axes.x_axis().autoscale_stale(), false)
    assert_eq(axes.y_axis().autoscale_stale(), false)
    line_data_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
        axes.data_minpos(horizontal=true),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line_data_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
        axes.data_minpos(horizontal=false),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
      ],
    )
  }
  incoming[0] = 99.0
  let borrowed_original = line_data_source_original(line.get_xdata())
  assert_true(!physical_equal(incoming, borrowed_original))
  assert_true(
    physical_equal(
      borrowed_original,
      line_data_source_original(line.get_xdata()),
    ),
  )
  {
    line_data_source_numbers(line_data_source_original(line.get_xdata()), [
      4616189618054758400UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line_data_source_original(line.get_ydata()), [
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    // Read the retained cache directly; recording must not trigger a lazy getter.
    line_data_source_numbers(line.cache.xs.to_array(), [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line.cache.ys.to_array(), [
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line.cache.flat.to_array(), [
      0UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    assert_eq([line.invalid_x, line.invalid_y], [true, false])
    assert_eq(line.stale(), true)
    assert_eq(axes.x_axis().autoscale_stale(), false)
    assert_eq(axes.y_axis().autoscale_stale(), false)
    line_data_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
        axes.data_minpos(horizontal=true),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line_data_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
        axes.data_minpos(horizontal=false),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
      ],
    )
  }
  // 2 valid processed y getter does not service invalid x
  {
    line_data_source_numbers(line_data_source_original(line.get_xdata()), [
      4616189618054758400UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line_data_source_original(line.get_ydata()), [
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    // Read the retained cache directly; recording must not trigger a lazy getter.
    line_data_source_numbers(line.cache.xs.to_array(), [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line.cache.ys.to_array(), [
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line.cache.flat.to_array(), [
      0UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    assert_eq([line.invalid_x, line.invalid_y], [true, false])
    assert_eq(line.stale(), true)
    assert_eq(axes.x_axis().autoscale_stale(), false)
    assert_eq(axes.y_axis().autoscale_stale(), false)
    line_data_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
        axes.data_minpos(horizontal=true),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line_data_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
        axes.data_minpos(horizontal=false),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
      ],
    )
  }
  line_data_source_numbers(line.y_values_checked().to_array(), [
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  ])
  {
    line_data_source_numbers(line_data_source_original(line.get_xdata()), [
      4616189618054758400UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line_data_source_original(line.get_ydata()), [
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    // Read the retained cache directly; recording must not trigger a lazy getter.
    line_data_source_numbers(line.cache.xs.to_array(), [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line.cache.ys.to_array(), [
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line.cache.flat.to_array(), [
      0UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    assert_eq([line.invalid_x, line.invalid_y], [true, false])
    assert_eq(line.stale(), true)
    assert_eq(axes.x_axis().autoscale_stale(), false)
    assert_eq(axes.y_axis().autoscale_stale(), false)
    line_data_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
        axes.data_minpos(horizontal=true),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line_data_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
        axes.data_minpos(horizontal=false),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
      ],
    )
  }
  // 3 invalid processed x getter recaches, leaves dataLim and request flags unchanged
  {
    line_data_source_numbers(line_data_source_original(line.get_xdata()), [
      4616189618054758400UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line_data_source_original(line.get_ydata()), [
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    // Read the retained cache directly; recording must not trigger a lazy getter.
    line_data_source_numbers(line.cache.xs.to_array(), [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line.cache.ys.to_array(), [
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line.cache.flat.to_array(), [
      0UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    assert_eq([line.invalid_x, line.invalid_y], [true, false])
    assert_eq(line.stale(), true)
    assert_eq(axes.x_axis().autoscale_stale(), false)
    assert_eq(axes.y_axis().autoscale_stale(), false)
    line_data_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
        axes.data_minpos(horizontal=true),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line_data_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
        axes.data_minpos(horizontal=false),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
      ],
    )
  }
  line_data_source_numbers(line.x_values_checked().to_array(), [
    4616189618054758400UL.reinterpret_as_double(),
    4617315517961601024UL.reinterpret_as_double(),
  ])
  let old_xy = line.xy_values_checked()
  let old_x = line.x_values_checked()
  {
    line_data_source_numbers(line_data_source_original(line.get_xdata()), [
      4616189618054758400UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line_data_source_original(line.get_ydata()), [
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    // Read the retained cache directly; recording must not trigger a lazy getter.
    line_data_source_numbers(line.cache.xs.to_array(), [
      4616189618054758400UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line.cache.ys.to_array(), [
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line.cache.flat.to_array(), [
      4616189618054758400UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    assert_eq([line.invalid_x, line.invalid_y], [false, false])
    assert_eq(line.stale(), true)
    assert_eq(axes.x_axis().autoscale_stale(), false)
    assert_eq(axes.y_axis().autoscale_stale(), false)
    line_data_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
        axes.data_minpos(horizontal=true),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line_data_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
        axes.data_minpos(horizontal=false),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
      ],
    )
  }
  // 4 borrowed original mutation with valid flags leaves converted cache stale
  {
    line_data_source_numbers(line_data_source_original(line.get_xdata()), [
      4616189618054758400UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line_data_source_original(line.get_ydata()), [
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    // Read the retained cache directly; recording must not trigger a lazy getter.
    line_data_source_numbers(line.cache.xs.to_array(), [
      4616189618054758400UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line.cache.ys.to_array(), [
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line.cache.flat.to_array(), [
      4616189618054758400UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    assert_eq([line.invalid_x, line.invalid_y], [false, false])
    assert_eq(line.stale(), true)
    assert_eq(axes.x_axis().autoscale_stale(), false)
    assert_eq(axes.y_axis().autoscale_stale(), false)
    line_data_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
        axes.data_minpos(horizontal=true),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line_data_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
        axes.data_minpos(horizontal=false),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
      ],
    )
  }
  line_data_source_original(line.get_xdata())[0] = 42.0
  line_data_source_numbers(line.xy_values_checked().to_array(), [
    4616189618054758400UL.reinterpret_as_double(),
    4621819117588971520UL.reinterpret_as_double(),
    4617315517961601024UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  ])
  {
    line_data_source_numbers(line_data_source_original(line.get_xdata()), [
      4631107791820423168UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line_data_source_original(line.get_ydata()), [
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    // Read the retained cache directly; recording must not trigger a lazy getter.
    line_data_source_numbers(line.cache.xs.to_array(), [
      4616189618054758400UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line.cache.ys.to_array(), [
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line.cache.flat.to_array(), [
      4616189618054758400UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    assert_eq([line.invalid_x, line.invalid_y], [false, false])
    assert_eq(line.stale(), true)
    assert_eq(axes.x_axis().autoscale_stale(), false)
    assert_eq(axes.y_axis().autoscale_stale(), false)
    line_data_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
        axes.data_minpos(horizontal=true),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line_data_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
        axes.data_minpos(horizontal=false),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
      ],
    )
  }
  // 5 forced recache consumes original mutation and rebinds fresh xy
  {
    line_data_source_numbers(line_data_source_original(line.get_xdata()), [
      4631107791820423168UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line_data_source_original(line.get_ydata()), [
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    // Read the retained cache directly; recording must not trigger a lazy getter.
    line_data_source_numbers(line.cache.xs.to_array(), [
      4616189618054758400UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line.cache.ys.to_array(), [
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line.cache.flat.to_array(), [
      4616189618054758400UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    assert_eq([line.invalid_x, line.invalid_y], [false, false])
    assert_eq(line.stale(), true)
    assert_eq(axes.x_axis().autoscale_stale(), false)
    assert_eq(axes.y_axis().autoscale_stale(), false)
    line_data_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
        axes.data_minpos(horizontal=true),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line_data_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
        axes.data_minpos(horizontal=false),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
      ],
    )
  }
  line.recache_checked(always=true)
  line_data_source_numbers(old_xy.to_array(), [
    4616189618054758400UL.reinterpret_as_double(),
    4621819117588971520UL.reinterpret_as_double(),
    4617315517961601024UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  ])
  line_data_source_numbers(old_x.to_array(), [
    4616189618054758400UL.reinterpret_as_double(),
    4617315517961601024UL.reinterpret_as_double(),
  ])
  assert_eq(line_data_source_aliases(old_xy, line.cache.flat), false)
  assert_eq(line_data_source_aliases(old_x, line.cache.xs), false)
  {
    line_data_source_numbers(line_data_source_original(line.get_xdata()), [
      4631107791820423168UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line_data_source_original(line.get_ydata()), [
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    // Read the retained cache directly; recording must not trigger a lazy getter.
    line_data_source_numbers(line.cache.xs.to_array(), [
      4631107791820423168UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line.cache.ys.to_array(), [
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line.cache.flat.to_array(), [
      4631107791820423168UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    assert_eq([line.invalid_x, line.invalid_y], [false, false])
    assert_eq(line.stale(), true)
    assert_eq(axes.x_axis().autoscale_stale(), false)
    assert_eq(axes.y_axis().autoscale_stale(), false)
    line_data_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
        axes.data_minpos(horizontal=true),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line_data_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
        axes.data_minpos(horizontal=false),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
      ],
    )
  }
  // 6 processed x view mutation changes xy and cached path without invalidation
  {
    line_data_source_numbers(line_data_source_original(line.get_xdata()), [
      4631107791820423168UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line_data_source_original(line.get_ydata()), [
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    // Read the retained cache directly; recording must not trigger a lazy getter.
    line_data_source_numbers(line.cache.xs.to_array(), [
      4631107791820423168UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line.cache.ys.to_array(), [
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line.cache.flat.to_array(), [
      4631107791820423168UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    assert_eq([line.invalid_x, line.invalid_y], [false, false])
    assert_eq(line.stale(), true)
    assert_eq(axes.x_axis().autoscale_stale(), false)
    assert_eq(axes.y_axis().autoscale_stale(), false)
    line_data_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
        axes.data_minpos(horizontal=true),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line_data_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
        axes.data_minpos(horizontal=false),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
      ],
    )
  }
  line.x_values_checked().set(1, 70.0)
  line_data_source_numbers(line.xy_values_checked().to_array(), [
    4631107791820423168UL.reinterpret_as_double(),
    4621819117588971520UL.reinterpret_as_double(),
    4634626229029306368UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  ])
  {
    line_data_source_numbers(line_data_source_original(line.get_xdata()), [
      4631107791820423168UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line_data_source_original(line.get_ydata()), [
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    // Read the retained cache directly; recording must not trigger a lazy getter.
    line_data_source_numbers(line.cache.xs.to_array(), [
      4631107791820423168UL.reinterpret_as_double(),
      4634626229029306368UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line.cache.ys.to_array(), [
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line.cache.flat.to_array(), [
      4631107791820423168UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4634626229029306368UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    assert_eq([line.invalid_x, line.invalid_y], [false, false])
    assert_eq(line.stale(), true)
    assert_eq(axes.x_axis().autoscale_stale(), false)
    assert_eq(axes.y_axis().autoscale_stale(), false)
    line_data_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
        axes.data_minpos(horizontal=true),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line_data_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
        axes.data_minpos(horizontal=false),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
      ],
    )
  }
  // 7 explicit relim reads cached path and does not request autoscale
  {
    line_data_source_numbers(line_data_source_original(line.get_xdata()), [
      4631107791820423168UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line_data_source_original(line.get_ydata()), [
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    // Read the retained cache directly; recording must not trigger a lazy getter.
    line_data_source_numbers(line.cache.xs.to_array(), [
      4631107791820423168UL.reinterpret_as_double(),
      4634626229029306368UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line.cache.ys.to_array(), [
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line.cache.flat.to_array(), [
      4631107791820423168UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4634626229029306368UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    assert_eq([line.invalid_x, line.invalid_y], [false, false])
    assert_eq(line.stale(), true)
    assert_eq(axes.x_axis().autoscale_stale(), false)
    assert_eq(axes.y_axis().autoscale_stale(), false)
    line_data_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
        axes.data_minpos(horizontal=true),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line_data_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
        axes.data_minpos(horizontal=false),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
      ],
    )
  }
  axes.relim_checked()
  line_data_source_numbers(line_data_source_original(line.get_xdata()), [
    4631107791820423168UL.reinterpret_as_double(),
    4617315517961601024UL.reinterpret_as_double(),
  ])
  line_data_source_numbers(line_data_source_original(line.get_ydata()), [
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  ])
  // Read the retained cache directly; recording must not trigger a lazy getter.
  line_data_source_numbers(line.cache.xs.to_array(), [
    4631107791820423168UL.reinterpret_as_double(),
    4634626229029306368UL.reinterpret_as_double(),
  ])
  line_data_source_numbers(line.cache.ys.to_array(), [
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  ])
  line_data_source_numbers(line.cache.flat.to_array(), [
    4631107791820423168UL.reinterpret_as_double(),
    4621819117588971520UL.reinterpret_as_double(),
    4634626229029306368UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  ])
  assert_eq([line.invalid_x, line.invalid_y], [false, false])
  assert_eq(line.stale(), true)
  assert_eq(axes.x_axis().autoscale_stale(), false)
  assert_eq(axes.y_axis().autoscale_stale(), false)
  line_data_source_numbers(
    [
      axes.data_limits(horizontal=true).lower(),
      axes.data_limits(horizontal=true).upper(),
      axes.data_minpos(horizontal=true),
    ],
    [
      4631107791820423168UL.reinterpret_as_double(),
      4634626229029306368UL.reinterpret_as_double(),
      4631107791820423168UL.reinterpret_as_double(),
    ],
  )
  line_data_source_numbers(
    [
      axes.data_limits(horizontal=false).lower(),
      axes.data_limits(horizontal=false).upper(),
      axes.data_minpos(horizontal=false),
    ],
    [
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
    ],
  )
}

///|
fn line_data_source_sequence_1() -> Unit raise {
  let axes = figure().axes()
  let line = axes.plot_line(
    LineData::Numeric([0.0, 1.0]),
    LineData::Numeric([10.0, 20.0]),
  )
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  // Match the source host's explicitly consumed initial drawing-stale flag.
  line.mark_drawn()
  line.set_ydata(LineData::Numeric([30.0, 40.0]))
  line.mark_drawn()
  // 8 valid x processed getter ignores invalid y
  {
    line_data_source_numbers(line_data_source_original(line.get_xdata()), [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line_data_source_original(line.get_ydata()), [
      4629137466983448576UL.reinterpret_as_double(),
      4630826316843712512UL.reinterpret_as_double(),
    ])
    // Read the retained cache directly; recording must not trigger a lazy getter.
    line_data_source_numbers(line.cache.xs.to_array(), [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line.cache.ys.to_array(), [
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line.cache.flat.to_array(), [
      0UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    assert_eq([line.invalid_x, line.invalid_y], [false, true])
    assert_eq(line.stale(), false)
    assert_eq(axes.x_axis().autoscale_stale(), false)
    assert_eq(axes.y_axis().autoscale_stale(), false)
    line_data_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
        axes.data_minpos(horizontal=true),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line_data_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
        axes.data_minpos(horizontal=false),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
      ],
    )
  }
  line_data_source_numbers(line.x_values_checked().to_array(), [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  {
    line_data_source_numbers(line_data_source_original(line.get_xdata()), [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line_data_source_original(line.get_ydata()), [
      4629137466983448576UL.reinterpret_as_double(),
      4630826316843712512UL.reinterpret_as_double(),
    ])
    // Read the retained cache directly; recording must not trigger a lazy getter.
    line_data_source_numbers(line.cache.xs.to_array(), [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line.cache.ys.to_array(), [
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line.cache.flat.to_array(), [
      0UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    assert_eq([line.invalid_x, line.invalid_y], [false, true])
    assert_eq(line.stale(), false)
    assert_eq(axes.x_axis().autoscale_stale(), false)
    assert_eq(axes.y_axis().autoscale_stale(), false)
    line_data_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
        axes.data_minpos(horizontal=true),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line_data_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
        axes.data_minpos(horizontal=false),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
      ],
    )
  }
  // 9 get_data(orig=False) first returns valid x then y recache
  {
    line_data_source_numbers(line_data_source_original(line.get_xdata()), [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line_data_source_original(line.get_ydata()), [
      4629137466983448576UL.reinterpret_as_double(),
      4630826316843712512UL.reinterpret_as_double(),
    ])
    // Read the retained cache directly; recording must not trigger a lazy getter.
    line_data_source_numbers(line.cache.xs.to_array(), [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line.cache.ys.to_array(), [
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line.cache.flat.to_array(), [
      0UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    assert_eq([line.invalid_x, line.invalid_y], [false, true])
    assert_eq(line.stale(), false)
    assert_eq(axes.x_axis().autoscale_stale(), false)
    assert_eq(axes.y_axis().autoscale_stale(), false)
    line_data_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
        axes.data_minpos(horizontal=true),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line_data_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
        axes.data_minpos(horizontal=false),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
      ],
    )
  }
  let (xs, ys) = line.data_values_checked()
  line_data_source_numbers(xs.to_array(), [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  line_data_source_numbers(ys.to_array(), [
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  ])
  assert_eq(line_data_source_aliases(xs, line.cache.xs), false)
  assert_eq(line_data_source_aliases(ys, line.cache.ys), true)
  line_data_source_numbers(line_data_source_original(line.get_xdata()), [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  line_data_source_numbers(line_data_source_original(line.get_ydata()), [
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  ])
  // Read the retained cache directly; recording must not trigger a lazy getter.
  line_data_source_numbers(line.cache.xs.to_array(), [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  line_data_source_numbers(line.cache.ys.to_array(), [
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  ])
  line_data_source_numbers(line.cache.flat.to_array(), [
    0UL.reinterpret_as_double(),
    4629137466983448576UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  ])
  assert_eq([line.invalid_x, line.invalid_y], [false, false])
  assert_eq(line.stale(), false)
  assert_eq(axes.x_axis().autoscale_stale(), false)
  assert_eq(axes.y_axis().autoscale_stale(), false)
  line_data_source_numbers(
    [
      axes.data_limits(horizontal=true).lower(),
      axes.data_limits(horizontal=true).upper(),
      axes.data_minpos(horizontal=true),
    ],
    [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ],
  )
  line_data_source_numbers(
    [
      axes.data_limits(horizontal=false).lower(),
      axes.data_limits(horizontal=false).upper(),
      axes.data_minpos(horizontal=false),
    ],
    [
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
    ],
  )
}

///|
fn line_data_source_sequence_2() -> Unit raise {
  let axes = figure().axes()
  let line = axes.plot_line(
    LineData::Numeric([0.0, 1.0]),
    LineData::Numeric([10.0, 20.0]),
  )
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  // Match the source host's explicitly consumed initial drawing-stale flag.
  line.mark_drawn()
  line.set_xdata(LineData::Numeric([2.0, 3.0, 4.0]))
  line.mark_drawn()
  // 10 valid processed y can succeed while pending x shape is invalid
  {
    line_data_source_numbers(line_data_source_original(line.get_xdata()), [
      4611686018427387904UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
      4616189618054758400UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line_data_source_original(line.get_ydata()), [
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    // Read the retained cache directly; recording must not trigger a lazy getter.
    line_data_source_numbers(line.cache.xs.to_array(), [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line.cache.ys.to_array(), [
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line.cache.flat.to_array(), [
      0UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    assert_eq([line.invalid_x, line.invalid_y], [true, false])
    assert_eq(line.stale(), false)
    assert_eq(axes.x_axis().autoscale_stale(), false)
    assert_eq(axes.y_axis().autoscale_stale(), false)
    line_data_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
        axes.data_minpos(horizontal=true),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line_data_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
        axes.data_minpos(horizontal=false),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
      ],
    )
  }
  line_data_source_numbers(line.y_values_checked().to_array(), [
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  ])
  {
    line_data_source_numbers(line_data_source_original(line.get_xdata()), [
      4611686018427387904UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
      4616189618054758400UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line_data_source_original(line.get_ydata()), [
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    // Read the retained cache directly; recording must not trigger a lazy getter.
    line_data_source_numbers(line.cache.xs.to_array(), [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line.cache.ys.to_array(), [
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line.cache.flat.to_array(), [
      0UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    assert_eq([line.invalid_x, line.invalid_y], [true, false])
    assert_eq(line.stale(), false)
    assert_eq(axes.x_axis().autoscale_stale(), false)
    assert_eq(axes.y_axis().autoscale_stale(), false)
    line_data_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
        axes.data_minpos(horizontal=true),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line_data_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
        axes.data_minpos(horizontal=false),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
      ],
    )
  }
  // 11 invalid processed x throws at broadcast and retains all old converted buffers
  {
    line_data_source_numbers(line_data_source_original(line.get_xdata()), [
      4611686018427387904UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
      4616189618054758400UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line_data_source_original(line.get_ydata()), [
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    // Read the retained cache directly; recording must not trigger a lazy getter.
    line_data_source_numbers(line.cache.xs.to_array(), [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line.cache.ys.to_array(), [
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line.cache.flat.to_array(), [
      0UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    assert_eq([line.invalid_x, line.invalid_y], [true, false])
    assert_eq(line.stale(), false)
    assert_eq(axes.x_axis().autoscale_stale(), false)
    assert_eq(axes.y_axis().autoscale_stale(), false)
    line_data_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
        axes.data_minpos(horizontal=true),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line_data_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
        axes.data_minpos(horizontal=false),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
      ],
    )
  }
  assert_true(
    try {
      ignore(line.x_values_checked())
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "shape mismatch: objects cannot be broadcast to a single shape.  Mismatch is between arg 0 with shape (3,) and arg 1 with shape (2,)."
      _ => false
    },
  )
  {
    line_data_source_numbers(line_data_source_original(line.get_xdata()), [
      4611686018427387904UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
      4616189618054758400UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line_data_source_original(line.get_ydata()), [
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    // Read the retained cache directly; recording must not trigger a lazy getter.
    line_data_source_numbers(line.cache.xs.to_array(), [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line.cache.ys.to_array(), [
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line.cache.flat.to_array(), [
      0UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    assert_eq([line.invalid_x, line.invalid_y], [true, false])
    assert_eq(line.stale(), false)
    assert_eq(axes.x_axis().autoscale_stale(), false)
    assert_eq(axes.y_axis().autoscale_stale(), false)
    line_data_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
        axes.data_minpos(horizontal=true),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line_data_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
        axes.data_minpos(horizontal=false),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
      ],
    )
  }
  // 12 get_path retries same pending broadcast error without range change
  {
    line_data_source_numbers(line_data_source_original(line.get_xdata()), [
      4611686018427387904UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
      4616189618054758400UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line_data_source_original(line.get_ydata()), [
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    // Read the retained cache directly; recording must not trigger a lazy getter.
    line_data_source_numbers(line.cache.xs.to_array(), [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line.cache.ys.to_array(), [
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line.cache.flat.to_array(), [
      0UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    assert_eq([line.invalid_x, line.invalid_y], [true, false])
    assert_eq(line.stale(), false)
    assert_eq(axes.x_axis().autoscale_stale(), false)
    assert_eq(axes.y_axis().autoscale_stale(), false)
    line_data_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
        axes.data_minpos(horizontal=true),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line_data_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
        axes.data_minpos(horizontal=false),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
      ],
    )
  }
  assert_true(
    try {
      ignore(line.xy_values_checked())
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "shape mismatch: objects cannot be broadcast to a single shape.  Mismatch is between arg 0 with shape (3,) and arg 1 with shape (2,)."
      _ => false
    },
  )
  line_data_source_numbers(line_data_source_original(line.get_xdata()), [
    4611686018427387904UL.reinterpret_as_double(),
    4613937818241073152UL.reinterpret_as_double(),
    4616189618054758400UL.reinterpret_as_double(),
  ])
  line_data_source_numbers(line_data_source_original(line.get_ydata()), [
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  ])
  // Read the retained cache directly; recording must not trigger a lazy getter.
  line_data_source_numbers(line.cache.xs.to_array(), [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  line_data_source_numbers(line.cache.ys.to_array(), [
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  ])
  line_data_source_numbers(line.cache.flat.to_array(), [
    0UL.reinterpret_as_double(),
    4621819117588971520UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  ])
  assert_eq([line.invalid_x, line.invalid_y], [true, false])
  assert_eq(line.stale(), false)
  assert_eq(axes.x_axis().autoscale_stale(), false)
  assert_eq(axes.y_axis().autoscale_stale(), false)
  line_data_source_numbers(
    [
      axes.data_limits(horizontal=true).lower(),
      axes.data_limits(horizontal=true).upper(),
      axes.data_minpos(horizontal=true),
    ],
    [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ],
  )
  line_data_source_numbers(
    [
      axes.data_limits(horizontal=false).lower(),
      axes.data_limits(horizontal=false).upper(),
      axes.data_minpos(horizontal=false),
    ],
    [
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
    ],
  )
}

///|
fn line_data_source_sequence_3() -> Unit raise {
  let axes = figure().axes()
  let line = axes.plot_line(
    LineData::Numeric([0.0, 1.0]),
    LineData::Numeric([10.0, 20.0]),
  )
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  // Match the source host's explicitly consumed initial drawing-stale flag.
  line.mark_drawn()
  // 15 set_data accepts incompatible sequence lengths without eager conversion
  {
    line_data_source_numbers(line_data_source_original(line.get_xdata()), [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line_data_source_original(line.get_ydata()), [
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    // Read the retained cache directly; recording must not trigger a lazy getter.
    line_data_source_numbers(line.cache.xs.to_array(), [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line.cache.ys.to_array(), [
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line.cache.flat.to_array(), [
      0UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    assert_eq([line.invalid_x, line.invalid_y], [false, false])
    assert_eq(line.stale(), false)
    assert_eq(axes.x_axis().autoscale_stale(), false)
    assert_eq(axes.y_axis().autoscale_stale(), false)
    line_data_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
        axes.data_minpos(horizontal=true),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line_data_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
        axes.data_minpos(horizontal=false),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
      ],
    )
  }
  line.set_data(
    LineData::Numeric([2.0, 3.0, 4.0]),
    LineData::Numeric([8.0, 9.0]),
  )
  {
    line_data_source_numbers(line_data_source_original(line.get_xdata()), [
      4611686018427387904UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
      4616189618054758400UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line_data_source_original(line.get_ydata()), [
      4620693217682128896UL.reinterpret_as_double(),
      4621256167635550208UL.reinterpret_as_double(),
    ])
    // Read the retained cache directly; recording must not trigger a lazy getter.
    line_data_source_numbers(line.cache.xs.to_array(), [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line.cache.ys.to_array(), [
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line.cache.flat.to_array(), [
      0UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    assert_eq([line.invalid_x, line.invalid_y], [true, true])
    assert_eq(line.stale(), true)
    assert_eq(axes.x_axis().autoscale_stale(), false)
    assert_eq(axes.y_axis().autoscale_stale(), false)
    line_data_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
        axes.data_minpos(horizontal=true),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line_data_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
        axes.data_minpos(horizontal=false),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
      ],
    )
  }
  // 16 get_xydata performs deferred broadcast error after both setters succeeded
  {
    line_data_source_numbers(line_data_source_original(line.get_xdata()), [
      4611686018427387904UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
      4616189618054758400UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line_data_source_original(line.get_ydata()), [
      4620693217682128896UL.reinterpret_as_double(),
      4621256167635550208UL.reinterpret_as_double(),
    ])
    // Read the retained cache directly; recording must not trigger a lazy getter.
    line_data_source_numbers(line.cache.xs.to_array(), [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line.cache.ys.to_array(), [
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    line_data_source_numbers(line.cache.flat.to_array(), [
      0UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    assert_eq([line.invalid_x, line.invalid_y], [true, true])
    assert_eq(line.stale(), true)
    assert_eq(axes.x_axis().autoscale_stale(), false)
    assert_eq(axes.y_axis().autoscale_stale(), false)
    line_data_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
        axes.data_minpos(horizontal=true),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line_data_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
        axes.data_minpos(horizontal=false),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
      ],
    )
  }
  assert_true(
    try {
      ignore(line.xy_values_checked())
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "shape mismatch: objects cannot be broadcast to a single shape.  Mismatch is between arg 0 with shape (3,) and arg 1 with shape (2,)."
      _ => false
    },
  )
  line_data_source_numbers(line_data_source_original(line.get_xdata()), [
    4611686018427387904UL.reinterpret_as_double(),
    4613937818241073152UL.reinterpret_as_double(),
    4616189618054758400UL.reinterpret_as_double(),
  ])
  line_data_source_numbers(line_data_source_original(line.get_ydata()), [
    4620693217682128896UL.reinterpret_as_double(),
    4621256167635550208UL.reinterpret_as_double(),
  ])
  // Read the retained cache directly; recording must not trigger a lazy getter.
  line_data_source_numbers(line.cache.xs.to_array(), [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  line_data_source_numbers(line.cache.ys.to_array(), [
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  ])
  line_data_source_numbers(line.cache.flat.to_array(), [
    0UL.reinterpret_as_double(),
    4621819117588971520UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  ])
  assert_eq([line.invalid_x, line.invalid_y], [true, true])
  assert_eq(line.stale(), true)
  assert_eq(axes.x_axis().autoscale_stale(), false)
  assert_eq(axes.y_axis().autoscale_stale(), false)
  line_data_source_numbers(
    [
      axes.data_limits(horizontal=true).lower(),
      axes.data_limits(horizontal=true).upper(),
      axes.data_minpos(horizontal=true),
    ],
    [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ],
  )
  line_data_source_numbers(
    [
      axes.data_limits(horizontal=false).lower(),
      axes.data_limits(horizontal=false).upper(),
      axes.data_minpos(horizontal=false),
    ],
    [
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
    ],
  )
}

///|
fn line_data_source_detached_0() -> Unit raise {
  let line = line_data_source_detached(
    LineData::Numeric([
      4611686018427387904UL.reinterpret_as_double(),
      13838435755002691584UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
    ]),
    LineData::Numeric([0.0, 1.0, 2.0]),
  )
  ignore(line.xy_values_checked())
  assert_eq([line.invalid_x, line.invalid_y], [false, false])
  assert_eq(line.stale(), true)
  assert_true(line.owner is None)
  line_data_source_numbers(line.cache.flat.to_array(), [
    4611686018427387904UL.reinterpret_as_double(),
    0UL.reinterpret_as_double(),
    13838435755002691584UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
    0UL.reinterpret_as_double(),
    4611686018427387904UL.reinterpret_as_double(),
  ])
}

///|
fn line_data_source_detached_1() -> Unit raise {
  let line = line_data_source_detached(
    LineData::Category([
      "1_0", "١٢.٥", "\u{2003}-3.5\u{a0}", "+NaN", "-NaN", "INF", "-Infinity",
      "99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
    ]),
    LineData::Numeric([
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
      4616189618054758400UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
      4618441417868443648UL.reinterpret_as_double(),
      4619567317775286272UL.reinterpret_as_double(),
    ]),
  )
  ignore(line.xy_values_checked())
  assert_eq([line.invalid_x, line.invalid_y], [false, false])
  assert_eq(line.stale(), true)
  assert_true(line.owner is None)
  line_data_source_numbers(line.cache.flat.to_array(), [
    4621819117588971520UL.reinterpret_as_double(),
    0UL.reinterpret_as_double(),
    4623226492472524800UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
    13838435755002691584UL.reinterpret_as_double(),
    4611686018427387904UL.reinterpret_as_double(),
    0.0 / 0.0,
    4613937818241073152UL.reinterpret_as_double(),
    0.0 / 0.0,
    4616189618054758400UL.reinterpret_as_double(),
    1.0 / 0.0,
    4617315517961601024UL.reinterpret_as_double(),
    -1.0 / 0.0,
    4618441417868443648UL.reinterpret_as_double(),
    1.0 / 0.0,
    4619567317775286272UL.reinterpret_as_double(),
  ])
}

///|
fn line_data_source_detached_2() -> Unit raise {
  {
    let line = line_data_source_detached(
      LineData::Category(["1,2"]),
      LineData::Numeric([0.0]),
    )
    assert_true(
      try {
        ignore(line.xy_values_checked())
        false
      } catch {
        @core.DataError::InvalidTicks(message~) =>
          message == "ValueError: could not convert string to float: '1,2'"
        _ => false
      },
    )
    assert_eq([line.invalid_x, line.invalid_y], [true, true])
    assert_eq(line.stale(), true)
    assert_true(line.owner is None)
    assert_eq(line.cache.flat.length(), 0)
  }
  {
    let line = line_data_source_detached(
      LineData::Category(["1__0"]),
      LineData::Numeric([0.0]),
    )
    assert_true(
      try {
        ignore(line.xy_values_checked())
        false
      } catch {
        @core.DataError::InvalidTicks(message~) =>
          message == "ValueError: could not convert string to float: '1__0'"
        _ => false
      },
    )
    assert_eq([line.invalid_x, line.invalid_y], [true, true])
    assert_eq(line.stale(), true)
    assert_true(line.owner is None)
    assert_eq(line.cache.flat.length(), 0)
  }
  {
    let line = line_data_source_detached(
      LineData::Category(["\u{1c}1\u{1f}"]),
      LineData::Numeric([0.0]),
    )
    assert_true(
      try {
        ignore(line.xy_values_checked())
        false
      } catch {
        @core.DataError::InvalidTicks(message~) =>
          message ==
          "ValueError: could not convert string to float: '\\x1c1\\x1f'"
        _ => false
      },
    )
    assert_eq([line.invalid_x, line.invalid_y], [true, true])
    assert_eq(line.stale(), true)
    assert_true(line.owner is None)
    assert_eq(line.cache.flat.length(), 0)
  }
  {
    let line = line_data_source_detached(
      LineData::Category(["\u{200b}1"]),
      LineData::Numeric([0.0]),
    )
    assert_true(
      try {
        ignore(line.xy_values_checked())
        false
      } catch {
        @core.DataError::InvalidTicks(message~) =>
          message == "ValueError: could not convert string to float: '\\u200b1'"
        _ => false
      },
    )
    assert_eq([line.invalid_x, line.invalid_y], [true, true])
    assert_eq(line.stale(), true)
    assert_true(line.owner is None)
    assert_eq(line.cache.flat.length(), 0)
  }
  {
    let line = line_data_source_detached(
      LineData::Category(["0x1p0"]),
      LineData::Numeric([0.0]),
    )
    assert_true(
      try {
        ignore(line.xy_values_checked())
        false
      } catch {
        @core.DataError::InvalidTicks(message~) =>
          message == "ValueError: could not convert string to float: '0x1p0'"
        _ => false
      },
    )
    assert_eq([line.invalid_x, line.invalid_y], [true, true])
    assert_eq(line.stale(), true)
    assert_true(line.owner is None)
    assert_eq(line.cache.flat.length(), 0)
  }
  let line = line_data_source_detached(
    LineData::Category(["nan(1)"]),
    LineData::Numeric([0.0]),
  )
  assert_true(
    try {
      ignore(line.xy_values_checked())
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: could not convert string to float: 'nan(1)'"
      _ => false
    },
  )
  assert_eq([line.invalid_x, line.invalid_y], [true, true])
  assert_eq(line.stale(), true)
  assert_true(line.owner is None)
  assert_eq(line.cache.flat.length(), 0)
}

///|
fn line_data_source_detached_3() -> Unit raise {
  let line = line_data_source_detached(
    LineData::Date([
      @date.RRuleDateTime::aware(@date.datetime(2024, 1, 1)),
      @date.RRuleDateTime::naive(@date.datetime(2024, 1, 2)),
    ]),
    LineData::Numeric([0.0, 1.0]),
  )
  assert_true(
    try {
      ignore(line.xy_values_checked())
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: float() argument must be a string or a real number, not 'datetime.datetime'"
      _ => false
    },
  )
  assert_eq([line.invalid_x, line.invalid_y], [true, true])
  assert_eq(line.stale(), true)
  assert_true(line.owner is None)
  assert_eq(line.cache.flat.length(), 0)
}

///|
test "original Line data and detached conversion group 0" {
  line_data_source_sequence_0() catch {
    error => fail("Line data original sequence 0: " + error.to_string())
  }
  line_data_source_sequence_1() catch {
    error => fail("Line data original sequence 1: " + error.to_string())
  }
  line_data_source_sequence_2() catch {
    error => fail("Line data original sequence 2: " + error.to_string())
  }
  line_data_source_sequence_3() catch {
    error => fail("Line data original sequence 3: " + error.to_string())
  }
  line_data_source_detached_0() catch {
    error => fail("Line data ownerNone profile 0: " + error.to_string())
  }
  line_data_source_detached_1() catch {
    error => fail("Line data ownerNone profile 1: " + error.to_string())
  }
  line_data_source_detached_2() catch {
    error => fail("Line data ownerNone profile 2: " + error.to_string())
  }
  line_data_source_detached_3() catch {
    error => fail("Line data ownerNone profile 3: " + error.to_string())
  }
}
