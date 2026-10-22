///|
fn iter_dates(values : Array[@date.DateTime]) -> Array[String] {
  values.map(value => @date.format_date(value, "%Y-%m-%d %H:%M:%S %z"))
}

///|
test "lazy rule readers are independent and remain exhausted" {
  for cache in [false, true] {
    let rule = @date.rrule(
      @date.Daily,
      @date.datetime(2024, 1, 1),
      count=3,
      cache~,
    )
    assert_eq(rule.cache_enabled(), cache)
    let first = rule.iter()
    let second = rule.iter()
    assert_eq(first.next().unwrap().day(), 1)
    assert_eq(first.next().unwrap().day(), 2)
    assert_eq(second.next().unwrap().day(), 1)
    assert_eq(first.next().unwrap().day(), 3)
    assert_true(first.next() is None)
    assert_true(first.next() is None)
    assert_eq(second.to_array().map(value => value.day()), [2, 3])
    assert_eq(rule.iter().to_array().map(value => value.day()), [1, 2, 3])
  }
}

///|
test "cache query paths preserve frequency and selector results" {
  let start = @date.datetime(2024, 1, 31, hour=9, minute=7, second=3)
  for
    frequency in [
      @date.Yearly,
      @date.Monthly,
      @date.Weekly,
      @date.Daily,
      @date.Hourly,
      @date.Minutely,
      @date.Secondly,
    ] {
    let rule = @date.rrule(frequency, start, count=8)
    let cached = rule.replace(cache=true)
    let values = rule.all()
    assert_eq(iter_dates(cached.iter().to_array()), iter_dates(values))
    assert_eq(iter_dates(cached.all()), iter_dates(values))
    assert_eq(
      iter_dates(cached.between(start, values[7], inc=true)),
      iter_dates(values),
    )
    assert_eq(
      cached.after(values[2]).unwrap().to_ordinal(),
      values[3].to_ordinal(),
    )
    assert_eq(
      cached.before(values[2]).unwrap().to_ordinal(),
      values[1].to_ordinal(),
    )
    assert_eq(
      cached.before(values[2], inc=true).unwrap().to_ordinal(),
      values[2].to_ordinal(),
    )
    assert_eq(
      iter_dates(cached.xafter(values[5], count=2)),
      iter_dates([values[6], values[7]]),
    )
  }
  let positioned = @date.rrule(
    @date.Monthly,
    start,
    byweekday=[0, 1, 2, 3, 4],
    bysetpos=[-1],
    count=5,
  )
  assert_eq(
    iter_dates(positioned.replace(cache=true).all()),
    iter_dates(positioned.all()),
  )
}

///|
test "lazy after honors inclusion count and independent query positions" {
  let start = @date.datetime(2024, 1, 1)
  for cache in [false, true] {
    let rule = @date.rrule(@date.Daily, start, count=5, cache~)
    let at = @date.datetime(2024, 1, 3)
    assert_eq(
      rule
      .iter_after(at, inc=true, count=2)
      .to_array()
      .map(value => value.day()),
      [3, 4],
    )
    assert_eq(rule.iter_after(at).to_array().map(value => value.day()), [4, 5])
    assert_true(rule.iter_after(at, count=0).next() is None)
    assert_true(rule.iter_after(at, count=-2).next() is None)
    assert_eq(rule.iter().next().unwrap().day(), 1)
    assert_true(
      rule.between(@date.datetime(2024, 1, 4), start, inc=true).is_empty(),
    )
  }
}

