///|
test "explicit convenience count replaces defaults but preserves custom locator" {
  let value = axis()
  value.set_scale(@scale.linear_scale())
  assert_true(value.is_default_locator())
  value.set_tick_count(4)
  assert_true(!value.is_default_locator())
  assert_true(value.locator() is None)
  let view = @core.limits(0.0, 3.0)
  assert_eq(value.tick_values_checked(view), [0.0, 1.0, 2.0, 3.0])
  assert_eq(value.tick_labels_checked([0.0, 1.0, 2.0, 3.0]), [
    "0", "1", "2", "3",
  ])
  let custom = @ticker.FixedLocator::new([0.0, 1.5, 3.0])
  value.set_locator(custom.as_locator())
  value.set_tick_count(8)
  assert_true(!value.is_default_locator())
  assert_true(
    physical_equal(value.locator().unwrap().fixed_locator().unwrap(), custom),
  )
  assert_eq(value.tick_values_checked(view), [0.0, 1.5, 3.0])
  value.set_scale(@scale.linear_scale())
  assert_true(value.is_default_locator())
  assert_true(value.locator().unwrap().auto_locator() is Some(_))
  assert_eq(custom.tick_values(0.0, 3.0).to_array(), [0.0, 1.5, 3.0])
}
