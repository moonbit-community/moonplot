///|
fn datalim_fixture() -> (@scene.Figure, @scene.Axes) raise {
  let fig = @scene.figure(width=400, height=200)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  ax.plot([0.0, 1.0], [0.0, 1.0], color="#123456")
  ax.set_xlim(0.0, 1.0)
  ax.set_ylim(0.0, 1.0)
  (fig, ax)
}

///|
fn assert_datalim_view(
  ax : @scene.Axes,
  x : (Double, Double),
  y : (Double, Double),
) -> Unit raise {
  let xv = ax.get_xlim().unwrap()
  let yv = ax.get_ylim().unwrap()
  assert_true((xv.lower() - x.0).abs() < 1.0e-10)
  assert_true((xv.upper() - x.1).abs() < 1.0e-10)
  assert_true((yv.lower() - y.0).abs() < 1.0e-10)
  assert_true((yv.upper() - y.1).abs() < 1.0e-10)
}

///|
test "datalim adjusts explicit views while box placement and original remain unchanged" {
  let (fig, ax) = datalim_fixture()
  ax.set_aspect(1.0, adjustable="datalim", anchor=@scene.Anchor::Named("SW"))
  assert_position(ax, (0.0, 0.0, 1.0, 1.0), original=true)
  assert_datalim_view(ax, (0.0, 1.0), (0.0, 1.0))
  ax.apply_aspect()
  assert_datalim_view(ax, (-0.5, 1.5), (0.0, 1.0))
  assert_position(ax, (0.0, 0.0, 1.0, 1.0))
  assert_eq(ax.get_adjustable(), "datalim")
  let svg = fig.to_svg_checked()
  assert_true(svg.contains("points=\"100,200 300,0\""))
  assert_eq(svg, fig.to_svg())
  ax.set_anchor(@scene.Anchor::Named("NE"))
  assert_eq(fig.to_svg_checked(), svg)
  assert_eq(fig.x_limits().unwrap().lower(), -0.5)
}

///|
test "numeric datalim handles x and y expansion and box mode transitions" {
  let (_, ax) = datalim_fixture()
  ax.set_adjustable("datalim")
  ax.set_aspect(2.0)
  ax.apply_aspect()
  assert_datalim_view(ax, (-1.5, 2.5), (0.0, 1.0))
  ax.set_adjustable("box")
  ax.set_xlim(0.0, 1.0)
  assert_position(ax, (0.375, 0.0, 0.25, 1.0))
  ax.set_aspect(0.25, adjustable="datalim")
  ax.apply_aspect()
  assert_datalim_view(ax, (0.0, 1.0), (-0.5, 1.5))
  assert_position(ax, (0.0, 0.0, 1.0, 1.0))
}

///|
test "datalim automatic views remain automatic and update with data and margins" {
  let fig = @scene.figure(width=400, height=200)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  ax.plot([0.0, 1.0], [0.0, 1.0])
  ax.set_margins(0.0, 0.0)
  ax.set_aspect(1.0, adjustable="datalim")
  ax.apply_aspect()
  assert_true(ax.x_axis().limits() is None && ax.y_axis().limits() is None)
  assert_datalim_view(ax, (-0.5, 1.5), (0.0, 1.0))
  ax.plot([0.0, 4.0], [0.0, 1.0])
  assert_true(ax.get_xlim() is None)
  ax.apply_aspect()
  assert_datalim_view(ax, (0.0, 4.0), (-0.5, 1.5))
  ax.set_margins(0.25, 0.0)
  ax.apply_aspect()
  assert_datalim_view(ax, (-1.0, 5.0), (-1.0, 2.0))
  assert_true(ax.x_axis().limits() is None && ax.y_axis().limits() is None)
}

///|
test "datalim margin heuristic shrinks a view with excess room" {
  let fig = @scene.figure(width=400, height=200)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  ax.plot([1.9, 2.1], [0.4, 0.6])
  ax.set_xlim(0.0, 4.0)
  ax.set_ylim(0.0, 1.0)
  ax.set_aspect(1.0, adjustable="datalim")
  ax.apply_aspect()
  assert_datalim_view(ax, (1.0, 3.0), (0.0, 1.0))
}

