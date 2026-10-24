// Generated from pinned original Artist alpha and Line/color methods; do not edit.
// Native private RGBA-cache warm-order records remain source-only evidence.

///|
fn line_alpha_source_double(actual : Double, expected : Double) -> Unit raise {
  if expected.is_nan() {
    assert_true(actual.is_nan())
  } else {
    assert_eq(actual.reinterpret_as_uint64(), expected.reinterpret_as_uint64())
  }
}

///|
fn line_alpha_source_option(actual : Double?, expected : Double?) -> Unit raise {
  match (actual, expected) {
    (None, None) => ()
    (Some(actual), Some(expected)) => line_alpha_source_double(actual, expected)
    _ => fail("original optional alpha differs")
  }
}

///|
fn line_alpha_source_numbers(
  actual : Array[Double],
  expected : Array[Double],
) -> Unit raise {
  assert_eq(actual.length(), expected.length())
  for index in 0..<actual.length() {
    line_alpha_source_double(actual[index], expected[index])
  }
}

///|
fn line_alpha_source_rgba(
  actual : @colors.Rgba,
  expected : Array[UInt64],
) -> Unit raise {
  assert_eq(
    [
      actual.red().reinterpret_as_uint64(),
      actual.green().reinterpret_as_uint64(),
      actual.blue().reinterpret_as_uint64(),
      actual.alpha().reinterpret_as_uint64(),
    ],
    expected,
  )
}

