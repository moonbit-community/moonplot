///|
fn null_locator_render(
  x_axis : @axis.Axis,
  y_axis : @axis.Axis,
) -> String raise @core.DataError {
  let panel = @render.panel(
    None,
    [],
    None,
    [],
    None,
    x_axis,
    y_axis,
    false,
    [],
    [],
  )
  render_with_positions_checked(@render.figure(240, 120, 0, [panel], [], None)).0
}

///|
test "Null SVG skips its major group independently from minor drawing" {
  for null_major in [true, false] {
    for null_minor in [true, false] {
      let x_axis = @axis.axis()
      let y_axis = @axis.axis()
      x_axis.set_limits(0.0, 1.0)
      y_axis.set_limits(0.0, 1.0)
      y_axis.set_locator(@ticker.NullLocator::new().as_locator())
      y_axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
      if null_major {
        x_axis.set_locator(@ticker.NullLocator::new().as_locator())
      } else {
        x_axis.set_locator(@ticker.FixedLocator::new([0.0, 1.0]).as_locator())
      }
      if null_minor {
        x_axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
      } else {
        x_axis.set_minor_locator(
          @ticker.FixedLocator::new([0.5]).as_minor_locator(),
        )
      }
      x_axis.set_minor_grid(true, "#19ab37", 0.375)
      let formatter_reads = [0]
      x_axis.set_formatter(
        @ticker.func_formatter(value => {
          formatter_reads[0] += 1
          "null-group=" + value.to_string()
        }),
      )
      let svg = null_locator_render(x_axis, y_axis)
      if null_major {
        assert_eq(formatter_reads[0], 0)
        assert_true(!svg.contains(">null-group="))
      } else {
        assert_true(formatter_reads[0] > 0)
        assert_eq(svg.split(">null-group=").count() - 1, 2)
      }
      assert_eq(
        svg.split("stroke=\"#19ab37\"").count() - 1,
        if null_minor {
          0
        } else {
          1
        },
      )
    }
  }
}

///|
test "Null SVG does not ask bound view providers for disabled tick groups" {
  let x_axis = @axis.axis()
  let y_axis = @axis.axis()
  let reads = [0]
  for axis in [x_axis, y_axis] {
    axis.set_limits(0.0, 1.0)
    axis.set_locator(@ticker.NullLocator::new().as_locator())
    axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
    axis.bind_view_interval(() => {
      reads[0] += 1
      raise @core.DataError::InvalidTicks(
        message="Null draw must not query view",
      )
    })
    axis.set_formatter(
      @ticker.func_formatter(_ => {
        reads[0] += 1
        "unexpected-null-label"
      }),
    )
  }
  let svg = null_locator_render(x_axis, y_axis)
  assert_eq(reads[0], 0)
  assert_true(!svg.contains("unexpected-null-label"))
}

///|
test "Null secondary draw helpers skip forward inverse formatter and minor callbacks" {
  let reads = [0]
  let null_locator = @ticker.NullLocator::new()
  let secondary = @render.secondary_axis(
    @render.SecondaryLocation::Top,
    value => {
      reads[0] += 1
      value
    },
    value => {
      reads[0] += 1
      value
    },
    None,
    6,
    None,
    Some(null_locator.as_locator()),
    Some(
      @ticker.func_formatter(value => {
        reads[0] += 1
        value.to_string()
      }),
    ),
    minor_locator=Some(null_locator.as_minor_locator()),
    minor_ticks_provider=Some(() => {
      reads[0] += 1
      raise @core.DataError::InvalidTicks(
        message="Null secondary minor provider",
      )
    }),
  )
  assert_eq(secondary_axis_ticks(secondary, [0.0, 1.0], 0.0, 1.0), [])
  assert_eq(secondary_axis_tick_labels(secondary, [], 0.0, 1.0), [])
  assert_eq(secondary.minor_tick_values(), [])
  assert_eq(reads[0], 0)
}
