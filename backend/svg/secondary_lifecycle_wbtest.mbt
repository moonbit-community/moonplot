///|
fn secondary_lifecycle_owned(
  values : Array[Double],
  placement : () -> @render.SecondaryPlacement,
  formatter~ : @ticker.BaseFormatter? = None,
  prepare~ : (() -> Unit raise @core.DataError)? = None,
  aspect~ : (() -> Unit raise @core.DataError)? = None,
  order~ : Int32? = None,
  location~ : @render.SecondaryLocation = @render.SecondaryLocation::Top,
) -> @render.SecondaryAxis {
  @render.secondary_axis(
    location,
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
    placement_provider=Some(placement),
    prepare_draw_provider=Some(prepare.unwrap_or(() => ())),
    synchronize_view_provider=aspect,
    draw_order=order,
  )
}

///|
fn secondary_lifecycle_scale() -> Scale {
  {
    xmin: 0.0,
    xmax: 1.0,
    ymin: 0.0,
    ymax: 1.0,
    x_axis_scale: @ticker_scale.Scale::Linear,
    y_axis_scale: @ticker_scale.Scale::Linear,
  }
}

///|
test "owned secondary uses live role getters after draw reset even without named formatters" {
  let current = [@ticker.FixedLocator::new([99.0]).as_locator()]
  let fixed : Array[Array[Double]?] = [Some([88.0])]
  let inverse_calls = [0]
  let axis = @render.secondary_axis(
    @render.SecondaryLocation::Top,
    value => value,
    value => {
      inverse_calls[0] += 1
      value
    },
    None,
    6,
    Some([77.0]),
    Some(current[0]),
    None,
    locator_provider=Some(() => Some(current[0])),
    fixed_ticks_provider=Some(() => fixed[0]),
    minor_locator_provider=Some(() => {
      Some(@ticker.NullLocator::new().as_minor_locator())
    }),
    prepare_draw_provider=Some(() => {
      current[0] = @ticker.FixedLocator::new([2.0, 3.0]).as_locator()
      fixed[0] = None
    }),
    placement_provider=Some(() => {
      @render.SecondaryPlacement::new(2.0, 3.0, value => value)
    }),
  )
  assert_true(axis.prepare_draw())
  let bundle = secondary_axis_bundle(axis, [], 0.0, 1.0)
  assert_eq(bundle.major, [(2.0, 2.0), (3.0, 3.0)])
  assert_eq(bundle.major_labels, ["2", "3"])
  assert_eq(bundle.placement, Some((2.0, 3.0)))
  assert_eq(inverse_calls[0], 0)
}

///|
test "aspect synchronization and unnamed owned child draw prepare precede primary batches" {
  let events : Array[String] = []
  let child = secondary_lifecycle_owned(
    [0.5],
    () => {
      events.push("placement")
      @render.SecondaryPlacement::new(0.0, 1.0, value => value)
    },
    aspect=Some(() => events.push("aspect")),
    prepare=Some(() => events.push("draw")),
  )
  let x = @axis.axis()
  x.set_limits(0.0, 1.0)
  x.set_locator(@ticker.FixedLocator::new([0.5]).as_locator())
  x.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  x.set_named_formatter(
    @ticker.FuncFormatter::new((_, _) => {
      events.push("primary")
      "primary"
    }).as_base_formatter(),
  )
  let y = @axis.axis(horizontal=false)
  y.set_limits(0.0, 1.0)
  y.set_locator(@ticker.NullLocator::new().as_locator())
  y.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let panel = @render.panel_with_sharing(
    None,
    [],
    None,
    [],
    None,
    x,
    y,
    None,
    None,
    false,
    [child],
    [],
  )
  ignore(
    render_with_positions_checked(
      @render.figure(400, 200, 0, [panel], [], None),
    ),
  )
  assert_eq(events, ["aspect", "draw", "placement", "primary"])
}

