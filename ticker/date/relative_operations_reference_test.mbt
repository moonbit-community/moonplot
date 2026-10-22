// Generated original relativedelta object operations; finite Double/Int64 typed domain.

///|
test "relative delta original add 0/0" {
  let result = @date.RelativeDelta::new().add(@date.RelativeDelta::new())
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), true)
}

///|
test "relative delta original subtract 0/0" {
  let result = @date.RelativeDelta::new().subtract(@date.RelativeDelta::new())
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), true)
}

///|
test "relative delta original add 0/1" {
  let result = @date.RelativeDelta::new().add(
    @date.RelativeDelta::new(
      year=2000,
      month=2,
      day=29,
      hour=1,
      minute=2,
      second=3,
      microsecond=4,
      leapdays=2.5,
      weekday=0,
    ),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 2.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(2000), Some(2), Some(29), Some(1), Some(2), Some(3), Some(4)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract 0/1" {
  let result = @date.RelativeDelta::new().subtract(
    @date.RelativeDelta::new(
      year=2000,
      month=2,
      day=29,
      hour=1,
      minute=2,
      second=3,
      microsecond=4,
      leapdays=2.5,
      weekday=0,
    ),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 2.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(2000), Some(2), Some(29), Some(1), Some(2), Some(3), Some(4)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add 0/2" {
  let result = @date.RelativeDelta::new().add(
    @date.RelativeDelta::new(
      year=0,
      month=0,
      day=0,
      hour=0,
      minute=0,
      second=0,
      microsecond=0,
      leapdays=-3.5,
      on_weekday=@date.RelativeWeekday::new(6, nth=-2),
    ),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, -3.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(0), Some(0), Some(0), Some(0), Some(0), Some(0), Some(0)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), Some(-2))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract 0/2" {
  let result = @date.RelativeDelta::new().subtract(
    @date.RelativeDelta::new(
      year=0,
      month=0,
      day=0,
      hour=0,
      minute=0,
      second=0,
      microsecond=0,
      leapdays=-3.5,
      on_weekday=@date.RelativeWeekday::new(6, nth=-2),
    ),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, -3.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(0), Some(0), Some(0), Some(0), Some(0), Some(0), Some(0)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), Some(-2))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add 0/3" {
  let result = @date.RelativeDelta::new().add(
    @date.RelativeDelta::new(
      years=3L,
      months=-11L,
      days=1.5,
      hours=-23.5,
      microseconds=-1000000.5,
    ),
  )
  assert_eq(result.years(), 3L)
  assert_eq(result.months(), -11)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [1.5, 0.0, -23.5, 0.0, -1.0, -0.5],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract 0/3" {
  let result = @date.RelativeDelta::new().subtract(
    @date.RelativeDelta::new(
      years=3L,
      months=-11L,
      days=1.5,
      hours=-23.5,
      microseconds=-1000000.5,
    ),
  )
  assert_eq(result.years(), -3L)
  assert_eq(result.months(), 11)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-1.5, 0.0, 23.5, 0.0, 1.0, 0.5],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add 0/4" {
  let result = @date.RelativeDelta::new().add(
    @date.RelativeDelta::new(years=-9223372036854775808L, months=11L),
  )
  assert_eq(result.years(), -9223372036854775808L)
  assert_eq(result.months(), 11)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract 0/4" {
  assert_true(
    try {
      ignore(
        @date.RelativeDelta::new().subtract(
          @date.RelativeDelta::new(years=-9223372036854775808L, months=11L),
        ),
      )
      false
    } catch {
      _ => true
    },
  )
}

///|
test "relative delta original add 0/5" {
  let result = @date.RelativeDelta::new().add(
    @date.RelativeDelta::new(years=9223372036854775807L, months=-11L),
  )
  assert_eq(result.years(), 9223372036854775807L)
  assert_eq(result.months(), -11)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract 0/5" {
  let result = @date.RelativeDelta::new().subtract(
    @date.RelativeDelta::new(years=9223372036854775807L, months=-11L),
  )
  assert_eq(result.years(), -9223372036854775807L)
  assert_eq(result.months(), 11)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add 0/6" {
  let result = @date.RelativeDelta::new().add(
    @date.RelativeDelta::new(years=1L, months=-1L),
  )
  assert_eq(result.years(), 1L)
  assert_eq(result.months(), -1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract 0/6" {
  let result = @date.RelativeDelta::new().subtract(
    @date.RelativeDelta::new(years=1L, months=-1L),
  )
  assert_eq(result.years(), -1L)
  assert_eq(result.months(), 1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add 0/7" {
  let result = @date.RelativeDelta::new().add(
    @date.RelativeDelta::new(years=-1L, months=1L),
  )
  assert_eq(result.years(), -1L)
  assert_eq(result.months(), 1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract 0/7" {
  let result = @date.RelativeDelta::new().subtract(
    @date.RelativeDelta::new(years=-1L, months=1L),
  )
  assert_eq(result.years(), 1L)
  assert_eq(result.months(), -1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add 1/0" {
  let result = @date.RelativeDelta::new(
    year=2000,
    month=2,
    day=29,
    hour=1,
    minute=2,
    second=3,
    microsecond=4,
    leapdays=2.5,
    weekday=0,
  ).add(@date.RelativeDelta::new())
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 2.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(2000), Some(2), Some(29), Some(1), Some(2), Some(3), Some(4)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract 1/0" {
  let result = @date.RelativeDelta::new(
    year=2000,
    month=2,
    day=29,
    hour=1,
    minute=2,
    second=3,
    microsecond=4,
    leapdays=2.5,
    weekday=0,
  ).subtract(@date.RelativeDelta::new())
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 2.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(2000), Some(2), Some(29), Some(1), Some(2), Some(3), Some(4)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add 1/1" {
  let result = @date.RelativeDelta::new(
    year=2000,
    month=2,
    day=29,
    hour=1,
    minute=2,
    second=3,
    microsecond=4,
    leapdays=2.5,
    weekday=0,
  ).add(
    @date.RelativeDelta::new(
      year=2000,
      month=2,
      day=29,
      hour=1,
      minute=2,
      second=3,
      microsecond=4,
      leapdays=2.5,
      weekday=0,
    ),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 2.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(2000), Some(2), Some(29), Some(1), Some(2), Some(3), Some(4)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract 1/1" {
  let result = @date.RelativeDelta::new(
    year=2000,
    month=2,
    day=29,
    hour=1,
    minute=2,
    second=3,
    microsecond=4,
    leapdays=2.5,
    weekday=0,
  ).subtract(
    @date.RelativeDelta::new(
      year=2000,
      month=2,
      day=29,
      hour=1,
      minute=2,
      second=3,
      microsecond=4,
      leapdays=2.5,
      weekday=0,
    ),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 2.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(2000), Some(2), Some(29), Some(1), Some(2), Some(3), Some(4)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add 1/2" {
  let result = @date.RelativeDelta::new(
    year=2000,
    month=2,
    day=29,
    hour=1,
    minute=2,
    second=3,
    microsecond=4,
    leapdays=2.5,
    weekday=0,
  ).add(
    @date.RelativeDelta::new(
      year=0,
      month=0,
      day=0,
      hour=0,
      minute=0,
      second=0,
      microsecond=0,
      leapdays=-3.5,
      on_weekday=@date.RelativeWeekday::new(6, nth=-2),
    ),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, -3.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(0), Some(0), Some(0), Some(0), Some(0), Some(0), Some(0)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), Some(-2))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract 1/2" {
  let result = @date.RelativeDelta::new(
    year=2000,
    month=2,
    day=29,
    hour=1,
    minute=2,
    second=3,
    microsecond=4,
    leapdays=2.5,
    weekday=0,
  ).subtract(
    @date.RelativeDelta::new(
      year=0,
      month=0,
      day=0,
      hour=0,
      minute=0,
      second=0,
      microsecond=0,
      leapdays=-3.5,
      on_weekday=@date.RelativeWeekday::new(6, nth=-2),
    ),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 2.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(2000), Some(2), Some(29), Some(1), Some(2), Some(3), Some(4)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add 1/3" {
  let result = @date.RelativeDelta::new(
    year=2000,
    month=2,
    day=29,
    hour=1,
    minute=2,
    second=3,
    microsecond=4,
    leapdays=2.5,
    weekday=0,
  ).add(
    @date.RelativeDelta::new(
      years=3L,
      months=-11L,
      days=1.5,
      hours=-23.5,
      microseconds=-1000000.5,
    ),
  )
  assert_eq(result.years(), 3L)
  assert_eq(result.months(), -11)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [1.5, 2.5, -23.5, 0.0, -1.0, -0.5],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(2000), Some(2), Some(29), Some(1), Some(2), Some(3), Some(4)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract 1/3" {
  let result = @date.RelativeDelta::new(
    year=2000,
    month=2,
    day=29,
    hour=1,
    minute=2,
    second=3,
    microsecond=4,
    leapdays=2.5,
    weekday=0,
  ).subtract(
    @date.RelativeDelta::new(
      years=3L,
      months=-11L,
      days=1.5,
      hours=-23.5,
      microseconds=-1000000.5,
    ),
  )
  assert_eq(result.years(), -3L)
  assert_eq(result.months(), 11)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-1.5, 2.5, 23.5, 0.0, 1.0, 0.5],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(2000), Some(2), Some(29), Some(1), Some(2), Some(3), Some(4)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add 1/4" {
  let result = @date.RelativeDelta::new(
    year=2000,
    month=2,
    day=29,
    hour=1,
    minute=2,
    second=3,
    microsecond=4,
    leapdays=2.5,
    weekday=0,
  ).add(@date.RelativeDelta::new(years=-9223372036854775808L, months=11L))
  assert_eq(result.years(), -9223372036854775808L)
  assert_eq(result.months(), 11)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 2.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(2000), Some(2), Some(29), Some(1), Some(2), Some(3), Some(4)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract 1/4" {
  assert_true(
    try {
      ignore(
        @date.RelativeDelta::new(
          year=2000,
          month=2,
          day=29,
          hour=1,
          minute=2,
          second=3,
          microsecond=4,
          leapdays=2.5,
          weekday=0,
        ).subtract(
          @date.RelativeDelta::new(years=-9223372036854775808L, months=11L),
        ),
      )
      false
    } catch {
      _ => true
    },
  )
}

///|
test "relative delta original add 1/5" {
  let result = @date.RelativeDelta::new(
    year=2000,
    month=2,
    day=29,
    hour=1,
    minute=2,
    second=3,
    microsecond=4,
    leapdays=2.5,
    weekday=0,
  ).add(@date.RelativeDelta::new(years=9223372036854775807L, months=-11L))
  assert_eq(result.years(), 9223372036854775807L)
  assert_eq(result.months(), -11)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 2.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(2000), Some(2), Some(29), Some(1), Some(2), Some(3), Some(4)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract 1/5" {
  let result = @date.RelativeDelta::new(
    year=2000,
    month=2,
    day=29,
    hour=1,
    minute=2,
    second=3,
    microsecond=4,
    leapdays=2.5,
    weekday=0,
  ).subtract(@date.RelativeDelta::new(years=9223372036854775807L, months=-11L))
  assert_eq(result.years(), -9223372036854775807L)
  assert_eq(result.months(), 11)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 2.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(2000), Some(2), Some(29), Some(1), Some(2), Some(3), Some(4)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add 1/6" {
  let result = @date.RelativeDelta::new(
    year=2000,
    month=2,
    day=29,
    hour=1,
    minute=2,
    second=3,
    microsecond=4,
    leapdays=2.5,
    weekday=0,
  ).add(@date.RelativeDelta::new(years=1L, months=-1L))
  assert_eq(result.years(), 1L)
  assert_eq(result.months(), -1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 2.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(2000), Some(2), Some(29), Some(1), Some(2), Some(3), Some(4)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract 1/6" {
  let result = @date.RelativeDelta::new(
    year=2000,
    month=2,
    day=29,
    hour=1,
    minute=2,
    second=3,
    microsecond=4,
    leapdays=2.5,
    weekday=0,
  ).subtract(@date.RelativeDelta::new(years=1L, months=-1L))
  assert_eq(result.years(), -1L)
  assert_eq(result.months(), 1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 2.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(2000), Some(2), Some(29), Some(1), Some(2), Some(3), Some(4)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add 1/7" {
  let result = @date.RelativeDelta::new(
    year=2000,
    month=2,
    day=29,
    hour=1,
    minute=2,
    second=3,
    microsecond=4,
    leapdays=2.5,
    weekday=0,
  ).add(@date.RelativeDelta::new(years=-1L, months=1L))
  assert_eq(result.years(), -1L)
  assert_eq(result.months(), 1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 2.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(2000), Some(2), Some(29), Some(1), Some(2), Some(3), Some(4)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract 1/7" {
  let result = @date.RelativeDelta::new(
    year=2000,
    month=2,
    day=29,
    hour=1,
    minute=2,
    second=3,
    microsecond=4,
    leapdays=2.5,
    weekday=0,
  ).subtract(@date.RelativeDelta::new(years=-1L, months=1L))
  assert_eq(result.years(), 1L)
  assert_eq(result.months(), -1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 2.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(2000), Some(2), Some(29), Some(1), Some(2), Some(3), Some(4)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add 2/0" {
  let result = @date.RelativeDelta::new(
    year=0,
    month=0,
    day=0,
    hour=0,
    minute=0,
    second=0,
    microsecond=0,
    leapdays=-3.5,
    on_weekday=@date.RelativeWeekday::new(6, nth=-2),
  ).add(@date.RelativeDelta::new())
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, -3.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(0), Some(0), Some(0), Some(0), Some(0), Some(0), Some(0)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), Some(-2))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract 2/0" {
  let result = @date.RelativeDelta::new(
    year=0,
    month=0,
    day=0,
    hour=0,
    minute=0,
    second=0,
    microsecond=0,
    leapdays=-3.5,
    on_weekday=@date.RelativeWeekday::new(6, nth=-2),
  ).subtract(@date.RelativeDelta::new())
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, -3.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(0), Some(0), Some(0), Some(0), Some(0), Some(0), Some(0)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), Some(-2))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add 2/1" {
  let result = @date.RelativeDelta::new(
    year=0,
    month=0,
    day=0,
    hour=0,
    minute=0,
    second=0,
    microsecond=0,
    leapdays=-3.5,
    on_weekday=@date.RelativeWeekday::new(6, nth=-2),
  ).add(
    @date.RelativeDelta::new(
      year=2000,
      month=2,
      day=29,
      hour=1,
      minute=2,
      second=3,
      microsecond=4,
      leapdays=2.5,
      weekday=0,
    ),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 2.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(2000), Some(2), Some(29), Some(1), Some(2), Some(3), Some(4)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract 2/1" {
  let result = @date.RelativeDelta::new(
    year=0,
    month=0,
    day=0,
    hour=0,
    minute=0,
    second=0,
    microsecond=0,
    leapdays=-3.5,
    on_weekday=@date.RelativeWeekday::new(6, nth=-2),
  ).subtract(
    @date.RelativeDelta::new(
      year=2000,
      month=2,
      day=29,
      hour=1,
      minute=2,
      second=3,
      microsecond=4,
      leapdays=2.5,
      weekday=0,
    ),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, -3.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(0), Some(0), Some(0), Some(0), Some(0), Some(0), Some(0)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), Some(-2))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add 2/2" {
  let result = @date.RelativeDelta::new(
    year=0,
    month=0,
    day=0,
    hour=0,
    minute=0,
    second=0,
    microsecond=0,
    leapdays=-3.5,
    on_weekday=@date.RelativeWeekday::new(6, nth=-2),
  ).add(
    @date.RelativeDelta::new(
      year=0,
      month=0,
      day=0,
      hour=0,
      minute=0,
      second=0,
      microsecond=0,
      leapdays=-3.5,
      on_weekday=@date.RelativeWeekday::new(6, nth=-2),
    ),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, -3.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(0), Some(0), Some(0), Some(0), Some(0), Some(0), Some(0)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), Some(-2))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract 2/2" {
  let result = @date.RelativeDelta::new(
    year=0,
    month=0,
    day=0,
    hour=0,
    minute=0,
    second=0,
    microsecond=0,
    leapdays=-3.5,
    on_weekday=@date.RelativeWeekday::new(6, nth=-2),
  ).subtract(
    @date.RelativeDelta::new(
      year=0,
      month=0,
      day=0,
      hour=0,
      minute=0,
      second=0,
      microsecond=0,
      leapdays=-3.5,
      on_weekday=@date.RelativeWeekday::new(6, nth=-2),
    ),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, -3.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(0), Some(0), Some(0), Some(0), Some(0), Some(0), Some(0)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), Some(-2))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add 2/3" {
  let result = @date.RelativeDelta::new(
    year=0,
    month=0,
    day=0,
    hour=0,
    minute=0,
    second=0,
    microsecond=0,
    leapdays=-3.5,
    on_weekday=@date.RelativeWeekday::new(6, nth=-2),
  ).add(
    @date.RelativeDelta::new(
      years=3L,
      months=-11L,
      days=1.5,
      hours=-23.5,
      microseconds=-1000000.5,
    ),
  )
  assert_eq(result.years(), 3L)
  assert_eq(result.months(), -11)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [1.5, -3.5, -23.5, 0.0, -1.0, -0.5],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(0), Some(0), Some(0), Some(0), Some(0), Some(0), Some(0)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), Some(-2))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract 2/3" {
  let result = @date.RelativeDelta::new(
    year=0,
    month=0,
    day=0,
    hour=0,
    minute=0,
    second=0,
    microsecond=0,
    leapdays=-3.5,
    on_weekday=@date.RelativeWeekday::new(6, nth=-2),
  ).subtract(
    @date.RelativeDelta::new(
      years=3L,
      months=-11L,
      days=1.5,
      hours=-23.5,
      microseconds=-1000000.5,
    ),
  )
  assert_eq(result.years(), -3L)
  assert_eq(result.months(), 11)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-1.5, -3.5, 23.5, 0.0, 1.0, 0.5],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(0), Some(0), Some(0), Some(0), Some(0), Some(0), Some(0)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), Some(-2))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add 2/4" {
  let result = @date.RelativeDelta::new(
    year=0,
    month=0,
    day=0,
    hour=0,
    minute=0,
    second=0,
    microsecond=0,
    leapdays=-3.5,
    on_weekday=@date.RelativeWeekday::new(6, nth=-2),
  ).add(@date.RelativeDelta::new(years=-9223372036854775808L, months=11L))
  assert_eq(result.years(), -9223372036854775808L)
  assert_eq(result.months(), 11)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, -3.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(0), Some(0), Some(0), Some(0), Some(0), Some(0), Some(0)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), Some(-2))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract 2/4" {
  assert_true(
    try {
      ignore(
        @date.RelativeDelta::new(
          year=0,
          month=0,
          day=0,
          hour=0,
          minute=0,
          second=0,
          microsecond=0,
          leapdays=-3.5,
          on_weekday=@date.RelativeWeekday::new(6, nth=-2),
        ).subtract(
          @date.RelativeDelta::new(years=-9223372036854775808L, months=11L),
        ),
      )
      false
    } catch {
      _ => true
    },
  )
}

///|
test "relative delta original add 2/5" {
  let result = @date.RelativeDelta::new(
    year=0,
    month=0,
    day=0,
    hour=0,
    minute=0,
    second=0,
    microsecond=0,
    leapdays=-3.5,
    on_weekday=@date.RelativeWeekday::new(6, nth=-2),
  ).add(@date.RelativeDelta::new(years=9223372036854775807L, months=-11L))
  assert_eq(result.years(), 9223372036854775807L)
  assert_eq(result.months(), -11)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, -3.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(0), Some(0), Some(0), Some(0), Some(0), Some(0), Some(0)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), Some(-2))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract 2/5" {
  let result = @date.RelativeDelta::new(
    year=0,
    month=0,
    day=0,
    hour=0,
    minute=0,
    second=0,
    microsecond=0,
    leapdays=-3.5,
    on_weekday=@date.RelativeWeekday::new(6, nth=-2),
  ).subtract(@date.RelativeDelta::new(years=9223372036854775807L, months=-11L))
  assert_eq(result.years(), -9223372036854775807L)
  assert_eq(result.months(), 11)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, -3.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(0), Some(0), Some(0), Some(0), Some(0), Some(0), Some(0)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), Some(-2))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add 2/6" {
  let result = @date.RelativeDelta::new(
    year=0,
    month=0,
    day=0,
    hour=0,
    minute=0,
    second=0,
    microsecond=0,
    leapdays=-3.5,
    on_weekday=@date.RelativeWeekday::new(6, nth=-2),
  ).add(@date.RelativeDelta::new(years=1L, months=-1L))
  assert_eq(result.years(), 1L)
  assert_eq(result.months(), -1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, -3.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(0), Some(0), Some(0), Some(0), Some(0), Some(0), Some(0)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), Some(-2))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract 2/6" {
  let result = @date.RelativeDelta::new(
    year=0,
    month=0,
    day=0,
    hour=0,
    minute=0,
    second=0,
    microsecond=0,
    leapdays=-3.5,
    on_weekday=@date.RelativeWeekday::new(6, nth=-2),
  ).subtract(@date.RelativeDelta::new(years=1L, months=-1L))
  assert_eq(result.years(), -1L)
  assert_eq(result.months(), 1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, -3.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(0), Some(0), Some(0), Some(0), Some(0), Some(0), Some(0)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), Some(-2))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add 2/7" {
  let result = @date.RelativeDelta::new(
    year=0,
    month=0,
    day=0,
    hour=0,
    minute=0,
    second=0,
    microsecond=0,
    leapdays=-3.5,
    on_weekday=@date.RelativeWeekday::new(6, nth=-2),
  ).add(@date.RelativeDelta::new(years=-1L, months=1L))
  assert_eq(result.years(), -1L)
  assert_eq(result.months(), 1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, -3.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(0), Some(0), Some(0), Some(0), Some(0), Some(0), Some(0)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), Some(-2))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract 2/7" {
  let result = @date.RelativeDelta::new(
    year=0,
    month=0,
    day=0,
    hour=0,
    minute=0,
    second=0,
    microsecond=0,
    leapdays=-3.5,
    on_weekday=@date.RelativeWeekday::new(6, nth=-2),
  ).subtract(@date.RelativeDelta::new(years=-1L, months=1L))
  assert_eq(result.years(), 1L)
  assert_eq(result.months(), -1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, -3.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(0), Some(0), Some(0), Some(0), Some(0), Some(0), Some(0)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), Some(-2))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add 3/0" {
  let result = @date.RelativeDelta::new(
    years=3L,
    months=-11L,
    days=1.5,
    hours=-23.5,
    microseconds=-1000000.5,
  ).add(@date.RelativeDelta::new())
  assert_eq(result.years(), 3L)
  assert_eq(result.months(), -11)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [1.5, 0.0, -23.5, 0.0, -1.0, -0.5],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract 3/0" {
  let result = @date.RelativeDelta::new(
    years=3L,
    months=-11L,
    days=1.5,
    hours=-23.5,
    microseconds=-1000000.5,
  ).subtract(@date.RelativeDelta::new())
  assert_eq(result.years(), 3L)
  assert_eq(result.months(), -11)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [1.5, 0.0, -23.5, 0.0, -1.0, -0.5],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add 3/1" {
  let result = @date.RelativeDelta::new(
    years=3L,
    months=-11L,
    days=1.5,
    hours=-23.5,
    microseconds=-1000000.5,
  ).add(
    @date.RelativeDelta::new(
      year=2000,
      month=2,
      day=29,
      hour=1,
      minute=2,
      second=3,
      microsecond=4,
      leapdays=2.5,
      weekday=0,
    ),
  )
  assert_eq(result.years(), 3L)
  assert_eq(result.months(), -11)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [1.5, 2.5, -23.5, 0.0, -1.0, -0.5],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(2000), Some(2), Some(29), Some(1), Some(2), Some(3), Some(4)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract 3/1" {
  let result = @date.RelativeDelta::new(
    years=3L,
    months=-11L,
    days=1.5,
    hours=-23.5,
    microseconds=-1000000.5,
  ).subtract(
    @date.RelativeDelta::new(
      year=2000,
      month=2,
      day=29,
      hour=1,
      minute=2,
      second=3,
      microsecond=4,
      leapdays=2.5,
      weekday=0,
    ),
  )
  assert_eq(result.years(), 3L)
  assert_eq(result.months(), -11)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [1.5, 2.5, -23.5, 0.0, -1.0, -0.5],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(2000), Some(2), Some(29), Some(1), Some(2), Some(3), Some(4)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add 3/2" {
  let result = @date.RelativeDelta::new(
    years=3L,
    months=-11L,
    days=1.5,
    hours=-23.5,
    microseconds=-1000000.5,
  ).add(
    @date.RelativeDelta::new(
      year=0,
      month=0,
      day=0,
      hour=0,
      minute=0,
      second=0,
      microsecond=0,
      leapdays=-3.5,
      on_weekday=@date.RelativeWeekday::new(6, nth=-2),
    ),
  )
  assert_eq(result.years(), 3L)
  assert_eq(result.months(), -11)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [1.5, -3.5, -23.5, 0.0, -1.0, -0.5],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(0), Some(0), Some(0), Some(0), Some(0), Some(0), Some(0)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), Some(-2))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract 3/2" {
  let result = @date.RelativeDelta::new(
    years=3L,
    months=-11L,
    days=1.5,
    hours=-23.5,
    microseconds=-1000000.5,
  ).subtract(
    @date.RelativeDelta::new(
      year=0,
      month=0,
      day=0,
      hour=0,
      minute=0,
      second=0,
      microsecond=0,
      leapdays=-3.5,
      on_weekday=@date.RelativeWeekday::new(6, nth=-2),
    ),
  )
  assert_eq(result.years(), 3L)
  assert_eq(result.months(), -11)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [1.5, -3.5, -23.5, 0.0, -1.0, -0.5],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(0), Some(0), Some(0), Some(0), Some(0), Some(0), Some(0)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), Some(-2))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add 3/3" {
  let result = @date.RelativeDelta::new(
    years=3L,
    months=-11L,
    days=1.5,
    hours=-23.5,
    microseconds=-1000000.5,
  ).add(
    @date.RelativeDelta::new(
      years=3L,
      months=-11L,
      days=1.5,
      hours=-23.5,
      microseconds=-1000000.5,
    ),
  )
  assert_eq(result.years(), 5L)
  assert_eq(result.months(), -10)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [2.0, 0.0, -23.0, 0.0, -2.0, -1.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract 3/3" {
  let result = @date.RelativeDelta::new(
    years=3L,
    months=-11L,
    days=1.5,
    hours=-23.5,
    microseconds=-1000000.5,
  ).subtract(
    @date.RelativeDelta::new(
      years=3L,
      months=-11L,
      days=1.5,
      hours=-23.5,
      microseconds=-1000000.5,
    ),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), true)
}

