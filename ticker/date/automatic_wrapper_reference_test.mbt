// Generated fixed AutoDateLocator -> original wrapper recurrence at transitions.

///|
test "automatic wrapper original 0 NY 2024-03-10T07:00:00 seconds False" {
  @date.register_timezone("D15/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D15/reference-NY")
  let zone = @date.get_timezone(name="D15/reference-NY")
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=false,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(19792.291608796295, timezone=zone),
      ),
    ),
    [1, 2024, 3, 10, 1, 59, 55, 0, -18000],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(19792.291608796295).with_timezone(zone),
      ),
    ),
    [1, 2024, 3, 10, 1, 59, 55, 0, -18000],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(19792.291724537037, timezone=zone),
      ),
    ),
    [1, 2024, 3, 10, 3, 0, 5, 0, -14400],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(19792.291724537037).with_timezone(zone),
      ),
    ),
    [1, 2024, 3, 10, 3, 0, 5, 0, -14400],
  )
  let selected = locator.get_locator_for_range(
    19792.291608796295, 19792.291724537037,
  )
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Minute)
  assert_eq(selected.interval(), 10)
  assert_eq(selected.unit_scale(), 0.0006944444444444445)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2024, 3, 10, 1, 59, 55, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2024, 3, 10, 3, 0, 5, 0, 0]),
  )
  let ticks = locator.tick_values(19792.291608796295, 19792.291724537037)
  assert_eq(ticks, [
    19792.25625, 19792.263194444444, 19792.27013888889, 19792.277083333334, 19792.28402777778,
    19792.29097222222,
  ])
  assert_eq(
    locator.tick_values(19792.291724537037, 19792.291608796295),
    ticks.rev(),
  )
  assert_eq(
    locator.as_locator().tick_values(19792.291608796295, 19792.291724537037),
    ticks,
  )
  assert_eq(selected.tick_values(19792.291608796295, 19792.291724537037), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "2024-03-10 01:09:00 EST -0500", "2024-03-10 01:19:00 EST -0500", "2024-03-10 01:29:00 EST -0500",
      "2024-03-10 01:39:00 EST -0500", "2024-03-10 01:49:00 EST -0500", "2024-03-10 01:59:00 EST -0500",
    ],
  )
}

///|
test "automatic wrapper original 1 NY 2024-03-10T07:00:00 seconds True" {
  @date.register_timezone("D15/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D15/reference-NY")
  let zone = @date.get_timezone(name="D15/reference-NY")
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=true,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(19792.291608796295, timezone=zone),
      ),
    ),
    [1, 2024, 3, 10, 1, 59, 55, 0, -18000],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(19792.291608796295).with_timezone(zone),
      ),
    ),
    [1, 2024, 3, 10, 1, 59, 55, 0, -18000],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(19792.291724537037, timezone=zone),
      ),
    ),
    [1, 2024, 3, 10, 3, 0, 5, 0, -14400],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(19792.291724537037).with_timezone(zone),
      ),
    ),
    [1, 2024, 3, 10, 3, 0, 5, 0, -14400],
  )
  let selected = locator.get_locator_for_range(
    19792.291608796295, 19792.291724537037,
  )
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Minute)
  assert_eq(selected.interval(), 1)
  assert_eq(selected.unit_scale(), 0.0006944444444444445)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2024, 3, 10, 1, 59, 55, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2024, 3, 10, 3, 0, 5, 0, 0]),
  )
  let ticks = locator.tick_values(19792.291608796295, 19792.291724537037)
  assert_eq(ticks, [
    19792.25, 19792.256944444445, 19792.26388888889, 19792.270833333332, 19792.277777777777,
    19792.284722222223, 19792.291666666668,
  ])
  assert_eq(
    locator.tick_values(19792.291724537037, 19792.291608796295),
    ticks.rev(),
  )
  assert_eq(
    locator.as_locator().tick_values(19792.291608796295, 19792.291724537037),
    ticks,
  )
  assert_eq(selected.tick_values(19792.291608796295, 19792.291724537037), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "2024-03-10 01:00:00 EST -0500", "2024-03-10 01:10:00 EST -0500", "2024-03-10 01:20:00 EST -0500",
      "2024-03-10 01:30:00 EST -0500", "2024-03-10 01:40:00 EST -0500", "2024-03-10 01:50:00 EST -0500",
      "2024-03-10 03:00:00 EDT -0400",
    ],
  )
}

///|
test "automatic wrapper original 2 NY 2024-03-10T07:00:00 minutes False" {
  @date.register_timezone("D15/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D15/reference-NY")
  let zone = @date.get_timezone(name="D15/reference-NY")
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=false,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(19792.260416666668, timezone=zone),
      ),
    ),
    [1, 2024, 3, 10, 1, 15, 0, 0, -18000],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(19792.260416666668).with_timezone(zone),
      ),
    ),
    [1, 2024, 3, 10, 1, 15, 0, 0, -18000],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(@date.num2date(19792.34375, timezone=zone)),
    ),
    [1, 2024, 3, 10, 4, 15, 0, 0, -14400],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(19792.34375).with_timezone(zone),
      ),
    ),
    [1, 2024, 3, 10, 4, 15, 0, 0, -14400],
  )
  let selected = locator.get_locator_for_range(19792.260416666668, 19792.34375)
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Minute)
  assert_eq(selected.interval(), 30)
  assert_eq(selected.unit_scale(), 0.0006944444444444445)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2024, 3, 10, 1, 15, 0, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2024, 3, 10, 4, 15, 0, 0, 0]),
  )
  let ticks = locator.tick_values(19792.260416666668, 19792.34375)
  assert_eq(ticks, [
    19792.260416666668, 19792.28125, 19792.260416666668, 19792.28125, 19792.302083333332,
    19792.322916666668, 19792.34375,
  ])
  assert_eq(locator.tick_values(19792.34375, 19792.260416666668), ticks.rev())
  assert_eq(
    locator.as_locator().tick_values(19792.260416666668, 19792.34375),
    ticks,
  )
  assert_eq(selected.tick_values(19792.260416666668, 19792.34375), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "2024-03-10 01:15:00 EST -0500", "2024-03-10 01:45:00 EST -0500", "2024-03-10 01:15:00 EST -0500",
      "2024-03-10 01:45:00 EST -0500", "2024-03-10 03:15:00 EDT -0400", "2024-03-10 03:45:00 EDT -0400",
      "2024-03-10 04:15:00 EDT -0400",
    ],
  )
}

///|
test "automatic wrapper original 3 NY 2024-03-10T07:00:00 minutes True" {
  @date.register_timezone("D15/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D15/reference-NY")
  let zone = @date.get_timezone(name="D15/reference-NY")
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=true,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(19792.260416666668, timezone=zone),
      ),
    ),
    [1, 2024, 3, 10, 1, 15, 0, 0, -18000],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(19792.260416666668).with_timezone(zone),
      ),
    ),
    [1, 2024, 3, 10, 1, 15, 0, 0, -18000],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(@date.num2date(19792.34375, timezone=zone)),
    ),
    [1, 2024, 3, 10, 4, 15, 0, 0, -14400],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(19792.34375).with_timezone(zone),
      ),
    ),
    [1, 2024, 3, 10, 4, 15, 0, 0, -14400],
  )
  let selected = locator.get_locator_for_range(19792.260416666668, 19792.34375)
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Minute)
  assert_eq(selected.interval(), 1)
  assert_eq(selected.unit_scale(), 0.0006944444444444445)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2024, 3, 10, 1, 15, 0, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2024, 3, 10, 4, 15, 0, 0, 0]),
  )
  let ticks = locator.tick_values(19792.260416666668, 19792.34375)
  assert_eq(ticks, [
    19792.270833333332, 19792.25, 19792.270833333332, 19792.291666666668, 19792.3125,
    19792.333333333332,
  ])
  assert_eq(locator.tick_values(19792.34375, 19792.260416666668), ticks.rev())
  assert_eq(
    locator.as_locator().tick_values(19792.260416666668, 19792.34375),
    ticks,
  )
  assert_eq(selected.tick_values(19792.260416666668, 19792.34375), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "2024-03-10 01:30:00 EST -0500", "2024-03-10 01:00:00 EST -0500", "2024-03-10 01:30:00 EST -0500",
      "2024-03-10 03:00:00 EDT -0400", "2024-03-10 03:30:00 EDT -0400", "2024-03-10 04:00:00 EDT -0400",
    ],
  )
}

///|
test "automatic wrapper original 4 NY 2024-03-10T07:00:00 hours False" {
  @date.register_timezone("D15/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D15/reference-NY")
  let zone = @date.get_timezone(name="D15/reference-NY")
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=false,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(19792.166666666668, timezone=zone),
      ),
    ),
    [1, 2024, 3, 9, 23, 0, 0, 0, -18000],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(19792.166666666668).with_timezone(zone),
      ),
    ),
    [1, 2024, 3, 9, 23, 0, 0, 0, -18000],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(@date.num2date(19792.5, timezone=zone)),
    ),
    [1, 2024, 3, 10, 8, 0, 0, 0, -14400],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(19792.5).with_timezone(zone),
      ),
    ),
    [1, 2024, 3, 10, 8, 0, 0, 0, -14400],
  )
  let selected = locator.get_locator_for_range(19792.166666666668, 19792.5)
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Hour)
  assert_eq(selected.interval(), 1)
  assert_eq(selected.unit_scale(), 0.041666666666666664)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2024, 3, 9, 23, 0, 0, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2024, 3, 10, 8, 0, 0, 0, 0]),
  )
  let ticks = locator.tick_values(19792.166666666668, 19792.5)
  assert_eq(ticks, [
    19792.166666666668, 19792.208333333332, 19792.25, 19792.25, 19792.291666666668,
    19792.333333333332, 19792.375, 19792.416666666668, 19792.458333333332, 19792.5,
  ])
  assert_eq(locator.tick_values(19792.5, 19792.166666666668), ticks.rev())
  assert_eq(
    locator.as_locator().tick_values(19792.166666666668, 19792.5),
    ticks,
  )
  assert_eq(selected.tick_values(19792.166666666668, 19792.5), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "2024-03-09 23:00:00 EST -0500", "2024-03-10 00:00:00 EST -0500", "2024-03-10 01:00:00 EST -0500",
      "2024-03-10 01:00:00 EST -0500", "2024-03-10 03:00:00 EDT -0400", "2024-03-10 04:00:00 EDT -0400",
      "2024-03-10 05:00:00 EDT -0400", "2024-03-10 06:00:00 EDT -0400", "2024-03-10 07:00:00 EDT -0400",
      "2024-03-10 08:00:00 EDT -0400",
    ],
  )
}

///|
test "automatic wrapper original 5 NY 2024-03-10T07:00:00 hours True" {
  @date.register_timezone("D15/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D15/reference-NY")
  let zone = @date.get_timezone(name="D15/reference-NY")
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=true,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(19792.166666666668, timezone=zone),
      ),
    ),
    [1, 2024, 3, 9, 23, 0, 0, 0, -18000],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(19792.166666666668).with_timezone(zone),
      ),
    ),
    [1, 2024, 3, 9, 23, 0, 0, 0, -18000],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(@date.num2date(19792.5, timezone=zone)),
    ),
    [1, 2024, 3, 10, 8, 0, 0, 0, -14400],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(19792.5).with_timezone(zone),
      ),
    ),
    [1, 2024, 3, 10, 8, 0, 0, 0, -14400],
  )
  let selected = locator.get_locator_for_range(19792.166666666668, 19792.5)
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Hour)
  assert_eq(selected.interval(), 1)
  assert_eq(selected.unit_scale(), 0.041666666666666664)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2024, 3, 9, 23, 0, 0, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2024, 3, 10, 8, 0, 0, 0, 0]),
  )
  let ticks = locator.tick_values(19792.166666666668, 19792.5)
  assert_eq(ticks, [
    19792.166666666668, 19792.208333333332, 19792.25, 19792.25, 19792.291666666668,
    19792.333333333332, 19792.375, 19792.416666666668, 19792.458333333332, 19792.5,
  ])
  assert_eq(locator.tick_values(19792.5, 19792.166666666668), ticks.rev())
  assert_eq(
    locator.as_locator().tick_values(19792.166666666668, 19792.5),
    ticks,
  )
  assert_eq(selected.tick_values(19792.166666666668, 19792.5), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "2024-03-09 23:00:00 EST -0500", "2024-03-10 00:00:00 EST -0500", "2024-03-10 01:00:00 EST -0500",
      "2024-03-10 01:00:00 EST -0500", "2024-03-10 03:00:00 EDT -0400", "2024-03-10 04:00:00 EDT -0400",
      "2024-03-10 05:00:00 EDT -0400", "2024-03-10 06:00:00 EDT -0400", "2024-03-10 07:00:00 EDT -0400",
      "2024-03-10 08:00:00 EDT -0400",
    ],
  )
}

///|
test "automatic wrapper original 6 NY 2024-03-10T07:00:00 daily False" {
  @date.register_timezone("D15/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D15/reference-NY")
  let zone = @date.get_timezone(name="D15/reference-NY")
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=false,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(19785.291666666668, timezone=zone),
      ),
    ),
    [1, 2024, 3, 3, 2, 0, 0, 0, -18000],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(19785.291666666668).with_timezone(zone),
      ),
    ),
    [1, 2024, 3, 3, 2, 0, 0, 0, -18000],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(19799.291666666668, timezone=zone),
      ),
    ),
    [1, 2024, 3, 17, 3, 0, 0, 0, -14400],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(19799.291666666668).with_timezone(zone),
      ),
    ),
    [1, 2024, 3, 17, 3, 0, 0, 0, -14400],
  )
  let selected = locator.get_locator_for_range(
    19785.291666666668, 19799.291666666668,
  )
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Day)
  assert_eq(selected.interval(), 2)
  assert_eq(selected.unit_scale(), 1.0)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2024, 3, 3, 2, 0, 0, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2024, 3, 17, 3, 0, 0, 0, 0]),
  )
  let ticks = locator.tick_values(19785.291666666668, 19799.291666666668)
  assert_eq(ticks, [
    19787.208333333332, 19789.208333333332, 19791.208333333332, 19793.166666666668,
    19795.166666666668, 19797.166666666668, 19799.166666666668,
  ])
  assert_eq(
    locator.tick_values(19799.291666666668, 19785.291666666668),
    ticks.rev(),
  )
  assert_eq(
    locator.as_locator().tick_values(19785.291666666668, 19799.291666666668),
    ticks,
  )
  assert_eq(selected.tick_values(19785.291666666668, 19799.291666666668), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "2024-03-05 00:00:00 EST -0500", "2024-03-07 00:00:00 EST -0500", "2024-03-09 00:00:00 EST -0500",
      "2024-03-11 00:00:00 EDT -0400", "2024-03-13 00:00:00 EDT -0400", "2024-03-15 00:00:00 EDT -0400",
      "2024-03-17 00:00:00 EDT -0400",
    ],
  )
}

///|
test "automatic wrapper original 7 NY 2024-03-10T07:00:00 daily True" {
  @date.register_timezone("D15/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D15/reference-NY")
  let zone = @date.get_timezone(name="D15/reference-NY")
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=true,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(19785.291666666668, timezone=zone),
      ),
    ),
    [1, 2024, 3, 3, 2, 0, 0, 0, -18000],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(19785.291666666668).with_timezone(zone),
      ),
    ),
    [1, 2024, 3, 3, 2, 0, 0, 0, -18000],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(19799.291666666668, timezone=zone),
      ),
    ),
    [1, 2024, 3, 17, 3, 0, 0, 0, -14400],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(19799.291666666668).with_timezone(zone),
      ),
    ),
    [1, 2024, 3, 17, 3, 0, 0, 0, -14400],
  )
  let selected = locator.get_locator_for_range(
    19785.291666666668, 19799.291666666668,
  )
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Day)
  assert_eq(selected.interval(), 1)
  assert_eq(selected.unit_scale(), 1.0)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2024, 3, 3, 2, 0, 0, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2024, 3, 17, 3, 0, 0, 0, 0]),
  )
  let ticks = locator.tick_values(19785.291666666668, 19799.291666666668)
  assert_eq(ticks, [
    19787.208333333332, 19789.208333333332, 19791.208333333332, 19793.166666666668,
    19795.166666666668, 19797.166666666668, 19799.166666666668,
  ])
  assert_eq(
    locator.tick_values(19799.291666666668, 19785.291666666668),
    ticks.rev(),
  )
  assert_eq(
    locator.as_locator().tick_values(19785.291666666668, 19799.291666666668),
    ticks,
  )
  assert_eq(selected.tick_values(19785.291666666668, 19799.291666666668), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "2024-03-05 00:00:00 EST -0500", "2024-03-07 00:00:00 EST -0500", "2024-03-09 00:00:00 EST -0500",
      "2024-03-11 00:00:00 EDT -0400", "2024-03-13 00:00:00 EDT -0400", "2024-03-15 00:00:00 EDT -0400",
      "2024-03-17 00:00:00 EDT -0400",
    ],
  )
}

///|
test "automatic wrapper original 8 NY 2024-03-10T07:00:00 monthly False" {
  @date.register_timezone("D15/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D15/reference-NY")
  let zone = @date.get_timezone(name="D15/reference-NY")
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=false,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(19752.291666666668, timezone=zone),
      ),
    ),
    [1, 2024, 1, 30, 2, 0, 0, 0, -18000],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(19752.291666666668).with_timezone(zone),
      ),
    ),
    [1, 2024, 1, 30, 2, 0, 0, 0, -18000],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(19832.291666666668, timezone=zone),
      ),
    ),
    [1, 2024, 4, 19, 3, 0, 0, 0, -14400],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(19832.291666666668).with_timezone(zone),
      ),
    ),
    [1, 2024, 4, 19, 3, 0, 0, 0, -14400],
  )
  let selected = locator.get_locator_for_range(
    19752.291666666668, 19832.291666666668,
  )
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Day)
  assert_eq(selected.interval(), 14)
  assert_eq(selected.unit_scale(), 1.0)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2024, 1, 30, 2, 0, 0, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2024, 4, 19, 3, 0, 0, 0, 0]),
  )
  let ticks = locator.tick_values(19752.291666666668, 19832.291666666668)
  assert_eq(ticks, [
    19755.208333333332, 19769.208333333332, 19783.208333333332, 19797.166666666668,
    19811.166666666668, 19825.166666666668,
  ])
  assert_eq(
    locator.tick_values(19832.291666666668, 19752.291666666668),
    ticks.rev(),
  )
  assert_eq(
    locator.as_locator().tick_values(19752.291666666668, 19832.291666666668),
    ticks,
  )
  assert_eq(selected.tick_values(19752.291666666668, 19832.291666666668), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "2024-02-02 00:00:00 EST -0500", "2024-02-16 00:00:00 EST -0500", "2024-03-01 00:00:00 EST -0500",
      "2024-03-15 00:00:00 EDT -0400", "2024-03-29 00:00:00 EDT -0400", "2024-04-12 00:00:00 EDT -0400",
    ],
  )
}

///|
test "automatic wrapper original 9 NY 2024-03-10T07:00:00 monthly True" {
  @date.register_timezone("D15/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D15/reference-NY")
  let zone = @date.get_timezone(name="D15/reference-NY")
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=true,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(19752.291666666668, timezone=zone),
      ),
    ),
    [1, 2024, 1, 30, 2, 0, 0, 0, -18000],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(19752.291666666668).with_timezone(zone),
      ),
    ),
    [1, 2024, 1, 30, 2, 0, 0, 0, -18000],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(19832.291666666668, timezone=zone),
      ),
    ),
    [1, 2024, 4, 19, 3, 0, 0, 0, -14400],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(19832.291666666668).with_timezone(zone),
      ),
    ),
    [1, 2024, 4, 19, 3, 0, 0, 0, -14400],
  )
  let selected = locator.get_locator_for_range(
    19752.291666666668, 19832.291666666668,
  )
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Day)
  assert_eq(selected.interval(), 1)
  assert_eq(selected.unit_scale(), 1.0)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2024, 1, 30, 2, 0, 0, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2024, 4, 19, 3, 0, 0, 0, 0]),
  )
  let ticks = locator.tick_values(19752.291666666668, 19832.291666666668)
  assert_eq(ticks, [
    19754.208333333332, 19768.208333333332, 19783.208333333332, 19797.166666666668,
    19814.166666666668, 19828.166666666668,
  ])
  assert_eq(
    locator.tick_values(19832.291666666668, 19752.291666666668),
    ticks.rev(),
  )
  assert_eq(
    locator.as_locator().tick_values(19752.291666666668, 19832.291666666668),
    ticks,
  )
  assert_eq(selected.tick_values(19752.291666666668, 19832.291666666668), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "2024-02-01 00:00:00 EST -0500", "2024-02-15 00:00:00 EST -0500", "2024-03-01 00:00:00 EST -0500",
      "2024-03-15 00:00:00 EDT -0400", "2024-04-01 00:00:00 EDT -0400", "2024-04-15 00:00:00 EDT -0400",
    ],
  )
}

///|
test "automatic wrapper original 10 NY 2024-11-03T06:00:00 seconds False" {
  @date.register_timezone("D15/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D15/reference-NY")
  let zone = @date.get_timezone(name="D15/reference-NY")
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=false,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(20030.24994212963, timezone=zone),
      ),
    ),
    [1, 2024, 11, 3, 1, 59, 55, 0, -14400],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(20030.24994212963).with_timezone(zone),
      ),
    ),
    [1, 2024, 11, 3, 1, 59, 55, 0, -14400],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(20030.25005787037, timezone=zone),
      ),
    ),
    [1, 2024, 11, 3, 1, 0, 5, 0, -18000],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(20030.25005787037).with_timezone(zone),
      ),
    ),
    [1, 2024, 11, 3, 1, 0, 5, 0, -18000],
  )
  let selected = locator.get_locator_for_range(
    20030.24994212963, 20030.25005787037,
  )
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Minute)
  assert_eq(selected.interval(), 10)
  assert_eq(selected.unit_scale(), 0.0006944444444444445)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2024, 11, 3, 1, 59, 55, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2024, 11, 3, 1, 0, 5, 0, 0]),
  )
  let ticks = locator.tick_values(20030.24994212963, 20030.25005787037)
  assert_eq(ticks, [20030.24994212963, 20030.25005787037])
  assert_eq(
    locator.tick_values(20030.25005787037, 20030.24994212963),
    ticks.rev(),
  )
  assert_eq(
    locator.as_locator().tick_values(20030.24994212963, 20030.25005787037),
    ticks,
  )
  assert_eq(selected.tick_values(20030.24994212963, 20030.25005787037), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    ["2024-11-03 01:59:55 EDT -0400", "2024-11-03 01:00:05 EST -0500"],
  )
}