///|
test "each prepared child captures its installed transform independently of later parent changes" {
  let logarithmic = [false]
  let first_context = [
    @render.SecondaryPlacement::new(1.0, 10.0, value => value),
  ]
  let second_context = [
    @render.SecondaryPlacement::new(1.0, 10.0, value => value),
  ]
  let first = secondary_lifecycle_owned(
    [1.0, 2.0, 10.0],
    () => first_context[0],
    formatter=Some(
      @ticker.FuncFormatter::new((_, _) => {
        logarithmic[0] = true
        "first"
      }).as_base_formatter(),
    ),
  )
  let second = secondary_lifecycle_owned(
    [1.0, 2.0, 10.0],
    () => second_context[0],
    prepare=Some(() => {
      let installed_log = logarithmic[0]
      second_context[0] = @render.SecondaryPlacement::new(1.0, 10.0, value => {
        if installed_log {
          @ticker_scale.Scale::Log.transform(value)
        } else {
          value
        }
      })
    }),
  )
  assert_true(first.prepare_draw())
  let first_bundle = secondary_axis_bundle(first, [], 1.0, 10.0)
  assert_true(second.prepare_draw())
  let second_bundle = secondary_axis_bundle(second, [], 1.0, 10.0)
  assert_eq(first_bundle.placement, Some((1.0, 10.0)))
  assert_eq(second_bundle.placement, Some((0.0, 1.0)))
  let linear_fraction = secondary_tick_fraction(
    first_bundle,
    first_bundle.major[1].0,
    2.0,
    @ticker_scale.Scale::Linear,
    1.0,
    10.0,
  ).unwrap()
  let log_fraction = secondary_tick_fraction(
    second_bundle,
    second_bundle.major[1].0,
    2.0,
    @ticker_scale.Scale::Linear,
    1.0,
    10.0,
  ).unwrap()
  assert_true((linear_fraction - 1.0 / 9.0).abs() < 1.0e-14)
  assert_true(
    (log_fraction - @ticker_scale.Scale::Log.transform(2.0)).abs() < 1.0e-14,
  )
  first_context[0] = @render.SecondaryPlacement::new(100.0, 200.0, value => {
    -value
  })
  second_context[0] = first_context[0]
  assert_eq(first_bundle.placement, Some((1.0, 10.0)))
  assert_eq(second_bundle.placement, Some((0.0, 1.0)))
}

///|
test "singular forward expansion places child ticks using own nonsingular view" {
  let axis = secondary_lifecycle_owned([3.8, 4.0, 4.2, 5.0], () => {
    @render.SecondaryPlacement::new(3.8, 4.2, value => value)
  })
  let bundle = secondary_axis_bundle(axis, [], 0.0, 1.0)
  assert_eq(
    secondary_tick_fraction(
      bundle,
      3.8,
      3.8,
      @ticker_scale.Scale::Linear,
      0.0,
      1.0,
    ),
    Some(0.0),
  )
  assert_eq(
    secondary_tick_fraction(
      bundle,
      4.0,
      4.0,
      @ticker_scale.Scale::Linear,
      0.0,
      1.0,
    ),
    Some(0.5),
  )
  assert_eq(
    secondary_tick_fraction(
      bundle,
      4.2,
      4.2,
      @ticker_scale.Scale::Linear,
      0.0,
      1.0,
    ),
    Some(1.0),
  )
  assert_eq(
    secondary_tick_fraction(
      bundle,
      5.0,
      5.0,
      @ticker_scale.Scale::Linear,
      0.0,
      1.0,
    ),
    None,
  )
  let writer = @xml.Writer::new()
  writer.start_element("svg", [])
  append_secondary_x_axis(
    writer,
    secondary_lifecycle_scale(),
    10.0,
    20.0,
    100.0,
    50.0,
    [],
    axis,
    prepared=Some(bundle),
  )
  writer.end_element("svg")
  let svg = writer.to_string()
  assert_true(svg.contains("x1=\"60\""))
  assert_true(svg.contains(">4<"))
  assert_true(!svg.contains(">5<"))
}