///|
test "relative delta original add 3/4" {
  let result = @date.RelativeDelta::new(
    years=3L,
    months=-11L,
    days=1.5,
    hours=-23.5,
    microseconds=-1000000.5,
  ).add(@date.RelativeDelta::new(years=-9223372036854775808L, months=11L))
  assert_eq(result.years(), -9223372036854775805L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [1.5, 0.0, -23.5, 0.0, -1.0, -0.5],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract 3/4" {
  assert_true(
    try {
      ignore(
        @date.RelativeDelta::new(
          years=3L,
          months=-11L,
          days=1.5,
          hours=-23.5,
          microseconds=-1000000.5,
        ).subtract(
          @date.RelativeDelta::new(years=-9223372036854775808L, months=11L),
        ),
      )
      false
    } catch {
      _ => true
    },
  )
}

///|
test "relative delta original add 3/5" {
  assert_true(
    try {
      ignore(
        @date.RelativeDelta::new(
          years=3L,
          months=-11L,
          days=1.5,
          hours=-23.5,
          microseconds=-1000000.5,
        ).add(@date.RelativeDelta::new(years=9223372036854775807L, months=-11L)),
      )
      false
    } catch {
      _ => true
    },
  )
}

///|
test "relative delta original subtract 3/5" {
  let result = @date.RelativeDelta::new(
    years=3L,
    months=-11L,
    days=1.5,
    hours=-23.5,
    microseconds=-1000000.5,
  ).subtract(@date.RelativeDelta::new(years=9223372036854775807L, months=-11L))
  assert_eq(result.years(), -9223372036854775804L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [1.5, 0.0, -23.5, 0.0, -1.0, -0.5],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add 3/6" {
  let result = @date.RelativeDelta::new(
    years=3L,
    months=-11L,
    days=1.5,
    hours=-23.5,
    microseconds=-1000000.5,
  ).add(@date.RelativeDelta::new(years=1L, months=-1L))
  assert_eq(result.years(), 3L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [1.5, 0.0, -23.5, 0.0, -1.0, -0.5],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract 3/6" {
  let result = @date.RelativeDelta::new(
    years=3L,
    months=-11L,
    days=1.5,
    hours=-23.5,
    microseconds=-1000000.5,
  ).subtract(@date.RelativeDelta::new(years=1L, months=-1L))
  assert_eq(result.years(), 2L)
  assert_eq(result.months(), -10)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [1.5, 0.0, -23.5, 0.0, -1.0, -0.5],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add 3/7" {
  let result = @date.RelativeDelta::new(
    years=3L,
    months=-11L,
    days=1.5,
    hours=-23.5,
    microseconds=-1000000.5,
  ).add(@date.RelativeDelta::new(years=-1L, months=1L))
  assert_eq(result.years(), 2L)
  assert_eq(result.months(), -10)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [1.5, 0.0, -23.5, 0.0, -1.0, -0.5],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract 3/7" {
  let result = @date.RelativeDelta::new(
    years=3L,
    months=-11L,
    days=1.5,
    hours=-23.5,
    microseconds=-1000000.5,
  ).subtract(@date.RelativeDelta::new(years=-1L, months=1L))
  assert_eq(result.years(), 3L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [1.5, 0.0, -23.5, 0.0, -1.0, -0.5],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add 4/0" {
  let result = @date.RelativeDelta::new(years=-9223372036854775808L, months=11L).add(
    @date.RelativeDelta::new(),
  )
  assert_eq(result.years(), -9223372036854775808L)
  assert_eq(result.months(), 11)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract 4/0" {
  let result = @date.RelativeDelta::new(years=-9223372036854775808L, months=11L).subtract(
    @date.RelativeDelta::new(),
  )
  assert_eq(result.years(), -9223372036854775808L)
  assert_eq(result.months(), 11)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add 4/1" {
  let result = @date.RelativeDelta::new(years=-9223372036854775808L, months=11L).add(
    @date.RelativeDelta::new(
      year=2000,
      month=2,
      day=29,
      hour=1,
      minute=2,
      second=3,
      microsecond=4,
      leapdays=2.5,
      weekday=0,
    ),
  )
  assert_eq(result.years(), -9223372036854775808L)
  assert_eq(result.months(), 11)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 2.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(2000), Some(2), Some(29), Some(1), Some(2), Some(3), Some(4)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract 4/1" {
  let result = @date.RelativeDelta::new(years=-9223372036854775808L, months=11L).subtract(
    @date.RelativeDelta::new(
      year=2000,
      month=2,
      day=29,
      hour=1,
      minute=2,
      second=3,
      microsecond=4,
      leapdays=2.5,
      weekday=0,
    ),
  )
  assert_eq(result.years(), -9223372036854775808L)
  assert_eq(result.months(), 11)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 2.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(2000), Some(2), Some(29), Some(1), Some(2), Some(3), Some(4)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add 4/2" {
  let result = @date.RelativeDelta::new(years=-9223372036854775808L, months=11L).add(
    @date.RelativeDelta::new(
      year=0,
      month=0,
      day=0,
      hour=0,
      minute=0,
      second=0,
      microsecond=0,
      leapdays=-3.5,
      on_weekday=@date.RelativeWeekday::new(6, nth=-2),
    ),
  )
  assert_eq(result.years(), -9223372036854775808L)
  assert_eq(result.months(), 11)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, -3.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(0), Some(0), Some(0), Some(0), Some(0), Some(0), Some(0)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), Some(-2))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract 4/2" {
  let result = @date.RelativeDelta::new(years=-9223372036854775808L, months=11L).subtract(
    @date.RelativeDelta::new(
      year=0,
      month=0,
      day=0,
      hour=0,
      minute=0,
      second=0,
      microsecond=0,
      leapdays=-3.5,
      on_weekday=@date.RelativeWeekday::new(6, nth=-2),
    ),
  )
  assert_eq(result.years(), -9223372036854775808L)
  assert_eq(result.months(), 11)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, -3.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(0), Some(0), Some(0), Some(0), Some(0), Some(0), Some(0)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), Some(-2))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add 4/3" {
  let result = @date.RelativeDelta::new(years=-9223372036854775808L, months=11L).add(
    @date.RelativeDelta::new(
      years=3L,
      months=-11L,
      days=1.5,
      hours=-23.5,
      microseconds=-1000000.5,
    ),
  )
  assert_eq(result.years(), -9223372036854775805L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [1.5, 0.0, -23.5, 0.0, -1.0, -0.5],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract 4/3" {
  assert_true(
    try {
      ignore(
        @date.RelativeDelta::new(years=-9223372036854775808L, months=11L).subtract(
          @date.RelativeDelta::new(
            years=3L,
            months=-11L,
            days=1.5,
            hours=-23.5,
            microseconds=-1000000.5,
          ),
        ),
      )
      false
    } catch {
      _ => true
    },
  )
}

///|
test "relative delta original add 4/4" {
  assert_true(
    try {
      ignore(
        @date.RelativeDelta::new(years=-9223372036854775808L, months=11L).add(
          @date.RelativeDelta::new(years=-9223372036854775808L, months=11L),
        ),
      )
      false
    } catch {
      _ => true
    },
  )
}

///|
test "relative delta original subtract 4/4" {
  let result = @date.RelativeDelta::new(years=-9223372036854775808L, months=11L).subtract(
    @date.RelativeDelta::new(years=-9223372036854775808L, months=11L),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), true)
}

///|
test "relative delta original add 4/5" {
  let result = @date.RelativeDelta::new(years=-9223372036854775808L, months=11L).add(
    @date.RelativeDelta::new(years=9223372036854775807L, months=-11L),
  )
  assert_eq(result.years(), -1L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract 4/5" {
  assert_true(
    try {
      ignore(
        @date.RelativeDelta::new(years=-9223372036854775808L, months=11L).subtract(
          @date.RelativeDelta::new(years=9223372036854775807L, months=-11L),
        ),
      )
      false
    } catch {
      _ => true
    },
  )
}

///|
test "relative delta original add 4/6" {
  let result = @date.RelativeDelta::new(years=-9223372036854775808L, months=11L).add(
    @date.RelativeDelta::new(years=1L, months=-1L),
  )
  assert_eq(result.years(), -9223372036854775807L)
  assert_eq(result.months(), 10)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract 4/6" {
  let result = @date.RelativeDelta::new(years=-9223372036854775808L, months=11L).subtract(
    @date.RelativeDelta::new(years=1L, months=-1L),
  )
  assert_eq(result.years(), -9223372036854775808L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add 4/7" {
  let result = @date.RelativeDelta::new(years=-9223372036854775808L, months=11L).add(
    @date.RelativeDelta::new(years=-1L, months=1L),
  )
  assert_eq(result.years(), -9223372036854775808L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract 4/7" {
  let result = @date.RelativeDelta::new(years=-9223372036854775808L, months=11L).subtract(
    @date.RelativeDelta::new(years=-1L, months=1L),
  )
  assert_eq(result.years(), -9223372036854775807L)
  assert_eq(result.months(), 10)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add 5/0" {
  let result = @date.RelativeDelta::new(years=9223372036854775807L, months=-11L).add(
    @date.RelativeDelta::new(),
  )
  assert_eq(result.years(), 9223372036854775807L)
  assert_eq(result.months(), -11)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract 5/0" {
  let result = @date.RelativeDelta::new(years=9223372036854775807L, months=-11L).subtract(
    @date.RelativeDelta::new(),
  )
  assert_eq(result.years(), 9223372036854775807L)
  assert_eq(result.months(), -11)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add 5/1" {
  let result = @date.RelativeDelta::new(years=9223372036854775807L, months=-11L).add(
    @date.RelativeDelta::new(
      year=2000,
      month=2,
      day=29,
      hour=1,
      minute=2,
      second=3,
      microsecond=4,
      leapdays=2.5,
      weekday=0,
    ),
  )
  assert_eq(result.years(), 9223372036854775807L)
  assert_eq(result.months(), -11)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 2.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(2000), Some(2), Some(29), Some(1), Some(2), Some(3), Some(4)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract 5/1" {
  let result = @date.RelativeDelta::new(years=9223372036854775807L, months=-11L).subtract(
    @date.RelativeDelta::new(
      year=2000,
      month=2,
      day=29,
      hour=1,
      minute=2,
      second=3,
      microsecond=4,
      leapdays=2.5,
      weekday=0,
    ),
  )
  assert_eq(result.years(), 9223372036854775807L)
  assert_eq(result.months(), -11)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 2.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(2000), Some(2), Some(29), Some(1), Some(2), Some(3), Some(4)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add 5/2" {
  let result = @date.RelativeDelta::new(years=9223372036854775807L, months=-11L).add(
    @date.RelativeDelta::new(
      year=0,
      month=0,
      day=0,
      hour=0,
      minute=0,
      second=0,
      microsecond=0,
      leapdays=-3.5,
      on_weekday=@date.RelativeWeekday::new(6, nth=-2),
    ),
  )
  assert_eq(result.years(), 9223372036854775807L)
  assert_eq(result.months(), -11)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, -3.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(0), Some(0), Some(0), Some(0), Some(0), Some(0), Some(0)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), Some(-2))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract 5/2" {
  let result = @date.RelativeDelta::new(years=9223372036854775807L, months=-11L).subtract(
    @date.RelativeDelta::new(
      year=0,
      month=0,
      day=0,
      hour=0,
      minute=0,
      second=0,
      microsecond=0,
      leapdays=-3.5,
      on_weekday=@date.RelativeWeekday::new(6, nth=-2),
    ),
  )
  assert_eq(result.years(), 9223372036854775807L)
  assert_eq(result.months(), -11)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, -3.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(0), Some(0), Some(0), Some(0), Some(0), Some(0), Some(0)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), Some(-2))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add 5/3" {
  assert_true(
    try {
      ignore(
        @date.RelativeDelta::new(years=9223372036854775807L, months=-11L).add(
          @date.RelativeDelta::new(
            years=3L,
            months=-11L,
            days=1.5,
            hours=-23.5,
            microseconds=-1000000.5,
          ),
        ),
      )
      false
    } catch {
      _ => true
    },
  )
}

///|
test "relative delta original subtract 5/3" {
  let result = @date.RelativeDelta::new(years=9223372036854775807L, months=-11L).subtract(
    @date.RelativeDelta::new(
      years=3L,
      months=-11L,
      days=1.5,
      hours=-23.5,
      microseconds=-1000000.5,
    ),
  )
  assert_eq(result.years(), 9223372036854775804L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-1.5, 0.0, 23.5, 0.0, 1.0, 0.5],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add 5/4" {
  let result = @date.RelativeDelta::new(years=9223372036854775807L, months=-11L).add(
    @date.RelativeDelta::new(years=-9223372036854775808L, months=11L),
  )
  assert_eq(result.years(), -1L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract 5/4" {
  assert_true(
    try {
      ignore(
        @date.RelativeDelta::new(years=9223372036854775807L, months=-11L).subtract(
          @date.RelativeDelta::new(years=-9223372036854775808L, months=11L),
        ),
      )
      false
    } catch {
      _ => true
    },
  )
}

///|
test "relative delta original add 5/5" {
  assert_true(
    try {
      ignore(
        @date.RelativeDelta::new(years=9223372036854775807L, months=-11L).add(
          @date.RelativeDelta::new(years=9223372036854775807L, months=-11L),
        ),
      )
      false
    } catch {
      _ => true
    },
  )
}

///|
test "relative delta original subtract 5/5" {
  let result = @date.RelativeDelta::new(years=9223372036854775807L, months=-11L).subtract(
    @date.RelativeDelta::new(years=9223372036854775807L, months=-11L),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), true)
}

