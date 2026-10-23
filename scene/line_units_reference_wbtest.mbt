// Generated from pinned original Line/units methods; do not edit.

///|
fn line_units_ref_double(actual : Double, expected : Double) -> Unit raise {
  if expected.is_nan() {
    assert_true(actual.is_nan())
  } else {
    assert_eq(actual.reinterpret_as_uint64(), expected.reinterpret_as_uint64())
  }
}

///|
fn line_units_ref_points(
  actual : Array[@core.Point],
  expected : Array[Array[Double]],
) -> Unit raise {
  assert_eq(actual.length(), expected.length())
  for index in 0..<actual.length() {
    line_units_ref_double(actual[index].x(), expected[index][0])
    line_units_ref_double(actual[index].y(), expected[index][1])
  }
}

///|
fn line_units_ref_numbers(
  actual : Array[Double],
  expected : Array[Double],
) -> Unit raise {
  assert_eq(actual.length(), expected.length())
  for index in 0..<actual.length() {
    line_units_ref_double(actual[index], expected[index])
  }
}

///|
fn line_units_source_case_0() -> Unit raise {
  let old_mode = @config.date_converter()
  let old_multiple = @config.date_interval_multiples()
  defer {
    @config.set_date_converter(old_mode)
    @config.set_date_interval_multiples(old_multiple)
  }
  @config.set_date_converter("auto")
  @config.set_date_interval_multiples(true)
  let figure = figure()
  let panels = [figure.axes()]
  ignore(panels[0].state.val.x_axis.update_category_units(["a", "b"]))
  panels[0].attach_line_with_originals(
    [
      @core.point(
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
      ),
      @core.point(
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ),
    ],
    LineOriginalCoordinate::Category(["a", "b"]),
    LineOriginalCoordinate::Numeric([
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ]),
  )
  panels[0].attach_line_with_originals(
    [
      @core.point(
        13835058055282163712UL.reinterpret_as_double(),
        4629137466983448576UL.reinterpret_as_double(),
      ),
      @core.point(
        4617315517961601024UL.reinterpret_as_double(),
        4630826316843712512UL.reinterpret_as_double(),
      ),
    ],
    LineOriginalCoordinate::Numeric([
      13835058055282163712UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ]),
    LineOriginalCoordinate::Numeric([
      4629137466983448576UL.reinterpret_as_double(),
      4630826316843712512UL.reinterpret_as_double(),
    ]),
  )
  panels[0].state.val.raw_x_data = @core.limits(
    13835058055282163712UL.reinterpret_as_double(),
    4617315517961601024UL.reinterpret_as_double(),
  )
  panels[0].state.val.raw_y_data = @core.limits(
    4621819117588971520UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_data_minpos = 4607182418800017408UL.reinterpret_as_double()
  panels[0].state.val.y_data_minpos = 4621819117588971520UL.reinterpret_as_double()
  panels[0].state.val.ignore_existing_data_limits = false
  panels[0].state.val.x_axis.clear_autoscale_request()
  panels[0].state.val.y_axis.clear_autoscale_request()
  assert_eq(panels[0].state.val.x_axis.unit_converter_kind(), Some("category"))
  assert_eq(panels[0].state.val.x_axis.get_category_units().unwrap().labels(), [
    "a", "b",
  ])
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), false)
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).lower(),
    13835058055282163712UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).upper(),
    4617315517961601024UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=true),
    4607182418800017408UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.unit_converter_kind(), None)
  assert_true(panels[0].state.val.y_axis.unit_tag() is None)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).lower(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).upper(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=false),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].ignore_existing_data_limits(), false)
  assert_eq(panels[0].state.val.line_originals.length(), 2)
  line_units_ref_points(panels[0].state.val.line_originals[0].points, [
    [0UL.reinterpret_as_double(), 4621819117588971520UL.reinterpret_as_double()],
    [
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ],
  ])
  match panels[0].state.val.artists[0] {
    Artist::Line(points, _) =>
      assert_true(
        physical_equal(points, panels[0].state.val.line_originals[0].points),
      )
    _ => fail("expected exact Line buffer")
  }
  match panels[0].state.val.line_originals[0].x {
    LineOriginalCoordinate::Category(values) => assert_eq(values, ["a", "b"])
    _ => fail("expected Category original coordinate")
  }
  match panels[0].state.val.line_originals[0].y {
    LineOriginalCoordinate::Numeric(values) =>
      line_units_ref_numbers(values, [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ])
    _ => fail("expected Numeric original coordinate")
  }
  line_units_ref_points(panels[0].state.val.line_originals[1].points, [
    [
      13835058055282163712UL.reinterpret_as_double(),
      4629137466983448576UL.reinterpret_as_double(),
    ],
    [
      4617315517961601024UL.reinterpret_as_double(),
      4630826316843712512UL.reinterpret_as_double(),
    ],
  ])
  match panels[0].state.val.artists[1] {
    Artist::Line(points, _) =>
      assert_true(
        physical_equal(points, panels[0].state.val.line_originals[1].points),
      )
    _ => fail("expected exact Line buffer")
  }
  match panels[0].state.val.line_originals[1].x {
    LineOriginalCoordinate::Numeric(values) =>
      line_units_ref_numbers(values, [
        13835058055282163712UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ])
    _ => fail("expected Numeric original coordinate")
  }
  match panels[0].state.val.line_originals[1].y {
    LineOriginalCoordinate::Numeric(values) =>
      line_units_ref_numbers(values, [
        4629137466983448576UL.reinterpret_as_double(),
        4630826316843712512UL.reinterpret_as_double(),
      ])
    _ => fail("expected Numeric original coordinate")
  }
  let replacement = @axis.CategoryUnits::new(["b", "a"])
  panels[0].set_x_units(Some(@axis.AxisUnitTag::Category(replacement)))
  assert_eq(panels[0].state.val.x_axis.unit_converter_kind(), Some("category"))
  assert_eq(panels[0].state.val.x_axis.get_category_units().unwrap().labels(), [
    "b", "a",
  ])
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), true)
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).lower(),
    13835058055282163712UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).upper(),
    4617315517961601024UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=true),
    4607182418800017408UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.unit_converter_kind(), None)
  assert_true(panels[0].state.val.y_axis.unit_tag() is None)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).lower(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).upper(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=false),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].ignore_existing_data_limits(), false)
  assert_eq(panels[0].state.val.line_originals.length(), 2)
  line_units_ref_points(panels[0].state.val.line_originals[0].points, [
    [
      4607182418800017408UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
    ],
    [0UL.reinterpret_as_double(), 4626322717216342016UL.reinterpret_as_double()],
  ])
  match panels[0].state.val.artists[0] {
    Artist::Line(points, _) =>
      assert_true(
        physical_equal(points, panels[0].state.val.line_originals[0].points),
      )
    _ => fail("expected exact Line buffer")
  }
  match panels[0].state.val.line_originals[0].x {
    LineOriginalCoordinate::Category(values) => assert_eq(values, ["a", "b"])
    _ => fail("expected Category original coordinate")
  }
  match panels[0].state.val.line_originals[0].y {
    LineOriginalCoordinate::Numeric(values) =>
      line_units_ref_numbers(values, [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ])
    _ => fail("expected Numeric original coordinate")
  }
  line_units_ref_points(panels[0].state.val.line_originals[1].points, [
    [
      13835058055282163712UL.reinterpret_as_double(),
      4629137466983448576UL.reinterpret_as_double(),
    ],
    [
      4617315517961601024UL.reinterpret_as_double(),
      4630826316843712512UL.reinterpret_as_double(),
    ],
  ])
  match panels[0].state.val.artists[1] {
    Artist::Line(points, _) =>
      assert_true(
        physical_equal(points, panels[0].state.val.line_originals[1].points),
      )
    _ => fail("expected exact Line buffer")
  }
  match panels[0].state.val.line_originals[1].x {
    LineOriginalCoordinate::Numeric(values) =>
      line_units_ref_numbers(values, [
        13835058055282163712UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ])
    _ => fail("expected Numeric original coordinate")
  }
  match panels[0].state.val.line_originals[1].y {
    LineOriginalCoordinate::Numeric(values) =>
      line_units_ref_numbers(values, [
        4629137466983448576UL.reinterpret_as_double(),
        4630826316843712512UL.reinterpret_as_double(),
      ])
    _ => fail("expected Numeric original coordinate")
  }
}

///|
fn line_units_source_case_1() -> Unit raise {
  let old_mode = @config.date_converter()
  let old_multiple = @config.date_interval_multiples()
  defer {
    @config.set_date_converter(old_mode)
    @config.set_date_interval_multiples(old_multiple)
  }
  @config.set_date_converter("auto")
  @config.set_date_interval_multiples(true)
  let figure = figure()
  let panels = [figure.axes()]
  ignore(panels[0].state.val.x_axis.update_category_units(["b", "a"]))
  panels[0].attach_line_with_originals(
    [
      @core.point(
        4607182418800017408UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
      ),
      @core.point(
        0UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ),
    ],
    LineOriginalCoordinate::Category(["a", "b"]),
    LineOriginalCoordinate::Numeric([
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ]),
  )
  panels[0].attach_line_with_originals(
    [
      @core.point(
        13835058055282163712UL.reinterpret_as_double(),
        4629137466983448576UL.reinterpret_as_double(),
      ),
      @core.point(
        4617315517961601024UL.reinterpret_as_double(),
        4630826316843712512UL.reinterpret_as_double(),
      ),
    ],
    LineOriginalCoordinate::Numeric([
      13835058055282163712UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ]),
    LineOriginalCoordinate::Numeric([
      4629137466983448576UL.reinterpret_as_double(),
      4630826316843712512UL.reinterpret_as_double(),
    ]),
  )
  panels[0].state.val.raw_x_data = @core.limits(
    13835058055282163712UL.reinterpret_as_double(),
    4617315517961601024UL.reinterpret_as_double(),
  )
  panels[0].state.val.raw_y_data = @core.limits(
    4621819117588971520UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_data_minpos = 4607182418800017408UL.reinterpret_as_double()
  panels[0].state.val.y_data_minpos = 4621819117588971520UL.reinterpret_as_double()
  panels[0].state.val.ignore_existing_data_limits = false
  panels[0].state.val.x_axis.clear_autoscale_request()
  panels[0].state.val.x_axis.request_autoscale()
  panels[0].state.val.y_axis.clear_autoscale_request()
  assert_eq(panels[0].state.val.x_axis.unit_converter_kind(), Some("category"))
  assert_eq(panels[0].state.val.x_axis.get_category_units().unwrap().labels(), [
    "b", "a",
  ])
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), true)
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).lower(),
    13835058055282163712UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).upper(),
    4617315517961601024UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=true),
    4607182418800017408UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.unit_converter_kind(), None)
  assert_true(panels[0].state.val.y_axis.unit_tag() is None)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).lower(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).upper(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=false),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].ignore_existing_data_limits(), false)
  assert_eq(panels[0].state.val.line_originals.length(), 2)
  line_units_ref_points(panels[0].state.val.line_originals[0].points, [
    [
      4607182418800017408UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
    ],
    [0UL.reinterpret_as_double(), 4626322717216342016UL.reinterpret_as_double()],
  ])
  match panels[0].state.val.artists[0] {
    Artist::Line(points, _) =>
      assert_true(
        physical_equal(points, panels[0].state.val.line_originals[0].points),
      )
    _ => fail("expected exact Line buffer")
  }
  match panels[0].state.val.line_originals[0].x {
    LineOriginalCoordinate::Category(values) => assert_eq(values, ["a", "b"])
    _ => fail("expected Category original coordinate")
  }
  match panels[0].state.val.line_originals[0].y {
    LineOriginalCoordinate::Numeric(values) =>
      line_units_ref_numbers(values, [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ])
    _ => fail("expected Numeric original coordinate")
  }
  line_units_ref_points(panels[0].state.val.line_originals[1].points, [
    [
      13835058055282163712UL.reinterpret_as_double(),
      4629137466983448576UL.reinterpret_as_double(),
    ],
    [
      4617315517961601024UL.reinterpret_as_double(),
      4630826316843712512UL.reinterpret_as_double(),
    ],
  ])
  match panels[0].state.val.artists[1] {
    Artist::Line(points, _) =>
      assert_true(
        physical_equal(points, panels[0].state.val.line_originals[1].points),
      )
    _ => fail("expected exact Line buffer")
  }
  match panels[0].state.val.line_originals[1].x {
    LineOriginalCoordinate::Numeric(values) =>
      line_units_ref_numbers(values, [
        13835058055282163712UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ])
    _ => fail("expected Numeric original coordinate")
  }
  match panels[0].state.val.line_originals[1].y {
    LineOriginalCoordinate::Numeric(values) =>
      line_units_ref_numbers(values, [
        4629137466983448576UL.reinterpret_as_double(),
        4630826316843712512UL.reinterpret_as_double(),
      ])
    _ => fail("expected Numeric original coordinate")
  }
  let replacement = @axis.CategoryUnits::new(["a", "b", "c"])
  panels[0].set_x_units(Some(@axis.AxisUnitTag::Category(replacement)))
  assert_eq(panels[0].state.val.x_axis.unit_converter_kind(), Some("category"))
  assert_eq(panels[0].state.val.x_axis.get_category_units().unwrap().labels(), [
    "a", "b", "c",
  ])
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), true)
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).lower(),
    13835058055282163712UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).upper(),
    4617315517961601024UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=true),
    4607182418800017408UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.unit_converter_kind(), None)
  assert_true(panels[0].state.val.y_axis.unit_tag() is None)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).lower(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).upper(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=false),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].ignore_existing_data_limits(), false)
  assert_eq(panels[0].state.val.line_originals.length(), 2)
  line_units_ref_points(panels[0].state.val.line_originals[0].points, [
    [0UL.reinterpret_as_double(), 4621819117588971520UL.reinterpret_as_double()],
    [
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ],
  ])
  match panels[0].state.val.artists[0] {
    Artist::Line(points, _) =>
      assert_true(
        physical_equal(points, panels[0].state.val.line_originals[0].points),
      )
    _ => fail("expected exact Line buffer")
  }
  match panels[0].state.val.line_originals[0].x {
    LineOriginalCoordinate::Category(values) => assert_eq(values, ["a", "b"])
    _ => fail("expected Category original coordinate")
  }
  match panels[0].state.val.line_originals[0].y {
    LineOriginalCoordinate::Numeric(values) =>
      line_units_ref_numbers(values, [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ])
    _ => fail("expected Numeric original coordinate")
  }
  line_units_ref_points(panels[0].state.val.line_originals[1].points, [
    [
      13835058055282163712UL.reinterpret_as_double(),
      4629137466983448576UL.reinterpret_as_double(),
    ],
    [
      4617315517961601024UL.reinterpret_as_double(),
      4630826316843712512UL.reinterpret_as_double(),
    ],
  ])
  match panels[0].state.val.artists[1] {
    Artist::Line(points, _) =>
      assert_true(
        physical_equal(points, panels[0].state.val.line_originals[1].points),
      )
    _ => fail("expected exact Line buffer")
  }
  match panels[0].state.val.line_originals[1].x {
    LineOriginalCoordinate::Numeric(values) =>
      line_units_ref_numbers(values, [
        13835058055282163712UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ])
    _ => fail("expected Numeric original coordinate")
  }
  match panels[0].state.val.line_originals[1].y {
    LineOriginalCoordinate::Numeric(values) =>
      line_units_ref_numbers(values, [
        4629137466983448576UL.reinterpret_as_double(),
        4630826316843712512UL.reinterpret_as_double(),
      ])
    _ => fail("expected Numeric original coordinate")
  }
}

