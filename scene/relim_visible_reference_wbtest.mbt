// Generated from pinned original relim visible_only methods; do not edit.

///|
fn relim_visible_source_double(
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
fn relim_visible_source_numbers(
  actual : Array[Double],
  expected : Array[Double],
) -> Unit raise {
  assert_eq(actual.length(), expected.length())
  for index in 0..<actual.length() {
    relim_visible_source_double(actual[index], expected[index])
  }
}

///|
fn relim_visible_source_sequence() -> Unit raise {
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let first = axes.plot_line(
    LineData::Numeric([1.0, 2.0]),
    LineData::Numeric([10.0, 20.0]),
  )
  let second = axes.plot_line(
    LineData::Numeric([100.0, 200.0]),
    LineData::Numeric([300.0, 400.0]),
  )
  // The controlled source host stores a plain initial view Bbox. Seed
  // that input after Scene unit setup, without changing auto-enable.
  axes
  .x_axis()
  .set_view_limits(
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  axes
  .y_axis()
  .set_view_limits(
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  // 0 default relim includes a hidden Line
  {
    assert_eq(axes.ignore_existing_data_limits(), false)
    relim_visible_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
        axes.data_minpos(horizontal=true),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4641240890982006784UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.x_axis().autoscale_stale(), false)
    assert_eq(axes.x_axis().autoscale_on(), true)
    // Stored limits do not consume a pending request or trigger autoscale.
    {
      let view = axes.x_axis().stored_view_limits()
      relim_visible_source_numbers([view.lower(), view.upper()], [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ])
    }
    relim_visible_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
        axes.data_minpos(horizontal=false),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4645744490609377280UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.y_axis().autoscale_stale(), false)
    assert_eq(axes.y_axis().autoscale_on(), true)
    // Stored limits do not consume a pending request or trigger autoscale.
    {
      let view = axes.y_axis().stored_view_limits()
      relim_visible_source_numbers([view.lower(), view.upper()], [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ])
    }
    assert_eq(first.get_visible(), true)
    assert_eq(first.stale(), true)
    assert_eq([first.invalid_x, first.invalid_y], [false, false])
    // Inspect the retained cache without accidentally recaching a hidden error.
    relim_visible_source_numbers(first.cache.flat.to_array(), [
      4607182418800017408UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    assert_eq(second.get_visible(), true)
    assert_eq(second.stale(), true)
    assert_eq([second.invalid_x, second.invalid_y], [false, false])
    // Inspect the retained cache without accidentally recaching a hidden error.
    relim_visible_source_numbers(second.cache.flat.to_array(), [
      4636737291354636288UL.reinterpret_as_double(),
      4643985272004935680UL.reinterpret_as_double(),
      4641240890982006784UL.reinterpret_as_double(),
      4645744490609377280UL.reinterpret_as_double(),
    ])
  }
  second.set_visible(false)
  axes.relim()
  {
    assert_eq(axes.ignore_existing_data_limits(), false)
    relim_visible_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
        axes.data_minpos(horizontal=true),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4641240890982006784UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.x_axis().autoscale_stale(), false)
    assert_eq(axes.x_axis().autoscale_on(), true)
    // Stored limits do not consume a pending request or trigger autoscale.
    {
      let view = axes.x_axis().stored_view_limits()
      relim_visible_source_numbers([view.lower(), view.upper()], [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ])
    }
    relim_visible_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
        axes.data_minpos(horizontal=false),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4645744490609377280UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.y_axis().autoscale_stale(), false)
    assert_eq(axes.y_axis().autoscale_on(), true)
    // Stored limits do not consume a pending request or trigger autoscale.
    {
      let view = axes.y_axis().stored_view_limits()
      relim_visible_source_numbers([view.lower(), view.upper()], [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ])
    }
    assert_eq(first.get_visible(), true)
    assert_eq(first.stale(), true)
    assert_eq([first.invalid_x, first.invalid_y], [false, false])
    // Inspect the retained cache without accidentally recaching a hidden error.
    relim_visible_source_numbers(first.cache.flat.to_array(), [
      4607182418800017408UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    assert_eq(second.get_visible(), false)
    assert_eq(second.stale(), true)
    assert_eq([second.invalid_x, second.invalid_y], [false, false])
    // Inspect the retained cache without accidentally recaching a hidden error.
    relim_visible_source_numbers(second.cache.flat.to_array(), [
      4636737291354636288UL.reinterpret_as_double(),
      4643985272004935680UL.reinterpret_as_double(),
      4641240890982006784UL.reinterpret_as_double(),
      4645744490609377280UL.reinterpret_as_double(),
    ])
  }
  // 1 visible_only excludes hidden and recomputes the visible range
  {
    assert_eq(axes.ignore_existing_data_limits(), false)
    relim_visible_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
        axes.data_minpos(horizontal=true),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4641240890982006784UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.x_axis().autoscale_stale(), false)
    assert_eq(axes.x_axis().autoscale_on(), true)
    // Stored limits do not consume a pending request or trigger autoscale.
    {
      let view = axes.x_axis().stored_view_limits()
      relim_visible_source_numbers([view.lower(), view.upper()], [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ])
    }
    relim_visible_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
        axes.data_minpos(horizontal=false),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4645744490609377280UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.y_axis().autoscale_stale(), false)
    assert_eq(axes.y_axis().autoscale_on(), true)
    // Stored limits do not consume a pending request or trigger autoscale.
    {
      let view = axes.y_axis().stored_view_limits()
      relim_visible_source_numbers([view.lower(), view.upper()], [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ])
    }
    assert_eq(first.get_visible(), true)
    assert_eq(first.stale(), true)
    assert_eq([first.invalid_x, first.invalid_y], [false, false])
    // Inspect the retained cache without accidentally recaching a hidden error.
    relim_visible_source_numbers(first.cache.flat.to_array(), [
      4607182418800017408UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    assert_eq(second.get_visible(), false)
    assert_eq(second.stale(), true)
    assert_eq([second.invalid_x, second.invalid_y], [false, false])
    // Inspect the retained cache without accidentally recaching a hidden error.
    relim_visible_source_numbers(second.cache.flat.to_array(), [
      4636737291354636288UL.reinterpret_as_double(),
      4643985272004935680UL.reinterpret_as_double(),
      4641240890982006784UL.reinterpret_as_double(),
      4645744490609377280UL.reinterpret_as_double(),
    ])
  }
  axes.relim_checked(visible_only=true)
  {
    assert_eq(axes.ignore_existing_data_limits(), false)
    relim_visible_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
        axes.data_minpos(horizontal=true),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.x_axis().autoscale_stale(), false)
    assert_eq(axes.x_axis().autoscale_on(), true)
    // Stored limits do not consume a pending request or trigger autoscale.
    {
      let view = axes.x_axis().stored_view_limits()
      relim_visible_source_numbers([view.lower(), view.upper()], [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ])
    }
    relim_visible_source_numbers(
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
    assert_eq(axes.y_axis().autoscale_stale(), false)
    assert_eq(axes.y_axis().autoscale_on(), true)
    // Stored limits do not consume a pending request or trigger autoscale.
    {
      let view = axes.y_axis().stored_view_limits()
      relim_visible_source_numbers([view.lower(), view.upper()], [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ])
    }
    assert_eq(first.get_visible(), true)
    assert_eq(first.stale(), true)
    assert_eq([first.invalid_x, first.invalid_y], [false, false])
    // Inspect the retained cache without accidentally recaching a hidden error.
    relim_visible_source_numbers(first.cache.flat.to_array(), [
      4607182418800017408UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    assert_eq(second.get_visible(), false)
    assert_eq(second.stale(), true)
    assert_eq([second.invalid_x, second.invalid_y], [false, false])
    // Inspect the retained cache without accidentally recaching a hidden error.
    relim_visible_source_numbers(second.cache.flat.to_array(), [
      4636737291354636288UL.reinterpret_as_double(),
      4643985272004935680UL.reinterpret_as_double(),
      4641240890982006784UL.reinterpret_as_double(),
      4645744490609377280UL.reinterpret_as_double(),
    ])
  }
  // 2 all hidden yields null bbox but retains previous minimum-positive metadata
  {
    assert_eq(axes.ignore_existing_data_limits(), false)
    relim_visible_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
        axes.data_minpos(horizontal=true),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.x_axis().autoscale_stale(), false)
    assert_eq(axes.x_axis().autoscale_on(), true)
    // Stored limits do not consume a pending request or trigger autoscale.
    {
      let view = axes.x_axis().stored_view_limits()
      relim_visible_source_numbers([view.lower(), view.upper()], [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ])
    }
    relim_visible_source_numbers(
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
    assert_eq(axes.y_axis().autoscale_stale(), false)
    assert_eq(axes.y_axis().autoscale_on(), true)
    // Stored limits do not consume a pending request or trigger autoscale.
    {
      let view = axes.y_axis().stored_view_limits()
      relim_visible_source_numbers([view.lower(), view.upper()], [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ])
    }
    assert_eq(first.get_visible(), true)
    assert_eq(first.stale(), true)
    assert_eq([first.invalid_x, first.invalid_y], [false, false])
    // Inspect the retained cache without accidentally recaching a hidden error.
    relim_visible_source_numbers(first.cache.flat.to_array(), [
      4607182418800017408UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    assert_eq(second.get_visible(), false)
    assert_eq(second.stale(), true)
    assert_eq([second.invalid_x, second.invalid_y], [false, false])
    // Inspect the retained cache without accidentally recaching a hidden error.
    relim_visible_source_numbers(second.cache.flat.to_array(), [
      4636737291354636288UL.reinterpret_as_double(),
      4643985272004935680UL.reinterpret_as_double(),
      4641240890982006784UL.reinterpret_as_double(),
      4645744490609377280UL.reinterpret_as_double(),
    ])
  }
  first.set_visible(false)
  axes.relim(visible_only=true)
  {
    assert_eq(axes.ignore_existing_data_limits(), true)
    relim_visible_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
        axes.data_minpos(horizontal=true),
      ],
      [1.0 / 0.0, -1.0 / 0.0, 4607182418800017408UL.reinterpret_as_double()],
    )
    assert_eq(axes.x_axis().autoscale_stale(), false)
    assert_eq(axes.x_axis().autoscale_on(), true)
    // Stored limits do not consume a pending request or trigger autoscale.
    {
      let view = axes.x_axis().stored_view_limits()
      relim_visible_source_numbers([view.lower(), view.upper()], [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ])
    }
    relim_visible_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
        axes.data_minpos(horizontal=false),
      ],
      [1.0 / 0.0, -1.0 / 0.0, 4621819117588971520UL.reinterpret_as_double()],
    )
    assert_eq(axes.y_axis().autoscale_stale(), false)
    assert_eq(axes.y_axis().autoscale_on(), true)
    // Stored limits do not consume a pending request or trigger autoscale.
    {
      let view = axes.y_axis().stored_view_limits()
      relim_visible_source_numbers([view.lower(), view.upper()], [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ])
    }
    assert_eq(first.get_visible(), false)
    assert_eq(first.stale(), true)
    assert_eq([first.invalid_x, first.invalid_y], [false, false])
    // Inspect the retained cache without accidentally recaching a hidden error.
    relim_visible_source_numbers(first.cache.flat.to_array(), [
      4607182418800017408UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    assert_eq(second.get_visible(), false)
    assert_eq(second.stale(), true)
    assert_eq([second.invalid_x, second.invalid_y], [false, false])
    // Inspect the retained cache without accidentally recaching a hidden error.
    relim_visible_source_numbers(second.cache.flat.to_array(), [
      4636737291354636288UL.reinterpret_as_double(),
      4643985272004935680UL.reinterpret_as_double(),
      4641240890982006784UL.reinterpret_as_double(),
      4645744490609377280UL.reinterpret_as_double(),
    ])
  }
  // 3 default False still includes both hidden Lines
  {
    assert_eq(axes.ignore_existing_data_limits(), true)
    relim_visible_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
        axes.data_minpos(horizontal=true),
      ],
      [1.0 / 0.0, -1.0 / 0.0, 4607182418800017408UL.reinterpret_as_double()],
    )
    assert_eq(axes.x_axis().autoscale_stale(), false)
    assert_eq(axes.x_axis().autoscale_on(), true)
    // Stored limits do not consume a pending request or trigger autoscale.
    {
      let view = axes.x_axis().stored_view_limits()
      relim_visible_source_numbers([view.lower(), view.upper()], [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ])
    }
    relim_visible_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
        axes.data_minpos(horizontal=false),
      ],
      [1.0 / 0.0, -1.0 / 0.0, 4621819117588971520UL.reinterpret_as_double()],
    )
    assert_eq(axes.y_axis().autoscale_stale(), false)
    assert_eq(axes.y_axis().autoscale_on(), true)
    // Stored limits do not consume a pending request or trigger autoscale.
    {
      let view = axes.y_axis().stored_view_limits()
      relim_visible_source_numbers([view.lower(), view.upper()], [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ])
    }
    assert_eq(first.get_visible(), false)
    assert_eq(first.stale(), true)
    assert_eq([first.invalid_x, first.invalid_y], [false, false])
    // Inspect the retained cache without accidentally recaching a hidden error.
    relim_visible_source_numbers(first.cache.flat.to_array(), [
      4607182418800017408UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    assert_eq(second.get_visible(), false)
    assert_eq(second.stale(), true)
    assert_eq([second.invalid_x, second.invalid_y], [false, false])
    // Inspect the retained cache without accidentally recaching a hidden error.
    relim_visible_source_numbers(second.cache.flat.to_array(), [
      4636737291354636288UL.reinterpret_as_double(),
      4643985272004935680UL.reinterpret_as_double(),
      4641240890982006784UL.reinterpret_as_double(),
      4645744490609377280UL.reinterpret_as_double(),
    ])
  }
  axes.relim(visible_only=false)
  {
    assert_eq(axes.ignore_existing_data_limits(), false)
    relim_visible_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
        axes.data_minpos(horizontal=true),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4641240890982006784UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.x_axis().autoscale_stale(), false)
    assert_eq(axes.x_axis().autoscale_on(), true)
    // Stored limits do not consume a pending request or trigger autoscale.
    {
      let view = axes.x_axis().stored_view_limits()
      relim_visible_source_numbers([view.lower(), view.upper()], [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ])
    }
    relim_visible_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
        axes.data_minpos(horizontal=false),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4645744490609377280UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.y_axis().autoscale_stale(), false)
    assert_eq(axes.y_axis().autoscale_on(), true)
    // Stored limits do not consume a pending request or trigger autoscale.
    {
      let view = axes.y_axis().stored_view_limits()
      relim_visible_source_numbers([view.lower(), view.upper()], [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ])
    }
    assert_eq(first.get_visible(), false)
    assert_eq(first.stale(), true)
    assert_eq([first.invalid_x, first.invalid_y], [false, false])
    // Inspect the retained cache without accidentally recaching a hidden error.
    relim_visible_source_numbers(first.cache.flat.to_array(), [
      4607182418800017408UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    assert_eq(second.get_visible(), false)
    assert_eq(second.stale(), true)
    assert_eq([second.invalid_x, second.invalid_y], [false, false])
    // Inspect the retained cache without accidentally recaching a hidden error.
    relim_visible_source_numbers(second.cache.flat.to_array(), [
      4636737291354636288UL.reinterpret_as_double(),
      4643985272004935680UL.reinterpret_as_double(),
      4641240890982006784UL.reinterpret_as_double(),
      4645744490609377280UL.reinterpret_as_double(),
    ])
  }
  // 4 visible_only recaches visible edited prefix and skips hidden pending shape error
  {
    assert_eq(axes.ignore_existing_data_limits(), false)
    relim_visible_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
        axes.data_minpos(horizontal=true),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4641240890982006784UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.x_axis().autoscale_stale(), false)
    assert_eq(axes.x_axis().autoscale_on(), true)
    // Stored limits do not consume a pending request or trigger autoscale.
    {
      let view = axes.x_axis().stored_view_limits()
      relim_visible_source_numbers([view.lower(), view.upper()], [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ])
    }
    relim_visible_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
        axes.data_minpos(horizontal=false),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4645744490609377280UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.y_axis().autoscale_stale(), false)
    assert_eq(axes.y_axis().autoscale_on(), true)
    // Stored limits do not consume a pending request or trigger autoscale.
    {
      let view = axes.y_axis().stored_view_limits()
      relim_visible_source_numbers([view.lower(), view.upper()], [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ])
    }
    assert_eq(first.get_visible(), false)
    assert_eq(first.stale(), true)
    assert_eq([first.invalid_x, first.invalid_y], [false, false])
    // Inspect the retained cache without accidentally recaching a hidden error.
    relim_visible_source_numbers(first.cache.flat.to_array(), [
      4607182418800017408UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    assert_eq(second.get_visible(), false)
    assert_eq(second.stale(), true)
    assert_eq([second.invalid_x, second.invalid_y], [false, false])
    // Inspect the retained cache without accidentally recaching a hidden error.
    relim_visible_source_numbers(second.cache.flat.to_array(), [
      4636737291354636288UL.reinterpret_as_double(),
      4643985272004935680UL.reinterpret_as_double(),
      4641240890982006784UL.reinterpret_as_double(),
      4645744490609377280UL.reinterpret_as_double(),
    ])
  }
  first.set_visible(true)
  first.set_data(LineData::Numeric([5.0, 6.0]), LineData::Numeric([50.0, 60.0]))
  second.set_ydata(LineData::Numeric([300.0, 400.0, 500.0]))
  axes.relim_checked(visible_only=true)
  {
    assert_eq(axes.ignore_existing_data_limits(), false)
    relim_visible_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
        axes.data_minpos(horizontal=true),
      ],
      [
        4617315517961601024UL.reinterpret_as_double(),
        4618441417868443648UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.x_axis().autoscale_stale(), false)
    assert_eq(axes.x_axis().autoscale_on(), true)
    // Stored limits do not consume a pending request or trigger autoscale.
    {
      let view = axes.x_axis().stored_view_limits()
      relim_visible_source_numbers([view.lower(), view.upper()], [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ])
    }
    relim_visible_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
        axes.data_minpos(horizontal=false),
      ],
      [
        4632233691727265792UL.reinterpret_as_double(),
        4633641066610819072UL.reinterpret_as_double(),
        4632233691727265792UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.y_axis().autoscale_stale(), false)
    assert_eq(axes.y_axis().autoscale_on(), true)
    // Stored limits do not consume a pending request or trigger autoscale.
    {
      let view = axes.y_axis().stored_view_limits()
      relim_visible_source_numbers([view.lower(), view.upper()], [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ])
    }
    assert_eq(first.get_visible(), true)
    assert_eq(first.stale(), true)
    assert_eq([first.invalid_x, first.invalid_y], [false, false])
    // Inspect the retained cache without accidentally recaching a hidden error.
    relim_visible_source_numbers(first.cache.flat.to_array(), [
      4617315517961601024UL.reinterpret_as_double(),
      4632233691727265792UL.reinterpret_as_double(),
      4618441417868443648UL.reinterpret_as_double(),
      4633641066610819072UL.reinterpret_as_double(),
    ])
    assert_eq(second.get_visible(), false)
    assert_eq(second.stale(), true)
    assert_eq([second.invalid_x, second.invalid_y], [false, true])
    // Inspect the retained cache without accidentally recaching a hidden error.
    relim_visible_source_numbers(second.cache.flat.to_array(), [
      4636737291354636288UL.reinterpret_as_double(),
      4643985272004935680UL.reinterpret_as_double(),
      4641240890982006784UL.reinterpret_as_double(),
      4645744490609377280UL.reinterpret_as_double(),
    ])
  }
  // 5 default relim reaches hidden error after visible prefix merge
  {
    assert_eq(axes.ignore_existing_data_limits(), false)
    relim_visible_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
        axes.data_minpos(horizontal=true),
      ],
      [
        4617315517961601024UL.reinterpret_as_double(),
        4618441417868443648UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.x_axis().autoscale_stale(), false)
    assert_eq(axes.x_axis().autoscale_on(), true)
    // Stored limits do not consume a pending request or trigger autoscale.
    {
      let view = axes.x_axis().stored_view_limits()
      relim_visible_source_numbers([view.lower(), view.upper()], [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ])
    }
    relim_visible_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
        axes.data_minpos(horizontal=false),
      ],
      [
        4632233691727265792UL.reinterpret_as_double(),
        4633641066610819072UL.reinterpret_as_double(),
        4632233691727265792UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.y_axis().autoscale_stale(), false)
    assert_eq(axes.y_axis().autoscale_on(), true)
    // Stored limits do not consume a pending request or trigger autoscale.
    {
      let view = axes.y_axis().stored_view_limits()
      relim_visible_source_numbers([view.lower(), view.upper()], [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ])
    }
    assert_eq(first.get_visible(), true)
    assert_eq(first.stale(), true)
    assert_eq([first.invalid_x, first.invalid_y], [false, false])
    // Inspect the retained cache without accidentally recaching a hidden error.
    relim_visible_source_numbers(first.cache.flat.to_array(), [
      4617315517961601024UL.reinterpret_as_double(),
      4632233691727265792UL.reinterpret_as_double(),
      4618441417868443648UL.reinterpret_as_double(),
      4633641066610819072UL.reinterpret_as_double(),
    ])
    assert_eq(second.get_visible(), false)
    assert_eq(second.stale(), true)
    assert_eq([second.invalid_x, second.invalid_y], [false, true])
    // Inspect the retained cache without accidentally recaching a hidden error.
    relim_visible_source_numbers(second.cache.flat.to_array(), [
      4636737291354636288UL.reinterpret_as_double(),
      4643985272004935680UL.reinterpret_as_double(),
      4641240890982006784UL.reinterpret_as_double(),
      4645744490609377280UL.reinterpret_as_double(),
    ])
  }
  assert_true(
    try {
      axes.relim_checked()
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "shape mismatch: objects cannot be broadcast to a single shape.  Mismatch is between arg 0 with shape (2,) and arg 1 with shape (3,)."
      _ => false
    },
  )
  {
    assert_eq(axes.ignore_existing_data_limits(), false)
    relim_visible_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
        axes.data_minpos(horizontal=true),
      ],
      [
        4617315517961601024UL.reinterpret_as_double(),
        4618441417868443648UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.x_axis().autoscale_stale(), false)
    assert_eq(axes.x_axis().autoscale_on(), true)
    // Stored limits do not consume a pending request or trigger autoscale.
    {
      let view = axes.x_axis().stored_view_limits()
      relim_visible_source_numbers([view.lower(), view.upper()], [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ])
    }
    relim_visible_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
        axes.data_minpos(horizontal=false),
      ],
      [
        4632233691727265792UL.reinterpret_as_double(),
        4633641066610819072UL.reinterpret_as_double(),
        4632233691727265792UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.y_axis().autoscale_stale(), false)
    assert_eq(axes.y_axis().autoscale_on(), true)
    // Stored limits do not consume a pending request or trigger autoscale.
    {
      let view = axes.y_axis().stored_view_limits()
      relim_visible_source_numbers([view.lower(), view.upper()], [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ])
    }
    assert_eq(first.get_visible(), true)
    assert_eq(first.stale(), true)
    assert_eq([first.invalid_x, first.invalid_y], [false, false])
    // Inspect the retained cache without accidentally recaching a hidden error.
    relim_visible_source_numbers(first.cache.flat.to_array(), [
      4617315517961601024UL.reinterpret_as_double(),
      4632233691727265792UL.reinterpret_as_double(),
      4618441417868443648UL.reinterpret_as_double(),
      4633641066610819072UL.reinterpret_as_double(),
    ])
    assert_eq(second.get_visible(), false)
    assert_eq(second.stale(), true)
    assert_eq([second.invalid_x, second.invalid_y], [false, true])
    // Inspect the retained cache without accidentally recaching a hidden error.
    relim_visible_source_numbers(second.cache.flat.to_array(), [
      4636737291354636288UL.reinterpret_as_double(),
      4643985272004935680UL.reinterpret_as_double(),
      4641240890982006784UL.reinterpret_as_double(),
      4645744490609377280UL.reinterpret_as_double(),
    ])
  }
  // 6 show then visible_only reaches same late error and keeps prefix
  {
    assert_eq(axes.ignore_existing_data_limits(), false)
    relim_visible_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
        axes.data_minpos(horizontal=true),
      ],
      [
        4617315517961601024UL.reinterpret_as_double(),
        4618441417868443648UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.x_axis().autoscale_stale(), false)
    assert_eq(axes.x_axis().autoscale_on(), true)
    // Stored limits do not consume a pending request or trigger autoscale.
    {
      let view = axes.x_axis().stored_view_limits()
      relim_visible_source_numbers([view.lower(), view.upper()], [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ])
    }
    relim_visible_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
        axes.data_minpos(horizontal=false),
      ],
      [
        4632233691727265792UL.reinterpret_as_double(),
        4633641066610819072UL.reinterpret_as_double(),
        4632233691727265792UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.y_axis().autoscale_stale(), false)
    assert_eq(axes.y_axis().autoscale_on(), true)
    // Stored limits do not consume a pending request or trigger autoscale.
    {
      let view = axes.y_axis().stored_view_limits()
      relim_visible_source_numbers([view.lower(), view.upper()], [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ])
    }
    assert_eq(first.get_visible(), true)
    assert_eq(first.stale(), true)
    assert_eq([first.invalid_x, first.invalid_y], [false, false])
    // Inspect the retained cache without accidentally recaching a hidden error.
    relim_visible_source_numbers(first.cache.flat.to_array(), [
      4617315517961601024UL.reinterpret_as_double(),
      4632233691727265792UL.reinterpret_as_double(),
      4618441417868443648UL.reinterpret_as_double(),
      4633641066610819072UL.reinterpret_as_double(),
    ])
    assert_eq(second.get_visible(), false)
    assert_eq(second.stale(), true)
    assert_eq([second.invalid_x, second.invalid_y], [false, true])
    // Inspect the retained cache without accidentally recaching a hidden error.
    relim_visible_source_numbers(second.cache.flat.to_array(), [
      4636737291354636288UL.reinterpret_as_double(),
      4643985272004935680UL.reinterpret_as_double(),
      4641240890982006784UL.reinterpret_as_double(),
      4645744490609377280UL.reinterpret_as_double(),
    ])
  }
  assert_true(
    try {
      second.set_visible(true)
      axes.relim_checked(visible_only=true)
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "shape mismatch: objects cannot be broadcast to a single shape.  Mismatch is between arg 0 with shape (2,) and arg 1 with shape (3,)."
      _ => false
    },
  )
  {
    assert_eq(axes.ignore_existing_data_limits(), false)
    relim_visible_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
        axes.data_minpos(horizontal=true),
      ],
      [
        4617315517961601024UL.reinterpret_as_double(),
        4618441417868443648UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.x_axis().autoscale_stale(), false)
    assert_eq(axes.x_axis().autoscale_on(), true)
    // Stored limits do not consume a pending request or trigger autoscale.
    {
      let view = axes.x_axis().stored_view_limits()
      relim_visible_source_numbers([view.lower(), view.upper()], [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ])
    }
    relim_visible_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
        axes.data_minpos(horizontal=false),
      ],
      [
        4632233691727265792UL.reinterpret_as_double(),
        4633641066610819072UL.reinterpret_as_double(),
        4632233691727265792UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.y_axis().autoscale_stale(), false)
    assert_eq(axes.y_axis().autoscale_on(), true)
    // Stored limits do not consume a pending request or trigger autoscale.
    {
      let view = axes.y_axis().stored_view_limits()
      relim_visible_source_numbers([view.lower(), view.upper()], [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ])
    }
    assert_eq(first.get_visible(), true)
    assert_eq(first.stale(), true)
    assert_eq([first.invalid_x, first.invalid_y], [false, false])
    // Inspect the retained cache without accidentally recaching a hidden error.
    relim_visible_source_numbers(first.cache.flat.to_array(), [
      4617315517961601024UL.reinterpret_as_double(),
      4632233691727265792UL.reinterpret_as_double(),
      4618441417868443648UL.reinterpret_as_double(),
      4633641066610819072UL.reinterpret_as_double(),
    ])
    assert_eq(second.get_visible(), true)
    assert_eq(second.stale(), true)
    assert_eq([second.invalid_x, second.invalid_y], [false, true])
    // Inspect the retained cache without accidentally recaching a hidden error.
    relim_visible_source_numbers(second.cache.flat.to_array(), [
      4636737291354636288UL.reinterpret_as_double(),
      4643985272004935680UL.reinterpret_as_double(),
      4641240890982006784UL.reinterpret_as_double(),
      4645744490609377280UL.reinterpret_as_double(),
    ])
  }
  // 7 repair then visible_only merges the full visible range
  {
    assert_eq(axes.ignore_existing_data_limits(), false)
    relim_visible_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
        axes.data_minpos(horizontal=true),
      ],
      [
        4617315517961601024UL.reinterpret_as_double(),
        4618441417868443648UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.x_axis().autoscale_stale(), false)
    assert_eq(axes.x_axis().autoscale_on(), true)
    // Stored limits do not consume a pending request or trigger autoscale.
    {
      let view = axes.x_axis().stored_view_limits()
      relim_visible_source_numbers([view.lower(), view.upper()], [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ])
    }
    relim_visible_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
        axes.data_minpos(horizontal=false),
      ],
      [
        4632233691727265792UL.reinterpret_as_double(),
        4633641066610819072UL.reinterpret_as_double(),
        4632233691727265792UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.y_axis().autoscale_stale(), false)
    assert_eq(axes.y_axis().autoscale_on(), true)
    // Stored limits do not consume a pending request or trigger autoscale.
    {
      let view = axes.y_axis().stored_view_limits()
      relim_visible_source_numbers([view.lower(), view.upper()], [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ])
    }
    assert_eq(first.get_visible(), true)
    assert_eq(first.stale(), true)
    assert_eq([first.invalid_x, first.invalid_y], [false, false])
    // Inspect the retained cache without accidentally recaching a hidden error.
    relim_visible_source_numbers(first.cache.flat.to_array(), [
      4617315517961601024UL.reinterpret_as_double(),
      4632233691727265792UL.reinterpret_as_double(),
      4618441417868443648UL.reinterpret_as_double(),
      4633641066610819072UL.reinterpret_as_double(),
    ])
    assert_eq(second.get_visible(), true)
    assert_eq(second.stale(), true)
    assert_eq([second.invalid_x, second.invalid_y], [false, true])
    // Inspect the retained cache without accidentally recaching a hidden error.
    relim_visible_source_numbers(second.cache.flat.to_array(), [
      4636737291354636288UL.reinterpret_as_double(),
      4643985272004935680UL.reinterpret_as_double(),
      4641240890982006784UL.reinterpret_as_double(),
      4645744490609377280UL.reinterpret_as_double(),
    ])
  }
  second.set_ydata(LineData::Numeric([70.0, 80.0]))
  axes.relim_checked(visible_only=true)
  {
    assert_eq(axes.ignore_existing_data_limits(), false)
    relim_visible_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
        axes.data_minpos(horizontal=true),
      ],
      [
        4617315517961601024UL.reinterpret_as_double(),
        4641240890982006784UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.x_axis().autoscale_stale(), false)
    assert_eq(axes.x_axis().autoscale_on(), true)
    // Stored limits do not consume a pending request or trigger autoscale.
    {
      let view = axes.x_axis().stored_view_limits()
      relim_visible_source_numbers([view.lower(), view.upper()], [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ])
    }
    relim_visible_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
        axes.data_minpos(horizontal=false),
      ],
      [
        4632233691727265792UL.reinterpret_as_double(),
        4635329916471083008UL.reinterpret_as_double(),
        4632233691727265792UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.y_axis().autoscale_stale(), false)
    assert_eq(axes.y_axis().autoscale_on(), true)
    // Stored limits do not consume a pending request or trigger autoscale.
    {
      let view = axes.y_axis().stored_view_limits()
      relim_visible_source_numbers([view.lower(), view.upper()], [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ])
    }
    assert_eq(first.get_visible(), true)
    assert_eq(first.stale(), true)
    assert_eq([first.invalid_x, first.invalid_y], [false, false])
    // Inspect the retained cache without accidentally recaching a hidden error.
    relim_visible_source_numbers(first.cache.flat.to_array(), [
      4617315517961601024UL.reinterpret_as_double(),
      4632233691727265792UL.reinterpret_as_double(),
      4618441417868443648UL.reinterpret_as_double(),
      4633641066610819072UL.reinterpret_as_double(),
    ])
    assert_eq(second.get_visible(), true)
    assert_eq(second.stale(), true)
    assert_eq([second.invalid_x, second.invalid_y], [false, false])
    // Inspect the retained cache without accidentally recaching a hidden error.
    relim_visible_source_numbers(second.cache.flat.to_array(), [
      4636737291354636288UL.reinterpret_as_double(),
      4634626229029306368UL.reinterpret_as_double(),
      4641240890982006784UL.reinterpret_as_double(),
      4635329916471083008UL.reinterpret_as_double(),
    ])
  }
  // 8 all hidden after new finite range keeps its updated minpos
  {
    assert_eq(axes.ignore_existing_data_limits(), false)
    relim_visible_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
        axes.data_minpos(horizontal=true),
      ],
      [
        4617315517961601024UL.reinterpret_as_double(),
        4641240890982006784UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.x_axis().autoscale_stale(), false)
    assert_eq(axes.x_axis().autoscale_on(), true)
    // Stored limits do not consume a pending request or trigger autoscale.
    {
      let view = axes.x_axis().stored_view_limits()
      relim_visible_source_numbers([view.lower(), view.upper()], [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ])
    }
    relim_visible_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
        axes.data_minpos(horizontal=false),
      ],
      [
        4632233691727265792UL.reinterpret_as_double(),
        4635329916471083008UL.reinterpret_as_double(),
        4632233691727265792UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.y_axis().autoscale_stale(), false)
    assert_eq(axes.y_axis().autoscale_on(), true)
    // Stored limits do not consume a pending request or trigger autoscale.
    {
      let view = axes.y_axis().stored_view_limits()
      relim_visible_source_numbers([view.lower(), view.upper()], [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ])
    }
    assert_eq(first.get_visible(), true)
    assert_eq(first.stale(), true)
    assert_eq([first.invalid_x, first.invalid_y], [false, false])
    // Inspect the retained cache without accidentally recaching a hidden error.
    relim_visible_source_numbers(first.cache.flat.to_array(), [
      4617315517961601024UL.reinterpret_as_double(),
      4632233691727265792UL.reinterpret_as_double(),
      4618441417868443648UL.reinterpret_as_double(),
      4633641066610819072UL.reinterpret_as_double(),
    ])
    assert_eq(second.get_visible(), true)
    assert_eq(second.stale(), true)
    assert_eq([second.invalid_x, second.invalid_y], [false, false])
    // Inspect the retained cache without accidentally recaching a hidden error.
    relim_visible_source_numbers(second.cache.flat.to_array(), [
      4636737291354636288UL.reinterpret_as_double(),
      4634626229029306368UL.reinterpret_as_double(),
      4641240890982006784UL.reinterpret_as_double(),
      4635329916471083008UL.reinterpret_as_double(),
    ])
  }
  first.set_visible(false)
  second.set_visible(false)
  axes.relim_checked(visible_only=true)
  assert_eq(axes.ignore_existing_data_limits(), true)
  relim_visible_source_numbers(
    [
      axes.data_limits(horizontal=true).lower(),
      axes.data_limits(horizontal=true).upper(),
      axes.data_minpos(horizontal=true),
    ],
    [1.0 / 0.0, -1.0 / 0.0, 4617315517961601024UL.reinterpret_as_double()],
  )
  assert_eq(axes.x_axis().autoscale_stale(), false)
  assert_eq(axes.x_axis().autoscale_on(), true)
  // Stored limits do not consume a pending request or trigger autoscale.
  {
    let view = axes.x_axis().stored_view_limits()
    relim_visible_source_numbers([view.lower(), view.upper()], [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
  }
  relim_visible_source_numbers(
    [
      axes.data_limits(horizontal=false).lower(),
      axes.data_limits(horizontal=false).upper(),
      axes.data_minpos(horizontal=false),
    ],
    [1.0 / 0.0, -1.0 / 0.0, 4632233691727265792UL.reinterpret_as_double()],
  )
  assert_eq(axes.y_axis().autoscale_stale(), false)
  assert_eq(axes.y_axis().autoscale_on(), true)
  // Stored limits do not consume a pending request or trigger autoscale.
  {
    let view = axes.y_axis().stored_view_limits()
    relim_visible_source_numbers([view.lower(), view.upper()], [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
  }
  assert_eq(first.get_visible(), false)
  assert_eq(first.stale(), true)
  assert_eq([first.invalid_x, first.invalid_y], [false, false])
  // Inspect the retained cache without accidentally recaching a hidden error.
  relim_visible_source_numbers(first.cache.flat.to_array(), [
    4617315517961601024UL.reinterpret_as_double(),
    4632233691727265792UL.reinterpret_as_double(),
    4618441417868443648UL.reinterpret_as_double(),
    4633641066610819072UL.reinterpret_as_double(),
  ])
  assert_eq(second.get_visible(), false)
  assert_eq(second.stale(), true)
  assert_eq([second.invalid_x, second.invalid_y], [false, false])
  // Inspect the retained cache without accidentally recaching a hidden error.
  relim_visible_source_numbers(second.cache.flat.to_array(), [
    4636737291354636288UL.reinterpret_as_double(),
    4634626229029306368UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
    4635329916471083008UL.reinterpret_as_double(),
  ])
}

///|
test "original relim visible_only sequence" {
  relim_visible_source_sequence() catch {
    error => fail("relim visible original sequence: " + error.to_string())
  }
}
