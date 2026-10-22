// Generated from original dateutil relativedelta constructor/_fix.

///|
test "relative delta original constructor 0" {
  let delta = @date.RelativeDelta::new()
  assert_eq(delta.years(), 0L)
  assert_eq(delta.months(), 0)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 0.0)
  assert_eq(delta.has_time(), false)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 1" {
  let delta = @date.RelativeDelta::new(years=1L, months=-13L)
  assert_eq(delta.years(), 0L)
  assert_eq(delta.months(), -1)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 0.0)
  assert_eq(delta.has_time(), false)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 2" {
  let delta = @date.RelativeDelta::new(years=-1L, months=13L)
  assert_eq(delta.years(), 0L)
  assert_eq(delta.months(), 1)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 0.0)
  assert_eq(delta.has_time(), false)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 3" {
  let delta = @date.RelativeDelta::new(months=-25L)
  assert_eq(delta.years(), -2L)
  assert_eq(delta.months(), -1)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 0.0)
  assert_eq(delta.has_time(), false)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 4" {
  let delta = @date.RelativeDelta::new(days=1.5, hours=2.0)
  assert_eq(delta.years(), 0L)
  assert_eq(delta.months(), 0)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [1.5, 0.0, 2.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 0.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 5" {
  let delta = @date.RelativeDelta::new(days=-1.5, hours=2.0)
  assert_eq(delta.years(), 0L)
  assert_eq(delta.months(), 0)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [-1.5, 0.0, 2.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 0.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 6" {
  let delta = @date.RelativeDelta::new(weeks=-1.5, days=2.25)
  assert_eq(delta.years(), 0L)
  assert_eq(delta.months(), 0)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [-8.25, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), -1.0)
  assert_eq(delta.has_time(), false)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 7" {
  let delta = @date.RelativeDelta::new(microseconds=-1000001.5)
  assert_eq(delta.years(), 0L)
  assert_eq(delta.months(), 0)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, -1.0, -1.5],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 0.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 8" {
  let delta = @date.RelativeDelta::new(
    hours=-24.5,
    minutes=150.25,
    seconds=-3601.125,
  )
  assert_eq(delta.years(), 0L)
  assert_eq(delta.months(), 0)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [0.0, 0.0, -23.5, 30.25, -1.125, 0.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 0.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 9" {
  let delta = @date.RelativeDelta::new(
    years=-9223372036854775808L,
    months=9223372036854775807L,
  )
  assert_eq(delta.years(), -8454757700450211158L)
  assert_eq(delta.months(), 7)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 0.0)
  assert_eq(delta.has_time(), false)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 10" {
  let delta = @date.RelativeDelta::new(months=-9223372036854775808L)
  assert_eq(delta.years(), -768614336404564650L)
  assert_eq(delta.months(), -8)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 0.0)
  assert_eq(delta.has_time(), false)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 11" {
  let delta = @date.RelativeDelta::new(years=9223372036854775807L, months=-12L)
  assert_eq(delta.years(), 9223372036854775806L)
  assert_eq(delta.months(), 0)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 0.0)
  assert_eq(delta.has_time(), false)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 12" {
  let delta = @date.RelativeDelta::new(
    year=0,
    month=0,
    day=0,
    hour=0,
    microsecond=0,
  )
  assert_eq(delta.years(), 0L)
  assert_eq(delta.months(), 0)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [Some(0), Some(0), Some(0), Some(0), None, None, Some(0)],
  )
  assert_eq(delta.weeks(), 0.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 13" {
  let delta = @date.RelativeDelta::new(
    year=-1,
    month=13,
    day=-1,
    hour=24,
    second=60,
    microsecond=1000000,
  )
  assert_eq(delta.years(), 0L)
  assert_eq(delta.months(), 0)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [Some(-1), Some(13), Some(-1), Some(24), None, Some(60), Some(1000000)],
  )
  assert_eq(delta.weeks(), 0.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 14" {
  let delta = @date.RelativeDelta::new(
    days=1.0e+100,
    hours=-1.0e+99,
    microseconds=1.0e+250,
  )
  assert_eq(delta.years(), 0L)
  assert_eq(delta.months(), 0)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [1.1574074074074075e+239, 0.0, 16.0, 12.0, 36.0, 276800.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 1.6534391534391537e+238)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 15" {
  let delta = @date.RelativeDelta::new(weekday=-7)
  assert_eq(delta.years(), 0L)
  assert_eq(delta.months(), 0)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 0.0)
  assert_eq(delta.has_time(), false)
  assert_eq(delta.weekday().unwrap().weekday(), 0)
  assert_eq(delta.weekday().unwrap().nth(), None)
}

///|
test "relative delta original constructor 16" {
  let delta = @date.RelativeDelta::new(weekday=-1)
  assert_eq(delta.years(), 0L)
  assert_eq(delta.months(), 0)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 0.0)
  assert_eq(delta.has_time(), false)
  assert_eq(delta.weekday().unwrap().weekday(), 6)
  assert_eq(delta.weekday().unwrap().nth(), None)
}

///|
test "relative delta original constructor 17" {
  let delta = @date.RelativeDelta::new(weekday=0)
  assert_eq(delta.years(), 0L)
  assert_eq(delta.months(), 0)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 0.0)
  assert_eq(delta.has_time(), false)
  assert_eq(delta.weekday().unwrap().weekday(), 0)
  assert_eq(delta.weekday().unwrap().nth(), None)
}

///|
test "relative delta original constructor 18" {
  let delta = @date.RelativeDelta::new(weekday=6)
  assert_eq(delta.years(), 0L)
  assert_eq(delta.months(), 0)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 0.0)
  assert_eq(delta.has_time(), false)
  assert_eq(delta.weekday().unwrap().weekday(), 6)
  assert_eq(delta.weekday().unwrap().nth(), None)
}

///|
test "relative delta original constructor 19" {
  let delta = @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0))
  assert_eq(delta.years(), 0L)
  assert_eq(delta.months(), 0)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 0.0)
  assert_eq(delta.has_time(), false)
  assert_eq(delta.weekday().unwrap().weekday(), 0)
  assert_eq(delta.weekday().unwrap().nth(), None)
}

///|
test "relative delta original constructor 20" {
  let delta = @date.RelativeDelta::new(
    on_weekday=@date.RelativeWeekday::new(0, nth=0),
  )
  assert_eq(delta.years(), 0L)
  assert_eq(delta.months(), 0)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 0.0)
  assert_eq(delta.has_time(), false)
  assert_eq(delta.weekday().unwrap().weekday(), 0)
  assert_eq(delta.weekday().unwrap().nth(), Some(0))
}

///|
test "relative delta original constructor 21" {
  let delta = @date.RelativeDelta::new(
    on_weekday=@date.RelativeWeekday::new(0, nth=1),
  )
  assert_eq(delta.years(), 0L)
  assert_eq(delta.months(), 0)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 0.0)
  assert_eq(delta.has_time(), false)
  assert_eq(delta.weekday().unwrap().weekday(), 0)
  assert_eq(delta.weekday().unwrap().nth(), Some(1))
}

///|
test "relative delta original constructor 22" {
  let delta = @date.RelativeDelta::new(
    on_weekday=@date.RelativeWeekday::new(6, nth=-2),
  )
  assert_eq(delta.years(), 0L)
  assert_eq(delta.months(), 0)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 0.0)
  assert_eq(delta.has_time(), false)
  assert_eq(delta.weekday().unwrap().weekday(), 6)
  assert_eq(delta.weekday().unwrap().nth(), Some(-2))
}

