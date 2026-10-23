// Generated from pinned original Line drawstyle and native Path methods.
// Native None reset and physical ndarray metadata remain source evidence.

///|
fn line_drawstyle_source_double(
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
fn line_drawstyle_source_numbers(
  actual : Array[Double],
  expected : Array[Double],
) -> Unit raise {
  assert_eq(actual.length(), expected.length())
  for index in 0..<actual.length() {
    line_drawstyle_source_double(actual[index], expected[index])
  }
}

///|
fn line_drawstyle_source_original(
  actual : LineData,
  expected : LineData,
) -> Unit raise {
  match (actual, expected) {
    (LineData::Numeric(actual), LineData::Numeric(expected)) =>
      line_drawstyle_source_numbers(actual, expected)
    (LineData::Category(actual), LineData::Category(expected)) =>
      assert_eq(actual, expected)
    _ => fail("original drawstyle coordinate kind differs")
  }
}

///|
fn line_drawstyle_source_state(
  line : Line2D,
  axes : Axes,
  drawstyle : String,
  stale : Bool,
  invalid : Array[Bool],
  x_original : LineData,
  y_original : LineData,
  xs : Array[Double],
  ys : Array[Double],
  xy : Array[Double],
  path : Array[Double],
  path_is_xy : Bool,
  data : Array[Double],
  minpos : Array[Double],
  requests : Array[Bool],
  view : Array[Double],
  unit_labels : Array[String],
  unit_positions : Array[Double],
) -> Unit raise {
  assert_eq(line.get_drawstyle(), drawstyle)
  assert_eq(line.stale(), stale)
  assert_eq([line.invalid_x, line.invalid_y], invalid)
  line_drawstyle_source_original(line.get_xdata(), x_original)
  line_drawstyle_source_original(line.get_ydata(), y_original)
  // Inspect storage directly: before/after checks must not normalize pending flags.
  line_drawstyle_source_numbers(line.cache.xs.to_array(), xs)
  line_drawstyle_source_numbers(line.cache.ys.to_array(), ys)
  line_drawstyle_source_numbers(line.cache.flat.to_array(), xy)
  line_drawstyle_source_numbers(line.path_values.to_array(), path)
  // This checks the shared object even for an empty default Path.
  assert_eq(physical_equal(line.path_values, line.cache.flat), path_is_xy)
  line_drawstyle_source_numbers(
    [
      axes.data_limits().lower(),
      axes.data_limits(horizontal=false).lower(),
      axes.data_limits().upper(),
      axes.data_limits(horizontal=false).upper(),
    ],
    data,
  )
  line_drawstyle_source_numbers(
    [axes.data_minpos(), axes.data_minpos(horizontal=false)],
    minpos,
  )
  assert_eq(
    [axes.x_axis().autoscale_stale(), axes.y_axis().autoscale_stale()],
    requests,
  )
  let x_view = axes.x_axis().stored_view_limits()
  let y_view = axes.y_axis().stored_view_limits()
  line_drawstyle_source_numbers(
    [x_view.lower(), y_view.lower(), x_view.upper(), y_view.upper()],
    view,
  )
  let units = axes.x_axis().get_category_units().unwrap()
  assert_eq(units.labels(), unit_labels)
  line_drawstyle_source_numbers(units.positions(), unit_positions)
}

///|
fn line_drawstyle_source_setters() -> Unit raise {
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([
      0UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ]),
    LineData::Numeric([
      4607182418800017408UL.reinterpret_as_double(),
      4616189618054758400UL.reinterpret_as_double(),
      13837309855095848960UL.reinterpret_as_double(),
    ]),
    color="blue",
  )
  // Setup bridge: source constructed then recached its short Line before attachment.
  line.set_drawstyle("default")
  line.recache_checked(always=true)
  line.mark_drawn()
  // Initial host bridge only: plain source view/data/minpos before the scenario.
  axes.state.val.raw_x_data = @core.limits(
    0UL.reinterpret_as_double(),
    4617315517961601024UL.reinterpret_as_double(),
  )
  axes.state.val.raw_y_data = @core.limits(
    13837309855095848960UL.reinterpret_as_double(),
    4616189618054758400UL.reinterpret_as_double(),
  )
  axes.state.val.x_data_minpos = 4611686018427387904UL.reinterpret_as_double()
  axes.state.val.y_data_minpos = 4607182418800017408UL.reinterpret_as_double()
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
  // set drawstyle 'default'
  try {
    // Controlled input stale=False, not a drawing operation.
    line.mark_drawn()
    line_drawstyle_source_state(
      line,
      axes,
      "default",
      false,
      [false, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      true,
      [
        0UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line.set_drawstyle("default")
    line_drawstyle_source_state(
      line,
      axes,
      "default",
      false,
      [false, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      true,
      [
        0UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original drawstyle row 0: " + error.to_string())
  }
  // set drawstyle 'steps'
  try {
    // Controlled input stale=False, not a drawing operation.
    line.mark_drawn()
    line_drawstyle_source_state(
      line,
      axes,
      "default",
      false,
      [false, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      true,
      [
        0UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line.set_drawstyle("steps")
    line_drawstyle_source_state(
      line,
      axes,
      "steps",
      true,
      [true, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      true,
      [
        0UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original drawstyle row 1: " + error.to_string())
  }
  // set drawstyle 'steps'
  try {
    // Controlled input stale=False, not a drawing operation.
    line.mark_drawn()
    line_drawstyle_source_state(
      line,
      axes,
      "steps",
      false,
      [true, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      true,
      [
        0UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line.set_drawstyle("steps")
    line_drawstyle_source_state(
      line,
      axes,
      "steps",
      false,
      [true, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      true,
      [
        0UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original drawstyle row 2: " + error.to_string())
  }
  // set drawstyle 'steps-pre'
  try {
    // Controlled input stale=False, not a drawing operation.
    line.mark_drawn()
    line_drawstyle_source_state(
      line,
      axes,
      "steps",
      false,
      [true, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      true,
      [
        0UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line.set_drawstyle("steps-pre")
    line_drawstyle_source_state(
      line,
      axes,
      "steps-pre",
      true,
      [true, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      true,
      [
        0UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original drawstyle row 3: " + error.to_string())
  }
  // set drawstyle 'steps-mid'
  try {
    // Controlled input stale=False, not a drawing operation.
    line.mark_drawn()
    line_drawstyle_source_state(
      line,
      axes,
      "steps-pre",
      false,
      [true, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      true,
      [
        0UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line.set_drawstyle("steps-mid")
    line_drawstyle_source_state(
      line,
      axes,
      "steps-mid",
      true,
      [true, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      true,
      [
        0UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original drawstyle row 4: " + error.to_string())
  }
  // set drawstyle 'steps-post'
  try {
    // Controlled input stale=False, not a drawing operation.
    line.mark_drawn()
    line_drawstyle_source_state(
      line,
      axes,
      "steps-mid",
      false,
      [true, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      true,
      [
        0UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line.set_drawstyle("steps-post")
    line_drawstyle_source_state(
      line,
      axes,
      "steps-post",
      true,
      [true, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      true,
      [
        0UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original drawstyle row 5: " + error.to_string())
  }
  // set drawstyle 'default'
  try {
    // Controlled input stale=False, not a drawing operation.
    line.mark_drawn()
    line_drawstyle_source_state(
      line,
      axes,
      "steps-post",
      false,
      [true, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      true,
      [
        0UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line.set_drawstyle("default")
    line_drawstyle_source_state(
      line,
      axes,
      "default",
      true,
      [true, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      true,
      [
        0UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original drawstyle row 6: " + error.to_string())
  }
  // set drawstyle 'Default'
  try {
    // Controlled input stale=False, not a drawing operation.
    line.mark_drawn()
    line_drawstyle_source_state(
      line,
      axes,
      "default",
      false,
      [true, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      true,
      [
        0UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    assert_true(
      try {
        line.set_drawstyle("Default")
        false
      } catch {
        @core.DataError::InvalidTicks(message~) =>
          message ==
          "ValueError: 'Default' is not a valid value for drawstyle. Supported values are 'default', 'steps-mid', 'steps-pre', 'steps-post', 'steps'"
        _ => false
      },
    )
    line_drawstyle_source_state(
      line,
      axes,
      "default",
      false,
      [true, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      true,
      [
        0UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original drawstyle row 7: " + error.to_string())
  }
  // set drawstyle 'pre'
  try {
    // Controlled input stale=False, not a drawing operation.
    line.mark_drawn()
    line_drawstyle_source_state(
      line,
      axes,
      "default",
      false,
      [true, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      true,
      [
        0UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    assert_true(
      try {
        line.set_drawstyle("pre")
        false
      } catch {
        @core.DataError::InvalidTicks(message~) =>
          message ==
          "ValueError: 'pre' is not a valid value for drawstyle. Supported values are 'default', 'steps-mid', 'steps-pre', 'steps-post', 'steps'"
        _ => false
      },
    )
    line_drawstyle_source_state(
      line,
      axes,
      "default",
      false,
      [true, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      true,
      [
        0UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original drawstyle row 8: " + error.to_string())
  }
  // set drawstyle ''
  try {
    // Controlled input stale=False, not a drawing operation.
    line.mark_drawn()
    line_drawstyle_source_state(
      line,
      axes,
      "default",
      false,
      [true, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      true,
      [
        0UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    assert_true(
      try {
        line.set_drawstyle("")
        false
      } catch {
        @core.DataError::InvalidTicks(message~) =>
          message ==
          "ValueError: '' is not a valid value for drawstyle. Supported values are 'default', 'steps-mid', 'steps-pre', 'steps-post', 'steps'"
        _ => false
      },
    )
    line_drawstyle_source_state(
      line,
      axes,
      "default",
      false,
      [true, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      true,
      [
        0UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original drawstyle row 9: " + error.to_string())
  }
  // set drawstyle 'steps-'
  try {
    // Controlled input stale=False, not a drawing operation.
    line.mark_drawn()
    line_drawstyle_source_state(
      line,
      axes,
      "default",
      false,
      [true, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      true,
      [
        0UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    assert_true(
      try {
        line.set_drawstyle("steps-")
        false
      } catch {
        @core.DataError::InvalidTicks(message~) =>
          message ==
          "ValueError: 'steps-' is not a valid value for drawstyle. Supported values are 'default', 'steps-mid', 'steps-pre', 'steps-post', 'steps'"
        _ => false
      },
    )
    line_drawstyle_source_state(
      line,
      axes,
      "default",
      false,
      [true, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      true,
      [
        0UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original drawstyle row 10: " + error.to_string())
  }
  // set drawstyle 'steps-middle'
  try {
    // Controlled input stale=False, not a drawing operation.
    line.mark_drawn()
    line_drawstyle_source_state(
      line,
      axes,
      "default",
      false,
      [true, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      true,
      [
        0UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    assert_true(
      try {
        line.set_drawstyle("steps-middle")
        false
      } catch {
        @core.DataError::InvalidTicks(message~) =>
          message ==
          "ValueError: 'steps-middle' is not a valid value for drawstyle. Supported values are 'default', 'steps-mid', 'steps-pre', 'steps-post', 'steps'"
        _ => false
      },
    )
    line_drawstyle_source_state(
      line,
      axes,
      "default",
      false,
      [true, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      true,
      [
        0UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original drawstyle row 11: " + error.to_string())
  }
}

///|
test "original drawstyle String setters and cache invalidation" {
  line_drawstyle_source_setters()
}

///|
fn line_drawstyle_source_path_13() -> Unit raise {
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([]),
    LineData::Numeric([]),
    color="blue",
  )
  // Setup bridge: source constructed then recached its short Line before attachment.
  line.set_drawstyle("default")
  line.recache_checked(always=true)
  line.set_drawstyle("default")
  line.mark_drawn()
  // Initial host bridge only: plain source view/data/minpos before the scenario.
  axes.state.val.raw_x_data = @core.limits(1.0 / 0.0, -1.0 / 0.0)
  axes.state.val.raw_y_data = @core.limits(1.0 / 0.0, -1.0 / 0.0)
  axes.state.val.x_data_minpos = 1.0 / 0.0
  axes.state.val.y_data_minpos = 1.0 / 0.0
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
  // actual Path construction default N=0
  try {
    line_drawstyle_source_state(
      line,
      axes,
      "default",
      false,
      [false, false],
      LineData::Numeric([]),
      LineData::Numeric([]),
      [],
      [],
      [],
      [],
      true,
      [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
      [1.0 / 0.0, 1.0 / 0.0],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    let returned = line.path_values_checked()
    line_drawstyle_source_numbers(returned.to_array(), [])
    line_drawstyle_source_state(
      line,
      axes,
      "default",
      false,
      [false, false],
      LineData::Numeric([]),
      LineData::Numeric([]),
      [],
      [],
      [],
      [],
      true,
      [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
      [1.0 / 0.0, 1.0 / 0.0],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original drawstyle row 13: " + error.to_string())
  }
}

///|
fn line_drawstyle_source_path_14() -> Unit raise {
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([4611686018427387904UL.reinterpret_as_double()]),
    LineData::Numeric([4613937818241073152UL.reinterpret_as_double()]),
    color="blue",
  )
  // Setup bridge: source constructed then recached its short Line before attachment.
  line.set_drawstyle("default")
  line.recache_checked(always=true)
  line.set_drawstyle("default")
  line.mark_drawn()
  // Initial host bridge only: plain source view/data/minpos before the scenario.
  axes.state.val.raw_x_data = @core.limits(
    4611686018427387904UL.reinterpret_as_double(),
    4611686018427387904UL.reinterpret_as_double(),
  )
  axes.state.val.raw_y_data = @core.limits(
    4613937818241073152UL.reinterpret_as_double(),
    4613937818241073152UL.reinterpret_as_double(),
  )
  axes.state.val.x_data_minpos = 4611686018427387904UL.reinterpret_as_double()
  axes.state.val.y_data_minpos = 4613937818241073152UL.reinterpret_as_double()
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
  // actual Path construction default N=1
  try {
    line_drawstyle_source_state(
      line,
      axes,
      "default",
      false,
      [false, false],
      LineData::Numeric([4611686018427387904UL.reinterpret_as_double()]),
      LineData::Numeric([4613937818241073152UL.reinterpret_as_double()]),
      [4611686018427387904UL.reinterpret_as_double()],
      [4613937818241073152UL.reinterpret_as_double()],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      true,
      [
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    let returned = line.path_values_checked()
    line_drawstyle_source_numbers(returned.to_array(), [
      4611686018427387904UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
    ])
    line_drawstyle_source_state(
      line,
      axes,
      "default",
      false,
      [false, false],
      LineData::Numeric([4611686018427387904UL.reinterpret_as_double()]),
      LineData::Numeric([4613937818241073152UL.reinterpret_as_double()]),
      [4611686018427387904UL.reinterpret_as_double()],
      [4613937818241073152UL.reinterpret_as_double()],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      true,
      [
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original drawstyle row 14: " + error.to_string())
  }
}

///|
fn line_drawstyle_source_path_15() -> Unit raise {
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([
      0UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
    ]),
    LineData::Numeric([
      4607182418800017408UL.reinterpret_as_double(),
      4616189618054758400UL.reinterpret_as_double(),
    ]),
    color="blue",
  )
  // Setup bridge: source constructed then recached its short Line before attachment.
  line.set_drawstyle("default")
  line.recache_checked(always=true)
  line.set_drawstyle("default")
  line.mark_drawn()
  // Initial host bridge only: plain source view/data/minpos before the scenario.
  axes.state.val.raw_x_data = @core.limits(
    0UL.reinterpret_as_double(),
    4611686018427387904UL.reinterpret_as_double(),
  )
  axes.state.val.raw_y_data = @core.limits(
    4607182418800017408UL.reinterpret_as_double(),
    4616189618054758400UL.reinterpret_as_double(),
  )
  axes.state.val.x_data_minpos = 4611686018427387904UL.reinterpret_as_double()
  axes.state.val.y_data_minpos = 4607182418800017408UL.reinterpret_as_double()
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
  // actual Path construction default N=2
  try {
    line_drawstyle_source_state(
      line,
      axes,
      "default",
      false,
      [false, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      true,
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    let returned = line.path_values_checked()
    line_drawstyle_source_numbers(returned.to_array(), [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4616189618054758400UL.reinterpret_as_double(),
    ])
    line_drawstyle_source_state(
      line,
      axes,
      "default",
      false,
      [false, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      true,
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original drawstyle row 15: " + error.to_string())
  }
}

///|
fn line_drawstyle_source_path_16() -> Unit raise {
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([
      0UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
      4621256167635550208UL.reinterpret_as_double(),
    ]),
    LineData::Numeric([
      4607182418800017408UL.reinterpret_as_double(),
      4616189618054758400UL.reinterpret_as_double(),
      13837309855095848960UL.reinterpret_as_double(),
      4620693217682128896UL.reinterpret_as_double(),
    ]),
    color="blue",
  )
  // Setup bridge: source constructed then recached its short Line before attachment.
  line.set_drawstyle("default")
  line.recache_checked(always=true)
  line.set_drawstyle("default")
  line.mark_drawn()
  // Initial host bridge only: plain source view/data/minpos before the scenario.
  axes.state.val.raw_x_data = @core.limits(
    0UL.reinterpret_as_double(),
    4621256167635550208UL.reinterpret_as_double(),
  )
  axes.state.val.raw_y_data = @core.limits(
    13837309855095848960UL.reinterpret_as_double(),
    4620693217682128896UL.reinterpret_as_double(),
  )
  axes.state.val.x_data_minpos = 4611686018427387904UL.reinterpret_as_double()
  axes.state.val.y_data_minpos = 4607182418800017408UL.reinterpret_as_double()
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
  // actual Path construction default N=4
  try {
    line_drawstyle_source_state(
      line,
      axes,
      "default",
      false,
      [false, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        4621256167635550208UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4620693217682128896UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        4621256167635550208UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4620693217682128896UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4621256167635550208UL.reinterpret_as_double(),
        4620693217682128896UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4621256167635550208UL.reinterpret_as_double(),
        4620693217682128896UL.reinterpret_as_double(),
      ],
      true,
      [
        0UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4621256167635550208UL.reinterpret_as_double(),
        4620693217682128896UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    let returned = line.path_values_checked()
    line_drawstyle_source_numbers(returned.to_array(), [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4616189618054758400UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
      13837309855095848960UL.reinterpret_as_double(),
      4621256167635550208UL.reinterpret_as_double(),
      4620693217682128896UL.reinterpret_as_double(),
    ])
    line_drawstyle_source_state(
      line,
      axes,
      "default",
      false,
      [false, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        4621256167635550208UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4620693217682128896UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        4621256167635550208UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4620693217682128896UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4621256167635550208UL.reinterpret_as_double(),
        4620693217682128896UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4621256167635550208UL.reinterpret_as_double(),
        4620693217682128896UL.reinterpret_as_double(),
      ],
      true,
      [
        0UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4621256167635550208UL.reinterpret_as_double(),
        4620693217682128896UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original drawstyle row 16: " + error.to_string())
  }
}

///|
fn line_drawstyle_source_path_17() -> Unit raise {
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([0.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0]),
    LineData::Numeric([
      4607182418800017408UL.reinterpret_as_double(),
      13835058055282163712UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
    ]),
    color="blue",
  )
  // Setup bridge: source constructed then recached its short Line before attachment.
  line.set_drawstyle("default")
  line.recache_checked(always=true)
  line.set_drawstyle("default")
  line.mark_drawn()
  // Initial host bridge only: plain source view/data/minpos before the scenario.
  axes.state.val.raw_x_data = @core.limits(1.0 / 0.0, -1.0 / 0.0)
  axes.state.val.raw_y_data = @core.limits(1.0 / 0.0, -1.0 / 0.0)
  axes.state.val.x_data_minpos = 1.0 / 0.0
  axes.state.val.y_data_minpos = 1.0 / 0.0
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
  // actual Path construction default N=3
  try {
    line_drawstyle_source_state(
      line,
      axes,
      "default",
      false,
      [false, false],
      LineData::Numeric([0.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        13835058055282163712UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ]),
      [0.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0],
      [
        4607182418800017408UL.reinterpret_as_double(),
        13835058055282163712UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0.0 / 0.0,
        4607182418800017408UL.reinterpret_as_double(),
        1.0 / 0.0,
        13835058055282163712UL.reinterpret_as_double(),
        -1.0 / 0.0,
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0.0 / 0.0,
        4607182418800017408UL.reinterpret_as_double(),
        1.0 / 0.0,
        13835058055282163712UL.reinterpret_as_double(),
        -1.0 / 0.0,
        4613937818241073152UL.reinterpret_as_double(),
      ],
      true,
      [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
      [1.0 / 0.0, 1.0 / 0.0],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    let returned = line.path_values_checked()
    line_drawstyle_source_numbers(returned.to_array(), [
      0.0 / 0.0,
      4607182418800017408UL.reinterpret_as_double(),
      1.0 / 0.0,
      13835058055282163712UL.reinterpret_as_double(),
      -1.0 / 0.0,
      4613937818241073152UL.reinterpret_as_double(),
    ])
    line_drawstyle_source_state(
      line,
      axes,
      "default",
      false,
      [false, false],
      LineData::Numeric([0.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        13835058055282163712UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ]),
      [0.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0],
      [
        4607182418800017408UL.reinterpret_as_double(),
        13835058055282163712UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0.0 / 0.0,
        4607182418800017408UL.reinterpret_as_double(),
        1.0 / 0.0,
        13835058055282163712UL.reinterpret_as_double(),
        -1.0 / 0.0,
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0.0 / 0.0,
        4607182418800017408UL.reinterpret_as_double(),
        1.0 / 0.0,
        13835058055282163712UL.reinterpret_as_double(),
        -1.0 / 0.0,
        4613937818241073152UL.reinterpret_as_double(),
      ],
      true,
      [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
      [1.0 / 0.0, 1.0 / 0.0],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original drawstyle row 17: " + error.to_string())
  }
}

///|
fn line_drawstyle_source_path_18() -> Unit raise {
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([
      9218868437227405311UL.reinterpret_as_double(),
      9218868437227405311UL.reinterpret_as_double(),
    ]),
    LineData::Numeric([
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
    ]),
    color="blue",
  )
  // Setup bridge: source constructed then recached its short Line before attachment.
  line.set_drawstyle("default")
  line.recache_checked(always=true)
  line.set_drawstyle("default")
  line.mark_drawn()
  // Initial host bridge only: plain source view/data/minpos before the scenario.
  axes.state.val.raw_x_data = @core.limits(
    9218868437227405311UL.reinterpret_as_double(),
    9218868437227405311UL.reinterpret_as_double(),
  )
  axes.state.val.raw_y_data = @core.limits(
    4607182418800017408UL.reinterpret_as_double(),
    4611686018427387904UL.reinterpret_as_double(),
  )
  axes.state.val.x_data_minpos = 9218868437227405311UL.reinterpret_as_double()
  axes.state.val.y_data_minpos = 4607182418800017408UL.reinterpret_as_double()
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
  // actual Path construction default N=2
  try {
    line_drawstyle_source_state(
      line,
      axes,
      "default",
      false,
      [false, false],
      LineData::Numeric([
        9218868437227405311UL.reinterpret_as_double(),
        9218868437227405311UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      [
        9218868437227405311UL.reinterpret_as_double(),
        9218868437227405311UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        9218868437227405311UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        9218868437227405311UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        9218868437227405311UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        9218868437227405311UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      true,
      [
        9218868437227405311UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        9218868437227405311UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        9218868437227405311UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    let returned = line.path_values_checked()
    line_drawstyle_source_numbers(returned.to_array(), [
      9218868437227405311UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      9218868437227405311UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
    ])
    line_drawstyle_source_state(
      line,
      axes,
      "default",
      false,
      [false, false],
      LineData::Numeric([
        9218868437227405311UL.reinterpret_as_double(),
        9218868437227405311UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      [
        9218868437227405311UL.reinterpret_as_double(),
        9218868437227405311UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        9218868437227405311UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        9218868437227405311UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        9218868437227405311UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        9218868437227405311UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      true,
      [
        9218868437227405311UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        9218868437227405311UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        9218868437227405311UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original drawstyle row 18: " + error.to_string())
  }
}

///|
fn line_drawstyle_source_path_19() -> Unit raise {
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([]),
    LineData::Numeric([]),
    color="blue",
  )
  // Setup bridge: source constructed then recached its short Line before attachment.
  line.set_drawstyle("default")
  line.recache_checked(always=true)
  line.set_drawstyle("steps")
  line.mark_drawn()
  // Initial host bridge only: plain source view/data/minpos before the scenario.
  axes.state.val.raw_x_data = @core.limits(1.0 / 0.0, -1.0 / 0.0)
  axes.state.val.raw_y_data = @core.limits(1.0 / 0.0, -1.0 / 0.0)
  axes.state.val.x_data_minpos = 1.0 / 0.0
  axes.state.val.y_data_minpos = 1.0 / 0.0
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
  // actual Path construction steps N=0
  try {
    line_drawstyle_source_state(
      line,
      axes,
      "steps",
      false,
      [true, false],
      LineData::Numeric([]),
      LineData::Numeric([]),
      [],
      [],
      [],
      [],
      true,
      [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
      [1.0 / 0.0, 1.0 / 0.0],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    let returned = line.path_values_checked()
    line_drawstyle_source_numbers(returned.to_array(), [])
    line_drawstyle_source_state(
      line,
      axes,
      "steps",
      false,
      [false, false],
      LineData::Numeric([]),
      LineData::Numeric([]),
      [],
      [],
      [],
      [],
      false,
      [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
      [1.0 / 0.0, 1.0 / 0.0],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original drawstyle row 19: " + error.to_string())
  }
}

///|
fn line_drawstyle_source_path_20() -> Unit raise {
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([4611686018427387904UL.reinterpret_as_double()]),
    LineData::Numeric([4613937818241073152UL.reinterpret_as_double()]),
    color="blue",
  )
  // Setup bridge: source constructed then recached its short Line before attachment.
  line.set_drawstyle("default")
  line.recache_checked(always=true)
  line.set_drawstyle("steps")
  line.mark_drawn()
  // Initial host bridge only: plain source view/data/minpos before the scenario.
  axes.state.val.raw_x_data = @core.limits(
    4611686018427387904UL.reinterpret_as_double(),
    4611686018427387904UL.reinterpret_as_double(),
  )
  axes.state.val.raw_y_data = @core.limits(
    4613937818241073152UL.reinterpret_as_double(),
    4613937818241073152UL.reinterpret_as_double(),
  )
  axes.state.val.x_data_minpos = 4611686018427387904UL.reinterpret_as_double()
  axes.state.val.y_data_minpos = 4613937818241073152UL.reinterpret_as_double()
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
  // actual Path construction steps N=1
  try {
    line_drawstyle_source_state(
      line,
      axes,
      "steps",
      false,
      [true, false],
      LineData::Numeric([4611686018427387904UL.reinterpret_as_double()]),
      LineData::Numeric([4613937818241073152UL.reinterpret_as_double()]),
      [4611686018427387904UL.reinterpret_as_double()],
      [4613937818241073152UL.reinterpret_as_double()],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      true,
      [
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    let returned = line.path_values_checked()
    line_drawstyle_source_numbers(returned.to_array(), [
      4611686018427387904UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
    ])
    line_drawstyle_source_state(
      line,
      axes,
      "steps",
      false,
      [false, false],
      LineData::Numeric([4611686018427387904UL.reinterpret_as_double()]),
      LineData::Numeric([4613937818241073152UL.reinterpret_as_double()]),
      [4611686018427387904UL.reinterpret_as_double()],
      [4613937818241073152UL.reinterpret_as_double()],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      false,
      [
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original drawstyle row 20: " + error.to_string())
  }
}

///|
fn line_drawstyle_source_path_21() -> Unit raise {
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([
      0UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
    ]),
    LineData::Numeric([
      4607182418800017408UL.reinterpret_as_double(),
      4616189618054758400UL.reinterpret_as_double(),
    ]),
    color="blue",
  )
  // Setup bridge: source constructed then recached its short Line before attachment.
  line.set_drawstyle("default")
  line.recache_checked(always=true)
  line.set_drawstyle("steps")
  line.mark_drawn()
  // Initial host bridge only: plain source view/data/minpos before the scenario.
  axes.state.val.raw_x_data = @core.limits(
    0UL.reinterpret_as_double(),
    4611686018427387904UL.reinterpret_as_double(),
  )
  axes.state.val.raw_y_data = @core.limits(
    4607182418800017408UL.reinterpret_as_double(),
    4616189618054758400UL.reinterpret_as_double(),
  )
  axes.state.val.x_data_minpos = 4611686018427387904UL.reinterpret_as_double()
  axes.state.val.y_data_minpos = 4607182418800017408UL.reinterpret_as_double()
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
  // actual Path construction steps N=2
  try {
    line_drawstyle_source_state(
      line,
      axes,
      "steps",
      false,
      [true, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      true,
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    let returned = line.path_values_checked()
    line_drawstyle_source_numbers(returned.to_array(), [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      4616189618054758400UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4616189618054758400UL.reinterpret_as_double(),
    ])
    line_drawstyle_source_state(
      line,
      axes,
      "steps",
      false,
      [false, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      false,
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original drawstyle row 21: " + error.to_string())
  }
}

///|
fn line_drawstyle_source_path_22() -> Unit raise {
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([
      0UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
      4621256167635550208UL.reinterpret_as_double(),
    ]),
    LineData::Numeric([
      4607182418800017408UL.reinterpret_as_double(),
      4616189618054758400UL.reinterpret_as_double(),
      13837309855095848960UL.reinterpret_as_double(),
      4620693217682128896UL.reinterpret_as_double(),
    ]),
    color="blue",
  )
  // Setup bridge: source constructed then recached its short Line before attachment.
  line.set_drawstyle("default")
  line.recache_checked(always=true)
  line.set_drawstyle("steps")
  line.mark_drawn()
  // Initial host bridge only: plain source view/data/minpos before the scenario.
  axes.state.val.raw_x_data = @core.limits(
    0UL.reinterpret_as_double(),
    4621256167635550208UL.reinterpret_as_double(),
  )
  axes.state.val.raw_y_data = @core.limits(
    13837309855095848960UL.reinterpret_as_double(),
    4620693217682128896UL.reinterpret_as_double(),
  )
  axes.state.val.x_data_minpos = 4611686018427387904UL.reinterpret_as_double()
  axes.state.val.y_data_minpos = 4607182418800017408UL.reinterpret_as_double()
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
  // actual Path construction steps N=4
  try {
    line_drawstyle_source_state(
      line,
      axes,
      "steps",
      false,
      [true, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        4621256167635550208UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4620693217682128896UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        4621256167635550208UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4620693217682128896UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4621256167635550208UL.reinterpret_as_double(),
        4620693217682128896UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4621256167635550208UL.reinterpret_as_double(),
        4620693217682128896UL.reinterpret_as_double(),
      ],
      true,
      [
        0UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4621256167635550208UL.reinterpret_as_double(),
        4620693217682128896UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    let returned = line.path_values_checked()
    line_drawstyle_source_numbers(returned.to_array(), [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      4616189618054758400UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4616189618054758400UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      13837309855095848960UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
      13837309855095848960UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
      4620693217682128896UL.reinterpret_as_double(),
      4621256167635550208UL.reinterpret_as_double(),
      4620693217682128896UL.reinterpret_as_double(),
    ])
    line_drawstyle_source_state(
      line,
      axes,
      "steps",
      false,
      [false, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        4621256167635550208UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4620693217682128896UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        4621256167635550208UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4620693217682128896UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4621256167635550208UL.reinterpret_as_double(),
        4620693217682128896UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        4620693217682128896UL.reinterpret_as_double(),
        4621256167635550208UL.reinterpret_as_double(),
        4620693217682128896UL.reinterpret_as_double(),
      ],
      false,
      [
        0UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4621256167635550208UL.reinterpret_as_double(),
        4620693217682128896UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original drawstyle row 22: " + error.to_string())
  }
}

///|
fn line_drawstyle_source_path_23() -> Unit raise {
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([0.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0]),
    LineData::Numeric([
      4607182418800017408UL.reinterpret_as_double(),
      13835058055282163712UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
    ]),
    color="blue",
  )
  // Setup bridge: source constructed then recached its short Line before attachment.
  line.set_drawstyle("default")
  line.recache_checked(always=true)
  line.set_drawstyle("steps")
  line.mark_drawn()
  // Initial host bridge only: plain source view/data/minpos before the scenario.
  axes.state.val.raw_x_data = @core.limits(1.0 / 0.0, -1.0 / 0.0)
  axes.state.val.raw_y_data = @core.limits(1.0 / 0.0, -1.0 / 0.0)
  axes.state.val.x_data_minpos = 1.0 / 0.0
  axes.state.val.y_data_minpos = 1.0 / 0.0
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
  // actual Path construction steps N=3
  try {
    line_drawstyle_source_state(
      line,
      axes,
      "steps",
      false,
      [true, false],
      LineData::Numeric([0.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        13835058055282163712UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ]),
      [0.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0],
      [
        4607182418800017408UL.reinterpret_as_double(),
        13835058055282163712UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0.0 / 0.0,
        4607182418800017408UL.reinterpret_as_double(),
        1.0 / 0.0,
        13835058055282163712UL.reinterpret_as_double(),
        -1.0 / 0.0,
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0.0 / 0.0,
        4607182418800017408UL.reinterpret_as_double(),
        1.0 / 0.0,
        13835058055282163712UL.reinterpret_as_double(),
        -1.0 / 0.0,
        4613937818241073152UL.reinterpret_as_double(),
      ],
      true,
      [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
      [1.0 / 0.0, 1.0 / 0.0],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    let returned = line.path_values_checked()
    line_drawstyle_source_numbers(returned.to_array(), [
      0.0 / 0.0,
      4607182418800017408UL.reinterpret_as_double(),
      0.0 / 0.0,
      13835058055282163712UL.reinterpret_as_double(),
      1.0 / 0.0,
      13835058055282163712UL.reinterpret_as_double(),
      1.0 / 0.0,
      4613937818241073152UL.reinterpret_as_double(),
      -1.0 / 0.0,
      4613937818241073152UL.reinterpret_as_double(),
    ])
    line_drawstyle_source_state(
      line,
      axes,
      "steps",
      false,
      [false, false],
      LineData::Numeric([0.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        13835058055282163712UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ]),
      [0.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0],
      [
        4607182418800017408UL.reinterpret_as_double(),
        13835058055282163712UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0.0 / 0.0,
        4607182418800017408UL.reinterpret_as_double(),
        1.0 / 0.0,
        13835058055282163712UL.reinterpret_as_double(),
        -1.0 / 0.0,
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0.0 / 0.0,
        4607182418800017408UL.reinterpret_as_double(),
        0.0 / 0.0,
        13835058055282163712UL.reinterpret_as_double(),
        1.0 / 0.0,
        13835058055282163712UL.reinterpret_as_double(),
        1.0 / 0.0,
        4613937818241073152UL.reinterpret_as_double(),
        -1.0 / 0.0,
        4613937818241073152UL.reinterpret_as_double(),
      ],
      false,
      [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
      [1.0 / 0.0, 1.0 / 0.0],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original drawstyle row 23: " + error.to_string())
  }
}

///|
fn line_drawstyle_source_path_24() -> Unit raise {
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([
      9218868437227405311UL.reinterpret_as_double(),
      9218868437227405311UL.reinterpret_as_double(),
    ]),
    LineData::Numeric([
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
    ]),
    color="blue",
  )
  // Setup bridge: source constructed then recached its short Line before attachment.
  line.set_drawstyle("default")
  line.recache_checked(always=true)
  line.set_drawstyle("steps")
  line.mark_drawn()
  // Initial host bridge only: plain source view/data/minpos before the scenario.
  axes.state.val.raw_x_data = @core.limits(
    9218868437227405311UL.reinterpret_as_double(),
    9218868437227405311UL.reinterpret_as_double(),
  )
  axes.state.val.raw_y_data = @core.limits(
    4607182418800017408UL.reinterpret_as_double(),
    4611686018427387904UL.reinterpret_as_double(),
  )
  axes.state.val.x_data_minpos = 9218868437227405311UL.reinterpret_as_double()
  axes.state.val.y_data_minpos = 4607182418800017408UL.reinterpret_as_double()
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
  // actual Path construction steps N=2
  try {
    line_drawstyle_source_state(
      line,
      axes,
      "steps",
      false,
      [true, false],
      LineData::Numeric([
        9218868437227405311UL.reinterpret_as_double(),
        9218868437227405311UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      [
        9218868437227405311UL.reinterpret_as_double(),
        9218868437227405311UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        9218868437227405311UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        9218868437227405311UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        9218868437227405311UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        9218868437227405311UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      true,
      [
        9218868437227405311UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        9218868437227405311UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        9218868437227405311UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    let returned = line.path_values_checked()
    line_drawstyle_source_numbers(returned.to_array(), [
      9218868437227405311UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      9218868437227405311UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      9218868437227405311UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
    ])
    line_drawstyle_source_state(
      line,
      axes,
      "steps",
      false,
      [false, false],
      LineData::Numeric([
        9218868437227405311UL.reinterpret_as_double(),
        9218868437227405311UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      [
        9218868437227405311UL.reinterpret_as_double(),
        9218868437227405311UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        9218868437227405311UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        9218868437227405311UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        9218868437227405311UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        9218868437227405311UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        9218868437227405311UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      false,
      [
        9218868437227405311UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        9218868437227405311UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        9218868437227405311UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original drawstyle row 24: " + error.to_string())
  }
}

///|
fn line_drawstyle_source_path_25() -> Unit raise {
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([]),
    LineData::Numeric([]),
    color="blue",
  )
  // Setup bridge: source constructed then recached its short Line before attachment.
  line.set_drawstyle("default")
  line.recache_checked(always=true)
  line.set_drawstyle("steps-pre")
  line.mark_drawn()
  // Initial host bridge only: plain source view/data/minpos before the scenario.
  axes.state.val.raw_x_data = @core.limits(1.0 / 0.0, -1.0 / 0.0)
  axes.state.val.raw_y_data = @core.limits(1.0 / 0.0, -1.0 / 0.0)
  axes.state.val.x_data_minpos = 1.0 / 0.0
  axes.state.val.y_data_minpos = 1.0 / 0.0
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
  // actual Path construction steps-pre N=0
  try {
    line_drawstyle_source_state(
      line,
      axes,
      "steps-pre",
      false,
      [true, false],
      LineData::Numeric([]),
      LineData::Numeric([]),
      [],
      [],
      [],
      [],
      true,
      [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
      [1.0 / 0.0, 1.0 / 0.0],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    let returned = line.path_values_checked()
    line_drawstyle_source_numbers(returned.to_array(), [])
    line_drawstyle_source_state(
      line,
      axes,
      "steps-pre",
      false,
      [false, false],
      LineData::Numeric([]),
      LineData::Numeric([]),
      [],
      [],
      [],
      [],
      false,
      [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
      [1.0 / 0.0, 1.0 / 0.0],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original drawstyle row 25: " + error.to_string())
  }
}

///|
fn line_drawstyle_source_path_26() -> Unit raise {
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([4611686018427387904UL.reinterpret_as_double()]),
    LineData::Numeric([4613937818241073152UL.reinterpret_as_double()]),
    color="blue",
  )
  // Setup bridge: source constructed then recached its short Line before attachment.
  line.set_drawstyle("default")
  line.recache_checked(always=true)
  line.set_drawstyle("steps-pre")
  line.mark_drawn()
  // Initial host bridge only: plain source view/data/minpos before the scenario.
  axes.state.val.raw_x_data = @core.limits(
    4611686018427387904UL.reinterpret_as_double(),
    4611686018427387904UL.reinterpret_as_double(),
  )
  axes.state.val.raw_y_data = @core.limits(
    4613937818241073152UL.reinterpret_as_double(),
    4613937818241073152UL.reinterpret_as_double(),
  )
  axes.state.val.x_data_minpos = 4611686018427387904UL.reinterpret_as_double()
  axes.state.val.y_data_minpos = 4613937818241073152UL.reinterpret_as_double()
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
  // actual Path construction steps-pre N=1
  try {
    line_drawstyle_source_state(
      line,
      axes,
      "steps-pre",
      false,
      [true, false],
      LineData::Numeric([4611686018427387904UL.reinterpret_as_double()]),
      LineData::Numeric([4613937818241073152UL.reinterpret_as_double()]),
      [4611686018427387904UL.reinterpret_as_double()],
      [4613937818241073152UL.reinterpret_as_double()],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      true,
      [
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    let returned = line.path_values_checked()
    line_drawstyle_source_numbers(returned.to_array(), [
      4611686018427387904UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
    ])
    line_drawstyle_source_state(
      line,
      axes,
      "steps-pre",
      false,
      [false, false],
      LineData::Numeric([4611686018427387904UL.reinterpret_as_double()]),
      LineData::Numeric([4613937818241073152UL.reinterpret_as_double()]),
      [4611686018427387904UL.reinterpret_as_double()],
      [4613937818241073152UL.reinterpret_as_double()],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      false,
      [
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original drawstyle row 26: " + error.to_string())
  }
}

///|
fn line_drawstyle_source_path_27() -> Unit raise {
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([
      0UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
    ]),
    LineData::Numeric([
      4607182418800017408UL.reinterpret_as_double(),
      4616189618054758400UL.reinterpret_as_double(),
    ]),
    color="blue",
  )
  // Setup bridge: source constructed then recached its short Line before attachment.
  line.set_drawstyle("default")
  line.recache_checked(always=true)
  line.set_drawstyle("steps-pre")
  line.mark_drawn()
  // Initial host bridge only: plain source view/data/minpos before the scenario.
  axes.state.val.raw_x_data = @core.limits(
    0UL.reinterpret_as_double(),
    4611686018427387904UL.reinterpret_as_double(),
  )
  axes.state.val.raw_y_data = @core.limits(
    4607182418800017408UL.reinterpret_as_double(),
    4616189618054758400UL.reinterpret_as_double(),
  )
  axes.state.val.x_data_minpos = 4611686018427387904UL.reinterpret_as_double()
  axes.state.val.y_data_minpos = 4607182418800017408UL.reinterpret_as_double()
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
  // actual Path construction steps-pre N=2
  try {
    line_drawstyle_source_state(
      line,
      axes,
      "steps-pre",
      false,
      [true, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      true,
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    let returned = line.path_values_checked()
    line_drawstyle_source_numbers(returned.to_array(), [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      4616189618054758400UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4616189618054758400UL.reinterpret_as_double(),
    ])
    line_drawstyle_source_state(
      line,
      axes,
      "steps-pre",
      false,
      [false, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      false,
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original drawstyle row 27: " + error.to_string())
  }
}

///|
fn line_drawstyle_source_path_28() -> Unit raise {
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([
      0UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
      4621256167635550208UL.reinterpret_as_double(),
    ]),
    LineData::Numeric([
      4607182418800017408UL.reinterpret_as_double(),
      4616189618054758400UL.reinterpret_as_double(),
      13837309855095848960UL.reinterpret_as_double(),
      4620693217682128896UL.reinterpret_as_double(),
    ]),
    color="blue",
  )
  // Setup bridge: source constructed then recached its short Line before attachment.
  line.set_drawstyle("default")
  line.recache_checked(always=true)
  line.set_drawstyle("steps-pre")
  line.mark_drawn()
  // Initial host bridge only: plain source view/data/minpos before the scenario.
  axes.state.val.raw_x_data = @core.limits(
    0UL.reinterpret_as_double(),
    4621256167635550208UL.reinterpret_as_double(),
  )
  axes.state.val.raw_y_data = @core.limits(
    13837309855095848960UL.reinterpret_as_double(),
    4620693217682128896UL.reinterpret_as_double(),
  )
  axes.state.val.x_data_minpos = 4611686018427387904UL.reinterpret_as_double()
  axes.state.val.y_data_minpos = 4607182418800017408UL.reinterpret_as_double()
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
  // actual Path construction steps-pre N=4
  try {
    line_drawstyle_source_state(
      line,
      axes,
      "steps-pre",
      false,
      [true, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        4621256167635550208UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4620693217682128896UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        4621256167635550208UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4620693217682128896UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4621256167635550208UL.reinterpret_as_double(),
        4620693217682128896UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4621256167635550208UL.reinterpret_as_double(),
        4620693217682128896UL.reinterpret_as_double(),
      ],
      true,
      [
        0UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4621256167635550208UL.reinterpret_as_double(),
        4620693217682128896UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    let returned = line.path_values_checked()
    line_drawstyle_source_numbers(returned.to_array(), [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      4616189618054758400UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4616189618054758400UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      13837309855095848960UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
      13837309855095848960UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
      4620693217682128896UL.reinterpret_as_double(),
      4621256167635550208UL.reinterpret_as_double(),
      4620693217682128896UL.reinterpret_as_double(),
    ])
    line_drawstyle_source_state(
      line,
      axes,
      "steps-pre",
      false,
      [false, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        4621256167635550208UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4620693217682128896UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        4621256167635550208UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4620693217682128896UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4621256167635550208UL.reinterpret_as_double(),
        4620693217682128896UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        4620693217682128896UL.reinterpret_as_double(),
        4621256167635550208UL.reinterpret_as_double(),
        4620693217682128896UL.reinterpret_as_double(),
      ],
      false,
      [
        0UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4621256167635550208UL.reinterpret_as_double(),
        4620693217682128896UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original drawstyle row 28: " + error.to_string())
  }
}

///|
fn line_drawstyle_source_path_29() -> Unit raise {
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([0.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0]),
    LineData::Numeric([
      4607182418800017408UL.reinterpret_as_double(),
      13835058055282163712UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
    ]),
    color="blue",
  )
  // Setup bridge: source constructed then recached its short Line before attachment.
  line.set_drawstyle("default")
  line.recache_checked(always=true)
  line.set_drawstyle("steps-pre")
  line.mark_drawn()
  // Initial host bridge only: plain source view/data/minpos before the scenario.
  axes.state.val.raw_x_data = @core.limits(1.0 / 0.0, -1.0 / 0.0)
  axes.state.val.raw_y_data = @core.limits(1.0 / 0.0, -1.0 / 0.0)
  axes.state.val.x_data_minpos = 1.0 / 0.0
  axes.state.val.y_data_minpos = 1.0 / 0.0
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
  // actual Path construction steps-pre N=3
  try {
    line_drawstyle_source_state(
      line,
      axes,
      "steps-pre",
      false,
      [true, false],
      LineData::Numeric([0.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        13835058055282163712UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ]),
      [0.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0],
      [
        4607182418800017408UL.reinterpret_as_double(),
        13835058055282163712UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0.0 / 0.0,
        4607182418800017408UL.reinterpret_as_double(),
        1.0 / 0.0,
        13835058055282163712UL.reinterpret_as_double(),
        -1.0 / 0.0,
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0.0 / 0.0,
        4607182418800017408UL.reinterpret_as_double(),
        1.0 / 0.0,
        13835058055282163712UL.reinterpret_as_double(),
        -1.0 / 0.0,
        4613937818241073152UL.reinterpret_as_double(),
      ],
      true,
      [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
      [1.0 / 0.0, 1.0 / 0.0],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    let returned = line.path_values_checked()
    line_drawstyle_source_numbers(returned.to_array(), [
      0.0 / 0.0,
      4607182418800017408UL.reinterpret_as_double(),
      0.0 / 0.0,
      13835058055282163712UL.reinterpret_as_double(),
      1.0 / 0.0,
      13835058055282163712UL.reinterpret_as_double(),
      1.0 / 0.0,
      4613937818241073152UL.reinterpret_as_double(),
      -1.0 / 0.0,
      4613937818241073152UL.reinterpret_as_double(),
    ])
    line_drawstyle_source_state(
      line,
      axes,
      "steps-pre",
      false,
      [false, false],
      LineData::Numeric([0.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        13835058055282163712UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ]),
      [0.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0],
      [
        4607182418800017408UL.reinterpret_as_double(),
        13835058055282163712UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0.0 / 0.0,
        4607182418800017408UL.reinterpret_as_double(),
        1.0 / 0.0,
        13835058055282163712UL.reinterpret_as_double(),
        -1.0 / 0.0,
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0.0 / 0.0,
        4607182418800017408UL.reinterpret_as_double(),
        0.0 / 0.0,
        13835058055282163712UL.reinterpret_as_double(),
        1.0 / 0.0,
        13835058055282163712UL.reinterpret_as_double(),
        1.0 / 0.0,
        4613937818241073152UL.reinterpret_as_double(),
        -1.0 / 0.0,
        4613937818241073152UL.reinterpret_as_double(),
      ],
      false,
      [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
      [1.0 / 0.0, 1.0 / 0.0],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original drawstyle row 29: " + error.to_string())
  }
}

///|
fn line_drawstyle_source_path_30() -> Unit raise {
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([
      9218868437227405311UL.reinterpret_as_double(),
      9218868437227405311UL.reinterpret_as_double(),
    ]),
    LineData::Numeric([
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
    ]),
    color="blue",
  )
  // Setup bridge: source constructed then recached its short Line before attachment.
  line.set_drawstyle("default")
  line.recache_checked(always=true)
  line.set_drawstyle("steps-pre")
  line.mark_drawn()
  // Initial host bridge only: plain source view/data/minpos before the scenario.
  axes.state.val.raw_x_data = @core.limits(
    9218868437227405311UL.reinterpret_as_double(),
    9218868437227405311UL.reinterpret_as_double(),
  )
  axes.state.val.raw_y_data = @core.limits(
    4607182418800017408UL.reinterpret_as_double(),
    4611686018427387904UL.reinterpret_as_double(),
  )
  axes.state.val.x_data_minpos = 9218868437227405311UL.reinterpret_as_double()
  axes.state.val.y_data_minpos = 4607182418800017408UL.reinterpret_as_double()
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
  // actual Path construction steps-pre N=2
  try {
    line_drawstyle_source_state(
      line,
      axes,
      "steps-pre",
      false,
      [true, false],
      LineData::Numeric([
        9218868437227405311UL.reinterpret_as_double(),
        9218868437227405311UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      [
        9218868437227405311UL.reinterpret_as_double(),
        9218868437227405311UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        9218868437227405311UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        9218868437227405311UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        9218868437227405311UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        9218868437227405311UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      true,
      [
        9218868437227405311UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        9218868437227405311UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        9218868437227405311UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    let returned = line.path_values_checked()
    line_drawstyle_source_numbers(returned.to_array(), [
      9218868437227405311UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      9218868437227405311UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      9218868437227405311UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
    ])
    line_drawstyle_source_state(
      line,
      axes,
      "steps-pre",
      false,
      [false, false],
      LineData::Numeric([
        9218868437227405311UL.reinterpret_as_double(),
        9218868437227405311UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      [
        9218868437227405311UL.reinterpret_as_double(),
        9218868437227405311UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        9218868437227405311UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        9218868437227405311UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        9218868437227405311UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        9218868437227405311UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        9218868437227405311UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      false,
      [
        9218868437227405311UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        9218868437227405311UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        9218868437227405311UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original drawstyle row 30: " + error.to_string())
  }
}

///|
fn line_drawstyle_source_path_31() -> Unit raise {
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([]),
    LineData::Numeric([]),
    color="blue",
  )
  // Setup bridge: source constructed then recached its short Line before attachment.
  line.set_drawstyle("default")
  line.recache_checked(always=true)
  line.set_drawstyle("steps-mid")
  line.mark_drawn()
  // Initial host bridge only: plain source view/data/minpos before the scenario.
  axes.state.val.raw_x_data = @core.limits(1.0 / 0.0, -1.0 / 0.0)
  axes.state.val.raw_y_data = @core.limits(1.0 / 0.0, -1.0 / 0.0)
  axes.state.val.x_data_minpos = 1.0 / 0.0
  axes.state.val.y_data_minpos = 1.0 / 0.0
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
  // actual Path construction steps-mid N=0
  try {
    line_drawstyle_source_state(
      line,
      axes,
      "steps-mid",
      false,
      [true, false],
      LineData::Numeric([]),
      LineData::Numeric([]),
      [],
      [],
      [],
      [],
      true,
      [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
      [1.0 / 0.0, 1.0 / 0.0],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    let returned = line.path_values_checked()
    line_drawstyle_source_numbers(returned.to_array(), [])
    line_drawstyle_source_state(
      line,
      axes,
      "steps-mid",
      false,
      [false, false],
      LineData::Numeric([]),
      LineData::Numeric([]),
      [],
      [],
      [],
      [],
      false,
      [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
      [1.0 / 0.0, 1.0 / 0.0],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original drawstyle row 31: " + error.to_string())
  }
}

///|
fn line_drawstyle_source_path_32() -> Unit raise {
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([4611686018427387904UL.reinterpret_as_double()]),
    LineData::Numeric([4613937818241073152UL.reinterpret_as_double()]),
    color="blue",
  )
  // Setup bridge: source constructed then recached its short Line before attachment.
  line.set_drawstyle("default")
  line.recache_checked(always=true)
  line.set_drawstyle("steps-mid")
  line.mark_drawn()
  // Initial host bridge only: plain source view/data/minpos before the scenario.
  axes.state.val.raw_x_data = @core.limits(
    4611686018427387904UL.reinterpret_as_double(),
    4611686018427387904UL.reinterpret_as_double(),
  )
  axes.state.val.raw_y_data = @core.limits(
    4613937818241073152UL.reinterpret_as_double(),
    4613937818241073152UL.reinterpret_as_double(),
  )
  axes.state.val.x_data_minpos = 4611686018427387904UL.reinterpret_as_double()
  axes.state.val.y_data_minpos = 4613937818241073152UL.reinterpret_as_double()
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
  // actual Path construction steps-mid N=1
  try {
    line_drawstyle_source_state(
      line,
      axes,
      "steps-mid",
      false,
      [true, false],
      LineData::Numeric([4611686018427387904UL.reinterpret_as_double()]),
      LineData::Numeric([4613937818241073152UL.reinterpret_as_double()]),
      [4611686018427387904UL.reinterpret_as_double()],
      [4613937818241073152UL.reinterpret_as_double()],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      true,
      [
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    let returned = line.path_values_checked()
    line_drawstyle_source_numbers(returned.to_array(), [
      4611686018427387904UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
    ])
    line_drawstyle_source_state(
      line,
      axes,
      "steps-mid",
      false,
      [false, false],
      LineData::Numeric([4611686018427387904UL.reinterpret_as_double()]),
      LineData::Numeric([4613937818241073152UL.reinterpret_as_double()]),
      [4611686018427387904UL.reinterpret_as_double()],
      [4613937818241073152UL.reinterpret_as_double()],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      false,
      [
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original drawstyle row 32: " + error.to_string())
  }
}

///|
fn line_drawstyle_source_path_33() -> Unit raise {
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([
      0UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
    ]),
    LineData::Numeric([
      4607182418800017408UL.reinterpret_as_double(),
      4616189618054758400UL.reinterpret_as_double(),
    ]),
    color="blue",
  )
  // Setup bridge: source constructed then recached its short Line before attachment.
  line.set_drawstyle("default")
  line.recache_checked(always=true)
  line.set_drawstyle("steps-mid")
  line.mark_drawn()
  // Initial host bridge only: plain source view/data/minpos before the scenario.
  axes.state.val.raw_x_data = @core.limits(
    0UL.reinterpret_as_double(),
    4611686018427387904UL.reinterpret_as_double(),
  )
  axes.state.val.raw_y_data = @core.limits(
    4607182418800017408UL.reinterpret_as_double(),
    4616189618054758400UL.reinterpret_as_double(),
  )
  axes.state.val.x_data_minpos = 4611686018427387904UL.reinterpret_as_double()
  axes.state.val.y_data_minpos = 4607182418800017408UL.reinterpret_as_double()
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
  // actual Path construction steps-mid N=2
  try {
    line_drawstyle_source_state(
      line,
      axes,
      "steps-mid",
      false,
      [true, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      true,
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    let returned = line.path_values_checked()
    line_drawstyle_source_numbers(returned.to_array(), [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4616189618054758400UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4616189618054758400UL.reinterpret_as_double(),
    ])
    line_drawstyle_source_state(
      line,
      axes,
      "steps-mid",
      false,
      [false, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      false,
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original drawstyle row 33: " + error.to_string())
  }
}

///|
fn line_drawstyle_source_path_34() -> Unit raise {
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([
      0UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
      4621256167635550208UL.reinterpret_as_double(),
    ]),
    LineData::Numeric([
      4607182418800017408UL.reinterpret_as_double(),
      4616189618054758400UL.reinterpret_as_double(),
      13837309855095848960UL.reinterpret_as_double(),
      4620693217682128896UL.reinterpret_as_double(),
    ]),
    color="blue",
  )
  // Setup bridge: source constructed then recached its short Line before attachment.
  line.set_drawstyle("default")
  line.recache_checked(always=true)
  line.set_drawstyle("steps-mid")
  line.mark_drawn()
  // Initial host bridge only: plain source view/data/minpos before the scenario.
  axes.state.val.raw_x_data = @core.limits(
    0UL.reinterpret_as_double(),
    4621256167635550208UL.reinterpret_as_double(),
  )
  axes.state.val.raw_y_data = @core.limits(
    13837309855095848960UL.reinterpret_as_double(),
    4620693217682128896UL.reinterpret_as_double(),
  )
  axes.state.val.x_data_minpos = 4611686018427387904UL.reinterpret_as_double()
  axes.state.val.y_data_minpos = 4607182418800017408UL.reinterpret_as_double()
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
  // actual Path construction steps-mid N=4
  try {
    line_drawstyle_source_state(
      line,
      axes,
      "steps-mid",
      false,
      [true, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        4621256167635550208UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4620693217682128896UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        4621256167635550208UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4620693217682128896UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4621256167635550208UL.reinterpret_as_double(),
        4620693217682128896UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4621256167635550208UL.reinterpret_as_double(),
        4620693217682128896UL.reinterpret_as_double(),
      ],
      true,
      [
        0UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4621256167635550208UL.reinterpret_as_double(),
        4620693217682128896UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    let returned = line.path_values_checked()
    line_drawstyle_source_numbers(returned.to_array(), [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4616189618054758400UL.reinterpret_as_double(),
      4615063718147915776UL.reinterpret_as_double(),
      4616189618054758400UL.reinterpret_as_double(),
      4615063718147915776UL.reinterpret_as_double(),
      13837309855095848960UL.reinterpret_as_double(),
      4619567317775286272UL.reinterpret_as_double(),
      13837309855095848960UL.reinterpret_as_double(),
      4619567317775286272UL.reinterpret_as_double(),
      4620693217682128896UL.reinterpret_as_double(),
      4621256167635550208UL.reinterpret_as_double(),
      4620693217682128896UL.reinterpret_as_double(),
    ])
    line_drawstyle_source_state(
      line,
      axes,
      "steps-mid",
      false,
      [false, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        4621256167635550208UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4620693217682128896UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        4621256167635550208UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4620693217682128896UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4621256167635550208UL.reinterpret_as_double(),
        4620693217682128896UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4615063718147915776UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4615063718147915776UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4619567317775286272UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4619567317775286272UL.reinterpret_as_double(),
        4620693217682128896UL.reinterpret_as_double(),
        4621256167635550208UL.reinterpret_as_double(),
        4620693217682128896UL.reinterpret_as_double(),
      ],
      false,
      [
        0UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4621256167635550208UL.reinterpret_as_double(),
        4620693217682128896UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original drawstyle row 34: " + error.to_string())
  }
}

///|
fn line_drawstyle_source_path_35() -> Unit raise {
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([0.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0]),
    LineData::Numeric([
      4607182418800017408UL.reinterpret_as_double(),
      13835058055282163712UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
    ]),
    color="blue",
  )
  // Setup bridge: source constructed then recached its short Line before attachment.
  line.set_drawstyle("default")
  line.recache_checked(always=true)
  line.set_drawstyle("steps-mid")
  line.mark_drawn()
  // Initial host bridge only: plain source view/data/minpos before the scenario.
  axes.state.val.raw_x_data = @core.limits(1.0 / 0.0, -1.0 / 0.0)
  axes.state.val.raw_y_data = @core.limits(1.0 / 0.0, -1.0 / 0.0)
  axes.state.val.x_data_minpos = 1.0 / 0.0
  axes.state.val.y_data_minpos = 1.0 / 0.0
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
  // actual Path construction steps-mid N=3
  try {
    line_drawstyle_source_state(
      line,
      axes,
      "steps-mid",
      false,
      [true, false],
      LineData::Numeric([0.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        13835058055282163712UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ]),
      [0.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0],
      [
        4607182418800017408UL.reinterpret_as_double(),
        13835058055282163712UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0.0 / 0.0,
        4607182418800017408UL.reinterpret_as_double(),
        1.0 / 0.0,
        13835058055282163712UL.reinterpret_as_double(),
        -1.0 / 0.0,
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0.0 / 0.0,
        4607182418800017408UL.reinterpret_as_double(),
        1.0 / 0.0,
        13835058055282163712UL.reinterpret_as_double(),
        -1.0 / 0.0,
        4613937818241073152UL.reinterpret_as_double(),
      ],
      true,
      [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
      [1.0 / 0.0, 1.0 / 0.0],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    let returned = line.path_values_checked()
    line_drawstyle_source_numbers(returned.to_array(), [
      0.0 / 0.0,
      4607182418800017408UL.reinterpret_as_double(),
      0.0 / 0.0,
      4607182418800017408UL.reinterpret_as_double(),
      0.0 / 0.0,
      13835058055282163712UL.reinterpret_as_double(),
      0.0 / 0.0,
      13835058055282163712UL.reinterpret_as_double(),
      0.0 / 0.0,
      4613937818241073152UL.reinterpret_as_double(),
      -1.0 / 0.0,
      4613937818241073152UL.reinterpret_as_double(),
    ])
    line_drawstyle_source_state(
      line,
      axes,
      "steps-mid",
      false,
      [false, false],
      LineData::Numeric([0.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        13835058055282163712UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ]),
      [0.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0],
      [
        4607182418800017408UL.reinterpret_as_double(),
        13835058055282163712UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0.0 / 0.0,
        4607182418800017408UL.reinterpret_as_double(),
        1.0 / 0.0,
        13835058055282163712UL.reinterpret_as_double(),
        -1.0 / 0.0,
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0.0 / 0.0,
        4607182418800017408UL.reinterpret_as_double(),
        0.0 / 0.0,
        4607182418800017408UL.reinterpret_as_double(),
        0.0 / 0.0,
        13835058055282163712UL.reinterpret_as_double(),
        0.0 / 0.0,
        13835058055282163712UL.reinterpret_as_double(),
        0.0 / 0.0,
        4613937818241073152UL.reinterpret_as_double(),
        -1.0 / 0.0,
        4613937818241073152UL.reinterpret_as_double(),
      ],
      false,
      [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
      [1.0 / 0.0, 1.0 / 0.0],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original drawstyle row 35: " + error.to_string())
  }
}

///|
fn line_drawstyle_source_path_36() -> Unit raise {
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([
      9218868437227405311UL.reinterpret_as_double(),
      9218868437227405311UL.reinterpret_as_double(),
    ]),
    LineData::Numeric([
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
    ]),
    color="blue",
  )
  // Setup bridge: source constructed then recached its short Line before attachment.
  line.set_drawstyle("default")
  line.recache_checked(always=true)
  line.set_drawstyle("steps-mid")
  line.mark_drawn()
  // Initial host bridge only: plain source view/data/minpos before the scenario.
  axes.state.val.raw_x_data = @core.limits(
    9218868437227405311UL.reinterpret_as_double(),
    9218868437227405311UL.reinterpret_as_double(),
  )
  axes.state.val.raw_y_data = @core.limits(
    4607182418800017408UL.reinterpret_as_double(),
    4611686018427387904UL.reinterpret_as_double(),
  )
  axes.state.val.x_data_minpos = 9218868437227405311UL.reinterpret_as_double()
  axes.state.val.y_data_minpos = 4607182418800017408UL.reinterpret_as_double()
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
  // actual Path construction steps-mid N=2
  try {
    line_drawstyle_source_state(
      line,
      axes,
      "steps-mid",
      false,
      [true, false],
      LineData::Numeric([
        9218868437227405311UL.reinterpret_as_double(),
        9218868437227405311UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      [
        9218868437227405311UL.reinterpret_as_double(),
        9218868437227405311UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        9218868437227405311UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        9218868437227405311UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        9218868437227405311UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        9218868437227405311UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      true,
      [
        9218868437227405311UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        9218868437227405311UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        9218868437227405311UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    let returned = line.path_values_checked()
    line_drawstyle_source_numbers(returned.to_array(), [
      9218868437227405311UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      1.0 / 0.0,
      4607182418800017408UL.reinterpret_as_double(),
      1.0 / 0.0,
      4611686018427387904UL.reinterpret_as_double(),
      9218868437227405311UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
    ])
    line_drawstyle_source_state(
      line,
      axes,
      "steps-mid",
      false,
      [false, false],
      LineData::Numeric([
        9218868437227405311UL.reinterpret_as_double(),
        9218868437227405311UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      [
        9218868437227405311UL.reinterpret_as_double(),
        9218868437227405311UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        9218868437227405311UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        9218868437227405311UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        9218868437227405311UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        1.0 / 0.0,
        4607182418800017408UL.reinterpret_as_double(),
        1.0 / 0.0,
        4611686018427387904UL.reinterpret_as_double(),
        9218868437227405311UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      false,
      [
        9218868437227405311UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        9218868437227405311UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        9218868437227405311UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original drawstyle row 36: " + error.to_string())
  }
}

///|
fn line_drawstyle_source_path_37() -> Unit raise {
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([]),
    LineData::Numeric([]),
    color="blue",
  )
  // Setup bridge: source constructed then recached its short Line before attachment.
  line.set_drawstyle("default")
  line.recache_checked(always=true)
  line.set_drawstyle("steps-post")
  line.mark_drawn()
  // Initial host bridge only: plain source view/data/minpos before the scenario.
  axes.state.val.raw_x_data = @core.limits(1.0 / 0.0, -1.0 / 0.0)
  axes.state.val.raw_y_data = @core.limits(1.0 / 0.0, -1.0 / 0.0)
  axes.state.val.x_data_minpos = 1.0 / 0.0
  axes.state.val.y_data_minpos = 1.0 / 0.0
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
  // actual Path construction steps-post N=0
  try {
    line_drawstyle_source_state(
      line,
      axes,
      "steps-post",
      false,
      [true, false],
      LineData::Numeric([]),
      LineData::Numeric([]),
      [],
      [],
      [],
      [],
      true,
      [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
      [1.0 / 0.0, 1.0 / 0.0],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    let returned = line.path_values_checked()
    line_drawstyle_source_numbers(returned.to_array(), [])
    line_drawstyle_source_state(
      line,
      axes,
      "steps-post",
      false,
      [false, false],
      LineData::Numeric([]),
      LineData::Numeric([]),
      [],
      [],
      [],
      [],
      false,
      [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
      [1.0 / 0.0, 1.0 / 0.0],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original drawstyle row 37: " + error.to_string())
  }
}

///|
fn line_drawstyle_source_path_38() -> Unit raise {
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([4611686018427387904UL.reinterpret_as_double()]),
    LineData::Numeric([4613937818241073152UL.reinterpret_as_double()]),
    color="blue",
  )
  // Setup bridge: source constructed then recached its short Line before attachment.
  line.set_drawstyle("default")
  line.recache_checked(always=true)
  line.set_drawstyle("steps-post")
  line.mark_drawn()
  // Initial host bridge only: plain source view/data/minpos before the scenario.
  axes.state.val.raw_x_data = @core.limits(
    4611686018427387904UL.reinterpret_as_double(),
    4611686018427387904UL.reinterpret_as_double(),
  )
  axes.state.val.raw_y_data = @core.limits(
    4613937818241073152UL.reinterpret_as_double(),
    4613937818241073152UL.reinterpret_as_double(),
  )
  axes.state.val.x_data_minpos = 4611686018427387904UL.reinterpret_as_double()
  axes.state.val.y_data_minpos = 4613937818241073152UL.reinterpret_as_double()
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
  // actual Path construction steps-post N=1
  try {
    line_drawstyle_source_state(
      line,
      axes,
      "steps-post",
      false,
      [true, false],
      LineData::Numeric([4611686018427387904UL.reinterpret_as_double()]),
      LineData::Numeric([4613937818241073152UL.reinterpret_as_double()]),
      [4611686018427387904UL.reinterpret_as_double()],
      [4613937818241073152UL.reinterpret_as_double()],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      true,
      [
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    let returned = line.path_values_checked()
    line_drawstyle_source_numbers(returned.to_array(), [
      4611686018427387904UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
    ])
    line_drawstyle_source_state(
      line,
      axes,
      "steps-post",
      false,
      [false, false],
      LineData::Numeric([4611686018427387904UL.reinterpret_as_double()]),
      LineData::Numeric([4613937818241073152UL.reinterpret_as_double()]),
      [4611686018427387904UL.reinterpret_as_double()],
      [4613937818241073152UL.reinterpret_as_double()],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      false,
      [
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original drawstyle row 38: " + error.to_string())
  }
}

///|
fn line_drawstyle_source_path_39() -> Unit raise {
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([
      0UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
    ]),
    LineData::Numeric([
      4607182418800017408UL.reinterpret_as_double(),
      4616189618054758400UL.reinterpret_as_double(),
    ]),
    color="blue",
  )
  // Setup bridge: source constructed then recached its short Line before attachment.
  line.set_drawstyle("default")
  line.recache_checked(always=true)
  line.set_drawstyle("steps-post")
  line.mark_drawn()
  // Initial host bridge only: plain source view/data/minpos before the scenario.
  axes.state.val.raw_x_data = @core.limits(
    0UL.reinterpret_as_double(),
    4611686018427387904UL.reinterpret_as_double(),
  )
  axes.state.val.raw_y_data = @core.limits(
    4607182418800017408UL.reinterpret_as_double(),
    4616189618054758400UL.reinterpret_as_double(),
  )
  axes.state.val.x_data_minpos = 4611686018427387904UL.reinterpret_as_double()
  axes.state.val.y_data_minpos = 4607182418800017408UL.reinterpret_as_double()
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
  // actual Path construction steps-post N=2
  try {
    line_drawstyle_source_state(
      line,
      axes,
      "steps-post",
      false,
      [true, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      true,
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    let returned = line.path_values_checked()
    line_drawstyle_source_numbers(returned.to_array(), [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4616189618054758400UL.reinterpret_as_double(),
    ])
    line_drawstyle_source_state(
      line,
      axes,
      "steps-post",
      false,
      [false, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      false,
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original drawstyle row 39: " + error.to_string())
  }
}

///|
fn line_drawstyle_source_path_40() -> Unit raise {
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([
      0UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
      4621256167635550208UL.reinterpret_as_double(),
    ]),
    LineData::Numeric([
      4607182418800017408UL.reinterpret_as_double(),
      4616189618054758400UL.reinterpret_as_double(),
      13837309855095848960UL.reinterpret_as_double(),
      4620693217682128896UL.reinterpret_as_double(),
    ]),
    color="blue",
  )
  // Setup bridge: source constructed then recached its short Line before attachment.
  line.set_drawstyle("default")
  line.recache_checked(always=true)
  line.set_drawstyle("steps-post")
  line.mark_drawn()
  // Initial host bridge only: plain source view/data/minpos before the scenario.
  axes.state.val.raw_x_data = @core.limits(
    0UL.reinterpret_as_double(),
    4621256167635550208UL.reinterpret_as_double(),
  )
  axes.state.val.raw_y_data = @core.limits(
    13837309855095848960UL.reinterpret_as_double(),
    4620693217682128896UL.reinterpret_as_double(),
  )
  axes.state.val.x_data_minpos = 4611686018427387904UL.reinterpret_as_double()
  axes.state.val.y_data_minpos = 4607182418800017408UL.reinterpret_as_double()
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
  // actual Path construction steps-post N=4
  try {
    line_drawstyle_source_state(
      line,
      axes,
      "steps-post",
      false,
      [true, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        4621256167635550208UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4620693217682128896UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        4621256167635550208UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4620693217682128896UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4621256167635550208UL.reinterpret_as_double(),
        4620693217682128896UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4621256167635550208UL.reinterpret_as_double(),
        4620693217682128896UL.reinterpret_as_double(),
      ],
      true,
      [
        0UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4621256167635550208UL.reinterpret_as_double(),
        4620693217682128896UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    let returned = line.path_values_checked()
    line_drawstyle_source_numbers(returned.to_array(), [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4616189618054758400UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
      4616189618054758400UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
      13837309855095848960UL.reinterpret_as_double(),
      4621256167635550208UL.reinterpret_as_double(),
      13837309855095848960UL.reinterpret_as_double(),
      4621256167635550208UL.reinterpret_as_double(),
      4620693217682128896UL.reinterpret_as_double(),
    ])
    line_drawstyle_source_state(
      line,
      axes,
      "steps-post",
      false,
      [false, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        4621256167635550208UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4620693217682128896UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        4621256167635550208UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4620693217682128896UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4621256167635550208UL.reinterpret_as_double(),
        4620693217682128896UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4621256167635550208UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4621256167635550208UL.reinterpret_as_double(),
        4620693217682128896UL.reinterpret_as_double(),
      ],
      false,
      [
        0UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4621256167635550208UL.reinterpret_as_double(),
        4620693217682128896UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original drawstyle row 40: " + error.to_string())
  }
}

///|
fn line_drawstyle_source_path_41() -> Unit raise {
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([0.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0]),
    LineData::Numeric([
      4607182418800017408UL.reinterpret_as_double(),
      13835058055282163712UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
    ]),
    color="blue",
  )
  // Setup bridge: source constructed then recached its short Line before attachment.
  line.set_drawstyle("default")
  line.recache_checked(always=true)
  line.set_drawstyle("steps-post")
  line.mark_drawn()
  // Initial host bridge only: plain source view/data/minpos before the scenario.
  axes.state.val.raw_x_data = @core.limits(1.0 / 0.0, -1.0 / 0.0)
  axes.state.val.raw_y_data = @core.limits(1.0 / 0.0, -1.0 / 0.0)
  axes.state.val.x_data_minpos = 1.0 / 0.0
  axes.state.val.y_data_minpos = 1.0 / 0.0
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
  // actual Path construction steps-post N=3
  try {
    line_drawstyle_source_state(
      line,
      axes,
      "steps-post",
      false,
      [true, false],
      LineData::Numeric([0.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        13835058055282163712UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ]),
      [0.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0],
      [
        4607182418800017408UL.reinterpret_as_double(),
        13835058055282163712UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0.0 / 0.0,
        4607182418800017408UL.reinterpret_as_double(),
        1.0 / 0.0,
        13835058055282163712UL.reinterpret_as_double(),
        -1.0 / 0.0,
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0.0 / 0.0,
        4607182418800017408UL.reinterpret_as_double(),
        1.0 / 0.0,
        13835058055282163712UL.reinterpret_as_double(),
        -1.0 / 0.0,
        4613937818241073152UL.reinterpret_as_double(),
      ],
      true,
      [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
      [1.0 / 0.0, 1.0 / 0.0],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    let returned = line.path_values_checked()
    line_drawstyle_source_numbers(returned.to_array(), [
      0.0 / 0.0,
      4607182418800017408UL.reinterpret_as_double(),
      1.0 / 0.0,
      4607182418800017408UL.reinterpret_as_double(),
      1.0 / 0.0,
      13835058055282163712UL.reinterpret_as_double(),
      -1.0 / 0.0,
      13835058055282163712UL.reinterpret_as_double(),
      -1.0 / 0.0,
      4613937818241073152UL.reinterpret_as_double(),
    ])
    line_drawstyle_source_state(
      line,
      axes,
      "steps-post",
      false,
      [false, false],
      LineData::Numeric([0.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        13835058055282163712UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ]),
      [0.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0],
      [
        4607182418800017408UL.reinterpret_as_double(),
        13835058055282163712UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0.0 / 0.0,
        4607182418800017408UL.reinterpret_as_double(),
        1.0 / 0.0,
        13835058055282163712UL.reinterpret_as_double(),
        -1.0 / 0.0,
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0.0 / 0.0,
        4607182418800017408UL.reinterpret_as_double(),
        1.0 / 0.0,
        4607182418800017408UL.reinterpret_as_double(),
        1.0 / 0.0,
        13835058055282163712UL.reinterpret_as_double(),
        -1.0 / 0.0,
        13835058055282163712UL.reinterpret_as_double(),
        -1.0 / 0.0,
        4613937818241073152UL.reinterpret_as_double(),
      ],
      false,
      [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
      [1.0 / 0.0, 1.0 / 0.0],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original drawstyle row 41: " + error.to_string())
  }
}

///|
fn line_drawstyle_source_path_42() -> Unit raise {
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([
      9218868437227405311UL.reinterpret_as_double(),
      9218868437227405311UL.reinterpret_as_double(),
    ]),
    LineData::Numeric([
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
    ]),
    color="blue",
  )
  // Setup bridge: source constructed then recached its short Line before attachment.
  line.set_drawstyle("default")
  line.recache_checked(always=true)
  line.set_drawstyle("steps-post")
  line.mark_drawn()
  // Initial host bridge only: plain source view/data/minpos before the scenario.
  axes.state.val.raw_x_data = @core.limits(
    9218868437227405311UL.reinterpret_as_double(),
    9218868437227405311UL.reinterpret_as_double(),
  )
  axes.state.val.raw_y_data = @core.limits(
    4607182418800017408UL.reinterpret_as_double(),
    4611686018427387904UL.reinterpret_as_double(),
  )
  axes.state.val.x_data_minpos = 9218868437227405311UL.reinterpret_as_double()
  axes.state.val.y_data_minpos = 4607182418800017408UL.reinterpret_as_double()
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
  // actual Path construction steps-post N=2
  try {
    line_drawstyle_source_state(
      line,
      axes,
      "steps-post",
      false,
      [true, false],
      LineData::Numeric([
        9218868437227405311UL.reinterpret_as_double(),
        9218868437227405311UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      [
        9218868437227405311UL.reinterpret_as_double(),
        9218868437227405311UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        9218868437227405311UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        9218868437227405311UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        9218868437227405311UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        9218868437227405311UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      true,
      [
        9218868437227405311UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        9218868437227405311UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        9218868437227405311UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    let returned = line.path_values_checked()
    line_drawstyle_source_numbers(returned.to_array(), [
      9218868437227405311UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      9218868437227405311UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      9218868437227405311UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
    ])
    line_drawstyle_source_state(
      line,
      axes,
      "steps-post",
      false,
      [false, false],
      LineData::Numeric([
        9218868437227405311UL.reinterpret_as_double(),
        9218868437227405311UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      [
        9218868437227405311UL.reinterpret_as_double(),
        9218868437227405311UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        9218868437227405311UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        9218868437227405311UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        9218868437227405311UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        9218868437227405311UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        9218868437227405311UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      false,
      [
        9218868437227405311UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        9218868437227405311UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        9218868437227405311UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original drawstyle row 42: " + error.to_string())
  }
}

///|
test "original five drawstyle native Path vertex matrix" {
  line_drawstyle_source_path_13()
  line_drawstyle_source_path_14()
  line_drawstyle_source_path_15()
  line_drawstyle_source_path_16()
  line_drawstyle_source_path_17()
  line_drawstyle_source_path_18()
  line_drawstyle_source_path_19()
  line_drawstyle_source_path_20()
  line_drawstyle_source_path_21()
  line_drawstyle_source_path_22()
  line_drawstyle_source_path_23()
  line_drawstyle_source_path_24()
  line_drawstyle_source_path_25()
  line_drawstyle_source_path_26()
  line_drawstyle_source_path_27()
  line_drawstyle_source_path_28()
  line_drawstyle_source_path_29()
  line_drawstyle_source_path_30()
  line_drawstyle_source_path_31()
  line_drawstyle_source_path_32()
  line_drawstyle_source_path_33()
  line_drawstyle_source_path_34()
  line_drawstyle_source_path_35()
  line_drawstyle_source_path_36()
  line_drawstyle_source_path_37()
  line_drawstyle_source_path_38()
  line_drawstyle_source_path_39()
  line_drawstyle_source_path_40()
  line_drawstyle_source_path_41()
  line_drawstyle_source_path_42()
}

///|
fn line_drawstyle_source_xy_alias_43() -> Unit raise {
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([
      0UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
    ]),
    LineData::Numeric([
      4607182418800017408UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
    ]),
    color="blue",
  )
  // Setup bridge: source constructed then recached its short Line before attachment.
  line.set_drawstyle("default")
  line.recache_checked(always=true)
  line.mark_drawn()
  // Initial host bridge only: plain source view/data/minpos before the scenario.
  axes.state.val.raw_x_data = @core.limits(
    0UL.reinterpret_as_double(),
    4611686018427387904UL.reinterpret_as_double(),
  )
  axes.state.val.raw_y_data = @core.limits(
    4607182418800017408UL.reinterpret_as_double(),
    4613937818241073152UL.reinterpret_as_double(),
  )
  axes.state.val.x_data_minpos = 4611686018427387904UL.reinterpret_as_double()
  axes.state.val.y_data_minpos = 4607182418800017408UL.reinterpret_as_double()
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
  let held_xy = line.xy_values_checked()
  let held_x = line.x_values_checked()
  let held_path = line.path_values_checked()
  // borrow xy mutation default
  try {
    line_drawstyle_source_state(
      line,
      axes,
      "default",
      false,
      [false, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      true,
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    held_xy.set(0, -10.0)
    held_xy.set(1, 100.0)
    line_drawstyle_source_state(
      line,
      axes,
      "default",
      false,
      [false, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ]),
      [
        13845191154443747328UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        4636737291354636288UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        13845191154443747328UL.reinterpret_as_double(),
        4636737291354636288UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        13845191154443747328UL.reinterpret_as_double(),
        4636737291354636288UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      true,
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line_drawstyle_source_numbers(held_xy.to_array(), [
      13845191154443747328UL.reinterpret_as_double(),
      4636737291354636288UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
    ])
    line_drawstyle_source_numbers(held_x.to_array(), [
      13845191154443747328UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
    ])
    line_drawstyle_source_numbers(held_path.to_array(), [
      13845191154443747328UL.reinterpret_as_double(),
      4636737291354636288UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
    ])
  } catch {
    error => fail("original drawstyle row 43: " + error.to_string())
  }
  // relim existing path after xy mutation default
  try {
    line_drawstyle_source_state(
      line,
      axes,
      "default",
      false,
      [false, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ]),
      [
        13845191154443747328UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        4636737291354636288UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        13845191154443747328UL.reinterpret_as_double(),
        4636737291354636288UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        13845191154443747328UL.reinterpret_as_double(),
        4636737291354636288UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      true,
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    axes.relim_checked()
    line_drawstyle_source_state(
      line,
      axes,
      "default",
      false,
      [false, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ]),
      [
        13845191154443747328UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        4636737291354636288UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        13845191154443747328UL.reinterpret_as_double(),
        4636737291354636288UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        13845191154443747328UL.reinterpret_as_double(),
        4636737291354636288UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      true,
      [
        13845191154443747328UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4636737291354636288UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line_drawstyle_source_numbers(held_xy.to_array(), [
      13845191154443747328UL.reinterpret_as_double(),
      4636737291354636288UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
    ])
    line_drawstyle_source_numbers(held_x.to_array(), [
      13845191154443747328UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
    ])
    line_drawstyle_source_numbers(held_path.to_array(), [
      13845191154443747328UL.reinterpret_as_double(),
      4636737291354636288UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
    ])
  } catch {
    error => fail("original drawstyle row 44: " + error.to_string())
  }
  // forced recache fresh generation default
  try {
    line_drawstyle_source_state(
      line,
      axes,
      "default",
      false,
      [false, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ]),
      [
        13845191154443747328UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        4636737291354636288UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        13845191154443747328UL.reinterpret_as_double(),
        4636737291354636288UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        13845191154443747328UL.reinterpret_as_double(),
        4636737291354636288UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      true,
      [
        13845191154443747328UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4636737291354636288UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line.recache_checked(always=true)
    line_drawstyle_source_state(
      line,
      axes,
      "default",
      false,
      [false, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      true,
      [
        13845191154443747328UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4636737291354636288UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line_drawstyle_source_numbers(held_xy.to_array(), [
      13845191154443747328UL.reinterpret_as_double(),
      4636737291354636288UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
    ])
    line_drawstyle_source_numbers(held_x.to_array(), [
      13845191154443747328UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
    ])
    line_drawstyle_source_numbers(held_path.to_array(), [
      13845191154443747328UL.reinterpret_as_double(),
      4636737291354636288UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
    ])
  } catch {
    error => fail("original drawstyle row 45: " + error.to_string())
  }
}

///|
fn line_drawstyle_source_xy_alias_46() -> Unit raise {
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([
      0UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
    ]),
    LineData::Numeric([
      4607182418800017408UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
    ]),
    color="blue",
  )
  // Setup bridge: source constructed then recached its short Line before attachment.
  line.set_drawstyle("steps-pre")
  line.recache_checked(always=true)
  line.mark_drawn()
  // Initial host bridge only: plain source view/data/minpos before the scenario.
  axes.state.val.raw_x_data = @core.limits(
    0UL.reinterpret_as_double(),
    4611686018427387904UL.reinterpret_as_double(),
  )
  axes.state.val.raw_y_data = @core.limits(
    4607182418800017408UL.reinterpret_as_double(),
    4613937818241073152UL.reinterpret_as_double(),
  )
  axes.state.val.x_data_minpos = 4611686018427387904UL.reinterpret_as_double()
  axes.state.val.y_data_minpos = 4607182418800017408UL.reinterpret_as_double()
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
  let held_xy = line.xy_values_checked()
  let held_x = line.x_values_checked()
  let held_path = line.path_values_checked()
  // borrow xy mutation steps-pre
  try {
    line_drawstyle_source_state(
      line,
      axes,
      "steps-pre",
      false,
      [false, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      false,
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    held_xy.set(0, -10.0)
    held_xy.set(1, 100.0)
    line_drawstyle_source_state(
      line,
      axes,
      "steps-pre",
      false,
      [false, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ]),
      [
        13845191154443747328UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        4636737291354636288UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        13845191154443747328UL.reinterpret_as_double(),
        4636737291354636288UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      false,
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line_drawstyle_source_numbers(held_xy.to_array(), [
      13845191154443747328UL.reinterpret_as_double(),
      4636737291354636288UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
    ])
    line_drawstyle_source_numbers(held_x.to_array(), [
      13845191154443747328UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
    ])
    line_drawstyle_source_numbers(held_path.to_array(), [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
    ])
  } catch {
    error => fail("original drawstyle row 46: " + error.to_string())
  }
  // relim existing path after xy mutation steps-pre
  try {
    line_drawstyle_source_state(
      line,
      axes,
      "steps-pre",
      false,
      [false, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ]),
      [
        13845191154443747328UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        4636737291354636288UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        13845191154443747328UL.reinterpret_as_double(),
        4636737291354636288UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      false,
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    axes.relim_checked()
    line_drawstyle_source_state(
      line,
      axes,
      "steps-pre",
      false,
      [false, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ]),
      [
        13845191154443747328UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        4636737291354636288UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        13845191154443747328UL.reinterpret_as_double(),
        4636737291354636288UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      false,
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line_drawstyle_source_numbers(held_xy.to_array(), [
      13845191154443747328UL.reinterpret_as_double(),
      4636737291354636288UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
    ])
    line_drawstyle_source_numbers(held_x.to_array(), [
      13845191154443747328UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
    ])
    line_drawstyle_source_numbers(held_path.to_array(), [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
    ])
  } catch {
    error => fail("original drawstyle row 47: " + error.to_string())
  }
  // forced recache fresh generation steps-pre
  try {
    line_drawstyle_source_state(
      line,
      axes,
      "steps-pre",
      false,
      [false, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ]),
      [
        13845191154443747328UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        4636737291354636288UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        13845191154443747328UL.reinterpret_as_double(),
        4636737291354636288UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      false,
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line.recache_checked(always=true)
    line_drawstyle_source_state(
      line,
      axes,
      "steps-pre",
      false,
      [false, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      false,
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line_drawstyle_source_numbers(held_xy.to_array(), [
      13845191154443747328UL.reinterpret_as_double(),
      4636737291354636288UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
    ])
    line_drawstyle_source_numbers(held_x.to_array(), [
      13845191154443747328UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
    ])
    line_drawstyle_source_numbers(held_path.to_array(), [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
    ])
  } catch {
    error => fail("original drawstyle row 48: " + error.to_string())
  }
}

///|
fn line_drawstyle_source_xy_alias_49() -> Unit raise {
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([
      0UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
    ]),
    LineData::Numeric([
      4607182418800017408UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
    ]),
    color="blue",
  )
  // Setup bridge: source constructed then recached its short Line before attachment.
  line.set_drawstyle("steps-mid")
  line.recache_checked(always=true)
  line.mark_drawn()
  // Initial host bridge only: plain source view/data/minpos before the scenario.
  axes.state.val.raw_x_data = @core.limits(
    0UL.reinterpret_as_double(),
    4611686018427387904UL.reinterpret_as_double(),
  )
  axes.state.val.raw_y_data = @core.limits(
    4607182418800017408UL.reinterpret_as_double(),
    4613937818241073152UL.reinterpret_as_double(),
  )
  axes.state.val.x_data_minpos = 4607182418800017408UL.reinterpret_as_double()
  axes.state.val.y_data_minpos = 4607182418800017408UL.reinterpret_as_double()
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
  let held_xy = line.xy_values_checked()
  let held_x = line.x_values_checked()
  let held_path = line.path_values_checked()
  // borrow xy mutation steps-mid
  try {
    line_drawstyle_source_state(
      line,
      axes,
      "steps-mid",
      false,
      [false, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      false,
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    held_xy.set(0, -10.0)
    held_xy.set(1, 100.0)
    line_drawstyle_source_state(
      line,
      axes,
      "steps-mid",
      false,
      [false, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ]),
      [
        13845191154443747328UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        4636737291354636288UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        13845191154443747328UL.reinterpret_as_double(),
        4636737291354636288UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      false,
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line_drawstyle_source_numbers(held_xy.to_array(), [
      13845191154443747328UL.reinterpret_as_double(),
      4636737291354636288UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
    ])
    line_drawstyle_source_numbers(held_x.to_array(), [
      13845191154443747328UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
    ])
    line_drawstyle_source_numbers(held_path.to_array(), [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
    ])
  } catch {
    error => fail("original drawstyle row 49: " + error.to_string())
  }
  // relim existing path after xy mutation steps-mid
  try {
    line_drawstyle_source_state(
      line,
      axes,
      "steps-mid",
      false,
      [false, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ]),
      [
        13845191154443747328UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        4636737291354636288UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        13845191154443747328UL.reinterpret_as_double(),
        4636737291354636288UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      false,
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    axes.relim_checked()
    line_drawstyle_source_state(
      line,
      axes,
      "steps-mid",
      false,
      [false, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ]),
      [
        13845191154443747328UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        4636737291354636288UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        13845191154443747328UL.reinterpret_as_double(),
        4636737291354636288UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      false,
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line_drawstyle_source_numbers(held_xy.to_array(), [
      13845191154443747328UL.reinterpret_as_double(),
      4636737291354636288UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
    ])
    line_drawstyle_source_numbers(held_x.to_array(), [
      13845191154443747328UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
    ])
    line_drawstyle_source_numbers(held_path.to_array(), [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
    ])
  } catch {
    error => fail("original drawstyle row 50: " + error.to_string())
  }
  // forced recache fresh generation steps-mid
  try {
    line_drawstyle_source_state(
      line,
      axes,
      "steps-mid",
      false,
      [false, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ]),
      [
        13845191154443747328UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        4636737291354636288UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        13845191154443747328UL.reinterpret_as_double(),
        4636737291354636288UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      false,
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line.recache_checked(always=true)
    line_drawstyle_source_state(
      line,
      axes,
      "steps-mid",
      false,
      [false, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      false,
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line_drawstyle_source_numbers(held_xy.to_array(), [
      13845191154443747328UL.reinterpret_as_double(),
      4636737291354636288UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
    ])
    line_drawstyle_source_numbers(held_x.to_array(), [
      13845191154443747328UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
    ])
    line_drawstyle_source_numbers(held_path.to_array(), [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
    ])
  } catch {
    error => fail("original drawstyle row 51: " + error.to_string())
  }
}

///|
fn line_drawstyle_source_xy_alias_52() -> Unit raise {
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([
      0UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
    ]),
    LineData::Numeric([
      4607182418800017408UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
    ]),
    color="blue",
  )
  // Setup bridge: source constructed then recached its short Line before attachment.
  line.set_drawstyle("steps-post")
  line.recache_checked(always=true)
  line.mark_drawn()
  // Initial host bridge only: plain source view/data/minpos before the scenario.
  axes.state.val.raw_x_data = @core.limits(
    0UL.reinterpret_as_double(),
    4611686018427387904UL.reinterpret_as_double(),
  )
  axes.state.val.raw_y_data = @core.limits(
    4607182418800017408UL.reinterpret_as_double(),
    4613937818241073152UL.reinterpret_as_double(),
  )
  axes.state.val.x_data_minpos = 4611686018427387904UL.reinterpret_as_double()
  axes.state.val.y_data_minpos = 4607182418800017408UL.reinterpret_as_double()
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
  let held_xy = line.xy_values_checked()
  let held_x = line.x_values_checked()
  let held_path = line.path_values_checked()
  // borrow xy mutation steps-post
  try {
    line_drawstyle_source_state(
      line,
      axes,
      "steps-post",
      false,
      [false, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      false,
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    held_xy.set(0, -10.0)
    held_xy.set(1, 100.0)
    line_drawstyle_source_state(
      line,
      axes,
      "steps-post",
      false,
      [false, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ]),
      [
        13845191154443747328UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        4636737291354636288UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        13845191154443747328UL.reinterpret_as_double(),
        4636737291354636288UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      false,
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line_drawstyle_source_numbers(held_xy.to_array(), [
      13845191154443747328UL.reinterpret_as_double(),
      4636737291354636288UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
    ])
    line_drawstyle_source_numbers(held_x.to_array(), [
      13845191154443747328UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
    ])
    line_drawstyle_source_numbers(held_path.to_array(), [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
    ])
  } catch {
    error => fail("original drawstyle row 52: " + error.to_string())
  }
  // relim existing path after xy mutation steps-post
  try {
    line_drawstyle_source_state(
      line,
      axes,
      "steps-post",
      false,
      [false, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ]),
      [
        13845191154443747328UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        4636737291354636288UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        13845191154443747328UL.reinterpret_as_double(),
        4636737291354636288UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      false,
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    axes.relim_checked()
    line_drawstyle_source_state(
      line,
      axes,
      "steps-post",
      false,
      [false, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ]),
      [
        13845191154443747328UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        4636737291354636288UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        13845191154443747328UL.reinterpret_as_double(),
        4636737291354636288UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      false,
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line_drawstyle_source_numbers(held_xy.to_array(), [
      13845191154443747328UL.reinterpret_as_double(),
      4636737291354636288UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
    ])
    line_drawstyle_source_numbers(held_x.to_array(), [
      13845191154443747328UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
    ])
    line_drawstyle_source_numbers(held_path.to_array(), [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
    ])
  } catch {
    error => fail("original drawstyle row 53: " + error.to_string())
  }
  // forced recache fresh generation steps-post
  try {
    line_drawstyle_source_state(
      line,
      axes,
      "steps-post",
      false,
      [false, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ]),
      [
        13845191154443747328UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        4636737291354636288UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        13845191154443747328UL.reinterpret_as_double(),
        4636737291354636288UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      false,
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line.recache_checked(always=true)
    line_drawstyle_source_state(
      line,
      axes,
      "steps-post",
      false,
      [false, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      false,
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line_drawstyle_source_numbers(held_xy.to_array(), [
      13845191154443747328UL.reinterpret_as_double(),
      4636737291354636288UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
    ])
    line_drawstyle_source_numbers(held_x.to_array(), [
      13845191154443747328UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
    ])
    line_drawstyle_source_numbers(held_path.to_array(), [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
    ])
  } catch {
    error => fail("original drawstyle row 54: " + error.to_string())
  }
}

///|
test "original borrowed processed xy and cached Path divergence" {
  line_drawstyle_source_xy_alias_43()
  line_drawstyle_source_xy_alias_46()
  line_drawstyle_source_xy_alias_49()
  line_drawstyle_source_xy_alias_52()
}

///|
fn line_drawstyle_source_lazy_y() -> Unit raise {
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([
      0UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ]),
    LineData::Numeric([
      4607182418800017408UL.reinterpret_as_double(),
      4616189618054758400UL.reinterpret_as_double(),
      13837309855095848960UL.reinterpret_as_double(),
    ]),
    color="blue",
  )
  // Setup bridge: source constructed then recached its short Line before attachment.
  line.set_drawstyle("default")
  line.recache_checked(always=true)
  line.mark_drawn()
  // Initial host bridge only: plain source view/data/minpos before the scenario.
  axes.state.val.raw_x_data = @core.limits(
    0UL.reinterpret_as_double(),
    4617315517961601024UL.reinterpret_as_double(),
  )
  axes.state.val.raw_y_data = @core.limits(
    13837309855095848960UL.reinterpret_as_double(),
    4616189618054758400UL.reinterpret_as_double(),
  )
  axes.state.val.x_data_minpos = 4611686018427387904UL.reinterpret_as_double()
  axes.state.val.y_data_minpos = 4607182418800017408UL.reinterpret_as_double()
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
  let held_x = line.x_values_checked()
  let held_path = line.path_values_checked()
  // y-only setter keeps old x query valid
  try {
    line_drawstyle_source_state(
      line,
      axes,
      "default",
      false,
      [false, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      true,
      [
        0UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line.set_ydata(LineData::Numeric([10.0, 20.0, 30.0]))
    line_drawstyle_source_state(
      line,
      axes,
      "default",
      true,
      [false, true],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
        4629137466983448576UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      true,
      [
        0UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line_drawstyle_source_numbers(held_x.to_array(), [
      0UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ])
    line_drawstyle_source_numbers(held_path.to_array(), [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4616189618054758400UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
      13837309855095848960UL.reinterpret_as_double(),
    ])
  } catch {
    error => fail("original drawstyle row 55: " + error.to_string())
  }
  // processed x does not recache y-only invalidation
  try {
    line_drawstyle_source_state(
      line,
      axes,
      "default",
      true,
      [false, true],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
        4629137466983448576UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      true,
      [
        0UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    let returned = line.x_values_checked()
    line_drawstyle_source_numbers(returned.to_array(), [
      0UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ])
    line_drawstyle_source_state(
      line,
      axes,
      "default",
      true,
      [false, true],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
        4629137466983448576UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      true,
      [
        0UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line_drawstyle_source_numbers(held_x.to_array(), [
      0UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ])
    line_drawstyle_source_numbers(held_path.to_array(), [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4616189618054758400UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
      13837309855095848960UL.reinterpret_as_double(),
    ])
  } catch {
    error => fail("original drawstyle row 56: " + error.to_string())
  }
  // changing drawstyle invalidates x and preserves old path
  try {
    line_drawstyle_source_state(
      line,
      axes,
      "default",
      true,
      [false, true],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
        4629137466983448576UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      true,
      [
        0UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line.set_drawstyle("steps-mid")
    line_drawstyle_source_state(
      line,
      axes,
      "steps-mid",
      true,
      [true, true],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
        4629137466983448576UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      true,
      [
        0UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line_drawstyle_source_numbers(held_x.to_array(), [
      0UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ])
    line_drawstyle_source_numbers(held_path.to_array(), [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4616189618054758400UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
      13837309855095848960UL.reinterpret_as_double(),
    ])
  } catch {
    error => fail("original drawstyle row 57: " + error.to_string())
  }
  // processed x now recaches both pending coordinates and stepped path
  try {
    line_drawstyle_source_state(
      line,
      axes,
      "steps-mid",
      true,
      [true, true],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
        4629137466983448576UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      true,
      [
        0UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    let returned = line.x_values_checked()
    line_drawstyle_source_numbers(returned.to_array(), [
      0UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ])
    line_drawstyle_source_state(
      line,
      axes,
      "steps-mid",
      true,
      [false, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
        4629137466983448576UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ],
      [
        4621819117588971520UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
        4629137466983448576UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        4629137466983448576UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
        4615063718147915776UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
        4615063718147915776UL.reinterpret_as_double(),
        4629137466983448576UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        4629137466983448576UL.reinterpret_as_double(),
      ],
      false,
      [
        0UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line_drawstyle_source_numbers(held_x.to_array(), [
      0UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ])
    line_drawstyle_source_numbers(held_path.to_array(), [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4616189618054758400UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
      13837309855095848960UL.reinterpret_as_double(),
    ])
  } catch {
    error => fail("original drawstyle row 58: " + error.to_string())
  }
}

///|
fn line_drawstyle_source_late_error() -> Unit raise {
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([
      0UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ]),
    LineData::Numeric([
      4607182418800017408UL.reinterpret_as_double(),
      4616189618054758400UL.reinterpret_as_double(),
      13837309855095848960UL.reinterpret_as_double(),
    ]),
    color="blue",
  )
  // Setup bridge: source constructed then recached its short Line before attachment.
  line.set_drawstyle("default")
  line.recache_checked(always=true)
  line.mark_drawn()
  // Initial host bridge only: plain source view/data/minpos before the scenario.
  axes.state.val.raw_x_data = @core.limits(
    0UL.reinterpret_as_double(),
    4617315517961601024UL.reinterpret_as_double(),
  )
  axes.state.val.raw_y_data = @core.limits(
    13837309855095848960UL.reinterpret_as_double(),
    4616189618054758400UL.reinterpret_as_double(),
  )
  axes.state.val.x_data_minpos = 4611686018427387904UL.reinterpret_as_double()
  axes.state.val.y_data_minpos = 4607182418800017408UL.reinterpret_as_double()
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
  // bad y setter no conversion
  try {
    line_drawstyle_source_state(
      line,
      axes,
      "default",
      false,
      [false, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      true,
      [
        0UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line.set_ydata(LineData::Numeric([1.0, 2.0]))
    line_drawstyle_source_state(
      line,
      axes,
      "default",
      true,
      [false, true],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      true,
      [
        0UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original drawstyle row 59: " + error.to_string())
  }
  // bad y old x query still succeeds
  try {
    line_drawstyle_source_state(
      line,
      axes,
      "default",
      true,
      [false, true],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      true,
      [
        0UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    let returned = line.x_values_checked()
    line_drawstyle_source_numbers(returned.to_array(), [
      0UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4617315517961601024UL.reinterpret_as_double(),
    ])
    line_drawstyle_source_state(
      line,
      axes,
      "default",
      true,
      [false, true],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      true,
      [
        0UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original drawstyle row 60: " + error.to_string())
  }
  // bad y get_path late shape error leaves previous xy path
  try {
    line_drawstyle_source_state(
      line,
      axes,
      "default",
      true,
      [false, true],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      true,
      [
        0UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    assert_true(
      try {
        ignore(line.path_values_checked())
        false
      } catch {
        @core.DataError::InvalidTicks(message~) =>
          message ==
          "shape mismatch: objects cannot be broadcast to a single shape.  Mismatch is between arg 0 with shape (3,) and arg 1 with shape (2,)."
        _ => false
      },
    )
    line_drawstyle_source_state(
      line,
      axes,
      "default",
      true,
      [false, true],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      true,
      [
        0UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original drawstyle row 61: " + error.to_string())
  }
  // bad y drawstyle change only x flag
  try {
    line_drawstyle_source_state(
      line,
      axes,
      "default",
      true,
      [false, true],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      true,
      [
        0UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line.set_drawstyle("steps-post")
    line_drawstyle_source_state(
      line,
      axes,
      "steps-post",
      true,
      [true, true],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      true,
      [
        0UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original drawstyle row 62: " + error.to_string())
  }
  // bad y relim clears dataLim before late path failure
  try {
    line_drawstyle_source_state(
      line,
      axes,
      "steps-post",
      true,
      [true, true],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      true,
      [
        0UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    assert_true(
      try {
        axes.relim_checked()
        false
      } catch {
        @core.DataError::InvalidTicks(message~) =>
          message ==
          "shape mismatch: objects cannot be broadcast to a single shape.  Mismatch is between arg 0 with shape (3,) and arg 1 with shape (2,)."
        _ => false
      },
    )
    line_drawstyle_source_state(
      line,
      axes,
      "steps-post",
      true,
      [true, true],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4617315517961601024UL.reinterpret_as_double(),
        13837309855095848960UL.reinterpret_as_double(),
      ],
      true,
      [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original drawstyle row 63: " + error.to_string())
  }
}

///|
fn line_drawstyle_source_unit_remap() -> Unit raise {
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Category(["a", "b", "a"]),
    LineData::Numeric([
      4607182418800017408UL.reinterpret_as_double(),
      4616189618054758400UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
    ]),
    color="blue",
  )
  // Setup bridge: source constructed then recached its short Line before attachment.
  line.set_drawstyle("steps-mid")
  line.recache_checked(always=true)
  line.mark_drawn()
  // Initial host bridge only: plain source view/data/minpos before the scenario.
  axes.state.val.raw_x_data = @core.limits(
    0UL.reinterpret_as_double(),
    4602678819172646912UL.reinterpret_as_double(),
  )
  axes.state.val.raw_y_data = @core.limits(
    4607182418800017408UL.reinterpret_as_double(),
    4616189618054758400UL.reinterpret_as_double(),
  )
  axes.state.val.x_data_minpos = 4602678819172646912UL.reinterpret_as_double()
  axes.state.val.y_data_minpos = 4607182418800017408UL.reinterpret_as_double()
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
  let held_path = line.path_values_checked()
  // unit remap force-recache rebuilds stepped path before relim request
  try {
    line_drawstyle_source_state(
      line,
      axes,
      "steps-mid",
      false,
      [false, false],
      LineData::Category(["a", "b", "a"]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4602678819172646912UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4602678819172646912UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4602678819172646912UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4602678819172646912UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      false,
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4602678819172646912UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4602678819172646912UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    axes.set_x_units(
      Some(@axis.AxisUnitTag::Category(@axis.CategoryUnits::new(["b", "a"]))),
    )
    line_drawstyle_source_state(
      line,
      axes,
      "steps-mid",
      false,
      [false, false],
      LineData::Category(["a", "b", "a"]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      [
        4607182418800017408UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4602678819172646912UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4602678819172646912UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4602678819172646912UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4602678819172646912UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      false,
      [
        4602678819172646912UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4602678819172646912UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [true, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["b", "a"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line_drawstyle_source_numbers(held_path.to_array(), [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4602678819172646912UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4602678819172646912UL.reinterpret_as_double(),
      4616189618054758400UL.reinterpret_as_double(),
      4602678819172646912UL.reinterpret_as_double(),
      4616189618054758400UL.reinterpret_as_double(),
      4602678819172646912UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
    ])
  } catch {
    error => fail("original drawstyle row 64: " + error.to_string())
  }
}

///|
fn line_drawstyle_source_path_alias_65() -> Unit raise {
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([
      0UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
    ]),
    LineData::Numeric([
      4607182418800017408UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
    ]),
    color="blue",
  )
  // Setup bridge: source constructed then recached its short Line before attachment.
  line.set_drawstyle("default")
  line.recache_checked(always=true)
  line.mark_drawn()
  // Initial host bridge only: plain source view/data/minpos before the scenario.
  axes.state.val.raw_x_data = @core.limits(
    0UL.reinterpret_as_double(),
    4611686018427387904UL.reinterpret_as_double(),
  )
  axes.state.val.raw_y_data = @core.limits(
    4607182418800017408UL.reinterpret_as_double(),
    4613937818241073152UL.reinterpret_as_double(),
  )
  axes.state.val.x_data_minpos = 4611686018427387904UL.reinterpret_as_double()
  axes.state.val.y_data_minpos = 4607182418800017408UL.reinterpret_as_double()
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
  let held_xy = line.xy_values_checked()
  let held_path = line.path_values_checked()
  // borrowed Path mutation default
  try {
    line_drawstyle_source_state(
      line,
      axes,
      "default",
      false,
      [false, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      true,
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    held_path.set(1, -50.0)
    line_drawstyle_source_state(
      line,
      axes,
      "default",
      false,
      [false, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        13855605728582041600UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        13855605728582041600UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        13855605728582041600UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      true,
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line_drawstyle_source_numbers(held_xy.to_array(), [
      0UL.reinterpret_as_double(),
      13855605728582041600UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
    ])
    line_drawstyle_source_numbers(held_path.to_array(), [
      0UL.reinterpret_as_double(),
      13855605728582041600UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
    ])
  } catch {
    error => fail("original drawstyle row 65: " + error.to_string())
  }
  // equal drawstyle retains borrowed Path default
  try {
    // Controlled input stale=False, not a drawing operation.
    line.mark_drawn()
    line_drawstyle_source_state(
      line,
      axes,
      "default",
      false,
      [false, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        13855605728582041600UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        13855605728582041600UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        13855605728582041600UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      true,
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line.set_drawstyle("default")
    line_drawstyle_source_state(
      line,
      axes,
      "default",
      false,
      [false, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        13855605728582041600UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        13855605728582041600UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        13855605728582041600UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      true,
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line_drawstyle_source_numbers(held_xy.to_array(), [
      0UL.reinterpret_as_double(),
      13855605728582041600UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
    ])
    line_drawstyle_source_numbers(held_path.to_array(), [
      0UL.reinterpret_as_double(),
      13855605728582041600UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
    ])
  } catch {
    error => fail("original drawstyle row 66: " + error.to_string())
  }
  // changed drawstyle retains old Path until query default
  try {
    line_drawstyle_source_state(
      line,
      axes,
      "default",
      false,
      [false, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        13855605728582041600UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        13855605728582041600UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        13855605728582041600UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      true,
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line.set_drawstyle("steps-pre")
    line_drawstyle_source_state(
      line,
      axes,
      "steps-pre",
      true,
      [true, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        13855605728582041600UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        13855605728582041600UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        13855605728582041600UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      true,
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line_drawstyle_source_numbers(held_xy.to_array(), [
      0UL.reinterpret_as_double(),
      13855605728582041600UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
    ])
    line_drawstyle_source_numbers(held_path.to_array(), [
      0UL.reinterpret_as_double(),
      13855605728582041600UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
    ])
  } catch {
    error => fail("original drawstyle row 67: " + error.to_string())
  }
  // get_path new generation retains pending-valid y default
  try {
    line_drawstyle_source_state(
      line,
      axes,
      "steps-pre",
      true,
      [true, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        13855605728582041600UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        13855605728582041600UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        13855605728582041600UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      true,
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    let returned = line.path_values_checked()
    line_drawstyle_source_numbers(returned.to_array(), [
      0UL.reinterpret_as_double(),
      13855605728582041600UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
    ])
    line_drawstyle_source_state(
      line,
      axes,
      "steps-pre",
      true,
      [false, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        13855605728582041600UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        13855605728582041600UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        13855605728582041600UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      false,
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line_drawstyle_source_numbers(held_xy.to_array(), [
      0UL.reinterpret_as_double(),
      13855605728582041600UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
    ])
    line_drawstyle_source_numbers(held_path.to_array(), [
      0UL.reinterpret_as_double(),
      13855605728582041600UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
    ])
  } catch {
    error => fail("original drawstyle row 68: " + error.to_string())
  }
  // always recache restores original y default
  try {
    line_drawstyle_source_state(
      line,
      axes,
      "steps-pre",
      true,
      [false, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        13855605728582041600UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        13855605728582041600UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        13855605728582041600UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      false,
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line.recache_checked(always=true)
    line_drawstyle_source_state(
      line,
      axes,
      "steps-pre",
      true,
      [false, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      false,
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        4611686018427387904UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line_drawstyle_source_numbers(held_xy.to_array(), [
      0UL.reinterpret_as_double(),
      13855605728582041600UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
    ])
    line_drawstyle_source_numbers(held_path.to_array(), [
      0UL.reinterpret_as_double(),
      13855605728582041600UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
    ])
  } catch {
    error => fail("original drawstyle row 69: " + error.to_string())
  }
}

///|
fn line_drawstyle_source_path_alias_70() -> Unit raise {
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([
      0UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
    ]),
    LineData::Numeric([
      4607182418800017408UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
    ]),
    color="blue",
  )
  // Setup bridge: source constructed then recached its short Line before attachment.
  line.set_drawstyle("steps-mid")
  line.recache_checked(always=true)
  line.mark_drawn()
  // Initial host bridge only: plain source view/data/minpos before the scenario.
  axes.state.val.raw_x_data = @core.limits(
    0UL.reinterpret_as_double(),
    4611686018427387904UL.reinterpret_as_double(),
  )
  axes.state.val.raw_y_data = @core.limits(
    4607182418800017408UL.reinterpret_as_double(),
    4613937818241073152UL.reinterpret_as_double(),
  )
  axes.state.val.x_data_minpos = 4607182418800017408UL.reinterpret_as_double()
  axes.state.val.y_data_minpos = 4607182418800017408UL.reinterpret_as_double()
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
  let held_xy = line.xy_values_checked()
  let held_path = line.path_values_checked()
  // borrowed Path mutation steps-mid
  try {
    line_drawstyle_source_state(
      line,
      axes,
      "steps-mid",
      false,
      [false, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      false,
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    held_path.set(1, -50.0)
    line_drawstyle_source_state(
      line,
      axes,
      "steps-mid",
      false,
      [false, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        13855605728582041600UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      false,
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line_drawstyle_source_numbers(held_xy.to_array(), [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
    ])
    line_drawstyle_source_numbers(held_path.to_array(), [
      0UL.reinterpret_as_double(),
      13855605728582041600UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
    ])
  } catch {
    error => fail("original drawstyle row 70: " + error.to_string())
  }
  // equal drawstyle retains borrowed Path steps-mid
  try {
    // Controlled input stale=False, not a drawing operation.
    line.mark_drawn()
    line_drawstyle_source_state(
      line,
      axes,
      "steps-mid",
      false,
      [false, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        13855605728582041600UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      false,
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line.set_drawstyle("steps-mid")
    line_drawstyle_source_state(
      line,
      axes,
      "steps-mid",
      false,
      [false, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        13855605728582041600UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      false,
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line_drawstyle_source_numbers(held_xy.to_array(), [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
    ])
    line_drawstyle_source_numbers(held_path.to_array(), [
      0UL.reinterpret_as_double(),
      13855605728582041600UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
    ])
  } catch {
    error => fail("original drawstyle row 71: " + error.to_string())
  }
  // changed drawstyle retains old Path until query steps-mid
  try {
    line_drawstyle_source_state(
      line,
      axes,
      "steps-mid",
      false,
      [false, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        13855605728582041600UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      false,
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line.set_drawstyle("steps-pre")
    line_drawstyle_source_state(
      line,
      axes,
      "steps-pre",
      true,
      [true, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        13855605728582041600UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      false,
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line_drawstyle_source_numbers(held_xy.to_array(), [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
    ])
    line_drawstyle_source_numbers(held_path.to_array(), [
      0UL.reinterpret_as_double(),
      13855605728582041600UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
    ])
  } catch {
    error => fail("original drawstyle row 72: " + error.to_string())
  }
  // get_path new generation retains pending-valid y steps-mid
  try {
    line_drawstyle_source_state(
      line,
      axes,
      "steps-pre",
      true,
      [true, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        13855605728582041600UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      false,
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    let returned = line.path_values_checked()
    line_drawstyle_source_numbers(returned.to_array(), [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
    ])
    line_drawstyle_source_state(
      line,
      axes,
      "steps-pre",
      true,
      [false, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      false,
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line_drawstyle_source_numbers(held_xy.to_array(), [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
    ])
    line_drawstyle_source_numbers(held_path.to_array(), [
      0UL.reinterpret_as_double(),
      13855605728582041600UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
    ])
  } catch {
    error => fail("original drawstyle row 73: " + error.to_string())
  }
  // always recache restores original y steps-mid
  try {
    line_drawstyle_source_state(
      line,
      axes,
      "steps-pre",
      true,
      [false, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      false,
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line.recache_checked(always=true)
    line_drawstyle_source_state(
      line,
      axes,
      "steps-pre",
      true,
      [false, false],
      LineData::Numeric([
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      LineData::Numeric([
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ]),
      [
        0UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      false,
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [false, false],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      ["a", "b"],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line_drawstyle_source_numbers(held_xy.to_array(), [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
    ])
    line_drawstyle_source_numbers(held_path.to_array(), [
      0UL.reinterpret_as_double(),
      13855605728582041600UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
    ])
  } catch {
    error => fail("original drawstyle row 74: " + error.to_string())
  }
}

///|
test "original drawstyle lazy errors units and old Path generations" {
  line_drawstyle_source_lazy_y()
  line_drawstyle_source_late_error()
  line_drawstyle_source_unit_remap()
  line_drawstyle_source_path_alias_65()
  line_drawstyle_source_path_alias_70()
}
