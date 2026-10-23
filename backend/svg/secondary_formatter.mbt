///|
priv struct SecondaryTickBundle {
  major : Array[(Double, Double)]
  major_labels : Array[String]
  minor : Array[(Double, Double)]
  minor_labels : Array[String]
  offset : String
}

///|
fn secondary_raw_major_locations(
  axis : @render.SecondaryAxis,
  primary_ticks : Array[Double],
  lower : Double,
  upper : Double,
) -> @ticker.FormatterLocations raise @core.DataError {
  if axis.tick_group_is_null() {
    return @ticker.FormatterLocations::NdArray(
      @ticker.TickValues::from_array([]),
    )
  }
  if axis.formatter_tick_locations() is Some(locations) {
    return locations
  }
  if axis.fixed_ticks() is Some(values) {
    return @ticker.FormatterLocations::NdArray(
      @ticker.TickValues::from_array(values),
    )
  }
  let view = match axis.locator() {
    Some(@ticker.Locator::Fixed(values)) =>
      @ticker.TickValues::from_array(values)
    Some(@ticker.Locator::NamedFixed(value)) => value.tick_values(0.0, 0.0)
    Some(@ticker.Locator::Multiple(value)) =>
      @ticker.TickValues::from_array(
        value.tick_values(axis.forward()(lower), axis.forward()(upper)),
      )
    Some(locator) =>
      locator.tick_view_for_axis(axis.forward()(lower), axis.forward()(upper))
    None =>
      @ticker.TickValues::from_array(
        secondary_primary_ticks(primary_ticks, axis.tick_count()).map(
          axis.forward(),
        ),
      )
  }
  @ticker.FormatterLocations::NdArray(view)
}

///|
fn secondary_axis_bundle(
  axis : @render.SecondaryAxis,
  primary_ticks : Array[Double],
  lower : Double,
  upper : Double,
) -> SecondaryTickBundle raise @core.DataError {
  let (values, major_labels, legacy_major) = if axis.named_formatter() is None &&
    axis.minor_named_formatter() is None {
    let major = secondary_axis_ticks(axis, primary_ticks, lower, upper)
    let labels = secondary_axis_tick_labels(
      axis,
      major.map(tick => tick.1),
      lower,
      upper,
    )
    (major.map(tick => tick.1), labels, Some(major))
  } else {
    let locations = secondary_raw_major_locations(
      axis, primary_ticks, lower, upper,
    )
    let labels = if axis.tick_group_is_null() {
      []
    } else {
      match axis.named_formatter() {
        Some(formatter) => format_retained_locations(formatter, locations)
        None =>
          secondary_axis_tick_labels(
            axis,
            materialize_formatter_locations(locations),
            lower,
            upper,
          )
      }
    }
    (materialize_formatter_locations(locations), labels, None)
  }
  let minor_null = axis.tick_group_is_null(minor=true)
  let minor_locations = if minor_null {
    @ticker.FormatterLocations::Sequence([])
  } else {
    match axis.formatter_tick_locations(minor=true) {
      Some(locations) => locations
      None =>
        @ticker.FormatterLocations::NdArray(
          @ticker.TickValues::from_array(axis.minor_tick_values()),
        )
    }
  }
  let minor_labels = if minor_null {
    []
  } else {
    match axis.minor_named_formatter() {
      Some(formatter) => format_retained_locations(formatter, minor_locations)
      None => Array::make(minor_locations.length(), "")
    }
  }
  // Axis._update_ticks transforms view endpoints and both full tick groups
  // before Axis.draw asks the major formatter for its final offset text.
  if axis.formatter_view_interval() is Some((first, last)) {
    ignore(axis.inverse()(first))
    ignore(axis.inverse()(last))
  }
  let major = match legacy_major {
    Some(major) => major
    None => values.map(value => (axis.inverse()(value), value))
  }
  let minor = materialize_formatter_locations(minor_locations).map(value => {
    (axis.inverse()(value), value)
  })
  let offset = match axis.named_formatter() {
    Some(formatter) => formatter.get_offset_checked()
    None => ""
  }
  { major, major_labels, minor, minor_labels, offset, }
}
