///|
test "tick label visibility can be restored locally on a shared grid" {
  let fig = @scene.figure(width=420, height=320)
  let axes = fig.subplots(2, 2, share_x=true, share_y=true)
  axes[0].set_x_ticks([0.0])
  axes[0].set_x_tick_labels(["restore-x"])
  axes[0].set_y_ticks([0.0])
  axes[0].set_y_tick_labels(["restore-y"])
  axes[0].set_x_tick_labels_visible(true)
  axes[1].set_y_tick_labels_visible(true)
  let svg = fig.to_svg()
  assert_eq(svg.split(">restore-x<").count() - 1, 3)
  assert_eq(svg.split(">restore-y<").count() - 1, 3)
  axes[0].set_x_tick_labels_visible(false)
  axes[1].set_y_tick_labels_visible(false)
  let svg = fig.to_svg()
  assert_eq(svg.split(">restore-x<").count() - 1, 2)
  assert_eq(svg.split(">restore-y<").count() - 1, 2)
}

///|
test "row shared x and column shared y retain all labels" {
  let fig = @scene.figure(width=420, height=320)
  let grid = @gridspec.gridspec(2, 2).with_shared_axes(
    @gridspec.ShareMode::Row,
    @gridspec.ShareMode::Column,
  )
  let axes = fig.subplots_with_grid(grid)
  axes[0].set_x_ticks([0.0])
  axes[0].set_x_tick_labels(["row-zero"])
  axes[2].set_x_ticks([0.0])
  axes[2].set_x_tick_labels(["row-one"])
  axes[0].set_y_ticks([0.0])
  axes[0].set_y_tick_labels(["column-zero"])
  axes[1].set_y_ticks([0.0])
  axes[1].set_y_tick_labels(["column-one"])
  let svg = fig.to_svg()
  assert_eq(svg.split(">row-zero<").count() - 1, 2)
  assert_eq(svg.split(">row-one<").count() - 1, 2)
  assert_eq(svg.split(">column-zero<").count() - 1, 2)
  assert_eq(svg.split(">column-one<").count() - 1, 2)
}

///|
test "column shared x and row shared y label only the outside" {
  let fig = @scene.figure(width=420, height=320)
  let grid = @gridspec.gridspec(2, 2).with_shared_axes(
    @gridspec.ShareMode::Column,
    @gridspec.ShareMode::Row,
  )
  let axes = fig.subplots_with_grid(grid)
  axes[0].set_x_ticks([0.0])
  axes[0].set_x_tick_labels(["column-zero-x"])
  axes[1].set_x_ticks([0.0])
  axes[1].set_x_tick_labels(["column-one-x"])
  axes[0].set_y_ticks([0.0])
  axes[0].set_y_tick_labels(["row-zero-y"])
  axes[2].set_y_ticks([0.0])
  axes[2].set_y_tick_labels(["row-one-y"])
  let svg = fig.to_svg()
  assert_eq(svg.split(">column-zero-x<").count() - 1, 1)
  assert_eq(svg.split(">column-one-x<").count() - 1, 1)
  assert_eq(svg.split(">row-zero-y<").count() - 1, 1)
  assert_eq(svg.split(">row-one-y<").count() - 1, 1)
}
