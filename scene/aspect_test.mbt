///|
test "numeric aspect scales y units relative to x and preserves limits" {
  let fig = @scene.figure(width=400, height=200)
  let ax = fig.add_axes(0.25, 0.25, 0.5, 0.5)
  ax.set_xlim(0.0, 1.0)
  ax.set_ylim(0.0, 1.0)
  ax.plot([0.0, 1.0], [0.0, 1.0])
  for
    (aspect, x, y, width, height) in [
      (2.0, 0.4375, 0.25, 0.125, 0.5),
      (0.25, 0.25, 0.375, 0.5, 0.25),
      (1.0, 0.375, 0.25, 0.25, 0.5),
    ] {
    ax.set_aspect(aspect)
    assert_eq(ax.get_aspect(), Some(aspect))
    assert_position(ax, (x, y, width, height))
    assert_position(ax, (0.25, 0.25, 0.5, 0.5), original=true)
    let p = ax.get_position().unwrap()
    assert_eq(p.height() * 200.0 / (p.width() * 400.0), aspect)
    assert_eq(ax.get_xlim().unwrap().upper(), 1.0)
    assert_eq(ax.get_ylim().unwrap().upper(), 1.0)
  }
  ax.set_aspect(2.0)
  assert_true(fig.to_svg().contains("points=\"175,150 225,50\""))
  ax.set_aspect(0.25)
  assert_true(fig.to_svg().contains("points=\"100,125 300,75\""))
}

///|
test "numeric equal auto and clear share one aspect state" {
  let fig = @scene.figure(width=400, height=200)
  let ax = fig.add_axes(0.25, 0.25, 0.5, 0.5)
  ax.set_xlim(0.0, 1.0)
  ax.set_ylim(0.0, 1.0)
  assert_true(ax.get_aspect() is None)
  ax.set_aspect(1.0)
  assert_true(ax.aspect_equal())
  let numeric = fig.to_svg()
  ax.set_aspect_equal()
  assert_eq(fig.to_svg(), numeric)
  ax.set_aspect(3.0)
  assert_true(!ax.aspect_equal())
  ax.set_aspect_auto()
  assert_true(ax.get_aspect() is None)
  assert_position(ax, (0.25, 0.25, 0.5, 0.5))
  ax.set_aspect(3.0)
  ax.clear()
  assert_true(ax.get_aspect() is None)
  assert_position(ax, (0.25, 0.25, 0.5, 0.5))
}

///|
test "numeric aspect position writes reads reset and drawing stay consistent" {
  let fig = @scene.figure(width=400, height=200)
  let ax = fig.add_axes(0.25, 0.25, 0.5, 0.5)
  ax.set_xlim(0.0, 1.0)
  ax.set_ylim(0.0, 1.0)
  ax.plot([0.0, 1.0], [0.0, 1.0])
  ax.set_aspect(2.0)
  ax.set_position(0.0, 0.0, 1.0, 1.0, which="active")
  assert_true(fig.to_svg().contains("points=\"175,150 225,50\""))
  assert_position(ax, (0.4375, 0.25, 0.125, 0.5))
  ax.set_position(0.0, 0.0, 0.5, 1.0, which="original")
  ax.reset_position()
  assert_position(ax, (0.125, 0.0, 0.25, 1.0))
  assert_true(fig.to_svg().contains("points=\"50,200 150,0\""))
  ax.set_ylim(2.0, 0.0)
  assert_position(ax, (0.1875, 0.0, 0.125, 1.0))
}

///|
test "numeric aspect uses transformed spans for reversed logarithmic axes" {
  let fig = @scene.figure(width=400, height=200)
  let ax = fig.add_axes(0.25, 0.25, 0.5, 0.5)
  ax.set_x_scale(@scale.log_scale())
  ax.set_y_scale(@scale.log_scale())
  ax.set_xlim(100.0, 1.0)
  ax.set_ylim(10.0, 1.0)
  ax.plot([100.0, 1.0], [10.0, 1.0])
  ax.set_aspect(2.0)
  assert_position(ax, (0.375, 0.25, 0.25, 0.5))
  assert_true(fig.to_svg().contains("points=\"150,150 250,50\""))
  ax.set_aspect(0.5)
  assert_position(ax, (0.25, 0.375, 0.5, 0.25))
  ax.set_ylim(1.0, 10.0)
  assert_position(ax, (0.25, 0.375, 0.5, 0.25))
}

