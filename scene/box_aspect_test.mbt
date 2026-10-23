///|
test "box aspect constrains physical dimensions independently of figure fractions" {
  let fig = @scene.figure(width=400, height=200)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  for
    (value, expected) in [
      (1.0, (0.25, 0.0, 0.5, 1.0)),
      (2.0, (0.375, 0.0, 0.25, 1.0)),
      (0.25, (0.0, 0.25, 1.0, 0.5)),
      (0.5, (0.0, 0.0, 1.0, 1.0)),
    ] {
    ax.set_box_aspect(aspect=value)
    assert_eq(ax.get_box_aspect(), Some(value))
    assert_eq(ax.get_adjustable(), "datalim")
    assert_true(ax.get_aspect() is None)
    assert_position(ax, expected)
    assert_position(ax, (0.0, 0.0, 1.0, 1.0), original=true)
    let p = ax.get_position().unwrap()
    assert_eq(p.height() * 200.0 / (p.width() * 400.0), value)
  }
}

///|
test "box aspect follows anchor fractions including outside the original frame" {
  let fig = @scene.figure(width=400, height=200)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  ax.set_box_aspect(aspect=1.0)
  ax.set_anchor(@scene.Anchor::Named("SW"))
  assert_position(ax, (0.0, 0.0, 0.5, 1.0))
  ax.set_anchor(@scene.Anchor::Named("NE"))
  assert_position(ax, (0.5, 0.0, 0.5, 1.0))
  ax.set_anchor(@scene.Anchor::Fraction(-1.0, 2.0))
  assert_position(ax, (-0.5, 0.0, 0.5, 1.0))
  ax.set_box_aspect(aspect=0.25)
  assert_position(ax, (0.0, 1.0, 1.0, 0.5))
  ax.set_anchor(@scene.Anchor::Named("NE"))
  assert_position(ax, (0.0, 0.5, 1.0, 0.5))
  ax.set_anchor(@scene.Anchor::Named("SW"))
  assert_position(ax, (0.0, 0.0, 1.0, 0.5))
}

///|
test "box aspect numeric datalim adjusts views after shrinking the physical frame" {
  let (fig, ax) = datalim_fixture()
  ax.set_aspect(2.0)
  ax.set_box_aspect(aspect=1.0)
  ax.apply_aspect()
  assert_position(ax, (0.25, 0.0, 0.5, 1.0))
  assert_datalim_view(ax, (-0.5, 1.5), (0.0, 1.0))
  assert_true(fig.to_svg_checked().contains("points=\"150,200 250,0\""))
  ax.set_box_aspect(aspect=0.25)
  ax.apply_aspect()
  assert_position(ax, (0.0, 0.25, 1.0, 0.5))
  assert_datalim_view(ax, (-3.5, 4.5), (0.0, 1.0))
  assert_true(fig.to_svg_checked().contains("points=\"175,150 225,50\""))
}

///|
test "clearing box aspect retains datalim strategy and reapplies data aspect to original frame" {
  let (_, ax) = datalim_fixture()
  ax.set_aspect(2.0)
  ax.set_box_aspect(aspect=1.0)
  ax.apply_aspect()
  ax.set_box_aspect()
  assert_true(ax.get_box_aspect() is None)
  assert_eq(ax.get_adjustable(), "datalim")
  ax.apply_aspect()
  assert_position(ax, (0.0, 0.0, 1.0, 1.0))
  assert_datalim_view(ax, (-1.5, 2.5), (0.0, 1.0))
  ax.set_aspect_auto()
  ax.set_box_aspect(aspect=1.0)
  assert_position(ax, (0.25, 0.0, 0.5, 1.0))
  ax.set_box_aspect()
  assert_position(ax, (0.0, 0.0, 1.0, 1.0))
  assert_eq(ax.get_adjustable(), "datalim")
}

