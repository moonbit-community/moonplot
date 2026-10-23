///|
test "named formatter installation and getters keep live state while legacy helpers retain copies" {
  let axis = @axis.axis()
  axis.set_locator(@ticker.FixedLocator::new([0.0, 1.0]).as_locator())
  let legacy_labels = ["legacy-a", "legacy-b"]
  axis.set_formatter(@ticker.fixed_formatter(legacy_labels))
  legacy_labels[0] = "outside mutation"
  assert_eq(axis.tick_labels([0.0, 1.0]), ["legacy-a", "legacy-b"])
  let named = @ticker.FixedFormatter::new(["named-a", "named-b"])
  axis.set_named_formatter(named.as_base_formatter())
  assert_true(axis.formatter() is None)
  axis
  .named_formatter()
  .unwrap()
  .fixed_formatter()
  .unwrap()
  .set_seq(["live-a", "live-b"])
  assert_eq(axis.tick_labels_checked([0.0, 1.0]), ["live-a", "live-b"])
  assert_eq(named.seq(), ["live-a", "live-b"])
  axis.set_formatter(@ticker.null_formatter())
  assert_true(axis.named_formatter() is None)
  axis.set_named_formatter(named.as_base_formatter())
  axis.clear_formatter()
  assert_true(axis.named_formatter() is None)
  assert_true(axis.formatter() is None)
}

///|
test "named major and minor callbacks keep the last real axis identity across primary and secondary" {
  let figure = @scene.figure()
  let axes = figure.axes()
  axes.set_x_limits(0.0, 1.0)
  let secondary = axes.secondary_xaxis(value => value * 2.0 + 5.0, value => {
    (value - 5.0) / 2.0
  })
  let formatter = @ticker.NullFormatter::new().as_base_formatter()
  axes.set_x_named_formatter(formatter)
  assert_eq(formatter.axis(), Some(axes.x_axis().formatter_axis_binding()))
  secondary.set_named_formatter(formatter)
  assert_eq(formatter.axis(), Some(secondary.formatter_axis_binding()))
  assert_eq(axes.x_axis().named_formatter().unwrap().axis(), formatter.axis())
  ignore(axes.x_axis().tick_labels_checked([0.0, 1.0]))
  assert_eq(formatter.axis(), Some(secondary.formatter_axis_binding()))
  let copy = formatter.copy()
  axes.set_x_minor_named_formatter(formatter)
  assert_eq(formatter.axis(), Some(axes.x_axis().formatter_axis_binding()))
  assert_eq(copy.axis(), Some(secondary.formatter_axis_binding()))
  axes.x_axis().clear_minor_named_formatter()
  assert_true(axes.x_axis().minor_named_formatter() is None)
}

///|
test "named formatter installation binds its identity without replacing date or category locators" {
  for date in [true, false] {
    let axis = @axis.axis()
    if date {
      axis.set_date()
    } else {
      axis.set_categories(["a", "b"])
    }
    let view = @core.limits(0.0, 1.0)
    let positions = axis.tick_values_checked(view)
    let formatter = @ticker.NullFormatter::new().as_base_formatter()
    axis.set_named_formatter(formatter)
    axis.set_minor_named_formatter(formatter)
    assert_eq(formatter.axis(), Some(axis.formatter_axis_binding()))
    assert_true(physical_equal(axis.named_formatter().unwrap(), formatter))
    assert_true(
      physical_equal(axis.minor_named_formatter().unwrap(), formatter),
    )
    assert_eq(axis.tick_labels_checked([0.0, 1.0]), ["", ""])
    assert_eq(axis.minor_tick_labels_checked([0.0, 1.0]), ["", ""])
    assert_eq(axis.tick_values_checked(view), positions)
    if date {
      assert_true(axis.auto_date_locator() is Some(_))
    } else {
      assert_eq(axis.categories(), Some(["a", "b"]))
    }
  }
}

///|
test "explicit named labels replace old fixed label override and warning snapshots are defensive" {
  let axis = @axis.axis()
  axis.set_ticks([0.0, 1.0])
  axis.set_tick_labels(["old-a", "old-b"])
  let formatter = @ticker.FixedFormatter::new(["new-a", "new-b"])
  axis.set_named_formatter(formatter.as_base_formatter())
  assert_eq(axis.formatter_warnings(), [])
  assert_eq(axis.tick_labels_checked([0.0, 1.0]), ["new-a", "new-b"])
  axis.clear_ticks()
  axis.clear_locator()
  axis.set_named_formatter(formatter.as_base_formatter())
  let warnings = axis.formatter_warnings()
  assert_eq(warnings, [
    "FixedFormatter should only be used together with FixedLocator",
  ])
  warnings[0] = "changed outside"
  assert_eq(axis.formatter_warnings(), [
    "FixedFormatter should only be used together with FixedLocator",
  ])
  axis.set_minor_named_formatter(
    @ticker.NullFormatter::new().as_base_formatter(),
  )
  assert_eq(axis.formatter_warnings(), [])
}

///|
test "Scene snapshots keep named sequence and major offset live without automatic minus conversion" {
  let previous = @config.unicode_minus()
  defer @config.set_unicode_minus(previous)
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=240, height=120)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  axes.set_x_locator(@ticker.FixedLocator::new([0.0, 1.0]).as_locator())
  let formatter = @ticker.FixedFormatter::new(["raw-minus-a", "raw-minus-b"])
  formatter.set_offset_string("offset-before")
  axes.set_x_named_formatter(formatter.as_base_formatter())
  let before = figure.to_svg_checked()
  assert_true(before.contains(">raw-minus-a<"))
  assert_true(before.contains(">offset-before<"))
  formatter.set_seq(["changed-a", "changed-b"])
  formatter.set_offset_string("offset-after")
  let after = figure.to_svg_checked()
  assert_true(after.contains(">changed-a<"))
  assert_true(after.contains(">offset-after<"))
  assert_true(!after.contains(">raw-minus-a<"))
  assert_true(!after.contains(">offset-before<"))
}