///|
fn line_units_source_case_2() -> Unit raise {
  let old_mode = @config.date_converter()
  let old_multiple = @config.date_interval_multiples()
  defer {
    @config.set_date_converter(old_mode)
    @config.set_date_interval_multiples(old_multiple)
  }
  @config.set_date_converter("auto")
  @config.set_date_interval_multiples(true)
  let figure = figure()
  let panels = [figure.axes()]
  ignore(panels[0].state.val.x_axis.update_category_units(["a", "b", "c"]))
  panels[0].attach_line_with_originals(
    [
      @core.point(
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
      ),
      @core.point(
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ),
    ],
    LineOriginalCoordinate::Category(["a", "b"]),
    LineOriginalCoordinate::Numeric([
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ]),
  )
  panels[0].attach_line_with_originals(
    [
      @core.point(
        13835058055282163712UL.reinterpret_as_double(),
        4629137466983448576UL.reinterpret_as_double(),
      ),
      @core.point(
        4617315517961601024UL.reinterpret_as_double(),
        4630826316843712512UL.reinterpret_as_double(),
      ),
    ],
    LineOriginalCoordinate::Numeric([
      13835058055282163712UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ]),
    LineOriginalCoordinate::Numeric([
      4629137466983448576UL.reinterpret_as_double(),
      4630826316843712512UL.reinterpret_as_double(),
    ]),
  )
  panels[0].state.val.raw_x_data = @core.limits(
    13835058055282163712UL.reinterpret_as_double(),
    4617315517961601024UL.reinterpret_as_double(),
  )
  panels[0].state.val.raw_y_data = @core.limits(
    4621819117588971520UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_data_minpos = 4607182418800017408UL.reinterpret_as_double()
  panels[0].state.val.y_data_minpos = 4621819117588971520UL.reinterpret_as_double()
  panels[0].state.val.ignore_existing_data_limits = false
  panels[0].state.val.x_axis.clear_autoscale_request()
  panels[0].state.val.x_axis.request_autoscale()
  panels[0].state.val.y_axis.clear_autoscale_request()
  assert_eq(panels[0].state.val.x_axis.unit_converter_kind(), Some("category"))
  assert_eq(panels[0].state.val.x_axis.get_category_units().unwrap().labels(), [
    "a", "b", "c",
  ])
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), true)
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).lower(),
    13835058055282163712UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).upper(),
    4617315517961601024UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=true),
    4607182418800017408UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.unit_converter_kind(), None)
  assert_true(panels[0].state.val.y_axis.unit_tag() is None)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).lower(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).upper(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=false),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].ignore_existing_data_limits(), false)
  assert_eq(panels[0].state.val.line_originals.length(), 2)
  line_units_ref_points(panels[0].state.val.line_originals[0].points, [
    [0UL.reinterpret_as_double(), 4621819117588971520UL.reinterpret_as_double()],
    [
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ],
  ])
  match panels[0].state.val.artists[0] {
    Artist::Line(points, _) =>
      assert_true(
        physical_equal(points, panels[0].state.val.line_originals[0].points),
      )
    _ => fail("expected exact Line buffer")
  }
  match panels[0].state.val.line_originals[0].x {
    LineOriginalCoordinate::Category(values) => assert_eq(values, ["a", "b"])
    _ => fail("expected Category original coordinate")
  }
  match panels[0].state.val.line_originals[0].y {
    LineOriginalCoordinate::Numeric(values) =>
      line_units_ref_numbers(values, [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ])
    _ => fail("expected Numeric original coordinate")
  }
  line_units_ref_points(panels[0].state.val.line_originals[1].points, [
    [
      13835058055282163712UL.reinterpret_as_double(),
      4629137466983448576UL.reinterpret_as_double(),
    ],
    [
      4617315517961601024UL.reinterpret_as_double(),
      4630826316843712512UL.reinterpret_as_double(),
    ],
  ])
  match panels[0].state.val.artists[1] {
    Artist::Line(points, _) =>
      assert_true(
        physical_equal(points, panels[0].state.val.line_originals[1].points),
      )
    _ => fail("expected exact Line buffer")
  }
  match panels[0].state.val.line_originals[1].x {
    LineOriginalCoordinate::Numeric(values) =>
      line_units_ref_numbers(values, [
        13835058055282163712UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ])
    _ => fail("expected Numeric original coordinate")
  }
  match panels[0].state.val.line_originals[1].y {
    LineOriginalCoordinate::Numeric(values) =>
      line_units_ref_numbers(values, [
        4629137466983448576UL.reinterpret_as_double(),
        4630826316843712512UL.reinterpret_as_double(),
      ])
    _ => fail("expected Numeric original coordinate")
  }
  let replacement = @axis.CategoryUnits::new(["z", "b"])
  panels[0].set_x_units(Some(@axis.AxisUnitTag::Category(replacement)))
  assert_eq(panels[0].state.val.x_axis.unit_converter_kind(), Some("category"))
  assert_eq(panels[0].state.val.x_axis.get_category_units().unwrap().labels(), [
    "z", "b", "a",
  ])
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), true)
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).lower(),
    13835058055282163712UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).upper(),
    4617315517961601024UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=true),
    4607182418800017408UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.unit_converter_kind(), None)
  assert_true(panels[0].state.val.y_axis.unit_tag() is None)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).lower(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).upper(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=false),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].ignore_existing_data_limits(), false)
  assert_eq(panels[0].state.val.line_originals.length(), 2)
  line_units_ref_points(panels[0].state.val.line_originals[0].points, [
    [
      4611686018427387904UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
    ],
    [
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ],
  ])
  match panels[0].state.val.artists[0] {
    Artist::Line(points, _) =>
      assert_true(
        physical_equal(points, panels[0].state.val.line_originals[0].points),
      )
    _ => fail("expected exact Line buffer")
  }
  match panels[0].state.val.line_originals[0].x {
    LineOriginalCoordinate::Category(values) => assert_eq(values, ["a", "b"])
    _ => fail("expected Category original coordinate")
  }
  match panels[0].state.val.line_originals[0].y {
    LineOriginalCoordinate::Numeric(values) =>
      line_units_ref_numbers(values, [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ])
    _ => fail("expected Numeric original coordinate")
  }
  line_units_ref_points(panels[0].state.val.line_originals[1].points, [
    [
      13835058055282163712UL.reinterpret_as_double(),
      4629137466983448576UL.reinterpret_as_double(),
    ],
    [
      4617315517961601024UL.reinterpret_as_double(),
      4630826316843712512UL.reinterpret_as_double(),
    ],
  ])
  match panels[0].state.val.artists[1] {
    Artist::Line(points, _) =>
      assert_true(
        physical_equal(points, panels[0].state.val.line_originals[1].points),
      )
    _ => fail("expected exact Line buffer")
  }
  match panels[0].state.val.line_originals[1].x {
    LineOriginalCoordinate::Numeric(values) =>
      line_units_ref_numbers(values, [
        13835058055282163712UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ])
    _ => fail("expected Numeric original coordinate")
  }
  match panels[0].state.val.line_originals[1].y {
    LineOriginalCoordinate::Numeric(values) =>
      line_units_ref_numbers(values, [
        4629137466983448576UL.reinterpret_as_double(),
        4630826316843712512UL.reinterpret_as_double(),
      ])
    _ => fail("expected Numeric original coordinate")
  }
}

///|
fn line_units_source_case_3() -> Unit raise {
  let old_mode = @config.date_converter()
  let old_multiple = @config.date_interval_multiples()
  defer {
    @config.set_date_converter(old_mode)
    @config.set_date_interval_multiples(old_multiple)
  }
  @config.set_date_converter("auto")
  @config.set_date_interval_multiples(true)
  let figure = figure()
  let panels = [figure.axes()]
  ignore(panels[0].state.val.x_axis.update_category_units(["z", "b", "a"]))
  panels[0].attach_line_with_originals(
    [
      @core.point(
        4611686018427387904UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
      ),
      @core.point(
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ),
    ],
    LineOriginalCoordinate::Category(["a", "b"]),
    LineOriginalCoordinate::Numeric([
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ]),
  )
  panels[0].attach_line_with_originals(
    [
      @core.point(
        13835058055282163712UL.reinterpret_as_double(),
        4629137466983448576UL.reinterpret_as_double(),
      ),
      @core.point(
        4617315517961601024UL.reinterpret_as_double(),
        4630826316843712512UL.reinterpret_as_double(),
      ),
    ],
    LineOriginalCoordinate::Numeric([
      13835058055282163712UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ]),
    LineOriginalCoordinate::Numeric([
      4629137466983448576UL.reinterpret_as_double(),
      4630826316843712512UL.reinterpret_as_double(),
    ]),
  )
  panels[0].state.val.raw_x_data = @core.limits(
    13835058055282163712UL.reinterpret_as_double(),
    4617315517961601024UL.reinterpret_as_double(),
  )
  panels[0].state.val.raw_y_data = @core.limits(
    4621819117588971520UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_data_minpos = 4607182418800017408UL.reinterpret_as_double()
  panels[0].state.val.y_data_minpos = 4621819117588971520UL.reinterpret_as_double()
  panels[0].state.val.ignore_existing_data_limits = false
  panels[0].state.val.x_axis.clear_autoscale_request()
  panels[0].state.val.x_axis.request_autoscale()
  panels[0].state.val.y_axis.clear_autoscale_request()
  assert_eq(panels[0].state.val.x_axis.unit_converter_kind(), Some("category"))
  assert_eq(panels[0].state.val.x_axis.get_category_units().unwrap().labels(), [
    "z", "b", "a",
  ])
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), true)
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).lower(),
    13835058055282163712UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).upper(),
    4617315517961601024UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=true),
    4607182418800017408UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.unit_converter_kind(), None)
  assert_true(panels[0].state.val.y_axis.unit_tag() is None)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).lower(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).upper(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=false),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].ignore_existing_data_limits(), false)
  assert_eq(panels[0].state.val.line_originals.length(), 2)
  line_units_ref_points(panels[0].state.val.line_originals[0].points, [
    [
      4611686018427387904UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
    ],
    [
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ],
  ])
  match panels[0].state.val.artists[0] {
    Artist::Line(points, _) =>
      assert_true(
        physical_equal(points, panels[0].state.val.line_originals[0].points),
      )
    _ => fail("expected exact Line buffer")
  }
  match panels[0].state.val.line_originals[0].x {
    LineOriginalCoordinate::Category(values) => assert_eq(values, ["a", "b"])
    _ => fail("expected Category original coordinate")
  }
  match panels[0].state.val.line_originals[0].y {
    LineOriginalCoordinate::Numeric(values) =>
      line_units_ref_numbers(values, [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ])
    _ => fail("expected Numeric original coordinate")
  }
  line_units_ref_points(panels[0].state.val.line_originals[1].points, [
    [
      13835058055282163712UL.reinterpret_as_double(),
      4629137466983448576UL.reinterpret_as_double(),
    ],
    [
      4617315517961601024UL.reinterpret_as_double(),
      4630826316843712512UL.reinterpret_as_double(),
    ],
  ])
  match panels[0].state.val.artists[1] {
    Artist::Line(points, _) =>
      assert_true(
        physical_equal(points, panels[0].state.val.line_originals[1].points),
      )
    _ => fail("expected exact Line buffer")
  }
  match panels[0].state.val.line_originals[1].x {
    LineOriginalCoordinate::Numeric(values) =>
      line_units_ref_numbers(values, [
        13835058055282163712UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ])
    _ => fail("expected Numeric original coordinate")
  }
  match panels[0].state.val.line_originals[1].y {
    LineOriginalCoordinate::Numeric(values) =>
      line_units_ref_numbers(values, [
        4629137466983448576UL.reinterpret_as_double(),
        4630826316843712512UL.reinterpret_as_double(),
      ])
    _ => fail("expected Numeric original coordinate")
  }
  panels[0].set_x_units(panels[0].x_units())
  assert_eq(panels[0].state.val.x_axis.unit_converter_kind(), Some("category"))
  assert_eq(panels[0].state.val.x_axis.get_category_units().unwrap().labels(), [
    "z", "b", "a",
  ])
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), true)
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).lower(),
    13835058055282163712UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).upper(),
    4617315517961601024UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=true),
    4607182418800017408UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.unit_converter_kind(), None)
  assert_true(panels[0].state.val.y_axis.unit_tag() is None)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).lower(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).upper(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=false),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].ignore_existing_data_limits(), false)
  assert_eq(panels[0].state.val.line_originals.length(), 2)
  line_units_ref_points(panels[0].state.val.line_originals[0].points, [
    [
      4611686018427387904UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
    ],
    [
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ],
  ])
  match panels[0].state.val.artists[0] {
    Artist::Line(points, _) =>
      assert_true(
        physical_equal(points, panels[0].state.val.line_originals[0].points),
      )
    _ => fail("expected exact Line buffer")
  }
  match panels[0].state.val.line_originals[0].x {
    LineOriginalCoordinate::Category(values) => assert_eq(values, ["a", "b"])
    _ => fail("expected Category original coordinate")
  }
  match panels[0].state.val.line_originals[0].y {
    LineOriginalCoordinate::Numeric(values) =>
      line_units_ref_numbers(values, [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ])
    _ => fail("expected Numeric original coordinate")
  }
  line_units_ref_points(panels[0].state.val.line_originals[1].points, [
    [
      13835058055282163712UL.reinterpret_as_double(),
      4629137466983448576UL.reinterpret_as_double(),
    ],
    [
      4617315517961601024UL.reinterpret_as_double(),
      4630826316843712512UL.reinterpret_as_double(),
    ],
  ])
  match panels[0].state.val.artists[1] {
    Artist::Line(points, _) =>
      assert_true(
        physical_equal(points, panels[0].state.val.line_originals[1].points),
      )
    _ => fail("expected exact Line buffer")
  }
  match panels[0].state.val.line_originals[1].x {
    LineOriginalCoordinate::Numeric(values) =>
      line_units_ref_numbers(values, [
        13835058055282163712UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ])
    _ => fail("expected Numeric original coordinate")
  }
  match panels[0].state.val.line_originals[1].y {
    LineOriginalCoordinate::Numeric(values) =>
      line_units_ref_numbers(values, [
        4629137466983448576UL.reinterpret_as_double(),
        4630826316843712512UL.reinterpret_as_double(),
      ])
    _ => fail("expected Numeric original coordinate")
  }
}

