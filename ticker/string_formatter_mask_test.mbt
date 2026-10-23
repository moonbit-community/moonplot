///|
test "tick view mask checks shape and preserves floating sign bits" {
  let owner = [-0.0, 1.0 / 0.0, 0.0 / 0.0]
  let view = @ticker.TickValues::from_array(owner)
  assert_true(
    try {
      ignore(view.select_mask([true]))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  let selected = view.select_mask([true, false, true])
  assert_eq(selected.length(), 2)
  assert_eq(selected.get(0).reinterpret_as_uint64(), 0x8000000000000000UL)
  assert_true(selected.get(1).is_nan())
  owner[0] = 8.0
  assert_eq(selected.get(0).reinterpret_as_uint64(), 0x8000000000000000UL)
}