///|
test "relative delta original add 5/6" {
  let result = @date.RelativeDelta::new(years=9223372036854775807L, months=-11L).add(
    @date.RelativeDelta::new(years=1L, months=-1L),
  )
  assert_eq(result.years(), 9223372036854775807L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract 5/6" {
  let result = @date.RelativeDelta::new(years=9223372036854775807L, months=-11L).subtract(
    @date.RelativeDelta::new(years=1L, months=-1L),
  )
  assert_eq(result.years(), 9223372036854775806L)
  assert_eq(result.months(), -10)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add 5/7" {
  let result = @date.RelativeDelta::new(years=9223372036854775807L, months=-11L).add(
    @date.RelativeDelta::new(years=-1L, months=1L),
  )
  assert_eq(result.years(), 9223372036854775806L)
  assert_eq(result.months(), -10)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract 5/7" {
  let result = @date.RelativeDelta::new(years=9223372036854775807L, months=-11L).subtract(
    @date.RelativeDelta::new(years=-1L, months=1L),
  )
  assert_eq(result.years(), 9223372036854775807L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add 6/0" {
  let result = @date.RelativeDelta::new(years=1L, months=-1L).add(
    @date.RelativeDelta::new(),
  )
  assert_eq(result.years(), 1L)
  assert_eq(result.months(), -1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract 6/0" {
  let result = @date.RelativeDelta::new(years=1L, months=-1L).subtract(
    @date.RelativeDelta::new(),
  )
  assert_eq(result.years(), 1L)
  assert_eq(result.months(), -1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add 6/1" {
  let result = @date.RelativeDelta::new(years=1L, months=-1L).add(
    @date.RelativeDelta::new(
      year=2000,
      month=2,
      day=29,
      hour=1,
      minute=2,
      second=3,
      microsecond=4,
      leapdays=2.5,
      weekday=0,
    ),
  )
  assert_eq(result.years(), 1L)
  assert_eq(result.months(), -1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 2.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(2000), Some(2), Some(29), Some(1), Some(2), Some(3), Some(4)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract 6/1" {
  let result = @date.RelativeDelta::new(years=1L, months=-1L).subtract(
    @date.RelativeDelta::new(
      year=2000,
      month=2,
      day=29,
      hour=1,
      minute=2,
      second=3,
      microsecond=4,
      leapdays=2.5,
      weekday=0,
    ),
  )
  assert_eq(result.years(), 1L)
  assert_eq(result.months(), -1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 2.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(2000), Some(2), Some(29), Some(1), Some(2), Some(3), Some(4)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add 6/2" {
  let result = @date.RelativeDelta::new(years=1L, months=-1L).add(
    @date.RelativeDelta::new(
      year=0,
      month=0,
      day=0,
      hour=0,
      minute=0,
      second=0,
      microsecond=0,
      leapdays=-3.5,
      on_weekday=@date.RelativeWeekday::new(6, nth=-2),
    ),
  )
  assert_eq(result.years(), 1L)
  assert_eq(result.months(), -1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, -3.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(0), Some(0), Some(0), Some(0), Some(0), Some(0), Some(0)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), Some(-2))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract 6/2" {
  let result = @date.RelativeDelta::new(years=1L, months=-1L).subtract(
    @date.RelativeDelta::new(
      year=0,
      month=0,
      day=0,
      hour=0,
      minute=0,
      second=0,
      microsecond=0,
      leapdays=-3.5,
      on_weekday=@date.RelativeWeekday::new(6, nth=-2),
    ),
  )
  assert_eq(result.years(), 1L)
  assert_eq(result.months(), -1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, -3.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(0), Some(0), Some(0), Some(0), Some(0), Some(0), Some(0)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), Some(-2))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add 6/3" {
  let result = @date.RelativeDelta::new(years=1L, months=-1L).add(
    @date.RelativeDelta::new(
      years=3L,
      months=-11L,
      days=1.5,
      hours=-23.5,
      microseconds=-1000000.5,
    ),
  )
  assert_eq(result.years(), 3L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [1.5, 0.0, -23.5, 0.0, -1.0, -0.5],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract 6/3" {
  let result = @date.RelativeDelta::new(years=1L, months=-1L).subtract(
    @date.RelativeDelta::new(
      years=3L,
      months=-11L,
      days=1.5,
      hours=-23.5,
      microseconds=-1000000.5,
    ),
  )
  assert_eq(result.years(), -2L)
  assert_eq(result.months(), 10)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-1.5, 0.0, 23.5, 0.0, 1.0, 0.5],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add 6/4" {
  let result = @date.RelativeDelta::new(years=1L, months=-1L).add(
    @date.RelativeDelta::new(years=-9223372036854775808L, months=11L),
  )
  assert_eq(result.years(), -9223372036854775807L)
  assert_eq(result.months(), 10)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract 6/4" {
  assert_true(
    try {
      ignore(
        @date.RelativeDelta::new(years=1L, months=-1L).subtract(
          @date.RelativeDelta::new(years=-9223372036854775808L, months=11L),
        ),
      )
      false
    } catch {
      _ => true
    },
  )
}

///|
test "relative delta original add 6/5" {
  let result = @date.RelativeDelta::new(years=1L, months=-1L).add(
    @date.RelativeDelta::new(years=9223372036854775807L, months=-11L),
  )
  assert_eq(result.years(), 9223372036854775807L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract 6/5" {
  let result = @date.RelativeDelta::new(years=1L, months=-1L).subtract(
    @date.RelativeDelta::new(years=9223372036854775807L, months=-11L),
  )
  assert_eq(result.years(), -9223372036854775806L)
  assert_eq(result.months(), 10)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add 6/6" {
  let result = @date.RelativeDelta::new(years=1L, months=-1L).add(
    @date.RelativeDelta::new(years=1L, months=-1L),
  )
  assert_eq(result.years(), 2L)
  assert_eq(result.months(), -2)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract 6/6" {
  let result = @date.RelativeDelta::new(years=1L, months=-1L).subtract(
    @date.RelativeDelta::new(years=1L, months=-1L),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), true)
}

///|
test "relative delta original add 6/7" {
  let result = @date.RelativeDelta::new(years=1L, months=-1L).add(
    @date.RelativeDelta::new(years=-1L, months=1L),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), true)
}

///|
test "relative delta original subtract 6/7" {
  let result = @date.RelativeDelta::new(years=1L, months=-1L).subtract(
    @date.RelativeDelta::new(years=-1L, months=1L),
  )
  assert_eq(result.years(), 2L)
  assert_eq(result.months(), -2)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add 7/0" {
  let result = @date.RelativeDelta::new(years=-1L, months=1L).add(
    @date.RelativeDelta::new(),
  )
  assert_eq(result.years(), -1L)
  assert_eq(result.months(), 1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract 7/0" {
  let result = @date.RelativeDelta::new(years=-1L, months=1L).subtract(
    @date.RelativeDelta::new(),
  )
  assert_eq(result.years(), -1L)
  assert_eq(result.months(), 1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add 7/1" {
  let result = @date.RelativeDelta::new(years=-1L, months=1L).add(
    @date.RelativeDelta::new(
      year=2000,
      month=2,
      day=29,
      hour=1,
      minute=2,
      second=3,
      microsecond=4,
      leapdays=2.5,
      weekday=0,
    ),
  )
  assert_eq(result.years(), -1L)
  assert_eq(result.months(), 1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 2.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(2000), Some(2), Some(29), Some(1), Some(2), Some(3), Some(4)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract 7/1" {
  let result = @date.RelativeDelta::new(years=-1L, months=1L).subtract(
    @date.RelativeDelta::new(
      year=2000,
      month=2,
      day=29,
      hour=1,
      minute=2,
      second=3,
      microsecond=4,
      leapdays=2.5,
      weekday=0,
    ),
  )
  assert_eq(result.years(), -1L)
  assert_eq(result.months(), 1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 2.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(2000), Some(2), Some(29), Some(1), Some(2), Some(3), Some(4)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add 7/2" {
  let result = @date.RelativeDelta::new(years=-1L, months=1L).add(
    @date.RelativeDelta::new(
      year=0,
      month=0,
      day=0,
      hour=0,
      minute=0,
      second=0,
      microsecond=0,
      leapdays=-3.5,
      on_weekday=@date.RelativeWeekday::new(6, nth=-2),
    ),
  )
  assert_eq(result.years(), -1L)
  assert_eq(result.months(), 1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, -3.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(0), Some(0), Some(0), Some(0), Some(0), Some(0), Some(0)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), Some(-2))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract 7/2" {
  let result = @date.RelativeDelta::new(years=-1L, months=1L).subtract(
    @date.RelativeDelta::new(
      year=0,
      month=0,
      day=0,
      hour=0,
      minute=0,
      second=0,
      microsecond=0,
      leapdays=-3.5,
      on_weekday=@date.RelativeWeekday::new(6, nth=-2),
    ),
  )
  assert_eq(result.years(), -1L)
  assert_eq(result.months(), 1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, -3.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(0), Some(0), Some(0), Some(0), Some(0), Some(0), Some(0)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), Some(-2))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add 7/3" {
  let result = @date.RelativeDelta::new(years=-1L, months=1L).add(
    @date.RelativeDelta::new(
      years=3L,
      months=-11L,
      days=1.5,
      hours=-23.5,
      microseconds=-1000000.5,
    ),
  )
  assert_eq(result.years(), 2L)
  assert_eq(result.months(), -10)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [1.5, 0.0, -23.5, 0.0, -1.0, -0.5],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract 7/3" {
  let result = @date.RelativeDelta::new(years=-1L, months=1L).subtract(
    @date.RelativeDelta::new(
      years=3L,
      months=-11L,
      days=1.5,
      hours=-23.5,
      microseconds=-1000000.5,
    ),
  )
  assert_eq(result.years(), -3L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-1.5, 0.0, 23.5, 0.0, 1.0, 0.5],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add 7/4" {
  let result = @date.RelativeDelta::new(years=-1L, months=1L).add(
    @date.RelativeDelta::new(years=-9223372036854775808L, months=11L),
  )
  assert_eq(result.years(), -9223372036854775808L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract 7/4" {
  let result = @date.RelativeDelta::new(years=-1L, months=1L).subtract(
    @date.RelativeDelta::new(years=-9223372036854775808L, months=11L),
  )
  assert_eq(result.years(), 9223372036854775807L)
  assert_eq(result.months(), -10)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add 7/5" {
  let result = @date.RelativeDelta::new(years=-1L, months=1L).add(
    @date.RelativeDelta::new(years=9223372036854775807L, months=-11L),
  )
  assert_eq(result.years(), 9223372036854775806L)
  assert_eq(result.months(), -10)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract 7/5" {
  let result = @date.RelativeDelta::new(years=-1L, months=1L).subtract(
    @date.RelativeDelta::new(years=9223372036854775807L, months=-11L),
  )
  assert_eq(result.years(), -9223372036854775807L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add 7/6" {
  let result = @date.RelativeDelta::new(years=-1L, months=1L).add(
    @date.RelativeDelta::new(years=1L, months=-1L),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), true)
}

///|
test "relative delta original subtract 7/6" {
  let result = @date.RelativeDelta::new(years=-1L, months=1L).subtract(
    @date.RelativeDelta::new(years=1L, months=-1L),
  )
  assert_eq(result.years(), -2L)
  assert_eq(result.months(), 2)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add 7/7" {
  let result = @date.RelativeDelta::new(years=-1L, months=1L).add(
    @date.RelativeDelta::new(years=-1L, months=1L),
  )
  assert_eq(result.years(), -2L)
  assert_eq(result.months(), 2)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract 7/7" {
  let result = @date.RelativeDelta::new(years=-1L, months=1L).subtract(
    @date.RelativeDelta::new(years=-1L, months=1L),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), true)
}

///|
test "relative delta original add random 0" {
  let result = @date.RelativeDelta::new(
    days=667338.625,
    hours=3134864.0,
    minutes=-550217.2,
    seconds=2643531.0,
    microseconds=6096266.0,
    years=8408L,
    months=-12471L,
  ).add(@date.RelativeDelta::new(yearday=1, leapdays=2.5))
  assert_eq(result.years(), 7369L)
  assert_eq(result.months(), -3)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [797605.625, 2.5, 21.0, -59.199999999953434, 57.0, 96266.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, Some(1), Some(1), None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract random 0" {
  let result = @date.RelativeDelta::new(
    days=667338.625,
    hours=3134864.0,
    minutes=-550217.2,
    seconds=2643531.0,
    microseconds=6096266.0,
    years=8408L,
    months=-12471L,
  ).subtract(@date.RelativeDelta::new(yearday=1, leapdays=2.5))
  assert_eq(result.years(), 7369L)
  assert_eq(result.months(), -3)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [797605.625, 2.5, 21.0, -59.199999999953434, 57.0, 96266.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, Some(1), Some(1), None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add random 1" {
  let result = @date.RelativeDelta::new(yearday=-2147483648, leapdays=2.5).add(
    @date.RelativeDelta::new(
      yearday=365,
      nlyearday=60,
      month=7,
      day=8,
      leapdays=4.25,
    ),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 4.25, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, Some(3), Some(1), None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract random 1" {
  let result = @date.RelativeDelta::new(yearday=-2147483648, leapdays=2.5).subtract(
    @date.RelativeDelta::new(
      yearday=365,
      nlyearday=60,
      month=7,
      day=8,
      leapdays=4.25,
    ),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 2.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, Some(1), Some(-2147483648), None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add random 2" {
  let result = @date.RelativeDelta::new(
    on_weekday=@date.RelativeWeekday::new(6, nth=-2),
  ).add(
    @date.RelativeDelta::new(
      days=486920.0,
      hours=2060053.0,
      minutes=-3523.25,
      seconds=4167126.0,
      microseconds=5280909.0,
      years=-12200L,
      months=-19730L,
    ),
  )
  assert_eq(result.years(), -13844L)
  assert_eq(result.months(), -2)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [572801.0, 0.0, 7.0, 48.75, 11.0, 280909.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), Some(-2))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract random 2" {
  let result = @date.RelativeDelta::new(
    on_weekday=@date.RelativeWeekday::new(6, nth=-2),
  ).subtract(
    @date.RelativeDelta::new(
      days=486920.0,
      hours=2060053.0,
      minutes=-3523.25,
      seconds=4167126.0,
      microseconds=5280909.0,
      years=-12200L,
      months=-19730L,
    ),
  )
  assert_eq(result.years(), 13844L)
  assert_eq(result.months(), 2)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-572801.0, 0.0, -7.0, -48.75, -11.0, -280909.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), Some(-2))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add random 3" {
  let result = @date.RelativeDelta::new(
    days=4993439.0,
    hours=2541515.5,
    minutes=3254563.0,
    seconds=-117797.5,
    microseconds=157323.3,
    years=955L,
    months=14326L,
  ).add(
    @date.RelativeDelta::new(
      days=-360212.0,
      hours=-4.197374,
      minutes=2854002.0,
      seconds=8.617025,
      microseconds=-2.897297,
      years=-3702L,
      months=1272L,
    ),
  )
  assert_eq(result.years(), -1448L)
  assert_eq(result.months(), 10)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [4743363.0, 0.0, 23.302625999996962, 42.0, -8.882975, 157320.402703],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract random 3" {
  let result = @date.RelativeDelta::new(
    days=4993439.0,
    hours=2541515.5,
    minutes=3254563.0,
    seconds=-117797.5,
    microseconds=157323.3,
    years=955L,
    months=14326L,
  ).subtract(
    @date.RelativeDelta::new(
      days=-360212.0,
      hours=-4.197374,
      minutes=2854002.0,
      seconds=8.617025,
      microseconds=-2.897297,
      years=-3702L,
      months=1272L,
    ),
  )
  assert_eq(result.years(), 5744L)
  assert_eq(result.months(), 10)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [
      5459825.0, 0.0, -12.302625999996962, -42.0, -26.117024999999998, 157326.19729699998,
    ],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add random 4" {
  let result = @date.RelativeDelta::new(
    days=230753.125,
    hours=702939.25,
    minutes=-935594.0,
    seconds=-1343188.0,
    microseconds=-588637.0,
    years=-11070L,
    months=17837L,
  ).add(
    @date.RelativeDelta::new(
      days=-7.201569,
      hours=108682.0,
      minutes=1927910.0,
      seconds=835373.5,
      microseconds=419480.4,
      years=4105L,
      months=-7502L,
    ),
  )
  assert_eq(result.years(), -6104L)
  assert_eq(result.months(), 3)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [265245.923431, 0.0, 18.25, 32.0, 25.5, -169156.59999999998],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract random 4" {
  let result = @date.RelativeDelta::new(
    days=230753.125,
    hours=702939.25,
    minutes=-935594.0,
    seconds=-1343188.0,
    microseconds=-588637.0,
    years=-11070L,
    months=17837L,
  ).subtract(
    @date.RelativeDelta::new(
      days=-7.201569,
      hours=108682.0,
      minutes=1927910.0,
      seconds=835373.5,
      microseconds=419480.4,
      years=4105L,
      months=-7502L,
    ),
  )
  assert_eq(result.years(), -13064L)
  assert_eq(result.months(), 7)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [253507.326569, 0.0, -0.75, -13.0, -22.5, -8117.400000000023],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add random 5" {
  let result = @date.RelativeDelta::new().add(
    @date.RelativeDelta::new(
      days=-3775600.0,
      hours=3763448.5,
      minutes=-9294160.0,
      seconds=1244359.375,
      microseconds=293100.7,
      years=-3948L,
      months=16662L,
    ),
  )
  assert_eq(result.years(), -2560L)
  assert_eq(result.months(), 6)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-3625230.0, 0.0, 11.5, -1.0, 19.375, 293100.7],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract random 5" {
  let result = @date.RelativeDelta::new().subtract(
    @date.RelativeDelta::new(
      days=-3775600.0,
      hours=3763448.5,
      minutes=-9294160.0,
      seconds=1244359.375,
      microseconds=293100.7,
      years=-3948L,
      months=16662L,
    ),
  )
  assert_eq(result.years(), 2560L)
  assert_eq(result.months(), -6)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [3625230.0, 0.0, -11.5, 1.0, -19.375, -293100.7],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add random 6" {
  let result = @date.RelativeDelta::new(
    days=8821064.0,
    hours=-389160.9,
    minutes=685251.0,
    seconds=2539536.5,
    microseconds=559070.6,
    years=178L,
    months=-10922L,
  ).add(
    @date.RelativeDelta::new(
      yearday=1,
      nlyearday=60,
      month=7,
      day=8,
      leapdays=4.25,
    ),
  )
  assert_eq(result.years(), -732L)
  assert_eq(result.months(), -2)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [8805355.0, 4.25, -18.900000000023283, 16.0, 36.5, 559070.6],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, Some(3), Some(1), None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract random 6" {
  let result = @date.RelativeDelta::new(
    days=8821064.0,
    hours=-389160.9,
    minutes=685251.0,
    seconds=2539536.5,
    microseconds=559070.6,
    years=178L,
    months=-10922L,
  ).subtract(
    @date.RelativeDelta::new(
      yearday=1,
      nlyearday=60,
      month=7,
      day=8,
      leapdays=4.25,
    ),
  )
  assert_eq(result.years(), -732L)
  assert_eq(result.months(), -2)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [8805355.0, 4.25, -18.900000000023283, 16.0, 36.5, 559070.6],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, Some(3), Some(1), None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add random 7" {
  let result = @date.RelativeDelta::new(nlyearday=59, leapdays=-3.5).add(
    @date.RelativeDelta::new(
      days=626986.0,
      hours=8601149.0,
      minutes=1216072.0,
      seconds=-5889340.0,
      microseconds=308054.4,
      years=2221L,
      months=-15995L,
    ),
  )
  assert_eq(result.years(), 889L)
  assert_eq(result.months(), -11)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [986143.0, -3.5, 12.0, 57.0, -40.0, 308054.4],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, Some(2), Some(28), None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract random 7" {
  let result = @date.RelativeDelta::new(nlyearday=59, leapdays=-3.5).subtract(
    @date.RelativeDelta::new(
      days=626986.0,
      hours=8601149.0,
      minutes=1216072.0,
      seconds=-5889340.0,
      microseconds=308054.4,
      years=2221L,
      months=-15995L,
    ),
  )
  assert_eq(result.years(), -889L)
  assert_eq(result.months(), 11)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-986143.0, -3.5, -12.0, -57.0, 40.0, -308054.4],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, Some(2), Some(28), None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add random 8" {
  let result = @date.RelativeDelta::new(
    days=7.090158,
    hours=8656418.0,
    minutes=-872501.375,
    seconds=3713426.0,
    microseconds=4743974.0,
    years=3341L,
    months=13511L,
  ).add(@date.RelativeDelta::new(year=0, month=0, day=0, hour=0, microsecond=0))
  assert_eq(result.years(), 4466L)
  assert_eq(result.months(), 11)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [360128.090158, 0.0, 4.0, -11.375, 30.0, 743974.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(0), Some(0), Some(0), Some(0), None, None, Some(0)],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract random 8" {
  let result = @date.RelativeDelta::new(
    days=7.090158,
    hours=8656418.0,
    minutes=-872501.375,
    seconds=3713426.0,
    microseconds=4743974.0,
    years=3341L,
    months=13511L,
  ).subtract(
    @date.RelativeDelta::new(year=0, month=0, day=0, hour=0, microsecond=0),
  )
  assert_eq(result.years(), 4466L)
  assert_eq(result.months(), 11)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [360128.090158, 0.0, 4.0, -11.375, 30.0, 743974.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(0), Some(0), Some(0), Some(0), None, None, Some(0)],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add random 9" {
  let result = @date.RelativeDelta::new(
    days=-1096294.0,
    hours=-4.793619,
    minutes=-8.644725,
    seconds=-3886120.0,
    microseconds=-2095988.0,
    years=-11091L,
    months=1450L,
  ).add(
    @date.RelativeDelta::new(
      days=306987.0,
      hours=-1205672.0,
      minutes=-3974908.0,
      seconds=-1832270.0,
      microseconds=2.877429,
      years=-3910L,
      months=-11307L,
    ),
  )
  assert_eq(result.years(), -15823L)
  assert_eq(result.months(), 7)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [
      -842370.0, 0.0, -1.7936190000000352, -2.6447249999982887, -32.0, -95985.122571,
    ],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract random 9" {
  let result = @date.RelativeDelta::new(
    days=-1096294.0,
    hours=-4.793619,
    minutes=-8.644725,
    seconds=-3886120.0,
    microseconds=-2095988.0,
    years=-11091L,
    months=1450L,
  ).subtract(
    @date.RelativeDelta::new(
      days=306987.0,
      hours=-1205672.0,
      minutes=-3974908.0,
      seconds=-1832270.0,
      microseconds=2.877429,
      years=-3910L,
      months=-11307L,
    ),
  )
  assert_eq(result.years(), -6118L)
  assert_eq(result.months(), 1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [
      -1350309.0, 0.0, 17.206380999999965, -11.644724999998289, 8.0, -95990.877429,
    ],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add random 10" {
  let result = @date.RelativeDelta::new(
    days=1034100.0,
    hours=9067310.0,
    minutes=-106749.0,
    seconds=-4.866776,
    microseconds=6.882249,
    years=18008L,
    months=-4310L,
  ).add(@date.RelativeDelta::new(nlyearday=-1, leapdays=-3.5))
  assert_eq(result.years(), 17649L)
  assert_eq(result.months(), -2)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [1411830.0, -3.5, 11.0, -9.0, -4.866776, 6.882249],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, Some(1), Some(-1), None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract random 10" {
  let result = @date.RelativeDelta::new(
    days=1034100.0,
    hours=9067310.0,
    minutes=-106749.0,
    seconds=-4.866776,
    microseconds=6.882249,
    years=18008L,
    months=-4310L,
  ).subtract(@date.RelativeDelta::new(nlyearday=-1, leapdays=-3.5))
  assert_eq(result.years(), 17649L)
  assert_eq(result.months(), -2)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [1411830.0, -3.5, 11.0, -9.0, -4.866776, 6.882249],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, Some(1), Some(-1), None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add random 11" {
  let result = @date.RelativeDelta::new(nlyearday=59, leapdays=-3.5).add(
    @date.RelativeDelta::new(minutes=60.00000000000001),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, -3.5, 1.0, 7.105427357601002e-15, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, Some(2), Some(28), None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract random 11" {
  let result = @date.RelativeDelta::new(nlyearday=59, leapdays=-3.5).subtract(
    @date.RelativeDelta::new(minutes=60.00000000000001),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, -3.5, -1.0, -7.105427357601002e-15, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, Some(2), Some(28), None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add random 12" {
  let result = @date.RelativeDelta::new(
    days=316037.125,
    hours=456405.5,
    minutes=-3509838.0,
    seconds=986096.625,
    microseconds=-550444.1,
    years=-12744L,
    months=2857L,
  ).add(@date.RelativeDelta::new(nlyearday=59, leapdays=-3.5))
  assert_eq(result.years(), -12506L)
  assert_eq(result.months(), 1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [332627.125, -3.5, 22.5, -24.0, 56.625, -550444.1],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, Some(2), Some(28), None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract random 12" {
  let result = @date.RelativeDelta::new(
    days=316037.125,
    hours=456405.5,
    minutes=-3509838.0,
    seconds=986096.625,
    microseconds=-550444.1,
    years=-12744L,
    months=2857L,
  ).subtract(@date.RelativeDelta::new(nlyearday=59, leapdays=-3.5))
  assert_eq(result.years(), -12506L)
  assert_eq(result.months(), 1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [332627.125, -3.5, 22.5, -24.0, 56.625, -550444.1],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, Some(2), Some(28), None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add random 13" {
  let result = @date.RelativeDelta::new(
    yearday=60,
    nlyearday=60,
    month=7,
    day=8,
    leapdays=4.25,
  ).add(@date.RelativeDelta::new(nlyearday=365, leapdays=-3.5))
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, -3.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, Some(12), Some(31), None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract random 13" {
  let result = @date.RelativeDelta::new(
    yearday=60,
    nlyearday=60,
    month=7,
    day=8,
    leapdays=4.25,
  ).subtract(@date.RelativeDelta::new(nlyearday=365, leapdays=-3.5))
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 4.25, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, Some(3), Some(1), None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add random 14" {
  let result = @date.RelativeDelta::new(
    days=880139.9,
    hours=4837527.5,
    minutes=-80858.0,
    seconds=-1.767828,
    microseconds=-580721.25,
    years=9827L,
    months=-9378L,
  ).add(
    @date.RelativeDelta::new(
      days=-6.839548,
      hours=-0.987406,
      minutes=-8490417.0,
      seconds=-232319.25,
      microseconds=2305185.5,
      years=-13779L,
      months=-9775L,
    ),
  )
  assert_eq(result.years(), -5548L)
  assert_eq(result.months(), -1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [1075742.060452, 0.0, -8.487406000000192, -6.0, -59.017828, -275535.75],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract random 14" {
  let result = @date.RelativeDelta::new(
    days=880139.9,
    hours=4837527.5,
    minutes=-80858.0,
    seconds=-1.767828,
    microseconds=-580721.25,
    years=9827L,
    months=-9378L,
  ).subtract(
    @date.RelativeDelta::new(
      days=-6.839548,
      hours=-0.987406,
      minutes=-8490417.0,
      seconds=-232319.25,
      microseconds=2305185.5,
      years=-13779L,
      months=-9775L,
    ),
  )
  assert_eq(result.years(), 23639L)
  assert_eq(result.months(), 1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [1087552.7395479998, 0.0, 8.487406000000192, -10.0, 55.482172, -885906.75],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add random 15" {
  let result = @date.RelativeDelta::new(
    days=486920.0,
    hours=2060053.0,
    minutes=-3523.25,
    seconds=4167126.0,
    microseconds=5280909.0,
    years=-12200L,
    months=-19730L,
  ).add(
    @date.RelativeDelta::new(
      days=-492117.5,
      hours=1118327.875,
      minutes=-2.535876,
      seconds=-3543912.0,
      microseconds=-3884253.0,
      years=-2760L,
      months=-12583L,
    ),
  )
  assert_eq(result.years(), -17652L)
  assert_eq(result.months(), -9)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [127239.5, 0.0, 6.875, 21.214123999998264, -4.0, -603344.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract random 15" {
  let result = @date.RelativeDelta::new(
    days=486920.0,
    hours=2060053.0,
    minutes=-3523.25,
    seconds=4167126.0,
    microseconds=5280909.0,
    years=-12200L,
    months=-19730L,
  ).subtract(
    @date.RelativeDelta::new(
      days=-492117.5,
      hours=1118327.875,
      minutes=-2.535876,
      seconds=-3543912.0,
      microseconds=-3884253.0,
      years=-2760L,
      months=-12583L,
    ),
  )
  assert_eq(result.years(), -10036L)
  assert_eq(result.months(), 5)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [1018363.5, 0.0, -15.875, 16.285876000001736, 27.0, 165162.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add random 16" {
  let result = @date.RelativeDelta::new(
    days=306987.0,
    hours=-1205672.0,
    minutes=-3974908.0,
    seconds=-1832270.0,
    microseconds=2.877429,
    years=-3910L,
    months=-11307L,
  ).add(
    @date.RelativeDelta::new(
      yearday=0,
      nlyearday=60,
      month=7,
      day=8,
      leapdays=4.25,
    ),
  )
  assert_eq(result.years(), -4852L)
  assert_eq(result.months(), -3)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [253970.0, 4.25, -21.0, -25.0, -50.0, 2.877429],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, Some(3), Some(1), None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract random 16" {
  let result = @date.RelativeDelta::new(
    days=306987.0,
    hours=-1205672.0,
    minutes=-3974908.0,
    seconds=-1832270.0,
    microseconds=2.877429,
    years=-3910L,
    months=-11307L,
  ).subtract(
    @date.RelativeDelta::new(
      yearday=0,
      nlyearday=60,
      month=7,
      day=8,
      leapdays=4.25,
    ),
  )
  assert_eq(result.years(), -4852L)
  assert_eq(result.months(), -3)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [253970.0, 4.25, -21.0, -25.0, -50.0, 2.877429],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, Some(3), Some(1), None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add random 17" {
  let result = @date.RelativeDelta::new(
    days=355763.5,
    hours=-1151288.75,
    minutes=-4.442825,
    seconds=121695.0,
    microseconds=2401300.0,
    years=-8451L,
    months=-7872L,
  ).add(@date.RelativeDelta::new(years=1L, months=-13L))
  assert_eq(result.years(), -9107L)
  assert_eq(result.months(), -1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [307795.5, 0.0, -23.75, 43.557174999999916, 17.0, 401300.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract random 17" {
  let result = @date.RelativeDelta::new(
    days=355763.5,
    hours=-1151288.75,
    minutes=-4.442825,
    seconds=121695.0,
    microseconds=2401300.0,
    years=-8451L,
    months=-7872L,
  ).subtract(@date.RelativeDelta::new(years=1L, months=-13L))
  assert_eq(result.years(), -9107L)
  assert_eq(result.months(), 1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [307795.5, 0.0, -23.75, 43.557174999999916, 17.0, 401300.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add random 18" {
  let result = @date.RelativeDelta::new(nlyearday=0, leapdays=-3.5).add(
    @date.RelativeDelta::new(seconds=60.0),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, -3.5, 0.0, 1.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract random 18" {
  let result = @date.RelativeDelta::new(nlyearday=0, leapdays=-3.5).subtract(
    @date.RelativeDelta::new(seconds=60.0),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, -3.5, 0.0, -1.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add random 19" {
  let result = @date.RelativeDelta::new(seconds=60.0).add(
    @date.RelativeDelta::new(
      days=-189674.75,
      hours=-272427.4,
      minutes=1535705.5,
      seconds=-9592.125,
      microseconds=-452939.875,
      years=-18124L,
      months=-18137L,
    ),
  )
  assert_eq(result.years(), -19635L)
  assert_eq(result.months(), -5)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-199958.75, 0.0, -19.400000000023283, 27.5, -52.125, -452939.875],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract random 19" {
  let result = @date.RelativeDelta::new(seconds=60.0).subtract(
    @date.RelativeDelta::new(
      days=-189674.75,
      hours=-272427.4,
      minutes=1535705.5,
      seconds=-9592.125,
      microseconds=-452939.875,
      years=-18124L,
      months=-18137L,
    ),
  )
  assert_eq(result.years(), 19635L)
  assert_eq(result.months(), 5)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [199958.75, 0.0, 19.400000000023283, -25.5, 52.125, 452939.875],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add random 20" {
  let result = @date.RelativeDelta::new(
    days=-6620263.0,
    hours=7.94071,
    minutes=6649701.0,
    seconds=-601581.375,
    microseconds=-8.567272,
    years=-350L,
    months=12947L,
  ).add(
    @date.RelativeDelta::new(
      days=-492117.5,
      hours=1118327.875,
      minutes=-2.535876,
      seconds=-3543912.0,
      microseconds=-3884253.0,
      years=-2760L,
      months=-12583L,
    ),
  )
  assert_eq(result.years(), -3080L)
  assert_eq(result.months(), 4)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [
      -7061213.5, 0.0, 4.815709999995306, -12.535876000001736, -36.375, -884261.567272,
    ],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract random 20" {
  let result = @date.RelativeDelta::new(
    days=-6620263.0,
    hours=7.94071,
    minutes=6649701.0,
    seconds=-601581.375,
    microseconds=-8.567272,
    years=-350L,
    months=12947L,
  ).subtract(
    @date.RelativeDelta::new(
      days=-492117.5,
      hours=1118327.875,
      minutes=-2.535876,
      seconds=-3543912.0,
      microseconds=-3884253.0,
      years=-2760L,
      months=-12583L,
    ),
  )
  assert_eq(result.years(), 4537L)
  assert_eq(result.months(), 6)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [
      -6170089.5, 0.0, -18.934290000004694, 42.535876000001736, -6.375, 884244.432728,
    ],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add random 21" {
  let result = @date.RelativeDelta::new(
    days=441048.2,
    hours=-5543163.0,
    minutes=-6.978565,
    seconds=646882.25,
    microseconds=-4968154.0,
    years=-7L,
    months=-2543L,
  ).add(
    @date.RelativeDelta::new(
      days=-98750.125,
      hours=-858772.6,
      minutes=359309.8,
      seconds=3.224121,
      microseconds=2658264.0,
      years=18511L,
      months=-8451L,
    ),
  )
  assert_eq(result.years(), 17588L)
  assert_eq(result.months(), -2)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [
      75808.07500000001, 0.0, -7.599999999976717, 3.8214349999889237, 23.474121,
      -309890.0,
    ],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract random 21" {
  let result = @date.RelativeDelta::new(
    days=441048.2,
    hours=-5543163.0,
    minutes=-6.978565,
    seconds=646882.25,
    microseconds=-4968154.0,
    years=-7L,
    months=-2543L,
  ).subtract(
    @date.RelativeDelta::new(
      days=-98750.125,
      hours=-858772.6,
      minutes=359309.8,
      seconds=3.224121,
      microseconds=2658264.0,
      years=18511L,
      months=-8451L,
    ),
  )
  assert_eq(result.years(), -18025L)
  assert_eq(result.months(), -8)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [
      344373.325, 0.0, 0.5999999999767169, 4.221435000012207, 12.025879, -626418.0,
    ],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add random 22" {
  let result = @date.RelativeDelta::new(days=1.5, hours=2.0).add(
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(6, nth=-2)),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [1.5, 0.0, 2.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), Some(-2))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract random 22" {
  let result = @date.RelativeDelta::new(days=1.5, hours=2.0).subtract(
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(6, nth=-2)),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [1.5, 0.0, 2.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), Some(-2))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add random 23" {
  let result = @date.RelativeDelta::new(
    days=-6467370.0,
    hours=-843263.3,
    minutes=229575.1,
    seconds=-3.168441,
    microseconds=-738128.5,
    years=-5546L,
    months=-2027L,
  ).add(
    @date.RelativeDelta::new(
      days=-1879051.0,
      hours=4736923.5,
      minutes=-2509950.5,
      seconds=683294.0,
      microseconds=-986430.5,
      years=3764L,
      months=-13418L,
    ),
  )
  assert_eq(result.years(), -3069L)
  assert_eq(result.months(), -1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [
      -8185761.0, 0.0, 4.199999999953434, -27.39999999999418, 9.831559, -724559.0,
    ],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract random 23" {
  let result = @date.RelativeDelta::new(
    days=-6467370.0,
    hours=-843263.3,
    minutes=229575.1,
    seconds=-3.168441,
    microseconds=-738128.5,
    years=-5546L,
    months=-2027L,
  ).subtract(
    @date.RelativeDelta::new(
      days=-1879051.0,
      hours=4736923.5,
      minutes=-2509950.5,
      seconds=683294.0,
      microseconds=-986430.5,
      years=3764L,
      months=-13418L,
    ),
  )
  assert_eq(result.years(), -8360L)
  assert_eq(result.months(), -9)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [
      -4818932.0, 0.0, -6.800000000046566, 57.60000000000582, -17.168441, 248302.0,
    ],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add random 24" {
  let result = @date.RelativeDelta::new(
    days=-393242.375,
    hours=202846.75,
    minutes=1221978.375,
    seconds=1170010.5,
    microseconds=-8.549395,
    years=6427L,
    months=-18702L,
  ).add(
    @date.RelativeDelta::new(
      days=-7.510036,
      hours=458895.9,
      minutes=-1186038.0,
      seconds=2063817.0,
      microseconds=-4022754.5,
      years=5411L,
      months=-1207L,
    ),
  )
  assert_eq(result.years(), 10179L)
  assert_eq(result.months(), -1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-365615.885036, 0.0, 23.650000000023283, 17.375, 3.5, -22763.049395],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract random 24" {
  let result = @date.RelativeDelta::new(
    days=-393242.375,
    hours=202846.75,
    minutes=1221978.375,
    seconds=1170010.5,
    microseconds=-8.549395,
    years=6427L,
    months=-18702L,
  ).subtract(
    @date.RelativeDelta::new(
      days=-7.510036,
      hours=458895.9,
      minutes=-1186038.0,
      seconds=2063817.0,
      microseconds=-4022754.5,
      years=5411L,
      months=-1207L,
    ),
  )
  assert_eq(result.years(), -442L)
  assert_eq(result.months(), 1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-402240.864964, 0.0, -20.150000000023283, 20.375, -42.5, 22745.950605],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add random 25" {
  let result = @date.RelativeDelta::new(microseconds=1000000.0).add(
    @date.RelativeDelta::new(
      days=-332824.4,
      hours=2991233.0,
      minutes=-2522378.0,
      seconds=-6598262.0,
      microseconds=8.745774,
      years=-8829L,
      months=-5455L,
    ),
  )
  assert_eq(result.years(), -9283L)
  assert_eq(result.months(), -7)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-210018.40000000002, 0.0, 17.0, -29.0, -1.0, 8.745774],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract random 25" {
  let result = @date.RelativeDelta::new(microseconds=1000000.0).subtract(
    @date.RelativeDelta::new(
      days=-332824.4,
      hours=2991233.0,
      minutes=-2522378.0,
      seconds=-6598262.0,
      microseconds=8.745774,
      years=-8829L,
      months=-5455L,
    ),
  )
  assert_eq(result.years(), 9283L)
  assert_eq(result.months(), 7)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [210018.40000000002, 0.0, -17.0, 29.0, 3.0, -8.745774],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add random 26" {
  let result = @date.RelativeDelta::new(microseconds=-1000000.0).add(
    @date.RelativeDelta::new(
      days=-189674.75,
      hours=-272427.4,
      minutes=1535705.5,
      seconds=-9592.125,
      microseconds=-452939.875,
      years=-18124L,
      months=-18137L,
    ),
  )
  assert_eq(result.years(), -19635L)
  assert_eq(result.months(), -5)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-199958.75, 0.0, -19.400000000023283, 26.5, -53.125, -452939.875],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract random 26" {
  let result = @date.RelativeDelta::new(microseconds=-1000000.0).subtract(
    @date.RelativeDelta::new(
      days=-189674.75,
      hours=-272427.4,
      minutes=1535705.5,
      seconds=-9592.125,
      microseconds=-452939.875,
      years=-18124L,
      months=-18137L,
    ),
  )
  assert_eq(result.years(), 19635L)
  assert_eq(result.months(), 5)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [199958.75, 0.0, 19.400000000023283, -26.5, 51.125, 452939.875],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add random 27" {
  let result = @date.RelativeDelta::new(
    days=-623242.3,
    hours=-521.3,
    minutes=-8394424.0,
    seconds=-0.227224,
    microseconds=8.227572,
    years=-1581L,
    months=-9182L,
  ).add(
    @date.RelativeDelta::new(
      days=703005.875,
      hours=-404192.5,
      minutes=-501072.4,
      seconds=3894974.0,
      microseconds=92177.75,
      years=-11040L,
      months=-18288L,
    ),
  )
  assert_eq(result.years(), -14910L)
  assert_eq(result.months(), -2)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [
      56768.57499999995, 0.0, -9.799999999988358, -20.400000000023283, 13.772776,
      92185.977572,
    ],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract random 27" {
  let result = @date.RelativeDelta::new(
    days=-623242.3,
    hours=-521.3,
    minutes=-8394424.0,
    seconds=-0.227224,
    microseconds=8.227572,
    years=-1581L,
    months=-9182L,
  ).subtract(
    @date.RelativeDelta::new(
      days=703005.875,
      hours=-404192.5,
      minutes=-501072.4,
      seconds=3894974.0,
      microseconds=92177.75,
      years=-11040L,
      months=-18288L,
    ),
  )
  assert_eq(result.years(), 10218L)
  assert_eq(result.months(), -2)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [
      -1314955.175, 0.0, 1.2000000000116415, 12.400000000023283, -14.227224, -92169.522428,
    ],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add random 28" {
  let result = @date.RelativeDelta::new(minutes=-60.0).add(
    @date.RelativeDelta::new(seconds=60.0),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, -1.0, 1.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract random 28" {
  let result = @date.RelativeDelta::new(minutes=-60.0).subtract(
    @date.RelativeDelta::new(seconds=60.0),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, -1.0, -1.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add random 29" {
  let result = @date.RelativeDelta::new(minutes=60.0).add(
    @date.RelativeDelta::new(years=1L, months=-13L),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), -1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 1.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract random 29" {
  let result = @date.RelativeDelta::new(minutes=60.0).subtract(
    @date.RelativeDelta::new(years=1L, months=-13L),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 1.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add random 30" {
  let result = @date.RelativeDelta::new(yearday=-1, leapdays=2.5).add(
    @date.RelativeDelta::new(
      yearday=59,
      nlyearday=60,
      month=7,
      day=8,
      leapdays=4.25,
    ),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 4.25, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, Some(3), Some(1), None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract random 30" {
  let result = @date.RelativeDelta::new(yearday=-1, leapdays=2.5).subtract(
    @date.RelativeDelta::new(
      yearday=59,
      nlyearday=60,
      month=7,
      day=8,
      leapdays=4.25,
    ),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 2.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, Some(1), Some(-1), None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add random 31" {
  let result = @date.RelativeDelta::new(
    days=-7822423.0,
    hours=322775.0,
    minutes=2458714.5,
    seconds=2744891.0,
    microseconds=952682.9,
    years=6313L,
    months=1945L,
  ).add(@date.RelativeDelta::new(yearday=-1, leapdays=2.5))
  assert_eq(result.years(), 6475L)
  assert_eq(result.months(), 1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-7807235.0, 2.5, 4.0, 2.5, 11.0, 952682.9],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, Some(1), Some(-1), None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract random 31" {
  let result = @date.RelativeDelta::new(
    days=-7822423.0,
    hours=322775.0,
    minutes=2458714.5,
    seconds=2744891.0,
    microseconds=952682.9,
    years=6313L,
    months=1945L,
  ).subtract(@date.RelativeDelta::new(yearday=-1, leapdays=2.5))
  assert_eq(result.years(), 6475L)
  assert_eq(result.months(), 1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-7807235.0, 2.5, 4.0, 2.5, 11.0, 952682.9],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, Some(1), Some(-1), None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add random 32" {
  let result = @date.RelativeDelta::new(
    days=-895738.5,
    hours=2849466.5,
    minutes=-5216484.0,
    seconds=4237931.0,
    microseconds=3469933.0,
    years=8841L,
    months=-8746L,
  ).add(@date.RelativeDelta::new())
  assert_eq(result.years(), 8113L)
  assert_eq(result.months(), -10)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-780584.5, 0.0, 6.5, -12.0, 14.0, 469933.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract random 32" {
  let result = @date.RelativeDelta::new(
    days=-895738.5,
    hours=2849466.5,
    minutes=-5216484.0,
    seconds=4237931.0,
    microseconds=3469933.0,
    years=8841L,
    months=-8746L,
  ).subtract(@date.RelativeDelta::new())
  assert_eq(result.years(), 8113L)
  assert_eq(result.months(), -10)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-780584.5, 0.0, 6.5, -12.0, 14.0, 469933.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add random 33" {
  let result = @date.RelativeDelta::new(microseconds=-999999.9999999999).add(
    @date.RelativeDelta::new(
      days=-623242.3,
      hours=-521.3,
      minutes=-8394424.0,
      seconds=-0.227224,
      microseconds=8.227572,
      years=-1581L,
      months=-9182L,
    ),
  )
  assert_eq(result.years(), -2346L)
  assert_eq(result.months(), -2)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-629093.3, 0.0, -4.2999999999883585, -4.0, -0.227224, -999991.7724279999],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract random 33" {
  let result = @date.RelativeDelta::new(microseconds=-999999.9999999999).subtract(
    @date.RelativeDelta::new(
      days=-623242.3,
      hours=-521.3,
      minutes=-8394424.0,
      seconds=-0.227224,
      microseconds=8.227572,
      years=-1581L,
      months=-9182L,
    ),
  )
  assert_eq(result.years(), 2346L)
  assert_eq(result.months(), 2)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [629093.3, 0.0, 4.2999999999883585, 4.0, -0.772776, -8.227571999887004],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add random 34" {
  let result = @date.RelativeDelta::new(
    days=659567.8,
    hours=302957.5,
    minutes=-2.420766,
    seconds=4159649.5,
    microseconds=-5.495862,
    years=18629L,
    months=-18655L,
  ).add(
    @date.RelativeDelta::new(
      days=1830033.5,
      hours=-219501.5,
      minutes=-1004428.875,
      seconds=393168.3,
      microseconds=260581.4,
      years=-9861L,
      months=12146L,
    ),
  )
  assert_eq(result.years(), 8226L)
  assert_eq(result.months(), -5)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [
      2492434.3, 0.0, -12.0, 8.704234000004362, 17.79999999998836, 260575.90413799998,
    ],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract random 34" {
  let result = @date.RelativeDelta::new(
    days=659567.8,
    hours=302957.5,
    minutes=-2.420766,
    seconds=4159649.5,
    microseconds=-5.495862,
    years=18629L,
    months=-18655L,
  ).subtract(
    @date.RelativeDelta::new(
      days=1830033.5,
      hours=-219501.5,
      minutes=-1004428.875,
      seconds=393168.3,
      microseconds=260581.4,
      years=-9861L,
      months=12146L,
    ),
  )
  assert_eq(result.years(), 25924L)
  assert_eq(result.months(), -9)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [
      -1147955.7, 0.0, 5.0, 41.45423400000436, -18.79999999998836, -260586.895862,
    ],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add random 35" {
  let result = @date.RelativeDelta::new(
    days=-4237743.0,
    hours=284597.7,
    minutes=5.120257,
    seconds=4031816.0,
    microseconds=6.016754,
    years=-4891L,
    months=-2489L,
  ).add(
    @date.RelativeDelta::new(
      days=-6467370.0,
      hours=-843263.3,
      minutes=229575.1,
      seconds=-3.168441,
      microseconds=-738128.5,
      years=-5546L,
      months=-2027L,
    ),
  )
  assert_eq(result.years(), -10813L)
  assert_eq(result.months(), -4)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [
      -10728185.0, 0.0, 8.399999999965075, 16.220257000008132, 52.831559, -738122.483246,
    ],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract random 35" {
  let result = @date.RelativeDelta::new(
    days=-4237743.0,
    hours=284597.7,
    minutes=5.120257,
    seconds=4031816.0,
    microseconds=6.016754,
    years=-4891L,
    months=-2489L,
  ).subtract(
    @date.RelativeDelta::new(
      days=-6467370.0,
      hours=-843263.3,
      minutes=229575.1,
      seconds=-3.168441,
      microseconds=-738128.5,
      years=-5546L,
      months=-2027L,
    ),
  )
  assert_eq(result.years(), 616L)
  assert_eq(result.months(), 6)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [
      2276508.0, 0.0, 11.000000000058208, -13.97974300000351, 59.168441, 738134.516754,
    ],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add random 36" {
  let result = @date.RelativeDelta::new(
    days=4993439.0,
    hours=2541515.5,
    minutes=3254563.0,
    seconds=-117797.5,
    microseconds=157323.3,
    years=955L,
    months=14326L,
  ).add(
    @date.RelativeDelta::new(
      days=662402.125,
      hours=-8158039.0,
      minutes=-543837.9,
      seconds=788445.4,
      microseconds=-5.572976,
      years=8032L,
      months=-355L,
    ),
  )
  assert_eq(result.years(), 10151L)
  assert_eq(result.months(), 3)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [
      5423710.125, 0.0, -13.5, -57.90000000002328, 27.900000000023283, 157317.727024,
    ],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract random 36" {
  let result = @date.RelativeDelta::new(
    days=4993439.0,
    hours=2541515.5,
    minutes=3254563.0,
    seconds=-117797.5,
    microseconds=157323.3,
    years=955L,
    months=14326L,
  ).subtract(
    @date.RelativeDelta::new(
      days=662402.125,
      hours=-8158039.0,
      minutes=-543837.9,
      seconds=788445.4,
      microseconds=-5.572976,
      years=8032L,
      months=-355L,
    ),
  )
  assert_eq(result.years(), -5854L)
  assert_eq(result.months(), 5)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [
      4779478.875, 0.0, 0.5, 56.90000000002328, -2.900000000023283, 157328.87297599998,
    ],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add random 37" {
  let result = @date.RelativeDelta::new(
    days=306987.0,
    hours=-1205672.0,
    minutes=-3974908.0,
    seconds=-1832270.0,
    microseconds=2.877429,
    years=-3910L,
    months=-11307L,
  ).add(
    @date.RelativeDelta::new(
      days=-189674.75,
      hours=-272427.4,
      minutes=1535705.5,
      seconds=-9592.125,
      microseconds=-452939.875,
      years=-18124L,
      months=-18137L,
    ),
  )
  assert_eq(result.years(), -24487L)
  assert_eq(result.months(), -8)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [54010.25, 0.0, -16.400000000023283, 0.5, -42.125, -452936.997571],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract random 37" {
  let result = @date.RelativeDelta::new(
    days=306987.0,
    hours=-1205672.0,
    minutes=-3974908.0,
    seconds=-1832270.0,
    microseconds=2.877429,
    years=-3910L,
    months=-11307L,
  ).subtract(
    @date.RelativeDelta::new(
      days=-189674.75,
      hours=-272427.4,
      minutes=1535705.5,
      seconds=-9592.125,
      microseconds=-452939.875,
      years=-18124L,
      months=-18137L,
    ),
  )
  assert_eq(result.years(), 14783L)
  assert_eq(result.months(), 2)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [453928.75, 0.0, -1.599999999976717, -51.5, 2.125, 452942.752429],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add random 38" {
  let result = @date.RelativeDelta::new(nlyearday=366, leapdays=-3.5).add(
    @date.RelativeDelta::new(yearday=-2147483648, leapdays=2.5),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 2.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, Some(1), Some(-2147483648), None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract random 38" {
  let result = @date.RelativeDelta::new(nlyearday=366, leapdays=-3.5).subtract(
    @date.RelativeDelta::new(yearday=-2147483648, leapdays=2.5),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, -3.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, Some(12), Some(32), None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add random 39" {
  let result = @date.RelativeDelta::new(
    days=-2184123.0,
    hours=2690911.5,
    minutes=8739641.0,
    seconds=5933606.0,
    microseconds=202404.6,
    years=-9917L,
    months=-16353L,
  ).add(@date.RelativeDelta::new(years=9223372036854775807L, months=-12L))
  assert_eq(result.years(), 9223372036854764527L)
  assert_eq(result.months(), -9)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-2065864.0, 0.0, 3.5, 54.0, 26.0, 202404.6],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract random 39" {
  assert_true(
    try {
      ignore(
        @date.RelativeDelta::new(
          days=-2184123.0,
          hours=2690911.5,
          minutes=8739641.0,
          seconds=5933606.0,
          microseconds=202404.6,
          years=-9917L,
          months=-16353L,
        ).subtract(
          @date.RelativeDelta::new(years=9223372036854775807L, months=-12L),
        ),
      )
      false
    } catch {
      _ => true
    },
  )
}

///|
test "relative delta original add random 40" {
  let result = @date.RelativeDelta::new(
    yearday=60,
    nlyearday=60,
    month=7,
    day=8,
    leapdays=4.25,
  ).add(
    @date.RelativeDelta::new(
      days=6249769.0,
      hours=-6.205153,
      minutes=-1036377.375,
      seconds=479085.0,
      microseconds=8935179.0,
      years=-1281L,
      months=17039L,
    ),
  )
  assert_eq(result.years(), 138L)
  assert_eq(result.months(), 11)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [6249055.0, 4.25, -9.205152999998973, -53.375, 53.0, 935179.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, Some(3), Some(1), None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract random 40" {
  let result = @date.RelativeDelta::new(
    yearday=60,
    nlyearday=60,
    month=7,
    day=8,
    leapdays=4.25,
  ).subtract(
    @date.RelativeDelta::new(
      days=6249769.0,
      hours=-6.205153,
      minutes=-1036377.375,
      seconds=479085.0,
      microseconds=8935179.0,
      years=-1281L,
      months=17039L,
    ),
  )
  assert_eq(result.years(), -138L)
  assert_eq(result.months(), -11)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-6249055.0, 4.25, 9.205152999998973, 53.375, -53.0, -935179.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, Some(3), Some(1), None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add random 41" {
  let result = @date.RelativeDelta::new(nlyearday=-1, leapdays=-3.5).add(
    @date.RelativeDelta::new(
      days=1830033.5,
      hours=-219501.5,
      minutes=-1004428.875,
      seconds=393168.3,
      microseconds=260581.4,
      years=-9861L,
      months=12146L,
    ),
  )
  assert_eq(result.years(), -8849L)
  assert_eq(result.months(), 2)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [1820195.5, -3.5, -20.5, -16.875, 48.29999999998836, 260581.4],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, Some(1), Some(-1), None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract random 41" {
  let result = @date.RelativeDelta::new(nlyearday=-1, leapdays=-3.5).subtract(
    @date.RelativeDelta::new(
      days=1830033.5,
      hours=-219501.5,
      minutes=-1004428.875,
      seconds=393168.3,
      microseconds=260581.4,
      years=-9861L,
      months=12146L,
    ),
  )
  assert_eq(result.years(), 8849L)
  assert_eq(result.months(), -2)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-1820195.5, -3.5, 20.5, 16.875, -48.29999999998836, -260581.4],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, Some(1), Some(-1), None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add random 42" {
  let result = @date.RelativeDelta::new(
    on_weekday=@date.RelativeWeekday::new(6, nth=-2),
  ).add(
    @date.RelativeDelta::new(
      days=1139843.625,
      hours=9821723.0,
      minutes=-104588.5,
      seconds=3634109.0,
      microseconds=-8.506941,
      years=-15104L,
      months=12004L,
    ),
  )
  assert_eq(result.years(), -14104L)
  assert_eq(result.months(), 4)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [1549050.625, 0.0, 22.0, -40.5, 29.0, -8.506941],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), Some(-2))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract random 42" {
  let result = @date.RelativeDelta::new(
    on_weekday=@date.RelativeWeekday::new(6, nth=-2),
  ).subtract(
    @date.RelativeDelta::new(
      days=1139843.625,
      hours=9821723.0,
      minutes=-104588.5,
      seconds=3634109.0,
      microseconds=-8.506941,
      years=-15104L,
      months=12004L,
    ),
  )
  assert_eq(result.years(), 14104L)
  assert_eq(result.months(), -4)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-1549050.625, 0.0, -22.0, 40.5, -29.0, 8.506941],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), Some(-2))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add random 43" {
  let result = @date.RelativeDelta::new(yearday=59, leapdays=2.5).add(
    @date.RelativeDelta::new(
      days=293849.5,
      hours=-370140.9,
      minutes=-141361.7,
      seconds=7.346868,
      microseconds=5381000.0,
      years=-7497L,
      months=-12147L,
    ),
  )
  assert_eq(result.years(), -8509L)
  assert_eq(result.months(), -3)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [
      278329.5, 2.5, -16.900000000023283, -1.7000000000116415, 12.346868, 381000.0,
    ],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, Some(2), Some(28), None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract random 43" {
  let result = @date.RelativeDelta::new(yearday=59, leapdays=2.5).subtract(
    @date.RelativeDelta::new(
      days=293849.5,
      hours=-370140.9,
      minutes=-141361.7,
      seconds=7.346868,
      microseconds=5381000.0,
      years=-7497L,
      months=-12147L,
    ),
  )
  assert_eq(result.years(), 8509L)
  assert_eq(result.months(), 3)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [
      -278329.5, 2.5, 16.900000000023283, 1.7000000000116415, -12.346868, -381000.0,
    ],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, Some(2), Some(28), None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add random 44" {
  let result = @date.RelativeDelta::new(
    days=8821064.0,
    hours=-389160.9,
    minutes=685251.0,
    seconds=2539536.5,
    microseconds=559070.6,
    years=178L,
    months=-10922L,
  ).add(@date.RelativeDelta::new(microseconds=1000000.0))
  assert_eq(result.years(), -732L)
  assert_eq(result.months(), -2)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [8805355.0, 0.0, -18.900000000023283, 16.0, 37.5, 559070.6],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract random 44" {
  let result = @date.RelativeDelta::new(
    days=8821064.0,
    hours=-389160.9,
    minutes=685251.0,
    seconds=2539536.5,
    microseconds=559070.6,
    years=178L,
    months=-10922L,
  ).subtract(@date.RelativeDelta::new(microseconds=1000000.0))
  assert_eq(result.years(), -732L)
  assert_eq(result.months(), -2)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [8805355.0, 0.0, -18.900000000023283, 16.0, 35.5, 559070.6],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add random 45" {
  let result = @date.RelativeDelta::new(
    year=-1,
    month=13,
    day=-1,
    hour=24,
    second=60,
    microsecond=1000000,
  ).add(@date.RelativeDelta::new(seconds=60.00000000000001))
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 1.0, 7.105427357601002e-15, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(-1), Some(13), Some(-1), Some(24), None, Some(60), Some(1000000)],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract random 45" {
  let result = @date.RelativeDelta::new(
    year=-1,
    month=13,
    day=-1,
    hour=24,
    second=60,
    microsecond=1000000,
  ).subtract(@date.RelativeDelta::new(seconds=60.00000000000001))
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, -1.0, -7.105427357601002e-15, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(-1), Some(13), Some(-1), Some(24), None, Some(60), Some(1000000)],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add random 46" {
  let result = @date.RelativeDelta::new(yearday=365, leapdays=2.5).add(
    @date.RelativeDelta::new(yearday=1, leapdays=2.5),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 2.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, Some(1), Some(1), None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract random 46" {
  let result = @date.RelativeDelta::new(yearday=365, leapdays=2.5).subtract(
    @date.RelativeDelta::new(yearday=1, leapdays=2.5),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, -1.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, Some(12), Some(31), None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add random 47" {
  let result = @date.RelativeDelta::new(microseconds=-999999.9999999999).add(
    @date.RelativeDelta::new(
      days=-3222755.0,
      hours=306352.0,
      minutes=-0.715437,
      seconds=-4270002.0,
      microseconds=-9122440.0,
      years=-82L,
      months=18246L,
    ),
  )
  assert_eq(result.years(), 1438L)
  assert_eq(result.months(), 6)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-3210040.0, 0.0, 6.0, -6.7154370000062045, -52.0, -122440.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract random 47" {
  let result = @date.RelativeDelta::new(microseconds=-999999.9999999999).subtract(
    @date.RelativeDelta::new(
      days=-3222755.0,
      hours=306352.0,
      minutes=-0.715437,
      seconds=-4270002.0,
      microseconds=-9122440.0,
      years=-82L,
      months=18246L,
    ),
  )
  assert_eq(result.years(), -1438L)
  assert_eq(result.months(), -6)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [3210040.0, 0.0, -6.0, 6.7154370000062045, 51.0, -877559.9999999999],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add random 48" {
  let result = @date.RelativeDelta::new(
    days=367778.75,
    hours=-4619093.0,
    minutes=-211008.0,
    seconds=-9857287.0,
    microseconds=-2.298186,
    years=3914L,
    months=-12542L,
  ).add(
    @date.RelativeDelta::new(
      days=-1096294.0,
      hours=-4.793619,
      minutes=-8.644725,
      seconds=-3886120.0,
      microseconds=-2095988.0,
      years=-11091L,
      months=1450L,
    ),
  )
  assert_eq(result.years(), -8102L)
  assert_eq(result.months(), 8)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [
      -921282.25, 0.0, -23.793619000000035, -32.64472499999829, -49.0, -95990.298186,
    ],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract random 48" {
  let result = @date.RelativeDelta::new(
    days=367778.75,
    hours=-4619093.0,
    minutes=-211008.0,
    seconds=-9857287.0,
    microseconds=-2.298186,
    years=3914L,
    months=-12542L,
  ).subtract(
    @date.RelativeDelta::new(
      days=-1096294.0,
      hours=-4.793619,
      minutes=-8.644725,
      seconds=-3886120.0,
      microseconds=-2095988.0,
      years=-11091L,
      months=1450L,
    ),
  )
  assert_eq(result.years(), 13839L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [
      1271395.75, 0.0, -15.206380999999965, -19.35527500000171, 35.0, 95985.701814,
    ],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add random 49" {
  let result = @date.RelativeDelta::new(
    days=-3955130.0,
    hours=385412.625,
    minutes=-9088335.0,
    seconds=4816475.0,
    microseconds=3902903.5,
    years=-5904L,
    months=13563L,
  ).add(
    @date.RelativeDelta::new(
      days=-4237743.0,
      hours=284597.7,
      minutes=5.120257,
      seconds=4031816.0,
      microseconds=6.016754,
      years=-4891L,
      months=-2489L,
    ),
  )
  assert_eq(result.years(), -9872L)
  assert_eq(result.months(), -2)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [
      -8171165.0, 0.0, 4.3250000000116415, -18.87974299999769, 34.0, 902909.516754,
    ],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract random 49" {
  let result = @date.RelativeDelta::new(
    days=-3955130.0,
    hours=385412.625,
    minutes=-9088335.0,
    seconds=4816475.0,
    microseconds=3902903.5,
    years=-5904L,
    months=13563L,
  ).subtract(
    @date.RelativeDelta::new(
      days=-4237743.0,
      hours=284597.7,
      minutes=5.120257,
      seconds=4031816.0,
      microseconds=6.016754,
      years=-4891L,
      months=-2489L,
    ),
  )
  assert_eq(result.years(), 324L)
  assert_eq(result.months(), 8)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [
      280512.0, 0.0, -15.075000000011642, -22.12025700000231, -18.0, 902897.483246,
    ],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add random 50" {
  let result = @date.RelativeDelta::new(
    days=-623242.3,
    hours=-521.3,
    minutes=-8394424.0,
    seconds=-0.227224,
    microseconds=8.227572,
    years=-1581L,
    months=-9182L,
  ).add(@date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0)))
  assert_eq(result.years(), -2346L)
  assert_eq(result.months(), -2)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-629093.3, 0.0, -4.2999999999883585, -4.0, -0.227224, 8.227572],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract random 50" {
  let result = @date.RelativeDelta::new(
    days=-623242.3,
    hours=-521.3,
    minutes=-8394424.0,
    seconds=-0.227224,
    microseconds=8.227572,
    years=-1581L,
    months=-9182L,
  ).subtract(@date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0)))
  assert_eq(result.years(), -2346L)
  assert_eq(result.months(), -2)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-629093.3, 0.0, -4.2999999999883585, -4.0, -0.227224, 8.227572],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add random 51" {
  let result = @date.RelativeDelta::new(
    days=-3775600.0,
    hours=3763448.5,
    minutes=-9294160.0,
    seconds=1244359.375,
    microseconds=293100.7,
    years=-3948L,
    months=16662L,
  ).add(
    @date.RelativeDelta::new(
      days=-623242.3,
      hours=-521.3,
      minutes=-8394424.0,
      seconds=-0.227224,
      microseconds=8.227572,
      years=-1581L,
      months=-9182L,
    ),
  )
  assert_eq(result.years(), -4906L)
  assert_eq(result.months(), 4)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-4254323.3, 0.0, 7.2000000000116415, -5.0, 19.147776, 293108.927572],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract random 51" {
  let result = @date.RelativeDelta::new(
    days=-3775600.0,
    hours=3763448.5,
    minutes=-9294160.0,
    seconds=1244359.375,
    microseconds=293100.7,
    years=-3948L,
    months=16662L,
  ).subtract(
    @date.RelativeDelta::new(
      days=-623242.3,
      hours=-521.3,
      minutes=-8394424.0,
      seconds=-0.227224,
      microseconds=8.227572,
      years=-1581L,
      months=-9182L,
    ),
  )
  assert_eq(result.years(), -214L)
  assert_eq(result.months(), 8)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-2996136.7, 0.0, 15.799999999988358, 3.0, 19.602224, 293092.472428],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add random 52" {
  let result = @date.RelativeDelta::new(
    days=1.033419,
    hours=-9132.375,
    minutes=4946398.5,
    seconds=4777689.0,
    microseconds=186711.0,
    years=-12397L,
    months=-5675L,
  ).add(@date.RelativeDelta::new(hours=-24.000000000000004))
  assert_eq(result.years(), -12869L)
  assert_eq(result.months(), -11)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [3109.033419, 0.0, 18.624999999999996, 6.5, 9.0, 186711.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract random 52" {
  let result = @date.RelativeDelta::new(
    days=1.033419,
    hours=-9132.375,
    minutes=4946398.5,
    seconds=4777689.0,
    microseconds=186711.0,
    years=-12397L,
    months=-5675L,
  ).subtract(@date.RelativeDelta::new(hours=-24.000000000000004))
  assert_eq(result.years(), -12869L)
  assert_eq(result.months(), -11)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [3111.033419, 0.0, 18.625000000000004, 6.5, 9.0, 186711.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add random 53" {
  let result = @date.RelativeDelta::new(microseconds=-1000000.0).add(
    @date.RelativeDelta::new(
      days=-9.341969,
      hours=-122718.6,
      minutes=-968564.5,
      seconds=3.157129,
      microseconds=-9.534805,
      years=-12166L,
      months=10112L,
    ),
  )
  assert_eq(result.years(), -11324L)
  assert_eq(result.months(), 8)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-5794.341969, 0.0, -20.60000000000582, -44.5, 2.157129, -9.534805],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract random 53" {
  let result = @date.RelativeDelta::new(microseconds=-1000000.0).subtract(
    @date.RelativeDelta::new(
      days=-9.341969,
      hours=-122718.6,
      minutes=-968564.5,
      seconds=3.157129,
      microseconds=-9.534805,
      years=-12166L,
      months=10112L,
    ),
  )
  assert_eq(result.years(), 11324L)
  assert_eq(result.months(), -8)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [5794.341969, 0.0, 20.60000000000582, 44.5, -4.157128999999999, 9.534805],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add random 54" {
  let result = @date.RelativeDelta::new(yearday=59, leapdays=2.5).add(
    @date.RelativeDelta::new(minutes=-59.99999999999999),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 2.5, 0.0, -59.99999999999999, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, Some(2), Some(28), None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract random 54" {
  let result = @date.RelativeDelta::new(yearday=59, leapdays=2.5).subtract(
    @date.RelativeDelta::new(minutes=-59.99999999999999),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 2.5, 0.0, 59.99999999999999, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, Some(2), Some(28), None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add random 55" {
  let result = @date.RelativeDelta::new(
    days=703005.875,
    hours=-404192.5,
    minutes=-501072.4,
    seconds=3894974.0,
    microseconds=92177.75,
    years=-11040L,
    months=-18288L,
  ).add(@date.RelativeDelta::new(years=1L, months=-13L))
  assert_eq(result.years(), -12564L)
  assert_eq(result.months(), -1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [685861.875, 0.0, -5.5, -16.400000000023283, 14.0, 92177.75],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract random 55" {
  let result = @date.RelativeDelta::new(
    days=703005.875,
    hours=-404192.5,
    minutes=-501072.4,
    seconds=3894974.0,
    microseconds=92177.75,
    years=-11040L,
    months=-18288L,
  ).subtract(@date.RelativeDelta::new(years=1L, months=-13L))
  assert_eq(result.years(), -12564L)
  assert_eq(result.months(), 1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [685861.875, 0.0, -5.5, -16.400000000023283, 14.0, 92177.75],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add random 56" {
  let result = @date.RelativeDelta::new(
    days=-9.194163,
    hours=5.320216,
    minutes=5.571042,
    seconds=72094.125,
    microseconds=-2570678.5,
    years=1645L,
    months=-6519L,
  ).add(
    @date.RelativeDelta::new(
      days=1139843.625,
      hours=9821723.0,
      minutes=-104588.5,
      seconds=3634109.0,
      microseconds=-8.506941,
      years=-15104L,
      months=12004L,
    ),
  )
  assert_eq(result.years(), -13002L)
  assert_eq(result.months(), 1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [
      1549042.430837, 0.0, 23.320216000000002, -32.928957999999966, 1.125, -570687.006941,
    ],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract random 56" {
  let result = @date.RelativeDelta::new(
    days=-9.194163,
    hours=5.320216,
    minutes=5.571042,
    seconds=72094.125,
    microseconds=-2570678.5,
    years=1645L,
    months=-6519L,
  ).subtract(
    @date.RelativeDelta::new(
      days=1139843.625,
      hours=9821723.0,
      minutes=-104588.5,
      seconds=3634109.0,
      microseconds=-8.506941,
      years=-15104L,
      months=12004L,
    ),
  )
  assert_eq(result.years(), 15206L)
  assert_eq(result.months(), -7)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [
      -1549058.819163, 0.0, -20.679783999999998, 47.071042000000034, 3.125, -570669.993059,
    ],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add random 57" {
  let result = @date.RelativeDelta::new(hours=24.000000000000004).add(
    @date.RelativeDelta::new(
      days=978683.8,
      hours=-2060934.0,
      minutes=364700.75,
      seconds=2441918.0,
      microseconds=290795.75,
      years=8232L,
      months=-1984L,
    ),
  )
  assert_eq(result.years(), 8067L)
  assert_eq(result.months(), -4)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [893094.8, 0.0, -17.999999999999996, 38.75, 38.0, 290795.75],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract random 57" {
  let result = @date.RelativeDelta::new(hours=24.000000000000004).subtract(
    @date.RelativeDelta::new(
      days=978683.8,
      hours=-2060934.0,
      minutes=364700.75,
      seconds=2441918.0,
      microseconds=290795.75,
      years=8232L,
      months=-1984L,
    ),
  )
  assert_eq(result.years(), -8067L)
  assert_eq(result.months(), 4)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-893092.8, 0.0, 18.000000000000004, -38.75, -38.0, -290795.75],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add random 58" {
  let result = @date.RelativeDelta::new(years=-1L, months=13L).add(
    @date.RelativeDelta::new(minutes=60.0),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 1.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract random 58" {
  let result = @date.RelativeDelta::new(years=-1L, months=13L).subtract(
    @date.RelativeDelta::new(minutes=60.0),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, -1.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add random 59" {
  let result = @date.RelativeDelta::new(hours=24.0).add(
    @date.RelativeDelta::new(hours=23.999999999999996),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [1.0, 0.0, 23.999999999999996, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract random 59" {
  let result = @date.RelativeDelta::new(hours=24.0).subtract(
    @date.RelativeDelta::new(hours=23.999999999999996),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [1.0, 0.0, -23.999999999999996, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add random 60" {
  let result = @date.RelativeDelta::new(
    days=-1096294.0,
    hours=-4.793619,
    minutes=-8.644725,
    seconds=-3886120.0,
    microseconds=-2095988.0,
    years=-11091L,
    months=1450L,
  ).add(@date.RelativeDelta::new(microseconds=999999.9999999999))
  assert_eq(result.years(), -10971L)
  assert_eq(result.months(), 10)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [
      -1096339.0, 0.0, -3.793619000000035, -36.64472499999829, -42.0, 904011.9999999999,
    ],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract random 60" {
  let result = @date.RelativeDelta::new(
    days=-1096294.0,
    hours=-4.793619,
    minutes=-8.644725,
    seconds=-3886120.0,
    microseconds=-2095988.0,
    years=-11091L,
    months=1450L,
  ).subtract(@date.RelativeDelta::new(microseconds=999999.9999999999))
  assert_eq(result.years(), -10971L)
  assert_eq(result.months(), 10)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-1096339.0, 0.0, -3.793619000000035, -36.64472499999829, -43.0, -95988.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add random 61" {
  let result = @date.RelativeDelta::new(seconds=59.99999999999999).add(
    @date.RelativeDelta::new(years=-1L, months=13L),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 59.99999999999999, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract random 61" {
  let result = @date.RelativeDelta::new(seconds=59.99999999999999).subtract(
    @date.RelativeDelta::new(years=-1L, months=13L),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), -1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 59.99999999999999, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add random 62" {
  let result = @date.RelativeDelta::new(
    days=880139.9,
    hours=4837527.5,
    minutes=-80858.0,
    seconds=-1.767828,
    microseconds=-580721.25,
    years=9827L,
    months=-9378L,
  ).add(@date.RelativeDelta::new(minutes=-60.0))
  assert_eq(result.years(), 9046L)
  assert_eq(result.months(), -6)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [1081646.9, 0.0, 11.5, -38.0, -1.767828, -580721.25],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract random 62" {
  let result = @date.RelativeDelta::new(
    days=880139.9,
    hours=4837527.5,
    minutes=-80858.0,
    seconds=-1.767828,
    microseconds=-580721.25,
    years=9827L,
    months=-9378L,
  ).subtract(@date.RelativeDelta::new(minutes=-60.0))
  assert_eq(result.years(), 9046L)
  assert_eq(result.months(), -6)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [1081646.9, 0.0, 13.5, -38.0, -1.767828, -580721.25],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add random 63" {
  let result = @date.RelativeDelta::new(seconds=-60.0).add(
    @date.RelativeDelta::new(
      days=186133.8,
      hours=22011.9,
      minutes=-672140.7,
      seconds=438239.2,
      microseconds=-5.959838,
      years=16167L,
      months=3170L,
    ),
  )
  assert_eq(result.years(), 16431L)
  assert_eq(result.months(), 2)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [
      186588.8, 0.0, 11.900000000001455, -38.699999999953434, 59.20000000001164,
      -5.959838,
    ],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract random 63" {
  let result = @date.RelativeDelta::new(seconds=-60.0).subtract(
    @date.RelativeDelta::new(
      days=186133.8,
      hours=22011.9,
      minutes=-672140.7,
      seconds=438239.2,
      microseconds=-5.959838,
      years=16167L,
      months=3170L,
    ),
  )
  assert_eq(result.years(), -16431L)
  assert_eq(result.months(), -2)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [
      -186588.8, 0.0, -11.900000000001455, 36.699999999953434, -59.20000000001164,
      5.959838,
    ],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add random 64" {
  let result = @date.RelativeDelta::new(
    days=-189059.375,
    hours=-3.219289,
    minutes=918686.5,
    seconds=1154314.75,
    microseconds=-923181.8,
    years=-14959L,
    months=6112L,
  ).add(
    @date.RelativeDelta::new(
      days=-4237743.0,
      hours=284597.7,
      minutes=5.120257,
      seconds=4031816.0,
      microseconds=6.016754,
      years=-4891L,
      months=-2489L,
    ),
  )
  assert_eq(result.years(), -19548L)
  assert_eq(result.months(), -1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [
      -4414246.375, 0.0, 2.4807110000110697, 6.6202570000023115, 30.75, -923175.7832460001,
    ],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract random 64" {
  let result = @date.RelativeDelta::new(
    days=-189059.375,
    hours=-3.219289,
    minutes=918686.5,
    seconds=1154314.75,
    microseconds=-923181.8,
    years=-14959L,
    months=6112L,
  ).subtract(
    @date.RelativeDelta::new(
      days=-4237743.0,
      hours=284597.7,
      minutes=5.120257,
      seconds=4031816.0,
      microseconds=6.016754,
      years=-4891L,
      months=-2489L,
    ),
  )
  assert_eq(result.years(), -9352L)
  assert_eq(result.months(), 9)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [
      4037430.625, 0.0, -16.919289000012213, 3.3797429999976885, -21.25, -923187.816754,
    ],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add random 65" {
  let result = @date.RelativeDelta::new(
    on_weekday=@date.RelativeWeekday::new(0, nth=0),
  ).add(
    @date.RelativeDelta::new(
      days=-332824.4,
      hours=2991233.0,
      minutes=-2522378.0,
      seconds=-6598262.0,
      microseconds=8.745774,
      years=-8829L,
      months=-5455L,
    ),
  )
  assert_eq(result.years(), -9283L)
  assert_eq(result.months(), -7)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-210018.40000000002, 0.0, 17.0, -29.0, -2.0, 8.745774],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), Some(0))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract random 65" {
  let result = @date.RelativeDelta::new(
    on_weekday=@date.RelativeWeekday::new(0, nth=0),
  ).subtract(
    @date.RelativeDelta::new(
      days=-332824.4,
      hours=2991233.0,
      minutes=-2522378.0,
      seconds=-6598262.0,
      microseconds=8.745774,
      years=-8829L,
      months=-5455L,
    ),
  )
  assert_eq(result.years(), 9283L)
  assert_eq(result.months(), 7)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [210018.40000000002, 0.0, -17.0, 29.0, 2.0, -8.745774],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), Some(0))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add random 66" {
  let result = @date.RelativeDelta::new(
    days=4993439.0,
    hours=2541515.5,
    minutes=3254563.0,
    seconds=-117797.5,
    microseconds=157323.3,
    years=955L,
    months=14326L,
  ).add(@date.RelativeDelta::new(microseconds=-1000001.5))
  assert_eq(result.years(), 2148L)
  assert_eq(result.months(), 10)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [5101594.0, 0.0, 5.5, 0.0, -18.5, 157321.8],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract random 66" {
  let result = @date.RelativeDelta::new(
    days=4993439.0,
    hours=2541515.5,
    minutes=3254563.0,
    seconds=-117797.5,
    microseconds=157323.3,
    years=955L,
    months=14326L,
  ).subtract(@date.RelativeDelta::new(microseconds=-1000001.5))
  assert_eq(result.years(), 2148L)
  assert_eq(result.months(), 10)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [5101594.0, 0.0, 5.5, 0.0, -16.5, 157324.8],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add random 67" {
  let result = @date.RelativeDelta::new(hours=-24.000000000000004).add(
    @date.RelativeDelta::new(
      yearday=61,
      nlyearday=60,
      month=7,
      day=8,
      leapdays=4.25,
    ),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-1.0, 4.25, -3.552713678800501e-15, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, Some(3), Some(1), None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract random 67" {
  let result = @date.RelativeDelta::new(hours=-24.000000000000004).subtract(
    @date.RelativeDelta::new(
      yearday=61,
      nlyearday=60,
      month=7,
      day=8,
      leapdays=4.25,
    ),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-1.0, 4.25, -3.552713678800501e-15, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, Some(3), Some(1), None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original add random 68" {
  let result = @date.RelativeDelta::new(microseconds=999999.9999999999).add(
    @date.RelativeDelta::new(microseconds=999999.9999999999),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 1.0, 999999.9999999998],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract random 68" {
  let result = @date.RelativeDelta::new(microseconds=999999.9999999999).subtract(
    @date.RelativeDelta::new(microseconds=999999.9999999999),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), true)
}

///|
test "relative delta original add random 69" {
  let result = @date.RelativeDelta::new(
    days=-3955130.0,
    hours=385412.625,
    minutes=-9088335.0,
    seconds=4816475.0,
    microseconds=3902903.5,
    years=-5904L,
    months=13563L,
  ).add(
    @date.RelativeDelta::new(
      days=703005.875,
      hours=-404192.5,
      minutes=-501072.4,
      seconds=3894974.0,
      microseconds=92177.75,
      years=-11040L,
      months=-18288L,
    ),
  )
  assert_eq(result.years(), -17338L)
  assert_eq(result.months(), 3)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-3259465.125, 0.0, 1.125, -37.40000000002328, 52.0, 995081.25],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original subtract random 69" {
  let result = @date.RelativeDelta::new(
    days=-3955130.0,
    hours=385412.625,
    minutes=-9088335.0,
    seconds=4816475.0,
    microseconds=3902903.5,
    years=-5904L,
    months=13563L,
  ).subtract(
    @date.RelativeDelta::new(
      days=703005.875,
      hours=-404192.5,
      minutes=-501072.4,
      seconds=3894974.0,
      microseconds=92177.75,
      years=-11040L,
      months=-18288L,
    ),
  )
  assert_eq(result.years(), 7790L)
  assert_eq(result.months(), 3)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-4631188.875, 0.0, 12.125, -4.599999999976717, 24.0, 810725.75],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original negated 0" {
  let result = @date.RelativeDelta::new().negated()
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), true)
}

///|
test "relative delta original absolute 0" {
  let result = @date.RelativeDelta::new().abs()
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), true)
}

///|
test "relative delta original weeks 0/-1.5" {
  let result = @date.RelativeDelta::new().with_weeks(-1.5)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-10.5, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 0/0.0" {
  let result = @date.RelativeDelta::new().with_weeks(0.0)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), true)
}

///|
test "relative delta original weeks 0/1.25" {
  let result = @date.RelativeDelta::new().with_weeks(1.25)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [8.75, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original timedelta 0/2 days, 23:59:59.999999" {
  let result = @date.RelativeDelta::new().add_timedelta(
    @date.timedelta(days=2, seconds=86399L, microseconds=999999L),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [2.0, 0.0, 23.0, 59.0, 59.0, 999999.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original timedelta 0/-1 day, 23:59:59.999999" {
  let result = @date.RelativeDelta::new().add_timedelta(
    @date.timedelta(days=-1, seconds=86399L, microseconds=999999L),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-1.0, 0.0, 23.0, 59.0, 59.0, 999999.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original negated 1" {
  let result = @date.RelativeDelta::new(
    year=2000,
    month=2,
    day=29,
    hour=1,
    minute=2,
    second=3,
    microsecond=4,
    leapdays=2.5,
    weekday=0,
  ).negated()
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 2.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(2000), Some(2), Some(29), Some(1), Some(2), Some(3), Some(4)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original absolute 1" {
  let result = @date.RelativeDelta::new(
    year=2000,
    month=2,
    day=29,
    hour=1,
    minute=2,
    second=3,
    microsecond=4,
    leapdays=2.5,
    weekday=0,
  ).abs()
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 2.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(2000), Some(2), Some(29), Some(1), Some(2), Some(3), Some(4)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 1/-1.5" {
  let result = @date.RelativeDelta::new(
    year=2000,
    month=2,
    day=29,
    hour=1,
    minute=2,
    second=3,
    microsecond=4,
    leapdays=2.5,
    weekday=0,
  ).with_weeks(-1.5)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-10.5, 2.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(2000), Some(2), Some(29), Some(1), Some(2), Some(3), Some(4)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 1/0.0" {
  let result = @date.RelativeDelta::new(
    year=2000,
    month=2,
    day=29,
    hour=1,
    minute=2,
    second=3,
    microsecond=4,
    leapdays=2.5,
    weekday=0,
  ).with_weeks(0.0)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 2.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(2000), Some(2), Some(29), Some(1), Some(2), Some(3), Some(4)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 1/1.25" {
  let result = @date.RelativeDelta::new(
    year=2000,
    month=2,
    day=29,
    hour=1,
    minute=2,
    second=3,
    microsecond=4,
    leapdays=2.5,
    weekday=0,
  ).with_weeks(1.25)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [8.75, 2.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(2000), Some(2), Some(29), Some(1), Some(2), Some(3), Some(4)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original timedelta 1/2 days, 23:59:59.999999" {
  let result = @date.RelativeDelta::new(
    year=2000,
    month=2,
    day=29,
    hour=1,
    minute=2,
    second=3,
    microsecond=4,
    leapdays=2.5,
    weekday=0,
  ).add_timedelta(@date.timedelta(days=2, seconds=86399L, microseconds=999999L))
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [2.0, 2.5, 23.0, 59.0, 59.0, 999999.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(2000), Some(2), Some(29), Some(1), Some(2), Some(3), Some(4)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original timedelta 1/-1 day, 23:59:59.999999" {
  let result = @date.RelativeDelta::new(
    year=2000,
    month=2,
    day=29,
    hour=1,
    minute=2,
    second=3,
    microsecond=4,
    leapdays=2.5,
    weekday=0,
  ).add_timedelta(
    @date.timedelta(days=-1, seconds=86399L, microseconds=999999L),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-1.0, 2.5, 23.0, 59.0, 59.0, 999999.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(2000), Some(2), Some(29), Some(1), Some(2), Some(3), Some(4)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original negated 2" {
  let result = @date.RelativeDelta::new(
    year=0,
    month=0,
    day=0,
    hour=0,
    minute=0,
    second=0,
    microsecond=0,
    leapdays=-3.5,
    on_weekday=@date.RelativeWeekday::new(6, nth=-2),
  ).negated()
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, -3.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(0), Some(0), Some(0), Some(0), Some(0), Some(0), Some(0)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), Some(-2))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original absolute 2" {
  let result = @date.RelativeDelta::new(
    year=0,
    month=0,
    day=0,
    hour=0,
    minute=0,
    second=0,
    microsecond=0,
    leapdays=-3.5,
    on_weekday=@date.RelativeWeekday::new(6, nth=-2),
  ).abs()
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, -3.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(0), Some(0), Some(0), Some(0), Some(0), Some(0), Some(0)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), Some(-2))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 2/-1.5" {
  let result = @date.RelativeDelta::new(
    year=0,
    month=0,
    day=0,
    hour=0,
    minute=0,
    second=0,
    microsecond=0,
    leapdays=-3.5,
    on_weekday=@date.RelativeWeekday::new(6, nth=-2),
  ).with_weeks(-1.5)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-10.5, -3.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(0), Some(0), Some(0), Some(0), Some(0), Some(0), Some(0)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), Some(-2))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 2/0.0" {
  let result = @date.RelativeDelta::new(
    year=0,
    month=0,
    day=0,
    hour=0,
    minute=0,
    second=0,
    microsecond=0,
    leapdays=-3.5,
    on_weekday=@date.RelativeWeekday::new(6, nth=-2),
  ).with_weeks(0.0)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, -3.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(0), Some(0), Some(0), Some(0), Some(0), Some(0), Some(0)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), Some(-2))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 2/1.25" {
  let result = @date.RelativeDelta::new(
    year=0,
    month=0,
    day=0,
    hour=0,
    minute=0,
    second=0,
    microsecond=0,
    leapdays=-3.5,
    on_weekday=@date.RelativeWeekday::new(6, nth=-2),
  ).with_weeks(1.25)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [8.75, -3.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(0), Some(0), Some(0), Some(0), Some(0), Some(0), Some(0)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), Some(-2))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original timedelta 2/2 days, 23:59:59.999999" {
  let result = @date.RelativeDelta::new(
    year=0,
    month=0,
    day=0,
    hour=0,
    minute=0,
    second=0,
    microsecond=0,
    leapdays=-3.5,
    on_weekday=@date.RelativeWeekday::new(6, nth=-2),
  ).add_timedelta(@date.timedelta(days=2, seconds=86399L, microseconds=999999L))
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [2.0, -3.5, 23.0, 59.0, 59.0, 999999.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(0), Some(0), Some(0), Some(0), Some(0), Some(0), Some(0)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), Some(-2))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original timedelta 2/-1 day, 23:59:59.999999" {
  let result = @date.RelativeDelta::new(
    year=0,
    month=0,
    day=0,
    hour=0,
    minute=0,
    second=0,
    microsecond=0,
    leapdays=-3.5,
    on_weekday=@date.RelativeWeekday::new(6, nth=-2),
  ).add_timedelta(
    @date.timedelta(days=-1, seconds=86399L, microseconds=999999L),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-1.0, -3.5, 23.0, 59.0, 59.0, 999999.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(0), Some(0), Some(0), Some(0), Some(0), Some(0), Some(0)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), Some(-2))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original negated 3" {
  let result = @date.RelativeDelta::new(
    years=3L,
    months=-11L,
    days=1.5,
    hours=-23.5,
    microseconds=-1000000.5,
  ).negated()
  assert_eq(result.years(), -3L)
  assert_eq(result.months(), 11)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-1.5, 0.0, 23.5, 0.0, 1.0, 0.5],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original absolute 3" {
  let result = @date.RelativeDelta::new(
    years=3L,
    months=-11L,
    days=1.5,
    hours=-23.5,
    microseconds=-1000000.5,
  ).abs()
  assert_eq(result.years(), 3L)
  assert_eq(result.months(), 11)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [1.5, 0.0, 23.5, 0.0, 1.0, 0.5],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 3/-1.5" {
  let result = @date.RelativeDelta::new(
    years=3L,
    months=-11L,
    days=1.5,
    hours=-23.5,
    microseconds=-1000000.5,
  ).with_weeks(-1.5)
  assert_eq(result.years(), 3L)
  assert_eq(result.months(), -11)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-9.0, 0.0, -23.5, 0.0, -1.0, -0.5],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 3/0.0" {
  let result = @date.RelativeDelta::new(
    years=3L,
    months=-11L,
    days=1.5,
    hours=-23.5,
    microseconds=-1000000.5,
  ).with_weeks(0.0)
  assert_eq(result.years(), 3L)
  assert_eq(result.months(), -11)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [1.5, 0.0, -23.5, 0.0, -1.0, -0.5],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 3/1.25" {
  let result = @date.RelativeDelta::new(
    years=3L,
    months=-11L,
    days=1.5,
    hours=-23.5,
    microseconds=-1000000.5,
  ).with_weeks(1.25)
  assert_eq(result.years(), 3L)
  assert_eq(result.months(), -11)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [10.25, 0.0, -23.5, 0.0, -1.0, -0.5],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original timedelta 3/2 days, 23:59:59.999999" {
  let result = @date.RelativeDelta::new(
    years=3L,
    months=-11L,
    days=1.5,
    hours=-23.5,
    microseconds=-1000000.5,
  ).add_timedelta(@date.timedelta(days=2, seconds=86399L, microseconds=999999L))
  assert_eq(result.years(), 3L)
  assert_eq(result.months(), -11)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [3.5, 0.0, -0.5, 59.0, 58.0, 999998.5],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original timedelta 3/-1 day, 23:59:59.999999" {
  let result = @date.RelativeDelta::new(
    years=3L,
    months=-11L,
    days=1.5,
    hours=-23.5,
    microseconds=-1000000.5,
  ).add_timedelta(
    @date.timedelta(days=-1, seconds=86399L, microseconds=999999L),
  )
  assert_eq(result.years(), 3L)
  assert_eq(result.months(), -11)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.5, 0.0, -0.5, 59.0, 58.0, 999998.5],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original negated 4" {
  assert_true(
    try {
      ignore(
        @date.RelativeDelta::new(years=-9223372036854775808L, months=11L).negated(),
      )
      false
    } catch {
      _ => true
    },
  )
}

///|
test "relative delta original absolute 4" {
  assert_true(
    try {
      ignore(
        @date.RelativeDelta::new(years=-9223372036854775808L, months=11L).abs(),
      )
      false
    } catch {
      _ => true
    },
  )
}

///|
test "relative delta original weeks 4/-1.5" {
  let result = @date.RelativeDelta::new(years=-9223372036854775808L, months=11L).with_weeks(
    -1.5,
  )
  assert_eq(result.years(), -9223372036854775808L)
  assert_eq(result.months(), 11)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-10.5, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 4/0.0" {
  let result = @date.RelativeDelta::new(years=-9223372036854775808L, months=11L).with_weeks(
    0.0,
  )
  assert_eq(result.years(), -9223372036854775808L)
  assert_eq(result.months(), 11)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 4/1.25" {
  let result = @date.RelativeDelta::new(years=-9223372036854775808L, months=11L).with_weeks(
    1.25,
  )
  assert_eq(result.years(), -9223372036854775808L)
  assert_eq(result.months(), 11)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [8.75, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original timedelta 4/2 days, 23:59:59.999999" {
  let result = @date.RelativeDelta::new(years=-9223372036854775808L, months=11L).add_timedelta(
    @date.timedelta(days=2, seconds=86399L, microseconds=999999L),
  )
  assert_eq(result.years(), -9223372036854775808L)
  assert_eq(result.months(), 11)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [2.0, 0.0, 23.0, 59.0, 59.0, 999999.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original timedelta 4/-1 day, 23:59:59.999999" {
  let result = @date.RelativeDelta::new(years=-9223372036854775808L, months=11L).add_timedelta(
    @date.timedelta(days=-1, seconds=86399L, microseconds=999999L),
  )
  assert_eq(result.years(), -9223372036854775808L)
  assert_eq(result.months(), 11)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-1.0, 0.0, 23.0, 59.0, 59.0, 999999.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original negated 5" {
  let result = @date.RelativeDelta::new(years=9223372036854775807L, months=-11L).negated()
  assert_eq(result.years(), -9223372036854775807L)
  assert_eq(result.months(), 11)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original absolute 5" {
  let result = @date.RelativeDelta::new(years=9223372036854775807L, months=-11L).abs()
  assert_eq(result.years(), 9223372036854775807L)
  assert_eq(result.months(), 11)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 5/-1.5" {
  let result = @date.RelativeDelta::new(years=9223372036854775807L, months=-11L).with_weeks(
    -1.5,
  )
  assert_eq(result.years(), 9223372036854775807L)
  assert_eq(result.months(), -11)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-10.5, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 5/0.0" {
  let result = @date.RelativeDelta::new(years=9223372036854775807L, months=-11L).with_weeks(
    0.0,
  )
  assert_eq(result.years(), 9223372036854775807L)
  assert_eq(result.months(), -11)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 5/1.25" {
  let result = @date.RelativeDelta::new(years=9223372036854775807L, months=-11L).with_weeks(
    1.25,
  )
  assert_eq(result.years(), 9223372036854775807L)
  assert_eq(result.months(), -11)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [8.75, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original timedelta 5/2 days, 23:59:59.999999" {
  let result = @date.RelativeDelta::new(years=9223372036854775807L, months=-11L).add_timedelta(
    @date.timedelta(days=2, seconds=86399L, microseconds=999999L),
  )
  assert_eq(result.years(), 9223372036854775807L)
  assert_eq(result.months(), -11)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [2.0, 0.0, 23.0, 59.0, 59.0, 999999.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original timedelta 5/-1 day, 23:59:59.999999" {
  let result = @date.RelativeDelta::new(years=9223372036854775807L, months=-11L).add_timedelta(
    @date.timedelta(days=-1, seconds=86399L, microseconds=999999L),
  )
  assert_eq(result.years(), 9223372036854775807L)
  assert_eq(result.months(), -11)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-1.0, 0.0, 23.0, 59.0, 59.0, 999999.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original negated 6" {
  let result = @date.RelativeDelta::new(years=1L, months=-1L).negated()
  assert_eq(result.years(), -1L)
  assert_eq(result.months(), 1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original absolute 6" {
  let result = @date.RelativeDelta::new(years=1L, months=-1L).abs()
  assert_eq(result.years(), 1L)
  assert_eq(result.months(), 1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 6/-1.5" {
  let result = @date.RelativeDelta::new(years=1L, months=-1L).with_weeks(-1.5)
  assert_eq(result.years(), 1L)
  assert_eq(result.months(), -1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-10.5, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 6/0.0" {
  let result = @date.RelativeDelta::new(years=1L, months=-1L).with_weeks(0.0)
  assert_eq(result.years(), 1L)
  assert_eq(result.months(), -1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 6/1.25" {
  let result = @date.RelativeDelta::new(years=1L, months=-1L).with_weeks(1.25)
  assert_eq(result.years(), 1L)
  assert_eq(result.months(), -1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [8.75, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original timedelta 6/2 days, 23:59:59.999999" {
  let result = @date.RelativeDelta::new(years=1L, months=-1L).add_timedelta(
    @date.timedelta(days=2, seconds=86399L, microseconds=999999L),
  )
  assert_eq(result.years(), 1L)
  assert_eq(result.months(), -1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [2.0, 0.0, 23.0, 59.0, 59.0, 999999.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original timedelta 6/-1 day, 23:59:59.999999" {
  let result = @date.RelativeDelta::new(years=1L, months=-1L).add_timedelta(
    @date.timedelta(days=-1, seconds=86399L, microseconds=999999L),
  )
  assert_eq(result.years(), 1L)
  assert_eq(result.months(), -1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-1.0, 0.0, 23.0, 59.0, 59.0, 999999.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original negated 7" {
  let result = @date.RelativeDelta::new(years=-1L, months=1L).negated()
  assert_eq(result.years(), 1L)
  assert_eq(result.months(), -1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original absolute 7" {
  let result = @date.RelativeDelta::new(years=-1L, months=1L).abs()
  assert_eq(result.years(), 1L)
  assert_eq(result.months(), 1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 7/-1.5" {
  let result = @date.RelativeDelta::new(years=-1L, months=1L).with_weeks(-1.5)
  assert_eq(result.years(), -1L)
  assert_eq(result.months(), 1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-10.5, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 7/0.0" {
  let result = @date.RelativeDelta::new(years=-1L, months=1L).with_weeks(0.0)
  assert_eq(result.years(), -1L)
  assert_eq(result.months(), 1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 7/1.25" {
  let result = @date.RelativeDelta::new(years=-1L, months=1L).with_weeks(1.25)
  assert_eq(result.years(), -1L)
  assert_eq(result.months(), 1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [8.75, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original timedelta 7/2 days, 23:59:59.999999" {
  let result = @date.RelativeDelta::new(years=-1L, months=1L).add_timedelta(
    @date.timedelta(days=2, seconds=86399L, microseconds=999999L),
  )
  assert_eq(result.years(), -1L)
  assert_eq(result.months(), 1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [2.0, 0.0, 23.0, 59.0, 59.0, 999999.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original timedelta 7/-1 day, 23:59:59.999999" {
  let result = @date.RelativeDelta::new(years=-1L, months=1L).add_timedelta(
    @date.timedelta(days=-1, seconds=86399L, microseconds=999999L),
  )
  assert_eq(result.years(), -1L)
  assert_eq(result.months(), 1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-1.0, 0.0, 23.0, 59.0, 59.0, 999999.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original negated 8" {
  let result = @date.RelativeDelta::new().negated()
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), true)
}

///|
test "relative delta original absolute 8" {
  let result = @date.RelativeDelta::new().abs()
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), true)
}

///|
test "relative delta original weeks 8/-1.5" {
  let result = @date.RelativeDelta::new().with_weeks(-1.5)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-10.5, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 8/0.0" {
  let result = @date.RelativeDelta::new().with_weeks(0.0)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), true)
}

///|
test "relative delta original weeks 8/1.25" {
  let result = @date.RelativeDelta::new().with_weeks(1.25)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [8.75, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original timedelta 8/2 days, 23:59:59.999999" {
  let result = @date.RelativeDelta::new().add_timedelta(
    @date.timedelta(days=2, seconds=86399L, microseconds=999999L),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [2.0, 0.0, 23.0, 59.0, 59.0, 999999.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original timedelta 8/-1 day, 23:59:59.999999" {
  let result = @date.RelativeDelta::new().add_timedelta(
    @date.timedelta(days=-1, seconds=86399L, microseconds=999999L),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-1.0, 0.0, 23.0, 59.0, 59.0, 999999.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original negated 9" {
  let result = @date.RelativeDelta::new(years=1L, months=-13L).negated()
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original absolute 9" {
  let result = @date.RelativeDelta::new(years=1L, months=-13L).abs()
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 9/-1.5" {
  let result = @date.RelativeDelta::new(years=1L, months=-13L).with_weeks(-1.5)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), -1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-10.5, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 9/0.0" {
  let result = @date.RelativeDelta::new(years=1L, months=-13L).with_weeks(0.0)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), -1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 9/1.25" {
  let result = @date.RelativeDelta::new(years=1L, months=-13L).with_weeks(1.25)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), -1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [8.75, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original timedelta 9/2 days, 23:59:59.999999" {
  let result = @date.RelativeDelta::new(years=1L, months=-13L).add_timedelta(
    @date.timedelta(days=2, seconds=86399L, microseconds=999999L),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), -1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [2.0, 0.0, 23.0, 59.0, 59.0, 999999.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original timedelta 9/-1 day, 23:59:59.999999" {
  let result = @date.RelativeDelta::new(years=1L, months=-13L).add_timedelta(
    @date.timedelta(days=-1, seconds=86399L, microseconds=999999L),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), -1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-1.0, 0.0, 23.0, 59.0, 59.0, 999999.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original negated 10" {
  let result = @date.RelativeDelta::new(years=-1L, months=13L).negated()
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), -1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original absolute 10" {
  let result = @date.RelativeDelta::new(years=-1L, months=13L).abs()
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 10/-1.5" {
  let result = @date.RelativeDelta::new(years=-1L, months=13L).with_weeks(-1.5)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-10.5, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 10/0.0" {
  let result = @date.RelativeDelta::new(years=-1L, months=13L).with_weeks(0.0)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 10/1.25" {
  let result = @date.RelativeDelta::new(years=-1L, months=13L).with_weeks(1.25)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [8.75, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original timedelta 10/2 days, 23:59:59.999999" {
  let result = @date.RelativeDelta::new(years=-1L, months=13L).add_timedelta(
    @date.timedelta(days=2, seconds=86399L, microseconds=999999L),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [2.0, 0.0, 23.0, 59.0, 59.0, 999999.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original timedelta 10/-1 day, 23:59:59.999999" {
  let result = @date.RelativeDelta::new(years=-1L, months=13L).add_timedelta(
    @date.timedelta(days=-1, seconds=86399L, microseconds=999999L),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-1.0, 0.0, 23.0, 59.0, 59.0, 999999.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original negated 11" {
  let result = @date.RelativeDelta::new(months=-25L).negated()
  assert_eq(result.years(), 2L)
  assert_eq(result.months(), 1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original absolute 11" {
  let result = @date.RelativeDelta::new(months=-25L).abs()
  assert_eq(result.years(), 2L)
  assert_eq(result.months(), 1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 11/-1.5" {
  let result = @date.RelativeDelta::new(months=-25L).with_weeks(-1.5)
  assert_eq(result.years(), -2L)
  assert_eq(result.months(), -1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-10.5, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 11/0.0" {
  let result = @date.RelativeDelta::new(months=-25L).with_weeks(0.0)
  assert_eq(result.years(), -2L)
  assert_eq(result.months(), -1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 11/1.25" {
  let result = @date.RelativeDelta::new(months=-25L).with_weeks(1.25)
  assert_eq(result.years(), -2L)
  assert_eq(result.months(), -1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [8.75, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original timedelta 11/2 days, 23:59:59.999999" {
  let result = @date.RelativeDelta::new(months=-25L).add_timedelta(
    @date.timedelta(days=2, seconds=86399L, microseconds=999999L),
  )
  assert_eq(result.years(), -2L)
  assert_eq(result.months(), -1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [2.0, 0.0, 23.0, 59.0, 59.0, 999999.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original timedelta 11/-1 day, 23:59:59.999999" {
  let result = @date.RelativeDelta::new(months=-25L).add_timedelta(
    @date.timedelta(days=-1, seconds=86399L, microseconds=999999L),
  )
  assert_eq(result.years(), -2L)
  assert_eq(result.months(), -1)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-1.0, 0.0, 23.0, 59.0, 59.0, 999999.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original negated 12" {
  let result = @date.RelativeDelta::new(days=1.5, hours=2.0).negated()
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-1.5, 0.0, -2.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original absolute 12" {
  let result = @date.RelativeDelta::new(days=1.5, hours=2.0).abs()
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [1.5, 0.0, 2.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 12/-1.5" {
  let result = @date.RelativeDelta::new(days=1.5, hours=2.0).with_weeks(-1.5)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-9.0, 0.0, 2.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 12/0.0" {
  let result = @date.RelativeDelta::new(days=1.5, hours=2.0).with_weeks(0.0)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [1.5, 0.0, 2.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 12/1.25" {
  let result = @date.RelativeDelta::new(days=1.5, hours=2.0).with_weeks(1.25)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [10.25, 0.0, 2.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original timedelta 12/2 days, 23:59:59.999999" {
  let result = @date.RelativeDelta::new(days=1.5, hours=2.0).add_timedelta(
    @date.timedelta(days=2, seconds=86399L, microseconds=999999L),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [4.5, 0.0, 1.0, 59.0, 59.0, 999999.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original timedelta 12/-1 day, 23:59:59.999999" {
  let result = @date.RelativeDelta::new(days=1.5, hours=2.0).add_timedelta(
    @date.timedelta(days=-1, seconds=86399L, microseconds=999999L),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [1.5, 0.0, 1.0, 59.0, 59.0, 999999.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original negated 13" {
  let result = @date.RelativeDelta::new(days=-1.5, hours=2.0).negated()
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [1.5, 0.0, -2.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original absolute 13" {
  let result = @date.RelativeDelta::new(days=-1.5, hours=2.0).abs()
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [1.5, 0.0, 2.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 13/-1.5" {
  let result = @date.RelativeDelta::new(days=-1.5, hours=2.0).with_weeks(-1.5)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-12.0, 0.0, 2.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 13/0.0" {
  let result = @date.RelativeDelta::new(days=-1.5, hours=2.0).with_weeks(0.0)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-1.5, 0.0, 2.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 13/1.25" {
  let result = @date.RelativeDelta::new(days=-1.5, hours=2.0).with_weeks(1.25)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [7.25, 0.0, 2.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original timedelta 13/2 days, 23:59:59.999999" {
  let result = @date.RelativeDelta::new(days=-1.5, hours=2.0).add_timedelta(
    @date.timedelta(days=2, seconds=86399L, microseconds=999999L),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [1.5, 0.0, 1.0, 59.0, 59.0, 999999.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original timedelta 13/-1 day, 23:59:59.999999" {
  let result = @date.RelativeDelta::new(days=-1.5, hours=2.0).add_timedelta(
    @date.timedelta(days=-1, seconds=86399L, microseconds=999999L),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-1.5, 0.0, 1.0, 59.0, 59.0, 999999.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original negated 14" {
  let result = @date.RelativeDelta::new(weeks=-1.5, days=2.25).negated()
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [8.25, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original absolute 14" {
  let result = @date.RelativeDelta::new(weeks=-1.5, days=2.25).abs()
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [8.25, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 14/-1.5" {
  let result = @date.RelativeDelta::new(weeks=-1.5, days=2.25).with_weeks(-1.5)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-11.75, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 14/0.0" {
  let result = @date.RelativeDelta::new(weeks=-1.5, days=2.25).with_weeks(0.0)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-1.25, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 14/1.25" {
  let result = @date.RelativeDelta::new(weeks=-1.5, days=2.25).with_weeks(1.25)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [7.5, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original timedelta 14/2 days, 23:59:59.999999" {
  let result = @date.RelativeDelta::new(weeks=-1.5, days=2.25).add_timedelta(
    @date.timedelta(days=2, seconds=86399L, microseconds=999999L),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-6.25, 0.0, 23.0, 59.0, 59.0, 999999.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original timedelta 14/-1 day, 23:59:59.999999" {
  let result = @date.RelativeDelta::new(weeks=-1.5, days=2.25).add_timedelta(
    @date.timedelta(days=-1, seconds=86399L, microseconds=999999L),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-9.25, 0.0, 23.0, 59.0, 59.0, 999999.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original negated 15" {
  let result = @date.RelativeDelta::new(microseconds=-1000001.5).negated()
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 1.0, 1.5],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original absolute 15" {
  let result = @date.RelativeDelta::new(microseconds=-1000001.5).abs()
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 1.0, 1.5],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 15/-1.5" {
  let result = @date.RelativeDelta::new(microseconds=-1000001.5).with_weeks(
    -1.5,
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-10.5, 0.0, 0.0, 0.0, -1.0, -1.5],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 15/0.0" {
  let result = @date.RelativeDelta::new(microseconds=-1000001.5).with_weeks(0.0)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, -1.0, -1.5],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 15/1.25" {
  let result = @date.RelativeDelta::new(microseconds=-1000001.5).with_weeks(
    1.25,
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [8.75, 0.0, 0.0, 0.0, -1.0, -1.5],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original timedelta 15/2 days, 23:59:59.999999" {
  let result = @date.RelativeDelta::new(microseconds=-1000001.5).add_timedelta(
    @date.timedelta(days=2, seconds=86399L, microseconds=999999L),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [2.0, 0.0, 23.0, 59.0, 58.0, 999997.5],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original timedelta 15/-1 day, 23:59:59.999999" {
  let result = @date.RelativeDelta::new(microseconds=-1000001.5).add_timedelta(
    @date.timedelta(days=-1, seconds=86399L, microseconds=999999L),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-1.0, 0.0, 23.0, 59.0, 58.0, 999997.5],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original negated 16" {
  let result = @date.RelativeDelta::new(
    hours=-24.5,
    minutes=150.25,
    seconds=-3601.125,
  ).negated()
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 23.5, -30.25, 1.125, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original absolute 16" {
  let result = @date.RelativeDelta::new(
    hours=-24.5,
    minutes=150.25,
    seconds=-3601.125,
  ).abs()
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 23.5, 30.25, 1.125, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 16/-1.5" {
  let result = @date.RelativeDelta::new(
    hours=-24.5,
    minutes=150.25,
    seconds=-3601.125,
  ).with_weeks(-1.5)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-10.5, 0.0, -23.5, 30.25, -1.125, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 16/0.0" {
  let result = @date.RelativeDelta::new(
    hours=-24.5,
    minutes=150.25,
    seconds=-3601.125,
  ).with_weeks(0.0)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, -23.5, 30.25, -1.125, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 16/1.25" {
  let result = @date.RelativeDelta::new(
    hours=-24.5,
    minutes=150.25,
    seconds=-3601.125,
  ).with_weeks(1.25)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [8.75, 0.0, -23.5, 30.25, -1.125, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original timedelta 16/2 days, 23:59:59.999999" {
  let result = @date.RelativeDelta::new(
    hours=-24.5,
    minutes=150.25,
    seconds=-3601.125,
  ).add_timedelta(@date.timedelta(days=2, seconds=86399L, microseconds=999999L))
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [2.0, 0.0, 0.5, 29.25, 57.875, 999999.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original timedelta 16/-1 day, 23:59:59.999999" {
  let result = @date.RelativeDelta::new(
    hours=-24.5,
    minutes=150.25,
    seconds=-3601.125,
  ).add_timedelta(
    @date.timedelta(days=-1, seconds=86399L, microseconds=999999L),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-1.0, 0.0, 0.5, 29.25, 57.875, 999999.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original negated 17" {
  let result = @date.RelativeDelta::new(
    years=-9223372036854775808L,
    months=9223372036854775807L,
  ).negated()
  assert_eq(result.years(), 8454757700450211158L)
  assert_eq(result.months(), -7)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original absolute 17" {
  let result = @date.RelativeDelta::new(
    years=-9223372036854775808L,
    months=9223372036854775807L,
  ).abs()
  assert_eq(result.years(), 8454757700450211158L)
  assert_eq(result.months(), 7)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 17/-1.5" {
  let result = @date.RelativeDelta::new(
    years=-9223372036854775808L,
    months=9223372036854775807L,
  ).with_weeks(-1.5)
  assert_eq(result.years(), -8454757700450211158L)
  assert_eq(result.months(), 7)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-10.5, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 17/0.0" {
  let result = @date.RelativeDelta::new(
    years=-9223372036854775808L,
    months=9223372036854775807L,
  ).with_weeks(0.0)
  assert_eq(result.years(), -8454757700450211158L)
  assert_eq(result.months(), 7)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 17/1.25" {
  let result = @date.RelativeDelta::new(
    years=-9223372036854775808L,
    months=9223372036854775807L,
  ).with_weeks(1.25)
  assert_eq(result.years(), -8454757700450211158L)
  assert_eq(result.months(), 7)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [8.75, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original timedelta 17/2 days, 23:59:59.999999" {
  let result = @date.RelativeDelta::new(
    years=-9223372036854775808L,
    months=9223372036854775807L,
  ).add_timedelta(@date.timedelta(days=2, seconds=86399L, microseconds=999999L))
  assert_eq(result.years(), -8454757700450211158L)
  assert_eq(result.months(), 7)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [2.0, 0.0, 23.0, 59.0, 59.0, 999999.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original timedelta 17/-1 day, 23:59:59.999999" {
  let result = @date.RelativeDelta::new(
    years=-9223372036854775808L,
    months=9223372036854775807L,
  ).add_timedelta(
    @date.timedelta(days=-1, seconds=86399L, microseconds=999999L),
  )
  assert_eq(result.years(), -8454757700450211158L)
  assert_eq(result.months(), 7)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-1.0, 0.0, 23.0, 59.0, 59.0, 999999.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original negated 18" {
  let result = @date.RelativeDelta::new(months=-9223372036854775808L).negated()
  assert_eq(result.years(), 768614336404564650L)
  assert_eq(result.months(), 8)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original absolute 18" {
  let result = @date.RelativeDelta::new(months=-9223372036854775808L).abs()
  assert_eq(result.years(), 768614336404564650L)
  assert_eq(result.months(), 8)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 18/-1.5" {
  let result = @date.RelativeDelta::new(months=-9223372036854775808L).with_weeks(
    -1.5,
  )
  assert_eq(result.years(), -768614336404564650L)
  assert_eq(result.months(), -8)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-10.5, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 18/0.0" {
  let result = @date.RelativeDelta::new(months=-9223372036854775808L).with_weeks(
    0.0,
  )
  assert_eq(result.years(), -768614336404564650L)
  assert_eq(result.months(), -8)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 18/1.25" {
  let result = @date.RelativeDelta::new(months=-9223372036854775808L).with_weeks(
    1.25,
  )
  assert_eq(result.years(), -768614336404564650L)
  assert_eq(result.months(), -8)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [8.75, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original timedelta 18/2 days, 23:59:59.999999" {
  let result = @date.RelativeDelta::new(months=-9223372036854775808L).add_timedelta(
    @date.timedelta(days=2, seconds=86399L, microseconds=999999L),
  )
  assert_eq(result.years(), -768614336404564650L)
  assert_eq(result.months(), -8)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [2.0, 0.0, 23.0, 59.0, 59.0, 999999.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original timedelta 18/-1 day, 23:59:59.999999" {
  let result = @date.RelativeDelta::new(months=-9223372036854775808L).add_timedelta(
    @date.timedelta(days=-1, seconds=86399L, microseconds=999999L),
  )
  assert_eq(result.years(), -768614336404564650L)
  assert_eq(result.months(), -8)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-1.0, 0.0, 23.0, 59.0, 59.0, 999999.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original negated 19" {
  let result = @date.RelativeDelta::new(years=9223372036854775807L, months=-12L).negated()
  assert_eq(result.years(), -9223372036854775806L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original absolute 19" {
  let result = @date.RelativeDelta::new(years=9223372036854775807L, months=-12L).abs()
  assert_eq(result.years(), 9223372036854775806L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 19/-1.5" {
  let result = @date.RelativeDelta::new(years=9223372036854775807L, months=-12L).with_weeks(
    -1.5,
  )
  assert_eq(result.years(), 9223372036854775806L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-10.5, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 19/0.0" {
  let result = @date.RelativeDelta::new(years=9223372036854775807L, months=-12L).with_weeks(
    0.0,
  )
  assert_eq(result.years(), 9223372036854775806L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 19/1.25" {
  let result = @date.RelativeDelta::new(years=9223372036854775807L, months=-12L).with_weeks(
    1.25,
  )
  assert_eq(result.years(), 9223372036854775806L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [8.75, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original timedelta 19/2 days, 23:59:59.999999" {
  let result = @date.RelativeDelta::new(years=9223372036854775807L, months=-12L).add_timedelta(
    @date.timedelta(days=2, seconds=86399L, microseconds=999999L),
  )
  assert_eq(result.years(), 9223372036854775806L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [2.0, 0.0, 23.0, 59.0, 59.0, 999999.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original timedelta 19/-1 day, 23:59:59.999999" {
  let result = @date.RelativeDelta::new(years=9223372036854775807L, months=-12L).add_timedelta(
    @date.timedelta(days=-1, seconds=86399L, microseconds=999999L),
  )
  assert_eq(result.years(), 9223372036854775806L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-1.0, 0.0, 23.0, 59.0, 59.0, 999999.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original negated 20" {
  let result = @date.RelativeDelta::new(
    year=0,
    month=0,
    day=0,
    hour=0,
    microsecond=0,
  ).negated()
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(0), Some(0), Some(0), Some(0), None, None, Some(0)],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original absolute 20" {
  let result = @date.RelativeDelta::new(
    year=0,
    month=0,
    day=0,
    hour=0,
    microsecond=0,
  ).abs()
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(0), Some(0), Some(0), Some(0), None, None, Some(0)],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 20/-1.5" {
  let result = @date.RelativeDelta::new(
    year=0,
    month=0,
    day=0,
    hour=0,
    microsecond=0,
  ).with_weeks(-1.5)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-10.5, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(0), Some(0), Some(0), Some(0), None, None, Some(0)],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 20/0.0" {
  let result = @date.RelativeDelta::new(
    year=0,
    month=0,
    day=0,
    hour=0,
    microsecond=0,
  ).with_weeks(0.0)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(0), Some(0), Some(0), Some(0), None, None, Some(0)],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 20/1.25" {
  let result = @date.RelativeDelta::new(
    year=0,
    month=0,
    day=0,
    hour=0,
    microsecond=0,
  ).with_weeks(1.25)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [8.75, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(0), Some(0), Some(0), Some(0), None, None, Some(0)],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original timedelta 20/2 days, 23:59:59.999999" {
  let result = @date.RelativeDelta::new(
    year=0,
    month=0,
    day=0,
    hour=0,
    microsecond=0,
  ).add_timedelta(@date.timedelta(days=2, seconds=86399L, microseconds=999999L))
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [2.0, 0.0, 23.0, 59.0, 59.0, 999999.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(0), Some(0), Some(0), Some(0), None, None, Some(0)],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original timedelta 20/-1 day, 23:59:59.999999" {
  let result = @date.RelativeDelta::new(
    year=0,
    month=0,
    day=0,
    hour=0,
    microsecond=0,
  ).add_timedelta(
    @date.timedelta(days=-1, seconds=86399L, microseconds=999999L),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-1.0, 0.0, 23.0, 59.0, 59.0, 999999.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(0), Some(0), Some(0), Some(0), None, None, Some(0)],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original negated 21" {
  let result = @date.RelativeDelta::new(
    year=-1,
    month=13,
    day=-1,
    hour=24,
    second=60,
    microsecond=1000000,
  ).negated()
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(-1), Some(13), Some(-1), Some(24), None, Some(60), Some(1000000)],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original absolute 21" {
  let result = @date.RelativeDelta::new(
    year=-1,
    month=13,
    day=-1,
    hour=24,
    second=60,
    microsecond=1000000,
  ).abs()
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(-1), Some(13), Some(-1), Some(24), None, Some(60), Some(1000000)],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 21/-1.5" {
  let result = @date.RelativeDelta::new(
    year=-1,
    month=13,
    day=-1,
    hour=24,
    second=60,
    microsecond=1000000,
  ).with_weeks(-1.5)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-10.5, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(-1), Some(13), Some(-1), Some(24), None, Some(60), Some(1000000)],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 21/0.0" {
  let result = @date.RelativeDelta::new(
    year=-1,
    month=13,
    day=-1,
    hour=24,
    second=60,
    microsecond=1000000,
  ).with_weeks(0.0)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(-1), Some(13), Some(-1), Some(24), None, Some(60), Some(1000000)],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 21/1.25" {
  let result = @date.RelativeDelta::new(
    year=-1,
    month=13,
    day=-1,
    hour=24,
    second=60,
    microsecond=1000000,
  ).with_weeks(1.25)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [8.75, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(-1), Some(13), Some(-1), Some(24), None, Some(60), Some(1000000)],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original timedelta 21/2 days, 23:59:59.999999" {
  let result = @date.RelativeDelta::new(
    year=-1,
    month=13,
    day=-1,
    hour=24,
    second=60,
    microsecond=1000000,
  ).add_timedelta(@date.timedelta(days=2, seconds=86399L, microseconds=999999L))
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [2.0, 0.0, 23.0, 59.0, 59.0, 999999.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(-1), Some(13), Some(-1), Some(24), None, Some(60), Some(1000000)],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original timedelta 21/-1 day, 23:59:59.999999" {
  let result = @date.RelativeDelta::new(
    year=-1,
    month=13,
    day=-1,
    hour=24,
    second=60,
    microsecond=1000000,
  ).add_timedelta(
    @date.timedelta(days=-1, seconds=86399L, microseconds=999999L),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-1.0, 0.0, 23.0, 59.0, 59.0, 999999.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(-1), Some(13), Some(-1), Some(24), None, Some(60), Some(1000000)],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original negated 22" {
  let result = @date.RelativeDelta::new(
    days=1.0e+100,
    hours=-1.0e+99,
    microseconds=1.0e+250,
  ).negated()
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-1.1574074074074075e+239, 0.0, -16.0, -12.0, -36.0, -276800.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original absolute 22" {
  let result = @date.RelativeDelta::new(
    days=1.0e+100,
    hours=-1.0e+99,
    microseconds=1.0e+250,
  ).abs()
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [1.1574074074074075e+239, 0.0, 16.0, 12.0, 36.0, 276800.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 22/-1.5" {
  let result = @date.RelativeDelta::new(
    days=1.0e+100,
    hours=-1.0e+99,
    microseconds=1.0e+250,
  ).with_weeks(-1.5)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-10.5, 0.0, 16.0, 12.0, 36.0, 276800.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 22/0.0" {
  let result = @date.RelativeDelta::new(
    days=1.0e+100,
    hours=-1.0e+99,
    microseconds=1.0e+250,
  ).with_weeks(0.0)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 16.0, 12.0, 36.0, 276800.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 22/1.25" {
  let result = @date.RelativeDelta::new(
    days=1.0e+100,
    hours=-1.0e+99,
    microseconds=1.0e+250,
  ).with_weeks(1.25)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [8.75, 0.0, 16.0, 12.0, 36.0, 276800.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original timedelta 22/2 days, 23:59:59.999999" {
  let result = @date.RelativeDelta::new(
    days=1.0e+100,
    hours=-1.0e+99,
    microseconds=1.0e+250,
  ).add_timedelta(@date.timedelta(days=2, seconds=86399L, microseconds=999999L))
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [1.1574074074074075e+239, 0.0, 16.0, 12.0, 36.0, 276799.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original timedelta 22/-1 day, 23:59:59.999999" {
  let result = @date.RelativeDelta::new(
    days=1.0e+100,
    hours=-1.0e+99,
    microseconds=1.0e+250,
  ).add_timedelta(
    @date.timedelta(days=-1, seconds=86399L, microseconds=999999L),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [1.1574074074074075e+239, 0.0, 16.0, 12.0, 36.0, 276799.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original negated 23" {
  let result = @date.RelativeDelta::new(weekday=-7).negated()
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original absolute 23" {
  let result = @date.RelativeDelta::new(weekday=-7).abs()
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 23/-1.5" {
  let result = @date.RelativeDelta::new(weekday=-7).with_weeks(-1.5)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-10.5, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 23/0.0" {
  let result = @date.RelativeDelta::new(weekday=-7).with_weeks(0.0)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 23/1.25" {
  let result = @date.RelativeDelta::new(weekday=-7).with_weeks(1.25)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [8.75, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original timedelta 23/2 days, 23:59:59.999999" {
  let result = @date.RelativeDelta::new(weekday=-7).add_timedelta(
    @date.timedelta(days=2, seconds=86399L, microseconds=999999L),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [2.0, 0.0, 23.0, 59.0, 59.0, 999999.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original timedelta 23/-1 day, 23:59:59.999999" {
  let result = @date.RelativeDelta::new(weekday=-7).add_timedelta(
    @date.timedelta(days=-1, seconds=86399L, microseconds=999999L),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-1.0, 0.0, 23.0, 59.0, 59.0, 999999.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original negated 24" {
  let result = @date.RelativeDelta::new(weekday=-1).negated()
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original absolute 24" {
  let result = @date.RelativeDelta::new(weekday=-1).abs()
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 24/-1.5" {
  let result = @date.RelativeDelta::new(weekday=-1).with_weeks(-1.5)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-10.5, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 24/0.0" {
  let result = @date.RelativeDelta::new(weekday=-1).with_weeks(0.0)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 24/1.25" {
  let result = @date.RelativeDelta::new(weekday=-1).with_weeks(1.25)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [8.75, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original timedelta 24/2 days, 23:59:59.999999" {
  let result = @date.RelativeDelta::new(weekday=-1).add_timedelta(
    @date.timedelta(days=2, seconds=86399L, microseconds=999999L),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [2.0, 0.0, 23.0, 59.0, 59.0, 999999.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original timedelta 24/-1 day, 23:59:59.999999" {
  let result = @date.RelativeDelta::new(weekday=-1).add_timedelta(
    @date.timedelta(days=-1, seconds=86399L, microseconds=999999L),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-1.0, 0.0, 23.0, 59.0, 59.0, 999999.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original negated 25" {
  let result = @date.RelativeDelta::new(weekday=0).negated()
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original absolute 25" {
  let result = @date.RelativeDelta::new(weekday=0).abs()
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 25/-1.5" {
  let result = @date.RelativeDelta::new(weekday=0).with_weeks(-1.5)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-10.5, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 25/0.0" {
  let result = @date.RelativeDelta::new(weekday=0).with_weeks(0.0)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 25/1.25" {
  let result = @date.RelativeDelta::new(weekday=0).with_weeks(1.25)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [8.75, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original timedelta 25/2 days, 23:59:59.999999" {
  let result = @date.RelativeDelta::new(weekday=0).add_timedelta(
    @date.timedelta(days=2, seconds=86399L, microseconds=999999L),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [2.0, 0.0, 23.0, 59.0, 59.0, 999999.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original timedelta 25/-1 day, 23:59:59.999999" {
  let result = @date.RelativeDelta::new(weekday=0).add_timedelta(
    @date.timedelta(days=-1, seconds=86399L, microseconds=999999L),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-1.0, 0.0, 23.0, 59.0, 59.0, 999999.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original negated 26" {
  let result = @date.RelativeDelta::new(weekday=6).negated()
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original absolute 26" {
  let result = @date.RelativeDelta::new(weekday=6).abs()
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 26/-1.5" {
  let result = @date.RelativeDelta::new(weekday=6).with_weeks(-1.5)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-10.5, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 26/0.0" {
  let result = @date.RelativeDelta::new(weekday=6).with_weeks(0.0)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 26/1.25" {
  let result = @date.RelativeDelta::new(weekday=6).with_weeks(1.25)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [8.75, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original timedelta 26/2 days, 23:59:59.999999" {
  let result = @date.RelativeDelta::new(weekday=6).add_timedelta(
    @date.timedelta(days=2, seconds=86399L, microseconds=999999L),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [2.0, 0.0, 23.0, 59.0, 59.0, 999999.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original timedelta 26/-1 day, 23:59:59.999999" {
  let result = @date.RelativeDelta::new(weekday=6).add_timedelta(
    @date.timedelta(days=-1, seconds=86399L, microseconds=999999L),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-1.0, 0.0, 23.0, 59.0, 59.0, 999999.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original negated 27" {
  let result = @date.RelativeDelta::new(
    on_weekday=@date.RelativeWeekday::new(0),
  ).negated()
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original absolute 27" {
  let result = @date.RelativeDelta::new(
    on_weekday=@date.RelativeWeekday::new(0),
  ).abs()
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 27/-1.5" {
  let result = @date.RelativeDelta::new(
    on_weekday=@date.RelativeWeekday::new(0),
  ).with_weeks(-1.5)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-10.5, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 27/0.0" {
  let result = @date.RelativeDelta::new(
    on_weekday=@date.RelativeWeekday::new(0),
  ).with_weeks(0.0)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 27/1.25" {
  let result = @date.RelativeDelta::new(
    on_weekday=@date.RelativeWeekday::new(0),
  ).with_weeks(1.25)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [8.75, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original timedelta 27/2 days, 23:59:59.999999" {
  let result = @date.RelativeDelta::new(
    on_weekday=@date.RelativeWeekday::new(0),
  ).add_timedelta(@date.timedelta(days=2, seconds=86399L, microseconds=999999L))
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [2.0, 0.0, 23.0, 59.0, 59.0, 999999.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original timedelta 27/-1 day, 23:59:59.999999" {
  let result = @date.RelativeDelta::new(
    on_weekday=@date.RelativeWeekday::new(0),
  ).add_timedelta(
    @date.timedelta(days=-1, seconds=86399L, microseconds=999999L),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-1.0, 0.0, 23.0, 59.0, 59.0, 999999.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original negated 28" {
  let result = @date.RelativeDelta::new(
    on_weekday=@date.RelativeWeekday::new(0, nth=0),
  ).negated()
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), Some(0))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original absolute 28" {
  let result = @date.RelativeDelta::new(
    on_weekday=@date.RelativeWeekday::new(0, nth=0),
  ).abs()
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), Some(0))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 28/-1.5" {
  let result = @date.RelativeDelta::new(
    on_weekday=@date.RelativeWeekday::new(0, nth=0),
  ).with_weeks(-1.5)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-10.5, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), Some(0))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 28/0.0" {
  let result = @date.RelativeDelta::new(
    on_weekday=@date.RelativeWeekday::new(0, nth=0),
  ).with_weeks(0.0)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), Some(0))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 28/1.25" {
  let result = @date.RelativeDelta::new(
    on_weekday=@date.RelativeWeekday::new(0, nth=0),
  ).with_weeks(1.25)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [8.75, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), Some(0))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original timedelta 28/2 days, 23:59:59.999999" {
  let result = @date.RelativeDelta::new(
    on_weekday=@date.RelativeWeekday::new(0, nth=0),
  ).add_timedelta(@date.timedelta(days=2, seconds=86399L, microseconds=999999L))
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [2.0, 0.0, 23.0, 59.0, 59.0, 999999.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), Some(0))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original timedelta 28/-1 day, 23:59:59.999999" {
  let result = @date.RelativeDelta::new(
    on_weekday=@date.RelativeWeekday::new(0, nth=0),
  ).add_timedelta(
    @date.timedelta(days=-1, seconds=86399L, microseconds=999999L),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-1.0, 0.0, 23.0, 59.0, 59.0, 999999.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), Some(0))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original negated 29" {
  let result = @date.RelativeDelta::new(
    on_weekday=@date.RelativeWeekday::new(0, nth=1),
  ).negated()
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), Some(1))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original absolute 29" {
  let result = @date.RelativeDelta::new(
    on_weekday=@date.RelativeWeekday::new(0, nth=1),
  ).abs()
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), Some(1))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 29/-1.5" {
  let result = @date.RelativeDelta::new(
    on_weekday=@date.RelativeWeekday::new(0, nth=1),
  ).with_weeks(-1.5)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-10.5, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), Some(1))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 29/0.0" {
  let result = @date.RelativeDelta::new(
    on_weekday=@date.RelativeWeekday::new(0, nth=1),
  ).with_weeks(0.0)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), Some(1))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 29/1.25" {
  let result = @date.RelativeDelta::new(
    on_weekday=@date.RelativeWeekday::new(0, nth=1),
  ).with_weeks(1.25)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [8.75, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), Some(1))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original timedelta 29/2 days, 23:59:59.999999" {
  let result = @date.RelativeDelta::new(
    on_weekday=@date.RelativeWeekday::new(0, nth=1),
  ).add_timedelta(@date.timedelta(days=2, seconds=86399L, microseconds=999999L))
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [2.0, 0.0, 23.0, 59.0, 59.0, 999999.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), Some(1))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original timedelta 29/-1 day, 23:59:59.999999" {
  let result = @date.RelativeDelta::new(
    on_weekday=@date.RelativeWeekday::new(0, nth=1),
  ).add_timedelta(
    @date.timedelta(days=-1, seconds=86399L, microseconds=999999L),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-1.0, 0.0, 23.0, 59.0, 59.0, 999999.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), Some(1))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original negated 30" {
  let result = @date.RelativeDelta::new(
    on_weekday=@date.RelativeWeekday::new(6, nth=-2),
  ).negated()
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), Some(-2))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original absolute 30" {
  let result = @date.RelativeDelta::new(
    on_weekday=@date.RelativeWeekday::new(6, nth=-2),
  ).abs()
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), Some(-2))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 30/-1.5" {
  let result = @date.RelativeDelta::new(
    on_weekday=@date.RelativeWeekday::new(6, nth=-2),
  ).with_weeks(-1.5)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-10.5, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), Some(-2))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 30/0.0" {
  let result = @date.RelativeDelta::new(
    on_weekday=@date.RelativeWeekday::new(6, nth=-2),
  ).with_weeks(0.0)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), Some(-2))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 30/1.25" {
  let result = @date.RelativeDelta::new(
    on_weekday=@date.RelativeWeekday::new(6, nth=-2),
  ).with_weeks(1.25)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [8.75, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), Some(-2))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original timedelta 30/2 days, 23:59:59.999999" {
  let result = @date.RelativeDelta::new(
    on_weekday=@date.RelativeWeekday::new(6, nth=-2),
  ).add_timedelta(@date.timedelta(days=2, seconds=86399L, microseconds=999999L))
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [2.0, 0.0, 23.0, 59.0, 59.0, 999999.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), Some(-2))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original timedelta 30/-1 day, 23:59:59.999999" {
  let result = @date.RelativeDelta::new(
    on_weekday=@date.RelativeWeekday::new(6, nth=-2),
  ).add_timedelta(
    @date.timedelta(days=-1, seconds=86399L, microseconds=999999L),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-1.0, 0.0, 23.0, 59.0, 59.0, 999999.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), Some(-2))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original negated 31" {
  let result = @date.RelativeDelta::new(
    on_weekday=@date.RelativeWeekday::new(-2147483648, nth=2147483647),
  ).negated()
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), -2147483648)
  assert_eq(result.weekday().unwrap().nth(), Some(2147483647))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original absolute 31" {
  let result = @date.RelativeDelta::new(
    on_weekday=@date.RelativeWeekday::new(-2147483648, nth=2147483647),
  ).abs()
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), -2147483648)
  assert_eq(result.weekday().unwrap().nth(), Some(2147483647))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 31/-1.5" {
  let result = @date.RelativeDelta::new(
    on_weekday=@date.RelativeWeekday::new(-2147483648, nth=2147483647),
  ).with_weeks(-1.5)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-10.5, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), -2147483648)
  assert_eq(result.weekday().unwrap().nth(), Some(2147483647))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 31/0.0" {
  let result = @date.RelativeDelta::new(
    on_weekday=@date.RelativeWeekday::new(-2147483648, nth=2147483647),
  ).with_weeks(0.0)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), -2147483648)
  assert_eq(result.weekday().unwrap().nth(), Some(2147483647))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 31/1.25" {
  let result = @date.RelativeDelta::new(
    on_weekday=@date.RelativeWeekday::new(-2147483648, nth=2147483647),
  ).with_weeks(1.25)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [8.75, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), -2147483648)
  assert_eq(result.weekday().unwrap().nth(), Some(2147483647))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original timedelta 31/2 days, 23:59:59.999999" {
  let result = @date.RelativeDelta::new(
    on_weekday=@date.RelativeWeekday::new(-2147483648, nth=2147483647),
  ).add_timedelta(@date.timedelta(days=2, seconds=86399L, microseconds=999999L))
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [2.0, 0.0, 23.0, 59.0, 59.0, 999999.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), -2147483648)
  assert_eq(result.weekday().unwrap().nth(), Some(2147483647))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original timedelta 31/-1 day, 23:59:59.999999" {
  let result = @date.RelativeDelta::new(
    on_weekday=@date.RelativeWeekday::new(-2147483648, nth=2147483647),
  ).add_timedelta(
    @date.timedelta(days=-1, seconds=86399L, microseconds=999999L),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-1.0, 0.0, 23.0, 59.0, 59.0, 999999.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), -2147483648)
  assert_eq(result.weekday().unwrap().nth(), Some(2147483647))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original negated 32" {
  let result = @date.RelativeDelta::new(microseconds=999999.9999999999).negated()
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, -0.0, -999999.9999999999],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original absolute 32" {
  let result = @date.RelativeDelta::new(microseconds=999999.9999999999).abs()
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 999999.9999999999],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 32/-1.5" {
  let result = @date.RelativeDelta::new(microseconds=999999.9999999999).with_weeks(
    -1.5,
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-10.5, 0.0, 0.0, 0.0, 0.0, 999999.9999999999],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 32/0.0" {
  let result = @date.RelativeDelta::new(microseconds=999999.9999999999).with_weeks(
    0.0,
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 999999.9999999999],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 32/1.25" {
  let result = @date.RelativeDelta::new(microseconds=999999.9999999999).with_weeks(
    1.25,
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [8.75, 0.0, 0.0, 0.0, 0.0, 999999.9999999999],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original timedelta 32/2 days, 23:59:59.999999" {
  let result = @date.RelativeDelta::new(microseconds=999999.9999999999).add_timedelta(
    @date.timedelta(days=2, seconds=86399L, microseconds=999999L),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [3.0, 0.0, 0.0, 0.0, 0.0, 999999.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original timedelta 32/-1 day, 23:59:59.999999" {
  let result = @date.RelativeDelta::new(microseconds=999999.9999999999).add_timedelta(
    @date.timedelta(days=-1, seconds=86399L, microseconds=999999L),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 999999.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original negated 33" {
  let result = @date.RelativeDelta::new(days=1.0e+100, hours=-23.5).negated()
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-1.0e+100, 0.0, 23.5, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original absolute 33" {
  let result = @date.RelativeDelta::new(days=1.0e+100, hours=-23.5).abs()
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [1.0e+100, 0.0, 23.5, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 33/-1.5" {
  let result = @date.RelativeDelta::new(days=1.0e+100, hours=-23.5).with_weeks(
    -1.5,
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-10.5, 0.0, -23.5, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 33/0.0" {
  let result = @date.RelativeDelta::new(days=1.0e+100, hours=-23.5).with_weeks(
    0.0,
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, -23.5, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 33/1.25" {
  let result = @date.RelativeDelta::new(days=1.0e+100, hours=-23.5).with_weeks(
    1.25,
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [8.75, 0.0, -23.5, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original timedelta 33/2 days, 23:59:59.999999" {
  let result = @date.RelativeDelta::new(days=1.0e+100, hours=-23.5).add_timedelta(
    @date.timedelta(days=2, seconds=86399L, microseconds=999999L),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [1.0e+100, 0.0, -0.5, 59.0, 59.0, 999999.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original timedelta 33/-1 day, 23:59:59.999999" {
  let result = @date.RelativeDelta::new(days=1.0e+100, hours=-23.5).add_timedelta(
    @date.timedelta(days=-1, seconds=86399L, microseconds=999999L),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [1.0e+100, 0.0, -0.5, 59.0, 59.0, 999999.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original negated 34" {
  let result = @date.RelativeDelta::new(
    leapdays=0.25,
    day=0,
    on_weekday=@date.RelativeWeekday::new(0, nth=0),
  ).negated()
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.25, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, Some(0), None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), Some(0))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original absolute 34" {
  let result = @date.RelativeDelta::new(
    leapdays=0.25,
    day=0,
    on_weekday=@date.RelativeWeekday::new(0, nth=0),
  ).abs()
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.25, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, Some(0), None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), Some(0))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 34/-1.5" {
  let result = @date.RelativeDelta::new(
    leapdays=0.25,
    day=0,
    on_weekday=@date.RelativeWeekday::new(0, nth=0),
  ).with_weeks(-1.5)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-10.5, 0.25, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, Some(0), None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), Some(0))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 34/0.0" {
  let result = @date.RelativeDelta::new(
    leapdays=0.25,
    day=0,
    on_weekday=@date.RelativeWeekday::new(0, nth=0),
  ).with_weeks(0.0)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.25, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, Some(0), None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), Some(0))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original weeks 34/1.25" {
  let result = @date.RelativeDelta::new(
    leapdays=0.25,
    day=0,
    on_weekday=@date.RelativeWeekday::new(0, nth=0),
  ).with_weeks(1.25)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [8.75, 0.25, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, Some(0), None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), Some(0))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original timedelta 34/2 days, 23:59:59.999999" {
  let result = @date.RelativeDelta::new(
    leapdays=0.25,
    day=0,
    on_weekday=@date.RelativeWeekday::new(0, nth=0),
  ).add_timedelta(@date.timedelta(days=2, seconds=86399L, microseconds=999999L))
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [2.0, 0.25, 23.0, 59.0, 59.0, 999999.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, Some(0), None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), Some(0))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original timedelta 34/-1 day, 23:59:59.999999" {
  let result = @date.RelativeDelta::new(
    leapdays=0.25,
    day=0,
    on_weekday=@date.RelativeWeekday::new(0, nth=0),
  ).add_timedelta(
    @date.timedelta(days=-1, seconds=86399L, microseconds=999999L),
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-1.0, 0.25, 23.0, 59.0, 59.0, 999999.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, Some(0), None, None, None, None],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), Some(0))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original scaled 0/-2.0" {
  let result = @date.RelativeDelta::new().scaled(-2.0)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), true)
}

///|
test "relative delta original divided 0/-2.0" {
  let result = @date.RelativeDelta::new().divided(-2.0)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), true)
}

///|
test "relative delta original scaled 0/-0.5" {
  let result = @date.RelativeDelta::new().scaled(-0.5)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), true)
}

///|
test "relative delta original divided 0/-0.5" {
  let result = @date.RelativeDelta::new().divided(-0.5)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), true)
}

///|
test "relative delta original scaled 0/0.0" {
  let result = @date.RelativeDelta::new().scaled(0.0)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), true)
}

///|
test "relative delta original divided 0/0.0" {
  assert_true(
    try {
      ignore(@date.RelativeDelta::new().divided(0.0))
      false
    } catch {
      _ => true
    },
  )
}

///|
test "relative delta original scaled 0/1.0" {
  let result = @date.RelativeDelta::new().scaled(1.0)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), true)
}

///|
test "relative delta original divided 0/1.0" {
  let result = @date.RelativeDelta::new().divided(1.0)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), true)
}

///|
test "relative delta original scaled 0/1.1" {
  let result = @date.RelativeDelta::new().scaled(1.1)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), true)
}

///|
test "relative delta original divided 0/1.1" {
  let result = @date.RelativeDelta::new().divided(1.1)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), true)
}

///|
test "relative delta original scaled 0/1.5" {
  let result = @date.RelativeDelta::new().scaled(1.5)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), true)
}

///|
test "relative delta original divided 0/1.5" {
  let result = @date.RelativeDelta::new().divided(1.5)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), true)
}

///|
test "relative delta original scaled 0/2.0" {
  let result = @date.RelativeDelta::new().scaled(2.0)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), true)
}

///|
test "relative delta original divided 0/2.0" {
  let result = @date.RelativeDelta::new().divided(2.0)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), true)
}

///|
test "relative delta original scaled 0/3.141592653589793" {
  let result = @date.RelativeDelta::new().scaled(3.141592653589793)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), true)
}

///|
test "relative delta original divided 0/3.141592653589793" {
  let result = @date.RelativeDelta::new().divided(3.141592653589793)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), true)
}

///|
test "relative delta original scaled 0/1.2676506002282294e+30" {
  let result = @date.RelativeDelta::new().scaled(1.2676506002282294e+30)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), true)
}

///|
test "relative delta original divided 0/1.2676506002282294e+30" {
  let result = @date.RelativeDelta::new().divided(1.2676506002282294e+30)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), true)
}

///|
test "relative delta original scaled 0/2.037035976334486e+90" {
  let result = @date.RelativeDelta::new().scaled(2.037035976334486e+90)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), true)
}