///|
fn line_units_source_case_4() -> Unit raise {
  let old_mode = @config.date_converter()
  let old_multiple = @config.date_interval_multiples()
  defer {
    @config.set_date_converter(old_mode)
    @config.set_date_interval_multiples(old_multiple)
  }
  @config.set_date_converter("auto")
  @config.set_date_interval_multiples(true)
  let figure = figure()
  let panels = [figure.axes()]
  ignore(panels[0].state.val.x_axis.update_category_units(["z", "b", "a"]))
  panels[0].attach_line_with_originals(
    [
      @core.point(
        4611686018427387904UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
      ),
      @core.point(
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ),
    ],
    LineOriginalCoordinate::Category(["a", "b"]),
    LineOriginalCoordinate::Numeric([
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ]),
  )
  panels[0].attach_line_with_originals(
    [
      @core.point(
        13835058055282163712UL.reinterpret_as_double(),
        4629137466983448576UL.reinterpret_as_double(),
      ),
      @core.point(
        4617315517961601024UL.reinterpret_as_double(),
        4630826316843712512UL.reinterpret_as_double(),
      ),
    ],
    LineOriginalCoordinate::Numeric([
      13835058055282163712UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ]),
    LineOriginalCoordinate::Numeric([
      4629137466983448576UL.reinterpret_as_double(),
      4630826316843712512UL.reinterpret_as_double(),
    ]),
  )
  panels[0].state.val.raw_x_data = @core.limits(
    13835058055282163712UL.reinterpret_as_double(),
    4617315517961601024UL.reinterpret_as_double(),
  )
  panels[0].state.val.raw_y_data = @core.limits(
    4621819117588971520UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_data_minpos = 4607182418800017408UL.reinterpret_as_double()
  panels[0].state.val.y_data_minpos = 4621819117588971520UL.reinterpret_as_double()
  panels[0].state.val.ignore_existing_data_limits = false
  panels[0].state.val.x_axis.clear_autoscale_request()
  panels[0].state.val.x_axis.request_autoscale()
  panels[0].state.val.y_axis.clear_autoscale_request()
  assert_eq(panels[0].state.val.x_axis.unit_converter_kind(), Some("category"))
  assert_eq(panels[0].state.val.x_axis.get_category_units().unwrap().labels(), [
    "z", "b", "a",
  ])
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), true)
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).lower(),
    13835058055282163712UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).upper(),
    4617315517961601024UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=true),
    4607182418800017408UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.unit_converter_kind(), None)
  assert_true(panels[0].state.val.y_axis.unit_tag() is None)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).lower(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).upper(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=false),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].ignore_existing_data_limits(), false)
  assert_eq(panels[0].state.val.line_originals.length(), 2)
  line_units_ref_points(panels[0].state.val.line_originals[0].points, [
    [
      4611686018427387904UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
    ],
    [
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ],
  ])
  match panels[0].state.val.artists[0] {
    Artist::Line(points, _) =>
      assert_true(
        physical_equal(points, panels[0].state.val.line_originals[0].points),
      )
    _ => fail("expected exact Line buffer")
  }
  match panels[0].state.val.line_originals[0].x {
    LineOriginalCoordinate::Category(values) => assert_eq(values, ["a", "b"])
    _ => fail("expected Category original coordinate")
  }
  match panels[0].state.val.line_originals[0].y {
    LineOriginalCoordinate::Numeric(values) =>
      line_units_ref_numbers(values, [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ])
    _ => fail("expected Numeric original coordinate")
  }
  line_units_ref_points(panels[0].state.val.line_originals[1].points, [
    [
      13835058055282163712UL.reinterpret_as_double(),
      4629137466983448576UL.reinterpret_as_double(),
    ],
    [
      4617315517961601024UL.reinterpret_as_double(),
      4630826316843712512UL.reinterpret_as_double(),
    ],
  ])
  match panels[0].state.val.artists[1] {
    Artist::Line(points, _) =>
      assert_true(
        physical_equal(points, panels[0].state.val.line_originals[1].points),
      )
    _ => fail("expected exact Line buffer")
  }
  match panels[0].state.val.line_originals[1].x {
    LineOriginalCoordinate::Numeric(values) =>
      line_units_ref_numbers(values, [
        13835058055282163712UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ])
    _ => fail("expected Numeric original coordinate")
  }
  match panels[0].state.val.line_originals[1].y {
    LineOriginalCoordinate::Numeric(values) =>
      line_units_ref_numbers(values, [
        4629137466983448576UL.reinterpret_as_double(),
        4630826316843712512UL.reinterpret_as_double(),
      ])
    _ => fail("expected Numeric original coordinate")
  }
  let replacement = @axis.CategoryUnits::new(["z", "b", "a"])
  panels[0].set_x_units(Some(@axis.AxisUnitTag::Category(replacement)))
  assert_eq(panels[0].state.val.x_axis.unit_converter_kind(), Some("category"))
  assert_eq(panels[0].state.val.x_axis.get_category_units().unwrap().labels(), [
    "z", "b", "a",
  ])
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), true)
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).lower(),
    13835058055282163712UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).upper(),
    4617315517961601024UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=true),
    4607182418800017408UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.unit_converter_kind(), None)
  assert_true(panels[0].state.val.y_axis.unit_tag() is None)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).lower(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).upper(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=false),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].ignore_existing_data_limits(), false)
  assert_eq(panels[0].state.val.line_originals.length(), 2)
  line_units_ref_points(panels[0].state.val.line_originals[0].points, [
    [
      4611686018427387904UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
    ],
    [
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ],
  ])
  match panels[0].state.val.artists[0] {
    Artist::Line(points, _) =>
      assert_true(
        physical_equal(points, panels[0].state.val.line_originals[0].points),
      )
    _ => fail("expected exact Line buffer")
  }
  match panels[0].state.val.line_originals[0].x {
    LineOriginalCoordinate::Category(values) => assert_eq(values, ["a", "b"])
    _ => fail("expected Category original coordinate")
  }
  match panels[0].state.val.line_originals[0].y {
    LineOriginalCoordinate::Numeric(values) =>
      line_units_ref_numbers(values, [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ])
    _ => fail("expected Numeric original coordinate")
  }
  line_units_ref_points(panels[0].state.val.line_originals[1].points, [
    [
      13835058055282163712UL.reinterpret_as_double(),
      4629137466983448576UL.reinterpret_as_double(),
    ],
    [
      4617315517961601024UL.reinterpret_as_double(),
      4630826316843712512UL.reinterpret_as_double(),
    ],
  ])
  match panels[0].state.val.artists[1] {
    Artist::Line(points, _) =>
      assert_true(
        physical_equal(points, panels[0].state.val.line_originals[1].points),
      )
    _ => fail("expected exact Line buffer")
  }
  match panels[0].state.val.line_originals[1].x {
    LineOriginalCoordinate::Numeric(values) =>
      line_units_ref_numbers(values, [
        13835058055282163712UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ])
    _ => fail("expected Numeric original coordinate")
  }
  match panels[0].state.val.line_originals[1].y {
    LineOriginalCoordinate::Numeric(values) =>
      line_units_ref_numbers(values, [
        4629137466983448576UL.reinterpret_as_double(),
        4630826316843712512UL.reinterpret_as_double(),
      ])
    _ => fail("expected Numeric original coordinate")
  }
}

///|
fn line_units_source_case_5() -> Unit raise {
  let old_mode = @config.date_converter()
  let old_multiple = @config.date_interval_multiples()
  defer {
    @config.set_date_converter(old_mode)
    @config.set_date_interval_multiples(old_multiple)
  }
  @config.set_date_converter("auto")
  @config.set_date_interval_multiples(true)
  let figure = figure()
  let panels = [figure.axes()]
  ignore(panels[0].state.val.x_axis.update_category_units(["a", "b"]))
  ignore(panels[0].state.val.y_axis.update_category_units(["u", "v"]))
  panels[0].attach_line_with_originals(
    [
      @core.point(0UL.reinterpret_as_double(), 0UL.reinterpret_as_double()),
      @core.point(
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ),
    ],
    LineOriginalCoordinate::Category(["a", "b"]),
    LineOriginalCoordinate::Category(["v", "u"]),
  )
  panels[0].state.val.raw_x_data = @core.limits(
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  panels[0].state.val.raw_y_data = @core.limits(
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_data_minpos = 4607182418800017408UL.reinterpret_as_double()
  panels[0].state.val.y_data_minpos = 4607182418800017408UL.reinterpret_as_double()
  panels[0].state.val.ignore_existing_data_limits = false
  panels[0].state.val.x_axis.clear_autoscale_request()
  panels[0].state.val.y_axis.clear_autoscale_request()
  assert_eq(panels[0].state.val.x_axis.unit_converter_kind(), Some("category"))
  assert_eq(panels[0].state.val.x_axis.get_category_units().unwrap().labels(), [
    "a", "b",
  ])
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), false)
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).lower(),
    0UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).upper(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=true),
    4607182418800017408UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.unit_converter_kind(), Some("category"))
  assert_eq(panels[0].state.val.y_axis.get_category_units().unwrap().labels(), [
    "u", "v",
  ])
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).lower(),
    0UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).upper(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=false),
    4607182418800017408UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].ignore_existing_data_limits(), false)
  assert_eq(panels[0].state.val.line_originals.length(), 1)
  line_units_ref_points(panels[0].state.val.line_originals[0].points, [
    [0UL.reinterpret_as_double(), 0UL.reinterpret_as_double()],
    [
      4607182418800017408UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ],
  ])
  match panels[0].state.val.artists[0] {
    Artist::Line(points, _) =>
      assert_true(
        physical_equal(points, panels[0].state.val.line_originals[0].points),
      )
    _ => fail("expected exact Line buffer")
  }
  match panels[0].state.val.line_originals[0].x {
    LineOriginalCoordinate::Category(values) => assert_eq(values, ["a", "b"])
    _ => fail("expected Category original coordinate")
  }
  match panels[0].state.val.line_originals[0].y {
    LineOriginalCoordinate::Category(values) => assert_eq(values, ["v", "u"])
    _ => fail("expected Category original coordinate")
  }
  let replacement = @axis.CategoryUnits::new(["b", "a"])
  panels[0].set_x_units(Some(@axis.AxisUnitTag::Category(replacement)))
  assert_eq(panels[0].state.val.x_axis.unit_converter_kind(), Some("category"))
  assert_eq(panels[0].state.val.x_axis.get_category_units().unwrap().labels(), [
    "b", "a",
  ])
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), true)
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).lower(),
    0UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).upper(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=true),
    4607182418800017408UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.unit_converter_kind(), Some("category"))
  assert_eq(panels[0].state.val.y_axis.get_category_units().unwrap().labels(), [
    "u", "v",
  ])
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).lower(),
    0UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).upper(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=false),
    4607182418800017408UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].ignore_existing_data_limits(), false)
  assert_eq(panels[0].state.val.line_originals.length(), 1)
  line_units_ref_points(panels[0].state.val.line_originals[0].points, [
    [
      4607182418800017408UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ],
    [0UL.reinterpret_as_double(), 0UL.reinterpret_as_double()],
  ])
  match panels[0].state.val.artists[0] {
    Artist::Line(points, _) =>
      assert_true(
        physical_equal(points, panels[0].state.val.line_originals[0].points),
      )
    _ => fail("expected exact Line buffer")
  }
  match panels[0].state.val.line_originals[0].x {
    LineOriginalCoordinate::Category(values) => assert_eq(values, ["a", "b"])
    _ => fail("expected Category original coordinate")
  }
  match panels[0].state.val.line_originals[0].y {
    LineOriginalCoordinate::Category(values) => assert_eq(values, ["v", "u"])
    _ => fail("expected Category original coordinate")
  }
}

///|
fn line_units_source_case_6() -> Unit raise {
  let old_mode = @config.date_converter()
  let old_multiple = @config.date_interval_multiples()
  defer {
    @config.set_date_converter(old_mode)
    @config.set_date_interval_multiples(old_multiple)
  }
  @config.set_date_converter("auto")
  @config.set_date_interval_multiples(true)
  let figure = figure()
  let panels = [figure.axes()]
  ignore(panels[0].state.val.x_axis.update_category_units(["a", "b"]))
  panels[0].attach_line_with_originals(
    [
      @core.point(
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
      ),
      @core.point(
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ),
    ],
    LineOriginalCoordinate::Category(["a", "b"]),
    LineOriginalCoordinate::Numeric([
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ]),
  )
  panels[0].attach_line_with_originals(
    [
      @core.point(
        0UL.reinterpret_as_double(),
        4629137466983448576UL.reinterpret_as_double(),
      ),
      @core.point(
        4607182418800017408UL.reinterpret_as_double(),
        4630826316843712512UL.reinterpret_as_double(),
      ),
    ],
    LineOriginalCoordinate::Category(["a", "b"]),
    LineOriginalCoordinate::Category(["not-numeric", "bad"]),
  )
  panels[0].attach_line_with_originals(
    [
      @core.point(
        0UL.reinterpret_as_double(),
        4632233691727265792UL.reinterpret_as_double(),
      ),
      @core.point(
        4607182418800017408UL.reinterpret_as_double(),
        4633641066610819072UL.reinterpret_as_double(),
      ),
    ],
    LineOriginalCoordinate::Category(["a", "b"]),
    LineOriginalCoordinate::Numeric([
      4632233691727265792UL.reinterpret_as_double(),
      4633641066610819072UL.reinterpret_as_double(),
    ]),
  )
  panels[0].state.val.raw_x_data = @core.limits(
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  panels[0].state.val.raw_y_data = @core.limits(
    4621819117588971520UL.reinterpret_as_double(),
    4633641066610819072UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_data_minpos = 4607182418800017408UL.reinterpret_as_double()
  panels[0].state.val.y_data_minpos = 4621819117588971520UL.reinterpret_as_double()
  panels[0].state.val.ignore_existing_data_limits = false
  panels[0].state.val.x_axis.clear_autoscale_request()
  panels[0].state.val.y_axis.clear_autoscale_request()
  assert_eq(panels[0].state.val.x_axis.unit_converter_kind(), Some("category"))
  assert_eq(panels[0].state.val.x_axis.get_category_units().unwrap().labels(), [
    "a", "b",
  ])
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), false)
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).lower(),
    0UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).upper(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=true),
    4607182418800017408UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.unit_converter_kind(), None)
  assert_true(panels[0].state.val.y_axis.unit_tag() is None)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).lower(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).upper(),
    4633641066610819072UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=false),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].ignore_existing_data_limits(), false)
  assert_eq(panels[0].state.val.line_originals.length(), 3)
  line_units_ref_points(panels[0].state.val.line_originals[0].points, [
    [0UL.reinterpret_as_double(), 4621819117588971520UL.reinterpret_as_double()],
    [
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ],
  ])
  match panels[0].state.val.artists[0] {
    Artist::Line(points, _) =>
      assert_true(
        physical_equal(points, panels[0].state.val.line_originals[0].points),
      )
    _ => fail("expected exact Line buffer")
  }
  match panels[0].state.val.line_originals[0].x {
    LineOriginalCoordinate::Category(values) => assert_eq(values, ["a", "b"])
    _ => fail("expected Category original coordinate")
  }
  match panels[0].state.val.line_originals[0].y {
    LineOriginalCoordinate::Numeric(values) =>
      line_units_ref_numbers(values, [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ])
    _ => fail("expected Numeric original coordinate")
  }
  line_units_ref_points(panels[0].state.val.line_originals[1].points, [
    [0UL.reinterpret_as_double(), 4629137466983448576UL.reinterpret_as_double()],
    [
      4607182418800017408UL.reinterpret_as_double(),
      4630826316843712512UL.reinterpret_as_double(),
    ],
  ])
  match panels[0].state.val.artists[1] {
    Artist::Line(points, _) =>
      assert_true(
        physical_equal(points, panels[0].state.val.line_originals[1].points),
      )
    _ => fail("expected exact Line buffer")
  }
  match panels[0].state.val.line_originals[1].x {
    LineOriginalCoordinate::Category(values) => assert_eq(values, ["a", "b"])
    _ => fail("expected Category original coordinate")
  }
  match panels[0].state.val.line_originals[1].y {
    LineOriginalCoordinate::Category(values) =>
      assert_eq(values, ["not-numeric", "bad"])
    _ => fail("expected Category original coordinate")
  }
  line_units_ref_points(panels[0].state.val.line_originals[2].points, [
    [0UL.reinterpret_as_double(), 4632233691727265792UL.reinterpret_as_double()],
    [
      4607182418800017408UL.reinterpret_as_double(),
      4633641066610819072UL.reinterpret_as_double(),
    ],
  ])
  match panels[0].state.val.artists[2] {
    Artist::Line(points, _) =>
      assert_true(
        physical_equal(points, panels[0].state.val.line_originals[2].points),
      )
    _ => fail("expected exact Line buffer")
  }
  match panels[0].state.val.line_originals[2].x {
    LineOriginalCoordinate::Category(values) => assert_eq(values, ["a", "b"])
    _ => fail("expected Category original coordinate")
  }
  match panels[0].state.val.line_originals[2].y {
    LineOriginalCoordinate::Numeric(values) =>
      line_units_ref_numbers(values, [
        4632233691727265792UL.reinterpret_as_double(),
        4633641066610819072UL.reinterpret_as_double(),
      ])
    _ => fail("expected Numeric original coordinate")
  }
  let replacement = @axis.CategoryUnits::new(["b", "a"])
  let failed = try {
    panels[0].set_x_units(Some(@axis.AxisUnitTag::Category(replacement)))
    false
  } catch {
    @core.DataError::InvalidTicks(_) => true
    _ => false
  }
  assert_true(failed)
  assert_eq(panels[0].state.val.x_axis.unit_converter_kind(), Some("category"))
  assert_eq(panels[0].state.val.x_axis.get_category_units().unwrap().labels(), [
    "b", "a",
  ])
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), false)
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).lower(),
    0UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).upper(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=true),
    4607182418800017408UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.unit_converter_kind(), Some("category"))
  assert_true(panels[0].state.val.y_axis.unit_tag() is None)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).lower(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).upper(),
    4633641066610819072UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=false),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].ignore_existing_data_limits(), false)
  assert_eq(panels[0].state.val.line_originals.length(), 3)
  line_units_ref_points(panels[0].state.val.line_originals[0].points, [
    [
      4607182418800017408UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
    ],
    [0UL.reinterpret_as_double(), 4626322717216342016UL.reinterpret_as_double()],
  ])
  match panels[0].state.val.artists[0] {
    Artist::Line(points, _) =>
      assert_true(
        physical_equal(points, panels[0].state.val.line_originals[0].points),
      )
    _ => fail("expected exact Line buffer")
  }
  match panels[0].state.val.line_originals[0].x {
    LineOriginalCoordinate::Category(values) => assert_eq(values, ["a", "b"])
    _ => fail("expected Category original coordinate")
  }
  match panels[0].state.val.line_originals[0].y {
    LineOriginalCoordinate::Numeric(values) =>
      line_units_ref_numbers(values, [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ])
    _ => fail("expected Numeric original coordinate")
  }
  line_units_ref_points(panels[0].state.val.line_originals[1].points, [
    [0UL.reinterpret_as_double(), 4629137466983448576UL.reinterpret_as_double()],
    [
      4607182418800017408UL.reinterpret_as_double(),
      4630826316843712512UL.reinterpret_as_double(),
    ],
  ])
  match panels[0].state.val.artists[1] {
    Artist::Line(points, _) =>
      assert_true(
        physical_equal(points, panels[0].state.val.line_originals[1].points),
      )
    _ => fail("expected exact Line buffer")
  }
  match panels[0].state.val.line_originals[1].x {
    LineOriginalCoordinate::Category(values) => assert_eq(values, ["a", "b"])
    _ => fail("expected Category original coordinate")
  }
  match panels[0].state.val.line_originals[1].y {
    LineOriginalCoordinate::Category(values) =>
      assert_eq(values, ["not-numeric", "bad"])
    _ => fail("expected Category original coordinate")
  }
  line_units_ref_points(panels[0].state.val.line_originals[2].points, [
    [0UL.reinterpret_as_double(), 4632233691727265792UL.reinterpret_as_double()],
    [
      4607182418800017408UL.reinterpret_as_double(),
      4633641066610819072UL.reinterpret_as_double(),
    ],
  ])
  match panels[0].state.val.artists[2] {
    Artist::Line(points, _) =>
      assert_true(
        physical_equal(points, panels[0].state.val.line_originals[2].points),
      )
    _ => fail("expected exact Line buffer")
  }
  match panels[0].state.val.line_originals[2].x {
    LineOriginalCoordinate::Category(values) => assert_eq(values, ["a", "b"])
    _ => fail("expected Category original coordinate")
  }
  match panels[0].state.val.line_originals[2].y {
    LineOriginalCoordinate::Numeric(values) =>
      line_units_ref_numbers(values, [
        4632233691727265792UL.reinterpret_as_double(),
        4633641066610819072UL.reinterpret_as_double(),
      ])
    _ => fail("expected Numeric original coordinate")
  }
}

