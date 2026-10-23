///|
fn secondary_position_ir(
  values : Array[Double],
  drawing : () -> @render.SecondaryDrawingContext,
  formatter~ : @ticker.BaseFormatter? = None,
  positioned~ : ((Double, Double, Double, Double) -> Unit raise @core.DataError)? = None,
  prepare~ : (() -> Unit raise @core.DataError)? = None,
  placement~ : (() -> @render.SecondaryPlacement)? = None,
) -> @render.SecondaryAxis {
  @render.secondary_axis(
    @render.SecondaryLocation::Top,
    value => value,
    value => value,
    None,
    6,
    None,
    Some(@ticker.FixedLocator::new(values).as_locator()),
    None,
    named_formatter=formatter,
    minor_locator=Some(@ticker.NullLocator::new().as_minor_locator()),
    major_formatter_locations_provider=Some(() => {
      @ticker.FormatterLocations::NdArray(
        @ticker.TickValues::from_array(values),
      )
    }),
    prepare_draw_provider=Some(prepare.unwrap_or(() => ())),
    positioned_aspect_provider=positioned,
    drawing_context_provider=Some(drawing),
    placement_provider=Some(
      placement.unwrap_or(() => {
        @render.SecondaryPlacement::new(0.0, 1.0, value => value)
      }),
    ),
  )
}

///|
fn secondary_position_figure(
  child : @render.SecondaryAxis,
  primary~ : @ticker.BaseFormatter? = None,
) -> @render.Figure raise @core.DataError {
  let x = @axis.axis()
  let y = @axis.axis(horizontal=false)
  for axis in [x, y] {
    axis.set_limits(0.0, 1.0)
    axis.set_locator(@ticker.NullLocator::new().as_locator())
    axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  }
  if primary is Some(formatter) {
    x.set_locator(@ticker.FixedLocator::new([0.5]).as_locator())
    x.set_named_formatter(formatter)
  }
  @render.figure(
    200,
    100,
    0,
    [@render.panel(None, [], None, [], None, x, y, false, [child], [])],
    [],
    None,
  )
}

///|
fn secondary_position_attribute(
  svg : String,
  label : String,
  attribute : String,
) -> String raise {
  let found : Array[String] = []
  for element in svg.split("<text ") {
    if element.contains(">" + label + "</text>") {
      let (_, attributes) = element.split_once(attribute + "=\"").unwrap()
      let (value, _) = attributes.split_once("\"").unwrap()
      found.push(value.to_owned())
    }
  }
  assert_eq(found.length(), 1)
  found[0]
}

///|
test "positioned aspect runs once during early layout and again after child scale preparation" {
  let events : Array[String] = []
  let rectangles : Array[(Double, Double, Double, Double)] = []
  let child = secondary_position_ir(
    [0.5],
    () => {
      events.push("drawing")
      @render.SecondaryDrawingContext::new(
        0.0,
        25.0,
        200.0,
        25.00000001,
        @render.SecondaryLocation::Bottom,
      )
    },
    prepare=Some(() => events.push("prepare")),
    positioned=Some((left, top, width, height) => {
      events.push("aspect")
      rectangles.push((left, top, width, height))
    }),
    formatter=Some(
      @ticker.FuncFormatter::new((_, _) => {
        events.push("major")
        "positioned-major"
      }).as_base_formatter(),
    ),
    placement=Some(() => {
      @render.SecondaryPlacement::new(0.0, 1.0, value => {
        events.push("transform")
        value
      })
    }),
  )
  let primary = @ticker.FuncFormatter::new((_, _) => {
    events.push("primary")
    "primary"
  })
  ignore(
    render_with_positions_checked(
      secondary_position_figure(
        child,
        primary=Some(primary.as_base_formatter()),
      ),
    ),
  )
  assert_eq(rectangles, [(0.0, 0.0, 200.0, 100.0), (0.0, 0.0, 200.0, 100.0)])
  assert_eq(events, [
    "aspect", "prepare", "aspect", "major", "transform", "transform", "transform",
    "drawing", "primary",
  ])
}