///|
test "relative delta original divided 0/2.037035976334486e+90" {
  let result = @date.RelativeDelta::new().divided(2.037035976334486e+90)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), true)
}

///|
test "relative delta original scaled 0/1e+100" {
  let result = @date.RelativeDelta::new().scaled(1.0e+100)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), true)
}

///|
test "relative delta original divided 0/1e+100" {
  let result = @date.RelativeDelta::new().divided(1.0e+100)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), true)
}

///|
test "relative delta original scaled 1/-2.0" {
  let result = @date.RelativeDelta::new(
    days=1.75,
    hours=-12.5,
    minutes=0.25,
    seconds=0.125,
    microseconds=-0.5,
  ).scaled(-2.0)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-2.0, 0.0, 1.0, 0.0, 0.0, 1.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original divided 1/-2.0" {
  let result = @date.RelativeDelta::new(
    days=1.75,
    hours=-12.5,
    minutes=0.25,
    seconds=0.125,
    microseconds=-0.5,
  ).divided(-2.0)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 6.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original scaled 1/-0.5" {
  let result = @date.RelativeDelta::new(
    days=1.75,
    hours=-12.5,
    minutes=0.25,
    seconds=0.125,
    microseconds=-0.5,
  ).scaled(-0.5)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 6.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original divided 1/-0.5" {
  let result = @date.RelativeDelta::new(
    days=1.75,
    hours=-12.5,
    minutes=0.25,
    seconds=0.125,
    microseconds=-0.5,
  ).divided(-0.5)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-2.0, 0.0, 1.0, 0.0, 0.0, 1.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original scaled 1/0.0" {
  let result = @date.RelativeDelta::new(
    days=1.75,
    hours=-12.5,
    minutes=0.25,
    seconds=0.125,
    microseconds=-0.5,
  ).scaled(0.0)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), true)
}

