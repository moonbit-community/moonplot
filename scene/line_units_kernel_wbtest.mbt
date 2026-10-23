///|
test "forced Line recache does not itself relim or request a view" {
  let axes = figure().axes()
  axes.attach_line_with_originals(
    [@core.point(1.0, 10.0), @core.point(2.0, 20.0)],
    Numeric([5.0, 6.0]),
    Numeric([10.0, 20.0]),
  )
  axes.unstale_view()
  let original = axes.state.val.line_originals[0]
  axes.recache_line_units()
  assert_eq(original.points.map(point => point.x()), [5.0, 6.0])
  assert_eq(axes.data_limits().lower(), 1.0)
  assert_eq(axes.data_limits().upper(), 2.0)
  assert_true(!axes.x_axis().autoscale_stale())
  assert_true(!axes.y_axis().autoscale_stale())
}

///|
test "Line recache broadcasts privately without replacing original arrays" {
  let axes = figure().axes()
  axes.attach_line_with_originals(
    [@core.point(1.0, 10.0), @core.point(2.0, 20.0)],
    Numeric([7.0]),
    Numeric([10.0, 20.0]),
  )
  let original = axes.state.val.line_originals[0]
  axes.recache_line_units()
  assert_eq(original.points.map(point => point.x()), [7.0, 7.0])
  guard original.x is Numeric(values) else { fail("numeric originals") }
  assert_eq(values, [7.0])
  guard original.y is Numeric(ys) else { fail("numeric originals") }
  ys.clear()
  axes.recache_line_units()
  assert_eq(original.points.length(), 0)
  assert_eq(values, [7.0])
  values.clear()
  ys.push(4.0)
  axes.recache_line_units()
  assert_eq(original.points.length(), 0)
}

///|
test "shape failure follows both conversions and retains old current Line" {
  let axes = figure().axes()
  ignore(axes.update_x_category_units(["a", "b"]))
  axes.attach_line_with_originals(
    [@core.point(0.0, 10.0), @core.point(1.0, 20.0)],
    Category(["a", "b"]),
    Category(["new-y", "second", "third"]),
  )
  axes.unstale_view()
  let original = axes.state.val.line_originals[0]
  let y_units = @axis.CategoryUnits::new([])
  // This controlled private fixture installs units without triggering a recache.
  axes.y_axis().set_category_units(y_units)
  let next = @axis.CategoryUnits::new(["b"])
  try axes.set_x_units(Some(@axis.AxisUnitTag::Category(next))) catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_true(message.contains("shape mismatch"))
    _ => fail("expected broadcast error")
  } noraise {
    _ => fail("expected broadcast error")
  }
  assert_eq(next.labels(), ["b", "a"])
  assert_eq(y_units.labels(), ["new-y", "second", "third"])
  assert_eq(original.points.map(point => (point.x(), point.y())), [
    (0.0, 10.0),
    (1.0, 20.0),
  ])
  assert_eq(axes.data_limits(horizontal=false).upper(), 20.0)
  assert_true(!axes.x_axis().autoscale_stale())
  assert_true(!axes.y_axis().autoscale_stale())
}

///|
test "pruning Line originals uses attached buffer identity" {
  let axes = figure().axes()
  axes.plot_category(["a", "b"], [10.0, 20.0])
  axes.plot([0.0, 1.0], [10.0, 20.0])
  let first = axes.state.val.line_originals[0]
  let second = axes.state.val.line_originals[1]
  axes.state.val.artists.retain(artist => {
    match artist {
      Artist::Line(points, _) => !physical_equal(points, first.points)
      _ => true
    }
  })
  axes.prune_line_originals()
  assert_eq(axes.state.val.line_originals.length(), 1)
  assert_true(physical_equal(axes.state.val.line_originals[0], second))
  assert_true(!physical_equal(first.points, second.points))
  axes.set_x_units(
    Some(@axis.AxisUnitTag::Category(@axis.CategoryUnits::new(["b", "a"]))),
  )
  assert_eq(second.points.map(point => point.x()), [0.0, 1.0])
}
