// Generated original relativedelta difference construction and reconstruction.

///|
test "relative delta original between 0 UTC/0/0" {
  let first = @date.parse_iso("0001-01-01T00:00:00+00:00")
  let second = @date.parse_iso("0001-01-01T00:00:00+00:00")
  let delta = @date.RelativeDelta::between(first, second)
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
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [1, 1, 1, 0, 0, 0, 0, 0],
  )
}

///|
test "relative delta original between 1 UTC/0/1" {
  let first = @date.parse_iso("0001-01-01T00:00:00+00:00")
  let second = @date.parse_iso("9999-12-31T23:59:59.999999+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), -9998L)
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
    [-31.0, 0.0, 0.0, 0.0, 0.0, 1.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [1, 1, 1, 0, 0, 0, 0, 0],
  )
}

///|
test "relative delta original between 2 UTC/0/2" {
  let first = @date.parse_iso("0001-01-01T00:00:00+00:00")
  let second = @date.parse_iso("2020-01-31T23:59:59.999999+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), -2019L)
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
    [-31.0, 0.0, 0.0, 0.0, 0.0, 1.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [1, 1, 1, 0, 0, 0, 0, 0],
  )
}

///|
test "relative delta original between 3 UTC/0/3" {
  let first = @date.parse_iso("0001-01-01T00:00:00+00:00")
  let second = @date.parse_iso("2020-02-29T00:00:00+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), -2019L)
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
    [-28.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [1, 1, 1, 0, 0, 0, 0, 0],
  )
}

///|
test "relative delta original between 4 UTC/0/4" {
  let first = @date.parse_iso("0001-01-01T00:00:00+00:00")
  let second = @date.parse_iso("2021-02-28T23:00:00+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), -2020L)
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
    [-27.0, 0.0, -23.0, 0.0, 0.0, 0.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [1, 1, 1, 0, 0, 0, 0, 0],
  )
}

///|
test "relative delta original between 5 UTC/0/5" {
  let first = @date.parse_iso("0001-01-01T00:00:00+00:00")
  let second = @date.parse_iso("2024-03-31T00:00:00+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), -2023L)
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
    [-30.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [1, 1, 1, 0, 0, 0, 0, 0],
  )
}

///|
test "relative delta original between 6 UTC/0/6" {
  let first = @date.parse_iso("0001-01-01T00:00:00+00:00")
  let second = @date.parse_iso("2024-04-30T00:00:00+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), -2023L)
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
    [-29.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [1, 1, 1, 0, 0, 0, 0, 0],
  )
}

///|
test "relative delta original between 7 UTC/1/0" {
  let first = @date.parse_iso("9999-12-31T23:59:59.999999+00:00")
  let second = @date.parse_iso("0001-01-01T00:00:00+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), 9998L)
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
    [30.0, 0.0, 23.0, 59.0, 59.0, 999999.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [9999, 12, 31, 23, 59, 59, 999999, 0],
  )
}

///|
test "relative delta original between 8 UTC/1/1" {
  let first = @date.parse_iso("9999-12-31T23:59:59.999999+00:00")
  let second = @date.parse_iso("9999-12-31T23:59:59.999999+00:00")
  let delta = @date.RelativeDelta::between(first, second)
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
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [9999, 12, 31, 23, 59, 59, 999999, 0],
  )
}

///|
test "relative delta original between 9 UTC/1/2" {
  let first = @date.parse_iso("9999-12-31T23:59:59.999999+00:00")
  let second = @date.parse_iso("2020-01-31T23:59:59.999999+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), 7979L)
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
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [9999, 12, 31, 23, 59, 59, 999999, 0],
  )
}

///|
test "relative delta original between 10 UTC/1/3" {
  let first = @date.parse_iso("9999-12-31T23:59:59.999999+00:00")
  let second = @date.parse_iso("2020-02-29T00:00:00+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), 7979L)
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
    [2.0, 0.0, 23.0, 59.0, 59.0, 999999.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [9999, 12, 31, 23, 59, 59, 999999, 0],
  )
}

///|
test "relative delta original between 11 UTC/1/4" {
  let first = @date.parse_iso("9999-12-31T23:59:59.999999+00:00")
  let second = @date.parse_iso("2021-02-28T23:00:00+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), 7978L)
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
    [3.0, 0.0, 0.0, 59.0, 59.0, 999999.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [9999, 12, 31, 23, 59, 59, 999999, 0],
  )
}

///|
test "relative delta original between 12 UTC/1/5" {
  let first = @date.parse_iso("9999-12-31T23:59:59.999999+00:00")
  let second = @date.parse_iso("2024-03-31T00:00:00+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), 7975L)
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
    [0.0, 0.0, 23.0, 59.0, 59.0, 999999.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [9999, 12, 31, 23, 59, 59, 999999, 0],
  )
}

///|
test "relative delta original between 13 UTC/1/6" {
  let first = @date.parse_iso("9999-12-31T23:59:59.999999+00:00")
  let second = @date.parse_iso("2024-04-30T00:00:00+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), 7975L)
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
    [1.0, 0.0, 23.0, 59.0, 59.0, 999999.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [9999, 12, 31, 23, 59, 59, 999999, 0],
  )
}

///|
test "relative delta original between 14 UTC/2/0" {
  let first = @date.parse_iso("2020-01-31T23:59:59.999999+00:00")
  let second = @date.parse_iso("0001-01-01T00:00:00+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), 2019L)
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
    [30.0, 0.0, 23.0, 59.0, 59.0, 999999.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2020, 1, 31, 23, 59, 59, 999999, 0],
  )
}

///|
test "relative delta original between 15 UTC/2/1" {
  let first = @date.parse_iso("2020-01-31T23:59:59.999999+00:00")
  let second = @date.parse_iso("9999-12-31T23:59:59.999999+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), -7979L)
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
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2020, 1, 31, 23, 59, 59, 999999, 0],
  )
}

///|
test "relative delta original between 16 UTC/2/2" {
  let first = @date.parse_iso("2020-01-31T23:59:59.999999+00:00")
  let second = @date.parse_iso("2020-01-31T23:59:59.999999+00:00")
  let delta = @date.RelativeDelta::between(first, second)
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
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2020, 1, 31, 23, 59, 59, 999999, 0],
  )
}

///|
test "relative delta original between 17 UTC/2/3" {
  let first = @date.parse_iso("2020-01-31T23:59:59.999999+00:00")
  let second = @date.parse_iso("2020-02-29T00:00:00+00:00")
  let delta = @date.RelativeDelta::between(first, second)
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
    [-28.0, 0.0, 0.0, 0.0, -1.0, 999999.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2020, 1, 31, 23, 59, 59, 999999, 0],
  )
}

///|
test "relative delta original between 18 UTC/2/4" {
  let first = @date.parse_iso("2020-01-31T23:59:59.999999+00:00")
  let second = @date.parse_iso("2021-02-28T23:00:00+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), -1L)
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
    [-27.0, 0.0, -23.0, 0.0, -1.0, 999999.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2020, 1, 31, 23, 59, 59, 999999, 0],
  )
}

///|
test "relative delta original between 19 UTC/2/5" {
  let first = @date.parse_iso("2020-01-31T23:59:59.999999+00:00")
  let second = @date.parse_iso("2024-03-31T00:00:00+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), -4L)
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
    [-28.0, 0.0, 0.0, 0.0, -1.0, 999999.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2020, 1, 31, 23, 59, 59, 999999, 0],
  )
}

///|
test "relative delta original between 20 UTC/2/6" {
  let first = @date.parse_iso("2020-01-31T23:59:59.999999+00:00")
  let second = @date.parse_iso("2024-04-30T00:00:00+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), -4L)
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
    [-28.0, 0.0, 0.0, 0.0, -1.0, 999999.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2020, 1, 31, 23, 59, 59, 999999, 0],
  )
}

///|
test "relative delta original between 21 UTC/3/0" {
  let first = @date.parse_iso("2020-02-29T00:00:00+00:00")
  let second = @date.parse_iso("0001-01-01T00:00:00+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), 2019L)
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
    [28.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2020, 2, 29, 0, 0, 0, 0, 0],
  )
}

///|
test "relative delta original between 22 UTC/3/1" {
  let first = @date.parse_iso("2020-02-29T00:00:00+00:00")
  let second = @date.parse_iso("9999-12-31T23:59:59.999999+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), -7979L)
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
    [-1.0, 0.0, 0.0, 0.0, 0.0, 1.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2020, 2, 29, 0, 0, 0, 0, 0],
  )
}

///|
test "relative delta original between 23 UTC/3/2" {
  let first = @date.parse_iso("2020-02-29T00:00:00+00:00")
  let second = @date.parse_iso("2020-01-31T23:59:59.999999+00:00")
  let delta = @date.RelativeDelta::between(first, second)
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
    [28.0, 0.0, 0.0, 0.0, 0.0, 1.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2020, 2, 29, 0, 0, 0, 0, 0],
  )
}

///|
test "relative delta original between 24 UTC/3/3" {
  let first = @date.parse_iso("2020-02-29T00:00:00+00:00")
  let second = @date.parse_iso("2020-02-29T00:00:00+00:00")
  let delta = @date.RelativeDelta::between(first, second)
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
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2020, 2, 29, 0, 0, 0, 0, 0],
  )
}

///|
test "relative delta original between 25 UTC/3/4" {
  let first = @date.parse_iso("2020-02-29T00:00:00+00:00")
  let second = @date.parse_iso("2021-02-28T23:00:00+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), 0L)
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
    [-28.0, 0.0, -23.0, 0.0, 0.0, 0.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2020, 2, 29, 0, 0, 0, 0, 0],
  )
}

///|
test "relative delta original between 26 UTC/3/5" {
  let first = @date.parse_iso("2020-02-29T00:00:00+00:00")
  let second = @date.parse_iso("2024-03-31T00:00:00+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), -4L)
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
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2020, 2, 29, 0, 0, 0, 0, 0],
  )
}

///|
test "relative delta original between 27 UTC/3/6" {
  let first = @date.parse_iso("2020-02-29T00:00:00+00:00")
  let second = @date.parse_iso("2024-04-30T00:00:00+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), -4L)
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
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2020, 2, 29, 0, 0, 0, 0, 0],
  )
}

///|
test "relative delta original between 28 UTC/4/0" {
  let first = @date.parse_iso("2021-02-28T23:00:00+00:00")
  let second = @date.parse_iso("0001-01-01T00:00:00+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), 2020L)
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
    [27.0, 0.0, 23.0, 0.0, 0.0, 0.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2021, 2, 28, 23, 0, 0, 0, 0],
  )
}

///|
test "relative delta original between 29 UTC/4/1" {
  let first = @date.parse_iso("2021-02-28T23:00:00+00:00")
  let second = @date.parse_iso("9999-12-31T23:59:59.999999+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), -7978L)
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
    [0.0, 0.0, -1.0, 0.0, 0.0, 1.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2021, 2, 28, 23, 0, 0, 0, 0],
  )
}

///|
test "relative delta original between 30 UTC/4/2" {
  let first = @date.parse_iso("2021-02-28T23:00:00+00:00")
  let second = @date.parse_iso("2020-01-31T23:59:59.999999+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), 1L)
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
    [27.0, 0.0, 23.0, 0.0, 0.0, 1.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2021, 2, 28, 23, 0, 0, 0, 0],
  )
}

///|
test "relative delta original between 31 UTC/4/3" {
  let first = @date.parse_iso("2021-02-28T23:00:00+00:00")
  let second = @date.parse_iso("2020-02-29T00:00:00+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), 1L)
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
    [0.0, 0.0, 23.0, 0.0, 0.0, 0.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2021, 2, 28, 23, 0, 0, 0, 0],
  )
}

///|
test "relative delta original between 32 UTC/4/4" {
  let first = @date.parse_iso("2021-02-28T23:00:00+00:00")
  let second = @date.parse_iso("2021-02-28T23:00:00+00:00")
  let delta = @date.RelativeDelta::between(first, second)
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
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2021, 2, 28, 23, 0, 0, 0, 0],
  )
}

