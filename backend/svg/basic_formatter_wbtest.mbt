///|
test "named offscreen callback errors precede a poisoned minor locator query" {
  let x = @axis.axis()
  x.set_limits(0.0, 1.0)
  x.set_locator(@ticker.FixedLocator::new([-1.0, 0.0, 1.0, 2.0]).as_locator())
  let minor_queries = [0]
  x.bind_data_interval(() => {
    minor_queries[0] += 1
    (0.0, 1.0)
  })
  x.set_minor_locator(
    @ticker.IndexLocator::new(base=0.0, offset=0.0).as_minor_locator(),
  )
  x.set_named_formatter(
    @ticker.FuncFormatter::new(fn(
      _value,
      _pos,
    ) -> String raise @core.DataError {
      raise @core.DataError::InvalidTicks(message="major formatter first")
    }).as_base_formatter(),
  )
  assert_true(
    try {
      ignore(render_with_positions_checked(basic_formatter_reference_figure(x)))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "major formatter first"
      _ => false
    },
  )
  assert_eq(minor_queries[0], 0)
}

///|
test "named secondary formats every own tick before performing inverse display conversion" {
  for horizontal in [true, false] {
    let inverse_calls = [0]
    let callbacks : Array[(Double, Int32?)] = []
    let formatter = @ticker.FuncFormatter::new((value, pos) => {
      if inverse_calls[0] != 0 {
        raise @core.DataError::InvalidTicks(
          message="inverse preceded formatter",
        )
      }
      callbacks.push((value, pos))
      "child:" + pos.unwrap_or(-1).to_string()
    })
    formatter.set_offset_string("child offset")
    let axis = @render.secondary_axis(
      if horizontal {
        @render.SecondaryLocation::Top
      } else {
        @render.SecondaryLocation::Right
      },
      value => value * 2.0 + 5.0,
      value => {
        inverse_calls[0] += 1
        (value - 5.0) / 2.0
      },
      None,
      6,
      Some([3.0, 5.0, 6.0, 7.0, 9.0]),
      None,
      None,
      named_formatter=Some(formatter.as_base_formatter()),
      minor_locator=Some(@ticker.NullLocator::new().as_minor_locator()),
    )
    let scale : Scale = {
      xmin: 0.0,
      xmax: 1.0,
      ymin: 0.0,
      ymax: 1.0,
      x_axis_scale: @ticker_scale.linear_scale(),
      y_axis_scale: @ticker_scale.linear_scale(),
    }
    let writer = @xml.Writer::new()
    writer.start_element("svg", [])
    if horizontal {
      append_secondary_x_axis(writer, scale, 40.0, 60.0, 400.0, 300.0, [], axis)
    } else {
      append_secondary_y_axis(writer, scale, 40.0, 60.0, 400.0, 300.0, [], axis)
    }
    writer.end_element("svg")
    let svg = writer.to_string()
    assert_eq(callbacks, [
      (3.0, Some(0)),
      (5.0, Some(1)),
      (6.0, Some(2)),
      (7.0, Some(3)),
      (9.0, Some(4)),
    ])
    assert_true(inverse_calls[0] > 0)
    assert_true(!svg.contains(">child:0<"))
    assert_true(!svg.contains(">child:4<"))
    for label in ["child:1", "child:2", "child:3", "child offset"] {
      assert_eq(svg.split(">" + label + "<").count() - 1, 1)
    }
  }
}

///|
test "named minor labels display after source overlap while NullFormatter still retains its raw ticks" {
  let x = @axis.axis()
  x.set_limits(0.0, 1.0)
  x.set_locator(@ticker.FixedLocator::new([-1.0, 0.0, 1.0, 2.0]).as_locator())
  x.set_minor_locator(
    @ticker.FixedLocator::new([-2.0, 0.5, 1.0, 3.0]).as_minor_locator(),
  )
  let major = @ticker.NullFormatter::new().as_base_formatter()
  let minor = @ticker.FixedFormatter::new([
    "minor-outside-left", "minor-visible", "minor-outside-right",
  ])
  x.set_named_formatter(major)
  x.set_minor_named_formatter(minor.as_base_formatter())
  let svg = render_with_positions_checked(basic_formatter_reference_figure(x)).0
  assert_eq(svg.split(">minor-visible<").count() - 1, 1)
  assert_true(!svg.contains(">minor-outside-left<"))
  assert_true(!svg.contains(">minor-outside-right<"))
  assert_eq(major.locations().length(), 4)
  assert_eq(major.locations().get(0), -1.0)
  assert_eq(minor.as_base_formatter().locations().length(), 3)
  assert_eq(minor.as_base_formatter().locations().get(0), -2.0)
}
