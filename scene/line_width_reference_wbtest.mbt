// Generated from pinned original Line linewidth methods; do not edit.
// Native SVG style primitives and dash state remain source-only evidence.

///|
fn line_width_source_double(actual : Double, expected : Double) -> Unit raise {
  if expected.is_nan() {
    assert_true(actual.is_nan())
  } else {
    assert_eq(actual.reinterpret_as_uint64(), expected.reinterpret_as_uint64())
  }
}

///|
fn line_width_source_numbers(
  actual : Array[Double],
  expected : Array[Double],
) -> Unit raise {
  assert_eq(actual.length(), expected.length())
  for index in 0..<actual.length() {
    line_width_source_double(actual[index], expected[index])
  }
}

///|
fn line_width_source_state(
  line : Line2D,
  axes : Axes,
  width : Double,
  stale : Bool,
  invalid : Array[Bool],
  xy : Array[Double],
  data : Array[Double],
  requests : Array[Bool],
) -> Unit raise {
  line_width_source_double(line.get_linewidth(), width)
  assert_eq(line.stale(), stale)
  assert_eq([line.invalid_x, line.invalid_y], invalid)
  // Inspect retained storage without a lazy processed getter or draw.
  line_width_source_numbers(line.cache.flat.to_array(), xy)
  line_width_source_numbers(
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
}

///|
fn line_width_source_sequence_0() -> Unit raise {
  // This scenario records native lines.scale_dashes=True.
  // Typed solid-Line width has no dash slot or new scale_dashes rc API.
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([0.0, 1.0]),
    LineData::Numeric([10.0, 20.0]),
  )
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  // original Line linewidth row 0 scale_dashes=True
  try {
    // Input fixture only: match the native controlled clean-stale state.
    line.mark_drawn()
    line_width_source_state(
      line,
      axes,
      4611686018427387904UL.reinterpret_as_double(),
      false,
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
    line.set_linewidth(4611686018427387904UL.reinterpret_as_double())
    line_width_source_state(
      line,
      axes,
      4611686018427387904UL.reinterpret_as_double(),
      false,
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
  } catch {
    error =>
      fail(
        "original Line linewidth row 0 scale_dashes=True: " + error.to_string(),
      )
  }
  // original Line linewidth row 1 scale_dashes=True
  try {
    // Input fixture only: match the native controlled clean-stale state.
    line.mark_drawn()
    line_width_source_state(
      line,
      axes,
      4611686018427387904UL.reinterpret_as_double(),
      false,
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
    line.set_linewidth(4611686018427387904UL.reinterpret_as_double())
    line_width_source_state(
      line,
      axes,
      4611686018427387904UL.reinterpret_as_double(),
      false,
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
  } catch {
    error =>
      fail(
        "original Line linewidth row 1 scale_dashes=True: " + error.to_string(),
      )
  }
  // original Line linewidth row 2 scale_dashes=True
  try {
    // Input fixture only: match the native controlled clean-stale state.
    line.mark_drawn()
    line_width_source_state(
      line,
      axes,
      4611686018427387904UL.reinterpret_as_double(),
      false,
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
    line.set_linewidth(4607182418800017408UL.reinterpret_as_double())
    line_width_source_state(
      line,
      axes,
      4607182418800017408UL.reinterpret_as_double(),
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
    )
  } catch {
    error =>
      fail(
        "original Line linewidth row 2 scale_dashes=True: " + error.to_string(),
      )
  }
  // original Line linewidth row 3 scale_dashes=True
  try {
    // Input fixture only: match the native controlled clean-stale state.
    line.mark_drawn()
    line_width_source_state(
      line,
      axes,
      4607182418800017408UL.reinterpret_as_double(),
      false,
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
    line.set_linewidth(4598175219545276416UL.reinterpret_as_double())
    line_width_source_state(
      line,
      axes,
      4598175219545276416UL.reinterpret_as_double(),
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
    )
  } catch {
    error =>
      fail(
        "original Line linewidth row 3 scale_dashes=True: " + error.to_string(),
      )
  }
  // original Line linewidth row 4 scale_dashes=True
  try {
    // Input fixture only: match the native controlled clean-stale state.
    line.mark_drawn()
    line_width_source_state(
      line,
      axes,
      4598175219545276416UL.reinterpret_as_double(),
      false,
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
    line.set_linewidth(0UL.reinterpret_as_double())
    line_width_source_state(
      line,
      axes,
      0UL.reinterpret_as_double(),
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
    )
  } catch {
    error =>
      fail(
        "original Line linewidth row 4 scale_dashes=True: " + error.to_string(),
      )
  }
  // original Line linewidth row 5 scale_dashes=True
  try {
    // Input fixture only: match the native controlled clean-stale state.
    line.mark_drawn()
    line_width_source_state(
      line,
      axes,
      0UL.reinterpret_as_double(),
      false,
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
    line.set_linewidth(9223372036854775808UL.reinterpret_as_double())
    line_width_source_state(
      line,
      axes,
      9223372036854775808UL.reinterpret_as_double(),
      false,
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
  } catch {
    error =>
      fail(
        "original Line linewidth row 5 scale_dashes=True: " + error.to_string(),
      )
  }
  // original Line linewidth row 6 scale_dashes=True
  try {
    // Input fixture only: match the native controlled clean-stale state.
    line.mark_drawn()
    line_width_source_state(
      line,
      axes,
      9223372036854775808UL.reinterpret_as_double(),
      false,
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
    line.set_linewidth(13835058055282163712UL.reinterpret_as_double())
    line_width_source_state(
      line,
      axes,
      13835058055282163712UL.reinterpret_as_double(),
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
    )
  } catch {
    error =>
      fail(
        "original Line linewidth row 6 scale_dashes=True: " + error.to_string(),
      )
  }
  // original Line linewidth row 7 scale_dashes=True
  try {
    // Input fixture only: match the native controlled clean-stale state.
    line.mark_drawn()
    line_width_source_state(
      line,
      axes,
      13835058055282163712UL.reinterpret_as_double(),
      false,
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
    line.set_linewidth(0.0 / 0.0)
    line_width_source_state(
      line,
      axes,
      0.0 / 0.0,
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
    )
  } catch {
    error =>
      fail(
        "original Line linewidth row 7 scale_dashes=True: " + error.to_string(),
      )
  }
  // original Line linewidth row 8 scale_dashes=True
  try {
    // Input fixture only: match the native controlled clean-stale state.
    line.mark_drawn()
    line_width_source_state(
      line,
      axes,
      0.0 / 0.0,
      false,
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
    line.set_linewidth(0.0 / 0.0)
    line_width_source_state(
      line,
      axes,
      0.0 / 0.0,
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
    )
  } catch {
    error =>
      fail(
        "original Line linewidth row 8 scale_dashes=True: " + error.to_string(),
      )
  }
  // original Line linewidth row 9 scale_dashes=True
  try {
    // Input fixture only: match the native controlled clean-stale state.
    line.mark_drawn()
    line_width_source_state(
      line,
      axes,
      0.0 / 0.0,
      false,
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
    line.set_linewidth(1.0 / 0.0)
    line_width_source_state(
      line,
      axes,
      1.0 / 0.0,
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
    )
  } catch {
    error =>
      fail(
        "original Line linewidth row 9 scale_dashes=True: " + error.to_string(),
      )
  }
  // original Line linewidth row 10 scale_dashes=True
  try {
    // Input fixture only: match the native controlled clean-stale state.
    line.mark_drawn()
    line_width_source_state(
      line,
      axes,
      1.0 / 0.0,
      false,
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
    line.set_linewidth(1.0 / 0.0)
    line_width_source_state(
      line,
      axes,
      1.0 / 0.0,
      false,
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
  } catch {
    error =>
      fail(
        "original Line linewidth row 10 scale_dashes=True: " + error.to_string(),
      )
  }
  // original Line linewidth row 11 scale_dashes=True
  try {
    // Input fixture only: match the native controlled clean-stale state.
    line.mark_drawn()
    line_width_source_state(
      line,
      axes,
      1.0 / 0.0,
      false,
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
    line.set_linewidth(-1.0 / 0.0)
    line_width_source_state(
      line,
      axes,
      -1.0 / 0.0,
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
    )
  } catch {
    error =>
      fail(
        "original Line linewidth row 11 scale_dashes=True: " + error.to_string(),
      )
  }
  // original Line linewidth row 12 scale_dashes=True
  try {
    // Input fixture only: match the native controlled clean-stale state.
    line.mark_drawn()
    line_width_source_state(
      line,
      axes,
      -1.0 / 0.0,
      false,
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
    line.set_linewidth(1UL.reinterpret_as_double())
    line_width_source_state(
      line,
      axes,
      1UL.reinterpret_as_double(),
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
    )
  } catch {
    error =>
      fail(
        "original Line linewidth row 12 scale_dashes=True: " + error.to_string(),
      )
  }
  // original Line linewidth row 13 scale_dashes=True
  try {
    // Input fixture only: match the native controlled clean-stale state.
    line.mark_drawn()
    line_width_source_state(
      line,
      axes,
      1UL.reinterpret_as_double(),
      false,
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
    line.set_linewidth(9218868437227405311UL.reinterpret_as_double())
    line_width_source_state(
      line,
      axes,
      9218868437227405311UL.reinterpret_as_double(),
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
    )
  } catch {
    error =>
      fail(
        "original Line linewidth row 13 scale_dashes=True: " + error.to_string(),
      )
  }
}

///|
fn line_width_source_sequence_1() -> Unit raise {
  // This scenario records native lines.scale_dashes=False.
  // Typed solid-Line width has no dash slot or new scale_dashes rc API.
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([0.0, 1.0]),
    LineData::Numeric([10.0, 20.0]),
  )
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  // original Line linewidth row 14 scale_dashes=False
  try {
    // Input fixture only: match the native controlled clean-stale state.
    line.mark_drawn()
    line_width_source_state(
      line,
      axes,
      4611686018427387904UL.reinterpret_as_double(),
      false,
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
    line.set_linewidth(4611686018427387904UL.reinterpret_as_double())
    line_width_source_state(
      line,
      axes,
      4611686018427387904UL.reinterpret_as_double(),
      false,
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
  } catch {
    error =>
      fail(
        "original Line linewidth row 14 scale_dashes=False: " +
        error.to_string(),
      )
  }
  // original Line linewidth row 15 scale_dashes=False
  try {
    // Input fixture only: match the native controlled clean-stale state.
    line.mark_drawn()
    line_width_source_state(
      line,
      axes,
      4611686018427387904UL.reinterpret_as_double(),
      false,
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
    line.set_linewidth(4611686018427387904UL.reinterpret_as_double())
    line_width_source_state(
      line,
      axes,
      4611686018427387904UL.reinterpret_as_double(),
      false,
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
  } catch {
    error =>
      fail(
        "original Line linewidth row 15 scale_dashes=False: " +
        error.to_string(),
      )
  }
  // original Line linewidth row 16 scale_dashes=False
  try {
    // Input fixture only: match the native controlled clean-stale state.
    line.mark_drawn()
    line_width_source_state(
      line,
      axes,
      4611686018427387904UL.reinterpret_as_double(),
      false,
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
    line.set_linewidth(4607182418800017408UL.reinterpret_as_double())
    line_width_source_state(
      line,
      axes,
      4607182418800017408UL.reinterpret_as_double(),
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
    )
  } catch {
    error =>
      fail(
        "original Line linewidth row 16 scale_dashes=False: " +
        error.to_string(),
      )
  }
  // original Line linewidth row 17 scale_dashes=False
  try {
    // Input fixture only: match the native controlled clean-stale state.
    line.mark_drawn()
    line_width_source_state(
      line,
      axes,
      4607182418800017408UL.reinterpret_as_double(),
      false,
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
    line.set_linewidth(4598175219545276416UL.reinterpret_as_double())
    line_width_source_state(
      line,
      axes,
      4598175219545276416UL.reinterpret_as_double(),
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
    )
  } catch {
    error =>
      fail(
        "original Line linewidth row 17 scale_dashes=False: " +
        error.to_string(),
      )
  }
  // original Line linewidth row 18 scale_dashes=False
  try {
    // Input fixture only: match the native controlled clean-stale state.
    line.mark_drawn()
    line_width_source_state(
      line,
      axes,
      4598175219545276416UL.reinterpret_as_double(),
      false,
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
    line.set_linewidth(0UL.reinterpret_as_double())
    line_width_source_state(
      line,
      axes,
      0UL.reinterpret_as_double(),
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
    )
  } catch {
    error =>
      fail(
        "original Line linewidth row 18 scale_dashes=False: " +
        error.to_string(),
      )
  }
  // original Line linewidth row 19 scale_dashes=False
  try {
    // Input fixture only: match the native controlled clean-stale state.
    line.mark_drawn()
    line_width_source_state(
      line,
      axes,
      0UL.reinterpret_as_double(),
      false,
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
    line.set_linewidth(9223372036854775808UL.reinterpret_as_double())
    line_width_source_state(
      line,
      axes,
      9223372036854775808UL.reinterpret_as_double(),
      false,
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
  } catch {
    error =>
      fail(
        "original Line linewidth row 19 scale_dashes=False: " +
        error.to_string(),
      )
  }
  // original Line linewidth row 20 scale_dashes=False
  try {
    // Input fixture only: match the native controlled clean-stale state.
    line.mark_drawn()
    line_width_source_state(
      line,
      axes,
      9223372036854775808UL.reinterpret_as_double(),
      false,
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
    line.set_linewidth(13835058055282163712UL.reinterpret_as_double())
    line_width_source_state(
      line,
      axes,
      13835058055282163712UL.reinterpret_as_double(),
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
    )
  } catch {
    error =>
      fail(
        "original Line linewidth row 20 scale_dashes=False: " +
        error.to_string(),
      )
  }
  // original Line linewidth row 21 scale_dashes=False
  try {
    // Input fixture only: match the native controlled clean-stale state.
    line.mark_drawn()
    line_width_source_state(
      line,
      axes,
      13835058055282163712UL.reinterpret_as_double(),
      false,
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
    line.set_linewidth(0.0 / 0.0)
    line_width_source_state(
      line,
      axes,
      0.0 / 0.0,
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
    )
  } catch {
    error =>
      fail(
        "original Line linewidth row 21 scale_dashes=False: " +
        error.to_string(),
      )
  }
  // original Line linewidth row 22 scale_dashes=False
  try {
    // Input fixture only: match the native controlled clean-stale state.
    line.mark_drawn()
    line_width_source_state(
      line,
      axes,
      0.0 / 0.0,
      false,
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
    line.set_linewidth(0.0 / 0.0)
    line_width_source_state(
      line,
      axes,
      0.0 / 0.0,
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
    )
  } catch {
    error =>
      fail(
        "original Line linewidth row 22 scale_dashes=False: " +
        error.to_string(),
      )
  }
  // original Line linewidth row 23 scale_dashes=False
  try {
    // Input fixture only: match the native controlled clean-stale state.
    line.mark_drawn()
    line_width_source_state(
      line,
      axes,
      0.0 / 0.0,
      false,
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
    line.set_linewidth(1.0 / 0.0)
    line_width_source_state(
      line,
      axes,
      1.0 / 0.0,
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
    )
  } catch {
    error =>
      fail(
        "original Line linewidth row 23 scale_dashes=False: " +
        error.to_string(),
      )
  }
  // original Line linewidth row 24 scale_dashes=False
  try {
    // Input fixture only: match the native controlled clean-stale state.
    line.mark_drawn()
    line_width_source_state(
      line,
      axes,
      1.0 / 0.0,
      false,
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
    line.set_linewidth(1.0 / 0.0)
    line_width_source_state(
      line,
      axes,
      1.0 / 0.0,
      false,
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
  } catch {
    error =>
      fail(
        "original Line linewidth row 24 scale_dashes=False: " +
        error.to_string(),
      )
  }
  // original Line linewidth row 25 scale_dashes=False
  try {
    // Input fixture only: match the native controlled clean-stale state.
    line.mark_drawn()
    line_width_source_state(
      line,
      axes,
      1.0 / 0.0,
      false,
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
    line.set_linewidth(-1.0 / 0.0)
    line_width_source_state(
      line,
      axes,
      -1.0 / 0.0,
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
    )
  } catch {
    error =>
      fail(
        "original Line linewidth row 25 scale_dashes=False: " +
        error.to_string(),
      )
  }
  // original Line linewidth row 26 scale_dashes=False
  try {
    // Input fixture only: match the native controlled clean-stale state.
    line.mark_drawn()
    line_width_source_state(
      line,
      axes,
      -1.0 / 0.0,
      false,
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
    line.set_linewidth(1UL.reinterpret_as_double())
    line_width_source_state(
      line,
      axes,
      1UL.reinterpret_as_double(),
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
    )
  } catch {
    error =>
      fail(
        "original Line linewidth row 26 scale_dashes=False: " +
        error.to_string(),
      )
  }
  // original Line linewidth row 27 scale_dashes=False
  try {
    // Input fixture only: match the native controlled clean-stale state.
    line.mark_drawn()
    line_width_source_state(
      line,
      axes,
      1UL.reinterpret_as_double(),
      false,
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
    line.set_linewidth(9218868437227405311UL.reinterpret_as_double())
    line_width_source_state(
      line,
      axes,
      9218868437227405311UL.reinterpret_as_double(),
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
    )
  } catch {
    error =>
      fail(
        "original Line linewidth row 27 scale_dashes=False: " +
        error.to_string(),
      )
  }
}

///|
test "original Line linewidth setter sequences" {
  line_width_source_sequence_0()
  line_width_source_sequence_1()
}
