///|
test "subfigure creates nested subplot axes" {
  let fig = @scene.figure(width=420, height=300)
  let outer = try! fig.grid_spec(1, 2, width_ratios=[1.0, 2.0])
  let subfigure = fig.add_subfigure(try! outer.cell_spec(0, 1))
  let axes = try! subfigure.subplots(2, 1, hspace=0.2)
  axes[0].plot([0.0, 1.0], [0.0, 1.0])
  axes[1].scatter([@core.point(0.5, 0.5)])
  assert_eq(axes.length(), 2)
  assert_eq(subfigure.axes_list().length(), 2)
  match (subfigure.rect(), axes[0].rect(), axes[1].rect()) {
    (container, Some(first), Some(second)) => {
      assert_true(first.x() >= container.x())
      assert_true(first.y() >= container.y())
      assert_true(
        first.x() + first.width() <= container.x() + container.width(),
      )
      assert_true(second.y() > first.y())
    }
    _ => fail("expected nested subplot rectangles")
  }
  let svg = fig.to_svg()
  assert_true(svg.contains("<polyline"))
  assert_true(svg.contains("<circle"))
}

///|
test "subfigure handles share axes state" {
  let fig = @scene.figure(width=320, height=240)
  let grid = try! fig.grid_spec(1, 1)
  let original = fig.add_subfigure(try! grid.cell_spec(0, 0))
  let axes = try! original.subplots(1, 2)
  let returned = fig.subfigures()
  assert_eq(returned.length(), 1)
  assert_eq(returned[0].axes_list().length(), 2)
  axes[0].set_title("left")
  match returned[0].axes_list()[0].title() {
    Some(title) => assert_eq(title, "left")
    None => fail("expected shared axes title")
  }
}

///|
test "subfigure clear removes artists and title" {
  let fig = @scene.figure()
  let grid = try! fig.grid_spec(1, 1)
  let subfigure = fig.add_subfigure(try! grid.cell_spec(0, 0))
  let axes = try! subfigure.subplots(1, 1)
  subfigure.set_title("nested")
  axes[0].plot([0.0, 1.0], [0.0, 1.0])
  subfigure.clear()
  assert_eq(subfigure.title(), None)
  assert_eq(subfigure.axes_list().length(), 1)
  assert_eq(subfigure.axes_list()[0].artists().length(), 0)
}

///|
test "figure clear invalidates nested figure presentation state" {
  let fig = @scene.figure()
  let grid = try! fig.grid_spec(1, 1)
  let subfigure = fig.add_subfigure(try! grid.cell_spec(0, 0))
  let axes = try! subfigure.subplots(1, 1)
  subfigure.set_title("old nested title")
  axes[0].plot([0.0, 1.0], [0.0, 1.0])
  fig.clear()
  assert_eq(fig.subfigures().length(), 0)
  assert_eq(subfigure.title(), None)
  assert_eq(subfigure.axes_list()[0].artists().length(), 0)
}

///|
test "subfigure rectangle follows parent ratio updates" {
  let fig = @scene.figure(width=400, height=260)
  let outer = try! fig.grid_spec(1, 2, width_ratios=[1.0, 1.0])
  let subfigure = fig.add_subfigure(try! outer.cell_spec(0, 1))
  let before = subfigure.rect()
  try! outer.set_width_ratios([3.0, 1.0])
  let after = subfigure.rect()
  assert_true(after.x() > before.x())
  assert_true(after.width() < before.width())
}

///|
test "subplots_adjust propagates both spacing directions through subfigures" {
  let fig = @scene.figure(width=400, height=400)
  let grid = try! fig.grid_spec(2, 2, hspace=0.0)
  let subfigure = fig.add_subfigure(grid.cell_spec(1, 0))
  let axes = try! subfigure.subplots(2, 2)
  try! fig.subplots_adjust(
    left=0.125,
    bottom=0.125,
    right=0.875,
    top=0.875,
    wspace=1.0,
    hspace=0.5,
  )
  let container = subfigure.rect()
  assert_eq(
    (container.x(), container.y(), container.width(), container.height()),
    (50.0, 230.0, 150.0, 120.0),
  )
  let last = axes[3].rect().unwrap()
  assert_eq(
    (last.x(), last.y(), last.width(), last.height()),
    (150.0, 302.0, 50.0, 48.0),
  )
  try! fig.subplots_adjust(hspace=0.0)
  assert_eq(fig.subplot_bounds(), (0.125, 0.125, 0.875, 0.875))
  let last = axes[3].rect().unwrap()
  assert_eq(
    (last.x(), last.y(), last.width(), last.height()),
    (150.0, 275.0, 50.0, 75.0),
  )
}

///|
test "subfigure title is rendered in SVG" {
  let fig = @scene.figure(width=320, height=240)
  let grid = try! fig.grid_spec(1, 1)
  let subfigure = fig.add_subfigure(try! grid.cell_spec(0, 0))
  subfigure.suptitle("Nested title")
  let svg = fig.to_svg()
  assert_true(svg.contains("Nested title"))
}

///|
test "subfigures can contain nested subfigures" {
  let fig = @scene.figure(width=420, height=280)
  let outer_grid = try! fig.grid_spec(1, 1)
  let outer = fig.add_subfigure(try! outer_grid.cell_spec(0, 0))
  let child_grid = try! outer.subplot_spec().subgridspec(1, 2)
  let child = outer.add_subfigure(try! child_grid.cell_spec(0, 1))
  child.suptitle("Child title")
  let axes = try! child.subplots(1, 1)
  axes[0].plot([0.0, 1.0], [1.0, 0.0])
  assert_eq(fig.subfigures().length(), 1)
  assert_eq(outer.subfigures().length(), 1)
  assert_eq(outer.subfigures()[0].axes_list().length(), 1)
  let svg = fig.to_svg()
  assert_true(svg.contains("Child title"))
  assert_true(svg.contains("<polyline"))
}

///|
test "subfigure subplots support shared axes" {
  let fig = @scene.figure(width=420, height=280)
  let grid = try! fig.grid_spec(1, 1)
  let subfigure = fig.add_subfigure(try! grid.cell_spec(0, 0))
  let axes = try! subfigure.subplots(2, 2, share_x=true, share_y=true)
  try! axes[0].set_x_limits(0.0, 10.0)
  try! axes[3].set_y_limits(-2.0, 2.0)
  for ax in axes {
    match (ax.x_limits(), ax.y_limits()) {
      (Some(x), Some(y)) => {
        assert_eq((x.lower(), x.upper()), (0.0, 10.0))
        assert_eq((y.lower(), y.upper()), (-2.0, 2.0))
      }
      _ => fail("expected shared nested limits")
    }
  }
}
