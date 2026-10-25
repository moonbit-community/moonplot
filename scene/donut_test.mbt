///|
fn expect_invalid_donut(
  draw : () -> Array[Double] raise @core.DataError,
) -> Unit raise {
  try draw() catch {
    @core.DataError::InvalidPie(_) => ()
    _ => fail("expected InvalidPie")
  } noraise {
    _ => fail("expected donut validation failure")
  }
}

///|
test "donut has real annular geometry and shares the pie metadata and fractions" {
  let fig = @scene.figure(width=400, height=200)
  let ax = try! fig.add_axes(0.0, 0.0, 1.0, 1.0)
  let values = [0.0, 1.0, 3.0]
  let labels = ["Zero", "Small", "Large"]
  let fractions = try! ax.donut(
    values,
    labels~,
    colors=["red", "green", "blue"],
    start_angle=315.0,
  )
  values[1] = 99.0
  labels[1] = "changed"
  assert_eq(fractions, [0.0, 0.25, 0.75])
  let frame = try! fig.to_drawing()
  assert_eq(frame.svg(), try! fig.to_svg_checked())
  assert_eq(frame.targets().length(), 2)
  assert_eq(frame.targets().map(t => t.info.point.point_index), [1, 2])
  assert_eq(frame.targets().map(t => t.info.value), [1.0, 3.0])
  assert_eq(frame.targets().map(t => t.info.category), [
    Some("Small"),
    Some("Large"),
  ])
  assert_eq(frame.targets().map(t => t.info.fraction), [Some(0.25), Some(0.75)])
  assert_true(frame.svg().contains("fill-rule=\"evenodd\""))
  for target in frame.targets() {
    assert_eq(target.info.kind, @drawing.HitKind::Pie)
    guard target.shape
      is @drawing.HitShape::AnnularSector(cx, cy, inner, outer, _, _) else {
      fail("expected the same annular sector as rendered")
    }
    assert_eq((cx, cy, outer), (200.0, 100.0, 64.0))
    assert_eq(inner, outer * 0.55)
    assert_eq(
      frame.hit_test(
        target.info.point.screen_x,
        target.info.point.screen_y,
        radius=0.0,
      ),
      Some(target.info.point),
    )
    assert_eq(frame.hit_test(cx, cy, radius=1000.0), None)
    assert_eq(frame.hit_test(cx + inner - 0.01, cy, radius=1000.0), None)
    assert_eq(frame.hit_test(cx + outer + 0.01, cy, radius=1000.0), None)
  }
  assert_eq(try! fig.to_drawing().svg(), frame.svg())
}

///|
test "single slice donut closes both contours and includes inner and outer edges" {
  let fig = @scene.figure(width=400, height=200)
  let ax = try! fig.add_axes(0.0, 0.0, 1.0, 1.0)
  ignore(
    try! ax.donut(
      [0.0, 5.0],
      labels=["None", "All"],
      inner_radius=0.5,
      start_angle=-720.0,
    ),
  )
  let frame = try! fig.to_drawing()
  assert_eq(frame.targets().length(), 1)
  let target = frame.targets()[0]
  assert_eq(target.info.point.point_index, 1)
  assert_eq((target.info.value, target.info.fraction), (5.0, Some(1.0)))
  guard target.shape
    is @drawing.HitShape::AnnularSector(cx, cy, inner, outer, start, sweep) else {
    fail("expected annulus")
  }
  assert_eq((start, sweep), (0.0, 360.0))
  for r in [inner, (inner + outer) / 2.0, outer] {
    for (dx, dy) in [(1.0, 0.0), (-1.0, 0.0), (0.0, 1.0), (0.0, -1.0)] {
      assert_eq(
        frame.hit_test(cx + dx * r, cy + dy * r, radius=0.0),
        Some(target.info.point),
      )
    }
  }
  assert_true(frame.svg().contains("A 64,64 0 1 0"))
  assert_true(frame.svg().contains("A 32,32 0 1 1"))
  assert_eq(frame.hit_test(cx, cy), None)
}

///|
test "zero inner radius produces the existing pie SVG without changing ordinary pie" {
  let pie = @scene.figure(width=320, height=240)
  let donut = @scene.figure(width=320, height=240)
  ignore(
    try! pie.pie(
      [1.0, 2.0, 3.0],
      labels=["one", "two", "three"],
      colors=["red", "green", "blue"],
      start_angle=315.0,
    ),
  )
  ignore(
    try! donut.donut(
      [1.0, 2.0, 3.0],
      labels=["one", "two", "three"],
      colors=["red", "green", "blue"],
      start_angle=315.0,
      inner_radius=0.0,
    ),
  )
  assert_eq(pie.to_svg(), donut.to_svg())
  let frame = try! donut.to_drawing()
  guard frame.targets()[0].shape
    is @drawing.HitShape::AnnularSector(cx, cy, inner, _, _, _) else {
    fail("annular target")
  }
  assert_eq(inner, 0.0)
  assert_true(frame.hit_test(cx, cy, radius=0.0) is Some(_))
}