///|
test "automatic wrapper original 11 NY 2024-11-03T06:00:00 seconds True" {
  @date.register_timezone("D15/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D15/reference-NY")
  let zone = @date.get_timezone(name="D15/reference-NY")
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=true,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(20030.24994212963, timezone=zone),
      ),
    ),
    [1, 2024, 11, 3, 1, 59, 55, 0, -14400],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(20030.24994212963).with_timezone(zone),
      ),
    ),
    [1, 2024, 11, 3, 1, 59, 55, 0, -14400],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(20030.25005787037, timezone=zone),
      ),
    ),
    [1, 2024, 11, 3, 1, 0, 5, 0, -18000],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(20030.25005787037).with_timezone(zone),
      ),
    ),
    [1, 2024, 11, 3, 1, 0, 5, 0, -18000],
  )
  let selected = locator.get_locator_for_range(
    20030.24994212963, 20030.25005787037,
  )
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Minute)
  assert_eq(selected.interval(), 1)
  assert_eq(selected.unit_scale(), 0.0006944444444444445)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2024, 11, 3, 1, 59, 55, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2024, 11, 3, 1, 0, 5, 0, 0]),
  )
  let ticks = locator.tick_values(20030.24994212963, 20030.25005787037)
  assert_eq(ticks, [20030.24994212963, 20030.25005787037])
  assert_eq(
    locator.tick_values(20030.25005787037, 20030.24994212963),
    ticks.rev(),
  )
  assert_eq(
    locator.as_locator().tick_values(20030.24994212963, 20030.25005787037),
    ticks,
  )
  assert_eq(selected.tick_values(20030.24994212963, 20030.25005787037), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    ["2024-11-03 01:59:55 EDT -0400", "2024-11-03 01:00:05 EST -0500"],
  )
}

///|
test "automatic wrapper original 12 NY 2024-11-03T06:00:00 minutes False" {
  @date.register_timezone("D15/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D15/reference-NY")
  let zone = @date.get_timezone(name="D15/reference-NY")
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=false,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(@date.num2date(20030.21875, timezone=zone)),
    ),
    [1, 2024, 11, 3, 1, 15, 0, 0, -14400],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(20030.21875).with_timezone(zone),
      ),
    ),
    [1, 2024, 11, 3, 1, 15, 0, 0, -14400],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(20030.302083333332, timezone=zone),
      ),
    ),
    [1, 2024, 11, 3, 2, 15, 0, 0, -18000],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(20030.302083333332).with_timezone(zone),
      ),
    ),
    [1, 2024, 11, 3, 2, 15, 0, 0, -18000],
  )
  let selected = locator.get_locator_for_range(20030.21875, 20030.302083333332)
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Minute)
  assert_eq(selected.interval(), 10)
  assert_eq(selected.unit_scale(), 0.0006944444444444445)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2024, 11, 3, 1, 15, 0, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2024, 11, 3, 2, 15, 0, 0, 0]),
  )
  let ticks = locator.tick_values(20030.21875, 20030.302083333332)
  assert_eq(ticks, [
    20030.21875, 20030.225694444445, 20030.23263888889, 20030.239583333332, 20030.246527777777,
    20030.29513888889, 20030.302083333332,
  ])
  assert_eq(locator.tick_values(20030.302083333332, 20030.21875), ticks.rev())
  assert_eq(
    locator.as_locator().tick_values(20030.21875, 20030.302083333332),
    ticks,
  )
  assert_eq(selected.tick_values(20030.21875, 20030.302083333332), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "2024-11-03 01:15:00 EDT -0400", "2024-11-03 01:25:00 EDT -0400", "2024-11-03 01:35:00 EDT -0400",
      "2024-11-03 01:45:00 EDT -0400", "2024-11-03 01:55:00 EDT -0400", "2024-11-03 02:05:00 EST -0500",
      "2024-11-03 02:15:00 EST -0500",
    ],
  )
}

///|
test "automatic wrapper original 13 NY 2024-11-03T06:00:00 minutes True" {
  @date.register_timezone("D15/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D15/reference-NY")
  let zone = @date.get_timezone(name="D15/reference-NY")
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=true,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(@date.num2date(20030.21875, timezone=zone)),
    ),
    [1, 2024, 11, 3, 1, 15, 0, 0, -14400],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(20030.21875).with_timezone(zone),
      ),
    ),
    [1, 2024, 11, 3, 1, 15, 0, 0, -14400],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(20030.302083333332, timezone=zone),
      ),
    ),
    [1, 2024, 11, 3, 2, 15, 0, 0, -18000],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(20030.302083333332).with_timezone(zone),
      ),
    ),
    [1, 2024, 11, 3, 2, 15, 0, 0, -18000],
  )
  let selected = locator.get_locator_for_range(20030.21875, 20030.302083333332)
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Minute)
  assert_eq(selected.interval(), 1)
  assert_eq(selected.unit_scale(), 0.0006944444444444445)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2024, 11, 3, 1, 15, 0, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2024, 11, 3, 2, 15, 0, 0, 0]),
  )
  let ticks = locator.tick_values(20030.21875, 20030.302083333332)
  assert_eq(ticks, [
    20030.222222222223, 20030.229166666668, 20030.23611111111, 20030.243055555555,
    20030.291666666668, 20030.29861111111,
  ])
  assert_eq(locator.tick_values(20030.302083333332, 20030.21875), ticks.rev())
  assert_eq(
    locator.as_locator().tick_values(20030.21875, 20030.302083333332),
    ticks,
  )
  assert_eq(selected.tick_values(20030.21875, 20030.302083333332), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "2024-11-03 01:20:00 EDT -0400", "2024-11-03 01:30:00 EDT -0400", "2024-11-03 01:40:00 EDT -0400",
      "2024-11-03 01:50:00 EDT -0400", "2024-11-03 02:00:00 EST -0500", "2024-11-03 02:10:00 EST -0500",
    ],
  )
}

///|
test "automatic wrapper original 14 NY 2024-11-03T06:00:00 hours False" {
  @date.register_timezone("D15/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D15/reference-NY")
  let zone = @date.get_timezone(name="D15/reference-NY")
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=false,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(@date.num2date(20030.125, timezone=zone)),
    ),
    [1, 2024, 11, 2, 23, 0, 0, 0, -14400],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(20030.125).with_timezone(zone),
      ),
    ),
    [1, 2024, 11, 2, 23, 0, 0, 0, -14400],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(20030.458333333332, timezone=zone),
      ),
    ),
    [1, 2024, 11, 3, 6, 0, 0, 0, -18000],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(20030.458333333332).with_timezone(zone),
      ),
    ),
    [1, 2024, 11, 3, 6, 0, 0, 0, -18000],
  )
  let selected = locator.get_locator_for_range(20030.125, 20030.458333333332)
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Hour)
  assert_eq(selected.interval(), 1)
  assert_eq(selected.unit_scale(), 0.041666666666666664)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2024, 11, 2, 23, 0, 0, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2024, 11, 3, 6, 0, 0, 0, 0]),
  )
  let ticks = locator.tick_values(20030.125, 20030.458333333332)
  assert_eq(ticks, [
    20030.125, 20030.166666666668, 20030.208333333332, 20030.291666666668, 20030.333333333332,
    20030.375, 20030.416666666668, 20030.458333333332,
  ])
  assert_eq(locator.tick_values(20030.458333333332, 20030.125), ticks.rev())
  assert_eq(
    locator.as_locator().tick_values(20030.125, 20030.458333333332),
    ticks,
  )
  assert_eq(selected.tick_values(20030.125, 20030.458333333332), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "2024-11-02 23:00:00 EDT -0400", "2024-11-03 00:00:00 EDT -0400", "2024-11-03 01:00:00 EDT -0400",
      "2024-11-03 02:00:00 EST -0500", "2024-11-03 03:00:00 EST -0500", "2024-11-03 04:00:00 EST -0500",
      "2024-11-03 05:00:00 EST -0500", "2024-11-03 06:00:00 EST -0500",
    ],
  )
}

///|
test "automatic wrapper original 15 NY 2024-11-03T06:00:00 hours True" {
  @date.register_timezone("D15/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D15/reference-NY")
  let zone = @date.get_timezone(name="D15/reference-NY")
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=true,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(@date.num2date(20030.125, timezone=zone)),
    ),
    [1, 2024, 11, 2, 23, 0, 0, 0, -14400],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(20030.125).with_timezone(zone),
      ),
    ),
    [1, 2024, 11, 2, 23, 0, 0, 0, -14400],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(20030.458333333332, timezone=zone),
      ),
    ),
    [1, 2024, 11, 3, 6, 0, 0, 0, -18000],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(20030.458333333332).with_timezone(zone),
      ),
    ),
    [1, 2024, 11, 3, 6, 0, 0, 0, -18000],
  )
  let selected = locator.get_locator_for_range(20030.125, 20030.458333333332)
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Hour)
  assert_eq(selected.interval(), 1)
  assert_eq(selected.unit_scale(), 0.041666666666666664)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2024, 11, 2, 23, 0, 0, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2024, 11, 3, 6, 0, 0, 0, 0]),
  )
  let ticks = locator.tick_values(20030.125, 20030.458333333332)
  assert_eq(ticks, [
    20030.125, 20030.166666666668, 20030.208333333332, 20030.291666666668, 20030.333333333332,
    20030.375, 20030.416666666668, 20030.458333333332,
  ])
  assert_eq(locator.tick_values(20030.458333333332, 20030.125), ticks.rev())
  assert_eq(
    locator.as_locator().tick_values(20030.125, 20030.458333333332),
    ticks,
  )
  assert_eq(selected.tick_values(20030.125, 20030.458333333332), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "2024-11-02 23:00:00 EDT -0400", "2024-11-03 00:00:00 EDT -0400", "2024-11-03 01:00:00 EDT -0400",
      "2024-11-03 02:00:00 EST -0500", "2024-11-03 03:00:00 EST -0500", "2024-11-03 04:00:00 EST -0500",
      "2024-11-03 05:00:00 EST -0500", "2024-11-03 06:00:00 EST -0500",
    ],
  )
}

///|
test "automatic wrapper original 16 NY 2024-11-03T06:00:00 daily False" {
  @date.register_timezone("D15/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D15/reference-NY")
  let zone = @date.get_timezone(name="D15/reference-NY")
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=false,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(@date.num2date(20023.25, timezone=zone)),
    ),
    [1, 2024, 10, 27, 2, 0, 0, 0, -14400],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(20023.25).with_timezone(zone),
      ),
    ),
    [1, 2024, 10, 27, 2, 0, 0, 0, -14400],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(@date.num2date(20037.25, timezone=zone)),
    ),
    [1, 2024, 11, 10, 1, 0, 0, 0, -18000],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(20037.25).with_timezone(zone),
      ),
    ),
    [1, 2024, 11, 10, 1, 0, 0, 0, -18000],
  )
  let selected = locator.get_locator_for_range(20023.25, 20037.25)
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Day)
  assert_eq(selected.interval(), 2)
  assert_eq(selected.unit_scale(), 1.0)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2024, 10, 27, 2, 0, 0, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2024, 11, 10, 1, 0, 0, 0, 0]),
  )
  let ticks = locator.tick_values(20023.25, 20037.25)
  assert_eq(ticks, [
    20025.166666666668, 20027.166666666668, 20029.166666666668, 20031.208333333332,
    20033.208333333332, 20035.208333333332, 20037.208333333332,
  ])
  assert_eq(locator.tick_values(20037.25, 20023.25), ticks.rev())
  assert_eq(locator.as_locator().tick_values(20023.25, 20037.25), ticks)
  assert_eq(selected.tick_values(20023.25, 20037.25), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "2024-10-29 00:00:00 EDT -0400", "2024-10-31 00:00:00 EDT -0400", "2024-11-02 00:00:00 EDT -0400",
      "2024-11-04 00:00:00 EST -0500", "2024-11-06 00:00:00 EST -0500", "2024-11-08 00:00:00 EST -0500",
      "2024-11-10 00:00:00 EST -0500",
    ],
  )
}

///|
test "automatic wrapper original 17 NY 2024-11-03T06:00:00 daily True" {
  @date.register_timezone("D15/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D15/reference-NY")
  let zone = @date.get_timezone(name="D15/reference-NY")
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=true,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(@date.num2date(20023.25, timezone=zone)),
    ),
    [1, 2024, 10, 27, 2, 0, 0, 0, -14400],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(20023.25).with_timezone(zone),
      ),
    ),
    [1, 2024, 10, 27, 2, 0, 0, 0, -14400],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(@date.num2date(20037.25, timezone=zone)),
    ),
    [1, 2024, 11, 10, 1, 0, 0, 0, -18000],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(20037.25).with_timezone(zone),
      ),
    ),
    [1, 2024, 11, 10, 1, 0, 0, 0, -18000],
  )
  let selected = locator.get_locator_for_range(20023.25, 20037.25)
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Day)
  assert_eq(selected.interval(), 1)
  assert_eq(selected.unit_scale(), 1.0)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2024, 10, 27, 2, 0, 0, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2024, 11, 10, 1, 0, 0, 0, 0]),
  )
  let ticks = locator.tick_values(20023.25, 20037.25)
  assert_eq(ticks, [
    20025.166666666668, 20027.166666666668, 20028.166666666668, 20030.166666666668,
    20032.208333333332, 20034.208333333332, 20036.208333333332,
  ])
  assert_eq(locator.tick_values(20037.25, 20023.25), ticks.rev())
  assert_eq(locator.as_locator().tick_values(20023.25, 20037.25), ticks)
  assert_eq(selected.tick_values(20023.25, 20037.25), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "2024-10-29 00:00:00 EDT -0400", "2024-10-31 00:00:00 EDT -0400", "2024-11-01 00:00:00 EDT -0400",
      "2024-11-03 00:00:00 EDT -0400", "2024-11-05 00:00:00 EST -0500", "2024-11-07 00:00:00 EST -0500",
      "2024-11-09 00:00:00 EST -0500",
    ],
  )
}

///|
test "automatic wrapper original 18 NY 2024-11-03T06:00:00 monthly False" {
  @date.register_timezone("D15/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D15/reference-NY")
  let zone = @date.get_timezone(name="D15/reference-NY")
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=false,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(@date.num2date(19990.25, timezone=zone)),
    ),
    [1, 2024, 9, 24, 2, 0, 0, 0, -14400],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(19990.25).with_timezone(zone),
      ),
    ),
    [1, 2024, 9, 24, 2, 0, 0, 0, -14400],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(@date.num2date(20070.25, timezone=zone)),
    ),
    [1, 2024, 12, 13, 1, 0, 0, 0, -18000],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(20070.25).with_timezone(zone),
      ),
    ),
    [1, 2024, 12, 13, 1, 0, 0, 0, -18000],
  )
  let selected = locator.get_locator_for_range(19990.25, 20070.25)
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Day)
  assert_eq(selected.interval(), 14)
  assert_eq(selected.unit_scale(), 1.0)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2024, 9, 24, 2, 0, 0, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2024, 12, 13, 1, 0, 0, 0, 0]),
  )
  let ticks = locator.tick_values(19990.25, 20070.25)
  assert_eq(ticks, [
    19993.166666666668, 20007.166666666668, 20021.166666666668, 20035.208333333332,
    20049.208333333332, 20063.208333333332,
  ])
  assert_eq(locator.tick_values(20070.25, 19990.25), ticks.rev())
  assert_eq(locator.as_locator().tick_values(19990.25, 20070.25), ticks)
  assert_eq(selected.tick_values(19990.25, 20070.25), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "2024-09-27 00:00:00 EDT -0400", "2024-10-11 00:00:00 EDT -0400", "2024-10-25 00:00:00 EDT -0400",
      "2024-11-08 00:00:00 EST -0500", "2024-11-22 00:00:00 EST -0500", "2024-12-06 00:00:00 EST -0500",
    ],
  )
}

///|
test "automatic wrapper original 19 NY 2024-11-03T06:00:00 monthly True" {
  @date.register_timezone("D15/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D15/reference-NY")
  let zone = @date.get_timezone(name="D15/reference-NY")
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=true,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(@date.num2date(19990.25, timezone=zone)),
    ),
    [1, 2024, 9, 24, 2, 0, 0, 0, -14400],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(19990.25).with_timezone(zone),
      ),
    ),
    [1, 2024, 9, 24, 2, 0, 0, 0, -14400],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(@date.num2date(20070.25, timezone=zone)),
    ),
    [1, 2024, 12, 13, 1, 0, 0, 0, -18000],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(20070.25).with_timezone(zone),
      ),
    ),
    [1, 2024, 12, 13, 1, 0, 0, 0, -18000],
  )
  let selected = locator.get_locator_for_range(19990.25, 20070.25)
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Day)
  assert_eq(selected.interval(), 1)
  assert_eq(selected.unit_scale(), 1.0)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2024, 9, 24, 2, 0, 0, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2024, 12, 13, 1, 0, 0, 0, 0]),
  )
  let ticks = locator.tick_values(19990.25, 20070.25)
  assert_eq(ticks, [
    19997.166666666668, 20011.166666666668, 20028.166666666668, 20042.208333333332,
    20058.208333333332,
  ])
  assert_eq(locator.tick_values(20070.25, 19990.25), ticks.rev())
  assert_eq(locator.as_locator().tick_values(19990.25, 20070.25), ticks)
  assert_eq(selected.tick_values(19990.25, 20070.25), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "2024-10-01 00:00:00 EDT -0400", "2024-10-15 00:00:00 EDT -0400", "2024-11-01 00:00:00 EDT -0400",
      "2024-11-15 00:00:00 EST -0500", "2024-12-01 00:00:00 EST -0500",
    ],
  )
}

///|
test "automatic wrapper original 20 LH 2024-10-05T15:30:00 seconds False" {
  @date.register_timezone("D15/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D15/reference-LH")
  let zone = @date.get_timezone(name="D15/reference-LH")
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=false,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(20001.645775462963, timezone=zone),
      ),
    ),
    [1, 2024, 10, 6, 1, 59, 55, 0, 37800],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(20001.645775462963).with_timezone(zone),
      ),
    ),
    [1, 2024, 10, 6, 1, 59, 55, 0, 37800],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(20001.645891203705, timezone=zone),
      ),
    ),
    [1, 2024, 10, 6, 2, 30, 5, 0, 39600],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(20001.645891203705).with_timezone(zone),
      ),
    ),
    [1, 2024, 10, 6, 2, 30, 5, 0, 39600],
  )
  let selected = locator.get_locator_for_range(
    20001.645775462963, 20001.645891203705,
  )
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Minute)
  assert_eq(selected.interval(), 5)
  assert_eq(selected.unit_scale(), 0.0006944444444444445)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2024, 10, 6, 1, 59, 55, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2024, 10, 6, 2, 30, 5, 0, 0]),
  )
  let ticks = locator.tick_values(20001.645775462963, 20001.645891203705)
  assert_eq(ticks, [
    20001.62777777778, 20001.63125, 20001.63472222222, 20001.638194444444, 20001.641666666666,
    20001.64513888889,
  ])
  assert_eq(
    locator.tick_values(20001.645891203705, 20001.645775462963),
    ticks.rev(),
  )
  assert_eq(
    locator.as_locator().tick_values(20001.645775462963, 20001.645891203705),
    ticks,
  )
  assert_eq(selected.tick_values(20001.645775462963, 20001.645891203705), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "2024-10-06 01:34:00 +1030 +1030", "2024-10-06 01:39:00 +1030 +1030", "2024-10-06 01:44:00 +1030 +1030",
      "2024-10-06 01:49:00 +1030 +1030", "2024-10-06 01:54:00 +1030 +1030", "2024-10-06 01:59:00 +1030 +1030",
    ],
  )
}

///|
test "automatic wrapper original 21 LH 2024-10-05T15:30:00 seconds True" {
  @date.register_timezone("D15/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D15/reference-LH")
  let zone = @date.get_timezone(name="D15/reference-LH")
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=true,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(20001.645775462963, timezone=zone),
      ),
    ),
    [1, 2024, 10, 6, 1, 59, 55, 0, 37800],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(20001.645775462963).with_timezone(zone),
      ),
    ),
    [1, 2024, 10, 6, 1, 59, 55, 0, 37800],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(20001.645891203705, timezone=zone),
      ),
    ),
    [1, 2024, 10, 6, 2, 30, 5, 0, 39600],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(20001.645891203705).with_timezone(zone),
      ),
    ),
    [1, 2024, 10, 6, 2, 30, 5, 0, 39600],
  )
  let selected = locator.get_locator_for_range(
    20001.645775462963, 20001.645891203705,
  )
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Minute)
  assert_eq(selected.interval(), 1)
  assert_eq(selected.unit_scale(), 0.0006944444444444445)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2024, 10, 6, 1, 59, 55, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2024, 10, 6, 2, 30, 5, 0, 0]),
  )
  let ticks = locator.tick_values(20001.645775462963, 20001.645891203705)
  assert_eq(ticks, [
    20001.625, 20001.628472222223, 20001.631944444445, 20001.635416666668, 20001.63888888889,
    20001.64236111111, 20001.645833333332,
  ])
  assert_eq(
    locator.tick_values(20001.645891203705, 20001.645775462963),
    ticks.rev(),
  )
  assert_eq(
    locator.as_locator().tick_values(20001.645775462963, 20001.645891203705),
    ticks,
  )
  assert_eq(selected.tick_values(20001.645775462963, 20001.645891203705), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "2024-10-06 01:30:00 +1030 +1030", "2024-10-06 01:35:00 +1030 +1030", "2024-10-06 01:40:00 +1030 +1030",
      "2024-10-06 01:45:00 +1030 +1030", "2024-10-06 01:50:00 +1030 +1030", "2024-10-06 01:55:00 +1030 +1030",
      "2024-10-06 02:30:00 +11 +1100",
    ],
  )
}

///|
test "automatic wrapper original 22 LH 2024-10-05T15:30:00 minutes False" {
  @date.register_timezone("D15/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D15/reference-LH")
  let zone = @date.get_timezone(name="D15/reference-LH")
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=false,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(20001.614583333332, timezone=zone),
      ),
    ),
    [1, 2024, 10, 6, 1, 15, 0, 0, 37800],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(20001.614583333332).with_timezone(zone),
      ),
    ),
    [1, 2024, 10, 6, 1, 15, 0, 0, 37800],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(20001.697916666668, timezone=zone),
      ),
    ),
    [1, 2024, 10, 6, 3, 45, 0, 0, 39600],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(20001.697916666668).with_timezone(zone),
      ),
    ),
    [1, 2024, 10, 6, 3, 45, 0, 0, 39600],
  )
  let selected = locator.get_locator_for_range(
    20001.614583333332, 20001.697916666668,
  )
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Minute)
  assert_eq(selected.interval(), 15)
  assert_eq(selected.unit_scale(), 0.0006944444444444445)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2024, 10, 6, 1, 15, 0, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2024, 10, 6, 3, 45, 0, 0, 0]),
  )
  let ticks = locator.tick_values(20001.614583333332, 20001.697916666668)
  assert_eq(ticks, [
    20001.614583333332, 20001.625, 20001.635416666668, 20001.625, 20001.635416666668,
    20001.645833333332, 20001.65625, 20001.666666666668, 20001.677083333332, 20001.6875,
    20001.697916666668,
  ])
  assert_eq(
    locator.tick_values(20001.697916666668, 20001.614583333332),
    ticks.rev(),
  )
  assert_eq(
    locator.as_locator().tick_values(20001.614583333332, 20001.697916666668),
    ticks,
  )
  assert_eq(selected.tick_values(20001.614583333332, 20001.697916666668), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "2024-10-06 01:15:00 +1030 +1030", "2024-10-06 01:30:00 +1030 +1030", "2024-10-06 01:45:00 +1030 +1030",
      "2024-10-06 01:30:00 +1030 +1030", "2024-10-06 01:45:00 +1030 +1030", "2024-10-06 02:30:00 +11 +1100",
      "2024-10-06 02:45:00 +11 +1100", "2024-10-06 03:00:00 +11 +1100", "2024-10-06 03:15:00 +11 +1100",
      "2024-10-06 03:30:00 +11 +1100", "2024-10-06 03:45:00 +11 +1100",
    ],
  )
}