///|
test "datalim empty data and half percent tolerance follow upstream choices" {
  let fig = @scene.figure(width=400, height=200)
  let empty = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  empty.set_xlim(0.0, 1.0)
  empty.set_ylim(0.0, 1.0)
  empty.set_aspect(1.0, adjustable="datalim")
  empty.apply_aspect()
  assert_datalim_view(empty, (0.0, 1.0), (0.25, 0.75))
  let (_, ax) = datalim_fixture()
  ax.set_xlim(0.0, 2.001)
  ax.set_aspect(1.0, adjustable="datalim")
  ax.apply_aspect()
  assert_datalim_view(ax, (0.0, 2.001), (0.0, 1.0))
  ax.set_xlim(0.0, 2.02)
  ax.apply_aspect()
  assert_datalim_view(ax, (0.0, 2.02), (-0.005, 1.005))
}

///|
test "datalim preserves reversed directions and repeated reads are idempotent" {
  let (fig, ax) = datalim_fixture()
  ax.set_xlim(1.0, 0.0)
  ax.set_ylim(1.0, 0.0)
  ax.set_aspect(1.0, adjustable="datalim")
  ignore(ax.get_position())
  assert_datalim_view(ax, (1.5, -0.5), (1.0, 0.0))
  let svg = fig.to_svg_checked()
  assert_true(svg.contains("points=\"300,0 100,200\""))
  for _ in 0..<3 {
    ignore(ax.get_position())
    ax.apply_aspect()
    assert_eq(fig.to_svg_checked(), svg)
    assert_datalim_view(ax, (1.5, -0.5), (1.0, 0.0))
  }
}

///|
test "datalim adjusts logarithmic views in transformed coordinates" {
  let fig = @scene.figure(width=400, height=200)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  ax.set_x_scale(@scale.log_scale())
  ax.set_xlim(1.0, 100.0)
  ax.set_ylim(0.0, 1.0)
  ax.plot([1.0, 100.0], [0.0, 1.0])
  ax.set_aspect(2.0, adjustable="datalim")
  ax.apply_aspect()
  assert_datalim_view(ax, (0.1, 1000.0), (0.0, 1.0))
  assert_true(fig.to_svg_checked().contains("points=\"100,200 300,0\""))
}

///|
test "datalim symmetric log views preserve scale ratios across zero" {
  let fig = @scene.figure(width=400, height=200)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  let scale = @scale.symlog_scale()
  ax.set_x_scale(scale)
  ax.set_y_scale(scale)
  ax.set_xlim(-10.0, 10.0)
  ax.set_ylim(-10.0, 10.0)
  ax.plot([-10.0, 10.0], [-10.0, 10.0])
  ax.set_aspect(1.0, adjustable="datalim")
  ax.apply_aspect()
  let x = ax.get_xlim().unwrap()
  let y = ax.get_ylim().unwrap()
  let xs = scale.transform(x.upper()) - scale.transform(x.lower())
  let ys = scale.transform(y.upper()) - scale.transform(y.lower())
  assert_true((ys / xs - 0.5).abs() < 1.0e-12)
  assert_eq(y.lower(), -10.0)
  assert_eq(y.upper(), 10.0)
  assert_true(!fig.to_svg_checked().contains("NaN"))
}

///|
test "shared x datalim changes only local y including logarithmic shrink" {
  let fig = @scene.figure(width=400, height=200)
  let axes = fig.subplots(1, 2, share_x=true)
  for ax in axes {
    ax.set_position(0.0, 0.0, 1.0, 1.0)
    ax.set_y_scale(@scale.log_scale())
    ax.set_ylim(1.0, 100.0)
    ax.plot([1.0, 100.0], [1.0, 100.0])
  }
  axes[0].set_x_scale(@scale.log_scale())
  axes[0].set_xlim(1.0, 100.0)
  axes[0].set_aspect(1.0, adjustable="datalim", share=true)
  ignore(fig.to_svg_checked())
  for ax in axes {
    assert_eq(ax.get_xlim().unwrap().lower(), 1.0)
    assert_eq(ax.get_xlim().unwrap().upper(), 100.0)
    let y = ax.get_ylim().unwrap()
    assert_true((y.lower() - 3.1622776601683795).abs() < 1.0e-10)
    assert_true((y.upper() - 31.622776601683793).abs() < 1.0e-10)
  }
}

///|
test "shared y datalim permits different local x aspect views" {
  let fig = @scene.figure(width=400, height=200)
  let axes = fig.subplots(1, 2, share_y=true)
  for ax in axes {
    ax.set_position(0.0, 0.0, 1.0, 1.0)
    ax.plot([0.0, 1.0], [0.0, 1.0])
    ax.set_xlim(0.0, 1.0)
  }
  axes[0].set_ylim(0.0, 1.0)
  axes[0].set_aspect(2.0, adjustable="datalim")
  axes[1].set_aspect(0.5, adjustable="datalim")
  ignore(fig.to_svg_checked())
  assert_datalim_view(axes[0], (-1.5, 2.5), (0.0, 1.0))
  assert_datalim_view(axes[1], (0.0, 1.0), (0.0, 1.0))
}

