///|
test "streamplot integrates regular vector fields into polylines" {
  let fig = @scene.figure(width=360, height=260)
  ignore(
    try! fig.streamplot(
      [0.0, 1.0, 2.0],
      [0.0, 1.0, 2.0],
      [[1.0, 1.0, 1.0], [1.0, 1.0, 1.0], [1.0, 1.0, 1.0]],
      [[0.0, 0.0, 0.0], [0.0, 0.0, 0.0], [0.0, 0.0, 0.0]],
      density=1.0,
      color="#123456",
      label="flow",
    ),
  )
  assert_true(fig.artists().length() > 0)
  let svg = fig.to_svg()
  assert_true(svg.contains("#123456"))
  assert_true(svg.contains("<polyline"))
  assert_true(svg.contains("flow"))
}

///|
test "streamplot skips stagnant and missing regions" {
  let fig = @scene.figure(width=320, height=220)
  ignore(
    try! fig.streamplot(
      [0.0, 1.0, 2.0],
      [0.0, 1.0, 2.0],
      [[0.0, 0.0, 0.0], [0.0, 0.0 / 0.0, 0.0], [0.0, 0.0, 0.0]],
      [[0.0, 0.0, 0.0], [0.0, 0.0, 0.0], [0.0, 0.0, 0.0]],
    ),
  )
  assert_eq(fig.artists().length(), 0)
  assert_true(!fig.to_svg().contains("NaN"))
}

///|
test "streamplot validates grids, fields, and controls" {
  let fig = @scene.figure()
  try fig.streamplot([0.0], [0.0, 1.0], [[1.0], [1.0]], [[0.0], [0.0]]) catch {
    @core.DataError::InvalidStreamplot(message~) =>
      assert_true(message.contains("at least two"))
    _ => fail("expected a stream axis error")
  } noraise {
    _ => fail("expected a stream axis error")
  }
  try
    fig.streamplot([0.0, 1.0], [0.0, 1.0], [[1.0], [1.0]], [
      [0.0, 0.0],
      [0.0, 0.0],
    ])
  catch {
    @core.DataError::InvalidStreamplot(message~) =>
      assert_true(message.contains("columns"))
    _ => fail("expected a stream field shape error")
  } noraise {
    _ => fail("expected a stream field shape error")
  }
  try
    fig.streamplot(
      [0.0, 1.0],
      [0.0, 1.0],
      [[1.0, 1.0], [1.0, 1.0]],
      [[0.0, 0.0], [0.0, 0.0]],
      density=0.0,
    )
  catch {
    @core.DataError::InvalidStreamplot(message~) =>
      assert_true(message.contains("density"))
    _ => fail("expected a stream density error")
  } noraise {
    _ => fail("expected a stream density error")
  }
  try
    fig.streamplot(
      [2.0, 1.0, 0.0],
      [0.0, 1.0, 2.0],
      [[1.0, 1.0, 1.0], [1.0, 1.0, 1.0], [1.0, 1.0, 1.0]],
      [[0.0, 0.0, 0.0], [0.0, 0.0, 0.0], [0.0, 0.0, 0.0]],
    )
  catch {
    @core.DataError::InvalidStreamplot(message~) =>
      assert_true(message.contains("strictly increasing"))
    _ => fail("expected a strictly increasing grid error")
  } noraise {
    _ => fail("expected a strictly increasing grid error")
  }
  try
    fig.streamplot(
      [0.0, 1.0, 3.0],
      [0.0, 1.0, 2.0],
      [[1.0, 1.0, 1.0], [1.0, 1.0, 1.0], [1.0, 1.0, 1.0]],
      [[0.0, 0.0, 0.0], [0.0, 0.0, 0.0], [0.0, 0.0, 0.0]],
    )
  catch {
    @core.DataError::InvalidStreamplot(message~) =>
      assert_true(message.contains("equally spaced"))
    _ => fail("expected an equally spaced grid error")
  } noraise {
    _ => fail("expected an equally spaced grid error")
  }
  try
    fig.streamplot(
      [0.0, 1.0],
      [0.0, 1.0],
      [[1.0, 1.0], [1.0, 1.0]],
      [[0.0, 0.0], [0.0, 0.0]],
      num_arrows=-1,
    )
  catch {
    @core.DataError::InvalidStreamplot(message~) =>
      assert_true(message.contains("num_arrows"))
    _ => fail("expected a stream arrow count error")
  } noraise {
    _ => fail("expected a stream arrow count error")
  }
  try
    fig.streamplot(
      [0.0, 1.0],
      [0.0, 1.0],
      [[1.0, 1.0], [1.0, 1.0]],
      [[0.0, 0.0], [0.0, 0.0]],
      integration_direction="sideways",
    )
  catch {
    @core.DataError::InvalidStreamplot(message~) =>
      assert_true(message.contains("integration_direction"))
    _ => fail("expected an integration direction error")
  } noraise {
    _ => fail("expected an integration direction error")
  }
  try
    fig.streamplot(
      [0.0, 1.0],
      [0.0, 1.0],
      [[1.0, 1.0], [1.0, 1.0]],
      [[0.0, 0.0], [0.0, 0.0]],
      start_points=[@core.point(2.0, 0.5)],
    )
  catch {
    @core.DataError::InvalidStreamplot(message~) =>
      assert_true(message.contains("start_points"))
    _ => fail("expected a start point boundary error")
  } noraise {
    _ => fail("expected a start point boundary error")
  }
  try
    fig.streamplot(
      [0.0, 1.0],
      [0.0, 1.0],
      [[1.0, 1.0], [1.0, 1.0]],
      [[0.0, 0.0], [0.0, 0.0]],
      integration_max_step_scale=0.0,
    )
  catch {
    @core.DataError::InvalidStreamplot(message~) =>
      assert_true(message.contains("integration_max_step_scale"))
    _ => fail("expected a maximum step scale error")
  } noraise {
    _ => fail("expected a maximum step scale error")
  }
  try
    fig.streamplot(
      [0.0, 1.0],
      [0.0, 1.0],
      [[1.0, 1.0], [1.0, 1.0]],
      [[0.0, 0.0], [0.0, 0.0]],
      integration_max_error_scale=0.0,
    )
  catch {
    @core.DataError::InvalidStreamplot(message~) =>
      assert_true(message.contains("integration_max_error_scale"))
    _ => fail("expected a maximum error scale error")
  } noraise {
    _ => fail("expected a maximum error scale error")
  }
}