///|
fn line_units_source_case_7() -> Unit raise {
  let old_mode = @config.date_converter()
  let old_multiple = @config.date_interval_multiples()
  defer {
    @config.set_date_converter(old_mode)
    @config.set_date_interval_multiples(old_multiple)
  }
  @config.set_date_converter("auto")
  @config.set_date_interval_multiples(true)
  let figure = figure()
  let panels = [figure.axes()]
  ignore(panels[0].state.val.x_axis.update_category_units(["a", "b"]))
  panels[0].attach_line_with_originals(
    [
      @core.point(
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
      ),
      @core.point(
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ),
    ],
    LineOriginalCoordinate::Category(["a", "b"]),
    LineOriginalCoordinate::Numeric([
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
      4629137466983448576UL.reinterpret_as_double(),
    ]),
  )
  panels[0].state.val.raw_x_data = @core.limits(
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  panels[0].state.val.raw_y_data = @core.limits(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_data_minpos = 4607182418800017408UL.reinterpret_as_double()
  panels[0].state.val.y_data_minpos = 4621819117588971520UL.reinterpret_as_double()
  panels[0].state.val.ignore_existing_data_limits = false
  panels[0].state.val.x_axis.clear_autoscale_request()
  panels[0].state.val.y_axis.clear_autoscale_request()
  assert_eq(panels[0].state.val.x_axis.unit_converter_kind(), Some("category"))
  assert_eq(panels[0].state.val.x_axis.get_category_units().unwrap().labels(), [
    "a", "b",
  ])
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), false)
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).lower(),
    0UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).upper(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=true),
    4607182418800017408UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.unit_converter_kind(), None)
  assert_true(panels[0].state.val.y_axis.unit_tag() is None)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).lower(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).upper(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=false),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].ignore_existing_data_limits(), false)
  assert_eq(panels[0].state.val.line_originals.length(), 1)
  line_units_ref_points(panels[0].state.val.line_originals[0].points, [
    [0UL.reinterpret_as_double(), 4621819117588971520UL.reinterpret_as_double()],
    [
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ],
  ])
  match panels[0].state.val.artists[0] {
    Artist::Line(points, _) =>
      assert_true(
        physical_equal(points, panels[0].state.val.line_originals[0].points),
      )
    _ => fail("expected exact Line buffer")
  }
  match panels[0].state.val.line_originals[0].x {
    LineOriginalCoordinate::Category(values) => assert_eq(values, ["a", "b"])
    _ => fail("expected Category original coordinate")
  }
  match panels[0].state.val.line_originals[0].y {
    LineOriginalCoordinate::Numeric(values) =>
      line_units_ref_numbers(values, [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
        4629137466983448576UL.reinterpret_as_double(),
      ])
    _ => fail("expected Numeric original coordinate")
  }
  let replacement = @axis.CategoryUnits::new(["b", "a"])
  let failed = try {
    panels[0].set_x_units(Some(@axis.AxisUnitTag::Category(replacement)))
    false
  } catch {
    @core.DataError::InvalidTicks(message~) =>
      message ==
      "shape mismatch: objects cannot be broadcast to a single shape.  Mismatch is between arg 0 with shape (2,) and arg 1 with shape (3,)."
    _ => false
  }
  assert_true(failed)
  assert_eq(panels[0].state.val.x_axis.unit_converter_kind(), Some("category"))
  assert_eq(panels[0].state.val.x_axis.get_category_units().unwrap().labels(), [
    "b", "a",
  ])
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), false)
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).lower(),
    0UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).upper(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=true),
    4607182418800017408UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.unit_converter_kind(), None)
  assert_true(panels[0].state.val.y_axis.unit_tag() is None)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).lower(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).upper(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=false),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].ignore_existing_data_limits(), false)
  assert_eq(panels[0].state.val.line_originals.length(), 1)
  line_units_ref_points(panels[0].state.val.line_originals[0].points, [
    [0UL.reinterpret_as_double(), 4621819117588971520UL.reinterpret_as_double()],
    [
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ],
  ])
  match panels[0].state.val.artists[0] {
    Artist::Line(points, _) =>
      assert_true(
        physical_equal(points, panels[0].state.val.line_originals[0].points),
      )
    _ => fail("expected exact Line buffer")
  }
  match panels[0].state.val.line_originals[0].x {
    LineOriginalCoordinate::Category(values) => assert_eq(values, ["a", "b"])
    _ => fail("expected Category original coordinate")
  }
  match panels[0].state.val.line_originals[0].y {
    LineOriginalCoordinate::Numeric(values) =>
      line_units_ref_numbers(values, [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
        4629137466983448576UL.reinterpret_as_double(),
      ])
    _ => fail("expected Numeric original coordinate")
  }
}

///|
fn line_units_source_case_8() -> Unit raise {
  let old_mode = @config.date_converter()
  let old_multiple = @config.date_interval_multiples()
  defer {
    @config.set_date_converter(old_mode)
    @config.set_date_interval_multiples(old_multiple)
  }
  @config.set_date_converter("auto")
  @config.set_date_interval_multiples(true)
  let figure = figure()
  let panels = [figure.axes()]
  ignore(panels[0].state.val.x_axis.update_category_units(["a", "b"]))
  let incoming = ["a", "b"]
  panels[0].attach_line_with_originals(
    [
      @core.point(
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
      ),
      @core.point(
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ),
    ],
    LineOriginalCoordinate::Category(incoming),
    LineOriginalCoordinate::Numeric([
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ]),
  )
  incoming[0] = "outside"
  panels[0].state.val.raw_x_data = @core.limits(
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  panels[0].state.val.raw_y_data = @core.limits(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_data_minpos = 4607182418800017408UL.reinterpret_as_double()
  panels[0].state.val.y_data_minpos = 4621819117588971520UL.reinterpret_as_double()
  panels[0].state.val.ignore_existing_data_limits = false
  panels[0].state.val.x_axis.clear_autoscale_request()
  panels[0].state.val.y_axis.clear_autoscale_request()
  assert_eq(panels[0].state.val.x_axis.unit_converter_kind(), Some("category"))
  assert_eq(panels[0].state.val.x_axis.get_category_units().unwrap().labels(), [
    "a", "b",
  ])
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), false)
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).lower(),
    0UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).upper(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=true),
    4607182418800017408UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.unit_converter_kind(), None)
  assert_true(panels[0].state.val.y_axis.unit_tag() is None)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).lower(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).upper(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=false),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].ignore_existing_data_limits(), false)
  assert_eq(panels[0].state.val.line_originals.length(), 1)
  line_units_ref_points(panels[0].state.val.line_originals[0].points, [
    [0UL.reinterpret_as_double(), 4621819117588971520UL.reinterpret_as_double()],
    [
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ],
  ])
  match panels[0].state.val.artists[0] {
    Artist::Line(points, _) =>
      assert_true(
        physical_equal(points, panels[0].state.val.line_originals[0].points),
      )
    _ => fail("expected exact Line buffer")
  }
  match panels[0].state.val.line_originals[0].x {
    LineOriginalCoordinate::Category(values) => assert_eq(values, ["a", "b"])
    _ => fail("expected Category original coordinate")
  }
  match panels[0].state.val.line_originals[0].y {
    LineOriginalCoordinate::Numeric(values) =>
      line_units_ref_numbers(values, [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ])
    _ => fail("expected Numeric original coordinate")
  }
  panels[0].recache_line_units()
  assert_eq(panels[0].state.val.x_axis.unit_converter_kind(), Some("category"))
  assert_eq(panels[0].state.val.x_axis.get_category_units().unwrap().labels(), [
    "a", "b",
  ])
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), false)
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).lower(),
    0UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).upper(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=true),
    4607182418800017408UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.unit_converter_kind(), None)
  assert_true(panels[0].state.val.y_axis.unit_tag() is None)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).lower(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).upper(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=false),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].ignore_existing_data_limits(), false)
  assert_eq(panels[0].state.val.line_originals.length(), 1)
  line_units_ref_points(panels[0].state.val.line_originals[0].points, [
    [0UL.reinterpret_as_double(), 4621819117588971520UL.reinterpret_as_double()],
    [
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ],
  ])
  match panels[0].state.val.artists[0] {
    Artist::Line(points, _) =>
      assert_true(
        physical_equal(points, panels[0].state.val.line_originals[0].points),
      )
    _ => fail("expected exact Line buffer")
  }
  match panels[0].state.val.line_originals[0].x {
    LineOriginalCoordinate::Category(values) => assert_eq(values, ["a", "b"])
    _ => fail("expected Category original coordinate")
  }
  match panels[0].state.val.line_originals[0].y {
    LineOriginalCoordinate::Numeric(values) =>
      line_units_ref_numbers(values, [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ])
    _ => fail("expected Numeric original coordinate")
  }
}

///|
fn line_units_source_case_14() -> Unit raise {
  let old_mode = @config.date_converter()
  let old_multiple = @config.date_interval_multiples()
  defer {
    @config.set_date_converter(old_mode)
    @config.set_date_interval_multiples(old_multiple)
  }
  @config.set_date_converter("auto")
  @config.set_date_interval_multiples(true)
  let figure = figure()
  let panels = [figure.axes()]
  ignore(panels[0].state.val.x_axis.update_category_units(["a", "b"]))
  panels[0].attach_line_with_originals(
    [
      @core.point(
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ),
      @core.point(
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ),
      @core.point(
        0UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ),
    ],
    LineOriginalCoordinate::Category(["a"]),
    LineOriginalCoordinate::Numeric([
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
    ]),
  )
  panels[0].state.val.raw_x_data = @core.limits(
    0UL.reinterpret_as_double(),
    0UL.reinterpret_as_double(),
  )
  panels[0].state.val.raw_y_data = @core.limits(
    4607182418800017408UL.reinterpret_as_double(),
    4613937818241073152UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_data_minpos = 9218868437227405312UL.reinterpret_as_double()
  panels[0].state.val.y_data_minpos = 4607182418800017408UL.reinterpret_as_double()
  panels[0].state.val.ignore_existing_data_limits = false
  panels[0].state.val.x_axis.clear_autoscale_request()
  panels[0].state.val.y_axis.clear_autoscale_request()
  assert_eq(panels[0].state.val.x_axis.unit_converter_kind(), Some("category"))
  assert_eq(panels[0].state.val.x_axis.get_category_units().unwrap().labels(), [
    "a", "b",
  ])
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), false)
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).lower(),
    0UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).upper(),
    0UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=true),
    9218868437227405312UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.unit_converter_kind(), None)
  assert_true(panels[0].state.val.y_axis.unit_tag() is None)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).lower(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).upper(),
    4613937818241073152UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=false),
    4607182418800017408UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].ignore_existing_data_limits(), false)
  assert_eq(panels[0].state.val.line_originals.length(), 1)
  line_units_ref_points(panels[0].state.val.line_originals[0].points, [
    [0UL.reinterpret_as_double(), 4607182418800017408UL.reinterpret_as_double()],
    [0UL.reinterpret_as_double(), 4611686018427387904UL.reinterpret_as_double()],
    [0UL.reinterpret_as_double(), 4613937818241073152UL.reinterpret_as_double()],
  ])
  match panels[0].state.val.artists[0] {
    Artist::Line(points, _) =>
      assert_true(
        physical_equal(points, panels[0].state.val.line_originals[0].points),
      )
    _ => fail("expected exact Line buffer")
  }
  match panels[0].state.val.line_originals[0].x {
    LineOriginalCoordinate::Category(values) => assert_eq(values, ["a"])
    _ => fail("expected Category original coordinate")
  }
  match panels[0].state.val.line_originals[0].y {
    LineOriginalCoordinate::Numeric(values) =>
      line_units_ref_numbers(values, [
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ])
    _ => fail("expected Numeric original coordinate")
  }
  panels[0].recache_line_units()
  assert_eq(panels[0].state.val.x_axis.unit_converter_kind(), Some("category"))
  assert_eq(panels[0].state.val.x_axis.get_category_units().unwrap().labels(), [
    "a", "b",
  ])
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), false)
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).lower(),
    0UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).upper(),
    0UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=true),
    9218868437227405312UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.unit_converter_kind(), None)
  assert_true(panels[0].state.val.y_axis.unit_tag() is None)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).lower(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).upper(),
    4613937818241073152UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=false),
    4607182418800017408UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].ignore_existing_data_limits(), false)
  assert_eq(panels[0].state.val.line_originals.length(), 1)
  line_units_ref_points(panels[0].state.val.line_originals[0].points, [
    [0UL.reinterpret_as_double(), 4607182418800017408UL.reinterpret_as_double()],
    [0UL.reinterpret_as_double(), 4611686018427387904UL.reinterpret_as_double()],
    [0UL.reinterpret_as_double(), 4613937818241073152UL.reinterpret_as_double()],
  ])
  match panels[0].state.val.artists[0] {
    Artist::Line(points, _) =>
      assert_true(
        physical_equal(points, panels[0].state.val.line_originals[0].points),
      )
    _ => fail("expected exact Line buffer")
  }
  match panels[0].state.val.line_originals[0].x {
    LineOriginalCoordinate::Category(values) => assert_eq(values, ["a"])
    _ => fail("expected Category original coordinate")
  }
  match panels[0].state.val.line_originals[0].y {
    LineOriginalCoordinate::Numeric(values) =>
      line_units_ref_numbers(values, [
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ])
    _ => fail("expected Numeric original coordinate")
  }
}

