///|
/// Set the x-axis scale on this axes and all axes sharing its x coordinate.
pub fn Axes::set_x_scale(
  self : Axes,
  value : @scale.Scale,
) -> Unit raise @core.DataError {
  for state in self.x_group_states() {
    state.val.x_axis.set_scale(value)
  }
}

///|
/// Set the y-axis scale on this axes and all axes sharing its y coordinate.
pub fn Axes::set_y_scale(
  self : Axes,
  value : @scale.Scale,
) -> Unit raise @core.DataError {
  for state in self.y_group_states() {
    state.val.y_axis.set_scale(value)
  }
}

///|
/// Set the x-axis scale on the default axes.
pub fn Figure::set_x_scale(
  self : Figure,
  value : @scale.Scale,
) -> Unit raise @core.DataError {
  self.axes().set_x_scale(value)
}

///|
/// Set the y-axis scale on the default axes.
pub fn Figure::set_y_scale(
  self : Figure,
  value : @scale.Scale,
) -> Unit raise @core.DataError {
  self.axes().set_y_scale(value)
}

///|
/// Return the current x-axis scale.
pub fn Axes::x_scale(self : Axes) -> @scale.Scale {
  self.state.val.x_axis.scale()
}

///|
/// Return the current y-axis scale.
pub fn Axes::y_scale(self : Axes) -> @scale.Scale {
  self.state.val.y_axis.scale()
}

///|
/// Add a plot with logarithmic x and y coordinates.
pub fn Axes::loglog(
  self : Axes,
  xs : Array[Double],
  ys : Array[Double],
  color~ : String = "",
  label~ : String = "",
) -> Unit raise @core.DataError {
  self.set_x_scale(@scale.log_scale())
  self.set_y_scale(@scale.log_scale())
  self.plot(xs, ys, color~, label~)
}

///|
/// Add a plot with a logarithmic x coordinate and linear y coordinate.
pub fn Axes::semilogx(
  self : Axes,
  xs : Array[Double],
  ys : Array[Double],
  color~ : String = "",
  label~ : String = "",
) -> Unit raise @core.DataError {
  self.set_x_scale(@scale.log_scale())
  self.plot(xs, ys, color~, label~)
}

///|
/// Add a plot with a linear x coordinate and logarithmic y coordinate.
pub fn Axes::semilogy(
  self : Axes,
  xs : Array[Double],
  ys : Array[Double],
  color~ : String = "",
  label~ : String = "",
) -> Unit raise @core.DataError {
  self.set_y_scale(@scale.log_scale())
  self.plot(xs, ys, color~, label~)
}

///|
/// Add a plot with logarithmic x and y coordinates to the default axes.
pub fn Figure::loglog(
  self : Figure,
  xs : Array[Double],
  ys : Array[Double],
  color~ : String = "",
  label~ : String = "",
) -> Unit raise @core.DataError {
  self.axes().loglog(xs, ys, color~, label~)
}

///|
/// Add a plot with a logarithmic x coordinate to the default axes.
pub fn Figure::semilogx(
  self : Figure,
  xs : Array[Double],
  ys : Array[Double],
  color~ : String = "",
  label~ : String = "",
) -> Unit raise @core.DataError {
  self.axes().semilogx(xs, ys, color~, label~)
}

///|
/// Add a plot with a logarithmic y coordinate to the default axes.
pub fn Figure::semilogy(
  self : Figure,
  xs : Array[Double],
  ys : Array[Double],
  color~ : String = "",
  label~ : String = "",
) -> Unit raise @core.DataError {
  self.axes().semilogy(xs, ys, color~, label~)
}