///|
test "streamplot places one arrow per requested arc-length slot" {
  let base = @scene.figure(width=320, height=240)
  ignore(
    try! base.streamplot(
      [0.0, 1.0],
      [0.0, 1.0],
      [[1.0, 1.0], [1.0, 1.0]],
      [[0.0, 0.0], [0.0, 0.0]],
      arrows=false,
      max_steps=3,
    ),
  )
  let with_arrows = @scene.figure(width=320, height=240)
  ignore(
    try! with_arrows.streamplot(
      [0.0, 1.0],
      [0.0, 1.0],
      [[1.0, 1.0], [1.0, 1.0]],
      [[0.0, 0.0], [0.0, 0.0]],
      arrows=true,
      num_arrows=2,
      max_steps=3,
    ),
  )
  let mut base_polygons = 0
  let mut base_lines = 0
  for artist in base.artists() {
    match artist {
      @scene.Artist::Polygon(_, _) => base_polygons += 1
      @scene.Artist::Line(_, _) => base_lines += 1
      _ => ()
    }
  }
  let mut arrow_polygons = 0
  for artist in with_arrows.artists() {
    match artist {
      @scene.Artist::Polygon(_, _) => arrow_polygons += 1
      _ => ()
    }
  }
  assert_eq(base_polygons, 0)
  assert_eq(arrow_polygons, base_lines * 2)
}

///|
test "streamplot honors explicit seeds and integration direction" {
  let forward = @scene.figure(width=320, height=240)
  ignore(
    try! forward.streamplot(
      [0.0, 1.0],
      [0.0, 1.0],
      [[1.0, 1.0], [1.0, 1.0]],
      [[0.0, 0.0], [0.0, 0.0]],
      start_points=[@core.point(0.5, 0.5)],
      integration_direction="forward",
      arrows=false,
      minlength=0.0,
      max_steps=3,
    ),
  )
  let forward_line = match forward.artists()[0] {
    @scene.Artist::Line(points, _) => points
    _ => fail("expected a forward streamline")
  }
  assert_eq(forward_line[0].x(), 0.5)
  assert_true(forward_line[forward_line.length() - 1].x() > 0.5)

  let backward = @scene.figure(width=320, height=240)
  ignore(
    try! backward.streamplot(
      [0.0, 1.0],
      [0.0, 1.0],
      [[1.0, 1.0], [1.0, 1.0]],
      [[0.0, 0.0], [0.0, 0.0]],
      start_points=[@core.point(0.5, 0.5)],
      integration_direction="backward",
      arrows=false,
      minlength=0.0,
      max_steps=3,
    ),
  )
  let backward_line = match backward.artists()[0] {
    @scene.Artist::Line(points, _) => points
    _ => fail("expected a backward streamline")
  }
  assert_true(backward_line[0].x() < 0.5)
  assert_eq(backward_line[backward_line.length() - 1].x(), 0.5)
}