///|
test "major callback replaces live minor locator and formatter before full minor batch" {
  let minor_locator = [@ticker.NullLocator::new().as_minor_locator()]
  let minor_formatter : Array[@ticker.BaseFormatter?] = [None]
  let observed : Array[(Double, Int32?)] = []
  let replacement = @ticker.FuncFormatter::new((value, position) => {
    observed.push((value, position))
    "minor"
  }).as_base_formatter()
  let major = @ticker.FuncFormatter::new((_, _) => {
    minor_locator[0] = @ticker.FixedLocator::new([-1.0, 0.5, 2.0]).as_minor_locator()
    minor_formatter[0] = Some(replacement)
    "major"
  }).as_base_formatter()
  let axis = @render.secondary_axis(
    @render.SecondaryLocation::Top,
    value => value,
    value => value,
    None,
    6,
    None,
    Some(@ticker.FixedLocator::new([0.0]).as_locator()),
    None,
    formatter_provider=Some(minor => {
      if minor {
        minor_formatter[0]
      } else {
        Some(major)
      }
    }),
    minor_locator_provider=Some(() => Some(minor_locator[0])),
    major_formatter_locations_provider=Some(() => {
      @ticker.FormatterLocations::Sequence([0.0])
    }),
    minor_formatter_locations_provider=Some(() => {
      @ticker.FormatterLocations::NdArray(
        minor_locator[0].fixed_locator().unwrap().tick_values(0.0, 1.0),
      )
    }),
    placement_provider=Some(() => {
      @render.SecondaryPlacement::new(0.0, 1.0, value => value)
    }),
  )
  let bundle = secondary_axis_bundle(axis, [], 0.0, 1.0)
  assert_eq(observed, [(-1.0, Some(0)), (0.5, Some(1)), (2.0, Some(2))])
  assert_eq(bundle.minor, [(-1.0, -1.0), (0.5, 0.5), (2.0, 2.0)])
  assert_eq(bundle.minor_labels, ["minor", "minor", "minor"])
}

///|
test "owned endpoint and tick transforms occur once before final live offset read" {
  let transformed : Array[Double] = []
  let formatter = @ticker.FixedFormatter::new(["half"])
  formatter.set_offset_string("old")
  let axis = secondary_lifecycle_owned(
    [0.5],
    () => {
      @render.SecondaryPlacement::new(0.0, 1.0, value => {
        transformed.push(value)
        formatter.set_offset_string("late")
        value
      })
    },
    formatter=Some(formatter.as_base_formatter()),
  )
  let bundle = secondary_axis_bundle(axis, [], 0.0, 1.0)
  assert_eq(transformed, [0.0, 1.0, 0.5])
  assert_eq(bundle.offset, "late")
  let writer = @xml.Writer::new()
  writer.start_element("svg", [])
  append_secondary_x_axis(
    writer,
    secondary_lifecycle_scale(),
    0.0,
    0.0,
    100.0,
    50.0,
    [],
    axis,
    prepared=Some(bundle),
  )
  append_secondary_y_axis(
    writer,
    secondary_lifecycle_scale(),
    0.0,
    0.0,
    100.0,
    50.0,
    [],
    axis,
    prepared=Some(bundle),
  )
  assert_eq(transformed, [0.0, 1.0, 0.5])
  writer.end_element("svg")
  assert_true(writer.to_string().contains("late"))
}

///|
test "owned Null groups skip providers while full draw still reads major offset" {
  let formatter = @ticker.FixedFormatter::new([])
  formatter.set_offset_string("null-offset")
  let axis = @render.secondary_axis(
    @render.SecondaryLocation::Top,
    value => value,
    value => value,
    None,
    6,
    None,
    Some(@ticker.NullLocator::new().as_locator()),
    None,
    named_formatter=Some(formatter.as_base_formatter()),
    minor_locator=Some(@ticker.NullLocator::new().as_minor_locator()),
    major_formatter_locations_provider=Some(() => {
      raise @core.DataError::InvalidTicks(message="major Null queried")
    }),
    minor_formatter_locations_provider=Some(() => {
      raise @core.DataError::InvalidTicks(message="minor Null queried")
    }),
    placement_provider=Some(() => {
      @render.SecondaryPlacement::new(0.0, 1.0, value => value)
    }),
  )
  let bundle = secondary_axis_bundle(axis, [], 0.0, 1.0)
  assert_eq(bundle.major, [])
  assert_eq(bundle.minor, [])
  assert_eq(bundle.offset, "null-offset")
}

///|
test "ownerless secondary preserves explicit count transport without implicit defaults" {
  let axis = @render.secondary_axis(
    @render.SecondaryLocation::Top,
    value => 2.0 * value,
    value => value / 2.0,
    None,
    6,
    None,
    None,
    None,
  )
  assert_true(!axis.prepare_draw())
  let bundle = secondary_axis_bundle(axis, [0.0, 1.0], 0.0, 1.0)
  assert_eq(bundle.placement, None)
  assert_eq(bundle.major.length(), 6)
  assert_eq(bundle.major[0], (0.0, 0.0))
  assert_eq(bundle.major[5], (1.0, 2.0))
}

