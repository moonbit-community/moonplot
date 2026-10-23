///|
/// SVG user units and tick font sizes use the same point-scale coordinate system.
pub fn tick_space_from_length(
  length : Double,
  label_size : Double,
  horizontal : Bool,
) -> Double {
  let size = label_size * (if horizontal { 3.0 } else { 2.0 })
  let points = length / 72.0 * 72.0
  if size > 0.0 {
    (points / size).floor()
  } else {
    2147483647.0
  }
}

///|
pub fn Axis::set_tick_label_size(self : Axis, size : Double) -> Unit {
  self.tick_label_size = Some(if size < 1.0 { 1.0 } else { size })
}

///|
pub fn Axis::tick_label_size(self : Axis) -> Double {
  self.tick_label_size.unwrap_or(10.0)
}

///|
pub fn Axis::bind_tick_geometry(
  self : Axis,
  provider : () -> Double,
  horizontal : Bool,
) -> Unit {
  self.tick_length_provider = Some(provider)
  self.tick_horizontal = horizontal
}

///|
pub fn Axis::set_tick_layout(
  self : Axis,
  length : Double,
  horizontal : Bool,
  active~ : Bool = false,
  origin? : Double,
) -> Unit {
  self.tick_layout_origin = origin
  self.tick_layout_length = Some(length)
  self.tick_layout_active = active
  self.tick_horizontal = horizontal
  if !active {
    self.tick_layout_view = None
  }
}

///|
pub fn Axis::clear_tick_layout(self : Axis) -> Unit {
  self.tick_layout_active = false
  self.tick_layout_view = None
}

///|
pub fn Axis::set_tick_view(self : Axis, lower : Double, upper : Double) -> Unit {
  self.tick_layout_view = Some((lower, upper))
}

///|
pub fn Axis::tick_space_length(self : Axis) -> Double? {
  if self.tick_layout_active {
    return self.tick_layout_length
  }
  match self.tick_length_provider {
    Some(provider) => Some(provider())
    None => self.tick_layout_length
  }
}

///|
pub fn Axis::get_tick_space(self : Axis) -> Double {
  match self.tick_space_length() {
    Some(length) =>
      tick_space_from_length(
        length,
        self.tick_label_size(),
        self.tick_horizontal,
      )
    None => 9.0
  }
}

///|
pub fn Axis::bind_view_interval(
  self : Axis,
  provider : () -> (Double, Double) raise @core.DataError,
) -> Unit {
  self.numeric_view_provider = Some(provider)
}

///|
pub fn Axis::view_interval_checked(
  self : Axis,
) -> (Double, Double) raise @core.DataError {
  if self.tick_layout_view is Some(view) {
    return view
  }
  match self.numeric_view_provider {
    Some(provider) => provider()
    None => {
      let view = self.current_view_limits().unwrap_or(@core.limits(0.0, 1.0))
      (view.lower(), view.upper())
    }
  }
}

///|
fn Axis::bind_maxn_context(self : Axis, value : @ticker.MaxNLocator) -> Unit {
  value.bind_tick_space(fn() { self.get_tick_space() })
  value.bind_view_interval(() => self.view_interval_checked())
}