///|
fn line_alpha_source_state(
  line : Line2D,
  axes : Axes,
  alpha : Double?,
  stale : Bool,
  raw_color : String,
  width : Double,
  invalid : Array[Bool],
  xy : Array[Double],
  data : Array[Double],
  requests : Array[Bool],
  owner_is_none : Bool,
) -> Unit raise {
  line_alpha_source_option(line.get_alpha(), alpha)
  assert_eq(line.stale(), stale)
  assert_eq(line.get_color(), raw_color)
  line_alpha_source_double(line.get_linewidth(), width)
  assert_eq([line.invalid_x, line.invalid_y], invalid)
  assert_eq(line.owner is None, owner_is_none)
  // Observe retained cache directly, without conversion or drawing.
  line_alpha_source_numbers(line.cache.flat.to_array(), xy)
  line_alpha_source_numbers(
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
fn line_alpha_source_setter_sequence() -> Unit raise {
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([0.0, 1.0]),
    LineData::Numeric([10.0, 20.0]),
    color="black",
  )
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  // None/Double setter None
  try {
    // Input fixture only: native clean-stale state, not draw completion.
    line.mark_drawn()
    line_alpha_source_state(
      line,
      axes,
      None,
      false,
      "black",
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
      false,
    )
    line.set_alpha(None)
    line_alpha_source_state(
      line,
      axes,
      None,
      false,
      "black",
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
      false,
    )
  } catch {
    error => fail("original alpha setter row 0: " + error.to_string())
  }
  // None/Double setter None
  try {
    // Input fixture only: native clean-stale state, not draw completion.
    line.mark_drawn()
    line_alpha_source_state(
      line,
      axes,
      None,
      false,
      "black",
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
      false,
    )
    line.set_alpha(None)
    line_alpha_source_state(
      line,
      axes,
      None,
      false,
      "black",
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
      false,
    )
  } catch {
    error => fail("original alpha setter row 1: " + error.to_string())
  }
  // None/Double setter 0.5
  try {
    // Input fixture only: native clean-stale state, not draw completion.
    line.mark_drawn()
    line_alpha_source_state(
      line,
      axes,
      None,
      false,
      "black",
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
      false,
    )
    line.set_alpha(Some(4602678819172646912UL.reinterpret_as_double()))
    line_alpha_source_state(
      line,
      axes,
      Some(4602678819172646912UL.reinterpret_as_double()),
      true,
      "black",
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
      false,
    )
  } catch {
    error => fail("original alpha setter row 2: " + error.to_string())
  }
  // None/Double setter 0.5
  try {
    // Input fixture only: native clean-stale state, not draw completion.
    line.mark_drawn()
    line_alpha_source_state(
      line,
      axes,
      Some(4602678819172646912UL.reinterpret_as_double()),
      false,
      "black",
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
      false,
    )
    line.set_alpha(Some(4602678819172646912UL.reinterpret_as_double()))
    line_alpha_source_state(
      line,
      axes,
      Some(4602678819172646912UL.reinterpret_as_double()),
      false,
      "black",
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
      false,
    )
  } catch {
    error => fail("original alpha setter row 3: " + error.to_string())
  }
  // None/Double setter 0.0
  try {
    // Input fixture only: native clean-stale state, not draw completion.
    line.mark_drawn()
    line_alpha_source_state(
      line,
      axes,
      Some(4602678819172646912UL.reinterpret_as_double()),
      false,
      "black",
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
      false,
    )
    line.set_alpha(Some(0UL.reinterpret_as_double()))
    line_alpha_source_state(
      line,
      axes,
      Some(0UL.reinterpret_as_double()),
      true,
      "black",
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
      false,
    )
  } catch {
    error => fail("original alpha setter row 4: " + error.to_string())
  }
  // None/Double setter -0.0
  try {
    // Input fixture only: native clean-stale state, not draw completion.
    line.mark_drawn()
    line_alpha_source_state(
      line,
      axes,
      Some(0UL.reinterpret_as_double()),
      false,
      "black",
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
      false,
    )
    line.set_alpha(Some(9223372036854775808UL.reinterpret_as_double()))
    line_alpha_source_state(
      line,
      axes,
      Some(0UL.reinterpret_as_double()),
      false,
      "black",
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
      false,
    )
  } catch {
    error => fail("original alpha setter row 5: " + error.to_string())
  }
  // None/Double setter 1.0
  try {
    // Input fixture only: native clean-stale state, not draw completion.
    line.mark_drawn()
    line_alpha_source_state(
      line,
      axes,
      Some(0UL.reinterpret_as_double()),
      false,
      "black",
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
      false,
    )
    line.set_alpha(Some(4607182418800017408UL.reinterpret_as_double()))
    line_alpha_source_state(
      line,
      axes,
      Some(4607182418800017408UL.reinterpret_as_double()),
      true,
      "black",
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
      false,
    )
  } catch {
    error => fail("original alpha setter row 6: " + error.to_string())
  }
  // None/Double setter 1.0
  try {
    // Input fixture only: native clean-stale state, not draw completion.
    line.mark_drawn()
    line_alpha_source_state(
      line,
      axes,
      Some(4607182418800017408UL.reinterpret_as_double()),
      false,
      "black",
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
      false,
    )
    line.set_alpha(Some(4607182418800017408UL.reinterpret_as_double()))
    line_alpha_source_state(
      line,
      axes,
      Some(4607182418800017408UL.reinterpret_as_double()),
      false,
      "black",
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
      false,
    )
  } catch {
    error => fail("original alpha setter row 7: " + error.to_string())
  }
  // None/Double setter nan
  try {
    // Input fixture only: native clean-stale state, not draw completion.
    line.mark_drawn()
    line_alpha_source_state(
      line,
      axes,
      Some(4607182418800017408UL.reinterpret_as_double()),
      false,
      "black",
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
      false,
    )
    assert_true(
      try {
        line.set_alpha(Some(0.0 / 0.0))
        false
      } catch {
        @core.DataError::InvalidTicks(message~) =>
          message == "ValueError: alpha (nan) is outside 0-1 range"
        _ => false
      },
    )
    line_alpha_source_state(
      line,
      axes,
      Some(4607182418800017408UL.reinterpret_as_double()),
      false,
      "black",
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
      false,
    )
  } catch {
    error => fail("original alpha setter row 8: " + error.to_string())
  }
  // None/Double setter inf
  try {
    // Input fixture only: native clean-stale state, not draw completion.
    line.mark_drawn()
    line_alpha_source_state(
      line,
      axes,
      Some(4607182418800017408UL.reinterpret_as_double()),
      false,
      "black",
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
      false,
    )
    assert_true(
      try {
        line.set_alpha(Some(1.0 / 0.0))
        false
      } catch {
        @core.DataError::InvalidTicks(message~) =>
          message == "ValueError: alpha (inf) is outside 0-1 range"
        _ => false
      },
    )
    line_alpha_source_state(
      line,
      axes,
      Some(4607182418800017408UL.reinterpret_as_double()),
      false,
      "black",
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
      false,
    )
  } catch {
    error => fail("original alpha setter row 9: " + error.to_string())
  }
  // None/Double setter -inf
  try {
    // Input fixture only: native clean-stale state, not draw completion.
    line.mark_drawn()
    line_alpha_source_state(
      line,
      axes,
      Some(4607182418800017408UL.reinterpret_as_double()),
      false,
      "black",
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
      false,
    )
    assert_true(
      try {
        line.set_alpha(Some(-1.0 / 0.0))
        false
      } catch {
        @core.DataError::InvalidTicks(message~) =>
          message == "ValueError: alpha (-inf) is outside 0-1 range"
        _ => false
      },
    )
    line_alpha_source_state(
      line,
      axes,
      Some(4607182418800017408UL.reinterpret_as_double()),
      false,
      "black",
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
      false,
    )
  } catch {
    error => fail("original alpha setter row 10: " + error.to_string())
  }
  // None/Double setter -5e-324
  try {
    // Input fixture only: native clean-stale state, not draw completion.
    line.mark_drawn()
    line_alpha_source_state(
      line,
      axes,
      Some(4607182418800017408UL.reinterpret_as_double()),
      false,
      "black",
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
      false,
    )
    assert_true(
      try {
        line.set_alpha(Some(9223372036854775809UL.reinterpret_as_double()))
        false
      } catch {
        @core.DataError::InvalidTicks(message~) =>
          message == "ValueError: alpha (-5e-324) is outside 0-1 range"
        _ => false
      },
    )
    line_alpha_source_state(
      line,
      axes,
      Some(4607182418800017408UL.reinterpret_as_double()),
      false,
      "black",
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
      false,
    )
  } catch {
    error => fail("original alpha setter row 11: " + error.to_string())
  }
  // None/Double setter 1.0000000000000002
  try {
    // Input fixture only: native clean-stale state, not draw completion.
    line.mark_drawn()
    line_alpha_source_state(
      line,
      axes,
      Some(4607182418800017408UL.reinterpret_as_double()),
      false,
      "black",
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
      false,
    )
    assert_true(
      try {
        line.set_alpha(Some(4607182418800017409UL.reinterpret_as_double()))
        false
      } catch {
        @core.DataError::InvalidTicks(message~) =>
          message ==
          "ValueError: alpha (1.0000000000000002) is outside 0-1 range"
        _ => false
      },
    )
    line_alpha_source_state(
      line,
      axes,
      Some(4607182418800017408UL.reinterpret_as_double()),
      false,
      "black",
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
      false,
    )
  } catch {
    error => fail("original alpha setter row 12: " + error.to_string())
  }
  // None/Double setter None
  try {
    // Input fixture only: native clean-stale state, not draw completion.
    line.mark_drawn()
    line_alpha_source_state(
      line,
      axes,
      Some(4607182418800017408UL.reinterpret_as_double()),
      false,
      "black",
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
      false,
    )
    line.set_alpha(None)
    line_alpha_source_state(
      line,
      axes,
      None,
      true,
      "black",
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
      false,
    )
  } catch {
    error => fail("original alpha setter row 13: " + error.to_string())
  }
  // None/Double setter None
  try {
    // Input fixture only: native clean-stale state, not draw completion.
    line.mark_drawn()
    line_alpha_source_state(
      line,
      axes,
      None,
      false,
      "black",
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
      false,
    )
    line.set_alpha(None)
    line_alpha_source_state(
      line,
      axes,
      None,
      false,
      "black",
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
      false,
    )
  } catch {
    error => fail("original alpha setter row 14: " + error.to_string())
  }
  // None/Double setter -0.0
  try {
    // Input fixture only: native clean-stale state, not draw completion.
    line.mark_drawn()
    line_alpha_source_state(
      line,
      axes,
      None,
      false,
      "black",
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
      false,
    )
    line.set_alpha(Some(9223372036854775808UL.reinterpret_as_double()))
    line_alpha_source_state(
      line,
      axes,
      Some(9223372036854775808UL.reinterpret_as_double()),
      true,
      "black",
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
      false,
    )
  } catch {
    error => fail("original alpha setter row 15: " + error.to_string())
  }
  // None/Double setter 0.0
  try {
    // Input fixture only: native clean-stale state, not draw completion.
    line.mark_drawn()
    line_alpha_source_state(
      line,
      axes,
      Some(9223372036854775808UL.reinterpret_as_double()),
      false,
      "black",
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
      false,
    )
    line.set_alpha(Some(0UL.reinterpret_as_double()))
    line_alpha_source_state(
      line,
      axes,
      Some(9223372036854775808UL.reinterpret_as_double()),
      false,
      "black",
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
      false,
    )
  } catch {
    error => fail("original alpha setter row 16: " + error.to_string())
  }
  // None/Double setter None
  try {
    // Input fixture only: native clean-stale state, not draw completion.
    line.mark_drawn()
    line_alpha_source_state(
      line,
      axes,
      Some(9223372036854775808UL.reinterpret_as_double()),
      false,
      "black",
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
      false,
    )
    line.set_alpha(None)
    line_alpha_source_state(
      line,
      axes,
      None,
      true,
      "black",
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
      false,
    )
  } catch {
    error => fail("original alpha setter row 17: " + error.to_string())
  }
  // None/Double setter 5e-324
  try {
    // Input fixture only: native clean-stale state, not draw completion.
    line.mark_drawn()
    line_alpha_source_state(
      line,
      axes,
      None,
      false,
      "black",
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
      false,
    )
    line.set_alpha(Some(1UL.reinterpret_as_double()))
    line_alpha_source_state(
      line,
      axes,
      Some(1UL.reinterpret_as_double()),
      true,
      "black",
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
      false,
    )
  } catch {
    error => fail("original alpha setter row 18: " + error.to_string())
  }
  // None/Double setter 0.9999999999999999
  try {
    // Input fixture only: native clean-stale state, not draw completion.
    line.mark_drawn()
    line_alpha_source_state(
      line,
      axes,
      Some(1UL.reinterpret_as_double()),
      false,
      "black",
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
      false,
    )
    line.set_alpha(Some(4607182418800017407UL.reinterpret_as_double()))
    line_alpha_source_state(
      line,
      axes,
      Some(4607182418800017407UL.reinterpret_as_double()),
      true,
      "black",
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
      false,
    )
  } catch {
    error => fail("original alpha setter row 19: " + error.to_string())
  }
  // detached ownerNone reset
  try {
    // Controlled source ownerNone input: detach only, retaining ranges/cache.
    line.detach()
    // Input fixture only: native clean-stale state, not draw completion.
    line.mark_drawn()
    line_alpha_source_state(
      line,
      axes,
      Some(4607182418800017407UL.reinterpret_as_double()),
      false,
      "black",
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
      true,
    )
    line.set_alpha(None)
    line_alpha_source_state(
      line,
      axes,
      None,
      true,
      "black",
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
      true,
    )
  } catch {
    error => fail("original alpha setter row 20: " + error.to_string())
  }
  // detached ownerNone numeric setter
  try {
    // Input fixture only: native clean-stale state, not draw completion.
    line.mark_drawn()
    line_alpha_source_state(
      line,
      axes,
      None,
      false,
      "black",
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
      true,
    )
    line.set_alpha(Some(4598175219545276416UL.reinterpret_as_double()))
    line_alpha_source_state(
      line,
      axes,
      Some(4598175219545276416UL.reinterpret_as_double()),
      true,
      "black",
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
      true,
    )
  } catch {
    error => fail("original alpha setter row 21: " + error.to_string())
  }
}

///|
test "original Artist None Double alpha setter sequence" {
  line_alpha_source_setter_sequence()
}

///|
fn line_alpha_source_rgba_overrides() -> Unit raise {
  let previous_cycle = @config.color_cycle()
  defer (try! @config.set_color_cycle(previous_cycle))
  @config.set_color_cycle(["#11223344", "none"])
  line_alpha_source_rgba(line_color_rgba("red", alpha=None), [
    4607182418800017408UL, 0UL, 0UL, 4607182418800017408UL,
  ]) catch {
    error => fail("original alpha override row 0: " + error.to_string())
  }
  line_alpha_source_rgba(
    line_color_rgba("red", alpha=Some(0UL.reinterpret_as_double())),
    [4607182418800017408UL, 0UL, 0UL, 0UL],
  ) catch {
    error => fail("original alpha override row 1: " + error.to_string())
  }
  line_alpha_source_rgba(
    line_color_rgba(
      "red",
      alpha=Some(4598175219545276416UL.reinterpret_as_double()),
    ),
    [4607182418800017408UL, 0UL, 0UL, 4598175219545276416UL],
  ) catch {
    error => fail("original alpha override row 2: " + error.to_string())
  }
  line_alpha_source_rgba(
    line_color_rgba(
      "red",
      alpha=Some(4607182418800017408UL.reinterpret_as_double()),
    ),
    [4607182418800017408UL, 0UL, 0UL, 4607182418800017408UL],
  ) catch {
    error => fail("original alpha override row 3: " + error.to_string())
  }
  line_alpha_source_rgba(line_color_rgba("none", alpha=None), [
    0UL, 0UL, 0UL, 0UL,
  ]) catch {
    error => fail("original alpha override row 4: " + error.to_string())
  }
  line_alpha_source_rgba(
    line_color_rgba("none", alpha=Some(0UL.reinterpret_as_double())),
    [0UL, 0UL, 0UL, 0UL],
  ) catch {
    error => fail("original alpha override row 5: " + error.to_string())
  }
  line_alpha_source_rgba(
    line_color_rgba(
      "none",
      alpha=Some(4598175219545276416UL.reinterpret_as_double()),
    ),
    [0UL, 0UL, 0UL, 0UL],
  ) catch {
    error => fail("original alpha override row 6: " + error.to_string())
  }
  line_alpha_source_rgba(
    line_color_rgba(
      "none",
      alpha=Some(4607182418800017408UL.reinterpret_as_double()),
    ),
    [0UL, 0UL, 0UL, 0UL],
  ) catch {
    error => fail("original alpha override row 7: " + error.to_string())
  }
  line_alpha_source_rgba(line_color_rgba("#1234", alpha=None), [
    4589468260265693457UL, 4593971859893063953UL, 4596373779694328218UL, 4598475459520434449UL,
  ]) catch {
    error => fail("original alpha override row 8: " + error.to_string())
  }
  line_alpha_source_rgba(
    line_color_rgba("#1234", alpha=Some(0UL.reinterpret_as_double())),
    [4589468260265693457UL, 4593971859893063953UL, 4596373779694328218UL, 0UL],
  ) catch {
    error => fail("original alpha override row 9: " + error.to_string())
  }
  line_alpha_source_rgba(
    line_color_rgba(
      "#1234",
      alpha=Some(4598175219545276416UL.reinterpret_as_double()),
    ),
    [
      4589468260265693457UL, 4593971859893063953UL, 4596373779694328218UL, 4598175219545276416UL,
    ],
  ) catch {
    error => fail("original alpha override row 10: " + error.to_string())
  }
  line_alpha_source_rgba(
    line_color_rgba(
      "#1234",
      alpha=Some(4607182418800017408UL.reinterpret_as_double()),
    ),
    [
      4589468260265693457UL, 4593971859893063953UL, 4596373779694328218UL, 4607182418800017408UL,
    ],
  ) catch {
    error => fail("original alpha override row 11: " + error.to_string())
  }
  line_alpha_source_rgba(line_color_rgba("#11223344", alpha=None), [
    4589468260265693457UL, 4593971859893063953UL, 4596373779694328218UL, 4598475459520434449UL,
  ]) catch {
    error => fail("original alpha override row 12: " + error.to_string())
  }
  line_alpha_source_rgba(
    line_color_rgba("#11223344", alpha=Some(0UL.reinterpret_as_double())),
    [4589468260265693457UL, 4593971859893063953UL, 4596373779694328218UL, 0UL],
  ) catch {
    error => fail("original alpha override row 13: " + error.to_string())
  }
  line_alpha_source_rgba(
    line_color_rgba(
      "#11223344",
      alpha=Some(4598175219545276416UL.reinterpret_as_double()),
    ),
    [
      4589468260265693457UL, 4593971859893063953UL, 4596373779694328218UL, 4598175219545276416UL,
    ],
  ) catch {
    error => fail("original alpha override row 14: " + error.to_string())
  }
  line_alpha_source_rgba(
    line_color_rgba(
      "#11223344",
      alpha=Some(4607182418800017408UL.reinterpret_as_double()),
    ),
    [
      4589468260265693457UL, 4593971859893063953UL, 4596373779694328218UL, 4607182418800017408UL,
    ],
  ) catch {
    error => fail("original alpha override row 15: " + error.to_string())
  }
  line_alpha_source_rgba(line_color_rgba("#0000", alpha=None), [
    0UL, 0UL, 0UL, 0UL,
  ]) catch {
    error => fail("original alpha override row 16: " + error.to_string())
  }
  line_alpha_source_rgba(
    line_color_rgba("#0000", alpha=Some(0UL.reinterpret_as_double())),
    [0UL, 0UL, 0UL, 0UL],
  ) catch {
    error => fail("original alpha override row 17: " + error.to_string())
  }
  line_alpha_source_rgba(
    line_color_rgba(
      "#0000",
      alpha=Some(4598175219545276416UL.reinterpret_as_double()),
    ),
    [0UL, 0UL, 0UL, 4598175219545276416UL],
  ) catch {
    error => fail("original alpha override row 18: " + error.to_string())
  }
  line_alpha_source_rgba(
    line_color_rgba(
      "#0000",
      alpha=Some(4607182418800017408UL.reinterpret_as_double()),
    ),
    [0UL, 0UL, 0UL, 4607182418800017408UL],
  ) catch {
    error => fail("original alpha override row 19: " + error.to_string())
  }
  line_alpha_source_rgba(line_color_rgba("C0", alpha=None), [
    4589468260265693457UL, 4593971859893063953UL, 4596373779694328218UL, 4598475459520434449UL,
  ]) catch {
    error => fail("original alpha override row 20: " + error.to_string())
  }
  line_alpha_source_rgba(
    line_color_rgba("C0", alpha=Some(0UL.reinterpret_as_double())),
    [4589468260265693457UL, 4593971859893063953UL, 4596373779694328218UL, 0UL],
  ) catch {
    error => fail("original alpha override row 21: " + error.to_string())
  }
  line_alpha_source_rgba(
    line_color_rgba(
      "C0",
      alpha=Some(4598175219545276416UL.reinterpret_as_double()),
    ),
    [
      4589468260265693457UL, 4593971859893063953UL, 4596373779694328218UL, 4598175219545276416UL,
    ],
  ) catch {
    error => fail("original alpha override row 22: " + error.to_string())
  }
  line_alpha_source_rgba(
    line_color_rgba(
      "C0",
      alpha=Some(4607182418800017408UL.reinterpret_as_double()),
    ),
    [
      4589468260265693457UL, 4593971859893063953UL, 4596373779694328218UL, 4607182418800017408UL,
    ],
  ) catch {
    error => fail("original alpha override row 23: " + error.to_string())
  }
  line_alpha_source_rgba(line_color_rgba("C1", alpha=None), [0UL, 0UL, 0UL, 0UL]) catch {
    error => fail("original alpha override row 24: " + error.to_string())
  }
  line_alpha_source_rgba(
    line_color_rgba("C1", alpha=Some(0UL.reinterpret_as_double())),
    [0UL, 0UL, 0UL, 0UL],
  ) catch {
    error => fail("original alpha override row 25: " + error.to_string())
  }
  line_alpha_source_rgba(
    line_color_rgba(
      "C1",
      alpha=Some(4598175219545276416UL.reinterpret_as_double()),
    ),
    [0UL, 0UL, 0UL, 0UL],
  ) catch {
    error => fail("original alpha override row 26: " + error.to_string())
  }
  line_alpha_source_rgba(
    line_color_rgba(
      "C1",
      alpha=Some(4607182418800017408UL.reinterpret_as_double()),
    ),
    [0UL, 0UL, 0UL, 0UL],
  ) catch {
    error => fail("original alpha override row 27: " + error.to_string())
  }
}

///|
test "original color alpha override primitives" {
  line_alpha_source_rgba_overrides()
}

///|
fn line_alpha_source_draw_0() -> Unit raise {
  let previous_cycle = @config.color_cycle()
  defer (try! @config.set_color_cycle(previous_cycle))
  @config.set_color_cycle(["#11223344", "none"])
  let fig = figure()
  let axes = fig.axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ]),
    LineData::Numeric([
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ]),
    color="black",
  )
  line.set_color("red")
  line.set_alpha(Some(0UL.reinterpret_as_double()))
  line_alpha_source_option(line.get_alpha(), Some(0UL.reinterpret_as_double()))
  assert_eq(line.stale(), true)
  assert_eq(line.get_visible(), true)
  assert_eq([line.invalid_x, line.invalid_y], [false, false])
  line_alpha_source_numbers(line.cache.flat.to_array(), [
    0UL.reinterpret_as_double(),
    4621819117588971520UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  ])
  let panel = fig.to_render_figure().panels()[0]
  guard panel.prepare_line(line.points) is Some(context) else {
    fail("expected registered Line provider")
  }
  context.complete()
  line_alpha_source_option(line.get_alpha(), Some(0UL.reinterpret_as_double()))
  assert_eq(line.stale(), false)
  assert_eq(line.get_color(), "red")
  assert_eq(line.get_visible(), true)
  assert_eq([line.invalid_x, line.invalid_y], [false, false])
  line_alpha_source_numbers(line.cache.flat.to_array(), [
    0UL.reinterpret_as_double(),
    4621819117588971520UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  ])
}