///|
test "automatic wrapper original 23 LH 2024-10-05T15:30:00 minutes True" {
  @date.register_timezone("D15/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D15/reference-LH")
  let zone = @date.get_timezone(name="D15/reference-LH")
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=true,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(20001.614583333332, timezone=zone),
      ),
    ),
    [1, 2024, 10, 6, 1, 15, 0, 0, 37800],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(20001.614583333332).with_timezone(zone),
      ),
    ),
    [1, 2024, 10, 6, 1, 15, 0, 0, 37800],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(20001.697916666668, timezone=zone),
      ),
    ),
    [1, 2024, 10, 6, 3, 45, 0, 0, 39600],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(20001.697916666668).with_timezone(zone),
      ),
    ),
    [1, 2024, 10, 6, 3, 45, 0, 0, 39600],
  )
  let selected = locator.get_locator_for_range(
    20001.614583333332, 20001.697916666668,
  )
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Minute)
  assert_eq(selected.interval(), 1)
  assert_eq(selected.unit_scale(), 0.0006944444444444445)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2024, 10, 6, 1, 15, 0, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2024, 10, 6, 3, 45, 0, 0, 0]),
  )
  let ticks = locator.tick_values(20001.614583333332, 20001.697916666668)
  assert_eq(ticks, [
    20001.614583333332, 20001.625, 20001.635416666668, 20001.625, 20001.635416666668,
    20001.645833333332, 20001.65625, 20001.666666666668, 20001.677083333332, 20001.6875,
    20001.697916666668,
  ])
  assert_eq(
    locator.tick_values(20001.697916666668, 20001.614583333332),
    ticks.rev(),
  )
  assert_eq(
    locator.as_locator().tick_values(20001.614583333332, 20001.697916666668),
    ticks,
  )
  assert_eq(selected.tick_values(20001.614583333332, 20001.697916666668), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "2024-10-06 01:15:00 +1030 +1030", "2024-10-06 01:30:00 +1030 +1030", "2024-10-06 01:45:00 +1030 +1030",
      "2024-10-06 01:30:00 +1030 +1030", "2024-10-06 01:45:00 +1030 +1030", "2024-10-06 02:30:00 +11 +1100",
      "2024-10-06 02:45:00 +11 +1100", "2024-10-06 03:00:00 +11 +1100", "2024-10-06 03:15:00 +11 +1100",
      "2024-10-06 03:30:00 +11 +1100", "2024-10-06 03:45:00 +11 +1100",
    ],
  )
}

///|
test "automatic wrapper original 24 LH 2024-10-05T15:30:00 hours False" {
  @date.register_timezone("D15/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D15/reference-LH")
  let zone = @date.get_timezone(name="D15/reference-LH")
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=false,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(20001.520833333332, timezone=zone),
      ),
    ),
    [1, 2024, 10, 5, 23, 0, 0, 0, 37800],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(20001.520833333332).with_timezone(zone),
      ),
    ),
    [1, 2024, 10, 5, 23, 0, 0, 0, 37800],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(20001.854166666668, timezone=zone),
      ),
    ),
    [1, 2024, 10, 6, 7, 30, 0, 0, 39600],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(20001.854166666668).with_timezone(zone),
      ),
    ),
    [1, 2024, 10, 6, 7, 30, 0, 0, 39600],
  )
  let selected = locator.get_locator_for_range(
    20001.520833333332, 20001.854166666668,
  )
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Hour)
  assert_eq(selected.interval(), 1)
  assert_eq(selected.unit_scale(), 0.041666666666666664)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2024, 10, 5, 23, 0, 0, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2024, 10, 6, 7, 30, 0, 0, 0]),
  )
  let ticks = locator.tick_values(20001.520833333332, 20001.854166666668)
  assert_eq(ticks, [
    20001.520833333332, 20001.5625, 20001.604166666668, 20001.625, 20001.666666666668,
    20001.708333333332, 20001.75, 20001.791666666668, 20001.833333333332,
  ])
  assert_eq(
    locator.tick_values(20001.854166666668, 20001.520833333332),
    ticks.rev(),
  )
  assert_eq(
    locator.as_locator().tick_values(20001.520833333332, 20001.854166666668),
    ticks,
  )
  assert_eq(selected.tick_values(20001.520833333332, 20001.854166666668), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "2024-10-05 23:00:00 +1030 +1030", "2024-10-06 00:00:00 +1030 +1030", "2024-10-06 01:00:00 +1030 +1030",
      "2024-10-06 01:30:00 +1030 +1030", "2024-10-06 03:00:00 +11 +1100", "2024-10-06 04:00:00 +11 +1100",
      "2024-10-06 05:00:00 +11 +1100", "2024-10-06 06:00:00 +11 +1100", "2024-10-06 07:00:00 +11 +1100",
    ],
  )
}

///|
test "automatic wrapper original 25 LH 2024-10-05T15:30:00 hours True" {
  @date.register_timezone("D15/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D15/reference-LH")
  let zone = @date.get_timezone(name="D15/reference-LH")
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=true,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(20001.520833333332, timezone=zone),
      ),
    ),
    [1, 2024, 10, 5, 23, 0, 0, 0, 37800],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(20001.520833333332).with_timezone(zone),
      ),
    ),
    [1, 2024, 10, 5, 23, 0, 0, 0, 37800],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(20001.854166666668, timezone=zone),
      ),
    ),
    [1, 2024, 10, 6, 7, 30, 0, 0, 39600],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(20001.854166666668).with_timezone(zone),
      ),
    ),
    [1, 2024, 10, 6, 7, 30, 0, 0, 39600],
  )
  let selected = locator.get_locator_for_range(
    20001.520833333332, 20001.854166666668,
  )
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Hour)
  assert_eq(selected.interval(), 1)
  assert_eq(selected.unit_scale(), 0.041666666666666664)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2024, 10, 5, 23, 0, 0, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2024, 10, 6, 7, 30, 0, 0, 0]),
  )
  let ticks = locator.tick_values(20001.520833333332, 20001.854166666668)
  assert_eq(ticks, [
    20001.520833333332, 20001.5625, 20001.604166666668, 20001.625, 20001.666666666668,
    20001.708333333332, 20001.75, 20001.791666666668, 20001.833333333332,
  ])
  assert_eq(
    locator.tick_values(20001.854166666668, 20001.520833333332),
    ticks.rev(),
  )
  assert_eq(
    locator.as_locator().tick_values(20001.520833333332, 20001.854166666668),
    ticks,
  )
  assert_eq(selected.tick_values(20001.520833333332, 20001.854166666668), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "2024-10-05 23:00:00 +1030 +1030", "2024-10-06 00:00:00 +1030 +1030", "2024-10-06 01:00:00 +1030 +1030",
      "2024-10-06 01:30:00 +1030 +1030", "2024-10-06 03:00:00 +11 +1100", "2024-10-06 04:00:00 +11 +1100",
      "2024-10-06 05:00:00 +11 +1100", "2024-10-06 06:00:00 +11 +1100", "2024-10-06 07:00:00 +11 +1100",
    ],
  )
}

///|
test "automatic wrapper original 26 LH 2024-10-05T15:30:00 daily False" {
  @date.register_timezone("D15/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D15/reference-LH")
  let zone = @date.get_timezone(name="D15/reference-LH")
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=false,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(19994.645833333332, timezone=zone),
      ),
    ),
    [1, 2024, 9, 29, 2, 0, 0, 0, 37800],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(19994.645833333332).with_timezone(zone),
      ),
    ),
    [1, 2024, 9, 29, 2, 0, 0, 0, 37800],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(20008.645833333332, timezone=zone),
      ),
    ),
    [1, 2024, 10, 13, 2, 30, 0, 0, 39600],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(20008.645833333332).with_timezone(zone),
      ),
    ),
    [1, 2024, 10, 13, 2, 30, 0, 0, 39600],
  )
  let selected = locator.get_locator_for_range(
    19994.645833333332, 20008.645833333332,
  )
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Day)
  assert_eq(selected.interval(), 2)
  assert_eq(selected.unit_scale(), 1.0)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2024, 9, 29, 2, 0, 0, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2024, 10, 13, 2, 30, 0, 0, 0]),
  )
  let ticks = locator.tick_values(19994.645833333332, 20008.645833333332)
  assert_eq(ticks, [
    19996.5625, 19998.5625, 20000.5625, 20002.541666666668, 20004.541666666668, 20006.541666666668,
    20008.541666666668,
  ])
  assert_eq(
    locator.tick_values(20008.645833333332, 19994.645833333332),
    ticks.rev(),
  )
  assert_eq(
    locator.as_locator().tick_values(19994.645833333332, 20008.645833333332),
    ticks,
  )
  assert_eq(selected.tick_values(19994.645833333332, 20008.645833333332), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "2024-10-01 00:00:00 +1030 +1030", "2024-10-03 00:00:00 +1030 +1030", "2024-10-05 00:00:00 +1030 +1030",
      "2024-10-07 00:00:00 +11 +1100", "2024-10-09 00:00:00 +11 +1100", "2024-10-11 00:00:00 +11 +1100",
      "2024-10-13 00:00:00 +11 +1100",
    ],
  )
}

///|
test "automatic wrapper original 27 LH 2024-10-05T15:30:00 daily True" {
  @date.register_timezone("D15/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D15/reference-LH")
  let zone = @date.get_timezone(name="D15/reference-LH")
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=true,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(19994.645833333332, timezone=zone),
      ),
    ),
    [1, 2024, 9, 29, 2, 0, 0, 0, 37800],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(19994.645833333332).with_timezone(zone),
      ),
    ),
    [1, 2024, 9, 29, 2, 0, 0, 0, 37800],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(20008.645833333332, timezone=zone),
      ),
    ),
    [1, 2024, 10, 13, 2, 30, 0, 0, 39600],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(20008.645833333332).with_timezone(zone),
      ),
    ),
    [1, 2024, 10, 13, 2, 30, 0, 0, 39600],
  )
  let selected = locator.get_locator_for_range(
    19994.645833333332, 20008.645833333332,
  )
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Day)
  assert_eq(selected.interval(), 1)
  assert_eq(selected.unit_scale(), 1.0)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2024, 9, 29, 2, 0, 0, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2024, 10, 13, 2, 30, 0, 0, 0]),
  )
  let ticks = locator.tick_values(19994.645833333332, 20008.645833333332)
  assert_eq(ticks, [
    19996.5625, 19998.5625, 20000.5625, 20002.541666666668, 20004.541666666668, 20006.541666666668,
    20008.541666666668,
  ])
  assert_eq(
    locator.tick_values(20008.645833333332, 19994.645833333332),
    ticks.rev(),
  )
  assert_eq(
    locator.as_locator().tick_values(19994.645833333332, 20008.645833333332),
    ticks,
  )
  assert_eq(selected.tick_values(19994.645833333332, 20008.645833333332), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "2024-10-01 00:00:00 +1030 +1030", "2024-10-03 00:00:00 +1030 +1030", "2024-10-05 00:00:00 +1030 +1030",
      "2024-10-07 00:00:00 +11 +1100", "2024-10-09 00:00:00 +11 +1100", "2024-10-11 00:00:00 +11 +1100",
      "2024-10-13 00:00:00 +11 +1100",
    ],
  )
}

///|
test "automatic wrapper original 28 LH 2024-10-05T15:30:00 monthly False" {
  @date.register_timezone("D15/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D15/reference-LH")
  let zone = @date.get_timezone(name="D15/reference-LH")
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=false,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(19961.645833333332, timezone=zone),
      ),
    ),
    [1, 2024, 8, 27, 2, 0, 0, 0, 37800],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(19961.645833333332).with_timezone(zone),
      ),
    ),
    [1, 2024, 8, 27, 2, 0, 0, 0, 37800],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(20041.645833333332, timezone=zone),
      ),
    ),
    [1, 2024, 11, 15, 2, 30, 0, 0, 39600],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(20041.645833333332).with_timezone(zone),
      ),
    ),
    [1, 2024, 11, 15, 2, 30, 0, 0, 39600],
  )
  let selected = locator.get_locator_for_range(
    19961.645833333332, 20041.645833333332,
  )
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Day)
  assert_eq(selected.interval(), 14)
  assert_eq(selected.unit_scale(), 1.0)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2024, 8, 27, 2, 0, 0, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2024, 11, 15, 2, 30, 0, 0, 0]),
  )
  let ticks = locator.tick_values(19961.645833333332, 20041.645833333332)
  assert_eq(ticks, [
    19965.5625, 19979.5625, 19993.5625, 20007.541666666668, 20021.541666666668, 20035.541666666668,
  ])
  assert_eq(
    locator.tick_values(20041.645833333332, 19961.645833333332),
    ticks.rev(),
  )
  assert_eq(
    locator.as_locator().tick_values(19961.645833333332, 20041.645833333332),
    ticks,
  )
  assert_eq(selected.tick_values(19961.645833333332, 20041.645833333332), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "2024-08-31 00:00:00 +1030 +1030", "2024-09-14 00:00:00 +1030 +1030", "2024-09-28 00:00:00 +1030 +1030",
      "2024-10-12 00:00:00 +11 +1100", "2024-10-26 00:00:00 +11 +1100", "2024-11-09 00:00:00 +11 +1100",
    ],
  )
}

///|
test "automatic wrapper original 29 LH 2024-10-05T15:30:00 monthly True" {
  @date.register_timezone("D15/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D15/reference-LH")
  let zone = @date.get_timezone(name="D15/reference-LH")
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=true,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(19961.645833333332, timezone=zone),
      ),
    ),
    [1, 2024, 8, 27, 2, 0, 0, 0, 37800],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(19961.645833333332).with_timezone(zone),
      ),
    ),
    [1, 2024, 8, 27, 2, 0, 0, 0, 37800],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(20041.645833333332, timezone=zone),
      ),
    ),
    [1, 2024, 11, 15, 2, 30, 0, 0, 39600],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(20041.645833333332).with_timezone(zone),
      ),
    ),
    [1, 2024, 11, 15, 2, 30, 0, 0, 39600],
  )
  let selected = locator.get_locator_for_range(
    19961.645833333332, 20041.645833333332,
  )
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Day)
  assert_eq(selected.interval(), 1)
  assert_eq(selected.unit_scale(), 1.0)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2024, 8, 27, 2, 0, 0, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2024, 11, 15, 2, 30, 0, 0, 0]),
  )
  let ticks = locator.tick_values(19961.645833333332, 20041.645833333332)
  assert_eq(ticks, [
    19966.5625, 19980.5625, 19996.5625, 20010.541666666668, 20027.541666666668, 20041.541666666668,
  ])
  assert_eq(
    locator.tick_values(20041.645833333332, 19961.645833333332),
    ticks.rev(),
  )
  assert_eq(
    locator.as_locator().tick_values(19961.645833333332, 20041.645833333332),
    ticks,
  )
  assert_eq(selected.tick_values(19961.645833333332, 20041.645833333332), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "2024-09-01 00:00:00 +1030 +1030", "2024-09-15 00:00:00 +1030 +1030", "2024-10-01 00:00:00 +1030 +1030",
      "2024-10-15 00:00:00 +11 +1100", "2024-11-01 00:00:00 +11 +1100", "2024-11-15 00:00:00 +11 +1100",
    ],
  )
}

///|
test "automatic wrapper original 30 LH 2024-04-06T15:00:00 seconds False" {
  @date.register_timezone("D15/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D15/reference-LH")
  let zone = @date.get_timezone(name="D15/reference-LH")
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=false,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(19819.62494212963, timezone=zone),
      ),
    ),
    [1, 2024, 4, 7, 1, 59, 55, 0, 39600],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(19819.62494212963).with_timezone(zone),
      ),
    ),
    [1, 2024, 4, 7, 1, 59, 55, 0, 39600],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(19819.62505787037, timezone=zone),
      ),
    ),
    [1, 2024, 4, 7, 1, 30, 5, 0, 37800],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(19819.62505787037).with_timezone(zone),
      ),
    ),
    [1, 2024, 4, 7, 1, 30, 5, 0, 37800],
  )
  let selected = locator.get_locator_for_range(
    19819.62494212963, 19819.62505787037,
  )
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Minute)
  assert_eq(selected.interval(), 5)
  assert_eq(selected.unit_scale(), 0.0006944444444444445)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2024, 4, 7, 1, 59, 55, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2024, 4, 7, 1, 30, 5, 0, 0]),
  )
  let ticks = locator.tick_values(19819.62494212963, 19819.62505787037)
  assert_eq(ticks, [19819.62494212963, 19819.62505787037])
  assert_eq(
    locator.tick_values(19819.62505787037, 19819.62494212963),
    ticks.rev(),
  )
  assert_eq(
    locator.as_locator().tick_values(19819.62494212963, 19819.62505787037),
    ticks,
  )
  assert_eq(selected.tick_values(19819.62494212963, 19819.62505787037), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    ["2024-04-07 01:59:55 +11 +1100", "2024-04-07 01:30:05 +1030 +1030"],
  )
}

///|
test "automatic wrapper original 31 LH 2024-04-06T15:00:00 seconds True" {
  @date.register_timezone("D15/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D15/reference-LH")
  let zone = @date.get_timezone(name="D15/reference-LH")
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=true,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(19819.62494212963, timezone=zone),
      ),
    ),
    [1, 2024, 4, 7, 1, 59, 55, 0, 39600],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(19819.62494212963).with_timezone(zone),
      ),
    ),
    [1, 2024, 4, 7, 1, 59, 55, 0, 39600],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(19819.62505787037, timezone=zone),
      ),
    ),
    [1, 2024, 4, 7, 1, 30, 5, 0, 37800],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(19819.62505787037).with_timezone(zone),
      ),
    ),
    [1, 2024, 4, 7, 1, 30, 5, 0, 37800],
  )
  let selected = locator.get_locator_for_range(
    19819.62494212963, 19819.62505787037,
  )
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Minute)
  assert_eq(selected.interval(), 1)
  assert_eq(selected.unit_scale(), 0.0006944444444444445)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2024, 4, 7, 1, 59, 55, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2024, 4, 7, 1, 30, 5, 0, 0]),
  )
  let ticks = locator.tick_values(19819.62494212963, 19819.62505787037)
  assert_eq(ticks, [19819.62494212963, 19819.62505787037])
  assert_eq(
    locator.tick_values(19819.62505787037, 19819.62494212963),
    ticks.rev(),
  )
  assert_eq(
    locator.as_locator().tick_values(19819.62494212963, 19819.62505787037),
    ticks,
  )
  assert_eq(selected.tick_values(19819.62494212963, 19819.62505787037), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    ["2024-04-07 01:59:55 +11 +1100", "2024-04-07 01:30:05 +1030 +1030"],
  )
}

///|
test "automatic wrapper original 32 LH 2024-04-06T15:00:00 minutes False" {
  @date.register_timezone("D15/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D15/reference-LH")
  let zone = @date.get_timezone(name="D15/reference-LH")
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=false,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(@date.num2date(19819.59375, timezone=zone)),
    ),
    [1, 2024, 4, 7, 1, 15, 0, 0, 39600],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(19819.59375).with_timezone(zone),
      ),
    ),
    [1, 2024, 4, 7, 1, 15, 0, 0, 39600],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(19819.677083333332, timezone=zone),
      ),
    ),
    [1, 2024, 4, 7, 2, 45, 0, 0, 37800],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(19819.677083333332).with_timezone(zone),
      ),
    ),
    [1, 2024, 4, 7, 2, 45, 0, 0, 37800],
  )
  let selected = locator.get_locator_for_range(19819.59375, 19819.677083333332)
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Minute)
  assert_eq(selected.interval(), 10)
  assert_eq(selected.unit_scale(), 0.0006944444444444445)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2024, 4, 7, 1, 15, 0, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2024, 4, 7, 2, 45, 0, 0, 0]),
  )
  let ticks = locator.tick_values(19819.59375, 19819.677083333332)
  assert_eq(ticks, [
    19819.59375, 19819.600694444445, 19819.60763888889, 19819.614583333332, 19819.621527777777,
    19819.649305555555, 19819.65625, 19819.663194444445, 19819.67013888889, 19819.677083333332,
  ])
  assert_eq(locator.tick_values(19819.677083333332, 19819.59375), ticks.rev())
  assert_eq(
    locator.as_locator().tick_values(19819.59375, 19819.677083333332),
    ticks,
  )
  assert_eq(selected.tick_values(19819.59375, 19819.677083333332), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "2024-04-07 01:15:00 +11 +1100", "2024-04-07 01:25:00 +11 +1100", "2024-04-07 01:35:00 +11 +1100",
      "2024-04-07 01:45:00 +11 +1100", "2024-04-07 01:55:00 +11 +1100", "2024-04-07 02:05:00 +1030 +1030",
      "2024-04-07 02:15:00 +1030 +1030", "2024-04-07 02:25:00 +1030 +1030", "2024-04-07 02:35:00 +1030 +1030",
      "2024-04-07 02:45:00 +1030 +1030",
    ],
  )
}

///|
test "automatic wrapper original 33 LH 2024-04-06T15:00:00 minutes True" {
  @date.register_timezone("D15/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D15/reference-LH")
  let zone = @date.get_timezone(name="D15/reference-LH")
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=true,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(@date.num2date(19819.59375, timezone=zone)),
    ),
    [1, 2024, 4, 7, 1, 15, 0, 0, 39600],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(19819.59375).with_timezone(zone),
      ),
    ),
    [1, 2024, 4, 7, 1, 15, 0, 0, 39600],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(19819.677083333332, timezone=zone),
      ),
    ),
    [1, 2024, 4, 7, 2, 45, 0, 0, 37800],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(19819.677083333332).with_timezone(zone),
      ),
    ),
    [1, 2024, 4, 7, 2, 45, 0, 0, 37800],
  )
  let selected = locator.get_locator_for_range(19819.59375, 19819.677083333332)
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Minute)
  assert_eq(selected.interval(), 1)
  assert_eq(selected.unit_scale(), 0.0006944444444444445)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2024, 4, 7, 1, 15, 0, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2024, 4, 7, 2, 45, 0, 0, 0]),
  )
  let ticks = locator.tick_values(19819.59375, 19819.677083333332)
  assert_eq(ticks, [
    19819.597222222223, 19819.604166666668, 19819.61111111111, 19819.618055555555,
    19819.645833333332, 19819.652777777777, 19819.659722222223, 19819.666666666668,
    19819.67361111111,
  ])
  assert_eq(locator.tick_values(19819.677083333332, 19819.59375), ticks.rev())
  assert_eq(
    locator.as_locator().tick_values(19819.59375, 19819.677083333332),
    ticks,
  )
  assert_eq(selected.tick_values(19819.59375, 19819.677083333332), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "2024-04-07 01:20:00 +11 +1100", "2024-04-07 01:30:00 +11 +1100", "2024-04-07 01:40:00 +11 +1100",
      "2024-04-07 01:50:00 +11 +1100", "2024-04-07 02:00:00 +1030 +1030", "2024-04-07 02:10:00 +1030 +1030",
      "2024-04-07 02:20:00 +1030 +1030", "2024-04-07 02:30:00 +1030 +1030", "2024-04-07 02:40:00 +1030 +1030",
    ],
  )
}

