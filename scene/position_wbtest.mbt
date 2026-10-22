///|
fn active_position_values(ax : Axes) -> (Double, Double, Double, Double) {
  let r = ax.state.val.active_position.unwrap()
  (r.x(), r.y(), r.width(), r.height())
}

///|
test "position state separates original active reset and draw" {
  let fig = figure(width=400, height=200)
  let ax = fig.add_axes(0.25, 0.25, 0.5, 0.5)
  ax.set_xlim(0.0, 1.0)
  ax.set_ylim(0.0, 1.0)
  ax.set_position(0.0, 0.0, 0.25, 0.25, which="active")
  assert_eq(active_position_values(ax), (0.0, 150.0, 100.0, 50.0))
  ignore(ax.get_position(original=true))
  assert_eq(active_position_values(ax), (0.0, 150.0, 100.0, 50.0))
  ax.reset_position()
  assert_eq(active_position_values(ax), (100.0, 50.0, 200.0, 100.0))
  ax.set_position(0.125, 0.25, 0.5, 0.5, which="original")
  assert_eq(active_position_values(ax), (100.0, 50.0, 200.0, 100.0))
  ignore(ax.get_position())
  assert_eq(active_position_values(ax), (50.0, 50.0, 200.0, 100.0))
  ax.set_aspect_equal()
  ignore(fig.to_svg())
  assert_eq(active_position_values(ax), (100.0, 50.0, 100.0, 100.0))
  ax.reset_position()
  assert_eq(active_position_values(ax), (50.0, 50.0, 200.0, 100.0))
  ignore(ax.get_position())
  assert_eq(active_position_values(ax), (100.0, 50.0, 100.0, 100.0))
  ax.set_position(0.0, 0.0, 0.25, 0.25, which="active")
  ax.set_aspect_auto()
  ignore(fig.to_svg())
  assert_eq(active_position_values(ax), (50.0, 50.0, 200.0, 100.0))
}
