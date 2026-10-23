///|
// All views in one generation share the same interleaved Float64 buffer.
priv struct Line2DCache {
  flat : @ticker.TickValues
  xs : @ticker.TickValues
  ys : @ticker.TickValues
}

///|
/// A stable Line data handle with copied originals and lazy converted views.
pub struct Line2D {
  priv points : Array[@core.Point]
  priv mut style : @core.Style
  priv mut source_color : Bool
  priv mut x : LineData
  priv mut y : LineData
  priv mut cache : Line2DCache
  priv mut invalid_x : Bool
  priv mut invalid_y : Bool
  priv mut owner : Axes?
  priv mut removal_parent : Axes?
  priv mut visible : Bool
  priv mut stale : Bool
}

///|
fn line2d_cache_from_flat(values : Array[Double]) -> Line2DCache {
  let flat = @ticker.TickValues::from_array(values)
  let length = values.length() / 2
  // Builders supply an even, private buffer whose shape cannot be resized by
  // a borrowed TickValues. Empty views also accept their unused start value.
  { flat, xs: try! flat.view(0, 2, length), ys: try! flat.view(1, 2, length), }
}

///|
fn line2d_flat_length(length : Int32) -> Int32 raise @core.DataError {
  let cells = length.to_int64() * 2L
  if cells > 2147483647L {
    raise @core.DataError::InvalidTicks(
      message="ResourceError: Line Float64 cache exceeds Array addressability",
    )
  }
  cells.to_int()
}

///|
fn line2d_cache_from_points(
  points : Array[@core.Point],
) -> Line2DCache raise @core.DataError {
  let values = Array(capacity=line2d_flat_length(points.length()))
  for point in points {
    values.push(point.x())
    values.push(point.y())
  }
  line2d_cache_from_flat(values)
}

///|
/// Borrow the copied original x input without converting it.
pub fn Line2D::get_xdata(self : Line2D) -> LineData {
  self.x
}

///|
pub fn Line2D::get_ydata(self : Line2D) -> LineData {
  self.y
}

///|
pub fn Line2D::get_data(self : Line2D) -> (LineData, LineData) {
  (self.get_xdata(), self.get_ydata())
}

///|
/// Copy new x originals and invalidate only x; limits are updated separately.
pub fn Line2D::set_xdata(self : Line2D, values : LineData) -> Unit {
  self.x = values.copy()
  self.invalid_x = true
  self.stale = true
}

///|
pub fn Line2D::set_ydata(self : Line2D, values : LineData) -> Unit {
  self.y = values.copy()
  self.invalid_y = true
  self.stale = true
}

///|
pub fn Line2D::set_data(self : Line2D, x : LineData, y : LineData) -> Unit {
  self.set_xdata(x)
  self.set_ydata(y)
}

///|
pub fn Line2D::stale(self : Line2D) -> Bool {
  self.stale
}

///|
pub fn Line2D::get_visible(self : Line2D) -> Bool {
  self.visible
}

///|
/// Change drawing visibility without invalidating data or requesting new limits.
pub fn Line2D::set_visible(self : Line2D, visible : Bool) -> Unit {
  if self.visible != visible {
    self.visible = visible
    self.stale = true
  }
}

///|
pub fn Line2D::get_linewidth(self : Line2D) -> Double {
  self.style.width()
}

///|
pub fn Line2D::get_alpha(self : Line2D) -> Double? {
  self.style.line_alpha()
}

///|
/// Equal alpha values are a complete no-op, including the sign of stored zero.
pub fn Line2D::set_alpha(
  self : Line2D,
  alpha : Double?,
) -> Unit raise @core.DataError {
  if alpha is Some(value) && !(value >= 0.0 && value <= 1.0) {
    raise @core.DataError::InvalidTicks(
      message="ValueError: alpha (" +
        @ticker.python_float_repr(value) +
        ") is outside 0-1 range",
    )
  }
  let style = self.style
  let same = match (style.line_alpha(), alpha) {
    (None, None) => true
    (Some(previous), Some(next)) => previous == next
    _ => false
  }
  if same {
    return
  }
  self.style = @core.style(
    style.color(),
    width=style.width(),
    radius=style.radius(),
    fill=style.fill(),
    font_size=style.font_size(),
    marker=style.marker(),
    line_alpha=alpha,
  )
  self.stale = true
}

///|
/// Return the original color spelling, without resolving a color-cycle token.
pub fn Line2D::get_color(self : Line2D) -> String {
  self.style.color()
}

///|
/// Validate a source color and preserve its spelling for later drawing.
pub fn Line2D::set_color(
  self : Line2D,
  color : String,
) -> Unit raise @core.DataError {
  line_color_validate(color)
  let style = self.style
  self.style = @core.style(
    color,
    width=style.width(),
    radius=style.radius(),
    fill=style.fill(),
    font_size=style.font_size(),
    marker=style.marker(),
    line_alpha=style.line_alpha(),
  )
  self.source_color = true
  self.stale = true
}

///|
/// Set solid-line width, preserving every other appearance and data field.
pub fn Line2D::set_linewidth(self : Line2D, width : Double) -> Unit {
  let style = self.style
  if style.width() != width {
    self.stale = true
  }
  // Assignment is unconditional: equal signed zeroes still have distinct bits.
  self.style = @core.style(
    style.color(),
    width~,
    radius=style.radius(),
    fill=style.fill(),
    font_size=style.font_size(),
    marker=style.marker(),
    line_alpha=style.line_alpha(),
  )
}

///|
fn Line2D::detach(self : Line2D) -> Unit {
  self.owner = None
}

///|
// Clear only currently attached children through this operation. Ordinary
// remove deliberately retains its old removal binding for repeated errors.
fn Line2D::clear_attachment(self : Line2D) -> Unit {
  self.removal_parent = None
  self.detach()
}

