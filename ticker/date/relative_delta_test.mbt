///|
test "relative delta typed boundaries and weekday values preserve stored semantics" {
  let weekdays = [
    @date.mo, @date.tu, @date.we, @date.th, @date.fr, @date.sa, @date.su,
  ]
  assert_eq(weekdays.map(value => value.weekday()), [0, 1, 2, 3, 4, 5, 6])
  assert_true(@date.mo != @date.mo.with_nth(0))
  assert_true(@date.mo != @date.mo.with_nth(1))
  assert_eq(@date.mo.with_nth(-2).nth(), Some(-2))
  assert_true(
    try {
      ignore(@date.RelativeDelta::new(weekday=0, on_weekday=@date.mo))
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(@date.RelativeDelta::new(years=9223372036854775807L, months=12L))
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(@date.RelativeDelta::new(years=-9223372036854775808L, months=-12L))
      false
    } catch {
      _ => true
    },
  )
  for value in [0.0 / 0.0, 1.0 / 0.0, -1.0 / 0.0] {
    assert_true(
      try {
        ignore(@date.RelativeDelta::new(days=value))
        false
      } catch {
        _ => true
      },
    )
    assert_true(
      try {
        ignore(@date.RelativeDelta::new(leapdays=value))
        false
      } catch {
        _ => true
      },
    )
  }
}

///|
test "relative object methods check numeric bounds and preserve immutable operands" {
  let value = @date.RelativeDelta::new(
    days=1.5,
    leapdays=0.25,
    day=0,
    on_weekday=@date.mo,
  )
  assert_eq(value.scaled(1.0).days(), 1.0)
  assert_eq(value.days(), 1.5)
  assert_eq(value.with_weeks(-1.25).days(), -7.25)
  assert_eq(value.leapdays(), 0.25)
  assert_true(
    value ==
    value
    .normalized()
    .normalized()
    .add(@date.RelativeDelta::new())
    .subtract(@date.RelativeDelta::new())
    .add(@date.RelativeDelta::new(days=0.5, hours=-12.0)),
  )
  assert_true(
    try {
      ignore(value.divided(0.0))
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(value.divided(-0.0))
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(value.scaled(1.0 / 0.0))
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(value.scaled(0.0 / 0.0))
      false
    } catch {
      _ => true
    },
  )
  assert_eq(value.divided(1.0 / 0.0).days(), 0.0)
  assert_eq(value.divided(1.0 / 0.0).leapdays(), 0.25)
  assert_eq(value.divided(1.0 / 0.0).day(), Some(0))
  assert_true(!value.divided(1.0 / 0.0).is_zero())
  assert_true(
    try {
      ignore(value.with_weeks(1.0 / 0.0))
      false
    } catch {
      _ => true
    },
  )
}
