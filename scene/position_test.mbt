///|
fn assert_position(
  ax : @scene.Axes,
  expected : (Double, Double, Double, Double),
  original~ : Bool = false,
) -> Unit raise {
  let p = ax.get_position(original~).unwrap()
  assert_true((p.x() - expected.0).abs() < 1.0e-10)
  assert_true((p.y() - expected.1).abs() < 1.0e-10)
  assert_true((p.width() - expected.2).abs() < 1.0e-10)
  assert_true((p.height() - expected.3).abs() < 1.0e-10)
}

///|
test "position reads normalized default and manual rectangles" {
  let fig = @scene.figure(width=400, height=200)
  let ax = fig.axes()
  assert_true(ax.rect() is None)
  assert_position(ax, (0.14, 0.28, 0.72, 0.44))
  assert_position(ax, (0.14, 0.28, 0.72, 0.44), original=true)
  ax.set_position(0.25, 0.25, 0.5, 0.5)
  assert_position(ax, (0.25, 0.25, 0.5, 0.5))
  let pixels = ax.rect().unwrap()
  assert_eq(
    (pixels.x(), pixels.y(), pixels.width(), pixels.height()),
    (100.0, 50.0, 200.0, 100.0),
  )
  let manual = fig.add_axes(0.0, 0.0, 0.25, 0.25)
  assert_true(ax.is_attached())
  assert_eq(fig.axes_list().length(), 2)
  assert_position(manual, (0.0, 0.0, 0.25, 0.25))
}

///|
test "position writes preserve artists handles and reach SVG" {
  let fig = @scene.figure(width=400, height=200)
  let ax = fig.add_axes(0.0, 0.0, 0.25, 0.25)
  ax.plot([0.0, 1.0], [0.0, 1.0])
  ax.set_xlim(0.0, 1.0)
  ax.set_ylim(0.0, 1.0)
  ax.set_position(0.25, 0.25, 0.5, 0.5)
  assert_eq(fig.axes().artists().length(), 1)
  assert_position(fig.axes(), (0.25, 0.25, 0.5, 0.5))
  assert_true(fig.to_svg().contains("points=\"100,150 300,50\""))
  fig.subplots_adjust(left=0.2, right=0.8)
  assert_position(ax, (0.25, 0.25, 0.5, 0.5))
  assert_true(ax.get_subplotspec() is None)
  ax.clear()
  assert_position(ax, (0.25, 0.25, 0.5, 0.5))
  assert_eq(ax.artists().length(), 0)
}

///|
test "position which active is overwritten by reads and drawing" {
  let fig = @scene.figure(width=400, height=200)
  let ax = fig.add_axes(0.25, 0.25, 0.5, 0.5)
  ax.plot([0.0, 1.0], [0.0, 1.0])
  ax.set_xlim(0.0, 1.0)
  ax.set_ylim(0.0, 1.0)
  ax.set_position(0.0, 0.0, 0.25, 0.25, which="active")
  assert_position(ax, (0.25, 0.25, 0.5, 0.5), original=true)
  // Draw before an active getter: it must not consume the pending override.
  assert_true(fig.to_svg().contains("points=\"100,150 300,50\""))
  ax.set_position(0.0, 0.0, 0.25, 0.25, which="active")
  assert_position(ax, (0.25, 0.25, 0.5, 0.5))
  ax.set_position(0.125, 0.125, 0.25, 0.5, which="original")
  assert_true(fig.to_svg().contains("points=\"50,175 150,75\""))
  assert_position(ax, (0.125, 0.125, 0.25, 0.5))
  ax.reset_position()
  assert_position(ax, (0.125, 0.125, 0.25, 0.5), original=true)
}

///|
test "position equal aspect uses original and current limits" {
  let fig = @scene.figure(width=400, height=200)
  let ax = fig.add_axes(0.25, 0.25, 0.5, 0.5)
  ax.plot([0.0, 1.0], [0.0, 1.0])
  ax.set_xlim(0.0, 1.0)
  ax.set_ylim(0.0, 1.0)
  ax.set_aspect_equal()
  assert_position(ax, (0.25, 0.25, 0.5, 0.5), original=true)
  assert_position(ax, (0.375, 0.25, 0.25, 0.5))
  assert_true(fig.to_svg().contains("points=\"150,150 250,50\""))
  ax.set_position(0.0, 0.0, 1.0, 1.0, which="active")
  ax.reset_position()
  assert_position(ax, (0.375, 0.25, 0.25, 0.5))
  ax.set_ylim(2.0, 0.0)
  assert_position(ax, (0.4375, 0.25, 0.125, 0.5))
  ax.set_aspect_auto()
  assert_position(ax, (0.25, 0.25, 0.5, 0.5))
  ax.set_aspect_equal()
  ax.clear()
  assert_true(!ax.aspect_equal())
  assert_position(ax, (0.25, 0.25, 0.5, 0.5))
}