///|
/// Remove this exact attached Line without recomputing limits or legend state.
pub fn Line2D::remove(self : Line2D) -> Unit raise @core.DataError {
  let parent = match self.removal_parent {
    Some(parent) => parent
    None =>
      raise @core.DataError::InvalidTicks(
        message="NotImplementedError: cannot remove artist",
      )
  }
  let artists = parent.state.val.artists
  let mut found = None
  for index in 0..<artists.length() {
    if artists[index] is Artist::Line(points, _) &&
      physical_equal(points, self.points) {
      found = Some(index)
      break
    }
  }
  guard found is Some(index) else {
    raise @core.DataError::InvalidTicks(
      message="ValueError: list.remove(x): x not in list",
    )
  }
  ignore(artists.remove(index))
  parent.state.val.line_originals.retain(line => !physical_equal(line, self))
  self.detach()
}

///|
fn Line2D::mark_drawn(self : Line2D) -> Unit {
  self.stale = false
}

///|
fn Line2D::convert_coordinate(
  self : Line2D,
  values : LineData,
  horizontal : Bool,
) -> Array[Double] raise @core.DataError {
  match self.owner {
    Some(axes) =>
      values.convert(if horizontal { axes.x_axis() } else { axes.y_axis() })
    None => values.convert_detached()
  }
}

///|
/// Rebuild one generation. Conversion side effects survive a later failure.
pub fn Line2D::recache_checked(
  self : Line2D,
  always~ : Bool = false,
) -> Unit raise @core.DataError {
  let xs = if always || self.invalid_x {
    @ticker.TickValues::from_array(self.convert_coordinate(self.x, true))
  } else {
    self.cache.xs
  }
  let ys = if always || self.invalid_y {
    @ticker.TickValues::from_array(self.convert_coordinate(self.y, false))
  } else {
    self.cache.ys
  }
  let length = if xs.length() == ys.length() {
    xs.length()
  } else if xs.length() == 1 {
    ys.length()
  } else if ys.length() == 1 {
    xs.length()
  } else {
    raise @core.DataError::InvalidTicks(
      message="shape mismatch: objects cannot be broadcast to a single shape.  Mismatch is between arg 0 with shape (\{xs.length()},) and arg 1 with shape (\{ys.length()},).",
    )
  }
  let values = Array(capacity=line2d_flat_length(length))
  for index in 0..<length {
    values.push(xs.get(if xs.length() == 1 { 0 } else { index }))
    values.push(ys.get(if ys.length() == 1 { 0 } else { index }))
  }
  self.cache = line2d_cache_from_flat(values)
  self.invalid_x = false
  self.invalid_y = false
  self.materialize_points()
}

///|
/// Borrow the current generation's x view, refreshing only when x is invalid.
pub fn Line2D::x_values_checked(
  self : Line2D,
) -> @ticker.TickValues raise @core.DataError {
  if self.invalid_x {
    self.recache_checked()
  }
  self.cache.xs
}

///|
pub fn Line2D::y_values_checked(
  self : Line2D,
) -> @ticker.TickValues raise @core.DataError {
  if self.invalid_y {
    self.recache_checked()
  }
  self.cache.ys
}

///|
/// Read x then y, preserving the possibility of two different generations.
pub fn Line2D::data_values_checked(
  self : Line2D,
) -> (@ticker.TickValues, @ticker.TickValues) raise @core.DataError {
  let xs = self.x_values_checked()
  let ys = self.y_values_checked()
  (xs, ys)
}

///|
/// Borrow flat interleaved [x0,y0,x1,y1,...] Float64 storage.
pub fn Line2D::xy_values_checked(
  self : Line2D,
) -> @ticker.TickValues raise @core.DataError {
  if self.invalid_x || self.invalid_y {
    self.recache_checked()
  }
  self.cache.flat
}

///|
fn Line2D::materialize_points(self : Line2D) -> Unit {
  self.points.clear()
  for index in 0..<self.cache.xs.length() {
    self.points.push(
      @core.point(try! self.cache.xs.get(index), try! self.cache.ys.get(index)),
    )
  }
}

///|
fn Line2D::points_snapshot_checked(
  self : Line2D,
) -> Array[@core.Point] raise @core.DataError {
  ignore(self.xy_values_checked())
  self.materialize_points()
  copy_points(self.points)
}

///|
fn LineData::update_initial_units(
  self : LineData,
  axis : @axis.Axis,
) -> Unit raise @core.DataError {
  if !axis.have_units() {
    match self {
      Numeric(_) => ()
      Category(values) => ignore(axis.update_category_units(values))
      Date(values) => ignore(axis.update_date_units(values))
    }
  }
}

///|
/// Attach a typed Line with the existing equal-length initial plot contract.
pub fn Axes::plot_line(
  self : Axes,
  x : LineData,
  y : LineData,
  color~ : String = "",
  label~ : String = "",
) -> Line2D raise @core.DataError {
  if x.length() != y.length() {
    raise @core.DataError::LengthMismatch(
      expected=x.length(),
      actual=y.length(),
    )
  }
  x.update_initial_units(self.x_axis())
  y.update_initial_units(self.y_axis())
  let xs = x.convert(self.x_axis())
  let ys = y.convert(self.y_axis())
  let points = @core.series(xs, ys).points()
  self.attach_line_handle(points, x, y, color~, label~)
}

///|
pub fn Figure::plot_line(
  self : Figure,
  x : LineData,
  y : LineData,
  color~ : String = "",
  label~ : String = "",
) -> Line2D raise @core.DataError {
  self.axes().plot_line(x, y, color~, label~)
}