///|
test "automatic wrapper original 34 LH 2024-04-06T15:00:00 hours False" {
  @date.register_timezone("D15/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D15/reference-LH")
  let zone = @date.get_timezone(name="D15/reference-LH")
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=false,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(@date.num2date(19819.5, timezone=zone)),
    ),
    [1, 2024, 4, 6, 23, 0, 0, 0, 39600],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(19819.5).with_timezone(zone),
      ),
    ),
    [1, 2024, 4, 6, 23, 0, 0, 0, 39600],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(19819.833333333332, timezone=zone),
      ),
    ),
    [1, 2024, 4, 7, 6, 30, 0, 0, 37800],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(19819.833333333332).with_timezone(zone),
      ),
    ),
    [1, 2024, 4, 7, 6, 30, 0, 0, 37800],
  )
  let selected = locator.get_locator_for_range(19819.5, 19819.833333333332)
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Hour)
  assert_eq(selected.interval(), 1)
  assert_eq(selected.unit_scale(), 0.041666666666666664)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2024, 4, 6, 23, 0, 0, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2024, 4, 7, 6, 30, 0, 0, 0]),
  )
  let ticks = locator.tick_values(19819.5, 19819.833333333332)
  assert_eq(ticks, [
    19819.5, 19819.541666666668, 19819.583333333332, 19819.645833333332, 19819.6875,
    19819.729166666668, 19819.770833333332, 19819.8125,
  ])
  assert_eq(locator.tick_values(19819.833333333332, 19819.5), ticks.rev())
  assert_eq(
    locator.as_locator().tick_values(19819.5, 19819.833333333332),
    ticks,
  )
  assert_eq(selected.tick_values(19819.5, 19819.833333333332), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "2024-04-06 23:00:00 +11 +1100", "2024-04-07 00:00:00 +11 +1100", "2024-04-07 01:00:00 +11 +1100",
      "2024-04-07 02:00:00 +1030 +1030", "2024-04-07 03:00:00 +1030 +1030", "2024-04-07 04:00:00 +1030 +1030",
      "2024-04-07 05:00:00 +1030 +1030", "2024-04-07 06:00:00 +1030 +1030",
    ],
  )
}

///|
test "automatic wrapper original 35 LH 2024-04-06T15:00:00 hours True" {
  @date.register_timezone("D15/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D15/reference-LH")
  let zone = @date.get_timezone(name="D15/reference-LH")
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=true,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(@date.num2date(19819.5, timezone=zone)),
    ),
    [1, 2024, 4, 6, 23, 0, 0, 0, 39600],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(19819.5).with_timezone(zone),
      ),
    ),
    [1, 2024, 4, 6, 23, 0, 0, 0, 39600],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(19819.833333333332, timezone=zone),
      ),
    ),
    [1, 2024, 4, 7, 6, 30, 0, 0, 37800],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(19819.833333333332).with_timezone(zone),
      ),
    ),
    [1, 2024, 4, 7, 6, 30, 0, 0, 37800],
  )
  let selected = locator.get_locator_for_range(19819.5, 19819.833333333332)
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Hour)
  assert_eq(selected.interval(), 1)
  assert_eq(selected.unit_scale(), 0.041666666666666664)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2024, 4, 6, 23, 0, 0, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2024, 4, 7, 6, 30, 0, 0, 0]),
  )
  let ticks = locator.tick_values(19819.5, 19819.833333333332)
  assert_eq(ticks, [
    19819.5, 19819.541666666668, 19819.583333333332, 19819.645833333332, 19819.6875,
    19819.729166666668, 19819.770833333332, 19819.8125,
  ])
  assert_eq(locator.tick_values(19819.833333333332, 19819.5), ticks.rev())
  assert_eq(
    locator.as_locator().tick_values(19819.5, 19819.833333333332),
    ticks,
  )
  assert_eq(selected.tick_values(19819.5, 19819.833333333332), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "2024-04-06 23:00:00 +11 +1100", "2024-04-07 00:00:00 +11 +1100", "2024-04-07 01:00:00 +11 +1100",
      "2024-04-07 02:00:00 +1030 +1030", "2024-04-07 03:00:00 +1030 +1030", "2024-04-07 04:00:00 +1030 +1030",
      "2024-04-07 05:00:00 +1030 +1030", "2024-04-07 06:00:00 +1030 +1030",
    ],
  )
}

///|
test "automatic wrapper original 36 LH 2024-04-06T15:00:00 daily False" {
  @date.register_timezone("D15/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D15/reference-LH")
  let zone = @date.get_timezone(name="D15/reference-LH")
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=false,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(@date.num2date(19812.625, timezone=zone)),
    ),
    [1, 2024, 3, 31, 2, 0, 0, 0, 39600],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(19812.625).with_timezone(zone),
      ),
    ),
    [1, 2024, 3, 31, 2, 0, 0, 0, 39600],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(@date.num2date(19826.625, timezone=zone)),
    ),
    [1, 2024, 4, 14, 1, 30, 0, 0, 37800],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(19826.625).with_timezone(zone),
      ),
    ),
    [1, 2024, 4, 14, 1, 30, 0, 0, 37800],
  )
  let selected = locator.get_locator_for_range(19812.625, 19826.625)
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Day)
  assert_eq(selected.interval(), 2)
  assert_eq(selected.unit_scale(), 1.0)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2024, 3, 31, 2, 0, 0, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2024, 4, 14, 1, 30, 0, 0, 0]),
  )
  let ticks = locator.tick_values(19812.625, 19826.625)
  assert_eq(ticks, [
    19814.541666666668, 19816.541666666668, 19818.541666666668, 19820.5625, 19822.5625,
    19824.5625, 19826.5625,
  ])
  assert_eq(locator.tick_values(19826.625, 19812.625), ticks.rev())
  assert_eq(locator.as_locator().tick_values(19812.625, 19826.625), ticks)
  assert_eq(selected.tick_values(19812.625, 19826.625), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "2024-04-02 00:00:00 +11 +1100", "2024-04-04 00:00:00 +11 +1100", "2024-04-06 00:00:00 +11 +1100",
      "2024-04-08 00:00:00 +1030 +1030", "2024-04-10 00:00:00 +1030 +1030", "2024-04-12 00:00:00 +1030 +1030",
      "2024-04-14 00:00:00 +1030 +1030",
    ],
  )
}

///|
test "automatic wrapper original 37 LH 2024-04-06T15:00:00 daily True" {
  @date.register_timezone("D15/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D15/reference-LH")
  let zone = @date.get_timezone(name="D15/reference-LH")
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=true,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(@date.num2date(19812.625, timezone=zone)),
    ),
    [1, 2024, 3, 31, 2, 0, 0, 0, 39600],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(19812.625).with_timezone(zone),
      ),
    ),
    [1, 2024, 3, 31, 2, 0, 0, 0, 39600],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(@date.num2date(19826.625, timezone=zone)),
    ),
    [1, 2024, 4, 14, 1, 30, 0, 0, 37800],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(19826.625).with_timezone(zone),
      ),
    ),
    [1, 2024, 4, 14, 1, 30, 0, 0, 37800],
  )
  let selected = locator.get_locator_for_range(19812.625, 19826.625)
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Day)
  assert_eq(selected.interval(), 1)
  assert_eq(selected.unit_scale(), 1.0)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2024, 3, 31, 2, 0, 0, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2024, 4, 14, 1, 30, 0, 0, 0]),
  )
  let ticks = locator.tick_values(19812.625, 19826.625)
  assert_eq(ticks, [
    19813.541666666668, 19815.541666666668, 19817.541666666668, 19819.541666666668,
    19821.5625, 19823.5625, 19825.5625,
  ])
  assert_eq(locator.tick_values(19826.625, 19812.625), ticks.rev())
  assert_eq(locator.as_locator().tick_values(19812.625, 19826.625), ticks)
  assert_eq(selected.tick_values(19812.625, 19826.625), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "2024-04-01 00:00:00 +11 +1100", "2024-04-03 00:00:00 +11 +1100", "2024-04-05 00:00:00 +11 +1100",
      "2024-04-07 00:00:00 +11 +1100", "2024-04-09 00:00:00 +1030 +1030", "2024-04-11 00:00:00 +1030 +1030",
      "2024-04-13 00:00:00 +1030 +1030",
    ],
  )
}

///|
test "automatic wrapper original 38 LH 2024-04-06T15:00:00 monthly False" {
  @date.register_timezone("D15/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D15/reference-LH")
  let zone = @date.get_timezone(name="D15/reference-LH")
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=false,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(@date.num2date(19779.625, timezone=zone)),
    ),
    [1, 2024, 2, 27, 2, 0, 0, 0, 39600],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(19779.625).with_timezone(zone),
      ),
    ),
    [1, 2024, 2, 27, 2, 0, 0, 0, 39600],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(@date.num2date(19859.625, timezone=zone)),
    ),
    [1, 2024, 5, 17, 1, 30, 0, 0, 37800],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(19859.625).with_timezone(zone),
      ),
    ),
    [1, 2024, 5, 17, 1, 30, 0, 0, 37800],
  )
  let selected = locator.get_locator_for_range(19779.625, 19859.625)
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Day)
  assert_eq(selected.interval(), 14)
  assert_eq(selected.unit_scale(), 1.0)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2024, 2, 27, 2, 0, 0, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2024, 5, 17, 1, 30, 0, 0, 0]),
  )
  let ticks = locator.tick_values(19779.625, 19859.625)
  assert_eq(ticks, [
    19781.541666666668, 19795.541666666668, 19809.541666666668, 19823.5625, 19837.5625,
    19851.5625,
  ])
  assert_eq(locator.tick_values(19859.625, 19779.625), ticks.rev())
  assert_eq(locator.as_locator().tick_values(19779.625, 19859.625), ticks)
  assert_eq(selected.tick_values(19779.625, 19859.625), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "2024-02-29 00:00:00 +11 +1100", "2024-03-14 00:00:00 +11 +1100", "2024-03-28 00:00:00 +11 +1100",
      "2024-04-11 00:00:00 +1030 +1030", "2024-04-25 00:00:00 +1030 +1030", "2024-05-09 00:00:00 +1030 +1030",
    ],
  )
}

///|
test "automatic wrapper original 39 LH 2024-04-06T15:00:00 monthly True" {
  @date.register_timezone("D15/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D15/reference-LH")
  let zone = @date.get_timezone(name="D15/reference-LH")
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=true,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(@date.num2date(19779.625, timezone=zone)),
    ),
    [1, 2024, 2, 27, 2, 0, 0, 0, 39600],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(19779.625).with_timezone(zone),
      ),
    ),
    [1, 2024, 2, 27, 2, 0, 0, 0, 39600],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(@date.num2date(19859.625, timezone=zone)),
    ),
    [1, 2024, 5, 17, 1, 30, 0, 0, 37800],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(19859.625).with_timezone(zone),
      ),
    ),
    [1, 2024, 5, 17, 1, 30, 0, 0, 37800],
  )
  let selected = locator.get_locator_for_range(19779.625, 19859.625)
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Day)
  assert_eq(selected.interval(), 1)
  assert_eq(selected.unit_scale(), 1.0)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2024, 2, 27, 2, 0, 0, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2024, 5, 17, 1, 30, 0, 0, 0]),
  )
  let ticks = locator.tick_values(19779.625, 19859.625)
  assert_eq(ticks, [
    19782.541666666668, 19796.541666666668, 19813.541666666668, 19827.5625, 19843.5625,
    19857.5625,
  ])
  assert_eq(locator.tick_values(19859.625, 19779.625), ticks.rev())
  assert_eq(locator.as_locator().tick_values(19779.625, 19859.625), ticks)
  assert_eq(selected.tick_values(19779.625, 19859.625), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "2024-03-01 00:00:00 +11 +1100", "2024-03-15 00:00:00 +11 +1100", "2024-04-01 00:00:00 +11 +1100",
      "2024-04-15 00:00:00 +1030 +1030", "2024-05-01 00:00:00 +1030 +1030", "2024-05-15 00:00:00 +1030 +1030",
    ],
  )
}

///|
test "automatic wrapper original 40 NEG 2024-03-31T01:00:00 seconds False" {
  let zone = @date.get_timezone(name="IST-1GMT0,M10.5.0/2,M3.5.0/1")
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=false,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(19813.041608796295, timezone=zone),
      ),
    ),
    [1, 2024, 3, 31, 0, 59, 55, 0, 0],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(19813.041608796295).with_timezone(zone),
      ),
    ),
    [1, 2024, 3, 31, 0, 59, 55, 0, 0],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(19813.041724537037, timezone=zone),
      ),
    ),
    [1, 2024, 3, 31, 2, 0, 5, 0, 3600],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(19813.041724537037).with_timezone(zone),
      ),
    ),
    [1, 2024, 3, 31, 2, 0, 5, 0, 3600],
  )
  let selected = locator.get_locator_for_range(
    19813.041608796295, 19813.041724537037,
  )
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Minute)
  assert_eq(selected.interval(), 10)
  assert_eq(selected.unit_scale(), 0.0006944444444444445)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2024, 3, 31, 0, 59, 55, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2024, 3, 31, 2, 0, 5, 0, 0]),
  )
  let ticks = locator.tick_values(19813.041608796295, 19813.041724537037)
  assert_eq(ticks, [
    19813.047916666666, 19813.05486111111, 19813.061805555557, 19813.06875, 19813.075694444444,
    19813.08263888889,
  ])
  assert_eq(
    locator.tick_values(19813.041724537037, 19813.041608796295),
    ticks.rev(),
  )
  assert_eq(
    locator.as_locator().tick_values(19813.041608796295, 19813.041724537037),
    ticks,
  )
  assert_eq(selected.tick_values(19813.041608796295, 19813.041724537037), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "2024-03-31 02:09:00 IST +0100", "2024-03-31 02:19:00 IST +0100", "2024-03-31 02:29:00 IST +0100",
      "2024-03-31 02:39:00 IST +0100", "2024-03-31 02:49:00 IST +0100", "2024-03-31 02:59:00 IST +0100",
    ],
  )
}

///|
test "automatic wrapper original 41 NEG 2024-03-31T01:00:00 seconds True" {
  let zone = @date.get_timezone(name="IST-1GMT0,M10.5.0/2,M3.5.0/1")
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=true,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(19813.041608796295, timezone=zone),
      ),
    ),
    [1, 2024, 3, 31, 0, 59, 55, 0, 0],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(19813.041608796295).with_timezone(zone),
      ),
    ),
    [1, 2024, 3, 31, 0, 59, 55, 0, 0],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(19813.041724537037, timezone=zone),
      ),
    ),
    [1, 2024, 3, 31, 2, 0, 5, 0, 3600],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(19813.041724537037).with_timezone(zone),
      ),
    ),
    [1, 2024, 3, 31, 2, 0, 5, 0, 3600],
  )
  let selected = locator.get_locator_for_range(
    19813.041608796295, 19813.041724537037,
  )
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Minute)
  assert_eq(selected.interval(), 1)
  assert_eq(selected.unit_scale(), 0.0006944444444444445)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2024, 3, 31, 0, 59, 55, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2024, 3, 31, 2, 0, 5, 0, 0]),
  )
  let ticks = locator.tick_values(19813.041608796295, 19813.041724537037)
  assert_eq(ticks, [
    19813.041666666668, 19813.04861111111, 19813.055555555555, 19813.0625, 19813.069444444445,
    19813.07638888889, 19813.041666666668,
  ])
  assert_eq(
    locator.tick_values(19813.041724537037, 19813.041608796295),
    ticks.rev(),
  )
  assert_eq(
    locator.as_locator().tick_values(19813.041608796295, 19813.041724537037),
    ticks,
  )
  assert_eq(selected.tick_values(19813.041608796295, 19813.041724537037), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "2024-03-31 02:00:00 IST +0100", "2024-03-31 02:10:00 IST +0100", "2024-03-31 02:20:00 IST +0100",
      "2024-03-31 02:30:00 IST +0100", "2024-03-31 02:40:00 IST +0100", "2024-03-31 02:50:00 IST +0100",
      "2024-03-31 02:00:00 IST +0100",
    ],
  )
}

///|
test "automatic wrapper original 42 NEG 2024-03-31T01:00:00 minutes False" {
  let zone = @date.get_timezone(name="IST-1GMT0,M10.5.0/2,M3.5.0/1")
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=false,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(19813.010416666668, timezone=zone),
      ),
    ),
    [1, 2024, 3, 31, 0, 15, 0, 0, 0],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(19813.010416666668).with_timezone(zone),
      ),
    ),
    [1, 2024, 3, 31, 0, 15, 0, 0, 0],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(@date.num2date(19813.09375, timezone=zone)),
    ),
    [1, 2024, 3, 31, 3, 15, 0, 0, 3600],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(19813.09375).with_timezone(zone),
      ),
    ),
    [1, 2024, 3, 31, 3, 15, 0, 0, 3600],
  )
  let selected = locator.get_locator_for_range(19813.010416666668, 19813.09375)
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Minute)
  assert_eq(selected.interval(), 30)
  assert_eq(selected.unit_scale(), 0.0006944444444444445)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2024, 3, 31, 0, 15, 0, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2024, 3, 31, 3, 15, 0, 0, 0]),
  )
  let ticks = locator.tick_values(19813.010416666668, 19813.09375)
  assert_eq(ticks, [
    19813.010416666668, 19813.03125, 19813.052083333332, 19813.072916666668, 19813.052083333332,
    19813.072916666668, 19813.09375,
  ])
  assert_eq(locator.tick_values(19813.09375, 19813.010416666668), ticks.rev())
  assert_eq(
    locator.as_locator().tick_values(19813.010416666668, 19813.09375),
    ticks,
  )
  assert_eq(selected.tick_values(19813.010416666668, 19813.09375), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "2024-03-31 00:15:00 GMT +0000", "2024-03-31 00:45:00 GMT +0000", "2024-03-31 02:15:00 IST +0100",
      "2024-03-31 02:45:00 IST +0100", "2024-03-31 02:15:00 IST +0100", "2024-03-31 02:45:00 IST +0100",
      "2024-03-31 03:15:00 IST +0100",
    ],
  )
}

///|
test "automatic wrapper original 43 NEG 2024-03-31T01:00:00 minutes True" {
  let zone = @date.get_timezone(name="IST-1GMT0,M10.5.0/2,M3.5.0/1")
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=true,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(19813.010416666668, timezone=zone),
      ),
    ),
    [1, 2024, 3, 31, 0, 15, 0, 0, 0],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(19813.010416666668).with_timezone(zone),
      ),
    ),
    [1, 2024, 3, 31, 0, 15, 0, 0, 0],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(@date.num2date(19813.09375, timezone=zone)),
    ),
    [1, 2024, 3, 31, 3, 15, 0, 0, 3600],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(19813.09375).with_timezone(zone),
      ),
    ),
    [1, 2024, 3, 31, 3, 15, 0, 0, 3600],
  )
  let selected = locator.get_locator_for_range(19813.010416666668, 19813.09375)
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Minute)
  assert_eq(selected.interval(), 1)
  assert_eq(selected.unit_scale(), 0.0006944444444444445)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2024, 3, 31, 0, 15, 0, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2024, 3, 31, 3, 15, 0, 0, 0]),
  )
  let ticks = locator.tick_values(19813.010416666668, 19813.09375)
  assert_eq(ticks, [
    19813.020833333332, 19813.041666666668, 19813.0625, 19813.041666666668, 19813.0625,
    19813.083333333332,
  ])
  assert_eq(locator.tick_values(19813.09375, 19813.010416666668), ticks.rev())
  assert_eq(
    locator.as_locator().tick_values(19813.010416666668, 19813.09375),
    ticks,
  )
  assert_eq(selected.tick_values(19813.010416666668, 19813.09375), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "2024-03-31 00:30:00 GMT +0000", "2024-03-31 02:00:00 IST +0100", "2024-03-31 02:30:00 IST +0100",
      "2024-03-31 02:00:00 IST +0100", "2024-03-31 02:30:00 IST +0100", "2024-03-31 03:00:00 IST +0100",
    ],
  )
}

///|
test "automatic wrapper original 44 NEG 2024-03-31T01:00:00 hours False" {
  let zone = @date.get_timezone(name="IST-1GMT0,M10.5.0/2,M3.5.0/1")
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=false,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(19812.916666666668, timezone=zone),
      ),
    ),
    [1, 2024, 3, 30, 22, 0, 0, 0, 0],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(19812.916666666668).with_timezone(zone),
      ),
    ),
    [1, 2024, 3, 30, 22, 0, 0, 0, 0],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(@date.num2date(19813.25, timezone=zone)),
    ),
    [1, 2024, 3, 31, 7, 0, 0, 0, 3600],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(19813.25).with_timezone(zone),
      ),
    ),
    [1, 2024, 3, 31, 7, 0, 0, 0, 3600],
  )
  let selected = locator.get_locator_for_range(19812.916666666668, 19813.25)
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Hour)
  assert_eq(selected.interval(), 1)
  assert_eq(selected.unit_scale(), 0.041666666666666664)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2024, 3, 30, 22, 0, 0, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2024, 3, 31, 7, 0, 0, 0, 0]),
  )
  let ticks = locator.tick_values(19812.916666666668, 19813.25)
  assert_eq(ticks, [
    19812.916666666668, 19812.958333333332, 19813.0, 19813.041666666668, 19813.041666666668,
    19813.083333333332, 19813.125, 19813.166666666668, 19813.208333333332, 19813.25,
  ])
  assert_eq(locator.tick_values(19813.25, 19812.916666666668), ticks.rev())
  assert_eq(
    locator.as_locator().tick_values(19812.916666666668, 19813.25),
    ticks,
  )
  assert_eq(selected.tick_values(19812.916666666668, 19813.25), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "2024-03-30 22:00:00 GMT +0000", "2024-03-30 23:00:00 GMT +0000", "2024-03-31 00:00:00 GMT +0000",
      "2024-03-31 02:00:00 IST +0100", "2024-03-31 02:00:00 IST +0100", "2024-03-31 03:00:00 IST +0100",
      "2024-03-31 04:00:00 IST +0100", "2024-03-31 05:00:00 IST +0100", "2024-03-31 06:00:00 IST +0100",
      "2024-03-31 07:00:00 IST +0100",
    ],
  )
}

///|
test "automatic wrapper original 45 NEG 2024-03-31T01:00:00 hours True" {
  let zone = @date.get_timezone(name="IST-1GMT0,M10.5.0/2,M3.5.0/1")
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=true,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(19812.916666666668, timezone=zone),
      ),
    ),
    [1, 2024, 3, 30, 22, 0, 0, 0, 0],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(19812.916666666668).with_timezone(zone),
      ),
    ),
    [1, 2024, 3, 30, 22, 0, 0, 0, 0],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(@date.num2date(19813.25, timezone=zone)),
    ),
    [1, 2024, 3, 31, 7, 0, 0, 0, 3600],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(19813.25).with_timezone(zone),
      ),
    ),
    [1, 2024, 3, 31, 7, 0, 0, 0, 3600],
  )
  let selected = locator.get_locator_for_range(19812.916666666668, 19813.25)
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Hour)
  assert_eq(selected.interval(), 1)
  assert_eq(selected.unit_scale(), 0.041666666666666664)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2024, 3, 30, 22, 0, 0, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2024, 3, 31, 7, 0, 0, 0, 0]),
  )
  let ticks = locator.tick_values(19812.916666666668, 19813.25)
  assert_eq(ticks, [
    19812.916666666668, 19812.958333333332, 19813.0, 19813.041666666668, 19813.041666666668,
    19813.083333333332, 19813.125, 19813.166666666668, 19813.208333333332, 19813.25,
  ])
  assert_eq(locator.tick_values(19813.25, 19812.916666666668), ticks.rev())
  assert_eq(
    locator.as_locator().tick_values(19812.916666666668, 19813.25),
    ticks,
  )
  assert_eq(selected.tick_values(19812.916666666668, 19813.25), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "2024-03-30 22:00:00 GMT +0000", "2024-03-30 23:00:00 GMT +0000", "2024-03-31 00:00:00 GMT +0000",
      "2024-03-31 02:00:00 IST +0100", "2024-03-31 02:00:00 IST +0100", "2024-03-31 03:00:00 IST +0100",
      "2024-03-31 04:00:00 IST +0100", "2024-03-31 05:00:00 IST +0100", "2024-03-31 06:00:00 IST +0100",
      "2024-03-31 07:00:00 IST +0100",
    ],
  )
}