///|
test "numeric box adjustment temporarily ignores the stored physical box ratio" {
  let (_, ax) = datalim_fixture()
  ax.set_box_aspect(aspect=1.0)
  ax.set_aspect(2.0, adjustable="box")
  assert_eq(ax.get_box_aspect(), Some(1.0))
  assert_position(ax, (0.375, 0.0, 0.25, 1.0))
  assert_datalim_view(ax, (0.0, 1.0), (0.0, 1.0))
  ax.set_adjustable("datalim")
  assert_position(ax, (0.25, 0.0, 0.5, 1.0))
  assert_datalim_view(ax, (-0.5, 1.5), (0.0, 1.0))
}

///|
test "auto physical boxes allow both shared axes without propagating to regular siblings" {
  let fig = @scene.figure(width=400, height=200)
  let axes = fig.subplots(1, 2, share_x=true, share_y=true)
  for ax in axes {
    ax.set_position(0.0, 0.0, 1.0, 1.0)
  }
  axes[0].set_xlim(0.0, 4.0)
  axes[0].set_ylim(0.0, 2.0)
  axes[0].set_box_aspect(aspect=1.0)
  axes[1].set_adjustable("datalim")
  assert_position(axes[0], (0.25, 0.0, 0.5, 1.0))
  assert_position(axes[1], (0.0, 0.0, 1.0, 1.0))
  assert_true(axes[1].get_box_aspect() is None)
  for ax in axes {
    assert_datalim_view(ax, (0.0, 4.0), (0.0, 2.0))
  }
  try axes[0].set_aspect(2.0) catch {
    @core.DataError::InvalidReference(_) => ()
    _ => fail("expected numeric datalim sharing error")
  } noraise {
    _ => fail("expected numeric datalim sharing error")
  }
  assert_true(axes[0].get_aspect() is None)
  axes[1].set_aspect(1.0, adjustable="box")
  try axes[1].set_box_aspect(aspect=1.0) catch {
    @core.DataError::InvalidReference(_) => ()
    _ => fail("expected numeric datalim sharing error")
  } noraise {
    _ => fail("expected numeric datalim sharing error")
  }
  assert_true(axes[1].get_box_aspect() is None)
  assert_eq(axes[1].get_adjustable(), "box")
  ignore(fig.to_svg_checked())
}

///|
test "legacy equal helper reports newly incompatible physical box sharing through checked APIs" {
  let fig = @scene.figure()
  let axes = fig.subplots(1, 2, share_x=true, share_y=true)
  axes[0].set_box_aspect(aspect=1.0)
  axes[0].set_aspect_equal()
  assert_true(axes[0].get_position() is None)
  try fig.to_svg_checked() catch {
    @core.DataError::InvalidReference(_) => ()
    _ => fail("expected numeric datalim sharing error")
  } noraise {
    _ => fail("expected numeric datalim sharing error")
  }
  axes[0].set_aspect_auto()
  ignore(fig.to_svg_checked())
  assert_true(axes[0].get_position() is Some(_))
}

///|
test "box aspect invalid ratios reject before state changes or empty figure creation" {
  let fig = @scene.figure(width=400, height=200)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  ax.set_box_aspect(aspect=1.0)
  let before = fig.to_svg_checked()
  let empty = @scene.figure()
  empty.axes().remove()
  for aspect in [0.0, -0.0, -1.0, 0.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0] {
    try ax.set_box_aspect(aspect~) catch {
      @core.DataError::InvalidReference(_) => ()
      _ => fail("expected invalid box aspect")
    } noraise {
      _ => fail("expected invalid box aspect")
    }
    try empty.set_box_aspect(aspect~) catch {
      @core.DataError::InvalidReference(_) => ()
      _ => fail("expected invalid box aspect")
    } noraise {
      _ => fail("expected invalid box aspect")
    }
    assert_eq(ax.get_box_aspect(), Some(1.0))
    assert_eq(ax.get_adjustable(), "datalim")
    assert_eq(fig.to_svg_checked(), before)
    assert_eq(empty.axes_list().length(), 0)
  }
}

