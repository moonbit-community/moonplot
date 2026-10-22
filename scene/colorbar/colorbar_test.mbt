///|
test "colorbar stores normalization, colormap, label, and orientation" {
  let norm = @colors.linear_color_norm(
    try! @colors.normalize(vmin=0.0, vmax=10.0),
  )
  let cmap = try! @colors.colormap("viridis")
  let bar = @colorbar.colorbar(
    norm,
    cmap,
    orientation=@colorbar.Orientation::Horizontal,
  )
  assert_true(bar.norm().scaled())
  assert_eq(bar.cmap().name(), "viridis")
  assert_true(bar.orientation() is @colorbar.Orientation::Horizontal)
  bar.set_label("value")
  assert_eq(bar.label(), Some("value"))
  bar.set_tick_count(1)
  assert_eq(bar.tick_count(), 2)
}
