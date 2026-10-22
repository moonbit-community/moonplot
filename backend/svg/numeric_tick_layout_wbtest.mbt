///|
fn numeric_layout_panel(
  x_axis : @axis.Axis,
  y_axis : @axis.Axis,
  group? : Int32,
  box_aspect? : Double,
) -> @render.Panel {
  @render.panel_with_sharing(
    None,
    [],
    None,
    [],
    None,
    x_axis,
    y_axis,
    group,
    None,
    false,
    [],
    [],
    adjustable=if box_aspect is Some(_) { "datalim" } else { "box" },
    box_aspect?,
  )
}

///|
test "numeric layout resolves every shared owner active width before the first panel draws" {
  let previous = @config.classic_mode()
  defer @config.set_classic_mode(previous)
  @config.set_classic_mode(false)
  let first = @axis.axis()
  let last = @axis.axis()
  let y0 = @axis.axis()
  let y1 = @axis.axis()
  for axis in [first, last, y0, y1] {
    axis.set_limits(0.0, 20.0)
  }
  let locator = @ticker.AutoLocator::new()
  first.set_locator(locator.as_locator())
  last.set_locator(locator.as_locator())
  first.set_formatter(@ticker.format_str_formatter("wb-shared=%.1f"))
  last.set_formatter(@ticker.format_str_formatter("wb-shared=%.1f"))
  let panels = [
    numeric_layout_panel(first, y0, group=0),
    numeric_layout_panel(last, y1, group=0, box_aspect=5.0),
  ]
  let figure = @render.figure(600, 300, 0, panels, [], None)
  let (svg, positions) = render_with_positions_checked(figure)
  assert_eq(positions[0].2, 600.0)
  assert_eq(positions[1].2, 60.0)
  assert_eq(last.get_tick_space(), 2.0)
  assert_eq(locator.call(), [0.0, 10.0, 20.0])
  assert_eq(svg.split(">wb-shared=").count() - 1, 6)
}

///|
test "numeric layout reads last unshared owner view and width before clipping each panel" {
  let previous = @config.classic_mode()
  defer @config.set_classic_mode(previous)
  @config.set_classic_mode(false)
  let first = @axis.axis()
  let last = @axis.axis()
  first.set_limits(0.0, 20.0)
  last.set_limits(100.0, 120.0)
  let y0 = @axis.axis()
  let y1 = @axis.axis()
  for axis in [y0, y1] {
    axis.set_limits(0.0, 1.0)
  }
  let locator = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  first.set_locator(locator.as_locator())
  last.set_locator(locator.as_locator())
  first.set_formatter(@ticker.format_str_formatter("wb-owner-A=%.1f"))
  last.set_formatter(@ticker.format_str_formatter("wb-owner-B=%.1f"))
  let panels = [
    numeric_layout_panel(first, y0),
    numeric_layout_panel(last, y1, box_aspect=5.0),
  ]
  let figure = @render.figure(600, 300, 0, panels, [], None)
  let (svg, positions) = render_with_positions_checked(figure)
  assert_eq(positions[1].2, 60.0)
  assert_eq(locator.call(), [100.0, 110.0, 120.0])
  assert_true(!svg.contains(">wb-owner-A="))
  assert_eq(svg.split(">wb-owner-B=").count() - 1, 3)
}

///|
test "numeric locator checked view callbacks preserve backend aspect validation errors" {
  let locator = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  let x_axis = @axis.axis()
  let y_axis = @axis.axis()
  x_axis.set_limits(0.0, 20.0)
  y_axis.set_limits(0.0, 1.0)
  x_axis.set_locator(locator.as_locator())
  let panel = numeric_layout_panel(x_axis, y_axis, box_aspect=0.0)
  let figure = @render.figure(240, 120, 0, [panel], [], None)
  locator.bind_view_interval(() => {
    let (_, x, _) = panel_view(figure, 0).unwrap()
    (x.lower(), x.upper())
  })
  assert_true(
    try {
      ignore(locator.call())
      false
    } catch {
      @core.DataError::InvalidReference(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      ignore(render_with_positions_checked(figure))
      false
    } catch {
      @core.DataError::InvalidReference(..) => true
      _ => false
    },
  )
}
