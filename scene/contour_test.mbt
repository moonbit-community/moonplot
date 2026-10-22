///|
test "contour and contourf expose levels and render geometry" {
  let fig = @scene.figure(width=360, height=240)
  let lines = try! fig.contour(
    [[0.0, 1.0, 2.0], [1.0, 2.0, 3.0], [2.0, 3.0, 4.0]],
    x=[10.0, 20.0, 30.0],
    y=[-1.0, 0.0, 1.0],
    levels=[1.0, 2.0, 3.0],
    color="#123456",
    linewidth=1.25,
    label="isolines",
  )
  assert_eq(lines.levels(), [1.0, 2.0, 3.0])
  assert_true(!lines.filled())
  assert_eq(lines.segment_levels().length(), lines.segments().length())
  assert_eq(lines.allsegs().length(), 3)
  try! fig.clabel(lines, fontsize=18, color="#abcdef")
  let filled = try! fig.contourf(
    [[0.0, 1.0, 2.0], [1.0, 2.0, 3.0], [2.0, 3.0, 4.0]],
    x=[10.0, 20.0, 30.0],
    y=[-1.0, 0.0, 1.0],
    levels=[0.0, 2.0, 4.0],
    colors=["#abcdef", "#fedcba"],
    label="bands",
  )
  assert_eq(filled.levels(), [0.0, 2.0, 4.0])
  assert_true(filled.filled())
  assert_eq(filled.layers(), [1.0, 3.0])
  let svg = fig.to_svg()
  assert_true(svg.contains("#123456"))
  assert_true(svg.contains("#abcdef"))
  assert_true(svg.contains("font-size=\"18"))
  assert_true(svg.contains("#abcdef"))
  assert_true(svg.contains("<polygon"))
  assert_true(svg.contains("isolines"))
  assert_true(svg.contains("bands"))
}

///|
test "contour clabel inline removes a gap from the representative line" {
  let plain = @scene.figure()
  let plain_lines = try! plain.contour([[0.0, 1.0], [1.0, 2.0]], levels=[0.5])
  let plain_before = plain.artists().length()
  try! plain.clabel(plain_lines, inline=false)
  assert_eq(plain.artists().length(), plain_before + 1)

  let inline = @scene.figure()
  let inline_lines = try! inline.contour([[0.0, 1.0], [1.0, 2.0]], levels=[0.5])
  let inline_before = inline.artists().length()
  try! inline.clabel(inline_lines, inline=true)
  assert_true(inline.artists().length() > inline_before + 1)
}

///|
test "regular contour joins cell crossings into a closed path" {
  let fig = @scene.figure()
  let contours = try! fig.contour(
    [[2.0, 2.0, 2.0], [2.0, 0.0, 2.0], [2.0, 2.0, 2.0]],
    levels=[1.5],
  )
  assert_eq(contours.segments.length(), 1)
  assert_true(contours.segments[0].length() > 4)
  let first = contours.segments[0][0]
  let last = contours.segments[0][contours.segments[0].length() - 1]
  assert_true(
    Double::abs(first.x() - last.x()) < 1.0e-10 &&
    Double::abs(first.y() - last.y()) < 1.0e-10,
  )
}

///|
test "regular filled contour unions adjacent clipped triangles" {
  let fig = @scene.figure()
  let result = try! fig.contourf([[0.0, 1.0], [1.0, 2.0]], levels=[0.5, 1.5], colors=[
    "#abcdef",
  ])
  assert_true(result.filled())
  assert_eq(fig.artists().length(), 1)
}

///|
test "contour accepts per-level colors and linewidths" {
  let fig = @scene.figure()
  ignore(
    try! fig.contour(
      [[0.0, 1.0], [1.0, 2.0]],
      levels=[0.5, 1.5],
      colors=["#111111", "#222222"],
      linewidths=[0.5, 2.0],
    ),
  )
  match (fig.artists()[0], fig.artists()[1]) {
    (@scene.Artist::Line(_, first), @scene.Artist::Line(_, second)) => {
      assert_eq(first.color(), "#111111")
      assert_eq(first.width(), 0.5)
      assert_eq(second.color(), "#222222")
      assert_eq(second.width(), 2.0)
    }
    _ => fail("expected one line artist for each contour level")
  }
}

///|
test "contour auto levels and missing cells remain finite" {
  let fig = @scene.figure(width=320, height=220)
  let lines = try! fig.contour(
    [[0.0, 1.0, 2.0], [1.0, 0.0 / 0.0, 3.0], [2.0, 3.0, 4.0]],
    nlevels=4,
  )
  assert_eq(lines.levels().length(), 4)
  let filled = try! fig.contourf(
    [[0.0, 1.0], [1.0, 2.0]],
    nlevels=3,
    cmap="plasma",
  )
  assert_eq(filled.levels().length(), 4)
  let svg = fig.to_svg()
  assert_true(!svg.contains("NaN"))
  assert_true(!svg.contains("Infinity"))
}

///|
test "contour accepts linear, fixed, and logarithmic locators" {
  let fixed = try! @ticker.fixed_locator([0.5, 1.5, 2.5])
  let fixed_fig = @scene.figure()
  let fixed_lines = try! fixed_fig.contour(
    [[0.0, 1.0], [2.0, 3.0]],
    locator=fixed,
  )
  assert_eq(fixed_lines.levels(), [0.5, 1.5, 2.5])

  let linear_fig = @scene.figure()
  let linear_lines = try! linear_fig.contour(
    [[0.0, 1.0], [2.0, 3.0]],
    locator=@ticker.linear_locator(count=3),
  )
  assert_eq(linear_lines.levels(), [0.0, 1.5, 3.0])

  let log_fig = @scene.figure()
  let log_bands = try! log_fig.contourf(
    [[1.0, 10.0], [100.0, 1000.0]],
    locator=try! @ticker.log_locator(base=10.0),
  )
  assert_eq(log_bands.levels(), [1.0, 10.0, 100.0, 1000.0])
}