///|
test "automatic wrapper original 46 NEG 2024-03-31T01:00:00 daily False" {
  let zone = @date.get_timezone(name="IST-1GMT0,M10.5.0/2,M3.5.0/1")
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=false,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(19806.041666666668, timezone=zone),
      ),
    ),
    [1, 2024, 3, 24, 1, 0, 0, 0, 0],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(19806.041666666668).with_timezone(zone),
      ),
    ),
    [1, 2024, 3, 24, 1, 0, 0, 0, 0],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(19820.041666666668, timezone=zone),
      ),
    ),
    [1, 2024, 4, 7, 2, 0, 0, 0, 3600],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(19820.041666666668).with_timezone(zone),
      ),
    ),
    [1, 2024, 4, 7, 2, 0, 0, 0, 3600],
  )
  let selected = locator.get_locator_for_range(
    19806.041666666668, 19820.041666666668,
  )
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Day)
  assert_eq(selected.interval(), 2)
  assert_eq(selected.unit_scale(), 1.0)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2024, 3, 24, 1, 0, 0, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2024, 4, 7, 2, 0, 0, 0, 0]),
  )
  let ticks = locator.tick_values(19806.041666666668, 19820.041666666668)
  assert_eq(ticks, [
    19808.0, 19810.0, 19812.0, 19813.958333333332, 19815.958333333332, 19817.958333333332,
    19819.958333333332,
  ])
  assert_eq(
    locator.tick_values(19820.041666666668, 19806.041666666668),
    ticks.rev(),
  )
  assert_eq(
    locator.as_locator().tick_values(19806.041666666668, 19820.041666666668),
    ticks,
  )
  assert_eq(selected.tick_values(19806.041666666668, 19820.041666666668), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "2024-03-26 00:00:00 GMT +0000", "2024-03-28 00:00:00 GMT +0000", "2024-03-30 00:00:00 GMT +0000",
      "2024-04-01 00:00:00 IST +0100", "2024-04-03 00:00:00 IST +0100", "2024-04-05 00:00:00 IST +0100",
      "2024-04-07 00:00:00 IST +0100",
    ],
  )
}

///|
test "automatic wrapper original 47 NEG 2024-03-31T01:00:00 daily True" {
  let zone = @date.get_timezone(name="IST-1GMT0,M10.5.0/2,M3.5.0/1")
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=true,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(19806.041666666668, timezone=zone),
      ),
    ),
    [1, 2024, 3, 24, 1, 0, 0, 0, 0],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(19806.041666666668).with_timezone(zone),
      ),
    ),
    [1, 2024, 3, 24, 1, 0, 0, 0, 0],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(19820.041666666668, timezone=zone),
      ),
    ),
    [1, 2024, 4, 7, 2, 0, 0, 0, 3600],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(19820.041666666668).with_timezone(zone),
      ),
    ),
    [1, 2024, 4, 7, 2, 0, 0, 0, 3600],
  )
  let selected = locator.get_locator_for_range(
    19806.041666666668, 19820.041666666668,
  )
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Day)
  assert_eq(selected.interval(), 1)
  assert_eq(selected.unit_scale(), 1.0)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2024, 3, 24, 1, 0, 0, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2024, 4, 7, 2, 0, 0, 0, 0]),
  )
  let ticks = locator.tick_values(19806.041666666668, 19820.041666666668)
  assert_eq(ticks, [
    19807.0, 19809.0, 19811.0, 19813.0, 19813.958333333332, 19815.958333333332, 19817.958333333332,
    19819.958333333332,
  ])
  assert_eq(
    locator.tick_values(19820.041666666668, 19806.041666666668),
    ticks.rev(),
  )
  assert_eq(
    locator.as_locator().tick_values(19806.041666666668, 19820.041666666668),
    ticks,
  )
  assert_eq(selected.tick_values(19806.041666666668, 19820.041666666668), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "2024-03-25 00:00:00 GMT +0000", "2024-03-27 00:00:00 GMT +0000", "2024-03-29 00:00:00 GMT +0000",
      "2024-03-31 00:00:00 GMT +0000", "2024-04-01 00:00:00 IST +0100", "2024-04-03 00:00:00 IST +0100",
      "2024-04-05 00:00:00 IST +0100", "2024-04-07 00:00:00 IST +0100",
    ],
  )
}

///|
test "automatic wrapper original 48 NEG 2024-03-31T01:00:00 monthly False" {
  let zone = @date.get_timezone(name="IST-1GMT0,M10.5.0/2,M3.5.0/1")
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=false,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(19773.041666666668, timezone=zone),
      ),
    ),
    [1, 2024, 2, 20, 1, 0, 0, 0, 0],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(19773.041666666668).with_timezone(zone),
      ),
    ),
    [1, 2024, 2, 20, 1, 0, 0, 0, 0],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(19853.041666666668, timezone=zone),
      ),
    ),
    [1, 2024, 5, 10, 2, 0, 0, 0, 3600],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(19853.041666666668).with_timezone(zone),
      ),
    ),
    [1, 2024, 5, 10, 2, 0, 0, 0, 3600],
  )
  let selected = locator.get_locator_for_range(
    19773.041666666668, 19853.041666666668,
  )
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Day)
  assert_eq(selected.interval(), 14)
  assert_eq(selected.unit_scale(), 1.0)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2024, 2, 20, 1, 0, 0, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2024, 5, 10, 2, 0, 0, 0, 0]),
  )
  let ticks = locator.tick_values(19773.041666666668, 19853.041666666668)
  assert_eq(ticks, [
    19775.0, 19789.0, 19803.0, 19816.958333333332, 19830.958333333332, 19844.958333333332,
  ])
  assert_eq(
    locator.tick_values(19853.041666666668, 19773.041666666668),
    ticks.rev(),
  )
  assert_eq(
    locator.as_locator().tick_values(19773.041666666668, 19853.041666666668),
    ticks,
  )
  assert_eq(selected.tick_values(19773.041666666668, 19853.041666666668), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "2024-02-22 00:00:00 GMT +0000", "2024-03-07 00:00:00 GMT +0000", "2024-03-21 00:00:00 GMT +0000",
      "2024-04-04 00:00:00 IST +0100", "2024-04-18 00:00:00 IST +0100", "2024-05-02 00:00:00 IST +0100",
    ],
  )
}

///|
test "automatic wrapper original 49 NEG 2024-03-31T01:00:00 monthly True" {
  let zone = @date.get_timezone(name="IST-1GMT0,M10.5.0/2,M3.5.0/1")
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=true,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(19773.041666666668, timezone=zone),
      ),
    ),
    [1, 2024, 2, 20, 1, 0, 0, 0, 0],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(19773.041666666668).with_timezone(zone),
      ),
    ),
    [1, 2024, 2, 20, 1, 0, 0, 0, 0],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(19853.041666666668, timezone=zone),
      ),
    ),
    [1, 2024, 5, 10, 2, 0, 0, 0, 3600],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(19853.041666666668).with_timezone(zone),
      ),
    ),
    [1, 2024, 5, 10, 2, 0, 0, 0, 3600],
  )
  let selected = locator.get_locator_for_range(
    19773.041666666668, 19853.041666666668,
  )
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Day)
  assert_eq(selected.interval(), 1)
  assert_eq(selected.unit_scale(), 1.0)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2024, 2, 20, 1, 0, 0, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2024, 5, 10, 2, 0, 0, 0, 0]),
  )
  let ticks = locator.tick_values(19773.041666666668, 19853.041666666668)
  assert_eq(ticks, [
    19783.0, 19797.0, 19813.958333333332, 19827.958333333332, 19843.958333333332,
  ])
  assert_eq(
    locator.tick_values(19853.041666666668, 19773.041666666668),
    ticks.rev(),
  )
  assert_eq(
    locator.as_locator().tick_values(19773.041666666668, 19853.041666666668),
    ticks,
  )
  assert_eq(selected.tick_values(19773.041666666668, 19853.041666666668), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "2024-03-01 00:00:00 GMT +0000", "2024-03-15 00:00:00 GMT +0000", "2024-04-01 00:00:00 IST +0100",
      "2024-04-15 00:00:00 IST +0100", "2024-05-01 00:00:00 IST +0100",
    ],
  )
}

///|
test "automatic wrapper original 50 NEG 2024-10-27T01:00:00 seconds False" {
  let zone = @date.get_timezone(name="IST-1GMT0,M10.5.0/2,M3.5.0/1")
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=false,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(20023.041608796295, timezone=zone),
      ),
    ),
    [1, 2024, 10, 27, 1, 59, 55, 0, 3600],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(20023.041608796295).with_timezone(zone),
      ),
    ),
    [1, 2024, 10, 27, 1, 59, 55, 0, 3600],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(20023.041724537037, timezone=zone),
      ),
    ),
    [1, 2024, 10, 27, 1, 0, 5, 0, 3600],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(20023.041724537037).with_timezone(zone),
      ),
    ),
    [1, 2024, 10, 27, 1, 0, 5, 0, 3600],
  )
  let selected = locator.get_locator_for_range(
    20023.041608796295, 20023.041724537037,
  )
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Minute)
  assert_eq(selected.interval(), 10)
  assert_eq(selected.unit_scale(), 0.0006944444444444445)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2024, 10, 27, 1, 59, 55, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2024, 10, 27, 1, 0, 5, 0, 0]),
  )
  let ticks = locator.tick_values(20023.041608796295, 20023.041724537037)
  assert_eq(ticks, [20023.041608796295, 20023.00005787037])
  assert_eq(
    locator.tick_values(20023.041724537037, 20023.041608796295),
    ticks.rev(),
  )
  assert_eq(
    locator.as_locator().tick_values(20023.041608796295, 20023.041724537037),
    ticks,
  )
  assert_eq(selected.tick_values(20023.041608796295, 20023.041724537037), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    ["2024-10-27 01:59:55 IST +0100", "2024-10-27 01:00:05 IST +0100"],
  )
}

///|
test "automatic wrapper original 51 NEG 2024-10-27T01:00:00 seconds True" {
  let zone = @date.get_timezone(name="IST-1GMT0,M10.5.0/2,M3.5.0/1")
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=true,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(20023.041608796295, timezone=zone),
      ),
    ),
    [1, 2024, 10, 27, 1, 59, 55, 0, 3600],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(20023.041608796295).with_timezone(zone),
      ),
    ),
    [1, 2024, 10, 27, 1, 59, 55, 0, 3600],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(20023.041724537037, timezone=zone),
      ),
    ),
    [1, 2024, 10, 27, 1, 0, 5, 0, 3600],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(20023.041724537037).with_timezone(zone),
      ),
    ),
    [1, 2024, 10, 27, 1, 0, 5, 0, 3600],
  )
  let selected = locator.get_locator_for_range(
    20023.041608796295, 20023.041724537037,
  )
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Minute)
  assert_eq(selected.interval(), 1)
  assert_eq(selected.unit_scale(), 0.0006944444444444445)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2024, 10, 27, 1, 59, 55, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2024, 10, 27, 1, 0, 5, 0, 0]),
  )
  let ticks = locator.tick_values(20023.041608796295, 20023.041724537037)
  assert_eq(ticks, [20023.041608796295, 20023.00005787037])
  assert_eq(
    locator.tick_values(20023.041724537037, 20023.041608796295),
    ticks.rev(),
  )
  assert_eq(
    locator.as_locator().tick_values(20023.041608796295, 20023.041724537037),
    ticks,
  )
  assert_eq(selected.tick_values(20023.041608796295, 20023.041724537037), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    ["2024-10-27 01:59:55 IST +0100", "2024-10-27 01:00:05 IST +0100"],
  )
}

///|
test "automatic wrapper original 52 NEG 2024-10-27T01:00:00 minutes False" {
  let zone = @date.get_timezone(name="IST-1GMT0,M10.5.0/2,M3.5.0/1")
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=false,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(20023.010416666668, timezone=zone),
      ),
    ),
    [1, 2024, 10, 27, 1, 15, 0, 0, 3600],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(20023.010416666668).with_timezone(zone),
      ),
    ),
    [1, 2024, 10, 27, 1, 15, 0, 0, 3600],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(@date.num2date(20023.09375, timezone=zone)),
    ),
    [1, 2024, 10, 27, 2, 15, 0, 0, 0],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(20023.09375).with_timezone(zone),
      ),
    ),
    [1, 2024, 10, 27, 2, 15, 0, 0, 0],
  )
  let selected = locator.get_locator_for_range(20023.010416666668, 20023.09375)
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Minute)
  assert_eq(selected.interval(), 10)
  assert_eq(selected.unit_scale(), 0.0006944444444444445)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2024, 10, 27, 1, 15, 0, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2024, 10, 27, 2, 15, 0, 0, 0]),
  )
  let ticks = locator.tick_values(20023.010416666668, 20023.09375)
  assert_eq(ticks, [
    20023.010416666668, 20023.01736111111, 20023.024305555555, 20023.03125, 20023.038194444445,
    20023.086805555555, 20023.09375,
  ])
  assert_eq(locator.tick_values(20023.09375, 20023.010416666668), ticks.rev())
  assert_eq(
    locator.as_locator().tick_values(20023.010416666668, 20023.09375),
    ticks,
  )
  assert_eq(selected.tick_values(20023.010416666668, 20023.09375), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "2024-10-27 01:15:00 IST +0100", "2024-10-27 01:25:00 IST +0100", "2024-10-27 01:35:00 IST +0100",
      "2024-10-27 01:45:00 IST +0100", "2024-10-27 01:55:00 IST +0100", "2024-10-27 02:05:00 GMT +0000",
      "2024-10-27 02:15:00 GMT +0000",
    ],
  )
}

///|
test "automatic wrapper original 53 NEG 2024-10-27T01:00:00 minutes True" {
  let zone = @date.get_timezone(name="IST-1GMT0,M10.5.0/2,M3.5.0/1")
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=true,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(20023.010416666668, timezone=zone),
      ),
    ),
    [1, 2024, 10, 27, 1, 15, 0, 0, 3600],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(20023.010416666668).with_timezone(zone),
      ),
    ),
    [1, 2024, 10, 27, 1, 15, 0, 0, 3600],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(@date.num2date(20023.09375, timezone=zone)),
    ),
    [1, 2024, 10, 27, 2, 15, 0, 0, 0],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(20023.09375).with_timezone(zone),
      ),
    ),
    [1, 2024, 10, 27, 2, 15, 0, 0, 0],
  )
  let selected = locator.get_locator_for_range(20023.010416666668, 20023.09375)
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Minute)
  assert_eq(selected.interval(), 1)
  assert_eq(selected.unit_scale(), 0.0006944444444444445)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2024, 10, 27, 1, 15, 0, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2024, 10, 27, 2, 15, 0, 0, 0]),
  )
  let ticks = locator.tick_values(20023.010416666668, 20023.09375)
  assert_eq(ticks, [
    20023.01388888889, 20023.020833333332, 20023.027777777777, 20023.034722222223,
    20023.083333333332, 20023.090277777777,
  ])
  assert_eq(locator.tick_values(20023.09375, 20023.010416666668), ticks.rev())
  assert_eq(
    locator.as_locator().tick_values(20023.010416666668, 20023.09375),
    ticks,
  )
  assert_eq(selected.tick_values(20023.010416666668, 20023.09375), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "2024-10-27 01:20:00 IST +0100", "2024-10-27 01:30:00 IST +0100", "2024-10-27 01:40:00 IST +0100",
      "2024-10-27 01:50:00 IST +0100", "2024-10-27 02:00:00 GMT +0000", "2024-10-27 02:10:00 GMT +0000",
    ],
  )
}

///|
test "automatic wrapper original 54 NEG 2024-10-27T01:00:00 hours False" {
  let zone = @date.get_timezone(name="IST-1GMT0,M10.5.0/2,M3.5.0/1")
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=false,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(20022.916666666668, timezone=zone),
      ),
    ),
    [1, 2024, 10, 26, 23, 0, 0, 0, 3600],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(20022.916666666668).with_timezone(zone),
      ),
    ),
    [1, 2024, 10, 26, 23, 0, 0, 0, 3600],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(@date.num2date(20023.25, timezone=zone)),
    ),
    [1, 2024, 10, 27, 6, 0, 0, 0, 0],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(20023.25).with_timezone(zone),
      ),
    ),
    [1, 2024, 10, 27, 6, 0, 0, 0, 0],
  )
  let selected = locator.get_locator_for_range(20022.916666666668, 20023.25)
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Hour)
  assert_eq(selected.interval(), 1)
  assert_eq(selected.unit_scale(), 0.041666666666666664)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2024, 10, 26, 23, 0, 0, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2024, 10, 27, 6, 0, 0, 0, 0]),
  )
  let ticks = locator.tick_values(20022.916666666668, 20023.25)
  assert_eq(ticks, [
    20022.916666666668, 20022.958333333332, 20023.0, 20023.083333333332, 20023.125,
    20023.166666666668, 20023.208333333332, 20023.25,
  ])
  assert_eq(locator.tick_values(20023.25, 20022.916666666668), ticks.rev())
  assert_eq(
    locator.as_locator().tick_values(20022.916666666668, 20023.25),
    ticks,
  )
  assert_eq(selected.tick_values(20022.916666666668, 20023.25), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "2024-10-26 23:00:00 IST +0100", "2024-10-27 00:00:00 IST +0100", "2024-10-27 01:00:00 IST +0100",
      "2024-10-27 02:00:00 GMT +0000", "2024-10-27 03:00:00 GMT +0000", "2024-10-27 04:00:00 GMT +0000",
      "2024-10-27 05:00:00 GMT +0000", "2024-10-27 06:00:00 GMT +0000",
    ],
  )
}

///|
test "automatic wrapper original 55 NEG 2024-10-27T01:00:00 hours True" {
  let zone = @date.get_timezone(name="IST-1GMT0,M10.5.0/2,M3.5.0/1")
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=true,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(20022.916666666668, timezone=zone),
      ),
    ),
    [1, 2024, 10, 26, 23, 0, 0, 0, 3600],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(20022.916666666668).with_timezone(zone),
      ),
    ),
    [1, 2024, 10, 26, 23, 0, 0, 0, 3600],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(@date.num2date(20023.25, timezone=zone)),
    ),
    [1, 2024, 10, 27, 6, 0, 0, 0, 0],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(20023.25).with_timezone(zone),
      ),
    ),
    [1, 2024, 10, 27, 6, 0, 0, 0, 0],
  )
  let selected = locator.get_locator_for_range(20022.916666666668, 20023.25)
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Hour)
  assert_eq(selected.interval(), 1)
  assert_eq(selected.unit_scale(), 0.041666666666666664)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2024, 10, 26, 23, 0, 0, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2024, 10, 27, 6, 0, 0, 0, 0]),
  )
  let ticks = locator.tick_values(20022.916666666668, 20023.25)
  assert_eq(ticks, [
    20022.916666666668, 20022.958333333332, 20023.0, 20023.083333333332, 20023.125,
    20023.166666666668, 20023.208333333332, 20023.25,
  ])
  assert_eq(locator.tick_values(20023.25, 20022.916666666668), ticks.rev())
  assert_eq(
    locator.as_locator().tick_values(20022.916666666668, 20023.25),
    ticks,
  )
  assert_eq(selected.tick_values(20022.916666666668, 20023.25), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "2024-10-26 23:00:00 IST +0100", "2024-10-27 00:00:00 IST +0100", "2024-10-27 01:00:00 IST +0100",
      "2024-10-27 02:00:00 GMT +0000", "2024-10-27 03:00:00 GMT +0000", "2024-10-27 04:00:00 GMT +0000",
      "2024-10-27 05:00:00 GMT +0000", "2024-10-27 06:00:00 GMT +0000",
    ],
  )
}

///|
test "automatic wrapper original 56 NEG 2024-10-27T01:00:00 daily False" {
  let zone = @date.get_timezone(name="IST-1GMT0,M10.5.0/2,M3.5.0/1")
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=false,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(20016.041666666668, timezone=zone),
      ),
    ),
    [1, 2024, 10, 20, 2, 0, 0, 0, 3600],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(20016.041666666668).with_timezone(zone),
      ),
    ),
    [1, 2024, 10, 20, 2, 0, 0, 0, 3600],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(20030.041666666668, timezone=zone),
      ),
    ),
    [1, 2024, 11, 3, 1, 0, 0, 0, 0],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(20030.041666666668).with_timezone(zone),
      ),
    ),
    [1, 2024, 11, 3, 1, 0, 0, 0, 0],
  )
  let selected = locator.get_locator_for_range(
    20016.041666666668, 20030.041666666668,
  )
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Day)
  assert_eq(selected.interval(), 2)
  assert_eq(selected.unit_scale(), 1.0)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2024, 10, 20, 2, 0, 0, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2024, 11, 3, 1, 0, 0, 0, 0]),
  )
  let ticks = locator.tick_values(20016.041666666668, 20030.041666666668)
  assert_eq(ticks, [
    20017.958333333332, 20019.958333333332, 20021.958333333332, 20024.0, 20026.0,
    20028.0, 20030.0,
  ])
  assert_eq(
    locator.tick_values(20030.041666666668, 20016.041666666668),
    ticks.rev(),
  )
  assert_eq(
    locator.as_locator().tick_values(20016.041666666668, 20030.041666666668),
    ticks,
  )
  assert_eq(selected.tick_values(20016.041666666668, 20030.041666666668), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "2024-10-22 00:00:00 IST +0100", "2024-10-24 00:00:00 IST +0100", "2024-10-26 00:00:00 IST +0100",
      "2024-10-28 00:00:00 GMT +0000", "2024-10-30 00:00:00 GMT +0000", "2024-11-01 00:00:00 GMT +0000",
      "2024-11-03 00:00:00 GMT +0000",
    ],
  )
}

///|
test "automatic wrapper original 57 NEG 2024-10-27T01:00:00 daily True" {
  let zone = @date.get_timezone(name="IST-1GMT0,M10.5.0/2,M3.5.0/1")
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=true,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(20016.041666666668, timezone=zone),
      ),
    ),
    [1, 2024, 10, 20, 2, 0, 0, 0, 3600],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(20016.041666666668).with_timezone(zone),
      ),
    ),
    [1, 2024, 10, 20, 2, 0, 0, 0, 3600],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(20030.041666666668, timezone=zone),
      ),
    ),
    [1, 2024, 11, 3, 1, 0, 0, 0, 0],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(20030.041666666668).with_timezone(zone),
      ),
    ),
    [1, 2024, 11, 3, 1, 0, 0, 0, 0],
  )
  let selected = locator.get_locator_for_range(
    20016.041666666668, 20030.041666666668,
  )
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Day)
  assert_eq(selected.interval(), 1)
  assert_eq(selected.unit_scale(), 1.0)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2024, 10, 20, 2, 0, 0, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2024, 11, 3, 1, 0, 0, 0, 0]),
  )
  let ticks = locator.tick_values(20016.041666666668, 20030.041666666668)
  assert_eq(ticks, [
    20016.958333333332, 20018.958333333332, 20020.958333333332, 20022.958333333332,
    20025.0, 20027.0, 20028.0, 20030.0,
  ])
  assert_eq(
    locator.tick_values(20030.041666666668, 20016.041666666668),
    ticks.rev(),
  )
  assert_eq(
    locator.as_locator().tick_values(20016.041666666668, 20030.041666666668),
    ticks,
  )
  assert_eq(selected.tick_values(20016.041666666668, 20030.041666666668), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "2024-10-21 00:00:00 IST +0100", "2024-10-23 00:00:00 IST +0100", "2024-10-25 00:00:00 IST +0100",
      "2024-10-27 00:00:00 IST +0100", "2024-10-29 00:00:00 GMT +0000", "2024-10-31 00:00:00 GMT +0000",
      "2024-11-01 00:00:00 GMT +0000", "2024-11-03 00:00:00 GMT +0000",
    ],
  )
}

