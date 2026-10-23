// Generated from pinned original String Line methods and GC draw; do not edit.
// Seven native tuple/list/None records remain source-only in the JSON.

///|
fn line_style_source_double(actual : Double, expected : Double) -> Unit raise {
  if expected.is_nan() {
    assert_true(actual.is_nan())
  } else {
    assert_eq(actual.reinterpret_as_uint64(), expected.reinterpret_as_uint64())
  }
}

///|
fn line_style_source_numbers(
  actual : Array[Double],
  expected : Array[Double],
) -> Unit raise {
  assert_eq(actual.length(), expected.length())
  for index in 0..<actual.length() {
    line_style_source_double(actual[index], expected[index])
  }
}

///|
fn line_style_source_optional(
  actual : Array[Double]?,
  expected : Array[Double]?,
) -> Unit raise {
  match (actual, expected) {
    (None, None) => ()
    (Some(actual), Some(expected)) =>
      line_style_source_numbers(actual, expected)
    _ => fail("original optional dash sequence differs")
  }
}

///|
fn line_style_source_pattern(
  line : Line2D,
  unscaled_offset : Double,
  unscaled_dashes : Array[Double]?,
  scaled_offset : Double,
  scaled_dashes : Array[Double]?,
) -> Unit raise {
  line_style_source_double(line.unscaled_dash_pattern.offset, unscaled_offset)
  line_style_source_optional(line.unscaled_dash_pattern.dashes, unscaled_dashes)
  let stroke = line.style.line_stroke()
  line_style_source_double(stroke.dash_offset(), scaled_offset)
  line_style_source_optional(stroke.dash_sequence(), scaled_dashes)
}

