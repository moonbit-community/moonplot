///|
fn semantic_axes() -> (Figure, Axes) raise {
  let figure = figure(width=400, height=200)
  let axes = figure.add_axes(0.0, 0.0, 1.0, 1.0)
  axes.set_x_limits(0.0, 4.0)
  axes.set_y_limits(-4.0, 8.0)
  for axis in [axes.x_axis(), axes.y_axis()] {
    axis.set_locator(@ticker.NullLocator::new().as_locator())
    axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  }
  (figure, axes)
}

///|
test "embedded SVG legends exclude line snapping in each actual corner" {
  let figure = figure(width=400, height=200)
  let axes = figure.add_axes(0.0, 0.0, 1.0, 1.0)
  axes.set_x_limits(0.0, 4.0)
  axes.set_y_limits(0.0, 10.0)
  axes.plot([1.0, 3.0], [4.0, 8.0], label="Measured")
  for
    (corner, x, y) in [
      (LegendPosition::UpperRight, 300.0, 24.0),
      (LegendPosition::UpperLeft, 50.0, 24.0),
      (LegendPosition::LowerRight, 300.0, 176.0),
      (LegendPosition::LowerLeft, 50.0, 176.0),
    ] {
    axes.set_legend_position(corner)
    let snapshot = figure.to_drawing()
    assert_eq(snapshot.svg(), figure.to_svg_checked())
    assert_eq(snapshot.hit_test(x, y, mode=@drawing.HitMode::XNearest), None)
    assert_eq(
      snapshot.hit_test_client(
        x / 2.0,
        y / 2.0,
        0.0,
        0.0,
        200.0,
        100.0,
        mode=@drawing.HitMode::XNearest,
      ),
      None,
    )
    assert_true(
      snapshot.hit_test(200.0, 100.0, mode=@drawing.HitMode::XNearest)
      is Some(_),
    )
  }
}

///|
test "bar and barh use the whole painted rectangle with source indices and clipping" {
  let (figure, axes) = semantic_axes()
  axes.bar(
    [@core.point(1.0, 6.0), @core.point(2.0, 0.0 / 0.0), @core.point(3.0, -2.0)],
    label="Revenue",
  )
  let drawing = figure.to_drawing()
  assert_eq(drawing.svg(), figure.to_svg_checked())
  let targets = drawing.targets()
  assert_eq(targets.length(), 2)
  assert_eq(targets.map(t => t.info.point.point_index), [0, 2])
  assert_eq(targets.map(t => t.info.series), ["Revenue", "Revenue"])
  assert_eq(targets.map(t => t.info.value), [6.0, -2.0])
  assert_eq(targets[0].info.kind, @drawing.HitKind::Bar)
  guard targets[0].shape is @drawing.HitShape::Rectangle(x, y, w, h) else {
    fail("bar target must use its painted rectangle")
  }
  assert_eq(
    drawing.hit_test(x + w * 0.1, y + h * 0.8, radius=0.0),
    Some(targets[0].info.point),
  )
  assert_eq(drawing.hit_test(-1.0, 50.0, radius=100.0), None)
  assert_eq(targets[0].bounds, (0.0, 0.0, 400.0, 200.0))
  axes.clear()
  axes.set_x_limits(-4.0, 4.0)
  axes.set_y_limits(0.0, 4.0)
  axes.barh([1.0, 2.0, 3.0], [3.0, 0.0 / 0.0, -2.0], label="Horizontal")
  let horizontal = figure.to_drawing()
  assert_eq(horizontal.svg(), figure.to_svg_checked())
  assert_eq(horizontal.targets().map(t => t.info.point.point_index), [0, 2])
  assert_eq(horizontal.targets().map(t => t.info.value), [3.0, -2.0])
  assert_true(
    horizontal.targets().all(t => t.info.kind == @drawing.HitKind::BarH),
  )
  for target in horizontal.targets() {
    guard target.shape is @drawing.HitShape::Rectangle(x, y, w, h) else {
      fail("expected rect")
    }
    assert_eq(
      horizontal.hit_test(x + w * 0.85, y + h * 0.2, radius=0.0),
      Some(target.info.point),
    )
  }
}