///|
test "derived rules preserve cache option without retaining old occurrences" {
  let rule = @date.rrule(
    @date.Daily,
    @date.datetime(2024, 1, 1),
    count=3,
    cache=true,
  )
  ignore(rule.all())
  let changed = rule.replace(dtstart=@date.datetime(2024, 2, 1))
  assert_true(changed.cache_enabled())
  assert_eq(changed.all().map(value => value.month()), [2, 2, 2])
  assert_eq(rule.all().map(value => value.month()), [1, 1, 1])
  assert_true(!rule.replace(cache=false).cache_enabled())
  let shifted = rule.with_offset(60)
  assert_true(shifted.cache_enabled())
  assert_eq(shifted.iter().next().unwrap().hour(), 1)
  let zone = @date.fixed_timezone_seconds(561)
  let zoned = rule.with_timezone(zone)
  assert_true(zoned.cache_enabled())
  assert_eq(zoned.iter().next().unwrap().offset_seconds(), 561)
  assert_eq(rule.iter().next().unwrap().offset_seconds(), 0)
}

///|
test "lazy recurrence preserves count until and UTC order through a fold" {
  let zone = @date.tzif_timezone(tzif_new_york)
  for cache in [false, true] {
    let rule = @date.rrule(
      @date.Minutely,
      @date.datetime(2400, 11, 5, hour=5),
      interval=30,
      count=4,
      until=@date.datetime(2400, 11, 5, hour=6, minute=30),
      cache~,
    ).with_timezone(zone)
    assert_eq(
      rule.iter().to_array().map(value => @date.format_date(value, "%H:%M %Z")),
      ["01:00 EDT", "01:30 EDT", "01:00 EST", "01:30 EST"],
    )
    assert_eq(
      rule
      .iter_after(@date.datetime(2400, 11, 5, hour=6), inc=true)
      .to_array()
      .length(),
      2,
    )
    let gap = @date.rrule(
      @date.Daily,
      @date.datetime(2024, 3, 9, hour=7),
      count=3,
      cache~,
    ).with_timezone(zone)
    assert_eq(gap.iter().to_array().map(value => value.day()), [9, 11, 12])
  }
}

///|
test "lazy rule can exceed eager cap without changing array limits" {
  let start = @date.datetime(2024, 1, 1)
  for cache in [false, true] {
    let rule = @date.rrule(@date.Secondly, start, count=100003, cache~)
    let stream = rule.iter()
    assert_eq(stream.take(100000).count(), 100000)
    let beyond = stream.next().unwrap()
    assert_true(
      Double::abs(
        (beyond.to_ordinal() - start.to_ordinal()) * 86400.0 - 100000.0,
      ) <
      0.001,
    )
    assert_eq(stream.count(), 2)
    assert_eq(rule.all().length(), 100000)
    assert_eq(
      rule.before(@date.datetime(2024, 1, 3)).unwrap().to_ordinal(),
      rule.iter_after(beyond, count=2).last().unwrap().to_ordinal(),
    )
  }
}

///|
test "lazy rule calendar boundary and impossible selectors terminate" {
  for cache in [false, true] {
    let end = @date.rrule(@date.Daily, @date.datetime(9999, 12, 30), cache~)
    assert_eq(end.iter().to_array().map(value => value.day()), [30, 31])
    let no_clock = @date.rrule(
      @date.Hourly,
      @date.datetime(2024, 1, 1),
      bysetpos=[5],
      cache~,
    )
    assert_true(no_clock.iter().next() is None)
    let no_days = @date.rrule(
      @date.Monthly,
      @date.datetime(9998, 1, 1),
      bymonth=[2],
      bymonthday=[30],
      cache~,
    )
    assert_true(no_days.iter().next() is None)
  }
}

///|
test "set iterators merge exact second offset instants and exclusion sources" {
  for cache in [false, true] {
    let set = @date.rruleset(cache~)
    let rule = @date.rrule(
      @date.Daily,
      @date.datetime(1900, 1, 1),
      count=4,
      cache~,
    )
    set.rrule(rule)
    set.rdate(
      @date.datetime(1900, 1, 1, minute=9, second=21, offset_seconds=561),
    )
    set.rdate(@date.datetime(1900, 1, 6))
    set.exdate(
      @date.datetime(1900, 1, 2, minute=9, second=21, offset_seconds=561),
    )
    set.exrule(@date.rrule(@date.Daily, @date.datetime(1900, 1, 3), count=1))
    assert_eq(set.iter().to_array().map(value => value.day()), [1, 4, 6])
    assert_eq(set.all().map(value => value.day()), [1, 4, 6])
    assert_eq(
      set
      .between(@date.datetime(1900, 1, 1), @date.datetime(1900, 1, 6), inc=true)
      .map(value => value.day()),
      [1, 4, 6],
    )
  }
}