///|
fn line_style_source_state(
  line : Line2D,
  axes : Axes,
  canonical : String,
  stale : Bool,
  width : Double,
  invalid : Array[Bool],
  xy : Array[Double],
  data : Array[Double],
  requests : Array[Bool],
) -> Unit raise {
  assert_eq(line.get_linestyle(), canonical)
  assert_eq(line.stale(), stale)
  line_style_source_double(line.get_linewidth(), width)
  assert_eq([line.invalid_x, line.invalid_y], invalid)
  line_style_source_numbers(line.cache.flat.to_array(), xy)
  line_style_source_numbers(
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
  assert_eq(line.get_alpha(), None)
  assert_true(line.get_visible())
}

///|
fn line_style_source_rc(
  scale : Bool,
  dashed : Array[Double],
  dashdot : Array[Double],
  dotted : Array[Double],
) -> Unit raise {
  assert_eq(@config.lines_scale_dashes(), scale)
  line_style_source_numbers(@config.lines_dashed_pattern(), dashed)
  line_style_source_numbers(@config.lines_dashdot_pattern(), dashdot)
  line_style_source_numbers(@config.lines_dotted_pattern(), dotted)
}

///|
fn line_style_source_strings() -> Unit raise {
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
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([0.0, 1.0]),
    LineData::Numeric([10.0, 20.0]),
    color="red",
  )
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  // String '-'
  try {
    // Match native controlled stale=False input; this is not a draw.
    line.mark_drawn()
    line_style_source_state(
      line,
      axes,
      "-",
      false,
      4611686018427387904UL.reinterpret_as_double(),
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
    )
    line_style_source_pattern(
      line,
      0UL.reinterpret_as_double(),
      None,
      0UL.reinterpret_as_double(),
      None,
    )
    line_style_source_rc(
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    line.set_linestyle("-")
    line_style_source_state(
      line,
      axes,
      "-",
      true,
      4611686018427387904UL.reinterpret_as_double(),
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
    )
    line_style_source_pattern(
      line,
      0UL.reinterpret_as_double(),
      None,
      0UL.reinterpret_as_double(),
      None,
    )
    line_style_source_rc(
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    assert_eq(line.get_color(), "red")
  } catch {
    error => fail("original String linestyle row 0: " + error.to_string())
  }
  // String 'solid'
  try {
    // Match native controlled stale=False input; this is not a draw.
    line.mark_drawn()
    line_style_source_state(
      line,
      axes,
      "-",
      false,
      4611686018427387904UL.reinterpret_as_double(),
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
    )
    line_style_source_pattern(
      line,
      0UL.reinterpret_as_double(),
      None,
      0UL.reinterpret_as_double(),
      None,
    )
    line_style_source_rc(
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    line.set_linestyle("solid")
    line_style_source_state(
      line,
      axes,
      "-",
      true,
      4611686018427387904UL.reinterpret_as_double(),
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
    )
    line_style_source_pattern(
      line,
      0UL.reinterpret_as_double(),
      None,
      0UL.reinterpret_as_double(),
      None,
    )
    line_style_source_rc(
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    assert_eq(line.get_color(), "red")
  } catch {
    error => fail("original String linestyle row 1: " + error.to_string())
  }
  // String '--'
  try {
    // Match native controlled stale=False input; this is not a draw.
    line.mark_drawn()
    line_style_source_state(
      line,
      axes,
      "-",
      false,
      4611686018427387904UL.reinterpret_as_double(),
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
    )
    line_style_source_pattern(
      line,
      0UL.reinterpret_as_double(),
      None,
      0UL.reinterpret_as_double(),
      None,
    )
    line_style_source_rc(
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    line.set_linestyle("--")
    line_style_source_state(
      line,
      axes,
      "--",
      true,
      4611686018427387904UL.reinterpret_as_double(),
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
    )
    line_style_source_pattern(
      line,
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
    )
    line_style_source_rc(
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    assert_eq(line.get_color(), "red")
  } catch {
    error => fail("original String linestyle row 2: " + error.to_string())
  }
  // String 'dashed'
  try {
    // Match native controlled stale=False input; this is not a draw.
    line.mark_drawn()
    line_style_source_state(
      line,
      axes,
      "--",
      false,
      4611686018427387904UL.reinterpret_as_double(),
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
    )
    line_style_source_pattern(
      line,
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
    )
    line_style_source_rc(
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    line.set_linestyle("dashed")
    line_style_source_state(
      line,
      axes,
      "--",
      true,
      4611686018427387904UL.reinterpret_as_double(),
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
    )
    line_style_source_pattern(
      line,
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
    )
    line_style_source_rc(
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    assert_eq(line.get_color(), "red")
  } catch {
    error => fail("original String linestyle row 3: " + error.to_string())
  }
  // String '-.'
  try {
    // Match native controlled stale=False input; this is not a draw.
    line.mark_drawn()
    line_style_source_state(
      line,
      axes,
      "--",
      false,
      4611686018427387904UL.reinterpret_as_double(),
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
    )
    line_style_source_pattern(
      line,
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
    )
    line_style_source_rc(
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    line.set_linestyle("-.")
    line_style_source_state(
      line,
      axes,
      "-.",
      true,
      4611686018427387904UL.reinterpret_as_double(),
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
    )
    line_style_source_pattern(
      line,
      0UL.reinterpret_as_double(),
      Some([
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ]),
      0UL.reinterpret_as_double(),
      Some([
        4623395377458551194UL.reinterpret_as_double(),
        4614388178203810202UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4614388178203810202UL.reinterpret_as_double(),
      ]),
    )
    line_style_source_rc(
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    assert_eq(line.get_color(), "red")
  } catch {
    error => fail("original String linestyle row 4: " + error.to_string())
  }
  // String 'dashdot'
  try {
    // Match native controlled stale=False input; this is not a draw.
    line.mark_drawn()
    line_style_source_state(
      line,
      axes,
      "-.",
      false,
      4611686018427387904UL.reinterpret_as_double(),
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
    )
    line_style_source_pattern(
      line,
      0UL.reinterpret_as_double(),
      Some([
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ]),
      0UL.reinterpret_as_double(),
      Some([
        4623395377458551194UL.reinterpret_as_double(),
        4614388178203810202UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4614388178203810202UL.reinterpret_as_double(),
      ]),
    )
    line_style_source_rc(
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    line.set_linestyle("dashdot")
    line_style_source_state(
      line,
      axes,
      "-.",
      true,
      4611686018427387904UL.reinterpret_as_double(),
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
    )
    line_style_source_pattern(
      line,
      0UL.reinterpret_as_double(),
      Some([
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ]),
      0UL.reinterpret_as_double(),
      Some([
        4623395377458551194UL.reinterpret_as_double(),
        4614388178203810202UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4614388178203810202UL.reinterpret_as_double(),
      ]),
    )
    line_style_source_rc(
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    assert_eq(line.get_color(), "red")
  } catch {
    error => fail("original String linestyle row 5: " + error.to_string())
  }
  // String ':'
  try {
    // Match native controlled stale=False input; this is not a draw.
    line.mark_drawn()
    line_style_source_state(
      line,
      axes,
      "-.",
      false,
      4611686018427387904UL.reinterpret_as_double(),
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
    )
    line_style_source_pattern(
      line,
      0UL.reinterpret_as_double(),
      Some([
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ]),
      0UL.reinterpret_as_double(),
      Some([
        4623395377458551194UL.reinterpret_as_double(),
        4614388178203810202UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        4614388178203810202UL.reinterpret_as_double(),
      ]),
    )
    line_style_source_rc(
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    line.set_linestyle(":")
    line_style_source_state(
      line,
      axes,
      ":",
      true,
      4611686018427387904UL.reinterpret_as_double(),
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
    )
    line_style_source_pattern(
      line,
      0UL.reinterpret_as_double(),
      Some([
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ]),
      0UL.reinterpret_as_double(),
      Some([
        4611686018427387904UL.reinterpret_as_double(),
        4614613358185178726UL.reinterpret_as_double(),
      ]),
    )
    line_style_source_rc(
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    assert_eq(line.get_color(), "red")
  } catch {
    error => fail("original String linestyle row 6: " + error.to_string())
  }
  // String 'dotted'
  try {
    // Match native controlled stale=False input; this is not a draw.
    line.mark_drawn()
    line_style_source_state(
      line,
      axes,
      ":",
      false,
      4611686018427387904UL.reinterpret_as_double(),
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
    )
    line_style_source_pattern(
      line,
      0UL.reinterpret_as_double(),
      Some([
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ]),
      0UL.reinterpret_as_double(),
      Some([
        4611686018427387904UL.reinterpret_as_double(),
        4614613358185178726UL.reinterpret_as_double(),
      ]),
    )
    line_style_source_rc(
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    line.set_linestyle("dotted")
    line_style_source_state(
      line,
      axes,
      ":",
      true,
      4611686018427387904UL.reinterpret_as_double(),
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
    )
    line_style_source_pattern(
      line,
      0UL.reinterpret_as_double(),
      Some([
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ]),
      0UL.reinterpret_as_double(),
      Some([
        4611686018427387904UL.reinterpret_as_double(),
        4614613358185178726UL.reinterpret_as_double(),
      ]),
    )
    line_style_source_rc(
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    assert_eq(line.get_color(), "red")
  } catch {
    error => fail("original String linestyle row 7: " + error.to_string())
  }
  // String 'none'
  try {
    // Match native controlled stale=False input; this is not a draw.
    line.mark_drawn()
    line_style_source_state(
      line,
      axes,
      ":",
      false,
      4611686018427387904UL.reinterpret_as_double(),
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
    )
    line_style_source_pattern(
      line,
      0UL.reinterpret_as_double(),
      Some([
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ]),
      0UL.reinterpret_as_double(),
      Some([
        4611686018427387904UL.reinterpret_as_double(),
        4614613358185178726UL.reinterpret_as_double(),
      ]),
    )
    line_style_source_rc(
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    line.set_linestyle("none")
    line_style_source_state(
      line,
      axes,
      "None",
      true,
      4611686018427387904UL.reinterpret_as_double(),
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
    )
    line_style_source_pattern(
      line,
      0UL.reinterpret_as_double(),
      None,
      0UL.reinterpret_as_double(),
      None,
    )
    line_style_source_rc(
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    assert_eq(line.get_color(), "red")
  } catch {
    error => fail("original String linestyle row 8: " + error.to_string())
  }
  // String 'None'
  try {
    // Match native controlled stale=False input; this is not a draw.
    line.mark_drawn()
    line_style_source_state(
      line,
      axes,
      "None",
      false,
      4611686018427387904UL.reinterpret_as_double(),
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
    )
    line_style_source_pattern(
      line,
      0UL.reinterpret_as_double(),
      None,
      0UL.reinterpret_as_double(),
      None,
    )
    line_style_source_rc(
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    line.set_linestyle("None")
    line_style_source_state(
      line,
      axes,
      "None",
      true,
      4611686018427387904UL.reinterpret_as_double(),
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
    )
    line_style_source_pattern(
      line,
      0UL.reinterpret_as_double(),
      None,
      0UL.reinterpret_as_double(),
      None,
    )
    line_style_source_rc(
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    assert_eq(line.get_color(), "red")
  } catch {
    error => fail("original String linestyle row 9: " + error.to_string())
  }
  // String ''
  try {
    // Match native controlled stale=False input; this is not a draw.
    line.mark_drawn()
    line_style_source_state(
      line,
      axes,
      "None",
      false,
      4611686018427387904UL.reinterpret_as_double(),
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
    )
    line_style_source_pattern(
      line,
      0UL.reinterpret_as_double(),
      None,
      0UL.reinterpret_as_double(),
      None,
    )
    line_style_source_rc(
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    line.set_linestyle("")
    line_style_source_state(
      line,
      axes,
      "None",
      true,
      4611686018427387904UL.reinterpret_as_double(),
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
    )
    line_style_source_pattern(
      line,
      0UL.reinterpret_as_double(),
      None,
      0UL.reinterpret_as_double(),
      None,
    )
    line_style_source_rc(
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    assert_eq(line.get_color(), "red")
  } catch {
    error => fail("original String linestyle row 10: " + error.to_string())
  }
  // String ' '
  try {
    // Match native controlled stale=False input; this is not a draw.
    line.mark_drawn()
    line_style_source_state(
      line,
      axes,
      "None",
      false,
      4611686018427387904UL.reinterpret_as_double(),
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
    )
    line_style_source_pattern(
      line,
      0UL.reinterpret_as_double(),
      None,
      0UL.reinterpret_as_double(),
      None,
    )
    line_style_source_rc(
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    line.set_linestyle(" ")
    line_style_source_state(
      line,
      axes,
      "None",
      true,
      4611686018427387904UL.reinterpret_as_double(),
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
    )
    line_style_source_pattern(
      line,
      0UL.reinterpret_as_double(),
      None,
      0UL.reinterpret_as_double(),
      None,
    )
    line_style_source_rc(
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    assert_eq(line.get_color(), "red")
  } catch {
    error => fail("original String linestyle row 11: " + error.to_string())
  }
  // String 'none'
  try {
    // Match native controlled stale=False input; this is not a draw.
    line.mark_drawn()
    line_style_source_state(
      line,
      axes,
      "None",
      false,
      4611686018427387904UL.reinterpret_as_double(),
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
    )
    line_style_source_pattern(
      line,
      0UL.reinterpret_as_double(),
      None,
      0UL.reinterpret_as_double(),
      None,
    )
    line_style_source_rc(
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    line.set_linestyle("none")
    line_style_source_state(
      line,
      axes,
      "None",
      true,
      4611686018427387904UL.reinterpret_as_double(),
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
    )
    line_style_source_pattern(
      line,
      0UL.reinterpret_as_double(),
      None,
      0UL.reinterpret_as_double(),
      None,
    )
    line_style_source_rc(
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    assert_eq(line.get_color(), "red")
  } catch {
    error => fail("original String linestyle row 12: " + error.to_string())
  }
  // String 'NONE'
  try {
    // Match native controlled stale=False input; this is not a draw.
    line.mark_drawn()
    line_style_source_state(
      line,
      axes,
      "None",
      false,
      4611686018427387904UL.reinterpret_as_double(),
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
    )
    line_style_source_pattern(
      line,
      0UL.reinterpret_as_double(),
      None,
      0UL.reinterpret_as_double(),
      None,
    )
    line_style_source_rc(
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    assert_true(
      try {
        line.set_linestyle("NONE")
        false
      } catch {
        @core.DataError::InvalidTicks(message~) =>
          message == "ValueError: 'NONE' is not a valid value for ls."
        _ => false
      },
    )
    line_style_source_state(
      line,
      axes,
      "None",
      false,
      4611686018427387904UL.reinterpret_as_double(),
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
    )
    line_style_source_pattern(
      line,
      0UL.reinterpret_as_double(),
      None,
      0UL.reinterpret_as_double(),
      None,
    )
    line_style_source_rc(
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    assert_eq(line.get_color(), "red")
  } catch {
    error => fail("original String linestyle row 13: " + error.to_string())
  }
  // String 'Solid'
  try {
    // Match native controlled stale=False input; this is not a draw.
    line.mark_drawn()
    line_style_source_state(
      line,
      axes,
      "None",
      false,
      4611686018427387904UL.reinterpret_as_double(),
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
    )
    line_style_source_pattern(
      line,
      0UL.reinterpret_as_double(),
      None,
      0UL.reinterpret_as_double(),
      None,
    )
    line_style_source_rc(
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    assert_true(
      try {
        line.set_linestyle("Solid")
        false
      } catch {
        @core.DataError::InvalidTicks(message~) =>
          message ==
          "ValueError: 'Solid' is not a valid value for ls. Did you mean: 'solid'?"
        _ => false
      },
    )
    line_style_source_state(
      line,
      axes,
      "None",
      false,
      4611686018427387904UL.reinterpret_as_double(),
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
    )
    line_style_source_pattern(
      line,
      0UL.reinterpret_as_double(),
      None,
      0UL.reinterpret_as_double(),
      None,
    )
    line_style_source_rc(
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    assert_eq(line.get_color(), "red")
  } catch {
    error => fail("original String linestyle row 14: " + error.to_string())
  }
  // String ' dashed '
  try {
    // Match native controlled stale=False input; this is not a draw.
    line.mark_drawn()
    line_style_source_state(
      line,
      axes,
      "None",
      false,
      4611686018427387904UL.reinterpret_as_double(),
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
    )
    line_style_source_pattern(
      line,
      0UL.reinterpret_as_double(),
      None,
      0UL.reinterpret_as_double(),
      None,
    )
    line_style_source_rc(
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    assert_true(
      try {
        line.set_linestyle(" dashed ")
        false
      } catch {
        @core.DataError::InvalidTicks(message~) =>
          message ==
          "ValueError: ' dashed ' is not a valid value for ls. Did you mean one of: 'dashed', 'dashdot'?"
        _ => false
      },
    )
    line_style_source_state(
      line,
      axes,
      "None",
      false,
      4611686018427387904UL.reinterpret_as_double(),
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
    )
    line_style_source_pattern(
      line,
      0UL.reinterpret_as_double(),
      None,
      0UL.reinterpret_as_double(),
      None,
    )
    line_style_source_rc(
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    assert_eq(line.get_color(), "red")
  } catch {
    error => fail("original String linestyle row 15: " + error.to_string())
  }
  // String '-- '
  try {
    // Match native controlled stale=False input; this is not a draw.
    line.mark_drawn()
    line_style_source_state(
      line,
      axes,
      "None",
      false,
      4611686018427387904UL.reinterpret_as_double(),
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
    )
    line_style_source_pattern(
      line,
      0UL.reinterpret_as_double(),
      None,
      0UL.reinterpret_as_double(),
      None,
    )
    line_style_source_rc(
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    assert_true(
      try {
        line.set_linestyle("-- ")
        false
      } catch {
        @core.DataError::InvalidTicks(message~) =>
          message ==
          "ValueError: '-- ' is not a valid value for ls. Did you mean one of: '--', '-', ' '?"
        _ => false
      },
    )
    line_style_source_state(
      line,
      axes,
      "None",
      false,
      4611686018427387904UL.reinterpret_as_double(),
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
    )
    line_style_source_pattern(
      line,
      0UL.reinterpret_as_double(),
      None,
      0UL.reinterpret_as_double(),
      None,
    )
    line_style_source_rc(
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    assert_eq(line.get_color(), "red")
  } catch {
    error => fail("original String linestyle row 16: " + error.to_string())
  }
  // String '..'
  try {
    // Match native controlled stale=False input; this is not a draw.
    line.mark_drawn()
    line_style_source_state(
      line,
      axes,
      "None",
      false,
      4611686018427387904UL.reinterpret_as_double(),
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
    )
    line_style_source_pattern(
      line,
      0UL.reinterpret_as_double(),
      None,
      0UL.reinterpret_as_double(),
      None,
    )
    line_style_source_rc(
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    assert_true(
      try {
        line.set_linestyle("..")
        false
      } catch {
        @core.DataError::InvalidTicks(message~) =>
          message ==
          "ValueError: '..' is not a valid value for ls. Did you mean: '-.'?"
        _ => false
      },
    )
    line_style_source_state(
      line,
      axes,
      "None",
      false,
      4611686018427387904UL.reinterpret_as_double(),
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
    )
    line_style_source_pattern(
      line,
      0UL.reinterpret_as_double(),
      None,
      0UL.reinterpret_as_double(),
      None,
    )
    line_style_source_rc(
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    assert_eq(line.get_color(), "red")
  } catch {
    error => fail("original String linestyle row 17: " + error.to_string())
  }
}

///|
test "original String linestyle aliases and atomic errors" {
  line_style_source_strings()
}

///|
fn line_style_source_history() -> Unit raise {
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
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([0.0, 1.0]),
    LineData::Numeric([10.0, 20.0]),
    color="red",
  )
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  line.set_linestyle("dashed")
  // live pattern change alone keeps captured dashes
  try {
    // Match native controlled stale=False input; this is not a draw.
    line.mark_drawn()
    line_style_source_state(
      line,
      axes,
      "--",
      false,
      4611686018427387904UL.reinterpret_as_double(),
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
    )
    line_style_source_pattern(
      line,
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
    )
    line_style_source_rc(
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    @config.set_lines_dashed_pattern([2.0, 4.0])
    line_style_source_state(
      line,
      axes,
      "--",
      false,
      4611686018427387904UL.reinterpret_as_double(),
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
    )
    line_style_source_pattern(
      line,
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
    )
    line_style_source_rc(
      true,
      [
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    assert_eq(line.get_color(), "red")
  } catch {
    error => fail("original dash history row 0: " + error.to_string())
  }
  // same linewidth does not recapture pattern
  try {
    // Match native controlled stale=False input; this is not a draw.
    line.mark_drawn()
    line_style_source_state(
      line,
      axes,
      "--",
      false,
      4611686018427387904UL.reinterpret_as_double(),
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
    )
    line_style_source_pattern(
      line,
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
    )
    line_style_source_rc(
      true,
      [
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    line.set_linewidth(2.0)
    line_style_source_state(
      line,
      axes,
      "--",
      false,
      4611686018427387904UL.reinterpret_as_double(),
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
    )
    line_style_source_pattern(
      line,
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
    )
    line_style_source_rc(
      true,
      [
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    assert_eq(line.get_color(), "red")
  } catch {
    error => fail("original dash history row 1: " + error.to_string())
  }
  // same linestyle recaptures pattern and marks stale
  try {
    // Match native controlled stale=False input; this is not a draw.
    line.mark_drawn()
    line_style_source_state(
      line,
      axes,
      "--",
      false,
      4611686018427387904UL.reinterpret_as_double(),
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
    )
    line_style_source_pattern(
      line,
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
    )
    line_style_source_rc(
      true,
      [
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    line.set_linestyle("dashed")
    line_style_source_state(
      line,
      axes,
      "--",
      true,
      4611686018427387904UL.reinterpret_as_double(),
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
    )
    line_style_source_pattern(
      line,
      0UL.reinterpret_as_double(),
      Some([
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ]),
      0UL.reinterpret_as_double(),
      Some([
        4616189618054758400UL.reinterpret_as_double(),
        4620693217682128896UL.reinterpret_as_double(),
      ]),
    )
    line_style_source_rc(
      true,
      [
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    assert_eq(line.get_color(), "red")
  } catch {
    error => fail("original dash history row 2: " + error.to_string())
  }
  // live scale False alone leaves captured scaled dashes
  try {
    // Match native controlled stale=False input; this is not a draw.
    line.mark_drawn()
    line_style_source_state(
      line,
      axes,
      "--",
      false,
      4611686018427387904UL.reinterpret_as_double(),
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
    )
    line_style_source_pattern(
      line,
      0UL.reinterpret_as_double(),
      Some([
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ]),
      0UL.reinterpret_as_double(),
      Some([
        4616189618054758400UL.reinterpret_as_double(),
        4620693217682128896UL.reinterpret_as_double(),
      ]),
    )
    line_style_source_rc(
      true,
      [
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    @config.set_lines_scale_dashes(false)
    line_style_source_state(
      line,
      axes,
      "--",
      false,
      4611686018427387904UL.reinterpret_as_double(),
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
    )
    line_style_source_pattern(
      line,
      0UL.reinterpret_as_double(),
      Some([
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ]),
      0UL.reinterpret_as_double(),
      Some([
        4616189618054758400UL.reinterpret_as_double(),
        4620693217682128896UL.reinterpret_as_double(),
      ]),
    )
    line_style_source_rc(
      false,
      [
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    assert_eq(line.get_color(), "red")
  } catch {
    error => fail("original dash history row 3: " + error.to_string())
  }
  // same linewidth reads live scale False
  try {
    // Match native controlled stale=False input; this is not a draw.
    line.mark_drawn()
    line_style_source_state(
      line,
      axes,
      "--",
      false,
      4611686018427387904UL.reinterpret_as_double(),
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
    )
    line_style_source_pattern(
      line,
      0UL.reinterpret_as_double(),
      Some([
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ]),
      0UL.reinterpret_as_double(),
      Some([
        4616189618054758400UL.reinterpret_as_double(),
        4620693217682128896UL.reinterpret_as_double(),
      ]),
    )
    line_style_source_rc(
      false,
      [
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    line.set_linewidth(2.0)
    line_style_source_state(
      line,
      axes,
      "--",
      false,
      4611686018427387904UL.reinterpret_as_double(),
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
    )
    line_style_source_pattern(
      line,
      0UL.reinterpret_as_double(),
      Some([
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ]),
      0UL.reinterpret_as_double(),
      Some([
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ]),
    )
    line_style_source_rc(
      false,
      [
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    assert_eq(line.get_color(), "red")
  } catch {
    error => fail("original dash history row 4: " + error.to_string())
  }
  // same linewidth reads live scale True
  try {
    // Match native controlled stale=False input; this is not a draw.
    line.mark_drawn()
    line_style_source_state(
      line,
      axes,
      "--",
      false,
      4611686018427387904UL.reinterpret_as_double(),
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
    )
    line_style_source_pattern(
      line,
      0UL.reinterpret_as_double(),
      Some([
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ]),
      0UL.reinterpret_as_double(),
      Some([
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ]),
    )
    line_style_source_rc(
      false,
      [
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    @config.set_lines_scale_dashes(true)
    line.set_linewidth(2.0)
    line_style_source_state(
      line,
      axes,
      "--",
      false,
      4611686018427387904UL.reinterpret_as_double(),
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
    )
    line_style_source_pattern(
      line,
      0UL.reinterpret_as_double(),
      Some([
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ]),
      0UL.reinterpret_as_double(),
      Some([
        4616189618054758400UL.reinterpret_as_double(),
        4620693217682128896UL.reinterpret_as_double(),
      ]),
    )
    line_style_source_rc(
      true,
      [
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    assert_eq(line.get_color(), "red")
  } catch {
    error => fail("original dash history row 5: " + error.to_string())
  }
  // zero linewidth
  try {
    // Match native controlled stale=False input; this is not a draw.
    line.mark_drawn()
    line_style_source_state(
      line,
      axes,
      "--",
      false,
      4611686018427387904UL.reinterpret_as_double(),
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
    )
    line_style_source_pattern(
      line,
      0UL.reinterpret_as_double(),
      Some([
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ]),
      0UL.reinterpret_as_double(),
      Some([
        4616189618054758400UL.reinterpret_as_double(),
        4620693217682128896UL.reinterpret_as_double(),
      ]),
    )
    line_style_source_rc(
      true,
      [
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    line.set_linewidth(0.0)
    line_style_source_state(
      line,
      axes,
      "--",
      true,
      0UL.reinterpret_as_double(),
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
    )
    line_style_source_pattern(
      line,
      0UL.reinterpret_as_double(),
      Some([
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ]),
      0UL.reinterpret_as_double(),
      Some([0UL.reinterpret_as_double(), 0UL.reinterpret_as_double()]),
    )
    line_style_source_rc(
      true,
      [
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    assert_eq(line.get_color(), "red")
  } catch {
    error => fail("original dash history row 6: " + error.to_string())
  }
  // negative zero linewidth
  try {
    // Match native controlled stale=False input; this is not a draw.
    line.mark_drawn()
    line_style_source_state(
      line,
      axes,
      "--",
      false,
      0UL.reinterpret_as_double(),
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
    )
    line_style_source_pattern(
      line,
      0UL.reinterpret_as_double(),
      Some([
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ]),
      0UL.reinterpret_as_double(),
      Some([0UL.reinterpret_as_double(), 0UL.reinterpret_as_double()]),
    )
    line_style_source_rc(
      true,
      [
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    line.set_linewidth(-0.0)
    line_style_source_state(
      line,
      axes,
      "--",
      false,
      9223372036854775808UL.reinterpret_as_double(),
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
    )
    line_style_source_pattern(
      line,
      0UL.reinterpret_as_double(),
      Some([
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ]),
      9223372036854775808UL.reinterpret_as_double(),
      Some([
        9223372036854775808UL.reinterpret_as_double(),
        9223372036854775808UL.reinterpret_as_double(),
      ]),
    )
    line_style_source_rc(
      true,
      [
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    assert_eq(line.get_color(), "red")
  } catch {
    error => fail("original dash history row 7: " + error.to_string())
  }
  // negative linewidth
  try {
    // Match native controlled stale=False input; this is not a draw.
    line.mark_drawn()
    line_style_source_state(
      line,
      axes,
      "--",
      false,
      9223372036854775808UL.reinterpret_as_double(),
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
    )
    line_style_source_pattern(
      line,
      0UL.reinterpret_as_double(),
      Some([
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ]),
      9223372036854775808UL.reinterpret_as_double(),
      Some([
        9223372036854775808UL.reinterpret_as_double(),
        9223372036854775808UL.reinterpret_as_double(),
      ]),
    )
    line_style_source_rc(
      true,
      [
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    line.set_linewidth(-2.0)
    line_style_source_state(
      line,
      axes,
      "--",
      true,
      13835058055282163712UL.reinterpret_as_double(),
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
    )
    line_style_source_pattern(
      line,
      0UL.reinterpret_as_double(),
      Some([
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ]),
      9223372036854775808UL.reinterpret_as_double(),
      Some([
        13839561654909534208UL.reinterpret_as_double(),
        13844065254536904704UL.reinterpret_as_double(),
      ]),
    )
    line_style_source_rc(
      true,
      [
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    assert_eq(line.get_color(), "red")
  } catch {
    error => fail("original dash history row 8: " + error.to_string())
  }
  // NaN linewidth
  try {
    // Match native controlled stale=False input; this is not a draw.
    line.mark_drawn()
    line_style_source_state(
      line,
      axes,
      "--",
      false,
      13835058055282163712UL.reinterpret_as_double(),
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
    )
    line_style_source_pattern(
      line,
      0UL.reinterpret_as_double(),
      Some([
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ]),
      9223372036854775808UL.reinterpret_as_double(),
      Some([
        13839561654909534208UL.reinterpret_as_double(),
        13844065254536904704UL.reinterpret_as_double(),
      ]),
    )
    line_style_source_rc(
      true,
      [
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    line.set_linewidth(0.0 / 0.0)
    line_style_source_state(
      line,
      axes,
      "--",
      true,
      0.0 / 0.0,
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
    )
    line_style_source_pattern(
      line,
      0UL.reinterpret_as_double(),
      Some([
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ]),
      0.0 / 0.0,
      Some([0.0 / 0.0, 0.0 / 0.0]),
    )
    line_style_source_rc(
      true,
      [
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    assert_eq(line.get_color(), "red")
  } catch {
    error => fail("original dash history row 9: " + error.to_string())
  }
  // infinite linewidth
  try {
    // Match native controlled stale=False input; this is not a draw.
    line.mark_drawn()
    line_style_source_state(
      line,
      axes,
      "--",
      false,
      0.0 / 0.0,
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
    )
    line_style_source_pattern(
      line,
      0UL.reinterpret_as_double(),
      Some([
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ]),
      0.0 / 0.0,
      Some([0.0 / 0.0, 0.0 / 0.0]),
    )
    line_style_source_rc(
      true,
      [
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    line.set_linewidth(1.0 / 0.0)
    line_style_source_state(
      line,
      axes,
      "--",
      true,
      1.0 / 0.0,
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
    )
    line_style_source_pattern(
      line,
      0UL.reinterpret_as_double(),
      Some([
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ]),
      0.0 / 0.0,
      Some([1.0 / 0.0, 1.0 / 0.0]),
    )
    line_style_source_rc(
      true,
      [
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    assert_eq(line.get_color(), "red")
  } catch {
    error => fail("original dash history row 10: " + error.to_string())
  }
  // repeated infinite linewidth
  try {
    // Match native controlled stale=False input; this is not a draw.
    line.mark_drawn()
    line_style_source_state(
      line,
      axes,
      "--",
      false,
      1.0 / 0.0,
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
    )
    line_style_source_pattern(
      line,
      0UL.reinterpret_as_double(),
      Some([
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ]),
      0.0 / 0.0,
      Some([1.0 / 0.0, 1.0 / 0.0]),
    )
    line_style_source_rc(
      true,
      [
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    line.set_linewidth(1.0 / 0.0)
    line_style_source_state(
      line,
      axes,
      "--",
      false,
      1.0 / 0.0,
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
    )
    line_style_source_pattern(
      line,
      0UL.reinterpret_as_double(),
      Some([
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ]),
      0.0 / 0.0,
      Some([1.0 / 0.0, 1.0 / 0.0]),
    )
    line_style_source_rc(
      true,
      [
        4611686018427387904UL.reinterpret_as_double(),
        4616189618054758400UL.reinterpret_as_double(),
      ],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    assert_eq(line.get_color(), "red")
  } catch {
    error => fail("original dash history row 11: " + error.to_string())
  }
}

///|
test "original captured dash history and live scaling" {
  line_style_source_history()
}

///|
fn line_style_source_rc_0() -> Unit raise {
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
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([0.0, 1.0]),
    LineData::Numeric([10.0, 20.0]),
    color="red",
  )
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  // real validated rc list and String dashed
  try {
    // Match native controlled stale=False input; this is not a draw.
    line.mark_drawn()
    line_style_source_state(
      line,
      axes,
      "-",
      false,
      4611686018427387904UL.reinterpret_as_double(),
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
    )
    line_style_source_pattern(
      line,
      0UL.reinterpret_as_double(),
      None,
      0UL.reinterpret_as_double(),
      None,
    )
    line_style_source_rc(
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    @config.set_lines_dashed_pattern([])
    line.set_linestyle("dashed")
    line_style_source_state(
      line,
      axes,
      "--",
      true,
      4611686018427387904UL.reinterpret_as_double(),
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
    )
    line_style_source_pattern(
      line,
      0UL.reinterpret_as_double(),
      Some([]),
      0UL.reinterpret_as_double(),
      Some([]),
    )
    line_style_source_rc(
      true,
      [],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    assert_eq(line.get_color(), "red")
  } catch {
    error => fail("original rc pattern row 0: " + error.to_string())
  }
}

///|
fn line_style_source_rc_1() -> Unit raise {
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
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([0.0, 1.0]),
    LineData::Numeric([10.0, 20.0]),
    color="red",
  )
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  // real validated rc list and String dashed
  try {
    // Match native controlled stale=False input; this is not a draw.
    line.mark_drawn()
    line_style_source_state(
      line,
      axes,
      "-",
      false,
      4611686018427387904UL.reinterpret_as_double(),
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
    )
    line_style_source_pattern(
      line,
      0UL.reinterpret_as_double(),
      None,
      0UL.reinterpret_as_double(),
      None,
    )
    line_style_source_rc(
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    @config.set_lines_dashed_pattern([
      13835058055282163712UL.reinterpret_as_double(),
      13830554455654793216UL.reinterpret_as_double(),
    ])
    line.set_linestyle("dashed")
    line_style_source_state(
      line,
      axes,
      "--",
      true,
      4611686018427387904UL.reinterpret_as_double(),
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
    )
    line_style_source_pattern(
      line,
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
    )
    line_style_source_rc(
      true,
      [
        13835058055282163712UL.reinterpret_as_double(),
        13830554455654793216UL.reinterpret_as_double(),
      ],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    assert_eq(line.get_color(), "red")
  } catch {
    error => fail("original rc pattern row 1: " + error.to_string())
  }
}

///|
fn line_style_source_rc_2() -> Unit raise {
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
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([0.0, 1.0]),
    LineData::Numeric([10.0, 20.0]),
    color="red",
  )
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  // real validated rc list and String dashed
  try {
    // Match native controlled stale=False input; this is not a draw.
    line.mark_drawn()
    line_style_source_state(
      line,
      axes,
      "-",
      false,
      4611686018427387904UL.reinterpret_as_double(),
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
    )
    line_style_source_pattern(
      line,
      0UL.reinterpret_as_double(),
      None,
      0UL.reinterpret_as_double(),
      None,
    )
    line_style_source_rc(
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    @config.set_lines_dashed_pattern([
      0UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
    ])
    line.set_linestyle("dashed")
    line_style_source_state(
      line,
      axes,
      "--",
      true,
      4611686018427387904UL.reinterpret_as_double(),
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
    )
    line_style_source_pattern(
      line,
      0UL.reinterpret_as_double(),
      Some([0UL.reinterpret_as_double(), 0UL.reinterpret_as_double()]),
      0UL.reinterpret_as_double(),
      Some([0UL.reinterpret_as_double(), 0UL.reinterpret_as_double()]),
    )
    line_style_source_rc(
      true,
      [0UL.reinterpret_as_double(), 0UL.reinterpret_as_double()],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    assert_eq(line.get_color(), "red")
  } catch {
    error => fail("original rc pattern row 2: " + error.to_string())
  }
}

///|
fn line_style_source_rc_3() -> Unit raise {
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
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([0.0, 1.0]),
    LineData::Numeric([10.0, 20.0]),
    color="red",
  )
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  // real validated rc list and String dashed
  try {
    // Match native controlled stale=False input; this is not a draw.
    line.mark_drawn()
    line_style_source_state(
      line,
      axes,
      "-",
      false,
      4611686018427387904UL.reinterpret_as_double(),
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
    )
    line_style_source_pattern(
      line,
      0UL.reinterpret_as_double(),
      None,
      0UL.reinterpret_as_double(),
      None,
    )
    line_style_source_rc(
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    @config.set_lines_dashed_pattern([
      4607182418800017408UL.reinterpret_as_double(),
      0.0 / 0.0,
    ])
    line.set_linestyle("dashed")
    line_style_source_state(
      line,
      axes,
      "--",
      true,
      4611686018427387904UL.reinterpret_as_double(),
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
    )
    line_style_source_pattern(
      line,
      0.0 / 0.0,
      Some([4607182418800017408UL.reinterpret_as_double(), 0.0 / 0.0]),
      0.0 / 0.0,
      Some([4611686018427387904UL.reinterpret_as_double(), 0.0 / 0.0]),
    )
    line_style_source_rc(
      true,
      [4607182418800017408UL.reinterpret_as_double(), 0.0 / 0.0],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    assert_eq(line.get_color(), "red")
  } catch {
    error => fail("original rc pattern row 3: " + error.to_string())
  }
}

///|
fn line_style_source_rc_4() -> Unit raise {
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
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([0.0, 1.0]),
    LineData::Numeric([10.0, 20.0]),
    color="red",
  )
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  // real validated rc list and String dashed
  try {
    // Match native controlled stale=False input; this is not a draw.
    line.mark_drawn()
    line_style_source_state(
      line,
      axes,
      "-",
      false,
      4611686018427387904UL.reinterpret_as_double(),
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
    )
    line_style_source_pattern(
      line,
      0UL.reinterpret_as_double(),
      None,
      0UL.reinterpret_as_double(),
      None,
    )
    line_style_source_rc(
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    @config.set_lines_dashed_pattern([
      4607182418800017408UL.reinterpret_as_double(),
      1.0 / 0.0,
    ])
    line.set_linestyle("dashed")
    line_style_source_state(
      line,
      axes,
      "--",
      true,
      4611686018427387904UL.reinterpret_as_double(),
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
    )
    line_style_source_pattern(
      line,
      0UL.reinterpret_as_double(),
      Some([4607182418800017408UL.reinterpret_as_double(), 1.0 / 0.0]),
      0UL.reinterpret_as_double(),
      Some([4611686018427387904UL.reinterpret_as_double(), 1.0 / 0.0]),
    )
    line_style_source_rc(
      true,
      [4607182418800017408UL.reinterpret_as_double(), 1.0 / 0.0],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    assert_eq(line.get_color(), "red")
  } catch {
    error => fail("original rc pattern row 4: " + error.to_string())
  }
}

///|
fn line_style_source_rc_5() -> Unit raise {
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
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([0.0, 1.0]),
    LineData::Numeric([10.0, 20.0]),
    color="red",
  )
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  // real validated rc list and String dashed
  try {
    // Match native controlled stale=False input; this is not a draw.
    line.mark_drawn()
    line_style_source_state(
      line,
      axes,
      "-",
      false,
      4611686018427387904UL.reinterpret_as_double(),
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
    )
    line_style_source_pattern(
      line,
      0UL.reinterpret_as_double(),
      None,
      0UL.reinterpret_as_double(),
      None,
    )
    line_style_source_rc(
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    @config.set_lines_dashed_pattern([
      4607182418800017408UL.reinterpret_as_double(),
      -1.0 / 0.0,
    ])
    line.set_linestyle("dashed")
    line_style_source_state(
      line,
      axes,
      "--",
      true,
      4611686018427387904UL.reinterpret_as_double(),
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
    )
    line_style_source_pattern(
      line,
      9223372036854775808UL.reinterpret_as_double(),
      Some([4607182418800017408UL.reinterpret_as_double(), -1.0 / 0.0]),
      9223372036854775808UL.reinterpret_as_double(),
      Some([4611686018427387904UL.reinterpret_as_double(), -1.0 / 0.0]),
    )
    line_style_source_rc(
      true,
      [4607182418800017408UL.reinterpret_as_double(), -1.0 / 0.0],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    assert_eq(line.get_color(), "red")
  } catch {
    error => fail("original rc pattern row 5: " + error.to_string())
  }
}

///|
fn line_style_source_sum_0() -> Unit raise {
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
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([0.0, 1.0]),
    LineData::Numeric([10.0, 20.0]),
    color="red",
  )
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  // actual String dashed with compensated builtin sum
  try {
    // Match native controlled stale=False input; this is not a draw.
    line.mark_drawn()
    line_style_source_state(
      line,
      axes,
      "-",
      false,
      4611686018427387904UL.reinterpret_as_double(),
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
    )
    line_style_source_pattern(
      line,
      0UL.reinterpret_as_double(),
      None,
      0UL.reinterpret_as_double(),
      None,
    )
    line_style_source_rc(
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    @config.set_lines_dashed_pattern([
      4846369599423283200UL.reinterpret_as_double(),
      13830554455654793216UL.reinterpret_as_double(),
      14069741636278059008UL.reinterpret_as_double(),
    ])
    line.set_linestyle("dashed")
    line_style_source_state(
      line,
      axes,
      "--",
      true,
      4611686018427387904UL.reinterpret_as_double(),
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
    )
    line_style_source_pattern(
      line,
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
    )
    line_style_source_rc(
      true,
      [
        4846369599423283200UL.reinterpret_as_double(),
        13830554455654793216UL.reinterpret_as_double(),
        14069741636278059008UL.reinterpret_as_double(),
      ],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    assert_eq(line.get_color(), "red")
  } catch {
    error => fail("original sum pattern row 0: " + error.to_string())
  }
  line_style_source_double(
    line_style_float_sum([
      4846369599423283200UL.reinterpret_as_double(),
      13830554455654793216UL.reinterpret_as_double(),
      14069741636278059008UL.reinterpret_as_double(),
    ]),
    13830554455654793216UL.reinterpret_as_double(),
  )
}

///|
fn line_style_source_sum_1() -> Unit raise {
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
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([0.0, 1.0]),
    LineData::Numeric([10.0, 20.0]),
    color="red",
  )
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  // actual String dashed with compensated builtin sum
  try {
    // Match native controlled stale=False input; this is not a draw.
    line.mark_drawn()
    line_style_source_state(
      line,
      axes,
      "-",
      false,
      4611686018427387904UL.reinterpret_as_double(),
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
    )
    line_style_source_pattern(
      line,
      0UL.reinterpret_as_double(),
      None,
      0UL.reinterpret_as_double(),
      None,
    )
    line_style_source_rc(
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    @config.set_lines_dashed_pattern([
      4846369599423283200UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      14069741636278059008UL.reinterpret_as_double(),
    ])
    line.set_linestyle("dashed")
    line_style_source_state(
      line,
      axes,
      "--",
      true,
      4611686018427387904UL.reinterpret_as_double(),
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
    )
    line_style_source_pattern(
      line,
      0UL.reinterpret_as_double(),
      Some([
        4846369599423283200UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        14069741636278059008UL.reinterpret_as_double(),
      ]),
      0UL.reinterpret_as_double(),
      Some([
        4850873199050653696UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        14074245235905429504UL.reinterpret_as_double(),
      ]),
    )
    line_style_source_rc(
      true,
      [
        4846369599423283200UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        14069741636278059008UL.reinterpret_as_double(),
      ],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    assert_eq(line.get_color(), "red")
  } catch {
    error => fail("original sum pattern row 1: " + error.to_string())
  }
  line_style_source_double(
    line_style_float_sum([
      4846369599423283200UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      14069741636278059008UL.reinterpret_as_double(),
    ]),
    4607182418800017408UL.reinterpret_as_double(),
  )
}

///|
fn line_style_source_sum_2() -> Unit raise {
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
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([0.0, 1.0]),
    LineData::Numeric([10.0, 20.0]),
    color="red",
  )
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  // actual String dashed with compensated builtin sum
  try {
    // Match native controlled stale=False input; this is not a draw.
    line.mark_drawn()
    line_style_source_state(
      line,
      axes,
      "-",
      false,
      4611686018427387904UL.reinterpret_as_double(),
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
    )
    line_style_source_pattern(
      line,
      0UL.reinterpret_as_double(),
      None,
      0UL.reinterpret_as_double(),
      None,
    )
    line_style_source_rc(
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    @config.set_lines_dashed_pattern([
      4846369599423283200UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      14069741636278059008UL.reinterpret_as_double(),
      13830554455654793216UL.reinterpret_as_double(),
    ])
    line.set_linestyle("dashed")
    line_style_source_state(
      line,
      axes,
      "--",
      true,
      4611686018427387904UL.reinterpret_as_double(),
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
    )
    line_style_source_pattern(
      line,
      0UL.reinterpret_as_double(),
      Some([
        4846369599423283200UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        14069741636278059008UL.reinterpret_as_double(),
        13830554455654793216UL.reinterpret_as_double(),
      ]),
      0UL.reinterpret_as_double(),
      Some([
        4850873199050653696UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
        14074245235905429504UL.reinterpret_as_double(),
        13835058055282163712UL.reinterpret_as_double(),
      ]),
    )
    line_style_source_rc(
      true,
      [
        4846369599423283200UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        14069741636278059008UL.reinterpret_as_double(),
        13830554455654793216UL.reinterpret_as_double(),
      ],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    assert_eq(line.get_color(), "red")
  } catch {
    error => fail("original sum pattern row 2: " + error.to_string())
  }
  line_style_source_double(
    line_style_float_sum([
      4846369599423283200UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      14069741636278059008UL.reinterpret_as_double(),
      13830554455654793216UL.reinterpret_as_double(),
    ]),
    0UL.reinterpret_as_double(),
  )
}

///|
fn line_style_source_sum_3() -> Unit raise {
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
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([0.0, 1.0]),
    LineData::Numeric([10.0, 20.0]),
    color="red",
  )
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  // actual String dashed with compensated builtin sum
  try {
    // Match native controlled stale=False input; this is not a draw.
    line.mark_drawn()
    line_style_source_state(
      line,
      axes,
      "-",
      false,
      4611686018427387904UL.reinterpret_as_double(),
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
    )
    line_style_source_pattern(
      line,
      0UL.reinterpret_as_double(),
      None,
      0UL.reinterpret_as_double(),
      None,
    )
    line_style_source_rc(
      true,
      [
        4615514078110652826UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    @config.set_lines_dashed_pattern([
      4846369599423283200UL.reinterpret_as_double(),
      13830554455654793216UL.reinterpret_as_double(),
      14069741636278059008UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ])
    line.set_linestyle("dashed")
    line_style_source_state(
      line,
      axes,
      "--",
      true,
      4611686018427387904UL.reinterpret_as_double(),
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
    )
    line_style_source_pattern(
      line,
      0UL.reinterpret_as_double(),
      Some([
        4846369599423283200UL.reinterpret_as_double(),
        13830554455654793216UL.reinterpret_as_double(),
        14069741636278059008UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ]),
      0UL.reinterpret_as_double(),
      Some([
        4850873199050653696UL.reinterpret_as_double(),
        13835058055282163712UL.reinterpret_as_double(),
        14074245235905429504UL.reinterpret_as_double(),
        4611686018427387904UL.reinterpret_as_double(),
      ]),
    )
    line_style_source_rc(
      true,
      [
        4846369599423283200UL.reinterpret_as_double(),
        13830554455654793216UL.reinterpret_as_double(),
        14069741636278059008UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
      ],
      [
        4618891777831180698UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
        4607182418800017408UL.reinterpret_as_double(),
        4609884578576439706UL.reinterpret_as_double(),
      ],
      [
        4607182418800017408UL.reinterpret_as_double(),
        4610109758557808230UL.reinterpret_as_double(),
      ],
    )
    assert_eq(line.get_color(), "red")
  } catch {
    error => fail("original sum pattern row 3: " + error.to_string())
  }
  line_style_source_double(
    line_style_float_sum([
      4846369599423283200UL.reinterpret_as_double(),
      13830554455654793216UL.reinterpret_as_double(),
      14069741636278059008UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ]),
    0UL.reinterpret_as_double(),
  )
}

///|
test "original rc patterns and compensated sum boundaries" {
  line_style_source_rc_0()
  line_style_source_rc_1()
  line_style_source_rc_2()
  line_style_source_rc_3()
  line_style_source_rc_4()
  line_style_source_rc_5()
  line_style_source_sum_0()
  line_style_source_sum_1()
  line_style_source_sum_2()
  line_style_source_sum_3()
}

///|
test "original fixed-choice difflib suggestions" {
  assert_eq(
    line_style_invalid_message("NONE"),
    "ValueError: 'NONE' is not a valid value for ls.",
  )
  assert_eq(
    line_style_invalid_message("Solid"),
    "ValueError: 'Solid' is not a valid value for ls. Did you mean: 'solid'?",
  )
  assert_eq(
    line_style_invalid_message(" dashed "),
    "ValueError: ' dashed ' is not a valid value for ls. Did you mean one of: 'dashed', 'dashdot'?",
  )
  assert_eq(
    line_style_invalid_message("-- "),
    "ValueError: '-- ' is not a valid value for ls. Did you mean one of: '--', '-', ' '?",
  )
  assert_eq(
    line_style_invalid_message(".."),
    "ValueError: '..' is not a valid value for ls. Did you mean: '-.'?",
  )
  assert_eq(
    line_style_invalid_message("- "),
    "ValueError: '- ' is not a valid value for ls. Did you mean one of: '-', ' ', '-.'?",
  )
  assert_eq(
    line_style_invalid_message(" ."),
    "ValueError: ' .' is not a valid value for ls. Did you mean one of: ' ', '-.'?",
  )
  assert_eq(
    line_style_invalid_message("-. "),
    "ValueError: '-. ' is not a valid value for ls. Did you mean one of: '-.', '-', ' '?",
  )
  assert_eq(
    line_style_invalid_message("None "),
    "ValueError: 'None ' is not a valid value for ls. Did you mean: 'None'?",
  )
  assert_eq(
    line_style_invalid_message("dash"),
    "ValueError: 'dash' is not a valid value for ls. Did you mean one of: 'dashed', 'dashdot'?",
  )
  assert_eq(
    line_style_invalid_message("dashd"),
    "ValueError: 'dashd' is not a valid value for ls. Did you mean one of: 'dashed', 'dashdot'?",
  )
  assert_eq(
    line_style_invalid_message("doted"),
    "ValueError: 'doted' is not a valid value for ls. Did you mean one of: 'dotted', 'dashed', 'dashdot'?",
  )
  assert_eq(
    line_style_invalid_message("dottod"),
    "ValueError: 'dottod' is not a valid value for ls. Did you mean: 'dotted'?",
  )
  assert_eq(
    line_style_invalid_message("solİd"),
    "ValueError: 'solİd' is not a valid value for ls. Did you mean: 'solid'?",
  )
  assert_eq(
    line_style_invalid_message("ſolid"),
    "ValueError: 'ſolid' is not a valid value for ls. Did you mean: 'solid'?",
  )
  assert_eq(
    line_style_invalid_message("so🙂lid"),
    "ValueError: 'so🙂lid' is not a valid value for ls. Did you mean: 'solid'?",
  )
  assert_eq(
    line_style_invalid_message("dash\u{0}ed"),
    "ValueError: 'dash\\x00ed' is not a valid value for ls. Did you mean one of: 'dashed', 'dashdot'?",
  )
  assert_eq(
    line_style_invalid_message("dashdotxxxxxxxxxxxxxx"),
    "ValueError: 'dashdotxxxxxxxxxxxxxx' is not a valid value for ls. Did you mean: 'dashdot'?",
  )
  assert_eq(
    line_style_invalid_message("dashdotxxxxxxxxxxxxxxx"),
    "ValueError: 'dashdotxxxxxxxxxxxxxxx' is not a valid value for ls.",
  )
  assert_eq(
    line_style_invalid_message(
      "solidxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
    ),
    "ValueError: 'solidxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' is not a valid value for ls.",
  )
}

///|
fn line_style_source_draw_0() -> Unit raise {
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
  let fig = figure(width=400, height=200)
  let axes = fig.axes()
  // Fixed frame isolates the original leaf draw from Axes autoscale and ticks.
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  for axis in [axes.x_axis(), axes.y_axis()] {
    axis.set_locator(@ticker.NullLocator::new().as_locator())
    axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  }
  let line = axes.plot_line(
    LineData::Numeric([
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ]),
    LineData::Numeric([
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ]),
    color="red",
  )
  line.set_color(
    "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
  )
  line.set_linewidth(4611686018427387904UL.reinterpret_as_double())
  line.set_linestyle("none")
  // Source leaf host omitted add_line/update_line_limits: seed its null dataLim.
  axes.state.val.raw_x_data = empty_data_interval()
  axes.state.val.raw_y_data = empty_data_interval()
  axes.state.val.x_data_minpos = 1.0 / 0.0
  axes.state.val.y_data_minpos = 1.0 / 0.0
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  line_style_source_state(
    line,
    axes,
    "None",
    true,
    4611686018427387904UL.reinterpret_as_double(),
    [false, false],
    [
      0UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ],
    [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
    [false, false],
  )
  line_style_source_pattern(
    line,
    0UL.reinterpret_as_double(),
    None,
    0UL.reinterpret_as_double(),
    None,
  )
  line_style_source_rc(
    true,
    [
      4615514078110652826UL.reinterpret_as_double(),
      4609884578576439706UL.reinterpret_as_double(),
    ],
    [
      4618891777831180698UL.reinterpret_as_double(),
      4609884578576439706UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4609884578576439706UL.reinterpret_as_double(),
    ],
    [
      4607182418800017408UL.reinterpret_as_double(),
      4610109758557808230UL.reinterpret_as_double(),
    ],
  )
  let retained = fig.to_render_figure()
  ignore(@svg.render_with_positions_checked(retained))
  line_style_source_state(
    line,
    axes,
    "None",
    false,
    4611686018427387904UL.reinterpret_as_double(),
    [false, false],
    [
      0UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ],
    [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
    [false, false],
  )
  line_style_source_pattern(
    line,
    0UL.reinterpret_as_double(),
    None,
    0UL.reinterpret_as_double(),
    None,
  )
  line_style_source_rc(
    true,
    [
      4615514078110652826UL.reinterpret_as_double(),
      4609884578576439706UL.reinterpret_as_double(),
    ],
    [
      4618891777831180698UL.reinterpret_as_double(),
      4609884578576439706UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4609884578576439706UL.reinterpret_as_double(),
    ],
    [
      4607182418800017408UL.reinterpret_as_double(),
      4610109758557808230UL.reinterpret_as_double(),
    ],
  )
  assert_eq(
    line.get_color(),
    "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
  )
}

///|
fn line_style_source_draw_1() -> Unit raise {
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
  let fig = figure(width=400, height=200)
  let axes = fig.axes()
  // Fixed frame isolates the original leaf draw from Axes autoscale and ticks.
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  for axis in [axes.x_axis(), axes.y_axis()] {
    axis.set_locator(@ticker.NullLocator::new().as_locator())
    axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  }
  let line = axes.plot_line(
    LineData::Numeric([
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ]),
    LineData::Numeric([
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ]),
    color="red",
  )
  line.set_color(
    "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
  )
  line.set_linewidth(4611686018427387904UL.reinterpret_as_double())
  line.set_linestyle("none")
  line.set_ydata(LineData::Numeric([1.0, 2.0, 3.0]))
  // Source leaf host omitted add_line/update_line_limits: seed its null dataLim.
  axes.state.val.raw_x_data = empty_data_interval()
  axes.state.val.raw_y_data = empty_data_interval()
  axes.state.val.x_data_minpos = 1.0 / 0.0
  axes.state.val.y_data_minpos = 1.0 / 0.0
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  line_style_source_state(
    line,
    axes,
    "None",
    true,
    4611686018427387904UL.reinterpret_as_double(),
    [false, true],
    [
      0UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ],
    [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
    [false, false],
  )
  line_style_source_pattern(
    line,
    0UL.reinterpret_as_double(),
    None,
    0UL.reinterpret_as_double(),
    None,
  )
  line_style_source_rc(
    true,
    [
      4615514078110652826UL.reinterpret_as_double(),
      4609884578576439706UL.reinterpret_as_double(),
    ],
    [
      4618891777831180698UL.reinterpret_as_double(),
      4609884578576439706UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4609884578576439706UL.reinterpret_as_double(),
    ],
    [
      4607182418800017408UL.reinterpret_as_double(),
      4610109758557808230UL.reinterpret_as_double(),
    ],
  )
  let retained = fig.to_render_figure()
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
  line_style_source_state(
    line,
    axes,
    "None",
    true,
    4611686018427387904UL.reinterpret_as_double(),
    [false, true],
    [
      0UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ],
    [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
    [false, false],
  )
  line_style_source_pattern(
    line,
    0UL.reinterpret_as_double(),
    None,
    0UL.reinterpret_as_double(),
    None,
  )
  line_style_source_rc(
    true,
    [
      4615514078110652826UL.reinterpret_as_double(),
      4609884578576439706UL.reinterpret_as_double(),
    ],
    [
      4618891777831180698UL.reinterpret_as_double(),
      4609884578576439706UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4609884578576439706UL.reinterpret_as_double(),
    ],
    [
      4607182418800017408UL.reinterpret_as_double(),
      4610109758557808230UL.reinterpret_as_double(),
    ],
  )
  assert_eq(
    line.get_color(),
    "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
  )
}

///|
fn line_style_source_draw_2() -> Unit raise {
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
  let fig = figure(width=400, height=200)
  let axes = fig.axes()
  // Fixed frame isolates the original leaf draw from Axes autoscale and ticks.
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  for axis in [axes.x_axis(), axes.y_axis()] {
    axis.set_locator(@ticker.NullLocator::new().as_locator())
    axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  }
  let line = axes.plot_line(
    LineData::Numeric([
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ]),
    LineData::Numeric([
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ]),
    color="red",
  )
  line.set_color(
    "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
  )
  line.set_linewidth(4611686018427387904UL.reinterpret_as_double())
  line.set_linestyle("solid")
  // Source leaf host omitted add_line/update_line_limits: seed its null dataLim.
  axes.state.val.raw_x_data = empty_data_interval()
  axes.state.val.raw_y_data = empty_data_interval()
  axes.state.val.x_data_minpos = 1.0 / 0.0
  axes.state.val.y_data_minpos = 1.0 / 0.0
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  line_style_source_state(
    line,
    axes,
    "-",
    true,
    4611686018427387904UL.reinterpret_as_double(),
    [false, false],
    [
      0UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ],
    [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
    [false, false],
  )
  line_style_source_pattern(
    line,
    0UL.reinterpret_as_double(),
    None,
    0UL.reinterpret_as_double(),
    None,
  )
  line_style_source_rc(
    true,
    [
      4615514078110652826UL.reinterpret_as_double(),
      4609884578576439706UL.reinterpret_as_double(),
    ],
    [
      4618891777831180698UL.reinterpret_as_double(),
      4609884578576439706UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4609884578576439706UL.reinterpret_as_double(),
    ],
    [
      4607182418800017408UL.reinterpret_as_double(),
      4610109758557808230UL.reinterpret_as_double(),
    ],
  )
  let retained = fig.to_render_figure()
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
  line_style_source_state(
    line,
    axes,
    "-",
    true,
    4611686018427387904UL.reinterpret_as_double(),
    [false, false],
    [
      0UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ],
    [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
    [false, false],
  )
  line_style_source_pattern(
    line,
    0UL.reinterpret_as_double(),
    None,
    0UL.reinterpret_as_double(),
    None,
  )
  line_style_source_rc(
    true,
    [
      4615514078110652826UL.reinterpret_as_double(),
      4609884578576439706UL.reinterpret_as_double(),
    ],
    [
      4618891777831180698UL.reinterpret_as_double(),
      4609884578576439706UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4609884578576439706UL.reinterpret_as_double(),
    ],
    [
      4607182418800017408UL.reinterpret_as_double(),
      4610109758557808230UL.reinterpret_as_double(),
    ],
  )
  assert_eq(
    line.get_color(),
    "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
  )
}

///|
fn line_style_source_draw_3() -> Unit raise {
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
  @config.set_lines_dashed_pattern([
    13830554455654793216UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  let fig = figure(width=400, height=200)
  let axes = fig.axes()
  // Fixed frame isolates the original leaf draw from Axes autoscale and ticks.
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  for axis in [axes.x_axis(), axes.y_axis()] {
    axis.set_locator(@ticker.NullLocator::new().as_locator())
    axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  }
  let line = axes.plot_line(
    LineData::Numeric([
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ]),
    LineData::Numeric([
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ]),
    color="red",
  )
  line.set_color("red")
  line.set_linewidth(4611686018427387904UL.reinterpret_as_double())
  line.set_linestyle("dashed")
  // Source leaf host omitted add_line/update_line_limits: seed its null dataLim.
  axes.state.val.raw_x_data = empty_data_interval()
  axes.state.val.raw_y_data = empty_data_interval()
  axes.state.val.x_data_minpos = 1.0 / 0.0
  axes.state.val.y_data_minpos = 1.0 / 0.0
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  line_style_source_state(
    line,
    axes,
    "--",
    true,
    4611686018427387904UL.reinterpret_as_double(),
    [false, false],
    [
      0UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ],
    [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
    [false, false],
  )
  line_style_source_pattern(
    line,
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
  )
  line_style_source_rc(
    true,
    [
      13830554455654793216UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ],
    [
      4618891777831180698UL.reinterpret_as_double(),
      4609884578576439706UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4609884578576439706UL.reinterpret_as_double(),
    ],
    [
      4607182418800017408UL.reinterpret_as_double(),
      4610109758557808230UL.reinterpret_as_double(),
    ],
  )
  let retained = fig.to_render_figure()
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
  line_style_source_state(
    line,
    axes,
    "--",
    true,
    4611686018427387904UL.reinterpret_as_double(),
    [false, false],
    [
      0UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ],
    [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
    [false, false],
  )
  line_style_source_pattern(
    line,
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
  )
  line_style_source_rc(
    true,
    [
      13830554455654793216UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ],
    [
      4618891777831180698UL.reinterpret_as_double(),
      4609884578576439706UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4609884578576439706UL.reinterpret_as_double(),
    ],
    [
      4607182418800017408UL.reinterpret_as_double(),
      4610109758557808230UL.reinterpret_as_double(),
    ],
  )
  assert_eq(line.get_color(), "red")
}

///|
fn line_style_source_draw_4() -> Unit raise {
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
  @config.set_lines_dashed_pattern([
    13830554455654793216UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  let fig = figure(width=400, height=200)
  let axes = fig.axes()
  // Fixed frame isolates the original leaf draw from Axes autoscale and ticks.
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  for axis in [axes.x_axis(), axes.y_axis()] {
    axis.set_locator(@ticker.NullLocator::new().as_locator())
    axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  }
  let line = axes.plot_line(
    LineData::Numeric([
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ]),
    LineData::Numeric([
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ]),
    color="red",
  )
  line.set_color("red")
  line.set_linewidth(0UL.reinterpret_as_double())
  line.set_linestyle("dashed")
  // Source leaf host omitted add_line/update_line_limits: seed its null dataLim.
  axes.state.val.raw_x_data = empty_data_interval()
  axes.state.val.raw_y_data = empty_data_interval()
  axes.state.val.x_data_minpos = 1.0 / 0.0
  axes.state.val.y_data_minpos = 1.0 / 0.0
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  line_style_source_state(
    line,
    axes,
    "--",
    true,
    0UL.reinterpret_as_double(),
    [false, false],
    [
      0UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ],
    [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
    [false, false],
  )
  line_style_source_pattern(
    line,
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
  )
  line_style_source_rc(
    true,
    [
      13830554455654793216UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ],
    [
      4618891777831180698UL.reinterpret_as_double(),
      4609884578576439706UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4609884578576439706UL.reinterpret_as_double(),
    ],
    [
      4607182418800017408UL.reinterpret_as_double(),
      4610109758557808230UL.reinterpret_as_double(),
    ],
  )
  let retained = fig.to_render_figure()
  ignore(@svg.render_with_positions_checked(retained))
  line_style_source_state(
    line,
    axes,
    "--",
    false,
    0UL.reinterpret_as_double(),
    [false, false],
    [
      0UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ],
    [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
    [false, false],
  )
  line_style_source_pattern(
    line,
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
  )
  line_style_source_rc(
    true,
    [
      13830554455654793216UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ],
    [
      4618891777831180698UL.reinterpret_as_double(),
      4609884578576439706UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4609884578576439706UL.reinterpret_as_double(),
    ],
    [
      4607182418800017408UL.reinterpret_as_double(),
      4610109758557808230UL.reinterpret_as_double(),
    ],
  )
  assert_eq(line.get_color(), "red")
}

///|
fn line_style_source_draw_5() -> Unit raise {
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
  @config.set_lines_dashed_pattern([
    13830554455654793216UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  let fig = figure(width=400, height=200)
  let axes = fig.axes()
  // Fixed frame isolates the original leaf draw from Axes autoscale and ticks.
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  for axis in [axes.x_axis(), axes.y_axis()] {
    axis.set_locator(@ticker.NullLocator::new().as_locator())
    axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  }
  let line = axes.plot_line(
    LineData::Numeric([
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ]),
    LineData::Numeric([
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ]),
    color="red",
  )
  line.set_color("red")
  line.set_linewidth(13835058055282163712UL.reinterpret_as_double())
  line.set_linestyle("dashed")
  // Source leaf host omitted add_line/update_line_limits: seed its null dataLim.
  axes.state.val.raw_x_data = empty_data_interval()
  axes.state.val.raw_y_data = empty_data_interval()
  axes.state.val.x_data_minpos = 1.0 / 0.0
  axes.state.val.y_data_minpos = 1.0 / 0.0
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  line_style_source_state(
    line,
    axes,
    "--",
    true,
    13835058055282163712UL.reinterpret_as_double(),
    [false, false],
    [
      0UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ],
    [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
    [false, false],
  )
  line_style_source_pattern(
    line,
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
  )
  line_style_source_rc(
    true,
    [
      13830554455654793216UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ],
    [
      4618891777831180698UL.reinterpret_as_double(),
      4609884578576439706UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4609884578576439706UL.reinterpret_as_double(),
    ],
    [
      4607182418800017408UL.reinterpret_as_double(),
      4610109758557808230UL.reinterpret_as_double(),
    ],
  )
  let retained = fig.to_render_figure()
  ignore(@svg.render_with_positions_checked(retained))
  line_style_source_state(
    line,
    axes,
    "--",
    false,
    13835058055282163712UL.reinterpret_as_double(),
    [false, false],
    [
      0UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ],
    [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
    [false, false],
  )
  line_style_source_pattern(
    line,
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
  )
  line_style_source_rc(
    true,
    [
      13830554455654793216UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ],
    [
      4618891777831180698UL.reinterpret_as_double(),
      4609884578576439706UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4609884578576439706UL.reinterpret_as_double(),
    ],
    [
      4607182418800017408UL.reinterpret_as_double(),
      4610109758557808230UL.reinterpret_as_double(),
    ],
  )
  assert_eq(line.get_color(), "red")
}

///|
fn line_style_source_draw_6() -> Unit raise {
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
  @config.set_lines_dashed_pattern([
    13830554455654793216UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  let fig = figure(width=400, height=200)
  let axes = fig.axes()
  // Fixed frame isolates the original leaf draw from Axes autoscale and ticks.
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  for axis in [axes.x_axis(), axes.y_axis()] {
    axis.set_locator(@ticker.NullLocator::new().as_locator())
    axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  }
  let line = axes.plot_line(
    LineData::Numeric([
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ]),
    LineData::Numeric([
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ]),
    color="red",
  )
  line.set_color("red")
  line.set_linewidth(0.0 / 0.0)
  line.set_linestyle("dashed")
  // Source leaf host omitted add_line/update_line_limits: seed its null dataLim.
  axes.state.val.raw_x_data = empty_data_interval()
  axes.state.val.raw_y_data = empty_data_interval()
  axes.state.val.x_data_minpos = 1.0 / 0.0
  axes.state.val.y_data_minpos = 1.0 / 0.0
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  line_style_source_state(
    line,
    axes,
    "--",
    true,
    0.0 / 0.0,
    [false, false],
    [
      0UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ],
    [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
    [false, false],
  )
  line_style_source_pattern(
    line,
    0UL.reinterpret_as_double(),
    Some([
      13830554455654793216UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ]),
    0.0 / 0.0,
    Some([0.0 / 0.0, 0.0 / 0.0]),
  )
  line_style_source_rc(
    true,
    [
      13830554455654793216UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ],
    [
      4618891777831180698UL.reinterpret_as_double(),
      4609884578576439706UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4609884578576439706UL.reinterpret_as_double(),
    ],
    [
      4607182418800017408UL.reinterpret_as_double(),
      4610109758557808230UL.reinterpret_as_double(),
    ],
  )
  let retained = fig.to_render_figure()
  ignore(@svg.render_with_positions_checked(retained))
  line_style_source_state(
    line,
    axes,
    "--",
    false,
    0.0 / 0.0,
    [false, false],
    [
      0UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ],
    [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
    [false, false],
  )
  line_style_source_pattern(
    line,
    0UL.reinterpret_as_double(),
    Some([
      13830554455654793216UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ]),
    0.0 / 0.0,
    Some([0.0 / 0.0, 0.0 / 0.0]),
  )
  line_style_source_rc(
    true,
    [
      13830554455654793216UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ],
    [
      4618891777831180698UL.reinterpret_as_double(),
      4609884578576439706UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4609884578576439706UL.reinterpret_as_double(),
    ],
    [
      4607182418800017408UL.reinterpret_as_double(),
      4610109758557808230UL.reinterpret_as_double(),
    ],
  )
  assert_eq(line.get_color(), "red")
}

///|
fn line_style_source_draw_7() -> Unit raise {
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
  @config.set_lines_dashed_pattern([
    0UL.reinterpret_as_double(),
    0UL.reinterpret_as_double(),
  ])
  let fig = figure(width=400, height=200)
  let axes = fig.axes()
  // Fixed frame isolates the original leaf draw from Axes autoscale and ticks.
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  for axis in [axes.x_axis(), axes.y_axis()] {
    axis.set_locator(@ticker.NullLocator::new().as_locator())
    axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  }
  let line = axes.plot_line(
    LineData::Numeric([
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ]),
    LineData::Numeric([
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ]),
    color="red",
  )
  line.set_color("red")
  line.set_linewidth(4611686018427387904UL.reinterpret_as_double())
  line.set_linestyle("dashed")
  // Source leaf host omitted add_line/update_line_limits: seed its null dataLim.
  axes.state.val.raw_x_data = empty_data_interval()
  axes.state.val.raw_y_data = empty_data_interval()
  axes.state.val.x_data_minpos = 1.0 / 0.0
  axes.state.val.y_data_minpos = 1.0 / 0.0
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  line_style_source_state(
    line,
    axes,
    "--",
    true,
    4611686018427387904UL.reinterpret_as_double(),
    [false, false],
    [
      0UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ],
    [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
    [false, false],
  )
  line_style_source_pattern(
    line,
    0UL.reinterpret_as_double(),
    Some([0UL.reinterpret_as_double(), 0UL.reinterpret_as_double()]),
    0UL.reinterpret_as_double(),
    Some([0UL.reinterpret_as_double(), 0UL.reinterpret_as_double()]),
  )
  line_style_source_rc(
    true,
    [0UL.reinterpret_as_double(), 0UL.reinterpret_as_double()],
    [
      4618891777831180698UL.reinterpret_as_double(),
      4609884578576439706UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4609884578576439706UL.reinterpret_as_double(),
    ],
    [
      4607182418800017408UL.reinterpret_as_double(),
      4610109758557808230UL.reinterpret_as_double(),
    ],
  )
  let retained = fig.to_render_figure()
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
  line_style_source_state(
    line,
    axes,
    "--",
    true,
    4611686018427387904UL.reinterpret_as_double(),
    [false, false],
    [
      0UL.reinterpret_as_double(),
      4621819117588971520UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ],
    [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
    [false, false],
  )
  line_style_source_pattern(
    line,
    0UL.reinterpret_as_double(),
    Some([0UL.reinterpret_as_double(), 0UL.reinterpret_as_double()]),
    0UL.reinterpret_as_double(),
    Some([0UL.reinterpret_as_double(), 0UL.reinterpret_as_double()]),
  )
  line_style_source_rc(
    true,
    [0UL.reinterpret_as_double(), 0UL.reinterpret_as_double()],
    [
      4618891777831180698UL.reinterpret_as_double(),
      4609884578576439706UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4609884578576439706UL.reinterpret_as_double(),
    ],
    [
      4607182418800017408UL.reinterpret_as_double(),
      4610109758557808230UL.reinterpret_as_double(),
    ],
  )
  assert_eq(line.get_color(), "red")
}

///|
fn line_style_source_draw_8() -> Unit raise {
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
  @config.set_lines_dashed_pattern([
    13830554455654793216UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  let fig = figure(width=400, height=200)
  let axes = fig.axes()
  // Fixed frame isolates the original leaf draw from Axes autoscale and ticks.
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  for axis in [axes.x_axis(), axes.y_axis()] {
    axis.set_locator(@ticker.NullLocator::new().as_locator())
    axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  }
  let line = axes.plot_line(
    LineData::Numeric([0.0 / 0.0, 1.0 / 0.0]),
    LineData::Numeric([0.0 / 0.0, -1.0 / 0.0]),
    color="red",
  )
  line.set_color("red")
  line.set_linewidth(4611686018427387904UL.reinterpret_as_double())
  line.set_linestyle("dashed")
  // Source leaf host omitted add_line/update_line_limits: seed its null dataLim.
  axes.state.val.raw_x_data = empty_data_interval()
  axes.state.val.raw_y_data = empty_data_interval()
  axes.state.val.x_data_minpos = 1.0 / 0.0
  axes.state.val.y_data_minpos = 1.0 / 0.0
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  line_style_source_state(
    line,
    axes,
    "--",
    true,
    4611686018427387904UL.reinterpret_as_double(),
    [false, false],
    [0.0 / 0.0, 0.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0],
    [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
    [false, false],
  )
  line_style_source_pattern(
    line,
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
  )
  line_style_source_rc(
    true,
    [
      13830554455654793216UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ],
    [
      4618891777831180698UL.reinterpret_as_double(),
      4609884578576439706UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4609884578576439706UL.reinterpret_as_double(),
    ],
    [
      4607182418800017408UL.reinterpret_as_double(),
      4610109758557808230UL.reinterpret_as_double(),
    ],
  )
  let retained = fig.to_render_figure()
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
  line_style_source_state(
    line,
    axes,
    "--",
    true,
    4611686018427387904UL.reinterpret_as_double(),
    [false, false],
    [0.0 / 0.0, 0.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0],
    [1.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0, -1.0 / 0.0],
    [false, false],
  )
  line_style_source_pattern(
    line,
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
  )
  line_style_source_rc(
    true,
    [
      13830554455654793216UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ],
    [
      4618891777831180698UL.reinterpret_as_double(),
      4609884578576439706UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4609884578576439706UL.reinterpret_as_double(),
    ],
    [
      4607182418800017408UL.reinterpret_as_double(),
      4610109758557808230UL.reinterpret_as_double(),
    ],
  )
  assert_eq(line.get_color(), "red")
}

///|
test "original no-marker leaf draw and actual GC validation" {
  line_style_source_draw_0() catch {
    error => fail("original linestyle draw row 0: " + error.to_string())
  }
  line_style_source_draw_1() catch {
    error => fail("original linestyle draw row 1: " + error.to_string())
  }
  line_style_source_draw_2() catch {
    error => fail("original linestyle draw row 2: " + error.to_string())
  }
  line_style_source_draw_3() catch {
    error => fail("original linestyle draw row 3: " + error.to_string())
  }
  line_style_source_draw_4() catch {
    error => fail("original linestyle draw row 4: " + error.to_string())
  }
  line_style_source_draw_5() catch {
    error => fail("original linestyle draw row 5: " + error.to_string())
  }
  line_style_source_draw_6() catch {
    error => fail("original linestyle draw row 6: " + error.to_string())
  }
  line_style_source_draw_7() catch {
    error => fail("original linestyle draw row 7: " + error.to_string())
  }
  line_style_source_draw_8() catch {
    error => fail("original linestyle draw row 8: " + error.to_string())
  }
}