///|
test "box aspect and position updates commute across intermediate draws" {
  let first = @scene.figure(width=400, height=200)
  let a = first.add_axes(0.0, 0.0, 1.0, 1.0)
  a.set_position(0.25, 0.25, 0.5, 0.5)
  ignore(first.to_svg_checked())
  a.set_box_aspect(aspect=1.0)
  let second = @scene.figure(width=400, height=200)
  let b = second.add_axes(0.0, 0.0, 1.0, 1.0)
  b.set_box_aspect(aspect=1.0)
  ignore(second.to_svg_checked())
  b.set_position(0.25, 0.25, 0.5, 0.5)
  assert_position(a, (0.375, 0.25, 0.25, 0.5))
  assert_eq(first.to_svg_checked(), second.to_svg_checked())
  b.set_position(0.0, 0.0, 1.0, 1.0, which="active")
  b.reset_position()
  assert_eq(first.to_svg_checked(), second.to_svg_checked())
}

///|
test "box aspect clear lifecycle figure convenience and detached handles preserve isolation" {
  let fig = @scene.figure()
  let axes = fig.subplots(1, 2, share_x=true)
  axes[1].set_title("selected")
  fig.set_box_aspect(aspect=1.0)
  assert_eq(fig.get_box_aspect(), Some(1.0))
  assert_true(axes[1].get_box_aspect() is None)
  assert_eq(fig.gca().title(), Some("selected"))
  axes[0].clear()
  assert_eq(axes[0].get_box_aspect(), Some(1.0))
  assert_eq(axes[0].get_adjustable(), "datalim")
  let current = fig.subplots(1, 1)[0]
  assert_true(current.get_box_aspect() is None)
  axes[0].set_box_aspect(aspect=2.0)
  assert_true(current.get_box_aspect() is None)
  axes[0].set_box_aspect()
  assert_true(axes[0].get_box_aspect() is None)
}

///|
test "box aspect numeric log views use the shrunken physical ratio and preserve direction" {
  let fig = @scene.figure(width=400, height=200)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  ax.set_x_scale(@scale.log_scale())
  ax.set_y_scale(@scale.log_scale())
  ax.set_xlim(100.0, 1.0)
  ax.set_ylim(10.0, 1.0)
  ax.plot([100.0, 1.0], [10.0, 1.0])
  ax.set_aspect(2.0)
  ax.set_box_aspect(aspect=2.0)
  ax.apply_aspect()
  assert_position(ax, (0.375, 0.0, 0.25, 1.0))
  assert_datalim_view(
    ax,
    (100.0, 1.0),
    (31.622776601683793, 0.31622776601683794),
  )
  assert_true(fig.to_svg_checked().contains("points=\"150,150 250,50\""))
}

///|
test "auto box aspect changes PNG viewport without changing image data bounds" {
  let fig = @scene.figure(width=400, height=200)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  ax.imshow(
    [[0.0, 1.0], [1.0, 0.0]],
    extent=[0.0, 4.0, 0.0, 2.0],
    origin="lower",
    aspect="auto",
    interpolation="none",
  )
  ax.plot([0.0, 4.0], [0.0, 2.0])
  ax.set_margins(0.0, 0.0)
  ax.set_box_aspect(aspect=1.0)
  let svg = fig.to_svg_checked()
  assert_true(svg.contains("x=\"100\" y=\"0\" width=\"200\" height=\"200\""))
  assert_true(svg.contains("points=\"100,200 300,0\""))
  assert_true(svg.contains("data:image/png;base64,"))
  // Resolving a view stores the actual viewport while auto-enable remains on.
  let xview = ax.x_axis().current_view_limits().unwrap()
  let yview = ax.y_axis().current_view_limits().unwrap()
  assert_eq((xview.lower(), xview.upper()), (0.0, 4.0))
  assert_eq((yview.lower(), yview.upper()), (0.0, 2.0))
  assert_true(ax.get_autoscale_on())
  ax.set_aspect(1.0)
  ignore(fig.to_svg_checked())
  assert_datalim_view(ax, (0.0, 4.0), (-1.0, 3.0))
  assert_true(ax.y_axis().limits() is None)
}

