///|
test "anchor defaults and getters preserve the supplied form" {
  let fig = @scene.figure()
  assert_true(fig.get_anchor() is @scene.Anchor::Named("C"))
  let manual = fig.add_axes(0.25, 0.25, 0.5, 0.5)
  assert_true(manual.get_anchor() is @scene.Anchor::Named("C"))
  manual.set_anchor(@scene.Anchor::Named("SW"))
  assert_true(manual.get_anchor() is @scene.Anchor::Named("SW"))
  manual.set_anchor(@scene.Anchor::Fraction(0.0, 0.0))
  assert_true(manual.get_anchor() is @scene.Anchor::Fraction(0.0, 0.0))
  let panels = fig.subplots(1, 2)
  for ax in panels {
    assert_true(ax.get_anchor() is @scene.Anchor::Named("C"))
  }
}

///|
test "all compass anchors place horizontal and vertical aspect gaps" {
  let fig = @scene.figure(width=400, height=200)
  let ax = fig.add_axes(0.25, 0.25, 0.5, 0.5)
  ax.set_xlim(0.0, 1.0)
  ax.set_ylim(0.0, 1.0)
  for
    (name, x, y) in [
      ("SW", 0.0, 0.0),
      ("S", 0.5, 0.0),
      ("SE", 1.0, 0.0),
      ("W", 0.0, 0.5),
      ("C", 0.5, 0.5),
      ("E", 1.0, 0.5),
      ("NW", 0.0, 1.0),
      ("N", 0.5, 1.0),
      ("NE", 1.0, 1.0),
    ] {
    ax.set_anchor(@scene.Anchor::Named(name))
    ax.set_aspect_equal()
    assert_position(ax, (0.25 + x * 0.25, 0.25, 0.25, 0.5))
    ax.set_aspect(0.25)
    assert_position(ax, (0.25, 0.25 + y * 0.25, 0.5, 0.25))
    assert_position(ax, (0.25, 0.25, 0.5, 0.5), original=true)
  }
}

///|
test "fraction anchors allow outside coordinates and follow lower left origin" {
  let fig = @scene.figure(width=400, height=200)
  let ax = fig.add_axes(0.25, 0.25, 0.5, 0.5)
  ax.set_xlim(0.0, 1.0)
  ax.set_ylim(0.0, 1.0)
  for (x, y) in [(0.25, 0.75), (-1.0, -1.0), (2.0, 2.0)] {
    ax.set_anchor(@scene.Anchor::Fraction(x, y))
    ax.set_aspect_equal()
    assert_position(ax, (0.25 + x * 0.25, 0.25, 0.25, 0.5))
    ax.set_aspect(0.25)
    assert_position(ax, (0.25, 0.25 + y * 0.25, 0.5, 0.25))
    let svg = fig.to_svg()
    assert_true(!svg.contains("NaN") && !svg.contains("Infinity"))
  }
}

///|
test "automatic aspect stores anchor without moving and later fixed aspect uses it" {
  let fig = @scene.figure(width=400, height=200)
  let ax = fig.add_axes(0.25, 0.25, 0.5, 0.5)
  ax.set_xlim(0.0, 1.0)
  ax.set_ylim(0.0, 1.0)
  let before = fig.to_svg()
  ax.set_anchor(@scene.Anchor::Named("NE"))
  assert_eq(fig.to_svg(), before)
  assert_position(ax, (0.25, 0.25, 0.5, 0.5))
  ax.set_aspect(2.0)
  assert_position(ax, (0.625, 0.25, 0.125, 0.5))
  ax.set_aspect_auto()
  assert_position(ax, (0.25, 0.25, 0.5, 0.5))
  ax.set_aspect_equal()
  assert_position(ax, (0.5, 0.25, 0.25, 0.5))
  assert_true(ax.get_anchor() is @scene.Anchor::Named("NE"))
}