///|
test "decreasing child transform keeps ascending raw view display orientation" {
  let axis = secondary_lifecycle_owned([-1.0, -0.5, 0.0], () => {
    @render.SecondaryPlacement::new(-1.0, 0.0, value => -value)
  })
  let bundle = secondary_axis_bundle(axis, [], 0.0, 1.0)
  assert_eq(bundle.placement, Some((0.0, 1.0)))
  assert_eq(
    secondary_tick_fraction(
      bundle,
      bundle.major[0].0,
      -1.0,
      @ticker_scale.Scale::Linear,
      0.0,
      1.0,
    ),
    Some(1.0),
  )
  assert_eq(
    secondary_tick_fraction(
      bundle,
      bundle.major[1].0,
      -0.5,
      @ticker_scale.Scale::Linear,
      0.0,
      1.0,
    ),
    Some(0.5),
  )
  assert_eq(
    secondary_tick_fraction(
      bundle,
      bundle.major[2].0,
      0.0,
      @ticker_scale.Scale::Linear,
      0.0,
      1.0,
    ),
    Some(0.0),
  )
}

///|
test "decreasing child transform restores descending raw Bbox inversion" {
  let seen : Array[Double] = []
  let axis = secondary_lifecycle_owned([-1.0, -0.5, 0.0], () => {
    @render.SecondaryPlacement::new(0.0, -1.0, value => {
      seen.push(value)
      -value
    })
  })
  let bundle = secondary_axis_bundle(axis, [], 1.0, 0.0)
  assert_eq(seen, [-1.0, 0.0, -1.0, -0.5, 0.0])
  assert_eq(bundle.placement, Some((1.0, 0.0)))
  assert_eq(
    secondary_tick_fraction(
      bundle,
      bundle.major[0].0,
      -1.0,
      @ticker_scale.Scale::Linear,
      0.0,
      1.0,
    ),
    Some(0.0),
  )
  assert_eq(
    secondary_tick_fraction(
      bundle,
      bundle.major[1].0,
      -0.5,
      @ticker_scale.Scale::Linear,
      0.0,
      1.0,
    ),
    Some(0.5),
  )
  assert_eq(
    secondary_tick_fraction(
      bundle,
      bundle.major[2].0,
      0.0,
      @ticker_scale.Scale::Linear,
      0.0,
      1.0,
    ),
    Some(1.0),
  )
}

///|
test "secondary creation order interleaves y before x across aspect draw and XML" {
  let events : Array[String] = []
  let parent_x = @axis.axis()
  parent_x.set_limits(1.0, 100.0)
  let parent_y = @axis.axis(horizontal=false)
  parent_y.set_limits(0.0, 1.0)
  parent_y.set_locator(@ticker.NullLocator::new().as_locator())
  let x_context = [@render.SecondaryPlacement::new(1.0, 100.0, value => value)]
  let y_formatter = @ticker.FuncFormatter::new((_, _) => {
    events.push("format:y")
    parent_x.set_scale(@ticker_scale.Scale::Log)
    "y-child"
  }).as_base_formatter()
  let y_child = secondary_lifecycle_owned(
    [0.5],
    () => @render.SecondaryPlacement::new(0.0, 1.0, value => value),
    formatter=Some(y_formatter),
    aspect=Some(() => events.push("aspect:y")),
    prepare=Some(() => events.push("draw:y")),
    order=Some(0),
    location=@render.SecondaryLocation::Right,
  )
  let x_child = secondary_lifecycle_owned(
    [1.0, 10.0, 100.0],
    () => x_context[0],
    formatter=Some(
      @ticker.FuncFormatter::new((_, position) => {
        if position == Some(0) {
          events.push("format:x")
        }
        "x-child"
      }).as_base_formatter(),
    ),
    aspect=Some(() => events.push("aspect:x")),
    prepare=Some(() => {
      events.push("draw:x")
      let transform = parent_x.coordinate_transform()
      x_context[0] = @render.SecondaryPlacement::new(1.0, 100.0, transform)
    }),
    order=Some(1),
  )
  let panel = @render.panel_with_sharing(
    None,
    [],
    None,
    [],
    None,
    parent_x,
    parent_y,
    None,
    None,
    true,
    [x_child],
    [y_child],
  )
  let svg = render_with_positions_checked(
      @render.figure(400, 200, 0, [panel], [], None),
    ).0
  assert_eq(events, [
    "aspect:y", "aspect:x", "draw:y", "format:y", "draw:x", "format:x",
  ])
  assert_eq(x_context[0].transform()(10.0), 1.0)
  let before_y = svg.split(">y-child<").to_array()[0]
  assert_true(!before_y.contains(">x-child<"))
  assert_true(svg.contains(">x-child<"))
}