///|
fn line_alpha_source_draw_1() -> Unit raise {
  let previous_cycle = @config.color_cycle()
  defer (try! @config.set_color_cycle(previous_cycle))
  @config.set_color_cycle(["#11223344", "none"])
  let fig = figure()
  let axes = fig.axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ]),
    LineData::Numeric([
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ]),
    color="black",
  )
  line.set_color(
    "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
  )
  line.set_alpha(Some(0UL.reinterpret_as_double()))
  line.set_ydata(LineData::Numeric([1.0, 2.0, 3.0]))
  line_alpha_source_option(line.get_alpha(), Some(0UL.reinterpret_as_double()))
  assert_eq(line.stale(), true)
  assert_eq(line.get_visible(), true)
  assert_eq([line.invalid_x, line.invalid_y], [false, true])
  line_alpha_source_numbers(line.cache.flat.to_array(), [
    0UL.reinterpret_as_double(),
    4621819117588971520UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  ])
  let panel = fig.to_render_figure().panels()[0]
  assert_true(
    try {
      guard panel.prepare_line(line.points) is Some(context) else {
        fail("expected registered Line provider")
      }
      context.complete()
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "shape mismatch: objects cannot be broadcast to a single shape.  Mismatch is between arg 0 with shape (2,) and arg 1 with shape (3,)."
      _ => false
    },
  )
  line_alpha_source_option(line.get_alpha(), Some(0UL.reinterpret_as_double()))
  assert_eq(line.stale(), true)
  assert_eq(
    line.get_color(),
    "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
  )
  assert_eq(line.get_visible(), true)
  assert_eq([line.invalid_x, line.invalid_y], [false, true])
  line_alpha_source_numbers(line.cache.flat.to_array(), [
    0UL.reinterpret_as_double(),
    4621819117588971520UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  ])
}