///|
test "relative delta original constructor 23" {
  let delta = @date.RelativeDelta::new(
    on_weekday=@date.RelativeWeekday::new(-2147483648, nth=2147483647),
  )
  assert_eq(delta.years(), 0L)
  assert_eq(delta.months(), 0)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 0.0)
  assert_eq(delta.has_time(), false)
  assert_eq(delta.weekday().unwrap().weekday(), -2147483648)
  assert_eq(delta.weekday().unwrap().nth(), Some(2147483647))
}

///|
test "relative delta original constructor 24" {
  let delta = @date.RelativeDelta::new(microseconds=999999.9999999999)
  assert_eq(delta.years(), 0L)
  assert_eq(delta.months(), 0)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 999999.9999999999],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 0.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 25" {
  let delta = @date.RelativeDelta::new(microseconds=1000000.0)
  assert_eq(delta.years(), 0L)
  assert_eq(delta.months(), 0)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 1.0, 0.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 0.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 26" {
  let delta = @date.RelativeDelta::new(microseconds=1000000.0000000001)
  assert_eq(delta.years(), 0L)
  assert_eq(delta.months(), 0)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 1.0, 1.1641532182693481e-10],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 0.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 27" {
  let delta = @date.RelativeDelta::new(microseconds=-999999.9999999999)
  assert_eq(delta.years(), 0L)
  assert_eq(delta.months(), 0)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, -999999.9999999999],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 0.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 28" {
  let delta = @date.RelativeDelta::new(microseconds=-1000000.0)
  assert_eq(delta.years(), 0L)
  assert_eq(delta.months(), 0)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, -1.0, -0.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 0.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 29" {
  let delta = @date.RelativeDelta::new(microseconds=-1000000.0000000001)
  assert_eq(delta.years(), 0L)
  assert_eq(delta.months(), 0)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, -1.0, -1.1641532182693481e-10],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 0.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 30" {
  let delta = @date.RelativeDelta::new(seconds=59.99999999999999)
  assert_eq(delta.years(), 0L)
  assert_eq(delta.months(), 0)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 59.99999999999999, 0.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 0.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 31" {
  let delta = @date.RelativeDelta::new(seconds=60.0)
  assert_eq(delta.years(), 0L)
  assert_eq(delta.months(), 0)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [0.0, 0.0, 0.0, 1.0, 0.0, 0.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 0.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 32" {
  let delta = @date.RelativeDelta::new(seconds=60.00000000000001)
  assert_eq(delta.years(), 0L)
  assert_eq(delta.months(), 0)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [0.0, 0.0, 0.0, 1.0, 7.105427357601002e-15, 0.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 0.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 33" {
  let delta = @date.RelativeDelta::new(seconds=-59.99999999999999)
  assert_eq(delta.years(), 0L)
  assert_eq(delta.months(), 0)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, -59.99999999999999, 0.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 0.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 34" {
  let delta = @date.RelativeDelta::new(seconds=-60.0)
  assert_eq(delta.years(), 0L)
  assert_eq(delta.months(), 0)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [0.0, 0.0, 0.0, -1.0, -0.0, 0.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 0.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 35" {
  let delta = @date.RelativeDelta::new(seconds=-60.00000000000001)
  assert_eq(delta.years(), 0L)
  assert_eq(delta.months(), 0)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [0.0, 0.0, 0.0, -1.0, -7.105427357601002e-15, 0.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 0.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 36" {
  let delta = @date.RelativeDelta::new(minutes=59.99999999999999)
  assert_eq(delta.years(), 0L)
  assert_eq(delta.months(), 0)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [0.0, 0.0, 0.0, 59.99999999999999, 0.0, 0.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 0.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 37" {
  let delta = @date.RelativeDelta::new(minutes=60.0)
  assert_eq(delta.years(), 0L)
  assert_eq(delta.months(), 0)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [0.0, 0.0, 1.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 0.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 38" {
  let delta = @date.RelativeDelta::new(minutes=60.00000000000001)
  assert_eq(delta.years(), 0L)
  assert_eq(delta.months(), 0)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [0.0, 0.0, 1.0, 7.105427357601002e-15, 0.0, 0.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 0.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 39" {
  let delta = @date.RelativeDelta::new(minutes=-59.99999999999999)
  assert_eq(delta.years(), 0L)
  assert_eq(delta.months(), 0)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [0.0, 0.0, 0.0, -59.99999999999999, 0.0, 0.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 0.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 40" {
  let delta = @date.RelativeDelta::new(minutes=-60.0)
  assert_eq(delta.years(), 0L)
  assert_eq(delta.months(), 0)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [0.0, 0.0, -1.0, -0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 0.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 41" {
  let delta = @date.RelativeDelta::new(minutes=-60.00000000000001)
  assert_eq(delta.years(), 0L)
  assert_eq(delta.months(), 0)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [0.0, 0.0, -1.0, -7.105427357601002e-15, 0.0, 0.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 0.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 42" {
  let delta = @date.RelativeDelta::new(hours=23.999999999999996)
  assert_eq(delta.years(), 0L)
  assert_eq(delta.months(), 0)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [0.0, 0.0, 23.999999999999996, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 0.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 43" {
  let delta = @date.RelativeDelta::new(hours=24.0)
  assert_eq(delta.years(), 0L)
  assert_eq(delta.months(), 0)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [1.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 0.0)
  assert_eq(delta.has_time(), false)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 44" {
  let delta = @date.RelativeDelta::new(hours=24.000000000000004)
  assert_eq(delta.years(), 0L)
  assert_eq(delta.months(), 0)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [1.0, 0.0, 3.552713678800501e-15, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 0.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 45" {
  let delta = @date.RelativeDelta::new(hours=-23.999999999999996)
  assert_eq(delta.years(), 0L)
  assert_eq(delta.months(), 0)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [0.0, 0.0, -23.999999999999996, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 0.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 46" {
  let delta = @date.RelativeDelta::new(hours=-24.0)
  assert_eq(delta.years(), 0L)
  assert_eq(delta.months(), 0)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [-1.0, 0.0, -0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 0.0)
  assert_eq(delta.has_time(), false)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 47" {
  let delta = @date.RelativeDelta::new(hours=-24.000000000000004)
  assert_eq(delta.years(), 0L)
  assert_eq(delta.months(), 0)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [-1.0, 0.0, -3.552713678800501e-15, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 0.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 48" {
  let delta = @date.RelativeDelta::new(yearday=-2147483648, leapdays=2.5)
  assert_eq(delta.years(), 0L)
  assert_eq(delta.months(), 0)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [0.0, 2.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, Some(1), Some(-2147483648), None, None, None, None],
  )
  assert_eq(delta.weeks(), 0.0)
  assert_eq(delta.has_time(), false)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 49" {
  let delta = @date.RelativeDelta::new(nlyearday=-2147483648, leapdays=-3.5)
  assert_eq(delta.years(), 0L)
  assert_eq(delta.months(), 0)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [0.0, -3.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, Some(1), Some(-2147483648), None, None, None, None],
  )
  assert_eq(delta.weeks(), 0.0)
  assert_eq(delta.has_time(), false)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 50" {
  let delta = @date.RelativeDelta::new(
    yearday=-2147483648,
    nlyearday=60,
    month=7,
    day=8,
    leapdays=4.25,
  )
  assert_eq(delta.years(), 0L)
  assert_eq(delta.months(), 0)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [0.0, 4.25, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, Some(3), Some(1), None, None, None, None],
  )
  assert_eq(delta.weeks(), 0.0)
  assert_eq(delta.has_time(), false)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 51" {
  let delta = @date.RelativeDelta::new(yearday=-1, leapdays=2.5)
  assert_eq(delta.years(), 0L)
  assert_eq(delta.months(), 0)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [0.0, 2.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, Some(1), Some(-1), None, None, None, None],
  )
  assert_eq(delta.weeks(), 0.0)
  assert_eq(delta.has_time(), false)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 52" {
  let delta = @date.RelativeDelta::new(nlyearday=-1, leapdays=-3.5)
  assert_eq(delta.years(), 0L)
  assert_eq(delta.months(), 0)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [0.0, -3.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, Some(1), Some(-1), None, None, None, None],
  )
  assert_eq(delta.weeks(), 0.0)
  assert_eq(delta.has_time(), false)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 53" {
  let delta = @date.RelativeDelta::new(
    yearday=-1,
    nlyearday=60,
    month=7,
    day=8,
    leapdays=4.25,
  )
  assert_eq(delta.years(), 0L)
  assert_eq(delta.months(), 0)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [0.0, 4.25, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, Some(3), Some(1), None, None, None, None],
  )
  assert_eq(delta.weeks(), 0.0)
  assert_eq(delta.has_time(), false)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 54" {
  let delta = @date.RelativeDelta::new(yearday=0, leapdays=2.5)
  assert_eq(delta.years(), 0L)
  assert_eq(delta.months(), 0)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [0.0, 2.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 0.0)
  assert_eq(delta.has_time(), false)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 55" {
  let delta = @date.RelativeDelta::new(nlyearday=0, leapdays=-3.5)
  assert_eq(delta.years(), 0L)
  assert_eq(delta.months(), 0)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [0.0, -3.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 0.0)
  assert_eq(delta.has_time(), false)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 56" {
  let delta = @date.RelativeDelta::new(
    yearday=0,
    nlyearday=60,
    month=7,
    day=8,
    leapdays=4.25,
  )
  assert_eq(delta.years(), 0L)
  assert_eq(delta.months(), 0)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [0.0, 4.25, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, Some(3), Some(1), None, None, None, None],
  )
  assert_eq(delta.weeks(), 0.0)
  assert_eq(delta.has_time(), false)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 57" {
  let delta = @date.RelativeDelta::new(yearday=1, leapdays=2.5)
  assert_eq(delta.years(), 0L)
  assert_eq(delta.months(), 0)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [0.0, 2.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, Some(1), Some(1), None, None, None, None],
  )
  assert_eq(delta.weeks(), 0.0)
  assert_eq(delta.has_time(), false)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 58" {
  let delta = @date.RelativeDelta::new(nlyearday=1, leapdays=-3.5)
  assert_eq(delta.years(), 0L)
  assert_eq(delta.months(), 0)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [0.0, -3.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, Some(1), Some(1), None, None, None, None],
  )
  assert_eq(delta.weeks(), 0.0)
  assert_eq(delta.has_time(), false)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 59" {
  let delta = @date.RelativeDelta::new(
    yearday=1,
    nlyearday=60,
    month=7,
    day=8,
    leapdays=4.25,
  )
  assert_eq(delta.years(), 0L)
  assert_eq(delta.months(), 0)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [0.0, 4.25, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, Some(3), Some(1), None, None, None, None],
  )
  assert_eq(delta.weeks(), 0.0)
  assert_eq(delta.has_time(), false)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 60" {
  let delta = @date.RelativeDelta::new(yearday=59, leapdays=2.5)
  assert_eq(delta.years(), 0L)
  assert_eq(delta.months(), 0)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [0.0, 2.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, Some(2), Some(28), None, None, None, None],
  )
  assert_eq(delta.weeks(), 0.0)
  assert_eq(delta.has_time(), false)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 61" {
  let delta = @date.RelativeDelta::new(nlyearday=59, leapdays=-3.5)
  assert_eq(delta.years(), 0L)
  assert_eq(delta.months(), 0)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [0.0, -3.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, Some(2), Some(28), None, None, None, None],
  )
  assert_eq(delta.weeks(), 0.0)
  assert_eq(delta.has_time(), false)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 62" {
  let delta = @date.RelativeDelta::new(
    yearday=59,
    nlyearday=60,
    month=7,
    day=8,
    leapdays=4.25,
  )
  assert_eq(delta.years(), 0L)
  assert_eq(delta.months(), 0)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [0.0, 4.25, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, Some(3), Some(1), None, None, None, None],
  )
  assert_eq(delta.weeks(), 0.0)
  assert_eq(delta.has_time(), false)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 63" {
  let delta = @date.RelativeDelta::new(yearday=60, leapdays=2.5)
  assert_eq(delta.years(), 0L)
  assert_eq(delta.months(), 0)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [0.0, -1.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, Some(3), Some(1), None, None, None, None],
  )
  assert_eq(delta.weeks(), 0.0)
  assert_eq(delta.has_time(), false)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 64" {
  let delta = @date.RelativeDelta::new(nlyearday=60, leapdays=-3.5)
  assert_eq(delta.years(), 0L)
  assert_eq(delta.months(), 0)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [0.0, -3.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, Some(3), Some(1), None, None, None, None],
  )
  assert_eq(delta.weeks(), 0.0)
  assert_eq(delta.has_time(), false)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 65" {
  let delta = @date.RelativeDelta::new(
    yearday=60,
    nlyearday=60,
    month=7,
    day=8,
    leapdays=4.25,
  )
  assert_eq(delta.years(), 0L)
  assert_eq(delta.months(), 0)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [0.0, 4.25, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, Some(3), Some(1), None, None, None, None],
  )
  assert_eq(delta.weeks(), 0.0)
  assert_eq(delta.has_time(), false)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 66" {
  let delta = @date.RelativeDelta::new(yearday=61, leapdays=2.5)
  assert_eq(delta.years(), 0L)
  assert_eq(delta.months(), 0)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [0.0, -1.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, Some(3), Some(2), None, None, None, None],
  )
  assert_eq(delta.weeks(), 0.0)
  assert_eq(delta.has_time(), false)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 67" {
  let delta = @date.RelativeDelta::new(nlyearday=61, leapdays=-3.5)
  assert_eq(delta.years(), 0L)
  assert_eq(delta.months(), 0)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [0.0, -3.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, Some(3), Some(2), None, None, None, None],
  )
  assert_eq(delta.weeks(), 0.0)
  assert_eq(delta.has_time(), false)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 68" {
  let delta = @date.RelativeDelta::new(
    yearday=61,
    nlyearday=60,
    month=7,
    day=8,
    leapdays=4.25,
  )
  assert_eq(delta.years(), 0L)
  assert_eq(delta.months(), 0)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [0.0, 4.25, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, Some(3), Some(1), None, None, None, None],
  )
  assert_eq(delta.weeks(), 0.0)
  assert_eq(delta.has_time(), false)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 69" {
  let delta = @date.RelativeDelta::new(yearday=365, leapdays=2.5)
  assert_eq(delta.years(), 0L)
  assert_eq(delta.months(), 0)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [0.0, -1.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, Some(12), Some(31), None, None, None, None],
  )
  assert_eq(delta.weeks(), 0.0)
  assert_eq(delta.has_time(), false)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 70" {
  let delta = @date.RelativeDelta::new(nlyearday=365, leapdays=-3.5)
  assert_eq(delta.years(), 0L)
  assert_eq(delta.months(), 0)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [0.0, -3.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, Some(12), Some(31), None, None, None, None],
  )
  assert_eq(delta.weeks(), 0.0)
  assert_eq(delta.has_time(), false)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 71" {
  let delta = @date.RelativeDelta::new(
    yearday=365,
    nlyearday=60,
    month=7,
    day=8,
    leapdays=4.25,
  )
  assert_eq(delta.years(), 0L)
  assert_eq(delta.months(), 0)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [0.0, 4.25, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, Some(3), Some(1), None, None, None, None],
  )
  assert_eq(delta.weeks(), 0.0)
  assert_eq(delta.has_time(), false)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 72" {
  let delta = @date.RelativeDelta::new(yearday=366, leapdays=2.5)
  assert_eq(delta.years(), 0L)
  assert_eq(delta.months(), 0)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [0.0, -1.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, Some(12), Some(32), None, None, None, None],
  )
  assert_eq(delta.weeks(), 0.0)
  assert_eq(delta.has_time(), false)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 73" {
  let delta = @date.RelativeDelta::new(nlyearday=366, leapdays=-3.5)
  assert_eq(delta.years(), 0L)
  assert_eq(delta.months(), 0)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [0.0, -3.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, Some(12), Some(32), None, None, None, None],
  )
  assert_eq(delta.weeks(), 0.0)
  assert_eq(delta.has_time(), false)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 74" {
  let delta = @date.RelativeDelta::new(
    yearday=366,
    nlyearday=60,
    month=7,
    day=8,
    leapdays=4.25,
  )
  assert_eq(delta.years(), 0L)
  assert_eq(delta.months(), 0)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [0.0, 4.25, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, Some(3), Some(1), None, None, None, None],
  )
  assert_eq(delta.weeks(), 0.0)
  assert_eq(delta.has_time(), false)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 75" {
  let delta = @date.RelativeDelta::new(
    days=-189059.375,
    hours=-3.219289,
    minutes=918686.5,
    seconds=1154314.75,
    microseconds=-923181.8,
    years=-14959L,
    months=6112L,
  )
  assert_eq(delta.years(), -14450L)
  assert_eq(delta.months(), 4)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [-188408.375, 0.0, 4.780710999999428, 4.5, 34.75, -923181.8],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), -26915.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 76" {
  let delta = @date.RelativeDelta::new(
    days=-393242.375,
    hours=202846.75,
    minutes=1221978.375,
    seconds=1170010.5,
    microseconds=-8.549395,
    years=6427L,
    months=-18702L,
  )
  assert_eq(delta.years(), 4869L)
  assert_eq(delta.months(), -6)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [-383928.375, 0.0, 1.75, 18.375, 10.5, -8.549395],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), -54846.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 77" {
  let delta = @date.RelativeDelta::new(
    days=-516372.8,
    hours=1313699.5,
    minutes=-215373.0,
    seconds=-221208.0,
    microseconds=927954.5,
    years=-2928L,
    months=4499L,
  )
  assert_eq(delta.years(), -2554L)
  assert_eq(delta.months(), 11)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [-461787.8, 0.0, 9.5, -59.0, -48.0, 927954.5],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), -65969.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 78" {
  let delta = @date.RelativeDelta::new(
    days=1034100.0,
    hours=9067310.0,
    minutes=-106749.0,
    seconds=-4.866776,
    microseconds=6.882249,
    years=18008L,
    months=-4310L,
  )
  assert_eq(delta.years(), 17649L)
  assert_eq(delta.months(), -2)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [1411830.0, 0.0, 11.0, -9.0, -4.866776, 6.882249],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 201690.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 79" {
  let delta = @date.RelativeDelta::new(
    days=0.792071,
    hours=-113733.375,
    minutes=1834121.0,
    seconds=-301593.0,
    microseconds=-475955.0,
    years=-7287L,
    months=-13675L,
  )
  assert_eq(delta.years(), -8426L)
  assert_eq(delta.months(), -7)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [-3467.207929, 0.0, -17.375, 55.0, -33.0, -475955.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), -495.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 80" {
  let delta = @date.RelativeDelta::new(
    days=-1096294.0,
    hours=-4.793619,
    minutes=-8.644725,
    seconds=-3886120.0,
    microseconds=-2095988.0,
    years=-11091L,
    months=1450L,
  )
  assert_eq(delta.years(), -10971L)
  assert_eq(delta.months(), 10)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [-1096339.0, 0.0, -3.793619000000035, -36.64472499999829, -42.0, -95988.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), -156619.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 81" {
  let delta = @date.RelativeDelta::new(
    days=-98750.125,
    hours=-858772.6,
    minutes=359309.8,
    seconds=3.224121,
    microseconds=2658264.0,
    years=18511L,
    months=-8451L,
  )
  assert_eq(delta.years(), 17807L)
  assert_eq(delta.months(), -3)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [
      -134282.125, 0.0, -16.599999999976717, 29.79999999998836, 5.224121, 658264.0,
    ],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), -19183.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 82" {
  let delta = @date.RelativeDelta::new(
    days=293849.5,
    hours=-370140.9,
    minutes=-141361.7,
    seconds=7.346868,
    microseconds=5381000.0,
    years=-7497L,
    months=-12147L,
  )
  assert_eq(delta.years(), -8509L)
  assert_eq(delta.months(), -3)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [
      278329.5, 0.0, -16.900000000023283, -1.7000000000116415, 12.346868, 381000.0,
    ],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 39761.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 83" {
  let delta = @date.RelativeDelta::new(
    days=880139.9,
    hours=4837527.5,
    minutes=-80858.0,
    seconds=-1.767828,
    microseconds=-580721.25,
    years=9827L,
    months=-9378L,
  )
  assert_eq(delta.years(), 9046L)
  assert_eq(delta.months(), -6)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [1081646.9, 0.0, 12.5, -38.0, -1.767828, -580721.25],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 154520.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 84" {
  let delta = @date.RelativeDelta::new(
    days=181788.4,
    hours=-7.397746,
    minutes=-324683.0,
    seconds=-567944.0,
    microseconds=5039672.0,
    years=-17817L,
    months=7555L,
  )
  assert_eq(delta.years(), -17188L)
  assert_eq(delta.months(), 7)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [181556.4, 0.0, -8.397745999999643, -8.0, -39.0, 39672.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 25936.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 85" {
  let delta = @date.RelativeDelta::new(
    days=6249769.0,
    hours=-6.205153,
    minutes=-1036377.375,
    seconds=479085.0,
    microseconds=8935179.0,
    years=-1281L,
    months=17039L,
  )
  assert_eq(delta.years(), 138L)
  assert_eq(delta.months(), 11)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [6249055.0, 0.0, -9.205152999998973, -53.375, 53.0, 935179.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 892722.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 86" {
  let delta = @date.RelativeDelta::new(
    days=-1.953017,
    hours=-678601.3,
    minutes=-1462393.0,
    seconds=53889.625,
    microseconds=-5897910.0,
    years=481L,
    months=-9513L,
  )
  assert_eq(delta.years(), -311L)
  assert_eq(delta.months(), -9)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [-29290.953017, 0.0, -23.300000000046566, -15.0, 4.625, -897910.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), -4184.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 87" {
  let delta = @date.RelativeDelta::new(
    days=-492117.5,
    hours=1118327.875,
    minutes=-2.535876,
    seconds=-3543912.0,
    microseconds=-3884253.0,
    years=-2760L,
    months=-12583L,
  )
  assert_eq(delta.years(), -3808L)
  assert_eq(delta.months(), -7)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [-445562.5, 0.0, 23.875, -27.535876000001736, -15.0, -884253.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), -63651.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 88" {
  let delta = @date.RelativeDelta::new(
    days=-3955130.0,
    hours=385412.625,
    minutes=-9088335.0,
    seconds=4816475.0,
    microseconds=3902903.5,
    years=-5904L,
    months=13563L,
  )
  assert_eq(delta.years(), -4774L)
  assert_eq(delta.months(), 3)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [-3945327.0, 0.0, 6.625, -21.0, 38.0, 902903.5],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), -563618.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 89" {
  let delta = @date.RelativeDelta::new(
    days=6797183.0,
    hours=1.652558,
    minutes=-2144588.0,
    seconds=-75646.5,
    microseconds=930114.125,
    years=15995L,
    months=-1365L,
  )
  assert_eq(delta.years(), 15882L)
  assert_eq(delta.months(), -9)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [6795693.0, 0.0, -2.3474419999984093, -8.0, -46.5, 930114.125],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 970813.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 90" {
  let delta = @date.RelativeDelta::new(
    days=-8237497.0,
    hours=-4445.1,
    minutes=-2275120.0,
    seconds=484780.9,
    microseconds=574422.6,
    years=2141L,
    months=19890L,
  )
  assert_eq(delta.years(), 3798L)
  assert_eq(delta.months(), 6)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [-8239256.0, 0.0, -13.099999999998545, -1.0, 40.90000000002328, 574422.6],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), -1177036.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 91" {
  let delta = @date.RelativeDelta::new(
    days=-4265042.5,
    hours=1188421.0,
    minutes=13498.8,
    seconds=485362.5,
    microseconds=0.742741,
    years=3585L,
    months=17862L,
  )
  assert_eq(delta.years(), 5073L)
  assert_eq(delta.months(), 6)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [-4215510.5, 0.0, 12.0, 47.79999999999927, 22.5, 0.742741],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), -602215.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 92" {
  let delta = @date.RelativeDelta::new(
    days=6.873268,
    hours=9139351.0,
    minutes=2860937.0,
    seconds=-751822.0,
    microseconds=1221030.25,
    years=1512L,
    months=9676L,
  )
  assert_eq(delta.years(), 2318L)
  assert_eq(delta.months(), 4)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [382790.873268, 0.0, 8.0, 27.0, -21.0, 221030.25],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 54684.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 93" {
  let delta = @date.RelativeDelta::new(
    days=662402.125,
    hours=-8158039.0,
    minutes=-543837.9,
    seconds=788445.4,
    microseconds=-5.572976,
    years=8032L,
    months=-355L,
  )
  assert_eq(delta.years(), 8003L)
  assert_eq(delta.months(), -7)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [322116.125, 0.0, -19.0, -57.90000000002328, 45.40000000002328, -5.572976],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 46016.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 94" {
  let delta = @date.RelativeDelta::new(
    days=186133.8,
    hours=22011.9,
    minutes=-672140.7,
    seconds=438239.2,
    microseconds=-5.959838,
    years=16167L,
    months=3170L,
  )
  assert_eq(delta.years(), 16431L)
  assert_eq(delta.months(), 2)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [
      186588.8, 0.0, 11.900000000001455, -37.699999999953434, 59.20000000001164,
      -5.959838,
    ],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 26655.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 95" {
  let delta = @date.RelativeDelta::new(
    days=-6467370.0,
    hours=-843263.3,
    minutes=229575.1,
    seconds=-3.168441,
    microseconds=-738128.5,
    years=-5546L,
    months=-2027L,
  )
  assert_eq(delta.years(), -5714L)
  assert_eq(delta.months(), -11)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [
      -6502346.0, 0.0, -13.300000000046566, 15.10000000000582, -3.168441, -738128.5,
    ],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), -928906.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 96" {
  let delta = @date.RelativeDelta::new(
    days=-752045.5,
    hours=-9.205883,
    minutes=9850115.0,
    seconds=-422877.0,
    microseconds=604598.75,
    years=14878L,
    months=4774L,
  )
  assert_eq(delta.years(), 15275L)
  assert_eq(delta.months(), 10)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [-745210.5, 0.0, 1.7941170000121929, 8.0, -57.0, 604598.75],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), -106458.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 97" {
  let delta = @date.RelativeDelta::new(
    days=-6520067.0,
    hours=241517.375,
    minutes=-6521434.0,
    seconds=2.716886,
    microseconds=626900.3,
    years=-9563L,
    months=-4934L,
  )
  assert_eq(delta.years(), -9974L)
  assert_eq(delta.months(), -2)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [-6514533.0, 0.0, 11.375, -34.0, 2.716886, 626900.3],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), -930647.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 98" {
  let delta = @date.RelativeDelta::new(
    days=-4237743.0,
    hours=284597.7,
    minutes=5.120257,
    seconds=4031816.0,
    microseconds=6.016754,
    years=-4891L,
    months=-2489L,
  )
  assert_eq(delta.years(), -5098L)
  assert_eq(delta.months(), -5)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [-4225839.0, 0.0, 21.70000000001164, 1.1202570000023115, 56.0, 6.016754],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), -603691.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 99" {
  let delta = @date.RelativeDelta::new(
    days=-736278.0,
    hours=366351.25,
    minutes=9632115.0,
    seconds=2610216.5,
    microseconds=-1123869.0,
    years=-3244L,
    months=-14220L,
  )
  assert_eq(delta.years(), -4429L)
  assert_eq(delta.months(), 0)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [-714295.0, 0.0, 19.25, 18.0, 35.5, -123869.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), -102042.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 100" {
  let delta = @date.RelativeDelta::new(
    days=-4471695.0,
    hours=1023258.5,
    minutes=-529058.5,
    seconds=-1842054.0,
    microseconds=6.057783,
    years=4962L,
    months=734L,
  )
  assert_eq(delta.years(), 5023L)
  assert_eq(delta.months(), 2)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [-4429448.0, 0.0, 1.5, -18.5, -54.0, 6.057783],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), -632778.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 101" {
  let delta = @date.RelativeDelta::new(
    days=-189674.75,
    hours=-272427.4,
    minutes=1535705.5,
    seconds=-9592.125,
    microseconds=-452939.875,
    years=-18124L,
    months=-18137L,
  )
  assert_eq(delta.years(), -19635L)
  assert_eq(delta.months(), -5)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [-199958.75, 0.0, -19.400000000023283, 26.5, -52.125, -452939.875],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), -28565.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 102" {
  let delta = @date.RelativeDelta::new(
    days=-7.510036,
    hours=458895.9,
    minutes=-1186038.0,
    seconds=2063817.0,
    microseconds=-4022754.5,
    years=5411L,
    months=-1207L,
  )
  assert_eq(delta.years(), 5311L)
  assert_eq(delta.months(), -7)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [18312.489964, 0.0, 21.900000000023283, -2.0, 53.0, -22754.5],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 2616.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 103" {
  let delta = @date.RelativeDelta::new(
    days=1139843.625,
    hours=9821723.0,
    minutes=-104588.5,
    seconds=3634109.0,
    microseconds=-8.506941,
    years=-15104L,
    months=12004L,
  )
  assert_eq(delta.years(), -14104L)
  assert_eq(delta.months(), 4)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [1549050.625, 0.0, 22.0, -40.5, 29.0, -8.506941],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 221292.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 104" {
  let delta = @date.RelativeDelta::new(
    days=-3447148.5,
    hours=-2518236.5,
    minutes=131673.0,
    seconds=-1029006.5,
    microseconds=7.31917,
    years=14387L,
    months=-16945L,
  )
  assert_eq(delta.years(), 12975L)
  assert_eq(delta.months(), -1)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [-3551995.5, 0.0, -0.5, 43.0, -6.5, 7.31917],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), -507427.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 105" {
  let delta = @date.RelativeDelta::new(
    days=1.033419,
    hours=-9132.375,
    minutes=4946398.5,
    seconds=4777689.0,
    microseconds=186711.0,
    years=-12397L,
    months=-5675L,
  )
  assert_eq(delta.years(), -12869L)
  assert_eq(delta.months(), -11)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [3110.033419, 0.0, 18.625, 6.5, 9.0, 186711.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 444.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 106" {
  let delta = @date.RelativeDelta::new(
    days=-623242.3,
    hours=-521.3,
    minutes=-8394424.0,
    seconds=-0.227224,
    microseconds=8.227572,
    years=-1581L,
    months=-9182L,
  )
  assert_eq(delta.years(), -2346L)
  assert_eq(delta.months(), -2)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [-629093.3, 0.0, -4.2999999999883585, -4.0, -0.227224, 8.227572],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), -89870.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 107" {
  let delta = @date.RelativeDelta::new(
    days=-1879051.0,
    hours=4736923.5,
    minutes=-2509950.5,
    seconds=683294.0,
    microseconds=-986430.5,
    years=3764L,
    months=-13418L,
  )
  assert_eq(delta.years(), 2646L)
  assert_eq(delta.months(), -2)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [-1683415.0, 0.0, 17.5, -42.5, 14.0, -986430.5],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), -240487.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 108" {
  let delta = @date.RelativeDelta::new(
    days=-1683893.0,
    hours=-1243686.875,
    minutes=738811.3,
    seconds=5.869302,
    microseconds=1122420.625,
    years=-13788L,
    months=-7372L,
  )
  assert_eq(delta.years(), -14402L)
  assert_eq(delta.months(), -4)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [-1735200.0, 0.0, -5.875, 31.300000000046566, 6.869302, 122420.625],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), -247885.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 109" {
  let delta = @date.RelativeDelta::new(
    days=-5400961.0,
    hours=-2591045.0,
    minutes=-398203.7,
    seconds=-1873018.5,
    microseconds=627659.5,
    years=4614L,
    months=-195L,
  )
  assert_eq(delta.years(), 4598L)
  assert_eq(delta.months(), -3)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [-5509219.0, 0.0, -9.0, -59.70000000001164, -58.5, 627659.5],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), -787031.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 110" {
  let delta = @date.RelativeDelta::new(
    days=4993439.0,
    hours=2541515.5,
    minutes=3254563.0,
    seconds=-117797.5,
    microseconds=157323.3,
    years=955L,
    months=14326L,
  )
  assert_eq(delta.years(), 2148L)
  assert_eq(delta.months(), 10)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [5101594.0, 0.0, 5.5, 0.0, -17.5, 157323.3],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 728799.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 111" {
  let delta = @date.RelativeDelta::new(
    days=872599.4,
    hours=-7.471745,
    minutes=-3402437.5,
    seconds=-96832.75,
    microseconds=9.699055,
    years=16391L,
    months=17457L,
  )
  assert_eq(delta.years(), 17845L)
  assert_eq(delta.months(), 9)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [870235.4, 0.0, -5.4717450000025565, -10.5, -52.75, 9.699055],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 124319.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 112" {
  let delta = @date.RelativeDelta::new(
    days=667338.625,
    hours=3134864.0,
    minutes=-550217.2,
    seconds=2643531.0,
    microseconds=6096266.0,
    years=8408L,
    months=-12471L,
  )
  assert_eq(delta.years(), 7369L)
  assert_eq(delta.months(), -3)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [797605.625, 0.0, 21.0, -59.199999999953434, 57.0, 96266.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 113943.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 113" {
  let delta = @date.RelativeDelta::new(
    days=-895738.5,
    hours=2849466.5,
    minutes=-5216484.0,
    seconds=4237931.0,
    microseconds=3469933.0,
    years=8841L,
    months=-8746L,
  )
  assert_eq(delta.years(), 8113L)
  assert_eq(delta.months(), -10)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [-780584.5, 0.0, 6.5, -12.0, 14.0, 469933.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), -111512.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 114" {
  let delta = @date.RelativeDelta::new(
    days=-4724473.0,
    hours=-791898.2,
    minutes=369729.0,
    seconds=-1.193459,
    microseconds=-376054.5,
    years=499L,
    months=7168L,
  )
  assert_eq(delta.years(), 1096L)
  assert_eq(delta.months(), 4)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [-4757212.0, 0.0, -0.19999999995343387, 9.0, -1.193459, -376054.5],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), -679601.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 115" {
  let delta = @date.RelativeDelta::new(
    days=-9432785.0,
    hours=33430.6,
    minutes=-3684690.0,
    seconds=196453.7,
    microseconds=7739743.0,
    years=11359L,
    months=-7331L,
  )
  assert_eq(delta.years(), 10749L)
  assert_eq(delta.months(), -11)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [-9433948.0, 0.0, -13.400000000001455, -56.0, 20.70000000001164, 739743.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), -1347706.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 116" {
  let delta = @date.RelativeDelta::new(
    days=703005.875,
    hours=-404192.5,
    minutes=-501072.4,
    seconds=3894974.0,
    microseconds=92177.75,
    years=-11040L,
    months=-18288L,
  )
  assert_eq(delta.years(), -12564L)
  assert_eq(delta.months(), 0)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [685861.875, 0.0, -5.5, -16.400000000023283, 14.0, 92177.75],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 97980.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 117" {
  let delta = @date.RelativeDelta::new(
    days=345053.125,
    hours=4702720.0,
    minutes=822647.25,
    seconds=1211423.5,
    microseconds=393984.75,
    years=-3523L,
    months=-13000L,
  )
  assert_eq(delta.years(), -4606L)
  assert_eq(delta.months(), -4)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [541584.125, 0.0, 23.0, 17.25, 23.5, 393984.75],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 77369.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 118" {
  let delta = @date.RelativeDelta::new(
    days=486920.0,
    hours=2060053.0,
    minutes=-3523.25,
    seconds=4167126.0,
    microseconds=5280909.0,
    years=-12200L,
    months=-19730L,
  )
  assert_eq(delta.years(), -13844L)
  assert_eq(delta.months(), -2)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [572801.0, 0.0, 7.0, 48.75, 11.0, 280909.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 81828.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 119" {
  let delta = @date.RelativeDelta::new(
    days=1.285118,
    hours=1.922055,
    minutes=3055367.0,
    seconds=427677.375,
    microseconds=748828.5,
    years=11447L,
    months=5586L,
  )
  assert_eq(delta.years(), 11912L)
  assert_eq(delta.months(), 6)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [2127.285118, 0.0, 18.92205500000273, 34.0, 57.375, 748828.5],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 303.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 120" {
  let delta = @date.RelativeDelta::new(
    days=-2184123.0,
    hours=2690911.5,
    minutes=8739641.0,
    seconds=5933606.0,
    microseconds=202404.6,
    years=-9917L,
    months=-16353L,
  )
  assert_eq(delta.years(), -11279L)
  assert_eq(delta.months(), -9)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [-2065864.0, 0.0, 3.5, 54.0, 26.0, 202404.6],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), -295123.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 121" {
  let delta = @date.RelativeDelta::new(
    days=-2.248469,
    hours=-2219178.5,
    minutes=-93992.375,
    seconds=209179.0,
    microseconds=-1867064.0,
    years=8540L,
    months=-7286L,
  )
  assert_eq(delta.years(), 7933L)
  assert_eq(delta.months(), -2)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [-92530.248469, 0.0, -14.5, -26.375, 18.0, -867064.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), -13218.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 122" {
  let delta = @date.RelativeDelta::new(
    days=-451921.75,
    hours=3.964525,
    minutes=-4210495.0,
    seconds=-431500.0,
    microseconds=6.048109,
    years=-6185L,
    months=542L,
  )
  assert_eq(delta.years(), -6140L)
  assert_eq(delta.months(), 2)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [-454849.75, 0.0, -18.03547499999695, -46.0, -40.0, 6.048109],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), -64978.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 123" {
  let delta = @date.RelativeDelta::new(
    days=306987.0,
    hours=-1205672.0,
    minutes=-3974908.0,
    seconds=-1832270.0,
    microseconds=2.877429,
    years=-3910L,
    months=-11307L,
  )
  assert_eq(delta.years(), -4852L)
  assert_eq(delta.months(), -3)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [253970.0, 0.0, -21.0, -25.0, -50.0, 2.877429],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 36281.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 124" {
  let delta = @date.RelativeDelta::new(
    days=-4479977.5,
    hours=-5672524.0,
    minutes=5.921386,
    seconds=-461182.125,
    microseconds=590000.5,
    years=4103L,
    months=12969L,
  )
  assert_eq(delta.years(), 5183L)
  assert_eq(delta.months(), 9)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [-4716337.5, 0.0, -12.0, -0.07861400000001595, -22.125, 590000.5],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), -673762.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 125" {
  let delta = @date.RelativeDelta::new(
    days=-332824.4,
    hours=2991233.0,
    minutes=-2522378.0,
    seconds=-6598262.0,
    microseconds=8.745774,
    years=-8829L,
    months=-5455L,
  )
  assert_eq(delta.years(), -9283L)
  assert_eq(delta.months(), -7)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [-210018.40000000002, 0.0, 17.0, -29.0, -2.0, 8.745774],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), -30002.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 126" {
  let delta = @date.RelativeDelta::new(
    days=626986.0,
    hours=8601149.0,
    minutes=1216072.0,
    seconds=-5889340.0,
    microseconds=308054.4,
    years=2221L,
    months=-15995L,
  )
  assert_eq(delta.years(), 889L)
  assert_eq(delta.months(), -11)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [986143.0, 0.0, 12.0, 57.0, -40.0, 308054.4],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 140877.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 127" {
  let delta = @date.RelativeDelta::new(
    days=3.60434,
    hours=2065443.0,
    minutes=7455944.0,
    seconds=843940.5,
    microseconds=-9864267.0,
    years=14826L,
    months=9098L,
  )
  assert_eq(delta.years(), 15584L)
  assert_eq(delta.months(), 2)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [91250.60434, 0.0, 15.0, 9.0, 31.5, -864267.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 13035.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 128" {
  let delta = @date.RelativeDelta::new(
    days=-1040075.75,
    hours=-126198.5,
    minutes=-1013614.875,
    seconds=167158.5,
    microseconds=-2771858.0,
    years=-19027L,
    months=-16213L,
  )
  assert_eq(delta.years(), -20378L)
  assert_eq(delta.months(), -1)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [-1046035.75, 0.0, -5.5, -9.875, 56.5, -771858.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), -149433.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 129" {
  let delta = @date.RelativeDelta::new(
    days=1830033.5,
    hours=-219501.5,
    minutes=-1004428.875,
    seconds=393168.3,
    microseconds=260581.4,
    years=-9861L,
    months=12146L,
  )
  assert_eq(delta.years(), -8849L)
  assert_eq(delta.months(), 2)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [1820195.5, 0.0, -20.5, -16.875, 48.29999999998836, 260581.4],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 260027.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 130" {
  let delta = @date.RelativeDelta::new(
    days=-6620263.0,
    hours=7.94071,
    minutes=6649701.0,
    seconds=-601581.375,
    microseconds=-8.567272,
    years=-350L,
    months=12947L,
  )
  assert_eq(delta.years(), 728L)
  assert_eq(delta.months(), 11)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [-6615652.0, 0.0, 4.940709999995306, 15.0, -21.375, -8.567272],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), -945093.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 131" {
  let delta = @date.RelativeDelta::new(
    days=-4656446.5,
    hours=3607115.5,
    minutes=3049172.0,
    seconds=8.072511,
    microseconds=-112766.0,
    years=-2942L,
    months=298L,
  )
  assert_eq(delta.years(), -2918L)
  assert_eq(delta.months(), 10)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [-4504033.5, 0.0, 22.5, 32.0, 8.072511, -112766.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), -643433.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 132" {
  let delta = @date.RelativeDelta::new(
    days=-6.839548,
    hours=-0.987406,
    minutes=-8490417.0,
    seconds=-232319.25,
    microseconds=2305185.5,
    years=-13779L,
    months=-9775L,
  )
  assert_eq(delta.years(), -14593L)
  assert_eq(delta.months(), -7)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [-5904.839548, 0.0, -19.987406000000192, -28.0, -57.25, 305185.5],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), -843.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 133" {
  let delta = @date.RelativeDelta::new(
    days=844009.3,
    hours=51912.875,
    minutes=1193908.75,
    seconds=-382863.5,
    microseconds=6991585.0,
    years=-15221L,
    months=8021L,
  )
  assert_eq(delta.years(), -14553L)
  assert_eq(delta.months(), 5)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [846996.3, 0.0, 16.875, 8.75, -57.5, 991585.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 120999.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 134" {
  let delta = @date.RelativeDelta::new(
    days=-360212.0,
    hours=-4.197374,
    minutes=2854002.0,
    seconds=8.617025,
    microseconds=-2.897297,
    years=-3702L,
    months=1272L,
  )
  assert_eq(delta.years(), -3596L)
  assert_eq(delta.months(), 0)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [-358231.0, 0.0, 17.802625999996962, 42.0, 8.617025, -2.897297],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), -51175.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 135" {
  let delta = @date.RelativeDelta::new(
    days=230753.125,
    hours=702939.25,
    minutes=-935594.0,
    seconds=-1343188.0,
    microseconds=-588637.0,
    years=-11070L,
    months=17837L,
  )
  assert_eq(delta.years(), -9584L)
  assert_eq(delta.months(), 5)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [259376.125, 0.0, 21.25, -20.0, -28.0, -588637.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 37053.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 136" {
  let delta = @date.RelativeDelta::new(
    days=-9.341969,
    hours=-122718.6,
    minutes=-968564.5,
    seconds=3.157129,
    microseconds=-9.534805,
    years=-12166L,
    months=10112L,
  )
  assert_eq(delta.years(), -11324L)
  assert_eq(delta.months(), 8)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [-5794.341969, 0.0, -20.60000000000582, -44.5, 3.157129, -9.534805],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), -827.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 137" {
  let delta = @date.RelativeDelta::new(
    days=-47238.75,
    hours=2.130507,
    minutes=838133.2,
    seconds=-1.818977,
    microseconds=7299716.0,
    years=7426L,
    months=-15423L,
  )
  assert_eq(delta.years(), 6141L)
  assert_eq(delta.months(), -3)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [-46656.75, 0.0, 2.1305069999998523, 53.199999999953434, 5.181023, 299716.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), -6665.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 138" {
  let delta = @date.RelativeDelta::new(
    days=-7.201569,
    hours=108682.0,
    minutes=1927910.0,
    seconds=835373.5,
    microseconds=419480.4,
    years=4105L,
    months=-7502L,
  )
  assert_eq(delta.years(), 3480L)
  assert_eq(delta.months(), -2)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [5868.798431, 0.0, 21.0, 52.0, 53.5, 419480.4],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 838.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 139" {
  let delta = @date.RelativeDelta::new(
    days=8821064.0,
    hours=-389160.9,
    minutes=685251.0,
    seconds=2539536.5,
    microseconds=559070.6,
    years=178L,
    months=-10922L,
  )
  assert_eq(delta.years(), -732L)
  assert_eq(delta.months(), -2)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [8805355.0, 0.0, -18.900000000023283, 16.0, 36.5, 559070.6],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 1257907.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 140" {
  let delta = @date.RelativeDelta::new(
    days=441048.2,
    hours=-5543163.0,
    minutes=-6.978565,
    seconds=646882.25,
    microseconds=-4968154.0,
    years=-7L,
    months=-2543L,
  )
  assert_eq(delta.years(), -218L)
  assert_eq(delta.months(), -11)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [210091.2, 0.0, -16.0, 34.021435000000565, 18.25, -968154.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 30013.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 141" {
  let delta = @date.RelativeDelta::new(
    days=-7822423.0,
    hours=322775.0,
    minutes=2458714.5,
    seconds=2744891.0,
    microseconds=952682.9,
    years=6313L,
    months=1945L,
  )
  assert_eq(delta.years(), 6475L)
  assert_eq(delta.months(), 1)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [-7807235.0, 0.0, 4.0, 2.5, 11.0, 952682.9],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), -1115319.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 142" {
  let delta = @date.RelativeDelta::new(
    days=-3775600.0,
    hours=3763448.5,
    minutes=-9294160.0,
    seconds=1244359.375,
    microseconds=293100.7,
    years=-3948L,
    months=16662L,
  )
  assert_eq(delta.years(), -2560L)
  assert_eq(delta.months(), 6)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [-3625230.0, 0.0, 11.5, -1.0, 19.375, 293100.7],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), -517890.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 143" {
  let delta = @date.RelativeDelta::new(
    days=316037.125,
    hours=456405.5,
    minutes=-3509838.0,
    seconds=986096.625,
    microseconds=-550444.1,
    years=-12744L,
    months=2857L,
  )
  assert_eq(delta.years(), -12506L)
  assert_eq(delta.months(), 1)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [332627.125, 0.0, 22.5, -24.0, 56.625, -550444.1],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 47518.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 144" {
  let delta = @date.RelativeDelta::new(
    days=961082.75,
    hours=-2003553.0,
    minutes=3293015.5,
    seconds=6370509.0,
    microseconds=-9242831.0,
    years=-7426L,
    months=3292L,
  )
  assert_eq(delta.years(), -7152L)
  assert_eq(delta.months(), 4)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [879962.75, 0.0, -20.0, 10.5, 0.0, -242831.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 125708.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 145" {
  let delta = @date.RelativeDelta::new(
    days=978683.8,
    hours=-2060934.0,
    minutes=364700.75,
    seconds=2441918.0,
    microseconds=290795.75,
    years=8232L,
    months=-1984L,
  )
  assert_eq(delta.years(), 8067L)
  assert_eq(delta.months(), -4)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [893093.8, 0.0, -18.0, 38.75, 38.0, 290795.75],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 127584.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 146" {
  let delta = @date.RelativeDelta::new(
    days=355763.5,
    hours=-1151288.75,
    minutes=-4.442825,
    seconds=121695.0,
    microseconds=2401300.0,
    years=-8451L,
    months=-7872L,
  )
  assert_eq(delta.years(), -9107L)
  assert_eq(delta.months(), 0)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [307795.5, 0.0, -23.75, 43.557174999999916, 17.0, 401300.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 43970.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 147" {
  let delta = @date.RelativeDelta::new(
    days=-3222755.0,
    hours=306352.0,
    minutes=-0.715437,
    seconds=-4270002.0,
    microseconds=-9122440.0,
    years=-82L,
    months=18246L,
  )
  assert_eq(delta.years(), 1438L)
  assert_eq(delta.months(), 6)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [-3210040.0, 0.0, 6.0, -6.7154370000062045, -51.0, -122440.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), -458577.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 148" {
  let delta = @date.RelativeDelta::new(
    days=367778.75,
    hours=-4619093.0,
    minutes=-211008.0,
    seconds=-9857287.0,
    microseconds=-2.298186,
    years=3914L,
    months=-12542L,
  )
  assert_eq(delta.years(), 2869L)
  assert_eq(delta.months(), -2)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [175056.75, 0.0, -19.0, -56.0, -7.0, -2.298186],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 25008.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 149" {
  let delta = @date.RelativeDelta::new(
    days=659567.8,
    hours=302957.5,
    minutes=-2.420766,
    seconds=4159649.5,
    microseconds=-5.495862,
    years=18629L,
    months=-18655L,
  )
  assert_eq(delta.years(), 17075L)
  assert_eq(delta.months(), -7)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [672238.8, 0.0, 8.5, 24.579234000004362, 29.5, -5.495862],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 96034.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 150" {
  let delta = @date.RelativeDelta::new(
    days=-9.194163,
    hours=5.320216,
    minutes=5.571042,
    seconds=72094.125,
    microseconds=-2570678.5,
    years=1645L,
    months=-6519L,
  )
  assert_eq(delta.years(), 1102L)
  assert_eq(delta.months(), -3)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [-8.194163, 0.0, 1.320216000000002, 6.571042000000034, 32.125, -570678.5],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), -1.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 151" {
  let delta = @date.RelativeDelta::new(
    days=-193471.5,
    hours=1730821.0,
    minutes=2054379.0,
    seconds=-4140957.5,
    microseconds=337947.4,
    years=-11330L,
    months=-7948L,
  )
  assert_eq(delta.years(), -11992L)
  assert_eq(delta.months(), -4)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [-119975.5, 0.0, 6.0, 24.0, -57.5, 337947.4],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), -17139.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 152" {
  let delta = @date.RelativeDelta::new(
    days=513666.375,
    hours=2917211.0,
    minutes=3211732.0,
    seconds=544544.625,
    microseconds=7.047748,
    years=-3018L,
    months=-13044L,
  )
  assert_eq(delta.years(), -4105L)
  assert_eq(delta.months(), 0)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [637453.375, 0.0, 3.0, 7.0, 44.625, 7.047748],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 91064.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 153" {
  let delta = @date.RelativeDelta::new(
    days=-8.138002,
    hours=689712.7,
    minutes=-569743.125,
    seconds=-9232862.0,
    microseconds=344876.6,
    years=18038L,
    months=-13208L,
  )
  assert_eq(delta.years(), 16938L)
  assert_eq(delta.months(), -8)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [28226.861998, 0.0, 12.699999999953434, -24.125, -2.0, 344876.6],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 4032.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor 154" {
  let delta = @date.RelativeDelta::new(
    days=7.090158,
    hours=8656418.0,
    minutes=-872501.375,
    seconds=3713426.0,
    microseconds=4743974.0,
    years=3341L,
    months=13511L,
  )
  assert_eq(delta.years(), 4466L)
  assert_eq(delta.months(), 11)
  assert_eq(
    [
      delta.days(),
      delta.leapdays(),
      delta.hours(),
      delta.minutes(),
      delta.seconds(),
      delta.microseconds(),
    ],
    [360128.090158, 0.0, 4.0, -11.375, 30.0, 743974.0],
  )
  assert_eq(
    [
      delta.year(),
      delta.month(),
      delta.day(),
      delta.hour(),
      delta.minute(),
      delta.second(),
      delta.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(delta.weeks(), 51446.0)
  assert_eq(delta.has_time(), true)
  assert_true(delta.weekday() is None)
}

///|
test "relative delta original constructor rejected inputs" {
  assert_true(
    try {
      ignore(@date.RelativeDelta::new(weekday=7))
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(@date.RelativeDelta::new(weekday=-8))
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(@date.RelativeDelta::new(yearday=367))
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(@date.RelativeDelta::new(nlyearday=2147483647))
      false
    } catch {
      _ => true
    },
  )
}