///|
test "automatic wrapper original 58 NEG 2024-10-27T01:00:00 monthly False" {
  let zone = @date.get_timezone(name="IST-1GMT0,M10.5.0/2,M3.5.0/1")
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=false,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(19983.041666666668, timezone=zone),
      ),
    ),
    [1, 2024, 9, 17, 2, 0, 0, 0, 3600],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(19983.041666666668).with_timezone(zone),
      ),
    ),
    [1, 2024, 9, 17, 2, 0, 0, 0, 3600],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(20063.041666666668, timezone=zone),
      ),
    ),
    [1, 2024, 12, 6, 1, 0, 0, 0, 0],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(20063.041666666668).with_timezone(zone),
      ),
    ),
    [1, 2024, 12, 6, 1, 0, 0, 0, 0],
  )
  let selected = locator.get_locator_for_range(
    19983.041666666668, 20063.041666666668,
  )
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Day)
  assert_eq(selected.interval(), 14)
  assert_eq(selected.unit_scale(), 1.0)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2024, 9, 17, 2, 0, 0, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2024, 12, 6, 1, 0, 0, 0, 0]),
  )
  let ticks = locator.tick_values(19983.041666666668, 20063.041666666668)
  assert_eq(ticks, [
    19985.958333333332, 19999.958333333332, 20013.958333333332, 20028.0, 20042.0,
    20056.0,
  ])
  assert_eq(
    locator.tick_values(20063.041666666668, 19983.041666666668),
    ticks.rev(),
  )
  assert_eq(
    locator.as_locator().tick_values(19983.041666666668, 20063.041666666668),
    ticks,
  )
  assert_eq(selected.tick_values(19983.041666666668, 20063.041666666668), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "2024-09-20 00:00:00 IST +0100", "2024-10-04 00:00:00 IST +0100", "2024-10-18 00:00:00 IST +0100",
      "2024-11-01 00:00:00 GMT +0000", "2024-11-15 00:00:00 GMT +0000", "2024-11-29 00:00:00 GMT +0000",
    ],
  )
}

///|
test "automatic wrapper original 59 NEG 2024-10-27T01:00:00 monthly True" {
  let zone = @date.get_timezone(name="IST-1GMT0,M10.5.0/2,M3.5.0/1")
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=true,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(19983.041666666668, timezone=zone),
      ),
    ),
    [1, 2024, 9, 17, 2, 0, 0, 0, 3600],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(19983.041666666668).with_timezone(zone),
      ),
    ),
    [1, 2024, 9, 17, 2, 0, 0, 0, 3600],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(20063.041666666668, timezone=zone),
      ),
    ),
    [1, 2024, 12, 6, 1, 0, 0, 0, 0],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(20063.041666666668).with_timezone(zone),
      ),
    ),
    [1, 2024, 12, 6, 1, 0, 0, 0, 0],
  )
  let selected = locator.get_locator_for_range(
    19983.041666666668, 20063.041666666668,
  )
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Day)
  assert_eq(selected.interval(), 1)
  assert_eq(selected.unit_scale(), 1.0)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2024, 9, 17, 2, 0, 0, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2024, 12, 6, 1, 0, 0, 0, 0]),
  )
  let ticks = locator.tick_values(19983.041666666668, 20063.041666666668)
  assert_eq(ticks, [
    19996.958333333332, 20010.958333333332, 20028.0, 20042.0, 20058.0,
  ])
  assert_eq(
    locator.tick_values(20063.041666666668, 19983.041666666668),
    ticks.rev(),
  )
  assert_eq(
    locator.as_locator().tick_values(19983.041666666668, 20063.041666666668),
    ticks,
  )
  assert_eq(selected.tick_values(19983.041666666668, 20063.041666666668), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "2024-10-01 00:00:00 IST +0100", "2024-10-15 00:00:00 IST +0100", "2024-11-01 00:00:00 GMT +0000",
      "2024-11-15 00:00:00 GMT +0000", "2024-12-01 00:00:00 GMT +0000",
    ],
  )
}

///|
test "automatic wrapper original 60 FUTURE 2400-11-05T06:00:00 seconds False" {
  let zone = @date.tzif_timezone(tzif_new_york)
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=false,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(157363.24994212962, timezone=zone),
      ),
    ),
    [1, 2400, 11, 5, 1, 59, 55, 0, -14400],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(157363.24994212962).with_timezone(zone),
      ),
    ),
    [1, 2400, 11, 5, 1, 59, 55, 0, -14400],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(157363.25005787038, timezone=zone),
      ),
    ),
    [1, 2400, 11, 5, 1, 0, 5, 0, -18000],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(157363.25005787038).with_timezone(zone),
      ),
    ),
    [1, 2400, 11, 5, 1, 0, 5, 0, -18000],
  )
  let selected = locator.get_locator_for_range(
    157363.24994212962, 157363.25005787038,
  )
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Minute)
  assert_eq(selected.interval(), 10)
  assert_eq(selected.unit_scale(), 0.0006944444444444445)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2400, 11, 5, 1, 59, 55, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2400, 11, 5, 1, 0, 5, 0, 0]),
  )
  let ticks = locator.tick_values(157363.24994212962, 157363.25005787038)
  assert_eq(ticks, [157363.24994212962, 157363.25005787038])
  assert_eq(
    locator.tick_values(157363.25005787038, 157363.24994212962),
    ticks.rev(),
  )
  assert_eq(
    locator.as_locator().tick_values(157363.24994212962, 157363.25005787038),
    ticks,
  )
  assert_eq(selected.tick_values(157363.24994212962, 157363.25005787038), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    ["2400-11-05 01:59:55 EDT -0400", "2400-11-05 01:00:05 EST -0500"],
  )
}

///|
test "automatic wrapper original 61 FUTURE 2400-11-05T06:00:00 seconds True" {
  let zone = @date.tzif_timezone(tzif_new_york)
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=true,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(157363.24994212962, timezone=zone),
      ),
    ),
    [1, 2400, 11, 5, 1, 59, 55, 0, -14400],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(157363.24994212962).with_timezone(zone),
      ),
    ),
    [1, 2400, 11, 5, 1, 59, 55, 0, -14400],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(157363.25005787038, timezone=zone),
      ),
    ),
    [1, 2400, 11, 5, 1, 0, 5, 0, -18000],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(157363.25005787038).with_timezone(zone),
      ),
    ),
    [1, 2400, 11, 5, 1, 0, 5, 0, -18000],
  )
  let selected = locator.get_locator_for_range(
    157363.24994212962, 157363.25005787038,
  )
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Minute)
  assert_eq(selected.interval(), 1)
  assert_eq(selected.unit_scale(), 0.0006944444444444445)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2400, 11, 5, 1, 59, 55, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2400, 11, 5, 1, 0, 5, 0, 0]),
  )
  let ticks = locator.tick_values(157363.24994212962, 157363.25005787038)
  assert_eq(ticks, [157363.24994212962, 157363.25005787038])
  assert_eq(
    locator.tick_values(157363.25005787038, 157363.24994212962),
    ticks.rev(),
  )
  assert_eq(
    locator.as_locator().tick_values(157363.24994212962, 157363.25005787038),
    ticks,
  )
  assert_eq(selected.tick_values(157363.24994212962, 157363.25005787038), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    ["2400-11-05 01:59:55 EDT -0400", "2400-11-05 01:00:05 EST -0500"],
  )
}

///|
test "automatic wrapper original 62 FUTURE 2400-11-05T06:00:00 minutes False" {
  let zone = @date.tzif_timezone(tzif_new_york)
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=false,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(@date.num2date(157363.21875, timezone=zone)),
    ),
    [1, 2400, 11, 5, 1, 15, 0, 0, -14400],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(157363.21875).with_timezone(zone),
      ),
    ),
    [1, 2400, 11, 5, 1, 15, 0, 0, -14400],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(157363.30208333334, timezone=zone),
      ),
    ),
    [1, 2400, 11, 5, 2, 15, 0, 0, -18000],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(157363.30208333334).with_timezone(zone),
      ),
    ),
    [1, 2400, 11, 5, 2, 15, 0, 0, -18000],
  )
  let selected = locator.get_locator_for_range(157363.21875, 157363.30208333334)
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Minute)
  assert_eq(selected.interval(), 10)
  assert_eq(selected.unit_scale(), 0.0006944444444444445)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2400, 11, 5, 1, 15, 0, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2400, 11, 5, 2, 15, 0, 0, 0]),
  )
  let ticks = locator.tick_values(157363.21875, 157363.30208333334)
  assert_eq(ticks, [
    157363.21875, 157363.22569444444, 157363.23263888888, 157363.23958333334, 157363.24652777778,
    157363.29513888888, 157363.30208333334,
  ])
  assert_eq(locator.tick_values(157363.30208333334, 157363.21875), ticks.rev())
  assert_eq(
    locator.as_locator().tick_values(157363.21875, 157363.30208333334),
    ticks,
  )
  assert_eq(selected.tick_values(157363.21875, 157363.30208333334), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "2400-11-05 01:15:00 EDT -0400", "2400-11-05 01:25:00 EDT -0400", "2400-11-05 01:35:00 EDT -0400",
      "2400-11-05 01:45:00 EDT -0400", "2400-11-05 01:55:00 EDT -0400", "2400-11-05 02:05:00 EST -0500",
      "2400-11-05 02:15:00 EST -0500",
    ],
  )
}

///|
test "automatic wrapper original 63 FUTURE 2400-11-05T06:00:00 minutes True" {
  let zone = @date.tzif_timezone(tzif_new_york)
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=true,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(@date.num2date(157363.21875, timezone=zone)),
    ),
    [1, 2400, 11, 5, 1, 15, 0, 0, -14400],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(157363.21875).with_timezone(zone),
      ),
    ),
    [1, 2400, 11, 5, 1, 15, 0, 0, -14400],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(157363.30208333334, timezone=zone),
      ),
    ),
    [1, 2400, 11, 5, 2, 15, 0, 0, -18000],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(157363.30208333334).with_timezone(zone),
      ),
    ),
    [1, 2400, 11, 5, 2, 15, 0, 0, -18000],
  )
  let selected = locator.get_locator_for_range(157363.21875, 157363.30208333334)
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Minute)
  assert_eq(selected.interval(), 1)
  assert_eq(selected.unit_scale(), 0.0006944444444444445)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2400, 11, 5, 1, 15, 0, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2400, 11, 5, 2, 15, 0, 0, 0]),
  )
  let ticks = locator.tick_values(157363.21875, 157363.30208333334)
  assert_eq(ticks, [
    157363.22222222222, 157363.22916666666, 157363.23611111112, 157363.24305555556,
    157363.29166666666, 157363.29861111112,
  ])
  assert_eq(locator.tick_values(157363.30208333334, 157363.21875), ticks.rev())
  assert_eq(
    locator.as_locator().tick_values(157363.21875, 157363.30208333334),
    ticks,
  )
  assert_eq(selected.tick_values(157363.21875, 157363.30208333334), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "2400-11-05 01:20:00 EDT -0400", "2400-11-05 01:30:00 EDT -0400", "2400-11-05 01:40:00 EDT -0400",
      "2400-11-05 01:50:00 EDT -0400", "2400-11-05 02:00:00 EST -0500", "2400-11-05 02:10:00 EST -0500",
    ],
  )
}

///|
test "automatic wrapper original 64 FUTURE 2400-11-05T06:00:00 hours False" {
  let zone = @date.tzif_timezone(tzif_new_york)
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=false,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(@date.num2date(157363.125, timezone=zone)),
    ),
    [1, 2400, 11, 4, 23, 0, 0, 0, -14400],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(157363.125).with_timezone(zone),
      ),
    ),
    [1, 2400, 11, 4, 23, 0, 0, 0, -14400],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(157363.45833333334, timezone=zone),
      ),
    ),
    [1, 2400, 11, 5, 6, 0, 0, 0, -18000],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(157363.45833333334).with_timezone(zone),
      ),
    ),
    [1, 2400, 11, 5, 6, 0, 0, 0, -18000],
  )
  let selected = locator.get_locator_for_range(157363.125, 157363.45833333334)
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Hour)
  assert_eq(selected.interval(), 1)
  assert_eq(selected.unit_scale(), 0.041666666666666664)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2400, 11, 4, 23, 0, 0, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2400, 11, 5, 6, 0, 0, 0, 0]),
  )
  let ticks = locator.tick_values(157363.125, 157363.45833333334)
  assert_eq(ticks, [
    157363.125, 157363.16666666666, 157363.20833333334, 157363.29166666666, 157363.33333333334,
    157363.375, 157363.41666666666, 157363.45833333334,
  ])
  assert_eq(locator.tick_values(157363.45833333334, 157363.125), ticks.rev())
  assert_eq(
    locator.as_locator().tick_values(157363.125, 157363.45833333334),
    ticks,
  )
  assert_eq(selected.tick_values(157363.125, 157363.45833333334), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "2400-11-04 23:00:00 EDT -0400", "2400-11-05 00:00:00 EDT -0400", "2400-11-05 01:00:00 EDT -0400",
      "2400-11-05 02:00:00 EST -0500", "2400-11-05 03:00:00 EST -0500", "2400-11-05 04:00:00 EST -0500",
      "2400-11-05 05:00:00 EST -0500", "2400-11-05 06:00:00 EST -0500",
    ],
  )
}

///|
test "automatic wrapper original 65 FUTURE 2400-11-05T06:00:00 hours True" {
  let zone = @date.tzif_timezone(tzif_new_york)
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=true,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(@date.num2date(157363.125, timezone=zone)),
    ),
    [1, 2400, 11, 4, 23, 0, 0, 0, -14400],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(157363.125).with_timezone(zone),
      ),
    ),
    [1, 2400, 11, 4, 23, 0, 0, 0, -14400],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(157363.45833333334, timezone=zone),
      ),
    ),
    [1, 2400, 11, 5, 6, 0, 0, 0, -18000],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(157363.45833333334).with_timezone(zone),
      ),
    ),
    [1, 2400, 11, 5, 6, 0, 0, 0, -18000],
  )
  let selected = locator.get_locator_for_range(157363.125, 157363.45833333334)
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Hour)
  assert_eq(selected.interval(), 1)
  assert_eq(selected.unit_scale(), 0.041666666666666664)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2400, 11, 4, 23, 0, 0, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2400, 11, 5, 6, 0, 0, 0, 0]),
  )
  let ticks = locator.tick_values(157363.125, 157363.45833333334)
  assert_eq(ticks, [
    157363.125, 157363.16666666666, 157363.20833333334, 157363.29166666666, 157363.33333333334,
    157363.375, 157363.41666666666, 157363.45833333334,
  ])
  assert_eq(locator.tick_values(157363.45833333334, 157363.125), ticks.rev())
  assert_eq(
    locator.as_locator().tick_values(157363.125, 157363.45833333334),
    ticks,
  )
  assert_eq(selected.tick_values(157363.125, 157363.45833333334), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "2400-11-04 23:00:00 EDT -0400", "2400-11-05 00:00:00 EDT -0400", "2400-11-05 01:00:00 EDT -0400",
      "2400-11-05 02:00:00 EST -0500", "2400-11-05 03:00:00 EST -0500", "2400-11-05 04:00:00 EST -0500",
      "2400-11-05 05:00:00 EST -0500", "2400-11-05 06:00:00 EST -0500",
    ],
  )
}

///|
test "automatic wrapper original 66 FUTURE 2400-11-05T06:00:00 daily False" {
  let zone = @date.tzif_timezone(tzif_new_york)
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=false,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(@date.num2date(157356.25, timezone=zone)),
    ),
    [1, 2400, 10, 29, 2, 0, 0, 0, -14400],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(157356.25).with_timezone(zone),
      ),
    ),
    [1, 2400, 10, 29, 2, 0, 0, 0, -14400],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(@date.num2date(157370.25, timezone=zone)),
    ),
    [1, 2400, 11, 12, 1, 0, 0, 0, -18000],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(157370.25).with_timezone(zone),
      ),
    ),
    [1, 2400, 11, 12, 1, 0, 0, 0, -18000],
  )
  let selected = locator.get_locator_for_range(157356.25, 157370.25)
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Day)
  assert_eq(selected.interval(), 2)
  assert_eq(selected.unit_scale(), 1.0)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2400, 10, 29, 2, 0, 0, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2400, 11, 12, 1, 0, 0, 0, 0]),
  )
  let ticks = locator.tick_values(157356.25, 157370.25)
  assert_eq(ticks, [
    157358.16666666666, 157360.16666666666, 157362.16666666666, 157364.20833333334,
    157366.20833333334, 157368.20833333334, 157370.20833333334,
  ])
  assert_eq(locator.tick_values(157370.25, 157356.25), ticks.rev())
  assert_eq(locator.as_locator().tick_values(157356.25, 157370.25), ticks)
  assert_eq(selected.tick_values(157356.25, 157370.25), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "2400-10-31 00:00:00 EDT -0400", "2400-11-02 00:00:00 EDT -0400", "2400-11-04 00:00:00 EDT -0400",
      "2400-11-06 00:00:00 EST -0500", "2400-11-08 00:00:00 EST -0500", "2400-11-10 00:00:00 EST -0500",
      "2400-11-12 00:00:00 EST -0500",
    ],
  )
}

///|
test "automatic wrapper original 67 FUTURE 2400-11-05T06:00:00 daily True" {
  let zone = @date.tzif_timezone(tzif_new_york)
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=true,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(@date.num2date(157356.25, timezone=zone)),
    ),
    [1, 2400, 10, 29, 2, 0, 0, 0, -14400],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(157356.25).with_timezone(zone),
      ),
    ),
    [1, 2400, 10, 29, 2, 0, 0, 0, -14400],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(@date.num2date(157370.25, timezone=zone)),
    ),
    [1, 2400, 11, 12, 1, 0, 0, 0, -18000],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(157370.25).with_timezone(zone),
      ),
    ),
    [1, 2400, 11, 12, 1, 0, 0, 0, -18000],
  )
  let selected = locator.get_locator_for_range(157356.25, 157370.25)
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Day)
  assert_eq(selected.interval(), 1)
  assert_eq(selected.unit_scale(), 1.0)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2400, 10, 29, 2, 0, 0, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2400, 11, 12, 1, 0, 0, 0, 0]),
  )
  let ticks = locator.tick_values(157356.25, 157370.25)
  assert_eq(ticks, [
    157358.16666666666, 157359.16666666666, 157361.16666666666, 157363.16666666666,
    157365.20833333334, 157367.20833333334, 157369.20833333334,
  ])
  assert_eq(locator.tick_values(157370.25, 157356.25), ticks.rev())
  assert_eq(locator.as_locator().tick_values(157356.25, 157370.25), ticks)
  assert_eq(selected.tick_values(157356.25, 157370.25), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "2400-10-31 00:00:00 EDT -0400", "2400-11-01 00:00:00 EDT -0400", "2400-11-03 00:00:00 EDT -0400",
      "2400-11-05 00:00:00 EDT -0400", "2400-11-07 00:00:00 EST -0500", "2400-11-09 00:00:00 EST -0500",
      "2400-11-11 00:00:00 EST -0500",
    ],
  )
}

///|
test "automatic wrapper original 68 FUTURE 2400-11-05T06:00:00 monthly False" {
  let zone = @date.tzif_timezone(tzif_new_york)
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=false,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(@date.num2date(157323.25, timezone=zone)),
    ),
    [1, 2400, 9, 26, 2, 0, 0, 0, -14400],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(157323.25).with_timezone(zone),
      ),
    ),
    [1, 2400, 9, 26, 2, 0, 0, 0, -14400],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(@date.num2date(157403.25, timezone=zone)),
    ),
    [1, 2400, 12, 15, 1, 0, 0, 0, -18000],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(157403.25).with_timezone(zone),
      ),
    ),
    [1, 2400, 12, 15, 1, 0, 0, 0, -18000],
  )
  let selected = locator.get_locator_for_range(157323.25, 157403.25)
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Day)
  assert_eq(selected.interval(), 14)
  assert_eq(selected.unit_scale(), 1.0)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2400, 9, 26, 2, 0, 0, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2400, 12, 15, 1, 0, 0, 0, 0]),
  )
  let ticks = locator.tick_values(157323.25, 157403.25)
  assert_eq(ticks, [
    157326.16666666666, 157340.16666666666, 157354.16666666666, 157368.20833333334,
    157382.20833333334, 157396.20833333334,
  ])
  assert_eq(locator.tick_values(157403.25, 157323.25), ticks.rev())
  assert_eq(locator.as_locator().tick_values(157323.25, 157403.25), ticks)
  assert_eq(selected.tick_values(157323.25, 157403.25), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "2400-09-29 00:00:00 EDT -0400", "2400-10-13 00:00:00 EDT -0400", "2400-10-27 00:00:00 EDT -0400",
      "2400-11-10 00:00:00 EST -0500", "2400-11-24 00:00:00 EST -0500", "2400-12-08 00:00:00 EST -0500",
    ],
  )
}

///|
test "automatic wrapper original 69 FUTURE 2400-11-05T06:00:00 monthly True" {
  let zone = @date.tzif_timezone(tzif_new_york)
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=true,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(@date.num2date(157323.25, timezone=zone)),
    ),
    [1, 2400, 9, 26, 2, 0, 0, 0, -14400],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(157323.25).with_timezone(zone),
      ),
    ),
    [1, 2400, 9, 26, 2, 0, 0, 0, -14400],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(@date.num2date(157403.25, timezone=zone)),
    ),
    [1, 2400, 12, 15, 1, 0, 0, 0, -18000],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(157403.25).with_timezone(zone),
      ),
    ),
    [1, 2400, 12, 15, 1, 0, 0, 0, -18000],
  )
  let selected = locator.get_locator_for_range(157323.25, 157403.25)
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Day)
  assert_eq(selected.interval(), 1)
  assert_eq(selected.unit_scale(), 1.0)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2400, 9, 26, 2, 0, 0, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2400, 12, 15, 1, 0, 0, 0, 0]),
  )
  let ticks = locator.tick_values(157323.25, 157403.25)
  assert_eq(ticks, [
    157328.16666666666, 157342.16666666666, 157359.16666666666, 157373.20833333334,
    157389.20833333334, 157403.20833333334,
  ])
  assert_eq(locator.tick_values(157403.25, 157323.25), ticks.rev())
  assert_eq(locator.as_locator().tick_values(157323.25, 157403.25), ticks)
  assert_eq(selected.tick_values(157323.25, 157403.25), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "2400-10-01 00:00:00 EDT -0400", "2400-10-15 00:00:00 EDT -0400", "2400-11-01 00:00:00 EDT -0400",
      "2400-11-15 00:00:00 EST -0500", "2400-12-01 00:00:00 EST -0500", "2400-12-15 00:00:00 EST -0500",
    ],
  )
}

