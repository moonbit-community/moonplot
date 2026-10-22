///|
test "checked clock failure leaves lazy cache untouched and cannot be hidden by a legacy empty cache" {
  let wrapper = RRuleWrapper::new(
    Minutely,
    dtstart=RRuleDateTime::naive(datetime(2024, 1, 1, hour=12)),
    interval=1440,
    byhour=[13],
    byminute=[0],
    cache=true,
  )
  let cache = wrapper.core.cache.unwrap()
  let reader = wrapper.checked_raw_iter()
  assert_true(cache.source is None)
  assert_eq(cache.values.length(), 0)
  assert_true(!cache.complete)
  assert_true(!reader.checked && !reader.finished)
  assert_true(
    try {
      ignore(reader.next())
      false
    } catch {
      _ => true
    },
  )
  assert_true(reader.checked && reader.finished)
  assert_true(cache.source is None)
  assert_eq(cache.values.length(), 0)
  assert_true(!cache.complete)
  assert_true(wrapper.raw_iter().next() is None)
  assert_true(cache.complete)
  assert_true(
    try {
      ignore(wrapper.occurrence_count())
      false
    } catch {
      _ => true
    },
  )
  wrapper.set(byhour=[12], count=2)
  assert_true(!physical_equal(cache, wrapper.core.cache.unwrap()))
  assert_eq(wrapper.occurrence_count(), 2L)
  assert_true(reader.next() is None)
}
