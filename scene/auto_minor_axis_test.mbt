///|
test "AutoMinor Axis overlap performs a second live major query" {
  let axis = @axis.axis()
  axis.set_tick_layout(100.0, true)
  axis.set_limits(0.0, 1.0)
  let major = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Count(1))
  axis.set_locator(major.as_locator())
  let reads = [0]
  major.bind_view_interval(() => {
    reads[0] += 1
    (0.0, 1.0)
  })
  let minor = @ticker.AutoMinorLocator::new(
    ndivs=Some(@config.MinorTickDivisions::Number(2.0)),
  )
  axis.set_minor_locator(minor.as_minor_locator())
  assert_eq(axis.minor_tick_values_checked(@core.limits(0.0, 1.0)), [0.5])
  assert_eq(reads[0], 2)
  reads[0] = 0
  axis.set_minor_overlap_removal(false)
  assert_eq(axis.minor_tick_values_checked(@core.limits(0.0, 1.0)), [
    0.0, 0.5, 1.0,
  ])
  assert_eq(reads[0], 1)
}

///|
test "AutoMinor checked axis propagates the later major query failure" {
  let axis = @axis.axis()
  axis.set_tick_layout(100.0, true)
  axis.set_limits(0.0, 1.0)
  let major = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Count(1))
  axis.set_locator(major.as_locator())
  let reads = [0]
  major.bind_view_interval(() => {
    reads[0] += 1
    if reads[0] > 1 {
      raise @core.DataError::InvalidTicks(message="second major provider")
    }
    (0.0, 1.0)
  })
  let minor = @ticker.AutoMinorLocator::new(
    ndivs=Some(@config.MinorTickDivisions::Number(2.0)),
  )
  axis.set_minor_locator(minor.as_minor_locator())
  assert_true(
    try {
      ignore(axis.minor_tick_values_checked(@core.limits(0.0, 1.0)))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "second major provider"
      _ => false
    },
  )
  assert_eq(reads[0], 2)
  reads[0] = 0
  axis.set_minor_overlap_removal(false)
  assert_eq(axis.minor_tick_values_checked(@core.limits(0.0, 1.0)), [
    0.0, 0.5, 1.0,
  ])
}

///|
test "AutoMinor checked SVG keeps raw neighbor ticks and clips only drawing" {
  let figure = @scene.figure(width=240, height=120)
  let axes = figure.axes()
  axes.set_x_limits(0.75, 1.75)
  axes.set_y_limits(0.0, 1.0)
  axes.set_x_locator(@ticker.FixedLocator::new([0.0, 1.0]).as_locator())
  let minor = @ticker.AutoMinorLocator::new(
    ndivs=Some(@config.MinorTickDivisions::Number(2.0)),
  )
  axes.set_x_minor_locator(minor.as_minor_locator())
  axes.x_axis().set_minor_grid(true, "#12ab34", 0.375)
  assert_eq(minor.call(), [1.0, 1.5, 2.0])
  assert_eq(axes.x_axis().minor_tick_values_checked(@core.limits(0.75, 1.75)), [
    1.5, 2.0,
  ])
  let svg = figure.to_svg_checked()
  assert_eq(svg.split("stroke=\"#12ab34\"").count() - 1, 1)
  axes.x_axis().set_minor_overlap_removal(false)
  assert_eq(axes.x_axis().minor_tick_values_checked(@core.limits(0.75, 1.75)), [
    1.0, 1.5, 2.0,
  ])
  let unfiltered = figure.to_svg_checked()
  assert_eq(unfiltered.split("stroke=\"#12ab34\"").count() - 1, 2)
}

///|
test "AutoMinor secondary uses its own rc name and keeps provider errors checked" {
  let previous_x = @config.minor_tick_divisions(horizontal=true)
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer @config.set_minor_tick_divisions(previous_x, horizontal=true)
  defer @config.set_minor_tick_divisions(previous_y, horizontal=false)
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(2.0),
    horizontal=true,
  )
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(4.0),
    horizontal=false,
  )
  let figure = @scene.figure()
  let axes = figure.axes()
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  let secondary_x = axes.secondary_xaxis(value => value + 10.0, value => {
    value - 10.0
  })
  let secondary_y = axes.secondary_yaxis(value => value + 10.0, value => {
    value - 10.0
  })
  secondary_x.set_locator(@ticker.FixedLocator::new([10.0, 11.0]).as_locator())
  secondary_y.set_locator(@ticker.FixedLocator::new([10.0, 11.0]).as_locator())
  let minor = @ticker.AutoMinorLocator::new()
  secondary_y.set_minor_locator(minor.as_minor_locator())
  // Before aspect/draw, a non-log child still owns the source initial view 0..1.
  assert_eq(minor.call(), [0.0, 0.25, 0.5, 0.75, 1.0])
  let external = minor.copy()
  secondary_x.set_minor_locator(minor.as_minor_locator())
  assert_eq(minor.call(), [0.0, 0.25, 0.5, 0.75, 1.0])
  minor.set_ndivs(None)
  assert_eq(minor.call(), [0.0, 0.5, 1.0])
  assert_eq(external.call(), [0.0, 0.25, 0.5, 0.75, 1.0])
  let shared_svg = figure.to_svg_checked()
  assert_eq(shared_svg.split("stroke-width=\"0.7\"").count() - 1, 2)
  secondary_y.set_minor_locator(external.as_minor_locator())
  let independent_svg = figure.to_svg_checked()
  assert_eq(independent_svg.split("stroke-width=\"0.7\"").count() - 1, 4)
  minor.bind_view_interval(() => {
    raise @core.DataError::InvalidTicks(message="secondary minor view")
  })
  assert_true(
    try {
      ignore(figure.to_svg_checked())
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "secondary minor view"
      _ => false
    },
  )
  secondary_x.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  secondary_y.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  ignore(figure.to_svg_checked())
}

///|
test "Null direct minor getter still performs enabled overlap major query" {
  let axis = @axis.axis()
  axis.set_limits(0.0, 1.0)
  let poison = @ticker.IndexLocator::new(base=1.0, offset=0.0)
  axis.set_locator(poison.as_locator())
  axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  assert_true(
    try {
      ignore(axis.minor_tick_values_checked(@core.limits(0.0, 1.0)))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  axis.set_minor_overlap_removal(false)
  assert_eq(axis.minor_tick_values_checked(@core.limits(0.0, 1.0)), [])
}
