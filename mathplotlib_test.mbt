///|
test "point and bounds constructors" {
  let p = @mathplotlib.point(1.5, -2.0)
  assert_true(p.x() == 1.5)
  assert_true(p.y() == -2.0)
  let limits = @mathplotlib.bounds(-1.0, 2.0, -3.0, 4.0)
  ignore(limits)
}

///|
test "line plot renders svg" {
  let fig = @mathplotlib.figure(width=320, height=240)
  fig.set_title("A <line>")
  fig.plot([0.0, 1.0, 2.0], [0.0, 1.0, 0.0])
  let svg = fig.to_svg()
  assert_true(svg.has_prefix("<svg"))
  assert_true(svg.contains("polyline"))
  assert_true(svg.contains("A &lt;line&gt;"))
}

///|
test "scatter and bars render" {
  let fig = @mathplotlib.figure(width=320, height=240)
  fig.scatter([@mathplotlib.point(0.0, 1.0), @mathplotlib.point(1.0, 2.0)])
  fig.bar([@mathplotlib.point(0.0, 1.0), @mathplotlib.point(1.0, 3.0)])
  let svg = fig.to_svg()
  assert_true(svg.contains("circle"))
  assert_true(svg.contains("<rect"))
}

///|
test "non-finite line samples split the path" {
  let fig = @mathplotlib.figure(width=320, height=240)
  fig.line([
    @mathplotlib.point(0.0, 0.0),
    @mathplotlib.point(1.0 / 0.0, 1.0),
    @mathplotlib.point(2.0, 2.0),
  ])
  let svg = fig.to_svg()
  assert_true(!svg.contains("nan"))
  assert_true(!svg.contains("inf"))
  assert_true(svg.contains("<polyline"))
}

///|
test "explicit bounds preserve direction and edges" {
  let fig = @mathplotlib.figure(width=200, height=200)
  fig.set_bounds(@mathplotlib.bounds(10.0, 0.0, 20.0, 0.0))
  fig.line([@mathplotlib.point(10.0, 0.0), @mathplotlib.point(0.0, 20.0)])
  let svg = fig.to_svg()
  assert_true(svg.contains("points=\"56,56 144,144\""))
}

///|
test "plot rejects mismatched arrays" {
  try @mathplotlib.plot_svg([0.0, 1.0], [2.0]) catch {
    @mathplotlib.DataError::LengthMismatch(expected~, actual~) => {
      assert_eq(expected, 2)
      assert_eq(actual, 1)
    }
    @mathplotlib.DataError::NonFiniteLimit(_) => fail("unexpected limit error")
    @mathplotlib.DataError::InvalidErrorBar(_) =>
      fail("unexpected error bar error")
    @mathplotlib.DataError::InvalidBins => fail("unexpected histogram error")
    @mathplotlib.DataError::InvalidImage(_) => fail("unexpected image error")
    @mathplotlib.DataError::InvalidPie(_) => fail("unexpected pie error")
    @mathplotlib.DataError::InvalidBoxPlot(_) =>
      fail("unexpected boxplot error")
    @mathplotlib.DataError::InvalidQuiver(_) => fail("unexpected quiver error")
    @mathplotlib.DataError::InvalidViolin(_) => fail("unexpected violin error")
    @mathplotlib.DataError::InvalidContour(_) =>
      fail("unexpected contour error")
    @mathplotlib.DataError::InvalidAnnotation(_) =>
      fail("unexpected annotation error")
    @mathplotlib.DataError::InvalidReference(_) =>
      fail("unexpected reference error")
    @mathplotlib.DataError::InvalidStreamplot(_) =>
      fail("unexpected streamplot error")
    @mathplotlib.DataError::InvalidStatistics(_) =>
      fail("unexpected statistics error")
    @mathplotlib.DataError::InvalidTicks(_) => fail("unexpected tick error")
    @mathplotlib.DataError::InvalidCollection(_) =>
      fail("unexpected collection error")
  } noraise {
    _ => fail("expected a length mismatch")
  }
}

///|
test "extended artists render through the scene backend" {
  let fig = @mathplotlib.figure(width=320, height=240)
  try! fig.fill_between([0.0, 1.0, 2.0], [0.0, 0.5, 0.0], [1.0, 1.5, 1.0])
  try! fig.barh([0.0, 1.0], [2.0, 1.0])
  fig.axhline(0.5)
  fig.axvline(1.0)
  fig.text(1.0, 1.0, "label <x>")
  let svg = fig.to_svg()
  assert_true(svg.contains("<polygon"))
  assert_true(svg.contains("<rect"))
  assert_true(svg.contains("label &lt;x&gt;"))
}