///|
test "adjustable validation is atomic for modes combined settings sharing and empty figures" {
  let fig = @scene.figure()
  let axes = fig.subplots(2, 2, share_x=true, share_y=true)
  axes[0].set_anchor(@scene.Anchor::Named("SW"))
  for mode in ["unknown", "DATALIM", "", "datalim"] {
    try
      axes[0].set_aspect(
        2.0,
        adjustable=mode,
        anchor=@scene.Anchor::Named("NE"),
        share=true,
      )
    catch {
      @core.DataError::InvalidReference(_) => ()
      _ => fail("expected invalid adjustable")
    } noraise {
      _ => fail("expected invalid adjustable")
    }
    assert_true(axes[0].get_aspect() is None)
    assert_true(axes[0].get_anchor() is @scene.Anchor::Named("SW"))
    for ax in axes {
      assert_eq(ax.get_adjustable(), "box")
    }
  }
  let empty = @scene.figure()
  empty.axes().remove()
  try empty.set_adjustable("bad") catch {
    @core.DataError::InvalidReference(_) => ()
    _ => fail("expected invalid mode")
  } noraise {
    _ => fail("expected invalid mode")
  }
  try empty.set_aspect(1.0, adjustable="bad") catch {
    @core.DataError::InvalidReference(_) => ()
    _ => fail("expected invalid mode")
  } noraise {
    _ => fail("expected invalid mode")
  }
  assert_eq(empty.axes_list().length(), 0)
}

///|
test "share inherits origin adjustable and validates every direct sibling before writes" {
  let fig = @scene.figure()
  let grid = fig
    .grid_spec(2, 2)
    .with_shared_axes(@gridspec.ShareMode::Row, @gridspec.ShareMode::Column)
  let axes = fig.subplots_with_grid(grid)
  axes[2].remove()
  axes[0].set_adjustable("datalim")
  try axes[0].set_aspect(2.0, share=true) catch {
    @core.DataError::InvalidReference(_) => ()
    _ => fail("expected a sibling with both axes shared")
  } noraise {
    _ => fail("expected shared sibling error")
  }
  assert_true(axes[0].get_aspect() is None && axes[1].get_aspect() is None)
  assert_eq(axes[0].get_adjustable(), "datalim")
  assert_eq(axes[1].get_adjustable(), "box")
  axes[3].remove()
  axes[0].set_aspect(2.0, share=true)
  assert_eq(axes[1].get_adjustable(), "datalim")
  axes[0].set_aspect(1.0, adjustable="box", share=true)
  assert_eq(axes[1].get_adjustable(), "box")
}

///|
test "checked drawing preflights every datalim view before changing any panel" {
  let (fig, first) = datalim_fixture()
  first.set_aspect(1.0, adjustable="datalim")
  let second = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  second.set_x_scale(@scale.log_scale())
  second.set_y_scale(@scale.log_scale())
  second.set_xlim(1.0, 10.0)
  second.set_ylim(1.0, 10.0)
  second.plot([1.0, 10.0], [1.0, 10.0])
  second.set_aspect(1.0e308, adjustable="datalim")
  try fig.to_svg_checked() catch {
    @core.DataError::InvalidReference(_) => ()
    _ => fail("expected unrepresentable view")
  } noraise {
    _ => fail("expected unrepresentable view")
  }
  assert_datalim_view(first, (0.0, 1.0), (0.0, 1.0))
  assert_datalim_view(second, (1.0, 10.0), (1.0, 10.0))
  assert_true(second.get_position() is None)
  try second.apply_aspect() catch {
    @core.DataError::InvalidReference(_) => ()
    _ => fail("expected unrepresentable view")
  } noraise {
    _ => fail("expected unrepresentable view")
  }
  second.set_aspect(1.0, adjustable="box")
  ignore(fig.to_svg_checked())
  assert_datalim_view(first, (-0.5, 1.5), (0.0, 1.0))
}