///|
test "aspect combined anchor and shared propagation preserve independent settings" {
  let fig = @scene.figure()
  let grid = fig
    .grid_spec(2, 2)
    .with_shared_axes(@gridspec.ShareMode::Row, @gridspec.ShareMode::Column)
  let axes = fig.subplots_with_grid(grid)
  axes[0].set_aspect(2.0, anchor=@scene.Anchor::Named("NE"), share=true)
  for index in [0, 1, 2] {
    assert_eq(axes[index].get_aspect(), Some(2.0))
    assert_true(axes[index].get_anchor() is @scene.Anchor::Named("NE"))
  }
  assert_true(axes[3].get_aspect() is None)
  assert_true(axes[3].get_anchor() is @scene.Anchor::Named("C"))
  axes[0].set_anchor(@scene.Anchor::Fraction(0.25, 0.75), share=true)
  for index in [0, 1, 2] {
    assert_eq(axes[index].get_aspect(), Some(2.0))
    assert_true(axes[index].get_anchor() is @scene.Anchor::Fraction(0.25, 0.75))
  }
  axes[1].set_anchor(@scene.Anchor::Named("SW"))
  assert_true(axes[0].get_anchor() is @scene.Anchor::Fraction(0.25, 0.75))
  axes[0].set_aspect(3.0, share=true)
  assert_true(axes[1].get_anchor() is @scene.Anchor::Named("SW"))
  assert_true(axes[3].get_anchor() is @scene.Anchor::Named("C"))
}

///|
test "invalid anchors reject atomically with aspect shared siblings and empty figures" {
  let fig = @scene.figure()
  let axes = fig.subplots(1, 2, share_x=true)
  axes[0].set_aspect(2.0, anchor=@scene.Anchor::Named("SW"))
  axes[1].set_aspect(0.5, anchor=@scene.Anchor::Named("NE"))
  let before = fig.to_svg()
  let empty = @scene.figure()
  empty.axes().remove()
  for
    anchor in [
      @scene.Anchor::Named("foo"),
      @scene.Anchor::Named("XX"),
      @scene.Anchor::Named("ne"),
      @scene.Anchor::Named(""),
      @scene.Anchor::Fraction(0.0 / 0.0, 0.5),
      @scene.Anchor::Fraction(0.5, 0.0 / 0.0),
      @scene.Anchor::Fraction(1.0 / 0.0, 0.5),
      @scene.Anchor::Fraction(0.5, -1.0 / 0.0),
    ] {
    try axes[0].set_anchor(anchor, share=true) catch {
      @core.DataError::InvalidReference(_) => ()
      _ => fail("expected invalid anchor")
    } noraise {
      _ => fail("expected invalid anchor")
    }
    try axes[0].set_aspect(3.0, anchor~, share=true) catch {
      @core.DataError::InvalidReference(_) => ()
      _ => fail("expected invalid anchor")
    } noraise {
      _ => fail("expected invalid anchor")
    }
    try empty.set_anchor(anchor) catch {
      @core.DataError::InvalidReference(_) => ()
      _ => fail("expected invalid anchor")
    } noraise {
      _ => fail("expected invalid anchor")
    }
    try empty.set_aspect(3.0, anchor~) catch {
      @core.DataError::InvalidReference(_) => ()
      _ => fail("expected invalid anchor")
    } noraise {
      _ => fail("expected invalid anchor")
    }
    assert_true(axes[0].get_anchor() is @scene.Anchor::Named("SW"))
    assert_true(axes[1].get_anchor() is @scene.Anchor::Named("NE"))
    assert_eq(axes[0].get_aspect(), Some(2.0))
    assert_eq(axes[1].get_aspect(), Some(0.5))
    assert_eq(fig.to_svg(), before)
    assert_eq(empty.axes_list().length(), 0)
  }
  try
    axes[0].set_aspect(0.0, anchor=@scene.Anchor::Named("C"), share=true)
  catch {
    @core.DataError::InvalidReference(_) => ()
    _ => fail("expected invalid aspect")
  } noraise {
    _ => fail("expected invalid aspect")
  }
  assert_eq(fig.to_svg(), before)
}

///|
test "anchor remains local for detached handles and default figure convenience preserves selection" {
  let fig = @scene.figure()
  let axes = fig.subplots(1, 2, share_x=true)
  axes[1].set_title("selected")
  fig.set_anchor(@scene.Anchor::Named("SW"))
  assert_true(fig.get_anchor() is @scene.Anchor::Named("SW"))
  assert_true(axes[1].get_anchor() is @scene.Anchor::Named("C"))
  assert_eq(fig.gca().title(), Some("selected"))
  axes[0].remove()
  axes[0].set_anchor(@scene.Anchor::Named("NE"), share=true)
  assert_true(axes[1].get_anchor() is @scene.Anchor::Named("C"))
  axes[1].set_anchor(@scene.Anchor::Named("W"), share=true)
  assert_true(axes[0].get_anchor() is @scene.Anchor::Named("NE"))
}