///|
test "mixed secondary metadata has deterministic original-sequence tie breaking" {
  let ownerless = @render.secondary_axis(
    @render.SecondaryLocation::Top,
    value => value,
    value => value,
    None,
    6,
    None,
    None,
    None,
  )
  let owned = secondary_lifecycle_owned(
    [0.5],
    () => @render.SecondaryPlacement::new(0.0, 1.0, value => value),
    order=Some(0),
    location=@render.SecondaryLocation::Right,
  )
  let panel = @render.panel(
    None,
    [],
    None,
    [],
    None,
    @axis.axis(),
    @axis.axis(horizontal=false),
    false,
    [ownerless],
    [owned],
  )
  let order = ordered_secondary_axes(panel)
  assert_eq(order.map(entry => (entry.0, entry.1)), [(true, 0), (false, 0)])
}

///|
test "child scale mutation updates later primary data geometry while retaining prepared child context" {
  let x = @axis.axis()
  x.set_limits(1.0, 100.0)
  let y = @axis.axis(horizontal=false)
  y.set_limits(0.0, 1.0)
  let own_context = [
    @render.SecondaryPlacement::new(1.0, 100.0, value => value),
  ]
  let captured : Array[@render.SecondaryPlacement] = []
  let child = secondary_lifecycle_owned(
    [1.0, 10.0, 100.0],
    () => {
      captured.push(own_context[0])
      own_context[0]
    },
    prepare=Some(() => {
      own_context[0] = @render.SecondaryPlacement::new(
        1.0,
        100.0,
        x.coordinate_transform(),
      )
    }),
    formatter=Some(
      @ticker.FuncFormatter::new((_, position) => {
        if position == Some(0) {
          x.set_scale(@ticker_scale.Scale::Log)
        }
        "child-before-primary"
      }).as_base_formatter(),
    ),
  )
  let panel = @render.panel_with_sharing(
    None,
    [
      @render.Artist::Line(
        [@core.point(1.0, 0.5), @core.point(10.0, 0.5), @core.point(100.0, 0.5)],
        @core.style("#13579b"),
      ),
    ],
    None,
    [],
    None,
    x,
    y,
    None,
    None,
    true,
    [child],
    [],
  )
  let svg = render_with_positions_checked(
      @render.figure(400, 200, 0, [panel], [], None),
    ).0
  assert_true(svg.contains("points=\"0,100 200,100 400,100\""))
  assert_eq(captured.length(), 1)
  assert_eq(captured[0].transform()(10.0), 10.0)
  assert_eq(x.coordinate_transform()(10.0), 1.0)
  assert_eq((captured[0].lower(), captured[0].upper()), (1.0, 100.0))
}

///|
test "owned legacy percent formatter uses actual own view without remapping parent endpoints" {
  let forward_calls = [0]
  let axis = @render.secondary_axis(
    @render.SecondaryLocation::Top,
    _ => {
      forward_calls[0] += 1
      0.0 / 0.0
    },
    value => value,
    None,
    6,
    None,
    None,
    Some(@ticker.percent_formatter(xmax=1.0)),
    minor_locator=Some(@ticker.NullLocator::new().as_minor_locator()),
    major_formatter_locations_provider=Some(() => {
      @ticker.FormatterLocations::Sequence([0.001, 0.005])
    }),
    formatter_view_provider=Some(() => (0.0, 0.01)),
    placement_provider=Some(() => {
      @render.SecondaryPlacement::new(0.0, 0.01, value => value)
    }),
  )
  let bundle = secondary_axis_bundle(axis, [], 0.0, 1.0)
  // Complete original PercentFormatter+DummyAxis view produced these labels.
  assert_eq(bundle.major_labels, ["0.10%", "0.50%"])
  assert_eq(bundle.major, [(0.001, 0.001), (0.005, 0.005)])
  assert_eq(bundle.placement, Some((0.0, 0.01)))
  assert_eq(forward_calls[0], 0)
}