///|
test "position grid override retains spec and adjust restores layout atomically" {
  let fig = @scene.figure(width=400, height=200)
  let axes = fig.subplots(1, 2, share_x=true)
  let original_second = axes[1].get_position().unwrap()
  axes[0].set_position(0.25, 0.25, 0.5, 0.5)
  assert_true(axes[0].get_subplotspec() is Some(_))
  axes[0].set_xlim(0.0, 4.0)
  assert_eq(axes[1].x_limits().unwrap().upper(), 4.0)
  assert_eq(axes[1].get_position().unwrap().x(), original_second.x())
  try fig.subplots_adjust(left=0.9, right=0.1) catch {
    @gridspec.LayoutError::InvalidBounds => ()
    _ => fail("expected invalid bounds")
  } noraise {
    _ => fail("expected rejection")
  }
  assert_position(axes[0], (0.25, 0.25, 0.5, 0.5))
  fig.subplots_adjust(
    left=0.125,
    right=0.875,
    bottom=0.25,
    top=0.75,
    wspace=0.0,
  )
  assert_position(axes[0], (0.125, 0.25, 0.375, 0.5))
  assert_position(axes[1], (0.5, 0.25, 0.375, 0.5))
  // The implicit default panel also retains its subplot identity.
  let other = @scene.figure(width=400, height=200)
  let default_ax = other.axes()
  default_ax.set_position(0.0, 0.0, 0.25, 0.25)
  other.subplots_adjust(left=0.25, right=0.75, bottom=0.25, top=0.75)
  assert_position(default_ax, (0.25, 0.25, 0.5, 0.5))
}

///|
test "position nested grids keep root coordinates and live geometry" {
  let fig = @scene.figure(width=400, height=200)
  fig.subplots_adjust(left=0.0, right=1.0, bottom=0.0, top=1.0)
  let parent = fig.grid_spec(1, 2, hspace=0.0)
  let nested = fig.add_subfigure(parent.cell_spec(0, 1))
  let ax = nested.subplots(1, 1)[0]
  assert_position(ax, (0.5, 0.0, 0.5, 1.0))
  parent.set_width_ratios([3.0, 1.0])
  assert_position(ax, (0.75, 0.0, 0.25, 1.0))
  ax.set_position(0.25, 0.25, 0.5, 0.5)
  assert_position(ax, (0.25, 0.25, 0.5, 0.5))
  fig.subplots_adjust()
  assert_position(ax, (0.75, 0.0, 0.25, 1.0))
}

///|
test "position equal aspect reuses shared autoscale and margins" {
  let fig = @scene.figure(width=400, height=200)
  let axes = fig.subplots(1, 2, share_x=true)
  axes[0].set_position(0.25, 0.25, 0.5, 0.5)
  axes[0].plot([0.0, 1.0], [0.0, 1.0])
  axes[1].plot([2.0, 4.0], [0.0, 1.0])
  axes[0].set_margins(0.0, 0.0)
  axes[0].set_aspect_equal()
  assert_position(axes[0], (0.25, 0.375, 0.5, 0.25))
  axes[1].plot([0.0, 8.0], [0.0, 1.0])
  assert_position(axes[0], (0.25, 0.4375, 0.5, 0.125))
  axes[0].set_y_margin(0.5)
  assert_position(axes[0], (0.25, 0.375, 0.5, 0.25))
}

///|
test "position equal aspect reuses transformed logarithmic spans" {
  let fig = @scene.figure(width=400, height=200)
  let ax = fig.add_axes(0.25, 0.25, 0.5, 0.5)
  ax.set_x_scale(@scale.log_scale())
  ax.set_y_scale(@scale.log_scale())
  ax.set_xlim(100.0, 1.0)
  ax.set_ylim(1.0, 10.0)
  ax.set_aspect_equal()
  assert_position(ax, (0.25, 0.25, 0.5, 0.5))
  ax.set_ylim(1.0, 100.0)
  assert_position(ax, (0.375, 0.25, 0.25, 0.5))
}