///|
test "anchor survives clear and remains effective when aspect is restored" {
  let fig = @scene.figure(width=400, height=200)
  let ax = fig.add_axes(0.25, 0.25, 0.5, 0.5)
  ax.set_anchor(@scene.Anchor::Named("SW"))
  ax.set_aspect_equal()
  ax.clear()
  assert_true(ax.get_anchor() is @scene.Anchor::Named("SW"))
  ax.set_xlim(0.0, 1.0)
  ax.set_ylim(0.0, 1.0)
  ax.set_aspect_equal()
  assert_position(ax, (0.25, 0.25, 0.25, 0.5))
  fig.clear()
  assert_true(ax.get_anchor() is @scene.Anchor::Named("SW"))
  let next = fig.subplots(1, 1)[0]
  assert_true(next.get_anchor() is @scene.Anchor::Named("C"))
}

///|
test "figure combined aspect anchor forwards optional values and sharing" {
  let fig = @scene.figure(width=400, height=200)
  let axes = fig.subplots(1, 2, share_x=true)
  axes[0].set_position(0.25, 0.25, 0.5, 0.5)
  axes[0].set_xlim(0.0, 1.0)
  axes[0].set_ylim(0.0, 1.0)
  axes[1].set_title("selected")
  fig.set_aspect(0.25, anchor=@scene.Anchor::Fraction(0.25, 0.75), share=true)
  for ax in axes {
    assert_eq(ax.get_aspect(), Some(0.25))
    assert_true(ax.get_anchor() is @scene.Anchor::Fraction(0.25, 0.75))
  }
  assert_position(axes[0], (0.25, 0.4375, 0.5, 0.25))
  fig.set_anchor(@scene.Anchor::Named("SW"), share=true)
  assert_true(axes[1].get_anchor() is @scene.Anchor::Named("SW"))
  assert_eq(fig.gca().title(), Some("selected"))
}

///|
test "image PNG viewport and overlaid line follow anchored active rectangle" {
  let fig = @scene.figure(width=400, height=200)
  let ax = fig.add_axes(0.25, 0.25, 0.5, 0.5)
  ax.imshow(
    [[0.0, 1.0], [1.0, 0.0]],
    extent=[0.0, 1.0, 0.0, 1.0],
    origin="lower",
    interpolation="none",
  )
  ax.plot([0.0, 1.0], [0.0, 1.0])
  ax.set_xlim(0.0, 1.0)
  ax.set_ylim(0.0, 1.0)
  ax.set_anchor(@scene.Anchor::Named("SW"))
  assert_position(ax, (0.25, 0.25, 0.25, 0.5))
  let svg = fig.to_svg()
  assert_true(svg.contains("x=\"100\" y=\"50\" width=\"100\" height=\"100\""))
  assert_true(svg.contains("points=\"100,150 200,50\""))
  assert_true(svg.contains("data:image/png;base64,"))
}

///|
test "anchor original active and reset positions synchronize with SVG" {
  let fig = @scene.figure(width=400, height=200)
  let ax = fig.add_axes(0.25, 0.25, 0.5, 0.5)
  ax.set_xlim(0.0, 1.0)
  ax.set_ylim(0.0, 1.0)
  ax.plot([0.0, 1.0], [0.0, 1.0])
  ax.set_aspect(2.0, anchor=@scene.Anchor::Named("SW"))
  assert_true(fig.to_svg().contains("points=\"100,150 150,50\""))
  ax.set_position(0.0, 0.0, 1.0, 1.0, which="active")
  assert_position(ax, (0.25, 0.25, 0.125, 0.5))
  ax.reset_position()
  assert_position(ax, (0.25, 0.25, 0.125, 0.5))
  ax.set_position(0.0, 0.0, 1.0, 1.0, which="original")
  assert_true(fig.to_svg().contains("points=\"0,200 100,0\""))
  ax.set_anchor(@scene.Anchor::Named("NE"))
  assert_true(fig.to_svg().contains("points=\"300,200 400,0\""))
  assert_position(ax, (0.0, 0.0, 1.0, 1.0), original=true)
}