///|
fn line_units_source_case_15() -> Unit raise {
  let old_mode = @config.date_converter()
  let old_multiple = @config.date_interval_multiples()
  defer {
    @config.set_date_converter(old_mode)
    @config.set_date_interval_multiples(old_multiple)
  }
  @config.set_date_converter("auto")
  @config.set_date_interval_multiples(true)
  let figure = figure()
  let panels = [figure.axes()]
  ignore(panels[0].state.val.x_axis.update_category_units(["a", "b"]))
  ignore(
    panels[0].state.val.y_axis.update_date_units([
      @date.RRuleDateTime::aware(@date.datetime(2024, 1, 1, offset_seconds=0)),
    ]),
  )
  panels[0].attach_line_with_originals(
    [
      @core.point(
        0UL.reinterpret_as_double(),
        4671150630914490368UL.reinterpret_as_double(),
      ),
      @core.point(
        4607182418800017408UL.reinterpret_as_double(),
        4671150871432658944UL.reinterpret_as_double(),
      ),
    ],
    LineOriginalCoordinate::Category(["a", "b"]),
    LineOriginalCoordinate::Date([
      @date.RRuleDateTime::aware(
        @date.datetime(
          2024,
          1,
          1,
          hour=0,
          minute=0,
          second=0,
          microsecond=0,
          offset_seconds=0,
        ),
      ),
      @date.RRuleDateTime::aware(
        @date.datetime(
          2024,
          1,
          2,
          hour=0,
          minute=0,
          second=0,
          microsecond=0,
          offset_seconds=10800,
        ),
      ),
    ]),
  )
  panels[0].state.val.raw_x_data = @core.limits(
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  panels[0].state.val.raw_y_data = @core.limits(
    4671150630914490368UL.reinterpret_as_double(),
    4671150871432658944UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_data_minpos = 4607182418800017408UL.reinterpret_as_double()
  panels[0].state.val.y_data_minpos = 4671150630914490368UL.reinterpret_as_double()
  panels[0].state.val.ignore_existing_data_limits = false
  panels[0].state.val.x_axis.clear_autoscale_request()
  panels[0].state.val.y_axis.clear_autoscale_request()
  assert_eq(panels[0].state.val.x_axis.unit_converter_kind(), Some("category"))
  assert_eq(panels[0].state.val.x_axis.get_category_units().unwrap().labels(), [
    "a", "b",
  ])
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), false)
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).lower(),
    0UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).upper(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=true),
    4607182418800017408UL.reinterpret_as_double(),
  )
  assert_eq(
    panels[0].state.val.y_axis.unit_converter_kind(),
    Some("default_date"),
  )
  match panels[0].state.val.y_axis.unit_tag() {
    Some(@axis.AxisUnitTag::Date(zone)) =>
      assert_eq(zone.offset_seconds_at(0.0), 0)
    _ => fail("expected Date unit")
  }
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).lower(),
    4671150630914490368UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).upper(),
    4671150871432658944UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=false),
    4671150630914490368UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].ignore_existing_data_limits(), false)
  assert_eq(panels[0].state.val.line_originals.length(), 1)
  line_units_ref_points(panels[0].state.val.line_originals[0].points, [
    [0UL.reinterpret_as_double(), 4671150630914490368UL.reinterpret_as_double()],
    [
      4607182418800017408UL.reinterpret_as_double(),
      4671150871432658944UL.reinterpret_as_double(),
    ],
  ])
  match panels[0].state.val.artists[0] {
    Artist::Line(points, _) =>
      assert_true(
        physical_equal(points, panels[0].state.val.line_originals[0].points),
      )
    _ => fail("expected exact Line buffer")
  }
  match panels[0].state.val.line_originals[0].x {
    LineOriginalCoordinate::Category(values) => assert_eq(values, ["a", "b"])
    _ => fail("expected Category original coordinate")
  }
  match panels[0].state.val.line_originals[0].y {
    LineOriginalCoordinate::Date(values) => {
      assert_eq(values.length(), 2)
      assert_eq(values[0].is_naive(), false)
      assert_eq(
        [
          values[0].date().year(),
          values[0].date().month(),
          values[0].date().day(),
          values[0].date().hour(),
          values[0].date().minute(),
          values[0].date().second(),
          values[0].date().microsecond(),
          values[0].date().offset_seconds(),
        ],
        [2024, 1, 1, 0, 0, 0, 0, 0],
      )
      assert_eq(values[1].is_naive(), false)
      assert_eq(
        [
          values[1].date().year(),
          values[1].date().month(),
          values[1].date().day(),
          values[1].date().hour(),
          values[1].date().minute(),
          values[1].date().second(),
          values[1].date().microsecond(),
          values[1].date().offset_seconds(),
        ],
        [2024, 1, 2, 0, 0, 0, 0, 10800],
      )
    }
    _ => fail("expected Date original coordinate")
  }
  let replacement = @axis.CategoryUnits::new(["b", "a"])
  panels[0].set_x_units(Some(@axis.AxisUnitTag::Category(replacement)))
  assert_eq(panels[0].state.val.x_axis.unit_converter_kind(), Some("category"))
  assert_eq(panels[0].state.val.x_axis.get_category_units().unwrap().labels(), [
    "b", "a",
  ])
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), true)
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).lower(),
    0UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).upper(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=true),
    4607182418800017408UL.reinterpret_as_double(),
  )
  assert_eq(
    panels[0].state.val.y_axis.unit_converter_kind(),
    Some("default_date"),
  )
  match panels[0].state.val.y_axis.unit_tag() {
    Some(@axis.AxisUnitTag::Date(zone)) =>
      assert_eq(zone.offset_seconds_at(0.0), 0)
    _ => fail("expected Date unit")
  }
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).lower(),
    4671150630914490368UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).upper(),
    4671150871432658944UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=false),
    4671150630914490368UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].ignore_existing_data_limits(), false)
  assert_eq(panels[0].state.val.line_originals.length(), 1)
  line_units_ref_points(panels[0].state.val.line_originals[0].points, [
    [
      4607182418800017408UL.reinterpret_as_double(),
      4671150630914490368UL.reinterpret_as_double(),
    ],
    [0UL.reinterpret_as_double(), 4671150871432658944UL.reinterpret_as_double()],
  ])
  match panels[0].state.val.artists[0] {
    Artist::Line(points, _) =>
      assert_true(
        physical_equal(points, panels[0].state.val.line_originals[0].points),
      )
    _ => fail("expected exact Line buffer")
  }
  match panels[0].state.val.line_originals[0].x {
    LineOriginalCoordinate::Category(values) => assert_eq(values, ["a", "b"])
    _ => fail("expected Category original coordinate")
  }
  match panels[0].state.val.line_originals[0].y {
    LineOriginalCoordinate::Date(values) => {
      assert_eq(values.length(), 2)
      assert_eq(values[0].is_naive(), false)
      assert_eq(
        [
          values[0].date().year(),
          values[0].date().month(),
          values[0].date().day(),
          values[0].date().hour(),
          values[0].date().minute(),
          values[0].date().second(),
          values[0].date().microsecond(),
          values[0].date().offset_seconds(),
        ],
        [2024, 1, 1, 0, 0, 0, 0, 0],
      )
      assert_eq(values[1].is_naive(), false)
      assert_eq(
        [
          values[1].date().year(),
          values[1].date().month(),
          values[1].date().day(),
          values[1].date().hour(),
          values[1].date().minute(),
          values[1].date().second(),
          values[1].date().microsecond(),
          values[1].date().offset_seconds(),
        ],
        [2024, 1, 2, 0, 0, 0, 0, 10800],
      )
    }
    _ => fail("expected Date original coordinate")
  }
}

///|
fn line_units_source_case_16() -> Unit raise {
  let old_mode = @config.date_converter()
  let old_multiple = @config.date_interval_multiples()
  defer {
    @config.set_date_converter(old_mode)
    @config.set_date_interval_multiples(old_multiple)
  }
  @config.set_date_converter("auto")
  @config.set_date_interval_multiples(true)
  let figure = figure()
  let panels = [figure.axes()]
  ignore(
    panels[0].state.val.x_axis.update_date_units([
      @date.RRuleDateTime::aware(@date.datetime(2024, 1, 1, offset_seconds=0)),
    ]),
  )
  ignore(panels[0].state.val.y_axis.update_category_units(["u", "v"]))
  panels[0].attach_line_with_originals(
    [
      @core.point(
        4671150630914490368UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
      ),
      @core.point(
        4671150871432658944UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ),
    ],
    LineOriginalCoordinate::Date([
      @date.RRuleDateTime::aware(
        @date.datetime(
          2024,
          1,
          1,
          hour=0,
          minute=0,
          second=0,
          microsecond=0,
          offset_seconds=0,
        ),
      ),
      @date.RRuleDateTime::aware(
        @date.datetime(
          2024,
          1,
          2,
          hour=0,
          minute=0,
          second=0,
          microsecond=0,
          offset_seconds=10800,
        ),
      ),
    ]),
    LineOriginalCoordinate::Category(["u", "v"]),
  )
  panels[0].state.val.raw_x_data = @core.limits(
    4671150630914490368UL.reinterpret_as_double(),
    4671150871432658944UL.reinterpret_as_double(),
  )
  panels[0].state.val.raw_y_data = @core.limits(
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_data_minpos = 4671150630914490368UL.reinterpret_as_double()
  panels[0].state.val.y_data_minpos = 4607182418800017408UL.reinterpret_as_double()
  panels[0].state.val.ignore_existing_data_limits = false
  panels[0].state.val.x_axis.clear_autoscale_request()
  panels[0].state.val.y_axis.clear_autoscale_request()
  assert_eq(
    panels[0].state.val.x_axis.unit_converter_kind(),
    Some("default_date"),
  )
  match panels[0].state.val.x_axis.unit_tag() {
    Some(@axis.AxisUnitTag::Date(zone)) =>
      assert_eq(zone.offset_seconds_at(0.0), 0)
    _ => fail("expected Date unit")
  }
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), false)
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).lower(),
    4671150630914490368UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).upper(),
    4671150871432658944UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=true),
    4671150630914490368UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.unit_converter_kind(), Some("category"))
  assert_eq(panels[0].state.val.y_axis.get_category_units().unwrap().labels(), [
    "u", "v",
  ])
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).lower(),
    0UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).upper(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=false),
    4607182418800017408UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].ignore_existing_data_limits(), false)
  assert_eq(panels[0].state.val.line_originals.length(), 1)
  line_units_ref_points(panels[0].state.val.line_originals[0].points, [
    [4671150630914490368UL.reinterpret_as_double(), 0UL.reinterpret_as_double()],
    [
      4671150871432658944UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ],
  ])
  match panels[0].state.val.artists[0] {
    Artist::Line(points, _) =>
      assert_true(
        physical_equal(points, panels[0].state.val.line_originals[0].points),
      )
    _ => fail("expected exact Line buffer")
  }
  match panels[0].state.val.line_originals[0].x {
    LineOriginalCoordinate::Date(values) => {
      assert_eq(values.length(), 2)
      assert_eq(values[0].is_naive(), false)
      assert_eq(
        [
          values[0].date().year(),
          values[0].date().month(),
          values[0].date().day(),
          values[0].date().hour(),
          values[0].date().minute(),
          values[0].date().second(),
          values[0].date().microsecond(),
          values[0].date().offset_seconds(),
        ],
        [2024, 1, 1, 0, 0, 0, 0, 0],
      )
      assert_eq(values[1].is_naive(), false)
      assert_eq(
        [
          values[1].date().year(),
          values[1].date().month(),
          values[1].date().day(),
          values[1].date().hour(),
          values[1].date().minute(),
          values[1].date().second(),
          values[1].date().microsecond(),
          values[1].date().offset_seconds(),
        ],
        [2024, 1, 2, 0, 0, 0, 0, 10800],
      )
    }
    _ => fail("expected Date original coordinate")
  }
  match panels[0].state.val.line_originals[0].y {
    LineOriginalCoordinate::Category(values) => assert_eq(values, ["u", "v"])
    _ => fail("expected Category original coordinate")
  }
  let replacement = @axis.CategoryUnits::new(["v", "u"])
  panels[0].set_y_units(Some(@axis.AxisUnitTag::Category(replacement)))
  assert_eq(
    panels[0].state.val.x_axis.unit_converter_kind(),
    Some("default_date"),
  )
  match panels[0].state.val.x_axis.unit_tag() {
    Some(@axis.AxisUnitTag::Date(zone)) =>
      assert_eq(zone.offset_seconds_at(0.0), 0)
    _ => fail("expected Date unit")
  }
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), false)
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).lower(),
    4671150630914490368UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).upper(),
    4671150871432658944UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=true),
    4671150630914490368UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.unit_converter_kind(), Some("category"))
  assert_eq(panels[0].state.val.y_axis.get_category_units().unwrap().labels(), [
    "v", "u",
  ])
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), true)
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).lower(),
    0UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).upper(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=false),
    4607182418800017408UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].ignore_existing_data_limits(), false)
  assert_eq(panels[0].state.val.line_originals.length(), 1)
  line_units_ref_points(panels[0].state.val.line_originals[0].points, [
    [
      4671150630914490368UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ],
    [4671150871432658944UL.reinterpret_as_double(), 0UL.reinterpret_as_double()],
  ])
  match panels[0].state.val.artists[0] {
    Artist::Line(points, _) =>
      assert_true(
        physical_equal(points, panels[0].state.val.line_originals[0].points),
      )
    _ => fail("expected exact Line buffer")
  }
  match panels[0].state.val.line_originals[0].x {
    LineOriginalCoordinate::Date(values) => {
      assert_eq(values.length(), 2)
      assert_eq(values[0].is_naive(), false)
      assert_eq(
        [
          values[0].date().year(),
          values[0].date().month(),
          values[0].date().day(),
          values[0].date().hour(),
          values[0].date().minute(),
          values[0].date().second(),
          values[0].date().microsecond(),
          values[0].date().offset_seconds(),
        ],
        [2024, 1, 1, 0, 0, 0, 0, 0],
      )
      assert_eq(values[1].is_naive(), false)
      assert_eq(
        [
          values[1].date().year(),
          values[1].date().month(),
          values[1].date().day(),
          values[1].date().hour(),
          values[1].date().minute(),
          values[1].date().second(),
          values[1].date().microsecond(),
          values[1].date().offset_seconds(),
        ],
        [2024, 1, 2, 0, 0, 0, 0, 10800],
      )
    }
    _ => fail("expected Date original coordinate")
  }
  match panels[0].state.val.line_originals[0].y {
    LineOriginalCoordinate::Category(values) => assert_eq(values, ["u", "v"])
    _ => fail("expected Category original coordinate")
  }
}

///|
fn line_units_source_case_17() -> Unit raise {
  let old_mode = @config.date_converter()
  let old_multiple = @config.date_interval_multiples()
  defer {
    @config.set_date_converter(old_mode)
    @config.set_date_interval_multiples(old_multiple)
  }
  @config.set_date_converter("auto")
  @config.set_date_interval_multiples(true)
  let figure = figure()
  let panels = [figure.axes()]
  ignore(
    panels[0].state.val.x_axis.update_date_units([
      @date.RRuleDateTime::aware(@date.datetime(2024, 1, 1, offset_seconds=0)),
    ]),
  )
  ignore(panels[0].state.val.y_axis.update_category_units(["v", "u"]))
  panels[0].attach_line_with_originals(
    [
      @core.point(
        4671150630914490368UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ),
      @core.point(
        4671150871432658944UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
      ),
    ],
    LineOriginalCoordinate::Date([
      @date.RRuleDateTime::aware(
        @date.datetime(
          2024,
          1,
          1,
          hour=0,
          minute=0,
          second=0,
          microsecond=0,
          offset_seconds=0,
        ),
      ),
      @date.RRuleDateTime::aware(
        @date.datetime(
          2024,
          1,
          2,
          hour=0,
          minute=0,
          second=0,
          microsecond=0,
          offset_seconds=10800,
        ),
      ),
    ]),
    LineOriginalCoordinate::Category(["u", "v"]),
  )
  panels[0].state.val.raw_x_data = @core.limits(
    4671150630914490368UL.reinterpret_as_double(),
    4671150871432658944UL.reinterpret_as_double(),
  )
  panels[0].state.val.raw_y_data = @core.limits(
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_data_minpos = 4671150630914490368UL.reinterpret_as_double()
  panels[0].state.val.y_data_minpos = 4607182418800017408UL.reinterpret_as_double()
  panels[0].state.val.ignore_existing_data_limits = false
  panels[0].state.val.x_axis.clear_autoscale_request()
  panels[0].state.val.y_axis.clear_autoscale_request()
  panels[0].state.val.y_axis.request_autoscale()
  assert_eq(
    panels[0].state.val.x_axis.unit_converter_kind(),
    Some("default_date"),
  )
  match panels[0].state.val.x_axis.unit_tag() {
    Some(@axis.AxisUnitTag::Date(zone)) =>
      assert_eq(zone.offset_seconds_at(0.0), 0)
    _ => fail("expected Date unit")
  }
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), false)
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).lower(),
    4671150630914490368UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).upper(),
    4671150871432658944UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=true),
    4671150630914490368UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.unit_converter_kind(), Some("category"))
  assert_eq(panels[0].state.val.y_axis.get_category_units().unwrap().labels(), [
    "v", "u",
  ])
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), true)
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).lower(),
    0UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).upper(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=false),
    4607182418800017408UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].ignore_existing_data_limits(), false)
  assert_eq(panels[0].state.val.line_originals.length(), 1)
  line_units_ref_points(panels[0].state.val.line_originals[0].points, [
    [
      4671150630914490368UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ],
    [4671150871432658944UL.reinterpret_as_double(), 0UL.reinterpret_as_double()],
  ])
  match panels[0].state.val.artists[0] {
    Artist::Line(points, _) =>
      assert_true(
        physical_equal(points, panels[0].state.val.line_originals[0].points),
      )
    _ => fail("expected exact Line buffer")
  }
  match panels[0].state.val.line_originals[0].x {
    LineOriginalCoordinate::Date(values) => {
      assert_eq(values.length(), 2)
      assert_eq(values[0].is_naive(), false)
      assert_eq(
        [
          values[0].date().year(),
          values[0].date().month(),
          values[0].date().day(),
          values[0].date().hour(),
          values[0].date().minute(),
          values[0].date().second(),
          values[0].date().microsecond(),
          values[0].date().offset_seconds(),
        ],
        [2024, 1, 1, 0, 0, 0, 0, 0],
      )
      assert_eq(values[1].is_naive(), false)
      assert_eq(
        [
          values[1].date().year(),
          values[1].date().month(),
          values[1].date().day(),
          values[1].date().hour(),
          values[1].date().minute(),
          values[1].date().second(),
          values[1].date().microsecond(),
          values[1].date().offset_seconds(),
        ],
        [2024, 1, 2, 0, 0, 0, 0, 10800],
      )
    }
    _ => fail("expected Date original coordinate")
  }
  match panels[0].state.val.line_originals[0].y {
    LineOriginalCoordinate::Category(values) => assert_eq(values, ["u", "v"])
    _ => fail("expected Category original coordinate")
  }
  panels[0].set_x_units(
    Some(@axis.AxisUnitTag::Date(@date.fixed_timezone_seconds(21600))),
  )
  assert_eq(
    panels[0].state.val.x_axis.unit_converter_kind(),
    Some("default_date"),
  )
  match panels[0].state.val.x_axis.unit_tag() {
    Some(@axis.AxisUnitTag::Date(zone)) =>
      assert_eq(zone.offset_seconds_at(0.0), 21600)
    _ => fail("expected Date unit")
  }
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), true)
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).lower(),
    4671150630914490368UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).upper(),
    4671150871432658944UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=true),
    4671150630914490368UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.unit_converter_kind(), Some("category"))
  assert_eq(panels[0].state.val.y_axis.get_category_units().unwrap().labels(), [
    "v", "u",
  ])
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), true)
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).lower(),
    0UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).upper(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=false),
    4607182418800017408UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].ignore_existing_data_limits(), false)
  assert_eq(panels[0].state.val.line_originals.length(), 1)
  line_units_ref_points(panels[0].state.val.line_originals[0].points, [
    [
      4671150630914490368UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ],
    [4671150871432658944UL.reinterpret_as_double(), 0UL.reinterpret_as_double()],
  ])
  match panels[0].state.val.artists[0] {
    Artist::Line(points, _) =>
      assert_true(
        physical_equal(points, panels[0].state.val.line_originals[0].points),
      )
    _ => fail("expected exact Line buffer")
  }
  match panels[0].state.val.line_originals[0].x {
    LineOriginalCoordinate::Date(values) => {
      assert_eq(values.length(), 2)
      assert_eq(values[0].is_naive(), false)
      assert_eq(
        [
          values[0].date().year(),
          values[0].date().month(),
          values[0].date().day(),
          values[0].date().hour(),
          values[0].date().minute(),
          values[0].date().second(),
          values[0].date().microsecond(),
          values[0].date().offset_seconds(),
        ],
        [2024, 1, 1, 0, 0, 0, 0, 0],
      )
      assert_eq(values[1].is_naive(), false)
      assert_eq(
        [
          values[1].date().year(),
          values[1].date().month(),
          values[1].date().day(),
          values[1].date().hour(),
          values[1].date().minute(),
          values[1].date().second(),
          values[1].date().microsecond(),
          values[1].date().offset_seconds(),
        ],
        [2024, 1, 2, 0, 0, 0, 0, 10800],
      )
    }
    _ => fail("expected Date original coordinate")
  }
  match panels[0].state.val.line_originals[0].y {
    LineOriginalCoordinate::Category(values) => assert_eq(values, ["u", "v"])
    _ => fail("expected Category original coordinate")
  }
}

