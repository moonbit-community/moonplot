///|
test "shared subplot axes synchronize limits and ticks" {
  let fig = @scene.figure(width=360, height=220)
  let axes = try! fig.subplots(1, 2, share_x=true, share_y=true)
  try! axes[0].set_x_limits(10.0, 0.0)
  try! axes[0].set_y_limits(5.0, -5.0)
  try! axes[0].set_x_ticks([10.0, 5.0, 0.0])
  try! axes[0].set_x_tick_labels(["ten", "five", "zero"])
  match (axes[1].x_limits(), axes[1].y_limits()) {
    (Some(x), Some(y)) => {
      assert_true(x.lower() == 10.0)
      assert_true(x.upper() == 0.0)
      assert_true(y.lower() == 5.0)
      assert_true(y.upper() == -5.0)
    }
    _ => fail("shared limits were not propagated")
  }
  axes[1].plot([0.0, 10.0], [-5.0, 5.0])
  assert_true(fig.to_svg().contains("ten"))
}

///|
test "grid sharing links rows and columns independently" {
  let fig = @scene.figure(width=360, height=240)
  let grid = try! fig.grid_spec(2, 2)
  let grid = grid.with_shared_axes(
    @gridspec.ShareMode::Row,
    @gridspec.ShareMode::Column,
  )
  let axes = try! fig.subplots_with_grid(grid)
  try! axes[0].set_x_limits(10.0, 0.0)
  try! axes[0].set_y_limits(5.0, -5.0)
  match
    (
      axes[1].x_limits(),
      axes[2].x_limits(),
      axes[2].y_limits(),
      axes[1].y_limits(),
    ) {
    (Some(row_x), None, Some(column_y), None) => {
      assert_true(row_x.lower() == 10.0)
      assert_true(row_x.upper() == 0.0)
      assert_true(column_y.lower() == 5.0)
      assert_true(column_y.upper() == -5.0)
    }
    _ => fail("GridSpec row/column sharing was not isolated")
  }
}

///|
test "all shared axes keep only outer primary tick labels" {
  let fig = @scene.figure(width=420, height=320)
  let axes = try! fig.subplots(2, 2, share_x=true, share_y=true)
  try! axes[0].set_x_ticks([0.0, 1.0])
  try! axes[0].set_x_tick_labels(["shared-zero", "shared-one"])
  try! axes[0].set_y_ticks([0.0, 1.0])
  try! axes[0].set_y_tick_labels(["shared-low", "shared-high"])
  for axis in axes {
    axis.plot([0.0, 1.0], [0.0, 1.0])
  }
  let svg = fig.to_svg()
  assert_eq(svg.split(">shared-zero<").count() - 1, 2)
  assert_eq(svg.split(">shared-one<").count() - 1, 2)
  assert_eq(svg.split(">shared-low<").count() - 1, 2)
  assert_eq(svg.split(">shared-high<").count() - 1, 2)
}

///|
test "figure coordinate setters synchronize all shared panels" {
  let fig = @scene.figure(width=420, height=320)
  let axes = try! fig.subplots(2, 2, share_x=true, share_y=true)
  fig.set_bounds(@core.bounds(0.0, 10.0, -2.0, 2.0))
  for axis in axes {
    assert_true(
      axis.x_limits() is Some(x) && x.lower() == 0.0 && x.upper() == 10.0,
    )
    assert_true(
      axis.y_limits() is Some(y) && y.lower() == -2.0 && y.upper() == 2.0,
    )
  }
  fig.set_x_limits(10.0, 0.0)
  fig.set_y_limits(2.0, -2.0)
  fig.set_x_ticks([0.0, 10.0])
  fig.set_y_ticks([-2.0, 2.0])
  fig.set_x_tick_labels(["figure-left", "figure-right"])
  fig.set_y_tick_labels(["figure-low", "figure-high"])
  for axis in axes {
    assert_true(
      axis.x_limits() is Some(x) && x.lower() == 10.0 && x.upper() == 0.0,
    )
    assert_true(
      axis.y_limits() is Some(y) && y.lower() == 2.0 && y.upper() == -2.0,
    )
  }
  let svg = fig.to_svg()
  assert_eq(svg.split(">figure-left<").count() - 1, 2)
  assert_eq(svg.split(">figure-right<").count() - 1, 2)
  assert_eq(svg.split(">figure-low<").count() - 1, 2)
  assert_eq(svg.split(">figure-high<").count() - 1, 2)
}

