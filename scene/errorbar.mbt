///|
fn validate_error_values(values : Array[Double]) -> Unit raise @core.DataError {
  for value in values {
    if value.is_nan() || value.is_inf() || value < 0.0 {
      raise @core.DataError::InvalidErrorBar(
        message="error values must be finite and non-negative",
      )
    }
  }
}

///|
/// Add a line with optional symmetric x/y error bars.
///
/// An empty error array disables that direction; otherwise its length must
/// match the x/y sample count.
pub fn Figure::errorbar(
  self : Figure,
  xs : Array[Double],
  ys : Array[Double],
  yerr~ : Array[Double] = [],
  xerr~ : Array[Double] = [],
  color~ : String = "",
  label~ : String = "",
) -> Unit raise @core.DataError {
  self.axes().errorbar(xs, ys, yerr~, xerr~, color~, label~)
}

///|
/// Add error bars through the axes view.
pub fn Axes::errorbar(
  self : Axes,
  xs : Array[Double],
  ys : Array[Double],
  yerr~ : Array[Double] = [],
  xerr~ : Array[Double] = [],
  color~ : String = "",
  label~ : String = "",
) -> Unit raise @core.DataError {
  let values = @core.series(xs, ys)
  let points = values.points()
  if yerr.length() != 0 && yerr.length() != points.length() {
    raise @core.DataError::LengthMismatch(
      expected=points.length(),
      actual=yerr.length(),
    )
  }
  if xerr.length() != 0 && xerr.length() != points.length() {
    raise @core.DataError::LengthMismatch(
      expected=points.length(),
      actual=xerr.length(),
    )
  }
  validate_error_values(yerr)
  validate_error_values(xerr)
  let resolved_color = self.resolve_color(color)
  let start = self.state.val.artists.length()
  self.push_artist(
    Artist::ErrorBar(
      points,
      yerr.copy(),
      xerr.copy(),
      @core.style(resolved_color),
    ),
  )
  self.add_auto_legend(label, resolved_color, LegendKind::Line)
  self.add_container(ContainerKind::ErrorBar, start, label)
}