///|
fn line_units_source_case_18() -> Unit raise {
  let old_mode = @config.date_converter()
  let old_multiple = @config.date_interval_multiples()
  defer {
    @config.set_date_converter(old_mode)
    @config.set_date_interval_multiples(old_multiple)
  }
  @config.set_date_converter("auto")
  @config.set_date_interval_multiples(true)
  let figure = figure()
  let panels = figure.subplots(1, 2, share_x=true)
  ignore(panels[0].state.val.x_axis.update_category_units(["a", "b"]))
  ignore(panels[1].state.val.x_axis.convert_category_units(["a", "b"]))
  panels[0].attach_line_with_originals(
    [
      @core.point(
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
      ),
      @core.point(
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ),
    ],
    LineOriginalCoordinate::Category(["a", "b"]),
    LineOriginalCoordinate::Numeric([
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ]),
  )
  panels[0].state.val.raw_x_data = @core.limits(
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  panels[0].state.val.raw_y_data = @core.limits(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_data_minpos = 4607182418800017408UL.reinterpret_as_double()
  panels[0].state.val.y_data_minpos = 4621819117588971520UL.reinterpret_as_double()
  panels[0].state.val.ignore_existing_data_limits = false
  panels[0].state.val.x_axis.clear_autoscale_request()
  panels[0].state.val.y_axis.clear_autoscale_request()
  assert_eq(panels[0].state.val.x_axis.unit_converter_kind(), Some("category"))
  assert_eq(panels[0].state.val.x_axis.get_category_units().unwrap().labels(), [
    "a", "b",
  ])
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), false)
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).lower(),
    0UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).upper(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=true),
    4607182418800017408UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.unit_converter_kind(), None)
  assert_true(panels[0].state.val.y_axis.unit_tag() is None)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).lower(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).upper(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=false),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].ignore_existing_data_limits(), false)
  assert_eq(panels[0].state.val.line_originals.length(), 1)
  line_units_ref_points(panels[0].state.val.line_originals[0].points, [
    [0UL.reinterpret_as_double(), 4621819117588971520UL.reinterpret_as_double()],
    [
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ],
  ])
  match panels[0].state.val.artists[0] {
    Artist::Line(points, _) =>
      assert_true(
        physical_equal(points, panels[0].state.val.line_originals[0].points),
      )
    _ => fail("expected exact Line buffer")
  }
  match panels[0].state.val.line_originals[0].x {
    LineOriginalCoordinate::Category(values) => assert_eq(values, ["a", "b"])
    _ => fail("expected Category original coordinate")
  }
  match panels[0].state.val.line_originals[0].y {
    LineOriginalCoordinate::Numeric(values) =>
      line_units_ref_numbers(values, [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ])
    _ => fail("expected Numeric original coordinate")
  }
  panels[1].attach_line_with_originals(
    [
      @core.point(
        4607182418800017408UL.reinterpret_as_double(),
        4629137466983448576UL.reinterpret_as_double(),
      ),
      @core.point(
        0UL.reinterpret_as_double(),
        4630826316843712512UL.reinterpret_as_double(),
      ),
    ],
    LineOriginalCoordinate::Category(["b", "a"]),
    LineOriginalCoordinate::Numeric([
      4629137466983448576UL.reinterpret_as_double(),
      4630826316843712512UL.reinterpret_as_double(),
    ]),
  )
  panels[1].state.val.raw_x_data = @core.limits(
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  panels[1].state.val.raw_y_data = @core.limits(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  panels[1].state.val.x_data_minpos = 4607182418800017408UL.reinterpret_as_double()
  panels[1].state.val.y_data_minpos = 4629137466983448576UL.reinterpret_as_double()
  panels[1].state.val.ignore_existing_data_limits = false
  panels[1].state.val.x_axis.clear_autoscale_request()
  panels[1].state.val.y_axis.clear_autoscale_request()
  assert_eq(panels[1].state.val.x_axis.unit_converter_kind(), Some("category"))
  assert_eq(panels[1].state.val.x_axis.get_category_units().unwrap().labels(), [
    "a", "b",
  ])
  assert_eq(panels[1].state.val.x_axis.autoscale_stale(), false)
  line_units_ref_double(
    panels[1].data_limits(horizontal=true).lower(),
    0UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[1].data_limits(horizontal=true).upper(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[1].data_minpos(horizontal=true),
    4607182418800017408UL.reinterpret_as_double(),
  )
  assert_eq(panels[1].state.val.y_axis.unit_converter_kind(), None)
  assert_true(panels[1].state.val.y_axis.unit_tag() is None)
  assert_eq(panels[1].state.val.y_axis.autoscale_stale(), false)
  line_units_ref_double(
    panels[1].data_limits(horizontal=false).lower(),
    4629137466983448576UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[1].data_limits(horizontal=false).upper(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[1].data_minpos(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
  )
  assert_eq(panels[1].ignore_existing_data_limits(), false)
  assert_eq(panels[1].state.val.line_originals.length(), 1)
  line_units_ref_points(panels[1].state.val.line_originals[0].points, [
    [
      4607182418800017408UL.reinterpret_as_double(),
      4629137466983448576UL.reinterpret_as_double(),
    ],
    [0UL.reinterpret_as_double(), 4630826316843712512UL.reinterpret_as_double()],
  ])
  match panels[1].state.val.artists[0] {
    Artist::Line(points, _) =>
      assert_true(
        physical_equal(points, panels[1].state.val.line_originals[0].points),
      )
    _ => fail("expected exact Line buffer")
  }
  match panels[1].state.val.line_originals[0].x {
    LineOriginalCoordinate::Category(values) => assert_eq(values, ["b", "a"])
    _ => fail("expected Category original coordinate")
  }
  match panels[1].state.val.line_originals[0].y {
    LineOriginalCoordinate::Numeric(values) =>
      line_units_ref_numbers(values, [
        4629137466983448576UL.reinterpret_as_double(),
        4630826316843712512UL.reinterpret_as_double(),
      ])
    _ => fail("expected Numeric original coordinate")
  }
  let replacement = @axis.CategoryUnits::new(["z", "b"])
  panels[0].set_x_units(Some(@axis.AxisUnitTag::Category(replacement)))
  assert_eq(panels[0].state.val.x_axis.unit_converter_kind(), Some("category"))
  assert_eq(panels[0].state.val.x_axis.get_category_units().unwrap().labels(), [
    "z", "b", "a",
  ])
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), true)
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).lower(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).upper(),
    4611686018427387904UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=true),
    4607182418800017408UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.unit_converter_kind(), None)
  assert_true(panels[0].state.val.y_axis.unit_tag() is None)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).lower(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).upper(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=false),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].ignore_existing_data_limits(), false)
  assert_eq(panels[0].state.val.line_originals.length(), 1)
  line_units_ref_points(panels[0].state.val.line_originals[0].points, [
    [
      4611686018427387904UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
    ],
    [
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ],
  ])
  match panels[0].state.val.artists[0] {
    Artist::Line(points, _) =>
      assert_true(
        physical_equal(points, panels[0].state.val.line_originals[0].points),
      )
    _ => fail("expected exact Line buffer")
  }
  match panels[0].state.val.line_originals[0].x {
    LineOriginalCoordinate::Category(values) => assert_eq(values, ["a", "b"])
    _ => fail("expected Category original coordinate")
  }
  match panels[0].state.val.line_originals[0].y {
    LineOriginalCoordinate::Numeric(values) =>
      line_units_ref_numbers(values, [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ])
    _ => fail("expected Numeric original coordinate")
  }
  assert_eq(panels[1].state.val.x_axis.unit_converter_kind(), Some("category"))
  assert_eq(panels[1].state.val.x_axis.get_category_units().unwrap().labels(), [
    "z", "b", "a",
  ])
  assert_eq(panels[1].state.val.x_axis.autoscale_stale(), true)
  line_units_ref_double(
    panels[1].data_limits(horizontal=true).lower(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[1].data_limits(horizontal=true).upper(),
    4611686018427387904UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[1].data_minpos(horizontal=true),
    4607182418800017408UL.reinterpret_as_double(),
  )
  assert_eq(panels[1].state.val.y_axis.unit_converter_kind(), None)
  assert_true(panels[1].state.val.y_axis.unit_tag() is None)
  assert_eq(panels[1].state.val.y_axis.autoscale_stale(), false)
  line_units_ref_double(
    panels[1].data_limits(horizontal=false).lower(),
    4629137466983448576UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[1].data_limits(horizontal=false).upper(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[1].data_minpos(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
  )
  assert_eq(panels[1].ignore_existing_data_limits(), false)
  assert_eq(panels[1].state.val.line_originals.length(), 1)
  line_units_ref_points(panels[1].state.val.line_originals[0].points, [
    [
      4607182418800017408UL.reinterpret_as_double(),
      4629137466983448576UL.reinterpret_as_double(),
    ],
    [
      4611686018427387904UL.reinterpret_as_double(),
      4630826316843712512UL.reinterpret_as_double(),
    ],
  ])
  match panels[1].state.val.artists[0] {
    Artist::Line(points, _) =>
      assert_true(
        physical_equal(points, panels[1].state.val.line_originals[0].points),
      )
    _ => fail("expected exact Line buffer")
  }
  match panels[1].state.val.line_originals[0].x {
    LineOriginalCoordinate::Category(values) => assert_eq(values, ["b", "a"])
    _ => fail("expected Category original coordinate")
  }
  match panels[1].state.val.line_originals[0].y {
    LineOriginalCoordinate::Numeric(values) =>
      line_units_ref_numbers(values, [
        4629137466983448576UL.reinterpret_as_double(),
        4630826316843712512UL.reinterpret_as_double(),
      ])
    _ => fail("expected Numeric original coordinate")
  }
  assert_eq(
    physical_equal(
      panels[0].state.val.x_axis.get_category_units().unwrap(),
      panels[1].state.val.x_axis.get_category_units().unwrap(),
    ),
    true,
  )
}

///|
fn line_units_source_case_19() -> Unit raise {
  let old_mode = @config.date_converter()
  let old_multiple = @config.date_interval_multiples()
  defer {
    @config.set_date_converter(old_mode)
    @config.set_date_interval_multiples(old_multiple)
  }
  @config.set_date_converter("auto")
  @config.set_date_interval_multiples(true)
  let figure = figure()
  let panels = figure.subplots(1, 2, share_x=true)
  ignore(panels[0].state.val.x_axis.update_category_units(["a", "b"]))
  ignore(panels[1].state.val.x_axis.convert_category_units(["a", "b"]))
  panels[0].attach_line_with_originals(
    [
      @core.point(
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
      ),
      @core.point(
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ),
    ],
    LineOriginalCoordinate::Category(["a", "b"]),
    LineOriginalCoordinate::Category(["bad", "data"]),
  )
  panels[0].state.val.raw_x_data = @core.limits(
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  panels[0].state.val.raw_y_data = @core.limits(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_data_minpos = 4607182418800017408UL.reinterpret_as_double()
  panels[0].state.val.y_data_minpos = 4621819117588971520UL.reinterpret_as_double()
  panels[0].state.val.ignore_existing_data_limits = false
  panels[0].state.val.x_axis.clear_autoscale_request()
  panels[0].state.val.y_axis.clear_autoscale_request()
  assert_eq(panels[0].state.val.x_axis.unit_converter_kind(), Some("category"))
  assert_eq(panels[0].state.val.x_axis.get_category_units().unwrap().labels(), [
    "a", "b",
  ])
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), false)
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).lower(),
    0UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).upper(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=true),
    4607182418800017408UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.unit_converter_kind(), None)
  assert_true(panels[0].state.val.y_axis.unit_tag() is None)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).lower(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).upper(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=false),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].ignore_existing_data_limits(), false)
  assert_eq(panels[0].state.val.line_originals.length(), 1)
  line_units_ref_points(panels[0].state.val.line_originals[0].points, [
    [0UL.reinterpret_as_double(), 4621819117588971520UL.reinterpret_as_double()],
    [
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ],
  ])
  match panels[0].state.val.artists[0] {
    Artist::Line(points, _) =>
      assert_true(
        physical_equal(points, panels[0].state.val.line_originals[0].points),
      )
    _ => fail("expected exact Line buffer")
  }
  match panels[0].state.val.line_originals[0].x {
    LineOriginalCoordinate::Category(values) => assert_eq(values, ["a", "b"])
    _ => fail("expected Category original coordinate")
  }
  match panels[0].state.val.line_originals[0].y {
    LineOriginalCoordinate::Category(values) =>
      assert_eq(values, ["bad", "data"])
    _ => fail("expected Category original coordinate")
  }
  panels[1].attach_line_with_originals(
    [
      @core.point(
        4607182418800017408UL.reinterpret_as_double(),
        4629137466983448576UL.reinterpret_as_double(),
      ),
      @core.point(
        0UL.reinterpret_as_double(),
        4630826316843712512UL.reinterpret_as_double(),
      ),
    ],
    LineOriginalCoordinate::Category(["b", "a"]),
    LineOriginalCoordinate::Numeric([
      4629137466983448576UL.reinterpret_as_double(),
      4630826316843712512UL.reinterpret_as_double(),
    ]),
  )
  panels[1].state.val.raw_x_data = @core.limits(
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  panels[1].state.val.raw_y_data = @core.limits(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  panels[1].state.val.x_data_minpos = 4607182418800017408UL.reinterpret_as_double()
  panels[1].state.val.y_data_minpos = 4629137466983448576UL.reinterpret_as_double()
  panels[1].state.val.ignore_existing_data_limits = false
  panels[1].state.val.x_axis.clear_autoscale_request()
  panels[1].state.val.y_axis.clear_autoscale_request()
  assert_eq(panels[1].state.val.x_axis.unit_converter_kind(), Some("category"))
  assert_eq(panels[1].state.val.x_axis.get_category_units().unwrap().labels(), [
    "a", "b",
  ])
  assert_eq(panels[1].state.val.x_axis.autoscale_stale(), false)
  line_units_ref_double(
    panels[1].data_limits(horizontal=true).lower(),
    0UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[1].data_limits(horizontal=true).upper(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[1].data_minpos(horizontal=true),
    4607182418800017408UL.reinterpret_as_double(),
  )
  assert_eq(panels[1].state.val.y_axis.unit_converter_kind(), None)
  assert_true(panels[1].state.val.y_axis.unit_tag() is None)
  assert_eq(panels[1].state.val.y_axis.autoscale_stale(), false)
  line_units_ref_double(
    panels[1].data_limits(horizontal=false).lower(),
    4629137466983448576UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[1].data_limits(horizontal=false).upper(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[1].data_minpos(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
  )
  assert_eq(panels[1].ignore_existing_data_limits(), false)
  assert_eq(panels[1].state.val.line_originals.length(), 1)
  line_units_ref_points(panels[1].state.val.line_originals[0].points, [
    [
      4607182418800017408UL.reinterpret_as_double(),
      4629137466983448576UL.reinterpret_as_double(),
    ],
    [0UL.reinterpret_as_double(), 4630826316843712512UL.reinterpret_as_double()],
  ])
  match panels[1].state.val.artists[0] {
    Artist::Line(points, _) =>
      assert_true(
        physical_equal(points, panels[1].state.val.line_originals[0].points),
      )
    _ => fail("expected exact Line buffer")
  }
  match panels[1].state.val.line_originals[0].x {
    LineOriginalCoordinate::Category(values) => assert_eq(values, ["b", "a"])
    _ => fail("expected Category original coordinate")
  }
  match panels[1].state.val.line_originals[0].y {
    LineOriginalCoordinate::Numeric(values) =>
      line_units_ref_numbers(values, [
        4629137466983448576UL.reinterpret_as_double(),
        4630826316843712512UL.reinterpret_as_double(),
      ])
    _ => fail("expected Numeric original coordinate")
  }
  let replacement = @axis.CategoryUnits::new(["z", "b"])
  let failed = try {
    panels[0].set_x_units(Some(@axis.AxisUnitTag::Category(replacement)))
    false
  } catch {
    @core.DataError::InvalidTicks(_) => true
    _ => false
  }
  assert_true(failed)
  assert_eq(panels[0].state.val.x_axis.unit_converter_kind(), Some("category"))
  assert_eq(panels[0].state.val.x_axis.get_category_units().unwrap().labels(), [
    "z", "b", "a",
  ])
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), false)
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).lower(),
    0UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).upper(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=true),
    4607182418800017408UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.unit_converter_kind(), Some("category"))
  assert_true(panels[0].state.val.y_axis.unit_tag() is None)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).lower(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).upper(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=false),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].ignore_existing_data_limits(), false)
  assert_eq(panels[0].state.val.line_originals.length(), 1)
  line_units_ref_points(panels[0].state.val.line_originals[0].points, [
    [0UL.reinterpret_as_double(), 4621819117588971520UL.reinterpret_as_double()],
    [
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ],
  ])
  match panels[0].state.val.artists[0] {
    Artist::Line(points, _) =>
      assert_true(
        physical_equal(points, panels[0].state.val.line_originals[0].points),
      )
    _ => fail("expected exact Line buffer")
  }
  match panels[0].state.val.line_originals[0].x {
    LineOriginalCoordinate::Category(values) => assert_eq(values, ["a", "b"])
    _ => fail("expected Category original coordinate")
  }
  match panels[0].state.val.line_originals[0].y {
    LineOriginalCoordinate::Category(values) =>
      assert_eq(values, ["bad", "data"])
    _ => fail("expected Category original coordinate")
  }
  assert_eq(panels[1].state.val.x_axis.unit_converter_kind(), Some("category"))
  assert_eq(panels[1].state.val.x_axis.get_category_units().unwrap().labels(), [
    "z", "b", "a",
  ])
  assert_eq(panels[1].state.val.x_axis.autoscale_stale(), true)
  line_units_ref_double(
    panels[1].data_limits(horizontal=true).lower(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[1].data_limits(horizontal=true).upper(),
    4611686018427387904UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[1].data_minpos(horizontal=true),
    4607182418800017408UL.reinterpret_as_double(),
  )
  assert_eq(panels[1].state.val.y_axis.unit_converter_kind(), None)
  assert_true(panels[1].state.val.y_axis.unit_tag() is None)
  assert_eq(panels[1].state.val.y_axis.autoscale_stale(), false)
  line_units_ref_double(
    panels[1].data_limits(horizontal=false).lower(),
    4629137466983448576UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[1].data_limits(horizontal=false).upper(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[1].data_minpos(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
  )
  assert_eq(panels[1].ignore_existing_data_limits(), false)
  assert_eq(panels[1].state.val.line_originals.length(), 1)
  line_units_ref_points(panels[1].state.val.line_originals[0].points, [
    [
      4607182418800017408UL.reinterpret_as_double(),
      4629137466983448576UL.reinterpret_as_double(),
    ],
    [
      4611686018427387904UL.reinterpret_as_double(),
      4630826316843712512UL.reinterpret_as_double(),
    ],
  ])
  match panels[1].state.val.artists[0] {
    Artist::Line(points, _) =>
      assert_true(
        physical_equal(points, panels[1].state.val.line_originals[0].points),
      )
    _ => fail("expected exact Line buffer")
  }
  match panels[1].state.val.line_originals[0].x {
    LineOriginalCoordinate::Category(values) => assert_eq(values, ["b", "a"])
    _ => fail("expected Category original coordinate")
  }
  match panels[1].state.val.line_originals[0].y {
    LineOriginalCoordinate::Numeric(values) =>
      line_units_ref_numbers(values, [
        4629137466983448576UL.reinterpret_as_double(),
        4630826316843712512UL.reinterpret_as_double(),
      ])
    _ => fail("expected Numeric original coordinate")
  }
  assert_eq(
    physical_equal(
      panels[0].state.val.x_axis.get_category_units().unwrap(),
      panels[1].state.val.x_axis.get_category_units().unwrap(),
    ),
    true,
  )
}

///|
fn line_units_source_case_20() -> Unit raise {
  let old_mode = @config.date_converter()
  let old_multiple = @config.date_interval_multiples()
  defer {
    @config.set_date_converter(old_mode)
    @config.set_date_interval_multiples(old_multiple)
  }
  @config.set_date_converter("auto")
  @config.set_date_interval_multiples(true)
  let figure = figure()
  let panels = figure.subplots(1, 2, share_x=true)
  ignore(panels[0].state.val.x_axis.update_category_units(["a", "b"]))
  ignore(panels[1].state.val.x_axis.convert_category_units(["a", "b"]))
  panels[0].attach_line_with_originals(
    [
      @core.point(
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
      ),
      @core.point(
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ),
    ],
    LineOriginalCoordinate::Category(["a", "b"]),
    LineOriginalCoordinate::Numeric([
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ]),
  )
  panels[0].state.val.raw_x_data = @core.limits(
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  panels[0].state.val.raw_y_data = @core.limits(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_data_minpos = 4607182418800017408UL.reinterpret_as_double()
  panels[0].state.val.y_data_minpos = 4621819117588971520UL.reinterpret_as_double()
  panels[0].state.val.ignore_existing_data_limits = false
  panels[0].state.val.x_axis.clear_autoscale_request()
  panels[0].state.val.y_axis.clear_autoscale_request()
  assert_eq(panels[0].state.val.x_axis.unit_converter_kind(), Some("category"))
  assert_eq(panels[0].state.val.x_axis.get_category_units().unwrap().labels(), [
    "a", "b",
  ])
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), false)
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).lower(),
    0UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).upper(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=true),
    4607182418800017408UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.unit_converter_kind(), None)
  assert_true(panels[0].state.val.y_axis.unit_tag() is None)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).lower(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).upper(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=false),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].ignore_existing_data_limits(), false)
  assert_eq(panels[0].state.val.line_originals.length(), 1)
  line_units_ref_points(panels[0].state.val.line_originals[0].points, [
    [0UL.reinterpret_as_double(), 4621819117588971520UL.reinterpret_as_double()],
    [
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ],
  ])
  match panels[0].state.val.artists[0] {
    Artist::Line(points, _) =>
      assert_true(
        physical_equal(points, panels[0].state.val.line_originals[0].points),
      )
    _ => fail("expected exact Line buffer")
  }
  match panels[0].state.val.line_originals[0].x {
    LineOriginalCoordinate::Category(values) => assert_eq(values, ["a", "b"])
    _ => fail("expected Category original coordinate")
  }
  match panels[0].state.val.line_originals[0].y {
    LineOriginalCoordinate::Numeric(values) =>
      line_units_ref_numbers(values, [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ])
    _ => fail("expected Numeric original coordinate")
  }
  panels[1].attach_line_with_originals(
    [
      @core.point(
        4607182418800017408UL.reinterpret_as_double(),
        4629137466983448576UL.reinterpret_as_double(),
      ),
      @core.point(
        0UL.reinterpret_as_double(),
        4630826316843712512UL.reinterpret_as_double(),
      ),
    ],
    LineOriginalCoordinate::Category(["b", "a"]),
    LineOriginalCoordinate::Category(["bad", "data"]),
  )
  panels[1].state.val.raw_x_data = @core.limits(
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  panels[1].state.val.raw_y_data = @core.limits(
    4629137466983448576UL.reinterpret_as_double(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  panels[1].state.val.x_data_minpos = 4607182418800017408UL.reinterpret_as_double()
  panels[1].state.val.y_data_minpos = 4629137466983448576UL.reinterpret_as_double()
  panels[1].state.val.ignore_existing_data_limits = false
  panels[1].state.val.x_axis.clear_autoscale_request()
  panels[1].state.val.y_axis.clear_autoscale_request()
  assert_eq(panels[1].state.val.x_axis.unit_converter_kind(), Some("category"))
  assert_eq(panels[1].state.val.x_axis.get_category_units().unwrap().labels(), [
    "a", "b",
  ])
  assert_eq(panels[1].state.val.x_axis.autoscale_stale(), false)
  line_units_ref_double(
    panels[1].data_limits(horizontal=true).lower(),
    0UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[1].data_limits(horizontal=true).upper(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[1].data_minpos(horizontal=true),
    4607182418800017408UL.reinterpret_as_double(),
  )
  assert_eq(panels[1].state.val.y_axis.unit_converter_kind(), None)
  assert_true(panels[1].state.val.y_axis.unit_tag() is None)
  assert_eq(panels[1].state.val.y_axis.autoscale_stale(), false)
  line_units_ref_double(
    panels[1].data_limits(horizontal=false).lower(),
    4629137466983448576UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[1].data_limits(horizontal=false).upper(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[1].data_minpos(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
  )
  assert_eq(panels[1].ignore_existing_data_limits(), false)
  assert_eq(panels[1].state.val.line_originals.length(), 1)
  line_units_ref_points(panels[1].state.val.line_originals[0].points, [
    [
      4607182418800017408UL.reinterpret_as_double(),
      4629137466983448576UL.reinterpret_as_double(),
    ],
    [0UL.reinterpret_as_double(), 4630826316843712512UL.reinterpret_as_double()],
  ])
  match panels[1].state.val.artists[0] {
    Artist::Line(points, _) =>
      assert_true(
        physical_equal(points, panels[1].state.val.line_originals[0].points),
      )
    _ => fail("expected exact Line buffer")
  }
  match panels[1].state.val.line_originals[0].x {
    LineOriginalCoordinate::Category(values) => assert_eq(values, ["b", "a"])
    _ => fail("expected Category original coordinate")
  }
  match panels[1].state.val.line_originals[0].y {
    LineOriginalCoordinate::Category(values) =>
      assert_eq(values, ["bad", "data"])
    _ => fail("expected Category original coordinate")
  }
  let replacement = @axis.CategoryUnits::new(["z", "b"])
  let failed = try {
    panels[0].set_x_units(Some(@axis.AxisUnitTag::Category(replacement)))
    false
  } catch {
    @core.DataError::InvalidTicks(_) => true
    _ => false
  }
  assert_true(failed)
  assert_eq(panels[0].state.val.x_axis.unit_converter_kind(), Some("category"))
  assert_eq(panels[0].state.val.x_axis.get_category_units().unwrap().labels(), [
    "a", "b",
  ])
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), false)
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).lower(),
    0UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).upper(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=true),
    4607182418800017408UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.unit_converter_kind(), None)
  assert_true(panels[0].state.val.y_axis.unit_tag() is None)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).lower(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).upper(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=false),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].ignore_existing_data_limits(), false)
  assert_eq(panels[0].state.val.line_originals.length(), 1)
  line_units_ref_points(panels[0].state.val.line_originals[0].points, [
    [0UL.reinterpret_as_double(), 4621819117588971520UL.reinterpret_as_double()],
    [
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ],
  ])
  match panels[0].state.val.artists[0] {
    Artist::Line(points, _) =>
      assert_true(
        physical_equal(points, panels[0].state.val.line_originals[0].points),
      )
    _ => fail("expected exact Line buffer")
  }
  match panels[0].state.val.line_originals[0].x {
    LineOriginalCoordinate::Category(values) => assert_eq(values, ["a", "b"])
    _ => fail("expected Category original coordinate")
  }
  match panels[0].state.val.line_originals[0].y {
    LineOriginalCoordinate::Numeric(values) =>
      line_units_ref_numbers(values, [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ])
    _ => fail("expected Numeric original coordinate")
  }
  assert_eq(panels[1].state.val.x_axis.unit_converter_kind(), Some("category"))
  assert_eq(panels[1].state.val.x_axis.get_category_units().unwrap().labels(), [
    "z", "b", "a",
  ])
  assert_eq(panels[1].state.val.x_axis.autoscale_stale(), false)
  line_units_ref_double(
    panels[1].data_limits(horizontal=true).lower(),
    0UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[1].data_limits(horizontal=true).upper(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[1].data_minpos(horizontal=true),
    4607182418800017408UL.reinterpret_as_double(),
  )
  assert_eq(panels[1].state.val.y_axis.unit_converter_kind(), Some("category"))
  assert_true(panels[1].state.val.y_axis.unit_tag() is None)
  assert_eq(panels[1].state.val.y_axis.autoscale_stale(), false)
  line_units_ref_double(
    panels[1].data_limits(horizontal=false).lower(),
    4629137466983448576UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[1].data_limits(horizontal=false).upper(),
    4630826316843712512UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[1].data_minpos(horizontal=false),
    4629137466983448576UL.reinterpret_as_double(),
  )
  assert_eq(panels[1].ignore_existing_data_limits(), false)
  assert_eq(panels[1].state.val.line_originals.length(), 1)
  line_units_ref_points(panels[1].state.val.line_originals[0].points, [
    [
      4607182418800017408UL.reinterpret_as_double(),
      4629137466983448576UL.reinterpret_as_double(),
    ],
    [0UL.reinterpret_as_double(), 4630826316843712512UL.reinterpret_as_double()],
  ])
  match panels[1].state.val.artists[0] {
    Artist::Line(points, _) =>
      assert_true(
        physical_equal(points, panels[1].state.val.line_originals[0].points),
      )
    _ => fail("expected exact Line buffer")
  }
  match panels[1].state.val.line_originals[0].x {
    LineOriginalCoordinate::Category(values) => assert_eq(values, ["b", "a"])
    _ => fail("expected Category original coordinate")
  }
  match panels[1].state.val.line_originals[0].y {
    LineOriginalCoordinate::Category(values) =>
      assert_eq(values, ["bad", "data"])
    _ => fail("expected Category original coordinate")
  }
  assert_eq(
    physical_equal(
      panels[0].state.val.x_axis.get_category_units().unwrap(),
      panels[1].state.val.x_axis.get_category_units().unwrap(),
    ),
    false,
  )
}

