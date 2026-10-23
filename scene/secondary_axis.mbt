///|
/// Location of a secondary coordinate axis.
pub(all) enum SecondaryAxisLocation {
  Top
  Bottom
  Left
  Right
}

///|
/// A coordinate axis whose values are derived from a primary axis.
pub struct SecondaryAxis {
  priv formatter_axis_binding : @ticker.FormatterAxisBinding
  priv mut formatter_view : (Double, Double)
  priv mut named_formatter : @ticker.BaseFormatter?
  priv mut minor_named_formatter : @ticker.BaseFormatter?
  priv formatter_messages : Array[String]
  priv mut parent_axis : @axis.Axis?
  priv mut minor_locator : @ticker.MinorLocator?
  priv mut remove_minor_overlap : Bool
  priv mut tick_label_size : Double
  location : SecondaryAxisLocation
  forward : (Double) -> Double
  inverse : (Double) -> Double
  mut label : String?
  mut tick_count : Int32
  mut fixed_ticks : Array[Double]?
  mut locator : @ticker.Locator?
  mut formatter : @ticker.Formatter?
}

///|
fn copy_secondary_locator(locator : @ticker.Locator) -> @ticker.Locator {
  locator.copy()
}

///|
fn secondary_axis(
  location : SecondaryAxisLocation,
  forward : (Double) -> Double,
  inverse : (Double) -> Double,
) -> SecondaryAxis {
  let result : SecondaryAxis = {
    formatter_axis_binding: @ticker.FormatterAxisBinding::new(),
    formatter_view: (0.0, 1.0),
    named_formatter: None,
    minor_named_formatter: None,
    formatter_messages: [],
    parent_axis: None,
    minor_locator: None,
    remove_minor_overlap: true,
    tick_label_size: 10.0,
    location,
    forward,
    inverse,
    label: None,
    tick_count: 6,
    fixed_ticks: None,
    locator: None,
    formatter: None,
  }
  result.formatter_axis_binding.bind_view_interval(() => {
    let (lower, upper) = result.formatter_view
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([lower, upper]),
    )
  })
  result
}

///|
pub fn SecondaryAxis::location(self : SecondaryAxis) -> SecondaryAxisLocation {
  self.location
}

///|
pub fn SecondaryAxis::forward(self : SecondaryAxis) -> (Double) -> Double {
  self.forward
}

///|
pub fn SecondaryAxis::inverse(self : SecondaryAxis) -> (Double) -> Double {
  self.inverse
}

///|
pub fn SecondaryAxis::set_label(self : SecondaryAxis, value : String) -> Unit {
  self.label = Some(value)
}

///|
pub fn SecondaryAxis::label(self : SecondaryAxis) -> String? {
  self.label
}

///|
pub fn SecondaryAxis::set_tick_count(
  self : SecondaryAxis,
  value : Int32,
) -> Unit {
  self.tick_count = if value < 2 { 2 } else { value }
}

///|
pub fn SecondaryAxis::tick_count(self : SecondaryAxis) -> Int32 {
  self.tick_count
}

///|
pub fn SecondaryAxis::set_ticks(
  self : SecondaryAxis,
  values : Array[Double],
) -> Unit raise @core.DataError {
  for value in values {
    if value.is_nan() || value.is_inf() {
      raise @core.DataError::InvalidTicks(
        message="secondary tick positions must be finite",
      )
    }
  }
  self.fixed_ticks = Some(values.copy())
  self.locator = None
}

///|
pub fn SecondaryAxis::ticks(self : SecondaryAxis) -> Array[Double]? {
  match self.fixed_ticks {
    Some(values) => Some(values.copy())
    None => None
  }
}

///|
/// Set the locator used to generate secondary tick values.
///
/// Locator values live in secondary-axis coordinates. The SVG backend maps
/// each generated value back through `inverse` before placing the tick.
pub fn SecondaryAxis::set_locator(
  self : SecondaryAxis,
  locator : @ticker.Locator,
) -> Unit raise @core.DataError {
  match locator {
    @ticker.Locator::Fixed(values) =>
      for value in values {
        if value.is_nan() || value.is_inf() {
          raise @core.DataError::InvalidTicks(
            message="secondary locator values must be finite",
          )
        }
      }
    _ => ()
  }
  self.locator = Some(copy_secondary_locator(locator))
  self.fixed_ticks = None
  if locator is @ticker.Locator::Index(value) {
    value.bind_data_interval(fn() { (1.0 / 0.0, -1.0 / 0.0) })
  }
  self.bind_numeric_locator_context(locator)
}