///|
test "automatic wrapper original 70 FUTURE 2400-11-05T06:00:00 pyplot fold view False" {
  let zone = @date.tzif_timezone(tzif_new_york)
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=false,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(157363.20833333334, timezone=zone),
      ),
    ),
    [1, 2400, 11, 5, 1, 0, 0, 0, -14400],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(157363.20833333334).with_timezone(zone),
      ),
    ),
    [1, 2400, 11, 5, 1, 0, 0, 0, -14400],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(157363.29166666666, timezone=zone),
      ),
    ),
    [1, 2400, 11, 5, 2, 0, 0, 0, -18000],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(157363.29166666666).with_timezone(zone),
      ),
    ),
    [1, 2400, 11, 5, 2, 0, 0, 0, -18000],
  )
  let selected = locator.get_locator_for_range(
    157363.20833333334, 157363.29166666666,
  )
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Minute)
  assert_eq(selected.interval(), 10)
  assert_eq(selected.unit_scale(), 0.0006944444444444445)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2400, 11, 5, 1, 0, 0, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2400, 11, 5, 2, 0, 0, 0, 0]),
  )
  let ticks = locator.tick_values(157363.20833333334, 157363.29166666666)
  assert_eq(ticks, [
    157363.20833333334, 157363.21527777778, 157363.22222222222, 157363.22916666666,
    157363.23611111112, 157363.24305555556, 157363.29166666666,
  ])
  assert_eq(
    locator.tick_values(157363.29166666666, 157363.20833333334),
    ticks.rev(),
  )
  assert_eq(
    locator.as_locator().tick_values(157363.20833333334, 157363.29166666666),
    ticks,
  )
  assert_eq(selected.tick_values(157363.20833333334, 157363.29166666666), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "2400-11-05 01:00:00 EDT -0400", "2400-11-05 01:10:00 EDT -0400", "2400-11-05 01:20:00 EDT -0400",
      "2400-11-05 01:30:00 EDT -0400", "2400-11-05 01:40:00 EDT -0400", "2400-11-05 01:50:00 EDT -0400",
      "2400-11-05 02:00:00 EST -0500",
    ],
  )
}

///|
test "automatic wrapper original 71 FUTURE 2400-11-05T06:00:00 pyplot fold view True" {
  let zone = @date.tzif_timezone(tzif_new_york)
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=true,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(157363.20833333334, timezone=zone),
      ),
    ),
    [1, 2400, 11, 5, 1, 0, 0, 0, -14400],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(157363.20833333334).with_timezone(zone),
      ),
    ),
    [1, 2400, 11, 5, 1, 0, 0, 0, -14400],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(157363.29166666666, timezone=zone),
      ),
    ),
    [1, 2400, 11, 5, 2, 0, 0, 0, -18000],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(157363.29166666666).with_timezone(zone),
      ),
    ),
    [1, 2400, 11, 5, 2, 0, 0, 0, -18000],
  )
  let selected = locator.get_locator_for_range(
    157363.20833333334, 157363.29166666666,
  )
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Minute)
  assert_eq(selected.interval(), 1)
  assert_eq(selected.unit_scale(), 0.0006944444444444445)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2400, 11, 5, 1, 0, 0, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2400, 11, 5, 2, 0, 0, 0, 0]),
  )
  let ticks = locator.tick_values(157363.20833333334, 157363.29166666666)
  assert_eq(ticks, [
    157363.20833333334, 157363.21527777778, 157363.22222222222, 157363.22916666666,
    157363.23611111112, 157363.24305555556, 157363.29166666666,
  ])
  assert_eq(
    locator.tick_values(157363.29166666666, 157363.20833333334),
    ticks.rev(),
  )
  assert_eq(
    locator.as_locator().tick_values(157363.20833333334, 157363.29166666666),
    ticks,
  )
  assert_eq(selected.tick_values(157363.20833333334, 157363.29166666666), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "2400-11-05 01:00:00 EDT -0400", "2400-11-05 01:10:00 EDT -0400", "2400-11-05 01:20:00 EDT -0400",
      "2400-11-05 01:30:00 EDT -0400", "2400-11-05 01:40:00 EDT -0400", "2400-11-05 01:50:00 EDT -0400",
      "2400-11-05 02:00:00 EST -0500",
    ],
  )
}

///|
test "automatic wrapper original 72 FUTURE 2400-03-12T07:00:00 seconds False" {
  let zone = @date.tzif_timezone(tzif_new_york)
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=false,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(157125.2916087963, timezone=zone),
      ),
    ),
    [1, 2400, 3, 12, 1, 59, 55, 0, -18000],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(157125.2916087963).with_timezone(zone),
      ),
    ),
    [1, 2400, 3, 12, 1, 59, 55, 0, -18000],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(157125.29172453703, timezone=zone),
      ),
    ),
    [1, 2400, 3, 12, 3, 0, 5, 0, -14400],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(157125.29172453703).with_timezone(zone),
      ),
    ),
    [1, 2400, 3, 12, 3, 0, 5, 0, -14400],
  )
  let selected = locator.get_locator_for_range(
    157125.2916087963, 157125.29172453703,
  )
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Minute)
  assert_eq(selected.interval(), 10)
  assert_eq(selected.unit_scale(), 0.0006944444444444445)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2400, 3, 12, 1, 59, 55, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2400, 3, 12, 3, 0, 5, 0, 0]),
  )
  let ticks = locator.tick_values(157125.2916087963, 157125.29172453703)
  assert_eq(ticks, [
    157125.25625, 157125.26319444444, 157125.27013888888, 157125.27708333332, 157125.2840277778,
    157125.29097222222,
  ])
  assert_eq(
    locator.tick_values(157125.29172453703, 157125.2916087963),
    ticks.rev(),
  )
  assert_eq(
    locator.as_locator().tick_values(157125.2916087963, 157125.29172453703),
    ticks,
  )
  assert_eq(selected.tick_values(157125.2916087963, 157125.29172453703), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "2400-03-12 01:09:00 EST -0500", "2400-03-12 01:19:00 EST -0500", "2400-03-12 01:29:00 EST -0500",
      "2400-03-12 01:39:00 EST -0500", "2400-03-12 01:49:00 EST -0500", "2400-03-12 01:59:00 EST -0500",
    ],
  )
}

///|
test "automatic wrapper original 73 FUTURE 2400-03-12T07:00:00 seconds True" {
  let zone = @date.tzif_timezone(tzif_new_york)
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=true,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(157125.2916087963, timezone=zone),
      ),
    ),
    [1, 2400, 3, 12, 1, 59, 55, 0, -18000],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(157125.2916087963).with_timezone(zone),
      ),
    ),
    [1, 2400, 3, 12, 1, 59, 55, 0, -18000],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(157125.29172453703, timezone=zone),
      ),
    ),
    [1, 2400, 3, 12, 3, 0, 5, 0, -14400],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(157125.29172453703).with_timezone(zone),
      ),
    ),
    [1, 2400, 3, 12, 3, 0, 5, 0, -14400],
  )
  let selected = locator.get_locator_for_range(
    157125.2916087963, 157125.29172453703,
  )
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Minute)
  assert_eq(selected.interval(), 1)
  assert_eq(selected.unit_scale(), 0.0006944444444444445)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2400, 3, 12, 1, 59, 55, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2400, 3, 12, 3, 0, 5, 0, 0]),
  )
  let ticks = locator.tick_values(157125.2916087963, 157125.29172453703)
  assert_eq(ticks, [
    157125.25, 157125.25694444444, 157125.26388888888, 157125.27083333334, 157125.27777777778,
    157125.28472222222, 157125.29166666666,
  ])
  assert_eq(
    locator.tick_values(157125.29172453703, 157125.2916087963),
    ticks.rev(),
  )
  assert_eq(
    locator.as_locator().tick_values(157125.2916087963, 157125.29172453703),
    ticks,
  )
  assert_eq(selected.tick_values(157125.2916087963, 157125.29172453703), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "2400-03-12 01:00:00 EST -0500", "2400-03-12 01:10:00 EST -0500", "2400-03-12 01:20:00 EST -0500",
      "2400-03-12 01:30:00 EST -0500", "2400-03-12 01:40:00 EST -0500", "2400-03-12 01:50:00 EST -0500",
      "2400-03-12 03:00:00 EDT -0400",
    ],
  )
}

///|
test "automatic wrapper original 74 FUTURE 2400-03-12T07:00:00 minutes False" {
  let zone = @date.tzif_timezone(tzif_new_york)
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=false,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(157125.26041666666, timezone=zone),
      ),
    ),
    [1, 2400, 3, 12, 1, 15, 0, 0, -18000],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(157125.26041666666).with_timezone(zone),
      ),
    ),
    [1, 2400, 3, 12, 1, 15, 0, 0, -18000],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(@date.num2date(157125.34375, timezone=zone)),
    ),
    [1, 2400, 3, 12, 4, 15, 0, 0, -14400],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(157125.34375).with_timezone(zone),
      ),
    ),
    [1, 2400, 3, 12, 4, 15, 0, 0, -14400],
  )
  let selected = locator.get_locator_for_range(157125.26041666666, 157125.34375)
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Minute)
  assert_eq(selected.interval(), 30)
  assert_eq(selected.unit_scale(), 0.0006944444444444445)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2400, 3, 12, 1, 15, 0, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2400, 3, 12, 4, 15, 0, 0, 0]),
  )
  let ticks = locator.tick_values(157125.26041666666, 157125.34375)
  assert_eq(ticks, [
    157125.26041666666, 157125.28125, 157125.26041666666, 157125.28125, 157125.30208333334,
    157125.32291666666, 157125.34375,
  ])
  assert_eq(locator.tick_values(157125.34375, 157125.26041666666), ticks.rev())
  assert_eq(
    locator.as_locator().tick_values(157125.26041666666, 157125.34375),
    ticks,
  )
  assert_eq(selected.tick_values(157125.26041666666, 157125.34375), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "2400-03-12 01:15:00 EST -0500", "2400-03-12 01:45:00 EST -0500", "2400-03-12 01:15:00 EST -0500",
      "2400-03-12 01:45:00 EST -0500", "2400-03-12 03:15:00 EDT -0400", "2400-03-12 03:45:00 EDT -0400",
      "2400-03-12 04:15:00 EDT -0400",
    ],
  )
}

///|
test "automatic wrapper original 75 FUTURE 2400-03-12T07:00:00 minutes True" {
  let zone = @date.tzif_timezone(tzif_new_york)
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=true,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(157125.26041666666, timezone=zone),
      ),
    ),
    [1, 2400, 3, 12, 1, 15, 0, 0, -18000],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(157125.26041666666).with_timezone(zone),
      ),
    ),
    [1, 2400, 3, 12, 1, 15, 0, 0, -18000],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(@date.num2date(157125.34375, timezone=zone)),
    ),
    [1, 2400, 3, 12, 4, 15, 0, 0, -14400],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(157125.34375).with_timezone(zone),
      ),
    ),
    [1, 2400, 3, 12, 4, 15, 0, 0, -14400],
  )
  let selected = locator.get_locator_for_range(157125.26041666666, 157125.34375)
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Minute)
  assert_eq(selected.interval(), 1)
  assert_eq(selected.unit_scale(), 0.0006944444444444445)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2400, 3, 12, 1, 15, 0, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2400, 3, 12, 4, 15, 0, 0, 0]),
  )
  let ticks = locator.tick_values(157125.26041666666, 157125.34375)
  assert_eq(ticks, [
    157125.27083333334, 157125.25, 157125.27083333334, 157125.29166666666, 157125.3125,
    157125.33333333334,
  ])
  assert_eq(locator.tick_values(157125.34375, 157125.26041666666), ticks.rev())
  assert_eq(
    locator.as_locator().tick_values(157125.26041666666, 157125.34375),
    ticks,
  )
  assert_eq(selected.tick_values(157125.26041666666, 157125.34375), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "2400-03-12 01:30:00 EST -0500", "2400-03-12 01:00:00 EST -0500", "2400-03-12 01:30:00 EST -0500",
      "2400-03-12 03:00:00 EDT -0400", "2400-03-12 03:30:00 EDT -0400", "2400-03-12 04:00:00 EDT -0400",
    ],
  )
}

///|
test "automatic wrapper original 76 FUTURE 2400-03-12T07:00:00 hours False" {
  let zone = @date.tzif_timezone(tzif_new_york)
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=false,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(157125.16666666666, timezone=zone),
      ),
    ),
    [1, 2400, 3, 11, 23, 0, 0, 0, -18000],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(157125.16666666666).with_timezone(zone),
      ),
    ),
    [1, 2400, 3, 11, 23, 0, 0, 0, -18000],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(@date.num2date(157125.5, timezone=zone)),
    ),
    [1, 2400, 3, 12, 8, 0, 0, 0, -14400],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(157125.5).with_timezone(zone),
      ),
    ),
    [1, 2400, 3, 12, 8, 0, 0, 0, -14400],
  )
  let selected = locator.get_locator_for_range(157125.16666666666, 157125.5)
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Hour)
  assert_eq(selected.interval(), 1)
  assert_eq(selected.unit_scale(), 0.041666666666666664)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2400, 3, 11, 23, 0, 0, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2400, 3, 12, 8, 0, 0, 0, 0]),
  )
  let ticks = locator.tick_values(157125.16666666666, 157125.5)
  assert_eq(ticks, [
    157125.16666666666, 157125.20833333334, 157125.25, 157125.25, 157125.29166666666,
    157125.33333333334, 157125.375, 157125.41666666666, 157125.45833333334, 157125.5,
  ])
  assert_eq(locator.tick_values(157125.5, 157125.16666666666), ticks.rev())
  assert_eq(
    locator.as_locator().tick_values(157125.16666666666, 157125.5),
    ticks,
  )
  assert_eq(selected.tick_values(157125.16666666666, 157125.5), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "2400-03-11 23:00:00 EST -0500", "2400-03-12 00:00:00 EST -0500", "2400-03-12 01:00:00 EST -0500",
      "2400-03-12 01:00:00 EST -0500", "2400-03-12 03:00:00 EDT -0400", "2400-03-12 04:00:00 EDT -0400",
      "2400-03-12 05:00:00 EDT -0400", "2400-03-12 06:00:00 EDT -0400", "2400-03-12 07:00:00 EDT -0400",
      "2400-03-12 08:00:00 EDT -0400",
    ],
  )
}

///|
test "automatic wrapper original 77 FUTURE 2400-03-12T07:00:00 hours True" {
  let zone = @date.tzif_timezone(tzif_new_york)
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=true,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(157125.16666666666, timezone=zone),
      ),
    ),
    [1, 2400, 3, 11, 23, 0, 0, 0, -18000],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(157125.16666666666).with_timezone(zone),
      ),
    ),
    [1, 2400, 3, 11, 23, 0, 0, 0, -18000],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(@date.num2date(157125.5, timezone=zone)),
    ),
    [1, 2400, 3, 12, 8, 0, 0, 0, -14400],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(157125.5).with_timezone(zone),
      ),
    ),
    [1, 2400, 3, 12, 8, 0, 0, 0, -14400],
  )
  let selected = locator.get_locator_for_range(157125.16666666666, 157125.5)
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Hour)
  assert_eq(selected.interval(), 1)
  assert_eq(selected.unit_scale(), 0.041666666666666664)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2400, 3, 11, 23, 0, 0, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2400, 3, 12, 8, 0, 0, 0, 0]),
  )
  let ticks = locator.tick_values(157125.16666666666, 157125.5)
  assert_eq(ticks, [
    157125.16666666666, 157125.20833333334, 157125.25, 157125.25, 157125.29166666666,
    157125.33333333334, 157125.375, 157125.41666666666, 157125.45833333334, 157125.5,
  ])
  assert_eq(locator.tick_values(157125.5, 157125.16666666666), ticks.rev())
  assert_eq(
    locator.as_locator().tick_values(157125.16666666666, 157125.5),
    ticks,
  )
  assert_eq(selected.tick_values(157125.16666666666, 157125.5), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "2400-03-11 23:00:00 EST -0500", "2400-03-12 00:00:00 EST -0500", "2400-03-12 01:00:00 EST -0500",
      "2400-03-12 01:00:00 EST -0500", "2400-03-12 03:00:00 EDT -0400", "2400-03-12 04:00:00 EDT -0400",
      "2400-03-12 05:00:00 EDT -0400", "2400-03-12 06:00:00 EDT -0400", "2400-03-12 07:00:00 EDT -0400",
      "2400-03-12 08:00:00 EDT -0400",
    ],
  )
}

///|
test "automatic wrapper original 78 FUTURE 2400-03-12T07:00:00 daily False" {
  let zone = @date.tzif_timezone(tzif_new_york)
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=false,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(157118.29166666666, timezone=zone),
      ),
    ),
    [1, 2400, 3, 5, 2, 0, 0, 0, -18000],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(157118.29166666666).with_timezone(zone),
      ),
    ),
    [1, 2400, 3, 5, 2, 0, 0, 0, -18000],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(157132.29166666666, timezone=zone),
      ),
    ),
    [1, 2400, 3, 19, 3, 0, 0, 0, -14400],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(157132.29166666666).with_timezone(zone),
      ),
    ),
    [1, 2400, 3, 19, 3, 0, 0, 0, -14400],
  )
  let selected = locator.get_locator_for_range(
    157118.29166666666, 157132.29166666666,
  )
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Day)
  assert_eq(selected.interval(), 2)
  assert_eq(selected.unit_scale(), 1.0)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2400, 3, 5, 2, 0, 0, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2400, 3, 19, 3, 0, 0, 0, 0]),
  )
  let ticks = locator.tick_values(157118.29166666666, 157132.29166666666)
  assert_eq(ticks, [
    157120.20833333334, 157122.20833333334, 157124.20833333334, 157126.16666666666,
    157128.16666666666, 157130.16666666666, 157132.16666666666,
  ])
  assert_eq(
    locator.tick_values(157132.29166666666, 157118.29166666666),
    ticks.rev(),
  )
  assert_eq(
    locator.as_locator().tick_values(157118.29166666666, 157132.29166666666),
    ticks,
  )
  assert_eq(selected.tick_values(157118.29166666666, 157132.29166666666), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "2400-03-07 00:00:00 EST -0500", "2400-03-09 00:00:00 EST -0500", "2400-03-11 00:00:00 EST -0500",
      "2400-03-13 00:00:00 EDT -0400", "2400-03-15 00:00:00 EDT -0400", "2400-03-17 00:00:00 EDT -0400",
      "2400-03-19 00:00:00 EDT -0400",
    ],
  )
}

///|
test "automatic wrapper original 79 FUTURE 2400-03-12T07:00:00 daily True" {
  let zone = @date.tzif_timezone(tzif_new_york)
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=true,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(157118.29166666666, timezone=zone),
      ),
    ),
    [1, 2400, 3, 5, 2, 0, 0, 0, -18000],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(157118.29166666666).with_timezone(zone),
      ),
    ),
    [1, 2400, 3, 5, 2, 0, 0, 0, -18000],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(157132.29166666666, timezone=zone),
      ),
    ),
    [1, 2400, 3, 19, 3, 0, 0, 0, -14400],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(157132.29166666666).with_timezone(zone),
      ),
    ),
    [1, 2400, 3, 19, 3, 0, 0, 0, -14400],
  )
  let selected = locator.get_locator_for_range(
    157118.29166666666, 157132.29166666666,
  )
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Day)
  assert_eq(selected.interval(), 1)
  assert_eq(selected.unit_scale(), 1.0)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2400, 3, 5, 2, 0, 0, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2400, 3, 19, 3, 0, 0, 0, 0]),
  )
  let ticks = locator.tick_values(157118.29166666666, 157132.29166666666)
  assert_eq(ticks, [
    157120.20833333334, 157122.20833333334, 157124.20833333334, 157126.16666666666,
    157128.16666666666, 157130.16666666666, 157132.16666666666,
  ])
  assert_eq(
    locator.tick_values(157132.29166666666, 157118.29166666666),
    ticks.rev(),
  )
  assert_eq(
    locator.as_locator().tick_values(157118.29166666666, 157132.29166666666),
    ticks,
  )
  assert_eq(selected.tick_values(157118.29166666666, 157132.29166666666), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "2400-03-07 00:00:00 EST -0500", "2400-03-09 00:00:00 EST -0500", "2400-03-11 00:00:00 EST -0500",
      "2400-03-13 00:00:00 EDT -0400", "2400-03-15 00:00:00 EDT -0400", "2400-03-17 00:00:00 EDT -0400",
      "2400-03-19 00:00:00 EDT -0400",
    ],
  )
}

///|
test "automatic wrapper original 80 FUTURE 2400-03-12T07:00:00 monthly False" {
  let zone = @date.tzif_timezone(tzif_new_york)
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=false,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(157085.29166666666, timezone=zone),
      ),
    ),
    [1, 2400, 2, 1, 2, 0, 0, 0, -18000],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(157085.29166666666).with_timezone(zone),
      ),
    ),
    [1, 2400, 2, 1, 2, 0, 0, 0, -18000],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(157165.29166666666, timezone=zone),
      ),
    ),
    [1, 2400, 4, 21, 3, 0, 0, 0, -14400],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(157165.29166666666).with_timezone(zone),
      ),
    ),
    [1, 2400, 4, 21, 3, 0, 0, 0, -14400],
  )
  let selected = locator.get_locator_for_range(
    157085.29166666666, 157165.29166666666,
  )
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Day)
  assert_eq(selected.interval(), 14)
  assert_eq(selected.unit_scale(), 1.0)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2400, 2, 1, 2, 0, 0, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2400, 4, 21, 3, 0, 0, 0, 0]),
  )
  let ticks = locator.tick_values(157085.29166666666, 157165.29166666666)
  assert_eq(ticks, [
    157087.20833333334, 157101.20833333334, 157115.20833333334, 157129.16666666666,
    157143.16666666666, 157157.16666666666,
  ])
  assert_eq(
    locator.tick_values(157165.29166666666, 157085.29166666666),
    ticks.rev(),
  )
  assert_eq(
    locator.as_locator().tick_values(157085.29166666666, 157165.29166666666),
    ticks,
  )
  assert_eq(selected.tick_values(157085.29166666666, 157165.29166666666), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "2400-02-03 00:00:00 EST -0500", "2400-02-17 00:00:00 EST -0500", "2400-03-02 00:00:00 EST -0500",
      "2400-03-16 00:00:00 EDT -0400", "2400-03-30 00:00:00 EDT -0400", "2400-04-13 00:00:00 EDT -0400",
    ],
  )
}

///|
test "automatic wrapper original 81 FUTURE 2400-03-12T07:00:00 monthly True" {
  let zone = @date.tzif_timezone(tzif_new_york)
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=true,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(157085.29166666666, timezone=zone),
      ),
    ),
    [1, 2400, 2, 1, 2, 0, 0, 0, -18000],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(157085.29166666666).with_timezone(zone),
      ),
    ),
    [1, 2400, 2, 1, 2, 0, 0, 0, -18000],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(157165.29166666666, timezone=zone),
      ),
    ),
    [1, 2400, 4, 21, 3, 0, 0, 0, -14400],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(157165.29166666666).with_timezone(zone),
      ),
    ),
    [1, 2400, 4, 21, 3, 0, 0, 0, -14400],
  )
  let selected = locator.get_locator_for_range(
    157085.29166666666, 157165.29166666666,
  )
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Day)
  assert_eq(selected.interval(), 1)
  assert_eq(selected.unit_scale(), 1.0)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 2400, 2, 1, 2, 0, 0, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 2400, 4, 21, 3, 0, 0, 0, 0]),
  )
  let ticks = locator.tick_values(157085.29166666666, 157165.29166666666)
  assert_eq(ticks, [
    157099.20833333334, 157114.20833333334, 157128.16666666666, 157145.16666666666,
    157159.16666666666,
  ])
  assert_eq(
    locator.tick_values(157165.29166666666, 157085.29166666666),
    ticks.rev(),
  )
  assert_eq(
    locator.as_locator().tick_values(157085.29166666666, 157165.29166666666),
    ticks,
  )
  assert_eq(selected.tick_values(157085.29166666666, 157165.29166666666), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "2400-02-15 00:00:00 EST -0500", "2400-03-01 00:00:00 EST -0500", "2400-03-15 00:00:00 EDT -0400",
      "2400-04-01 00:00:00 EDT -0400", "2400-04-15 00:00:00 EDT -0400",
    ],
  )
}