///|
test "numeric aspect uses symmetric log spans across zero" {
  let fig = @scene.figure(width=400, height=200)
  let ax = fig.add_axes(0.25, 0.25, 0.5, 0.5)
  let scale = @scale.symlog_scale()
  ax.set_x_scale(scale)
  ax.set_y_scale(scale)
  ax.set_xlim(-10.0, 10.0)
  ax.set_ylim(10.0, -10.0)
  ax.set_aspect(2.0)
  assert_position(ax, (0.4375, 0.25, 0.125, 0.5))
  let svg = fig.to_svg()
  assert_true(!svg.contains("NaN") && !svg.contains("Infinity"))
}

///|
test "numeric aspect compares mixed logarithmic and linear data units" {
  let fig = @scene.figure(width=400, height=200)
  let ax = fig.add_axes(0.25, 0.25, 0.5, 0.5)
  ax.set_x_scale(@scale.log_scale())
  ax.set_xlim(1.0, 100.0)
  ax.set_ylim(2.0, -2.0)
  ax.plot([1.0, 100.0], [2.0, -2.0])
  ax.set_aspect(2.0)
  assert_position(ax, (0.46875, 0.25, 0.0625, 0.5))
  assert_true(fig.to_svg().contains("points=\"187.5,150 212.5,50\""))
}

///|
test "numeric aspect remains local unless sharing is explicitly requested" {
  let fig = @scene.figure(width=400, height=200)
  let axes = fig.subplots(1, 2, share_x=true, share_y=true)
  axes[0].set_position(0.25, 0.25, 0.5, 0.5)
  axes[0].plot([0.0, 2.0], [0.0, 1.0])
  axes[1].plot([2.0, 4.0], [0.0, 2.0])
  axes[0].set_margins(0.0, 0.0)
  axes[0].set_aspect(2.0)
  assert_true(axes[1].get_aspect() is None)
  assert_position(axes[0], (0.375, 0.25, 0.25, 0.5))
  axes[0].set_aspect(0.5, share=true)
  assert_eq(axes[1].get_aspect(), Some(0.5))
  assert_position(axes[0], (0.25, 0.375, 0.5, 0.25))
  axes[1].set_aspect_equal(share=true)
  assert_eq(axes[0].get_aspect(), Some(1.0))
  axes[0].set_aspect_auto(share=true)
  assert_true(axes[1].get_aspect() is None)
}

///|
test "aspect share applies the union of direct siblings without transitive propagation" {
  let fig = @scene.figure()
  let grid = fig
    .grid_spec(2, 2)
    .with_shared_axes(@gridspec.ShareMode::Row, @gridspec.ShareMode::Column)
  let axes = fig.subplots_with_grid(grid)
  let manual = fig.add_axes(0.25, 0.25, 0.5, 0.5)
  axes[0].set_aspect(2.0, share=true)
  for index in [0, 1, 2] {
    assert_eq(axes[index].get_aspect(), Some(2.0))
  }
  assert_true(axes[3].get_aspect() is None)
  assert_true(manual.get_aspect() is None)
  axes[0].set_aspect_auto(share=true)
  for ax in axes {
    assert_true(ax.get_aspect() is None)
  }
}

///|
test "invalid numeric aspect is atomic for local shared and empty figures" {
  let fig = @scene.figure()
  let axes = fig.subplots(1, 2, share_x=true)
  axes[0].set_aspect(2.0)
  axes[1].set_aspect(0.5)
  let before = fig.to_svg()
  let empty = @scene.figure()
  empty.axes().remove()
  for value in [0.0, -0.0, -1.0, 0.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0] {
    try axes[0].set_aspect(value, share=true) catch {
      @core.DataError::InvalidReference(message~) =>
        assert_true(message.contains("finite and positive"))
      _ => fail("expected invalid aspect")
    } noraise {
      _ => fail("expected invalid aspect")
    }
    try empty.set_aspect(value) catch {
      @core.DataError::InvalidReference(_) => ()
      _ => fail("expected invalid aspect")
    } noraise {
      _ => fail("expected invalid aspect")
    }
    assert_eq(axes[0].get_aspect(), Some(2.0))
    assert_eq(axes[1].get_aspect(), Some(0.5))
    assert_eq(fig.to_svg(), before)
    assert_eq(empty.axes_list().length(), 0)
  }
}

///|
test "figure aspect convenience preserves current selection and detached sharing is isolated" {
  let fig = @scene.figure()
  let axes = fig.subplots(1, 2, share_x=true)
  axes[1].set_title("selected")
  fig.set_aspect(2.0)
  assert_eq(fig.get_aspect(), Some(2.0))
  assert_true(axes[1].get_aspect() is None)
  assert_eq(fig.gca().title(), Some("selected"))
  axes[0].remove()
  axes[0].set_aspect(3.0, share=true)
  assert_eq(axes[0].get_aspect(), Some(3.0))
  assert_true(axes[1].get_aspect() is None)
  axes[1].set_aspect(0.5, share=true)
  assert_eq(axes[0].get_aspect(), Some(3.0))
}