///|
test "all set mutators invalidate cached queries and keep old reader snapshots" {
  for cache in [false, true] {
    let set = @date.rruleset(cache~)
    set.rrule(@date.rrule(@date.Daily, @date.datetime(2024, 1, 1), count=3))
    let old = set.iter()
    assert_eq(old.next().unwrap().day(), 1)
    ignore(set.all())
    set.rdate(@date.datetime(2024, 1, 5))
    assert_eq(set.all().map(value => value.day()), [1, 2, 3, 5])
    set.rrule(@date.rrule(@date.Daily, @date.datetime(2024, 1, 6), count=1))
    assert_eq(set.all().map(value => value.day()), [1, 2, 3, 5, 6])
    set.exdate(@date.datetime(2024, 1, 2))
    assert_eq(set.all().map(value => value.day()), [1, 3, 5, 6])
    set.exrule(@date.rrule(@date.Daily, @date.datetime(2024, 1, 5), count=1))
    assert_eq(set.all().map(value => value.day()), [1, 3, 6])
    assert_eq(old.to_array().map(value => value.day()), [2, 3])
    assert_eq(
      set
      .iter_after(@date.datetime(2024, 1, 3), inc=true)
      .to_array()
      .map(value => value.day()),
      [3, 6],
    )
    assert_eq(set.before(@date.datetime(2024, 1, 6)).unwrap().day(), 3)
  }
}

///|
test "unstarted set readers snapshot sources and interleave independently" {
  for cache in [false, true] {
    let set = @date.rruleset(cache~)
    set.rdate(@date.datetime(2024, 1, 1))
    let first = set.iter()
    let second = set.iter()
    set.rdate(@date.datetime(2024, 1, 2))
    assert_eq(first.next().unwrap().day(), 1)
    assert_eq(second.next().unwrap().day(), 1)
    assert_true(first.next() is None)
    assert_true(first.next() is None)
    assert_true(second.next() is None)
    assert_eq(set.iter().count(), 2)
  }
}

///|
test "lazy set exclusions do not truncate inclusion sources before filtering" {
  let set = @date.rruleset(cache=true)
  let start = @date.datetime(2024, 1, 1)
  set.rrule(@date.rrule(@date.Secondly, start, count=100002))
  set.exrule(@date.rrule(@date.Secondly, start, count=100000))
  assert_eq(set.all().length(), 2)
  assert_eq(set.iter().count(), 2)
}

///|
test "offset query bounds before the supported UTC range still find later values" {
  let start = @date.datetime(1, 1, 2)
  let before = @date.datetime(1, 1, 1, offset_minutes=60)
  for cache in [false, true] {
    let rule = @date.rrule(@date.Daily, start, count=1, cache~)
    assert_eq(rule.after(before).unwrap().day(), 2)
    assert_eq(rule.xafter(before, count=1)[0].day(), 2)
    let set = @date.rruleset(cache~)
    set.rrule(rule)
    assert_eq(set.after(before).unwrap().day(), 2)
  }
}

///|
test "iterator end uses UTC calendar limit after timezone conversion" {
  let start = @date.datetime(9999, 12, 31, offset_minutes=840)
  let zone = @date.fixed_timezone(-300)
  for cache in [false, true] {
    let rule = @date.rrule(@date.Hourly, start, cache~).with_timezone(zone)
    let values = rule.iter().to_array()
    assert_eq(values.length(), 38)
    assert_eq((values[37].day(), values[37].hour()), (31, 18))
    assert_eq(
      values[37].to_ordinal(),
      @date.datetime(9999, 12, 31, hour=23).to_ordinal(),
    )
    assert_eq(rule.all().length(), 38)
  }
}
