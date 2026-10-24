///|
test "checked iteration errors count snapshots and recovery do not select epoch or rc timezone" {
  @config.set_timezone("invalid/D18-zone")
  defer @config.set_timezone("UTC")
  let start = @date.RRuleDateTime::naive(@date.datetime(2024, 1, 1, hour=12))
  let wrapper = @date.RRuleWrapper::new(
    @date.Minutely,
    dtstart=start,
    interval=1440,
    byhour=[13],
    byminute=[0],
    count=0,
    cache=true,
  )
  let reader = wrapper.checked_raw_iter()
  assert_true(
    try {
      ignore(reader.next())
      false
    } catch {
      _ => true
    },
  )
  assert_true(reader.next() is None)
  assert_true(
    try {
      ignore(wrapper.occurrence_count())
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(wrapper.after(start))
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
  assert_true(
    try {
      ignore(wrapper.between(start, start))
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(wrapper.xafter(start, count=0))
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(wrapper.copy().checked_raw_iter().next())
      false
    } catch {
      _ => true
    },
  )
  wrapper.set(byhour=[12], count=2)
  assert_eq(wrapper.occurrence_count(), 2L)
  assert_eq(wrapper.checked_raw_iter().next().unwrap().date().year(), 2024)
  @date.set_epoch("2000-01-01T00:00:00")
  assert_eq(@date.datetime(2000, 1, 1).to_ordinal(), 0.0)
}