///|
/// Return the configured secondary locator, if any.
pub fn SecondaryAxis::locator(self : SecondaryAxis) -> @ticker.Locator? {
  match self.locator {
    Some(value) => Some(copy_secondary_locator(value))
    None => None
  }
}

///|
/// Clear the secondary locator and restore tick-count sampling.
pub fn SecondaryAxis::clear_locator(self : SecondaryAxis) -> Unit {
  self.locator = None
}

///|
/// Set the formatter used for secondary tick labels.
pub fn SecondaryAxis::set_formatter(
  self : SecondaryAxis,
  formatter : @ticker.Formatter,
) -> Unit {
  self.formatter = Some(formatter.copy())
  self.named_formatter = None
  self.formatter_messages.clear()
}

///|
/// Return the configured secondary formatter, if any.
pub fn SecondaryAxis::formatter(self : SecondaryAxis) -> @ticker.Formatter? {
  match self.formatter {
    Some(value) => Some(value.copy())
    None => None
  }
}

///|
/// Clear the secondary formatter and restore numeric labels.
pub fn SecondaryAxis::clear_formatter(self : SecondaryAxis) -> Unit {
  self.formatter = None
  self.named_formatter = None
}

///|
/// Add a secondary x axis derived from the primary x coordinate.
pub fn Axes::secondary_xaxis(
  self : Axes,
  forward : (Double) -> Double,
  inverse : (Double) -> Double,
  location~ : SecondaryAxisLocation = SecondaryAxisLocation::Top,
) -> SecondaryAxis raise @core.DataError {
  match location {
    SecondaryAxisLocation::Top | SecondaryAxisLocation::Bottom => ()
    SecondaryAxisLocation::Left | SecondaryAxisLocation::Right =>
      raise @core.DataError::InvalidTicks(
        message="secondary x axis location must be top or bottom",
      )
  }
  let result = secondary_axis(location, forward, inverse)
  result.parent_axis = Some(self.x_axis())
  result.initialize_formatter_view()
  self.state.val.secondary_x.push(result)
  result
}

///|
/// Add a secondary y axis derived from the primary y coordinate.
pub fn Axes::secondary_yaxis(
  self : Axes,
  forward : (Double) -> Double,
  inverse : (Double) -> Double,
  location~ : SecondaryAxisLocation = SecondaryAxisLocation::Right,
) -> SecondaryAxis raise @core.DataError {
  match location {
    SecondaryAxisLocation::Left | SecondaryAxisLocation::Right => ()
    SecondaryAxisLocation::Top | SecondaryAxisLocation::Bottom =>
      raise @core.DataError::InvalidTicks(
        message="secondary y axis location must be left or right",
      )
  }
  let result = secondary_axis(location, forward, inverse)
  result.parent_axis = Some(self.y_axis())
  result.initialize_formatter_view()
  self.state.val.secondary_y.push(result)
  result
}

///|
/// Add a secondary x axis to the default axes panel.
pub fn Figure::secondary_xaxis(
  self : Figure,
  forward : (Double) -> Double,
  inverse : (Double) -> Double,
  location~ : SecondaryAxisLocation = SecondaryAxisLocation::Top,
) -> SecondaryAxis raise @core.DataError {
  self.axes().secondary_xaxis(forward, inverse, location~)
}

///|
/// Add a secondary y axis to the default axes panel.
pub fn Figure::secondary_yaxis(
  self : Figure,
  forward : (Double) -> Double,
  inverse : (Double) -> Double,
  location~ : SecondaryAxisLocation = SecondaryAxisLocation::Right,
) -> SecondaryAxis raise @core.DataError {
  self.axes().secondary_yaxis(forward, inverse, location~)
}