///|
test "relative delta original divided 1/0.0" {
  assert_true(
    try {
      ignore(
        @date.RelativeDelta::new(
          days=1.75,
          hours=-12.5,
          minutes=0.25,
          seconds=0.125,
          microseconds=-0.5,
        ).divided(0.0),
      )
      false
    } catch {
      _ => true
    },
  )
}

///|
test "relative delta original scaled 1/1.0" {
  let result = @date.RelativeDelta::new(
    days=1.75,
    hours=-12.5,
    minutes=0.25,
    seconds=0.125,
    microseconds=-0.5,
  ).scaled(1.0)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [1.0, 0.0, -12.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original divided 1/1.0" {
  let result = @date.RelativeDelta::new(
    days=1.75,
    hours=-12.5,
    minutes=0.25,
    seconds=0.125,
    microseconds=-0.5,
  ).divided(1.0)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [1.0, 0.0, -12.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original scaled 1/1.1" {
  let result = @date.RelativeDelta::new(
    days=1.75,
    hours=-12.5,
    minutes=0.25,
    seconds=0.125,
    microseconds=-0.5,
  ).scaled(1.1)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [1.0, 0.0, -13.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original divided 1/1.1" {
  let result = @date.RelativeDelta::new(
    days=1.75,
    hours=-12.5,
    minutes=0.25,
    seconds=0.125,
    microseconds=-0.5,
  ).divided(1.1)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [1.0, 0.0, -11.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original scaled 1/1.5" {
  let result = @date.RelativeDelta::new(
    days=1.75,
    hours=-12.5,
    minutes=0.25,
    seconds=0.125,
    microseconds=-0.5,
  ).scaled(1.5)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [2.0, 0.0, -18.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original divided 1/1.5" {
  let result = @date.RelativeDelta::new(
    days=1.75,
    hours=-12.5,
    minutes=0.25,
    seconds=0.125,
    microseconds=-0.5,
  ).divided(1.5)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [1.0, 0.0, -8.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original scaled 1/2.0" {
  let result = @date.RelativeDelta::new(
    days=1.75,
    hours=-12.5,
    minutes=0.25,
    seconds=0.125,
    microseconds=-0.5,
  ).scaled(2.0)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [2.0, 0.0, -1.0, 0.0, 0.0, -1.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original divided 1/2.0" {
  let result = @date.RelativeDelta::new(
    days=1.75,
    hours=-12.5,
    minutes=0.25,
    seconds=0.125,
    microseconds=-0.5,
  ).divided(2.0)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, -6.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original scaled 1/3.141592653589793" {
  let result = @date.RelativeDelta::new(
    days=1.75,
    hours=-12.5,
    minutes=0.25,
    seconds=0.125,
    microseconds=-0.5,
  ).scaled(3.141592653589793)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [4.0, 0.0, -15.0, 0.0, 0.0, -1.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original divided 1/3.141592653589793" {
  let result = @date.RelativeDelta::new(
    days=1.75,
    hours=-12.5,
    minutes=0.25,
    seconds=0.125,
    microseconds=-0.5,
  ).divided(3.141592653589793)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, -3.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original scaled 1/1.2676506002282294e+30" {
  let result = @date.RelativeDelta::new(
    days=1.75,
    hours=-12.5,
    minutes=0.25,
    seconds=0.125,
    microseconds=-0.5,
  ).scaled(1.2676506002282294e+30)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [1.5583757749876456e+30, 0.0, -15.0, 9.0, 21.0, -602688.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original divided 1/1.2676506002282294e+30" {
  let result = @date.RelativeDelta::new(
    days=1.75,
    hours=-12.5,
    minutes=0.25,
    seconds=0.125,
    microseconds=-0.5,
  ).divided(1.2676506002282294e+30)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), true)
}

///|
test "relative delta original scaled 1/2.037035976334486e+90" {
  let result = @date.RelativeDelta::new(
    days=1.75,
    hours=-12.5,
    minutes=0.25,
    seconds=0.125,
    microseconds=-0.5,
  ).scaled(2.037035976334486e+90)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [2.5042133200792355e+90, 0.0, -11.0, 10.0, 21.0, -698688.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original divided 1/2.037035976334486e+90" {
  let result = @date.RelativeDelta::new(
    days=1.75,
    hours=-12.5,
    minutes=0.25,
    seconds=0.125,
    microseconds=-0.5,
  ).divided(2.037035976334486e+90)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), true)
}

///|
test "relative delta original scaled 1/1e+100" {
  let result = @date.RelativeDelta::new(
    days=1.75,
    hours=-12.5,
    minutes=0.25,
    seconds=0.125,
    microseconds=-0.5,
  ).scaled(1.0e+100)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [1.2293417245312498e+100, 0.0, -6.0, 5.0, 20.0, -407552.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original divided 1/1e+100" {
  let result = @date.RelativeDelta::new(
    days=1.75,
    hours=-12.5,
    minutes=0.25,
    seconds=0.125,
    microseconds=-0.5,
  ).divided(1.0e+100)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), true)
}

///|
test "relative delta original scaled 2/-2.0" {
  let result = @date.RelativeDelta::new(
    year=2000,
    month=2,
    day=29,
    hour=1,
    minute=2,
    second=3,
    microsecond=4,
    leapdays=2.5,
    weekday=0,
  ).scaled(-2.0)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 2.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(2000), Some(2), Some(29), Some(1), Some(2), Some(3), Some(4)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original divided 2/-2.0" {
  let result = @date.RelativeDelta::new(
    year=2000,
    month=2,
    day=29,
    hour=1,
    minute=2,
    second=3,
    microsecond=4,
    leapdays=2.5,
    weekday=0,
  ).divided(-2.0)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 2.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(2000), Some(2), Some(29), Some(1), Some(2), Some(3), Some(4)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original scaled 2/-0.5" {
  let result = @date.RelativeDelta::new(
    year=2000,
    month=2,
    day=29,
    hour=1,
    minute=2,
    second=3,
    microsecond=4,
    leapdays=2.5,
    weekday=0,
  ).scaled(-0.5)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 2.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(2000), Some(2), Some(29), Some(1), Some(2), Some(3), Some(4)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original divided 2/-0.5" {
  let result = @date.RelativeDelta::new(
    year=2000,
    month=2,
    day=29,
    hour=1,
    minute=2,
    second=3,
    microsecond=4,
    leapdays=2.5,
    weekday=0,
  ).divided(-0.5)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 2.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(2000), Some(2), Some(29), Some(1), Some(2), Some(3), Some(4)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original scaled 2/0.0" {
  let result = @date.RelativeDelta::new(
    year=2000,
    month=2,
    day=29,
    hour=1,
    minute=2,
    second=3,
    microsecond=4,
    leapdays=2.5,
    weekday=0,
  ).scaled(0.0)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 2.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(2000), Some(2), Some(29), Some(1), Some(2), Some(3), Some(4)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original divided 2/0.0" {
  assert_true(
    try {
      ignore(
        @date.RelativeDelta::new(
          year=2000,
          month=2,
          day=29,
          hour=1,
          minute=2,
          second=3,
          microsecond=4,
          leapdays=2.5,
          weekday=0,
        ).divided(0.0),
      )
      false
    } catch {
      _ => true
    },
  )
}

///|
test "relative delta original scaled 2/1.0" {
  let result = @date.RelativeDelta::new(
    year=2000,
    month=2,
    day=29,
    hour=1,
    minute=2,
    second=3,
    microsecond=4,
    leapdays=2.5,
    weekday=0,
  ).scaled(1.0)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 2.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(2000), Some(2), Some(29), Some(1), Some(2), Some(3), Some(4)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original divided 2/1.0" {
  let result = @date.RelativeDelta::new(
    year=2000,
    month=2,
    day=29,
    hour=1,
    minute=2,
    second=3,
    microsecond=4,
    leapdays=2.5,
    weekday=0,
  ).divided(1.0)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 2.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(2000), Some(2), Some(29), Some(1), Some(2), Some(3), Some(4)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original scaled 2/1.1" {
  let result = @date.RelativeDelta::new(
    year=2000,
    month=2,
    day=29,
    hour=1,
    minute=2,
    second=3,
    microsecond=4,
    leapdays=2.5,
    weekday=0,
  ).scaled(1.1)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 2.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(2000), Some(2), Some(29), Some(1), Some(2), Some(3), Some(4)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original divided 2/1.1" {
  let result = @date.RelativeDelta::new(
    year=2000,
    month=2,
    day=29,
    hour=1,
    minute=2,
    second=3,
    microsecond=4,
    leapdays=2.5,
    weekday=0,
  ).divided(1.1)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 2.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(2000), Some(2), Some(29), Some(1), Some(2), Some(3), Some(4)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original scaled 2/1.5" {
  let result = @date.RelativeDelta::new(
    year=2000,
    month=2,
    day=29,
    hour=1,
    minute=2,
    second=3,
    microsecond=4,
    leapdays=2.5,
    weekday=0,
  ).scaled(1.5)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 2.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(2000), Some(2), Some(29), Some(1), Some(2), Some(3), Some(4)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original divided 2/1.5" {
  let result = @date.RelativeDelta::new(
    year=2000,
    month=2,
    day=29,
    hour=1,
    minute=2,
    second=3,
    microsecond=4,
    leapdays=2.5,
    weekday=0,
  ).divided(1.5)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 2.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(2000), Some(2), Some(29), Some(1), Some(2), Some(3), Some(4)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original scaled 2/2.0" {
  let result = @date.RelativeDelta::new(
    year=2000,
    month=2,
    day=29,
    hour=1,
    minute=2,
    second=3,
    microsecond=4,
    leapdays=2.5,
    weekday=0,
  ).scaled(2.0)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 2.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(2000), Some(2), Some(29), Some(1), Some(2), Some(3), Some(4)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original divided 2/2.0" {
  let result = @date.RelativeDelta::new(
    year=2000,
    month=2,
    day=29,
    hour=1,
    minute=2,
    second=3,
    microsecond=4,
    leapdays=2.5,
    weekday=0,
  ).divided(2.0)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 2.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(2000), Some(2), Some(29), Some(1), Some(2), Some(3), Some(4)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original scaled 2/3.141592653589793" {
  let result = @date.RelativeDelta::new(
    year=2000,
    month=2,
    day=29,
    hour=1,
    minute=2,
    second=3,
    microsecond=4,
    leapdays=2.5,
    weekday=0,
  ).scaled(3.141592653589793)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 2.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(2000), Some(2), Some(29), Some(1), Some(2), Some(3), Some(4)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original divided 2/3.141592653589793" {
  let result = @date.RelativeDelta::new(
    year=2000,
    month=2,
    day=29,
    hour=1,
    minute=2,
    second=3,
    microsecond=4,
    leapdays=2.5,
    weekday=0,
  ).divided(3.141592653589793)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 2.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(2000), Some(2), Some(29), Some(1), Some(2), Some(3), Some(4)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original scaled 2/1.2676506002282294e+30" {
  let result = @date.RelativeDelta::new(
    year=2000,
    month=2,
    day=29,
    hour=1,
    minute=2,
    second=3,
    microsecond=4,
    leapdays=2.5,
    weekday=0,
  ).scaled(1.2676506002282294e+30)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 2.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(2000), Some(2), Some(29), Some(1), Some(2), Some(3), Some(4)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original divided 2/1.2676506002282294e+30" {
  let result = @date.RelativeDelta::new(
    year=2000,
    month=2,
    day=29,
    hour=1,
    minute=2,
    second=3,
    microsecond=4,
    leapdays=2.5,
    weekday=0,
  ).divided(1.2676506002282294e+30)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 2.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(2000), Some(2), Some(29), Some(1), Some(2), Some(3), Some(4)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original scaled 2/2.037035976334486e+90" {
  let result = @date.RelativeDelta::new(
    year=2000,
    month=2,
    day=29,
    hour=1,
    minute=2,
    second=3,
    microsecond=4,
    leapdays=2.5,
    weekday=0,
  ).scaled(2.037035976334486e+90)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 2.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(2000), Some(2), Some(29), Some(1), Some(2), Some(3), Some(4)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original divided 2/2.037035976334486e+90" {
  let result = @date.RelativeDelta::new(
    year=2000,
    month=2,
    day=29,
    hour=1,
    minute=2,
    second=3,
    microsecond=4,
    leapdays=2.5,
    weekday=0,
  ).divided(2.037035976334486e+90)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 2.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(2000), Some(2), Some(29), Some(1), Some(2), Some(3), Some(4)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original scaled 2/1e+100" {
  let result = @date.RelativeDelta::new(
    year=2000,
    month=2,
    day=29,
    hour=1,
    minute=2,
    second=3,
    microsecond=4,
    leapdays=2.5,
    weekday=0,
  ).scaled(1.0e+100)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 2.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(2000), Some(2), Some(29), Some(1), Some(2), Some(3), Some(4)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original divided 2/1e+100" {
  let result = @date.RelativeDelta::new(
    year=2000,
    month=2,
    day=29,
    hour=1,
    minute=2,
    second=3,
    microsecond=4,
    leapdays=2.5,
    weekday=0,
  ).divided(1.0e+100)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 2.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(2000), Some(2), Some(29), Some(1), Some(2), Some(3), Some(4)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 0)
  assert_eq(result.weekday().unwrap().nth(), None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original scaled 3/-2.0" {
  let result = @date.RelativeDelta::new(
    year=0,
    month=0,
    day=0,
    hour=0,
    minute=0,
    second=0,
    microsecond=0,
    leapdays=-3.5,
    on_weekday=@date.RelativeWeekday::new(6, nth=-2),
  ).scaled(-2.0)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, -3.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(0), Some(0), Some(0), Some(0), Some(0), Some(0), Some(0)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), Some(-2))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original divided 3/-2.0" {
  let result = @date.RelativeDelta::new(
    year=0,
    month=0,
    day=0,
    hour=0,
    minute=0,
    second=0,
    microsecond=0,
    leapdays=-3.5,
    on_weekday=@date.RelativeWeekday::new(6, nth=-2),
  ).divided(-2.0)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, -3.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(0), Some(0), Some(0), Some(0), Some(0), Some(0), Some(0)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), Some(-2))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original scaled 3/-0.5" {
  let result = @date.RelativeDelta::new(
    year=0,
    month=0,
    day=0,
    hour=0,
    minute=0,
    second=0,
    microsecond=0,
    leapdays=-3.5,
    on_weekday=@date.RelativeWeekday::new(6, nth=-2),
  ).scaled(-0.5)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, -3.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(0), Some(0), Some(0), Some(0), Some(0), Some(0), Some(0)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), Some(-2))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original divided 3/-0.5" {
  let result = @date.RelativeDelta::new(
    year=0,
    month=0,
    day=0,
    hour=0,
    minute=0,
    second=0,
    microsecond=0,
    leapdays=-3.5,
    on_weekday=@date.RelativeWeekday::new(6, nth=-2),
  ).divided(-0.5)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, -3.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(0), Some(0), Some(0), Some(0), Some(0), Some(0), Some(0)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), Some(-2))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original scaled 3/0.0" {
  let result = @date.RelativeDelta::new(
    year=0,
    month=0,
    day=0,
    hour=0,
    minute=0,
    second=0,
    microsecond=0,
    leapdays=-3.5,
    on_weekday=@date.RelativeWeekday::new(6, nth=-2),
  ).scaled(0.0)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, -3.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(0), Some(0), Some(0), Some(0), Some(0), Some(0), Some(0)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), Some(-2))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original divided 3/0.0" {
  assert_true(
    try {
      ignore(
        @date.RelativeDelta::new(
          year=0,
          month=0,
          day=0,
          hour=0,
          minute=0,
          second=0,
          microsecond=0,
          leapdays=-3.5,
          on_weekday=@date.RelativeWeekday::new(6, nth=-2),
        ).divided(0.0),
      )
      false
    } catch {
      _ => true
    },
  )
}

