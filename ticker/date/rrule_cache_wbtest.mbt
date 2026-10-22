///|
test "cache construction is lazy and interleaved readers reuse prefix" {
  let rule = rrule(Secondly, datetime(2024, 1, 1), count=1000000, cache=true)
  let cache = rule.cache.unwrap()
  let first = rule.iter()
  let second = rule.iter()
  assert_true(cache.source is None)
  assert_eq(cache.values.length(), 0)
  ignore(first.take(3).to_array())
  assert_eq(cache.values.length(), 3)
  ignore(second.take(2).to_array())
  assert_eq(cache.values.length(), 3)
  assert_eq(second.next().unwrap().second(), 2)
  assert_eq(cache.values.length(), 3)
  assert_true(!cache.complete)
  ignore(rule.after(datetime(2024, 1, 1)))
  ignore(
    rule.between(datetime(2024, 1, 1), datetime(2024, 1, 1, second=1), inc=true),
  )
  ignore(rule.before(datetime(2024, 1, 1, second=1), inc=true))
  assert_eq(cache.values.length(), 3)
  let replacement = rule.replace()
  assert_eq(replacement.cache.unwrap().values.length(), 0)
  assert_true(replacement.cache.unwrap().source is None)
}

///|
test "set generation invalidation preserves a reader's old cache" {
  let set = rruleset(cache=true)
  set.rdate(datetime(2024, 1, 1))
  let old = set.iter()
  let cache = set.cache.unwrap()
  assert_true(cache.source is None)
  ignore(old.next())
  assert_eq(cache.values.length(), 1)
  set.rdate(datetime(2024, 1, 2))
  assert_eq(set.cache.unwrap().values.length(), 0)
  assert_true(old.next() is None)
  assert_true(cache.complete)
  assert_eq(set.all().length(), 2)
  assert_eq(set.cache.unwrap().values.length(), 2)
}