///|
test "streamplot broken_streamlines controls trajectory occupancy" {
  let broken = @scene.figure()
  ignore(
    try! broken.streamplot(
      [0.0, 1.0, 2.0],
      [0.0, 1.0, 2.0],
      [[1.0, 1.0, 1.0], [1.0, 1.0, 1.0], [1.0, 1.0, 1.0]],
      [[0.0, 0.0, 0.0], [0.0, 0.0, 0.0], [0.0, 0.0, 0.0]],
      arrows=false,
      max_steps=20,
      broken_streamlines=true,
    ),
  )
  let unbroken = @scene.figure()
  ignore(
    try! unbroken.streamplot(
      [0.0, 1.0, 2.0],
      [0.0, 1.0, 2.0],
      [[1.0, 1.0, 1.0], [1.0, 1.0, 1.0], [1.0, 1.0, 1.0]],
      [[0.0, 0.0, 0.0], [0.0, 0.0, 0.0], [0.0, 0.0, 0.0]],
      arrows=false,
      max_steps=20,
      broken_streamlines=false,
    ),
  )
  assert_true(broken.artists().length() < unbroken.artists().length())
}

///|
test "streamplot reserves mask cells while integrating each trajectory" {
  let fig = @scene.figure()
  let result = try! fig.streamplot(
    [0.0, 1.0],
    [0.0, 1.0],
    [[1.0, 1.0], [1.0, 1.0]],
    [[0.0, 0.0], [0.0, 0.0]],
    start_points=[@core.point(0.25, 0.5), @core.point(0.75, 0.5)],
    integration_direction="forward",
    broken_streamlines=true,
    arrows=false,
    minlength=0.0,
    max_steps=100,
  )
  // The first trajectory occupies the cells it crosses.  The second seed is
  // encountered inside that occupied run and is rejected before a second
  // line can be created.
  assert_eq(result.lines().length(), 1)
}

///|
test "streamplot density uses the upstream thirty-cell scale" {
  let low = @scene.figure()
  ignore(
    try! low.streamplot(
      [0.0, 1.0],
      [0.0, 1.0],
      [[1.0, 1.0], [1.0, 1.0]],
      [[0.0, 0.0], [0.0, 0.0]],
      density=0.1,
      arrows=false,
      broken_streamlines=false,
      minlength=0.0,
      max_steps=2,
    ),
  )
  let normal = @scene.figure()
  ignore(
    try! normal.streamplot(
      [0.0, 1.0],
      [0.0, 1.0],
      [[1.0, 1.0], [1.0, 1.0]],
      [[0.0, 0.0], [0.0, 0.0]],
      density=1.0,
      arrows=false,
      broken_streamlines=false,
      minlength=0.0,
      max_steps=2,
    ),
  )
  assert_eq(low.artists().length(), 9)
  assert_eq(normal.artists().length(), 900)
}

///|
test "streamplot accepts independent density axes" {
  let fig = @scene.figure()
  ignore(
    try! fig.streamplot(
      [0.0, 1.0],
      [0.0, 1.0],
      [[1.0, 1.0], [1.0, 1.0]],
      [[0.0, 0.0], [0.0, 0.0]],
      density=1.0,
      density_x=0.1,
      density_y=0.2,
      arrows=false,
      broken_streamlines=false,
      minlength=0.0,
      max_steps=2,
    ),
  )
  assert_eq(fig.artists().length(), 18)
}

///|
test "streamplot_mesh accepts regular meshgrid coordinates" {
  let fig = @scene.figure(width=320, height=240)
  ignore(
    try! fig.streamplot_mesh(
      [[0.0, 1.0], [0.0, 1.0]],
      [[0.0, 0.0], [1.0, 1.0]],
      [[1.0, 1.0], [1.0, 1.0]],
      [[0.0, 0.0], [0.0, 0.0]],
      arrows=false,
      density=0.2,
    ),
  )
  assert_true(fig.artists().length() > 0)
}