///|
test "bar targets retain valid positive geometry on log and inverted scales" {
  let (figure, axes) = semantic_axes()
  axes.set_x_limits(4.0, 0.0)
  axes.set_y_scale(@scale.log_scale())
  axes.set_y_limits(100.0, 1.0)
  axes.bar([
    @core.point(1.0, 10.0),
    @core.point(2.0, -1.0),
    @core.point(3.0, 1000.0),
  ])
  let drawing = figure.to_drawing()
  assert_eq(drawing.svg(), figure.to_svg_checked())
  assert_eq(drawing.targets().map(t => t.info.point.point_index), [0])
  guard drawing.targets()[0].shape is @drawing.HitShape::Rectangle(x, y, w, h) else {
    fail("expected rect")
  }
  assert_true(w > 0.0 && h > 0.0)
  assert_eq(
    drawing.hit_test(x + w / 2.0, y + h / 2.0, radius=0.0),
    Some(drawing.points()[0]),
  )
  assert_eq(drawing.hit_test(300.0, -1.0, radius=100.0), None)
}

///|
test "series labels follow stable artist identity across equal colors and line removal" {
  let (figure, axes) = semantic_axes()
  let first = axes.plot_line(
    LineData::Numeric([1.0, 2.0]),
    LineData::Numeric([1.0, 2.0]),
    color="red",
    label="First",
  )
  let second = axes.plot_line(
    LineData::Numeric([1.0, 2.0]),
    LineData::Numeric([5.0, 6.0]),
    color="red",
    label="Second",
  )
  axes.scatter([@core.point(3.0, 3.0)], color="red", label="Second")
  let original = figure.to_drawing()
  assert_eq(original.targets().map(t => t.info.series), [
    "First", "First", "Second", "Second", "Second",
  ])
  first.remove()
  let current = figure.to_drawing()
  assert_eq(current.targets().map(t => t.info.series), [
    "Second", "Second", "Second",
  ])
  assert_eq(current.targets().map(t => t.info.point.artist_index), [0, 0, 1])
  second.set_data(LineData::Numeric([1.5]), LineData::Numeric([7.0]))
  let newer = figure.to_drawing()
  assert_eq(newer.targets()[0].info.series, "Second")
  assert_eq(newer.targets()[0].info.value, 7.0)
  assert_eq(original.targets()[0].info.series, "First")
  assert_eq(original.targets()[2].info.value, 5.0)
  axes.clear()
  axes.scatter([@core.point(1.0, 1.0)])
  assert_eq(figure.to_drawing().targets()[0].info.series, "")
}

///|
test "category metadata uses current axis units and captures numeric value on either axis" {
  let (figure, axes) = semantic_axes()
  axes.plot_category(["alpha", "beta"], [2.0, 4.0], label="Line")
  axes.scatter_category(["alpha", "beta"], [3.0, 5.0], label="Points")
  axes.bar_category(["alpha", "beta"], [1.0, 2.0], label="Bars")
  let snapshot = figure.to_drawing()
  assert_eq(snapshot.targets().map(t => t.info.category), [
    Some("alpha"),
    Some("beta"),
    Some("alpha"),
    Some("beta"),
    Some("alpha"),
    Some("beta"),
  ])
  axes.set_x_categories(["new-alpha", "new-beta"])
  assert_eq(figure.to_drawing().targets()[2].info.category, Some("new-alpha"))
  assert_eq(snapshot.targets()[2].info.category, Some("alpha"))
  axes.clear()
  axes.set_x_limits(0.0, 8.0)
  axes.set_y_limits(-0.5, 1.5)
  axes.plot_category_y([2.0, 4.0], ["first", "second"], label="Y categories")
  axes.scatter_category_y([3.0, 5.0], ["first", "second"], label="Y points")
  let vertical = figure.to_drawing()
  assert_eq(vertical.targets().map(t => t.info.value), [2.0, 4.0, 3.0, 5.0])
  assert_eq(vertical.targets().map(t => t.info.category), [
    Some("first"),
    Some("second"),
    Some("first"),
    Some("second"),
  ])
}

///|
test "histogram targets preserve exact bin intervals counts and defensive snapshots" {
  let (figure, axes) = semantic_axes()
  let input = [0.0, 0.2, 1.8, 2.0, 3.0]
  let histogram = axes.hist(input, bins=3, label="Frequency")
  let edges = histogram.edges()
  let counts = histogram.counts()
  let drawing = figure.to_drawing()
  assert_eq(drawing.svg(), figure.to_svg_checked())
  assert_eq(drawing.targets().length(), 3)
  for index, target in drawing.targets() {
    assert_eq(target.info.kind, @drawing.HitKind::Histogram)
    assert_eq(target.info.series, "Frequency")
    assert_eq(target.info.interval, Some((edges[index], edges[index + 1])))
    assert_eq(target.info.value, counts[index])
  }
  input[0] = 100.0
  edges[0] = -100.0
  counts[0] = -100.0
  drawing.targets().clear()
  assert_eq(drawing.targets()[0].info.interval, Some((0.0, 1.0)))
  assert_eq(drawing.targets()[0].info.value, 2.0)
  assert_eq(figure.to_drawing().targets()[0].info.interval, Some((0.0, 1.0)))
  axes.clear()
  axes.bar([@core.point(1.0, 2.0)], label="Plain bar")
  assert_eq(figure.to_drawing().targets()[0].info.kind, @drawing.HitKind::Bar)
  assert_eq(figure.to_drawing().targets()[0].info.interval, None)
}