///|
test "relative delta original between 33 UTC/4/5" {
  let first = @date.parse_iso("2021-02-28T23:00:00+00:00")
  let second = @date.parse_iso("2024-03-31T00:00:00+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), -3L)
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
    [-30.0, 0.0, -1.0, 0.0, 0.0, 0.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2021, 2, 28, 23, 0, 0, 0, 0],
  )
}

///|
test "relative delta original between 34 UTC/4/6" {
  let first = @date.parse_iso("2021-02-28T23:00:00+00:00")
  let second = @date.parse_iso("2024-04-30T00:00:00+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), -3L)
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
    [-29.0, 0.0, -1.0, 0.0, 0.0, 0.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2021, 2, 28, 23, 0, 0, 0, 0],
  )
}

///|
test "relative delta original between 35 UTC/5/0" {
  let first = @date.parse_iso("2024-03-31T00:00:00+00:00")
  let second = @date.parse_iso("0001-01-01T00:00:00+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), 2023L)
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
    [30.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2024, 3, 31, 0, 0, 0, 0, 0],
  )
}

///|
test "relative delta original between 36 UTC/5/1" {
  let first = @date.parse_iso("2024-03-31T00:00:00+00:00")
  let second = @date.parse_iso("9999-12-31T23:59:59.999999+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), -7975L)
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
    [-1.0, 0.0, 0.0, 0.0, 0.0, 1.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2024, 3, 31, 0, 0, 0, 0, 0],
  )
}

///|
test "relative delta original between 37 UTC/5/2" {
  let first = @date.parse_iso("2024-03-31T00:00:00+00:00")
  let second = @date.parse_iso("2020-01-31T23:59:59.999999+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), 4L)
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
    [30.0, 0.0, 0.0, 0.0, 0.0, 1.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2024, 3, 31, 0, 0, 0, 0, 0],
  )
}

///|
test "relative delta original between 38 UTC/5/3" {
  let first = @date.parse_iso("2024-03-31T00:00:00+00:00")
  let second = @date.parse_iso("2020-02-29T00:00:00+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), 4L)
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
    [2.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2024, 3, 31, 0, 0, 0, 0, 0],
  )
}

///|
test "relative delta original between 39 UTC/5/4" {
  let first = @date.parse_iso("2024-03-31T00:00:00+00:00")
  let second = @date.parse_iso("2021-02-28T23:00:00+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), 3L)
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
    [2.0, 0.0, 1.0, 0.0, 0.0, 0.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2024, 3, 31, 0, 0, 0, 0, 0],
  )
}

///|
test "relative delta original between 40 UTC/5/5" {
  let first = @date.parse_iso("2024-03-31T00:00:00+00:00")
  let second = @date.parse_iso("2024-03-31T00:00:00+00:00")
  let delta = @date.RelativeDelta::between(first, second)
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
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2024, 3, 31, 0, 0, 0, 0, 0],
  )
}

///|
test "relative delta original between 41 UTC/5/6" {
  let first = @date.parse_iso("2024-03-31T00:00:00+00:00")
  let second = @date.parse_iso("2024-04-30T00:00:00+00:00")
  let delta = @date.RelativeDelta::between(first, second)
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
    [-30.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2024, 3, 31, 0, 0, 0, 0, 0],
  )
}

///|
test "relative delta original between 42 UTC/6/0" {
  let first = @date.parse_iso("2024-04-30T00:00:00+00:00")
  let second = @date.parse_iso("0001-01-01T00:00:00+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), 2023L)
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
    [29.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2024, 4, 30, 0, 0, 0, 0, 0],
  )
}

///|
test "relative delta original between 43 UTC/6/1" {
  let first = @date.parse_iso("2024-04-30T00:00:00+00:00")
  let second = @date.parse_iso("9999-12-31T23:59:59.999999+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), -7975L)
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
    [-1.0, 0.0, 0.0, 0.0, 0.0, 1.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2024, 4, 30, 0, 0, 0, 0, 0],
  )
}

///|
test "relative delta original between 44 UTC/6/2" {
  let first = @date.parse_iso("2024-04-30T00:00:00+00:00")
  let second = @date.parse_iso("2020-01-31T23:59:59.999999+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), 4L)
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
    [29.0, 0.0, 0.0, 0.0, 0.0, 1.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2024, 4, 30, 0, 0, 0, 0, 0],
  )
}

///|
test "relative delta original between 45 UTC/6/3" {
  let first = @date.parse_iso("2024-04-30T00:00:00+00:00")
  let second = @date.parse_iso("2020-02-29T00:00:00+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), 4L)
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
    [1.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2024, 4, 30, 0, 0, 0, 0, 0],
  )
}

///|
test "relative delta original between 46 UTC/6/4" {
  let first = @date.parse_iso("2024-04-30T00:00:00+00:00")
  let second = @date.parse_iso("2021-02-28T23:00:00+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), 3L)
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
    [1.0, 0.0, 1.0, 0.0, 0.0, 0.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2024, 4, 30, 0, 0, 0, 0, 0],
  )
}

///|
test "relative delta original between 47 UTC/6/5" {
  let first = @date.parse_iso("2024-04-30T00:00:00+00:00")
  let second = @date.parse_iso("2024-03-31T00:00:00+00:00")
  let delta = @date.RelativeDelta::between(first, second)
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
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2024, 4, 30, 0, 0, 0, 0, 0],
  )
}

///|
test "relative delta original between 48 UTC/6/6" {
  let first = @date.parse_iso("2024-04-30T00:00:00+00:00")
  let second = @date.parse_iso("2024-04-30T00:00:00+00:00")
  let delta = @date.RelativeDelta::between(first, second)
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
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2024, 4, 30, 0, 0, 0, 0, 0],
  )
}

///|
test "relative delta original between 49 fixed second offset" {
  let first = @date.parse_iso("2020-01-31T23:59:59.999999+00:09:21")
  let second = @date.parse_iso("2020-02-29T00:00:00+00:00")
  let delta = @date.RelativeDelta::between(first, second)
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
    [-28.0, 0.0, 0.0, -9.0, -22.0, 999999.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2020, 1, 31, 23, 50, 38, 999999, 0],
  )
}

///|
test "relative delta original between 50 fixed reverse" {
  let first = @date.parse_iso("2020-02-29T00:00:00+00:00")
  let second = @date.parse_iso("2020-01-31T23:59:59.999999+00:09:21")
  let delta = @date.RelativeDelta::between(first, second)
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
    [28.0, 0.0, 0.0, 9.0, 21.0, 1.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2020, 2, 29, 0, 9, 21, 0, 561],
  )
}

///|
test "relative delta original between 51 fixed second offset" {
  let first = @date.parse_iso("2020-01-31T23:59:59.999999+00:00")
  let second = @date.parse_iso("2020-02-29T00:00:00+00:09:21")
  let delta = @date.RelativeDelta::between(first, second)
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
    [-27.0, 0.0, -23.0, -50.0, -40.0, 999999.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2020, 2, 1, 0, 9, 20, 999999, 561],
  )
}

///|
test "relative delta original between 52 fixed reverse" {
  let first = @date.parse_iso("2020-02-29T00:00:00+00:09:21")
  let second = @date.parse_iso("2020-01-31T23:59:59.999999+00:00")
  let delta = @date.RelativeDelta::between(first, second)
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
    [27.0, 0.0, 23.0, 50.0, 39.0, 1.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2020, 2, 28, 23, 50, 39, 0, 0],
  )
}