///|
test "relative delta original scaled 3/1.0" {
  let result = @date.RelativeDelta::new(
    year=0,
    month=0,
    day=0,
    hour=0,
    minute=0,
    second=0,
    microsecond=0,
    leapdays=-3.5,
    on_weekday=@date.RelativeWeekday::new(6, nth=-2),
  ).scaled(1.0)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, -3.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(0), Some(0), Some(0), Some(0), Some(0), Some(0), Some(0)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), Some(-2))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original divided 3/1.0" {
  let result = @date.RelativeDelta::new(
    year=0,
    month=0,
    day=0,
    hour=0,
    minute=0,
    second=0,
    microsecond=0,
    leapdays=-3.5,
    on_weekday=@date.RelativeWeekday::new(6, nth=-2),
  ).divided(1.0)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, -3.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(0), Some(0), Some(0), Some(0), Some(0), Some(0), Some(0)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), Some(-2))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original scaled 3/1.1" {
  let result = @date.RelativeDelta::new(
    year=0,
    month=0,
    day=0,
    hour=0,
    minute=0,
    second=0,
    microsecond=0,
    leapdays=-3.5,
    on_weekday=@date.RelativeWeekday::new(6, nth=-2),
  ).scaled(1.1)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, -3.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(0), Some(0), Some(0), Some(0), Some(0), Some(0), Some(0)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), Some(-2))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original divided 3/1.1" {
  let result = @date.RelativeDelta::new(
    year=0,
    month=0,
    day=0,
    hour=0,
    minute=0,
    second=0,
    microsecond=0,
    leapdays=-3.5,
    on_weekday=@date.RelativeWeekday::new(6, nth=-2),
  ).divided(1.1)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, -3.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(0), Some(0), Some(0), Some(0), Some(0), Some(0), Some(0)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), Some(-2))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original scaled 3/1.5" {
  let result = @date.RelativeDelta::new(
    year=0,
    month=0,
    day=0,
    hour=0,
    minute=0,
    second=0,
    microsecond=0,
    leapdays=-3.5,
    on_weekday=@date.RelativeWeekday::new(6, nth=-2),
  ).scaled(1.5)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, -3.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(0), Some(0), Some(0), Some(0), Some(0), Some(0), Some(0)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), Some(-2))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original divided 3/1.5" {
  let result = @date.RelativeDelta::new(
    year=0,
    month=0,
    day=0,
    hour=0,
    minute=0,
    second=0,
    microsecond=0,
    leapdays=-3.5,
    on_weekday=@date.RelativeWeekday::new(6, nth=-2),
  ).divided(1.5)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, -3.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(0), Some(0), Some(0), Some(0), Some(0), Some(0), Some(0)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), Some(-2))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original scaled 3/2.0" {
  let result = @date.RelativeDelta::new(
    year=0,
    month=0,
    day=0,
    hour=0,
    minute=0,
    second=0,
    microsecond=0,
    leapdays=-3.5,
    on_weekday=@date.RelativeWeekday::new(6, nth=-2),
  ).scaled(2.0)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, -3.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(0), Some(0), Some(0), Some(0), Some(0), Some(0), Some(0)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), Some(-2))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original divided 3/2.0" {
  let result = @date.RelativeDelta::new(
    year=0,
    month=0,
    day=0,
    hour=0,
    minute=0,
    second=0,
    microsecond=0,
    leapdays=-3.5,
    on_weekday=@date.RelativeWeekday::new(6, nth=-2),
  ).divided(2.0)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, -3.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(0), Some(0), Some(0), Some(0), Some(0), Some(0), Some(0)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), Some(-2))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original scaled 3/3.141592653589793" {
  let result = @date.RelativeDelta::new(
    year=0,
    month=0,
    day=0,
    hour=0,
    minute=0,
    second=0,
    microsecond=0,
    leapdays=-3.5,
    on_weekday=@date.RelativeWeekday::new(6, nth=-2),
  ).scaled(3.141592653589793)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, -3.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(0), Some(0), Some(0), Some(0), Some(0), Some(0), Some(0)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), Some(-2))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original divided 3/3.141592653589793" {
  let result = @date.RelativeDelta::new(
    year=0,
    month=0,
    day=0,
    hour=0,
    minute=0,
    second=0,
    microsecond=0,
    leapdays=-3.5,
    on_weekday=@date.RelativeWeekday::new(6, nth=-2),
  ).divided(3.141592653589793)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, -3.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(0), Some(0), Some(0), Some(0), Some(0), Some(0), Some(0)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), Some(-2))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original scaled 3/1.2676506002282294e+30" {
  let result = @date.RelativeDelta::new(
    year=0,
    month=0,
    day=0,
    hour=0,
    minute=0,
    second=0,
    microsecond=0,
    leapdays=-3.5,
    on_weekday=@date.RelativeWeekday::new(6, nth=-2),
  ).scaled(1.2676506002282294e+30)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, -3.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(0), Some(0), Some(0), Some(0), Some(0), Some(0), Some(0)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), Some(-2))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original divided 3/1.2676506002282294e+30" {
  let result = @date.RelativeDelta::new(
    year=0,
    month=0,
    day=0,
    hour=0,
    minute=0,
    second=0,
    microsecond=0,
    leapdays=-3.5,
    on_weekday=@date.RelativeWeekday::new(6, nth=-2),
  ).divided(1.2676506002282294e+30)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, -3.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(0), Some(0), Some(0), Some(0), Some(0), Some(0), Some(0)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), Some(-2))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original scaled 3/2.037035976334486e+90" {
  let result = @date.RelativeDelta::new(
    year=0,
    month=0,
    day=0,
    hour=0,
    minute=0,
    second=0,
    microsecond=0,
    leapdays=-3.5,
    on_weekday=@date.RelativeWeekday::new(6, nth=-2),
  ).scaled(2.037035976334486e+90)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, -3.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(0), Some(0), Some(0), Some(0), Some(0), Some(0), Some(0)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), Some(-2))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original divided 3/2.037035976334486e+90" {
  let result = @date.RelativeDelta::new(
    year=0,
    month=0,
    day=0,
    hour=0,
    minute=0,
    second=0,
    microsecond=0,
    leapdays=-3.5,
    on_weekday=@date.RelativeWeekday::new(6, nth=-2),
  ).divided(2.037035976334486e+90)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, -3.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(0), Some(0), Some(0), Some(0), Some(0), Some(0), Some(0)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), Some(-2))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original scaled 3/1e+100" {
  let result = @date.RelativeDelta::new(
    year=0,
    month=0,
    day=0,
    hour=0,
    minute=0,
    second=0,
    microsecond=0,
    leapdays=-3.5,
    on_weekday=@date.RelativeWeekday::new(6, nth=-2),
  ).scaled(1.0e+100)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, -3.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(0), Some(0), Some(0), Some(0), Some(0), Some(0), Some(0)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), Some(-2))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original divided 3/1e+100" {
  let result = @date.RelativeDelta::new(
    year=0,
    month=0,
    day=0,
    hour=0,
    minute=0,
    second=0,
    microsecond=0,
    leapdays=-3.5,
    on_weekday=@date.RelativeWeekday::new(6, nth=-2),
  ).divided(1.0e+100)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, -3.5, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [Some(0), Some(0), Some(0), Some(0), Some(0), Some(0), Some(0)],
  )
  assert_eq(result.weekday().unwrap().weekday(), 6)
  assert_eq(result.weekday().unwrap().nth(), Some(-2))
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original scaled 4/-2.0" {
  assert_true(
    try {
      ignore(
        @date.RelativeDelta::new(years=-9223372036854775808L, months=11L).scaled(
          -2.0,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
}

///|
test "relative delta original divided 4/-2.0" {
  let result = @date.RelativeDelta::new(years=-9223372036854775808L, months=11L).divided(
    -2.0,
  )
  assert_eq(result.years(), 4611686018427387904L)
  assert_eq(result.months(), -5)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original scaled 4/-0.5" {
  let result = @date.RelativeDelta::new(years=-9223372036854775808L, months=11L).scaled(
    -0.5,
  )
  assert_eq(result.years(), 4611686018427387904L)
  assert_eq(result.months(), -5)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original divided 4/-0.5" {
  assert_true(
    try {
      ignore(
        @date.RelativeDelta::new(years=-9223372036854775808L, months=11L).divided(
          -0.5,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
}

///|
test "relative delta original scaled 4/0.0" {
  let result = @date.RelativeDelta::new(years=-9223372036854775808L, months=11L).scaled(
    0.0,
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), true)
}

///|
test "relative delta original divided 4/0.0" {
  assert_true(
    try {
      ignore(
        @date.RelativeDelta::new(years=-9223372036854775808L, months=11L).divided(
          0.0,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
}

///|
test "relative delta original scaled 4/1.0" {
  let result = @date.RelativeDelta::new(years=-9223372036854775808L, months=11L).scaled(
    1.0,
  )
  assert_eq(result.years(), -9223372036854775808L)
  assert_eq(result.months(), 11)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original divided 4/1.0" {
  let result = @date.RelativeDelta::new(years=-9223372036854775808L, months=11L).divided(
    1.0,
  )
  assert_eq(result.years(), -9223372036854775808L)
  assert_eq(result.months(), 11)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original scaled 4/1.1" {
  assert_true(
    try {
      ignore(
        @date.RelativeDelta::new(years=-9223372036854775808L, months=11L).scaled(
          1.1,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
}

///|
test "relative delta original divided 4/1.1" {
  let result = @date.RelativeDelta::new(years=-9223372036854775808L, months=11L).divided(
    1.1,
  )
  assert_eq(result.years(), -8384883669867977728L)
  assert_eq(result.months(), 10)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original scaled 4/1.5" {
  assert_true(
    try {
      ignore(
        @date.RelativeDelta::new(years=-9223372036854775808L, months=11L).scaled(
          1.5,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
}

///|
test "relative delta original divided 4/1.5" {
  let result = @date.RelativeDelta::new(years=-9223372036854775808L, months=11L).divided(
    1.5,
  )
  assert_eq(result.years(), -6148914691236516864L)
  assert_eq(result.months(), 7)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original scaled 4/2.0" {
  assert_true(
    try {
      ignore(
        @date.RelativeDelta::new(years=-9223372036854775808L, months=11L).scaled(
          2.0,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
}

///|
test "relative delta original divided 4/2.0" {
  let result = @date.RelativeDelta::new(years=-9223372036854775808L, months=11L).divided(
    2.0,
  )
  assert_eq(result.years(), -4611686018427387904L)
  assert_eq(result.months(), 5)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original scaled 4/3.141592653589793" {
  assert_true(
    try {
      ignore(
        @date.RelativeDelta::new(years=-9223372036854775808L, months=11L).scaled(
          3.141592653589793,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
}

///|
test "relative delta original divided 4/3.141592653589793" {
  let result = @date.RelativeDelta::new(years=-9223372036854775808L, months=11L).divided(
    3.141592653589793,
  )
  assert_eq(result.years(), -2935890503282001408L)
  assert_eq(result.months(), 3)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original scaled 4/1.2676506002282294e+30" {
  assert_true(
    try {
      ignore(
        @date.RelativeDelta::new(years=-9223372036854775808L, months=11L).scaled(
          1.2676506002282294e+30,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
}

///|
test "relative delta original divided 4/1.2676506002282294e+30" {
  let result = @date.RelativeDelta::new(years=-9223372036854775808L, months=11L).divided(
    1.2676506002282294e+30,
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), true)
}

///|
test "relative delta original scaled 4/2.037035976334486e+90" {
  assert_true(
    try {
      ignore(
        @date.RelativeDelta::new(years=-9223372036854775808L, months=11L).scaled(
          2.037035976334486e+90,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
}

///|
test "relative delta original divided 4/2.037035976334486e+90" {
  let result = @date.RelativeDelta::new(years=-9223372036854775808L, months=11L).divided(
    2.037035976334486e+90,
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), true)
}

///|
test "relative delta original scaled 4/1e+100" {
  assert_true(
    try {
      ignore(
        @date.RelativeDelta::new(years=-9223372036854775808L, months=11L).scaled(
          1.0e+100,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
}

///|
test "relative delta original divided 4/1e+100" {
  let result = @date.RelativeDelta::new(years=-9223372036854775808L, months=11L).divided(
    1.0e+100,
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), true)
}

///|
test "relative delta original scaled 5/-2.0" {
  assert_true(
    try {
      ignore(
        @date.RelativeDelta::new(years=9223372036854775807L, months=-11L).scaled(
          -2.0,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
}

///|
test "relative delta original divided 5/-2.0" {
  let result = @date.RelativeDelta::new(years=9223372036854775807L, months=-11L).divided(
    -2.0,
  )
  assert_eq(result.years(), -4611686018427387904L)
  assert_eq(result.months(), 5)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original scaled 5/-0.5" {
  let result = @date.RelativeDelta::new(years=9223372036854775807L, months=-11L).scaled(
    -0.5,
  )
  assert_eq(result.years(), -4611686018427387904L)
  assert_eq(result.months(), 5)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original divided 5/-0.5" {
  assert_true(
    try {
      ignore(
        @date.RelativeDelta::new(years=9223372036854775807L, months=-11L).divided(
          -0.5,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
}

///|
test "relative delta original scaled 5/0.0" {
  let result = @date.RelativeDelta::new(years=9223372036854775807L, months=-11L).scaled(
    0.0,
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), true)
}

///|
test "relative delta original divided 5/0.0" {
  assert_true(
    try {
      ignore(
        @date.RelativeDelta::new(years=9223372036854775807L, months=-11L).divided(
          0.0,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
}

///|
test "relative delta original scaled 5/1.0" {
  assert_true(
    try {
      ignore(
        @date.RelativeDelta::new(years=9223372036854775807L, months=-11L).scaled(
          1.0,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
}

///|
test "relative delta original divided 5/1.0" {
  assert_true(
    try {
      ignore(
        @date.RelativeDelta::new(years=9223372036854775807L, months=-11L).divided(
          1.0,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
}

///|
test "relative delta original scaled 5/1.1" {
  assert_true(
    try {
      ignore(
        @date.RelativeDelta::new(years=9223372036854775807L, months=-11L).scaled(
          1.1,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
}

///|
test "relative delta original divided 5/1.1" {
  let result = @date.RelativeDelta::new(years=9223372036854775807L, months=-11L).divided(
    1.1,
  )
  assert_eq(result.years(), 8384883669867977728L)
  assert_eq(result.months(), -10)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original scaled 5/1.5" {
  assert_true(
    try {
      ignore(
        @date.RelativeDelta::new(years=9223372036854775807L, months=-11L).scaled(
          1.5,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
}

///|
test "relative delta original divided 5/1.5" {
  let result = @date.RelativeDelta::new(years=9223372036854775807L, months=-11L).divided(
    1.5,
  )
  assert_eq(result.years(), 6148914691236516864L)
  assert_eq(result.months(), -7)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original scaled 5/2.0" {
  assert_true(
    try {
      ignore(
        @date.RelativeDelta::new(years=9223372036854775807L, months=-11L).scaled(
          2.0,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
}

///|
test "relative delta original divided 5/2.0" {
  let result = @date.RelativeDelta::new(years=9223372036854775807L, months=-11L).divided(
    2.0,
  )
  assert_eq(result.years(), 4611686018427387904L)
  assert_eq(result.months(), -5)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original scaled 5/3.141592653589793" {
  assert_true(
    try {
      ignore(
        @date.RelativeDelta::new(years=9223372036854775807L, months=-11L).scaled(
          3.141592653589793,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
}

///|
test "relative delta original divided 5/3.141592653589793" {
  let result = @date.RelativeDelta::new(years=9223372036854775807L, months=-11L).divided(
    3.141592653589793,
  )
  assert_eq(result.years(), 2935890503282001408L)
  assert_eq(result.months(), -3)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original scaled 5/1.2676506002282294e+30" {
  assert_true(
    try {
      ignore(
        @date.RelativeDelta::new(years=9223372036854775807L, months=-11L).scaled(
          1.2676506002282294e+30,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
}

///|
test "relative delta original divided 5/1.2676506002282294e+30" {
  let result = @date.RelativeDelta::new(years=9223372036854775807L, months=-11L).divided(
    1.2676506002282294e+30,
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), true)
}

///|
test "relative delta original scaled 5/2.037035976334486e+90" {
  assert_true(
    try {
      ignore(
        @date.RelativeDelta::new(years=9223372036854775807L, months=-11L).scaled(
          2.037035976334486e+90,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
}

///|
test "relative delta original divided 5/2.037035976334486e+90" {
  let result = @date.RelativeDelta::new(years=9223372036854775807L, months=-11L).divided(
    2.037035976334486e+90,
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), true)
}

///|
test "relative delta original scaled 5/1e+100" {
  assert_true(
    try {
      ignore(
        @date.RelativeDelta::new(years=9223372036854775807L, months=-11L).scaled(
          1.0e+100,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
}

///|
test "relative delta original divided 5/1e+100" {
  let result = @date.RelativeDelta::new(years=9223372036854775807L, months=-11L).divided(
    1.0e+100,
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), true)
}

///|
test "relative delta original scaled 6/-2.0" {
  let result = @date.RelativeDelta::new(days=0.5, hours=-12.0).scaled(-2.0)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), true)
}

///|
test "relative delta original divided 6/-2.0" {
  let result = @date.RelativeDelta::new(days=0.5, hours=-12.0).divided(-2.0)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 6.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original scaled 6/-0.5" {
  let result = @date.RelativeDelta::new(days=0.5, hours=-12.0).scaled(-0.5)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 6.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original divided 6/-0.5" {
  let result = @date.RelativeDelta::new(days=0.5, hours=-12.0).divided(-0.5)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), true)
}

///|
test "relative delta original scaled 6/0.0" {
  let result = @date.RelativeDelta::new(days=0.5, hours=-12.0).scaled(0.0)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), true)
}

///|
test "relative delta original divided 6/0.0" {
  assert_true(
    try {
      ignore(@date.RelativeDelta::new(days=0.5, hours=-12.0).divided(0.0))
      false
    } catch {
      _ => true
    },
  )
}

///|
test "relative delta original scaled 6/1.0" {
  let result = @date.RelativeDelta::new(days=0.5, hours=-12.0).scaled(1.0)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, -12.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original divided 6/1.0" {
  let result = @date.RelativeDelta::new(days=0.5, hours=-12.0).divided(1.0)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, -12.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original scaled 6/1.1" {
  let result = @date.RelativeDelta::new(days=0.5, hours=-12.0).scaled(1.1)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, -13.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original divided 6/1.1" {
  let result = @date.RelativeDelta::new(days=0.5, hours=-12.0).divided(1.1)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, -10.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original scaled 6/1.5" {
  let result = @date.RelativeDelta::new(days=0.5, hours=-12.0).scaled(1.5)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, -18.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original divided 6/1.5" {
  let result = @date.RelativeDelta::new(days=0.5, hours=-12.0).divided(1.5)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, -8.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original scaled 6/2.0" {
  let result = @date.RelativeDelta::new(days=0.5, hours=-12.0).scaled(2.0)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), true)
}

///|
test "relative delta original divided 6/2.0" {
  let result = @date.RelativeDelta::new(days=0.5, hours=-12.0).divided(2.0)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, -6.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original scaled 6/3.141592653589793" {
  let result = @date.RelativeDelta::new(days=0.5, hours=-12.0).scaled(
    3.141592653589793,
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, -13.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original divided 6/3.141592653589793" {
  let result = @date.RelativeDelta::new(days=0.5, hours=-12.0).divided(
    3.141592653589793,
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, -3.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original scaled 6/1.2676506002282294e+30" {
  let result = @date.RelativeDelta::new(days=0.5, hours=-12.0).scaled(
    1.2676506002282294e+30,
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), true)
}

///|
test "relative delta original divided 6/1.2676506002282294e+30" {
  let result = @date.RelativeDelta::new(days=0.5, hours=-12.0).divided(
    1.2676506002282294e+30,
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), true)
}

///|
test "relative delta original scaled 6/2.037035976334486e+90" {
  let result = @date.RelativeDelta::new(days=0.5, hours=-12.0).scaled(
    2.037035976334486e+90,
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), true)
}

///|
test "relative delta original divided 6/2.037035976334486e+90" {
  let result = @date.RelativeDelta::new(days=0.5, hours=-12.0).divided(
    2.037035976334486e+90,
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), true)
}

///|
test "relative delta original scaled 6/1e+100" {
  let result = @date.RelativeDelta::new(days=0.5, hours=-12.0).scaled(1.0e+100)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [-3.2377814870428816e+83, 0.0, -16.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original divided 6/1e+100" {
  let result = @date.RelativeDelta::new(days=0.5, hours=-12.0).divided(1.0e+100)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), true)
}

///|
test "relative delta original scaled 7/-2.0" {
  let result = @date.RelativeDelta::new(days=0.1, hours=-2.4).scaled(-2.0)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 4.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original divided 7/-2.0" {
  let result = @date.RelativeDelta::new(days=0.1, hours=-2.4).divided(-2.0)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 1.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original scaled 7/-0.5" {
  let result = @date.RelativeDelta::new(days=0.1, hours=-2.4).scaled(-0.5)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 1.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original divided 7/-0.5" {
  let result = @date.RelativeDelta::new(days=0.1, hours=-2.4).divided(-0.5)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 4.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original scaled 7/0.0" {
  let result = @date.RelativeDelta::new(days=0.1, hours=-2.4).scaled(0.0)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), true)
}

///|
test "relative delta original divided 7/0.0" {
  assert_true(
    try {
      ignore(@date.RelativeDelta::new(days=0.1, hours=-2.4).divided(0.0))
      false
    } catch {
      _ => true
    },
  )
}

///|
test "relative delta original scaled 7/1.0" {
  let result = @date.RelativeDelta::new(days=0.1, hours=-2.4).scaled(1.0)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, -2.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original divided 7/1.0" {
  let result = @date.RelativeDelta::new(days=0.1, hours=-2.4).divided(1.0)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, -2.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original scaled 7/1.1" {
  let result = @date.RelativeDelta::new(days=0.1, hours=-2.4).scaled(1.1)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, -2.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original divided 7/1.1" {
  let result = @date.RelativeDelta::new(days=0.1, hours=-2.4).divided(1.1)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, -2.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original scaled 7/1.5" {
  let result = @date.RelativeDelta::new(days=0.1, hours=-2.4).scaled(1.5)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, -3.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original divided 7/1.5" {
  let result = @date.RelativeDelta::new(days=0.1, hours=-2.4).divided(1.5)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, -1.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original scaled 7/2.0" {
  let result = @date.RelativeDelta::new(days=0.1, hours=-2.4).scaled(2.0)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, -4.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original divided 7/2.0" {
  let result = @date.RelativeDelta::new(days=0.1, hours=-2.4).divided(2.0)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, -1.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original scaled 7/3.141592653589793" {
  let result = @date.RelativeDelta::new(days=0.1, hours=-2.4).scaled(
    3.141592653589793,
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, -7.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original divided 7/3.141592653589793" {
  let result = @date.RelativeDelta::new(days=0.1, hours=-2.4).divided(
    3.141592653589793,
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), true)
}

///|
test "relative delta original scaled 7/1.2676506002282294e+30" {
  let result = @date.RelativeDelta::new(days=0.1, hours=-2.4).scaled(
    1.2676506002282294e+30,
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [11728124029611.0, 0.0, -8.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original divided 7/1.2676506002282294e+30" {
  let result = @date.RelativeDelta::new(days=0.1, hours=-2.4).divided(
    1.2676506002282294e+30,
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), true)
}

///|
test "relative delta original scaled 7/2.037035976334486e+90" {
  let result = @date.RelativeDelta::new(days=0.1, hours=-2.4).scaled(
    2.037035976334486e+90,
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [1.8846368690969432e+73, 0.0, -8.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original divided 7/2.037035976334486e+90" {
  let result = @date.RelativeDelta::new(days=0.1, hours=-2.4).divided(
    2.037035976334486e+90,
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), true)
}

///|
test "relative delta original scaled 7/1e+100" {
  let result = @date.RelativeDelta::new(days=0.1, hours=-2.4).scaled(1.0e+100)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [4.047226858803602e+82, 0.0, -16.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original divided 7/1e+100" {
  let result = @date.RelativeDelta::new(days=0.1, hours=-2.4).divided(1.0e+100)
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), true)
}

///|
test "relative delta original scaled 8/-2.0" {
  assert_true(
    try {
      ignore(
        @date.RelativeDelta::new(years=8384883669867977728L, months=-11L).scaled(
          -2.0,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
}

///|
test "relative delta original divided 8/-2.0" {
  let result = @date.RelativeDelta::new(years=8384883669867977728L, months=-11L).divided(
    -2.0,
  )
  assert_eq(result.years(), -4192441834933988864L)
  assert_eq(result.months(), 5)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original scaled 8/-0.5" {
  let result = @date.RelativeDelta::new(years=8384883669867977728L, months=-11L).scaled(
    -0.5,
  )
  assert_eq(result.years(), -4192441834933988864L)
  assert_eq(result.months(), 5)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original divided 8/-0.5" {
  assert_true(
    try {
      ignore(
        @date.RelativeDelta::new(years=8384883669867977728L, months=-11L).divided(
          -0.5,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
}

///|
test "relative delta original scaled 8/0.0" {
  let result = @date.RelativeDelta::new(years=8384883669867977728L, months=-11L).scaled(
    0.0,
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), true)
}

///|
test "relative delta original divided 8/0.0" {
  assert_true(
    try {
      ignore(
        @date.RelativeDelta::new(years=8384883669867977728L, months=-11L).divided(
          0.0,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
}

///|
test "relative delta original scaled 8/1.0" {
  let result = @date.RelativeDelta::new(years=8384883669867977728L, months=-11L).scaled(
    1.0,
  )
  assert_eq(result.years(), 8384883669867977728L)
  assert_eq(result.months(), -11)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original divided 8/1.0" {
  let result = @date.RelativeDelta::new(years=8384883669867977728L, months=-11L).divided(
    1.0,
  )
  assert_eq(result.years(), 8384883669867977728L)
  assert_eq(result.months(), -11)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original scaled 8/1.1" {
  let result = @date.RelativeDelta::new(years=8384883669867977728L, months=-11L).scaled(
    1.1,
  )
  assert_eq(result.years(), 9223372036854775807L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original divided 8/1.1" {
  let result = @date.RelativeDelta::new(years=8384883669867977728L, months=-11L).divided(
    1.1,
  )
  assert_eq(result.years(), 7622621518061797376L)
  assert_eq(result.months(), -10)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original scaled 8/1.5" {
  assert_true(
    try {
      ignore(
        @date.RelativeDelta::new(years=8384883669867977728L, months=-11L).scaled(
          1.5,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
}

///|
test "relative delta original divided 8/1.5" {
  let result = @date.RelativeDelta::new(years=8384883669867977728L, months=-11L).divided(
    1.5,
  )
  assert_eq(result.years(), 5589922446578651136L)
  assert_eq(result.months(), -7)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original scaled 8/2.0" {
  assert_true(
    try {
      ignore(
        @date.RelativeDelta::new(years=8384883669867977728L, months=-11L).scaled(
          2.0,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
}

///|
test "relative delta original divided 8/2.0" {
  let result = @date.RelativeDelta::new(years=8384883669867977728L, months=-11L).divided(
    2.0,
  )
  assert_eq(result.years(), 4192441834933988864L)
  assert_eq(result.months(), -5)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original scaled 8/3.141592653589793" {
  assert_true(
    try {
      ignore(
        @date.RelativeDelta::new(years=8384883669867977728L, months=-11L).scaled(
          3.141592653589793,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
}

///|
test "relative delta original divided 8/3.141592653589793" {
  let result = @date.RelativeDelta::new(years=8384883669867977728L, months=-11L).divided(
    3.141592653589793,
  )
  assert_eq(result.years(), 2668991366620001280L)
  assert_eq(result.months(), -3)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), false)
}

///|
test "relative delta original scaled 8/1.2676506002282294e+30" {
  assert_true(
    try {
      ignore(
        @date.RelativeDelta::new(years=8384883669867977728L, months=-11L).scaled(
          1.2676506002282294e+30,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
}

///|
test "relative delta original divided 8/1.2676506002282294e+30" {
  let result = @date.RelativeDelta::new(years=8384883669867977728L, months=-11L).divided(
    1.2676506002282294e+30,
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), true)
}

///|
test "relative delta original scaled 8/2.037035976334486e+90" {
  assert_true(
    try {
      ignore(
        @date.RelativeDelta::new(years=8384883669867977728L, months=-11L).scaled(
          2.037035976334486e+90,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
}

///|
test "relative delta original divided 8/2.037035976334486e+90" {
  let result = @date.RelativeDelta::new(years=8384883669867977728L, months=-11L).divided(
    2.037035976334486e+90,
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), true)
}

///|
test "relative delta original scaled 8/1e+100" {
  assert_true(
    try {
      ignore(
        @date.RelativeDelta::new(years=8384883669867977728L, months=-11L).scaled(
          1.0e+100,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
}

///|
test "relative delta original divided 8/1e+100" {
  let result = @date.RelativeDelta::new(years=8384883669867977728L, months=-11L).divided(
    1.0e+100,
  )
  assert_eq(result.years(), 0L)
  assert_eq(result.months(), 0)
  assert_eq(
    [
      result.days(),
      result.leapdays(),
      result.hours(),
      result.minutes(),
      result.seconds(),
      result.microseconds(),
    ],
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [None, None, None, None, None, None, None],
  )
  assert_true(result.weekday() is None)
  assert_eq(result.is_zero(), true)
}

///|
test "relative delta original equality and zero semantics" {
  assert_eq(@date.RelativeDelta::new() == @date.RelativeDelta::new(), true)
  assert_eq(
    @date.RelativeDelta::new() == @date.RelativeDelta::new(year=0),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new() == @date.RelativeDelta::new(day=0),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new() == @date.RelativeDelta::new(hour=0),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new() == @date.RelativeDelta::new(days=0.0),
    true,
  )
  assert_eq(
    @date.RelativeDelta::new() == @date.RelativeDelta::new(leapdays=0.0),
    true,
  )
  assert_eq(
    @date.RelativeDelta::new() ==
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0)),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new() ==
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=0)),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new() ==
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=1)),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new() ==
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=-1)),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new() ==
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(7, nth=1)),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new() ==
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=2)),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(year=0) == @date.RelativeDelta::new(),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(year=0) == @date.RelativeDelta::new(year=0),
    true,
  )
  assert_eq(
    @date.RelativeDelta::new(year=0) == @date.RelativeDelta::new(day=0),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(year=0) == @date.RelativeDelta::new(hour=0),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(year=0) == @date.RelativeDelta::new(days=0.0),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(year=0) == @date.RelativeDelta::new(leapdays=0.0),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(year=0) ==
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0)),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(year=0) ==
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=0)),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(year=0) ==
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=1)),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(year=0) ==
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=-1)),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(year=0) ==
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(7, nth=1)),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(year=0) ==
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=2)),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(day=0) == @date.RelativeDelta::new(),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(day=0) == @date.RelativeDelta::new(year=0),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(day=0) == @date.RelativeDelta::new(day=0),
    true,
  )
  assert_eq(
    @date.RelativeDelta::new(day=0) == @date.RelativeDelta::new(hour=0),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(day=0) == @date.RelativeDelta::new(days=0.0),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(day=0) == @date.RelativeDelta::new(leapdays=0.0),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(day=0) ==
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0)),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(day=0) ==
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=0)),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(day=0) ==
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=1)),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(day=0) ==
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=-1)),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(day=0) ==
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(7, nth=1)),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(day=0) ==
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=2)),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(hour=0) == @date.RelativeDelta::new(),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(hour=0) == @date.RelativeDelta::new(year=0),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(hour=0) == @date.RelativeDelta::new(day=0),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(hour=0) == @date.RelativeDelta::new(hour=0),
    true,
  )
  assert_eq(
    @date.RelativeDelta::new(hour=0) == @date.RelativeDelta::new(days=0.0),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(hour=0) == @date.RelativeDelta::new(leapdays=0.0),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(hour=0) ==
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0)),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(hour=0) ==
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=0)),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(hour=0) ==
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=1)),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(hour=0) ==
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=-1)),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(hour=0) ==
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(7, nth=1)),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(hour=0) ==
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=2)),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(days=0.0) == @date.RelativeDelta::new(),
    true,
  )
  assert_eq(
    @date.RelativeDelta::new(days=0.0) == @date.RelativeDelta::new(year=0),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(days=0.0) == @date.RelativeDelta::new(day=0),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(days=0.0) == @date.RelativeDelta::new(hour=0),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(days=0.0) == @date.RelativeDelta::new(days=0.0),
    true,
  )
  assert_eq(
    @date.RelativeDelta::new(days=0.0) == @date.RelativeDelta::new(leapdays=0.0),
    true,
  )
  assert_eq(
    @date.RelativeDelta::new(days=0.0) ==
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0)),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(days=0.0) ==
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=0)),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(days=0.0) ==
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=1)),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(days=0.0) ==
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=-1)),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(days=0.0) ==
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(7, nth=1)),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(days=0.0) ==
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=2)),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(leapdays=0.0) == @date.RelativeDelta::new(),
    true,
  )
  assert_eq(
    @date.RelativeDelta::new(leapdays=0.0) == @date.RelativeDelta::new(year=0),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(leapdays=0.0) == @date.RelativeDelta::new(day=0),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(leapdays=0.0) == @date.RelativeDelta::new(hour=0),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(leapdays=0.0) == @date.RelativeDelta::new(days=0.0),
    true,
  )
  assert_eq(
    @date.RelativeDelta::new(leapdays=0.0) ==
    @date.RelativeDelta::new(leapdays=0.0),
    true,
  )
  assert_eq(
    @date.RelativeDelta::new(leapdays=0.0) ==
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0)),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(leapdays=0.0) ==
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=0)),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(leapdays=0.0) ==
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=1)),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(leapdays=0.0) ==
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=-1)),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(leapdays=0.0) ==
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(7, nth=1)),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(leapdays=0.0) ==
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=2)),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0)) ==
    @date.RelativeDelta::new(),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0)) ==
    @date.RelativeDelta::new(year=0),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0)) ==
    @date.RelativeDelta::new(day=0),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0)) ==
    @date.RelativeDelta::new(hour=0),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0)) ==
    @date.RelativeDelta::new(days=0.0),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0)) ==
    @date.RelativeDelta::new(leapdays=0.0),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0)) ==
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0)),
    true,
  )
  assert_eq(
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0)) ==
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=0)),
    true,
  )
  assert_eq(
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0)) ==
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=1)),
    true,
  )
  assert_eq(
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0)) ==
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=-1)),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0)) ==
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(7, nth=1)),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0)) ==
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=2)),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=0)) ==
    @date.RelativeDelta::new(),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=0)) ==
    @date.RelativeDelta::new(year=0),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=0)) ==
    @date.RelativeDelta::new(day=0),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=0)) ==
    @date.RelativeDelta::new(hour=0),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=0)) ==
    @date.RelativeDelta::new(days=0.0),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=0)) ==
    @date.RelativeDelta::new(leapdays=0.0),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=0)) ==
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0)),
    true,
  )
  assert_eq(
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=0)) ==
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=0)),
    true,
  )
  assert_eq(
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=0)) ==
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=1)),
    true,
  )
  assert_eq(
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=0)) ==
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=-1)),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=0)) ==
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(7, nth=1)),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=0)) ==
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=2)),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=1)) ==
    @date.RelativeDelta::new(),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=1)) ==
    @date.RelativeDelta::new(year=0),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=1)) ==
    @date.RelativeDelta::new(day=0),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=1)) ==
    @date.RelativeDelta::new(hour=0),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=1)) ==
    @date.RelativeDelta::new(days=0.0),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=1)) ==
    @date.RelativeDelta::new(leapdays=0.0),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=1)) ==
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0)),
    true,
  )
  assert_eq(
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=1)) ==
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=0)),
    true,
  )
  assert_eq(
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=1)) ==
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=1)),
    true,
  )
  assert_eq(
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=1)) ==
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=-1)),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=1)) ==
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(7, nth=1)),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=1)) ==
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=2)),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=-1)) ==
    @date.RelativeDelta::new(),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=-1)) ==
    @date.RelativeDelta::new(year=0),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=-1)) ==
    @date.RelativeDelta::new(day=0),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=-1)) ==
    @date.RelativeDelta::new(hour=0),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=-1)) ==
    @date.RelativeDelta::new(days=0.0),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=-1)) ==
    @date.RelativeDelta::new(leapdays=0.0),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=-1)) ==
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0)),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=-1)) ==
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=0)),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=-1)) ==
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=1)),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=-1)) ==
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=-1)),
    true,
  )
  assert_eq(
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=-1)) ==
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(7, nth=1)),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=-1)) ==
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=2)),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(7, nth=1)) ==
    @date.RelativeDelta::new(),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(7, nth=1)) ==
    @date.RelativeDelta::new(year=0),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(7, nth=1)) ==
    @date.RelativeDelta::new(day=0),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(7, nth=1)) ==
    @date.RelativeDelta::new(hour=0),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(7, nth=1)) ==
    @date.RelativeDelta::new(days=0.0),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(7, nth=1)) ==
    @date.RelativeDelta::new(leapdays=0.0),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(7, nth=1)) ==
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0)),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(7, nth=1)) ==
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=0)),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(7, nth=1)) ==
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=1)),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(7, nth=1)) ==
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=-1)),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(7, nth=1)) ==
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(7, nth=1)),
    true,
  )
  assert_eq(
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(7, nth=1)) ==
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=2)),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=2)) ==
    @date.RelativeDelta::new(),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=2)) ==
    @date.RelativeDelta::new(year=0),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=2)) ==
    @date.RelativeDelta::new(day=0),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=2)) ==
    @date.RelativeDelta::new(hour=0),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=2)) ==
    @date.RelativeDelta::new(days=0.0),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=2)) ==
    @date.RelativeDelta::new(leapdays=0.0),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=2)) ==
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0)),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=2)) ==
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=0)),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=2)) ==
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=1)),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=2)) ==
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=-1)),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=2)) ==
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(7, nth=1)),
    false,
  )
  assert_eq(
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=2)) ==
    @date.RelativeDelta::new(on_weekday=@date.RelativeWeekday::new(0, nth=2)),
    true,
  )
}