///|
fn line_units_source_case_21() -> Unit raise {
  let old_mode = @config.date_converter()
  let old_multiple = @config.date_interval_multiples()
  defer {
    @config.set_date_converter(old_mode)
    @config.set_date_interval_multiples(old_multiple)
  }
  @config.set_date_converter("auto")
  @config.set_date_interval_multiples(true)
  let figure = figure()
  let panels = [figure.axes()]
  ignore(panels[0].state.val.x_axis.update_category_units(["a", "b"]))
  panels[0].attach_line_with_originals(
    [],
    LineOriginalCoordinate::Category([]),
    LineOriginalCoordinate::Numeric([
      4607182418800017408UL.reinterpret_as_double(),
    ]),
  )
  panels[0].state.val.raw_x_data = @core.limits(
    9218868437227405312UL.reinterpret_as_double(),
    18442240474082181120UL.reinterpret_as_double(),
  )
  panels[0].state.val.raw_y_data = @core.limits(
    9218868437227405312UL.reinterpret_as_double(),
    18442240474082181120UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_data_minpos = 9218868437227405312UL.reinterpret_as_double()
  panels[0].state.val.y_data_minpos = 9218868437227405312UL.reinterpret_as_double()
  panels[0].state.val.ignore_existing_data_limits = true
  panels[0].state.val.x_axis.clear_autoscale_request()
  panels[0].state.val.y_axis.clear_autoscale_request()
  assert_eq(panels[0].state.val.x_axis.unit_converter_kind(), Some("category"))
  assert_eq(panels[0].state.val.x_axis.get_category_units().unwrap().labels(), [
    "a", "b",
  ])
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), false)
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).lower(),
    9218868437227405312UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).upper(),
    18442240474082181120UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=true),
    9218868437227405312UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.unit_converter_kind(), None)
  assert_true(panels[0].state.val.y_axis.unit_tag() is None)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).lower(),
    9218868437227405312UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).upper(),
    18442240474082181120UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=false),
    9218868437227405312UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].ignore_existing_data_limits(), true)
  assert_eq(panels[0].state.val.line_originals.length(), 1)
  line_units_ref_points(panels[0].state.val.line_originals[0].points, [])
  match panels[0].state.val.artists[0] {
    Artist::Line(points, _) =>
      assert_true(
        physical_equal(points, panels[0].state.val.line_originals[0].points),
      )
    _ => fail("expected exact Line buffer")
  }
  match panels[0].state.val.line_originals[0].x {
    LineOriginalCoordinate::Category(values) => assert_eq(values, [])
    _ => fail("expected Category original coordinate")
  }
  match panels[0].state.val.line_originals[0].y {
    LineOriginalCoordinate::Numeric(values) =>
      line_units_ref_numbers(values, [
        4607182418800017408UL.reinterpret_as_double(),
      ])
    _ => fail("expected Numeric original coordinate")
  }
  let replacement = @axis.CategoryUnits::new(["b", "a"])
  panels[0].set_x_units(Some(@axis.AxisUnitTag::Category(replacement)))
  assert_eq(panels[0].state.val.x_axis.unit_converter_kind(), Some("category"))
  assert_eq(panels[0].state.val.x_axis.get_category_units().unwrap().labels(), [
    "b", "a",
  ])
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), true)
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).lower(),
    9218868437227405312UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).upper(),
    18442240474082181120UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=true),
    9218868437227405312UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.unit_converter_kind(), None)
  assert_true(panels[0].state.val.y_axis.unit_tag() is None)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).lower(),
    9218868437227405312UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).upper(),
    18442240474082181120UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=false),
    9218868437227405312UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].ignore_existing_data_limits(), true)
  assert_eq(panels[0].state.val.line_originals.length(), 1)
  line_units_ref_points(panels[0].state.val.line_originals[0].points, [])
  match panels[0].state.val.artists[0] {
    Artist::Line(points, _) =>
      assert_true(
        physical_equal(points, panels[0].state.val.line_originals[0].points),
      )
    _ => fail("expected exact Line buffer")
  }
  match panels[0].state.val.line_originals[0].x {
    LineOriginalCoordinate::Category(values) => assert_eq(values, [])
    _ => fail("expected Category original coordinate")
  }
  match panels[0].state.val.line_originals[0].y {
    LineOriginalCoordinate::Numeric(values) =>
      line_units_ref_numbers(values, [
        4607182418800017408UL.reinterpret_as_double(),
      ])
    _ => fail("expected Numeric original coordinate")
  }
}