///|
test "relative delta original between 53 NY-same" {
  let first_zone = @date.tzif_timezone(tzif_new_york)
  let second_zone = first_zone
  let first = @date.parse_iso("2024-03-11T01:30:00-04:00").with_timezone(
    first_zone,
  )
  let second = @date.parse_iso("2024-03-09T01:30:00-05:00").with_timezone(
    second_zone,
  )
  let delta = @date.RelativeDelta::between(first, second)
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
    [2.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2024, 3, 11, 1, 30, 0, 0, -14400],
  )
}

///|
test "relative delta original between 54 NY-same reverse" {
  let first_zone = @date.tzif_timezone(tzif_new_york)
  let second_zone = first_zone
  let first = @date.parse_iso("2024-03-09T01:30:00-05:00").with_timezone(
    first_zone,
  )
  let second = @date.parse_iso("2024-03-11T01:30:00-04:00").with_timezone(
    second_zone,
  )
  let delta = @date.RelativeDelta::between(first, second)
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
    [-2.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2024, 3, 9, 1, 30, 0, 0, -18000],
  )
}

///|
test "relative delta original between 55 NY-same" {
  let first_zone = @date.tzif_timezone(tzif_new_york)
  let second_zone = first_zone
  let first = @date.parse_iso("2024-11-04T01:30:00-05:00").with_timezone(
    first_zone,
  )
  let second = @date.parse_iso("2024-11-02T01:30:00-04:00").with_timezone(
    second_zone,
  )
  let delta = @date.RelativeDelta::between(first, second)
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
    [2.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2024, 11, 4, 1, 30, 0, 0, -18000],
  )
}

///|
test "relative delta original between 56 NY-same reverse" {
  let first_zone = @date.tzif_timezone(tzif_new_york)
  let second_zone = first_zone
  let first = @date.parse_iso("2024-11-02T01:30:00-04:00").with_timezone(
    first_zone,
  )
  let second = @date.parse_iso("2024-11-04T01:30:00-05:00").with_timezone(
    second_zone,
  )
  let delta = @date.RelativeDelta::between(first, second)
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
    [-2.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2024, 11, 2, 1, 30, 0, 0, -14400],
  )
}

///|
test "relative delta original between 57 NY-same" {
  let first_zone = @date.tzif_timezone(tzif_new_york)
  let second_zone = first_zone
  let first = @date.parse_iso("2024-11-03T01:30:00-04:00").with_timezone(
    first_zone,
  )
  let second = @date.parse_iso("2024-11-03T01:30:00-05:00").with_timezone(
    second_zone,
  )
  let delta = @date.RelativeDelta::between(first, second)
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
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2024, 11, 3, 1, 30, 0, 0, -14400],
  )
}

///|
test "relative delta original between 58 NY-same reverse" {
  let first_zone = @date.tzif_timezone(tzif_new_york)
  let second_zone = first_zone
  let first = @date.parse_iso("2024-11-03T01:30:00-05:00").with_timezone(
    first_zone,
  )
  let second = @date.parse_iso("2024-11-03T01:30:00-04:00").with_timezone(
    second_zone,
  )
  let delta = @date.RelativeDelta::between(first, second)
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
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2024, 11, 3, 1, 30, 0, 0, -14400],
  )
}

///|
test "relative delta original between 59 NY-same" {
  let first_zone = @date.tzif_timezone(tzif_new_york)
  let second_zone = first_zone
  let first = @date.parse_iso("2024-04-08T01:45:00-04:00").with_timezone(
    first_zone,
  )
  let second = @date.parse_iso("2024-04-06T01:45:00-04:00").with_timezone(
    second_zone,
  )
  let delta = @date.RelativeDelta::between(first, second)
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
    [2.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2024, 4, 8, 1, 45, 0, 0, -14400],
  )
}

///|
test "relative delta original between 60 NY-same reverse" {
  let first_zone = @date.tzif_timezone(tzif_new_york)
  let second_zone = first_zone
  let first = @date.parse_iso("2024-04-06T01:45:00-04:00").with_timezone(
    first_zone,
  )
  let second = @date.parse_iso("2024-04-08T01:45:00-04:00").with_timezone(
    second_zone,
  )
  let delta = @date.RelativeDelta::between(first, second)
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
    [-2.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2024, 4, 6, 1, 45, 0, 0, -14400],
  )
}

///|
test "relative delta original between 61 NY-same" {
  let first_zone = @date.tzif_timezone(tzif_new_york)
  let second_zone = first_zone
  let first = @date.parse_iso("2024-10-07T02:15:00-04:00").with_timezone(
    first_zone,
  )
  let second = @date.parse_iso("2024-10-05T02:15:00-04:00").with_timezone(
    second_zone,
  )
  let delta = @date.RelativeDelta::between(first, second)
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
    [2.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2024, 10, 7, 2, 15, 0, 0, -14400],
  )
}

///|
test "relative delta original between 62 NY-same reverse" {
  let first_zone = @date.tzif_timezone(tzif_new_york)
  let second_zone = first_zone
  let first = @date.parse_iso("2024-10-05T02:15:00-04:00").with_timezone(
    first_zone,
  )
  let second = @date.parse_iso("2024-10-07T02:15:00-04:00").with_timezone(
    second_zone,
  )
  let delta = @date.RelativeDelta::between(first, second)
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
    [-2.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2024, 10, 5, 2, 15, 0, 0, -14400],
  )
}

///|
test "relative delta original between 63 NY-separate" {
  let first_zone = @date.tzif_timezone(tzif_new_york)
  let second_zone = @date.tzif_timezone(tzif_new_york)
  let first = @date.parse_iso("2024-03-11T01:30:00-04:00").with_timezone(
    first_zone,
  )
  let second = @date.parse_iso("2024-03-09T01:30:00-05:00").with_timezone(
    second_zone,
  )
  let delta = @date.RelativeDelta::between(first, second)
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
    [1.0, 0.0, 23.0, 0.0, 0.0, 0.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2024, 3, 11, 0, 30, 0, 0, -14400],
  )
}

///|
test "relative delta original between 64 NY-separate reverse" {
  let first_zone = @date.tzif_timezone(tzif_new_york)
  let second_zone = @date.tzif_timezone(tzif_new_york)
  let first = @date.parse_iso("2024-03-09T01:30:00-05:00").with_timezone(
    first_zone,
  )
  let second = @date.parse_iso("2024-03-11T01:30:00-04:00").with_timezone(
    second_zone,
  )
  let delta = @date.RelativeDelta::between(first, second)
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
    [-1.0, 0.0, -23.0, 0.0, 0.0, 0.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2024, 3, 9, 2, 30, 0, 0, -18000],
  )
}

///|
test "relative delta original between 65 NY-separate" {
  let first_zone = @date.tzif_timezone(tzif_new_york)
  let second_zone = @date.tzif_timezone(tzif_new_york)
  let first = @date.parse_iso("2024-11-04T01:30:00-05:00").with_timezone(
    first_zone,
  )
  let second = @date.parse_iso("2024-11-02T01:30:00-04:00").with_timezone(
    second_zone,
  )
  let delta = @date.RelativeDelta::between(first, second)
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
    [2.0, 0.0, 1.0, 0.0, 0.0, 0.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2024, 11, 4, 2, 30, 0, 0, -18000],
  )
}

///|
test "relative delta original between 66 NY-separate reverse" {
  let first_zone = @date.tzif_timezone(tzif_new_york)
  let second_zone = @date.tzif_timezone(tzif_new_york)
  let first = @date.parse_iso("2024-11-02T01:30:00-04:00").with_timezone(
    first_zone,
  )
  let second = @date.parse_iso("2024-11-04T01:30:00-05:00").with_timezone(
    second_zone,
  )
  let delta = @date.RelativeDelta::between(first, second)
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
    [-2.0, 0.0, -1.0, 0.0, 0.0, 0.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2024, 11, 2, 0, 30, 0, 0, -14400],
  )
}

///|
test "relative delta original between 67 NY-separate" {
  let first_zone = @date.tzif_timezone(tzif_new_york)
  let second_zone = @date.tzif_timezone(tzif_new_york)
  let first = @date.parse_iso("2024-11-03T01:30:00-04:00").with_timezone(
    first_zone,
  )
  let second = @date.parse_iso("2024-11-03T01:30:00-05:00").with_timezone(
    second_zone,
  )
  let delta = @date.RelativeDelta::between(first, second)
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
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2024, 11, 3, 1, 30, 0, 0, -14400],
  )
}

///|
test "relative delta original between 68 NY-separate reverse" {
  let first_zone = @date.tzif_timezone(tzif_new_york)
  let second_zone = @date.tzif_timezone(tzif_new_york)
  let first = @date.parse_iso("2024-11-03T01:30:00-05:00").with_timezone(
    first_zone,
  )
  let second = @date.parse_iso("2024-11-03T01:30:00-04:00").with_timezone(
    second_zone,
  )
  let delta = @date.RelativeDelta::between(first, second)
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
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2024, 11, 3, 2, 30, 0, 0, -18000],
  )
}

///|
test "relative delta original between 69 NY-separate" {
  let first_zone = @date.tzif_timezone(tzif_new_york)
  let second_zone = @date.tzif_timezone(tzif_new_york)
  let first = @date.parse_iso("2024-04-08T01:45:00-04:00").with_timezone(
    first_zone,
  )
  let second = @date.parse_iso("2024-04-06T01:45:00-04:00").with_timezone(
    second_zone,
  )
  let delta = @date.RelativeDelta::between(first, second)
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
    [2.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2024, 4, 8, 1, 45, 0, 0, -14400],
  )
}

///|
test "relative delta original between 70 NY-separate reverse" {
  let first_zone = @date.tzif_timezone(tzif_new_york)
  let second_zone = @date.tzif_timezone(tzif_new_york)
  let first = @date.parse_iso("2024-04-06T01:45:00-04:00").with_timezone(
    first_zone,
  )
  let second = @date.parse_iso("2024-04-08T01:45:00-04:00").with_timezone(
    second_zone,
  )
  let delta = @date.RelativeDelta::between(first, second)
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
    [-2.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2024, 4, 6, 1, 45, 0, 0, -14400],
  )
}