///|
test "streamplot_mesh rejects non-rectilinear mesh coordinates" {
  let fig = @scene.figure()
  try
    fig.streamplot_mesh(
      [[0.0, 1.0], [0.0, 2.0]],
      [[0.0, 0.0], [1.0, 1.0]],
      [[1.0, 1.0], [1.0, 1.0]],
      [[0.0, 0.0], [0.0, 0.0]],
    )
  catch {
    @core.DataError::InvalidStreamplot(message~) =>
      assert_true(message.contains("rows of streamplot mesh x"))
    _ => fail("expected a mesh coordinate error")
  } noraise {
    _ => fail("expected a mesh coordinate error")
  }
}

///|
test "streamplot returns artists and supports display arrow styles" {
  let fig = @scene.figure(width=320, height=240)
  let result = try! fig.streamplot(
    [0.0, 1.0],
    [0.0, 1.0],
    [[1.0, 1.0], [1.0, 1.0]],
    [[0.0, 0.0], [0.0, 0.0]],
    start_points=[@core.point(0.25, 0.5)],
    arrows=true,
    arrowstyle="-",
    num_arrows=1,
    max_steps=4,
    minlength=0.0,
  )
  assert_true(result.lines().length() > 0)
  assert_eq(result.arrows().length(), 1)
  match result.arrows()[0] {
    @scene.Artist::Line(points, _) => assert_eq(points.length(), 2)
    _ => fail("line arrowstyle should return a line artist")
  }
  assert_true(fig.to_svg().contains("<polyline"))
}

///|
test "streamplot accepts the common FancyArrowPatch arrow styles" {
  let styles = [
    "<-", "->", "<->", "<|-", "<|-|>", "]-", "-[", "]-[", "|-|", "fancy", "simple",
    "wedge",
  ]
  for arrowstyle in styles {
    let fig = @scene.figure(width=320, height=240)
    let result = try! fig.streamplot(
      [0.0, 1.0],
      [0.0, 1.0],
      [[1.0, 1.0], [1.0, 1.0]],
      [[0.0, 0.0], [0.0, 0.0]],
      start_points=[@core.point(0.25, 0.5)],
      arrows=true,
      num_arrows=1,
      arrowstyle~,
      max_steps=4,
      minlength=0.0,
    )
    assert_true(result.arrows().length() > 0)
  }
}

///|
test "streamplot maps grid-valued linewidth and color" {
  let fig = @scene.figure(width=320, height=240)
  let result = try! fig.streamplot_with_style_grids(
    [0.0, 1.0],
    [0.0, 1.0],
    [[1.0, 1.0], [1.0, 1.0]],
    [[0.0, 0.0], [0.0, 0.0]],
    linewidths=[[1.0, 3.0], [1.0, 3.0]],
    color_values=[[0.0, 1.0], [0.0, 1.0]],
    density=0.1,
    arrows=false,
    broken_streamlines=false,
    minlength=0.0,
    max_steps=3,
  )
  assert_true(result.lines().length() > 0)
  let mut saw_varied_width = false
  let mut saw_mapped_color = false
  for artist in result.lines() {
    match artist {
      @scene.Artist::Line(_, style) => {
        if style.width() != 1.0 {
          saw_varied_width = true
        }
        if style.color() != "#1f77b4" {
          saw_mapped_color = true
        }
      }
      _ => ()
    }
  }
  assert_true(saw_varied_width)
  assert_true(saw_mapped_color)
}

///|
test "streamplot rejects malformed style grids and arrow styles" {
  let fig = @scene.figure()
  try
    fig.streamplot_with_style_grids(
      [0.0, 1.0],
      [0.0, 1.0],
      [[1.0, 1.0], [1.0, 1.0]],
      [[0.0, 0.0], [0.0, 0.0]],
      linewidths=[[1.0]],
    )
  catch {
    @core.DataError::InvalidStreamplot(message~) =>
      assert_true(message.contains("linewidth"))
    _ => fail("expected a linewidth grid error")
  } noraise {
    _ => fail("expected a linewidth grid error")
  }
  try
    fig.streamplot(
      [0.0, 1.0],
      [0.0, 1.0],
      [[1.0, 1.0], [1.0, 1.0]],
      [[0.0, 0.0], [0.0, 0.0]],
      arrowstyle="unknown",
    )
  catch {
    @core.DataError::InvalidStreamplot(message~) =>
      assert_true(message.contains("arrowstyle"))
    _ => fail("expected an arrow style error")
  } noraise {
    _ => fail("expected an arrow style error")
  }
}