///|
test "replaced subplot handles cannot modify a new shared grid" {
  let fig = @scene.figure()
  let old_axes = fig.subplots(2, 2, share_x=true, share_y=true)
  let axes = fig.subplots(2, 2, share_x=true, share_y=true)
  old_axes[0].set_x_limits(10.0, 20.0)
  old_axes[0].set_y_limits(30.0, 40.0)
  old_axes[0].set_x_scale(@scale.log_scale())
  old_axes[0].set_y_scale(@scale.log_scale())
  old_axes[0].set_x_ticks([10.0])
  old_axes[0].set_x_tick_labels(["detached-x"])
  old_axes[0].set_y_ticks([30.0])
  old_axes[0].set_y_tick_labels(["detached-y"])
  for axis in axes {
    assert_true(axis.x_limits() is None)
    assert_true(axis.y_limits() is None)
    assert_true(!axis.x_scale().is_log())
    assert_true(!axis.y_scale().is_log())
  }
  assert_true(old_axes[0].x_limits() is Some(x) && x.lower() == 10.0)
  assert_true(old_axes[0].y_limits() is Some(y) && y.lower() == 30.0)
  let svg = fig.to_svg()
  assert_true(!svg.contains("detached-x"))
  assert_true(!svg.contains("detached-y"))
}

///|
test "manual subplots remain independent from configured shared grids" {
  let fig = @scene.figure()
  let grid = @gridspec.gridspec(2, 2).with_shared_axes(
    @gridspec.ShareMode::All,
    @gridspec.ShareMode::All,
  )
  let shared = fig.subplots_with_grid(grid)
  let manual = fig.add_subplot(grid.subplot(0, 2, 0, 1))
  shared[0].set_x_limits(1.0, 10.0)
  shared[0].set_y_limits(2.0, 20.0)
  assert_true(manual.x_limits() is None)
  assert_true(manual.y_limits() is None)
  manual.set_x_limits(-10.0, -1.0)
  manual.set_y_limits(-20.0, -2.0)
  for axis in shared {
    assert_true(axis.x_limits() is Some(x) && x.lower() == 1.0)
    assert_true(axis.y_limits() is Some(y) && y.lower() == 2.0)
  }
}

///|
test "shared scale changes respect independent row and column groups" {
  let fig = @scene.figure()
  let grid = @gridspec.gridspec(2, 2).with_shared_axes(
    @gridspec.ShareMode::Row,
    @gridspec.ShareMode::Column,
  )
  let axes = fig.subplots_with_grid(grid)
  axes[0].set_x_scale(@scale.log_scale())
  axes[0].set_y_scale(@scale.log_scale())
  assert_true(axes[1].x_scale().is_log())
  assert_true(!axes[2].x_scale().is_log())
  assert_true(axes[2].y_scale().is_log())
  assert_true(!axes[1].y_scale().is_log())
  assert_true(!axes[3].x_scale().is_log())
  assert_true(!axes[3].y_scale().is_log())
  try axes[1].set_x_limits(-1.0, 10.0) catch {
    @core.DataError::InvalidTicks(_) => ()
    _ => fail("expected invalid logarithmic limits")
  } noraise {
    _ => fail("expected a limit error")
  }
  for axis in axes {
    assert_true(axis.x_limits() is None)
  }
}