///|
test "relative delta original between 71 NY-separate" {
  let first_zone = @date.tzif_timezone(tzif_new_york)
  let second_zone = @date.tzif_timezone(tzif_new_york)
  let first = @date.parse_iso("2024-10-07T02:15:00-04:00").with_timezone(
    first_zone,
  )
  let second = @date.parse_iso("2024-10-05T02:15:00-04:00").with_timezone(
    second_zone,
  )
  let delta = @date.RelativeDelta::between(first, second)
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
    [2.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2024, 10, 7, 2, 15, 0, 0, -14400],
  )
}

///|
test "relative delta original between 72 NY-separate reverse" {
  let first_zone = @date.tzif_timezone(tzif_new_york)
  let second_zone = @date.tzif_timezone(tzif_new_york)
  let first = @date.parse_iso("2024-10-05T02:15:00-04:00").with_timezone(
    first_zone,
  )
  let second = @date.parse_iso("2024-10-07T02:15:00-04:00").with_timezone(
    second_zone,
  )
  let delta = @date.RelativeDelta::between(first, second)
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
    [-2.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2024, 10, 5, 2, 15, 0, 0, -14400],
  )
}

///|
test "relative delta original between 73 NY-UTC" {
  let first_zone = @date.tzif_timezone(tzif_new_york)
  let first = @date.parse_iso("2024-03-11T01:30:00-04:00").with_timezone(
    first_zone,
  )
  let second = @date.parse_iso("2024-03-09T01:30:00+00:00")
  let delta = @date.RelativeDelta::between(first, second)
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
    [2.0, 0.0, 4.0, 0.0, 0.0, 0.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2024, 3, 11, 5, 30, 0, 0, 0],
  )
}

///|
test "relative delta original between 74 NY-UTC reverse" {
  let first_zone = @date.tzif_timezone(tzif_new_york)
  let first = @date.parse_iso("2024-03-09T01:30:00+00:00")
  let second = @date.parse_iso("2024-03-11T01:30:00-04:00").with_timezone(
    first_zone,
  )
  let delta = @date.RelativeDelta::between(first, second)
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
    [-2.0, 0.0, -4.0, 0.0, 0.0, 0.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2024, 3, 8, 21, 30, 0, 0, -18000],
  )
}

///|
test "relative delta original between 75 NY-UTC" {
  let first_zone = @date.tzif_timezone(tzif_new_york)
  let first = @date.parse_iso("2024-11-04T01:30:00-05:00").with_timezone(
    first_zone,
  )
  let second = @date.parse_iso("2024-11-02T01:30:00+00:00")
  let delta = @date.RelativeDelta::between(first, second)
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
    [2.0, 0.0, 5.0, 0.0, 0.0, 0.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2024, 11, 4, 6, 30, 0, 0, 0],
  )
}

///|
test "relative delta original between 76 NY-UTC reverse" {
  let first_zone = @date.tzif_timezone(tzif_new_york)
  let first = @date.parse_iso("2024-11-02T01:30:00+00:00")
  let second = @date.parse_iso("2024-11-04T01:30:00-05:00").with_timezone(
    first_zone,
  )
  let delta = @date.RelativeDelta::between(first, second)
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
    [-2.0, 0.0, -5.0, 0.0, 0.0, 0.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2024, 11, 1, 20, 30, 0, 0, -14400],
  )
}

///|
test "relative delta original between 77 NY-UTC" {
  let first_zone = @date.tzif_timezone(tzif_new_york)
  let first = @date.parse_iso("2024-11-03T01:30:00-04:00").with_timezone(
    first_zone,
  )
  let second = @date.parse_iso("2024-11-03T01:30:00+00:00")
  let delta = @date.RelativeDelta::between(first, second)
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
    [0.0, 0.0, 4.0, 0.0, 0.0, 0.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2024, 11, 3, 5, 30, 0, 0, 0],
  )
}

///|
test "relative delta original between 78 NY-UTC reverse" {
  let first_zone = @date.tzif_timezone(tzif_new_york)
  let first = @date.parse_iso("2024-11-03T01:30:00+00:00")
  let second = @date.parse_iso("2024-11-03T01:30:00-04:00").with_timezone(
    first_zone,
  )
  let delta = @date.RelativeDelta::between(first, second)
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
    [0.0, 0.0, -4.0, 0.0, 0.0, 0.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2024, 11, 2, 21, 30, 0, 0, -14400],
  )
}

///|
test "relative delta original between 79 NY-UTC" {
  let first_zone = @date.tzif_timezone(tzif_new_york)
  let first = @date.parse_iso("2024-04-08T01:45:00-04:00").with_timezone(
    first_zone,
  )
  let second = @date.parse_iso("2024-04-06T01:45:00+00:00")
  let delta = @date.RelativeDelta::between(first, second)
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
    [2.0, 0.0, 4.0, 0.0, 0.0, 0.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2024, 4, 8, 5, 45, 0, 0, 0],
  )
}

///|
test "relative delta original between 80 NY-UTC reverse" {
  let first_zone = @date.tzif_timezone(tzif_new_york)
  let first = @date.parse_iso("2024-04-06T01:45:00+00:00")
  let second = @date.parse_iso("2024-04-08T01:45:00-04:00").with_timezone(
    first_zone,
  )
  let delta = @date.RelativeDelta::between(first, second)
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
    [-2.0, 0.0, -4.0, 0.0, 0.0, 0.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2024, 4, 5, 21, 45, 0, 0, -14400],
  )
}

///|
test "relative delta original between 81 NY-UTC" {
  let first_zone = @date.tzif_timezone(tzif_new_york)
  let first = @date.parse_iso("2024-10-07T02:15:00-04:00").with_timezone(
    first_zone,
  )
  let second = @date.parse_iso("2024-10-05T02:15:00+00:00")
  let delta = @date.RelativeDelta::between(first, second)
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
    [2.0, 0.0, 4.0, 0.0, 0.0, 0.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2024, 10, 7, 6, 15, 0, 0, 0],
  )
}

///|
test "relative delta original between 82 NY-UTC reverse" {
  let first_zone = @date.tzif_timezone(tzif_new_york)
  let first = @date.parse_iso("2024-10-05T02:15:00+00:00")
  let second = @date.parse_iso("2024-10-07T02:15:00-04:00").with_timezone(
    first_zone,
  )
  let delta = @date.RelativeDelta::between(first, second)
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
    [-2.0, 0.0, -4.0, 0.0, 0.0, 0.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2024, 10, 4, 22, 15, 0, 0, -14400],
  )
}

///|
test "relative delta original between 83 LH-same" {
  let first_zone = @date.tzif_timezone(tzif_lord_howe)
  let second_zone = first_zone
  let first = @date.parse_iso("2024-03-11T01:30:00+11:00").with_timezone(
    first_zone,
  )
  let second = @date.parse_iso("2024-03-09T01:30:00+11:00").with_timezone(
    second_zone,
  )
  let delta = @date.RelativeDelta::between(first, second)
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
    [2.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2024, 3, 11, 1, 30, 0, 0, 39600],
  )
}

///|
test "relative delta original between 84 LH-same reverse" {
  let first_zone = @date.tzif_timezone(tzif_lord_howe)
  let second_zone = first_zone
  let first = @date.parse_iso("2024-03-09T01:30:00+11:00").with_timezone(
    first_zone,
  )
  let second = @date.parse_iso("2024-03-11T01:30:00+11:00").with_timezone(
    second_zone,
  )
  let delta = @date.RelativeDelta::between(first, second)
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
    [-2.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2024, 3, 9, 1, 30, 0, 0, 39600],
  )
}

///|
test "relative delta original between 85 LH-same" {
  let first_zone = @date.tzif_timezone(tzif_lord_howe)
  let second_zone = first_zone
  let first = @date.parse_iso("2024-11-04T01:30:00+11:00").with_timezone(
    first_zone,
  )
  let second = @date.parse_iso("2024-11-02T01:30:00+11:00").with_timezone(
    second_zone,
  )
  let delta = @date.RelativeDelta::between(first, second)
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
    [2.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2024, 11, 4, 1, 30, 0, 0, 39600],
  )
}

///|
test "relative delta original between 86 LH-same reverse" {
  let first_zone = @date.tzif_timezone(tzif_lord_howe)
  let second_zone = first_zone
  let first = @date.parse_iso("2024-11-02T01:30:00+11:00").with_timezone(
    first_zone,
  )
  let second = @date.parse_iso("2024-11-04T01:30:00+11:00").with_timezone(
    second_zone,
  )
  let delta = @date.RelativeDelta::between(first, second)
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
    [-2.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2024, 11, 2, 1, 30, 0, 0, 39600],
  )
}

///|
test "relative delta original between 87 LH-same" {
  let first_zone = @date.tzif_timezone(tzif_lord_howe)
  let second_zone = first_zone
  let first = @date.parse_iso("2024-11-03T01:30:00+11:00").with_timezone(
    first_zone,
  )
  let second = @date.parse_iso("2024-11-03T01:30:00+11:00").with_timezone(
    second_zone,
  )
  let delta = @date.RelativeDelta::between(first, second)
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
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2024, 11, 3, 1, 30, 0, 0, 39600],
  )
}

///|
test "relative delta original between 88 LH-same reverse" {
  let first_zone = @date.tzif_timezone(tzif_lord_howe)
  let second_zone = first_zone
  let first = @date.parse_iso("2024-11-03T01:30:00+11:00").with_timezone(
    first_zone,
  )
  let second = @date.parse_iso("2024-11-03T01:30:00+11:00").with_timezone(
    second_zone,
  )
  let delta = @date.RelativeDelta::between(first, second)
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
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2024, 11, 3, 1, 30, 0, 0, 39600],
  )
}