///|
test "automatic wrapper original 82 PARIS 1900-01-01T00:00:00 seconds False" {
  @date.register_timezone("D15/reference-PARIS", tzif_paris)
  defer @date.unregister_timezone("D15/reference-PARIS")
  let zone = @date.get_timezone(name="D15/reference-PARIS")
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=false,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(-25567.00005787037, timezone=zone),
      ),
    ),
    [1, 1900, 1, 1, 0, 9, 16, 0, 561],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(-25567.00005787037).with_timezone(zone),
      ),
    ),
    [1, 1900, 1, 1, 0, 9, 16, 0, 561],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(-25566.99994212963, timezone=zone),
      ),
    ),
    [1, 1900, 1, 1, 0, 9, 26, 0, 561],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(-25566.99994212963).with_timezone(zone),
      ),
    ),
    [1, 1900, 1, 1, 0, 9, 26, 0, 561],
  )
  let selected = locator.get_locator_for_range(
    -25567.00005787037, -25566.99994212963,
  )
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Second)
  assert_eq(selected.interval(), 1)
  assert_eq(selected.unit_scale(), 1.1574074074074073e-05)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 1900, 1, 1, 0, 9, 16, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 1900, 1, 1, 0, 9, 26, 0, 0]),
  )
  let ticks = locator.tick_values(-25567.00005787037, -25566.99994212963)
  assert_eq(ticks, [
    -25567.00005787037, -25567.000046296296, -25567.000034722223, -25567.00002314815,
    -25567.000011574073, -25567.0, -25566.999988425927, -25566.99997685185, -25566.999965277777,
    -25566.999953703704, -25566.99994212963,
  ])
  assert_eq(
    locator.tick_values(-25566.99994212963, -25567.00005787037),
    ticks.rev(),
  )
  assert_eq(
    locator.as_locator().tick_values(-25567.00005787037, -25566.99994212963),
    ticks,
  )
  assert_eq(selected.tick_values(-25567.00005787037, -25566.99994212963), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "1900-01-01 00:09:16 LMT +000921", "1900-01-01 00:09:17 LMT +000921", "1900-01-01 00:09:18 LMT +000921",
      "1900-01-01 00:09:19 LMT +000921", "1900-01-01 00:09:20 LMT +000921", "1900-01-01 00:09:21 LMT +000921",
      "1900-01-01 00:09:22 LMT +000921", "1900-01-01 00:09:23 LMT +000921", "1900-01-01 00:09:24 LMT +000921",
      "1900-01-01 00:09:25 LMT +000921", "1900-01-01 00:09:26 LMT +000921",
    ],
  )
}

///|
test "automatic wrapper original 83 PARIS 1900-01-01T00:00:00 seconds True" {
  @date.register_timezone("D15/reference-PARIS", tzif_paris)
  defer @date.unregister_timezone("D15/reference-PARIS")
  let zone = @date.get_timezone(name="D15/reference-PARIS")
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=true,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(-25567.00005787037, timezone=zone),
      ),
    ),
    [1, 1900, 1, 1, 0, 9, 16, 0, 561],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(-25567.00005787037).with_timezone(zone),
      ),
    ),
    [1, 1900, 1, 1, 0, 9, 16, 0, 561],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(-25566.99994212963, timezone=zone),
      ),
    ),
    [1, 1900, 1, 1, 0, 9, 26, 0, 561],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(-25566.99994212963).with_timezone(zone),
      ),
    ),
    [1, 1900, 1, 1, 0, 9, 26, 0, 561],
  )
  let selected = locator.get_locator_for_range(
    -25567.00005787037, -25566.99994212963,
  )
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Second)
  assert_eq(selected.interval(), 1)
  assert_eq(selected.unit_scale(), 1.1574074074074073e-05)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 1900, 1, 1, 0, 9, 16, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 1900, 1, 1, 0, 9, 26, 0, 0]),
  )
  let ticks = locator.tick_values(-25567.00005787037, -25566.99994212963)
  assert_eq(ticks, [
    -25567.00005787037, -25567.000046296296, -25567.000034722223, -25567.00002314815,
    -25567.000011574073, -25567.0, -25566.999988425927, -25566.99997685185, -25566.999965277777,
    -25566.999953703704, -25566.99994212963,
  ])
  assert_eq(
    locator.tick_values(-25566.99994212963, -25567.00005787037),
    ticks.rev(),
  )
  assert_eq(
    locator.as_locator().tick_values(-25567.00005787037, -25566.99994212963),
    ticks,
  )
  assert_eq(selected.tick_values(-25567.00005787037, -25566.99994212963), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "1900-01-01 00:09:16 LMT +000921", "1900-01-01 00:09:17 LMT +000921", "1900-01-01 00:09:18 LMT +000921",
      "1900-01-01 00:09:19 LMT +000921", "1900-01-01 00:09:20 LMT +000921", "1900-01-01 00:09:21 LMT +000921",
      "1900-01-01 00:09:22 LMT +000921", "1900-01-01 00:09:23 LMT +000921", "1900-01-01 00:09:24 LMT +000921",
      "1900-01-01 00:09:25 LMT +000921", "1900-01-01 00:09:26 LMT +000921",
    ],
  )
}

///|
test "automatic wrapper original 84 PARIS 1900-01-01T00:00:00 minutes False" {
  @date.register_timezone("D15/reference-PARIS", tzif_paris)
  defer @date.unregister_timezone("D15/reference-PARIS")
  let zone = @date.get_timezone(name="D15/reference-PARIS")
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=false,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(@date.num2date(-25567.03125, timezone=zone)),
    ),
    [1, 1899, 12, 31, 23, 24, 21, 0, 561],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(-25567.03125).with_timezone(zone),
      ),
    ),
    [1, 1899, 12, 31, 23, 24, 21, 0, 561],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(-25566.947916666668, timezone=zone),
      ),
    ),
    [1, 1900, 1, 1, 1, 24, 21, 0, 561],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(-25566.947916666668).with_timezone(zone),
      ),
    ),
    [1, 1900, 1, 1, 1, 24, 21, 0, 561],
  )
  let selected = locator.get_locator_for_range(
    -25567.03125, -25566.947916666668,
  )
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Minute)
  assert_eq(selected.interval(), 15)
  assert_eq(selected.unit_scale(), 0.0006944444444444445)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 1899, 12, 31, 23, 24, 21, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 1900, 1, 1, 1, 24, 21, 0, 0]),
  )
  let ticks = locator.tick_values(-25567.03125, -25566.947916666668)
  assert_eq(ticks, [
    -25567.02107638889, -25567.010659722222, -25567.000243055554, -25566.98982638889,
    -25566.979409722222, -25566.968993055554, -25566.95857638889, -25566.948159722222,
  ])
  assert_eq(locator.tick_values(-25566.947916666668, -25567.03125), ticks.rev())
  assert_eq(
    locator.as_locator().tick_values(-25567.03125, -25566.947916666668),
    ticks,
  )
  assert_eq(selected.tick_values(-25567.03125, -25566.947916666668), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "1899-12-31 23:39:00 LMT +000921", "1899-12-31 23:54:00 LMT +000921", "1900-01-01 00:09:00 LMT +000921",
      "1900-01-01 00:24:00 LMT +000921", "1900-01-01 00:39:00 LMT +000921", "1900-01-01 00:54:00 LMT +000921",
      "1900-01-01 01:09:00 LMT +000921", "1900-01-01 01:24:00 LMT +000921",
    ],
  )
}

///|
test "automatic wrapper original 85 PARIS 1900-01-01T00:00:00 minutes True" {
  @date.register_timezone("D15/reference-PARIS", tzif_paris)
  defer @date.unregister_timezone("D15/reference-PARIS")
  let zone = @date.get_timezone(name="D15/reference-PARIS")
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=true,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(@date.num2date(-25567.03125, timezone=zone)),
    ),
    [1, 1899, 12, 31, 23, 24, 21, 0, 561],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(-25567.03125).with_timezone(zone),
      ),
    ),
    [1, 1899, 12, 31, 23, 24, 21, 0, 561],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(-25566.947916666668, timezone=zone),
      ),
    ),
    [1, 1900, 1, 1, 1, 24, 21, 0, 561],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(-25566.947916666668).with_timezone(zone),
      ),
    ),
    [1, 1900, 1, 1, 1, 24, 21, 0, 561],
  )
  let selected = locator.get_locator_for_range(
    -25567.03125, -25566.947916666668,
  )
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Minute)
  assert_eq(selected.interval(), 1)
  assert_eq(selected.unit_scale(), 0.0006944444444444445)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 1899, 12, 31, 23, 24, 21, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 1900, 1, 1, 1, 24, 21, 0, 0]),
  )
  let ticks = locator.tick_values(-25567.03125, -25566.947916666668)
  assert_eq(ticks, [
    -25567.02732638889, -25567.01690972222, -25567.006493055556, -25566.99607638889,
    -25566.98565972222, -25566.975243055556, -25566.96482638889, -25566.95440972222,
  ])
  assert_eq(locator.tick_values(-25566.947916666668, -25567.03125), ticks.rev())
  assert_eq(
    locator.as_locator().tick_values(-25567.03125, -25566.947916666668),
    ticks,
  )
  assert_eq(selected.tick_values(-25567.03125, -25566.947916666668), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "1899-12-31 23:30:00 LMT +000921", "1899-12-31 23:45:00 LMT +000921", "1900-01-01 00:00:00 LMT +000921",
      "1900-01-01 00:15:00 LMT +000921", "1900-01-01 00:30:00 LMT +000921", "1900-01-01 00:45:00 LMT +000921",
      "1900-01-01 01:00:00 LMT +000921", "1900-01-01 01:15:00 LMT +000921",
    ],
  )
}

///|
test "automatic wrapper original 86 PARIS 1900-01-01T00:00:00 hours False" {
  @date.register_timezone("D15/reference-PARIS", tzif_paris)
  defer @date.unregister_timezone("D15/reference-PARIS")
  let zone = @date.get_timezone(name="D15/reference-PARIS")
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=false,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(@date.num2date(-25567.125, timezone=zone)),
    ),
    [1, 1899, 12, 31, 21, 9, 21, 0, 561],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(-25567.125).with_timezone(zone),
      ),
    ),
    [1, 1899, 12, 31, 21, 9, 21, 0, 561],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(-25566.791666666668, timezone=zone),
      ),
    ),
    [1, 1900, 1, 1, 5, 9, 21, 0, 561],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(-25566.791666666668).with_timezone(zone),
      ),
    ),
    [1, 1900, 1, 1, 5, 9, 21, 0, 561],
  )
  let selected = locator.get_locator_for_range(-25567.125, -25566.791666666668)
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Hour)
  assert_eq(selected.interval(), 1)
  assert_eq(selected.unit_scale(), 0.041666666666666664)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 1899, 12, 31, 21, 9, 21, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 1900, 1, 1, 5, 9, 21, 0, 0]),
  )
  let ticks = locator.tick_values(-25567.125, -25566.791666666668)
  assert_eq(ticks, [
    -25567.08982638889, -25567.04815972222, -25567.006493055556, -25566.96482638889,
    -25566.92315972222, -25566.881493055556, -25566.83982638889, -25566.79815972222,
  ])
  assert_eq(locator.tick_values(-25566.791666666668, -25567.125), ticks.rev())
  assert_eq(
    locator.as_locator().tick_values(-25567.125, -25566.791666666668),
    ticks,
  )
  assert_eq(selected.tick_values(-25567.125, -25566.791666666668), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "1899-12-31 22:00:00 LMT +000921", "1899-12-31 23:00:00 LMT +000921", "1900-01-01 00:00:00 LMT +000921",
      "1900-01-01 01:00:00 LMT +000921", "1900-01-01 02:00:00 LMT +000921", "1900-01-01 03:00:00 LMT +000921",
      "1900-01-01 04:00:00 LMT +000921", "1900-01-01 05:00:00 LMT +000921",
    ],
  )
}

///|
test "automatic wrapper original 87 PARIS 1900-01-01T00:00:00 hours True" {
  @date.register_timezone("D15/reference-PARIS", tzif_paris)
  defer @date.unregister_timezone("D15/reference-PARIS")
  let zone = @date.get_timezone(name="D15/reference-PARIS")
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=true,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(@date.num2date(-25567.125, timezone=zone)),
    ),
    [1, 1899, 12, 31, 21, 9, 21, 0, 561],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(-25567.125).with_timezone(zone),
      ),
    ),
    [1, 1899, 12, 31, 21, 9, 21, 0, 561],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.num2date(-25566.791666666668, timezone=zone),
      ),
    ),
    [1, 1900, 1, 1, 5, 9, 21, 0, 561],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(-25566.791666666668).with_timezone(zone),
      ),
    ),
    [1, 1900, 1, 1, 5, 9, 21, 0, 561],
  )
  let selected = locator.get_locator_for_range(-25567.125, -25566.791666666668)
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Hour)
  assert_eq(selected.interval(), 1)
  assert_eq(selected.unit_scale(), 0.041666666666666664)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 1899, 12, 31, 21, 9, 21, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 1900, 1, 1, 5, 9, 21, 0, 0]),
  )
  let ticks = locator.tick_values(-25567.125, -25566.791666666668)
  assert_eq(ticks, [
    -25567.08982638889, -25567.04815972222, -25567.006493055556, -25566.96482638889,
    -25566.92315972222, -25566.881493055556, -25566.83982638889, -25566.79815972222,
  ])
  assert_eq(locator.tick_values(-25566.791666666668, -25567.125), ticks.rev())
  assert_eq(
    locator.as_locator().tick_values(-25567.125, -25566.791666666668),
    ticks,
  )
  assert_eq(selected.tick_values(-25567.125, -25566.791666666668), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "1899-12-31 22:00:00 LMT +000921", "1899-12-31 23:00:00 LMT +000921", "1900-01-01 00:00:00 LMT +000921",
      "1900-01-01 01:00:00 LMT +000921", "1900-01-01 02:00:00 LMT +000921", "1900-01-01 03:00:00 LMT +000921",
      "1900-01-01 04:00:00 LMT +000921", "1900-01-01 05:00:00 LMT +000921",
    ],
  )
}

///|
test "automatic wrapper original 88 PARIS 1900-01-01T00:00:00 daily False" {
  @date.register_timezone("D15/reference-PARIS", tzif_paris)
  defer @date.unregister_timezone("D15/reference-PARIS")
  let zone = @date.get_timezone(name="D15/reference-PARIS")
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=false,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(@date.num2date(-25574.0, timezone=zone)),
    ),
    [1, 1899, 12, 25, 0, 9, 21, 0, 561],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(-25574.0).with_timezone(zone),
      ),
    ),
    [1, 1899, 12, 25, 0, 9, 21, 0, 561],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(@date.num2date(-25560.0, timezone=zone)),
    ),
    [1, 1900, 1, 8, 0, 9, 21, 0, 561],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(-25560.0).with_timezone(zone),
      ),
    ),
    [1, 1900, 1, 8, 0, 9, 21, 0, 561],
  )
  let selected = locator.get_locator_for_range(-25574.0, -25560.0)
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Day)
  assert_eq(selected.interval(), 2)
  assert_eq(selected.unit_scale(), 1.0)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 1899, 12, 25, 0, 9, 21, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 1900, 1, 8, 0, 9, 21, 0, 0]),
  )
  let ticks = locator.tick_values(-25574.0, -25560.0)
  assert_eq(ticks, [
    -25572.006493055556, -25570.006493055556, -25568.006493055556, -25566.006493055556,
    -25564.006493055556, -25562.006493055556, -25560.006493055556,
  ])
  assert_eq(locator.tick_values(-25560.0, -25574.0), ticks.rev())
  assert_eq(locator.as_locator().tick_values(-25574.0, -25560.0), ticks)
  assert_eq(selected.tick_values(-25574.0, -25560.0), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "1899-12-27 00:00:00 LMT +000921", "1899-12-29 00:00:00 LMT +000921", "1899-12-31 00:00:00 LMT +000921",
      "1900-01-02 00:00:00 LMT +000921", "1900-01-04 00:00:00 LMT +000921", "1900-01-06 00:00:00 LMT +000921",
      "1900-01-08 00:00:00 LMT +000921",
    ],
  )
}

///|
test "automatic wrapper original 89 PARIS 1900-01-01T00:00:00 daily True" {
  @date.register_timezone("D15/reference-PARIS", tzif_paris)
  defer @date.unregister_timezone("D15/reference-PARIS")
  let zone = @date.get_timezone(name="D15/reference-PARIS")
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=true,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(@date.num2date(-25574.0, timezone=zone)),
    ),
    [1, 1899, 12, 25, 0, 9, 21, 0, 561],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(-25574.0).with_timezone(zone),
      ),
    ),
    [1, 1899, 12, 25, 0, 9, 21, 0, 561],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(@date.num2date(-25560.0, timezone=zone)),
    ),
    [1, 1900, 1, 8, 0, 9, 21, 0, 561],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(-25560.0).with_timezone(zone),
      ),
    ),
    [1, 1900, 1, 8, 0, 9, 21, 0, 561],
  )
  let selected = locator.get_locator_for_range(-25574.0, -25560.0)
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Day)
  assert_eq(selected.interval(), 1)
  assert_eq(selected.unit_scale(), 1.0)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 1899, 12, 25, 0, 9, 21, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 1900, 1, 8, 0, 9, 21, 0, 0]),
  )
  let ticks = locator.tick_values(-25574.0, -25560.0)
  assert_eq(ticks, [
    -25572.006493055556, -25570.006493055556, -25568.006493055556, -25567.006493055556,
    -25565.006493055556, -25563.006493055556, -25561.006493055556,
  ])
  assert_eq(locator.tick_values(-25560.0, -25574.0), ticks.rev())
  assert_eq(locator.as_locator().tick_values(-25574.0, -25560.0), ticks)
  assert_eq(selected.tick_values(-25574.0, -25560.0), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "1899-12-27 00:00:00 LMT +000921", "1899-12-29 00:00:00 LMT +000921", "1899-12-31 00:00:00 LMT +000921",
      "1900-01-01 00:00:00 LMT +000921", "1900-01-03 00:00:00 LMT +000921", "1900-01-05 00:00:00 LMT +000921",
      "1900-01-07 00:00:00 LMT +000921",
    ],
  )
}

///|
test "automatic wrapper original 90 PARIS 1900-01-01T00:00:00 monthly False" {
  @date.register_timezone("D15/reference-PARIS", tzif_paris)
  defer @date.unregister_timezone("D15/reference-PARIS")
  let zone = @date.get_timezone(name="D15/reference-PARIS")
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=false,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(@date.num2date(-25607.0, timezone=zone)),
    ),
    [1, 1899, 11, 22, 0, 9, 21, 0, 561],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(-25607.0).with_timezone(zone),
      ),
    ),
    [1, 1899, 11, 22, 0, 9, 21, 0, 561],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(@date.num2date(-25527.0, timezone=zone)),
    ),
    [1, 1900, 2, 10, 0, 9, 21, 0, 561],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(-25527.0).with_timezone(zone),
      ),
    ),
    [1, 1900, 2, 10, 0, 9, 21, 0, 561],
  )
  let selected = locator.get_locator_for_range(-25607.0, -25527.0)
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Day)
  assert_eq(selected.interval(), 14)
  assert_eq(selected.unit_scale(), 1.0)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 1899, 11, 22, 0, 9, 21, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 1900, 2, 10, 0, 9, 21, 0, 0]),
  )
  let ticks = locator.tick_values(-25607.0, -25527.0)
  assert_eq(ticks, [
    -25603.006493055556, -25589.006493055556, -25575.006493055556, -25561.006493055556,
    -25547.006493055556, -25533.006493055556,
  ])
  assert_eq(locator.tick_values(-25527.0, -25607.0), ticks.rev())
  assert_eq(locator.as_locator().tick_values(-25607.0, -25527.0), ticks)
  assert_eq(selected.tick_values(-25607.0, -25527.0), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "1899-11-26 00:00:00 LMT +000921", "1899-12-10 00:00:00 LMT +000921", "1899-12-24 00:00:00 LMT +000921",
      "1900-01-07 00:00:00 LMT +000921", "1900-01-21 00:00:00 LMT +000921", "1900-02-04 00:00:00 LMT +000921",
    ],
  )
}

///|
test "automatic wrapper original 91 PARIS 1900-01-01T00:00:00 monthly True" {
  @date.register_timezone("D15/reference-PARIS", tzif_paris)
  defer @date.unregister_timezone("D15/reference-PARIS")
  let zone = @date.get_timezone(name="D15/reference-PARIS")
  let locator = @date.AutoDateLocator::new(
    timezone=zone,
    interval_multiples=true,
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(@date.num2date(-25607.0, timezone=zone)),
    ),
    [1, 1899, 11, 22, 0, 9, 21, 0, 561],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(-25607.0).with_timezone(zone),
      ),
    ),
    [1, 1899, 11, 22, 0, 9, 21, 0, 561],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(@date.num2date(-25527.0, timezone=zone)),
    ),
    [1, 1900, 2, 10, 0, 9, 21, 0, 561],
  )
  assert_eq(
    wrapper_reference_fields(
      @date.RRuleDateTime::aware(
        @date.from_ordinal(-25527.0).with_timezone(zone),
      ),
    ),
    [1, 1900, 2, 10, 0, 9, 21, 0, 561],
  )
  let selected = locator.get_locator_for_range(-25607.0, -25527.0)
  let rule = selected.rrule_locator().unwrap().rule()
  assert_eq(locator.frequency(), @date.Day)
  assert_eq(selected.interval(), 1)
  assert_eq(selected.unit_scale(), 1.0)
  assert_eq(rule.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(rule.dtstart()), [
    0, 1899, 11, 22, 0, 9, 21, 0, 0,
  ])
  assert_eq(
    rule.until().map(wrapper_reference_fields),
    Some([0, 1900, 2, 10, 0, 9, 21, 0, 0]),
  )
  let ticks = locator.tick_values(-25607.0, -25527.0)
  assert_eq(ticks, [
    -25598.006493055556, -25584.006493055556, -25567.006493055556, -25553.006493055556,
    -25536.006493055556,
  ])
  assert_eq(locator.tick_values(-25527.0, -25607.0), ticks.rev())
  assert_eq(locator.as_locator().tick_values(-25607.0, -25527.0), ticks)
  assert_eq(selected.tick_values(-25607.0, -25527.0), ticks)
  assert_eq(
    @date.date_formatter("%Y-%m-%d %H:%M:%S %Z %z", timezone=zone).format_values(
      ticks,
    ),
    [
      "1899-12-01 00:00:00 LMT +000921", "1899-12-15 00:00:00 LMT +000921", "1900-01-01 00:00:00 LMT +000921",
      "1900-01-15 00:00:00 LMT +000921", "1900-02-01 00:00:00 LMT +000921",
    ],
  )
}
