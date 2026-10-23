// Generated from pinned original Line String color and RGBA helpers; do not edit.

///|
fn line_color_source_double(actual : Double, expected : Double) -> Unit raise {
  if expected.is_nan() {
    assert_true(actual.is_nan())
  } else {
    assert_eq(actual.reinterpret_as_uint64(), expected.reinterpret_as_uint64())
  }
}

///|
fn line_color_source_numbers(
  actual : Array[Double],
  expected : Array[Double],
) -> Unit raise {
  assert_eq(actual.length(), expected.length())
  for index in 0..<actual.length() {
    line_color_source_double(actual[index], expected[index])
  }
}

///|
fn line_color_source_rgba(
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
fn line_color_source_state(
  line : Line2D,
  axes : Axes,
  raw_color : String,
  stale : Bool,
  width : Double,
  invalid : Array[Bool],
  xy : Array[Double],
  data : Array[Double],
  requests : Array[Bool],
) -> Unit raise {
  assert_eq(line.get_color(), raw_color)
  assert_eq(line.stale(), stale)
  line_color_source_double(line.get_linewidth(), width)
  assert_eq([line.invalid_x, line.invalid_y], invalid)
  // Retained storage only: do not turn a state assertion into lazy conversion.
  line_color_source_numbers(line.cache.flat.to_array(), xy)
  line_color_source_numbers(
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
fn line_color_source_name(
  name : String,
  expected : Array[UInt64],
) -> Unit raise {
  guard line_color_named(name) is Some(named) else {
    fail("missing original named color: " + name)
  }
  line_color_source_rgba(named, expected)
  line_color_source_rgba(line_color_rgba(name), expected)
}

///|
fn line_color_source_sequence_0() -> Unit raise {
  let previous_cycle = @config.color_cycle()
  defer (try! @config.set_color_cycle(previous_cycle))
  @config.set_color_cycle(["#112233", "#abcdef"])
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([0.0, 1.0]),
    LineData::Numeric([10.0, 20.0]),
    color="black",
  )
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  // string 'red'
  try {
    // Controlled stale=False input only; this is not a draw completion.
    line.mark_drawn()
    line_color_source_state(
      line,
      axes,
      "black",
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
    line.set_color("red")
    line_color_source_state(
      line,
      axes,
      "red",
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
    line_color_source_rgba(line_color_rgba(line.get_color()), [
      4607182418800017408UL, 0UL, 0UL, 4607182418800017408UL,
    ])
  } catch {
    error => fail("original Line color scenario 0, row 0: " + error.to_string())
  }
  // string 'red'
  try {
    // Controlled stale=False input only; this is not a draw completion.
    line.mark_drawn()
    line_color_source_state(
      line,
      axes,
      "red",
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
    line.set_color("red")
    line_color_source_state(
      line,
      axes,
      "red",
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
    line_color_source_rgba(line_color_rgba(line.get_color()), [
      4607182418800017408UL, 0UL, 0UL, 4607182418800017408UL,
    ])
  } catch {
    error => fail("original Line color scenario 0, row 1: " + error.to_string())
  }
  // string 'RED'
  try {
    // Controlled stale=False input only; this is not a draw completion.
    line.mark_drawn()
    line_color_source_state(
      line,
      axes,
      "red",
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
    line.set_color("RED")
    line_color_source_state(
      line,
      axes,
      "RED",
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
    line_color_source_rgba(line_color_rgba(line.get_color()), [
      4607182418800017408UL, 0UL, 0UL, 4607182418800017408UL,
    ])
  } catch {
    error => fail("original Line color scenario 0, row 2: " + error.to_string())
  }
  // string 'r'
  try {
    // Controlled stale=False input only; this is not a draw completion.
    line.mark_drawn()
    line_color_source_state(
      line,
      axes,
      "RED",
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
    line.set_color("r")
    line_color_source_state(
      line,
      axes,
      "r",
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
    line_color_source_rgba(line_color_rgba(line.get_color()), [
      4607182418800017408UL, 0UL, 0UL, 4607182418800017408UL,
    ])
  } catch {
    error => fail("original Line color scenario 0, row 3: " + error.to_string())
  }
  // string 'R'
  try {
    // Controlled stale=False input only; this is not a draw completion.
    line.mark_drawn()
    line_color_source_state(
      line,
      axes,
      "r",
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
    assert_true(
      try {
        line.set_color("R")
        false
      } catch {
        @core.DataError::InvalidTicks(message~) =>
          message ==
          "ValueError: 'R' is not a valid value for color: supported inputs are (r, g, b) and (r, g, b, a) 0-1 float tuples; '#rrggbb', '#rrggbbaa', '#rgb', '#rgba' strings; named color strings; string reprs of 0-1 floats for grayscale values; 'C0', 'C1', ... strings for colors of the color cycle; and pairs combining one of the above with an alpha value"
        _ => false
      },
    )
    line_color_source_state(
      line,
      axes,
      "r",
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
  } catch {
    error => fail("original Line color scenario 0, row 4: " + error.to_string())
  }
  // string '#f0a'
  try {
    // Controlled stale=False input only; this is not a draw completion.
    line.mark_drawn()
    line_color_source_state(
      line,
      axes,
      "r",
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
    line.set_color("#f0a")
    line_color_source_state(
      line,
      axes,
      "#f0a",
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
    line_color_source_rgba(line_color_rgba(line.get_color()), [
      4607182418800017408UL, 0UL, 4604180019048437077UL, 4607182418800017408UL,
    ])
  } catch {
    error => fail("original Line color scenario 0, row 5: " + error.to_string())
  }
  // string '#F0A8'
  try {
    // Controlled stale=False input only; this is not a draw completion.
    line.mark_drawn()
    line_color_source_state(
      line,
      axes,
      "#f0a",
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
    line.set_color("#F0A8")
    line_color_source_state(
      line,
      axes,
      "#F0A8",
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
    line_color_source_rgba(line_color_rgba(line.get_color()), [
      4607182418800017408UL, 0UL, 4604180019048437077UL, 4602979059147804945UL,
    ])
  } catch {
    error => fail("original Line color scenario 0, row 6: " + error.to_string())
  }
  // string '#123456'
  try {
    // Controlled stale=False input only; this is not a draw completion.
    line.mark_drawn()
    line_color_source_state(
      line,
      axes,
      "#F0A8",
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
    line.set_color("#123456")
    line_color_source_state(
      line,
      axes,
      "#123456",
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
    line_color_source_rgba(line_color_rgba(line.get_color()), [
      4589750839065842194UL, 4596515069094402586UL, 4599747064121103766UL, 4607182418800017408UL,
    ])
  } catch {
    error => fail("original Line color scenario 0, row 7: " + error.to_string())
  }
  // string '#12345680'
  try {
    // Controlled stale=False input only; this is not a draw completion.
    line.mark_drawn()
    line_color_source_state(
      line,
      axes,
      "#123456",
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
    line.set_color("#12345680")
    line_color_source_state(
      line,
      axes,
      "#12345680",
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
    line_color_source_rgba(line_color_rgba(line.get_color()), [
      4589750839065842194UL, 4596515069094402586UL, 4599747064121103766UL, 4602696480347656208UL,
    ])
  } catch {
    error => fail("original Line color scenario 0, row 8: " + error.to_string())
  }
  // string 'none'
  try {
    // Controlled stale=False input only; this is not a draw completion.
    line.mark_drawn()
    line_color_source_state(
      line,
      axes,
      "#12345680",
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
    line.set_color("none")
    line_color_source_state(
      line,
      axes,
      "none",
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
    line_color_source_rgba(line_color_rgba(line.get_color()), [
      0UL, 0UL, 0UL, 0UL,
    ])
  } catch {
    error => fail("original Line color scenario 0, row 9: " + error.to_string())
  }
  // string 'None'
  try {
    // Controlled stale=False input only; this is not a draw completion.
    line.mark_drawn()
    line_color_source_state(
      line,
      axes,
      "none",
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
    line.set_color("None")
    line_color_source_state(
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
    line_color_source_rgba(line_color_rgba(line.get_color()), [
      0UL, 0UL, 0UL, 0UL,
    ])
  } catch {
    error =>
      fail("original Line color scenario 0, row 10: " + error.to_string())
  }
  // string 'NONE'
  try {
    // Controlled stale=False input only; this is not a draw completion.
    line.mark_drawn()
    line_color_source_state(
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
    line.set_color("NONE")
    line_color_source_state(
      line,
      axes,
      "NONE",
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
    line_color_source_rgba(line_color_rgba(line.get_color()), [
      0UL, 0UL, 0UL, 0UL,
    ])
  } catch {
    error =>
      fail("original Line color scenario 0, row 11: " + error.to_string())
  }
  // string 'transparent'
  try {
    // Controlled stale=False input only; this is not a draw completion.
    line.mark_drawn()
    line_color_source_state(
      line,
      axes,
      "NONE",
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
    assert_true(
      try {
        line.set_color("transparent")
        false
      } catch {
        @core.DataError::InvalidTicks(message~) =>
          message ==
          "ValueError: 'transparent' is not a valid value for color: supported inputs are (r, g, b) and (r, g, b, a) 0-1 float tuples; '#rrggbb', '#rrggbbaa', '#rgb', '#rgba' strings; named color strings; string reprs of 0-1 floats for grayscale values; 'C0', 'C1', ... strings for colors of the color cycle; and pairs combining one of the above with an alpha value"
        _ => false
      },
    )
    line_color_source_state(
      line,
      axes,
      "NONE",
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
  } catch {
    error =>
      fail("original Line color scenario 0, row 12: " + error.to_string())
  }
  // string ''
  try {
    // Controlled stale=False input only; this is not a draw completion.
    line.mark_drawn()
    line_color_source_state(
      line,
      axes,
      "NONE",
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
    assert_true(
      try {
        line.set_color("")
        false
      } catch {
        @core.DataError::InvalidTicks(message~) =>
          message ==
          "ValueError: '' is not a valid value for color: supported inputs are (r, g, b) and (r, g, b, a) 0-1 float tuples; '#rrggbb', '#rrggbbaa', '#rgb', '#rgba' strings; named color strings; string reprs of 0-1 floats for grayscale values; 'C0', 'C1', ... strings for colors of the color cycle; and pairs combining one of the above with an alpha value"
        _ => false
      },
    )
    line_color_source_state(
      line,
      axes,
      "NONE",
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
  } catch {
    error =>
      fail("original Line color scenario 0, row 13: " + error.to_string())
  }
  // string ' '
  try {
    // Controlled stale=False input only; this is not a draw completion.
    line.mark_drawn()
    line_color_source_state(
      line,
      axes,
      "NONE",
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
    assert_true(
      try {
        line.set_color(" ")
        false
      } catch {
        @core.DataError::InvalidTicks(message~) =>
          message ==
          "ValueError: ' ' is not a valid value for color: supported inputs are (r, g, b) and (r, g, b, a) 0-1 float tuples; '#rrggbb', '#rrggbbaa', '#rgb', '#rgba' strings; named color strings; string reprs of 0-1 floats for grayscale values; 'C0', 'C1', ... strings for colors of the color cycle; and pairs combining one of the above with an alpha value"
        _ => false
      },
    )
    line_color_source_state(
      line,
      axes,
      "NONE",
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
  } catch {
    error =>
      fail("original Line color scenario 0, row 14: " + error.to_string())
  }
  // string ' red '
  try {
    // Controlled stale=False input only; this is not a draw completion.
    line.mark_drawn()
    line_color_source_state(
      line,
      axes,
      "NONE",
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
    assert_true(
      try {
        line.set_color(" red ")
        false
      } catch {
        @core.DataError::InvalidTicks(message~) =>
          message ==
          "ValueError: ' red ' is not a valid value for color: supported inputs are (r, g, b) and (r, g, b, a) 0-1 float tuples; '#rrggbb', '#rrggbbaa', '#rgb', '#rgba' strings; named color strings; string reprs of 0-1 floats for grayscale values; 'C0', 'C1', ... strings for colors of the color cycle; and pairs combining one of the above with an alpha value"
        _ => false
      },
    )
    line_color_source_state(
      line,
      axes,
      "NONE",
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
  } catch {
    error =>
      fail("original Line color scenario 0, row 15: " + error.to_string())
  }
  // string '0.5'
  try {
    // Controlled stale=False input only; this is not a draw completion.
    line.mark_drawn()
    line_color_source_state(
      line,
      axes,
      "NONE",
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
    line.set_color("0.5")
    line_color_source_state(
      line,
      axes,
      "0.5",
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
    line_color_source_rgba(line_color_rgba(line.get_color()), [
      4602678819172646912UL, 4602678819172646912UL, 4602678819172646912UL, 4607182418800017408UL,
    ])
  } catch {
    error =>
      fail("original Line color scenario 0, row 16: " + error.to_string())
  }
  // string ' 0.5 '
  try {
    // Controlled stale=False input only; this is not a draw completion.
    line.mark_drawn()
    line_color_source_state(
      line,
      axes,
      "0.5",
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
    line.set_color(" 0.5 ")
    line_color_source_state(
      line,
      axes,
      " 0.5 ",
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
    line_color_source_rgba(line_color_rgba(line.get_color()), [
      4602678819172646912UL, 4602678819172646912UL, 4602678819172646912UL, 4607182418800017408UL,
    ])
  } catch {
    error =>
      fail("original Line color scenario 0, row 17: " + error.to_string())
  }
  // string '.5'
  try {
    // Controlled stale=False input only; this is not a draw completion.
    line.mark_drawn()
    line_color_source_state(
      line,
      axes,
      " 0.5 ",
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
    line.set_color(".5")
    line_color_source_state(
      line,
      axes,
      ".5",
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
    line_color_source_rgba(line_color_rgba(line.get_color()), [
      4602678819172646912UL, 4602678819172646912UL, 4602678819172646912UL, 4607182418800017408UL,
    ])
  } catch {
    error =>
      fail("original Line color scenario 0, row 18: " + error.to_string())
  }
  // string '5e-1'
  try {
    // Controlled stale=False input only; this is not a draw completion.
    line.mark_drawn()
    line_color_source_state(
      line,
      axes,
      ".5",
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
    line.set_color("5e-1")
    line_color_source_state(
      line,
      axes,
      "5e-1",
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
    line_color_source_rgba(line_color_rgba(line.get_color()), [
      4602678819172646912UL, 4602678819172646912UL, 4602678819172646912UL, 4607182418800017408UL,
    ])
  } catch {
    error =>
      fail("original Line color scenario 0, row 19: " + error.to_string())
  }
  // string '+0.5'
  try {
    // Controlled stale=False input only; this is not a draw completion.
    line.mark_drawn()
    line_color_source_state(
      line,
      axes,
      "5e-1",
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
    line.set_color("+0.5")
    line_color_source_state(
      line,
      axes,
      "+0.5",
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
    line_color_source_rgba(line_color_rgba(line.get_color()), [
      4602678819172646912UL, 4602678819172646912UL, 4602678819172646912UL, 4607182418800017408UL,
    ])
  } catch {
    error =>
      fail("original Line color scenario 0, row 20: " + error.to_string())
  }
  // string '-0.0'
  try {
    // Controlled stale=False input only; this is not a draw completion.
    line.mark_drawn()
    line_color_source_state(
      line,
      axes,
      "+0.5",
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
    line.set_color("-0.0")
    line_color_source_state(
      line,
      axes,
      "-0.0",
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
    line_color_source_rgba(line_color_rgba(line.get_color()), [
      9223372036854775808UL, 9223372036854775808UL, 9223372036854775808UL, 4607182418800017408UL,
    ])
  } catch {
    error =>
      fail("original Line color scenario 0, row 21: " + error.to_string())
  }
  // string '1'
  try {
    // Controlled stale=False input only; this is not a draw completion.
    line.mark_drawn()
    line_color_source_state(
      line,
      axes,
      "-0.0",
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
    line.set_color("1")
    line_color_source_state(
      line,
      axes,
      "1",
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
    line_color_source_rgba(line_color_rgba(line.get_color()), [
      4607182418800017408UL, 4607182418800017408UL, 4607182418800017408UL, 4607182418800017408UL,
    ])
  } catch {
    error =>
      fail("original Line color scenario 0, row 22: " + error.to_string())
  }
  // string '1.0000000000000002'
  try {
    // Controlled stale=False input only; this is not a draw completion.
    line.mark_drawn()
    line_color_source_state(
      line,
      axes,
      "1",
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
    assert_true(
      try {
        line.set_color("1.0000000000000002")
        false
      } catch {
        @core.DataError::InvalidTicks(message~) =>
          message ==
          "ValueError: '1.0000000000000002' is not a valid value for color: supported inputs are (r, g, b) and (r, g, b, a) 0-1 float tuples; '#rrggbb', '#rrggbbaa', '#rgb', '#rgba' strings; named color strings; string reprs of 0-1 floats for grayscale values; 'C0', 'C1', ... strings for colors of the color cycle; and pairs combining one of the above with an alpha value"
        _ => false
      },
    )
    line_color_source_state(
      line,
      axes,
      "1",
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
  } catch {
    error =>
      fail("original Line color scenario 0, row 23: " + error.to_string())
  }
  // string 'nan'
  try {
    // Controlled stale=False input only; this is not a draw completion.
    line.mark_drawn()
    line_color_source_state(
      line,
      axes,
      "1",
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
    assert_true(
      try {
        line.set_color("nan")
        false
      } catch {
        @core.DataError::InvalidTicks(message~) =>
          message ==
          "ValueError: 'nan' is not a valid value for color: supported inputs are (r, g, b) and (r, g, b, a) 0-1 float tuples; '#rrggbb', '#rrggbbaa', '#rgb', '#rgba' strings; named color strings; string reprs of 0-1 floats for grayscale values; 'C0', 'C1', ... strings for colors of the color cycle; and pairs combining one of the above with an alpha value"
        _ => false
      },
    )
    line_color_source_state(
      line,
      axes,
      "1",
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
  } catch {
    error =>
      fail("original Line color scenario 0, row 24: " + error.to_string())
  }
  // string 'inf'
  try {
    // Controlled stale=False input only; this is not a draw completion.
    line.mark_drawn()
    line_color_source_state(
      line,
      axes,
      "1",
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
    assert_true(
      try {
        line.set_color("inf")
        false
      } catch {
        @core.DataError::InvalidTicks(message~) =>
          message ==
          "ValueError: 'inf' is not a valid value for color: supported inputs are (r, g, b) and (r, g, b, a) 0-1 float tuples; '#rrggbb', '#rrggbbaa', '#rgb', '#rgba' strings; named color strings; string reprs of 0-1 floats for grayscale values; 'C0', 'C1', ... strings for colors of the color cycle; and pairs combining one of the above with an alpha value"
        _ => false
      },
    )
    line_color_source_state(
      line,
      axes,
      "1",
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
  } catch {
    error =>
      fail("original Line color scenario 0, row 25: " + error.to_string())
  }
  // string '-inf'
  try {
    // Controlled stale=False input only; this is not a draw completion.
    line.mark_drawn()
    line_color_source_state(
      line,
      axes,
      "1",
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
    assert_true(
      try {
        line.set_color("-inf")
        false
      } catch {
        @core.DataError::InvalidTicks(message~) =>
          message ==
          "ValueError: '-inf' is not a valid value for color: supported inputs are (r, g, b) and (r, g, b, a) 0-1 float tuples; '#rrggbb', '#rrggbbaa', '#rgb', '#rgba' strings; named color strings; string reprs of 0-1 floats for grayscale values; 'C0', 'C1', ... strings for colors of the color cycle; and pairs combining one of the above with an alpha value"
        _ => false
      },
    )
    line_color_source_state(
      line,
      axes,
      "1",
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
  } catch {
    error =>
      fail("original Line color scenario 0, row 26: " + error.to_string())
  }
  // string '0_0.5'
  try {
    // Controlled stale=False input only; this is not a draw completion.
    line.mark_drawn()
    line_color_source_state(
      line,
      axes,
      "1",
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
    line.set_color("0_0.5")
    line_color_source_state(
      line,
      axes,
      "0_0.5",
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
    line_color_source_rgba(line_color_rgba(line.get_color()), [
      4602678819172646912UL, 4602678819172646912UL, 4602678819172646912UL, 4607182418800017408UL,
    ])
  } catch {
    error =>
      fail("original Line color scenario 0, row 27: " + error.to_string())
  }
  // string '０.５'
  try {
    // Controlled stale=False input only; this is not a draw completion.
    line.mark_drawn()
    line_color_source_state(
      line,
      axes,
      "0_0.5",
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
    line.set_color("０.５")
    line_color_source_state(
      line,
      axes,
      "０.５",
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
    line_color_source_rgba(line_color_rgba(line.get_color()), [
      4602678819172646912UL, 4602678819172646912UL, 4602678819172646912UL, 4607182418800017408UL,
    ])
  } catch {
    error =>
      fail("original Line color scenario 0, row 28: " + error.to_string())
  }
  // string 'tab:blue'
  try {
    // Controlled stale=False input only; this is not a draw completion.
    line.mark_drawn()
    line_color_source_state(
      line,
      axes,
      "０.５",
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
    line.set_color("tab:blue")
    line_color_source_state(
      line,
      axes,
      "tab:blue",
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
    line_color_source_rgba(line_color_rgba(line.get_color()), [
      4593424363467775775UL, 4602078339222330846UL, 4604533242548622999UL, 4607182418800017408UL,
    ])
  } catch {
    error =>
      fail("original Line color scenario 0, row 29: " + error.to_string())
  }
  // string 'TAB:BLUE'
  try {
    // Controlled stale=False input only; this is not a draw completion.
    line.mark_drawn()
    line_color_source_state(
      line,
      axes,
      "tab:blue",
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
    line.set_color("TAB:BLUE")
    line_color_source_state(
      line,
      axes,
      "TAB:BLUE",
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
    line_color_source_rgba(line_color_rgba(line.get_color()), [
      4593424363467775775UL, 4602078339222330846UL, 4604533242548622999UL, 4607182418800017408UL,
    ])
  } catch {
    error =>
      fail("original Line color scenario 0, row 30: " + error.to_string())
  }
  // string 'tab:grey'
  try {
    // Controlled stale=False input only; this is not a draw completion.
    line.mark_drawn()
    line_color_source_state(
      line,
      axes,
      "TAB:BLUE",
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
    line.set_color("tab:grey")
    line_color_source_state(
      line,
      axes,
      "tab:grey",
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
    line_color_source_rgba(line_color_rgba(line.get_color()), [
      4602643496822628320UL, 4602643496822628320UL, 4602643496822628320UL, 4607182418800017408UL,
    ])
  } catch {
    error =>
      fail("original Line color scenario 0, row 31: " + error.to_string())
  }
  // string 'xkcd:cloudy blue'
  try {
    // Controlled stale=False input only; this is not a draw completion.
    line.mark_drawn()
    line_color_source_state(
      line,
      axes,
      "tab:grey",
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
    line.set_color("xkcd:cloudy blue")
    line_color_source_state(
      line,
      axes,
      "xkcd:cloudy blue",
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
    line_color_source_rgba(line_color_rgba(line.get_color()), [
      4604250663748474262UL, 4605027755448883288UL, 4605840169499310907UL, 4607182418800017408UL,
    ])
  } catch {
    error =>
      fail("original Line color scenario 0, row 32: " + error.to_string())
  }
  // string 'rebeccapurple'
  try {
    // Controlled stale=False input only; this is not a draw completion.
    line.mark_drawn()
    line_color_source_state(
      line,
      axes,
      "xkcd:cloudy blue",
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
    line.set_color("rebeccapurple")
    line_color_source_state(
      line,
      axes,
      "rebeccapurple",
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
    line_color_source_rgba(line_color_rgba(line.get_color()), [
      4600877379321698714UL, 4596373779694328218UL, 4603579539098121011UL, 4607182418800017408UL,
    ])
  } catch {
    error =>
      fail("original Line color scenario 0, row 33: " + error.to_string())
  }
  // string 'C0'
  try {
    // Controlled stale=False input only; this is not a draw completion.
    line.mark_drawn()
    line_color_source_state(
      line,
      axes,
      "rebeccapurple",
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
    line.set_color("C0")
    line_color_source_state(
      line,
      axes,
      "C0",
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
    line_color_source_rgba(line_color_rgba(line.get_color()), [
      4589468260265693457UL, 4593971859893063953UL, 4596373779694328218UL, 4607182418800017408UL,
    ])
  } catch {
    error =>
      fail("original Line color scenario 0, row 34: " + error.to_string())
  }
  // string 'C1'
  try {
    // Controlled stale=False input only; this is not a draw completion.
    line.mark_drawn()
    line_color_source_state(
      line,
      axes,
      "C0",
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
    line.set_color("C1")
    line_color_source_state(
      line,
      axes,
      "C1",
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
    line_color_source_rgba(line_color_rgba(line.get_color()), [
      4604215341398455669UL, 4605416301299087802UL, 4606617261199719934UL, 4607182418800017408UL,
    ])
  } catch {
    error =>
      fail("original Line color scenario 0, row 35: " + error.to_string())
  }
  // string 'C0002'
  try {
    // Controlled stale=False input only; this is not a draw completion.
    line.mark_drawn()
    line_color_source_state(
      line,
      axes,
      "C1",
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
    line.set_color("C0002")
    line_color_source_state(
      line,
      axes,
      "C0002",
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
    line_color_source_rgba(line_color_rgba(line.get_color()), [
      4589468260265693457UL, 4593971859893063953UL, 4596373779694328218UL, 4607182418800017408UL,
    ])
  } catch {
    error =>
      fail("original Line color scenario 0, row 36: " + error.to_string())
  }
  // string 'C-1'
  try {
    // Controlled stale=False input only; this is not a draw completion.
    line.mark_drawn()
    line_color_source_state(
      line,
      axes,
      "C0002",
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
    assert_true(
      try {
        line.set_color("C-1")
        false
      } catch {
        @core.DataError::InvalidTicks(message~) =>
          message ==
          "ValueError: 'C-1' is not a valid value for color: supported inputs are (r, g, b) and (r, g, b, a) 0-1 float tuples; '#rrggbb', '#rrggbbaa', '#rgb', '#rgba' strings; named color strings; string reprs of 0-1 floats for grayscale values; 'C0', 'C1', ... strings for colors of the color cycle; and pairs combining one of the above with an alpha value"
        _ => false
      },
    )
    line_color_source_state(
      line,
      axes,
      "C0002",
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
  } catch {
    error =>
      fail("original Line color scenario 0, row 37: " + error.to_string())
  }
  // string 'C٠'
  try {
    // Controlled stale=False input only; this is not a draw completion.
    line.mark_drawn()
    line_color_source_state(
      line,
      axes,
      "C0002",
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
    assert_true(
      try {
        line.set_color("C٠")
        false
      } catch {
        @core.DataError::InvalidTicks(message~) =>
          message ==
          "ValueError: 'C٠' is not a valid value for color: supported inputs are (r, g, b) and (r, g, b, a) 0-1 float tuples; '#rrggbb', '#rrggbbaa', '#rgb', '#rgba' strings; named color strings; string reprs of 0-1 floats for grayscale values; 'C0', 'C1', ... strings for colors of the color cycle; and pairs combining one of the above with an alpha value"
        _ => false
      },
    )
    line_color_source_state(
      line,
      axes,
      "C0002",
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
  } catch {
    error =>
      fail("original Line color scenario 0, row 38: " + error.to_string())
  }
  // string 'C999999999999999999999999'
  try {
    // Controlled stale=False input only; this is not a draw completion.
    line.mark_drawn()
    line_color_source_state(
      line,
      axes,
      "C0002",
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
    line.set_color("C999999999999999999999999")
    line_color_source_state(
      line,
      axes,
      "C999999999999999999999999",
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
    line_color_source_rgba(line_color_rgba(line.get_color()), [
      4604215341398455669UL, 4605416301299087802UL, 4606617261199719934UL, 4607182418800017408UL,
    ])
  } catch {
    error =>
      fail("original Line color scenario 0, row 39: " + error.to_string())
  }
  // string '#12'
  try {
    // Controlled stale=False input only; this is not a draw completion.
    line.mark_drawn()
    line_color_source_state(
      line,
      axes,
      "C999999999999999999999999",
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
    assert_true(
      try {
        line.set_color("#12")
        false
      } catch {
        @core.DataError::InvalidTicks(message~) =>
          message ==
          "ValueError: '#12' is not a valid value for color: supported inputs are (r, g, b) and (r, g, b, a) 0-1 float tuples; '#rrggbb', '#rrggbbaa', '#rgb', '#rgba' strings; named color strings; string reprs of 0-1 floats for grayscale values; 'C0', 'C1', ... strings for colors of the color cycle; and pairs combining one of the above with an alpha value"
        _ => false
      },
    )
    line_color_source_state(
      line,
      axes,
      "C999999999999999999999999",
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
  } catch {
    error =>
      fail("original Line color scenario 0, row 40: " + error.to_string())
  }
  // string '#ggg'
  try {
    // Controlled stale=False input only; this is not a draw completion.
    line.mark_drawn()
    line_color_source_state(
      line,
      axes,
      "C999999999999999999999999",
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
    assert_true(
      try {
        line.set_color("#ggg")
        false
      } catch {
        @core.DataError::InvalidTicks(message~) =>
          message ==
          "ValueError: '#ggg' is not a valid value for color: supported inputs are (r, g, b) and (r, g, b, a) 0-1 float tuples; '#rrggbb', '#rrggbbaa', '#rgb', '#rgba' strings; named color strings; string reprs of 0-1 floats for grayscale values; 'C0', 'C1', ... strings for colors of the color cycle; and pairs combining one of the above with an alpha value"
        _ => false
      },
    )
    line_color_source_state(
      line,
      axes,
      "C999999999999999999999999",
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
  } catch {
    error =>
      fail("original Line color scenario 0, row 41: " + error.to_string())
  }
  // string '0x123456'
  try {
    // Controlled stale=False input only; this is not a draw completion.
    line.mark_drawn()
    line_color_source_state(
      line,
      axes,
      "C999999999999999999999999",
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
    assert_true(
      try {
        line.set_color("0x123456")
        false
      } catch {
        @core.DataError::InvalidTicks(message~) =>
          message ==
          "ValueError: '0x123456' is not a valid value for color: supported inputs are (r, g, b) and (r, g, b, a) 0-1 float tuples; '#rrggbb', '#rrggbbaa', '#rgb', '#rgba' strings; named color strings; string reprs of 0-1 floats for grayscale values; 'C0', 'C1', ... strings for colors of the color cycle; and pairs combining one of the above with an alpha value"
        _ => false
      },
    )
    line_color_source_state(
      line,
      axes,
      "C999999999999999999999999",
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
  } catch {
    error =>
      fail("original Line color scenario 0, row 42: " + error.to_string())
  }
  // string 'rgb(255,0,0)'
  try {
    // Controlled stale=False input only; this is not a draw completion.
    line.mark_drawn()
    line_color_source_state(
      line,
      axes,
      "C999999999999999999999999",
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
    assert_true(
      try {
        line.set_color("rgb(255,0,0)")
        false
      } catch {
        @core.DataError::InvalidTicks(message~) =>
          message ==
          "ValueError: 'rgb(255,0,0)' is not a valid value for color: supported inputs are (r, g, b) and (r, g, b, a) 0-1 float tuples; '#rrggbb', '#rrggbbaa', '#rgb', '#rgba' strings; named color strings; string reprs of 0-1 floats for grayscale values; 'C0', 'C1', ... strings for colors of the color cycle; and pairs combining one of the above with an alpha value"
        _ => false
      },
    )
    line_color_source_state(
      line,
      axes,
      "C999999999999999999999999",
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
  } catch {
    error =>
      fail("original Line color scenario 0, row 43: " + error.to_string())
  }
  // 4301-digit ASCII cycle index accepted now but int conversion is deferred
  try {
    // Controlled stale=False input only; this is not a draw completion.
    line.mark_drawn()
    line_color_source_state(
      line,
      axes,
      "C999999999999999999999999",
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
    line.set_color(
      "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
    )
    line_color_source_state(
      line,
      axes,
      "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
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
    assert_true(
      try {
        ignore(line_color_rgba(line.get_color()))
        false
      } catch {
        @core.DataError::InvalidTicks(message~) =>
          message ==
          "ValueError: Exceeds the limit (4300 digits) for integer string conversion: value has 4301 digits; use sys.set_int_max_str_digits() to increase the limit"
        _ => false
      },
    )
  } catch {
    error =>
      fail("original Line color scenario 0, row 44: " + error.to_string())
  }
  // C0 before live rc cycle replacement
  try {
    // Controlled stale=False input only; this is not a draw completion.
    line.mark_drawn()
    line_color_source_state(
      line,
      axes,
      "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
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
    line.set_color("C0")
    line_color_source_state(
      line,
      axes,
      "C0",
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
    line_color_source_rgba(line_color_rgba(line.get_color()), [
      4589468260265693457UL, 4593971859893063953UL, 4596373779694328218UL, 4607182418800017408UL,
    ])
  } catch {
    error =>
      fail("original Line color scenario 0, row 45: " + error.to_string())
  }
  // live rc cycle replacement reinterprets unchanged raw C0
  try {
    @config.set_color_cycle(["#00ff00", "#0000ff"])
    line_color_source_state(
      line,
      axes,
      "C0",
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
    line_color_source_state(
      line,
      axes,
      "C0",
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
    line_color_source_rgba(line_color_rgba(line.get_color()), [
      0UL, 4607182418800017408UL, 0UL, 4607182418800017408UL,
    ])
  } catch {
    error =>
      fail("original Line color scenario 0, row 46: " + error.to_string())
  }
}

///|
fn line_color_source_sequence_1() -> Unit raise {
  let previous_cycle = @config.color_cycle()
  defer (try! @config.set_color_cycle(previous_cycle))
  @config.set_color_cycle(["#112233", "#abcdef"])
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([0.0, 1.0]),
    LineData::Numeric([10.0, 20.0]),
    color="black",
  )
  axes.x_axis().clear_autoscale_request()
  axes.y_axis().clear_autoscale_request()
  // Kelvin sign in multi-character native name
  try {
    // Controlled stale=False input only; this is not a draw completion.
    line.mark_drawn()
    line_color_source_state(
      line,
      axes,
      "black",
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
    line.set_color("PINK")
    line_color_source_state(
      line,
      axes,
      "PINK",
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
    line_color_source_rgba(line_color_rgba(line.get_color()), [
      4607182418800017408UL, 4604957110748846104UL, 4605345656599050617UL, 4607182418800017408UL,
    ])
  } catch {
    error => fail("original Line color scenario 1, row 0: " + error.to_string())
  }
  // single Kelvin sign does not receive lowercase fallback
  try {
    // Controlled stale=False input only; this is not a draw completion.
    line.mark_drawn()
    line_color_source_state(
      line,
      axes,
      "PINK",
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
    assert_true(
      try {
        line.set_color("K")
        false
      } catch {
        @core.DataError::InvalidTicks(message~) =>
          message ==
          "ValueError: 'K' is not a valid value for color: supported inputs are (r, g, b) and (r, g, b, a) 0-1 float tuples; '#rrggbb', '#rrggbbaa', '#rgb', '#rgba' strings; named color strings; string reprs of 0-1 floats for grayscale values; 'C0', 'C1', ... strings for colors of the color cycle; and pairs combining one of the above with an alpha value"
        _ => false
      },
    )
    line_color_source_state(
      line,
      axes,
      "PINK",
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
  } catch {
    error => fail("original Line color scenario 1, row 1: " + error.to_string())
  }
  // 4300 leading zero C index converts successfully
  try {
    // Controlled stale=False input only; this is not a draw completion.
    line.mark_drawn()
    line_color_source_state(
      line,
      axes,
      "PINK",
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
    line.set_color(
      "C0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    )
    line_color_source_state(
      line,
      axes,
      "C0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
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
    line_color_source_rgba(line_color_rgba(line.get_color()), [
      4589468260265693457UL, 4593971859893063953UL, 4596373779694328218UL, 4607182418800017408UL,
    ])
  } catch {
    error => fail("original Line color scenario 1, row 2: " + error.to_string())
  }
  // 4301 leading zero C index fails only during conversion
  try {
    // Controlled stale=False input only; this is not a draw completion.
    line.mark_drawn()
    line_color_source_state(
      line,
      axes,
      "C0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
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
    line.set_color(
      "C00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    )
    line_color_source_state(
      line,
      axes,
      "C00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
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
    assert_true(
      try {
        ignore(line_color_rgba(line.get_color()))
        false
      } catch {
        @core.DataError::InvalidTicks(message~) =>
          message ==
          "ValueError: Exceeds the limit (4300 digits) for integer string conversion: value has 4301 digits; use sys.set_int_max_str_digits() to increase the limit"
        _ => false
      },
    )
  } catch {
    error => fail("original Line color scenario 1, row 3: " + error.to_string())
  }
}

///|
test "original Line String color setter and live rc sequences" {
  line_color_source_sequence_0()
  line_color_source_sequence_1()
}

///|
fn line_color_source_draw_0() -> Unit raise {
  let previous_cycle = @config.color_cycle()
  defer (try! @config.set_color_cycle(previous_cycle))
  @config.set_color_cycle(["#112233", "#abcdef"])
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
  assert_eq(line.stale(), true)
  let panel = fig.to_render_figure().panels()[0]
  guard panel.prepare_line(line.points) is Some((_, _, complete)) else {
    fail("expected registered Line provider")
  }
  complete()
  assert_eq(line.stale(), false)
  assert_eq(
    line.get_color(),
    "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
  )
  assert_eq([line.invalid_x, line.invalid_y], [false, false])
  line_color_source_numbers(line.cache.flat.to_array(), [])
}

///|
fn line_color_source_draw_1() -> Unit raise {
  let previous_cycle = @config.color_cycle()
  defer (try! @config.set_color_cycle(previous_cycle))
  @config.set_color_cycle(["#112233", "#abcdef"])
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
  assert_eq(line.stale(), true)
  let panel = fig.to_render_figure().panels()[0]
  assert_true(
    try {
      guard panel.prepare_line(line.points) is Some((_, _, complete)) else {
        fail("expected registered Line provider")
      }
      complete()
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: Exceeds the limit (4300 digits) for integer string conversion: value has 4301 digits; use sys.set_int_max_str_digits() to increase the limit"
      _ => false
    },
  )
  assert_eq(line.stale(), true)
  assert_eq(
    line.get_color(),
    "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
  )
  assert_eq([line.invalid_x, line.invalid_y], [false, false])
  line_color_source_numbers(line.cache.flat.to_array(), [
    0UL.reinterpret_as_double(),
    4621819117588971520UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
    4626322717216342016UL.reinterpret_as_double(),
  ])
}

///|
fn line_color_source_draw_2() -> Unit raise {
  let previous_cycle = @config.color_cycle()
  defer (try! @config.set_color_cycle(previous_cycle))
  @config.set_color_cycle(["#112233", "#abcdef"])
  let fig = figure()
  let axes = fig.axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  let line = axes.plot_line(
    LineData::Numeric([0.0 / 0.0, 1.0 / 0.0]),
    LineData::Numeric([0.0 / 0.0, -1.0 / 0.0]),
    color="black",
  )
  line.set_color(
    "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
  )
  assert_eq(line.stale(), true)
  let panel = fig.to_render_figure().panels()[0]
  assert_true(
    try {
      guard panel.prepare_line(line.points) is Some((_, _, complete)) else {
        fail("expected registered Line provider")
      }
      complete()
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: Exceeds the limit (4300 digits) for integer string conversion: value has 4301 digits; use sys.set_int_max_str_digits() to increase the limit"
      _ => false
    },
  )
  assert_eq(line.stale(), true)
  assert_eq(
    line.get_color(),
    "C99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
  )
  assert_eq([line.invalid_x, line.invalid_y], [false, false])
  line_color_source_numbers(line.cache.flat.to_array(), [
    0.0 / 0.0,
    0.0 / 0.0,
    1.0 / 0.0,
    -1.0 / 0.0,
  ])
}

///|
test "original solid Line draw empty and nonempty color timing" {
  line_color_source_draw_0()
  line_color_source_draw_1()
  line_color_source_draw_2()
}

///|
fn line_color_source_names_0() -> Unit raise {
  line_color_source_name("xkcd:cloudy blue", [
    4604250663748474262UL, 4605027755448883288UL, 4605840169499310907UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dark pastel green", [
    4599747064121103766UL, 4604321308448511446UL, 4599817708821140950UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dust", [
    4604462597848585814UL, 4603579539098121011UL, 4601442536921996188UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:electric lime", [
    4604109374348399893UL, 4607182418800017408UL, 4580178482210803728UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:fresh green", [
    4601089313421810266UL, 4605804847149292315UL, 4599252551220843476UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:light eggplant", [
    4603014381497823537UL, 4598546104220471633UL, 4602873092097749169UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:nasty green", [
    4601583826322070556UL, 4604462597848585814UL, 4598069252495220640UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:really light blue", [
    4605663557749217947UL, 4607182418800017408UL, 4607182418800017408UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:tea", [
    4600806734621661529UL, 4604215341398455669UL, 4602431562722516767UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:warm purple", [
    4603438249698046643UL, 4595667332693956375UL, 4603226315597935090UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:yellowish tan", [
    4607076451749961632UL, 4607076451749961632UL, 4602731802697674800UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:cement", [
    4604003407298344117UL, 4603932762598306932UL, 4603296960297972274UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dark grass green", [
    4597080226694700060UL, 4602696480347656208UL, 4580178482210803728UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dusty teal", [
    4599040617120731923UL, 4603261637947953682UL, 4602873092097749169UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:grey teal", [
    4600312221721401240UL, 4603650183798158195UL, 4603049703847842129UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:macaroni and cheese", [
    4606617261199719934UL, 4604533242548622999UL, 4596656358494476955UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:pinkish tan", [
    4605840169499310907UL, 4603650183798158195UL, 4602767125047693392UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:spruce", [
    4585812397038769172UL, 4600382866421438424UL, 4597080226694700060UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:strong blue", [
    4586942712239364120UL, 4582439112611993624UL, 4606899839999868671UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:toxic green", [
    4600524155821512792UL, 4606016781249403868UL, 4595102175093658901UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:windows blue", [
    4596938937294625692UL, 4602148983922368030UL, 4604921788398827512UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:blue blue", [
    4593971859893063953UL, 4598334170120360081UL, 4605204367198976249UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:blue with a hint of purple", [
    4599535130020992213UL, 4597645384294997534UL, 4605169044848957657UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:booger", [
    4603650183798158195UL, 4604568564898641591UL, 4597645384294997534UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:bright sea green", [
    4581308797411398676UL, 4607182418800017408UL, 4604038729648362709UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dark green blue", [
    4593424363467775775UL, 4600665445221587161UL, 4599817708821140950UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:deep turquoise", [
    4571171282956062736UL, 4601795760422182109UL, 4601866405122219293UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:green teal", [
    4586942712239364120UL, 4604568564898641591UL, 4602078339222330846UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:strong pink", [
    4607182418800017408UL, 4583569427812588572UL, 4603014381497823537UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:bland", [
    4604356630798530038UL, 4604109374348399893UL, 4603085026197860721UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:deep aqua", [
    4584682081838174224UL, 4602148983922368030UL, 4602643496822628320UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:lavender pink", [
    4605981458899385276UL, 4602873092097749169UL, 4605769524799273723UL, 4607182418800017408UL,
  ])
}

///|
fn line_color_source_names_1() -> Unit raise {
  line_color_source_name("xkcd:light moss green", [
    4604038729648362709UL, 4605239689548994841UL, 4601937049822256477UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:light seafoam green", [
    4604074051998381301UL, 4607182418800017408UL, 4604568564898641591UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:olive yellow", [
    4605027755448883288UL, 4604639209598678775UL, 4585247239438471698UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:pig pink", [
    4606334682399571197UL, 4603190993247916498UL, 4604003407298344117UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:deep lilac", [
    4603473572048065235UL, 4601442536921996188UL, 4604851143698790328UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:desert", [
    4605380978949069210UL, 4604285986098492854UL, 4600453511121475608UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dusty lavender", [
    4604250663748474262UL, 4602908414447767761UL, 4604109374348399893UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:purpley grey", [
    4603402927348028051UL, 4602572852122591136UL, 4603402927348028051UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:purply", [
    4603544216748102419UL, 4598069252495220640UL, 4604462597848585814UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:candy pink", [
    4607182418800017408UL, 4600665445221587161UL, 4606405327099608381UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:light pastel green", [
    4604462597848585814UL, 4607041129399943039UL, 4604003407298344117UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:boring green", [
    4600665445221587161UL, 4604497920198604406UL, 4600806734621661529UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:kiwi green", [
    4603190993247916498UL, 4606264037699534013UL, 4598069252495220640UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:light grey green", [
    4604639209598678775UL, 4606122748299459644UL, 4603862117898269748UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:orange pink", [
    4607182418800017408UL, 4601513181622033372UL, 4599464485320955029UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:tea green", [
    4604851143698790328UL, 4606935162349887263UL, 4603932762598306932UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:very light brown", [
    4605628235399199354UL, 4604603887248660183UL, 4602802447397711984UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:egg shell", [
    4607182418800017408UL, 4607076451749961632UL, 4605098400148920473UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:eggplant purple", [
    4598404814820397265UL, 4581308797411398676UL, 4598263525420322896UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:powder pink", [
    4607182418800017408UL, 4604462597848585814UL, 4605522268349143578UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:reddish grey", [
    4603579539098121011UL, 4601937049822256477UL, 4601583826322070556UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:baby shit brown", [
    4604285986098492854UL, 4603261637947953682UL, 4587507869839661594UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:liliac", [
    4605098400148920473UL, 4603190993247916498UL, 4607111774099980224UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:stormy blue", [
    4599323195920880660UL, 4602360918022479583UL, 4603685506148176788UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:ugly brown", [
    4602502207422553951UL, 4601654471022107740UL, 4577935512984623128UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:custard", [
    4607182418800017408UL, 4607111774099980224UL, 4602148983922368030UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:darkish pink", [
    4605875491849329499UL, 4598616748920508818UL, 4602502207422553951UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:deep brown", [
    4598263525420322896UL, 4575674882583433232UL, 0UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:greenish beige", [
    4605275011899013433UL, 4605557590699162170UL, 4602219628622405214UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:manilla", [
    4607182418800017408UL, 4607005807049924447UL, 4602908414447767761UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:off blue", [
    4599747064121103766UL, 4602837769747730577UL, 4604321308448511446UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:battleship grey", [
    4601230602821884635UL, 4602431562722516767UL, 4602873092097749169UL, 4607182418800017408UL,
  ])
}

///|
fn line_color_source_names_2() -> Unit raise {
  line_color_source_name("xkcd:browny green", [
    4601513181622033372UL, 4601301247521921819UL, 4585812397038769172UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:bruise", [
    4602572852122591136UL, 4598192880720285712UL, 4601654471022107740UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:kelley green", [
    0UL, 4603367604998009458UL, 4596938937294625692UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:sickly yellow", [
    4605522268349143578UL, 4606228715349515421UL, 4594960885693584533UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:sunny yellow", [
    4607182418800017408UL, 4606970484699905855UL, 4591163733066585879UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:azul", [
    4592859205867478301UL, 4600241577021364055UL, 4606511294149664158UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:darkgreen", [
    4581308797411398676UL, 4598828683020620370UL, 4583569427812588572UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:green/yellow", [
    4604568564898641591UL, 4605451623649106394UL, 4584682081838174224UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:lichen", [
    4603226315597935090UL, 4604603887248660183UL, 4602360918022479583UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:light light green", [
    4605239689548994841UL, 4607182418800017408UL, 4604391953148548630UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:pale gold", [
    4607111774099980224UL, 4606016781249403868UL, 4601301247521921819UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:sun yellow", [
    4607182418800017408UL, 4606052103599422460UL, 4593971859893063953UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:tan green", [
    4604144696698418485UL, 4604886466048808920UL, 4601583826322070556UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:burple", [
    4601018668721773082UL, 4596232490294253849UL, 4606193392999496828UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:butterscotch", [
    4607111774099980224UL, 4604427275498567222UL, 4598687393620546002UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:toupe", [
    4605204367198976249UL, 4604250663748474262UL, 4602502207422553951UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dark cream", [
    4607182418800017408UL, 4606758550599794302UL, 4603614861448139603UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:indian red", [
    4602873092097749169UL, 4588073027439959068UL, 4580178482210803728UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:light lavendar", [
    4606617261199719934UL, 4604957110748846104UL, 4607147096449998816UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:poison green", [
    4598192880720285712UL, 4607111774099980224UL, 4590315996666139668UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:baby puke green", [
    4604603887248660183UL, 4605098400148920473UL, 4582439112611993624UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:bright yellow green", [
    4603720828498195380UL, 4607182418800017408UL, 0UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:charcoal grey", [
    4597645384294997534UL, 4598263525420322896UL, 4598334170120360081UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:squash", [
    4606723228249775710UL, 4604215341398455669UL, 4590598575466288405UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:cinnamon", [
    4604250663748474262UL, 4599252551220843476UL, 4582439112611993624UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:light pea green", [
    4605098400148920473UL, 4607147096449998816UL, 4602767125047693392UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:radioactive green", [
    4595384753893807638UL, 4607005807049924447UL, 4593424363467775775UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:raw sienna", [
    4603614861448139603UL, 4600594800521549977UL, 0UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:baby purple", [
    4605310334249032025UL, 4603650183798158195UL, 4606899839999868671UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:cocoa", [
    4602943736797786353UL, 4600382866421438424UL, 4598334170120360081UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:light royal blue", [
    4597362805494848797UL, 4595667332693956375UL, 4607147096449998816UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:orangeish", [
    4607111774099980224UL, 4603155670897897906UL, 4598828683020620370UL, 4607182418800017408UL,
  ])
}

///|
fn line_color_source_names_3() -> Unit raise {
  line_color_source_name("xkcd:rust brown", [
    4603085026197860721UL, 4596091200894179481UL, 4577935512984623128UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:sand brown", [
    4605345656599050617UL, 4604003407298344117UL, 4600453511121475608UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:swamp", [
    4601089313421810266UL, 4602802447397711984UL, 4597221516094774429UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:tealish green", [
    4586942712239364120UL, 4605946136549366684UL, 4601795760422182109UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:burnt siena", [
    4604639209598678775UL, 4599464485320955029UL, 4577935512984623128UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:camo", [
    4602643496822628320UL, 4603226315597935090UL, 4599181906520806292UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dusk blue", [
    4594537017493361427UL, 4599535130020992213UL, 4603155670897897906UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:fern", [
    4600665445221587161UL, 4604144696698418485UL, 4599323195920880660UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:old rose", [
    4605239689548994841UL, 4602643496822628320UL, 4603014381497823537UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:pale light green", [
    4604427275498567222UL, 4607076451749961632UL, 4603579539098121011UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:peachy pink", [
    4607182418800017408UL, 4603614861448139603UL, 4603049703847842129UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:rosy pink", [
    4606864517649850079UL, 4601018668721773082UL, 4603190993247916498UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:light bluish green", [
    4602007694522293662UL, 4607111774099980224UL, 4604109374348399893UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:light bright green", [
    4599535130020992213UL, 4607147096449998816UL, 4600170932321326871UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:light neon green", [
    4599181906520806292UL, 4607111774099980224UL, 4599605774721029397UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:light seafoam", [
    4603826795548251156UL, 4607147096449998816UL, 4604921788398827512UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:tiffany blue", [
    4602360918022479583UL, 4606723228249775710UL, 4605875491849329499UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:washed out green", [
    4604815821348771736UL, 4606829195299831487UL, 4604038729648362709UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:browny orange", [
    4605310334249032025UL, 4601230602821884635UL, 4575674882583433232UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:nice blue", [
    4589185681465544720UL, 4602290273322442399UL, 4604391953148548630UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:sapphire", [
    4593830570492989585UL, 4597080226694700060UL, 4604215341398455669UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:greyish teal", [
    4601654471022107740UL, 4603791473198232564UL, 4603296960297972274UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:orangey yellow", [
    4607111774099980224UL, 4604709854298715959UL, 4590598575466288405UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:parchment", [
    4607147096449998816UL, 4607076451749961632UL, 4604356630798530038UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:straw", [
    4607076451749961632UL, 4606864517649850079UL, 4602219628622405214UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:very dark brown", [
    4592859205867478301UL, 4575674882583433232UL, 0UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:terracota", [
    4605345656599050617UL, 4601018668721773082UL, 4598404814820397265UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:ugly blue", [
    4596091200894179481UL, 4600877379321698714UL, 4603049703847842129UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:clear blue", [
    4594254438693212690UL, 4602290273322442399UL, 4607111774099980224UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:creme", [
    4607182418800017408UL, 4607182418800017408UL, 4604603887248660183UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:foam green", [
    4603261637947953682UL, 4607111774099980224UL, 4604144696698418485UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:grey/green", [
    4602908414447767761UL, 4603862117898269748UL, 4602502207422553951UL, 4607182418800017408UL,
  ])
}

///|
fn line_color_source_names_4() -> Unit raise {
  line_color_source_name("xkcd:light gold", [
    4607111774099980224UL, 4605946136549366684UL, 4600170932321326871UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:seafoam blue", [
    4602148983922368030UL, 4605557590699162170UL, 4604603887248660183UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:topaz", [
    4590033417865990931UL, 4604780498998753143UL, 4604356630798530038UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:violet pink", [
    4607041129399943039UL, 4600382866421438424UL, 4607076451749961632UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:wintergreen", [
    4593689281092915216UL, 4606970484699905855UL, 4602908414447767761UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:yellow tan", [
    4607182418800017408UL, 4606193392999496828UL, 4601442536921996188UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dark fuchsia", [
    4603720828498195380UL, 4583569427812588572UL, 4599958998221215318UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:indigo blue", [
    4597362805494848797UL, 4591446311866734616UL, 4604427275498567222UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:light yellowish green", [
    4605027755448883288UL, 4607182418800017408UL, 4603014381497823537UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:pale magenta", [
    4605769524799273723UL, 4600948024021735898UL, 4604285986098492854UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:rich purple", [
    4601725115722144925UL, 0UL, 4599888353521178134UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:sunflower yellow", [
    4607182418800017408UL, 4605875491849329499UL, 4577935512984623128UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:green/blue", [
    4571171282956062736UL, 4604957110748846104UL, 4603155670897897906UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:leather", [
    4604250663748474262UL, 4601866405122219293UL, 4596515069094402586UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:racing green", [
    4571171282956062736UL, 4598616748920508818UL, 0UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:vivid purple", [
    4603579539098121011UL, 0UL, 4607005807049924447UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dark royal blue", [
    4575674882583433232UL, 4582439112611993624UL, 4601513181622033372UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:hazel", [
    4603190993247916498UL, 4602007694522293662UL, 4591446311866734616UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:muted pink", [
    4605557590699162170UL, 4602007694522293662UL, 4603226315597935090UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:booger green", [
    4603473572048065235UL, 4604533242548622999UL, 4577935512984623128UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:canary", [
    4607111774099980224UL, 4607182418800017408UL, 4600665445221587161UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:cool grey", [
    4603438249698046643UL, 4603932762598306932UL, 4604038729648362709UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dark taupe", [
    4602643496822628320UL, 4601018668721773082UL, 4599181906520806292UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:darkish purple", [
    4601937049822256477UL, 4591728890666883353UL, 4601795760422182109UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:true green", [
    4584682081838174224UL, 4603402927348028051UL, 4580178482210803728UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:coral pink", [
    4607182418800017408UL, 4600524155821512792UL, 4600665445221587161UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dark sage", [
    4599958998221215318UL, 4602873092097749169UL, 4599747064121103766UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dark slate blue", [
    4593830570492989585UL, 4598687393620546002UL, 4600524155821512792UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:flat blue", [
    4597645384294997534UL, 4601795760422182109UL, 4604109374348399893UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:mushroom", [
    4604745176648734551UL, 4603756150848213972UL, 4602979059147804945UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:rich blue", [
    4575674882583433232UL, 4592294048267180827UL, 4606970484699905855UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dirty purple", [
    4601795760422182109UL, 4598899327720657555UL, 4600806734621661529UL, 4607182418800017408UL,
  ])
}

///|
fn line_color_source_names_5() -> Unit raise {
  line_color_source_name("xkcd:greenblue", [
    4594113149293138322UL, 4605098400148920473UL, 4603085026197860721UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:icky green", [
    4603226315597935090UL, 4604321308448511446UL, 4593971859893063953UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:light khaki", [
    4606299360049552605UL, 4606723228249775710UL, 4603897440248288340UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:warm blue", [
    4598969972420694739UL, 4599817708821140950UL, 4605910814199348091UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dark hot pink", [
    4605840169499310907UL, 4571171282956062736UL, 4600877379321698714UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:deep sea blue", [
    4571171282956062736UL, 4599605774721029397UL, 4602767125047693392UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:carmine", [
    4603720828498195380UL, 4575674882583433232UL, 4590881154266437142UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dark yellow green", [
    4601725115722144925UL, 4603226315597935090UL, 4575674882583433232UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:pale peach", [
    4607182418800017408UL, 4606264037699534013UL, 4604285986098492854UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:plum purple", [
    4599181906520806292UL, 4581308797411398676UL, 4599323195920880660UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:golden rod", [
    4606970484699905855UL, 4604815821348771736UL, 4584682081838174224UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:neon red", [
    4607182418800017408UL, 4583569427812588572UL, 4597362805494848797UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:old pink", [
    4605204367198976249UL, 4602219628622405214UL, 4602908414447767761UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:very pale blue", [
    4605734202449255131UL, 4607182418800017408UL, 4607147096449998816UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:blood orange", [
    4607147096449998816UL, 4598969972420694739UL, 4577935512984623128UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:grapefruit", [
    4607111774099980224UL, 4599958998221215318UL, 4599747064121103766UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:sand yellow", [
    4607076451749961632UL, 4606122748299459644UL, 4600877379321698714UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:clay brown", [
    4604462597848585814UL, 4601654471022107740UL, 4597786673695071903UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dark blue grey", [
    4593424363467775775UL, 4597504094894923166UL, 4599111261820769107UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:flat green", [
    4601089313421810266UL, 4603720828498195380UL, 4599040617120731923UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:light green blue", [
    4599747064121103766UL, 4607076451749961632UL, 4603897440248288340UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:warm pink", [
    4607041129399943039UL, 4599676419421066581UL, 4602731802697674800UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dodger blue", [
    4597927963095146271UL, 4602767125047693392UL, 4607076451749961632UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:gross green", [
    4603826795548251156UL, 4604921788398827512UL, 4590881154266437142UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:ice", [
    4605734202449255131UL, 4607182418800017408UL, 4607005807049924447UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:metallic blue", [
    4599252551220843476UL, 4601795760422182109UL, 4603190993247916498UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:pale salmon", [
    4607182418800017408UL, 4604427275498567222UL, 4603614861448139603UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:sap green", [
    4600170932321326871UL, 4603085026197860721UL, 4590598575466288405UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:algae", [
    4599605774721029397UL, 4604250663748474262UL, 4601018668721773082UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:bluey grey", [
    4603014381497823537UL, 4603826795548251156UL, 4604391953148548630UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:greeny grey", [
    4602572852122591136UL, 4603826795548251156UL, 4602290273322442399UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:highlighter green", [
    4592294048267180827UL, 4607076451749961632UL, 4582439112611993624UL, 4607182418800017408UL,
  ])
}

///|
fn line_color_source_names_6() -> Unit raise {
  line_color_source_name("xkcd:light light blue", [
    4605310334249032025UL, 4607182418800017408UL, 4607041129399943039UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:light mint", [
    4604603887248660183UL, 4607182418800017408UL, 4604780498998753143UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:raw umber", [
    4604074051998381301UL, 4600312221721401240UL, 4585247239438471698UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:vivid blue", [
    4590598575466288405UL, 4595667332693956375UL, 4607182418800017408UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:deep lavender", [
    4603155670897897906UL, 4600312221721401240UL, 4604639209598678775UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dull teal", [
    4600382866421438424UL, 4603756150848213972UL, 4603226315597935090UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:light greenish blue", [
    4600665445221587161UL, 4606899839999868671UL, 4604533242548622999UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:mud green", [
    4600453511121475608UL, 4600877379321698714UL, 4575674882583433232UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:pinky", [
    4607076451749961632UL, 4602908414447767761UL, 4604180019048437077UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:red wine", [
    4603120348547879314UL, 0UL, 4596515069094402586UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:shit green", [
    4601937049822256477UL, 4602696480347656208UL, 0UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:tan brown", [
    4604215341398455669UL, 4602572852122591136UL, 4599040617120731923UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:darkblue", [
    4577935512984623128UL, 4583569427812588572UL, 4600736089921624345UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:rosa", [
    4607147096449998816UL, 4602908414447767761UL, 4603968084948325525UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:lipstick", [
    4605698880099236539UL, 4591163733066585879UL, 4599181906520806292UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:pale mauve", [
    4607147096449998816UL, 4605522268349143578UL, 4607076451749961632UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:claret", [
    4601018668721773082UL, 0UL, 4591446311866734616UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dandelion", [
    4607147096449998816UL, 4606052103599422460UL, 4584682081838174224UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:orangered", [
    4607147096449998816UL, 4598334170120360081UL, 4588638185040256542UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:poop green", [
    4601513181622033372UL, 4602431562722516767UL, 0UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:ruby", [
    4605310334249032025UL, 4571171282956062736UL, 4598687393620546002UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dark", [
    4592294048267180827UL, 4594254438693212690UL, 4596091200894179481UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:greenish turquoise", [
    0UL, 4607041129399943039UL, 4604391953148548630UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:pastel red", [
    4605910814199348091UL, 4599888353521178134UL, 4599747064121103766UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:piss yellow", [
    4605981458899385276UL, 4605734202449255131UL, 4591446311866734616UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:bright cyan", [
    4598263525420322896UL, 4607111774099980224UL, 4607147096449998816UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dark coral", [
    4605486945999124986UL, 4599464485320955029UL, 4599181906520806292UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:algae green", [
    4593830570492989585UL, 4605063077798901880UL, 4601513181622033372UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:darkish red", [
    4604144696698418485UL, 4577935512984623128UL, 4584682081838174224UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:reddy brown", [
    4601442536921996188UL, 4589185681465544720UL, 4581308797411398676UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:blush pink", [
    4607147096449998816UL, 4602767125047693392UL, 4603120348547879314UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:camouflage green", [
    4598969972420694739UL, 4600524155821512792UL, 4590033417865990931UL, 4607182418800017408UL,
  ])
}

///|
fn line_color_source_names_7() -> Unit raise {
  line_color_source_name("xkcd:lawn green", [
    4599111261820769107UL, 4603968084948325525UL, 4585247239438471698UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:putty", [
    4604886466048808920UL, 4604321308448511446UL, 4603049703847842129UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:vibrant blue", [
    4577935512984623128UL, 4597221516094774429UL, 4606935162349887263UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dark sand", [
    4604109374348399893UL, 4603226315597935090UL, 4599958998221215318UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:purple/blue", [
    4600241577021364055UL, 4593830570492989585UL, 4605522268349143578UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:saffron", [
    4607147096449998816UL, 4604462597848585814UL, 4585247239438471698UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:twilight", [
    4599181906520806292UL, 4599393840620917844UL, 4603085026197860721UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:warm brown", [
    4603473572048065235UL, 4599181906520806292UL, 4575674882583433232UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:bluegrey", [
    4602873092097749169UL, 4603932762598306932UL, 4604462597848585814UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:bubble gum pink", [
    4607182418800017408UL, 4601089313421810266UL, 4604356630798530038UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:duck egg blue", [
    4605063077798901880UL, 4607041129399943039UL, 4606793872949812895UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:greenish cyan", [
    4595102175093658901UL, 4607147096449998816UL, 4604639209598678775UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:petrol", [
    0UL, 4600382866421438424UL, 4601159958121847451UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:royal", [
    4586942712239364120UL, 4591163733066585879UL, 4603367604998009458UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:butter", [
    4607182418800017408UL, 4607182418800017408UL, 4602731802697674800UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dusty orange", [
    4606652583549738526UL, 4602802447397711984UL, 4597362805494848797UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:off yellow", [
    4606687905899757118UL, 4606758550599794302UL, 4598069252495220640UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:pale olive green", [
    4604427275498567222UL, 4605592913049180762UL, 4602360918022479583UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:orangish", [
    4607076451749961632UL, 4602767125047693392UL, 4598899327720657555UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:leaf", [
    4601654471022107740UL, 4604180019048437077UL, 4596515069094402586UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:light blue grey", [
    4604639209598678775UL, 4605275011899013433UL, 4606158070649478236UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dried blood", [
    4598969972420694739UL, 4571171282956062736UL, 4571171282956062736UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:lightish purple", [
    4604003407298344117UL, 4599464485320955029UL, 4606299360049552605UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:rusty red", [
    4604356630798530038UL, 4595808622094030744UL, 4587507869839661594UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:lavender blue", [
    4603085026197860721UL, 4602979059147804945UL, 4606935162349887263UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:light grass green", [
    4603614861448139603UL, 4606899839999868671UL, 4600736089921624345UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:light mint green", [
    4604038729648362709UL, 4607041129399943039UL, 4604462597848585814UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:sunflower", [
    4607182418800017408UL, 4605133722498939065UL, 4589750839065842194UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:velvet", [
    4601937049822256477UL, 4584682081838174224UL, 4599393840620917844UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:brick orange", [
    4604992433098864696UL, 4598899327720657555UL, 4585247239438471698UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:lightish red", [
    4607147096449998816UL, 4595808622094030744UL, 4598899327720657555UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:pure blue", [
    4575674882583433232UL, 4577935512984623128UL, 4606158070649478236UL, 4607182418800017408UL,
  ])
}

///|
fn line_color_source_names_8() -> Unit raise {
  line_color_source_name("xkcd:twilight blue", [
    4585812397038769172UL, 4598404814820397265UL, 4602290273322442399UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:violet red", [
    4604003407298344117UL, 0UL, 4599676419421066581UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:yellowy brown", [
    4604321308448511446UL, 4603085026197860721UL, 4586942712239364120UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:carnation", [
    4607111774099980224UL, 4602219628622405214UL, 4603226315597935090UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:muddy yellow", [
    4604921788398827512UL, 4604250663748474262UL, 4581308797411398676UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dark seafoam green", [
    4597927963095146271UL, 4604356630798530038UL, 4602007694522293662UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:deep rose", [
    4605204367198976249UL, 4598687393620546002UL, 4600948024021735898UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dusty red", [
    4604709854298715959UL, 4598758038320583186UL, 4599181906520806292UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:grey/blue", [
    4600736089921624345UL, 4602502207422553951UL, 4603190993247916498UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:lemon lime", [
    4604921788398827512UL, 4607147096449998816UL, 4594819596293510164UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:purple/pink", [
    4605769524799273723UL, 4594395728093287059UL, 4606016781249403868UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:brown yellow", [
    4604462597848585814UL, 4603508894398083827UL, 4581308797411398676UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:purple brown", [
    4600948024021735898UL, 4597362805494848797UL, 4598069252495220640UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:wisteria", [
    4604109374348399893UL, 4602502207422553951UL, 4605027755448883288UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:banana yellow", [
    4607005807049924447UL, 4607147096449998816UL, 4598969972420694739UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:lipstick red", [
    4604957110748846104UL, 4575674882583433232UL, 4595808622094030744UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:water blue", [
    4588073027439959068UL, 4602943736797786353UL, 4605380978949069210UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:brown grey", [
    4603155670897897906UL, 4602837769747730577UL, 4601018668721773082UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:vibrant purple", [
    4604285986098492854UL, 4577935512984623128UL, 4606016781249403868UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:baby green", [
    4603120348547879314UL, 4607182418800017408UL, 4603756150848213972UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:barf green", [
    4603402927348028051UL, 4604250663748474262UL, 4575674882583433232UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:eggshell blue", [
    4605098400148920473UL, 4607182418800017408UL, 4606899839999868671UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:sandy yellow", [
    4607111774099980224UL, 4606581938849701342UL, 4601795760422182109UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:cool green", [
    4596373779694328218UL, 4604674531948697367UL, 4600736089921624345UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:pale", [
    4607182418800017408UL, 4606970484699905855UL, 4605522268349143578UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:blue/grey", [
    4601937049822256477UL, 4603155670897897906UL, 4603932762598306932UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:hot magenta", [
    4606829195299831487UL, 4580178482210803728UL, 4605275011899013433UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:greyblue", [
    4602078339222330846UL, 4603862117898269748UL, 4604568564898641591UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:purpley", [
    4602943736797786353UL, 4599747064121103766UL, 4606228715349515421UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:baby shit green", [
    4602979059147804945UL, 4603508894398083827UL, 4591163733066585879UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:brownish pink", [
    4605027755448883288UL, 4602572852122591136UL, 4602219628622405214UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dark aquamarine", [
    4571171282956062736UL, 4601795760422182109UL, 4601654471022107740UL, 4607182418800017408UL,
  ])
}

///|
fn line_color_source_names_9() -> Unit raise {
  line_color_source_name("xkcd:diarrhea", [
    4603791473198232564UL, 4602802447397711984UL, 4577935512984623128UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:light mustard", [
    4606899839999868671UL, 4605698880099236539UL, 4600453511121475608UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:pale sky blue", [
    4604851143698790328UL, 4606864517649850079UL, 4607147096449998816UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:turtle green", [
    4601937049822256477UL, 4604674531948697367UL, 4599252551220843476UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:bright olive", [
    4603685506148176788UL, 4604780498998753143UL, 4580178482210803728UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dark grey blue", [
    4594960885693584533UL, 4598616748920508818UL, 4600100287621289687UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:greeny brown", [
    4601089313421810266UL, 4600453511121475608UL, 4582439112611993624UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:lemon green", [
    4604285986098492854UL, 4606935162349887263UL, 4575674882583433232UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:light periwinkle", [
    4604992433098864696UL, 4605169044848957657UL, 4607076451749961632UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:seaweed green", [
    4596656358494476955UL, 4604285986098492854UL, 4601230602821884635UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:sunshine yellow", [
    4607182418800017408UL, 4607111774099980224UL, 4596938937294625692UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:ugly purple", [
    4603968084948325525UL, 4598334170120360081UL, 4603826795548251156UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:medium pink", [
    4606758550599794302UL, 4600524155821512792UL, 4603473572048065235UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:puke brown", [
    4603402927348028051UL, 4602078339222330846UL, 4582439112611993624UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:very light pink", [
    4607182418800017408UL, 4606793872949812895UL, 4606723228249775710UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:viridian", [
    4593141784667627038UL, 4603296960297972274UL, 4600948024021735898UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:bile", [
    4604568564898641591UL, 4605063077798901880UL, 4582439112611993624UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:faded yellow", [
    4607147096449998816UL, 4607182418800017408UL, 4602643496822628320UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:very pale green", [
    4605486945999124986UL, 4607111774099980224UL, 4604815821348771736UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:vibrant green", [
    4585812397038769172UL, 4605981458899385276UL, 4584682081838174224UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:bright lime", [
    4602943736797786353UL, 4607111774099980224UL, 4581308797411398676UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:spearmint", [
    4593141784667627038UL, 4606935162349887263UL, 4602007694522293662UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:light aquamarine", [
    4602360918022479583UL, 4607111774099980224UL, 4605204367198976249UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:light sage", [
    4604815821348771736UL, 4606511294149664158UL, 4604250663748474262UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:yellowgreen", [
    4604780498998753143UL, 4606970484699905855UL, 4588638185040256542UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:baby poo", [
    4604215341398455669UL, 4603261637947953682UL, 4580178482210803728UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dark seafoam", [
    4593424363467775775UL, 4604568564898641591UL, 4602290273322442399UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:deep teal", [
    0UL, 4599676419421066581UL, 4600029642921252503UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:heather", [
    4603968084948325525UL, 4602837769747730577UL, 4604250663748474262UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:rust orange", [
    4605098400148920473UL, 4599676419421066581UL, 4584682081838174224UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dirty blue", [
    4598069252495220640UL, 4602767125047693392UL, 4603720828498195380UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:fern green", [
    4599605774721029397UL, 4603155670897897906UL, 4598475459520434449UL, 4607182418800017408UL,
  ])
}

///|
fn line_color_source_names_10() -> Unit raise {
  line_color_source_name("xkcd:bright lilac", [
    4605275011899013433UL, 4600312221721401240UL, 4607041129399943039UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:weird green", [
    4597362805494848797UL, 4606264037699534013UL, 4602643496822628320UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:peacock blue", [
    4571171282956062736UL, 4600948024021735898UL, 4603438249698046643UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:avocado green", [
    4602943736797786353UL, 4604144696698418485UL, 4593971859893063953UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:faded orange", [
    4606652583549738526UL, 4603402927348028051UL, 4599111261820769107UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:grape purple", [
    4600241577021364055UL, 4590315996666139668UL, 4599393840620917844UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:hot green", [
    4594395728093287059UL, 4607182418800017408UL, 4594960885693584533UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:lime yellow", [
    4605522268349143578UL, 4607147096449998816UL, 4592859205867478301UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:mango", [
    4607182418800017408UL, 4604038729648362709UL, 4595243464493733270UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:shamrock", [
    4571171282956062736UL, 4604533242548622999UL, 4599040617120731923UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:bubblegum", [
    4607182418800017408UL, 4601301247521921819UL, 4604568564898641591UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:purplish brown", [
    4601230602821884635UL, 4598334170120360081UL, 4598687393620546002UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:vomit yellow", [
    4605204367198976249UL, 4604992433098864696UL, 4586942712239364120UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:pale cyan", [
    4604639209598678775UL, 4607182418800017408UL, 4607005807049924447UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:key lime", [
    4604321308448511446UL, 4607182418800017408UL, 4601442536921996188UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:tomato red", [
    4606511294149664158UL, 4595526043293882007UL, 4571171282956062736UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:lightgreen", [
    4602007694522293662UL, 4607182418800017408UL, 4602360918022479583UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:merlot", [
    4601795760422182109UL, 0UL, 4597221516094774429UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:night blue", [
    4580178482210803728UL, 4577935512984623128UL, 4598758038320583186UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:purpleish pink", [
    4606052103599422460UL, 4599181906520806292UL, 4605239689548994841UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:apple", [
    4601442536921996188UL, 4605345656599050617UL, 4597645384294997534UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:baby poop green", [
    4603226315597935090UL, 4603544216748102419UL, 4581308797411398676UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:green apple", [
    4600312221721401240UL, 4605946136549366684UL, 4593424363467775775UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:heliotrope", [
    4605840169499310907UL, 4599252551220843476UL, 4606829195299831487UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:yellow/green", [
    4605239689548994841UL, 4607111774099980224UL, 4597786673695071903UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:almost black", [
    4583569427812588572UL, 4587507869839661594UL, 4587507869839661594UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:cool blue", [
    4598828683020620370UL, 4602837769747730577UL, 4604674531948697367UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:leafy green", [
    4599393840620917844UL, 4604639209598678775UL, 4597504094894923166UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:mustard brown", [
    4604250663748474262UL, 4602572852122591136UL, 4580178482210803728UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dusk", [
    4599181906520806292UL, 4599605774721029397UL, 4602731802697674800UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dull brown", [
    4602943736797786353UL, 4601442536921996188UL, 4598969972420694739UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:frog green", [
    4599888353521178134UL, 4604815821348771736UL, 4584682081838174224UL, 4607182418800017408UL,
  ])
}

///|
fn line_color_source_names_11() -> Unit raise {
  line_color_source_name("xkcd:vivid green", [
    4595808622094030744UL, 4606617261199719934UL, 4589185681465544720UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:bright light green", [
    4595526043293882007UL, 4607147096449998816UL, 4599605774721029397UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:fluro green", [
    4585812397038769172UL, 4607182418800017408UL, 4575674882583433232UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:kiwi", [
    4603685506148176788UL, 4606617261199719934UL, 4598404814820397265UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:seaweed", [
    4591446311866734616UL, 4605557590699162170UL, 4602360918022479583UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:navy green", [
    4596656358494476955UL, 4599535130020992213UL, 4585812397038769172UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:ultramarine blue", [
    4591446311866734616UL, 4581308797411398676UL, 4605910814199348091UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:iris", [
    4600594800521549977UL, 4599888353521178134UL, 4605098400148920473UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:pastel orange", [
    4607182418800017408UL, 4603473572048065235UL, 4599252551220843476UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:yellowish orange", [
    4607182418800017408UL, 4604215341398455669UL, 4588638185040256542UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:perrywinkle", [
    4603226315597935090UL, 4603120348547879314UL, 4606334682399571197UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:tealish", [
    4594254438693212690UL, 4604815821348771736UL, 4604109374348399893UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dark plum", [
    4598069252495220640UL, 4571171282956062736UL, 4595384753893807638UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:pear", [
    4605345656599050617UL, 4606935162349887263UL, 4600382866421438424UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:pinkish orange", [
    4607182418800017408UL, 4601725115722144925UL, 4599040617120731923UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:midnight purple", [
    4594819596293510164UL, 4571171282956062736UL, 4596938937294625692UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:light urple", [
    4604497920198604406UL, 4601513181622033372UL, 4606864517649850079UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dark mint", [
    4598758038320583186UL, 4604957110748846104UL, 4601725115722144925UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:greenish tan", [
    4604815821348771736UL, 4605345656599050617UL, 4602290273322442399UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:light burgundy", [
    4604109374348399893UL, 4598263525420322896UL, 4600100287621289687UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:turquoise blue", [
    4582439112611993624UL, 4604427275498567222UL, 4605098400148920473UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:ugly pink", [
    4605416301299087802UL, 4601937049822256477UL, 4602837769747730577UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:sandy", [
    4606687905899757118UL, 4605875491849329499UL, 4602290273322442399UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:electric pink", [
    4607182418800017408UL, 4580178482210803728UL, 4603261637947953682UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:muted purple", [
    4602696480347656208UL, 4600100287621289687UL, 4602943736797786353UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:mid green", [
    4599323195920880660UL, 4604074051998381301UL, 4598687393620546002UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:greyish", [
    4604109374348399893UL, 4603968084948325525UL, 4603438249698046643UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:neon yellow", [
    4605486945999124986UL, 4607182418800017408UL, 4580178482210803728UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:banana", [
    4607182418800017408UL, 4607182418800017408UL, 4602572852122591136UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:carnation pink", [
    4607182418800017408UL, 4602643496822628320UL, 4604074051998381301UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:tomato", [
    4606617261199719934UL, 4598192880720285712UL, 4594537017493361427UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:sea", [
    4597645384294997534UL, 4603579539098121011UL, 4603332282647990866UL, 4607182418800017408UL,
  ])
}

///|
fn line_color_source_names_12() -> Unit raise {
  line_color_source_name("xkcd:muddy brown", [
    4602979059147804945UL, 4601018668721773082UL, 4582439112611993624UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:turquoise green", [
    4580178482210803728UL, 4606793872949812895UL, 4603014381497823537UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:buff", [
    4607147096449998816UL, 4606864517649850079UL, 4603756150848213972UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:fawn", [
    4605486945999124986UL, 4604356630798530038UL, 4602360918022479583UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:muted blue", [
    4597504094894923166UL, 4601654471022107740UL, 4603791473198232564UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:pale rose", [
    4607111774099980224UL, 4604992433098864696UL, 4605133722498939065UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dark mint green", [
    4593689281092915216UL, 4604957110748846104UL, 4601795760422182109UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:amethyst", [
    4603650183798158195UL, 4600382866421438424UL, 4604957110748846104UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:blue/green", [
    4588638185040256542UL, 4603650183798158195UL, 4603190993247916498UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:chestnut", [
    4601866405122219293UL, 4594819596293510164UL, 4575674882583433232UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:sick green", [
    4603720828498195380UL, 4604709854298715959UL, 4595384753893807638UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:pea", [
    4603968084948325525UL, 4604921788398827512UL, 4593689281092915216UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:rusty orange", [
    4605416301299087802UL, 4599958998221215318UL, 4585247239438471698UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:stone", [
    4604285986098492854UL, 4604003407298344117UL, 4602943736797786353UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:rose red", [
    4604886466048808920UL, 4571171282956062736UL, 4597645384294997534UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:pale aqua", [
    4604674531948697367UL, 4607182418800017408UL, 4606475971799645565UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:deep orange", [
    4605946136549366684UL, 4599111261820769107UL, 4571171282956062736UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:earth", [
    4603897440248288340UL, 4600806734621661529UL, 4597927963095146271UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:mossy green", [
    4600665445221587161UL, 4603085026197860721UL, 4594678306893435796UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:grassy green", [
    4598263525420322896UL, 4603685506148176788UL, 4577935512984623128UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:pale lime green", [
    4604427275498567222UL, 4607182418800017408UL, 4600806734621661529UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:light grey blue", [
    4603720828498195380UL, 4604815821348771736UL, 4605663557749217947UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:pale grey", [
    4607111774099980224UL, 4607111774099980224UL, 4607147096449998816UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:asparagus", [
    4602078339222330846UL, 4604215341398455669UL, 4599747064121103766UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:blueberry", [
    4598616748920508818UL, 4598263525420322896UL, 4603473572048065235UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:purple red", [
    4603579539098121011UL, 4571171282956062736UL, 4598687393620546002UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:pale lime", [
    4604886466048808920UL, 4607111774099980224UL, 4601795760422182109UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:greenish teal", [
    4596232490294253849UL, 4604921788398827512UL, 4602837769747730577UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:caramel", [
    4604356630798530038UL, 4601513181622033372UL, 4585247239438471698UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:deep magenta", [
    4603826795548251156UL, 4575674882583433232UL, 4600170932321326871UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:light peach", [
    4607182418800017408UL, 4605804847149292315UL, 4604427275498567222UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:milk chocolate", [
    4602643496822628320UL, 4599181906520806292UL, 4593141784667627038UL, 4607182418800017408UL,
  ])
}

///|
fn line_color_source_names_13() -> Unit raise {
  line_color_source_name("xkcd:ocher", [
    4604921788398827512UL, 4603650183798158195UL, 4586942712239364120UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:off green", [
    4601230602821884635UL, 4603932762598306932UL, 4599535130020992213UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:purply pink", [
    4606652583549738526UL, 4601937049822256477UL, 4606299360049552605UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:lightblue", [
    4602360918022479583UL, 4605239689548994841UL, 4606864517649850079UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dusky blue", [
    4598687393620546002UL, 4600382866421438424UL, 4603402927348028051UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:golden", [
    4606829195299831487UL, 4604921788398827512UL, 4577935512984623128UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:light beige", [
    4607182418800017408UL, 4607147096449998816UL, 4604603887248660183UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:butter yellow", [
    4607182418800017408UL, 4607111774099980224UL, 4601866405122219293UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dusky purple", [
    4603014381497823537UL, 4600100287621289687UL, 4602360918022479583UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:french blue", [
    4598404814820397265UL, 4601230602821884635UL, 4604285986098492854UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:ugly yellow", [
    4605522268349143578UL, 4604992433098864696UL, 4571171282956062736UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:greeny yellow", [
    4605169044848957657UL, 4606935162349887263UL, 4584682081838174224UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:orangish red", [
    4606793872949812895UL, 4596797647894551323UL, 4581308797411398676UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:shamrock green", [
    4575674882583433232UL, 4604992433098864696UL, 4599111261820769107UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:orangish brown", [
    4604462597848585814UL, 4600382866421438424UL, 4577935512984623128UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:tree green", [
    4595102175093658901UL, 4602572852122591136UL, 4591728890666883353UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:deep violet", [
    4598828683020620370UL, 4582439112611993624UL, 4598758038320583186UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:gunmetal", [
    4599535130020992213UL, 4600594800521549977UL, 4600948024021735898UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:blue/purple", [
    4600029642921252503UL, 4582439112611993624UL, 4606617261199719934UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:cherry", [
    4605486945999124986UL, 4575674882583433232UL, 4596515069094402586UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:sandy brown", [
    4605098400148920473UL, 4604038729648362709UL, 4600524155821512792UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:warm grey", [
    4603508894398083827UL, 4603049703847842129UL, 4602837769747730577UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dark indigo", [
    4593424363467775775UL, 4585247239438471698UL, 4599605774721029397UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:midnight", [
    4577935512984623128UL, 4571171282956062736UL, 4595526043293882007UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:bluey green", [
    4595243464493733270UL, 4604427275498567222UL, 4602219628622405214UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:grey pink", [
    4605063077798901880UL, 4603261637947953682UL, 4603650183798158195UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:soft purple", [
    4604038729648362709UL, 4601513181622033372UL, 4604568564898641591UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:blood", [
    4602078339222330846UL, 0UL, 4571171282956062736UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:brown red", [
    4603332282647990866UL, 4595243464493733270UL, 4581308797411398676UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:medium grey", [
    4602502207422553951UL, 4602643496822628320UL, 4602431562722516767UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:berry", [
    4603579539098121011UL, 4588638185040256542UL, 4598969972420694739UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:poo", [
    4603226315597935090UL, 4601795760422182109UL, 4577935512984623128UL, 4607182418800017408UL,
  ])
}

///|
fn line_color_source_names_14() -> Unit raise {
  line_color_source_name("xkcd:purpley pink", [
    4605239689548994841UL, 4597645384294997534UL, 4604709854298715959UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:light salmon", [
    4607147096449998816UL, 4604144696698418485UL, 4603367604998009458UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:snot", [
    4604250663748474262UL, 4604780498998753143UL, 4587507869839661594UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:easter purple", [
    4604957110748846104UL, 4601654471022107740UL, 4607147096449998816UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:light yellow green", [
    4605380978949069210UL, 4607111774099980224UL, 4602643496822628320UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dark navy blue", [
    0UL, 4575674882583433232UL, 4595667332693956375UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:drab", [
    4602767125047693392UL, 4602802447397711984UL, 4598475459520434449UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:light rose", [
    4607182418800017408UL, 4605133722498939065UL, 4605345656599050617UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:rouge", [
    4604215341398455669UL, 4589750839065842194UL, 4597221516094774429UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:purplish red", [
    4604391953148548630UL, 4581308797411398676UL, 4598969972420694739UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:slime green", [
    4603579539098121011UL, 4605380978949069210UL, 4580178482210803728UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:baby poop", [
    4603367604998009458UL, 4602431562722516767UL, 0UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:irish green", [
    4571171282956062736UL, 4603438249698046643UL, 4594960885693584533UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:pink/purple", [
    4606617261199719934UL, 4592859205867478301UL, 4606334682399571197UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dark navy", [
    0UL, 4580178482210803728UL, 4596656358494476955UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:greeny blue", [
    4598334170120360081UL, 4604497920198604406UL, 4603438249698046643UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:light plum", [
    4603720828498195380UL, 4599817708821140950UL, 4602802447397711984UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:pinkish grey", [
    4605239689548994841UL, 4604250663748474262UL, 4604144696698418485UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dirty orange", [
    4605239689548994841UL, 4602007694522293662UL, 4582439112611993624UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:rust red", [
    4604180019048437077UL, 4594678306893435796UL, 4580178482210803728UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:pale lilac", [
    4606228715349515421UL, 4605345656599050617UL, 4607182418800017408UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:orangey red", [
    4607005807049924447UL, 4598334170120360081UL, 4594254438693212690UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:primary blue", [
    4584682081838174224UL, 4580178482210803728UL, 4606970484699905855UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:kermit green", [
    4600170932321326871UL, 4604462597848585814UL, 0UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:brownish purple", [
    4602007694522293662UL, 4598334170120360081UL, 4599181906520806292UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:murky green", [
    4601301247521921819UL, 4602290273322442399UL, 4588073027439959068UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:wheat", [
    4607041129399943039UL, 4605981458899385276UL, 4602572852122591136UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:very dark purple", [
    4595102175093658901UL, 4571171282956062736UL, 4596515069094402586UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:bottle green", [
    4580178482210803728UL, 4598899327720657555UL, 4581308797411398676UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:watermelon", [
    4607111774099980224UL, 4598616748920508818UL, 4599958998221215318UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:deep sky blue", [
    4587507869839661594UL, 4601937049822256477UL, 4606935162349887263UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:fire engine red", [
    4607147096449998816UL, 0UL, 4575674882583433232UL, 4607182418800017408UL,
  ])
}

///|
fn line_color_source_names_15() -> Unit raise {
  line_color_source_name("xkcd:yellow ochre", [
    4605345656599050617UL, 4603720828498195380UL, 4582439112611993624UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:pumpkin orange", [
    4607041129399943039UL, 4602502207422553951UL, 4583569427812588572UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:pale olive", [
    4604709854298715959UL, 4605380978949069210UL, 4602731802697674800UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:light lilac", [
    4606546616499682750UL, 4605239689548994841UL, 4607182418800017408UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:lightish green", [
    4600524155821512792UL, 4606122748299459644UL, 4600453511121475608UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:carolina blue", [
    4603049703847842129UL, 4604674531948697367UL, 4607147096449998816UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:mulberry", [
    4603332282647990866UL, 4585812397038769172UL, 4599181906520806292UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:shocking pink", [
    4607147096449998816UL, 4575674882583433232UL, 4603897440248288340UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:auburn", [
    4603614861448139603UL, 4595949911494105112UL, 4571171282956062736UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:bright lime green", [
    4600806734621661529UL, 4607147096449998816UL, 4584682081838174224UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:celadon", [
    4604886466048808920UL, 4607111774099980224UL, 4604639209598678775UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:pinkish brown", [
    4604427275498567222UL, 4601725115722144925UL, 4600524155821512792UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:poo brown", [
    4602979059147804945UL, 4600382866421438424UL, 4571171282956062736UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:bright sky blue", [
    4575674882583433232UL, 4605380978949069210UL, 4607147096449998816UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:celery", [
    4604992433098864696UL, 4607111774099980224UL, 4603438249698046643UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dirt brown", [
    4602802447397711984UL, 4600806734621661529UL, 4597221516094774429UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:strawberry", [
    4607041129399943039UL, 4594960885693584533UL, 4598404814820397265UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dark lime", [
    4602837769747730577UL, 4604639209598678775UL, 4571171282956062736UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:copper", [
    4604603887248660183UL, 4600665445221587161UL, 4594395728093287059UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:medium brown", [
    4602643496822628320UL, 4599393840620917844UL, 4589750839065842194UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:muted green", [
    4600382866421438424UL, 4603826795548251156UL, 4599464485320955029UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:robin's egg", [
    4601371892221959003UL, 4606546616499682750UL, 4607111774099980224UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:bright aqua", [
    4586377554639066646UL, 4606970484699905855UL, 4606440649449626973UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:bright lavender", [
    4605204367198976249UL, 4600453511121475608UL, 4607182418800017408UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:ivory", [
    4607182418800017408UL, 4607182418800017408UL, 4605345656599050617UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:very light purple", [
    4606864517649850079UL, 4605451623649106394UL, 4607076451749961632UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:light navy", [
    4590598575466288405UL, 4599323195920880660UL, 4602837769747730577UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:pink red", [
    4606829195299831487UL, 4581308797411398676UL, 4599252551220843476UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:olive brown", [
    4600736089921624345UL, 4599605774721029397UL, 4577935512984623128UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:poop brown", [
    4602290273322442399UL, 4599958998221215318UL, 4571171282956062736UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:mustard green", [
    4604109374348399893UL, 4604568564898641591UL, 4580178482210803728UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:ocean green", [
    4597786673695071903UL, 4603579539098121011UL, 4601795760422182109UL, 4607182418800017408UL,
  ])
}

///|
fn line_color_source_names_16() -> Unit raise {
  line_color_source_name("xkcd:very dark blue", [
    0UL, 4571171282956062736UL, 4596373779694328218UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dusty green", [
    4602007694522293662UL, 4604144696698418485UL, 4601795760422182109UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:light navy blue", [
    4595667332693956375UL, 4600029642921252503UL, 4602979059147804945UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:minty green", [
    4586377554639066646UL, 4606899839999868671UL, 4602502207422553951UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:adobe", [
    4604851143698790328UL, 4601301247521921819UL, 4598758038320583186UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:barney", [
    4604250663748474262UL, 4592859205867478301UL, 4604674531948697367UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:jade green", [
    4595243464493733270UL, 4604356630798530038UL, 4601159958121847451UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:bright light blue", [
    4594537017493361427UL, 4606899839999868671UL, 4607111774099980224UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:light lime", [
    4604321308448511446UL, 4607111774099980224UL, 4601301247521921819UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dark khaki", [
    4603650183798158195UL, 4603226315597935090UL, 4599676419421066581UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:orange yellow", [
    4607182418800017408UL, 4604285986098492854UL, 4571171282956062736UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:ocre", [
    4605169044848957657UL, 4603685506148176788UL, 4580178482210803728UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:maize", [
    4606793872949812895UL, 4605522268349143578UL, 4599605774721029397UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:faded pink", [
    4606016781249403868UL, 4603720828498195380UL, 4604250663748474262UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:british racing green", [
    4581308797411398676UL, 4598758038320583186UL, 4587507869839661594UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:sandstone", [
    4605275011899013433UL, 4604321308448511446UL, 4601866405122219293UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:mud brown", [
    4600453511121475608UL, 4598616748920508818UL, 4588638185040256542UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:light sea green", [
    4603544216748102419UL, 4606864517649850079UL, 4604391953148548630UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:robin egg blue", [
    4603049703847842129UL, 4606687905899757118UL, 4607147096449998816UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:aqua marine", [
    4595667332693956375UL, 4606370004749589789UL, 4604780498998753143UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dark sea green", [
    4589468260265693457UL, 4602943736797786353UL, 4600241577021364055UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:soft pink", [
    4607111774099980224UL, 4604391953148548630UL, 4604957110748846104UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:orangey brown", [
    4604427275498567222UL, 4600453511121475608UL, 4575674882583433232UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:cherry red", [
    4606899839999868671UL, 4575674882583433232UL, 4595102175093658901UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:burnt yellow", [
    4605698880099236539UL, 4604215341398455669UL, 4585247239438471698UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:brownish grey", [
    4602908414447767761UL, 4602078339222330846UL, 4600382866421438424UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:camel", [
    4605169044848957657UL, 4603791473198232564UL, 4599958998221215318UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:purplish grey", [
    4602290273322442399UL, 4601018668721773082UL, 4602643496822628320UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:marine", [
    4580178482210803728UL, 4595667332693956375UL, 4600453511121475608UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:greyish pink", [
    4605239689548994841UL, 4603155670897897906UL, 4603402927348028051UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:pale turquoise", [
    4604003407298344117UL, 4607041129399943039UL, 4605698880099236539UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:pastel yellow", [
    4607182418800017408UL, 4607147096449998816UL, 4601654471022107740UL, 4607182418800017408UL,
  ])
}

///|
fn line_color_source_names_17() -> Unit raise {
  line_color_source_name("xkcd:bluey purple", [
    4600594800521549977UL, 4598263525420322896UL, 4605204367198976249UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:canary yellow", [
    4607182418800017408UL, 4607147096449998816UL, 4598192880720285712UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:faded red", [
    4605628235399199354UL, 4598828683020620370UL, 4599181906520806292UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:sepia", [
    4603544216748102419UL, 4600312221721401240UL, 4595243464493733270UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:coffee", [
    4604038729648362709UL, 4602731802697674800UL, 4599040617120731923UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:bright magenta", [
    4607182418800017408UL, 4584682081838174224UL, 4606370004749589789UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:mocha", [
    4603720828498195380UL, 4602007694522293662UL, 4599393840620917844UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:ecru", [
    4607147096449998816UL, 4607182418800017408UL, 4605310334249032025UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:purpleish", [
    4603544216748102419UL, 4599747064121103766UL, 4603155670897897906UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:cranberry", [
    4603756150848213972UL, 0UL, 4597362805494848797UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:darkish green", [
    4594819596293510164UL, 4602431562722516767UL, 4596938937294625692UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:brown orange", [
    4604709854298715959UL, 4601089313421810266UL, 4575674882583433232UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dusky rose", [
    4604745176648734551UL, 4601018668721773082UL, 4601795760422182109UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:melon", [
    4607182418800017408UL, 4602148983922368030UL, 4599676419421066581UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:sickly green", [
    4603402927348028051UL, 4604462597848585814UL, 4592576627067329564UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:silver", [
    4605133722498939065UL, 4605275011899013433UL, 4605204367198976249UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:purply blue", [
    4600877379321698714UL, 4592011469467032090UL, 4606581938849701342UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:purpleish blue", [
    4600524155821512792UL, 4598192880720285712UL, 4606617261199719934UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:hospital green", [
    4603650183798158195UL, 4606264037699534013UL, 4604180019048437077UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:shit brown", [
    4602360918022479583UL, 4599888353521178134UL, 4580178482210803728UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:mid blue", [
    4594678306893435796UL, 4601159958121847451UL, 4604497920198604406UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:amber", [
    4607147096449998816UL, 4604497920198604406UL, 4584682081838174224UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:easter green", [
    4603120348547879314UL, 4607111774099980224UL, 4602572852122591136UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:soft blue", [
    4600736089921624345UL, 4602979059147804945UL, 4606440649449626973UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:cerulean blue", [
    4581308797411398676UL, 4601442536921996188UL, 4606581938849701342UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:golden brown", [
    4604462597848585814UL, 4602290273322442399UL, 4571171282956062736UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:bright turquoise", [
    4588638185040256542UL, 4607147096449998816UL, 4606970484699905855UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:red pink", [
    4607005807049924447UL, 4595102175093658901UL, 4599676419421066581UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:red purple", [
    4602767125047693392UL, 4583569427812588572UL, 4598687393620546002UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:greyish brown", [
    4602290273322442399UL, 4601159958121847451UL, 4599252551220843476UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:vermillion", [
    4606793872949812895UL, 4596232490294253849UL, 4586942712239364120UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:russet", [
    4603862117898269748UL, 4597221516094774429UL, 4581308797411398676UL, 4607182418800017408UL,
  ])
}

///|
fn line_color_source_names_18() -> Unit raise {
  line_color_source_name("xkcd:steel grey", [
    4601513181622033372UL, 4602767125047693392UL, 4603049703847842129UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:lighter purple", [
    4604003407298344117UL, 4600029642921252503UL, 4606793872949812895UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:bright violet", [
    4604285986098492854UL, 4585812397038769172UL, 4607111774099980224UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:prussian blue", [
    0UL, 4598546104220471633UL, 4602078339222330846UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:slate green", [
    4600806734621661529UL, 4603155670897897906UL, 4601371892221959003UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dirty pink", [
    4605310334249032025UL, 4602360918022479583UL, 4602696480347656208UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dark blue green", [
    0UL, 4599464485320955029UL, 4598828683020620370UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:pine", [
    4595243464493733270UL, 4600241577021364055UL, 4596515069094402586UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:yellowy green", [
    4604921788398827512UL, 4606687905899757118UL, 4594819596293510164UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dark gold", [
    4604568564898641591UL, 4603402927348028051UL, 4589185681465544720UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:bluish", [
    4594960885693584533UL, 4602007694522293662UL, 4604780498998753143UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:darkish blue", [
    4571171282956062736UL, 4598263525420322896UL, 4602767125047693392UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dull red", [
    4604780498998753143UL, 4598069252495220640UL, 4598069252495220640UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:pinky red", [
    4607076451749961632UL, 4594537017493361427UL, 4598687393620546002UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:bronze", [
    4604109374348399893UL, 4602219628622405214UL, 0UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:pale teal", [
    4602767125047693392UL, 4605345656599050617UL, 4604462597848585814UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:military green", [
    4600877379321698714UL, 4602431562722516767UL, 4597927963095146271UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:barbie pink", [
    4607147096449998816UL, 4598616748920508818UL, 4604003407298344117UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:bubblegum pink", [
    4607147096449998816UL, 4602802447397711984UL, 4605380978949069210UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:pea soup green", [
    4603402927348028051UL, 4604038729648362709UL, 4591163733066585879UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dark mustard", [
    4604109374348399893UL, 4603014381497823537UL, 4581308797411398676UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:shit", [
    4602643496822628320UL, 4600382866421438424UL, 0UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:medium purple", [
    4603756150848213972UL, 4598404814820397265UL, 4603897440248288340UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:very dark green", [
    4582439112611993624UL, 4595667332693956375UL, 4577935512984623128UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dirt", [
    4603049703847842129UL, 4601442536921996188UL, 4598546104220471633UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dusky pink", [
    4605380978949069210UL, 4602290273322442399UL, 4603085026197860721UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:red violet", [
    4603756150848213972UL, 4571171282956062736UL, 4601018668721773082UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:lemon yellow", [
    4607111774099980224UL, 4607182418800017408UL, 4597080226694700060UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:pistachio", [
    4604957110748846104UL, 4607005807049924447UL, 4603085026197860721UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dull yellow", [
    4606581938849701342UL, 4605946136549366684UL, 4600100287621289687UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dark lime green", [
    4602572852122591136UL, 4604851143698790328UL, 4571171282956062736UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:denim blue", [
    4597504094894923166UL, 4600100287621289687UL, 4603332282647990866UL, 4607182418800017408UL,
  ])
}

///|
fn line_color_source_names_19() -> Unit raise {
  line_color_source_name("xkcd:teal blue", [
    4571171282956062736UL, 4602979059147804945UL, 4603791473198232564UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:lightish blue", [
    4597786673695071903UL, 4602290273322442399UL, 4607111774099980224UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:purpley blue", [
    4600382866421438424UL, 4596515069094402586UL, 4606334682399571197UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:light indigo", [
    4601371892221959003UL, 4600029642921252503UL, 4605486945999124986UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:swamp green", [
    4601866405122219293UL, 4602873092097749169UL, 0UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:brown green", [
    4601583826322070556UL, 4601301247521921819UL, 4589468260265693457UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dark maroon", [
    4597645384294997534UL, 0UL, 4584682081838174224UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:hot purple", [
    4605345656599050617UL, 0UL, 4606829195299831487UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dark forest green", [
    0UL, 4595526043293882007UL, 4580178482210803728UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:faded blue", [
    4600806734621661529UL, 4603120348547879314UL, 4604780498998753143UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:drab green", [
    4601866405122219293UL, 4603438249698046643UL, 4599393840620917844UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:light lime green", [
    4604709854298715959UL, 4607182418800017408UL, 4600877379321698714UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:snot green", [
    4603720828498195380UL, 4604992433098864696UL, 0UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:yellowish", [
    4607005807049924447UL, 4606581938849701342UL, 4600877379321698714UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:light blue green", [
    4602572852122591136UL, 4607041129399943039UL, 4604497920198604406UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:bordeaux", [
    4602360918022479583UL, 0UL, 4595384753893807638UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:light mauve", [
    4605027755448883288UL, 4603332282647990866UL, 4603862117898269748UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:ocean", [
    4571171282956062736UL, 4602360918022479583UL, 4603332282647990866UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:marigold", [
    4607076451749961632UL, 4604957110748846104UL, 4582439112611993624UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:muddy green", [
    4600806734621661529UL, 4601866405122219293UL, 4596232490294253849UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dull orange", [
    4605804847149292315UL, 4602908414447767761UL, 4597504094894923166UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:steel", [
    4601795760422182109UL, 4602873092097749169UL, 4603438249698046643UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:electric purple", [
    4604180019048437077UL, 4594113149293138322UL, 4607182418800017408UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:fluorescent green", [
    4584682081838174224UL, 4607182418800017408UL, 4584682081838174224UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:yellowish brown", [
    4603650183798158195UL, 4602290273322442399UL, 4571171282956062736UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:blush", [
    4606723228249775710UL, 4603756150848213972UL, 4603190993247916498UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:soft green", [
    4601513181622033372UL, 4605027755448883288UL, 4602007694522293662UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:bright orange", [
    4607182418800017408UL, 4600100287621289687UL, 0UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:lemon", [
    4607111774099980224UL, 4607182418800017408UL, 4599464485320955029UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:purple grey", [
    4602908414447767761UL, 4601513181622033372UL, 4602873092097749169UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:acid green", [
    4603226315597935090UL, 4607147096449998816UL, 4585247239438471698UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:pale lavender", [
    4606581938849701342UL, 4605486945999124986UL, 4607147096449998816UL, 4607182418800017408UL,
  ])
}

///|
fn line_color_source_names_20() -> Unit raise {
  line_color_source_name("xkcd:violet blue", [
    4599393840620917844UL, 4585812397038769172UL, 4605275011899013433UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:light forest green", [
    4599252551220843476UL, 4603296960297972274UL, 4599535130020992213UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:burnt red", [
    4603791473198232564UL, 4594113149293138322UL, 4581308797411398676UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:khaki green", [
    4601725115722144925UL, 4602908414447767761UL, 4597221516094774429UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:cerise", [
    4606016781249403868UL, 4586942712239364120UL, 4600594800521549977UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:faded purple", [
    4603296960297972274UL, 4601442536921996188UL, 4603579539098121011UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:apricot", [
    4607182418800017408UL, 4604427275498567222UL, 4601371892221959003UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dark olive green", [
    4597645384294997534UL, 4599111261820769107UL, 4577935512984623128UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:grey brown", [
    4602643496822628320UL, 4601583826322070556UL, 4599535130020992213UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:green grey", [
    4602078339222330846UL, 4603332282647990866UL, 4601513181622033372UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:true blue", [
    4571171282956062736UL, 4588638185040256542UL, 4605380978949069210UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:pale violet", [
    4605451623649106394UL, 4604321308448511446UL, 4607005807049924447UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:periwinkle blue", [
    4603226315597935090UL, 4603579539098121011UL, 4607041129399943039UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:light sky blue", [
    4605169044848957657UL, 4607076451749961632UL, 4607182418800017408UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:blurple", [
    4599676419421066581UL, 4597221516094774429UL, 4605380978949069210UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:green brown", [
    4599605774721029397UL, 4599181906520806292UL, 4577935512984623128UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:bluegreen", [
    4571171282956062736UL, 4602290273322442399UL, 4602219628622405214UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:bright teal", [
    4571171282956062736UL, 4606970484699905855UL, 4605169044848957657UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:brownish yellow", [
    4605275011899013433UL, 4604391953148548630UL, 4577935512984623128UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:pea soup", [
    4603332282647990866UL, 4603579539098121011UL, 4571171282956062736UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:forest", [
    4586377554639066646UL, 4599676419421066581UL, 4585247239438471698UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:barney purple", [
    4603826795548251156UL, 4580178482210803728UL, 4603544216748102419UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:ultramarine", [
    4593689281092915216UL, 0UL, 4604427275498567222UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:purplish", [
    4603402927348028051UL, 4599747064121103766UL, 4603120348547879314UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:puke yellow", [
    4605027755448883288UL, 4604886466048808920UL, 4588073027439959068UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:bluish grey", [
    4601866405122219293UL, 4603085026197860721UL, 4603508894398083827UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dark periwinkle", [
    4600877379321698714UL, 4600382866421438424UL, 4605557590699162170UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dark lilac", [
    4603685506148176788UL, 4601371892221959003UL, 4604003407298344117UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:reddish", [
    4605098400148920473UL, 4598334170120360081UL, 4598192880720285712UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:light maroon", [
    4603897440248288340UL, 4598758038320583186UL, 4599817708821140950UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dusty purple", [
    4602767125047693392UL, 4600382866421438424UL, 4602943736797786353UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:terra cotta", [
    4605275011899013433UL, 4600736089921624345UL, 4597504094894923166UL, 4607182418800017408UL,
  ])
}

///|
fn line_color_source_names_21() -> Unit raise {
  line_color_source_name("xkcd:avocado", [
    4603261637947953682UL, 4604427275498567222UL, 4596515069094402586UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:marine blue", [
    4571171282956062736UL, 4597080226694700060UL, 4601159958121847451UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:teal green", [
    4594395728093287059UL, 4603932762598306932UL, 4601513181622033372UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:slate grey", [
    4599958998221215318UL, 4600806734621661529UL, 4601371892221959003UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:lighter green", [
    4601937049822256477UL, 4607111774099980224UL, 4600665445221587161UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:electric green", [
    4593830570492989585UL, 4607076451749961632UL, 4587507869839661594UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dusty blue", [
    4600029642921252503UL, 4602908414447767761UL, 4604285986098492854UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:golden yellow", [
    4607147096449998816UL, 4605169044848957657UL, 4590598575466288405UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:bright yellow", [
    4607182418800017408UL, 4607111774099980224UL, 4571171282956062736UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:light lavender", [
    4606052103599422460UL, 4605133722498939065UL, 4607147096449998816UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:umber", [
    4604462597848585814UL, 4600736089921624345UL, 0UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:poop", [
    4602643496822628320UL, 4600312221721401240UL, 0UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dark peach", [
    4606016781249403868UL, 4602572852122591136UL, 4600241577021364055UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:jungle green", [
    4580178482210803728UL, 4602767125047693392UL, 4598404814820397265UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:eggshell", [
    4607182418800017408UL, 4607182418800017408UL, 4605663557749217947UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:denim", [
    4597504094894923166UL, 4600665445221587161UL, 4603120348547879314UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:yellow brown", [
    4604639209598678775UL, 4603402927348028051UL, 0UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dull purple", [
    4602837769747730577UL, 4599958998221215318UL, 4602572852122591136UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:chocolate brown", [
    4598263525420322896UL, 4591728890666883353UL, 0UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:wine red", [
    4602360918022479583UL, 4577935512984623128UL, 4594113149293138322UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:neon blue", [
    4580178482210803728UL, 4605840169499310907UL, 4607182418800017408UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dirty green", [
    4600877379321698714UL, 4602572852122591136UL, 4595384753893807638UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:light tan", [
    4607041129399943039UL, 4606581938849701342UL, 4604250663748474262UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:ice blue", [
    4605769524799273723UL, 4607182418800017408UL, 4607147096449998816UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:cadet blue", [
    4599181906520806292UL, 4601866405122219293UL, 4603473572048065235UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dark mauve", [
    4602943736797786353UL, 4599040617120731923UL, 4600594800521549977UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:very light blue", [
    4605698880099236539UL, 4607182418800017408UL, 4607182418800017408UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:grey purple", [
    4602767125047693392UL, 4601371892221959003UL, 4603120348547879314UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:pastel pink", [
    4607182418800017408UL, 4604745176648734551UL, 4605416301299087802UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:very light green", [
    4605557590699162170UL, 4607182418800017408UL, 4604851143698790328UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dark sky blue", [
    4598475459520434449UL, 4603190993247916498UL, 4606228715349515421UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:evergreen", [
    4581308797411398676UL, 4598687393620546002UL, 4595102175093658901UL, 4607182418800017408UL,
  ])
}

///|
fn line_color_source_names_22() -> Unit raise {
  line_color_source_name("xkcd:dull pink", [
    4605698880099236539UL, 4602908414447767761UL, 4603720828498195380UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:aubergine", [
    4597786673695071903UL, 4583569427812588572UL, 4596515069094402586UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:mahogany", [
    4598899327720657555UL, 4571171282956062736UL, 0UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:reddish orange", [
    4606935162349887263UL, 4598758038320583186UL, 4592576627067329564UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:deep green", [
    4575674882583433232UL, 4599958998221215318UL, 4588638185040256542UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:vomit green", [
    4603014381497823537UL, 4603897440248288340UL, 4577935512984623128UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:purple pink", [
    4606087425949441052UL, 4598069252495220640UL, 4605804847149292315UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dusty pink", [
    4605698880099236539UL, 4603049703847842129UL, 4603402927348028051UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:faded green", [
    4602360918022479583UL, 4604462597848585814UL, 4601866405122219293UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:camo green", [
    4599464485320955029UL, 4600806734621661529UL, 4594395728093287059UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:pinky purple", [
    4605275011899013433UL, 4599040617120731923UL, 4604886466048808920UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:pink purple", [
    4605910814199348091UL, 4598969972420694739UL, 4605875491849329499UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:brownish red", [
    4603756150848213972UL, 4596797647894551323UL, 4594113149293138322UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dark rose", [
    4604568564898641591UL, 4598758038320583186UL, 4600241577021364055UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:mud", [
    4601795760422182109UL, 4600170932321326871UL, 4589750839065842194UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:brownish", [
    4603685506148176788UL, 4601371892221959003UL, 4599817708821140950UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:emerald green", [
    4575674882583433232UL, 4603226315597935090UL, 4593141784667627038UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:pale brown", [
    4604427275498567222UL, 4603296960297972274UL, 4601442536921996188UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dull blue", [
    4598828683020620370UL, 4601937049822256477UL, 4603685506148176788UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:burnt umber", [
    4603826795548251156UL, 4598546104220471633UL, 4588073027439959068UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:medium green", [
    4597221516094774429UL, 4604285986098492854UL, 4598758038320583186UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:clay", [
    4604603887248660183UL, 4601159958121847451UL, 4599323195920880660UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:light aqua", [
    4603120348547879314UL, 4607182418800017408UL, 4605910814199348091UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:light olive green", [
    4603968084948325525UL, 4604886466048808920UL, 4600170932321326871UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:brownish orange", [
    4605345656599050617UL, 4602078339222330846UL, 4594113149293138322UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dark aqua", [
    4581308797411398676UL, 4601089313421810266UL, 4601230602821884635UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:purplish pink", [
    4605451623649106394UL, 4600241577021364055UL, 4604321308448511446UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dark salmon", [
    4605239689548994841UL, 4600029642921252503UL, 4599535130020992213UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:greenish grey", [
    4603473572048065235UL, 4604321308448511446UL, 4603155670897897906UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:jade", [
    4593424363467775775UL, 4604074051998381301UL, 4601866405122219293UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:ugly green", [
    4602290273322442399UL, 4603508894398083827UL, 4577935512984623128UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dark beige", [
    4604250663748474262UL, 4603367604998009458UL, 4600594800521549977UL, 4607182418800017408UL,
  ])
}

///|
fn line_color_source_names_23() -> Unit raise {
  line_color_source_name("xkcd:emerald", [
    4571171282956062736UL, 4603826795548251156UL, 4598828683020620370UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:pale red", [
    4605840169499310907UL, 4599605774721029397UL, 4599111261820769107UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:light magenta", [
    4607005807049924447UL, 4600382866421438424UL, 4606899839999868671UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:sky", [
    4602767125047693392UL, 4605310334249032025UL, 4607076451749961632UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:light cyan", [
    4604250663748474262UL, 4607182418800017408UL, 4607076451749961632UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:yellow orange", [
    4607076451749961632UL, 4604391953148548630UL, 4571171282956062736UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:reddish purple", [
    4603296960297972274UL, 4585247239438471698UL, 4599393840620917844UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:reddish pink", [
    4607147096449998816UL, 4595384753893807638UL, 4599605774721029397UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:orchid", [
    4605239689548994841UL, 4601937049822256477UL, 4605098400148920473UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dirty yellow", [
    4605416301299087802UL, 4605133722498939065UL, 4585812397038769172UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:orange red", [
    4607111774099980224UL, 4598263525420322896UL, 4593141784667627038UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:deep red", [
    4603614861448139603UL, 4575674882583433232UL, 0UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:orange brown", [
    4604886466048808920UL, 4600736089921624345UL, 0UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:cobalt blue", [
    4577935512984623128UL, 4585812397038769172UL, 4604074051998381301UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:neon pink", [
    4607147096449998816UL, 4571171282956062736UL, 4603614861448139603UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:rose pink", [
    4606899839999868671UL, 4602943736797786353UL, 4603614861448139603UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:greyish purple", [
    4602979059147804945UL, 4601654471022107740UL, 4603296960297972274UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:raspberry", [
    4604391953148548630UL, 4571171282956062736UL, 4598828683020620370UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:aqua green", [
    4589750839065842194UL, 4606122748299459644UL, 4603367604998009458UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:salmon pink", [
    4607147096449998816UL, 4602360918022479583UL, 4602431562722516767UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:tangerine", [
    4607182418800017408UL, 4603402927348028051UL, 4584682081838174224UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:brownish green", [
    4601159958121847451UL, 4601442536921996188UL, 4585247239438471698UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:red brown", [
    4603085026197860721UL, 4595667332693956375UL, 4590881154266437142UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:greenish brown", [
    4601089313421810266UL, 4600524155821512792UL, 4589750839065842194UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:pumpkin", [
    4606122748299459644UL, 4602078339222330846UL, 4571171282956062736UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:pine green", [
    4585812397038769172UL, 4598758038320583186UL, 4593141784667627038UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:charcoal", [
    4596515069094402586UL, 4597080226694700060UL, 4596938937294625692UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:baby pink", [
    4607182418800017408UL, 4604639209598678775UL, 4605451623649106394UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:cornflower", [
    4601159958121847451UL, 4602219628622405214UL, 4606899839999868671UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:blue violet", [
    4600241577021364055UL, 4582439112611993624UL, 4606405327099608381UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:chocolate", [
    4597786673695071903UL, 4592576627067329564UL, 4575674882583433232UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:greyish green", [
    4602767125047693392UL, 4604038729648362709UL, 4602502207422553951UL, 4607182418800017408UL,
  ])
}

///|
fn line_color_source_names_24() -> Unit raise {
  line_color_source_name("xkcd:scarlet", [
    4604886466048808920UL, 4571171282956062736UL, 4591728890666883353UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:green yellow", [
    4605275011899013433UL, 4607182418800017408UL, 4594678306893435796UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dark olive", [
    4596938937294625692UL, 4597927963095146271UL, 4575674882583433232UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:sienna", [
    4604144696698418485UL, 4599747064121103766UL, 4593141784667627038UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:pastel purple", [
    4605310334249032025UL, 4603826795548251156UL, 4607182418800017408UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:terracotta", [
    4605310334249032025UL, 4600877379321698714UL, 4598263525420322896UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:aqua blue", [
    4575674882583433232UL, 4605804847149292315UL, 4606405327099608381UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:sage green", [
    4602979059147804945UL, 4604497920198604406UL, 4602148983922368030UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:blood red", [
    4603544216748102419UL, 0UL, 4575674882583433232UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:deep pink", [
    4605345656599050617UL, 4571171282956062736UL, 4600594800521549977UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:grass", [
    4600170932321326871UL, 4604250663748474262UL, 4595526043293882007UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:moss", [
    4602007694522293662UL, 4603579539098121011UL, 4599888353521178134UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:pastel blue", [
    4603897440248288340UL, 4604921788398827512UL, 4607147096449998816UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:bluish green", [
    4589185681465544720UL, 4604038729648362709UL, 4601866405122219293UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:green blue", [
    4582439112611993624UL, 4604533242548622999UL, 4603085026197860721UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dark tan", [
    4604356630798530038UL, 4602979059147804945UL, 4598899327720657555UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:greenish blue", [
    4586377554639066646UL, 4603085026197860721UL, 4602943736797786353UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:pale orange", [
    4607182418800017408UL, 4604074051998381301UL, 4599747064121103766UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:vomit", [
    4603897440248288340UL, 4603968084948325525UL, 4590598575466288405UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:forrest green", [
    4590598575466288405UL, 4598475459520434449UL, 4582439112611993624UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dark lavender", [
    4602873092097749169UL, 4600948024021735898UL, 4603544216748102419UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dark violet", [
    4596515069094402586UL, 4571171282956062736UL, 4598069252495220640UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:purple blue", [
    4600665445221587161UL, 4595526043293882007UL, 4606405327099608381UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dark cyan", [
    4585812397038769172UL, 4602979059147804945UL, 4603049703847842129UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:olive drab", [
    4601513181622033372UL, 4602007694522293662UL, 4596232490294253849UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:pinkish", [
    4605663557749217947UL, 4601159958121847451UL, 4602572852122591136UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:cobalt", [
    4593141784667627038UL, 4598758038320583186UL, 4603226315597935090UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:neon purple", [
    4604815821348771736UL, 4590033417865990931UL, 4607147096449998816UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:light turquoise", [
    4602572852122591136UL, 4606793872949812895UL, 4605380978949069210UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:apple green", [
    4602007694522293662UL, 4605416301299087802UL, 4594537017493361427UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dull green", [
    4601866405122219293UL, 4604038729648362709UL, 4600594800521549977UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:wine", [
    4602696480347656208UL, 4571171282956062736UL, 4598069252495220640UL, 4607182418800017408UL,
  ])
}

///|
fn line_color_source_names_25() -> Unit raise {
  line_color_source_name("xkcd:powder blue", [
    4604427275498567222UL, 4605557590699162170UL, 4607076451749961632UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:off white", [
    4607182418800017408UL, 4607182418800017408UL, 4606228715349515421UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:electric blue", [
    4582439112611993624UL, 4599464485320955029UL, 4607182418800017408UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dark turquoise", [
    4580178482210803728UL, 4600170932321326871UL, 4600029642921252503UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:blue purple", [
    4599817708821140950UL, 4594960885693584533UL, 4605451623649106394UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:azure", [
    4582439112611993624UL, 4603614861448139603UL, 4606758550599794302UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:bright red", [
    4607182418800017408UL, 0UL, 4587507869839661594UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:pinkish red", [
    4606687905899757118UL, 4586942712239364120UL, 4598546104220471633UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:cornflower blue", [
    4599393840620917844UL, 4601583826322070556UL, 4605769524799273723UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:light olive", [
    4604250663748474262UL, 4604921788398827512UL, 4601089313421810266UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:grape", [
    4601301247521921819UL, 4596515069094402586UL, 4600524155821512792UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:greyish blue", [
    4600312221721401240UL, 4602731802697674800UL, 4603720828498195380UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:purplish blue", [
    4600453511121475608UL, 4593141784667627038UL, 4606970484699905855UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:yellowish green", [
    4604391953148548630UL, 4605981458899385276UL, 4590881154266437142UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:greenish yellow", [
    4605416301299087802UL, 4607111774099980224UL, 4575674882583433232UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:medium blue", [
    4595384753893807638UL, 4601513181622033372UL, 4604780498998753143UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dusty rose", [
    4604957110748846104UL, 4601795760422182109UL, 4602290273322442399UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:light violet", [
    4605734202449255131UL, 4604533242548622999UL, 4607076451749961632UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:midnight blue", [
    4575674882583433232UL, 0UL, 4596656358494476955UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:bluish purple", [
    4601583826322070556UL, 4597504094894923166UL, 4606334682399571197UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:red orange", [
    4607111774099980224UL, 4597645384294997534UL, 4582439112611993624UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dark magenta", [
    4603473572048065235UL, 0UL, 4599747064121103766UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:greenish", [
    4598192880720285712UL, 4603932762598306932UL, 4601018668721773082UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:ocean blue", [
    4577935512984623128UL, 4601654471022107740UL, 4603685506148176788UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:coral", [
    4607076451749961632UL, 4600029642921252503UL, 4599323195920880660UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:cream", [
    4607182418800017408UL, 4607182418800017408UL, 4605027755448883288UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:reddish brown", [
    4602643496822628320UL, 4595243464493733270UL, 4585812397038769172UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:burnt sienna", [
    4604391953148548630UL, 4599181906520806292UL, 4588638185040256542UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:brick", [
    4603826795548251156UL, 4596797647894551323UL, 4594113149293138322UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:sage", [
    4602943736797786353UL, 4604321308448511446UL, 4601795760422182109UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:grey green", [
    4602148983922368030UL, 4603650183798158195UL, 4601795760422182109UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:white", [
    4607182418800017408UL, 4607182418800017408UL, 4607182418800017408UL, 4607182418800017408UL,
  ])
}

///|
fn line_color_source_names_26() -> Unit raise {
  line_color_source_name("xkcd:robin's egg blue", [
    4603544216748102419UL, 4606617261199719934UL, 4606970484699905855UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:moss green", [
    4600806734621661529UL, 4603085026197860721UL, 4597080226694700060UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:steel blue", [
    4600029642921252503UL, 4602502207422553951UL, 4603614861448139603UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:eggplant", [
    4597080226694700060UL, 4584682081838174224UL, 4596656358494476955UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:light yellow", [
    4607182418800017408UL, 4607147096449998816UL, 4602290273322442399UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:leaf green", [
    4600170932321326871UL, 4604144696698418485UL, 4580178482210803728UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:light grey", [
    4605804847149292315UL, 4605946136549366684UL, 4605734202449255131UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:puke", [
    4604003407298344117UL, 4604003407298344117UL, 4575674882583433232UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:pinkish purple", [
    4605734202449255131UL, 4598758038320583186UL, 4605769524799273723UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:sea blue", [
    4580178482210803728UL, 4601866405122219293UL, 4603438249698046643UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:pale purple", [
    4604639209598678775UL, 4603261637947953682UL, 4605663557749217947UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:slate blue", [
    4600100287621289687UL, 4602431562722516767UL, 4603579539098121011UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:blue grey", [
    4600453511121475608UL, 4602431562722516767UL, 4603190993247916498UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:hunter green", [
    4586377554639066646UL, 4598192880720285712UL, 4584682081838174224UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:fuchsia", [
    4606546616499682750UL, 4587507869839661594UL, 4605840169499310907UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:crimson", [
    4603120348547879314UL, 0UL, 4588638185040256542UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:pale yellow", [
    4607182418800017408UL, 4607182418800017408UL, 4602837769747730577UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:ochre", [
    4604921788398827512UL, 4603261637947953682UL, 4581308797411398676UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:mustard yellow", [
    4605592913049180762UL, 4604851143698790328UL, 4585812397038769172UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:light red", [
    4607182418800017408UL, 4598687393620546002UL, 4599040617120731923UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:cerulean", [
    4580178482210803728UL, 4602873092097749169UL, 4605557590699162170UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:pale pink", [
    4607182418800017408UL, 4605486945999124986UL, 4605946136549366684UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:deep blue", [
    4580178482210803728UL, 4575674882583433232UL, 4601795760422182109UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:rust", [
    4604109374348399893UL, 4597645384294997534UL, 4585247239438471698UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:light teal", [
    4603261637947953682UL, 4606228715349515421UL, 4604992433098864696UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:slate", [
    4599393840620917844UL, 4600806734621661529UL, 4601725115722144925UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:goldenrod", [
    4607005807049924447UL, 4605027755448883288UL, 4581308797411398676UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dark yellow", [
    4605698880099236539UL, 4604603887248660183UL, 4585812397038769172UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dark grey", [
    4596797647894551323UL, 4596938937294625692UL, 4596938937294625692UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:army green", [
    4598969972420694739UL, 4600241577021364055UL, 4590881154266437142UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:grey blue", [
    4601230602821884635UL, 4603085026197860721UL, 4603968084948325525UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:seafoam", [
    4602696480347656208UL, 4606970484699905855UL, 4604285986098492854UL, 4607182418800017408UL,
  ])
}

///|
fn line_color_source_names_27() -> Unit raise {
  line_color_source_name("xkcd:puce", [
    4604003407298344117UL, 4602572852122591136UL, 4599464485320955029UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:spring green", [
    4604144696698418485UL, 4606970484699905855UL, 4601654471022107740UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dark orange", [
    4605169044848957657UL, 4599393840620917844UL, 4575674882583433232UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:sand", [
    4606158070649478236UL, 4605310334249032025UL, 4602007694522293662UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:pastel green", [
    4604391953148548630UL, 4607182418800017408UL, 4603720828498195380UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:mint", [
    4603791473198232564UL, 4607147096449998816UL, 4604391953148548630UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:light orange", [
    4607111774099980224UL, 4604180019048437077UL, 4598758038320583186UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:bright pink", [
    4607147096449998816UL, 4571171282956062736UL, 4604427275498567222UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:chartreuse", [
    4604992433098864696UL, 4606935162349887263UL, 4585812397038769172UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:deep purple", [
    4596797647894551323UL, 4571171282956062736UL, 4598069252495220640UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dark brown", [
    4596515069094402586UL, 4592576627067329564UL, 4575674882583433232UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:taupe", [
    4604709854298715959UL, 4603897440248288340UL, 4602731802697674800UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:pea green", [
    4603190993247916498UL, 4604215341398455669UL, 4589750839065842194UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:puke green", [
    4603614861448139603UL, 4604321308448511446UL, 4583569427812588572UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:kelly green", [
    4575674882583433232UL, 4604215341398455669UL, 4595667332693956375UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:seafoam green", [
    4602290273322442399UL, 4606970484699905855UL, 4604215341398455669UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:blue green", [
    4590033417865990931UL, 4602572852122591136UL, 4601371892221959003UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:khaki", [
    4604180019048437077UL, 4604038729648362709UL, 4600594800521549977UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:burgundy", [
    4600524155821512792UL, 0UL, 4594113149293138322UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dark teal", [
    4571171282956062736UL, 4599111261820769107UL, 4599181906520806292UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:brick red", [
    4603226315597935090UL, 4590315996666139668UL, 4575674882583433232UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:royal purple", [
    4598969972420694739UL, 0UL, 4601442536921996188UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:plum", [
    4599888353521178134UL, 4588638185040256542UL, 4598263525420322896UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:mint green", [
    4603226315597935090UL, 4607182418800017408UL, 4603791473198232564UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:gold", [
    4605910814199348091UL, 4604533242548622999UL, 4586942712239364120UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:baby blue", [
    4603897440248288340UL, 4605486945999124986UL, 4607147096449998816UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:yellow green", [
    4604957110748846104UL, 4607041129399943039UL, 4595526043293882007UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:bright purple", [
    4604886466048808920UL, 4577935512984623128UL, 4607111774099980224UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dark red", [
    4602837769747730577UL, 0UL, 0UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:pale blue", [
    4605522268349143578UL, 4607147096449998816UL, 4607147096449998816UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:grass green", [
    4598069252495220640UL, 4603650183798158195UL, 4586377554639066646UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:navy", [
    4571171282956062736UL, 4590598575466288405UL, 4597927963095146271UL, 4607182418800017408UL,
  ])
}

///|
fn line_color_source_names_28() -> Unit raise {
  line_color_source_name("xkcd:aquamarine", [
    4580178482210803728UL, 4605804847149292315UL, 4604462597848585814UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:burnt orange", [
    4604957110748846104UL, 4599181906520806292UL, 4571171282956062736UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:neon green", [
    4586942712239364120UL, 4607182418800017408UL, 4586942712239364120UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:bright blue", [
    4571171282956062736UL, 4600806734621661529UL, 4607076451749961632UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:rose", [
    4605486945999124986UL, 4600594800521549977UL, 4601937049822256477UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:light pink", [
    4607182418800017408UL, 4605557590699162170UL, 4606052103599422460UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:mustard", [
    4605451623649106394UL, 4604497920198604406UL, 4571171282956062736UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:indigo", [
    4597080226694700060UL, 4575674882583433232UL, 4602767125047693392UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:lime", [
    4604180019048437077UL, 4607182418800017408UL, 4596232490294253849UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:sea green", [
    4599535130020992213UL, 4607076451749961632UL, 4603862117898269748UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:periwinkle", [
    4603190993247916498UL, 4602767125047693392UL, 4607147096449998816UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dark pink", [
    4605345656599050617UL, 4598263525420322896UL, 4601230602821884635UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:olive green", [
    4600948024021735898UL, 4602290273322442399UL, 4580178482210803728UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:peach", [
    4607182418800017408UL, 4604391953148548630UL, 4602431562722516767UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:pale green", [
    4605204367198976249UL, 4607111774099980224UL, 4604568564898641591UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:light brown", [
    4604285986098492854UL, 4602731802697674800UL, 4599323195920880660UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:hot pink", [
    4607182418800017408UL, 4575674882583433232UL, 4603155670897897906UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:black", [0UL, 0UL, 0UL, 4607182418800017408UL])
  line_color_source_name("xkcd:lilac", [
    4605451623649106394UL, 4603897440248288340UL, 4607111774099980224UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:navy blue", [
    0UL, 4589468260265693457UL, 4598616748920508818UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:royal blue", [
    4581308797411398676UL, 4580178482210803728UL, 4604180019048437077UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:beige", [
    4606299360049552605UL, 4605875491849329499UL, 4604038729648362709UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:salmon", [
    4607182418800017408UL, 4602219628622405214UL, 4601301247521921819UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:olive", [
    4601442536921996188UL, 4601937049822256477UL, 4588073027439959068UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:maroon", [
    4600806734621661529UL, 0UL, 4593830570492989585UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:bright green", [
    4571171282956062736UL, 4607182418800017408UL, 4583569427812588572UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dark purple", [
    4596656358494476955UL, 4582439112611993624UL, 4597927963095146271UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:mauve", [
    4604321308448511446UL, 4601654471022107740UL, 4602731802697674800UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:forest green", [
    4582439112611993624UL, 4598687393620546002UL, 4586942712239364120UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:aqua", [
    4590033417865990931UL, 4606440649449626973UL, 4605275011899013433UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:cyan", [
    0UL, 4607182418800017408UL, 4607182418800017408UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:tan", [
    4605557590699162170UL, 4604462597848585814UL, 4601513181622033372UL, 4607182418800017408UL,
  ])
}

///|
fn line_color_source_names_29() -> Unit raise {
  line_color_source_name("xkcd:dark blue", [
    0UL, 4577935512984623128UL, 4600100287621289687UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:lavender", [
    4605204367198976249UL, 4603791473198232564UL, 4606617261199719934UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:turquoise", [
    4582439112611993624UL, 4605027755448883288UL, 4604250663748474262UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dark green", [
    4577935512984623128UL, 4596656358494476955UL, 0UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:violet", [
    4603614861448139603UL, 4588073027439959068UL, 4606440649449626973UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:light purple", [
    4604921788398827512UL, 4602078339222330846UL, 4606864517649850079UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:lime green", [
    4603014381497823537UL, 4607147096449998816UL, 4581308797411398676UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:grey", [
    4603332282647990866UL, 4603438249698046643UL, 4603296960297972274UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:sky blue", [
    4601937049822256477UL, 4604780498998753143UL, 4607111774099980224UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:yellow", [
    4607182418800017408UL, 4607182418800017408UL, 4590315996666139668UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:magenta", [
    4605027755448883288UL, 0UL, 4602148983922368030UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:light green", [
    4603473572048065235UL, 4606970484699905855UL, 4602360918022479583UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:orange", [
    4606970484699905855UL, 4601795760422182109UL, 4582439112611993624UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:teal", [
    4575674882583433232UL, 4603367604998009458UL, 4602908414447767761UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:light blue", [
    4603438249698046643UL, 4605522268349143578UL, 4607076451749961632UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:red", [
    4606264037699534013UL, 0UL, 0UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:brown", [
    4600806734621661529UL, 4596938937294625692UL, 0UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:pink", [
    4607182418800017408UL, 4602731802697674800UL, 4604957110748846104UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:blue", [
    4577935512984623128UL, 4598404814820397265UL, 4606052103599422460UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:green", [
    4590598575466288405UL, 4604391953148548630UL, 4592011469467032090UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:purple", [
    4602572852122591136UL, 4593141784667627038UL, 4603685506148176788UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:gray teal", [
    4600312221721401240UL, 4603650183798158195UL, 4603049703847842129UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:purpley gray", [
    4603402927348028051UL, 4602572852122591136UL, 4603402927348028051UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:light gray green", [
    4604639209598678775UL, 4606122748299459644UL, 4603862117898269748UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:reddish gray", [
    4603579539098121011UL, 4601937049822256477UL, 4601583826322070556UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:battleship gray", [
    4601230602821884635UL, 4602431562722516767UL, 4602873092097749169UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:charcoal gray", [
    4597645384294997534UL, 4598263525420322896UL, 4598334170120360081UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:grayish teal", [
    4601654471022107740UL, 4603791473198232564UL, 4603296960297972274UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:gray/green", [
    4602908414447767761UL, 4603862117898269748UL, 4602502207422553951UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:cool gray", [
    4603438249698046643UL, 4603932762598306932UL, 4604038729648362709UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dark blue gray", [
    4593424363467775775UL, 4597504094894923166UL, 4599111261820769107UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:bluey gray", [
    4603014381497823537UL, 4603826795548251156UL, 4604391953148548630UL, 4607182418800017408UL,
  ])
}

///|
fn line_color_source_names_30() -> Unit raise {
  line_color_source_name("xkcd:greeny gray", [
    4602572852122591136UL, 4603826795548251156UL, 4602290273322442399UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:bluegray", [
    4602873092097749169UL, 4603932762598306932UL, 4604462597848585814UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:light blue gray", [
    4604639209598678775UL, 4605275011899013433UL, 4606158070649478236UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:gray/blue", [
    4600736089921624345UL, 4602502207422553951UL, 4603190993247916498UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:brown gray", [
    4603155670897897906UL, 4602837769747730577UL, 4601018668721773082UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:blue/gray", [
    4601937049822256477UL, 4603155670897897906UL, 4603932762598306932UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:grayblue", [
    4602078339222330846UL, 4603862117898269748UL, 4604568564898641591UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dark gray blue", [
    4594960885693584533UL, 4598616748920508818UL, 4600100287621289687UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:grayish", [
    4604109374348399893UL, 4603968084948325525UL, 4603438249698046643UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:light gray blue", [
    4603720828498195380UL, 4604815821348771736UL, 4605663557749217947UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:pale gray", [
    4607111774099980224UL, 4607111774099980224UL, 4607147096449998816UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:warm gray", [
    4603508894398083827UL, 4603049703847842129UL, 4602837769747730577UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:gray pink", [
    4605063077798901880UL, 4603261637947953682UL, 4603650183798158195UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:medium gray", [
    4602502207422553951UL, 4602643496822628320UL, 4602431562722516767UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:pinkish gray", [
    4605239689548994841UL, 4604250663748474262UL, 4604144696698418485UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:brownish gray", [
    4602908414447767761UL, 4602078339222330846UL, 4600382866421438424UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:purplish gray", [
    4602290273322442399UL, 4601018668721773082UL, 4602643496822628320UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:grayish pink", [
    4605239689548994841UL, 4603155670897897906UL, 4603402927348028051UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:grayish brown", [
    4602290273322442399UL, 4601159958121847451UL, 4599252551220843476UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:steel gray", [
    4601513181622033372UL, 4602767125047693392UL, 4603049703847842129UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:purple gray", [
    4602908414447767761UL, 4601513181622033372UL, 4602873092097749169UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:gray brown", [
    4602643496822628320UL, 4601583826322070556UL, 4599535130020992213UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:green gray", [
    4602078339222330846UL, 4603332282647990866UL, 4601513181622033372UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:bluish gray", [
    4601866405122219293UL, 4603085026197860721UL, 4603508894398083827UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:slate gray", [
    4599958998221215318UL, 4600806734621661529UL, 4601371892221959003UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:gray purple", [
    4602767125047693392UL, 4601371892221959003UL, 4603120348547879314UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:greenish gray", [
    4603473572048065235UL, 4604321308448511446UL, 4603155670897897906UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:grayish purple", [
    4602979059147804945UL, 4601654471022107740UL, 4603296960297972274UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:grayish green", [
    4602767125047693392UL, 4604038729648362709UL, 4602502207422553951UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:grayish blue", [
    4600312221721401240UL, 4602731802697674800UL, 4603720828498195380UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:gray green", [
    4602148983922368030UL, 4603650183798158195UL, 4601795760422182109UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:light gray", [
    4605804847149292315UL, 4605946136549366684UL, 4605734202449255131UL, 4607182418800017408UL,
  ])
}

///|
fn line_color_source_names_31() -> Unit raise {
  line_color_source_name("xkcd:blue gray", [
    4600453511121475608UL, 4602431562722516767UL, 4603190993247916498UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:dark gray", [
    4596797647894551323UL, 4596938937294625692UL, 4596938937294625692UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:gray blue", [
    4601230602821884635UL, 4603085026197860721UL, 4603968084948325525UL, 4607182418800017408UL,
  ])
  line_color_source_name("xkcd:gray", [
    4603332282647990866UL, 4603438249698046643UL, 4603296960297972274UL, 4607182418800017408UL,
  ])
  line_color_source_name("aliceblue", [
    4606652583549738526UL, 4606935162349887263UL, 4607182418800017408UL, 4607182418800017408UL,
  ])
  line_color_source_name("antiquewhite", [
    4607005807049924447UL, 4606475971799645565UL, 4605769524799273723UL, 4607182418800017408UL,
  ])
  line_color_source_name("aqua", [
    0UL, 4607182418800017408UL, 4607182418800017408UL, 4607182418800017408UL,
  ])
  line_color_source_name("aquamarine", [
    4602643496822628320UL, 4607182418800017408UL, 4605663557749217947UL, 4607182418800017408UL,
  ])
  line_color_source_name("azure", [
    4606652583549738526UL, 4607182418800017408UL, 4607182418800017408UL, 4607182418800017408UL,
  ])
  line_color_source_name("beige", [
    4606829195299831487UL, 4606829195299831487UL, 4605946136549366684UL, 4607182418800017408UL,
  ])
  line_color_source_name("bisque", [
    4607182418800017408UL, 4606228715349515421UL, 4605098400148920473UL, 4607182418800017408UL,
  ])
  line_color_source_name("black", [0UL, 0UL, 0UL, 4607182418800017408UL])
  line_color_source_name("blanchedalmond", [
    4607182418800017408UL, 4606475971799645565UL, 4605416301299087802UL, 4607182418800017408UL,
  ])
  line_color_source_name("blue", [
    0UL, 0UL, 4607182418800017408UL, 4607182418800017408UL,
  ])
  line_color_source_name("blueviolet", [
    4603049703847842129UL, 4595243464493733270UL, 4606158070649478236UL, 4607182418800017408UL,
  ])
  line_color_source_name("brown", [
    4604003407298344117UL, 4595102175093658901UL, 4595102175093658901UL, 4607182418800017408UL,
  ])
  line_color_source_name("burlywood", [
    4606016781249403868UL, 4604674531948697367UL, 4602943736797786353UL, 4607182418800017408UL,
  ])
  line_color_source_name("cadetblue", [
    4600382866421438424UL, 4603756150848213972UL, 4603826795548251156UL, 4607182418800017408UL,
  ])
  line_color_source_name("chartreuse", [
    4602643496822628320UL, 4607182418800017408UL, 0UL, 4607182418800017408UL,
  ])
  line_color_source_name("chocolate", [
    4605592913049180762UL, 4601089313421810266UL, 4593141784667627038UL, 4607182418800017408UL,
  ])
  line_color_source_name("coral", [
    4607182418800017408UL, 4602643496822628320UL, 4599323195920880660UL, 4607182418800017408UL,
  ])
  line_color_source_name("cornflowerblue", [
    4600736089921624345UL, 4603438249698046643UL, 4606546616499682750UL, 4607182418800017408UL,
  ])
  line_color_source_name("cornsilk", [
    4607182418800017408UL, 4606935162349887263UL, 4605946136549366684UL, 4607182418800017408UL,
  ])
  line_color_source_name("crimson", [
    4605946136549366684UL, 4590315996666139668UL, 4597645384294997534UL, 4607182418800017408UL,
  ])
  line_color_source_name("cyan", [
    0UL, 4607182418800017408UL, 4607182418800017408UL, 4607182418800017408UL,
  ])
  line_color_source_name("darkblue", [
    0UL, 0UL, 4603085026197860721UL, 4607182418800017408UL,
  ])
  line_color_source_name("darkcyan", [
    0UL, 4603085026197860721UL, 4603085026197860721UL, 4607182418800017408UL,
  ])
  line_color_source_name("darkgoldenrod", [
    4604674531948697367UL, 4602908414447767761UL, 4586377554639066646UL, 4607182418800017408UL,
  ])
  line_color_source_name("darkgray", [
    4604144696698418485UL, 4604144696698418485UL, 4604144696698418485UL, 4607182418800017408UL,
  ])
  line_color_source_name("darkgreen", [
    0UL, 4600736089921624345UL, 0UL, 4607182418800017408UL,
  ])
  line_color_source_name("darkgrey", [
    4604144696698418485UL, 4604144696698418485UL, 4604144696698418485UL, 4607182418800017408UL,
  ])
  line_color_source_name("darkkhaki", [
    4604851143698790328UL, 4604639209598678775UL, 4601230602821884635UL, 4607182418800017408UL,
  ])
}

///|
fn line_color_source_names_32() -> Unit raise {
  line_color_source_name("darkmagenta", [
    4603085026197860721UL, 0UL, 4603085026197860721UL, 4607182418800017408UL,
  ])
  line_color_source_name("darkolivegreen", [
    4599676419421066581UL, 4601230602821884635UL, 4595808622094030744UL, 4607182418800017408UL,
  ])
  line_color_source_name("darkorange", [
    4607182418800017408UL, 4603120348547879314UL, 0UL, 4607182418800017408UL,
  ])
  line_color_source_name("darkorchid", [
    4603579539098121011UL, 4596232490294253849UL, 4605380978949069210UL, 4607182418800017408UL,
  ])
  line_color_source_name("darkred", [
    4603085026197860721UL, 0UL, 0UL, 4607182418800017408UL,
  ])
  line_color_source_name("darksalmon", [
    4606405327099608381UL, 4603473572048065235UL, 4602290273322442399UL, 4607182418800017408UL,
  ])
  line_color_source_name("darkseagreen", [
    4603226315597935090UL, 4604815821348771736UL, 4603226315597935090UL, 4607182418800017408UL,
  ])
  line_color_source_name("darkslateblue", [
    4598758038320583186UL, 4597786673695071903UL, 4603085026197860721UL, 4607182418800017408UL,
  ])
  line_color_source_name("darkslategray", [
    4595808622094030744UL, 4599252551220843476UL, 4599252551220843476UL, 4607182418800017408UL,
  ])
  line_color_source_name("darkslategrey", [
    4595808622094030744UL, 4599252551220843476UL, 4599252551220843476UL, 4607182418800017408UL,
  ])
  line_color_source_name("darkturquoise", [
    0UL, 4605451623649106394UL, 4605557590699162170UL, 4607182418800017408UL,
  ])
  line_color_source_name("darkviolet", [
    4603402927348028051UL, 0UL, 4605628235399199354UL, 4607182418800017408UL,
  ])
  line_color_source_name("deeppink", [
    4607182418800017408UL, 4590315996666139668UL, 4603367604998009458UL, 4607182418800017408UL,
  ])
  line_color_source_name("deepskyblue", [
    0UL, 4604921788398827512UL, 4607182418800017408UL, 4607182418800017408UL,
  ])
  line_color_source_name("dimgray", [
    4601089313421810266UL, 4601089313421810266UL, 4601089313421810266UL, 4607182418800017408UL,
  ])
  line_color_source_name("dimgrey", [
    4601089313421810266UL, 4601089313421810266UL, 4601089313421810266UL, 4607182418800017408UL,
  ])
  line_color_source_name("dodgerblue", [
    4593141784667627038UL, 4603261637947953682UL, 4607182418800017408UL, 4607182418800017408UL,
  ])
  line_color_source_name("firebrick", [
    4604462597848585814UL, 4593971859893063953UL, 4593971859893063953UL, 4607182418800017408UL,
  ])
  line_color_source_name("floralwhite", [
    4607182418800017408UL, 4607005807049924447UL, 4606652583549738526UL, 4607182418800017408UL,
  ])
  line_color_source_name("forestgreen", [
    4593971859893063953UL, 4603085026197860721UL, 4593971859893063953UL, 4607182418800017408UL,
  ])
  line_color_source_name("fuchsia", [
    4607182418800017408UL, 0UL, 4607182418800017408UL, 4607182418800017408UL,
  ])
  line_color_source_name("gainsboro", [
    4605946136549366684UL, 4605946136549366684UL, 4605946136549366684UL, 4607182418800017408UL,
  ])
  line_color_source_name("ghostwhite", [
    4606935162349887263UL, 4606935162349887263UL, 4607182418800017408UL, 4607182418800017408UL,
  ])
  line_color_source_name("gold", [
    4607182418800017408UL, 4605769524799273723UL, 0UL, 4607182418800017408UL,
  ])
  line_color_source_name("goldenrod", [
    4605875491849329499UL, 4604003407298344117UL, 4593689281092915216UL, 4607182418800017408UL,
  ])
  line_color_source_name("gray", [
    4602696480347656208UL, 4602696480347656208UL, 4602696480347656208UL, 4607182418800017408UL,
  ])
  line_color_source_name("green", [
    0UL, 4602696480347656208UL, 0UL, 4607182418800017408UL,
  ])
  line_color_source_name("greenyellow", [
    4604285986098492854UL, 4607182418800017408UL, 4595808622094030744UL, 4607182418800017408UL,
  ])
  line_color_source_name("grey", [
    4602696480347656208UL, 4602696480347656208UL, 4602696480347656208UL, 4607182418800017408UL,
  ])
  line_color_source_name("honeydew", [
    4606652583549738526UL, 4607182418800017408UL, 4606652583549738526UL, 4607182418800017408UL,
  ])
  line_color_source_name("hotpink", [
    4607182418800017408UL, 4601089313421810266UL, 4604533242548622999UL, 4607182418800017408UL,
  ])
  line_color_source_name("indianred", [
    4605416301299087802UL, 4600170932321326871UL, 4600170932321326871UL, 4607182418800017408UL,
  ])
}

///|
fn line_color_source_names_33() -> Unit raise {
  line_color_source_name("indigo", [
    4598969972420694739UL, 0UL, 4602767125047693392UL, 4607182418800017408UL,
  ])
  line_color_source_name("ivory", [
    4607182418800017408UL, 4607182418800017408UL, 4606652583549738526UL, 4607182418800017408UL,
  ])
  line_color_source_name("khaki", [
    4606652583549738526UL, 4606299360049552605UL, 4603120348547879314UL, 4607182418800017408UL,
  ])
  line_color_source_name("lavender", [
    4606299360049552605UL, 4606299360049552605UL, 4607005807049924447UL, 4607182418800017408UL,
  ])
  line_color_source_name("lavenderblush", [
    4607182418800017408UL, 4606652583549738526UL, 4606829195299831487UL, 4607182418800017408UL,
  ])
  line_color_source_name("lawngreen", [
    4602431562722516767UL, 4607076451749961632UL, 0UL, 4607182418800017408UL,
  ])
  line_color_source_name("lemonchiffon", [
    4607182418800017408UL, 4607005807049924447UL, 4605416301299087802UL, 4607182418800017408UL,
  ])
  line_color_source_name("lightblue", [
    4604285986098492854UL, 4605804847149292315UL, 4606299360049552605UL, 4607182418800017408UL,
  ])
  line_color_source_name("lightcoral", [
    4606652583549738526UL, 4602696480347656208UL, 4602696480347656208UL, 4607182418800017408UL,
  ])
  line_color_source_name("lightcyan", [
    4606087425949441052UL, 4607182418800017408UL, 4607182418800017408UL, 4607182418800017408UL,
  ])
  line_color_source_name("lightgoldenrodyellow", [
    4607005807049924447UL, 4607005807049924447UL, 4605592913049180762UL, 4607182418800017408UL,
  ])
  line_color_source_name("lightgray", [
    4605628235399199354UL, 4605628235399199354UL, 4605628235399199354UL, 4607182418800017408UL,
  ])
  line_color_source_name("lightgreen", [
    4603261637947953682UL, 4606581938849701342UL, 4603261637947953682UL, 4607182418800017408UL,
  ])
  line_color_source_name("lightgrey", [
    4605628235399199354UL, 4605628235399199354UL, 4605628235399199354UL, 4607182418800017408UL,
  ])
  line_color_source_name("lightpink", [
    4607182418800017408UL, 4604603887248660183UL, 4604992433098864696UL, 4607182418800017408UL,
  ])
  line_color_source_name("lightsalmon", [
    4607182418800017408UL, 4603826795548251156UL, 4602290273322442399UL, 4607182418800017408UL,
  ])
  line_color_source_name("lightseagreen", [
    4593689281092915216UL, 4604462597848585814UL, 4604180019048437077UL, 4607182418800017408UL,
  ])
  line_color_source_name("lightskyblue", [
    4602943736797786353UL, 4605451623649106394UL, 4607005807049924447UL, 4607182418800017408UL,
  ])
  line_color_source_name("lightslategray", [
    4602078339222330846UL, 4602979059147804945UL, 4603579539098121011UL, 4607182418800017408UL,
  ])
  line_color_source_name("lightslategrey", [
    4602078339222330846UL, 4602979059147804945UL, 4603579539098121011UL, 4607182418800017408UL,
  ])
  line_color_source_name("lightsteelblue", [
    4604391953148548630UL, 4605098400148920473UL, 4606016781249403868UL, 4607182418800017408UL,
  ])
  line_color_source_name("lightyellow", [
    4607182418800017408UL, 4607182418800017408UL, 4606087425949441052UL, 4607182418800017408UL,
  ])
  line_color_source_name("lime", [
    0UL, 4607182418800017408UL, 0UL, 4607182418800017408UL,
  ])
  line_color_source_name("limegreen", [
    4596232490294253849UL, 4605416301299087802UL, 4596232490294253849UL, 4607182418800017408UL,
  ])
  line_color_source_name("linen", [
    4607005807049924447UL, 4606652583549738526UL, 4606299360049552605UL, 4607182418800017408UL,
  ])
  line_color_source_name("magenta", [
    4607182418800017408UL, 0UL, 4607182418800017408UL, 4607182418800017408UL,
  ])
  line_color_source_name("maroon", [
    4602696480347656208UL, 0UL, 0UL, 4607182418800017408UL,
  ])
  line_color_source_name("mediumaquamarine", [
    4600877379321698714UL, 4605416301299087802UL, 4604180019048437077UL, 4607182418800017408UL,
  ])
  line_color_source_name("mediumblue", [
    0UL, 0UL, 4605416301299087802UL, 4607182418800017408UL,
  ])
  line_color_source_name("mediumorchid", [
    4604745176648734551UL, 4599676419421066581UL, 4605628235399199354UL, 4607182418800017408UL,
  ])
  line_color_source_name("mediumpurple", [
    4603367604998009458UL, 4601583826322070556UL, 4605910814199348091UL, 4607182418800017408UL,
  ])
  line_color_source_name("mediumseagreen", [
    4597645384294997534UL, 4604497920198604406UL, 4601654471022107740UL, 4607182418800017408UL,
  ])
}

///|
fn line_color_source_names_34() -> Unit raise {
  line_color_source_name("mediumslateblue", [
    4602360918022479583UL, 4601018668721773082UL, 4606581938849701342UL, 4607182418800017408UL,
  ])
  line_color_source_name("mediumspringgreen", [
    0UL, 4607005807049924447UL, 4603614861448139603UL, 4607182418800017408UL,
  ])
  line_color_source_name("mediumturquoise", [
    4598758038320583186UL, 4605557590699162170UL, 4605380978949069210UL, 4607182418800017408UL,
  ])
  line_color_source_name("mediumvioletred", [
    4605204367198976249UL, 4590598575466288405UL, 4602873092097749169UL, 4607182418800017408UL,
  ])
  line_color_source_name("midnightblue", [
    4591728890666883353UL, 4591728890666883353UL, 4601583826322070556UL, 4607182418800017408UL,
  ])
  line_color_source_name("mintcream", [
    4606829195299831487UL, 4607182418800017408UL, 4607005807049924447UL, 4607182418800017408UL,
  ])
  line_color_source_name("mistyrose", [
    4607182418800017408UL, 4606228715349515421UL, 4606122748299459644UL, 4607182418800017408UL,
  ])
  line_color_source_name("moccasin", [
    4607182418800017408UL, 4606228715349515421UL, 4604568564898641591UL, 4607182418800017408UL,
  ])
  line_color_source_name("navajowhite", [
    4607182418800017408UL, 4606016781249403868UL, 4604285986098492854UL, 4607182418800017408UL,
  ])
  line_color_source_name("navy", [
    0UL, 0UL, 4602696480347656208UL, 4607182418800017408UL,
  ])
  line_color_source_name("oldlace", [
    4607111774099980224UL, 4606829195299831487UL, 4606299360049552605UL, 4607182418800017408UL,
  ])
  line_color_source_name("olive", [
    4602696480347656208UL, 4602696480347656208UL, 0UL, 4607182418800017408UL,
  ])
  line_color_source_name("olivedrab", [
    4601230602821884635UL, 4603190993247916498UL, 4594113149293138322UL, 4607182418800017408UL,
  ])
  line_color_source_name("orange", [
    4607182418800017408UL, 4604003407298344117UL, 0UL, 4607182418800017408UL,
  ])
  line_color_source_name("orangered", [
    4607182418800017408UL, 4598546104220471633UL, 0UL, 4607182418800017408UL,
  ])
  line_color_source_name("orchid", [
    4605875491849329499UL, 4601583826322070556UL, 4605734202449255131UL, 4607182418800017408UL,
  ])
  line_color_source_name("palegoldenrod", [
    4606581938849701342UL, 4606370004749589789UL, 4604180019048437077UL, 4607182418800017408UL,
  ])
  line_color_source_name("palegreen", [
    4603544216748102419UL, 4607041129399943039UL, 4603544216748102419UL, 4607182418800017408UL,
  ])
  line_color_source_name("paleturquoise", [
    4604356630798530038UL, 4606581938849701342UL, 4606581938849701342UL, 4607182418800017408UL,
  ])
  line_color_source_name("palevioletred", [
    4605910814199348091UL, 4601583826322070556UL, 4603367604998009458UL, 4607182418800017408UL,
  ])
  line_color_source_name("papayawhip", [
    4607182418800017408UL, 4606617261199719934UL, 4605698880099236539UL, 4607182418800017408UL,
  ])
  line_color_source_name("peachpuff", [
    4607182418800017408UL, 4605875491849329499UL, 4604709854298715959UL, 4607182418800017408UL,
  ])
  line_color_source_name("peru", [
    4605416301299087802UL, 4602873092097749169UL, 4598069252495220640UL, 4607182418800017408UL,
  ])
  line_color_source_name("pink", [
    4607182418800017408UL, 4604957110748846104UL, 4605345656599050617UL, 4607182418800017408UL,
  ])
  line_color_source_name("plum", [
    4605981458899385276UL, 4603826795548251156UL, 4605981458899385276UL, 4607182418800017408UL,
  ])
  line_color_source_name("powderblue", [
    4604391953148548630UL, 4606087425949441052UL, 4606299360049552605UL, 4607182418800017408UL,
  ])
  line_color_source_name("purple", [
    4602696480347656208UL, 0UL, 4602696480347656208UL, 4607182418800017408UL,
  ])
  line_color_source_name("rebeccapurple", [
    4600877379321698714UL, 4596373779694328218UL, 4603579539098121011UL, 4607182418800017408UL,
  ])
  line_color_source_name("red", [
    4607182418800017408UL, 0UL, 0UL, 4607182418800017408UL,
  ])
  line_color_source_name("rosybrown", [
    4604815821348771736UL, 4603226315597935090UL, 4603226315597935090UL, 4607182418800017408UL,
  ])
  line_color_source_name("royalblue", [
    4598263525420322896UL, 4601089313421810266UL, 4606122748299459644UL, 4607182418800017408UL,
  ])
  line_color_source_name("saddlebrown", [
    4603085026197860721UL, 4598546104220471633UL, 4590033417865990931UL, 4607182418800017408UL,
  ])
}

///|
fn line_color_source_names_35() -> Unit raise {
  line_color_source_name("salmon", [
    4607005807049924447UL, 4602696480347656208UL, 4601725115722144925UL, 4607182418800017408UL,
  ])
  line_color_source_name("sandybrown", [
    4606793872949812895UL, 4603968084948325525UL, 4600453511121475608UL, 4607182418800017408UL,
  ])
  line_color_source_name("seagreen", [
    4595667332693956375UL, 4603085026197860721UL, 4599817708821140950UL, 4607182418800017408UL,
  ])
  line_color_source_name("seashell", [
    4607182418800017408UL, 4606829195299831487UL, 4606581938849701342UL, 4607182418800017408UL,
  ])
  line_color_source_name("sienna", [
    4603826795548251156UL, 4599464485320955029UL, 4595526043293882007UL, 4607182418800017408UL,
  ])
  line_color_source_name("silver", [
    4604957110748846104UL, 4604957110748846104UL, 4604957110748846104UL, 4607182418800017408UL,
  ])
  line_color_source_name("skyblue", [
    4602943736797786353UL, 4605451623649106394UL, 4606475971799645565UL, 4607182418800017408UL,
  ])
  line_color_source_name("slateblue", [
    4601159958121847451UL, 4600029642921252503UL, 4605416301299087802UL, 4607182418800017408UL,
  ])
  line_color_source_name("slategray", [
    4601583826322070556UL, 4602696480347656208UL, 4603261637947953682UL, 4607182418800017408UL,
  ])
  line_color_source_name("slategrey", [
    4601583826322070556UL, 4602696480347656208UL, 4603261637947953682UL, 4607182418800017408UL,
  ])
  line_color_source_name("snow", [
    4607182418800017408UL, 4607005807049924447UL, 4607005807049924447UL, 4607182418800017408UL,
  ])
  line_color_source_name("springgreen", [
    0UL, 4607182418800017408UL, 4602643496822628320UL, 4607182418800017408UL,
  ])
  line_color_source_name("steelblue", [
    4598616748920508818UL, 4602767125047693392UL, 4604533242548622999UL, 4607182418800017408UL,
  ])
  line_color_source_name("tan", [
    4605592913049180762UL, 4604533242548622999UL, 4603120348547879314UL, 4607182418800017408UL,
  ])
  line_color_source_name("teal", [
    0UL, 4602696480347656208UL, 4602696480347656208UL, 4607182418800017408UL,
  ])
  line_color_source_name("thistle", [
    4605804847149292315UL, 4604921788398827512UL, 4605804847149292315UL, 4607182418800017408UL,
  ])
  line_color_source_name("tomato", [
    4607182418800017408UL, 4600665445221587161UL, 4598687393620546002UL, 4607182418800017408UL,
  ])
  line_color_source_name("turquoise", [
    4598192880720285712UL, 4606087425949441052UL, 4605522268349143578UL, 4607182418800017408UL,
  ])
  line_color_source_name("violet", [
    4606581938849701342UL, 4602767125047693392UL, 4606581938849701342UL, 4607182418800017408UL,
  ])
  line_color_source_name("wheat", [
    4606829195299831487UL, 4606016781249403868UL, 4604497920198604406UL, 4607182418800017408UL,
  ])
  line_color_source_name("white", [
    4607182418800017408UL, 4607182418800017408UL, 4607182418800017408UL, 4607182418800017408UL,
  ])
  line_color_source_name("whitesmoke", [
    4606829195299831487UL, 4606829195299831487UL, 4606829195299831487UL, 4607182418800017408UL,
  ])
  line_color_source_name("yellow", [
    4607182418800017408UL, 4607182418800017408UL, 0UL, 4607182418800017408UL,
  ])
  line_color_source_name("yellowgreen", [
    4603614861448139603UL, 4605416301299087802UL, 4596232490294253849UL, 4607182418800017408UL,
  ])
  line_color_source_name("tab:blue", [
    4593424363467775775UL, 4602078339222330846UL, 4604533242548622999UL, 4607182418800017408UL,
  ])
  line_color_source_name("tab:orange", [
    4607182418800017408UL, 4602643496822628320UL, 4588073027439959068UL, 4607182418800017408UL,
  ])
  line_color_source_name("tab:green", [
    4595384753893807638UL, 4603826795548251156UL, 4595384753893807638UL, 4607182418800017408UL,
  ])
  line_color_source_name("tab:red", [
    4605734202449255131UL, 4594678306893435796UL, 4594819596293510164UL, 4607182418800017408UL,
  ])
  line_color_source_name("tab:purple", [
    4603402927348028051UL, 4600948024021735898UL, 4604851143698790328UL, 4607182418800017408UL,
  ])
  line_color_source_name("tab:brown", [
    4603120348547879314UL, 4599747064121103766UL, 4598969972420694739UL, 4607182418800017408UL,
  ])
  line_color_source_name("tab:pink", [
    4606193392999496828UL, 4602078339222330846UL, 4605027755448883288UL, 4607182418800017408UL,
  ])
  line_color_source_name("tab:gray", [
    4602643496822628320UL, 4602643496822628320UL, 4602643496822628320UL, 4607182418800017408UL,
  ])
}

///|
fn line_color_source_names_36() -> Unit raise {
  line_color_source_name("tab:olive", [
    4604815821348771736UL, 4604851143698790328UL, 4593971859893063953UL, 4607182418800017408UL,
  ])
  line_color_source_name("tab:cyan", [
    4591163733066585879UL, 4604886466048808920UL, 4605486945999124986UL, 4607182418800017408UL,
  ])
  line_color_source_name("tab:grey", [
    4602643496822628320UL, 4602643496822628320UL, 4602643496822628320UL, 4607182418800017408UL,
  ])
  line_color_source_name("b", [
    0UL, 0UL, 4607182418800017408UL, 4607182418800017408UL,
  ])
  line_color_source_name("g", [
    0UL, 4602678819172646912UL, 0UL, 4607182418800017408UL,
  ])
  line_color_source_name("r", [
    4607182418800017408UL, 0UL, 0UL, 4607182418800017408UL,
  ])
  line_color_source_name("c", [
    0UL, 4604930618986332160UL, 4604930618986332160UL, 4607182418800017408UL,
  ])
  line_color_source_name("m", [
    4604930618986332160UL, 0UL, 4604930618986332160UL, 4607182418800017408UL,
  ])
  line_color_source_name("y", [
    4604930618986332160UL, 4604930618986332160UL, 0UL, 4607182418800017408UL,
  ])
  line_color_source_name("k", [0UL, 0UL, 0UL, 4607182418800017408UL])
  line_color_source_name("w", [
    4607182418800017408UL, 4607182418800017408UL, 4607182418800017408UL, 4607182418800017408UL,
  ])
}

///|
test "original complete named color primitives group 0" {
  line_color_source_names_0()
  line_color_source_names_1()
  line_color_source_names_2()
  line_color_source_names_3()
  line_color_source_names_4()
  line_color_source_names_5()
  line_color_source_names_6()
  line_color_source_names_7()
}

///|
test "original complete named color primitives group 1" {
  line_color_source_names_8()
  line_color_source_names_9()
  line_color_source_names_10()
  line_color_source_names_11()
  line_color_source_names_12()
  line_color_source_names_13()
  line_color_source_names_14()
  line_color_source_names_15()
}

///|
test "original complete named color primitives group 2" {
  line_color_source_names_16()
  line_color_source_names_17()
  line_color_source_names_18()
  line_color_source_names_19()
  line_color_source_names_20()
  line_color_source_names_21()
  line_color_source_names_22()
  line_color_source_names_23()
}

///|
test "original complete named color primitives group 3" {
  line_color_source_names_24()
  line_color_source_names_25()
  line_color_source_names_26()
  line_color_source_names_27()
  line_color_source_names_28()
  line_color_source_names_29()
  line_color_source_names_30()
  line_color_source_names_31()
}

///|
test "original complete named color primitives group 4" {
  line_color_source_names_32()
  line_color_source_names_33()
  line_color_source_names_34()
  line_color_source_names_35()
  line_color_source_names_36()
}