///|
test "nested live grids and layout adjustment preserve physical box constraints" {
  let fig = @scene.figure(width=400, height=200)
  fig.subplots_adjust(left=0.0, right=1.0, bottom=0.0, top=1.0)
  let grid = fig.grid_spec(1, 2, hspace=0.0)
  let sub = fig.add_subfigure(grid.cell_spec(0, 1))
  let ax = sub.subplots(1, 1)[0]
  ax.set_box_aspect(aspect=2.0)
  assert_position(ax, (0.625, 0.0, 0.25, 1.0))
  grid.set_width_ratios([3.0, 1.0])
  assert_position(ax, (0.75, 0.0, 0.25, 1.0))
  ax.set_position(0.0, 0.0, 1.0, 1.0)
  fig.subplots_adjust()
  assert_position(ax, (0.75, 0.0, 0.25, 1.0))
  assert_eq(ax.get_box_aspect(), Some(2.0))
}

///|
test "invalid auto box strategy reports checked error before other panel commits" {
  let (fig, first) = datalim_fixture()
  first.set_aspect(2.0, adjustable="datalim")
  let second = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  second.set_box_aspect(aspect=1.0)
  second.set_adjustable("box")
  assert_true(second.get_position() is None)
  try fig.to_svg_checked() catch {
    @core.DataError::InvalidReference(_) => ()
    _ => fail("expected invalid auto box strategy")
  } noraise {
    _ => fail("expected invalid auto box strategy")
  }
  assert_datalim_view(first, (0.0, 1.0), (0.0, 1.0))
  second.set_box_aspect()
  ignore(fig.to_svg_checked())
  assert_datalim_view(first, (-1.5, 2.5), (0.0, 1.0))
}

///|
test "box aspect handles finite extreme ratios and zero size panels without nonfinite SVG" {
  let fig = @scene.figure(width=400, height=200)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  for aspect in [1.0e-308, 1.0e308, 1.0] {
    ax.set_box_aspect(aspect~)
    for size in [(1.0, 1.0), (0.0, 1.0), (1.0, 0.0), (0.0, 0.0)] {
      ax.set_position(0.0, 0.0, size.0, size.1)
      let p = ax.get_position().unwrap()
      for value in [p.x(), p.y(), p.width(), p.height()] {
        assert_true(!value.is_nan() && !value.is_inf())
      }
      let svg = fig.to_svg_checked()
      assert_true(!svg.contains("NaN") && !svg.contains("Infinity"))
    }
  }
}

///|
test "streamplot display arrow sizes use physical boxes with auto and numeric data aspects" {
  for numeric in [false, true] {
    let fig = @scene.figure(width=4000, height=2000)
    let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
    ax.set_xlim(0.0, 1.0)
    ax.set_ylim(0.0, 1.0)
    if numeric {
      ax.set_aspect(2.0)
    }
    ax.set_box_aspect(aspect=1.0)
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
    let view = ax.get_position().unwrap()
    let x = ax.x_axis().current_view_limits().unwrap()
    let y = ax.y_axis().current_view_limits().unwrap()
    let length = (points[1].x() - (points[0].x() + points[2].x()) / 2.0).abs() *
      view.width() *
      4000.0 /
      (x.upper() - x.lower())
    let width = (points[0].y() - points[2].y()).abs() *
      view.height() *
      2000.0 /
      (y.upper() - y.lower())
    assert_true((length - 10.0).abs() < 1.0e-10)
    assert_true((width - 6.5).abs() < 1.0e-10)
  }
}