///|
test "position equal aspect uses image extent and sticky edges" {
  let fig = @scene.figure(width=400, height=200)
  let ax = fig.add_axes(0.25, 0.25, 0.5, 0.5)
  ax.imshow([[0.0, 1.0], [1.0, 0.0]], interpolation="none")
  assert_position(ax, (0.375, 0.25, 0.25, 0.5))
  ax.set_margins(0.3, 0.1)
  assert_position(ax, (0.375, 0.25, 0.25, 0.5))
  assert_true(fig.to_svg().contains("data:image/png;base64,"))
  ax.set_position(0.0, 0.0, 0.25, 0.5, which="original")
  assert_position(ax, (0.0, 0.0, 0.25, 0.5))
}

///|
test "position accepts zero and outside rectangles" {
  let fig = @scene.figure(width=400, height=200)
  let ax = fig.axes()
  ax.set_position(-0.25, -0.5, 1.5, 2.0)
  assert_position(ax, (-0.25, -0.5, 1.5, 2.0))
  for size in [(0.0, 0.5), (0.5, 0.0), (-0.0, 0.0)] {
    ax.set_position(0.25, 0.25, size.0, size.1)
    assert_position(ax, (0.25, 0.25, size.0, size.1), original=true)
    ax.set_aspect_equal()
    let p = ax.get_position().unwrap()
    assert_true(!p.x().is_nan() && !p.y().is_nan())
    let svg = fig.to_svg()
    assert_true(!svg.contains("NaN") && !svg.contains("Infinity"))
  }
}

///|
test "position invalid writes leave geometry and SVG unchanged" {
  let fig = @scene.figure(width=400, height=200)
  let ax = fig.add_axes(0.25, 0.25, 0.5, 0.5)
  ax.plot([0.0, 1.0], [0.0, 1.0])
  let before = fig.to_svg()
  for which in ["both", "original", "active"] {
    for
      v in [
        (-1.0 / 0.0, 0.0, 0.5, 0.5),
        (0.0, 1.0 / 0.0, 0.5, 0.5),
        (0.0, 0.0, -0.1, 0.5),
        (0.0, 0.0, 0.5, -0.1),
        (0.0 / 0.0, 0.0, 0.5, 0.5),
        (0.0, 0.0 / 0.0, 0.5, 0.5),
        (0.0, 0.0, 0.0 / 0.0, 0.5),
        (0.0, 0.0, 0.5, 0.0 / 0.0),
        (1.0e308, 0.0, 1.0e308, 0.5),
        (0.0, 1.0e308, 0.5, 1.0e308),
        (0.0, 0.0, 1.0e308, 0.5),
      ] {
      try ax.set_position(v.0, v.1, v.2, v.3, which~) catch {
        @core.DataError::InvalidReference(_) => ()
        _ => fail("expected invalid position")
      } noraise {
        _ => fail("expected rejection")
      }
      assert_position(ax, (0.25, 0.25, 0.5, 0.5), original=true)
      assert_eq(fig.to_svg(), before)
    }
  }
  try ax.set_position(0.0, 0.0, 0.25, 0.25, which="unknown") catch {
    @core.DataError::InvalidReference(_) => ()
    _ => fail("expected invalid which")
  } noraise {
    _ => fail("expected rejection")
  }
  assert_eq(fig.to_svg(), before)
}

///|
test "position rejects detached handles and avoids zero dimension division" {
  let fig = @scene.figure(width=400, height=200)
  let old = fig.axes()
  let current = fig.subplots(1, 1)[0]
  assert_true(old.get_position() is None)
  assert_true(old.get_position(original=true) is None)
  let before = fig.to_svg()
  try old.set_position(0.0, 0.0, 1.0, 1.0) catch {
    @core.DataError::InvalidReference(_) => ()
    _ => fail("expected detached handle error")
  } noraise {
    _ => fail("expected rejection")
  }
  try old.reset_position() catch {
    @core.DataError::InvalidReference(_) => ()
    _ => fail("expected detached handle error")
  } noraise {
    _ => fail("expected rejection")
  }
  assert_eq(fig.to_svg(), before)
  assert_true(current.is_attached())
  assert_true(@scene.figure(width=0).axes().get_position() is None)
  assert_true(@scene.figure(height=0).axes().get_position() is None)
}
