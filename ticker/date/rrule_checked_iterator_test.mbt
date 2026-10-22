///|
test "checked readers retain core snapshots across bad masks and recovery" {
  for cache in [false, true] {
    let start = @date.RRuleDateTime::naive(@date.datetime(2024, 1, 1, hour=12))
    let wrapper = @date.RRuleWrapper::new(
      @date.Minutely,
      dtstart=start,
      interval=1440,
      byhour=[12],
      byminute=[0],
      count=2,
      cache~,
    )
    let old = wrapper.checked_raw_iter()
    assert_eq(old.next().unwrap().date().day(), 1)
    wrapper.set(byhour=[13])
    let copy = wrapper.copy()
    let failed = wrapper.checked_raw_iter()
    assert_true(
      try {
        ignore(failed.next())
        false
      } catch {
        _ => true
      },
    )
    assert_true(failed.next() is None)
    assert_true(
      try {
        ignore(copy.occurrence_count())
        false
      } catch {
        _ => true
      },
    )
    assert_true(
      try {
        wrapper.set(byminute=[1])
        false
      } catch {
        _ => true
      },
    )
    assert_true(
      try {
        ignore(wrapper.before(start))
        false
      } catch {
        _ => true
      },
    )
    wrapper.set(byhour=[12], byminute=[0])
    assert_eq(wrapper.occurrence_count(), 2L)
    assert_eq(old.next().unwrap().date().day(), 2)
    assert_true(old.next() is None)
    assert_true(
      try {
        ignore(copy.checked_raw_iter().next())
        false
      } catch {
        _ => true
      },
    )
  }
}