///|
test "pie targets match actual zero wrap and full-circle wedge geometry" {
  let (figure, axes) = semantic_axes()
  ignore(
    axes.pie(
      [0.0, 1.0, 3.0],
      labels=["Zero", "Small", "Large"],
      start_angle=450.0,
    ),
  )
  let drawing = figure.to_drawing()
  assert_eq(drawing.svg(), figure.to_svg_checked())
  assert_eq(drawing.targets().map(t => t.info.point.point_index), [1, 2])
  assert_eq(drawing.targets().map(t => t.info.value), [1.0, 3.0])
  assert_eq(drawing.targets().map(t => t.info.fraction), [
    Some(0.25),
    Some(0.75),
  ])
  assert_eq(drawing.targets().map(t => t.info.category), [
    Some("Small"),
    Some("Large"),
  ])
  for target in drawing.targets() {
    assert_eq(target.info.kind, @drawing.HitKind::Pie)
    assert_eq(
      drawing.hit_test(
        target.info.point.screen_x,
        target.info.point.screen_y,
        radius=0.0,
      ),
      Some(target.info.point),
    )
  }
  axes.clear()
  ignore(axes.pie([0.0, 5.0], labels=["Zero", "Whole"], start_angle=-720.0))
  let full = figure.to_drawing()
  assert_eq(full.targets().length(), 1)
  assert_eq(full.targets()[0].info.fraction, Some(1.0))
  guard full.targets()[0].shape
    is @drawing.HitShape::Sector(cx, cy, r, start, sweep) else {
    fail("expected sector")
  }
  assert_eq((start, sweep), (-720.0, 360.0))
  for (dx, dy) in [(0.5, 0.0), (-0.5, 0.0), (0.0, 0.5), (0.0, -0.5)] {
    assert_eq(
      full.hit_test(cx + dx * r, cy + dy * r, radius=0.0),
      Some(full.points()[0]),
    )
  }
}

///|
test "line XNearest resolves actual unexpanded sample and current semantic values" {
  let (figure, axes) = semantic_axes()
  let line = axes.plot_line(
    LineData::Numeric([0.5, 1.5, 0.0 / 0.0, 3.5]),
    LineData::Numeric([1.0, 6.0, 7.0, 4.0]),
    label="Samples",
  )
  line.set_drawstyle("steps-mid")
  line.set_linestyle("--")
  line.set_gapcolor(Some("red"))
  let drawing = figure.to_drawing()
  assert_eq(drawing.targets().map(t => t.info.point.point_index), [0, 1, 3])
  let point = drawing
    .hit_test(155.0, 195.0, radius=1.0, mode=@drawing.HitMode::XNearest)
    .unwrap()
  assert_eq((point.point_index, point.data_x, point.data_y), (1, 1.5, 6.0))
  assert_eq(drawing.hit_info(point).unwrap().series, "Samples")
  assert_eq(drawing.svg(), figure.to_svg_checked())
}

///|
test "horizontal categorical bars and collections retain series and displayed category" {
  let (figure, axes) = semantic_axes()
  axes.set_x_limits(-4.0, 8.0)
  axes.set_y_limits(-0.5, 2.5)
  axes.bar_category_y([3.0, -2.0], ["first", "second"], label="Bars")
  ignore(
    axes.scatter_collection(
      [@core.point(5.0, 0.0), @core.point(6.0, 1.0)],
      label="Collection",
    ),
  )
  let drawing = figure.to_drawing()
  assert_eq(drawing.targets().map(t => t.info.series), [
    "Bars", "Bars", "Collection", "Collection",
  ])
  assert_eq(drawing.targets().map(t => t.info.category), [
    Some("first"),
    Some("second"),
    Some("first"),
    Some("second"),
  ])
  assert_eq(drawing.targets().map(t => t.info.value), [3.0, -2.0, 5.0, 6.0])
  assert_eq(drawing.targets().map(t => t.info.kind), [
    @drawing.HitKind::BarH,
    @drawing.HitKind::BarH,
    @drawing.HitKind::Scatter,
    @drawing.HitKind::Scatter,
  ])
  assert_eq(drawing.svg(), figure.to_svg_checked())
}