///|
fn line_alpha_source_draw_2() -> Unit raise {
  let previous_cycle = @config.color_cycle()
  defer (try! @config.set_color_cycle(previous_cycle))
  @config.set_color_cycle(["#11223344", "none"])
  let fig = figure()
  let axes = fig.axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ]),
    LineData::Numeric([
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ]),
    color="black",
  )
  line.set_color(
    "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
  )
  line.set_alpha(Some(0UL.reinterpret_as_double()))
  line_alpha_source_option(line.get_alpha(), Some(0UL.reinterpret_as_double()))
  assert_eq(line.stale(), true)
  assert_eq(line.get_visible(), true)
  assert_eq([line.invalid_x, line.invalid_y], [false, false])
  line_alpha_source_numbers(line.cache.flat.to_array(), [
    0UL.reinterpret_as_double(),
    4621819117588971520UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  ])
  let panel = fig.to_render_figure().panels()[0]
  assert_true(
    try {
      guard panel.prepare_line(line.points) is Some(context) else {
        fail("expected registered Line provider")
      }
      context.complete()
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: Exceeds the limit (4300 digits) for integer string conversion: value has 4301 digits; use sys.set_int_max_str_digits() to increase the limit"
      _ => false
    },
  )
  line_alpha_source_option(line.get_alpha(), Some(0UL.reinterpret_as_double()))
  assert_eq(line.stale(), true)
  assert_eq(
    line.get_color(),
    "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
  )
  assert_eq(line.get_visible(), true)
  assert_eq([line.invalid_x, line.invalid_y], [false, false])
  line_alpha_source_numbers(line.cache.flat.to_array(), [
    0UL.reinterpret_as_double(),
    4621819117588971520UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  ])
}

