// Generated from pinned original set_dashes/tuple/scaling/full Line.draw methods.
// Native mutable list aliases/None-pairs and physical types remain source evidence.

///|
fn line_dashes_source_double(actual : Double, expected : Double) -> Unit raise {
  if expected.is_nan() {
    assert_true(actual.is_nan())
  } else {
    assert_eq(actual.reinterpret_as_uint64(), expected.reinterpret_as_uint64())
  }
}

///|
fn line_dashes_source_numbers(
  actual : Array[Double],
  expected : Array[Double],
) -> Unit raise {
  assert_eq(actual.length(), expected.length())
  for index in 0..<actual.length() {
    line_dashes_source_double(actual[index], expected[index])
  }
}

///|
fn line_dashes_source_option(
  actual : Double?,
  expected : Double?,
) -> Unit raise {
  match (actual, expected) {
    (None, None) => ()
    (Some(actual), Some(expected)) =>
      line_dashes_source_double(actual, expected)
    _ => fail("original optional Line alpha differs")
  }
}

///|
fn line_dashes_source_dashes(
  actual : Array[Double]?,
  expected : Array[Double]?,
) -> Unit raise {
  match (actual, expected) {
    (None, None) => ()
    (Some(actual), Some(expected)) =>
      line_dashes_source_numbers(actual, expected)
    _ => fail("original optional dash sequence differs")
  }
}

///|
fn line_dashes_source_rgba(
  actual : @colors.Rgba,
  expected : Array[Double],
) -> Unit raise {
  line_dashes_source_numbers(
    [actual.red(), actual.green(), actual.blue(), actual.alpha()],
    expected,
  )
}

///|
fn line_dashes_source_state(
  line : Line2D,
  axes : Axes,
  gap : String?,
  foreground : String,
  alpha : Double?,
  width : Double,
  canonical : String,
  dashed : Bool,
  unscaled_offset : Double,
  unscaled : Array[Double]?,
  effective_offset : Double,
  effective : Array[Double]?,
  effective_as_list : Bool,
  stale : Bool,
  visible : Bool,
  invalid : Array[Bool],
  xy : Array[Double],
  data : Array[Double],
  requests : Array[Bool],
  scale : Bool,
  rc_pattern : Array[Double],
) -> Unit raise {
  assert_eq(line.get_gapcolor(), gap)
  assert_eq(line.style.line_gapcolor(), gap)
  assert_eq(line.get_color(), foreground)
  line_dashes_source_option(line.get_alpha(), alpha)
  line_dashes_source_double(line.get_linewidth(), width)
  assert_eq(line.get_linestyle(), canonical)
  assert_eq(line.is_dashed(), dashed)
  line_dashes_source_double(line.unscaled_dash_pattern.offset, unscaled_offset)
  line_dashes_source_dashes(line.unscaled_dash_pattern.dashes, unscaled)
  let stroke = line.style.line_stroke()
  line_dashes_source_double(stroke.dash_offset(), effective_offset)
  line_dashes_source_dashes(stroke.dash_sequence(), effective)
  if effective is Some(_) {
    assert_eq(line.scaled_dashes_as_list, effective_as_list)
  }
  assert_eq(line.stale(), stale)
  assert_eq(line.get_visible(), visible)
  assert_eq([line.invalid_x, line.invalid_y], invalid)
  // Observe retained cache without recache, paint preparation or other lazy getters.
  line_dashes_source_numbers(line.cache.flat.to_array(), xy)
  line_dashes_source_numbers(
    [
      axes.data_limits().lower(),
      axes.data_limits(horizontal=false).lower(),
      axes.data_limits().upper(),
      axes.data_limits(horizontal=false).upper(),
    ],
    data,
  )
  assert_eq(
    [axes.x_axis().autoscale_stale(), axes.y_axis().autoscale_stale()],
    requests,
  )
  assert_eq(@config.lines_scale_dashes(), scale)
  line_dashes_source_numbers(@config.lines_dashed_pattern(), rc_pattern)
}

///|
fn line_dashes_source_attribute(attributes : String, name : String) -> String? {
  match attributes.split_once(name + "=\"") {
    Some((_, after)) =>
      match after.split_once("\"") {
        Some((value, _)) => Some(value.to_owned())
        None => None
      }
    None => None
  }
}

///|
fn line_dashes_source_polylines(svg : String) -> Array[String] raise {
  let result = []
  for index, chunk in svg.split("<polyline ").to_array() {
    if index != 0 {
      guard chunk.split_once("/>") is Some((attributes, _)) else {
        fail("unterminated Line polyline")
      }
      result.push(attributes.to_owned())
    }
  }
  result
}

///|
fn line_dashes_source_paint(
  attributes : String,
  rgba : Array[Double],
  offset : Double,
  sequence : Array[Double]?,
  width : Double,
) -> Unit raise {
  // RGBA values are original-source expectations; CSS encoding uses the existing
  // serializer convenience profile, not a native SVG text-format claim.
  let color = @colors.rgba(rgba[0], rgba[1], rgba[2], alpha=rgba[3]).to_css()
  assert_eq(line_dashes_source_attribute(attributes, "stroke"), Some(color))
  assert_eq(line_dashes_source_attribute(attributes, "stroke-opacity"), None)
  line_dashes_source_double(
    @ticker.parse_float_text(
      line_dashes_source_attribute(attributes, "stroke-width").unwrap(),
    ),
    width,
  )
  match sequence {
    None => {
      assert_eq(
        line_dashes_source_attribute(attributes, "stroke-dasharray"),
        None,
      )
      assert_eq(
        line_dashes_source_attribute(attributes, "stroke-dashoffset"),
        None,
      )
    }
    Some(sequence) => {
      let text = line_dashes_source_attribute(attributes, "stroke-dasharray").unwrap()
      let actual = if text == "" {
        []
      } else {
        text
        .split(",")
        .to_array()
        .map(value => @ticker.parse_float_text(value.to_owned()))
      }
      line_dashes_source_numbers(actual, sequence)
      line_dashes_source_double(
        @ticker.parse_float_text(
          line_dashes_source_attribute(attributes, "stroke-dashoffset").unwrap(),
        ),
        offset,
      )
    }
  }
}