///|
test "relative delta original between 89 LH-same" {
  let first_zone = @date.tzif_timezone(tzif_lord_howe)
  let second_zone = first_zone
  let first = @date.parse_iso("2024-04-08T01:45:00+10:30").with_timezone(
    first_zone,
  )
  let second = @date.parse_iso("2024-04-06T01:45:00+11:00").with_timezone(
    second_zone,
  )
  let delta = @date.RelativeDelta::between(first, second)
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
    [2.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2024, 4, 8, 1, 45, 0, 0, 37800],
  )
}

///|
test "relative delta original between 90 LH-same reverse" {
  let first_zone = @date.tzif_timezone(tzif_lord_howe)
  let second_zone = first_zone
  let first = @date.parse_iso("2024-04-06T01:45:00+11:00").with_timezone(
    first_zone,
  )
  let second = @date.parse_iso("2024-04-08T01:45:00+10:30").with_timezone(
    second_zone,
  )
  let delta = @date.RelativeDelta::between(first, second)
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
    [-2.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2024, 4, 6, 1, 45, 0, 0, 39600],
  )
}

///|
test "relative delta original between 91 LH-same" {
  let first_zone = @date.tzif_timezone(tzif_lord_howe)
  let second_zone = first_zone
  let first = @date.parse_iso("2024-10-07T02:15:00+11:00").with_timezone(
    first_zone,
  )
  let second = @date.parse_iso("2024-10-05T02:15:00+10:30").with_timezone(
    second_zone,
  )
  let delta = @date.RelativeDelta::between(first, second)
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
    [2.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2024, 10, 7, 2, 15, 0, 0, 39600],
  )
}

///|
test "relative delta original between 92 LH-same reverse" {
  let first_zone = @date.tzif_timezone(tzif_lord_howe)
  let second_zone = first_zone
  let first = @date.parse_iso("2024-10-05T02:15:00+10:30").with_timezone(
    first_zone,
  )
  let second = @date.parse_iso("2024-10-07T02:15:00+11:00").with_timezone(
    second_zone,
  )
  let delta = @date.RelativeDelta::between(first, second)
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
    [-2.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2024, 10, 5, 2, 15, 0, 0, 37800],
  )
}

///|
test "relative delta original between 93 LH-separate" {
  let first_zone = @date.tzif_timezone(tzif_lord_howe)
  let second_zone = @date.tzif_timezone(tzif_lord_howe)
  let first = @date.parse_iso("2024-03-11T01:30:00+11:00").with_timezone(
    first_zone,
  )
  let second = @date.parse_iso("2024-03-09T01:30:00+11:00").with_timezone(
    second_zone,
  )
  let delta = @date.RelativeDelta::between(first, second)
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
    [2.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2024, 3, 11, 1, 30, 0, 0, 39600],
  )
}

///|
test "relative delta original between 94 LH-separate reverse" {
  let first_zone = @date.tzif_timezone(tzif_lord_howe)
  let second_zone = @date.tzif_timezone(tzif_lord_howe)
  let first = @date.parse_iso("2024-03-09T01:30:00+11:00").with_timezone(
    first_zone,
  )
  let second = @date.parse_iso("2024-03-11T01:30:00+11:00").with_timezone(
    second_zone,
  )
  let delta = @date.RelativeDelta::between(first, second)
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
    [-2.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2024, 3, 9, 1, 30, 0, 0, 39600],
  )
}

///|
test "relative delta original between 95 LH-separate" {
  let first_zone = @date.tzif_timezone(tzif_lord_howe)
  let second_zone = @date.tzif_timezone(tzif_lord_howe)
  let first = @date.parse_iso("2024-11-04T01:30:00+11:00").with_timezone(
    first_zone,
  )
  let second = @date.parse_iso("2024-11-02T01:30:00+11:00").with_timezone(
    second_zone,
  )
  let delta = @date.RelativeDelta::between(first, second)
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
    [2.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2024, 11, 4, 1, 30, 0, 0, 39600],
  )
}

///|
test "relative delta original between 96 LH-separate reverse" {
  let first_zone = @date.tzif_timezone(tzif_lord_howe)
  let second_zone = @date.tzif_timezone(tzif_lord_howe)
  let first = @date.parse_iso("2024-11-02T01:30:00+11:00").with_timezone(
    first_zone,
  )
  let second = @date.parse_iso("2024-11-04T01:30:00+11:00").with_timezone(
    second_zone,
  )
  let delta = @date.RelativeDelta::between(first, second)
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
    [-2.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2024, 11, 2, 1, 30, 0, 0, 39600],
  )
}

///|
test "relative delta original between 97 LH-separate" {
  let first_zone = @date.tzif_timezone(tzif_lord_howe)
  let second_zone = @date.tzif_timezone(tzif_lord_howe)
  let first = @date.parse_iso("2024-11-03T01:30:00+11:00").with_timezone(
    first_zone,
  )
  let second = @date.parse_iso("2024-11-03T01:30:00+11:00").with_timezone(
    second_zone,
  )
  let delta = @date.RelativeDelta::between(first, second)
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
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2024, 11, 3, 1, 30, 0, 0, 39600],
  )
}

///|
test "relative delta original between 98 LH-separate reverse" {
  let first_zone = @date.tzif_timezone(tzif_lord_howe)
  let second_zone = @date.tzif_timezone(tzif_lord_howe)
  let first = @date.parse_iso("2024-11-03T01:30:00+11:00").with_timezone(
    first_zone,
  )
  let second = @date.parse_iso("2024-11-03T01:30:00+11:00").with_timezone(
    second_zone,
  )
  let delta = @date.RelativeDelta::between(first, second)
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
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2024, 11, 3, 1, 30, 0, 0, 39600],
  )
}

///|
test "relative delta original between 99 LH-separate" {
  let first_zone = @date.tzif_timezone(tzif_lord_howe)
  let second_zone = @date.tzif_timezone(tzif_lord_howe)
  let first = @date.parse_iso("2024-04-08T01:45:00+10:30").with_timezone(
    first_zone,
  )
  let second = @date.parse_iso("2024-04-06T01:45:00+11:00").with_timezone(
    second_zone,
  )
  let delta = @date.RelativeDelta::between(first, second)
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
    [2.0, 0.0, 0.0, 30.0, 0.0, 0.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2024, 4, 8, 2, 15, 0, 0, 37800],
  )
}

///|
test "relative delta original between 100 LH-separate reverse" {
  let first_zone = @date.tzif_timezone(tzif_lord_howe)
  let second_zone = @date.tzif_timezone(tzif_lord_howe)
  let first = @date.parse_iso("2024-04-06T01:45:00+11:00").with_timezone(
    first_zone,
  )
  let second = @date.parse_iso("2024-04-08T01:45:00+10:30").with_timezone(
    second_zone,
  )
  let delta = @date.RelativeDelta::between(first, second)
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
    [-2.0, 0.0, 0.0, -30.0, 0.0, 0.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2024, 4, 6, 1, 15, 0, 0, 39600],
  )
}

///|
test "relative delta original between 101 LH-separate" {
  let first_zone = @date.tzif_timezone(tzif_lord_howe)
  let second_zone = @date.tzif_timezone(tzif_lord_howe)
  let first = @date.parse_iso("2024-10-07T02:15:00+11:00").with_timezone(
    first_zone,
  )
  let second = @date.parse_iso("2024-10-05T02:15:00+10:30").with_timezone(
    second_zone,
  )
  let delta = @date.RelativeDelta::between(first, second)
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
    [1.0, 0.0, 23.0, 30.0, 0.0, 0.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2024, 10, 7, 1, 45, 0, 0, 39600],
  )
}

///|
test "relative delta original between 102 LH-separate reverse" {
  let first_zone = @date.tzif_timezone(tzif_lord_howe)
  let second_zone = @date.tzif_timezone(tzif_lord_howe)
  let first = @date.parse_iso("2024-10-05T02:15:00+10:30").with_timezone(
    first_zone,
  )
  let second = @date.parse_iso("2024-10-07T02:15:00+11:00").with_timezone(
    second_zone,
  )
  let delta = @date.RelativeDelta::between(first, second)
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
    [-1.0, 0.0, -23.0, -30.0, 0.0, 0.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2024, 10, 5, 2, 45, 0, 0, 37800],
  )
}