///|
fn line_alpha_source_draw_3() -> Unit raise {
  let previous_cycle = @config.color_cycle()
  defer (try! @config.set_color_cycle(previous_cycle))
  @config.set_color_cycle(["#11223344", "none"])
  let fig = figure()
  let axes = fig.axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([]),
    LineData::Numeric([]),
    color="black",
  )
  line.set_color(
    "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
  )
  line.set_alpha(Some(0UL.reinterpret_as_double()))
  line_alpha_source_option(line.get_alpha(), Some(0UL.reinterpret_as_double()))
  assert_eq(line.stale(), true)
  assert_eq(line.get_visible(), true)
  assert_eq([line.invalid_x, line.invalid_y], [false, false])
  line_alpha_source_numbers(line.cache.flat.to_array(), [])
  let panel = fig.to_render_figure().panels()[0]
  guard panel.prepare_line(line.points) is Some(context) else {
    fail("expected registered Line provider")
  }
  context.complete()
  line_alpha_source_option(line.get_alpha(), Some(0UL.reinterpret_as_double()))
  assert_eq(line.stale(), false)
  assert_eq(
    line.get_color(),
    "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
  )
  assert_eq(line.get_visible(), true)
  assert_eq([line.invalid_x, line.invalid_y], [false, false])
  line_alpha_source_numbers(line.cache.flat.to_array(), [])
}