///|
test "numeric aspect reuses image sticky edges and existing aspect entry points" {
  let fig = @scene.figure(width=400, height=200)
  let ax = fig.add_axes(0.25, 0.25, 0.5, 0.5)
  ax.imshow([[0.0, 1.0], [1.0, 0.0]], interpolation="none")
  ax.set_aspect(2.0)
  assert_position(ax, (0.4375, 0.25, 0.125, 0.5))
  assert_true(fig.to_svg().contains("data:image/png;base64,"))
  ax.set_margins(0.3, 0.1)
  assert_position(ax, (0.4375, 0.25, 0.125, 0.5))
  ax.imshow([[1.0]], aspect="auto")
  assert_true(ax.get_aspect() is None)
  ax.set_aspect(2.0)
  ax.imshow([[1.0]], aspect="equal")
  assert_eq(ax.get_aspect(), Some(1.0))
}

///|
test "numeric aspect follows grid and nested geometry without changing original placement" {
  let fig = @scene.figure(width=400, height=200)
  fig.subplots_adjust(left=0.0, right=1.0, bottom=0.0, top=1.0)
  let grid = fig.grid_spec(1, 2, hspace=0.0)
  let sub = fig.add_subfigure(grid.cell_spec(0, 1))
  let ax = sub.subplots(1, 1)[0]
  ax.set_xlim(0.0, 1.0)
  ax.set_ylim(0.0, 1.0)
  ax.set_aspect(0.5)
  assert_position(ax, (0.5, 0.25, 0.5, 0.5))
  grid.set_width_ratios([3.0, 1.0])
  assert_position(ax, (0.75, 0.375, 0.25, 0.25))
  ax.set_position(0.0, 0.0, 1.0, 1.0)
  assert_position(ax, (0.0, 0.0, 1.0, 1.0))
  fig.subplots_adjust()
  assert_position(ax, (0.75, 0.375, 0.25, 0.25))
  assert_eq(ax.get_aspect(), Some(0.5))
}

///|
test "finite extreme numeric aspects and zero size panels keep geometry and SVG finite" {
  let fig = @scene.figure(width=400, height=200)
  let ax = fig.add_axes(0.25, 0.25, 0.5, 0.5)
  ax.set_xlim(0.0, 1.0)
  ax.set_ylim(0.0, 1.0)
  ax.plot([0.0, 1.0], [0.0, 1.0])
  for value in [1.0e-308, 1.0e308, 2.0] {
    ax.set_aspect(value)
    for size in [(0.5, 0.5), (0.0, 0.5), (0.5, 0.0), (0.0, 0.0)] {
      ax.set_position(0.25, 0.25, size.0, size.1)
      let p = ax.get_position().unwrap()
      for coordinate in [p.x(), p.y(), p.width(), p.height()] {
        assert_true(!coordinate.is_nan() && !coordinate.is_inf())
      }
      assert_true(p.width() <= size.0 && p.height() <= size.1)
      let svg = fig.to_svg()
      assert_true(!svg.contains("NaN") && !svg.contains("Infinity"))
    }
  }
}

///|
test "numeric aspect floors microscopic transformed spans like upstream data ratio" {
  let fig = @scene.figure(width=400, height=200)
  let ax = fig.add_axes(0.25, 0.25, 0.5, 0.5)
  ax.set_xlim(0.0, 1.0e-40)
  ax.set_ylim(0.0, 1.0e-20)
  ax.plot([0.0, 1.0e-40], [0.0, 1.0e-20])
  ax.set_aspect(1.0e-10)
  assert_position(ax, (0.375, 0.25, 0.25, 0.5))
  let svg = fig.to_svg()
  assert_true(!svg.contains("NaN") && !svg.contains("Infinity"))
}

///|
test "numeric aspect preserves streamplot arrowhead display proportions" {
  for aspect in [0.5, 2.0, 4.0] {
    let fig = @scene.figure(width=400, height=200)
    let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
    ax.set_xlim(0.0, 1.0)
    ax.set_ylim(0.0, 1.0)
    ax.set_margins(0.0, 0.0)
    ax.set_aspect(aspect)
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
    assert_eq(result.arrows().length(), 1)
    guard result.arrows()[0] is @scene.Artist::Polygon(points, _) else {
      fail("expected filled arrowhead")
    }
    let p = ax.get_position().unwrap()
    let length = (points[1].x() - (points[0].x() + points[2].x()) / 2.0).abs() *
      p.width() *
      400.0
    let width = (points[0].y() - points[2].y()).abs() * p.height() * 200.0
    assert_true((width / length - 0.65).abs() < 1.0e-10)
  }
}
