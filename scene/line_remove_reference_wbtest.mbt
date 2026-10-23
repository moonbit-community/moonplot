// Generated from pinned complete original Artist/Line removal methods; do not edit.

///|
fn line_remove_source_double(actual : Double, expected : Double) -> Unit raise {
  if expected.is_nan() {
    assert_true(actual.is_nan())
  } else {
    assert_eq(actual.reinterpret_as_uint64(), expected.reinterpret_as_uint64())
  }
}

///|
fn line_remove_source_numbers(
  actual : Array[Double],
  expected : Array[Double],
) -> Unit raise {
  assert_eq(actual.length(), expected.length())
  for index in 0..<actual.length() {
    line_remove_source_double(actual[index], expected[index])
  }
}

///|
fn line_remove_source_aliases(
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
fn line_remove_source_sequence_0() -> Unit raise {
  let fig = figure()
  let axes = fig.axes()
  let first = axes.plot_line(
    LineData::Numeric([
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ]),
    LineData::Numeric([
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ]),
  )
  let last = axes.plot_line(
    LineData::Numeric([
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ]),
    LineData::Numeric([
      4629137466983448576UL.reinterpret_as_double(),
      4630826316843712512UL.reinterpret_as_double(),
    ]),
  )
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  // Source 2: remove last Line unlinks child and mouseover but leaves cached limits and requests
  {
    assert_eq(fig.axes_list().length(), 1)
    assert_eq(axes.state.val.artists.length(), 2)
    assert_eq(axes.state.val.line_originals.length(), 2)
    guard axes.state.val.artists[0] is Artist::Line(buffer_0, _) else {
      fail("expected attached Line artist")
    }
    assert_true(physical_equal(buffer_0, first.points))
    guard axes.state.val.artists[1] is Artist::Line(buffer_1, _) else {
      fail("expected attached Line artist")
    }
    assert_true(physical_equal(buffer_1, last.points))
    assert_true(physical_equal(axes.state.val.line_originals[0], first))
    assert_true(physical_equal(axes.state.val.line_originals[1], last))
    line_remove_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
      ],
      [
        0UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
    )
    line_remove_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4630826316843712512UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.x_axis().autoscale_stale(), false)
    assert_eq(axes.y_axis().autoscale_stale(), false)
    assert_eq(first.owner is Some(_), true)
    assert_eq(first.removal_parent is None, false)
    assert_eq([first.invalid_x, first.invalid_y], [false, false])
    assert_eq(first.stale(), true)
    assert_true(physical_equal(first.owner.unwrap().state, axes.state))
    assert_true(physical_equal(first.removal_parent.unwrap().state, axes.state))
    line_remove_source_numbers(first.cache.flat.to_array(), [
      0UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    assert_eq(last.owner is Some(_), true)
    assert_eq(last.removal_parent is None, false)
    assert_eq([last.invalid_x, last.invalid_y], [false, false])
    assert_eq(last.stale(), true)
    assert_true(physical_equal(last.owner.unwrap().state, axes.state))
    assert_true(physical_equal(last.removal_parent.unwrap().state, axes.state))
    line_remove_source_numbers(last.cache.flat.to_array(), [
      4621819117588971520UL.reinterpret_as_double(),
      4629137466983448576UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
      4630826316843712512UL.reinterpret_as_double(),
    ])
  }
  last.remove()
  {
    assert_eq(fig.axes_list().length(), 1)
    assert_eq(axes.state.val.artists.length(), 1)
    assert_eq(axes.state.val.line_originals.length(), 1)
    guard axes.state.val.artists[0] is Artist::Line(buffer_0, _) else {
      fail("expected attached Line artist")
    }
    assert_true(physical_equal(buffer_0, first.points))
    assert_true(physical_equal(axes.state.val.line_originals[0], first))
    line_remove_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
      ],
      [
        0UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
    )
    line_remove_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4630826316843712512UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.x_axis().autoscale_stale(), false)
    assert_eq(axes.y_axis().autoscale_stale(), false)
    assert_eq(first.owner is Some(_), true)
    assert_eq(first.removal_parent is None, false)
    assert_eq([first.invalid_x, first.invalid_y], [false, false])
    assert_eq(first.stale(), true)
    assert_true(physical_equal(first.owner.unwrap().state, axes.state))
    assert_true(physical_equal(first.removal_parent.unwrap().state, axes.state))
    line_remove_source_numbers(first.cache.flat.to_array(), [
      0UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    assert_eq(last.owner is Some(_), false)
    assert_eq(last.removal_parent is None, false)
    assert_eq([last.invalid_x, last.invalid_y], [false, false])
    assert_eq(last.stale(), true)
    assert_true(physical_equal(last.removal_parent.unwrap().state, axes.state))
    line_remove_source_numbers(last.cache.flat.to_array(), [
      4621819117588971520UL.reinterpret_as_double(),
      4629137466983448576UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
      4630826316843712512UL.reinterpret_as_double(),
    ])
  }
  // Source 4: second remove retries retained list.remove callback before further unlink
  {
    assert_eq(fig.axes_list().length(), 1)
    assert_eq(axes.state.val.artists.length(), 1)
    assert_eq(axes.state.val.line_originals.length(), 1)
    guard axes.state.val.artists[0] is Artist::Line(buffer_0, _) else {
      fail("expected attached Line artist")
    }
    assert_true(physical_equal(buffer_0, first.points))
    assert_true(physical_equal(axes.state.val.line_originals[0], first))
    line_remove_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
      ],
      [
        0UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
    )
    line_remove_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4630826316843712512UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.x_axis().autoscale_stale(), false)
    assert_eq(axes.y_axis().autoscale_stale(), false)
    assert_eq(first.owner is Some(_), true)
    assert_eq(first.removal_parent is None, false)
    assert_eq([first.invalid_x, first.invalid_y], [false, false])
    assert_eq(first.stale(), true)
    assert_true(physical_equal(first.owner.unwrap().state, axes.state))
    assert_true(physical_equal(first.removal_parent.unwrap().state, axes.state))
    line_remove_source_numbers(first.cache.flat.to_array(), [
      0UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    assert_eq(last.owner is Some(_), false)
    assert_eq(last.removal_parent is None, false)
    assert_eq([last.invalid_x, last.invalid_y], [false, false])
    assert_eq(last.stale(), true)
    assert_true(physical_equal(last.removal_parent.unwrap().state, axes.state))
    line_remove_source_numbers(last.cache.flat.to_array(), [
      4621819117588971520UL.reinterpret_as_double(),
      4629137466983448576UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
      4630826316843712512UL.reinterpret_as_double(),
    ])
  }
  assert_true(
    try {
      last.remove()
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: list.remove(x): x not in list"
      _ => false
    },
  )
  {
    assert_eq(fig.axes_list().length(), 1)
    assert_eq(axes.state.val.artists.length(), 1)
    assert_eq(axes.state.val.line_originals.length(), 1)
    guard axes.state.val.artists[0] is Artist::Line(buffer_0, _) else {
      fail("expected attached Line artist")
    }
    assert_true(physical_equal(buffer_0, first.points))
    assert_true(physical_equal(axes.state.val.line_originals[0], first))
    line_remove_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
      ],
      [
        0UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
    )
    line_remove_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4630826316843712512UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.x_axis().autoscale_stale(), false)
    assert_eq(axes.y_axis().autoscale_stale(), false)
    assert_eq(first.owner is Some(_), true)
    assert_eq(first.removal_parent is None, false)
    assert_eq([first.invalid_x, first.invalid_y], [false, false])
    assert_eq(first.stale(), true)
    assert_true(physical_equal(first.owner.unwrap().state, axes.state))
    assert_true(physical_equal(first.removal_parent.unwrap().state, axes.state))
    line_remove_source_numbers(first.cache.flat.to_array(), [
      0UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    assert_eq(last.owner is Some(_), false)
    assert_eq(last.removal_parent is None, false)
    assert_eq([last.invalid_x, last.invalid_y], [false, false])
    assert_eq(last.stale(), true)
    assert_true(physical_equal(last.removal_parent.unwrap().state, axes.state))
    line_remove_source_numbers(last.cache.flat.to_array(), [
      4621819117588971520UL.reinterpret_as_double(),
      4629137466983448576UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
      4630826316843712512UL.reinterpret_as_double(),
    ])
  }
  // Source 5: removed handle retains numeric data setters and lazy recache with owner None
  {
    assert_eq(fig.axes_list().length(), 1)
    assert_eq(axes.state.val.artists.length(), 1)
    assert_eq(axes.state.val.line_originals.length(), 1)
    guard axes.state.val.artists[0] is Artist::Line(buffer_0, _) else {
      fail("expected attached Line artist")
    }
    assert_true(physical_equal(buffer_0, first.points))
    assert_true(physical_equal(axes.state.val.line_originals[0], first))
    line_remove_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
      ],
      [
        0UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
    )
    line_remove_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4630826316843712512UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.x_axis().autoscale_stale(), false)
    assert_eq(axes.y_axis().autoscale_stale(), false)
    assert_eq(first.owner is Some(_), true)
    assert_eq(first.removal_parent is None, false)
    assert_eq([first.invalid_x, first.invalid_y], [false, false])
    assert_eq(first.stale(), true)
    assert_true(physical_equal(first.owner.unwrap().state, axes.state))
    assert_true(physical_equal(first.removal_parent.unwrap().state, axes.state))
    line_remove_source_numbers(first.cache.flat.to_array(), [
      0UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    assert_eq(last.owner is Some(_), false)
    assert_eq(last.removal_parent is None, false)
    assert_eq([last.invalid_x, last.invalid_y], [false, false])
    assert_eq(last.stale(), true)
    assert_true(physical_equal(last.removal_parent.unwrap().state, axes.state))
    line_remove_source_numbers(last.cache.flat.to_array(), [
      4621819117588971520UL.reinterpret_as_double(),
      4629137466983448576UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
      4630826316843712512UL.reinterpret_as_double(),
    ])
  }
  last.set_data(
    LineData::Numeric([50.0, 60.0]),
    LineData::Numeric([70.0, 80.0]),
  )
  ignore(last.xy_values_checked())
  {
    assert_eq(fig.axes_list().length(), 1)
    assert_eq(axes.state.val.artists.length(), 1)
    assert_eq(axes.state.val.line_originals.length(), 1)
    guard axes.state.val.artists[0] is Artist::Line(buffer_0, _) else {
      fail("expected attached Line artist")
    }
    assert_true(physical_equal(buffer_0, first.points))
    assert_true(physical_equal(axes.state.val.line_originals[0], first))
    line_remove_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
      ],
      [
        0UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
    )
    line_remove_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4630826316843712512UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.x_axis().autoscale_stale(), false)
    assert_eq(axes.y_axis().autoscale_stale(), false)
    assert_eq(first.owner is Some(_), true)
    assert_eq(first.removal_parent is None, false)
    assert_eq([first.invalid_x, first.invalid_y], [false, false])
    assert_eq(first.stale(), true)
    assert_true(physical_equal(first.owner.unwrap().state, axes.state))
    assert_true(physical_equal(first.removal_parent.unwrap().state, axes.state))
    line_remove_source_numbers(first.cache.flat.to_array(), [
      0UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    assert_eq(last.owner is Some(_), false)
    assert_eq(last.removal_parent is None, false)
    assert_eq([last.invalid_x, last.invalid_y], [false, false])
    assert_eq(last.stale(), true)
    assert_true(physical_equal(last.removal_parent.unwrap().state, axes.state))
    line_remove_source_numbers(last.cache.flat.to_array(), [
      4632233691727265792UL.reinterpret_as_double(),
      4634626229029306368UL.reinterpret_as_double(),
      4633641066610819072UL.reinterpret_as_double(),
      4635329916471083008UL.reinterpret_as_double(),
    ])
  }
  line_remove_source_numbers(last.xy_values_checked().to_array(), [
    4632233691727265792UL.reinterpret_as_double(),
    4634626229029306368UL.reinterpret_as_double(),
    4633641066610819072UL.reinterpret_as_double(),
    4635329916471083008UL.reinterpret_as_double(),
  ])
  // Source 6: explicit relim alone removes old cached extrema, still no autoscale request
  {
    assert_eq(fig.axes_list().length(), 1)
    assert_eq(axes.state.val.artists.length(), 1)
    assert_eq(axes.state.val.line_originals.length(), 1)
    guard axes.state.val.artists[0] is Artist::Line(buffer_0, _) else {
      fail("expected attached Line artist")
    }
    assert_true(physical_equal(buffer_0, first.points))
    assert_true(physical_equal(axes.state.val.line_originals[0], first))
    line_remove_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
      ],
      [
        0UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
    )
    line_remove_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4630826316843712512UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.x_axis().autoscale_stale(), false)
    assert_eq(axes.y_axis().autoscale_stale(), false)
    assert_eq(first.owner is Some(_), true)
    assert_eq(first.removal_parent is None, false)
    assert_eq([first.invalid_x, first.invalid_y], [false, false])
    assert_eq(first.stale(), true)
    assert_true(physical_equal(first.owner.unwrap().state, axes.state))
    assert_true(physical_equal(first.removal_parent.unwrap().state, axes.state))
    line_remove_source_numbers(first.cache.flat.to_array(), [
      0UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    assert_eq(last.owner is Some(_), false)
    assert_eq(last.removal_parent is None, false)
    assert_eq([last.invalid_x, last.invalid_y], [false, false])
    assert_eq(last.stale(), true)
    assert_true(physical_equal(last.removal_parent.unwrap().state, axes.state))
    line_remove_source_numbers(last.cache.flat.to_array(), [
      4632233691727265792UL.reinterpret_as_double(),
      4634626229029306368UL.reinterpret_as_double(),
      4633641066610819072UL.reinterpret_as_double(),
      4635329916471083008UL.reinterpret_as_double(),
    ])
  }
  axes.relim_checked()
  assert_eq(fig.axes_list().length(), 1)
  assert_eq(axes.state.val.artists.length(), 1)
  assert_eq(axes.state.val.line_originals.length(), 1)
  guard axes.state.val.artists[0] is Artist::Line(buffer_0, _) else {
    fail("expected attached Line artist")
  }
  assert_true(physical_equal(buffer_0, first.points))
  assert_true(physical_equal(axes.state.val.line_originals[0], first))
  line_remove_source_numbers(
    [
      axes.data_limits(horizontal=true).lower(),
      axes.data_limits(horizontal=true).upper(),
    ],
    [0UL.reinterpret_as_double(), 4607182418800017408UL.reinterpret_as_double()],
  )
  line_remove_source_numbers(
    [
      axes.data_limits(horizontal=false).lower(),
      axes.data_limits(horizontal=false).upper(),
    ],
    [
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ],
  )
  assert_eq(axes.x_axis().autoscale_stale(), false)
  assert_eq(axes.y_axis().autoscale_stale(), false)
  assert_eq(first.owner is Some(_), true)
  assert_eq(first.removal_parent is None, false)
  assert_eq([first.invalid_x, first.invalid_y], [false, false])
  assert_eq(first.stale(), true)
  assert_true(physical_equal(first.owner.unwrap().state, axes.state))
  assert_true(physical_equal(first.removal_parent.unwrap().state, axes.state))
  line_remove_source_numbers(first.cache.flat.to_array(), [
    0UL.reinterpret_as_double(),
    4621819117588971520UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  ])
  assert_eq(last.owner is Some(_), false)
  assert_eq(last.removal_parent is None, false)
  assert_eq([last.invalid_x, last.invalid_y], [false, false])
  assert_eq(last.stale(), true)
  assert_true(physical_equal(last.removal_parent.unwrap().state, axes.state))
  line_remove_source_numbers(last.cache.flat.to_array(), [
    4632233691727265792UL.reinterpret_as_double(),
    4634626229029306368UL.reinterpret_as_double(),
    4633641066610819072UL.reinterpret_as_double(),
    4635329916471083008UL.reinterpret_as_double(),
  ])
}

///|
fn line_remove_source_sequence_1() -> Unit raise {
  let fig = figure()
  let axes = fig.axes()
  let old = axes.plot_line(
    LineData::Numeric([
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ]),
    LineData::Numeric([
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ]),
  )
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  // Source 9: complete original Axes clear detaches Line and nulls remove method
  {
    assert_eq(fig.axes_list().length(), 1)
    assert_eq(axes.state.val.artists.length(), 1)
    assert_eq(axes.state.val.line_originals.length(), 1)
    guard axes.state.val.artists[0] is Artist::Line(buffer_0, _) else {
      fail("expected attached Line artist")
    }
    assert_true(physical_equal(buffer_0, old.points))
    assert_true(physical_equal(axes.state.val.line_originals[0], old))
    line_remove_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line_remove_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.x_axis().autoscale_stale(), false)
    assert_eq(axes.y_axis().autoscale_stale(), false)
    assert_eq(old.owner is Some(_), true)
    assert_eq(old.removal_parent is None, false)
    assert_eq([old.invalid_x, old.invalid_y], [false, false])
    assert_eq(old.stale(), true)
    assert_true(physical_equal(old.owner.unwrap().state, axes.state))
    assert_true(physical_equal(old.removal_parent.unwrap().state, axes.state))
    line_remove_source_numbers(old.cache.flat.to_array(), [
      0UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
  }
  axes.clear_checked()
  {
    assert_eq(fig.axes_list().length(), 1)
    assert_eq(axes.state.val.artists.length(), 0)
    assert_eq(axes.state.val.line_originals.length(), 0)
    line_remove_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line_remove_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.x_axis().autoscale_stale(), false)
    assert_eq(axes.y_axis().autoscale_stale(), false)
    assert_eq(old.owner is Some(_), false)
    assert_eq(old.removal_parent is None, true)
    assert_eq([old.invalid_x, old.invalid_y], [false, false])
    assert_eq(old.stale(), true)
    line_remove_source_numbers(old.cache.flat.to_array(), [
      0UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
  }
  // Source 10: after full clear old Line remove gives NotImplementedError
  {
    assert_eq(fig.axes_list().length(), 1)
    assert_eq(axes.state.val.artists.length(), 0)
    assert_eq(axes.state.val.line_originals.length(), 0)
    line_remove_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line_remove_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.x_axis().autoscale_stale(), false)
    assert_eq(axes.y_axis().autoscale_stale(), false)
    assert_eq(old.owner is Some(_), false)
    assert_eq(old.removal_parent is None, true)
    assert_eq([old.invalid_x, old.invalid_y], [false, false])
    assert_eq(old.stale(), true)
    line_remove_source_numbers(old.cache.flat.to_array(), [
      0UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
  }
  assert_true(
    try {
      old.remove()
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "NotImplementedError: cannot remove artist"
      _ => false
    },
  )
  {
    assert_eq(fig.axes_list().length(), 1)
    assert_eq(axes.state.val.artists.length(), 0)
    assert_eq(axes.state.val.line_originals.length(), 0)
    line_remove_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line_remove_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.x_axis().autoscale_stale(), false)
    assert_eq(axes.y_axis().autoscale_stale(), false)
    assert_eq(old.owner is Some(_), false)
    assert_eq(old.removal_parent is None, true)
    assert_eq([old.invalid_x, old.invalid_y], [false, false])
    assert_eq(old.stale(), true)
    line_remove_source_numbers(old.cache.flat.to_array(), [
      0UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
  }
  // Source 11: after full clear old Line numeric data remains usable
  {
    assert_eq(fig.axes_list().length(), 1)
    assert_eq(axes.state.val.artists.length(), 0)
    assert_eq(axes.state.val.line_originals.length(), 0)
    line_remove_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line_remove_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.x_axis().autoscale_stale(), false)
    assert_eq(axes.y_axis().autoscale_stale(), false)
    assert_eq(old.owner is Some(_), false)
    assert_eq(old.removal_parent is None, true)
    assert_eq([old.invalid_x, old.invalid_y], [false, false])
    assert_eq(old.stale(), true)
    line_remove_source_numbers(old.cache.flat.to_array(), [
      0UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
  }
  old.set_data(LineData::Numeric([4.0, 5.0]), LineData::Numeric([6.0, 7.0]))
  ignore(old.xy_values_checked())
  {
    assert_eq(fig.axes_list().length(), 1)
    assert_eq(axes.state.val.artists.length(), 0)
    assert_eq(axes.state.val.line_originals.length(), 0)
    line_remove_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line_remove_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.x_axis().autoscale_stale(), false)
    assert_eq(axes.y_axis().autoscale_stale(), false)
    assert_eq(old.owner is Some(_), false)
    assert_eq(old.removal_parent is None, true)
    assert_eq([old.invalid_x, old.invalid_y], [false, false])
    assert_eq(old.stale(), true)
    line_remove_source_numbers(old.cache.flat.to_array(), [
      4616189618054758400UL.reinterpret_as_double(),
      4618441417868443648UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
      4619567317775286272UL.reinterpret_as_double(),
    ])
  }
  line_remove_source_numbers(old.xy_values_checked().to_array(), [
    4616189618054758400UL.reinterpret_as_double(),
    4618441417868443648UL.reinterpret_as_double(),
    4617315517961601024UL.reinterpret_as_double(),
    4619567317775286272UL.reinterpret_as_double(),
  ])
}

///|
fn line_remove_source_sequence_2() -> Unit raise {
  let fig = figure()
  let axes = fig.axes()
  let kept = axes.plot_line(
    LineData::Numeric([
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ]),
    LineData::Numeric([
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ]),
  )
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  // Source 12: Figure.delaxes removes panel membership without clearing Line owner or children
  {
    assert_eq(fig.axes_list().length(), 1)
    assert_eq(axes.state.val.artists.length(), 1)
    assert_eq(axes.state.val.line_originals.length(), 1)
    guard axes.state.val.artists[0] is Artist::Line(buffer_0, _) else {
      fail("expected attached Line artist")
    }
    assert_true(physical_equal(buffer_0, kept.points))
    assert_true(physical_equal(axes.state.val.line_originals[0], kept))
    line_remove_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line_remove_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.x_axis().autoscale_stale(), false)
    assert_eq(axes.y_axis().autoscale_stale(), false)
    assert_eq(kept.owner is Some(_), true)
    assert_eq(kept.removal_parent is None, false)
    assert_eq([kept.invalid_x, kept.invalid_y], [false, false])
    assert_eq(kept.stale(), true)
    assert_true(physical_equal(kept.owner.unwrap().state, axes.state))
    assert_true(physical_equal(kept.removal_parent.unwrap().state, axes.state))
    line_remove_source_numbers(kept.cache.flat.to_array(), [
      0UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
  }
  fig.delaxes(axes)
  {
    assert_eq(fig.axes_list().length(), 0)
    assert_eq(axes.state.val.artists.length(), 1)
    assert_eq(axes.state.val.line_originals.length(), 1)
    guard axes.state.val.artists[0] is Artist::Line(buffer_0, _) else {
      fail("expected attached Line artist")
    }
    assert_true(physical_equal(buffer_0, kept.points))
    assert_true(physical_equal(axes.state.val.line_originals[0], kept))
    line_remove_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line_remove_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.x_axis().autoscale_stale(), false)
    assert_eq(axes.y_axis().autoscale_stale(), false)
    assert_eq(kept.owner is Some(_), true)
    assert_eq(kept.removal_parent is None, false)
    assert_eq([kept.invalid_x, kept.invalid_y], [false, false])
    assert_eq(kept.stale(), true)
    assert_true(physical_equal(kept.owner.unwrap().state, axes.state))
    assert_true(physical_equal(kept.removal_parent.unwrap().state, axes.state))
    line_remove_source_numbers(kept.cache.flat.to_array(), [
      0UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
  }
  // Source 13: Line.remove still works on retained Axes after Figure.delaxes
  {
    assert_eq(fig.axes_list().length(), 0)
    assert_eq(axes.state.val.artists.length(), 1)
    assert_eq(axes.state.val.line_originals.length(), 1)
    guard axes.state.val.artists[0] is Artist::Line(buffer_0, _) else {
      fail("expected attached Line artist")
    }
    assert_true(physical_equal(buffer_0, kept.points))
    assert_true(physical_equal(axes.state.val.line_originals[0], kept))
    line_remove_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line_remove_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.x_axis().autoscale_stale(), false)
    assert_eq(axes.y_axis().autoscale_stale(), false)
    assert_eq(kept.owner is Some(_), true)
    assert_eq(kept.removal_parent is None, false)
    assert_eq([kept.invalid_x, kept.invalid_y], [false, false])
    assert_eq(kept.stale(), true)
    assert_true(physical_equal(kept.owner.unwrap().state, axes.state))
    assert_true(physical_equal(kept.removal_parent.unwrap().state, axes.state))
    line_remove_source_numbers(kept.cache.flat.to_array(), [
      0UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
  }
  kept.remove()
  assert_eq(fig.axes_list().length(), 0)
  assert_eq(axes.state.val.artists.length(), 0)
  assert_eq(axes.state.val.line_originals.length(), 0)
  line_remove_source_numbers(
    [
      axes.data_limits(horizontal=true).lower(),
      axes.data_limits(horizontal=true).upper(),
    ],
    [0UL.reinterpret_as_double(), 4607182418800017408UL.reinterpret_as_double()],
  )
  line_remove_source_numbers(
    [
      axes.data_limits(horizontal=false).lower(),
      axes.data_limits(horizontal=false).upper(),
    ],
    [
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ],
  )
  assert_eq(axes.x_axis().autoscale_stale(), false)
  assert_eq(axes.y_axis().autoscale_stale(), false)
  assert_eq(kept.owner is Some(_), false)
  assert_eq(kept.removal_parent is None, false)
  assert_eq([kept.invalid_x, kept.invalid_y], [false, false])
  assert_eq(kept.stale(), true)
  assert_true(physical_equal(kept.removal_parent.unwrap().state, axes.state))
  line_remove_source_numbers(kept.cache.flat.to_array(), [
    0UL.reinterpret_as_double(),
    4621819117588971520UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  ])
}

///|
fn line_remove_source_sequence_3() -> Unit raise {
  let fig = figure()
  let axes = fig.axes()
  let removed = axes.plot_line(
    LineData::Numeric([
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ]),
    LineData::Numeric([
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ]),
  )
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  let previous_xy = removed.xy_values_checked()
  removed.remove()
  assert_eq(line_remove_source_aliases(previous_xy, removed.cache.flat), true)
  // Source 14: remove then clear leaves historical callback and repeated ValueError
  {
    assert_eq(fig.axes_list().length(), 1)
    assert_eq(axes.state.val.artists.length(), 0)
    assert_eq(axes.state.val.line_originals.length(), 0)
    line_remove_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line_remove_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.x_axis().autoscale_stale(), false)
    assert_eq(axes.y_axis().autoscale_stale(), false)
    assert_eq(removed.owner is Some(_), false)
    assert_eq(removed.removal_parent is None, false)
    assert_eq([removed.invalid_x, removed.invalid_y], [false, false])
    assert_eq(removed.stale(), true)
    assert_true(
      physical_equal(removed.removal_parent.unwrap().state, axes.state),
    )
    line_remove_source_numbers(removed.cache.flat.to_array(), [
      0UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
  }
  assert_true(
    try {
      axes.clear_checked()
      removed.remove()
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: list.remove(x): x not in list"
      _ => false
    },
  )
  {
    assert_eq(fig.axes_list().length(), 1)
    assert_eq(axes.state.val.artists.length(), 0)
    assert_eq(axes.state.val.line_originals.length(), 0)
    line_remove_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line_remove_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.x_axis().autoscale_stale(), false)
    assert_eq(axes.y_axis().autoscale_stale(), false)
    assert_eq(removed.owner is Some(_), false)
    assert_eq(removed.removal_parent is None, false)
    assert_eq([removed.invalid_x, removed.invalid_y], [false, false])
    assert_eq(removed.stale(), true)
    assert_true(
      physical_equal(removed.removal_parent.unwrap().state, axes.state),
    )
    line_remove_source_numbers(removed.cache.flat.to_array(), [
      0UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
  }
  assert_eq(line_remove_source_aliases(previous_xy, removed.cache.flat), true)
}

///|
test "original Line removal lifecycle group 0" {
  line_remove_source_sequence_0() catch {
    error => fail("Line remove original sequence 0: " + error.to_string())
  }
  line_remove_source_sequence_1() catch {
    error => fail("Line remove original sequence 1: " + error.to_string())
  }
  line_remove_source_sequence_2() catch {
    error => fail("Line remove original sequence 2: " + error.to_string())
  }
  line_remove_source_sequence_3() catch {
    error => fail("Line remove original sequence 3: " + error.to_string())
  }
}
