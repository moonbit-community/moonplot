// Generated from pinned original Line visibility/draw control methods; do not edit.

///|
fn line_visible_source_double(actual : Double, expected : Double) -> Unit raise {
  if expected.is_nan() {
    assert_true(actual.is_nan())
  } else {
    assert_eq(actual.reinterpret_as_uint64(), expected.reinterpret_as_uint64())
  }
}

///|
fn line_visible_source_numbers(
  actual : Array[Double],
  expected : Array[Double],
) -> Unit raise {
  assert_eq(actual.length(), expected.length())
  for index in 0..<actual.length() {
    line_visible_source_double(actual[index], expected[index])
  }
}

///|
// Exercise the real production late-provider entry and its success completion.
// This helper does not select a visibility branch or implement cache refresh.
fn line_visible_source_complete(
  panel : @render.Panel,
  line : Line2D,
) -> Unit raise {
  guard panel.prepare_line(line.points) is Some((_, complete)) else {
    fail("expected the registered Line's late provider")
  }
  complete()
}

///|
fn line_visible_source_sequence() -> Unit raise {
  let fig = figure()
  let axes = fig.axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([0.0, 1.0]),
    LineData::Numeric([10.0, 20.0]),
  )
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  // Match the source host's completed initial draw state without rendering a parent.
  line.mark_drawn()
  // Retain the real exported Panel so the same pinned Line is consulted live.
  let panel = fig.to_render_figure().panels()[0]
  // 0 repeat True on clean visible Line is a complete no-op
  {
    assert_eq(line.get_visible(), true)
    assert_eq(line.stale(), false)
    assert_eq([line.invalid_x, line.invalid_y], [false, false])
    assert_eq(line.owner is None, false)
    // Read old retained cache directly so pending-error recording remains lazy.
    line_visible_source_numbers(line.cache.flat.to_array(), [
      0UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    assert_eq(axes.x_axis().get_category_units().unwrap().labels(), ["a", "b"])
    assert_eq(axes.y_axis().unit_converter_kind(), None)
    assert_eq(axes.y_axis().unit_tag() is None, true)
    line_visible_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.x_axis().autoscale_stale(), false)
    line_visible_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.y_axis().autoscale_stale(), false)
  }
  line.set_visible(true)
  {
    assert_eq(line.get_visible(), true)
    assert_eq(line.stale(), false)
    assert_eq([line.invalid_x, line.invalid_y], [false, false])
    assert_eq(line.owner is None, false)
    // Read old retained cache directly so pending-error recording remains lazy.
    line_visible_source_numbers(line.cache.flat.to_array(), [
      0UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    assert_eq(axes.x_axis().get_category_units().unwrap().labels(), ["a", "b"])
    assert_eq(axes.y_axis().unit_converter_kind(), None)
    assert_eq(axes.y_axis().unit_tag() is None, true)
    line_visible_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.x_axis().autoscale_stale(), false)
    line_visible_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.y_axis().autoscale_stale(), false)
  }
  // 1 hide changes only visibility/stale and calls pchanged
  {
    assert_eq(line.get_visible(), true)
    assert_eq(line.stale(), false)
    assert_eq([line.invalid_x, line.invalid_y], [false, false])
    assert_eq(line.owner is None, false)
    // Read old retained cache directly so pending-error recording remains lazy.
    line_visible_source_numbers(line.cache.flat.to_array(), [
      0UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    assert_eq(axes.x_axis().get_category_units().unwrap().labels(), ["a", "b"])
    assert_eq(axes.y_axis().unit_converter_kind(), None)
    assert_eq(axes.y_axis().unit_tag() is None, true)
    line_visible_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.x_axis().autoscale_stale(), false)
    line_visible_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.y_axis().autoscale_stale(), false)
  }
  line.set_visible(false)
  {
    assert_eq(line.get_visible(), false)
    assert_eq(line.stale(), true)
    assert_eq([line.invalid_x, line.invalid_y], [false, false])
    assert_eq(line.owner is None, false)
    // Read old retained cache directly so pending-error recording remains lazy.
    line_visible_source_numbers(line.cache.flat.to_array(), [
      0UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    assert_eq(axes.x_axis().get_category_units().unwrap().labels(), ["a", "b"])
    assert_eq(axes.y_axis().unit_converter_kind(), None)
    assert_eq(axes.y_axis().unit_tag() is None, true)
    line_visible_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.x_axis().autoscale_stale(), false)
    line_visible_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.y_axis().autoscale_stale(), false)
  }
  // 2 repeat False emits no further pchanged or stale transition
  {
    assert_eq(line.get_visible(), false)
    assert_eq(line.stale(), true)
    assert_eq([line.invalid_x, line.invalid_y], [false, false])
    assert_eq(line.owner is None, false)
    // Read old retained cache directly so pending-error recording remains lazy.
    line_visible_source_numbers(line.cache.flat.to_array(), [
      0UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    assert_eq(axes.x_axis().get_category_units().unwrap().labels(), ["a", "b"])
    assert_eq(axes.y_axis().unit_converter_kind(), None)
    assert_eq(axes.y_axis().unit_tag() is None, true)
    line_visible_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.x_axis().autoscale_stale(), false)
    line_visible_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.y_axis().autoscale_stale(), false)
  }
  line.set_visible(false)
  {
    assert_eq(line.get_visible(), false)
    assert_eq(line.stale(), true)
    assert_eq([line.invalid_x, line.invalid_y], [false, false])
    assert_eq(line.owner is None, false)
    // Read old retained cache directly so pending-error recording remains lazy.
    line_visible_source_numbers(line.cache.flat.to_array(), [
      0UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    assert_eq(axes.x_axis().get_category_units().unwrap().labels(), ["a", "b"])
    assert_eq(axes.y_axis().unit_converter_kind(), None)
    assert_eq(axes.y_axis().unit_tag() is None, true)
    line_visible_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.x_axis().autoscale_stale(), false)
    line_visible_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.y_axis().autoscale_stale(), false)
  }
  // 3 hidden draw skips pending shape recache before any renderer group
  {
    assert_eq(line.get_visible(), false)
    assert_eq(line.stale(), true)
    assert_eq([line.invalid_x, line.invalid_y], [false, false])
    assert_eq(line.owner is None, false)
    // Read old retained cache directly so pending-error recording remains lazy.
    line_visible_source_numbers(line.cache.flat.to_array(), [
      0UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    assert_eq(axes.x_axis().get_category_units().unwrap().labels(), ["a", "b"])
    assert_eq(axes.y_axis().unit_converter_kind(), None)
    assert_eq(axes.y_axis().unit_tag() is None, true)
    line_visible_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.x_axis().autoscale_stale(), false)
    line_visible_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.y_axis().autoscale_stale(), false)
  }
  line.set_ydata(LineData::Numeric([1.0, 2.0, 3.0]))
  line_visible_source_complete(panel, line)
  {
    assert_eq(line.get_visible(), false)
    assert_eq(line.stale(), true)
    assert_eq([line.invalid_x, line.invalid_y], [false, true])
    assert_eq(line.owner is None, false)
    // Read old retained cache directly so pending-error recording remains lazy.
    line_visible_source_numbers(line.cache.flat.to_array(), [
      0UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    assert_eq(axes.x_axis().get_category_units().unwrap().labels(), ["a", "b"])
    assert_eq(axes.y_axis().unit_converter_kind(), None)
    assert_eq(axes.y_axis().unit_tag() is None, true)
    line_visible_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.x_axis().autoscale_stale(), false)
    line_visible_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.y_axis().autoscale_stale(), false)
  }
  // 4 show marks stale without eagerly recaching invalid shape
  {
    assert_eq(line.get_visible(), false)
    assert_eq(line.stale(), true)
    assert_eq([line.invalid_x, line.invalid_y], [false, true])
    assert_eq(line.owner is None, false)
    // Read old retained cache directly so pending-error recording remains lazy.
    line_visible_source_numbers(line.cache.flat.to_array(), [
      0UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    assert_eq(axes.x_axis().get_category_units().unwrap().labels(), ["a", "b"])
    assert_eq(axes.y_axis().unit_converter_kind(), None)
    assert_eq(axes.y_axis().unit_tag() is None, true)
    line_visible_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.x_axis().autoscale_stale(), false)
    line_visible_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.y_axis().autoscale_stale(), false)
  }
  line.set_visible(true)
  {
    assert_eq(line.get_visible(), true)
    assert_eq(line.stale(), true)
    assert_eq([line.invalid_x, line.invalid_y], [false, true])
    assert_eq(line.owner is None, false)
    // Read old retained cache directly so pending-error recording remains lazy.
    line_visible_source_numbers(line.cache.flat.to_array(), [
      0UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    assert_eq(axes.x_axis().get_category_units().unwrap().labels(), ["a", "b"])
    assert_eq(axes.y_axis().unit_converter_kind(), None)
    assert_eq(axes.y_axis().unit_tag() is None, true)
    line_visible_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.x_axis().autoscale_stale(), false)
    line_visible_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.y_axis().autoscale_stale(), false)
  }
  // 5 first visible draw reaches deferred shape error before renderer group
  {
    assert_eq(line.get_visible(), true)
    assert_eq(line.stale(), true)
    assert_eq([line.invalid_x, line.invalid_y], [false, true])
    assert_eq(line.owner is None, false)
    // Read old retained cache directly so pending-error recording remains lazy.
    line_visible_source_numbers(line.cache.flat.to_array(), [
      0UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    assert_eq(axes.x_axis().get_category_units().unwrap().labels(), ["a", "b"])
    assert_eq(axes.y_axis().unit_converter_kind(), None)
    assert_eq(axes.y_axis().unit_tag() is None, true)
    line_visible_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.x_axis().autoscale_stale(), false)
    line_visible_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.y_axis().autoscale_stale(), false)
  }
  assert_true(
    try {
      line_visible_source_complete(panel, line)
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "shape mismatch: objects cannot be broadcast to a single shape.  Mismatch is between arg 0 with shape (2,) and arg 1 with shape (3,)."
      _ => false
    },
  )
  {
    assert_eq(line.get_visible(), true)
    assert_eq(line.stale(), true)
    assert_eq([line.invalid_x, line.invalid_y], [false, true])
    assert_eq(line.owner is None, false)
    // Read old retained cache directly so pending-error recording remains lazy.
    line_visible_source_numbers(line.cache.flat.to_array(), [
      0UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    assert_eq(axes.x_axis().get_category_units().unwrap().labels(), ["a", "b"])
    assert_eq(axes.y_axis().unit_converter_kind(), None)
    assert_eq(axes.y_axis().unit_tag() is None, true)
    line_visible_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.x_axis().autoscale_stale(), false)
    line_visible_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.y_axis().autoscale_stale(), false)
  }
  // 6 repair then visible draw recaches and clears stale only on completion
  {
    assert_eq(line.get_visible(), true)
    assert_eq(line.stale(), true)
    assert_eq([line.invalid_x, line.invalid_y], [false, true])
    assert_eq(line.owner is None, false)
    // Read old retained cache directly so pending-error recording remains lazy.
    line_visible_source_numbers(line.cache.flat.to_array(), [
      0UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    assert_eq(axes.x_axis().get_category_units().unwrap().labels(), ["a", "b"])
    assert_eq(axes.y_axis().unit_converter_kind(), None)
    assert_eq(axes.y_axis().unit_tag() is None, true)
    line_visible_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.x_axis().autoscale_stale(), false)
    line_visible_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.y_axis().autoscale_stale(), false)
  }
  line.set_ydata(LineData::Numeric([10.0, 20.0]))
  line_visible_source_complete(panel, line)
  {
    assert_eq(line.get_visible(), true)
    assert_eq(line.stale(), false)
    assert_eq([line.invalid_x, line.invalid_y], [false, false])
    assert_eq(line.owner is None, false)
    // Read old retained cache directly so pending-error recording remains lazy.
    line_visible_source_numbers(line.cache.flat.to_array(), [
      0UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    assert_eq(axes.x_axis().get_category_units().unwrap().labels(), ["a", "b"])
    assert_eq(axes.y_axis().unit_converter_kind(), None)
    assert_eq(axes.y_axis().unit_tag() is None, true)
    line_visible_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.x_axis().autoscale_stale(), false)
    line_visible_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.y_axis().autoscale_stale(), false)
  }
  // 7 hidden pending category y never discovers converter or raises
  {
    assert_eq(line.get_visible(), true)
    assert_eq(line.stale(), false)
    assert_eq([line.invalid_x, line.invalid_y], [false, false])
    assert_eq(line.owner is None, false)
    // Read old retained cache directly so pending-error recording remains lazy.
    line_visible_source_numbers(line.cache.flat.to_array(), [
      0UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    assert_eq(axes.x_axis().get_category_units().unwrap().labels(), ["a", "b"])
    assert_eq(axes.y_axis().unit_converter_kind(), None)
    assert_eq(axes.y_axis().unit_tag() is None, true)
    line_visible_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.x_axis().autoscale_stale(), false)
    line_visible_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.y_axis().autoscale_stale(), false)
  }
  line.set_visible(false)
  line.set_ydata(LineData::Category(["bad", "data"]))
  line_visible_source_complete(panel, line)
  {
    assert_eq(line.get_visible(), false)
    assert_eq(line.stale(), true)
    assert_eq([line.invalid_x, line.invalid_y], [false, true])
    assert_eq(line.owner is None, false)
    // Read old retained cache directly so pending-error recording remains lazy.
    line_visible_source_numbers(line.cache.flat.to_array(), [
      0UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    assert_eq(axes.x_axis().get_category_units().unwrap().labels(), ["a", "b"])
    assert_eq(axes.y_axis().unit_converter_kind(), None)
    assert_eq(axes.y_axis().unit_tag() is None, true)
    line_visible_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.x_axis().autoscale_stale(), false)
    line_visible_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.y_axis().autoscale_stale(), false)
  }
  // 8 show then draw discovers category converter and raises with no yunits
  {
    assert_eq(line.get_visible(), false)
    assert_eq(line.stale(), true)
    assert_eq([line.invalid_x, line.invalid_y], [false, true])
    assert_eq(line.owner is None, false)
    // Read old retained cache directly so pending-error recording remains lazy.
    line_visible_source_numbers(line.cache.flat.to_array(), [
      0UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    assert_eq(axes.x_axis().get_category_units().unwrap().labels(), ["a", "b"])
    assert_eq(axes.y_axis().unit_converter_kind(), None)
    assert_eq(axes.y_axis().unit_tag() is None, true)
    line_visible_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.x_axis().autoscale_stale(), false)
    line_visible_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.y_axis().autoscale_stale(), false)
  }
  assert_true(
    try {
      line.set_visible(true)
      line_visible_source_complete(panel, line)
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  {
    assert_eq(line.get_visible(), true)
    assert_eq(line.stale(), true)
    assert_eq([line.invalid_x, line.invalid_y], [false, true])
    assert_eq(line.owner is None, false)
    // Read old retained cache directly so pending-error recording remains lazy.
    line_visible_source_numbers(line.cache.flat.to_array(), [
      0UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    assert_eq(axes.x_axis().get_category_units().unwrap().labels(), ["a", "b"])
    assert_eq(axes.y_axis().unit_converter_kind(), Some("category"))
    assert_eq(axes.y_axis().unit_tag() is None, true)
    line_visible_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.x_axis().autoscale_stale(), false)
    line_visible_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.y_axis().autoscale_stale(), false)
  }
  // 9 numeric repair bypasses discovered category converter and completes
  {
    assert_eq(line.get_visible(), true)
    assert_eq(line.stale(), true)
    assert_eq([line.invalid_x, line.invalid_y], [false, true])
    assert_eq(line.owner is None, false)
    // Read old retained cache directly so pending-error recording remains lazy.
    line_visible_source_numbers(line.cache.flat.to_array(), [
      0UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ])
    assert_eq(axes.x_axis().get_category_units().unwrap().labels(), ["a", "b"])
    assert_eq(axes.y_axis().unit_converter_kind(), Some("category"))
    assert_eq(axes.y_axis().unit_tag() is None, true)
    line_visible_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.x_axis().autoscale_stale(), false)
    line_visible_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.y_axis().autoscale_stale(), false)
  }
  line.set_ydata(LineData::Numeric([30.0, 40.0]))
  line_visible_source_complete(panel, line)
  {
    assert_eq(line.get_visible(), true)
    assert_eq(line.stale(), false)
    assert_eq([line.invalid_x, line.invalid_y], [false, false])
    assert_eq(line.owner is None, false)
    // Read old retained cache directly so pending-error recording remains lazy.
    line_visible_source_numbers(line.cache.flat.to_array(), [
      0UL.reinterpret_as_double(),
      4629137466983448576UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4630826316843712512UL.reinterpret_as_double(),
    ])
    assert_eq(axes.x_axis().get_category_units().unwrap().labels(), ["a", "b"])
    assert_eq(axes.y_axis().unit_converter_kind(), Some("category"))
    assert_eq(axes.y_axis().unit_tag() is None, true)
    line_visible_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.x_axis().autoscale_stale(), false)
    line_visible_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.y_axis().autoscale_stale(), false)
  }
  // 10 hidden pending category x does not append a new label
  {
    assert_eq(line.get_visible(), true)
    assert_eq(line.stale(), false)
    assert_eq([line.invalid_x, line.invalid_y], [false, false])
    assert_eq(line.owner is None, false)
    // Read old retained cache directly so pending-error recording remains lazy.
    line_visible_source_numbers(line.cache.flat.to_array(), [
      0UL.reinterpret_as_double(),
      4629137466983448576UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4630826316843712512UL.reinterpret_as_double(),
    ])
    assert_eq(axes.x_axis().get_category_units().unwrap().labels(), ["a", "b"])
    assert_eq(axes.y_axis().unit_converter_kind(), Some("category"))
    assert_eq(axes.y_axis().unit_tag() is None, true)
    line_visible_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.x_axis().autoscale_stale(), false)
    line_visible_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.y_axis().autoscale_stale(), false)
  }
  line.set_visible(false)
  line.set_xdata(LineData::Category(["new", "a"]))
  line_visible_source_complete(panel, line)
  {
    assert_eq(line.get_visible(), false)
    assert_eq(line.stale(), true)
    assert_eq([line.invalid_x, line.invalid_y], [true, false])
    assert_eq(line.owner is None, false)
    // Read old retained cache directly so pending-error recording remains lazy.
    line_visible_source_numbers(line.cache.flat.to_array(), [
      0UL.reinterpret_as_double(),
      4629137466983448576UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4630826316843712512UL.reinterpret_as_double(),
    ])
    assert_eq(axes.x_axis().get_category_units().unwrap().labels(), ["a", "b"])
    assert_eq(axes.y_axis().unit_converter_kind(), Some("category"))
    assert_eq(axes.y_axis().unit_tag() is None, true)
    line_visible_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.x_axis().autoscale_stale(), false)
    line_visible_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.y_axis().autoscale_stale(), false)
  }
  // 11 show then draw converts category x and appends label now
  {
    assert_eq(line.get_visible(), false)
    assert_eq(line.stale(), true)
    assert_eq([line.invalid_x, line.invalid_y], [true, false])
    assert_eq(line.owner is None, false)
    // Read old retained cache directly so pending-error recording remains lazy.
    line_visible_source_numbers(line.cache.flat.to_array(), [
      0UL.reinterpret_as_double(),
      4629137466983448576UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4630826316843712512UL.reinterpret_as_double(),
    ])
    assert_eq(axes.x_axis().get_category_units().unwrap().labels(), ["a", "b"])
    assert_eq(axes.y_axis().unit_converter_kind(), Some("category"))
    assert_eq(axes.y_axis().unit_tag() is None, true)
    line_visible_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.x_axis().autoscale_stale(), false)
    line_visible_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.y_axis().autoscale_stale(), false)
  }
  line.set_visible(true)
  line_visible_source_complete(panel, line)
  {
    assert_eq(line.get_visible(), true)
    assert_eq(line.stale(), false)
    assert_eq([line.invalid_x, line.invalid_y], [false, false])
    assert_eq(line.owner is None, false)
    // Read old retained cache directly so pending-error recording remains lazy.
    line_visible_source_numbers(line.cache.flat.to_array(), [
      4611686018427387904UL.reinterpret_as_double(),
      4629137466983448576UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      4630826316843712512UL.reinterpret_as_double(),
    ])
    assert_eq(axes.x_axis().get_category_units().unwrap().labels(), [
      "a", "b", "new",
    ])
    assert_eq(axes.y_axis().unit_converter_kind(), Some("category"))
    assert_eq(axes.y_axis().unit_tag() is None, true)
    line_visible_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.x_axis().autoscale_stale(), false)
    line_visible_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.y_axis().autoscale_stale(), false)
  }
  // 12 explicit ownerNone hidden pending shape also skips recache
  {
    assert_eq(line.get_visible(), true)
    assert_eq(line.stale(), false)
    assert_eq([line.invalid_x, line.invalid_y], [false, false])
    assert_eq(line.owner is None, false)
    // Read old retained cache directly so pending-error recording remains lazy.
    line_visible_source_numbers(line.cache.flat.to_array(), [
      4611686018427387904UL.reinterpret_as_double(),
      4629137466983448576UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      4630826316843712512UL.reinterpret_as_double(),
    ])
    assert_eq(axes.x_axis().get_category_units().unwrap().labels(), [
      "a", "b", "new",
    ])
    assert_eq(axes.y_axis().unit_converter_kind(), Some("category"))
    assert_eq(axes.y_axis().unit_tag() is None, true)
    line_visible_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.x_axis().autoscale_stale(), false)
    line_visible_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.y_axis().autoscale_stale(), false)
  }
  line.detach()
  line.set_visible(false)
  line.set_xdata(LineData::Numeric([1.0, 2.0, 3.0]))
  line_visible_source_complete(panel, line)
  {
    assert_eq(line.get_visible(), false)
    assert_eq(line.stale(), true)
    assert_eq([line.invalid_x, line.invalid_y], [true, false])
    assert_eq(line.owner is None, true)
    // Read old retained cache directly so pending-error recording remains lazy.
    line_visible_source_numbers(line.cache.flat.to_array(), [
      4611686018427387904UL.reinterpret_as_double(),
      4629137466983448576UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      4630826316843712512UL.reinterpret_as_double(),
    ])
    assert_eq(axes.x_axis().get_category_units().unwrap().labels(), [
      "a", "b", "new",
    ])
    assert_eq(axes.y_axis().unit_converter_kind(), Some("category"))
    assert_eq(axes.y_axis().unit_tag() is None, true)
    line_visible_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.x_axis().autoscale_stale(), false)
    line_visible_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.y_axis().autoscale_stale(), false)
  }
  // 13 ownerNone show reaches same deferred broadcast error
  {
    assert_eq(line.get_visible(), false)
    assert_eq(line.stale(), true)
    assert_eq([line.invalid_x, line.invalid_y], [true, false])
    assert_eq(line.owner is None, true)
    // Read old retained cache directly so pending-error recording remains lazy.
    line_visible_source_numbers(line.cache.flat.to_array(), [
      4611686018427387904UL.reinterpret_as_double(),
      4629137466983448576UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      4630826316843712512UL.reinterpret_as_double(),
    ])
    assert_eq(axes.x_axis().get_category_units().unwrap().labels(), [
      "a", "b", "new",
    ])
    assert_eq(axes.y_axis().unit_converter_kind(), Some("category"))
    assert_eq(axes.y_axis().unit_tag() is None, true)
    line_visible_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.x_axis().autoscale_stale(), false)
    line_visible_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.y_axis().autoscale_stale(), false)
  }
  assert_true(
    try {
      line.set_visible(true)
      line_visible_source_complete(panel, line)
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "shape mismatch: objects cannot be broadcast to a single shape.  Mismatch is between arg 0 with shape (3,) and arg 1 with shape (2,)."
      _ => false
    },
  )
  {
    assert_eq(line.get_visible(), true)
    assert_eq(line.stale(), true)
    assert_eq([line.invalid_x, line.invalid_y], [true, false])
    assert_eq(line.owner is None, true)
    // Read old retained cache directly so pending-error recording remains lazy.
    line_visible_source_numbers(line.cache.flat.to_array(), [
      4611686018427387904UL.reinterpret_as_double(),
      4629137466983448576UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      4630826316843712512UL.reinterpret_as_double(),
    ])
    assert_eq(axes.x_axis().get_category_units().unwrap().labels(), [
      "a", "b", "new",
    ])
    assert_eq(axes.y_axis().unit_converter_kind(), Some("category"))
    assert_eq(axes.y_axis().unit_tag() is None, true)
    line_visible_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.x_axis().autoscale_stale(), false)
    line_visible_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.y_axis().autoscale_stale(), false)
  }
  // 14 ownerNone numeric repair draws successfully and clears stale
  {
    assert_eq(line.get_visible(), true)
    assert_eq(line.stale(), true)
    assert_eq([line.invalid_x, line.invalid_y], [true, false])
    assert_eq(line.owner is None, true)
    // Read old retained cache directly so pending-error recording remains lazy.
    line_visible_source_numbers(line.cache.flat.to_array(), [
      4611686018427387904UL.reinterpret_as_double(),
      4629137466983448576UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      4630826316843712512UL.reinterpret_as_double(),
    ])
    assert_eq(axes.x_axis().get_category_units().unwrap().labels(), [
      "a", "b", "new",
    ])
    assert_eq(axes.y_axis().unit_converter_kind(), Some("category"))
    assert_eq(axes.y_axis().unit_tag() is None, true)
    line_visible_source_numbers(
      [
        axes.data_limits(horizontal=true).lower(),
        axes.data_limits(horizontal=true).upper(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.x_axis().autoscale_stale(), false)
    line_visible_source_numbers(
      [
        axes.data_limits(horizontal=false).lower(),
        axes.data_limits(horizontal=false).upper(),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
    )
    assert_eq(axes.y_axis().autoscale_stale(), false)
  }
  line.set_xdata(LineData::Numeric([5.0, 6.0]))
  line_visible_source_complete(panel, line)
  assert_eq(line.get_visible(), true)
  assert_eq(line.stale(), false)
  assert_eq([line.invalid_x, line.invalid_y], [false, false])
  assert_eq(line.owner is None, true)
  // Read old retained cache directly so pending-error recording remains lazy.
  line_visible_source_numbers(line.cache.flat.to_array(), [
    4617315517961601024UL.reinterpret_as_double(),
    4629137466983448576UL.reinterpret_as_double(),
    4618441417868443648UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  ])
  assert_eq(axes.x_axis().get_category_units().unwrap().labels(), [
    "a", "b", "new",
  ])
  assert_eq(axes.y_axis().unit_converter_kind(), Some("category"))
  assert_eq(axes.y_axis().unit_tag() is None, true)
  line_visible_source_numbers(
    [
      axes.data_limits(horizontal=true).lower(),
      axes.data_limits(horizontal=true).upper(),
    ],
    [0UL.reinterpret_as_double(), 4607182418800017408UL.reinterpret_as_double()],
  )
  assert_eq(axes.x_axis().autoscale_stale(), false)
  line_visible_source_numbers(
    [
      axes.data_limits(horizontal=false).lower(),
      axes.data_limits(horizontal=false).upper(),
    ],
    [
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ],
  )
  assert_eq(axes.y_axis().autoscale_stale(), false)
}

///|
test "original Line visibility and leaf draw sequence" {
  line_visible_source_sequence() catch {
    error => fail("Line visible original sequence: " + error.to_string())
  }
}