///|
fn line_alpha_source_draw_4() -> Unit raise {
  let previous_cycle = @config.color_cycle()
  defer (try! @config.set_color_cycle(previous_cycle))
  @config.set_color_cycle(["#11223344", "none"])
  let fig = figure()
  let axes = fig.axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
    ]),
    LineData::Numeric([
      4621819117588971520UL.reinterpret_as_double(),
      4626322717216342016UL.reinterpret_as_double(),
    ]),
    color="black",
  )
  line.set_color(
    "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
  )
  line.set_alpha(Some(0UL.reinterpret_as_double()))
  line.set_ydata(LineData::Numeric([1.0, 2.0, 3.0]))
  line.set_visible(false)
  line_alpha_source_option(line.get_alpha(), Some(0UL.reinterpret_as_double()))
  assert_eq(line.stale(), true)
  assert_eq(line.get_visible(), false)
  assert_eq([line.invalid_x, line.invalid_y], [false, true])
  line_alpha_source_numbers(line.cache.flat.to_array(), [
    0UL.reinterpret_as_double(),
    4621819117588971520UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  ])
  let panel = fig.to_render_figure().panels()[0]
  guard panel.prepare_line(line.points) is Some(context) else {
    fail("expected registered Line provider")
  }
  context.complete()
  line_alpha_source_option(line.get_alpha(), Some(0UL.reinterpret_as_double()))
  assert_eq(line.stale(), true)
  assert_eq(
    line.get_color(),
    "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
  )
  assert_eq(line.get_visible(), false)
  assert_eq([line.invalid_x, line.invalid_y], [false, true])
  line_alpha_source_numbers(line.cache.flat.to_array(), [
    0UL.reinterpret_as_double(),
    4621819117588971520UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  ])
}

///|
test "original Line alpha zero leaf draw timing" {
  line_alpha_source_draw_0() catch {
    error => fail("original alpha draw row 0: " + error.to_string())
  }
  line_alpha_source_draw_1() catch {
    error => fail("original alpha draw row 1: " + error.to_string())
  }
  line_alpha_source_draw_2() catch {
    error => fail("original alpha draw row 2: " + error.to_string())
  }
  line_alpha_source_draw_3() catch {
    error => fail("original alpha draw row 3: " + error.to_string())
  }
  line_alpha_source_draw_4() catch {
    error => fail("original alpha draw row 4: " + error.to_string())
  }
}