///|
fn line_units_source_case_22() -> Unit raise {
  let old_mode = @config.date_converter()
  let old_multiple = @config.date_interval_multiples()
  defer {
    @config.set_date_converter(old_mode)
    @config.set_date_interval_multiples(old_multiple)
  }
  @config.set_date_converter("auto")
  @config.set_date_interval_multiples(true)
  let figure = figure()
  let panels = [figure.axes()]
  ignore(panels[0].state.val.x_axis.update_category_units(["a", "b"]))
  panels[0].attach_line_with_originals(
    [],
    LineOriginalCoordinate::Category(["a"]),
    LineOriginalCoordinate::Numeric([]),
  )
  panels[0].state.val.raw_x_data = @core.limits(
    9218868437227405312UL.reinterpret_as_double(),
    18442240474082181120UL.reinterpret_as_double(),
  )
  panels[0].state.val.raw_y_data = @core.limits(
    9218868437227405312UL.reinterpret_as_double(),
    18442240474082181120UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_data_minpos = 9218868437227405312UL.reinterpret_as_double()
  panels[0].state.val.y_data_minpos = 9218868437227405312UL.reinterpret_as_double()
  panels[0].state.val.ignore_existing_data_limits = true
  panels[0].state.val.x_axis.clear_autoscale_request()
  panels[0].state.val.y_axis.clear_autoscale_request()
  assert_eq(panels[0].state.val.x_axis.unit_converter_kind(), Some("category"))
  assert_eq(panels[0].state.val.x_axis.get_category_units().unwrap().labels(), [
    "a", "b",
  ])
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), false)
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).lower(),
    9218868437227405312UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).upper(),
    18442240474082181120UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=true),
    9218868437227405312UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.unit_converter_kind(), None)
  assert_true(panels[0].state.val.y_axis.unit_tag() is None)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).lower(),
    9218868437227405312UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).upper(),
    18442240474082181120UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=false),
    9218868437227405312UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].ignore_existing_data_limits(), true)
  assert_eq(panels[0].state.val.line_originals.length(), 1)
  line_units_ref_points(panels[0].state.val.line_originals[0].points, [])
  match panels[0].state.val.artists[0] {
    Artist::Line(points, _) =>
      assert_true(
        physical_equal(points, panels[0].state.val.line_originals[0].points),
      )
    _ => fail("expected exact Line buffer")
  }
  match panels[0].state.val.line_originals[0].x {
    LineOriginalCoordinate::Category(values) => assert_eq(values, ["a"])
    _ => fail("expected Category original coordinate")
  }
  match panels[0].state.val.line_originals[0].y {
    LineOriginalCoordinate::Numeric(values) =>
      line_units_ref_numbers(values, [])
    _ => fail("expected Numeric original coordinate")
  }
  let replacement = @axis.CategoryUnits::new(["b", "a"])
  panels[0].set_x_units(Some(@axis.AxisUnitTag::Category(replacement)))
  assert_eq(panels[0].state.val.x_axis.unit_converter_kind(), Some("category"))
  assert_eq(panels[0].state.val.x_axis.get_category_units().unwrap().labels(), [
    "b", "a",
  ])
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), true)
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).lower(),
    9218868437227405312UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).upper(),
    18442240474082181120UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=true),
    9218868437227405312UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.unit_converter_kind(), None)
  assert_true(panels[0].state.val.y_axis.unit_tag() is None)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).lower(),
    9218868437227405312UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).upper(),
    18442240474082181120UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=false),
    9218868437227405312UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].ignore_existing_data_limits(), true)
  assert_eq(panels[0].state.val.line_originals.length(), 1)
  line_units_ref_points(panels[0].state.val.line_originals[0].points, [])
  match panels[0].state.val.artists[0] {
    Artist::Line(points, _) =>
      assert_true(
        physical_equal(points, panels[0].state.val.line_originals[0].points),
      )
    _ => fail("expected exact Line buffer")
  }
  match panels[0].state.val.line_originals[0].x {
    LineOriginalCoordinate::Category(values) => assert_eq(values, ["a"])
    _ => fail("expected Category original coordinate")
  }
  match panels[0].state.val.line_originals[0].y {
    LineOriginalCoordinate::Numeric(values) =>
      line_units_ref_numbers(values, [])
    _ => fail("expected Numeric original coordinate")
  }
}

///|
fn line_units_source_case_23() -> Unit raise {
  let old_mode = @config.date_converter()
  let old_multiple = @config.date_interval_multiples()
  defer {
    @config.set_date_converter(old_mode)
    @config.set_date_interval_multiples(old_multiple)
  }
  @config.set_date_converter("auto")
  @config.set_date_interval_multiples(true)
  let figure = figure()
  let panels = [figure.axes()]
  ignore(panels[0].state.val.x_axis.update_category_units(["a", "b"]))
  panels[0].attach_line_with_originals(
    [
      @core.point(
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
      ),
      @core.point(
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ),
    ],
    LineOriginalCoordinate::Category(["fresh", "b"]),
    LineOriginalCoordinate::Numeric([
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
    ]),
  )
  panels[0].state.val.raw_x_data = @core.limits(
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  panels[0].state.val.raw_y_data = @core.limits(
    4621819117588971520UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  panels[0].state.val.x_data_minpos = 4607182418800017408UL.reinterpret_as_double()
  panels[0].state.val.y_data_minpos = 4621819117588971520UL.reinterpret_as_double()
  panels[0].state.val.ignore_existing_data_limits = false
  panels[0].state.val.x_axis.clear_autoscale_request()
  panels[0].state.val.y_axis.clear_autoscale_request()
  assert_eq(panels[0].state.val.x_axis.unit_converter_kind(), Some("category"))
  assert_eq(panels[0].state.val.x_axis.get_category_units().unwrap().labels(), [
    "a", "b",
  ])
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), false)
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).lower(),
    0UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).upper(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=true),
    4607182418800017408UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.unit_converter_kind(), None)
  assert_true(panels[0].state.val.y_axis.unit_tag() is None)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).lower(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).upper(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=false),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].ignore_existing_data_limits(), false)
  assert_eq(panels[0].state.val.line_originals.length(), 1)
  line_units_ref_points(panels[0].state.val.line_originals[0].points, [
    [0UL.reinterpret_as_double(), 4621819117588971520UL.reinterpret_as_double()],
    [
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ],
  ])
  match panels[0].state.val.artists[0] {
    Artist::Line(points, _) =>
      assert_true(
        physical_equal(points, panels[0].state.val.line_originals[0].points),
      )
    _ => fail("expected exact Line buffer")
  }
  match panels[0].state.val.line_originals[0].x {
    LineOriginalCoordinate::Category(values) =>
      assert_eq(values, ["fresh", "b"])
    _ => fail("expected Category original coordinate")
  }
  match panels[0].state.val.line_originals[0].y {
    LineOriginalCoordinate::Numeric(values) =>
      line_units_ref_numbers(values, [
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ])
    _ => fail("expected Numeric original coordinate")
  }
  let replacement = @axis.CategoryUnits::new(["z"])
  let failed = try {
    panels[0].set_x_units(Some(@axis.AxisUnitTag::Category(replacement)))
    false
  } catch {
    @core.DataError::InvalidTicks(message~) =>
      message ==
      "shape mismatch: objects cannot be broadcast to a single shape.  Mismatch is between arg 0 with shape (2,) and arg 1 with shape (3,)."
    _ => false
  }
  assert_true(failed)
  assert_eq(panels[0].state.val.x_axis.unit_converter_kind(), Some("category"))
  assert_eq(panels[0].state.val.x_axis.get_category_units().unwrap().labels(), [
    "z", "fresh", "b",
  ])
  assert_eq(panels[0].state.val.x_axis.autoscale_stale(), false)
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).lower(),
    0UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=true).upper(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=true),
    4607182418800017408UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].state.val.y_axis.unit_converter_kind(), None)
  assert_true(panels[0].state.val.y_axis.unit_tag() is None)
  assert_eq(panels[0].state.val.y_axis.autoscale_stale(), false)
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).lower(),
    4621819117588971520UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_limits(horizontal=false).upper(),
    4626322717216342016UL.reinterpret_as_double(),
  )
  line_units_ref_double(
    panels[0].data_minpos(horizontal=false),
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(panels[0].ignore_existing_data_limits(), false)
  assert_eq(panels[0].state.val.line_originals.length(), 1)
  line_units_ref_points(panels[0].state.val.line_originals[0].points, [
    [0UL.reinterpret_as_double(), 4621819117588971520UL.reinterpret_as_double()],
    [
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ],
  ])
  match panels[0].state.val.artists[0] {
    Artist::Line(points, _) =>
      assert_true(
        physical_equal(points, panels[0].state.val.line_originals[0].points),
      )
    _ => fail("expected exact Line buffer")
  }
  match panels[0].state.val.line_originals[0].x {
    LineOriginalCoordinate::Category(values) =>
      assert_eq(values, ["fresh", "b"])
    _ => fail("expected Category original coordinate")
  }
  match panels[0].state.val.line_originals[0].y {
    LineOriginalCoordinate::Numeric(values) =>
      line_units_ref_numbers(values, [
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ])
    _ => fail("expected Numeric original coordinate")
  }
}

///|
test "original Line unit recache group 0" {
  line_units_source_case_0() catch {
    error =>
      fail(
        "Line units source 0 [first replacement reverses original string vertices but native numeric unchanged]: " +
        error.to_string(),
      )
  }
  line_units_source_case_1() catch {
    error =>
      fail(
        "Line units source 1 [repeat replacement restores and extends ordering]: " +
        error.to_string(),
      )
  }
  line_units_source_case_2() catch {
    error =>
      fail(
        "Line units source 2 [missing original key appends during recache]: " +
        error.to_string(),
      )
  }
  line_units_source_case_3() catch {
    error =>
      fail(
        "Line units source 3 [same UnitData identity is no-op]: " +
        error.to_string(),
      )
  }
  line_units_source_case_4() catch {
    error =>
      fail(
        "Line units source 4 [equal-content different UnitData still recaches]: " +
        error.to_string(),
      )
  }
  line_units_source_case_5() catch {
    error =>
      fail(
        "Line units source 5 [x-only unit replacement force-reconverts y and requests only x]: " +
        error.to_string(),
      )
  }
  line_units_source_case_6() catch {
    error =>
      fail(
        "Line units source 6 [second Line y conversion fails after first cache changes before relim request]: " +
        error.to_string(),
      )
  }
  line_units_source_case_7() catch {
    error =>
      fail(
        "Line units source 7 [broadcast error preserves old xy and dataLim while assigned new unit remains]: " +
        error.to_string(),
      )
  }
  line_units_source_case_8() catch {
    error =>
      fail(
        "Line units source 8 [external input list mutation does not change copied original]: " +
        error.to_string(),
      )
  }
  line_units_source_case_14() catch {
    error =>
      fail(
        "Line units source 14 [singleton original broadcasts while retained original length stays one]: " +
        error.to_string(),
      )
  }
  line_units_source_case_15() catch {
    error =>
      fail(
        "Line units source 15 [category x remap reconverts retained aware Date y]: " +
        error.to_string(),
      )
  }
  line_units_source_case_16() catch {
    error =>
      fail(
        "Line units source 16 [category y remap reconverts retained aware Date x]: " +
        error.to_string(),
      )
  }
  line_units_source_case_17() catch {
    error =>
      fail(
        "Line units source 17 [timezone-only unit replacement keeps Date original instants]: " +
        error.to_string(),
      )
  }
  line_units_source_case_18() catch {
    error =>
      fail(
        "Line units source 18 [actual shared Ticker remap success]: " +
        error.to_string(),
      )
  }
  line_units_source_case_19() catch {
    error =>
      fail(
        "Line units source 19 [actual shared Ticker remap conversion failure panel 0]: " +
        error.to_string(),
      )
  }
  line_units_source_case_20() catch {
    error =>
      fail(
        "Line units source 20 [actual shared Ticker remap conversion failure panel 1]: " +
        error.to_string(),
      )
  }
  line_units_source_case_21() catch {
    error =>
      fail(
        "Line units source 21 [empty/singleton broadcast (0, 1)]: " +
        error.to_string(),
      )
  }
  line_units_source_case_22() catch {
    error =>
      fail(
        "Line units source 22 [empty/singleton broadcast (1, 0)]: " +
        error.to_string(),
      )
  }
  line_units_source_case_23() catch {
    error =>
      fail(
        "Line units source 23 [x category append survives subsequent two-coordinate broadcast error]: " +
        error.to_string(),
      )
  }
}
