///|
test "matplotlib object aliases preserve shared axes and positions" {
  let fig = @scene.figure(width=360, height=240)
  let axes = try! fig.subplots(1, 2, share_x=true)
  axes[0].set_xlabel("time")
  axes[0].set_ylabel("value")
  axes[0].set_title("left")
  try! axes[0].set_xlim(10.0, 0.0)
  try! axes[0].set_xticks([0.0, 5.0, 10.0])
  try! axes[0].set_xticklabels(["zero", "five", "ten"])
  assert_eq(axes[0].get_xlabel(), Some("time"))
  assert_eq(axes[0].get_ylabel(), Some("value"))
  assert_eq(axes[0].get_title(), Some("left"))
  match (axes[0].get_xlim(), axes[1].get_xlim()) {
    (Some(first), Some(second)) => {
      assert_eq(first.lower(), second.lower())
      assert_eq(first.upper(), second.upper())
    }
    _ => fail("expected shared x limits")
  }
  match (axes[0].get_position(), axes[0].rect()) {
    (Some(first), Some(second)) => {
      assert_true((first.x() * 360.0 - second.x()).abs() < 1.0e-10)
      assert_true((first.width() * 360.0 - second.width()).abs() < 1.0e-10)
    }
    _ => fail("expected axes position")
  }
  match axes[0].get_subplotspec() {
    Some(spec) => assert_eq(spec.get_geometry(), (1, 2, 0, 0))
    None => fail("subplots should expose a spec")
  }
  assert_eq(fig.get_axes().length(), 2)
  fig.suptitle("all panels")
  assert_eq(fig.title(), Some("all panels"))
}

///|
test "matplotlib aliases expose autoscale margins" {
  let fig = @scene.figure()
  let axes = fig.axes()
  try! axes.set_xmargin(0.0)
  try! axes.set_ymargin(0.25)
  assert_eq(axes.get_margins(), (0.0, 0.25))
  try! fig.set_xmargin(0.1)
  try! fig.set_ymargin(0.2)
  assert_eq(fig.margins(), (0.1, 0.2))
  try! axes.autoscale_view(tight=true)
  assert_eq(axes.get_margins(), (0.0, 0.0))
}

///|
test "matplotlib aliases expose nested subplot specifications" {
  let fig = @scene.figure(width=360, height=240)
  let outer = try! fig.grid_spec(1, 1)
  let inner = try! outer.cell_spec(0, 0).subgridspec(1, 2)
  let ax = fig.add_subplot(try! inner.cell_spec(0, 1))
  match ax.get_subplotspec() {
    Some(spec) => {
      assert_true(spec.is_last_col())
      assert_eq(spec.get_gridspec().geometry(), (1, 2))
      assert_eq(spec.get_topmost_subplotspec().get_geometry(), (1, 1, 0, 0))
    }
    None => fail("expected a nested subplot specification")
  }
  assert_eq(ax.get_figure().width(), fig.width())
}
