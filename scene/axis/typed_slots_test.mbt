///|
test "date geometry survives independent numeric formatter installations" {
  let axis = @axis.axis()
  axis.set_date()
  axis.set_minor_named_formatter(
    @ticker.NullFormatter::new().as_base_formatter(),
  )
  assert_true(axis.is_default_locator())
  assert_true(!axis.is_default_formatter(minor=true))
  let candidate = axis
    .autoscale_bounds_checked(
      [10000.0, 10000.0],
      margin=0.05,
      stickies=[],
      tight=false,
    )
    .unwrap()
  assert_eq((candidate.lower(), candidate.upper()), (9197.0, 10803.0))
  axis.set_named_formatter(@ticker.NullFormatter::new().as_base_formatter())
  assert_eq(axis.tick_labels_checked([10000.0]), [""])
  assert_true(axis.auto_date_locator() is Some(_))
  let again = axis
    .autoscale_bounds_checked(
      [10000.0, 10000.0],
      margin=0.05,
      stickies=[],
      tight=false,
    )
    .unwrap()
  assert_eq((again.lower(), again.upper()), (9197.0, 10803.0))
}

///|
test "category append preserves explicit slots and their shared live mapping" {
  let axis = @axis.axis()
  assert_eq(axis.category_positions(["b", "a"]), [0.0, 1.0])
  axis.set_locator(@ticker.FixedLocator::new([1.0]).as_locator())
  axis.set_named_formatter(@ticker.NullFormatter::new().as_base_formatter())
  assert_eq(axis.category_positions(["c", "b"]), [2.0, 0.0])
  assert_eq(axis.categories(), Some(["b", "a", "c"]))
  assert_eq(axis.tick_values_checked(@core.limits(-1.0, 3.0)), [1.0])
  assert_eq(axis.tick_labels_checked([1.0]), [""])
  assert_true(!axis.is_default_locator())
  assert_true(!axis.is_default_formatter())
  assert_true(axis.is_default_locator(minor=true))
  assert_true(axis.is_default_formatter(minor=true))
}

///|
test "typed candidate retains its captured inherited view policy across a callback" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  @config.set_axes_autolimit_mode("round_numbers")
  let axis = @axis.axis()
  axis.set_date()
  let candidate = axis
    .autoscale_bounds_checked(
      [10000.0, 10000.0],
      margin=0.05,
      stickies=[],
      tight=false,
      data_minpos=Some(() => {
        axis.set_locator(@ticker.MultipleLocator::new(base=1000.0).as_locator())
        [10000.0]
      }),
    )
    .unwrap()
  assert_eq((candidate.lower(), candidate.upper()), (9197.0, 10803.0))
  assert_true(!axis.is_default_locator())
  assert_true(axis.locator() is Some(_))
}

///|
test "date converter defaults preserve explicit major text and minor geometry" {
  let axis = @axis.axis()
  axis.set_label("chosen")
  axis.set_named_formatter(@ticker.NullFormatter::new().as_base_formatter())
  axis.set_minor_locator(@ticker.FixedLocator::new([0.5]).as_minor_locator())
  axis.set_date()
  axis.set_minor_overlap_removal(false)
  assert_eq(axis.label(), Some("chosen"))
  assert_eq(axis.tick_labels_checked([0.0, 1.0]), ["", ""])
  assert_eq(axis.minor_tick_values_checked(@core.limits(0.0, 1.0)), [0.5])
  assert_true(axis.is_default_locator())
  assert_true(!axis.is_default_formatter())
  assert_true(!axis.is_default_locator(minor=true))
}
