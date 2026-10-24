// Generated from pinned original gapcolor/inverse/Line.draw methods.
// Native mutable RGB storage and presentation stages remain source evidence.

///|
fn line_gapcolor_source_double(
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
fn line_gapcolor_source_numbers(
  actual : Array[Double],
  expected : Array[Double],
) -> Unit raise {
  assert_eq(actual.length(), expected.length())
  for index in 0..<actual.length() {
    line_gapcolor_source_double(actual[index], expected[index])
  }
}

///|
fn line_gapcolor_source_option(
  actual : Double?,
  expected : Double?,
) -> Unit raise {
  match (actual, expected) {
    (None, None) => ()
    (Some(actual), Some(expected)) =>
      line_gapcolor_source_double(actual, expected)
    _ => fail("original optional Line alpha differs")
  }
}

///|
fn line_gapcolor_source_dashes(
  actual : Array[Double]?,
  expected : Array[Double]?,
) -> Unit raise {
  match (actual, expected) {
    (None, None) => ()
    (Some(actual), Some(expected)) =>
      line_gapcolor_source_numbers(actual, expected)
    _ => fail("original optional dash sequence differs")
  }
}

///|
fn line_gapcolor_source_rgba(
  actual : @colors.Rgba,
  expected : Array[Double],
) -> Unit raise {
  line_gapcolor_source_numbers(
    [actual.red(), actual.green(), actual.blue(), actual.alpha()],
    expected,
  )
}

///|
fn line_gapcolor_source_state(
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
  line_gapcolor_source_option(line.get_alpha(), alpha)
  line_gapcolor_source_double(line.get_linewidth(), width)
  assert_eq(line.get_linestyle(), canonical)
  assert_eq(line.is_dashed(), dashed)
  line_gapcolor_source_double(
    line.unscaled_dash_pattern.offset,
    unscaled_offset,
  )
  line_gapcolor_source_dashes(line.unscaled_dash_pattern.dashes, unscaled)
  let stroke = line.style.line_stroke()
  line_gapcolor_source_double(stroke.dash_offset(), effective_offset)
  line_gapcolor_source_dashes(stroke.dash_sequence(), effective)
  if effective is Some(_) {
    assert_eq(line.scaled_dashes_as_list, effective_as_list)
  }
  assert_eq(line.stale(), stale)
  assert_eq(line.get_visible(), visible)
  assert_eq([line.invalid_x, line.invalid_y], invalid)
  // Observe retained cache without recache, paint preparation or other lazy getters.
  line_gapcolor_source_numbers(line.cache.flat.to_array(), xy)
  line_gapcolor_source_numbers(
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
  line_gapcolor_source_numbers(@config.lines_dashed_pattern(), rc_pattern)
}

///|
fn line_gapcolor_source_attribute(
  attributes : String,
  name : String,
) -> String? {
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
fn line_gapcolor_source_polylines(svg : String) -> Array[String] raise {
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
fn line_gapcolor_source_paint(
  attributes : String,
  rgba : Array[Double],
  offset : Double,
  sequence : Array[Double]?,
  width : Double,
) -> Unit raise {
  // RGBA values are original-source expectations; CSS encoding uses the existing
  // serializer convenience profile, not a native SVG text-format claim.
  let color = @colors.rgba(rgba[0], rgba[1], rgba[2], alpha=rgba[3]).to_css()
  assert_eq(line_gapcolor_source_attribute(attributes, "stroke"), Some(color))
  assert_eq(line_gapcolor_source_attribute(attributes, "stroke-opacity"), None)
  line_gapcolor_source_double(
    @ticker.parse_float_text(
      line_gapcolor_source_attribute(attributes, "stroke-width").unwrap(),
    ),
    width,
  )
  match sequence {
    None => {
      assert_eq(
        line_gapcolor_source_attribute(attributes, "stroke-dasharray"),
        None,
      )
      assert_eq(
        line_gapcolor_source_attribute(attributes, "stroke-dashoffset"),
        None,
      )
    }
    Some(sequence) => {
      let text = line_gapcolor_source_attribute(attributes, "stroke-dasharray").unwrap()
      let actual = if text == "" {
        []
      } else {
        text
        .split(",")
        .to_array()
        .map(value => @ticker.parse_float_text(value.to_owned()))
      }
      line_gapcolor_source_numbers(actual, sequence)
      line_gapcolor_source_double(
        @ticker.parse_float_text(
          line_gapcolor_source_attribute(attributes, "stroke-dashoffset").unwrap(),
        ),
        offset,
      )
    }
  }
}

///|
fn line_gapcolor_source_setters() -> Unit raise {
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
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([0.0, 1.0]),
    LineData::Numeric([10.0, 20.0]),
    color="blue",
  )
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  // gap setter None
  try {
    // Controlled native clean-stale input; no paint occurs here.
    line.mark_drawn()
    line_gapcolor_source_state(
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
    line.set_gapcolor(None)
    line_gapcolor_source_state(
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
    error => fail("original gap setter row 0: " + error.to_string())
  }
  // gap setter None
  try {
    // Controlled native clean-stale input; no paint occurs here.
    line.mark_drawn()
    line_gapcolor_source_state(
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
    line.set_gapcolor(None)
    line_gapcolor_source_state(
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
    error => fail("original gap setter row 1: " + error.to_string())
  }
  // gap setter 'red'
  try {
    // Controlled native clean-stale input; no paint occurs here.
    line.mark_drawn()
    line_gapcolor_source_state(
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
    line.set_gapcolor(Some("red"))
    line_gapcolor_source_state(
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
    line_gapcolor_source_rgba(
      line_color_rgba(line.get_gapcolor().unwrap(), alpha=line.get_alpha()),
      [
        4607182418800017408UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original gap setter row 2: " + error.to_string())
  }
  // gap setter 'red'
  try {
    // Controlled native clean-stale input; no paint occurs here.
    line.mark_drawn()
    line_gapcolor_source_state(
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
    line.set_gapcolor(Some("red"))
    line_gapcolor_source_state(
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
    line_gapcolor_source_rgba(
      line_color_rgba(line.get_gapcolor().unwrap(), alpha=line.get_alpha()),
      [
        4607182418800017408UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original gap setter row 3: " + error.to_string())
  }
  // gap setter 'RED'
  try {
    // Controlled native clean-stale input; no paint occurs here.
    line.mark_drawn()
    line_gapcolor_source_state(
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
    line.set_gapcolor(Some("RED"))
    line_gapcolor_source_state(
      line,
      axes,
      Some("RED"),
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
    line_gapcolor_source_rgba(
      line_color_rgba(line.get_gapcolor().unwrap(), alpha=line.get_alpha()),
      [
        4607182418800017408UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original gap setter row 4: " + error.to_string())
  }
  // gap setter 'none'
  try {
    // Controlled native clean-stale input; no paint occurs here.
    line.mark_drawn()
    line_gapcolor_source_state(
      line,
      axes,
      Some("RED"),
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
    line.set_gapcolor(Some("none"))
    line_gapcolor_source_state(
      line,
      axes,
      Some("none"),
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
    line_gapcolor_source_rgba(
      line_color_rgba(line.get_gapcolor().unwrap(), alpha=line.get_alpha()),
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original gap setter row 5: " + error.to_string())
  }
  // gap setter '#1234'
  try {
    // Controlled native clean-stale input; no paint occurs here.
    line.mark_drawn()
    line_gapcolor_source_state(
      line,
      axes,
      Some("none"),
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
    line.set_gapcolor(Some("#1234"))
    line_gapcolor_source_state(
      line,
      axes,
      Some("#1234"),
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
    line_gapcolor_source_rgba(
      line_color_rgba(line.get_gapcolor().unwrap(), alpha=line.get_alpha()),
      [
        4589468260265693457UL.reinterpret_as_double(),
        4593971859893063953UL.reinterpret_as_double(),
        4596373779694328218UL.reinterpret_as_double(),
        4598475459520434449UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original gap setter row 6: " + error.to_string())
  }
  // gap setter '0.5'
  try {
    // Controlled native clean-stale input; no paint occurs here.
    line.mark_drawn()
    line_gapcolor_source_state(
      line,
      axes,
      Some("#1234"),
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
    line.set_gapcolor(Some("0.5"))
    line_gapcolor_source_state(
      line,
      axes,
      Some("0.5"),
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
    line_gapcolor_source_rgba(
      line_color_rgba(line.get_gapcolor().unwrap(), alpha=line.get_alpha()),
      [
        4602678819172646912UL.reinterpret_as_double(),
        4602678819172646912UL.reinterpret_as_double(),
        4602678819172646912UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original gap setter row 7: " + error.to_string())
  }
  // gap setter 'C0'
  try {
    // Controlled native clean-stale input; no paint occurs here.
    line.mark_drawn()
    line_gapcolor_source_state(
      line,
      axes,
      Some("0.5"),
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
    line.set_gapcolor(Some("C0"))
    line_gapcolor_source_state(
      line,
      axes,
      Some("C0"),
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
    line_gapcolor_source_rgba(
      line_color_rgba(line.get_gapcolor().unwrap(), alpha=line.get_alpha()),
      [
        4589468260265693457UL.reinterpret_as_double(),
        4593971859893063953UL.reinterpret_as_double(),
        4596373779694328218UL.reinterpret_as_double(),
        4598475459520434449UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original gap setter row 8: " + error.to_string())
  }
  // gap setter 'C1'
  try {
    // Controlled native clean-stale input; no paint occurs here.
    line.mark_drawn()
    line_gapcolor_source_state(
      line,
      axes,
      Some("C0"),
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
    line.set_gapcolor(Some("C1"))
    line_gapcolor_source_state(
      line,
      axes,
      Some("C1"),
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
    line_gapcolor_source_rgba(
      line_color_rgba(line.get_gapcolor().unwrap(), alpha=line.get_alpha()),
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original gap setter row 9: " + error.to_string())
  }
  // gap setter 'C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999'
  try {
    // Controlled native clean-stale input; no paint occurs here.
    line.mark_drawn()
    line_gapcolor_source_state(
      line,
      axes,
      Some("C1"),
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
    line.set_gapcolor(
      Some(
        "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
      ),
    )
    line_gapcolor_source_state(
      line,
      axes,
      Some(
        "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
      ),
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
    assert_true(
      try {
        ignore(
          line_color_rgba(line.get_gapcolor().unwrap(), alpha=line.get_alpha()),
        )
        false
      } catch {
        @core.DataError::InvalidTicks(message~) =>
          message ==
          "ValueError: Exceeds the limit (4300 digits) for integer string conversion: value has 4301 digits; use sys.set_int_max_str_digits() to increase the limit"
        _ => false
      },
    )
  } catch {
    error => fail("original gap setter row 10: " + error.to_string())
  }
  // gap setter 'not-a-color'
  try {
    // Controlled native clean-stale input; no paint occurs here.
    line.mark_drawn()
    line_gapcolor_source_state(
      line,
      axes,
      Some(
        "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
      ),
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
    assert_true(
      try {
        line.set_gapcolor(Some("not-a-color"))
        false
      } catch {
        @core.DataError::InvalidTicks(message~) =>
          message ==
          "ValueError: 'not-a-color' is not a valid value for color: supported inputs are (r, g, b) and (r, g, b, a) 0-1 float tuples; '#rrggbb', '#rrggbbaa', '#rgb', '#rgba' strings; named color strings; string reprs of 0-1 floats for grayscale values; 'C0', 'C1', ... strings for colors of the color cycle; and pairs combining one of the above with an alpha value"
        _ => false
      },
    )
    line_gapcolor_source_state(
      line,
      axes,
      Some(
        "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
      ),
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
  } catch {
    error => fail("original gap setter row 11: " + error.to_string())
  }
  // gap setter ''
  try {
    // Controlled native clean-stale input; no paint occurs here.
    line.mark_drawn()
    line_gapcolor_source_state(
      line,
      axes,
      Some(
        "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
      ),
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
    assert_true(
      try {
        line.set_gapcolor(Some(""))
        false
      } catch {
        @core.DataError::InvalidTicks(message~) =>
          message ==
          "ValueError: '' is not a valid value for color: supported inputs are (r, g, b) and (r, g, b, a) 0-1 float tuples; '#rrggbb', '#rrggbbaa', '#rgb', '#rgba' strings; named color strings; string reprs of 0-1 floats for grayscale values; 'C0', 'C1', ... strings for colors of the color cycle; and pairs combining one of the above with an alpha value"
        _ => false
      },
    )
    line_gapcolor_source_state(
      line,
      axes,
      Some(
        "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
      ),
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
  } catch {
    error => fail("original gap setter row 12: " + error.to_string())
  }
  // gap setter None
  try {
    // Controlled native clean-stale input; no paint occurs here.
    line.mark_drawn()
    line_gapcolor_source_state(
      line,
      axes,
      Some(
        "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
      ),
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
    line.set_gapcolor(None)
    line_gapcolor_source_state(
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
    error => fail("original gap setter row 13: " + error.to_string())
  }
}

///|
test "original String None gapcolor setter sequence" {
  line_gapcolor_source_setters()
}

///|
test "original inverse dash primitives and captured origin errors" {
  try {
    let incoming = [
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
    ]
    let (offset, gaps) = line_gapcolor_inverse(
      0UL.reinterpret_as_double(),
      incoming,
      scaled_as_list=true,
    )
    line_gapcolor_source_double(
      offset,
      4611686018427387904UL.reinterpret_as_double(),
    )
    line_gapcolor_source_numbers(gaps, [
      4611686018427387904UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
    assert_eq(physical_equal(gaps, incoming), false)
    line_gapcolor_source_numbers(incoming, [
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
    ])
  } catch {
    error => fail("original inverse gap row 0: " + error.to_string())
  }
  try {
    let incoming = [
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
    ]
    let (offset, gaps) = line_gapcolor_inverse(
      9223372036854775808UL.reinterpret_as_double(),
      incoming,
      scaled_as_list=true,
    )
    line_gapcolor_source_double(
      offset,
      4613937818241073152UL.reinterpret_as_double(),
    )
    line_gapcolor_source_numbers(gaps, [
      4613937818241073152UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
    ])
    assert_eq(physical_equal(gaps, incoming), false)
    line_gapcolor_source_numbers(incoming, [
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
    ])
  } catch {
    error => fail("original inverse gap row 1: " + error.to_string())
  }
  try {
    let incoming = [
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
    ]
    let (offset, gaps) = line_gapcolor_inverse(
      4615063718147915776UL.reinterpret_as_double(),
      incoming,
      scaled_as_list=true,
    )
    line_gapcolor_source_double(
      offset,
      4619004367821864960UL.reinterpret_as_double(),
    )
    line_gapcolor_source_numbers(gaps, [
      4613937818241073152UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
    ])
    assert_eq(physical_equal(gaps, incoming), false)
    line_gapcolor_source_numbers(incoming, [
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      4613937818241073152UL.reinterpret_as_double(),
    ])
  } catch {
    error => fail("original inverse gap row 2: " + error.to_string())
  }
  try {
    let incoming = [
      4607182418800017408UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ]
    let (offset, gaps) = line_gapcolor_inverse(
      4846369599423283200UL.reinterpret_as_double(),
      incoming,
      scaled_as_list=true,
    )
    line_gapcolor_source_double(
      offset,
      4846369599423283200UL.reinterpret_as_double(),
    )
    line_gapcolor_source_numbers(gaps, [
      4607182418800017408UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
    assert_eq(physical_equal(gaps, incoming), false)
    line_gapcolor_source_numbers(incoming, [
      4607182418800017408UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
  } catch {
    error => fail("original inverse gap row 3: " + error.to_string())
  }
  try {
    let incoming = []
    assert_true(
      try {
        ignore(
          line_gapcolor_inverse(
            0UL.reinterpret_as_double(),
            incoming,
            scaled_as_list=true,
          ),
        )
        false
      } catch {
        @core.DataError::InvalidTicks(message~) =>
          message == "IndexError: list index out of range"
        _ => false
      },
    )
    line_gapcolor_source_numbers(incoming, [])
  } catch {
    error => fail("original inverse gap row 4: " + error.to_string())
  }
  try {
    let incoming = []
    assert_true(
      try {
        ignore(
          line_gapcolor_inverse(
            0UL.reinterpret_as_double(),
            incoming,
            scaled_as_list=false,
          ),
        )
        false
      } catch {
        @core.DataError::InvalidTicks(message~) =>
          message == "IndexError: tuple index out of range"
        _ => false
      },
    )
    line_gapcolor_source_numbers(incoming, [])
  } catch {
    error => fail("original inverse gap row 5: " + error.to_string())
  }
  try {
    let incoming = [
      13830554455654793216UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ]
    let (offset, gaps) = line_gapcolor_inverse(
      0UL.reinterpret_as_double(),
      incoming,
      scaled_as_list=true,
    )
    line_gapcolor_source_double(
      offset,
      4607182418800017408UL.reinterpret_as_double(),
    )
    line_gapcolor_source_numbers(gaps, [
      4607182418800017408UL.reinterpret_as_double(),
      13830554455654793216UL.reinterpret_as_double(),
    ])
    assert_eq(physical_equal(gaps, incoming), false)
    line_gapcolor_source_numbers(incoming, [
      13830554455654793216UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
  } catch {
    error => fail("original inverse gap row 6: " + error.to_string())
  }
  try {
    let incoming = [0UL.reinterpret_as_double(), 0UL.reinterpret_as_double()]
    let (offset, gaps) = line_gapcolor_inverse(
      0UL.reinterpret_as_double(),
      incoming,
      scaled_as_list=true,
    )
    line_gapcolor_source_double(offset, 0UL.reinterpret_as_double())
    line_gapcolor_source_numbers(gaps, [
      0UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
    ])
    assert_eq(physical_equal(gaps, incoming), false)
    line_gapcolor_source_numbers(incoming, [
      0UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
    ])
  } catch {
    error => fail("original inverse gap row 7: " + error.to_string())
  }
  try {
    let incoming = [4607182418800017408UL.reinterpret_as_double(), 0.0 / 0.0]
    let (offset, gaps) = line_gapcolor_inverse(
      0UL.reinterpret_as_double(),
      incoming,
      scaled_as_list=true,
    )
    line_gapcolor_source_double(offset, 0.0 / 0.0)
    line_gapcolor_source_numbers(gaps, [
      0.0 / 0.0,
      4607182418800017408UL.reinterpret_as_double(),
    ])
    assert_eq(physical_equal(gaps, incoming), false)
    line_gapcolor_source_numbers(incoming, [
      4607182418800017408UL.reinterpret_as_double(),
      0.0 / 0.0,
    ])
  } catch {
    error => fail("original inverse gap row 8: " + error.to_string())
  }
  try {
    let incoming = [4607182418800017408UL.reinterpret_as_double(), 1.0 / 0.0]
    let (offset, gaps) = line_gapcolor_inverse(
      0UL.reinterpret_as_double(),
      incoming,
      scaled_as_list=true,
    )
    line_gapcolor_source_double(offset, 1.0 / 0.0)
    line_gapcolor_source_numbers(gaps, [
      1.0 / 0.0,
      4607182418800017408UL.reinterpret_as_double(),
    ])
    assert_eq(physical_equal(gaps, incoming), false)
    line_gapcolor_source_numbers(incoming, [
      4607182418800017408UL.reinterpret_as_double(),
      1.0 / 0.0,
    ])
  } catch {
    error => fail("original inverse gap row 9: " + error.to_string())
  }
  try {
    let incoming = [4607182418800017408UL.reinterpret_as_double(), -1.0 / 0.0]
    let (offset, gaps) = line_gapcolor_inverse(
      1.0 / 0.0,
      incoming,
      scaled_as_list=true,
    )
    line_gapcolor_source_double(offset, 0.0 / 0.0)
    line_gapcolor_source_numbers(gaps, [
      -1.0 / 0.0,
      4607182418800017408UL.reinterpret_as_double(),
    ])
    assert_eq(physical_equal(gaps, incoming), false)
    line_gapcolor_source_numbers(incoming, [
      4607182418800017408UL.reinterpret_as_double(),
      -1.0 / 0.0,
    ])
  } catch {
    error => fail("original inverse gap row 10: " + error.to_string())
  }
  try {
    let incoming = [
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
    ]
    let (offset, gaps) = line_gapcolor_inverse(
      0.0 / 0.0,
      incoming,
      scaled_as_list=true,
    )
    line_gapcolor_source_double(offset, 0.0 / 0.0)
    line_gapcolor_source_numbers(gaps, [
      4611686018427387904UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
    assert_eq(physical_equal(gaps, incoming), false)
    line_gapcolor_source_numbers(incoming, [
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
    ])
  } catch {
    error => fail("original inverse gap row 11: " + error.to_string())
  }
}

///|
fn line_gapcolor_source_draw_0() -> Unit raise {
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
  // Fixed parent frame and Null ticks isolate the complete source leaf draw.
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  for axis in [axes.x_axis(), axes.y_axis()] {
    axis.set_locator(@ticker.NullLocator::new().as_locator())
    axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  }
  @config.set_lines_dashed_pattern([
    4607182418800017408UL.reinterpret_as_double(),
    4611686018427387904UL.reinterpret_as_double(),
  ])
  @config.set_lines_scale_dashes(true)
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
  line.set_linestyle("solid")
  line.set_gapcolor(Some("red"))
  line.set_color("blue")
  line.set_alpha(None)
  // Source leaf construction omitted add_line/update_line_limits; input bridge only.
  axes.state.val.raw_x_data = empty_data_interval()
  axes.state.val.raw_y_data = empty_data_interval()
  axes.state.val.x_data_minpos = 1.0 / 0.0
  axes.state.val.y_data_minpos = 1.0 / 0.0
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  let retained = fig.to_render_figure()
  try {
    line_gapcolor_source_state(
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
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
    )
    let svg = @svg.render_with_positions_checked(retained).0
    let paints = line_gapcolor_source_polylines(svg)
    assert_eq(paints.length(), 1)
    line_gapcolor_source_paint(
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
    line_gapcolor_source_state(
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
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
    )
    line_gapcolor_source_rgba(line_color_rgba("blue", alpha=None), [
      0UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
  } catch {
    error => fail("original gap draw row 0: " + error.to_string())
  }
}

///|
fn line_gapcolor_source_draw_1() -> Unit raise {
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
  // Fixed parent frame and Null ticks isolate the complete source leaf draw.
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  for axis in [axes.x_axis(), axes.y_axis()] {
    axis.set_locator(@ticker.NullLocator::new().as_locator())
    axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  }
  @config.set_lines_dashed_pattern([
    4607182418800017408UL.reinterpret_as_double(),
    4611686018427387904UL.reinterpret_as_double(),
  ])
  @config.set_lines_scale_dashes(true)
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
  line.set_linestyle("none")
  line.set_gapcolor(
    Some(
      "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
    ),
  )
  line.set_color(
    "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
  )
  line.set_alpha(None)
  // Source leaf construction omitted add_line/update_line_limits; input bridge only.
  axes.state.val.raw_x_data = empty_data_interval()
  axes.state.val.raw_y_data = empty_data_interval()
  axes.state.val.x_data_minpos = 1.0 / 0.0
  axes.state.val.y_data_minpos = 1.0 / 0.0
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  let retained = fig.to_render_figure()
  try {
    line_gapcolor_source_state(
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
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
    )
    let svg = @svg.render_with_positions_checked(retained).0
    let paints = line_gapcolor_source_polylines(svg)
    assert_eq(paints.length(), 0)
    line_gapcolor_source_state(
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
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original gap draw row 1: " + error.to_string())
  }
}

///|
fn line_gapcolor_source_draw_2() -> Unit raise {
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
  // Fixed parent frame and Null ticks isolate the complete source leaf draw.
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  for axis in [axes.x_axis(), axes.y_axis()] {
    axis.set_locator(@ticker.NullLocator::new().as_locator())
    axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  }
  @config.set_lines_dashed_pattern([
    4607182418800017408UL.reinterpret_as_double(),
    4611686018427387904UL.reinterpret_as_double(),
  ])
  @config.set_lines_scale_dashes(true)
  let line = axes.plot_line(
    LineData::Numeric([]),
    LineData::Numeric([]),
    color="blue",
  )
  line.set_linewidth(4611686018427387904UL.reinterpret_as_double())
  line.set_linestyle("dashed")
  line.set_gapcolor(
    Some(
      "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
    ),
  )
  line.set_color(
    "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
  )
  line.set_alpha(None)
  // Source leaf construction omitted add_line/update_line_limits; input bridge only.
  axes.state.val.raw_x_data = empty_data_interval()
  axes.state.val.raw_y_data = empty_data_interval()
  axes.state.val.x_data_minpos = 1.0 / 0.0
  axes.state.val.y_data_minpos = 1.0 / 0.0
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  let retained = fig.to_render_figure()
  try {
    line_gapcolor_source_state(
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
      [false, false],
      [],
      [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
      [false, false],
      true,
      [
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
    )
    let svg = @svg.render_with_positions_checked(retained).0
    let paints = line_gapcolor_source_polylines(svg)
    assert_eq(paints.length(), 0)
    line_gapcolor_source_state(
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
      false,
      true,
      [false, false],
      [],
      [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
      [false, false],
      true,
      [
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original gap draw row 2: " + error.to_string())
  }
}

///|
fn line_gapcolor_source_draw_3() -> Unit raise {
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
  // Fixed parent frame and Null ticks isolate the complete source leaf draw.
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  for axis in [axes.x_axis(), axes.y_axis()] {
    axis.set_locator(@ticker.NullLocator::new().as_locator())
    axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  }
  @config.set_lines_dashed_pattern([
    4607182418800017408UL.reinterpret_as_double(),
    4611686018427387904UL.reinterpret_as_double(),
  ])
  @config.set_lines_scale_dashes(true)
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
  line.set_linestyle("dashed")
  line.set_gapcolor(
    Some(
      "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
    ),
  )
  line.set_color(
    "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
  )
  line.set_alpha(None)
  line.set_ydata(LineData::Numeric([1.0, 2.0, 3.0]))
  line.set_visible(false)
  // Source leaf construction omitted add_line/update_line_limits; input bridge only.
  axes.state.val.raw_x_data = empty_data_interval()
  axes.state.val.raw_y_data = empty_data_interval()
  axes.state.val.x_data_minpos = 1.0 / 0.0
  axes.state.val.y_data_minpos = 1.0 / 0.0
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  let retained = fig.to_render_figure()
  try {
    line_gapcolor_source_state(
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
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
    )
    let svg = @svg.render_with_positions_checked(retained).0
    let paints = line_gapcolor_source_polylines(svg)
    assert_eq(paints.length(), 0)
    line_gapcolor_source_state(
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
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original gap draw row 3: " + error.to_string())
  }
}

///|
fn line_gapcolor_source_draw_4() -> Unit raise {
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
  // Fixed parent frame and Null ticks isolate the complete source leaf draw.
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  for axis in [axes.x_axis(), axes.y_axis()] {
    axis.set_locator(@ticker.NullLocator::new().as_locator())
    axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  }
  @config.set_lines_dashed_pattern([
    4607182418800017408UL.reinterpret_as_double(),
    4611686018427387904UL.reinterpret_as_double(),
  ])
  @config.set_lines_scale_dashes(true)
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
  line.set_linestyle("dashed")
  line.set_gapcolor(Some("#11223344"))
  line.set_color("blue")
  line.set_alpha(None)
  // Source leaf construction omitted add_line/update_line_limits; input bridge only.
  axes.state.val.raw_x_data = empty_data_interval()
  axes.state.val.raw_y_data = empty_data_interval()
  axes.state.val.x_data_minpos = 1.0 / 0.0
  axes.state.val.y_data_minpos = 1.0 / 0.0
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  let retained = fig.to_render_figure()
  try {
    line_gapcolor_source_state(
      line,
      axes,
      Some("#11223344"),
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
      [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
      [false, false],
      true,
      [
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
    )
    let svg = @svg.render_with_positions_checked(retained).0
    let paints = line_gapcolor_source_polylines(svg)
    assert_eq(paints.length(), 2)
    line_gapcolor_source_paint(
      paints[0],
      [
        4589468260265693457UL.reinterpret_as_double(),
        4593971859893063953UL.reinterpret_as_double(),
        4596373779694328218UL.reinterpret_as_double(),
        4598475459520434449UL.reinterpret_as_double(),
      ],
      4616189618054758400UL.reinterpret_as_double(),
      Some([
        4616189618054758400UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      4611686018427387904UL.reinterpret_as_double(),
    )
    line_gapcolor_source_paint(
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
      ]),
      4611686018427387904UL.reinterpret_as_double(),
    )
    line_gapcolor_source_state(
      line,
      axes,
      Some("#11223344"),
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
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
    )
    line_gapcolor_source_rgba(line_color_rgba("#11223344", alpha=None), [
      4589468260265693457UL.reinterpret_as_double(),
      4593971859893063953UL.reinterpret_as_double(),
      4596373779694328218UL.reinterpret_as_double(),
      4598475459520434449UL.reinterpret_as_double(),
    ])
    line_gapcolor_source_rgba(line_color_rgba("blue", alpha=None), [
      0UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
  } catch {
    error => fail("original gap draw row 4: " + error.to_string())
  }
}

///|
fn line_gapcolor_source_draw_5() -> Unit raise {
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
  // Fixed parent frame and Null ticks isolate the complete source leaf draw.
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  for axis in [axes.x_axis(), axes.y_axis()] {
    axis.set_locator(@ticker.NullLocator::new().as_locator())
    axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  }
  @config.set_lines_dashed_pattern([
    4607182418800017408UL.reinterpret_as_double(),
    4611686018427387904UL.reinterpret_as_double(),
  ])
  @config.set_lines_scale_dashes(true)
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
  line.set_linestyle("dashed")
  line.set_gapcolor(Some("none"))
  line.set_color("red")
  line.set_alpha(Some(0UL.reinterpret_as_double()))
  // Source leaf construction omitted add_line/update_line_limits; input bridge only.
  axes.state.val.raw_x_data = empty_data_interval()
  axes.state.val.raw_y_data = empty_data_interval()
  axes.state.val.x_data_minpos = 1.0 / 0.0
  axes.state.val.y_data_minpos = 1.0 / 0.0
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  let retained = fig.to_render_figure()
  try {
    line_gapcolor_source_state(
      line,
      axes,
      Some("none"),
      "red",
      Some(0UL.reinterpret_as_double()),
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
      [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
      [false, false],
      true,
      [
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
    )
    let svg = @svg.render_with_positions_checked(retained).0
    let paints = line_gapcolor_source_polylines(svg)
    assert_eq(paints.length(), 2)
    line_gapcolor_source_paint(
      paints[0],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
      ],
      4616189618054758400UL.reinterpret_as_double(),
      Some([
        4616189618054758400UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      4611686018427387904UL.reinterpret_as_double(),
    )
    line_gapcolor_source_paint(
      paints[1],
      [
        4607182418800017408UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
      ],
      0UL.reinterpret_as_double(),
      Some([
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ]),
      4611686018427387904UL.reinterpret_as_double(),
    )
    line_gapcolor_source_state(
      line,
      axes,
      Some("none"),
      "red",
      Some(0UL.reinterpret_as_double()),
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
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
    )
    line_gapcolor_source_rgba(
      line_color_rgba("none", alpha=Some(0UL.reinterpret_as_double())),
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
      ],
    )
    line_gapcolor_source_rgba(
      line_color_rgba("red", alpha=Some(0UL.reinterpret_as_double())),
      [
        4607182418800017408UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original gap draw row 5: " + error.to_string())
  }
}

///|
fn line_gapcolor_source_draw_6() -> Unit raise {
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
  // Fixed parent frame and Null ticks isolate the complete source leaf draw.
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  for axis in [axes.x_axis(), axes.y_axis()] {
    axis.set_locator(@ticker.NullLocator::new().as_locator())
    axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  }
  @config.set_lines_dashed_pattern([
    4607182418800017408UL.reinterpret_as_double(),
    4611686018427387904UL.reinterpret_as_double(),
  ])
  @config.set_lines_scale_dashes(true)
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
  line.set_linestyle("dashed")
  line.set_gapcolor(Some("C0"))
  line.set_color("C1")
  line.set_alpha(Some(4602678819172646912UL.reinterpret_as_double()))
  // Source leaf construction omitted add_line/update_line_limits; input bridge only.
  axes.state.val.raw_x_data = empty_data_interval()
  axes.state.val.raw_y_data = empty_data_interval()
  axes.state.val.x_data_minpos = 1.0 / 0.0
  axes.state.val.y_data_minpos = 1.0 / 0.0
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  let retained = fig.to_render_figure()
  try {
    line_gapcolor_source_state(
      line,
      axes,
      Some("C0"),
      "C1",
      Some(4602678819172646912UL.reinterpret_as_double()),
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
      [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
      [false, false],
      true,
      [
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
    )
    let svg = @svg.render_with_positions_checked(retained).0
    let paints = line_gapcolor_source_polylines(svg)
    assert_eq(paints.length(), 2)
    line_gapcolor_source_paint(
      paints[0],
      [
        4589468260265693457UL.reinterpret_as_double(),
        4593971859893063953UL.reinterpret_as_double(),
        4596373779694328218UL.reinterpret_as_double(),
        4602678819172646912UL.reinterpret_as_double(),
      ],
      4616189618054758400UL.reinterpret_as_double(),
      Some([
        4616189618054758400UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
      4611686018427387904UL.reinterpret_as_double(),
    )
    line_gapcolor_source_paint(
      paints[1],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
      ],
      0UL.reinterpret_as_double(),
      Some([
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ]),
      4611686018427387904UL.reinterpret_as_double(),
    )
    line_gapcolor_source_state(
      line,
      axes,
      Some("C0"),
      "C1",
      Some(4602678819172646912UL.reinterpret_as_double()),
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
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
    )
    line_gapcolor_source_rgba(
      line_color_rgba(
        "C0",
        alpha=Some(4602678819172646912UL.reinterpret_as_double()),
      ),
      [
        4589468260265693457UL.reinterpret_as_double(),
        4593971859893063953UL.reinterpret_as_double(),
        4596373779694328218UL.reinterpret_as_double(),
        4602678819172646912UL.reinterpret_as_double(),
      ],
    )
    line_gapcolor_source_rgba(
      line_color_rgba(
        "C1",
        alpha=Some(4602678819172646912UL.reinterpret_as_double()),
      ),
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original gap draw row 6: " + error.to_string())
  }
}

///|
fn line_gapcolor_source_draw_7() -> Unit raise {
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
  // Fixed parent frame and Null ticks isolate the complete source leaf draw.
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  for axis in [axes.x_axis(), axes.y_axis()] {
    axis.set_locator(@ticker.NullLocator::new().as_locator())
    axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  }
  @config.set_lines_dashed_pattern([
    4607182418800017408UL.reinterpret_as_double(),
    4611686018427387904UL.reinterpret_as_double(),
  ])
  @config.set_lines_scale_dashes(true)
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
  line.set_linestyle("dashed")
  line.set_gapcolor(
    Some(
      "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
    ),
  )
  line.set_color(
    "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
  )
  line.set_alpha(None)
  // Source leaf construction omitted add_line/update_line_limits; input bridge only.
  axes.state.val.raw_x_data = empty_data_interval()
  axes.state.val.raw_y_data = empty_data_interval()
  axes.state.val.x_data_minpos = 1.0 / 0.0
  axes.state.val.y_data_minpos = 1.0 / 0.0
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  let retained = fig.to_render_figure()
  try {
    line_gapcolor_source_state(
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
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
    )
    assert_true(
      try {
        ignore(@svg.render_with_positions_checked(retained))
        false
      } catch {
        @core.DataError::InvalidTicks(message~) =>
          message ==
          "ValueError: Exceeds the limit (4300 digits) for integer string conversion: value has 4301 digits; use sys.set_int_max_str_digits() to increase the limit"
        _ => false
      },
    )
    line_gapcolor_source_state(
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
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original gap draw row 7: " + error.to_string())
  }
}

///|
fn line_gapcolor_source_draw_8() -> Unit raise {
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
  // Fixed parent frame and Null ticks isolate the complete source leaf draw.
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  for axis in [axes.x_axis(), axes.y_axis()] {
    axis.set_locator(@ticker.NullLocator::new().as_locator())
    axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  }
  @config.set_lines_dashed_pattern([
    4607182418800017408UL.reinterpret_as_double(),
    4611686018427387904UL.reinterpret_as_double(),
  ])
  @config.set_lines_scale_dashes(true)
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
  line.set_linestyle("dashed")
  line.set_gapcolor(Some("red"))
  line.set_color(
    "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
  )
  line.set_alpha(None)
  // Source leaf construction omitted add_line/update_line_limits; input bridge only.
  axes.state.val.raw_x_data = empty_data_interval()
  axes.state.val.raw_y_data = empty_data_interval()
  axes.state.val.x_data_minpos = 1.0 / 0.0
  axes.state.val.y_data_minpos = 1.0 / 0.0
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  let retained = fig.to_render_figure()
  try {
    line_gapcolor_source_state(
      line,
      axes,
      Some("red"),
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
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
    )
    assert_true(
      try {
        ignore(@svg.render_with_positions_checked(retained))
        false
      } catch {
        @core.DataError::InvalidTicks(message~) =>
          message ==
          "ValueError: Exceeds the limit (4300 digits) for integer string conversion: value has 4301 digits; use sys.set_int_max_str_digits() to increase the limit"
        _ => false
      },
    )
    line_gapcolor_source_state(
      line,
      axes,
      Some("red"),
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
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
    )
    line_gapcolor_source_rgba(line_color_rgba("red", alpha=None), [
      4607182418800017408UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
  } catch {
    error => fail("original gap draw row 8: " + error.to_string())
  }
}

///|
fn line_gapcolor_source_draw_9() -> Unit raise {
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
  // Fixed parent frame and Null ticks isolate the complete source leaf draw.
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  for axis in [axes.x_axis(), axes.y_axis()] {
    axis.set_locator(@ticker.NullLocator::new().as_locator())
    axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  }
  @config.set_lines_dashed_pattern([])
  @config.set_lines_scale_dashes(true)
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
  line.set_linestyle("dashed")
  line.set_gapcolor(Some("red"))
  line.set_color(
    "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
  )
  line.set_alpha(None)
  // Source leaf construction omitted add_line/update_line_limits; input bridge only.
  axes.state.val.raw_x_data = empty_data_interval()
  axes.state.val.raw_y_data = empty_data_interval()
  axes.state.val.x_data_minpos = 1.0 / 0.0
  axes.state.val.y_data_minpos = 1.0 / 0.0
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  let retained = fig.to_render_figure()
  try {
    line_gapcolor_source_state(
      line,
      axes,
      Some("red"),
      "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "--",
      true,
      0UL.reinterpret_as_double(),
      Some([]),
      0UL.reinterpret_as_double(),
      Some([]),
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
      [],
    )
    assert_true(
      try {
        ignore(@svg.render_with_positions_checked(retained))
        false
      } catch {
        @core.DataError::InvalidTicks(message~) =>
          message == "IndexError: list index out of range"
        _ => false
      },
    )
    line_gapcolor_source_state(
      line,
      axes,
      Some("red"),
      "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "--",
      true,
      0UL.reinterpret_as_double(),
      Some([]),
      0UL.reinterpret_as_double(),
      Some([]),
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
      [],
    )
    line_gapcolor_source_rgba(line_color_rgba("red", alpha=None), [
      4607182418800017408UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
  } catch {
    error => fail("original gap draw row 9: " + error.to_string())
  }
}

///|
fn line_gapcolor_source_draw_10() -> Unit raise {
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
  // Fixed parent frame and Null ticks isolate the complete source leaf draw.
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  for axis in [axes.x_axis(), axes.y_axis()] {
    axis.set_locator(@ticker.NullLocator::new().as_locator())
    axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  }
  @config.set_lines_dashed_pattern([])
  @config.set_lines_scale_dashes(true)
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
  line.set_linestyle("dashed")
  line.set_gapcolor(
    Some(
      "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
    ),
  )
  line.set_color("blue")
  line.set_alpha(None)
  // Source leaf construction omitted add_line/update_line_limits; input bridge only.
  axes.state.val.raw_x_data = empty_data_interval()
  axes.state.val.raw_y_data = empty_data_interval()
  axes.state.val.x_data_minpos = 1.0 / 0.0
  axes.state.val.y_data_minpos = 1.0 / 0.0
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  let retained = fig.to_render_figure()
  try {
    line_gapcolor_source_state(
      line,
      axes,
      Some(
        "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
      ),
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "--",
      true,
      0UL.reinterpret_as_double(),
      Some([]),
      0UL.reinterpret_as_double(),
      Some([]),
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
      [],
    )
    assert_true(
      try {
        ignore(@svg.render_with_positions_checked(retained))
        false
      } catch {
        @core.DataError::InvalidTicks(message~) =>
          message ==
          "ValueError: Exceeds the limit (4300 digits) for integer string conversion: value has 4301 digits; use sys.set_int_max_str_digits() to increase the limit"
        _ => false
      },
    )
    line_gapcolor_source_state(
      line,
      axes,
      Some(
        "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
      ),
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "--",
      true,
      0UL.reinterpret_as_double(),
      Some([]),
      0UL.reinterpret_as_double(),
      Some([]),
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
      [],
    )
  } catch {
    error => fail("original gap draw row 10: " + error.to_string())
  }
}

///|
fn line_gapcolor_source_draw_11() -> Unit raise {
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
  // Fixed parent frame and Null ticks isolate the complete source leaf draw.
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  for axis in [axes.x_axis(), axes.y_axis()] {
    axis.set_locator(@ticker.NullLocator::new().as_locator())
    axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  }
  @config.set_lines_dashed_pattern([
    13830554455654793216UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  @config.set_lines_scale_dashes(true)
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
  line.set_linestyle("dashed")
  line.set_gapcolor(Some("red"))
  line.set_color(
    "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
  )
  line.set_alpha(None)
  // Source leaf construction omitted add_line/update_line_limits; input bridge only.
  axes.state.val.raw_x_data = empty_data_interval()
  axes.state.val.raw_y_data = empty_data_interval()
  axes.state.val.x_data_minpos = 1.0 / 0.0
  axes.state.val.y_data_minpos = 1.0 / 0.0
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  let retained = fig.to_render_figure()
  try {
    line_gapcolor_source_state(
      line,
      axes,
      Some("red"),
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
        13830554455654793216UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
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
    line_gapcolor_source_state(
      line,
      axes,
      Some("red"),
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
        13830554455654793216UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line_gapcolor_source_rgba(line_color_rgba("red", alpha=None), [
      4607182418800017408UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
  } catch {
    error => fail("original gap draw row 11: " + error.to_string())
  }
}

///|
fn line_gapcolor_source_draw_12() -> Unit raise {
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
  // Fixed parent frame and Null ticks isolate the complete source leaf draw.
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  for axis in [axes.x_axis(), axes.y_axis()] {
    axis.set_locator(@ticker.NullLocator::new().as_locator())
    axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  }
  @config.set_lines_dashed_pattern([
    0UL.reinterpret_as_double(),
    0UL.reinterpret_as_double(),
  ])
  @config.set_lines_scale_dashes(true)
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
  line.set_linestyle("dashed")
  line.set_gapcolor(Some("red"))
  line.set_color(
    "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
  )
  line.set_alpha(None)
  // Source leaf construction omitted add_line/update_line_limits; input bridge only.
  axes.state.val.raw_x_data = empty_data_interval()
  axes.state.val.raw_y_data = empty_data_interval()
  axes.state.val.x_data_minpos = 1.0 / 0.0
  axes.state.val.y_data_minpos = 1.0 / 0.0
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  let retained = fig.to_render_figure()
  try {
    line_gapcolor_source_state(
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
      [0UL.reinterpret_as_double(), 0UL.reinterpret_as_double()],
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
    line_gapcolor_source_state(
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
      [0UL.reinterpret_as_double(), 0UL.reinterpret_as_double()],
    )
    line_gapcolor_source_rgba(line_color_rgba("red", alpha=None), [
      4607182418800017408UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
  } catch {
    error => fail("original gap draw row 12: " + error.to_string())
  }
}

///|
fn line_gapcolor_source_draw_13() -> Unit raise {
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
  // Fixed parent frame and Null ticks isolate the complete source leaf draw.
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  for axis in [axes.x_axis(), axes.y_axis()] {
    axis.set_locator(@ticker.NullLocator::new().as_locator())
    axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  }
  @config.set_lines_dashed_pattern([
    4607182418800017408UL.reinterpret_as_double(),
    0.0 / 0.0,
  ])
  @config.set_lines_scale_dashes(true)
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
  line.set_linestyle("dashed")
  line.set_gapcolor(Some("red"))
  line.set_color("blue")
  line.set_alpha(None)
  // Source leaf construction omitted add_line/update_line_limits; input bridge only.
  axes.state.val.raw_x_data = empty_data_interval()
  axes.state.val.raw_y_data = empty_data_interval()
  axes.state.val.x_data_minpos = 1.0 / 0.0
  axes.state.val.y_data_minpos = 1.0 / 0.0
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  let retained = fig.to_render_figure()
  try {
    line_gapcolor_source_state(
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
      [4607182418800017408UL.reinterpret_as_double(), 0.0 / 0.0],
    )
    let svg = @svg.render_with_positions_checked(retained).0
    let paints = line_gapcolor_source_polylines(svg)
    assert_eq(paints.length(), 2)
    line_gapcolor_source_paint(
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
    line_gapcolor_source_paint(
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
    line_gapcolor_source_state(
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
      [4607182418800017408UL.reinterpret_as_double(), 0.0 / 0.0],
    )
    line_gapcolor_source_rgba(line_color_rgba("red", alpha=None), [
      4607182418800017408UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
    line_gapcolor_source_rgba(line_color_rgba("blue", alpha=None), [
      0UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
  } catch {
    error => fail("original gap draw row 13: " + error.to_string())
  }
}

///|
fn line_gapcolor_source_draw_14() -> Unit raise {
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
  // Fixed parent frame and Null ticks isolate the complete source leaf draw.
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  for axis in [axes.x_axis(), axes.y_axis()] {
    axis.set_locator(@ticker.NullLocator::new().as_locator())
    axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  }
  @config.set_lines_dashed_pattern([
    4607182418800017408UL.reinterpret_as_double(),
    1.0 / 0.0,
  ])
  @config.set_lines_scale_dashes(true)
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
  line.set_linestyle("dashed")
  line.set_gapcolor(Some("red"))
  line.set_color("blue")
  line.set_alpha(None)
  // Source leaf construction omitted add_line/update_line_limits; input bridge only.
  axes.state.val.raw_x_data = empty_data_interval()
  axes.state.val.raw_y_data = empty_data_interval()
  axes.state.val.x_data_minpos = 1.0 / 0.0
  axes.state.val.y_data_minpos = 1.0 / 0.0
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  let retained = fig.to_render_figure()
  try {
    line_gapcolor_source_state(
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
      [4607182418800017408UL.reinterpret_as_double(), 1.0 / 0.0],
    )
    let svg = @svg.render_with_positions_checked(retained).0
    let paints = line_gapcolor_source_polylines(svg)
    assert_eq(paints.length(), 2)
    line_gapcolor_source_paint(
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
    line_gapcolor_source_paint(
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
    line_gapcolor_source_state(
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
      [4607182418800017408UL.reinterpret_as_double(), 1.0 / 0.0],
    )
    line_gapcolor_source_rgba(line_color_rgba("red", alpha=None), [
      4607182418800017408UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
    line_gapcolor_source_rgba(line_color_rgba("blue", alpha=None), [
      0UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
  } catch {
    error => fail("original gap draw row 14: " + error.to_string())
  }
}

///|
fn line_gapcolor_source_draw_15() -> Unit raise {
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
  // Fixed parent frame and Null ticks isolate the complete source leaf draw.
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  for axis in [axes.x_axis(), axes.y_axis()] {
    axis.set_locator(@ticker.NullLocator::new().as_locator())
    axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  }
  @config.set_lines_dashed_pattern([
    4607182418800017408UL.reinterpret_as_double(),
    -1.0 / 0.0,
  ])
  @config.set_lines_scale_dashes(true)
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
  line.set_linestyle("dashed")
  line.set_gapcolor(Some("red"))
  line.set_color("blue")
  line.set_alpha(None)
  // Source leaf construction omitted add_line/update_line_limits; input bridge only.
  axes.state.val.raw_x_data = empty_data_interval()
  axes.state.val.raw_y_data = empty_data_interval()
  axes.state.val.x_data_minpos = 1.0 / 0.0
  axes.state.val.y_data_minpos = 1.0 / 0.0
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  let retained = fig.to_render_figure()
  try {
    line_gapcolor_source_state(
      line,
      axes,
      Some("red"),
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
      [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
      [false, false],
      true,
      [4607182418800017408UL.reinterpret_as_double(), -1.0 / 0.0],
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
    line_gapcolor_source_state(
      line,
      axes,
      Some("red"),
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
      [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
      [false, false],
      true,
      [4607182418800017408UL.reinterpret_as_double(), -1.0 / 0.0],
    )
    line_gapcolor_source_rgba(line_color_rgba("red", alpha=None), [
      4607182418800017408UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
  } catch {
    error => fail("original gap draw row 15: " + error.to_string())
  }
}

///|
fn line_gapcolor_source_draw_16() -> Unit raise {
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
  // Fixed parent frame and Null ticks isolate the complete source leaf draw.
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  for axis in [axes.x_axis(), axes.y_axis()] {
    axis.set_locator(@ticker.NullLocator::new().as_locator())
    axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  }
  @config.set_lines_dashed_pattern([
    4607182418800017408UL.reinterpret_as_double(),
    4611686018427387904UL.reinterpret_as_double(),
    4613937818241073152UL.reinterpret_as_double(),
  ])
  @config.set_lines_scale_dashes(true)
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
  line.set_linestyle("dashed")
  line.set_gapcolor(Some("red"))
  line.set_color("blue")
  line.set_alpha(None)
  // Source leaf construction omitted add_line/update_line_limits; input bridge only.
  axes.state.val.raw_x_data = empty_data_interval()
  axes.state.val.raw_y_data = empty_data_interval()
  axes.state.val.x_data_minpos = 1.0 / 0.0
  axes.state.val.y_data_minpos = 1.0 / 0.0
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  let retained = fig.to_render_figure()
  try {
    line_gapcolor_source_state(
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
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
    )
    let svg = @svg.render_with_positions_checked(retained).0
    let paints = line_gapcolor_source_polylines(svg)
    assert_eq(paints.length(), 2)
    line_gapcolor_source_paint(
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
    line_gapcolor_source_paint(
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
    line_gapcolor_source_state(
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
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4613937818241073152UL.reinterpret_as_double(),
      ],
    )
    line_gapcolor_source_rgba(line_color_rgba("red", alpha=None), [
      4607182418800017408UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
    line_gapcolor_source_rgba(line_color_rgba("blue", alpha=None), [
      0UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
  } catch {
    error => fail("original gap draw row 16: " + error.to_string())
  }
}

///|
fn line_gapcolor_source_draw_17() -> Unit raise {
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
  // Fixed parent frame and Null ticks isolate the complete source leaf draw.
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  for axis in [axes.x_axis(), axes.y_axis()] {
    axis.set_locator(@ticker.NullLocator::new().as_locator())
    axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  }
  @config.set_lines_dashed_pattern([
    13830554455654793216UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  @config.set_lines_scale_dashes(true)
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
  line.set_linestyle("dashed")
  line.set_gapcolor(
    Some(
      "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
    ),
  )
  line.set_color("blue")
  line.set_alpha(None)
  // Source leaf construction omitted add_line/update_line_limits; input bridge only.
  axes.state.val.raw_x_data = empty_data_interval()
  axes.state.val.raw_y_data = empty_data_interval()
  axes.state.val.x_data_minpos = 1.0 / 0.0
  axes.state.val.y_data_minpos = 1.0 / 0.0
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  let retained = fig.to_render_figure()
  try {
    line_gapcolor_source_state(
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
        13830554455654793216UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    let svg = @svg.render_with_positions_checked(retained).0
    let paints = line_gapcolor_source_polylines(svg)
    assert_eq(paints.length(), 1)
    line_gapcolor_source_paint(
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
    line_gapcolor_source_state(
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
        13830554455654793216UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line_gapcolor_source_rgba(line_color_rgba("blue", alpha=None), [
      0UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
  } catch {
    error => fail("original gap draw row 17: " + error.to_string())
  }
}

///|
fn line_gapcolor_source_draw_18() -> Unit raise {
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
  // Fixed parent frame and Null ticks isolate the complete source leaf draw.
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  for axis in [axes.x_axis(), axes.y_axis()] {
    axis.set_locator(@ticker.NullLocator::new().as_locator())
    axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  }
  @config.set_lines_dashed_pattern([
    13830554455654793216UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  @config.set_lines_scale_dashes(true)
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
  line.set_linewidth(13835058055282163712UL.reinterpret_as_double())
  line.set_linestyle("dashed")
  line.set_gapcolor(
    Some(
      "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
    ),
  )
  line.set_color("blue")
  line.set_alpha(None)
  // Source leaf construction omitted add_line/update_line_limits; input bridge only.
  axes.state.val.raw_x_data = empty_data_interval()
  axes.state.val.raw_y_data = empty_data_interval()
  axes.state.val.x_data_minpos = 1.0 / 0.0
  axes.state.val.y_data_minpos = 1.0 / 0.0
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  let retained = fig.to_render_figure()
  try {
    line_gapcolor_source_state(
      line,
      axes,
      Some(
        "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
      ),
      "blue",
      None,
      13835058055282163712UL.reinterpret_as_double(),
      "--",
      true,
      0UL.reinterpret_as_double(),
      Some([
        13830554455654793216UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ]),
      9223372036854775808UL.reinterpret_as_double(),
      Some([
        4611686018427387904UL.reinterpret_as_double(),
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
      [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
      [false, false],
      true,
      [
        13830554455654793216UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    let svg = @svg.render_with_positions_checked(retained).0
    let paints = line_gapcolor_source_polylines(svg)
    assert_eq(paints.length(), 1)
    line_gapcolor_source_paint(
      paints[0],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      0UL.reinterpret_as_double(),
      None,
      13835058055282163712UL.reinterpret_as_double(),
    )
    line_gapcolor_source_state(
      line,
      axes,
      Some(
        "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
      ),
      "blue",
      None,
      13835058055282163712UL.reinterpret_as_double(),
      "--",
      true,
      0UL.reinterpret_as_double(),
      Some([
        13830554455654793216UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ]),
      9223372036854775808UL.reinterpret_as_double(),
      Some([
        4611686018427387904UL.reinterpret_as_double(),
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
      [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
      [false, false],
      true,
      [
        13830554455654793216UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line_gapcolor_source_rgba(line_color_rgba("blue", alpha=None), [
      0UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
  } catch {
    error => fail("original gap draw row 18: " + error.to_string())
  }
}

///|
fn line_gapcolor_source_draw_19() -> Unit raise {
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
  // Fixed parent frame and Null ticks isolate the complete source leaf draw.
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  for axis in [axes.x_axis(), axes.y_axis()] {
    axis.set_locator(@ticker.NullLocator::new().as_locator())
    axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  }
  @config.set_lines_dashed_pattern([
    13830554455654793216UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  @config.set_lines_scale_dashes(true)
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
  line.set_linestyle("dashed")
  line.set_gapcolor(
    Some(
      "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
    ),
  )
  line.set_color("blue")
  line.set_alpha(None)
  // Source leaf construction omitted add_line/update_line_limits; input bridge only.
  axes.state.val.raw_x_data = empty_data_interval()
  axes.state.val.raw_y_data = empty_data_interval()
  axes.state.val.x_data_minpos = 1.0 / 0.0
  axes.state.val.y_data_minpos = 1.0 / 0.0
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  let retained = fig.to_render_figure()
  try {
    line_gapcolor_source_state(
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
        13830554455654793216UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    let svg = @svg.render_with_positions_checked(retained).0
    let paints = line_gapcolor_source_polylines(svg)
    assert_eq(paints.length(), 1)
    line_gapcolor_source_paint(
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
    line_gapcolor_source_state(
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
        13830554455654793216UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line_gapcolor_source_rgba(line_color_rgba("blue", alpha=None), [
      0UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
  } catch {
    error => fail("original gap draw row 19: " + error.to_string())
  }
}

///|
fn line_gapcolor_source_draw_20() -> Unit raise {
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
  // Fixed parent frame and Null ticks isolate the complete source leaf draw.
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  for axis in [axes.x_axis(), axes.y_axis()] {
    axis.set_locator(@ticker.NullLocator::new().as_locator())
    axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  }
  @config.set_lines_dashed_pattern([])
  @config.set_lines_scale_dashes(true)
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
  line.set_linestyle("dashed")
  line.set_gapcolor(None)
  line.set_color("blue")
  line.set_alpha(None)
  // Source leaf construction omitted add_line/update_line_limits; input bridge only.
  axes.state.val.raw_x_data = empty_data_interval()
  axes.state.val.raw_y_data = empty_data_interval()
  axes.state.val.x_data_minpos = 1.0 / 0.0
  axes.state.val.y_data_minpos = 1.0 / 0.0
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  let retained = fig.to_render_figure()
  try {
    line_gapcolor_source_state(
      line,
      axes,
      None,
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "--",
      true,
      0UL.reinterpret_as_double(),
      Some([]),
      0UL.reinterpret_as_double(),
      Some([]),
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
      [],
    )
    let svg = @svg.render_with_positions_checked(retained).0
    let paints = line_gapcolor_source_polylines(svg)
    assert_eq(paints.length(), 1)
    line_gapcolor_source_paint(
      paints[0],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      0UL.reinterpret_as_double(),
      Some([]),
      4611686018427387904UL.reinterpret_as_double(),
    )
    line_gapcolor_source_state(
      line,
      axes,
      None,
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "--",
      true,
      0UL.reinterpret_as_double(),
      Some([]),
      0UL.reinterpret_as_double(),
      Some([]),
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
      [],
    )
    line_gapcolor_source_rgba(line_color_rgba("blue", alpha=None), [
      0UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
  } catch {
    error => fail("original gap draw row 20: " + error.to_string())
  }
}

///|
fn line_gapcolor_source_draw_21() -> Unit raise {
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
  // Fixed parent frame and Null ticks isolate the complete source leaf draw.
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  for axis in [axes.x_axis(), axes.y_axis()] {
    axis.set_locator(@ticker.NullLocator::new().as_locator())
    axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  }
  @config.set_lines_dashed_pattern([
    13830554455654793216UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  @config.set_lines_scale_dashes(true)
  let line = axes.plot_line(
    LineData::Numeric([0.0 / 0.0, 1.0 / 0.0]),
    LineData::Numeric([0.0 / 0.0, -1.0 / 0.0]),
    color="blue",
  )
  line.set_linewidth(4611686018427387904UL.reinterpret_as_double())
  line.set_linestyle("dashed")
  line.set_gapcolor(Some("red"))
  line.set_color("blue")
  line.set_alpha(None)
  // Source leaf construction omitted add_line/update_line_limits; input bridge only.
  axes.state.val.raw_x_data = empty_data_interval()
  axes.state.val.raw_y_data = empty_data_interval()
  axes.state.val.x_data_minpos = 1.0 / 0.0
  axes.state.val.y_data_minpos = 1.0 / 0.0
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  let retained = fig.to_render_figure()
  try {
    line_gapcolor_source_state(
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
      [0.0 / 0.0, 0.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0],
      [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
      [false, false],
      true,
      [
        13830554455654793216UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
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
    line_gapcolor_source_state(
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
      [0.0 / 0.0, 0.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0],
      [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
      [false, false],
      true,
      [
        13830554455654793216UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
    )
    line_gapcolor_source_rgba(line_color_rgba("red", alpha=None), [
      4607182418800017408UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
  } catch {
    error => fail("original gap draw row 21: " + error.to_string())
  }
}

///|
fn line_gapcolor_source_draw_22() -> Unit raise {
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
  // Fixed parent frame and Null ticks isolate the complete source leaf draw.
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  for axis in [axes.x_axis(), axes.y_axis()] {
    axis.set_locator(@ticker.NullLocator::new().as_locator())
    axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  }
  @config.set_lines_dashed_pattern([
    4607182418800017408UL.reinterpret_as_double(),
    4611686018427387904UL.reinterpret_as_double(),
  ])
  @config.set_lines_scale_dashes(true)
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
  line.set_linestyle("dashed")
  line.set_gapcolor(
    Some(
      "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
    ),
  )
  line.set_color(
    "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
  )
  line.set_alpha(None)
  line.set_ydata(LineData::Numeric([1.0, 2.0, 3.0]))
  // Source leaf construction omitted add_line/update_line_limits; input bridge only.
  axes.state.val.raw_x_data = empty_data_interval()
  axes.state.val.raw_y_data = empty_data_interval()
  axes.state.val.x_data_minpos = 1.0 / 0.0
  axes.state.val.y_data_minpos = 1.0 / 0.0
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  let retained = fig.to_render_figure()
  try {
    line_gapcolor_source_state(
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
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
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
    line_gapcolor_source_state(
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
        4607182418800017408UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ],
    )
  } catch {
    error => fail("original gap draw row 22: " + error.to_string())
  }
}

///|
fn line_gapcolor_source_draw_23() -> Unit raise {
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
  // Fixed parent frame and Null ticks isolate the complete source leaf draw.
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  for axis in [axes.x_axis(), axes.y_axis()] {
    axis.set_locator(@ticker.NullLocator::new().as_locator())
    axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  }
  @config.set_lines_dashed_pattern([])
  @config.set_lines_scale_dashes(false)
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
  line.set_linestyle("dashed")
  line.set_gapcolor(Some("red"))
  line.set_color("blue")
  line.set_alpha(None)
  // Source leaf construction omitted add_line/update_line_limits; input bridge only.
  axes.state.val.raw_x_data = empty_data_interval()
  axes.state.val.raw_y_data = empty_data_interval()
  axes.state.val.x_data_minpos = 1.0 / 0.0
  axes.state.val.y_data_minpos = 1.0 / 0.0
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  let retained = fig.to_render_figure()
  try {
    line_gapcolor_source_state(
      line,
      axes,
      Some("red"),
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "--",
      true,
      0UL.reinterpret_as_double(),
      Some([]),
      0UL.reinterpret_as_double(),
      Some([]),
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
      [],
    )
    assert_true(
      try {
        ignore(@svg.render_with_positions_checked(retained))
        false
      } catch {
        @core.DataError::InvalidTicks(message~) =>
          message == "IndexError: tuple index out of range"
        _ => false
      },
    )
    line_gapcolor_source_state(
      line,
      axes,
      Some("red"),
      "blue",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "--",
      true,
      0UL.reinterpret_as_double(),
      Some([]),
      0UL.reinterpret_as_double(),
      Some([]),
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
      [],
    )
    line_gapcolor_source_rgba(line_color_rgba("red", alpha=None), [
      4607182418800017408UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
  } catch {
    error => fail("original gap draw row 23: " + error.to_string())
  }
}

///|
fn line_gapcolor_source_live_cycle() -> Unit raise {
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
  // Fixed parent frame and Null ticks isolate the complete source leaf draw.
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  for axis in [axes.x_axis(), axes.y_axis()] {
    axis.set_locator(@ticker.NullLocator::new().as_locator())
    axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  }
  @config.set_lines_dashed_pattern([
    4615514078110652826UL.reinterpret_as_double(),
    4609884578576439706UL.reinterpret_as_double(),
  ])
  @config.set_lines_scale_dashes(true)
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
  line.set_linestyle("dashed")
  line.set_gapcolor(Some("C0"))
  line.set_color("C1")
  line.set_alpha(None)
  // Source leaf construction omitted add_line/update_line_limits; input bridge only.
  axes.state.val.raw_x_data = empty_data_interval()
  axes.state.val.raw_y_data = empty_data_interval()
  axes.state.val.x_data_minpos = 1.0 / 0.0
  axes.state.val.y_data_minpos = 1.0 / 0.0
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  let retained = fig.to_render_figure()
  @config.set_color_cycle(["#11223344", "none"])
  try {
    line_gapcolor_source_state(
      line,
      axes,
      Some("C0"),
      "C1",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "--",
      true,
      0UL.reinterpret_as_double(),
      Some([
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ]),
      0UL.reinterpret_as_double(),
      Some([
        4620017677738023322UL.reinterpret_as_double(),
        4614388178203810202UL.reinterpret_as_double(),
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
    let paints = line_gapcolor_source_polylines(svg)
    assert_eq(paints.length(), 2)
    line_gapcolor_source_paint(
      paints[0],
      [
        4589468260265693457UL.reinterpret_as_double(),
        4593971859893063953UL.reinterpret_as_double(),
        4596373779694328218UL.reinterpret_as_double(),
        4598475459520434449UL.reinterpret_as_double(),
      ],
      4614388178203810202UL.reinterpret_as_double(),
      Some([
        4614388178203810202UL.reinterpret_as_double(),
        4620017677738023322UL.reinterpret_as_double(),
      ]),
      4611686018427387904UL.reinterpret_as_double(),
    )
    line_gapcolor_source_paint(
      paints[1],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
      ],
      0UL.reinterpret_as_double(),
      Some([
        4620017677738023322UL.reinterpret_as_double(),
        4614388178203810202UL.reinterpret_as_double(),
      ]),
      4611686018427387904UL.reinterpret_as_double(),
    )
    line_gapcolor_source_state(
      line,
      axes,
      Some("C0"),
      "C1",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "--",
      true,
      0UL.reinterpret_as_double(),
      Some([
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ]),
      0UL.reinterpret_as_double(),
      Some([
        4620017677738023322UL.reinterpret_as_double(),
        4614388178203810202UL.reinterpret_as_double(),
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
    line_gapcolor_source_rgba(line_color_rgba("C0", alpha=None), [
      4589468260265693457UL.reinterpret_as_double(),
      4593971859893063953UL.reinterpret_as_double(),
      4596373779694328218UL.reinterpret_as_double(),
      4598475459520434449UL.reinterpret_as_double(),
    ])
    line_gapcolor_source_rgba(line_color_rgba("C1", alpha=None), [
      0UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
    ])
  } catch {
    error => fail("original gap draw row 24: " + error.to_string())
  }
  @config.set_color_cycle(["none", "#00ff0080"])
  try {
    line_gapcolor_source_state(
      line,
      axes,
      Some("C0"),
      "C1",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "--",
      true,
      0UL.reinterpret_as_double(),
      Some([
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ]),
      0UL.reinterpret_as_double(),
      Some([
        4620017677738023322UL.reinterpret_as_double(),
        4614388178203810202UL.reinterpret_as_double(),
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
    let svg = @svg.render_with_positions_checked(retained).0
    let paints = line_gapcolor_source_polylines(svg)
    assert_eq(paints.length(), 2)
    line_gapcolor_source_paint(
      paints[0],
      [
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
      ],
      4614388178203810202UL.reinterpret_as_double(),
      Some([
        4614388178203810202UL.reinterpret_as_double(),
        4620017677738023322UL.reinterpret_as_double(),
      ]),
      4611686018427387904UL.reinterpret_as_double(),
    )
    line_gapcolor_source_paint(
      paints[1],
      [
        0UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        0UL.reinterpret_as_double(),
        4602696480347656208UL.reinterpret_as_double(),
      ],
      0UL.reinterpret_as_double(),
      Some([
        4620017677738023322UL.reinterpret_as_double(),
        4614388178203810202UL.reinterpret_as_double(),
      ]),
      4611686018427387904UL.reinterpret_as_double(),
    )
    line_gapcolor_source_state(
      line,
      axes,
      Some("C0"),
      "C1",
      None,
      4611686018427387904UL.reinterpret_as_double(),
      "--",
      true,
      0UL.reinterpret_as_double(),
      Some([
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ]),
      0UL.reinterpret_as_double(),
      Some([
        4620017677738023322UL.reinterpret_as_double(),
        4614388178203810202UL.reinterpret_as_double(),
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
    line_gapcolor_source_rgba(line_color_rgba("C0", alpha=None), [
      0UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
    ])
    line_gapcolor_source_rgba(line_color_rgba("C1", alpha=None), [
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
      4602696480347656208UL.reinterpret_as_double(),
    ])
  } catch {
    error => fail("original gap draw row 25: " + error.to_string())
  }
}

///|
test "original complete gap foreground paint ordering and late errors" {
  line_gapcolor_source_draw_0()
  line_gapcolor_source_draw_1()
  line_gapcolor_source_draw_2()
  line_gapcolor_source_draw_3()
  line_gapcolor_source_draw_4()
  line_gapcolor_source_draw_5()
  line_gapcolor_source_draw_6()
  line_gapcolor_source_draw_7()
  line_gapcolor_source_draw_8()
  line_gapcolor_source_draw_9()
  line_gapcolor_source_draw_10()
  line_gapcolor_source_draw_11()
  line_gapcolor_source_draw_12()
  line_gapcolor_source_draw_13()
  line_gapcolor_source_draw_14()
  line_gapcolor_source_draw_15()
  line_gapcolor_source_draw_16()
  line_gapcolor_source_draw_17()
  line_gapcolor_source_draw_18()
  line_gapcolor_source_draw_19()
  line_gapcolor_source_draw_20()
  line_gapcolor_source_draw_21()
  line_gapcolor_source_draw_22()
  line_gapcolor_source_draw_23()
  line_gapcolor_source_live_cycle()
}