///|
test "anchor preserves shared ranges and follows autoscale changes" {
  let fig = @scene.figure(width=400, height=200)
  let axes = fig.subplots(1, 2, share_x=true, share_y=true)
  axes[0].set_position(0.25, 0.25, 0.5, 0.5)
  axes[0].plot([0.0, 1.0], [0.0, 1.0])
  axes[0].set_margins(0.0, 0.0)
  axes[0].set_aspect(2.0, anchor=@scene.Anchor::Named("NE"))
  assert_position(axes[0], (0.625, 0.25, 0.125, 0.5))
  axes[1].plot([0.0, 2.0], [0.0, 1.0])
  assert_position(axes[0], (0.5, 0.25, 0.25, 0.5))
  axes[1].plot([0.0, 4.0], [0.0, 1.0])
  assert_position(axes[0], (0.25, 0.25, 0.5, 0.5))
  assert_true(axes[1].get_anchor() is @scene.Anchor::Named("C"))
}

///|
test "anchor direction and SVG origin agree for reversed logarithmic axes" {
  let fig = @scene.figure(width=400, height=200)
  let ax = fig.add_axes(0.25, 0.25, 0.5, 0.5)
  ax.set_x_scale(@scale.log_scale())
  ax.set_y_scale(@scale.log_scale())
  ax.set_xlim(100.0, 1.0)
  ax.set_ylim(100.0, 1.0)
  ax.plot([100.0, 1.0], [100.0, 1.0])
  ax.set_aspect(0.25, anchor=@scene.Anchor::Named("NE"))
  assert_position(ax, (0.25, 0.5, 0.5, 0.25))
  assert_true(fig.to_svg().contains("points=\"100,100 300,50\""))
  ax.set_anchor(@scene.Anchor::Named("SW"))
  assert_position(ax, (0.25, 0.25, 0.5, 0.25))
  assert_true(fig.to_svg().contains("points=\"100,150 300,100\""))
}

///|
test "nested live grids and subplots adjustment preserve anchor" {
  let fig = @scene.figure(width=400, height=200)
  fig.subplots_adjust(left=0.0, right=1.0, bottom=0.0, top=1.0)
  let grid = fig.grid_spec(1, 2, hspace=0.0)
  let sub = fig.add_subfigure(grid.cell_spec(0, 1))
  let ax = sub.subplots(1, 1)[0]
  ax.set_xlim(0.0, 1.0)
  ax.set_ylim(0.0, 1.0)
  ax.set_aspect(0.5, anchor=@scene.Anchor::Named("N"))
  assert_position(ax, (0.5, 0.5, 0.5, 0.5))
  grid.set_width_ratios([3.0, 1.0])
  assert_position(ax, (0.75, 0.75, 0.25, 0.25))
  ax.set_position(0.0, 0.0, 0.5, 0.5)
  fig.subplots_adjust()
  assert_position(ax, (0.75, 0.75, 0.25, 0.25))
  assert_true(ax.get_anchor() is @scene.Anchor::Named("N"))
}

///|
test "zero size and outside original positions remain finite with anchors" {
  let fig = @scene.figure(width=400, height=200)
  let ax = fig.axes()
  ax.set_xlim(0.0, 1.0)
  ax.set_ylim(0.0, 1.0)
  ax.set_aspect(2.0)
  for anchor in [@scene.Anchor::Named("NE"), @scene.Anchor::Fraction(-1.0, 2.0)] {
    ax.set_anchor(anchor)
    for size in [(0.0, 0.5), (0.5, 0.0), (0.0, 0.0), (1.5, 2.0)] {
      ax.set_position(-0.25, -0.5, size.0, size.1)
      let p = ax.get_position().unwrap()
      for value in [p.x(), p.y(), p.width(), p.height()] {
        assert_true(!value.is_nan() && !value.is_inf())
      }
      let svg = fig.to_svg()
      assert_true(!svg.contains("NaN") && !svg.contains("Infinity"))
    }
  }
}