///|
test "contour rejects a locator that cannot produce filled levels" {
  let fixed = try! @ticker.fixed_locator([2.0])
  try @scene.figure().contourf([[0.0, 1.0], [1.0, 2.0]], locator=fixed) catch {
    @core.DataError::InvalidContour(message~) =>
      assert_true(message.contains("locator levels"))
    _ => fail("expected a locator level error")
  } noraise {
    _ => fail("expected a locator level error")
  }
}

///|
test "contour validates grid, coordinates, levels, and styles" {
  let fig = @scene.figure()
  try fig.contour([[0.0, 1.0], [1.0]], levels=[0.5]) catch {
    @core.DataError::InvalidContour(message~) =>
      assert_true(message.contains("equal length"))
    _ => fail("expected a grid shape error")
  } noraise {
    _ => fail("expected a grid shape error")
  }
  try fig.contour([[0.0, 1.0], [1.0, 2.0]], x=[0.0, 1.0], y=[0.0, 0.0]) catch {
    @core.DataError::InvalidContour(message~) =>
      assert_true(message.contains("monotonic"))
    _ => fail("expected a coordinate order error")
  } noraise {
    _ => fail("expected a coordinate order error")
  }
  try fig.contour([[0.0, 1.0], [1.0, 2.0]], x=[0.0, 1.0]) catch {
    @core.DataError::InvalidContour(message~) =>
      assert_true(message.contains("supplied together"))
    _ => fail("expected a coordinate pairing error")
  } noraise {
    _ => fail("expected a coordinate pairing error")
  }
  try fig.contour([[0.0, 1.0], [1.0, 2.0]], levels=[2.0, 1.0]) catch {
    @core.DataError::InvalidContour(message~) =>
      assert_true(message.contains("increasing"))
    _ => fail("expected a level order error")
  } noraise {
    _ => fail("expected a level order error")
  }
  try fig.contourf([[0.0, 1.0], [1.0, 2.0]], levels=[1.0]) catch {
    @core.DataError::InvalidContour(message~) =>
      assert_true(message.contains("two levels"))
    _ => fail("expected a filled level error")
  } noraise {
    _ => fail("expected a filled level error")
  }
  try fig.contour([[0.0, 1.0], [1.0, 2.0]], linewidth=-1.0) catch {
    @core.DataError::InvalidContour(message~) =>
      assert_true(message.contains("linewidth"))
    _ => fail("expected a linewidth error")
  } noraise {
    _ => fail("expected a linewidth error")
  }
  let lines = try! fig.contour([[0.0, 1.0], [1.0, 2.0]], levels=[0.5, 1.5])
  try fig.clabel(lines, fontsize=0) catch {
    @core.DataError::InvalidContour(message~) =>
      assert_true(message.contains("fontsize"))
    _ => fail("expected a contour label error")
  } noraise {
    _ => fail("expected a contour label error")
  }
}

///|
test "filled contours render under and over extension bands" {
  let base = @scene.figure()
  let regular = try! base.contourf(
    [[0.0, 2.0], [2.0, 4.0]],
    levels=[1.0, 3.0],
    colors=["#111111"],
  )
  let extended = @scene.figure()
  let both = try! extended.contourf(
    [[0.0, 2.0], [2.0, 4.0]],
    levels=[1.0, 3.0],
    colors=["#111111", "#222222", "#333333"],
    extend_mode="both",
  )
  assert_eq(regular.extend_mode(), "neither")
  assert_eq(both.extend_mode(), "both")
  assert_true(extended.artists().length() > base.artists().length())
  let svg = extended.to_svg()
  assert_true(svg.contains("#111111"))
  assert_true(svg.contains("#333333"))
  try
    extended.contourf(
      [[0.0, 1.0], [1.0, 2.0]],
      levels=[0.5, 1.5],
      extend_mode="outside",
    )
  catch {
    @core.DataError::InvalidContour(message~) =>
      assert_true(message.contains("extend"))
    _ => fail("expected an invalid contour extension")
  } noraise {
    _ => fail("expected an invalid contour extension")
  }
}

///|
test "corner_mask controls cells containing non-finite corners" {
  let data = [[0.0, 2.0], [0.0 / 0.0, 4.0]]
  let clipped = @scene.figure()
  let clipped_set = try! clipped.contour(data, levels=[1.0], corner_mask=true)
  let masked = @scene.figure()
  let masked_set = try! masked.contour(data, levels=[1.0], corner_mask=false)
  assert_true(clipped_set.corner_mask())
  assert_true(!masked_set.corner_mask())
  assert_true(clipped.artists().length() > 0)
  assert_eq(masked.artists().length(), 0)
  let filled_clipped = @scene.figure()
  ignore(
    try! filled_clipped.contourf(data, levels=[0.5, 1.5, 3.5], corner_mask=true),
  )
  let filled_masked = @scene.figure()
  ignore(
    try! filled_masked.contourf(data, levels=[0.5, 1.5, 3.5], corner_mask=false),
  )
  assert_true(
    filled_clipped.artists().length() > filled_masked.artists().length(),
  )
}