///|
test "donut rejects invalid radii and pie data before adding artists" {
  for radius in [-0.01, 1.0, 1.01, 0.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0] {
    let fig = @scene.figure()
    expect_invalid_donut(() => fig.donut([1.0], inner_radius=radius))
    assert_eq(fig.artists().length(), 0)
  }
  for
    values in [[], [0.0], [-1.0], [0.0 / 0.0], [1.0 / 0.0], [1.0e308, 1.0e308]] {
    let fig = @scene.figure()
    expect_invalid_donut(() => fig.donut(values))
    assert_eq(fig.artists().length(), 0)
  }
  let fig = @scene.figure()
  expect_invalid_donut(() => fig.donut([1.0, 2.0], labels=["one"]))
  expect_invalid_donut(() => fig.donut([1.0, 2.0], colors=["red"]))
  expect_invalid_donut(() => fig.donut([1.0], colors=["not-a-color"]))
  expect_invalid_donut(() => fig.donut([1.0], start_angle=1.0 / 0.0))
  assert_eq(fig.artists().length(), 0)
}

///|
test "donut containers and artist queries are independent immutable copies" {
  let fig = @scene.figure()
  ignore(try! fig.donut([1.0, 2.0], labels=["A", "B"], inner_radius=0.7))
  let container = fig.containers()[0]
  assert_true(container.kind() is @scene.ContainerKind::Pie)
  for artist in [fig.artists()[0], container.artists()[0]] {
    guard artist is @scene.Artist::Donut(values, labels, _, _, inner) else {
      fail("donut primitive")
    }
    assert_eq(inner, 0.7)
    values[0] = 42.0
    labels[0] = "changed"
  }
  let frame = try! fig.to_drawing()
  assert_eq(frame.targets()[0].info.value, 1.0)
  assert_eq(frame.targets()[0].info.category, Some("A"))
}

///|
test "donut clear rebuild and multiple panels retain current frame indices and holes" {
  let fig = @scene.figure(width=400, height=200)
  let left = try! fig.add_axes(0.0, 0.0, 0.5, 1.0)
  let right = try! fig.add_axes(0.5, 0.0, 0.5, 1.0)
  ignore(try! left.donut([1.0, 3.0], labels=["old", "rest"]))
  ignore(try! right.donut([2.0], labels=["right"], inner_radius=0.4))
  let before = try! fig.to_drawing()
  assert_eq(before.targets().map(t => t.info.point.panel_index), [0, 0, 1])
  assert_eq(before.hit_test(100.0, 100.0), None)
  assert_eq(before.hit_test(300.0, 100.0), None)
  left.clear()
  ignore(try! left.donut([0.0, 7.0], labels=["zero", "new"], inner_radius=0.7))
  let after = try! fig.to_drawing()
  assert_eq(after.targets().map(t => t.info.point.panel_index), [0, 1])
  assert_eq(after.targets()[0].info.point.point_index, 1)
  assert_eq(after.targets()[0].info.category, Some("new"))
  assert_eq(after.targets()[0].info.value, 7.0)
  assert_eq(before.targets()[0].info.category, Some("old"))
  assert_eq(before.targets()[0].info.value, 1.0)
  assert_eq(before.targets()[2], after.targets()[1])
  for target in after.targets() {
    assert_eq(
      after.hit_test(target.info.point.screen_x, target.info.point.screen_y),
      Some(target.info.point),
    )
  }
  assert_eq(after.hit_test(200.0, 100.0), None)
}

///|
test "donut finite extreme rotation remains finite and thin valid rings stay interactive" {
  let fig = @scene.figure(width=400, height=200)
  let ax = try! fig.add_axes(0.0, 0.0, 1.0, 1.0)
  ignore(try! ax.donut([1.0], start_angle=1.0e308, inner_radius=0.999))
  let frame = try! fig.to_drawing()
  assert_false(frame.svg().contains("NaN"))
  assert_false(frame.svg().contains("Infinity"))
  let point = frame.targets()[0].info.point
  assert_eq(
    frame.hit_test(point.screen_x, point.screen_y, radius=0.0),
    Some(point),
  )
  assert_eq(frame.hit_test(200.0, 100.0), None)
}