///|
test "drawing context captures the late alignment and active edges only once" {
  let current = [
    @render.SecondaryDrawingContext::new(
      20.0,
      30.0,
      220.0,
      30.00000001,
      @render.SecondaryLocation::Top,
    ),
  ]
  let reads = [0]
  let formatter = @ticker.FixedFormatter::new(["captured"])
  formatter.set_offset_string("old-offset")
  let child = secondary_position_ir(
    [0.5],
    () => {
      reads[0] += 1
      current[0]
    },
    formatter=Some(formatter.as_base_formatter()),
    placement=Some(() => {
      @render.SecondaryPlacement::new(0.0, 1.0, value => {
        current[0] = @render.SecondaryDrawingContext::new(
          20.0,
          50.0,
          220.0,
          50.00000001,
          @render.SecondaryLocation::Bottom,
        )
        formatter.set_offset_string("late-offset")
        value
      })
    }),
  )
  let bundle = secondary_axis_bundle(child, [], 0.0, 1.0)
  assert_eq(reads[0], 1)
  assert_eq(bundle.offset, "late-offset")
  let captured = bundle.drawing.unwrap()
  assert_eq(
    (captured.left(), captured.top(), captured.right(), captured.bottom()),
    (20.0, 50.0, 220.0, 50.00000001),
  )
  assert_true(captured.alignment() is @render.SecondaryLocation::Bottom)
  current[0] = @render.SecondaryDrawingContext::new(
    0.0,
    0.0,
    100.0,
    0.0,
    @render.SecondaryLocation::Top,
  )
  let writer = @xml.Writer::new()
  writer.start_element("svg", [])
  append_secondary_x_axis(
    writer,
    secondary_lifecycle_scale(),
    0.0,
    0.0,
    100.0,
    100.0,
    [],
    child,
    prepared=Some(bundle),
  )
  writer.end_element("svg")
  let svg = writer.to_string()
  assert_eq(reads[0], 1)
  assert_eq(
    secondary_position_attribute(svg, "captured", "x"),
    120.0.to_string(),
  )
  assert_eq(
    secondary_position_attribute(svg, "captured", "y"),
    (50.00000001 + 18.0).to_string(),
  )
  assert_true(svg.contains("late-offset"))
}

///|
test "vertical drawing edges choose the aligned spine without using parent frame bounds" {
  let context = @render.SecondaryDrawingContext::new(
    40.0,
    10.0,
    40.00000001,
    110.0,
    @render.SecondaryLocation::Left,
  )
  let child = secondary_position_ir(
    [0.5],
    () => context,
    formatter=Some(
      @ticker.FixedFormatter::new(["left-side"]).as_base_formatter(),
    ),
  )
  let bundle = secondary_axis_bundle(child, [], 0.0, 1.0)
  let writer = @xml.Writer::new()
  writer.start_element("svg", [])
  append_secondary_y_axis(
    writer,
    secondary_lifecycle_scale(),
    0.0,
    0.0,
    300.0,
    200.0,
    [],
    child,
    prepared=Some(bundle),
  )
  writer.end_element("svg")
  let svg = writer.to_string()
  assert_eq(
    secondary_position_attribute(svg, "left-side", "x"),
    32.0.to_string(),
  )
  assert_eq(
    secondary_position_attribute(svg, "left-side", "y"),
    63.0.to_string(),
  )
  assert_eq(
    secondary_position_attribute(svg, "left-side", "text-anchor"),
    "end",
  )
  assert_true(svg.contains("x1=\"40\" y1=\"10\" x2=\"40\" y2=\"110\""))
}

///|
test "standalone secondary transport retains static location without owned positioning hooks" {
  let child = @render.secondary_axis(
    @render.SecondaryLocation::Bottom,
    value => value,
    value => value,
    None,
    6,
    Some([0.5]),
    None,
    None,
    named_formatter=Some(
      @ticker.FixedFormatter::new(["ownerless"]).as_base_formatter(),
    ),
    minor_locator=Some(@ticker.NullLocator::new().as_minor_locator()),
  )
  assert_true(!child.positioned_aspect(10.0, 20.0, 200.0, 100.0))
  assert_true(child.drawing_context() is None)
  let bundle = secondary_axis_bundle(child, [], 0.0, 1.0)
  assert_true(bundle.drawing is None)
  let writer = @xml.Writer::new()
  writer.start_element("svg", [])
  append_secondary_x_axis(
    writer,
    secondary_lifecycle_scale(),
    10.0,
    20.0,
    200.0,
    100.0,
    [],
    child,
    prepared=Some(bundle),
  )
  writer.end_element("svg")
  let svg = writer.to_string()
  assert_eq(
    secondary_position_attribute(svg, "ownerless", "x"),
    110.0.to_string(),
  )
  assert_eq(
    secondary_position_attribute(svg, "ownerless", "y"),
    138.0.to_string(),
  )
}

///|
test "second positioned aspect error propagates before the first formatter batch" {
  let aspects = [0]
  let batches = [0]
  let child = secondary_position_ir(
    [0.5],
    () => {
      @render.SecondaryDrawingContext::new(
        0.0,
        0.0,
        200.0,
        0.0,
        @render.SecondaryLocation::Top,
      )
    },
    positioned=Some((_, _, _, _) => {
      aspects[0] += 1
      if aspects[0] == 2 {
        raise @core.DataError::InvalidTicks(message="positioned phase")
      }
    }),
    formatter=Some(
      @ticker.FuncFormatter::new((_, _) => {
        batches[0] += 1
        "unreached"
      }).as_base_formatter(),
    ),
  )
  try render_with_positions_checked(secondary_position_figure(child)) catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_eq(message, "positioned phase")
    _ => fail("expected the second aspect error")
  } noraise {
    _ => fail("expected the second aspect error")
  }
  assert_eq(aspects[0], 2)
  assert_eq(batches[0], 0)
}
