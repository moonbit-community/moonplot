///|
test "default upper image aligns row indices with overlaid data" {
  let fig = @scene.figure(width=200, height=200)
  fig.imshow([[0.0], [1.0]], vmin=0.0, vmax=1.0, aspect="auto")
  // Adding data invalidates the immediate image view, then sticky edges
  // preserve the half-pixel boundaries during automatic scaling.
  fig.scatter([@core.point(0.0, 0.0), @core.point(0.0, 1.0)], color="#123456")
  assert_true(fig.y_axis().inverted())
  assert_true(fig.y_limits() is None)
  let svg = fig.to_svg()
  assert_true(
    svg.contains(
      "<rect x=\"56\" y=\"56\" width=\"88\" height=\"44\" fill=\"#000000\"/>",
    ),
  )
  assert_true(
    svg.contains(
      "<rect x=\"56\" y=\"100\" width=\"88\" height=\"44\" fill=\"#ffffff\"/>",
    ),
  )
  assert_true(svg.contains("<circle cx=\"100\" cy=\"78\""))
  assert_true(svg.contains("<circle cx=\"100\" cy=\"122\""))
}

///|
test "default lower image keeps row zero at the lower data coordinate" {
  let fig = @scene.figure(width=200, height=200)
  fig.imshow([[0.0], [1.0]], vmin=0.0, vmax=1.0, origin="lower", aspect="auto")
  fig.autoscale()
  assert_true(!fig.y_axis().inverted())
  assert_true(
    fig
    .to_svg()
    .contains(
      "<rect x=\"56\" y=\"100\" width=\"88\" height=\"44\" fill=\"#000000\"/>",
    ),
  )
}

///|
test "explicit axis direction flips the default image together with its data" {
  let fig = @scene.figure(width=200, height=200)
  fig.imshow([[0.0], [1.0]], vmin=0.0, vmax=1.0, aspect="auto")
  fig.set_y_limits(-0.5, 1.5)
  fig.scatter([@core.point(0.0, 0.0)])
  assert_true(!fig.y_axis().inverted())
  let svg = fig.to_svg()
  assert_true(
    svg.contains(
      "<rect x=\"56\" y=\"100\" width=\"88\" height=\"44\" fill=\"#000000\"/>",
    ),
  )
  assert_true(svg.contains("<circle cx=\"100\" cy=\"122\""))
  // Re-enabling autoscaling retains the manually selected direction.
  fig.autoscale()
  assert_true(!fig.y_axis().inverted())
  assert_eq(fig.to_svg(), svg)
}

///|
test "reversed image extents orient each automatic axis independently" {
  for
    (extent, x_reversed, y_reversed) in [
      ([14.0, 10.0, 20.0, 24.0], true, false),
      ([10.0, 14.0, 24.0, 20.0], false, true),
      ([14.0, 10.0, 24.0, 20.0], true, true),
    ] {
    let fig = @scene.figure(width=200, height=200)
    fig.imshow(
      [[0.0, 1.0], [1.0, 1.0]],
      vmin=0.0,
      vmax=1.0,
      extent~,
      aspect="auto",
    )
    fig.autoscale()
    assert_eq(fig.x_axis().inverted(), x_reversed)
    assert_eq(fig.y_axis().inverted(), y_reversed)
    assert_true(
      fig
      .to_svg()
      .contains(
        "<rect x=\"56\" y=\"56\" width=\"44\" height=\"44\" fill=\"#000000\"/>",
      ),
    )
  }
}

///|
test "reversed extent maps pixels independently of manual view direction" {
  let fig = @scene.figure(width=200, height=200)
  fig.set_x_limits(10.0, 14.0)
  fig.set_y_limits(20.0, 24.0)
  fig.imshow(
    [[0.0, 1.0], [1.0, 1.0]],
    vmin=0.0,
    vmax=1.0,
    extent=[14.0, 10.0, 24.0, 20.0],
    aspect="auto",
  )
  assert_true(!fig.x_axis().inverted())
  assert_true(!fig.y_axis().inverted())
  assert_true(
    fig
    .to_svg()
    .contains(
      "<rect x=\"100\" y=\"100\" width=\"44\" height=\"44\" fill=\"#000000\"/>",
    ),
  )
}

///|
test "images fit immediately and later data restores autoscaling" {
  let fig = @scene.figure(width=200, height=200)
  fig.plot([-10.0, 10.0], [-10.0, 10.0])
  fig.imshow([[0.0, 1.0], [1.0, 1.0]], vmin=0.0, vmax=1.0, aspect="auto")
  let fitted = fig.to_svg()
  assert_true(
    fitted.contains(
      "<rect x=\"56\" y=\"56\" width=\"44\" height=\"44\" fill=\"#000000\"/>",
    ),
  )
  fig.text(0.0, 0.0, "origin")
  assert_true(
    fig
    .to_svg()
    .contains(
      "<rect x=\"56\" y=\"56\" width=\"44\" height=\"44\" fill=\"#000000\"/>",
    ),
  )
  fig.plot([0.0, 1.0], [0.0, 1.0])
  assert_true(
    !fig
    .to_svg()
    .contains(
      "<rect x=\"56\" y=\"56\" width=\"44\" height=\"44\" fill=\"#000000\"/>",
    ),
  )
  assert_true(fig.y_axis().inverted())
}

///|
test "shared axes use the most recent image direction and reset on clear" {
  let fig = @scene.figure()
  let axes = fig.subplots(1, 2, share_x=true, share_y=true)
  axes[1].imshow([[0.0], [1.0]])
  for ax in axes {
    assert_true(ax.y_axis().inverted())
    assert_true(!ax.x_axis().inverted())
  }
  axes[0].imshow([[0.0], [1.0]], origin="lower")
  for ax in axes {
    assert_true(!ax.y_axis().inverted())
  }
  axes[1].imshow([[0.0], [1.0]], extent=[4.0, 2.0, 8.0, 6.0])
  for ax in axes {
    assert_true(ax.x_axis().inverted())
    assert_true(ax.y_axis().inverted())
  }
  fig.clear()
  for ax in axes {
    assert_true(!ax.x_axis().inverted())
    assert_true(!ax.y_axis().inverted())
  }
}

///|
test "masked images share reversed extent geometry" {
  let fig = @scene.figure(width=200, height=200)
  let data = @core.masked_matrix([[0.0, 1.0], [1.0, 1.0]], mask=[
    [false, true],
    [true, true],
  ])
  fig.imshow_masked(
    data,
    vmin=0.0,
    vmax=1.0,
    origin="lower",
    extent=[14.0, 10.0, 24.0, 20.0],
    aspect="auto",
  )
  fig.autoscale()
  assert_true(fig.x_axis().inverted())
  assert_true(fig.y_axis().inverted())
  assert_true(
    fig
    .to_svg()
    .contains(
      "<rect x=\"56\" y=\"100\" width=\"44\" height=\"44\" fill=\"#000000\"/>",
    ),
  )
}