///|
fn line_dashes_source_setter_0() -> Unit raise {
  let saved_scale = @config.lines_scale_dashes()
  let saved_dashed = @config.lines_dashed_pattern()
  let saved_dashdot = @config.lines_dashdot_pattern()
  let saved_dotted = @config.lines_dotted_pattern()
  defer {
    @config.set_lines_scale_dashes(saved_scale)
    @config.set_lines_dashed_pattern(saved_dashed)
    @config.set_lines_dashdot_pattern(saved_dashdot)
    @config.set_lines_dotted_pattern(saved_dotted)
  }
  @config.set_lines_scale_dashes(true)
  @config.set_lines_dashed_pattern([3.7, 1.6])
  @config.set_lines_dashdot_pattern([6.4, 1.6, 1.0, 1.6])
  @config.set_lines_dotted_pattern([1.0, 1.65])
  let saved_cycle = @config.color_cycle()
  defer @config.set_color_cycle(saved_cycle)
  @config.set_color_cycle(["#11223344", "none"])
  @config.set_lines_scale_dashes(true)
  @config.set_lines_dashed_pattern([
    4615514078110652826UL.reinterpret_as_double(),
    4609884578576439706UL.reinterpret_as_double(),
  ])
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([0.0, 1.0]),
    LineData::Numeric([10.0, 20.0]),
    color="blue",
  )
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  // actual tuple set_dashes scale=True
  try {
    // Controlled native stale=False input only; no draw/recache is performed.
    line.mark_drawn()
    line_dashes_source_state(
      line,
      axes,
      None,
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "-",
      false,
      0UL.reinterpret_as_double(),
      None,
      0UL.reinterpret_as_double(),
      None,
      false,
      false,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [false, false],
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
    line.set_dashes([])
    line_dashes_source_state(
      line,
      axes,
      None,
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "-",
      false,
      0UL.reinterpret_as_double(),
      None,
      0UL.reinterpret_as_double(),
      None,
      false,
      true,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [false, false],
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original set_dashes row 0: " + error.to_string())
  }
}

///|
fn line_dashes_source_setter_1() -> Unit raise {
  let saved_scale = @config.lines_scale_dashes()
  let saved_dashed = @config.lines_dashed_pattern()
  let saved_dashdot = @config.lines_dashdot_pattern()
  let saved_dotted = @config.lines_dotted_pattern()
  defer {
    @config.set_lines_scale_dashes(saved_scale)
    @config.set_lines_dashed_pattern(saved_dashed)
    @config.set_lines_dashdot_pattern(saved_dashdot)
    @config.set_lines_dotted_pattern(saved_dotted)
  }
  @config.set_lines_scale_dashes(true)
  @config.set_lines_dashed_pattern([3.7, 1.6])
  @config.set_lines_dashdot_pattern([6.4, 1.6, 1.0, 1.6])
  @config.set_lines_dotted_pattern([1.0, 1.65])
  let saved_cycle = @config.color_cycle()
  defer @config.set_color_cycle(saved_cycle)
  @config.set_color_cycle(["#11223344", "none"])
  @config.set_lines_scale_dashes(true)
  @config.set_lines_dashed_pattern([
    4615514078110652826UL.reinterpret_as_double(),
    4609884578576439706UL.reinterpret_as_double(),
  ])
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([0.0, 1.0]),
    LineData::Numeric([10.0, 20.0]),
    color="blue",
  )
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  // actual tuple set_dashes scale=True
  try {
    // Controlled native stale=False input only; no draw/recache is performed.
    line.mark_drawn()
    line_dashes_source_state(
      line,
      axes,
      None,
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "-",
      false,
      0UL.reinterpret_as_double(),
      None,
      0UL.reinterpret_as_double(),
      None,
      false,
      false,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [false, false],
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
    line.set_dashes([
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
    ])
    line_dashes_source_state(
      line,
      axes,
      None,
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "--",
      true,
      0UL.reinterpret_as_double(),
      Some([
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      0UL.reinterpret_as_double(),
      Some([
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ]),
      true,
      true,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [false, false],
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original set_dashes row 1: " + error.to_string())
  }
}

///|
fn line_dashes_source_setter_2() -> Unit raise {
  let saved_scale = @config.lines_scale_dashes()
  let saved_dashed = @config.lines_dashed_pattern()
  let saved_dashdot = @config.lines_dashdot_pattern()
  let saved_dotted = @config.lines_dotted_pattern()
  defer {
    @config.set_lines_scale_dashes(saved_scale)
    @config.set_lines_dashed_pattern(saved_dashed)
    @config.set_lines_dashdot_pattern(saved_dashdot)
    @config.set_lines_dotted_pattern(saved_dotted)
  }
  @config.set_lines_scale_dashes(true)
  @config.set_lines_dashed_pattern([3.7, 1.6])
  @config.set_lines_dashdot_pattern([6.4, 1.6, 1.0, 1.6])
  @config.set_lines_dotted_pattern([1.0, 1.65])
  let saved_cycle = @config.color_cycle()
  defer @config.set_color_cycle(saved_cycle)
  @config.set_color_cycle(["#11223344", "none"])
  @config.set_lines_scale_dashes(true)
  @config.set_lines_dashed_pattern([
    4615514078110652826UL.reinterpret_as_double(),
    4609884578576439706UL.reinterpret_as_double(),
  ])
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([0.0, 1.0]),
    LineData::Numeric([10.0, 20.0]),
    color="blue",
  )
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  // actual tuple set_dashes scale=True
  try {
    // Controlled native stale=False input only; no draw/recache is performed.
    line.mark_drawn()
    line_dashes_source_state(
      line,
      axes,
      None,
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "-",
      false,
      0UL.reinterpret_as_double(),
      None,
      0UL.reinterpret_as_double(),
      None,
      false,
      false,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [false, false],
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
    line.set_dashes([
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
    ])
    line_dashes_source_state(
      line,
      axes,
      None,
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "--",
      true,
      0UL.reinterpret_as_double(),
      Some([
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ]),
      0UL.reinterpret_as_double(),
      Some([
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4618441417868443648UL.reinterpret_as_double(),
      ]),
      true,
      true,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [false, false],
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original set_dashes row 2: " + error.to_string())
  }
}

///|
fn line_dashes_source_setter_3() -> Unit raise {
  let saved_scale = @config.lines_scale_dashes()
  let saved_dashed = @config.lines_dashed_pattern()
  let saved_dashdot = @config.lines_dashdot_pattern()
  let saved_dotted = @config.lines_dotted_pattern()
  defer {
    @config.set_lines_scale_dashes(saved_scale)
    @config.set_lines_dashed_pattern(saved_dashed)
    @config.set_lines_dashdot_pattern(saved_dashdot)
    @config.set_lines_dotted_pattern(saved_dotted)
  }
  @config.set_lines_scale_dashes(true)
  @config.set_lines_dashed_pattern([3.7, 1.6])
  @config.set_lines_dashdot_pattern([6.4, 1.6, 1.0, 1.6])
  @config.set_lines_dotted_pattern([1.0, 1.65])
  let saved_cycle = @config.color_cycle()
  defer @config.set_color_cycle(saved_cycle)
  @config.set_color_cycle(["#11223344", "none"])
  @config.set_lines_scale_dashes(true)
  @config.set_lines_dashed_pattern([
    4615514078110652826UL.reinterpret_as_double(),
    4609884578576439706UL.reinterpret_as_double(),
  ])
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([0.0, 1.0]),
    LineData::Numeric([10.0, 20.0]),
    color="blue",
  )
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  // actual tuple set_dashes scale=True
  try {
    // Controlled native stale=False input only; no draw/recache is performed.
    line.mark_drawn()
    line_dashes_source_state(
      line,
      axes,
      None,
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "-",
      false,
      0UL.reinterpret_as_double(),
      None,
      0UL.reinterpret_as_double(),
      None,
      false,
      false,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [false, false],
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
    line.set_dashes([0UL.reinterpret_as_double(), 0UL.reinterpret_as_double()])
    line_dashes_source_state(
      line,
      axes,
      None,
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "--",
      true,
      0UL.reinterpret_as_double(),
      Some([0UL.reinterpret_as_double(), 0UL.reinterpret_as_double()]),
      0UL.reinterpret_as_double(),
      Some([0UL.reinterpret_as_double(), 0UL.reinterpret_as_double()]),
      true,
      true,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [false, false],
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original set_dashes row 3: " + error.to_string())
  }
}

///|
fn line_dashes_source_setter_4() -> Unit raise {
  let saved_scale = @config.lines_scale_dashes()
  let saved_dashed = @config.lines_dashed_pattern()
  let saved_dashdot = @config.lines_dashdot_pattern()
  let saved_dotted = @config.lines_dotted_pattern()
  defer {
    @config.set_lines_scale_dashes(saved_scale)
    @config.set_lines_dashed_pattern(saved_dashed)
    @config.set_lines_dashdot_pattern(saved_dashdot)
    @config.set_lines_dotted_pattern(saved_dotted)
  }
  @config.set_lines_scale_dashes(true)
  @config.set_lines_dashed_pattern([3.7, 1.6])
  @config.set_lines_dashdot_pattern([6.4, 1.6, 1.0, 1.6])
  @config.set_lines_dotted_pattern([1.0, 1.65])
  let saved_cycle = @config.color_cycle()
  defer @config.set_color_cycle(saved_cycle)
  @config.set_color_cycle(["#11223344", "none"])
  @config.set_lines_scale_dashes(true)
  @config.set_lines_dashed_pattern([
    4615514078110652826UL.reinterpret_as_double(),
    4609884578576439706UL.reinterpret_as_double(),
  ])
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([0.0, 1.0]),
    LineData::Numeric([10.0, 20.0]),
    color="blue",
  )
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  // actual tuple set_dashes scale=True
  try {
    // Controlled native stale=False input only; no draw/recache is performed.
    line.mark_drawn()
    line_dashes_source_state(
      line,
      axes,
      None,
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "-",
      false,
      0UL.reinterpret_as_double(),
      None,
      0UL.reinterpret_as_double(),
      None,
      false,
      false,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [false, false],
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
    line.set_dashes([
      13830554455654793216UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
    line_dashes_source_state(
      line,
      axes,
      None,
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "--",
      true,
      0UL.reinterpret_as_double(),
      Some([
        13830554455654793216UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ]),
      0UL.reinterpret_as_double(),
      Some([
        13835058055282163712UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      true,
      true,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [false, false],
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original set_dashes row 4: " + error.to_string())
  }
}

///|
fn line_dashes_source_setter_5() -> Unit raise {
  let saved_scale = @config.lines_scale_dashes()
  let saved_dashed = @config.lines_dashed_pattern()
  let saved_dashdot = @config.lines_dashdot_pattern()
  let saved_dotted = @config.lines_dotted_pattern()
  defer {
    @config.set_lines_scale_dashes(saved_scale)
    @config.set_lines_dashed_pattern(saved_dashed)
    @config.set_lines_dashdot_pattern(saved_dashdot)
    @config.set_lines_dotted_pattern(saved_dotted)
  }
  @config.set_lines_scale_dashes(true)
  @config.set_lines_dashed_pattern([3.7, 1.6])
  @config.set_lines_dashdot_pattern([6.4, 1.6, 1.0, 1.6])
  @config.set_lines_dotted_pattern([1.0, 1.65])
  let saved_cycle = @config.color_cycle()
  defer @config.set_color_cycle(saved_cycle)
  @config.set_color_cycle(["#11223344", "none"])
  @config.set_lines_scale_dashes(true)
  @config.set_lines_dashed_pattern([
    4615514078110652826UL.reinterpret_as_double(),
    4609884578576439706UL.reinterpret_as_double(),
  ])
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([0.0, 1.0]),
    LineData::Numeric([10.0, 20.0]),
    color="blue",
  )
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  // actual tuple set_dashes scale=True
  try {
    // Controlled native stale=False input only; no draw/recache is performed.
    line.mark_drawn()
    line_dashes_source_state(
      line,
      axes,
      None,
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "-",
      false,
      0UL.reinterpret_as_double(),
      None,
      0UL.reinterpret_as_double(),
      None,
      false,
      false,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [false, false],
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
    line.set_dashes([4607182418800017408UL.reinterpret_as_double(), 0.0 / 0.0])
    line_dashes_source_state(
      line,
      axes,
      None,
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "--",
      true,
      0.0 / 0.0,
      Some([4607182418800017408UL.reinterpret_as_double(), 0.0 / 0.0]),
      0.0 / 0.0,
      Some([4611686018427387904UL.reinterpret_as_double(), 0.0 / 0.0]),
      true,
      true,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [false, false],
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original set_dashes row 5: " + error.to_string())
  }
}

///|
fn line_dashes_source_setter_6() -> Unit raise {
  let saved_scale = @config.lines_scale_dashes()
  let saved_dashed = @config.lines_dashed_pattern()
  let saved_dashdot = @config.lines_dashdot_pattern()
  let saved_dotted = @config.lines_dotted_pattern()
  defer {
    @config.set_lines_scale_dashes(saved_scale)
    @config.set_lines_dashed_pattern(saved_dashed)
    @config.set_lines_dashdot_pattern(saved_dashdot)
    @config.set_lines_dotted_pattern(saved_dotted)
  }
  @config.set_lines_scale_dashes(true)
  @config.set_lines_dashed_pattern([3.7, 1.6])
  @config.set_lines_dashdot_pattern([6.4, 1.6, 1.0, 1.6])
  @config.set_lines_dotted_pattern([1.0, 1.65])
  let saved_cycle = @config.color_cycle()
  defer @config.set_color_cycle(saved_cycle)
  @config.set_color_cycle(["#11223344", "none"])
  @config.set_lines_scale_dashes(true)
  @config.set_lines_dashed_pattern([
    4615514078110652826UL.reinterpret_as_double(),
    4609884578576439706UL.reinterpret_as_double(),
  ])
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([0.0, 1.0]),
    LineData::Numeric([10.0, 20.0]),
    color="blue",
  )
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  // actual tuple set_dashes scale=True
  try {
    // Controlled native stale=False input only; no draw/recache is performed.
    line.mark_drawn()
    line_dashes_source_state(
      line,
      axes,
      None,
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "-",
      false,
      0UL.reinterpret_as_double(),
      None,
      0UL.reinterpret_as_double(),
      None,
      false,
      false,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [false, false],
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
    line.set_dashes([4607182418800017408UL.reinterpret_as_double(), 1.0 / 0.0])
    line_dashes_source_state(
      line,
      axes,
      None,
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "--",
      true,
      0UL.reinterpret_as_double(),
      Some([4607182418800017408UL.reinterpret_as_double(), 1.0 / 0.0]),
      0UL.reinterpret_as_double(),
      Some([4611686018427387904UL.reinterpret_as_double(), 1.0 / 0.0]),
      true,
      true,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [false, false],
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original set_dashes row 6: " + error.to_string())
  }
}

///|
fn line_dashes_source_setter_7() -> Unit raise {
  let saved_scale = @config.lines_scale_dashes()
  let saved_dashed = @config.lines_dashed_pattern()
  let saved_dashdot = @config.lines_dashdot_pattern()
  let saved_dotted = @config.lines_dotted_pattern()
  defer {
    @config.set_lines_scale_dashes(saved_scale)
    @config.set_lines_dashed_pattern(saved_dashed)
    @config.set_lines_dashdot_pattern(saved_dashdot)
    @config.set_lines_dotted_pattern(saved_dotted)
  }
  @config.set_lines_scale_dashes(true)
  @config.set_lines_dashed_pattern([3.7, 1.6])
  @config.set_lines_dashdot_pattern([6.4, 1.6, 1.0, 1.6])
  @config.set_lines_dotted_pattern([1.0, 1.65])
  let saved_cycle = @config.color_cycle()
  defer @config.set_color_cycle(saved_cycle)
  @config.set_color_cycle(["#11223344", "none"])
  @config.set_lines_scale_dashes(true)
  @config.set_lines_dashed_pattern([
    4615514078110652826UL.reinterpret_as_double(),
    4609884578576439706UL.reinterpret_as_double(),
  ])
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([0.0, 1.0]),
    LineData::Numeric([10.0, 20.0]),
    color="blue",
  )
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  // actual tuple set_dashes scale=True
  try {
    // Controlled native stale=False input only; no draw/recache is performed.
    line.mark_drawn()
    line_dashes_source_state(
      line,
      axes,
      None,
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "-",
      false,
      0UL.reinterpret_as_double(),
      None,
      0UL.reinterpret_as_double(),
      None,
      false,
      false,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [false, false],
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
    line.set_dashes([4607182418800017408UL.reinterpret_as_double(), -1.0 / 0.0])
    line_dashes_source_state(
      line,
      axes,
      None,
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "--",
      true,
      9223372036854775808UL.reinterpret_as_double(),
      Some([4607182418800017408UL.reinterpret_as_double(), -1.0 / 0.0]),
      9223372036854775808UL.reinterpret_as_double(),
      Some([4611686018427387904UL.reinterpret_as_double(), -1.0 / 0.0]),
      true,
      true,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [false, false],
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original set_dashes row 7: " + error.to_string())
  }
}

///|
fn line_dashes_source_setter_8() -> Unit raise {
  let saved_scale = @config.lines_scale_dashes()
  let saved_dashed = @config.lines_dashed_pattern()
  let saved_dashdot = @config.lines_dashdot_pattern()
  let saved_dotted = @config.lines_dotted_pattern()
  defer {
    @config.set_lines_scale_dashes(saved_scale)
    @config.set_lines_dashed_pattern(saved_dashed)
    @config.set_lines_dashdot_pattern(saved_dashdot)
    @config.set_lines_dotted_pattern(saved_dotted)
  }
  @config.set_lines_scale_dashes(true)
  @config.set_lines_dashed_pattern([3.7, 1.6])
  @config.set_lines_dashdot_pattern([6.4, 1.6, 1.0, 1.6])
  @config.set_lines_dotted_pattern([1.0, 1.65])
  let saved_cycle = @config.color_cycle()
  defer @config.set_color_cycle(saved_cycle)
  @config.set_color_cycle(["#11223344", "none"])
  @config.set_lines_scale_dashes(true)
  @config.set_lines_dashed_pattern([
    4615514078110652826UL.reinterpret_as_double(),
    4609884578576439706UL.reinterpret_as_double(),
  ])
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([0.0, 1.0]),
    LineData::Numeric([10.0, 20.0]),
    color="blue",
  )
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  // actual tuple set_dashes scale=True
  try {
    // Controlled native stale=False input only; no draw/recache is performed.
    line.mark_drawn()
    line_dashes_source_state(
      line,
      axes,
      None,
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "-",
      false,
      0UL.reinterpret_as_double(),
      None,
      0UL.reinterpret_as_double(),
      None,
      false,
      false,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [false, false],
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
    line.set_dashes([
      4846369599423283200UL.reinterpret_as_double(),
      13830554455654793216UL.reinterpret_as_double(),
      14069741636278059008UL.reinterpret_as_double(),
    ])
    line_dashes_source_state(
      line,
      axes,
      None,
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "--",
      true,
      9223372036854775808UL.reinterpret_as_double(),
      Some([
        4846369599423283200UL.reinterpret_as_double(),
        13830554455654793216UL.reinterpret_as_double(),
        14069741636278059008UL.reinterpret_as_double(),
      ]),
      9223372036854775808UL.reinterpret_as_double(),
      Some([
        4850873199050653696UL.reinterpret_as_double(),
        13835058055282163712UL.reinterpret_as_double(),
        14074245235905429504UL.reinterpret_as_double(),
      ]),
      true,
      true,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [false, false],
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original set_dashes row 8: " + error.to_string())
  }
}

///|
fn line_dashes_source_setter_9() -> Unit raise {
  let saved_scale = @config.lines_scale_dashes()
  let saved_dashed = @config.lines_dashed_pattern()
  let saved_dashdot = @config.lines_dashdot_pattern()
  let saved_dotted = @config.lines_dotted_pattern()
  defer {
    @config.set_lines_scale_dashes(saved_scale)
    @config.set_lines_dashed_pattern(saved_dashed)
    @config.set_lines_dashdot_pattern(saved_dashdot)
    @config.set_lines_dotted_pattern(saved_dotted)
  }
  @config.set_lines_scale_dashes(true)
  @config.set_lines_dashed_pattern([3.7, 1.6])
  @config.set_lines_dashdot_pattern([6.4, 1.6, 1.0, 1.6])
  @config.set_lines_dotted_pattern([1.0, 1.65])
  let saved_cycle = @config.color_cycle()
  defer @config.set_color_cycle(saved_cycle)
  @config.set_color_cycle(["#11223344", "none"])
  @config.set_lines_scale_dashes(false)
  @config.set_lines_dashed_pattern([
    4615514078110652826UL.reinterpret_as_double(),
    4609884578576439706UL.reinterpret_as_double(),
  ])
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([0.0, 1.0]),
    LineData::Numeric([10.0, 20.0]),
    color="blue",
  )
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  // actual tuple set_dashes scale=False
  try {
    // Controlled native stale=False input only; no draw/recache is performed.
    line.mark_drawn()
    line_dashes_source_state(
      line,
      axes,
      None,
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "-",
      false,
      0UL.reinterpret_as_double(),
      None,
      0UL.reinterpret_as_double(),
      None,
      false,
      false,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [false, false],
      false,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
    line.set_dashes([])
    line_dashes_source_state(
      line,
      axes,
      None,
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "-",
      false,
      0UL.reinterpret_as_double(),
      None,
      0UL.reinterpret_as_double(),
      None,
      false,
      true,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [false, false],
      false,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original set_dashes row 9: " + error.to_string())
  }
}

///|
fn line_dashes_source_setter_10() -> Unit raise {
  let saved_scale = @config.lines_scale_dashes()
  let saved_dashed = @config.lines_dashed_pattern()
  let saved_dashdot = @config.lines_dashdot_pattern()
  let saved_dotted = @config.lines_dotted_pattern()
  defer {
    @config.set_lines_scale_dashes(saved_scale)
    @config.set_lines_dashed_pattern(saved_dashed)
    @config.set_lines_dashdot_pattern(saved_dashdot)
    @config.set_lines_dotted_pattern(saved_dotted)
  }
  @config.set_lines_scale_dashes(true)
  @config.set_lines_dashed_pattern([3.7, 1.6])
  @config.set_lines_dashdot_pattern([6.4, 1.6, 1.0, 1.6])
  @config.set_lines_dotted_pattern([1.0, 1.65])
  let saved_cycle = @config.color_cycle()
  defer @config.set_color_cycle(saved_cycle)
  @config.set_color_cycle(["#11223344", "none"])
  @config.set_lines_scale_dashes(false)
  @config.set_lines_dashed_pattern([
    4615514078110652826UL.reinterpret_as_double(),
    4609884578576439706UL.reinterpret_as_double(),
  ])
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([0.0, 1.0]),
    LineData::Numeric([10.0, 20.0]),
    color="blue",
  )
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  // actual tuple set_dashes scale=False
  try {
    // Controlled native stale=False input only; no draw/recache is performed.
    line.mark_drawn()
    line_dashes_source_state(
      line,
      axes,
      None,
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "-",
      false,
      0UL.reinterpret_as_double(),
      None,
      0UL.reinterpret_as_double(),
      None,
      false,
      false,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [false, false],
      false,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
    line.set_dashes([
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
    ])
    line_dashes_source_state(
      line,
      axes,
      None,
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "--",
      true,
      0UL.reinterpret_as_double(),
      Some([
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      0UL.reinterpret_as_double(),
      Some([
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      false,
      true,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [false, false],
      false,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original set_dashes row 10: " + error.to_string())
  }
}

///|
fn line_dashes_source_setter_11() -> Unit raise {
  let saved_scale = @config.lines_scale_dashes()
  let saved_dashed = @config.lines_dashed_pattern()
  let saved_dashdot = @config.lines_dashdot_pattern()
  let saved_dotted = @config.lines_dotted_pattern()
  defer {
    @config.set_lines_scale_dashes(saved_scale)
    @config.set_lines_dashed_pattern(saved_dashed)
    @config.set_lines_dashdot_pattern(saved_dashdot)
    @config.set_lines_dotted_pattern(saved_dotted)
  }
  @config.set_lines_scale_dashes(true)
  @config.set_lines_dashed_pattern([3.7, 1.6])
  @config.set_lines_dashdot_pattern([6.4, 1.6, 1.0, 1.6])
  @config.set_lines_dotted_pattern([1.0, 1.65])
  let saved_cycle = @config.color_cycle()
  defer @config.set_color_cycle(saved_cycle)
  @config.set_color_cycle(["#11223344", "none"])
  @config.set_lines_scale_dashes(false)
  @config.set_lines_dashed_pattern([
    4615514078110652826UL.reinterpret_as_double(),
    4609884578576439706UL.reinterpret_as_double(),
  ])
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([0.0, 1.0]),
    LineData::Numeric([10.0, 20.0]),
    color="blue",
  )
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  // actual tuple set_dashes scale=False
  try {
    // Controlled native stale=False input only; no draw/recache is performed.
    line.mark_drawn()
    line_dashes_source_state(
      line,
      axes,
      None,
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "-",
      false,
      0UL.reinterpret_as_double(),
      None,
      0UL.reinterpret_as_double(),
      None,
      false,
      false,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [false, false],
      false,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
    line.set_dashes([
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
    ])
    line_dashes_source_state(
      line,
      axes,
      None,
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "--",
      true,
      0UL.reinterpret_as_double(),
      Some([
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ]),
      0UL.reinterpret_as_double(),
      Some([
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ]),
      false,
      true,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [false, false],
      false,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original set_dashes row 11: " + error.to_string())
  }
}

///|
fn line_dashes_source_setter_12() -> Unit raise {
  let saved_scale = @config.lines_scale_dashes()
  let saved_dashed = @config.lines_dashed_pattern()
  let saved_dashdot = @config.lines_dashdot_pattern()
  let saved_dotted = @config.lines_dotted_pattern()
  defer {
    @config.set_lines_scale_dashes(saved_scale)
    @config.set_lines_dashed_pattern(saved_dashed)
    @config.set_lines_dashdot_pattern(saved_dashdot)
    @config.set_lines_dotted_pattern(saved_dotted)
  }
  @config.set_lines_scale_dashes(true)
  @config.set_lines_dashed_pattern([3.7, 1.6])
  @config.set_lines_dashdot_pattern([6.4, 1.6, 1.0, 1.6])
  @config.set_lines_dotted_pattern([1.0, 1.65])
  let saved_cycle = @config.color_cycle()
  defer @config.set_color_cycle(saved_cycle)
  @config.set_color_cycle(["#11223344", "none"])
  @config.set_lines_scale_dashes(false)
  @config.set_lines_dashed_pattern([
    4615514078110652826UL.reinterpret_as_double(),
    4609884578576439706UL.reinterpret_as_double(),
  ])
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([0.0, 1.0]),
    LineData::Numeric([10.0, 20.0]),
    color="blue",
  )
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  // actual tuple set_dashes scale=False
  try {
    // Controlled native stale=False input only; no draw/recache is performed.
    line.mark_drawn()
    line_dashes_source_state(
      line,
      axes,
      None,
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "-",
      false,
      0UL.reinterpret_as_double(),
      None,
      0UL.reinterpret_as_double(),
      None,
      false,
      false,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [false, false],
      false,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
    line.set_dashes([0UL.reinterpret_as_double(), 0UL.reinterpret_as_double()])
    line_dashes_source_state(
      line,
      axes,
      None,
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "--",
      true,
      0UL.reinterpret_as_double(),
      Some([0UL.reinterpret_as_double(), 0UL.reinterpret_as_double()]),
      0UL.reinterpret_as_double(),
      Some([0UL.reinterpret_as_double(), 0UL.reinterpret_as_double()]),
      false,
      true,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [false, false],
      false,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original set_dashes row 12: " + error.to_string())
  }
}

///|
fn line_dashes_source_setter_13() -> Unit raise {
  let saved_scale = @config.lines_scale_dashes()
  let saved_dashed = @config.lines_dashed_pattern()
  let saved_dashdot = @config.lines_dashdot_pattern()
  let saved_dotted = @config.lines_dotted_pattern()
  defer {
    @config.set_lines_scale_dashes(saved_scale)
    @config.set_lines_dashed_pattern(saved_dashed)
    @config.set_lines_dashdot_pattern(saved_dashdot)
    @config.set_lines_dotted_pattern(saved_dotted)
  }
  @config.set_lines_scale_dashes(true)
  @config.set_lines_dashed_pattern([3.7, 1.6])
  @config.set_lines_dashdot_pattern([6.4, 1.6, 1.0, 1.6])
  @config.set_lines_dotted_pattern([1.0, 1.65])
  let saved_cycle = @config.color_cycle()
  defer @config.set_color_cycle(saved_cycle)
  @config.set_color_cycle(["#11223344", "none"])
  @config.set_lines_scale_dashes(false)
  @config.set_lines_dashed_pattern([
    4615514078110652826UL.reinterpret_as_double(),
    4609884578576439706UL.reinterpret_as_double(),
  ])
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([0.0, 1.0]),
    LineData::Numeric([10.0, 20.0]),
    color="blue",
  )
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  // actual tuple set_dashes scale=False
  try {
    // Controlled native stale=False input only; no draw/recache is performed.
    line.mark_drawn()
    line_dashes_source_state(
      line,
      axes,
      None,
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "-",
      false,
      0UL.reinterpret_as_double(),
      None,
      0UL.reinterpret_as_double(),
      None,
      false,
      false,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [false, false],
      false,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
    line.set_dashes([
      13830554455654793216UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
    line_dashes_source_state(
      line,
      axes,
      None,
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "--",
      true,
      0UL.reinterpret_as_double(),
      Some([
        13830554455654793216UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ]),
      0UL.reinterpret_as_double(),
      Some([
        13830554455654793216UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ]),
      false,
      true,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [false, false],
      false,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original set_dashes row 13: " + error.to_string())
  }
}

///|
fn line_dashes_source_setter_14() -> Unit raise {
  let saved_scale = @config.lines_scale_dashes()
  let saved_dashed = @config.lines_dashed_pattern()
  let saved_dashdot = @config.lines_dashdot_pattern()
  let saved_dotted = @config.lines_dotted_pattern()
  defer {
    @config.set_lines_scale_dashes(saved_scale)
    @config.set_lines_dashed_pattern(saved_dashed)
    @config.set_lines_dashdot_pattern(saved_dashdot)
    @config.set_lines_dotted_pattern(saved_dotted)
  }
  @config.set_lines_scale_dashes(true)
  @config.set_lines_dashed_pattern([3.7, 1.6])
  @config.set_lines_dashdot_pattern([6.4, 1.6, 1.0, 1.6])
  @config.set_lines_dotted_pattern([1.0, 1.65])
  let saved_cycle = @config.color_cycle()
  defer @config.set_color_cycle(saved_cycle)
  @config.set_color_cycle(["#11223344", "none"])
  @config.set_lines_scale_dashes(false)
  @config.set_lines_dashed_pattern([
    4615514078110652826UL.reinterpret_as_double(),
    4609884578576439706UL.reinterpret_as_double(),
  ])
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([0.0, 1.0]),
    LineData::Numeric([10.0, 20.0]),
    color="blue",
  )
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  // actual tuple set_dashes scale=False
  try {
    // Controlled native stale=False input only; no draw/recache is performed.
    line.mark_drawn()
    line_dashes_source_state(
      line,
      axes,
      None,
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "-",
      false,
      0UL.reinterpret_as_double(),
      None,
      0UL.reinterpret_as_double(),
      None,
      false,
      false,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [false, false],
      false,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
    line.set_dashes([4607182418800017408UL.reinterpret_as_double(), 0.0 / 0.0])
    line_dashes_source_state(
      line,
      axes,
      None,
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "--",
      true,
      0.0 / 0.0,
      Some([4607182418800017408UL.reinterpret_as_double(), 0.0 / 0.0]),
      0.0 / 0.0,
      Some([4607182418800017408UL.reinterpret_as_double(), 0.0 / 0.0]),
      false,
      true,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [false, false],
      false,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original set_dashes row 14: " + error.to_string())
  }
}

///|
fn line_dashes_source_setter_15() -> Unit raise {
  let saved_scale = @config.lines_scale_dashes()
  let saved_dashed = @config.lines_dashed_pattern()
  let saved_dashdot = @config.lines_dashdot_pattern()
  let saved_dotted = @config.lines_dotted_pattern()
  defer {
    @config.set_lines_scale_dashes(saved_scale)
    @config.set_lines_dashed_pattern(saved_dashed)
    @config.set_lines_dashdot_pattern(saved_dashdot)
    @config.set_lines_dotted_pattern(saved_dotted)
  }
  @config.set_lines_scale_dashes(true)
  @config.set_lines_dashed_pattern([3.7, 1.6])
  @config.set_lines_dashdot_pattern([6.4, 1.6, 1.0, 1.6])
  @config.set_lines_dotted_pattern([1.0, 1.65])
  let saved_cycle = @config.color_cycle()
  defer @config.set_color_cycle(saved_cycle)
  @config.set_color_cycle(["#11223344", "none"])
  @config.set_lines_scale_dashes(false)
  @config.set_lines_dashed_pattern([
    4615514078110652826UL.reinterpret_as_double(),
    4609884578576439706UL.reinterpret_as_double(),
  ])
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([0.0, 1.0]),
    LineData::Numeric([10.0, 20.0]),
    color="blue",
  )
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  // actual tuple set_dashes scale=False
  try {
    // Controlled native stale=False input only; no draw/recache is performed.
    line.mark_drawn()
    line_dashes_source_state(
      line,
      axes,
      None,
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "-",
      false,
      0UL.reinterpret_as_double(),
      None,
      0UL.reinterpret_as_double(),
      None,
      false,
      false,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [false, false],
      false,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
    line.set_dashes([4607182418800017408UL.reinterpret_as_double(), 1.0 / 0.0])
    line_dashes_source_state(
      line,
      axes,
      None,
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "--",
      true,
      0UL.reinterpret_as_double(),
      Some([4607182418800017408UL.reinterpret_as_double(), 1.0 / 0.0]),
      0UL.reinterpret_as_double(),
      Some([4607182418800017408UL.reinterpret_as_double(), 1.0 / 0.0]),
      false,
      true,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [false, false],
      false,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original set_dashes row 15: " + error.to_string())
  }
}

///|
fn line_dashes_source_setter_16() -> Unit raise {
  let saved_scale = @config.lines_scale_dashes()
  let saved_dashed = @config.lines_dashed_pattern()
  let saved_dashdot = @config.lines_dashdot_pattern()
  let saved_dotted = @config.lines_dotted_pattern()
  defer {
    @config.set_lines_scale_dashes(saved_scale)
    @config.set_lines_dashed_pattern(saved_dashed)
    @config.set_lines_dashdot_pattern(saved_dashdot)
    @config.set_lines_dotted_pattern(saved_dotted)
  }
  @config.set_lines_scale_dashes(true)
  @config.set_lines_dashed_pattern([3.7, 1.6])
  @config.set_lines_dashdot_pattern([6.4, 1.6, 1.0, 1.6])
  @config.set_lines_dotted_pattern([1.0, 1.65])
  let saved_cycle = @config.color_cycle()
  defer @config.set_color_cycle(saved_cycle)
  @config.set_color_cycle(["#11223344", "none"])
  @config.set_lines_scale_dashes(false)
  @config.set_lines_dashed_pattern([
    4615514078110652826UL.reinterpret_as_double(),
    4609884578576439706UL.reinterpret_as_double(),
  ])
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([0.0, 1.0]),
    LineData::Numeric([10.0, 20.0]),
    color="blue",
  )
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  // actual tuple set_dashes scale=False
  try {
    // Controlled native stale=False input only; no draw/recache is performed.
    line.mark_drawn()
    line_dashes_source_state(
      line,
      axes,
      None,
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "-",
      false,
      0UL.reinterpret_as_double(),
      None,
      0UL.reinterpret_as_double(),
      None,
      false,
      false,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [false, false],
      false,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
    line.set_dashes([4607182418800017408UL.reinterpret_as_double(), -1.0 / 0.0])
    line_dashes_source_state(
      line,
      axes,
      None,
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "--",
      true,
      9223372036854775808UL.reinterpret_as_double(),
      Some([4607182418800017408UL.reinterpret_as_double(), -1.0 / 0.0]),
      9223372036854775808UL.reinterpret_as_double(),
      Some([4607182418800017408UL.reinterpret_as_double(), -1.0 / 0.0]),
      false,
      true,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [false, false],
      false,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original set_dashes row 16: " + error.to_string())
  }
}

///|
fn line_dashes_source_setter_17() -> Unit raise {
  let saved_scale = @config.lines_scale_dashes()
  let saved_dashed = @config.lines_dashed_pattern()
  let saved_dashdot = @config.lines_dashdot_pattern()
  let saved_dotted = @config.lines_dotted_pattern()
  defer {
    @config.set_lines_scale_dashes(saved_scale)
    @config.set_lines_dashed_pattern(saved_dashed)
    @config.set_lines_dashdot_pattern(saved_dashdot)
    @config.set_lines_dotted_pattern(saved_dotted)
  }
  @config.set_lines_scale_dashes(true)
  @config.set_lines_dashed_pattern([3.7, 1.6])
  @config.set_lines_dashdot_pattern([6.4, 1.6, 1.0, 1.6])
  @config.set_lines_dotted_pattern([1.0, 1.65])
  let saved_cycle = @config.color_cycle()
  defer @config.set_color_cycle(saved_cycle)
  @config.set_color_cycle(["#11223344", "none"])
  @config.set_lines_scale_dashes(false)
  @config.set_lines_dashed_pattern([
    4615514078110652826UL.reinterpret_as_double(),
    4609884578576439706UL.reinterpret_as_double(),
  ])
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([0.0, 1.0]),
    LineData::Numeric([10.0, 20.0]),
    color="blue",
  )
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  // actual tuple set_dashes scale=False
  try {
    // Controlled native stale=False input only; no draw/recache is performed.
    line.mark_drawn()
    line_dashes_source_state(
      line,
      axes,
      None,
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "-",
      false,
      0UL.reinterpret_as_double(),
      None,
      0UL.reinterpret_as_double(),
      None,
      false,
      false,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [false, false],
      false,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
    line.set_dashes([
      4846369599423283200UL.reinterpret_as_double(),
      13830554455654793216UL.reinterpret_as_double(),
      14069741636278059008UL.reinterpret_as_double(),
    ])
    line_dashes_source_state(
      line,
      axes,
      None,
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "--",
      true,
      9223372036854775808UL.reinterpret_as_double(),
      Some([
        4846369599423283200UL.reinterpret_as_double(),
        13830554455654793216UL.reinterpret_as_double(),
        14069741636278059008UL.reinterpret_as_double(),
      ]),
      9223372036854775808UL.reinterpret_as_double(),
      Some([
        4846369599423283200UL.reinterpret_as_double(),
        13830554455654793216UL.reinterpret_as_double(),
        14069741636278059008UL.reinterpret_as_double(),
      ]),
      false,
      true,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [false, false],
      false,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original set_dashes row 17: " + error.to_string())
  }
}

///|
fn line_dashes_source_history_18() -> Unit raise {
  let saved_scale = @config.lines_scale_dashes()
  let saved_dashed = @config.lines_dashed_pattern()
  let saved_dashdot = @config.lines_dashdot_pattern()
  let saved_dotted = @config.lines_dotted_pattern()
  defer {
    @config.set_lines_scale_dashes(saved_scale)
    @config.set_lines_dashed_pattern(saved_dashed)
    @config.set_lines_dashdot_pattern(saved_dashdot)
    @config.set_lines_dotted_pattern(saved_dotted)
  }
  @config.set_lines_scale_dashes(true)
  @config.set_lines_dashed_pattern([3.7, 1.6])
  @config.set_lines_dashdot_pattern([6.4, 1.6, 1.0, 1.6])
  @config.set_lines_dotted_pattern([1.0, 1.65])
  let saved_cycle = @config.color_cycle()
  defer @config.set_color_cycle(saved_cycle)
  @config.set_color_cycle(["#11223344", "none"])
  @config.set_lines_scale_dashes(true)
  @config.set_lines_dashed_pattern([
    4615514078110652826UL.reinterpret_as_double(),
    4609884578576439706UL.reinterpret_as_double(),
  ])
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([0.0, 1.0]),
    LineData::Numeric([10.0, 20.0]),
    color="blue",
  )
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  let incoming = [
    13835058055282163712UL.reinterpret_as_double(),
    13830554455654793216UL.reinterpret_as_double(),
  ]
  // tuple snapshot from caller input
  try {
    // Controlled native stale=False input only; no draw/recache is performed.
    line.mark_drawn()
    line_dashes_source_state(
      line,
      axes,
      None,
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "-",
      false,
      0UL.reinterpret_as_double(),
      None,
      0UL.reinterpret_as_double(),
      None,
      false,
      false,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [false, false],
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
    line.set_dashes(incoming)
    line_dashes_source_state(
      line,
      axes,
      None,
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "--",
      true,
      9223372036854775808UL.reinterpret_as_double(),
      Some([
        13835058055282163712UL.reinterpret_as_double(),
        13830554455654793216UL.reinterpret_as_double(),
      ]),
      9223372036854775808UL.reinterpret_as_double(),
      Some([
        13839561654909534208UL.reinterpret_as_double(),
        13835058055282163712UL.reinterpret_as_double(),
      ]),
      true,
      true,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [false, false],
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
    line_dashes_source_numbers(incoming, [
      13835058055282163712UL.reinterpret_as_double(),
      13830554455654793216UL.reinterpret_as_double(),
    ])
  } catch {
    error => fail("original set_dashes row 18: " + error.to_string())
  }
  let held = line.style.line_stroke()
  // external caller mutation leaves captured tuple unchanged
  try {
    // Controlled native stale=False input only; no draw/recache is performed.
    line.mark_drawn()
    line_dashes_source_state(
      line,
      axes,
      None,
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "--",
      true,
      9223372036854775808UL.reinterpret_as_double(),
      Some([
        13835058055282163712UL.reinterpret_as_double(),
        13830554455654793216UL.reinterpret_as_double(),
      ]),
      9223372036854775808UL.reinterpret_as_double(),
      Some([
        13839561654909534208UL.reinterpret_as_double(),
        13835058055282163712UL.reinterpret_as_double(),
      ]),
      true,
      false,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [false, false],
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
    incoming[1] = 4616189618054758400UL.reinterpret_as_double()
    line_dashes_source_state(
      line,
      axes,
      None,
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "--",
      true,
      9223372036854775808UL.reinterpret_as_double(),
      Some([
        13835058055282163712UL.reinterpret_as_double(),
        13830554455654793216UL.reinterpret_as_double(),
      ]),
      9223372036854775808UL.reinterpret_as_double(),
      Some([
        13839561654909534208UL.reinterpret_as_double(),
        13835058055282163712UL.reinterpret_as_double(),
      ]),
      true,
      false,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [false, false],
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
    line_dashes_source_numbers(incoming, [
      13835058055282163712UL.reinterpret_as_double(),
      4616189618054758400UL.reinterpret_as_double(),
    ])
    line_dashes_source_double(
      held.dash_offset(),
      9223372036854775808UL.reinterpret_as_double(),
    )
    line_dashes_source_dashes(
      held.dash_sequence(),
      Some([
        13839561654909534208UL.reinterpret_as_double(),
        13835058055282163712UL.reinterpret_as_double(),
      ]),
    )
  } catch {
    error => fail("original set_dashes row 19: " + error.to_string())
  }
  // repeat same tuple setter always marks stale
  try {
    // Controlled native stale=False input only; no draw/recache is performed.
    line.mark_drawn()
    line_dashes_source_state(
      line,
      axes,
      None,
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "--",
      true,
      9223372036854775808UL.reinterpret_as_double(),
      Some([
        13835058055282163712UL.reinterpret_as_double(),
        13830554455654793216UL.reinterpret_as_double(),
      ]),
      9223372036854775808UL.reinterpret_as_double(),
      Some([
        13839561654909534208UL.reinterpret_as_double(),
        13835058055282163712UL.reinterpret_as_double(),
      ]),
      true,
      false,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [false, false],
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
    line.set_dashes([
      13835058055282163712UL.reinterpret_as_double(),
      13830554455654793216UL.reinterpret_as_double(),
    ])
    line_dashes_source_state(
      line,
      axes,
      None,
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "--",
      true,
      9223372036854775808UL.reinterpret_as_double(),
      Some([
        13835058055282163712UL.reinterpret_as_double(),
        13830554455654793216UL.reinterpret_as_double(),
      ]),
      9223372036854775808UL.reinterpret_as_double(),
      Some([
        13839561654909534208UL.reinterpret_as_double(),
        13835058055282163712UL.reinterpret_as_double(),
      ]),
      true,
      true,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [false, false],
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
    line_dashes_source_numbers(incoming, [
      13835058055282163712UL.reinterpret_as_double(),
      4616189618054758400UL.reinterpret_as_double(),
    ])
    line_dashes_source_double(
      held.dash_offset(),
      9223372036854775808UL.reinterpret_as_double(),
    )
    line_dashes_source_dashes(
      held.dash_sequence(),
      Some([
        13839561654909534208UL.reinterpret_as_double(),
        13835058055282163712UL.reinterpret_as_double(),
      ]),
    )
  } catch {
    error => fail("original set_dashes row 20: " + error.to_string())
  }
  // rc template change does not replace custom sequence
  try {
    // Controlled native stale=False input only; no draw/recache is performed.
    line.mark_drawn()
    line_dashes_source_state(
      line,
      axes,
      None,
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "--",
      true,
      9223372036854775808UL.reinterpret_as_double(),
      Some([
        13835058055282163712UL.reinterpret_as_double(),
        13830554455654793216UL.reinterpret_as_double(),
      ]),
      9223372036854775808UL.reinterpret_as_double(),
      Some([
        13839561654909534208UL.reinterpret_as_double(),
        13835058055282163712UL.reinterpret_as_double(),
      ]),
      true,
      false,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [false, false],
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
    @config.set_lines_dashed_pattern([
      4621256167635550208UL.reinterpret_as_double(),
      4620693217682128896UL.reinterpret_as_double(),
    ])
    line_dashes_source_state(
      line,
      axes,
      None,
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "--",
      true,
      9223372036854775808UL.reinterpret_as_double(),
      Some([
        13835058055282163712UL.reinterpret_as_double(),
        13830554455654793216UL.reinterpret_as_double(),
      ]),
      9223372036854775808UL.reinterpret_as_double(),
      Some([
        13839561654909534208UL.reinterpret_as_double(),
        13835058055282163712UL.reinterpret_as_double(),
      ]),
      true,
      false,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [false, false],
      true,
      [
        4621256167635550208UL.reinterpret_as_double(),
        4620693217682128896UL.reinterpret_as_double(),
      ],
    )
    line_dashes_source_numbers(incoming, [
      13835058055282163712UL.reinterpret_as_double(),
      4616189618054758400UL.reinterpret_as_double(),
    ])
    line_dashes_source_double(
      held.dash_offset(),
      9223372036854775808UL.reinterpret_as_double(),
    )
    line_dashes_source_dashes(
      held.dash_sequence(),
      Some([
        13839561654909534208UL.reinterpret_as_double(),
        13835058055282163712UL.reinterpret_as_double(),
      ]),
    )
  } catch {
    error => fail("original set_dashes row 21: " + error.to_string())
  }
  // same width reads live scale using captured tuple without modulo redo
  try {
    // Controlled native stale=False input only; no draw/recache is performed.
    line.mark_drawn()
    line_dashes_source_state(
      line,
      axes,
      None,
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "--",
      true,
      9223372036854775808UL.reinterpret_as_double(),
      Some([
        13835058055282163712UL.reinterpret_as_double(),
        13830554455654793216UL.reinterpret_as_double(),
      ]),
      9223372036854775808UL.reinterpret_as_double(),
      Some([
        13839561654909534208UL.reinterpret_as_double(),
        13835058055282163712UL.reinterpret_as_double(),
      ]),
      true,
      false,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [false, false],
      true,
      [
        4621256167635550208UL.reinterpret_as_double(),
        4620693217682128896UL.reinterpret_as_double(),
      ],
    )
    @config.set_lines_scale_dashes(false)
    line.set_linewidth(4611686018427387904UL.reinterpret_as_double())
    line_dashes_source_state(
      line,
      axes,
      None,
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "--",
      true,
      9223372036854775808UL.reinterpret_as_double(),
      Some([
        13835058055282163712UL.reinterpret_as_double(),
        13830554455654793216UL.reinterpret_as_double(),
      ]),
      9223372036854775808UL.reinterpret_as_double(),
      Some([
        13835058055282163712UL.reinterpret_as_double(),
        13830554455654793216UL.reinterpret_as_double(),
      ]),
      false,
      false,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [false, false],
      false,
      [
        4621256167635550208UL.reinterpret_as_double(),
        4620693217682128896UL.reinterpret_as_double(),
      ],
    )
    line_dashes_source_numbers(incoming, [
      13835058055282163712UL.reinterpret_as_double(),
      4616189618054758400UL.reinterpret_as_double(),
    ])
    line_dashes_source_double(
      held.dash_offset(),
      9223372036854775808UL.reinterpret_as_double(),
    )
    line_dashes_source_dashes(
      held.dash_sequence(),
      Some([
        13839561654909534208UL.reinterpret_as_double(),
        13835058055282163712UL.reinterpret_as_double(),
      ]),
    )
  } catch {
    error => fail("original set_dashes row 22: " + error.to_string())
  }
  // String linestyle recaptures live rc after custom tuple
  try {
    // Controlled native stale=False input only; no draw/recache is performed.
    line.mark_drawn()
    line_dashes_source_state(
      line,
      axes,
      None,
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "--",
      true,
      9223372036854775808UL.reinterpret_as_double(),
      Some([
        13835058055282163712UL.reinterpret_as_double(),
        13830554455654793216UL.reinterpret_as_double(),
      ]),
      9223372036854775808UL.reinterpret_as_double(),
      Some([
        13835058055282163712UL.reinterpret_as_double(),
        13830554455654793216UL.reinterpret_as_double(),
      ]),
      false,
      false,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [false, false],
      false,
      [
        4621256167635550208UL.reinterpret_as_double(),
        4620693217682128896UL.reinterpret_as_double(),
      ],
    )
    line.set_linestyle("dashed")
    line_dashes_source_state(
      line,
      axes,
      None,
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "--",
      true,
      0UL.reinterpret_as_double(),
      Some([
        4621256167635550208UL.reinterpret_as_double(),
        4620693217682128896UL.reinterpret_as_double(),
      ]),
      0UL.reinterpret_as_double(),
      Some([
        4621256167635550208UL.reinterpret_as_double(),
        4620693217682128896UL.reinterpret_as_double(),
      ]),
      false,
      true,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [false, false],
      false,
      [
        4621256167635550208UL.reinterpret_as_double(),
        4620693217682128896UL.reinterpret_as_double(),
      ],
    )
    line_dashes_source_numbers(incoming, [
      13835058055282163712UL.reinterpret_as_double(),
      4616189618054758400UL.reinterpret_as_double(),
    ])
    line_dashes_source_double(
      held.dash_offset(),
      9223372036854775808UL.reinterpret_as_double(),
    )
    line_dashes_source_dashes(
      held.dash_sequence(),
      Some([
        13839561654909534208UL.reinterpret_as_double(),
        13835058055282163712UL.reinterpret_as_double(),
      ]),
    )
  } catch {
    error => fail("original set_dashes row 23: " + error.to_string())
  }
}

///|
fn line_dashes_source_history_24() -> Unit raise {
  let saved_scale = @config.lines_scale_dashes()
  let saved_dashed = @config.lines_dashed_pattern()
  let saved_dashdot = @config.lines_dashdot_pattern()
  let saved_dotted = @config.lines_dotted_pattern()
  defer {
    @config.set_lines_scale_dashes(saved_scale)
    @config.set_lines_dashed_pattern(saved_dashed)
    @config.set_lines_dashdot_pattern(saved_dashdot)
    @config.set_lines_dotted_pattern(saved_dotted)
  }
  @config.set_lines_scale_dashes(true)
  @config.set_lines_dashed_pattern([3.7, 1.6])
  @config.set_lines_dashdot_pattern([6.4, 1.6, 1.0, 1.6])
  @config.set_lines_dotted_pattern([1.0, 1.65])
  let saved_cycle = @config.color_cycle()
  defer @config.set_color_cycle(saved_cycle)
  @config.set_color_cycle(["#11223344", "none"])
  @config.set_lines_scale_dashes(false)
  @config.set_lines_dashed_pattern([
    4615514078110652826UL.reinterpret_as_double(),
    4609884578576439706UL.reinterpret_as_double(),
  ])
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([0.0, 1.0]),
    LineData::Numeric([10.0, 20.0]),
    color="blue",
  )
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  let incoming = [
    13835058055282163712UL.reinterpret_as_double(),
    13830554455654793216UL.reinterpret_as_double(),
  ]
  // tuple snapshot from caller input
  try {
    // Controlled native stale=False input only; no draw/recache is performed.
    line.mark_drawn()
    line_dashes_source_state(
      line,
      axes,
      None,
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "-",
      false,
      0UL.reinterpret_as_double(),
      None,
      0UL.reinterpret_as_double(),
      None,
      false,
      false,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [false, false],
      false,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
    line.set_dashes(incoming)
    line_dashes_source_state(
      line,
      axes,
      None,
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "--",
      true,
      9223372036854775808UL.reinterpret_as_double(),
      Some([
        13835058055282163712UL.reinterpret_as_double(),
        13830554455654793216UL.reinterpret_as_double(),
      ]),
      9223372036854775808UL.reinterpret_as_double(),
      Some([
        13835058055282163712UL.reinterpret_as_double(),
        13830554455654793216UL.reinterpret_as_double(),
      ]),
      false,
      true,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [false, false],
      false,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
    line_dashes_source_numbers(incoming, [
      13835058055282163712UL.reinterpret_as_double(),
      13830554455654793216UL.reinterpret_as_double(),
    ])
  } catch {
    error => fail("original set_dashes row 24: " + error.to_string())
  }
  let held = line.style.line_stroke()
  // external caller mutation leaves captured tuple unchanged
  try {
    // Controlled native stale=False input only; no draw/recache is performed.
    line.mark_drawn()
    line_dashes_source_state(
      line,
      axes,
      None,
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "--",
      true,
      9223372036854775808UL.reinterpret_as_double(),
      Some([
        13835058055282163712UL.reinterpret_as_double(),
        13830554455654793216UL.reinterpret_as_double(),
      ]),
      9223372036854775808UL.reinterpret_as_double(),
      Some([
        13835058055282163712UL.reinterpret_as_double(),
        13830554455654793216UL.reinterpret_as_double(),
      ]),
      false,
      false,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [false, false],
      false,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
    incoming[1] = 4616189618054758400UL.reinterpret_as_double()
    line_dashes_source_state(
      line,
      axes,
      None,
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "--",
      true,
      9223372036854775808UL.reinterpret_as_double(),
      Some([
        13835058055282163712UL.reinterpret_as_double(),
        13830554455654793216UL.reinterpret_as_double(),
      ]),
      9223372036854775808UL.reinterpret_as_double(),
      Some([
        13835058055282163712UL.reinterpret_as_double(),
        13830554455654793216UL.reinterpret_as_double(),
      ]),
      false,
      false,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [false, false],
      false,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
    line_dashes_source_numbers(incoming, [
      13835058055282163712UL.reinterpret_as_double(),
      4616189618054758400UL.reinterpret_as_double(),
    ])
    line_dashes_source_double(
      held.dash_offset(),
      9223372036854775808UL.reinterpret_as_double(),
    )
    line_dashes_source_dashes(
      held.dash_sequence(),
      Some([
        13835058055282163712UL.reinterpret_as_double(),
        13830554455654793216UL.reinterpret_as_double(),
      ]),
    )
  } catch {
    error => fail("original set_dashes row 25: " + error.to_string())
  }
  // repeat same tuple setter always marks stale
  try {
    // Controlled native stale=False input only; no draw/recache is performed.
    line.mark_drawn()
    line_dashes_source_state(
      line,
      axes,
      None,
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "--",
      true,
      9223372036854775808UL.reinterpret_as_double(),
      Some([
        13835058055282163712UL.reinterpret_as_double(),
        13830554455654793216UL.reinterpret_as_double(),
      ]),
      9223372036854775808UL.reinterpret_as_double(),
      Some([
        13835058055282163712UL.reinterpret_as_double(),
        13830554455654793216UL.reinterpret_as_double(),
      ]),
      false,
      false,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [false, false],
      false,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
    line.set_dashes([
      13835058055282163712UL.reinterpret_as_double(),
      13830554455654793216UL.reinterpret_as_double(),
    ])
    line_dashes_source_state(
      line,
      axes,
      None,
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "--",
      true,
      9223372036854775808UL.reinterpret_as_double(),
      Some([
        13835058055282163712UL.reinterpret_as_double(),
        13830554455654793216UL.reinterpret_as_double(),
      ]),
      9223372036854775808UL.reinterpret_as_double(),
      Some([
        13835058055282163712UL.reinterpret_as_double(),
        13830554455654793216UL.reinterpret_as_double(),
      ]),
      false,
      true,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [false, false],
      false,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
    line_dashes_source_numbers(incoming, [
      13835058055282163712UL.reinterpret_as_double(),
      4616189618054758400UL.reinterpret_as_double(),
    ])
    line_dashes_source_double(
      held.dash_offset(),
      9223372036854775808UL.reinterpret_as_double(),
    )
    line_dashes_source_dashes(
      held.dash_sequence(),
      Some([
        13835058055282163712UL.reinterpret_as_double(),
        13830554455654793216UL.reinterpret_as_double(),
      ]),
    )
  } catch {
    error => fail("original set_dashes row 26: " + error.to_string())
  }
  // rc template change does not replace custom sequence
  try {
    // Controlled native stale=False input only; no draw/recache is performed.
    line.mark_drawn()
    line_dashes_source_state(
      line,
      axes,
      None,
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "--",
      true,
      9223372036854775808UL.reinterpret_as_double(),
      Some([
        13835058055282163712UL.reinterpret_as_double(),
        13830554455654793216UL.reinterpret_as_double(),
      ]),
      9223372036854775808UL.reinterpret_as_double(),
      Some([
        13835058055282163712UL.reinterpret_as_double(),
        13830554455654793216UL.reinterpret_as_double(),
      ]),
      false,
      false,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [false, false],
      false,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
    @config.set_lines_dashed_pattern([
      4621256167635550208UL.reinterpret_as_double(),
      4620693217682128896UL.reinterpret_as_double(),
    ])
    line_dashes_source_state(
      line,
      axes,
      None,
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "--",
      true,
      9223372036854775808UL.reinterpret_as_double(),
      Some([
        13835058055282163712UL.reinterpret_as_double(),
        13830554455654793216UL.reinterpret_as_double(),
      ]),
      9223372036854775808UL.reinterpret_as_double(),
      Some([
        13835058055282163712UL.reinterpret_as_double(),
        13830554455654793216UL.reinterpret_as_double(),
      ]),
      false,
      false,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [false, false],
      false,
      [
        4621256167635550208UL.reinterpret_as_double(),
        4620693217682128896UL.reinterpret_as_double(),
      ],
    )
    line_dashes_source_numbers(incoming, [
      13835058055282163712UL.reinterpret_as_double(),
      4616189618054758400UL.reinterpret_as_double(),
    ])
    line_dashes_source_double(
      held.dash_offset(),
      9223372036854775808UL.reinterpret_as_double(),
    )
    line_dashes_source_dashes(
      held.dash_sequence(),
      Some([
        13835058055282163712UL.reinterpret_as_double(),
        13830554455654793216UL.reinterpret_as_double(),
      ]),
    )
  } catch {
    error => fail("original set_dashes row 27: " + error.to_string())
  }
  // same width reads live scale using captured tuple without modulo redo
  try {
    // Controlled native stale=False input only; no draw/recache is performed.
    line.mark_drawn()
    line_dashes_source_state(
      line,
      axes,
      None,
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "--",
      true,
      9223372036854775808UL.reinterpret_as_double(),
      Some([
        13835058055282163712UL.reinterpret_as_double(),
        13830554455654793216UL.reinterpret_as_double(),
      ]),
      9223372036854775808UL.reinterpret_as_double(),
      Some([
        13835058055282163712UL.reinterpret_as_double(),
        13830554455654793216UL.reinterpret_as_double(),
      ]),
      false,
      false,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [false, false],
      false,
      [
        4621256167635550208UL.reinterpret_as_double(),
        4620693217682128896UL.reinterpret_as_double(),
      ],
    )
    @config.set_lines_scale_dashes(true)
    line.set_linewidth(4611686018427387904UL.reinterpret_as_double())
    line_dashes_source_state(
      line,
      axes,
      None,
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "--",
      true,
      9223372036854775808UL.reinterpret_as_double(),
      Some([
        13835058055282163712UL.reinterpret_as_double(),
        13830554455654793216UL.reinterpret_as_double(),
      ]),
      9223372036854775808UL.reinterpret_as_double(),
      Some([
        13839561654909534208UL.reinterpret_as_double(),
        13835058055282163712UL.reinterpret_as_double(),
      ]),
      true,
      false,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [false, false],
      true,
      [
        4621256167635550208UL.reinterpret_as_double(),
        4620693217682128896UL.reinterpret_as_double(),
      ],
    )
    line_dashes_source_numbers(incoming, [
      13835058055282163712UL.reinterpret_as_double(),
      4616189618054758400UL.reinterpret_as_double(),
    ])
    line_dashes_source_double(
      held.dash_offset(),
      9223372036854775808UL.reinterpret_as_double(),
    )
    line_dashes_source_dashes(
      held.dash_sequence(),
      Some([
        13835058055282163712UL.reinterpret_as_double(),
        13830554455654793216UL.reinterpret_as_double(),
      ]),
    )
  } catch {
    error => fail("original set_dashes row 28: " + error.to_string())
  }
  // String linestyle recaptures live rc after custom tuple
  try {
    // Controlled native stale=False input only; no draw/recache is performed.
    line.mark_drawn()
    line_dashes_source_state(
      line,
      axes,
      None,
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "--",
      true,
      9223372036854775808UL.reinterpret_as_double(),
      Some([
        13835058055282163712UL.reinterpret_as_double(),
        13830554455654793216UL.reinterpret_as_double(),
      ]),
      9223372036854775808UL.reinterpret_as_double(),
      Some([
        13839561654909534208UL.reinterpret_as_double(),
        13835058055282163712UL.reinterpret_as_double(),
      ]),
      true,
      false,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [false, false],
      true,
      [
        4621256167635550208UL.reinterpret_as_double(),
        4620693217682128896UL.reinterpret_as_double(),
      ],
    )
    line.set_linestyle("dashed")
    line_dashes_source_state(
      line,
      axes,
      None,
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "--",
      true,
      0UL.reinterpret_as_double(),
      Some([
        4621256167635550208UL.reinterpret_as_double(),
        4620693217682128896UL.reinterpret_as_double(),
      ]),
      0UL.reinterpret_as_double(),
      Some([
        4625759767262920704UL.reinterpret_as_double(),
        4625196817309499392UL.reinterpret_as_double(),
      ]),
      true,
      true,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [false, false],
      true,
      [
        4621256167635550208UL.reinterpret_as_double(),
        4620693217682128896UL.reinterpret_as_double(),
      ],
    )
    line_dashes_source_numbers(incoming, [
      13835058055282163712UL.reinterpret_as_double(),
      4616189618054758400UL.reinterpret_as_double(),
    ])
    line_dashes_source_double(
      held.dash_offset(),
      9223372036854775808UL.reinterpret_as_double(),
    )
    line_dashes_source_dashes(
      held.dash_sequence(),
      Some([
        13835058055282163712UL.reinterpret_as_double(),
        13830554455654793216UL.reinterpret_as_double(),
      ]),
    )
  } catch {
    error => fail("original set_dashes row 29: " + error.to_string())
  }
}

///|
test "original set_dashes immutable tuple snapshots and setter history" {
  line_dashes_source_setter_0()
  line_dashes_source_setter_1()
  line_dashes_source_setter_2()
  line_dashes_source_setter_3()
  line_dashes_source_setter_4()
  line_dashes_source_setter_5()
  line_dashes_source_setter_6()
  line_dashes_source_setter_7()
  line_dashes_source_setter_8()
  line_dashes_source_setter_9()
  line_dashes_source_setter_10()
  line_dashes_source_setter_11()
  line_dashes_source_setter_12()
  line_dashes_source_setter_13()
  line_dashes_source_setter_14()
  line_dashes_source_setter_15()
  line_dashes_source_setter_16()
  line_dashes_source_setter_17()
  line_dashes_source_history_18()
  line_dashes_source_history_24()
}

///|
fn line_dashes_source_draw_0() -> Unit raise {
  let saved_scale = @config.lines_scale_dashes()
  let saved_dashed = @config.lines_dashed_pattern()
  let saved_dashdot = @config.lines_dashdot_pattern()
  let saved_dotted = @config.lines_dotted_pattern()
  defer {
    @config.set_lines_scale_dashes(saved_scale)
    @config.set_lines_dashed_pattern(saved_dashed)
    @config.set_lines_dashdot_pattern(saved_dashdot)
    @config.set_lines_dotted_pattern(saved_dotted)
  }
  @config.set_lines_scale_dashes(true)
  @config.set_lines_dashed_pattern([3.7, 1.6])
  @config.set_lines_dashdot_pattern([6.4, 1.6, 1.0, 1.6])
  @config.set_lines_dotted_pattern([1.0, 1.65])
  let saved_cycle = @config.color_cycle()
  defer @config.set_color_cycle(saved_cycle)
  @config.set_color_cycle(["#11223344", "none"])
  let fig = figure(width=400, height=200)
  let axes = fig.axes()
  // Fixed frame isolates the source leaf from parent ticks/autoscale.
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  for axis in [axes.x_axis(), axes.y_axis()] {
    axis.set_locator(@ticker.NullLocator::new().as_locator())
    axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  }
  @config.set_lines_scale_dashes(true)
  @config.set_lines_dashed_pattern([
    4615514078110652826UL.reinterpret_as_double(),
    4609884578576439706UL.reinterpret_as_double(),
  ])
  let line = axes.plot_line(
    LineData::Numeric([
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ]),
    LineData::Numeric([
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ]),
    color="blue",
  )
  line.set_linewidth(4611686018427387904UL.reinterpret_as_double())
  line.set_dashes([])
  line.set_gapcolor(Some("red"))
  line.set_color("blue")
  // Source leaf omitted add_line/update_line_limits: input bridge, never after-normalization.
  axes.state.val.raw_x_data = empty_data_interval()
  axes.state.val.raw_y_data = empty_data_interval()
  axes.state.val.x_data_minpos = 1.0 / 0.0
  axes.state.val.y_data_minpos = 1.0 / 0.0
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  let retained = fig.to_render_figure()
  try {
    line_dashes_source_state(
      line,
      axes,
      Some("red"),
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "-",
      false,
      0UL.reinterpret_as_double(),
      None,
      0UL.reinterpret_as_double(),
      None,
      false,
      true,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
      [false, false],
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
    let svg = @svg.render_with_positions_checked(retained).0
    let paints = line_dashes_source_polylines(svg)
    assert_eq(paints.length(), 1)
    line_dashes_source_paint(
      paints[0],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      0UL.reinterpret_as_double(),
      None,
      4611686018427387904UL.reinterpret_as_double(),
    )
    line_dashes_source_state(
      line,
      axes,
      Some("red"),
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "-",
      false,
      0UL.reinterpret_as_double(),
      None,
      0UL.reinterpret_as_double(),
      None,
      false,
      false,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
      [false, false],
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
    line_dashes_source_rgba(line_color_rgba("blue", alpha=None), [
      0UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
  } catch {
    error => fail("original set_dashes draw row 0: " + error.to_string())
  }
}

///|
fn line_dashes_source_draw_1() -> Unit raise {
  let saved_scale = @config.lines_scale_dashes()
  let saved_dashed = @config.lines_dashed_pattern()
  let saved_dashdot = @config.lines_dashdot_pattern()
  let saved_dotted = @config.lines_dotted_pattern()
  defer {
    @config.set_lines_scale_dashes(saved_scale)
    @config.set_lines_dashed_pattern(saved_dashed)
    @config.set_lines_dashdot_pattern(saved_dashdot)
    @config.set_lines_dotted_pattern(saved_dotted)
  }
  @config.set_lines_scale_dashes(true)
  @config.set_lines_dashed_pattern([3.7, 1.6])
  @config.set_lines_dashdot_pattern([6.4, 1.6, 1.0, 1.6])
  @config.set_lines_dotted_pattern([1.0, 1.65])
  let saved_cycle = @config.color_cycle()
  defer @config.set_color_cycle(saved_cycle)
  @config.set_color_cycle(["#11223344", "none"])
  let fig = figure(width=400, height=200)
  let axes = fig.axes()
  // Fixed frame isolates the source leaf from parent ticks/autoscale.
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  for axis in [axes.x_axis(), axes.y_axis()] {
    axis.set_locator(@ticker.NullLocator::new().as_locator())
    axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  }
  @config.set_lines_scale_dashes(true)
  @config.set_lines_dashed_pattern([
    4615514078110652826UL.reinterpret_as_double(),
    4609884578576439706UL.reinterpret_as_double(),
  ])
  let line = axes.plot_line(
    LineData::Numeric([
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ]),
    LineData::Numeric([
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ]),
    color="blue",
  )
  line.set_linewidth(4611686018427387904UL.reinterpret_as_double())
  line.set_dashes([
    4607182418800017408UL.reinterpret_as_double(),
    4611686018427387904UL.reinterpret_as_double(),
    4613937818241073152UL.reinterpret_as_double(),
  ])
  line.set_gapcolor(None)
  line.set_color("blue")
  // Source leaf omitted add_line/update_line_limits: input bridge, never after-normalization.
  axes.state.val.raw_x_data = empty_data_interval()
  axes.state.val.raw_y_data = empty_data_interval()
  axes.state.val.x_data_minpos = 1.0 / 0.0
  axes.state.val.y_data_minpos = 1.0 / 0.0
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  let retained = fig.to_render_figure()
  try {
    line_dashes_source_state(
      line,
      axes,
      None,
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "--",
      true,
      0UL.reinterpret_as_double(),
      Some([
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ]),
      0UL.reinterpret_as_double(),
      Some([
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4618441417868443648UL.reinterpret_as_double(),
      ]),
      true,
      true,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
      [false, false],
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
    let svg = @svg.render_with_positions_checked(retained).0
    let paints = line_dashes_source_polylines(svg)
    assert_eq(paints.length(), 1)
    line_dashes_source_paint(
      paints[0],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      0UL.reinterpret_as_double(),
      Some([
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4618441417868443648UL.reinterpret_as_double(),
      ]),
      4611686018427387904UL.reinterpret_as_double(),
    )
    line_dashes_source_state(
      line,
      axes,
      None,
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "--",
      true,
      0UL.reinterpret_as_double(),
      Some([
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ]),
      0UL.reinterpret_as_double(),
      Some([
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4618441417868443648UL.reinterpret_as_double(),
      ]),
      true,
      false,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
      [false, false],
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
    line_dashes_source_rgba(line_color_rgba("blue", alpha=None), [
      0UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
  } catch {
    error => fail("original set_dashes draw row 1: " + error.to_string())
  }
}

///|
fn line_dashes_source_draw_2() -> Unit raise {
  let saved_scale = @config.lines_scale_dashes()
  let saved_dashed = @config.lines_dashed_pattern()
  let saved_dashdot = @config.lines_dashdot_pattern()
  let saved_dotted = @config.lines_dotted_pattern()
  defer {
    @config.set_lines_scale_dashes(saved_scale)
    @config.set_lines_dashed_pattern(saved_dashed)
    @config.set_lines_dashdot_pattern(saved_dashdot)
    @config.set_lines_dotted_pattern(saved_dotted)
  }
  @config.set_lines_scale_dashes(true)
  @config.set_lines_dashed_pattern([3.7, 1.6])
  @config.set_lines_dashdot_pattern([6.4, 1.6, 1.0, 1.6])
  @config.set_lines_dotted_pattern([1.0, 1.65])
  let saved_cycle = @config.color_cycle()
  defer @config.set_color_cycle(saved_cycle)
  @config.set_color_cycle(["#11223344", "none"])
  let fig = figure(width=400, height=200)
  let axes = fig.axes()
  // Fixed frame isolates the source leaf from parent ticks/autoscale.
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  for axis in [axes.x_axis(), axes.y_axis()] {
    axis.set_locator(@ticker.NullLocator::new().as_locator())
    axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  }
  @config.set_lines_scale_dashes(true)
  @config.set_lines_dashed_pattern([
    4615514078110652826UL.reinterpret_as_double(),
    4609884578576439706UL.reinterpret_as_double(),
  ])
  let line = axes.plot_line(
    LineData::Numeric([
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ]),
    LineData::Numeric([
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ]),
    color="blue",
  )
  line.set_linewidth(4611686018427387904UL.reinterpret_as_double())
  line.set_dashes([
    4607182418800017408UL.reinterpret_as_double(),
    4611686018427387904UL.reinterpret_as_double(),
    4613937818241073152UL.reinterpret_as_double(),
  ])
  line.set_gapcolor(Some("red"))
  line.set_color("blue")
  // Source leaf omitted add_line/update_line_limits: input bridge, never after-normalization.
  axes.state.val.raw_x_data = empty_data_interval()
  axes.state.val.raw_y_data = empty_data_interval()
  axes.state.val.x_data_minpos = 1.0 / 0.0
  axes.state.val.y_data_minpos = 1.0 / 0.0
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  let retained = fig.to_render_figure()
  try {
    line_dashes_source_state(
      line,
      axes,
      Some("red"),
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "--",
      true,
      0UL.reinterpret_as_double(),
      Some([
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ]),
      0UL.reinterpret_as_double(),
      Some([
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4618441417868443648UL.reinterpret_as_double(),
      ]),
      true,
      true,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
      [false, false],
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
    let svg = @svg.render_with_positions_checked(retained).0
    let paints = line_dashes_source_polylines(svg)
    assert_eq(paints.length(), 2)
    line_dashes_source_paint(
      paints[0],
      [
        4607182418800017408UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      4618441417868443648UL.reinterpret_as_double(),
      Some([
        4618441417868443648UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ]),
      4611686018427387904UL.reinterpret_as_double(),
    )
    line_dashes_source_paint(
      paints[1],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      0UL.reinterpret_as_double(),
      Some([
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4618441417868443648UL.reinterpret_as_double(),
      ]),
      4611686018427387904UL.reinterpret_as_double(),
    )
    line_dashes_source_state(
      line,
      axes,
      Some("red"),
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "--",
      true,
      0UL.reinterpret_as_double(),
      Some([
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ]),
      0UL.reinterpret_as_double(),
      Some([
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
        4618441417868443648UL.reinterpret_as_double(),
      ]),
      true,
      false,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
      [false, false],
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
    line_dashes_source_rgba(line_color_rgba("red", alpha=None), [
      4607182418800017408UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
    line_dashes_source_rgba(line_color_rgba("blue", alpha=None), [
      0UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
  } catch {
    error => fail("original set_dashes draw row 2: " + error.to_string())
  }
}

///|
fn line_dashes_source_draw_3() -> Unit raise {
  let saved_scale = @config.lines_scale_dashes()
  let saved_dashed = @config.lines_dashed_pattern()
  let saved_dashdot = @config.lines_dashdot_pattern()
  let saved_dotted = @config.lines_dotted_pattern()
  defer {
    @config.set_lines_scale_dashes(saved_scale)
    @config.set_lines_dashed_pattern(saved_dashed)
    @config.set_lines_dashdot_pattern(saved_dashdot)
    @config.set_lines_dotted_pattern(saved_dotted)
  }
  @config.set_lines_scale_dashes(true)
  @config.set_lines_dashed_pattern([3.7, 1.6])
  @config.set_lines_dashdot_pattern([6.4, 1.6, 1.0, 1.6])
  @config.set_lines_dotted_pattern([1.0, 1.65])
  let saved_cycle = @config.color_cycle()
  defer @config.set_color_cycle(saved_cycle)
  @config.set_color_cycle(["#11223344", "none"])
  let fig = figure(width=400, height=200)
  let axes = fig.axes()
  // Fixed frame isolates the source leaf from parent ticks/autoscale.
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  for axis in [axes.x_axis(), axes.y_axis()] {
    axis.set_locator(@ticker.NullLocator::new().as_locator())
    axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  }
  @config.set_lines_scale_dashes(false)
  @config.set_lines_dashed_pattern([
    4615514078110652826UL.reinterpret_as_double(),
    4609884578576439706UL.reinterpret_as_double(),
  ])
  let line = axes.plot_line(
    LineData::Numeric([
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ]),
    LineData::Numeric([
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ]),
    color="blue",
  )
  line.set_linewidth(4611686018427387904UL.reinterpret_as_double())
  line.set_dashes([
    4607182418800017408UL.reinterpret_as_double(),
    4611686018427387904UL.reinterpret_as_double(),
    4613937818241073152UL.reinterpret_as_double(),
  ])
  line.set_gapcolor(Some("red"))
  line.set_color("blue")
  // Source leaf omitted add_line/update_line_limits: input bridge, never after-normalization.
  axes.state.val.raw_x_data = empty_data_interval()
  axes.state.val.raw_y_data = empty_data_interval()
  axes.state.val.x_data_minpos = 1.0 / 0.0
  axes.state.val.y_data_minpos = 1.0 / 0.0
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  let retained = fig.to_render_figure()
  try {
    line_dashes_source_state(
      line,
      axes,
      Some("red"),
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "--",
      true,
      0UL.reinterpret_as_double(),
      Some([
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ]),
      0UL.reinterpret_as_double(),
      Some([
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ]),
      false,
      true,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
      [false, false],
      false,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
    let svg = @svg.render_with_positions_checked(retained).0
    let paints = line_dashes_source_polylines(svg)
    assert_eq(paints.length(), 2)
    line_dashes_source_paint(
      paints[0],
      [
        4607182418800017408UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      4613937818241073152UL.reinterpret_as_double(),
      Some([
        4613937818241073152UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      4611686018427387904UL.reinterpret_as_double(),
    )
    line_dashes_source_paint(
      paints[1],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      0UL.reinterpret_as_double(),
      Some([
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ]),
      4611686018427387904UL.reinterpret_as_double(),
    )
    line_dashes_source_state(
      line,
      axes,
      Some("red"),
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "--",
      true,
      0UL.reinterpret_as_double(),
      Some([
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ]),
      0UL.reinterpret_as_double(),
      Some([
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ]),
      false,
      false,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
      [false, false],
      false,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
    line_dashes_source_rgba(line_color_rgba("red", alpha=None), [
      4607182418800017408UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
    line_dashes_source_rgba(line_color_rgba("blue", alpha=None), [
      0UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
  } catch {
    error => fail("original set_dashes draw row 3: " + error.to_string())
  }
}

///|
fn line_dashes_source_draw_4() -> Unit raise {
  let saved_scale = @config.lines_scale_dashes()
  let saved_dashed = @config.lines_dashed_pattern()
  let saved_dashdot = @config.lines_dashdot_pattern()
  let saved_dotted = @config.lines_dotted_pattern()
  defer {
    @config.set_lines_scale_dashes(saved_scale)
    @config.set_lines_dashed_pattern(saved_dashed)
    @config.set_lines_dashdot_pattern(saved_dashdot)
    @config.set_lines_dotted_pattern(saved_dotted)
  }
  @config.set_lines_scale_dashes(true)
  @config.set_lines_dashed_pattern([3.7, 1.6])
  @config.set_lines_dashdot_pattern([6.4, 1.6, 1.0, 1.6])
  @config.set_lines_dotted_pattern([1.0, 1.65])
  let saved_cycle = @config.color_cycle()
  defer @config.set_color_cycle(saved_cycle)
  @config.set_color_cycle(["#11223344", "none"])
  let fig = figure(width=400, height=200)
  let axes = fig.axes()
  // Fixed frame isolates the source leaf from parent ticks/autoscale.
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  for axis in [axes.x_axis(), axes.y_axis()] {
    axis.set_locator(@ticker.NullLocator::new().as_locator())
    axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  }
  @config.set_lines_scale_dashes(true)
  @config.set_lines_dashed_pattern([
    4615514078110652826UL.reinterpret_as_double(),
    4609884578576439706UL.reinterpret_as_double(),
  ])
  let line = axes.plot_line(
    LineData::Numeric([
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ]),
    LineData::Numeric([
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ]),
    color="blue",
  )
  line.set_linewidth(4611686018427387904UL.reinterpret_as_double())
  line.set_dashes([
    13830554455654793216UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  line.set_gapcolor(None)
  line.set_color("blue")
  // Source leaf omitted add_line/update_line_limits: input bridge, never after-normalization.
  axes.state.val.raw_x_data = empty_data_interval()
  axes.state.val.raw_y_data = empty_data_interval()
  axes.state.val.x_data_minpos = 1.0 / 0.0
  axes.state.val.y_data_minpos = 1.0 / 0.0
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  let retained = fig.to_render_figure()
  try {
    line_dashes_source_state(
      line,
      axes,
      None,
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "--",
      true,
      0UL.reinterpret_as_double(),
      Some([
        13830554455654793216UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ]),
      0UL.reinterpret_as_double(),
      Some([
        13835058055282163712UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      true,
      true,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
      [false, false],
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
    assert_true(
      try {
        ignore(@svg.render_with_positions_checked(retained))
        false
      } catch {
        @core.DataError::InvalidTicks(message~) =>
          message ==
          "ValueError: All values in the dash list must be non-negative"
        _ => false
      },
    )
    line_dashes_source_state(
      line,
      axes,
      None,
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "--",
      true,
      0UL.reinterpret_as_double(),
      Some([
        13830554455654793216UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ]),
      0UL.reinterpret_as_double(),
      Some([
        13835058055282163712UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      true,
      true,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
      [false, false],
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
    line_dashes_source_rgba(line_color_rgba("blue", alpha=None), [
      0UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
  } catch {
    error => fail("original set_dashes draw row 4: " + error.to_string())
  }
}

///|
fn line_dashes_source_draw_5() -> Unit raise {
  let saved_scale = @config.lines_scale_dashes()
  let saved_dashed = @config.lines_dashed_pattern()
  let saved_dashdot = @config.lines_dashdot_pattern()
  let saved_dotted = @config.lines_dotted_pattern()
  defer {
    @config.set_lines_scale_dashes(saved_scale)
    @config.set_lines_dashed_pattern(saved_dashed)
    @config.set_lines_dashdot_pattern(saved_dashdot)
    @config.set_lines_dotted_pattern(saved_dotted)
  }
  @config.set_lines_scale_dashes(true)
  @config.set_lines_dashed_pattern([3.7, 1.6])
  @config.set_lines_dashdot_pattern([6.4, 1.6, 1.0, 1.6])
  @config.set_lines_dotted_pattern([1.0, 1.65])
  let saved_cycle = @config.color_cycle()
  defer @config.set_color_cycle(saved_cycle)
  @config.set_color_cycle(["#11223344", "none"])
  let fig = figure(width=400, height=200)
  let axes = fig.axes()
  // Fixed frame isolates the source leaf from parent ticks/autoscale.
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  for axis in [axes.x_axis(), axes.y_axis()] {
    axis.set_locator(@ticker.NullLocator::new().as_locator())
    axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  }
  @config.set_lines_scale_dashes(true)
  @config.set_lines_dashed_pattern([
    4615514078110652826UL.reinterpret_as_double(),
    4609884578576439706UL.reinterpret_as_double(),
  ])
  let line = axes.plot_line(
    LineData::Numeric([
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ]),
    LineData::Numeric([
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ]),
    color="blue",
  )
  line.set_linewidth(4611686018427387904UL.reinterpret_as_double())
  line.set_dashes([0UL.reinterpret_as_double(), 0UL.reinterpret_as_double()])
  line.set_gapcolor(Some("red"))
  line.set_color(
    "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
  )
  // Source leaf omitted add_line/update_line_limits: input bridge, never after-normalization.
  axes.state.val.raw_x_data = empty_data_interval()
  axes.state.val.raw_y_data = empty_data_interval()
  axes.state.val.x_data_minpos = 1.0 / 0.0
  axes.state.val.y_data_minpos = 1.0 / 0.0
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  let retained = fig.to_render_figure()
  try {
    line_dashes_source_state(
      line,
      axes,
      Some("red"),
      "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "--",
      true,
      0UL.reinterpret_as_double(),
      Some([0UL.reinterpret_as_double(), 0UL.reinterpret_as_double()]),
      0UL.reinterpret_as_double(),
      Some([0UL.reinterpret_as_double(), 0UL.reinterpret_as_double()]),
      true,
      true,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
      [false, false],
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
    assert_true(
      try {
        ignore(@svg.render_with_positions_checked(retained))
        false
      } catch {
        @core.DataError::InvalidTicks(message~) =>
          message ==
          "ValueError: At least one value in the dash list must be positive"
        _ => false
      },
    )
    line_dashes_source_state(
      line,
      axes,
      Some("red"),
      "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "--",
      true,
      0UL.reinterpret_as_double(),
      Some([0UL.reinterpret_as_double(), 0UL.reinterpret_as_double()]),
      0UL.reinterpret_as_double(),
      Some([0UL.reinterpret_as_double(), 0UL.reinterpret_as_double()]),
      true,
      true,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
      [false, false],
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
    line_dashes_source_rgba(line_color_rgba("red", alpha=None), [
      4607182418800017408UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
  } catch {
    error => fail("original set_dashes draw row 5: " + error.to_string())
  }
}

///|
fn line_dashes_source_draw_6() -> Unit raise {
  let saved_scale = @config.lines_scale_dashes()
  let saved_dashed = @config.lines_dashed_pattern()
  let saved_dashdot = @config.lines_dashdot_pattern()
  let saved_dotted = @config.lines_dotted_pattern()
  defer {
    @config.set_lines_scale_dashes(saved_scale)
    @config.set_lines_dashed_pattern(saved_dashed)
    @config.set_lines_dashdot_pattern(saved_dashdot)
    @config.set_lines_dotted_pattern(saved_dotted)
  }
  @config.set_lines_scale_dashes(true)
  @config.set_lines_dashed_pattern([3.7, 1.6])
  @config.set_lines_dashdot_pattern([6.4, 1.6, 1.0, 1.6])
  @config.set_lines_dotted_pattern([1.0, 1.65])
  let saved_cycle = @config.color_cycle()
  defer @config.set_color_cycle(saved_cycle)
  @config.set_color_cycle(["#11223344", "none"])
  let fig = figure(width=400, height=200)
  let axes = fig.axes()
  // Fixed frame isolates the source leaf from parent ticks/autoscale.
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  for axis in [axes.x_axis(), axes.y_axis()] {
    axis.set_locator(@ticker.NullLocator::new().as_locator())
    axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  }
  @config.set_lines_scale_dashes(true)
  @config.set_lines_dashed_pattern([
    4615514078110652826UL.reinterpret_as_double(),
    4609884578576439706UL.reinterpret_as_double(),
  ])
  let line = axes.plot_line(
    LineData::Numeric([
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ]),
    LineData::Numeric([
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ]),
    color="blue",
  )
  line.set_linewidth(4611686018427387904UL.reinterpret_as_double())
  line.set_dashes([4607182418800017408UL.reinterpret_as_double(), 0.0 / 0.0])
  line.set_gapcolor(Some("red"))
  line.set_color("blue")
  // Source leaf omitted add_line/update_line_limits: input bridge, never after-normalization.
  axes.state.val.raw_x_data = empty_data_interval()
  axes.state.val.raw_y_data = empty_data_interval()
  axes.state.val.x_data_minpos = 1.0 / 0.0
  axes.state.val.y_data_minpos = 1.0 / 0.0
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  let retained = fig.to_render_figure()
  try {
    line_dashes_source_state(
      line,
      axes,
      Some("red"),
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "--",
      true,
      0.0 / 0.0,
      Some([4607182418800017408UL.reinterpret_as_double(), 0.0 / 0.0]),
      0.0 / 0.0,
      Some([4611686018427387904UL.reinterpret_as_double(), 0.0 / 0.0]),
      true,
      true,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
      [false, false],
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
    let svg = @svg.render_with_positions_checked(retained).0
    let paints = line_dashes_source_polylines(svg)
    assert_eq(paints.length(), 2)
    line_dashes_source_paint(
      paints[0],
      [
        4607182418800017408UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      0.0 / 0.0,
      Some([0.0 / 0.0, 4611686018427387904UL.reinterpret_as_double()]),
      4611686018427387904UL.reinterpret_as_double(),
    )
    line_dashes_source_paint(
      paints[1],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      0.0 / 0.0,
      Some([4611686018427387904UL.reinterpret_as_double(), 0.0 / 0.0]),
      4611686018427387904UL.reinterpret_as_double(),
    )
    line_dashes_source_state(
      line,
      axes,
      Some("red"),
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "--",
      true,
      0.0 / 0.0,
      Some([4607182418800017408UL.reinterpret_as_double(), 0.0 / 0.0]),
      0.0 / 0.0,
      Some([4611686018427387904UL.reinterpret_as_double(), 0.0 / 0.0]),
      true,
      false,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
      [false, false],
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
    line_dashes_source_rgba(line_color_rgba("red", alpha=None), [
      4607182418800017408UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
    line_dashes_source_rgba(line_color_rgba("blue", alpha=None), [
      0UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
  } catch {
    error => fail("original set_dashes draw row 6: " + error.to_string())
  }
}

///|
fn line_dashes_source_draw_7() -> Unit raise {
  let saved_scale = @config.lines_scale_dashes()
  let saved_dashed = @config.lines_dashed_pattern()
  let saved_dashdot = @config.lines_dashdot_pattern()
  let saved_dotted = @config.lines_dotted_pattern()
  defer {
    @config.set_lines_scale_dashes(saved_scale)
    @config.set_lines_dashed_pattern(saved_dashed)
    @config.set_lines_dashdot_pattern(saved_dashdot)
    @config.set_lines_dotted_pattern(saved_dotted)
  }
  @config.set_lines_scale_dashes(true)
  @config.set_lines_dashed_pattern([3.7, 1.6])
  @config.set_lines_dashdot_pattern([6.4, 1.6, 1.0, 1.6])
  @config.set_lines_dotted_pattern([1.0, 1.65])
  let saved_cycle = @config.color_cycle()
  defer @config.set_color_cycle(saved_cycle)
  @config.set_color_cycle(["#11223344", "none"])
  let fig = figure(width=400, height=200)
  let axes = fig.axes()
  // Fixed frame isolates the source leaf from parent ticks/autoscale.
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  for axis in [axes.x_axis(), axes.y_axis()] {
    axis.set_locator(@ticker.NullLocator::new().as_locator())
    axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  }
  @config.set_lines_scale_dashes(true)
  @config.set_lines_dashed_pattern([
    4615514078110652826UL.reinterpret_as_double(),
    4609884578576439706UL.reinterpret_as_double(),
  ])
  let line = axes.plot_line(
    LineData::Numeric([
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ]),
    LineData::Numeric([
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ]),
    color="blue",
  )
  line.set_linewidth(4611686018427387904UL.reinterpret_as_double())
  line.set_dashes([4607182418800017408UL.reinterpret_as_double(), 1.0 / 0.0])
  line.set_gapcolor(Some("red"))
  line.set_color("blue")
  // Source leaf omitted add_line/update_line_limits: input bridge, never after-normalization.
  axes.state.val.raw_x_data = empty_data_interval()
  axes.state.val.raw_y_data = empty_data_interval()
  axes.state.val.x_data_minpos = 1.0 / 0.0
  axes.state.val.y_data_minpos = 1.0 / 0.0
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  let retained = fig.to_render_figure()
  try {
    line_dashes_source_state(
      line,
      axes,
      Some("red"),
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "--",
      true,
      0UL.reinterpret_as_double(),
      Some([4607182418800017408UL.reinterpret_as_double(), 1.0 / 0.0]),
      0UL.reinterpret_as_double(),
      Some([4611686018427387904UL.reinterpret_as_double(), 1.0 / 0.0]),
      true,
      true,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
      [false, false],
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
    let svg = @svg.render_with_positions_checked(retained).0
    let paints = line_dashes_source_polylines(svg)
    assert_eq(paints.length(), 2)
    line_dashes_source_paint(
      paints[0],
      [
        4607182418800017408UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      1.0 / 0.0,
      Some([1.0 / 0.0, 4611686018427387904UL.reinterpret_as_double()]),
      4611686018427387904UL.reinterpret_as_double(),
    )
    line_dashes_source_paint(
      paints[1],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      0UL.reinterpret_as_double(),
      Some([4611686018427387904UL.reinterpret_as_double(), 1.0 / 0.0]),
      4611686018427387904UL.reinterpret_as_double(),
    )
    line_dashes_source_state(
      line,
      axes,
      Some("red"),
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "--",
      true,
      0UL.reinterpret_as_double(),
      Some([4607182418800017408UL.reinterpret_as_double(), 1.0 / 0.0]),
      0UL.reinterpret_as_double(),
      Some([4611686018427387904UL.reinterpret_as_double(), 1.0 / 0.0]),
      true,
      false,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
      [false, false],
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
    line_dashes_source_rgba(line_color_rgba("red", alpha=None), [
      4607182418800017408UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
    line_dashes_source_rgba(line_color_rgba("blue", alpha=None), [
      0UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
  } catch {
    error => fail("original set_dashes draw row 7: " + error.to_string())
  }
}

///|
fn line_dashes_source_draw_8() -> Unit raise {
  let saved_scale = @config.lines_scale_dashes()
  let saved_dashed = @config.lines_dashed_pattern()
  let saved_dashdot = @config.lines_dashdot_pattern()
  let saved_dotted = @config.lines_dotted_pattern()
  defer {
    @config.set_lines_scale_dashes(saved_scale)
    @config.set_lines_dashed_pattern(saved_dashed)
    @config.set_lines_dashdot_pattern(saved_dashdot)
    @config.set_lines_dotted_pattern(saved_dotted)
  }
  @config.set_lines_scale_dashes(true)
  @config.set_lines_dashed_pattern([3.7, 1.6])
  @config.set_lines_dashdot_pattern([6.4, 1.6, 1.0, 1.6])
  @config.set_lines_dotted_pattern([1.0, 1.65])
  let saved_cycle = @config.color_cycle()
  defer @config.set_color_cycle(saved_cycle)
  @config.set_color_cycle(["#11223344", "none"])
  let fig = figure(width=400, height=200)
  let axes = fig.axes()
  // Fixed frame isolates the source leaf from parent ticks/autoscale.
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  for axis in [axes.x_axis(), axes.y_axis()] {
    axis.set_locator(@ticker.NullLocator::new().as_locator())
    axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  }
  @config.set_lines_scale_dashes(true)
  @config.set_lines_dashed_pattern([
    4615514078110652826UL.reinterpret_as_double(),
    4609884578576439706UL.reinterpret_as_double(),
  ])
  let line = axes.plot_line(
    LineData::Numeric([
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ]),
    LineData::Numeric([
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ]),
    color="blue",
  )
  line.set_linewidth(0UL.reinterpret_as_double())
  line.set_dashes([
    13830554455654793216UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  line.set_gapcolor(
    Some(
      "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
    ),
  )
  line.set_color("blue")
  // Source leaf omitted add_line/update_line_limits: input bridge, never after-normalization.
  axes.state.val.raw_x_data = empty_data_interval()
  axes.state.val.raw_y_data = empty_data_interval()
  axes.state.val.x_data_minpos = 1.0 / 0.0
  axes.state.val.y_data_minpos = 1.0 / 0.0
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  let retained = fig.to_render_figure()
  try {
    line_dashes_source_state(
      line,
      axes,
      Some(
        "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
      ),
      "blue",
      None,
      0UL.reinterpret_as_double(),
      "--",
      true,
      0UL.reinterpret_as_double(),
      Some([
        13830554455654793216UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ]),
      0UL.reinterpret_as_double(),
      Some([
        9223372036854775808UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
      ]),
      true,
      true,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
      [false, false],
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
    let svg = @svg.render_with_positions_checked(retained).0
    let paints = line_dashes_source_polylines(svg)
    assert_eq(paints.length(), 1)
    line_dashes_source_paint(
      paints[0],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      0UL.reinterpret_as_double(),
      None,
      0UL.reinterpret_as_double(),
    )
    line_dashes_source_state(
      line,
      axes,
      Some(
        "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
      ),
      "blue",
      None,
      0UL.reinterpret_as_double(),
      "--",
      true,
      0UL.reinterpret_as_double(),
      Some([
        13830554455654793216UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ]),
      0UL.reinterpret_as_double(),
      Some([
        9223372036854775808UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
      ]),
      true,
      false,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
      [false, false],
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
    line_dashes_source_rgba(line_color_rgba("blue", alpha=None), [
      0UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
  } catch {
    error => fail("original set_dashes draw row 8: " + error.to_string())
  }
}

///|
fn line_dashes_source_draw_9() -> Unit raise {
  let saved_scale = @config.lines_scale_dashes()
  let saved_dashed = @config.lines_dashed_pattern()
  let saved_dashdot = @config.lines_dashdot_pattern()
  let saved_dotted = @config.lines_dotted_pattern()
  defer {
    @config.set_lines_scale_dashes(saved_scale)
    @config.set_lines_dashed_pattern(saved_dashed)
    @config.set_lines_dashdot_pattern(saved_dashdot)
    @config.set_lines_dotted_pattern(saved_dotted)
  }
  @config.set_lines_scale_dashes(true)
  @config.set_lines_dashed_pattern([3.7, 1.6])
  @config.set_lines_dashdot_pattern([6.4, 1.6, 1.0, 1.6])
  @config.set_lines_dotted_pattern([1.0, 1.65])
  let saved_cycle = @config.color_cycle()
  defer @config.set_color_cycle(saved_cycle)
  @config.set_color_cycle(["#11223344", "none"])
  let fig = figure(width=400, height=200)
  let axes = fig.axes()
  // Fixed frame isolates the source leaf from parent ticks/autoscale.
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  for axis in [axes.x_axis(), axes.y_axis()] {
    axis.set_locator(@ticker.NullLocator::new().as_locator())
    axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  }
  @config.set_lines_scale_dashes(true)
  @config.set_lines_dashed_pattern([
    4615514078110652826UL.reinterpret_as_double(),
    4609884578576439706UL.reinterpret_as_double(),
  ])
  let line = axes.plot_line(
    LineData::Numeric([
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ]),
    LineData::Numeric([
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ]),
    color="blue",
  )
  line.set_linewidth(0.0 / 0.0)
  line.set_dashes([
    13830554455654793216UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  line.set_gapcolor(
    Some(
      "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
    ),
  )
  line.set_color("blue")
  // Source leaf omitted add_line/update_line_limits: input bridge, never after-normalization.
  axes.state.val.raw_x_data = empty_data_interval()
  axes.state.val.raw_y_data = empty_data_interval()
  axes.state.val.x_data_minpos = 1.0 / 0.0
  axes.state.val.y_data_minpos = 1.0 / 0.0
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  let retained = fig.to_render_figure()
  try {
    line_dashes_source_state(
      line,
      axes,
      Some(
        "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
      ),
      "blue",
      None,
      0.0 / 0.0,
      "--",
      true,
      0UL.reinterpret_as_double(),
      Some([
        13830554455654793216UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ]),
      0.0 / 0.0,
      Some([0.0 / 0.0, 0.0 / 0.0]),
      true,
      true,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
      [false, false],
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
    let svg = @svg.render_with_positions_checked(retained).0
    let paints = line_dashes_source_polylines(svg)
    assert_eq(paints.length(), 1)
    line_dashes_source_paint(
      paints[0],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      0UL.reinterpret_as_double(),
      None,
      0.0 / 0.0,
    )
    line_dashes_source_state(
      line,
      axes,
      Some(
        "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
      ),
      "blue",
      None,
      0.0 / 0.0,
      "--",
      true,
      0UL.reinterpret_as_double(),
      Some([
        13830554455654793216UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ]),
      0.0 / 0.0,
      Some([0.0 / 0.0, 0.0 / 0.0]),
      true,
      false,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
      [false, false],
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
    line_dashes_source_rgba(line_color_rgba("blue", alpha=None), [
      0UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
  } catch {
    error => fail("original set_dashes draw row 9: " + error.to_string())
  }
}

///|
fn line_dashes_source_draw_10() -> Unit raise {
  let saved_scale = @config.lines_scale_dashes()
  let saved_dashed = @config.lines_dashed_pattern()
  let saved_dashdot = @config.lines_dashdot_pattern()
  let saved_dotted = @config.lines_dotted_pattern()
  defer {
    @config.set_lines_scale_dashes(saved_scale)
    @config.set_lines_dashed_pattern(saved_dashed)
    @config.set_lines_dashdot_pattern(saved_dashdot)
    @config.set_lines_dotted_pattern(saved_dotted)
  }
  @config.set_lines_scale_dashes(true)
  @config.set_lines_dashed_pattern([3.7, 1.6])
  @config.set_lines_dashdot_pattern([6.4, 1.6, 1.0, 1.6])
  @config.set_lines_dotted_pattern([1.0, 1.65])
  let saved_cycle = @config.color_cycle()
  defer @config.set_color_cycle(saved_cycle)
  @config.set_color_cycle(["#11223344", "none"])
  let fig = figure(width=400, height=200)
  let axes = fig.axes()
  // Fixed frame isolates the source leaf from parent ticks/autoscale.
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  for axis in [axes.x_axis(), axes.y_axis()] {
    axis.set_locator(@ticker.NullLocator::new().as_locator())
    axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  }
  @config.set_lines_scale_dashes(true)
  @config.set_lines_dashed_pattern([
    4615514078110652826UL.reinterpret_as_double(),
    4609884578576439706UL.reinterpret_as_double(),
  ])
  let line = axes.plot_line(
    LineData::Numeric([
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ]),
    LineData::Numeric([
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ]),
    color="blue",
  )
  line.set_linewidth(4611686018427387904UL.reinterpret_as_double())
  line.set_dashes([
    4607182418800017408UL.reinterpret_as_double(),
    4611686018427387904UL.reinterpret_as_double(),
  ])
  line.set_gapcolor(
    Some(
      "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
    ),
  )
  line.set_color(
    "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
  )
  line.set_linestyle("none")
  // Source leaf omitted add_line/update_line_limits: input bridge, never after-normalization.
  axes.state.val.raw_x_data = empty_data_interval()
  axes.state.val.raw_y_data = empty_data_interval()
  axes.state.val.x_data_minpos = 1.0 / 0.0
  axes.state.val.y_data_minpos = 1.0 / 0.0
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  let retained = fig.to_render_figure()
  try {
    line_dashes_source_state(
      line,
      axes,
      Some(
        "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
      ),
      "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "None",
      false,
      0UL.reinterpret_as_double(),
      None,
      0UL.reinterpret_as_double(),
      None,
      false,
      true,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
      [false, false],
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
    let svg = @svg.render_with_positions_checked(retained).0
    let paints = line_dashes_source_polylines(svg)
    assert_eq(paints.length(), 0)
    line_dashes_source_state(
      line,
      axes,
      Some(
        "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
      ),
      "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "None",
      false,
      0UL.reinterpret_as_double(),
      None,
      0UL.reinterpret_as_double(),
      None,
      false,
      false,
      true,
      [false, false],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
      [false, false],
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original set_dashes draw row 10: " + error.to_string())
  }
}

///|
fn line_dashes_source_draw_11() -> Unit raise {
  let saved_scale = @config.lines_scale_dashes()
  let saved_dashed = @config.lines_dashed_pattern()
  let saved_dashdot = @config.lines_dashdot_pattern()
  let saved_dotted = @config.lines_dotted_pattern()
  defer {
    @config.set_lines_scale_dashes(saved_scale)
    @config.set_lines_dashed_pattern(saved_dashed)
    @config.set_lines_dashdot_pattern(saved_dashdot)
    @config.set_lines_dotted_pattern(saved_dotted)
  }
  @config.set_lines_scale_dashes(true)
  @config.set_lines_dashed_pattern([3.7, 1.6])
  @config.set_lines_dashdot_pattern([6.4, 1.6, 1.0, 1.6])
  @config.set_lines_dotted_pattern([1.0, 1.65])
  let saved_cycle = @config.color_cycle()
  defer @config.set_color_cycle(saved_cycle)
  @config.set_color_cycle(["#11223344", "none"])
  let fig = figure(width=400, height=200)
  let axes = fig.axes()
  // Fixed frame isolates the source leaf from parent ticks/autoscale.
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  for axis in [axes.x_axis(), axes.y_axis()] {
    axis.set_locator(@ticker.NullLocator::new().as_locator())
    axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  }
  @config.set_lines_scale_dashes(true)
  @config.set_lines_dashed_pattern([
    4615514078110652826UL.reinterpret_as_double(),
    4609884578576439706UL.reinterpret_as_double(),
  ])
  let line = axes.plot_line(
    LineData::Numeric([
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ]),
    LineData::Numeric([
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ]),
    color="blue",
  )
  line.set_linewidth(4611686018427387904UL.reinterpret_as_double())
  line.set_dashes([
    13830554455654793216UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  line.set_gapcolor(
    Some(
      "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
    ),
  )
  line.set_color(
    "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
  )
  line.set_ydata(LineData::Numeric([1.0, 2.0, 3.0]))
  line.set_visible(false)
  // Source leaf omitted add_line/update_line_limits: input bridge, never after-normalization.
  axes.state.val.raw_x_data = empty_data_interval()
  axes.state.val.raw_y_data = empty_data_interval()
  axes.state.val.x_data_minpos = 1.0 / 0.0
  axes.state.val.y_data_minpos = 1.0 / 0.0
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  let retained = fig.to_render_figure()
  try {
    line_dashes_source_state(
      line,
      axes,
      Some(
        "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
      ),
      "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "--",
      true,
      0UL.reinterpret_as_double(),
      Some([
        13830554455654793216UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ]),
      0UL.reinterpret_as_double(),
      Some([
        13835058055282163712UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      true,
      true,
      false,
      [false, true],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
      [false, false],
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
    let svg = @svg.render_with_positions_checked(retained).0
    let paints = line_dashes_source_polylines(svg)
    assert_eq(paints.length(), 0)
    line_dashes_source_state(
      line,
      axes,
      Some(
        "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
      ),
      "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "--",
      true,
      0UL.reinterpret_as_double(),
      Some([
        13830554455654793216UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ]),
      0UL.reinterpret_as_double(),
      Some([
        13835058055282163712UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      true,
      true,
      false,
      [false, true],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
      [false, false],
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original set_dashes draw row 11: " + error.to_string())
  }
}

///|
fn line_dashes_source_draw_12() -> Unit raise {
  let saved_scale = @config.lines_scale_dashes()
  let saved_dashed = @config.lines_dashed_pattern()
  let saved_dashdot = @config.lines_dashdot_pattern()
  let saved_dotted = @config.lines_dotted_pattern()
  defer {
    @config.set_lines_scale_dashes(saved_scale)
    @config.set_lines_dashed_pattern(saved_dashed)
    @config.set_lines_dashdot_pattern(saved_dashdot)
    @config.set_lines_dotted_pattern(saved_dotted)
  }
  @config.set_lines_scale_dashes(true)
  @config.set_lines_dashed_pattern([3.7, 1.6])
  @config.set_lines_dashdot_pattern([6.4, 1.6, 1.0, 1.6])
  @config.set_lines_dotted_pattern([1.0, 1.65])
  let saved_cycle = @config.color_cycle()
  defer @config.set_color_cycle(saved_cycle)
  @config.set_color_cycle(["#11223344", "none"])
  let fig = figure(width=400, height=200)
  let axes = fig.axes()
  // Fixed frame isolates the source leaf from parent ticks/autoscale.
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  for axis in [axes.x_axis(), axes.y_axis()] {
    axis.set_locator(@ticker.NullLocator::new().as_locator())
    axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  }
  @config.set_lines_scale_dashes(true)
  @config.set_lines_dashed_pattern([
    4615514078110652826UL.reinterpret_as_double(),
    4609884578576439706UL.reinterpret_as_double(),
  ])
  let line = axes.plot_line(
    LineData::Numeric([]),
    LineData::Numeric([]),
    color="blue",
  )
  line.set_linewidth(4611686018427387904UL.reinterpret_as_double())
  line.set_dashes([
    13830554455654793216UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  line.set_gapcolor(
    Some(
      "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
    ),
  )
  line.set_color(
    "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
  )
  // Source leaf omitted add_line/update_line_limits: input bridge, never after-normalization.
  axes.state.val.raw_x_data = empty_data_interval()
  axes.state.val.raw_y_data = empty_data_interval()
  axes.state.val.x_data_minpos = 1.0 / 0.0
  axes.state.val.y_data_minpos = 1.0 / 0.0
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  let retained = fig.to_render_figure()
  try {
    line_dashes_source_state(
      line,
      axes,
      Some(
        "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
      ),
      "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "--",
      true,
      0UL.reinterpret_as_double(),
      Some([
        13830554455654793216UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ]),
      0UL.reinterpret_as_double(),
      Some([
        13835058055282163712UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      true,
      true,
      true,
      [false, false],
      [],
      [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
      [false, false],
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
    let svg = @svg.render_with_positions_checked(retained).0
    let paints = line_dashes_source_polylines(svg)
    assert_eq(paints.length(), 0)
    line_dashes_source_state(
      line,
      axes,
      Some(
        "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
      ),
      "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "--",
      true,
      0UL.reinterpret_as_double(),
      Some([
        13830554455654793216UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ]),
      0UL.reinterpret_as_double(),
      Some([
        13835058055282163712UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      true,
      false,
      true,
      [false, false],
      [],
      [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
      [false, false],
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original set_dashes draw row 12: " + error.to_string())
  }
}

///|
fn line_dashes_source_draw_13() -> Unit raise {
  let saved_scale = @config.lines_scale_dashes()
  let saved_dashed = @config.lines_dashed_pattern()
  let saved_dashdot = @config.lines_dashdot_pattern()
  let saved_dotted = @config.lines_dotted_pattern()
  defer {
    @config.set_lines_scale_dashes(saved_scale)
    @config.set_lines_dashed_pattern(saved_dashed)
    @config.set_lines_dashdot_pattern(saved_dashdot)
    @config.set_lines_dotted_pattern(saved_dotted)
  }
  @config.set_lines_scale_dashes(true)
  @config.set_lines_dashed_pattern([3.7, 1.6])
  @config.set_lines_dashdot_pattern([6.4, 1.6, 1.0, 1.6])
  @config.set_lines_dotted_pattern([1.0, 1.65])
  let saved_cycle = @config.color_cycle()
  defer @config.set_color_cycle(saved_cycle)
  @config.set_color_cycle(["#11223344", "none"])
  let fig = figure(width=400, height=200)
  let axes = fig.axes()
  // Fixed frame isolates the source leaf from parent ticks/autoscale.
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  for axis in [axes.x_axis(), axes.y_axis()] {
    axis.set_locator(@ticker.NullLocator::new().as_locator())
    axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  }
  @config.set_lines_scale_dashes(true)
  @config.set_lines_dashed_pattern([
    4615514078110652826UL.reinterpret_as_double(),
    4609884578576439706UL.reinterpret_as_double(),
  ])
  let line = axes.plot_line(
    LineData::Numeric([
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ]),
    LineData::Numeric([
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ]),
    color="blue",
  )
  line.set_linewidth(4611686018427387904UL.reinterpret_as_double())
  line.set_dashes([
    4607182418800017408UL.reinterpret_as_double(),
    4611686018427387904UL.reinterpret_as_double(),
  ])
  line.set_gapcolor(
    Some(
      "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
    ),
  )
  line.set_color(
    "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
  )
  line.set_ydata(LineData::Numeric([1.0, 2.0, 3.0]))
  // Source leaf omitted add_line/update_line_limits: input bridge, never after-normalization.
  axes.state.val.raw_x_data = empty_data_interval()
  axes.state.val.raw_y_data = empty_data_interval()
  axes.state.val.x_data_minpos = 1.0 / 0.0
  axes.state.val.y_data_minpos = 1.0 / 0.0
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  let retained = fig.to_render_figure()
  try {
    line_dashes_source_state(
      line,
      axes,
      Some(
        "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
      ),
      "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "--",
      true,
      0UL.reinterpret_as_double(),
      Some([
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      0UL.reinterpret_as_double(),
      Some([
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ]),
      true,
      true,
      true,
      [false, true],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
      [false, false],
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
    assert_true(
      try {
        ignore(@svg.render_with_positions_checked(retained))
        false
      } catch {
        @core.DataError::InvalidTicks(message~) =>
          message ==
          "shape mismatch: objects cannot be broadcast to a single shape.  Mismatch is between arg 0 with shape (2,) and arg 1 with shape (3,)."
        _ => false
      },
    )
    line_dashes_source_state(
      line,
      axes,
      Some(
        "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
      ),
      "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "--",
      true,
      0UL.reinterpret_as_double(),
      Some([
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      0UL.reinterpret_as_double(),
      Some([
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ]),
      true,
      true,
      true,
      [false, true],
      [
        0UL.reinterpret_as_double(),
        4621819117588971520UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4626322717216342016UL.reinterpret_as_double(),
      ],
      [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
      [false, false],
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original set_dashes draw row 13: " + error.to_string())
  }
}

///|
test "original custom tuple dashes complete backend draw" {
  line_dashes_source_draw_0()
  line_dashes_source_draw_1()
  line_dashes_source_draw_2()
  line_dashes_source_draw_3()
  line_dashes_source_draw_4()
  line_dashes_source_draw_5()
  line_dashes_source_draw_6()
  line_dashes_source_draw_7()
  line_dashes_source_draw_8()
  line_dashes_source_draw_9()
  line_dashes_source_draw_10()
  line_dashes_source_draw_11()
  line_dashes_source_draw_12()
  line_dashes_source_draw_13()
}