///|
test "relative delta original between 103 random UTC" {
  let first = @date.parse_iso("1986-06-20T15:10:02.936374+00:00")
  let second = @date.parse_iso("1992-01-17T20:40:20.016454+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), -5L)
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
    [-27.0, 0.0, -5.0, -30.0, -18.0, 919920.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [1986, 6, 20, 15, 10, 2, 936374, 0],
  )
}

///|
test "relative delta original between 104 random UTC" {
  let first = @date.parse_iso("2024-08-07T20:41:23.245733+00:00")
  let second = @date.parse_iso("2031-10-01T14:04:30.539129+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), -7L)
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
    [-24.0, 0.0, -17.0, -23.0, -8.0, 706604.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2024, 8, 7, 20, 41, 23, 245733, 0],
  )
}

///|
test "relative delta original between 105 random UTC" {
  let first = @date.parse_iso("1998-04-03T17:45:43.522494+00:00")
  let second = @date.parse_iso("2014-11-04T06:00:23.390334+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), -16L)
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
    [0.0, 0.0, -12.0, -14.0, -40.0, 132160.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [1998, 4, 3, 17, 45, 43, 522494, 0],
  )
}

///|
test "relative delta original between 106 random UTC" {
  let first = @date.parse_iso("2036-06-16T04:21:20.216783+00:00")
  let second = @date.parse_iso("2037-11-14T12:05:18.798659+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), -1L)
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
    [-28.0, 0.0, -7.0, -43.0, -59.0, 418124.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2036, 6, 16, 4, 21, 20, 216783, 0],
  )
}

///|
test "relative delta original between 107 random UTC" {
  let first = @date.parse_iso("2036-02-22T06:06:11.552053+00:00")
  let second = @date.parse_iso("2047-07-20T07:44:30.038284+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), -11L)
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
    [-27.0, 0.0, -1.0, -38.0, -19.0, 513769.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2036, 2, 22, 6, 6, 11, 552053, 0],
  )
}

///|
test "relative delta original between 108 random UTC" {
  let first = @date.parse_iso("1995-11-18T13:24:51.384270+00:00")
  let second = @date.parse_iso("1999-01-03T22:30:12.472555+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), -3L)
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
    [-15.0, 0.0, -9.0, -5.0, -22.0, 911715.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [1995, 11, 18, 13, 24, 51, 384270, 0],
  )
}

///|
test "relative delta original between 109 random UTC" {
  let first = @date.parse_iso("1972-05-03T06:37:33.246375+00:00")
  let second = @date.parse_iso("2037-12-06T08:42:23.575978+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), -65L)
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
    [-3.0, 0.0, -2.0, -4.0, -51.0, 670397.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [1972, 5, 3, 6, 37, 33, 246375, 0],
  )
}

///|
test "relative delta original between 110 random UTC" {
  let first = @date.parse_iso("2014-06-18T23:32:03.212004+00:00")
  let second = @date.parse_iso("1997-02-17T05:38:56.784261+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), 17L)
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
    [1.0, 0.0, 17.0, 53.0, 6.0, 427743.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2014, 6, 18, 23, 32, 3, 212004, 0],
  )
}

///|
test "relative delta original between 111 random UTC" {
  let first = @date.parse_iso("2042-02-22T17:15:00.949226+00:00")
  let second = @date.parse_iso("1956-10-05T17:11:44.253793+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), 85L)
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
    [17.0, 0.0, 0.0, 3.0, 16.0, 695433.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2042, 2, 22, 17, 15, 0, 949226, 0],
  )
}

///|
test "relative delta original between 112 random UTC" {
  let first = @date.parse_iso("2033-06-09T13:01:02.306527+00:00")
  let second = @date.parse_iso("1978-03-26T07:32:24.474218+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), 55L)
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
    [14.0, 0.0, 5.0, 28.0, 37.0, 832309.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2033, 6, 9, 13, 1, 2, 306527, 0],
  )
}

///|
test "relative delta original between 113 random UTC" {
  let first = @date.parse_iso("2016-08-26T18:26:57.922927+00:00")
  let second = @date.parse_iso("1997-09-27T17:21:54.660537+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), 18L)
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
    [30.0, 0.0, 1.0, 5.0, 3.0, 262390.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2016, 8, 26, 18, 26, 57, 922927, 0],
  )
}

///|
test "relative delta original between 114 random UTC" {
  let first = @date.parse_iso("1988-02-24T12:27:25.649292+00:00")
  let second = @date.parse_iso("1963-12-10T22:33:14.586608+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), 24L)
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
    [13.0, 0.0, 13.0, 54.0, 11.0, 62684.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [1988, 2, 24, 12, 27, 25, 649292, 0],
  )
}

///|
test "relative delta original between 115 random UTC" {
  let first = @date.parse_iso("2003-06-24T22:42:56.604990+00:00")
  let second = @date.parse_iso("2044-03-17T09:59:13.844196+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), -40L)
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
    [-22.0, 0.0, -11.0, -16.0, -18.0, 760794.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2003, 6, 24, 22, 42, 56, 604990, 0],
  )
}

///|
test "relative delta original between 116 random UTC" {
  let first = @date.parse_iso("2009-12-11T17:20:07.153657+00:00")
  let second = @date.parse_iso("1983-02-19T02:25:00.514306+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), 26L)
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
    [22.0, 0.0, 14.0, 55.0, 6.0, 639351.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2009, 12, 11, 17, 20, 7, 153657, 0],
  )
}

///|
test "relative delta original between 117 random UTC" {
  let first = @date.parse_iso("1957-08-10T23:00:48.076906+00:00")
  let second = @date.parse_iso("1999-10-19T11:40:38.118715+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), -42L)
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
    [-8.0, 0.0, -12.0, -39.0, -51.0, 958191.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [1957, 8, 10, 23, 0, 48, 76906, 0],
  )
}

///|
test "relative delta original between 118 random UTC" {
  let first = @date.parse_iso("2018-06-14T06:06:47.691912+00:00")
  let second = @date.parse_iso("2031-04-20T00:58:59.813264+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), -12L)
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
    [-5.0, 0.0, -18.0, -52.0, -13.0, 878648.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2018, 6, 14, 6, 6, 47, 691912, 0],
  )
}

///|
test "relative delta original between 119 random UTC" {
  let first = @date.parse_iso("1959-05-13T10:22:56.671702+00:00")
  let second = @date.parse_iso("1986-05-16T01:30:47.145252+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), -27L)
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
    [-2.0, 0.0, -15.0, -7.0, -51.0, 526450.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [1959, 5, 13, 10, 22, 56, 671702, 0],
  )
}

///|
test "relative delta original between 120 random UTC" {
  let first = @date.parse_iso("2031-10-16T05:44:58.122537+00:00")
  let second = @date.parse_iso("2025-12-12T12:49:30.900552+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), 5L)
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
    [3.0, 0.0, 16.0, 55.0, 27.0, 221985.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2031, 10, 16, 5, 44, 58, 122537, 0],
  )
}

///|
test "relative delta original between 121 random UTC" {
  let first = @date.parse_iso("1996-04-12T22:23:49.613333+00:00")
  let second = @date.parse_iso("1957-01-08T08:10:10.046672+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), 39L)
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
    [4.0, 0.0, 14.0, 13.0, 39.0, 566661.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [1996, 4, 12, 22, 23, 49, 613333, 0],
  )
}

///|
test "relative delta original between 122 random UTC" {
  let first = @date.parse_iso("1997-04-20T16:37:41.733008+00:00")
  let second = @date.parse_iso("1951-01-01T21:37:35.057947+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), 46L)
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
    [18.0, 0.0, 19.0, 0.0, 6.0, 675061.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [1997, 4, 20, 16, 37, 41, 733008, 0],
  )
}

///|
test "relative delta original between 123 random UTC" {
  let first = @date.parse_iso("2026-05-11T12:58:32.164645+00:00")
  let second = @date.parse_iso("2024-01-24T07:49:20.402907+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), 2L)
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
    [17.0, 0.0, 5.0, 9.0, 11.0, 761738.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2026, 5, 11, 12, 58, 32, 164645, 0],
  )
}

///|
test "relative delta original between 124 random UTC" {
  let first = @date.parse_iso("2033-03-09T05:50:03.021170+00:00")
  let second = @date.parse_iso("2011-12-19T09:51:24.519791+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), 21L)
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
    [17.0, 0.0, 19.0, 58.0, 38.0, 501379.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2033, 3, 9, 5, 50, 3, 21170, 0],
  )
}

///|
test "relative delta original between 125 random UTC" {
  let first = @date.parse_iso("2043-01-12T18:08:22.573541+00:00")
  let second = @date.parse_iso("1959-10-17T23:09:38.204517+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), 83L)
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
    [25.0, 0.0, 18.0, 58.0, 44.0, 369024.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2043, 1, 12, 18, 8, 22, 573541, 0],
  )
}

///|
test "relative delta original between 126 random UTC" {
  let first = @date.parse_iso("1999-05-26T16:51:52.920256+00:00")
  let second = @date.parse_iso("2006-03-05T10:49:10.238765+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), -6L)
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
    [-9.0, 0.0, -17.0, -57.0, -18.0, 681491.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [1999, 5, 26, 16, 51, 52, 920256, 0],
  )
}

///|
test "relative delta original between 127 random UTC" {
  let first = @date.parse_iso("1993-12-03T22:18:32.060930+00:00")
  let second = @date.parse_iso("2040-07-18T04:16:15.712080+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), -46L)
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
    [-14.0, 0.0, -5.0, -57.0, -44.0, 348850.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [1993, 12, 3, 22, 18, 32, 60930, 0],
  )
}

///|
test "relative delta original between 128 random UTC" {
  let first = @date.parse_iso("1975-11-13T12:55:48.576867+00:00")
  let second = @date.parse_iso("1973-12-08T03:05:38.454321+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), 1L)
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
    [5.0, 0.0, 9.0, 50.0, 10.0, 122546.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [1975, 11, 13, 12, 55, 48, 576867, 0],
  )
}

///|
test "relative delta original between 129 random UTC" {
  let first = @date.parse_iso("1983-04-27T10:12:44.697296+00:00")
  let second = @date.parse_iso("2018-12-11T10:08:19.653211+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), -35L)
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
    [-13.0, 0.0, -23.0, -55.0, -35.0, 44085.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [1983, 4, 27, 10, 12, 44, 697296, 0],
  )
}

///|
test "relative delta original between 130 random UTC" {
  let first = @date.parse_iso("1964-05-14T18:17:28.590769+00:00")
  let second = @date.parse_iso("2038-03-20T22:33:44.684585+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), -73L)
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
    [-6.0, 0.0, -4.0, -16.0, -17.0, 906184.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [1964, 5, 14, 18, 17, 28, 590769, 0],
  )
}

///|
test "relative delta original between 131 random UTC" {
  let first = @date.parse_iso("1969-10-26T16:34:30.636867+00:00")
  let second = @date.parse_iso("2013-10-01T20:45:21.146643+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), -43L)
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
    [-6.0, 0.0, -4.0, -10.0, -51.0, 490224.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [1969, 10, 26, 16, 34, 30, 636867, 0],
  )
}

///|
test "relative delta original between 132 random UTC" {
  let first = @date.parse_iso("2033-11-03T04:41:08.568933+00:00")
  let second = @date.parse_iso("2032-12-14T13:09:14.105596+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), 0L)
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
    [19.0, 0.0, 15.0, 31.0, 54.0, 463337.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2033, 11, 3, 4, 41, 8, 568933, 0],
  )
}

///|
test "relative delta original between 133 random UTC" {
  let first = @date.parse_iso("1977-08-22T20:34:01.594924+00:00")
  let second = @date.parse_iso("2012-02-01T20:59:33.909441+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), -34L)
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
    [-10.0, 0.0, 0.0, -25.0, -33.0, 685483.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [1977, 8, 22, 20, 34, 1, 594924, 0],
  )
}

///|
test "relative delta original between 134 random UTC" {
  let first = @date.parse_iso("2043-02-14T19:59:43.442191+00:00")
  let second = @date.parse_iso("2001-08-21T03:21:10.637282+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), 41L)
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
    [24.0, 0.0, 16.0, 38.0, 32.0, 804909.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2043, 2, 14, 19, 59, 43, 442191, 0],
  )
}

///|
test "relative delta original between 135 random UTC" {
  let first = @date.parse_iso("2020-03-05T06:12:37.605078+00:00")
  let second = @date.parse_iso("2024-04-22T06:29:49.893022+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), -4L)
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
    [-17.0, 0.0, 0.0, -17.0, -13.0, 712056.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2020, 3, 5, 6, 12, 37, 605078, 0],
  )
}

///|
test "relative delta original between 136 random UTC" {
  let first = @date.parse_iso("2023-12-20T03:01:42.299068+00:00")
  let second = @date.parse_iso("1975-10-10T04:25:49.162567+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), 48L)
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
    [9.0, 0.0, 22.0, 35.0, 53.0, 136501.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2023, 12, 20, 3, 1, 42, 299068, 0],
  )
}

///|
test "relative delta original between 137 random UTC" {
  let first = @date.parse_iso("2015-04-15T02:22:39.405808+00:00")
  let second = @date.parse_iso("2049-08-04T20:48:11.399952+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), -34L)
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
    [-19.0, 0.0, -18.0, -25.0, -32.0, 5856.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2015, 4, 15, 2, 22, 39, 405808, 0],
  )
}

///|
test "relative delta original between 138 random UTC" {
  let first = @date.parse_iso("1969-07-27T01:49:36.390221+00:00")
  let second = @date.parse_iso("1964-02-23T20:00:51.523776+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), 5L)
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
    [3.0, 0.0, 5.0, 48.0, 44.0, 866445.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [1969, 7, 27, 1, 49, 36, 390221, 0],
  )
}

///|
test "relative delta original between 139 random UTC" {
  let first = @date.parse_iso("2046-12-23T16:54:10.056767+00:00")
  let second = @date.parse_iso("1992-04-08T22:28:18.659848+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), 54L)
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
    [14.0, 0.0, 18.0, 25.0, 51.0, 396919.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2046, 12, 23, 16, 54, 10, 56767, 0],
  )
}

///|
test "relative delta original between 140 random UTC" {
  let first = @date.parse_iso("2002-03-23T15:31:34.394798+00:00")
  let second = @date.parse_iso("1951-10-11T12:38:05.704534+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), 50L)
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
    [12.0, 0.0, 2.0, 53.0, 28.0, 690264.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2002, 3, 23, 15, 31, 34, 394798, 0],
  )
}

///|
test "relative delta original between 141 random UTC" {
  let first = @date.parse_iso("1962-07-23T15:03:02.617024+00:00")
  let second = @date.parse_iso("2021-03-09T13:41:45.212318+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), -58L)
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
    [-16.0, 0.0, -22.0, -38.0, -43.0, 404706.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [1962, 7, 23, 15, 3, 2, 617024, 0],
  )
}

///|
test "relative delta original between 142 random UTC" {
  let first = @date.parse_iso("2041-01-27T03:05:32.650958+00:00")
  let second = @date.parse_iso("1954-01-08T21:06:44.616172+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), 87L)
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
    [18.0, 0.0, 5.0, 58.0, 48.0, 34786.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2041, 1, 27, 3, 5, 32, 650958, 0],
  )
}

///|
test "relative delta original between 143 random UTC" {
  let first = @date.parse_iso("2035-11-13T02:58:10.165049+00:00")
  let second = @date.parse_iso("2006-07-20T08:43:44.094221+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), 29L)
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
    [23.0, 0.0, 18.0, 14.0, 26.0, 70828.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2035, 11, 13, 2, 58, 10, 165049, 0],
  )
}

///|
test "relative delta original between 144 random UTC" {
  let first = @date.parse_iso("1978-07-07T19:50:42.172026+00:00")
  let second = @date.parse_iso("2002-09-19T08:46:58.311297+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), -24L)
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
    [-11.0, 0.0, -12.0, -56.0, -17.0, 860729.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [1978, 7, 7, 19, 50, 42, 172026, 0],
  )
}

///|
test "relative delta original between 145 random UTC" {
  let first = @date.parse_iso("1956-04-12T14:49:31.494046+00:00")
  let second = @date.parse_iso("1958-04-05T13:19:07.950794+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), -1L)
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
    [-22.0, 0.0, -22.0, -29.0, -37.0, 543252.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [1956, 4, 12, 14, 49, 31, 494046, 0],
  )
}

///|
test "relative delta original between 146 random UTC" {
  let first = @date.parse_iso("2038-10-26T11:55:01.386876+00:00")
  let second = @date.parse_iso("1993-01-07T10:21:47.059248+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), 45L)
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
    [19.0, 0.0, 1.0, 33.0, 14.0, 327628.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2038, 10, 26, 11, 55, 1, 386876, 0],
  )
}

///|
test "relative delta original between 147 random UTC" {
  let first = @date.parse_iso("1992-08-13T09:01:34.935712+00:00")
  let second = @date.parse_iso("2028-09-27T18:04:20.718062+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), -36L)
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
    [-14.0, 0.0, -9.0, -2.0, -46.0, 217650.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [1992, 8, 13, 9, 1, 34, 935712, 0],
  )
}

///|
test "relative delta original between 148 random UTC" {
  let first = @date.parse_iso("2037-03-02T13:41:47.294049+00:00")
  let second = @date.parse_iso("2007-08-01T09:10:56.573238+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), 29L)
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
    [1.0, 0.0, 4.0, 30.0, 50.0, 720811.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2037, 3, 2, 13, 41, 47, 294049, 0],
  )
}

///|
test "relative delta original between 149 random UTC" {
  let first = @date.parse_iso("1987-03-27T10:39:24.610304+00:00")
  let second = @date.parse_iso("1999-06-18T01:07:24.062666+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), -12L)
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
    [-21.0, 0.0, -14.0, -28.0, 0.0, 547638.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [1987, 3, 27, 10, 39, 24, 610304, 0],
  )
}

///|
test "relative delta original between 150 random UTC" {
  let first = @date.parse_iso("2001-06-09T06:20:11.818824+00:00")
  let second = @date.parse_iso("2018-11-01T22:12:56.432182+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), -17L)
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
    [-22.0, 0.0, -15.0, -52.0, -45.0, 386642.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2001, 6, 9, 6, 20, 11, 818824, 0],
  )
}

///|
test "relative delta original between 151 random UTC" {
  let first = @date.parse_iso("1980-07-01T05:51:36.823230+00:00")
  let second = @date.parse_iso("2043-02-16T18:57:51.073436+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), -62L)
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
    [-15.0, 0.0, -13.0, -6.0, -15.0, 749794.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [1980, 7, 1, 5, 51, 36, 823230, 0],
  )
}

///|
test "relative delta original between 152 random UTC" {
  let first = @date.parse_iso("1967-08-24T22:28:07.818619+00:00")
  let second = @date.parse_iso("2033-05-18T15:57:49.655486+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), -65L)
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
    [-24.0, 0.0, -17.0, -29.0, -42.0, 163133.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [1967, 8, 24, 22, 28, 7, 818619, 0],
  )
}

///|
test "relative delta original between 153 random UTC" {
  let first = @date.parse_iso("2024-09-16T20:50:41.297174+00:00")
  let second = @date.parse_iso("1974-01-15T08:31:20.037663+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), 50L)
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
    [1.0, 0.0, 12.0, 19.0, 21.0, 259511.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2024, 9, 16, 20, 50, 41, 297174, 0],
  )
}

///|
test "relative delta original between 154 random UTC" {
  let first = @date.parse_iso("2019-11-14T04:57:40.192055+00:00")
  let second = @date.parse_iso("1955-10-18T20:10:52.382815+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), 64L)
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
    [26.0, 0.0, 8.0, 46.0, 47.0, 809240.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2019, 11, 14, 4, 57, 40, 192055, 0],
  )
}

///|
test "relative delta original between 155 random UTC" {
  let first = @date.parse_iso("2021-08-28T18:23:26.958884+00:00")
  let second = @date.parse_iso("1991-02-17T23:51:48.163840+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), 30L)
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
    [10.0, 0.0, 18.0, 31.0, 38.0, 795044.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2021, 8, 28, 18, 23, 26, 958884, 0],
  )
}

///|
test "relative delta original between 156 random UTC" {
  let first = @date.parse_iso("1989-01-18T04:31:44.087847+00:00")
  let second = @date.parse_iso("1967-12-25T06:38:40.720181+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), 21L)
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
    [23.0, 0.0, 21.0, 53.0, 3.0, 367666.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [1989, 1, 18, 4, 31, 44, 87847, 0],
  )
}

///|
test "relative delta original between 157 random UTC" {
  let first = @date.parse_iso("2045-02-08T20:59:53.728819+00:00")
  let second = @date.parse_iso("2011-06-19T16:02:58.510173+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), 33L)
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
    [20.0, 0.0, 4.0, 56.0, 55.0, 218646.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2045, 2, 8, 20, 59, 53, 728819, 0],
  )
}

///|
test "relative delta original between 158 random UTC" {
  let first = @date.parse_iso("2010-09-27T12:40:17.138196+00:00")
  let second = @date.parse_iso("2009-09-21T12:19:17.773972+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), 1L)
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
    [6.0, 0.0, 0.0, 20.0, 59.0, 364224.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2010, 9, 27, 12, 40, 17, 138196, 0],
  )
}

///|
test "relative delta original between 159 random UTC" {
  let first = @date.parse_iso("1970-01-25T06:30:44.603845+00:00")
  let second = @date.parse_iso("1987-05-27T14:25:34.718489+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), -17L)
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
    [-2.0, 0.0, -7.0, -54.0, -51.0, 885356.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [1970, 1, 25, 6, 30, 44, 603845, 0],
  )
}

///|
test "relative delta original between 160 random UTC" {
  let first = @date.parse_iso("2045-03-18T21:38:28.539928+00:00")
  let second = @date.parse_iso("1966-02-17T15:46:59.673765+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), 79L)
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
    [1.0, 0.0, 5.0, 51.0, 28.0, 866163.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2045, 3, 18, 21, 38, 28, 539928, 0],
  )
}

///|
test "relative delta original between 161 random UTC" {
  let first = @date.parse_iso("1951-07-09T03:32:53.661574+00:00")
  let second = @date.parse_iso("1981-06-06T13:44:04.851036+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), -29L)
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
    [-28.0, 0.0, -10.0, -11.0, -12.0, 810538.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [1951, 7, 9, 3, 32, 53, 661574, 0],
  )
}

///|
test "relative delta original between 162 random UTC" {
  let first = @date.parse_iso("1978-11-19T07:04:41.644832+00:00")
  let second = @date.parse_iso("2013-02-27T03:17:48.024943+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), -34L)
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
    [-7.0, 0.0, -20.0, -13.0, -7.0, 619889.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [1978, 11, 19, 7, 4, 41, 644832, 0],
  )
}

///|
test "relative delta original between 163 random UTC" {
  let first = @date.parse_iso("2048-06-20T01:25:47.932700+00:00")
  let second = @date.parse_iso("1974-11-26T02:04:14.124464+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), 73L)
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
    [24.0, 0.0, 23.0, 21.0, 33.0, 808236.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2048, 6, 20, 1, 25, 47, 932700, 0],
  )
}

///|
test "relative delta original between 164 random UTC" {
  let first = @date.parse_iso("1958-05-22T02:11:28.895326+00:00")
  let second = @date.parse_iso("2038-12-06T07:31:13.118167+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), -80L)
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
    [-15.0, 0.0, -5.0, -19.0, -45.0, 777159.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [1958, 5, 22, 2, 11, 28, 895326, 0],
  )
}

///|
test "relative delta original between 165 random UTC" {
  let first = @date.parse_iso("2002-11-10T05:11:47.404635+00:00")
  let second = @date.parse_iso("1970-09-06T15:44:25.501740+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), 32L)
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
    [3.0, 0.0, 13.0, 27.0, 21.0, 902895.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2002, 11, 10, 5, 11, 47, 404635, 0],
  )
}

///|
test "relative delta original between 166 random UTC" {
  let first = @date.parse_iso("2015-06-15T23:00:06.189543+00:00")
  let second = @date.parse_iso("1981-11-18T00:53:22.377618+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), 33L)
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
    [28.0, 0.0, 22.0, 6.0, 43.0, 811925.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2015, 6, 15, 23, 0, 6, 189543, 0],
  )
}

///|
test "relative delta original between 167 random UTC" {
  let first = @date.parse_iso("1972-10-04T13:38:43.195194+00:00")
  let second = @date.parse_iso("1994-12-04T23:41:55.845383+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), -22L)
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
    [0.0, 0.0, -10.0, -3.0, -13.0, 349811.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [1972, 10, 4, 13, 38, 43, 195194, 0],
  )
}

///|
test "relative delta original between 168 random UTC" {
  let first = @date.parse_iso("1972-11-26T11:35:10.767819+00:00")
  let second = @date.parse_iso("1955-02-12T23:41:50.590719+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), 17L)
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
    [13.0, 0.0, 11.0, 53.0, 20.0, 177100.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [1972, 11, 26, 11, 35, 10, 767819, 0],
  )
}

///|
test "relative delta original between 169 random UTC" {
  let first = @date.parse_iso("1973-09-16T04:37:03.463036+00:00")
  let second = @date.parse_iso("2031-03-14T16:38:47.088311+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), -57L)
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
    [-28.0, 0.0, -12.0, -1.0, -44.0, 374725.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [1973, 9, 16, 4, 37, 3, 463036, 0],
  )
}

///|
test "relative delta original between 170 random UTC" {
  let first = @date.parse_iso("1987-09-03T01:28:26.896405+00:00")
  let second = @date.parse_iso("1958-01-26T18:08:43.853435+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), 29L)
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
    [7.0, 0.0, 7.0, 19.0, 43.0, 42970.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [1987, 9, 3, 1, 28, 26, 896405, 0],
  )
}

///|
test "relative delta original between 171 random UTC" {
  let first = @date.parse_iso("2017-11-27T21:28:51.172137+00:00")
  let second = @date.parse_iso("1976-11-09T16:59:23.200931+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), 41L)
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
    [18.0, 0.0, 4.0, 29.0, 27.0, 971206.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2017, 11, 27, 21, 28, 51, 172137, 0],
  )
}

///|
test "relative delta original between 172 random UTC" {
  let first = @date.parse_iso("1984-03-19T11:38:01.008055+00:00")
  let second = @date.parse_iso("1984-06-01T15:15:27.607631+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), 0L)
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
    [-13.0, 0.0, -3.0, -37.0, -27.0, 400424.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [1984, 3, 19, 11, 38, 1, 8055, 0],
  )
}

///|
test "relative delta original between 173 random UTC" {
  let first = @date.parse_iso("1971-04-20T05:36:03.192880+00:00")
  let second = @date.parse_iso("2005-02-07T08:20:25.698742+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), -33L)
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
    [-17.0, 0.0, -2.0, -44.0, -23.0, 494138.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [1971, 4, 20, 5, 36, 3, 192880, 0],
  )
}

///|
test "relative delta original between 174 random UTC" {
  let first = @date.parse_iso("1981-05-06T15:22:59.108502+00:00")
  let second = @date.parse_iso("1995-04-07T18:12:19.706364+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), -13L)
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
    [-1.0, 0.0, -2.0, -49.0, -21.0, 402138.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [1981, 5, 6, 15, 22, 59, 108502, 0],
  )
}

///|
test "relative delta original between 175 random UTC" {
  let first = @date.parse_iso("2047-03-19T12:43:33.721168+00:00")
  let second = @date.parse_iso("1959-11-10T13:17:17.227698+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), 87L)
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
    [8.0, 0.0, 23.0, 26.0, 16.0, 493470.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2047, 3, 19, 12, 43, 33, 721168, 0],
  )
}

///|
test "relative delta original between 176 random UTC" {
  let first = @date.parse_iso("1983-11-03T23:47:21.725291+00:00")
  let second = @date.parse_iso("1956-12-09T21:15:45.259171+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), 26L)
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
    [25.0, 0.0, 2.0, 31.0, 36.0, 466120.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [1983, 11, 3, 23, 47, 21, 725291, 0],
  )
}

///|
test "relative delta original between 177 random UTC" {
  let first = @date.parse_iso("1995-02-09T21:16:40.696696+00:00")
  let second = @date.parse_iso("2033-08-12T19:25:01.289572+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), -38L)
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
    [-2.0, 0.0, -22.0, -8.0, -21.0, 407124.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [1995, 2, 9, 21, 16, 40, 696696, 0],
  )
}

///|
test "relative delta original between 178 random UTC" {
  let first = @date.parse_iso("2049-08-01T04:15:13.132134+00:00")
  let second = @date.parse_iso("1989-04-28T00:53:05.074996+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), 60L)
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
    [4.0, 0.0, 3.0, 22.0, 8.0, 57138.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2049, 8, 1, 4, 15, 13, 132134, 0],
  )
}

///|
test "relative delta original between 179 random UTC" {
  let first = @date.parse_iso("1978-12-02T09:50:01.455958+00:00")
  let second = @date.parse_iso("1981-09-04T23:41:04.489813+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), -2L)
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
    [-2.0, 0.0, -13.0, -51.0, -4.0, 966145.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [1978, 12, 2, 9, 50, 1, 455958, 0],
  )
}

///|
test "relative delta original between 180 random UTC" {
  let first = @date.parse_iso("1986-03-27T08:38:42.738868+00:00")
  let second = @date.parse_iso("2025-07-25T07:49:46.300948+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), -39L)
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
    [-28.0, 0.0, -23.0, -11.0, -4.0, 437920.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [1986, 3, 27, 8, 38, 42, 738868, 0],
  )
}

///|
test "relative delta original between 181 random UTC" {
  let first = @date.parse_iso("1967-01-15T07:25:36.827155+00:00")
  let second = @date.parse_iso("1993-12-12T02:35:17.833252+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), -26L)
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
    [-27.0, 0.0, -19.0, -9.0, -42.0, 993903.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [1967, 1, 15, 7, 25, 36, 827155, 0],
  )
}

///|
test "relative delta original between 182 random UTC" {
  let first = @date.parse_iso("2013-05-19T12:46:17.587346+00:00")
  let second = @date.parse_iso("1997-08-09T02:05:15.528664+00:00")
  let delta = @date.RelativeDelta::between(first, second)
  assert_eq(delta.years(), 15L)
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
    [10.0, 0.0, 10.0, 41.0, 2.0, 58682.0],
  )
  let reconstructed = second.add_relative_delta(delta)
  assert_eq(
    [
      reconstructed.year(),
      reconstructed.month(),
      reconstructed.day(),
      reconstructed.hour(),
      reconstructed.minute(),
      reconstructed.second(),
      reconstructed.microsecond(),
      reconstructed.offset_seconds(),
    ],
    [2013, 5, 19, 12, 46, 17, 587346, 0],
  )
}