///|
test "adjustable survives clear detached setters stay isolated and apply rejects stale handles" {
  let (fig, ax) = datalim_fixture()
  ax.set_aspect(1.0, adjustable="datalim")
  ax.clear()
  assert_eq(ax.get_adjustable(), "datalim")
  assert_true(ax.get_aspect() is None)
  let next = fig.subplots(1, 1)[0]
  assert_eq(next.get_adjustable(), "box")
  ax.set_adjustable("datalim", share=true)
  assert_eq(next.get_adjustable(), "box")
  try ax.apply_aspect() catch {
    @core.DataError::InvalidReference(_) => ()
    _ => fail("expected detached axes")
  } noraise {
    _ => fail("expected detached axes")
  }
}

///|
test "datalim zero size boxes keep view finite and automatic aspect does not adjust limits" {
  let (_, ax) = datalim_fixture()
  ax.set_adjustable("datalim")
  ax.apply_aspect()
  assert_datalim_view(ax, (0.0, 1.0), (0.0, 1.0))
  ax.set_aspect(1.0)
  for size in [(0.0, 1.0), (1.0, 0.0), (0.0, 0.0)] {
    ax.set_position(0.0, 0.0, size.0, size.1)
    ax.apply_aspect()
    assert_datalim_view(ax, (0.0, 1.0), (0.0, 1.0))
    assert_position(ax, (0.0, 0.0, size.0, size.1))
  }
}

///|
test "datalim streamplot arrowheads use resolved view units for display sizes" {
  let fig = @scene.figure(width=4000, height=2000)
  let axes = fig.subplots(1, 2, share_x=true)
  let ax = axes[0]
  ax.set_position(0.0, 0.0, 1.0, 1.0)
  ax.set_xlim(0.0, 1.0)
  ax.set_ylim(0.0, 1.0)
  ax.set_aspect(1.0, adjustable="datalim")
  let result = ax.streamplot(
    [0.0, 1.0],
    [0.0, 1.0],
    [[1.0, 1.0], [1.0, 1.0]],
    [[0.0, 0.0], [0.0, 0.0]],
    start_points=[@core.point(0.25, 0.5)],
    arrows=true,
    arrowstyle="-|>",
    num_arrows=1,
    max_steps=4,
    minlength=0.0,
  )
  guard result.arrows()[0] is @scene.Artist::Polygon(points, _) else {
    fail("expected arrowhead")
  }
  let x = ax.get_xlim().unwrap()
  let y = ax.get_ylim().unwrap()
  let length = (points[1].x() - (points[0].x() + points[2].x()) / 2.0).abs() *
    4000.0 /
    (x.upper() - x.lower())
  let width = (points[0].y() - points[2].y()).abs() *
    2000.0 /
    (y.upper() - y.lower())
  assert_true((length - 10.0).abs() < 1.0e-10)
  assert_true((width - 6.5).abs() < 1.0e-10)
}

///|
test "datalim images keep automatic selection while PNG and overlays share the view" {
  let fig = @scene.figure(width=400, height=200)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  ax.imshow(
    [[0.0, 1.0], [1.0, 0.0]],
    extent=[0.0, 1.0, 0.0, 1.0],
    origin="lower",
    interpolation="none",
  )
  ax.set_aspect(1.0, adjustable="datalim")
  ax.plot([0.0, 1.0], [0.0, 1.0])
  ax.set_margins(0.0, 0.0)
  let svg = fig.to_svg_checked()
  assert_position(ax, (0.0, 0.0, 1.0, 1.0))
  assert_datalim_view(ax, (-0.5, 1.5), (0.0, 1.0))
  assert_true(ax.x_axis().limits() is None)
  assert_true(svg.contains("data:image/png;base64,"))
  assert_true(svg.contains("points=\"100,200 300,0\""))
}

///|
test "datalim recomputes the view when a nested grid changes physical dimensions" {
  let fig = @scene.figure(width=400, height=200)
  fig.subplots_adjust(left=0.0, right=1.0, bottom=0.0, top=1.0)
  let grid = fig.grid_spec(1, 2, hspace=0.0)
  let sub = fig.add_subfigure(grid.cell_spec(0, 1))
  let ax = sub.subplots(1, 1)[0]
  ax.plot([0.0, 1.0], [0.0, 1.0])
  ax.set_xlim(0.0, 1.0)
  ax.set_ylim(0.0, 1.0)
  ax.set_aspect(1.0, adjustable="datalim")
  ax.apply_aspect()
  assert_datalim_view(ax, (0.0, 1.0), (0.0, 1.0))
  grid.set_width_ratios([3.0, 1.0])
  ignore(fig.to_svg_checked())
  assert_position(ax, (0.75, 0.0, 0.25, 1.0))
  assert_datalim_view(ax, (0.0, 1.0), (-0.5, 1.5))
}