///|
test "relative delta original datetime subtraction absolute fields" {
  {
    let result = @date.parse_iso("2024-07-15T12:34:56.123456+00:00").sub_relative_delta(
      @date.RelativeDelta::new(
        year=2000,
        month=2,
        day=29,
        hour=1,
        minute=2,
        second=3,
        microsecond=4,
        leapdays=2.5,
        weekday=0,
      ),
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
      ],
      [2000, 3, 6, 1, 2, 3, 4],
    )
  }
  {
    let result = @date.parse_iso("2024-07-15T12:34:56.123456+00:00").sub_relative_delta(
      @date.RelativeDelta::new(
        year=0,
        month=0,
        day=0,
        hour=0,
        minute=0,
        second=0,
        microsecond=0,
        leapdays=-3.5,
        on_weekday=@date.RelativeWeekday::new(6, nth=-2),
      ),
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
      ],
      [2024, 6, 30, 12, 0, 0, 0],
    )
  }
  {
    let result = @date.parse_iso("2024-07-15T12:34:56.123456+00:00").sub_relative_delta(
      @date.RelativeDelta::new(months=1L, day=31, leapdays=1.5, weekday=0),
    )
    assert_eq(
      [
        result.year(),
        result.month(),
        result.day(),
        result.hour(),
        result.minute(),
        result.second(),
        result.microsecond(),
      ],
      [2024, 7, 8, 0, 34, 56, 123456],
    )
  }
  let result = @date.parse_iso("2024-07-15T12:34:56.123456+00:00").sub_relative_delta(
    @date.RelativeDelta::new(days=1.5, hours=2.0),
  )
  assert_eq(
    [
      result.year(),
      result.month(),
      result.day(),
      result.hour(),
      result.minute(),
      result.second(),
      result.microsecond(),
    ],
    [2024, 7, 13, 22, 34, 56, 123456],
  )
}
