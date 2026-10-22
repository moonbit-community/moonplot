///|
test "figure renders a vertical colorbar with gradient and ticks" {
  let norm = @colors.linear_color_norm(
    try! @colors.normalize(vmin=0.0, vmax=10.0),
  )
  let cmap = try! @colors.colormap("viridis")
  let fig = @scene.figure(width=320, height=240)
  let bar = fig.colorbar(norm, cmap)
  bar.set_label("intensity")
  let svg = fig.to_svg()
  assert_true(svg.contains("intensity"))
  assert_true(svg.contains("#440154"))
  assert_true(svg.contains("#fde725"))
  assert_true(svg.contains(">0<"))
  assert_true(svg.contains(">10<"))
}

///|
test "figure renders a horizontal colorbar" {
  let norm = @colors.linear_color_norm(
    try! @colors.normalize(vmin=-1.0, vmax=1.0),
  )
  let cmap = try! @colors.colormap("gray")
  let fig = @scene.figure(width=320, height=240)
  ignore(
    fig.colorbar(norm, cmap, orientation=@colorbar.Orientation::Horizontal),
  )
  let svg = fig.to_svg()
  assert_true(svg.contains(">-1<"))
  assert_true(svg.contains(">1<"))
}

///|
test "figure renders nonlinear colorbar normalizations" {
  let symlog = @colors.symlog_color_norm(
    try! @colors.symlog_norm(1.0, vmin=-100.0, vmax=100.0),
  )
  let two_slope = @colors.two_slope_color_norm(
    try! @colors.two_slope_norm(0.0, vmin=-4.0, vmax=10.0),
  )
  let cmap = try! @colors.colormap("viridis")
  let fig = @scene.figure(width=360, height=240)
  ignore(fig.colorbar(symlog, cmap))
  ignore(fig.colorbar(two_slope, cmap))
  let svg = fig.to_svg()
  assert_true(svg.contains(">-100<"))
  assert_true(svg.contains(">100<"))
  assert_true(svg.contains(">-4<"))
  assert_true(svg.contains(">10<"))
  assert_true(!svg.contains("NaN"))
  assert_true(!svg.contains("Infinity"))
}

///|
test "figure renders power and centered colorbars" {
  let power = @colors.power_color_norm(
    try! @colors.power_norm(2.0, vmin=0.0, vmax=4.0),
  )
  let centered = @colors.centered_color_norm(
    try! @colors.centered_norm(vcenter=0.0, halfrange=2.0),
  )
  let cmap = try! @colors.colormap("gray")
  let fig = @scene.figure(width=360, height=240)
  ignore(fig.colorbar(power, cmap))
  ignore(fig.colorbar(centered, cmap))
  let svg = fig.to_svg()
  assert_true(svg.contains(">0<"))
  assert_true(svg.contains(">4<"))
  assert_true(svg.contains(">-2<"))
  assert_true(svg.contains(">2<"))
  assert_true(!svg.contains("NaN"))
}

///|
test "figure renders a boundary colorbar without inversion" {
  let norm = @colors.boundary_color_norm(
    try! @colors.boundary_norm([0.0, 1.0, 2.0, 3.0], 4),
  )
  let cmap = try! @colors.listed_colormap("levels", [
    try! @colors.rgba(1.0, 0.0, 0.0),
    try! @colors.rgba(1.0, 1.0, 0.0),
    try! @colors.rgba(0.0, 1.0, 0.0),
    try! @colors.rgba(0.0, 0.0, 1.0),
  ])
  let fig = @scene.figure(width=320, height=240)
  ignore(fig.colorbar(norm, cmap))
  let svg = fig.to_svg()
  assert_true(svg.contains(">0<"))
  assert_true(svg.contains(">3<"))
  assert_true(!svg.contains("NotInvertible"))
}

///|
test "boundary colorbar draws extension triangles" {
  let norm = @colors.boundary_color_norm(
    try! @colors.boundary_norm([0.0, 1.0, 2.0], 4, extend_mode="both"),
  )
  let cmap = try! @colors.colormap("viridis")
  let fig = @scene.figure(width=320, height=240)
  ignore(fig.colorbar(norm, cmap))
  let svg = fig.to_svg()
  assert_true(svg.contains("<polygon"))
}
