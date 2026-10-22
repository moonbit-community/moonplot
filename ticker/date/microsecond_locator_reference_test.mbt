// Generated original MicrosecondLocator, MultipleLocator and Edge.

///|
test "MicrosecondLocator original 0 year/micro grid 1/0 step 0.1" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=0.1,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 0.1)
  assert_eq(copy.interval_value(), 0.1)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("0001-01-01T00:00:00")),
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.000003"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([-719162.0, -719162.0, -719162.0]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.000003"),
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("0001-01-01T00:00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([-719162.0, -719162.0, -719162.0]),
  )
  assert_eq(adapter.tick_values(-719162.0, -719162.0), [
    -719162.0, -719162.0, -719162.0,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-12, 2.3148148148148147e-12),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-12, 2.3148148148148147e-12),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999997685, 12.000000100002314),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999997685, 12.000000100002314),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 1 year/micro grid 1/0 step 0.25" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=0.25,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 0.25)
  assert_eq(copy.interval_value(), 0.25)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("0001-01-01T00:00:00")),
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.000003"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([-719162.0, -719162.0, -719162.0]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.000003"),
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("0001-01-01T00:00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([-719162.0, -719162.0, -719162.0]),
  )
  assert_eq(adapter.tick_values(-719162.0, -719162.0), [
    -719162.0, -719162.0, -719162.0,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-5.787037037037037e-12, 5.787037037037037e-12),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-5.787037037037037e-12, 5.787037037037037e-12),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999994213, 12.000000100005787),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999994213, 12.000000100005787),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 2 year/micro grid 1/0 step 0.5" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=0.5,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 0.5)
  assert_eq(copy.interval_value(), 0.5)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("0001-01-01T00:00:00")),
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.000003"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([-719162.0, -719162.0, -719162.0]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.000003"),
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("0001-01-01T00:00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([-719162.0, -719162.0, -719162.0]),
  )
  assert_eq(adapter.tick_values(-719162.0, -719162.0), [
    -719162.0, -719162.0, -719162.0,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-1.1574074074074074e-11, 1.1574074074074074e-11),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-1.1574074074074074e-11, 1.1574074074074074e-11),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999988425, 12.000000100011574),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999988425, 12.000000100011574),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 3 year/micro grid 1/0 step 1.0" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=1.0,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 1.0)
  assert_eq(copy.interval_value(), 1.0)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("0001-01-01T00:00:00")),
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.000003"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([-719162.0, -719162.0, -719162.0]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.000003"),
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("0001-01-01T00:00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([-719162.0, -719162.0, -719162.0]),
  )
  assert_eq(adapter.tick_values(-719162.0, -719162.0), [
    -719162.0, -719162.0, -719162.0,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-11, 2.3148148148148147e-11),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-11, 2.3148148148148147e-11),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999976852, 12.000000100023147),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999976852, 12.000000100023147),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 4 year/micro grid 1/0 step 2.5" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=2.5,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 2.5)
  assert_eq(copy.interval_value(), 2.5)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("0001-01-01T00:00:00")),
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.000003"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([-719162.0, -719162.0, -719162.0]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.000003"),
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("0001-01-01T00:00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([-719162.0, -719162.0, -719162.0]),
  )
  assert_eq(adapter.tick_values(-719162.0, -719162.0), [
    -719162.0, -719162.0, -719162.0,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-5.787037037037037e-11, 5.787037037037037e-11),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-5.787037037037037e-11, 5.787037037037037e-11),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.99999999994213, 12.00000010005787),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.99999999994213, 12.00000010005787),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 5 year/micro grid 1/0 step 7.0" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=7.0,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 7.0)
  assert_eq(copy.interval_value(), 7.0)
  assert_eq(copy.interval(), 7)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("0001-01-01T00:00:00")),
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.000003"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([-719162.0000000001, -719162.0, -719161.9999999999]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.000003"),
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("0001-01-01T00:00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([-719162.0000000001, -719162.0, -719161.9999999999]),
  )
  assert_eq(adapter.tick_values(-719162.0, -719162.0), [
    -719162.0000000001, -719162.0, -719161.9999999999,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-1.6203703703703702e-10, 1.6203703703703702e-10),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-1.6203703703703702e-10, 1.6203703703703702e-10),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999837963, 12.000000100162037),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999837963, 12.000000100162037),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 6 year/micro grid 1/1 step 0.1" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=0.1,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 0.1)
  assert_eq(copy.interval_value(), 0.1)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.000001"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.000004"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      -719162.0, -719162.0, -719162.0, -719162.0, -719162.0, -719162.0, -719162.0,
      -719162.0, -719162.0, -719162.0, -719162.0, -719162.0, -719162.0, -719162.0,
      -719162.0, -719162.0, -719162.0, -719162.0, -719162.0, -719162.0, -719162.0,
      -719162.0, -719162.0, -719162.0, -719162.0, -719162.0, -719162.0, -719162.0,
      -719162.0, -719162.0, -719162.0, -719162.0, -719162.0, -719162.0, -719162.0,
      -719162.0, -719162.0, -719162.0, -719162.0, -719162.0, -719162.0, -719162.0,
      -719162.0, -719162.0, -719162.0, -719162.0, -719162.0, -719162.0, -719162.0,
      -719162.0, -719162.0, -719162.0, -719161.9999999999, -719161.9999999999, -719161.9999999999,
      -719161.9999999999, -719161.9999999999, -719161.9999999999, -719161.9999999999,
      -719161.9999999999, -719161.9999999999, -719161.9999999999, -719161.9999999999,
      -719161.9999999999, -719161.9999999999, -719161.9999999999, -719161.9999999999,
      -719161.9999999999, -719161.9999999999, -719161.9999999999, -719161.9999999999,
      -719161.9999999999, -719161.9999999999, -719161.9999999999, -719161.9999999999,
      -719161.9999999999, -719161.9999999999, -719161.9999999999, -719161.9999999999,
      -719161.9999999999, -719161.9999999999, -719161.9999999999, -719161.9999999999,
      -719161.9999999999, -719161.9999999999, -719161.9999999999, -719161.9999999999,
      -719161.9999999999, -719161.9999999999, -719161.9999999999, -719161.9999999999,
      -719161.9999999999, -719161.9999999999, -719161.9999999999, -719161.9999999999,
      -719161.9999999999, -719161.9999999999, -719161.9999999999, -719161.9999999999,
      -719161.9999999999, -719161.9999999999, -719161.9999999999, -719161.9999999999,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.000004"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.000001"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      -719162.0, -719162.0, -719162.0, -719162.0, -719162.0, -719162.0, -719162.0,
      -719162.0, -719162.0, -719162.0, -719162.0, -719162.0, -719162.0, -719162.0,
      -719162.0, -719162.0, -719162.0, -719162.0, -719162.0, -719162.0, -719162.0,
      -719162.0, -719162.0, -719162.0, -719162.0, -719162.0, -719162.0, -719162.0,
      -719162.0, -719162.0, -719162.0, -719162.0, -719162.0, -719162.0, -719162.0,
      -719162.0, -719162.0, -719162.0, -719162.0, -719162.0, -719162.0, -719162.0,
      -719162.0, -719162.0, -719162.0, -719162.0, -719162.0, -719162.0, -719162.0,
      -719162.0, -719162.0, -719162.0, -719161.9999999999, -719161.9999999999, -719161.9999999999,
      -719161.9999999999, -719161.9999999999, -719161.9999999999, -719161.9999999999,
      -719161.9999999999, -719161.9999999999, -719161.9999999999, -719161.9999999999,
      -719161.9999999999, -719161.9999999999, -719161.9999999999, -719161.9999999999,
      -719161.9999999999, -719161.9999999999, -719161.9999999999, -719161.9999999999,
      -719161.9999999999, -719161.9999999999, -719161.9999999999, -719161.9999999999,
      -719161.9999999999, -719161.9999999999, -719161.9999999999, -719161.9999999999,
      -719161.9999999999, -719161.9999999999, -719161.9999999999, -719161.9999999999,
      -719161.9999999999, -719161.9999999999, -719161.9999999999, -719161.9999999999,
      -719161.9999999999, -719161.9999999999, -719161.9999999999, -719161.9999999999,
      -719161.9999999999, -719161.9999999999, -719161.9999999999, -719161.9999999999,
      -719161.9999999999, -719161.9999999999, -719161.9999999999, -719161.9999999999,
      -719161.9999999999, -719161.9999999999, -719161.9999999999, -719161.9999999999,
    ]),
  )
  assert_eq(adapter.tick_values(-719162.0, -719161.9999999999), [
    -719162.0, -719162.0, -719162.0,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-12, 2.3148148148148147e-12),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-12, 2.3148148148148147e-12),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999997685, 12.000000100002314),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999997685, 12.000000100002314),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 7 year/micro grid 1/1 step 0.25" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=0.25,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 0.25)
  assert_eq(copy.interval_value(), 0.25)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.000001"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.000004"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      -719162.0, -719162.0, -719162.0, -719162.0, -719162.0, -719162.0, -719162.0,
      -719162.0, -719162.0, -719162.0, -719162.0, -719162.0, -719162.0, -719162.0,
      -719162.0, -719162.0, -719162.0, -719162.0, -719162.0, -719162.0, -719162.0,
      -719162.0, -719161.9999999999, -719161.9999999999, -719161.9999999999, -719161.9999999999,
      -719161.9999999999, -719161.9999999999, -719161.9999999999, -719161.9999999999,
      -719161.9999999999, -719161.9999999999, -719161.9999999999, -719161.9999999999,
      -719161.9999999999, -719161.9999999999, -719161.9999999999, -719161.9999999999,
      -719161.9999999999, -719161.9999999999, -719161.9999999999, -719161.9999999999,
      -719161.9999999999,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.000004"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.000001"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      -719162.0, -719162.0, -719162.0, -719162.0, -719162.0, -719162.0, -719162.0,
      -719162.0, -719162.0, -719162.0, -719162.0, -719162.0, -719162.0, -719162.0,
      -719162.0, -719162.0, -719162.0, -719162.0, -719162.0, -719162.0, -719162.0,
      -719162.0, -719161.9999999999, -719161.9999999999, -719161.9999999999, -719161.9999999999,
      -719161.9999999999, -719161.9999999999, -719161.9999999999, -719161.9999999999,
      -719161.9999999999, -719161.9999999999, -719161.9999999999, -719161.9999999999,
      -719161.9999999999, -719161.9999999999, -719161.9999999999, -719161.9999999999,
      -719161.9999999999, -719161.9999999999, -719161.9999999999, -719161.9999999999,
      -719161.9999999999,
    ]),
  )
  assert_eq(adapter.tick_values(-719162.0, -719161.9999999999), [
    -719162.0, -719162.0, -719162.0,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-5.787037037037037e-12, 5.787037037037037e-12),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-5.787037037037037e-12, 5.787037037037037e-12),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999994213, 12.000000100005787),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999994213, 12.000000100005787),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 8 year/micro grid 1/1 step 0.5" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=0.5,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 0.5)
  assert_eq(copy.interval_value(), 0.5)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.000001"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.000004"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      -719162.0, -719162.0, -719162.0, -719162.0, -719162.0, -719162.0, -719162.0,
      -719162.0, -719162.0, -719162.0, -719162.0, -719162.0, -719161.9999999999,
      -719161.9999999999, -719161.9999999999, -719161.9999999999, -719161.9999999999,
      -719161.9999999999, -719161.9999999999, -719161.9999999999, -719161.9999999999,
      -719161.9999999999, -719161.9999999999,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.000004"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.000001"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      -719162.0, -719162.0, -719162.0, -719162.0, -719162.0, -719162.0, -719162.0,
      -719162.0, -719162.0, -719162.0, -719162.0, -719162.0, -719161.9999999999,
      -719161.9999999999, -719161.9999999999, -719161.9999999999, -719161.9999999999,
      -719161.9999999999, -719161.9999999999, -719161.9999999999, -719161.9999999999,
      -719161.9999999999, -719161.9999999999,
    ]),
  )
  assert_eq(adapter.tick_values(-719162.0, -719161.9999999999), [
    -719162.0, -719162.0, -719162.0,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-1.1574074074074074e-11, 1.1574074074074074e-11),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-1.1574074074074074e-11, 1.1574074074074074e-11),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999988425, 12.000000100011574),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999988425, 12.000000100011574),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 9 year/micro grid 1/1 step 1.0" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=1.0,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 1.0)
  assert_eq(copy.interval_value(), 1.0)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.000001"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.000004"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      -719162.0, -719162.0, -719162.0, -719162.0, -719162.0, -719162.0, -719162.0,
      -719161.9999999999, -719161.9999999999, -719161.9999999999, -719161.9999999999,
      -719161.9999999999, -719161.9999999999,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.000004"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.000001"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      -719162.0, -719162.0, -719162.0, -719162.0, -719162.0, -719162.0, -719162.0,
      -719161.9999999999, -719161.9999999999, -719161.9999999999, -719161.9999999999,
      -719161.9999999999, -719161.9999999999,
    ]),
  )
  assert_eq(adapter.tick_values(-719162.0, -719161.9999999999), [
    -719162.0, -719162.0, -719162.0,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-11, 2.3148148148148147e-11),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-11, 2.3148148148148147e-11),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999976852, 12.000000100023147),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999976852, 12.000000100023147),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 10 year/micro grid 1/1 step 2.5" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=2.5,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 2.5)
  assert_eq(copy.interval_value(), 2.5)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.000001"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.000004"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      -719162.0, -719162.0, -719162.0, -719162.0, -719161.9999999999, -719161.9999999999,
      -719161.9999999999,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.000004"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.000001"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      -719162.0, -719162.0, -719162.0, -719162.0, -719161.9999999999, -719161.9999999999,
      -719161.9999999999,
    ]),
  )
  assert_eq(adapter.tick_values(-719162.0, -719161.9999999999), [
    -719162.0, -719162.0, -719162.0,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-5.787037037037037e-11, 5.787037037037037e-11),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-5.787037037037037e-11, 5.787037037037037e-11),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.99999999994213, 12.00000010005787),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.99999999994213, 12.00000010005787),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 11 year/micro grid 1/1 step 7.0" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=7.0,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 7.0)
  assert_eq(copy.interval_value(), 7.0)
  assert_eq(copy.interval(), 7)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.000001"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.000004"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([-719162.0000000001, -719162.0, -719161.9999999999, -719161.9999999999]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.000004"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.000001"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([-719162.0000000001, -719162.0, -719161.9999999999, -719161.9999999999]),
  )
  assert_eq(adapter.tick_values(-719162.0, -719161.9999999999), [
    -719162.0000000001, -719162.0, -719161.9999999999,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-1.6203703703703702e-10, 1.6203703703703702e-10),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-1.6203703703703702e-10, 1.6203703703703702e-10),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999837963, 12.000000100162037),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999837963, 12.000000100162037),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 12 year/micro grid 1/123456 step 0.1" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=0.1,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 0.1)
  assert_eq(copy.interval_value(), 0.1)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.123456"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.123459"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([-719161.9999985711, -719161.9999985711]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.123459"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.123456"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([-719161.9999985711, -719161.9999985711]),
  )
  assert_eq(adapter.tick_values(-719161.9999985711, -719161.9999985711), [
    -719161.9999985711, -719161.9999985711,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-12, 2.3148148148148147e-12),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-12, 2.3148148148148147e-12),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999997685, 12.000000100002314),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999997685, 12.000000100002314),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 13 year/micro grid 1/123456 step 0.25" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=0.25,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 0.25)
  assert_eq(copy.interval_value(), 0.25)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.123456"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.123459"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([-719161.9999985711, -719161.9999985711]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.123459"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.123456"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([-719161.9999985711, -719161.9999985711]),
  )
  assert_eq(adapter.tick_values(-719161.9999985711, -719161.9999985711), [
    -719161.9999985711, -719161.9999985711,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-5.787037037037037e-12, 5.787037037037037e-12),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-5.787037037037037e-12, 5.787037037037037e-12),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999994213, 12.000000100005787),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999994213, 12.000000100005787),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 14 year/micro grid 1/123456 step 0.5" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=0.5,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 0.5)
  assert_eq(copy.interval_value(), 0.5)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.123456"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.123459"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([-719161.9999985711, -719161.9999985711]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.123459"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.123456"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([-719161.9999985711, -719161.9999985711]),
  )
  assert_eq(adapter.tick_values(-719161.9999985711, -719161.9999985711), [
    -719161.9999985711, -719161.9999985711,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-1.1574074074074074e-11, 1.1574074074074074e-11),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-1.1574074074074074e-11, 1.1574074074074074e-11),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999988425, 12.000000100011574),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999988425, 12.000000100011574),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 15 year/micro grid 1/123456 step 1.0" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=1.0,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 1.0)
  assert_eq(copy.interval_value(), 1.0)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.123456"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.123459"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([-719161.9999985711, -719161.9999985711]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.123459"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.123456"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([-719161.9999985711, -719161.9999985711]),
  )
  assert_eq(adapter.tick_values(-719161.9999985711, -719161.9999985711), [
    -719161.9999985711, -719161.9999985711,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-11, 2.3148148148148147e-11),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-11, 2.3148148148148147e-11),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999976852, 12.000000100023147),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999976852, 12.000000100023147),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 16 year/micro grid 1/123456 step 2.5" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=2.5,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 2.5)
  assert_eq(copy.interval_value(), 2.5)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.123456"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.123459"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([-719161.9999985711, -719161.9999985711]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.123459"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.123456"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([-719161.9999985711, -719161.9999985711]),
  )
  assert_eq(adapter.tick_values(-719161.9999985711, -719161.9999985711), [
    -719161.9999985711, -719161.9999985711,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-5.787037037037037e-11, 5.787037037037037e-11),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-5.787037037037037e-11, 5.787037037037037e-11),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.99999999994213, 12.00000010005787),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.99999999994213, 12.00000010005787),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 17 year/micro grid 1/123456 step 7.0" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=7.0,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 7.0)
  assert_eq(copy.interval_value(), 7.0)
  assert_eq(copy.interval(), 7)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.123456"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.123459"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([-719161.9999985711, -719161.9999985711]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.123459"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.123456"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([-719161.9999985711, -719161.9999985711]),
  )
  assert_eq(adapter.tick_values(-719161.9999985711, -719161.9999985711), [
    -719161.9999985711, -719161.9999985711,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-1.6203703703703702e-10, 1.6203703703703702e-10),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-1.6203703703703702e-10, 1.6203703703703702e-10),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999837963, 12.000000100162037),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999837963, 12.000000100162037),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 18 year/micro grid 1/999995 step 0.1" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=0.1,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 0.1)
  assert_eq(copy.interval_value(), 0.1)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.999995"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.999998"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      -719161.999988426, -719161.999988426, -719161.999988426, -719161.999988426,
      -719161.999988426, -719161.999988426, -719161.999988426, -719161.999988426,
      -719161.999988426, -719161.999988426, -719161.999988426, -719161.999988426,
      -719161.999988426, -719161.999988426, -719161.999988426, -719161.999988426,
      -719161.999988426, -719161.999988426, -719161.999988426, -719161.999988426,
      -719161.999988426, -719161.999988426, -719161.999988426, -719161.999988426,
      -719161.999988426, -719161.999988426, -719161.999988426, -719161.999988426,
      -719161.999988426, -719161.999988426, -719161.999988426, -719161.999988426,
      -719161.999988426, -719161.999988426, -719161.999988426, -719161.999988426,
      -719161.999988426, -719161.999988426, -719161.999988426, -719161.999988426,
      -719161.999988426, -719161.999988426, -719161.999988426, -719161.999988426,
      -719161.999988426, -719161.999988426, -719161.999988426, -719161.999988426,
      -719161.999988426, -719161.999988426, -719161.999988426, -719161.999988426,
      -719161.9999884259, -719161.9999884259, -719161.9999884259, -719161.9999884259,
      -719161.9999884259, -719161.9999884259, -719161.9999884259, -719161.9999884259,
      -719161.9999884259, -719161.9999884259, -719161.9999884259, -719161.9999884259,
      -719161.9999884259, -719161.9999884259, -719161.9999884259, -719161.9999884259,
      -719161.9999884259, -719161.9999884259, -719161.9999884259, -719161.9999884259,
      -719161.9999884259, -719161.9999884259, -719161.9999884259, -719161.9999884259,
      -719161.9999884259, -719161.9999884259, -719161.9999884259, -719161.9999884259,
      -719161.9999884259, -719161.9999884259, -719161.9999884259, -719161.9999884259,
      -719161.9999884259, -719161.9999884259, -719161.9999884259, -719161.9999884259,
      -719161.9999884259, -719161.9999884259, -719161.9999884259, -719161.9999884259,
      -719161.9999884259, -719161.9999884259, -719161.9999884259, -719161.9999884259,
      -719161.9999884259, -719161.9999884259, -719161.9999884259, -719161.9999884259,
      -719161.9999884259, -719161.9999884259, -719161.9999884259,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.999998"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.999995"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      -719161.999988426, -719161.999988426, -719161.999988426, -719161.999988426,
      -719161.999988426, -719161.999988426, -719161.999988426, -719161.999988426,
      -719161.999988426, -719161.999988426, -719161.999988426, -719161.999988426,
      -719161.999988426, -719161.999988426, -719161.999988426, -719161.999988426,
      -719161.999988426, -719161.999988426, -719161.999988426, -719161.999988426,
      -719161.999988426, -719161.999988426, -719161.999988426, -719161.999988426,
      -719161.999988426, -719161.999988426, -719161.999988426, -719161.999988426,
      -719161.999988426, -719161.999988426, -719161.999988426, -719161.999988426,
      -719161.999988426, -719161.999988426, -719161.999988426, -719161.999988426,
      -719161.999988426, -719161.999988426, -719161.999988426, -719161.999988426,
      -719161.999988426, -719161.999988426, -719161.999988426, -719161.999988426,
      -719161.999988426, -719161.999988426, -719161.999988426, -719161.999988426,
      -719161.999988426, -719161.999988426, -719161.999988426, -719161.999988426,
      -719161.9999884259, -719161.9999884259, -719161.9999884259, -719161.9999884259,
      -719161.9999884259, -719161.9999884259, -719161.9999884259, -719161.9999884259,
      -719161.9999884259, -719161.9999884259, -719161.9999884259, -719161.9999884259,
      -719161.9999884259, -719161.9999884259, -719161.9999884259, -719161.9999884259,
      -719161.9999884259, -719161.9999884259, -719161.9999884259, -719161.9999884259,
      -719161.9999884259, -719161.9999884259, -719161.9999884259, -719161.9999884259,
      -719161.9999884259, -719161.9999884259, -719161.9999884259, -719161.9999884259,
      -719161.9999884259, -719161.9999884259, -719161.9999884259, -719161.9999884259,
      -719161.9999884259, -719161.9999884259, -719161.9999884259, -719161.9999884259,
      -719161.9999884259, -719161.9999884259, -719161.9999884259, -719161.9999884259,
      -719161.9999884259, -719161.9999884259, -719161.9999884259, -719161.9999884259,
      -719161.9999884259, -719161.9999884259, -719161.9999884259, -719161.9999884259,
      -719161.9999884259, -719161.9999884259, -719161.9999884259,
    ]),
  )
  assert_eq(adapter.tick_values(-719161.999988426, -719161.9999884259), [
    -719161.9999884259, -719161.9999884259,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-12, 2.3148148148148147e-12),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-12, 2.3148148148148147e-12),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999997685, 12.000000100002314),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999997685, 12.000000100002314),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 19 year/micro grid 1/999995 step 0.25" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=0.25,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 0.25)
  assert_eq(copy.interval_value(), 0.25)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.999995"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.999998"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      -719161.999988426, -719161.999988426, -719161.999988426, -719161.999988426,
      -719161.999988426, -719161.999988426, -719161.999988426, -719161.999988426,
      -719161.999988426, -719161.999988426, -719161.999988426, -719161.999988426,
      -719161.999988426, -719161.999988426, -719161.999988426, -719161.999988426,
      -719161.999988426, -719161.999988426, -719161.999988426, -719161.999988426,
      -719161.999988426, -719161.9999884259, -719161.9999884259, -719161.9999884259,
      -719161.9999884259, -719161.9999884259, -719161.9999884259, -719161.9999884259,
      -719161.9999884259, -719161.9999884259, -719161.9999884259, -719161.9999884259,
      -719161.9999884259, -719161.9999884259, -719161.9999884259, -719161.9999884259,
      -719161.9999884259, -719161.9999884259, -719161.9999884259, -719161.9999884259,
      -719161.9999884259, -719161.9999884259,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.999998"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.999995"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      -719161.999988426, -719161.999988426, -719161.999988426, -719161.999988426,
      -719161.999988426, -719161.999988426, -719161.999988426, -719161.999988426,
      -719161.999988426, -719161.999988426, -719161.999988426, -719161.999988426,
      -719161.999988426, -719161.999988426, -719161.999988426, -719161.999988426,
      -719161.999988426, -719161.999988426, -719161.999988426, -719161.999988426,
      -719161.999988426, -719161.9999884259, -719161.9999884259, -719161.9999884259,
      -719161.9999884259, -719161.9999884259, -719161.9999884259, -719161.9999884259,
      -719161.9999884259, -719161.9999884259, -719161.9999884259, -719161.9999884259,
      -719161.9999884259, -719161.9999884259, -719161.9999884259, -719161.9999884259,
      -719161.9999884259, -719161.9999884259, -719161.9999884259, -719161.9999884259,
      -719161.9999884259, -719161.9999884259,
    ]),
  )
  assert_eq(adapter.tick_values(-719161.999988426, -719161.9999884259), [
    -719161.9999884259, -719161.9999884259,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-5.787037037037037e-12, 5.787037037037037e-12),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-5.787037037037037e-12, 5.787037037037037e-12),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999994213, 12.000000100005787),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999994213, 12.000000100005787),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 20 year/micro grid 1/999995 step 0.5" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=0.5,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 0.5)
  assert_eq(copy.interval_value(), 0.5)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.999995"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.999998"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      -719161.999988426, -719161.999988426, -719161.999988426, -719161.999988426,
      -719161.999988426, -719161.999988426, -719161.999988426, -719161.999988426,
      -719161.999988426, -719161.999988426, -719161.999988426, -719161.9999884259,
      -719161.9999884259, -719161.9999884259, -719161.9999884259, -719161.9999884259,
      -719161.9999884259, -719161.9999884259, -719161.9999884259, -719161.9999884259,
      -719161.9999884259, -719161.9999884259,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.999998"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.999995"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      -719161.999988426, -719161.999988426, -719161.999988426, -719161.999988426,
      -719161.999988426, -719161.999988426, -719161.999988426, -719161.999988426,
      -719161.999988426, -719161.999988426, -719161.999988426, -719161.9999884259,
      -719161.9999884259, -719161.9999884259, -719161.9999884259, -719161.9999884259,
      -719161.9999884259, -719161.9999884259, -719161.9999884259, -719161.9999884259,
      -719161.9999884259, -719161.9999884259,
    ]),
  )
  assert_eq(adapter.tick_values(-719161.999988426, -719161.9999884259), [
    -719161.9999884259, -719161.9999884259,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-1.1574074074074074e-11, 1.1574074074074074e-11),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-1.1574074074074074e-11, 1.1574074074074074e-11),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999988425, 12.000000100011574),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999988425, 12.000000100011574),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 21 year/micro grid 1/999995 step 1.0" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=1.0,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 1.0)
  assert_eq(copy.interval_value(), 1.0)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.999995"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.999998"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      -719161.999988426, -719161.999988426, -719161.999988426, -719161.999988426,
      -719161.999988426, -719161.999988426, -719161.9999884259, -719161.9999884259,
      -719161.9999884259, -719161.9999884259, -719161.9999884259, -719161.9999884259,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.999998"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.999995"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      -719161.999988426, -719161.999988426, -719161.999988426, -719161.999988426,
      -719161.999988426, -719161.999988426, -719161.9999884259, -719161.9999884259,
      -719161.9999884259, -719161.9999884259, -719161.9999884259, -719161.9999884259,
    ]),
  )
  assert_eq(adapter.tick_values(-719161.999988426, -719161.9999884259), [
    -719161.9999884259, -719161.9999884259,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-11, 2.3148148148148147e-11),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-11, 2.3148148148148147e-11),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999976852, 12.000000100023147),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999976852, 12.000000100023147),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 22 year/micro grid 1/999995 step 2.5" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=2.5,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 2.5)
  assert_eq(copy.interval_value(), 2.5)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.999995"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.999998"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      -719161.999988426, -719161.999988426, -719161.999988426, -719161.9999884259,
      -719161.9999884259, -719161.9999884259,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.999998"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.999995"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      -719161.999988426, -719161.999988426, -719161.999988426, -719161.9999884259,
      -719161.9999884259, -719161.9999884259,
    ]),
  )
  assert_eq(adapter.tick_values(-719161.999988426, -719161.9999884259), [
    -719161.9999884259, -719161.9999884259,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-5.787037037037037e-11, 5.787037037037037e-11),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-5.787037037037037e-11, 5.787037037037037e-11),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.99999999994213, 12.00000010005787),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.99999999994213, 12.00000010005787),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 23 year/micro grid 1/999995 step 7.0" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=7.0,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 7.0)
  assert_eq(copy.interval_value(), 7.0)
  assert_eq(copy.interval(), 7)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.999995"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.999998"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([-719161.999988426, -719161.999988426, -719161.9999884259]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.999998"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("0001-01-01T00:00:00.999995"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([-719161.999988426, -719161.999988426, -719161.9999884259]),
  )
  assert_eq(adapter.tick_values(-719161.999988426, -719161.9999884259), [
    -719161.999988426, -719161.9999884259,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-1.6203703703703702e-10, 1.6203703703703702e-10),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-1.6203703703703702e-10, 1.6203703703703702e-10),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999837963, 12.000000100162037),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999837963, 12.000000100162037),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 24 year/micro grid 1970/0 step 0.1" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=0.1,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 0.1)
  assert_eq(copy.interval_value(), 0.1)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("1970-01-01T00:00:00")),
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.000003"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      -1.1574074074074076e-12, 0.0, 1.1574074074074076e-12, 2.314814814814815e-12,
      3.472222222222223e-12, 4.62962962962963e-12, 5.7870370370370384e-12, 6.944444444444446e-12,
      8.101851851851853e-12, 9.25925925925926e-12, 1.0416666666666666e-11, 1.1574074074074074e-11,
      1.2731481481481483e-11, 1.3888888888888888e-11, 1.5046296296296296e-11, 1.6203703703703703e-11,
      1.736111111111111e-11, 1.851851851851852e-11, 1.9675925925925925e-11, 2.0833333333333332e-11,
      2.199074074074074e-11, 2.3148148148148147e-11, 2.4305555555555558e-11, 2.5462962962962965e-11,
      2.6620370370370373e-11, 2.7777777777777777e-11, 2.8935185185185184e-11, 3.009259259259259e-11,
      3.125e-11, 3.240740740740741e-11, 3.3564814814814817e-11, 3.472222222222222e-11,
      3.587962962962963e-11,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.000003"),
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("1970-01-01T00:00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([
      -1.1574074074074076e-12, 0.0, 1.1574074074074076e-12, 2.314814814814815e-12,
      3.472222222222223e-12, 4.62962962962963e-12, 5.7870370370370384e-12, 6.944444444444446e-12,
      8.101851851851853e-12, 9.25925925925926e-12, 1.0416666666666666e-11, 1.1574074074074074e-11,
      1.2731481481481483e-11, 1.3888888888888888e-11, 1.5046296296296296e-11, 1.6203703703703703e-11,
      1.736111111111111e-11, 1.851851851851852e-11, 1.9675925925925925e-11, 2.0833333333333332e-11,
      2.199074074074074e-11, 2.3148148148148147e-11, 2.4305555555555558e-11, 2.5462962962962965e-11,
      2.6620370370370373e-11, 2.7777777777777777e-11, 2.8935185185185184e-11, 3.009259259259259e-11,
      3.125e-11, 3.240740740740741e-11, 3.3564814814814817e-11, 3.472222222222222e-11,
      3.587962962962963e-11,
    ]),
  )
  assert_eq(adapter.tick_values(0.0, 3.472222222222222e-11), [
    -1.1574074074074076e-12, 0.0, 1.1574074074074076e-12, 2.314814814814815e-12,
    3.472222222222223e-12, 4.62962962962963e-12, 5.7870370370370384e-12, 6.944444444444446e-12,
    8.101851851851853e-12, 9.25925925925926e-12, 1.0416666666666666e-11, 1.1574074074074074e-11,
    1.2731481481481483e-11, 1.3888888888888888e-11, 1.5046296296296296e-11, 1.6203703703703703e-11,
    1.736111111111111e-11, 1.851851851851852e-11, 1.9675925925925925e-11, 2.0833333333333332e-11,
    2.199074074074074e-11, 2.3148148148148147e-11, 2.4305555555555558e-11, 2.5462962962962965e-11,
    2.6620370370370373e-11, 2.7777777777777777e-11, 2.8935185185185184e-11, 3.009259259259259e-11,
    3.125e-11, 3.240740740740741e-11, 3.3564814814814817e-11, 3.472222222222222e-11,
    3.587962962962963e-11,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-12, 2.3148148148148147e-12),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-12, 2.3148148148148147e-12),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999997685, 12.000000100002314),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999997685, 12.000000100002314),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 25 year/micro grid 1970/0 step 0.25" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=0.25,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 0.25)
  assert_eq(copy.interval_value(), 0.25)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("1970-01-01T00:00:00")),
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.000003"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      -2.8935185185185184e-12, 0.0, 2.8935185185185184e-12, 5.787037037037037e-12,
      8.680555555555555e-12, 1.1574074074074074e-11, 1.4467592592592592e-11, 1.736111111111111e-11,
      2.025462962962963e-11, 2.3148148148148147e-11, 2.6041666666666667e-11, 2.8935185185185184e-11,
      3.18287037037037e-11, 3.472222222222222e-11, 3.761574074074074e-11,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.000003"),
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("1970-01-01T00:00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([
      -2.8935185185185184e-12, 0.0, 2.8935185185185184e-12, 5.787037037037037e-12,
      8.680555555555555e-12, 1.1574074074074074e-11, 1.4467592592592592e-11, 1.736111111111111e-11,
      2.025462962962963e-11, 2.3148148148148147e-11, 2.6041666666666667e-11, 2.8935185185185184e-11,
      3.18287037037037e-11, 3.472222222222222e-11, 3.761574074074074e-11,
    ]),
  )
  assert_eq(adapter.tick_values(0.0, 3.472222222222222e-11), [
    -2.8935185185185184e-12, 0.0, 2.8935185185185184e-12, 5.787037037037037e-12,
    8.680555555555555e-12, 1.1574074074074074e-11, 1.4467592592592592e-11, 1.736111111111111e-11,
    2.025462962962963e-11, 2.3148148148148147e-11, 2.6041666666666667e-11, 2.8935185185185184e-11,
    3.18287037037037e-11, 3.472222222222222e-11, 3.761574074074074e-11,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-5.787037037037037e-12, 5.787037037037037e-12),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-5.787037037037037e-12, 5.787037037037037e-12),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999994213, 12.000000100005787),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999994213, 12.000000100005787),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 26 year/micro grid 1970/0 step 0.5" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=0.5,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 0.5)
  assert_eq(copy.interval_value(), 0.5)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("1970-01-01T00:00:00")),
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.000003"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      -5.787037037037037e-12, 0.0, 5.787037037037037e-12, 1.1574074074074074e-11,
      1.736111111111111e-11, 2.3148148148148147e-11, 2.8935185185185184e-11, 3.472222222222222e-11,
      4.050925925925926e-11,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.000003"),
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("1970-01-01T00:00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([
      -5.787037037037037e-12, 0.0, 5.787037037037037e-12, 1.1574074074074074e-11,
      1.736111111111111e-11, 2.3148148148148147e-11, 2.8935185185185184e-11, 3.472222222222222e-11,
      4.050925925925926e-11,
    ]),
  )
  assert_eq(adapter.tick_values(0.0, 3.472222222222222e-11), [
    -5.787037037037037e-12, 0.0, 5.787037037037037e-12, 1.1574074074074074e-11, 1.736111111111111e-11,
    2.3148148148148147e-11, 2.8935185185185184e-11, 3.472222222222222e-11, 4.050925925925926e-11,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-1.1574074074074074e-11, 1.1574074074074074e-11),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-1.1574074074074074e-11, 1.1574074074074074e-11),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999988425, 12.000000100011574),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999988425, 12.000000100011574),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 27 year/micro grid 1970/0 step 1.0" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=1.0,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 1.0)
  assert_eq(copy.interval_value(), 1.0)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("1970-01-01T00:00:00")),
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.000003"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      -1.1574074074074074e-11, 0.0, 1.1574074074074074e-11, 2.3148148148148147e-11,
      3.472222222222222e-11, 4.6296296296296294e-11,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.000003"),
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("1970-01-01T00:00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([
      -1.1574074074074074e-11, 0.0, 1.1574074074074074e-11, 2.3148148148148147e-11,
      3.472222222222222e-11, 4.6296296296296294e-11,
    ]),
  )
  assert_eq(adapter.tick_values(0.0, 3.472222222222222e-11), [
    -1.1574074074074074e-11, 0.0, 1.1574074074074074e-11, 2.3148148148148147e-11,
    3.472222222222222e-11, 4.6296296296296294e-11,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-11, 2.3148148148148147e-11),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-11, 2.3148148148148147e-11),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999976852, 12.000000100023147),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999976852, 12.000000100023147),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 28 year/micro grid 1970/0 step 2.5" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=2.5,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 2.5)
  assert_eq(copy.interval_value(), 2.5)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("1970-01-01T00:00:00")),
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.000003"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      -2.8935185185185184e-11, 0.0, 2.8935185185185184e-11, 5.787037037037037e-11,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.000003"),
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("1970-01-01T00:00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([
      -2.8935185185185184e-11, 0.0, 2.8935185185185184e-11, 5.787037037037037e-11,
    ]),
  )
  assert_eq(adapter.tick_values(0.0, 3.472222222222222e-11), [
    -2.8935185185185184e-11, 0.0, 2.8935185185185184e-11, 5.787037037037037e-11,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-5.787037037037037e-11, 5.787037037037037e-11),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-5.787037037037037e-11, 5.787037037037037e-11),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.99999999994213, 12.00000010005787),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.99999999994213, 12.00000010005787),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 29 year/micro grid 1970/0 step 7.0" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=7.0,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 7.0)
  assert_eq(copy.interval_value(), 7.0)
  assert_eq(copy.interval(), 7)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("1970-01-01T00:00:00")),
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.000003"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([-8.101851851851852e-11, 0.0, 8.101851851851852e-11]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.000003"),
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("1970-01-01T00:00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([-8.101851851851852e-11, 0.0, 8.101851851851852e-11]),
  )
  assert_eq(adapter.tick_values(0.0, 3.472222222222222e-11), [
    -8.101851851851852e-11, 0.0, 8.101851851851852e-11,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-1.6203703703703702e-10, 1.6203703703703702e-10),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-1.6203703703703702e-10, 1.6203703703703702e-10),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999837963, 12.000000100162037),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999837963, 12.000000100162037),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 30 year/micro grid 1970/1 step 0.1" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=0.1,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 0.1)
  assert_eq(copy.interval_value(), 0.1)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.000001"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.000004"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      1.0416666666666666e-11, 1.1574074074074074e-11, 1.2731481481481483e-11, 1.3888888888888892e-11,
      1.5046296296296296e-11, 1.6203703703703703e-11, 1.736111111111111e-11, 1.851851851851852e-11,
      1.9675925925925928e-11, 2.0833333333333332e-11, 2.199074074074074e-11, 2.3148148148148147e-11,
      2.4305555555555558e-11, 2.5462962962962965e-11, 2.6620370370370373e-11, 2.7777777777777777e-11,
      2.8935185185185184e-11, 3.009259259259259e-11, 3.125e-11, 3.240740740740741e-11,
      3.3564814814814817e-11, 3.472222222222222e-11, 3.587962962962963e-11, 3.703703703703704e-11,
      3.8194444444444446e-11, 3.935185185185185e-11, 4.050925925925926e-11, 4.1666666666666665e-11,
      4.2824074074074076e-11, 4.3981481481481486e-11, 4.513888888888889e-11, 4.6296296296296294e-11,
      4.745370370370371e-11,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.000004"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.000001"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      1.0416666666666666e-11, 1.1574074074074074e-11, 1.2731481481481483e-11, 1.3888888888888892e-11,
      1.5046296296296296e-11, 1.6203703703703703e-11, 1.736111111111111e-11, 1.851851851851852e-11,
      1.9675925925925928e-11, 2.0833333333333332e-11, 2.199074074074074e-11, 2.3148148148148147e-11,
      2.4305555555555558e-11, 2.5462962962962965e-11, 2.6620370370370373e-11, 2.7777777777777777e-11,
      2.8935185185185184e-11, 3.009259259259259e-11, 3.125e-11, 3.240740740740741e-11,
      3.3564814814814817e-11, 3.472222222222222e-11, 3.587962962962963e-11, 3.703703703703704e-11,
      3.8194444444444446e-11, 3.935185185185185e-11, 4.050925925925926e-11, 4.1666666666666665e-11,
      4.2824074074074076e-11, 4.3981481481481486e-11, 4.513888888888889e-11, 4.6296296296296294e-11,
      4.745370370370371e-11,
    ]),
  )
  assert_eq(
    adapter.tick_values(1.1574074074074074e-11, 4.6296296296296294e-11),
    [
      1.0416666666666666e-11, 1.1574074074074074e-11, 1.2731481481481483e-11, 1.3888888888888892e-11,
      1.5046296296296296e-11, 1.6203703703703703e-11, 1.736111111111111e-11, 1.851851851851852e-11,
      1.9675925925925928e-11, 2.0833333333333332e-11, 2.199074074074074e-11, 2.3148148148148147e-11,
      2.4305555555555558e-11, 2.5462962962962965e-11, 2.6620370370370373e-11, 2.7777777777777777e-11,
      2.8935185185185184e-11, 3.009259259259259e-11, 3.125e-11, 3.240740740740741e-11,
      3.3564814814814817e-11, 3.472222222222222e-11, 3.587962962962963e-11, 3.703703703703704e-11,
      3.8194444444444446e-11, 3.935185185185185e-11, 4.050925925925926e-11, 4.1666666666666665e-11,
      4.2824074074074076e-11, 4.3981481481481486e-11, 4.513888888888889e-11, 4.6296296296296294e-11,
      4.745370370370371e-11,
    ],
  )
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-12, 2.3148148148148147e-12),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-12, 2.3148148148148147e-12),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999997685, 12.000000100002314),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999997685, 12.000000100002314),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 31 year/micro grid 1970/1 step 0.25" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=0.25,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 0.25)
  assert_eq(copy.interval_value(), 0.25)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.000001"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.000004"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      8.680555555555555e-12, 1.1574074074074074e-11, 1.4467592592592592e-11, 1.736111111111111e-11,
      2.025462962962963e-11, 2.3148148148148147e-11, 2.6041666666666667e-11, 2.8935185185185184e-11,
      3.18287037037037e-11, 3.472222222222222e-11, 3.761574074074074e-11, 4.050925925925926e-11,
      4.340277777777778e-11, 4.6296296296296294e-11, 4.9189814814814814e-11,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.000004"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.000001"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      8.680555555555555e-12, 1.1574074074074074e-11, 1.4467592592592592e-11, 1.736111111111111e-11,
      2.025462962962963e-11, 2.3148148148148147e-11, 2.6041666666666667e-11, 2.8935185185185184e-11,
      3.18287037037037e-11, 3.472222222222222e-11, 3.761574074074074e-11, 4.050925925925926e-11,
      4.340277777777778e-11, 4.6296296296296294e-11, 4.9189814814814814e-11,
    ]),
  )
  assert_eq(
    adapter.tick_values(1.1574074074074074e-11, 4.6296296296296294e-11),
    [
      8.680555555555555e-12, 1.1574074074074074e-11, 1.4467592592592592e-11, 1.736111111111111e-11,
      2.025462962962963e-11, 2.3148148148148147e-11, 2.6041666666666667e-11, 2.8935185185185184e-11,
      3.18287037037037e-11, 3.472222222222222e-11, 3.761574074074074e-11, 4.050925925925926e-11,
      4.340277777777778e-11, 4.6296296296296294e-11, 4.9189814814814814e-11,
    ],
  )
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-5.787037037037037e-12, 5.787037037037037e-12),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-5.787037037037037e-12, 5.787037037037037e-12),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999994213, 12.000000100005787),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999994213, 12.000000100005787),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 32 year/micro grid 1970/1 step 0.5" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=0.5,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 0.5)
  assert_eq(copy.interval_value(), 0.5)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.000001"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.000004"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      5.787037037037037e-12, 1.1574074074074074e-11, 1.736111111111111e-11, 2.3148148148148147e-11,
      2.8935185185185184e-11, 3.472222222222222e-11, 4.050925925925926e-11, 4.6296296296296294e-11,
      5.2083333333333334e-11,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.000004"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.000001"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      5.787037037037037e-12, 1.1574074074074074e-11, 1.736111111111111e-11, 2.3148148148148147e-11,
      2.8935185185185184e-11, 3.472222222222222e-11, 4.050925925925926e-11, 4.6296296296296294e-11,
      5.2083333333333334e-11,
    ]),
  )
  assert_eq(
    adapter.tick_values(1.1574074074074074e-11, 4.6296296296296294e-11),
    [
      5.787037037037037e-12, 1.1574074074074074e-11, 1.736111111111111e-11, 2.3148148148148147e-11,
      2.8935185185185184e-11, 3.472222222222222e-11, 4.050925925925926e-11, 4.6296296296296294e-11,
      5.2083333333333334e-11,
    ],
  )
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-1.1574074074074074e-11, 1.1574074074074074e-11),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-1.1574074074074074e-11, 1.1574074074074074e-11),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999988425, 12.000000100011574),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999988425, 12.000000100011574),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 33 year/micro grid 1970/1 step 1.0" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=1.0,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 1.0)
  assert_eq(copy.interval_value(), 1.0)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.000001"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.000004"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      0.0, 1.1574074074074074e-11, 2.3148148148148147e-11, 3.472222222222222e-11,
      4.6296296296296294e-11, 5.787037037037037e-11,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.000004"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.000001"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      0.0, 1.1574074074074074e-11, 2.3148148148148147e-11, 3.472222222222222e-11,
      4.6296296296296294e-11, 5.787037037037037e-11,
    ]),
  )
  assert_eq(
    adapter.tick_values(1.1574074074074074e-11, 4.6296296296296294e-11),
    [
      0.0, 1.1574074074074074e-11, 2.3148148148148147e-11, 3.472222222222222e-11,
      4.6296296296296294e-11, 5.787037037037037e-11,
    ],
  )
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-11, 2.3148148148148147e-11),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-11, 2.3148148148148147e-11),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999976852, 12.000000100023147),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999976852, 12.000000100023147),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 34 year/micro grid 1970/1 step 2.5" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=2.5,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 2.5)
  assert_eq(copy.interval_value(), 2.5)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.000001"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.000004"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([0.0, 2.8935185185185184e-11, 5.787037037037037e-11]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.000004"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.000001"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([0.0, 2.8935185185185184e-11, 5.787037037037037e-11]),
  )
  assert_eq(
    adapter.tick_values(1.1574074074074074e-11, 4.6296296296296294e-11),
    [0.0, 2.8935185185185184e-11, 5.787037037037037e-11],
  )
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-5.787037037037037e-11, 5.787037037037037e-11),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-5.787037037037037e-11, 5.787037037037037e-11),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.99999999994213, 12.00000010005787),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.99999999994213, 12.00000010005787),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 35 year/micro grid 1970/1 step 7.0" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=7.0,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 7.0)
  assert_eq(copy.interval_value(), 7.0)
  assert_eq(copy.interval(), 7)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.000001"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.000004"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([0.0, 8.101851851851852e-11]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.000004"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.000001"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([0.0, 8.101851851851852e-11]),
  )
  assert_eq(
    adapter.tick_values(1.1574074074074074e-11, 4.6296296296296294e-11),
    [0.0, 8.101851851851852e-11],
  )
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-1.6203703703703702e-10, 1.6203703703703702e-10),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-1.6203703703703702e-10, 1.6203703703703702e-10),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999837963, 12.000000100162037),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999837963, 12.000000100162037),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 36 year/micro grid 1970/123456 step 0.1" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=0.1,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 0.1)
  assert_eq(copy.interval_value(), 0.1)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.123456"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.123459"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      1.4288877314814813e-06, 1.4288888888888888e-06, 1.4288900462962962e-06, 1.4288912037037037e-06,
      1.428892361111111e-06, 1.4288935185185184e-06, 1.4288946759259259e-06, 1.4288958333333333e-06,
      1.4288969907407408e-06, 1.428898148148148e-06, 1.4288993055555555e-06, 1.428900462962963e-06,
      1.4289016203703702e-06, 1.4289027777777778e-06, 1.428903935185185e-06, 1.4289050925925925e-06,
      1.42890625e-06, 1.4289074074074072e-06, 1.4289085648148147e-06, 1.4289097222222222e-06,
      1.4289108796296296e-06, 1.428912037037037e-06, 1.4289131944444443e-06, 1.4289143518518518e-06,
      1.428915509259259e-06, 1.4289166666666667e-06, 1.4289178240740742e-06, 1.4289189814814814e-06,
      1.4289201388888889e-06, 1.428921296296296e-06, 1.4289224537037036e-06, 1.428923611111111e-06,
      1.4289247685185185e-06,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.123459"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.123456"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      1.4288877314814813e-06, 1.4288888888888888e-06, 1.4288900462962962e-06, 1.4288912037037037e-06,
      1.428892361111111e-06, 1.4288935185185184e-06, 1.4288946759259259e-06, 1.4288958333333333e-06,
      1.4288969907407408e-06, 1.428898148148148e-06, 1.4288993055555555e-06, 1.428900462962963e-06,
      1.4289016203703702e-06, 1.4289027777777778e-06, 1.428903935185185e-06, 1.4289050925925925e-06,
      1.42890625e-06, 1.4289074074074072e-06, 1.4289085648148147e-06, 1.4289097222222222e-06,
      1.4289108796296296e-06, 1.428912037037037e-06, 1.4289131944444443e-06, 1.4289143518518518e-06,
      1.428915509259259e-06, 1.4289166666666667e-06, 1.4289178240740742e-06, 1.4289189814814814e-06,
      1.4289201388888889e-06, 1.428921296296296e-06, 1.4289224537037036e-06, 1.428923611111111e-06,
      1.4289247685185185e-06,
    ]),
  )
  assert_eq(
    adapter.tick_values(1.4288888888888888e-06, 1.428923611111111e-06),
    [
      1.4288877314814813e-06, 1.4288888888888888e-06, 1.4288900462962962e-06, 1.4288912037037037e-06,
      1.428892361111111e-06, 1.4288935185185184e-06, 1.4288946759259259e-06, 1.4288958333333333e-06,
      1.4288969907407408e-06, 1.428898148148148e-06, 1.4288993055555555e-06, 1.428900462962963e-06,
      1.4289016203703702e-06, 1.4289027777777778e-06, 1.428903935185185e-06, 1.4289050925925925e-06,
      1.42890625e-06, 1.4289074074074072e-06, 1.4289085648148147e-06, 1.4289097222222222e-06,
      1.4289108796296296e-06, 1.428912037037037e-06, 1.4289131944444443e-06, 1.4289143518518518e-06,
      1.428915509259259e-06, 1.4289166666666667e-06, 1.4289178240740742e-06, 1.4289189814814814e-06,
      1.4289201388888889e-06, 1.428921296296296e-06, 1.4289224537037036e-06, 1.428923611111111e-06,
      1.4289247685185185e-06,
    ],
  )
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-12, 2.3148148148148147e-12),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-12, 2.3148148148148147e-12),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999997685, 12.000000100002314),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999997685, 12.000000100002314),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 37 year/micro grid 1970/123456 step 0.25" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=0.25,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 0.25)
  assert_eq(copy.interval_value(), 0.25)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.123456"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.123459"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      1.4288859953703704e-06, 1.4288888888888888e-06, 1.4288917824074074e-06, 1.4288946759259259e-06,
      1.4288975694444445e-06, 1.428900462962963e-06, 1.4289033564814816e-06, 1.42890625e-06,
      1.4289091435185184e-06, 1.428912037037037e-06, 1.4289149305555555e-06, 1.4289178240740742e-06,
      1.4289207175925926e-06, 1.428923611111111e-06, 1.4289265046296297e-06,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.123459"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.123456"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      1.4288859953703704e-06, 1.4288888888888888e-06, 1.4288917824074074e-06, 1.4288946759259259e-06,
      1.4288975694444445e-06, 1.428900462962963e-06, 1.4289033564814816e-06, 1.42890625e-06,
      1.4289091435185184e-06, 1.428912037037037e-06, 1.4289149305555555e-06, 1.4289178240740742e-06,
      1.4289207175925926e-06, 1.428923611111111e-06, 1.4289265046296297e-06,
    ]),
  )
  assert_eq(
    adapter.tick_values(1.4288888888888888e-06, 1.428923611111111e-06),
    [
      1.4288859953703704e-06, 1.4288888888888888e-06, 1.4288917824074074e-06, 1.4288946759259259e-06,
      1.4288975694444445e-06, 1.428900462962963e-06, 1.4289033564814816e-06, 1.42890625e-06,
      1.4289091435185184e-06, 1.428912037037037e-06, 1.4289149305555555e-06, 1.4289178240740742e-06,
      1.4289207175925926e-06, 1.428923611111111e-06, 1.4289265046296297e-06,
    ],
  )
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-5.787037037037037e-12, 5.787037037037037e-12),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-5.787037037037037e-12, 5.787037037037037e-12),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999994213, 12.000000100005787),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999994213, 12.000000100005787),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 38 year/micro grid 1970/123456 step 0.5" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=0.5,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 0.5)
  assert_eq(copy.interval_value(), 0.5)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.123456"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.123459"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      1.428883101851852e-06, 1.4288888888888888e-06, 1.4288946759259259e-06, 1.428900462962963e-06,
      1.42890625e-06, 1.428912037037037e-06, 1.4289178240740742e-06, 1.428923611111111e-06,
      1.428929398148148e-06,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.123459"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.123456"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      1.428883101851852e-06, 1.4288888888888888e-06, 1.4288946759259259e-06, 1.428900462962963e-06,
      1.42890625e-06, 1.428912037037037e-06, 1.4289178240740742e-06, 1.428923611111111e-06,
      1.428929398148148e-06,
    ]),
  )
  assert_eq(
    adapter.tick_values(1.4288888888888888e-06, 1.428923611111111e-06),
    [
      1.428883101851852e-06, 1.4288888888888888e-06, 1.4288946759259259e-06, 1.428900462962963e-06,
      1.42890625e-06, 1.428912037037037e-06, 1.4289178240740742e-06, 1.428923611111111e-06,
      1.428929398148148e-06,
    ],
  )
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-1.1574074074074074e-11, 1.1574074074074074e-11),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-1.1574074074074074e-11, 1.1574074074074074e-11),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999988425, 12.000000100011574),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999988425, 12.000000100011574),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 39 year/micro grid 1970/123456 step 1.0" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=1.0,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 1.0)
  assert_eq(copy.interval_value(), 1.0)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.123456"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.123459"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      1.4288773148148148e-06, 1.4288888888888888e-06, 1.428900462962963e-06, 1.428912037037037e-06,
      1.428923611111111e-06, 1.4289351851851852e-06,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.123459"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.123456"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      1.4288773148148148e-06, 1.4288888888888888e-06, 1.428900462962963e-06, 1.428912037037037e-06,
      1.428923611111111e-06, 1.4289351851851852e-06,
    ]),
  )
  assert_eq(
    adapter.tick_values(1.4288888888888888e-06, 1.428923611111111e-06),
    [
      1.4288773148148148e-06, 1.4288888888888888e-06, 1.428900462962963e-06, 1.428912037037037e-06,
      1.428923611111111e-06, 1.4289351851851852e-06,
    ],
  )
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-11, 2.3148148148148147e-11),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-11, 2.3148148148148147e-11),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999976852, 12.000000100023147),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999976852, 12.000000100023147),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 40 year/micro grid 1970/123456 step 2.5" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=2.5,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 2.5)
  assert_eq(copy.interval_value(), 2.5)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.123456"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.123459"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([1.4288773148148148e-06, 1.42890625e-06, 1.4289351851851852e-06]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.123459"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.123456"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([1.4288773148148148e-06, 1.42890625e-06, 1.4289351851851852e-06]),
  )
  assert_eq(
    adapter.tick_values(1.4288888888888888e-06, 1.428923611111111e-06),
    [1.4288773148148148e-06, 1.42890625e-06, 1.4289351851851852e-06],
  )
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-5.787037037037037e-11, 5.787037037037037e-11),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-5.787037037037037e-11, 5.787037037037037e-11),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.99999999994213, 12.00000010005787),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.99999999994213, 12.00000010005787),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 41 year/micro grid 1970/123456 step 7.0" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=7.0,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 7.0)
  assert_eq(copy.interval_value(), 7.0)
  assert_eq(copy.interval(), 7)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.123456"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.123459"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([1.4288425925925926e-06, 1.428923611111111e-06, 1.4290046296296296e-06]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.123459"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.123456"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([1.4288425925925926e-06, 1.428923611111111e-06, 1.4290046296296296e-06]),
  )
  assert_eq(
    adapter.tick_values(1.4288888888888888e-06, 1.428923611111111e-06),
    [1.4288425925925926e-06, 1.428923611111111e-06, 1.4290046296296296e-06],
  )
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-1.6203703703703702e-10, 1.6203703703703702e-10),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-1.6203703703703702e-10, 1.6203703703703702e-10),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999837963, 12.000000100162037),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999837963, 12.000000100162037),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 42 year/micro grid 1970/999995 step 0.1" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=0.1,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 0.1)
  assert_eq(copy.interval_value(), 0.1)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.999995"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.999998"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      1.1574015046296296e-05, 1.1574016203703704e-05, 1.157401736111111e-05, 1.1574018518518519e-05,
      1.1574019675925927e-05, 1.1574020833333334e-05, 1.157402199074074e-05, 1.1574023148148147e-05,
      1.1574024305555557e-05, 1.1574025462962964e-05, 1.157402662037037e-05, 1.1574027777777779e-05,
      1.1574028935185185e-05, 1.1574030092592594e-05, 1.157403125e-05, 1.1574032407407408e-05,
      1.1574033564814815e-05, 1.1574034722222222e-05, 1.157403587962963e-05, 1.1574037037037038e-05,
      1.1574038194444445e-05, 1.1574039351851851e-05, 1.157404050925926e-05, 1.1574041666666668e-05,
      1.1574042824074075e-05, 1.1574043981481481e-05, 1.157404513888889e-05, 1.1574046296296296e-05,
      1.1574047453703705e-05, 1.1574048611111111e-05, 1.157404976851852e-05, 1.1574050925925926e-05,
      1.1574052083333333e-05,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.999998"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.999995"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      1.1574015046296296e-05, 1.1574016203703704e-05, 1.157401736111111e-05, 1.1574018518518519e-05,
      1.1574019675925927e-05, 1.1574020833333334e-05, 1.157402199074074e-05, 1.1574023148148147e-05,
      1.1574024305555557e-05, 1.1574025462962964e-05, 1.157402662037037e-05, 1.1574027777777779e-05,
      1.1574028935185185e-05, 1.1574030092592594e-05, 1.157403125e-05, 1.1574032407407408e-05,
      1.1574033564814815e-05, 1.1574034722222222e-05, 1.157403587962963e-05, 1.1574037037037038e-05,
      1.1574038194444445e-05, 1.1574039351851851e-05, 1.157404050925926e-05, 1.1574041666666668e-05,
      1.1574042824074075e-05, 1.1574043981481481e-05, 1.157404513888889e-05, 1.1574046296296296e-05,
      1.1574047453703705e-05, 1.1574048611111111e-05, 1.157404976851852e-05, 1.1574050925925926e-05,
      1.1574052083333333e-05,
    ]),
  )
  assert_eq(
    adapter.tick_values(1.1574016203703704e-05, 1.1574050925925926e-05),
    [
      1.1574015046296296e-05, 1.1574016203703704e-05, 1.157401736111111e-05, 1.1574018518518519e-05,
      1.1574019675925927e-05, 1.1574020833333334e-05, 1.157402199074074e-05, 1.1574023148148147e-05,
      1.1574024305555557e-05, 1.1574025462962964e-05, 1.157402662037037e-05, 1.1574027777777779e-05,
      1.1574028935185185e-05, 1.1574030092592594e-05, 1.157403125e-05, 1.1574032407407408e-05,
      1.1574033564814815e-05, 1.1574034722222222e-05, 1.157403587962963e-05, 1.1574037037037038e-05,
      1.1574038194444445e-05, 1.1574039351851851e-05, 1.157404050925926e-05, 1.1574041666666668e-05,
      1.1574042824074075e-05, 1.1574043981481481e-05, 1.157404513888889e-05, 1.1574046296296296e-05,
      1.1574047453703705e-05, 1.1574048611111111e-05, 1.157404976851852e-05, 1.1574050925925926e-05,
      1.1574052083333333e-05,
    ],
  )
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-12, 2.3148148148148147e-12),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-12, 2.3148148148148147e-12),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999997685, 12.000000100002314),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999997685, 12.000000100002314),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 43 year/micro grid 1970/999995 step 0.25" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=0.25,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 0.25)
  assert_eq(copy.interval_value(), 0.25)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.999995"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.999998"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      1.1574013310185185e-05, 1.1574016203703704e-05, 1.1574019097222221e-05, 1.157402199074074e-05,
      1.157402488425926e-05, 1.1574027777777779e-05, 1.1574030671296296e-05, 1.1574033564814815e-05,
      1.1574036458333334e-05, 1.1574039351851851e-05, 1.157404224537037e-05, 1.157404513888889e-05,
      1.1574048032407407e-05, 1.1574050925925926e-05, 1.1574053819444445e-05,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.999998"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.999995"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      1.1574013310185185e-05, 1.1574016203703704e-05, 1.1574019097222221e-05, 1.157402199074074e-05,
      1.157402488425926e-05, 1.1574027777777779e-05, 1.1574030671296296e-05, 1.1574033564814815e-05,
      1.1574036458333334e-05, 1.1574039351851851e-05, 1.157404224537037e-05, 1.157404513888889e-05,
      1.1574048032407407e-05, 1.1574050925925926e-05, 1.1574053819444445e-05,
    ]),
  )
  assert_eq(
    adapter.tick_values(1.1574016203703704e-05, 1.1574050925925926e-05),
    [
      1.1574013310185185e-05, 1.1574016203703704e-05, 1.1574019097222221e-05, 1.157402199074074e-05,
      1.157402488425926e-05, 1.1574027777777779e-05, 1.1574030671296296e-05, 1.1574033564814815e-05,
      1.1574036458333334e-05, 1.1574039351851851e-05, 1.157404224537037e-05, 1.157404513888889e-05,
      1.1574048032407407e-05, 1.1574050925925926e-05, 1.1574053819444445e-05,
    ],
  )
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-5.787037037037037e-12, 5.787037037037037e-12),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-5.787037037037037e-12, 5.787037037037037e-12),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999994213, 12.000000100005787),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999994213, 12.000000100005787),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 44 year/micro grid 1970/999995 step 0.5" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=0.5,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 0.5)
  assert_eq(copy.interval_value(), 0.5)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.999995"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.999998"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      1.1574010416666666e-05, 1.1574016203703704e-05, 1.157402199074074e-05, 1.1574027777777779e-05,
      1.1574033564814815e-05, 1.1574039351851851e-05, 1.157404513888889e-05, 1.1574050925925926e-05,
      1.1574056712962962e-05,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.999998"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.999995"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      1.1574010416666666e-05, 1.1574016203703704e-05, 1.157402199074074e-05, 1.1574027777777779e-05,
      1.1574033564814815e-05, 1.1574039351851851e-05, 1.157404513888889e-05, 1.1574050925925926e-05,
      1.1574056712962962e-05,
    ]),
  )
  assert_eq(
    adapter.tick_values(1.1574016203703704e-05, 1.1574050925925926e-05),
    [
      1.1574010416666666e-05, 1.1574016203703704e-05, 1.157402199074074e-05, 1.1574027777777779e-05,
      1.1574033564814815e-05, 1.1574039351851851e-05, 1.157404513888889e-05, 1.1574050925925926e-05,
      1.1574056712962962e-05,
    ],
  )
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-1.1574074074074074e-11, 1.1574074074074074e-11),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-1.1574074074074074e-11, 1.1574074074074074e-11),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999988425, 12.000000100011574),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999988425, 12.000000100011574),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 45 year/micro grid 1970/999995 step 1.0" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=1.0,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 1.0)
  assert_eq(copy.interval_value(), 1.0)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.999995"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.999998"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      1.157400462962963e-05, 1.1574016203703704e-05, 1.1574027777777779e-05, 1.1574039351851851e-05,
      1.1574050925925926e-05, 1.15740625e-05,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.999998"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.999995"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      1.157400462962963e-05, 1.1574016203703704e-05, 1.1574027777777779e-05, 1.1574039351851851e-05,
      1.1574050925925926e-05, 1.15740625e-05,
    ]),
  )
  assert_eq(
    adapter.tick_values(1.1574016203703704e-05, 1.1574050925925926e-05),
    [
      1.157400462962963e-05, 1.1574016203703704e-05, 1.1574027777777779e-05, 1.1574039351851851e-05,
      1.1574050925925926e-05, 1.15740625e-05,
    ],
  )
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-11, 2.3148148148148147e-11),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-11, 2.3148148148148147e-11),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999976852, 12.000000100023147),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999976852, 12.000000100023147),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 46 year/micro grid 1970/999995 step 2.5" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=2.5,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 2.5)
  assert_eq(copy.interval_value(), 2.5)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.999995"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.999998"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      1.1573987268518518e-05, 1.1574016203703704e-05, 1.157404513888889e-05, 1.1574074074074073e-05,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.999998"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.999995"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      1.1573987268518518e-05, 1.1574016203703704e-05, 1.157404513888889e-05, 1.1574074074074073e-05,
    ]),
  )
  assert_eq(
    adapter.tick_values(1.1574016203703704e-05, 1.1574050925925926e-05),
    [
      1.1573987268518518e-05, 1.1574016203703704e-05, 1.157404513888889e-05, 1.1574074074074073e-05,
    ],
  )
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-5.787037037037037e-11, 5.787037037037037e-11),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-5.787037037037037e-11, 5.787037037037037e-11),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.99999999994213, 12.00000010005787),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.99999999994213, 12.00000010005787),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 47 year/micro grid 1970/999995 step 7.0" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=7.0,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 7.0)
  assert_eq(copy.interval_value(), 7.0)
  assert_eq(copy.interval(), 7)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.999995"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.999998"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([1.1573981481481482e-05, 1.15740625e-05]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.999998"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.999995"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([1.1573981481481482e-05, 1.15740625e-05]),
  )
  assert_eq(
    adapter.tick_values(1.1574016203703704e-05, 1.1574050925925926e-05),
    [1.1573981481481482e-05, 1.15740625e-05],
  )
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-1.6203703703703702e-10, 1.6203703703703702e-10),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-1.6203703703703702e-10, 1.6203703703703702e-10),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999837963, 12.000000100162037),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999837963, 12.000000100162037),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 48 year/micro grid 2000/0 step 0.1" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=0.1,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 0.1)
  assert_eq(copy.interval_value(), 0.1)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2000-01-01T00:00:00")),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.000003"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      10956.999999999998, 10957.0, 10957.000000000002, 10957.000000000002, 10957.000000000004,
      10957.000000000005, 10957.000000000005, 10957.000000000007, 10957.000000000007,
      10957.00000000001, 10957.000000000011, 10957.000000000011, 10957.000000000013,
      10957.000000000015, 10957.000000000015, 10957.000000000016, 10957.000000000018,
      10957.000000000018, 10957.00000000002, 10957.00000000002, 10957.000000000022,
      10957.000000000024, 10957.000000000024, 10957.000000000025, 10957.000000000027,
      10957.000000000027, 10957.00000000003, 10957.000000000031, 10957.000000000031,
      10957.000000000033, 10957.000000000033, 10957.000000000035,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.000003"),
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2000-01-01T00:00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([
      10956.999999999998, 10957.0, 10957.000000000002, 10957.000000000002, 10957.000000000004,
      10957.000000000005, 10957.000000000005, 10957.000000000007, 10957.000000000007,
      10957.00000000001, 10957.000000000011, 10957.000000000011, 10957.000000000013,
      10957.000000000015, 10957.000000000015, 10957.000000000016, 10957.000000000018,
      10957.000000000018, 10957.00000000002, 10957.00000000002, 10957.000000000022,
      10957.000000000024, 10957.000000000024, 10957.000000000025, 10957.000000000027,
      10957.000000000027, 10957.00000000003, 10957.000000000031, 10957.000000000031,
      10957.000000000033, 10957.000000000033, 10957.000000000035,
    ]),
  )
  assert_eq(adapter.tick_values(10957.0, 10957.000000000035), [
    10956.999999999998, 10957.0, 10957.000000000002, 10957.000000000002, 10957.000000000004,
    10957.000000000005, 10957.000000000005, 10957.000000000007, 10957.000000000007,
    10957.00000000001, 10957.000000000011, 10957.000000000011, 10957.000000000013,
    10957.000000000015, 10957.000000000015, 10957.000000000016, 10957.000000000018,
    10957.000000000018, 10957.00000000002, 10957.00000000002, 10957.000000000022,
    10957.000000000024, 10957.000000000024, 10957.000000000025, 10957.000000000027,
    10957.000000000027, 10957.00000000003, 10957.000000000031, 10957.000000000031,
    10957.000000000033, 10957.000000000033, 10957.000000000035,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-12, 2.3148148148148147e-12),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-12, 2.3148148148148147e-12),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999997685, 12.000000100002314),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999997685, 12.000000100002314),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 49 year/micro grid 2000/0 step 0.25" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=0.25,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 0.25)
  assert_eq(copy.interval_value(), 0.25)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2000-01-01T00:00:00")),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.000003"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      10956.999999999996, 10957.0, 10957.000000000004, 10957.000000000005, 10957.00000000001,
      10957.000000000011, 10957.000000000015, 10957.000000000018, 10957.00000000002,
      10957.000000000024, 10957.000000000025, 10957.00000000003, 10957.000000000031,
      10957.000000000035,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.000003"),
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2000-01-01T00:00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([
      10956.999999999996, 10957.0, 10957.000000000004, 10957.000000000005, 10957.00000000001,
      10957.000000000011, 10957.000000000015, 10957.000000000018, 10957.00000000002,
      10957.000000000024, 10957.000000000025, 10957.00000000003, 10957.000000000031,
      10957.000000000035,
    ]),
  )
  assert_eq(adapter.tick_values(10957.0, 10957.000000000035), [
    10956.999999999996, 10957.0, 10957.000000000004, 10957.000000000005, 10957.00000000001,
    10957.000000000011, 10957.000000000015, 10957.000000000018, 10957.00000000002,
    10957.000000000024, 10957.000000000025, 10957.00000000003, 10957.000000000031,
    10957.000000000035,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-5.787037037037037e-12, 5.787037037037037e-12),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-5.787037037037037e-12, 5.787037037037037e-12),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999994213, 12.000000100005787),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999994213, 12.000000100005787),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 50 year/micro grid 2000/0 step 0.5" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=0.5,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 0.5)
  assert_eq(copy.interval_value(), 0.5)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2000-01-01T00:00:00")),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.000003"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      10956.999999999995, 10957.0, 10957.000000000005, 10957.000000000011, 10957.000000000018,
      10957.000000000024, 10957.00000000003, 10957.000000000035,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.000003"),
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2000-01-01T00:00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([
      10956.999999999995, 10957.0, 10957.000000000005, 10957.000000000011, 10957.000000000018,
      10957.000000000024, 10957.00000000003, 10957.000000000035,
    ]),
  )
  assert_eq(adapter.tick_values(10957.0, 10957.000000000035), [
    10956.999999999995, 10957.0, 10957.000000000005, 10957.000000000011, 10957.000000000018,
    10957.000000000024, 10957.00000000003, 10957.000000000035,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-1.1574074074074074e-11, 1.1574074074074074e-11),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-1.1574074074074074e-11, 1.1574074074074074e-11),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999988425, 12.000000100011574),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999988425, 12.000000100011574),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 51 year/micro grid 2000/0 step 1.0" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=1.0,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 1.0)
  assert_eq(copy.interval_value(), 1.0)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2000-01-01T00:00:00")),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.000003"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      10956.999999999989, 10957.0, 10957.000000000011, 10957.000000000024, 10957.000000000035,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.000003"),
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2000-01-01T00:00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([
      10956.999999999989, 10957.0, 10957.000000000011, 10957.000000000024, 10957.000000000035,
    ]),
  )
  assert_eq(adapter.tick_values(10957.0, 10957.000000000035), [
    10956.999999999989, 10957.0, 10957.000000000011, 10957.000000000024, 10957.000000000035,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-11, 2.3148148148148147e-11),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-11, 2.3148148148148147e-11),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999976852, 12.000000100023147),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999976852, 12.000000100023147),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 52 year/micro grid 2000/0 step 2.5" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=2.5,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 2.5)
  assert_eq(copy.interval_value(), 2.5)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2000-01-01T00:00:00")),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.000003"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([10956.99999999997, 10957.0, 10957.00000000003, 10957.000000000058]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.000003"),
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2000-01-01T00:00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([10956.99999999997, 10957.0, 10957.00000000003, 10957.000000000058]),
  )
  assert_eq(adapter.tick_values(10957.0, 10957.000000000035), [
    10956.99999999997, 10957.0, 10957.00000000003, 10957.000000000058,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-5.787037037037037e-11, 5.787037037037037e-11),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-5.787037037037037e-11, 5.787037037037037e-11),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.99999999994213, 12.00000010005787),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.99999999994213, 12.00000010005787),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 53 year/micro grid 2000/0 step 7.0" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=7.0,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 7.0)
  assert_eq(copy.interval_value(), 7.0)
  assert_eq(copy.interval(), 7)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2000-01-01T00:00:00")),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.000003"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([10956.999999999918, 10957.0, 10957.000000000082]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.000003"),
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2000-01-01T00:00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([10956.999999999918, 10957.0, 10957.000000000082]),
  )
  assert_eq(adapter.tick_values(10957.0, 10957.000000000035), [
    10956.999999999918, 10957.0, 10957.000000000082,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-1.6203703703703702e-10, 1.6203703703703702e-10),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-1.6203703703703702e-10, 1.6203703703703702e-10),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999837963, 12.000000100162037),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999837963, 12.000000100162037),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 54 year/micro grid 2000/1 step 0.1" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=0.1,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 0.1)
  assert_eq(copy.interval_value(), 0.1)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.000001"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.000004"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      10957.000000000011, 10957.000000000011, 10957.000000000013, 10957.000000000015,
      10957.000000000015, 10957.000000000016, 10957.000000000018, 10957.000000000018,
      10957.00000000002, 10957.00000000002, 10957.000000000022, 10957.000000000024,
      10957.000000000024, 10957.000000000025, 10957.000000000027, 10957.000000000027,
      10957.00000000003, 10957.000000000031, 10957.000000000031, 10957.000000000033,
      10957.000000000033, 10957.000000000035, 10957.000000000036, 10957.000000000036,
      10957.000000000038, 10957.00000000004, 10957.00000000004, 10957.000000000042,
      10957.000000000044, 10957.000000000044, 10957.000000000045, 10957.000000000045,
      10957.000000000047,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.000004"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.000001"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      10957.000000000011, 10957.000000000011, 10957.000000000013, 10957.000000000015,
      10957.000000000015, 10957.000000000016, 10957.000000000018, 10957.000000000018,
      10957.00000000002, 10957.00000000002, 10957.000000000022, 10957.000000000024,
      10957.000000000024, 10957.000000000025, 10957.000000000027, 10957.000000000027,
      10957.00000000003, 10957.000000000031, 10957.000000000031, 10957.000000000033,
      10957.000000000033, 10957.000000000035, 10957.000000000036, 10957.000000000036,
      10957.000000000038, 10957.00000000004, 10957.00000000004, 10957.000000000042,
      10957.000000000044, 10957.000000000044, 10957.000000000045, 10957.000000000045,
      10957.000000000047,
    ]),
  )
  assert_eq(adapter.tick_values(10957.000000000011, 10957.000000000047), [
    10957.000000000011, 10957.000000000011, 10957.000000000013, 10957.000000000015,
    10957.000000000015, 10957.000000000016, 10957.000000000018, 10957.000000000018,
    10957.00000000002, 10957.00000000002, 10957.000000000022, 10957.000000000024,
    10957.000000000024, 10957.000000000025, 10957.000000000027, 10957.000000000027,
    10957.00000000003, 10957.000000000031, 10957.000000000031, 10957.000000000033,
    10957.000000000033, 10957.000000000035, 10957.000000000036, 10957.000000000036,
    10957.000000000038, 10957.00000000004, 10957.00000000004, 10957.000000000042,
    10957.000000000044, 10957.000000000044, 10957.000000000045, 10957.000000000045,
    10957.000000000047,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-12, 2.3148148148148147e-12),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-12, 2.3148148148148147e-12),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999997685, 12.000000100002314),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999997685, 12.000000100002314),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 55 year/micro grid 2000/1 step 0.25" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=0.25,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 0.25)
  assert_eq(copy.interval_value(), 0.25)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.000001"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.000004"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      10957.00000000001, 10957.000000000011, 10957.000000000015, 10957.000000000018,
      10957.00000000002, 10957.000000000024, 10957.000000000025, 10957.00000000003,
      10957.000000000031, 10957.000000000035, 10957.000000000038, 10957.00000000004,
      10957.000000000044, 10957.000000000045, 10957.00000000005,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.000004"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.000001"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      10957.00000000001, 10957.000000000011, 10957.000000000015, 10957.000000000018,
      10957.00000000002, 10957.000000000024, 10957.000000000025, 10957.00000000003,
      10957.000000000031, 10957.000000000035, 10957.000000000038, 10957.00000000004,
      10957.000000000044, 10957.000000000045, 10957.00000000005,
    ]),
  )
  assert_eq(adapter.tick_values(10957.000000000011, 10957.000000000047), [
    10957.00000000001, 10957.000000000011, 10957.000000000015, 10957.000000000018,
    10957.00000000002, 10957.000000000024, 10957.000000000025, 10957.00000000003,
    10957.000000000031, 10957.000000000035, 10957.000000000038, 10957.00000000004,
    10957.000000000044, 10957.000000000045, 10957.00000000005,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-5.787037037037037e-12, 5.787037037037037e-12),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-5.787037037037037e-12, 5.787037037037037e-12),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999994213, 12.000000100005787),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999994213, 12.000000100005787),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 56 year/micro grid 2000/1 step 0.5" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=0.5,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 0.5)
  assert_eq(copy.interval_value(), 0.5)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.000001"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.000004"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      10957.000000000005, 10957.000000000011, 10957.000000000018, 10957.000000000024,
      10957.00000000003, 10957.000000000035, 10957.00000000004, 10957.000000000045,
      10957.000000000053,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.000004"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.000001"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      10957.000000000005, 10957.000000000011, 10957.000000000018, 10957.000000000024,
      10957.00000000003, 10957.000000000035, 10957.00000000004, 10957.000000000045,
      10957.000000000053,
    ]),
  )
  assert_eq(adapter.tick_values(10957.000000000011, 10957.000000000047), [
    10957.000000000005, 10957.000000000011, 10957.000000000018, 10957.000000000024,
    10957.00000000003, 10957.000000000035, 10957.00000000004, 10957.000000000045,
    10957.000000000053,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-1.1574074074074074e-11, 1.1574074074074074e-11),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-1.1574074074074074e-11, 1.1574074074074074e-11),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999988425, 12.000000100011574),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999988425, 12.000000100011574),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 57 year/micro grid 2000/1 step 1.0" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=1.0,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 1.0)
  assert_eq(copy.interval_value(), 1.0)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.000001"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.000004"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      10957.0, 10957.000000000011, 10957.000000000024, 10957.000000000035, 10957.000000000045,
      10957.000000000058,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.000004"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.000001"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      10957.0, 10957.000000000011, 10957.000000000024, 10957.000000000035, 10957.000000000045,
      10957.000000000058,
    ]),
  )
  assert_eq(adapter.tick_values(10957.000000000011, 10957.000000000047), [
    10957.0, 10957.000000000011, 10957.000000000024, 10957.000000000035, 10957.000000000045,
    10957.000000000058,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-11, 2.3148148148148147e-11),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-11, 2.3148148148148147e-11),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999976852, 12.000000100023147),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999976852, 12.000000100023147),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 58 year/micro grid 2000/1 step 2.5" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=2.5,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 2.5)
  assert_eq(copy.interval_value(), 2.5)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.000001"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.000004"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([10957.0, 10957.00000000003, 10957.000000000058]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.000004"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.000001"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([10957.0, 10957.00000000003, 10957.000000000058]),
  )
  assert_eq(adapter.tick_values(10957.000000000011, 10957.000000000047), [
    10957.0, 10957.00000000003, 10957.000000000058,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-5.787037037037037e-11, 5.787037037037037e-11),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-5.787037037037037e-11, 5.787037037037037e-11),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.99999999994213, 12.00000010005787),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.99999999994213, 12.00000010005787),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 59 year/micro grid 2000/1 step 7.0" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=7.0,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 7.0)
  assert_eq(copy.interval_value(), 7.0)
  assert_eq(copy.interval(), 7)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.000001"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.000004"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([10957.0, 10957.000000000082]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.000004"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.000001"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([10957.0, 10957.000000000082]),
  )
  assert_eq(adapter.tick_values(10957.000000000011, 10957.000000000047), [
    10957.0, 10957.000000000082,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-1.6203703703703702e-10, 1.6203703703703702e-10),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-1.6203703703703702e-10, 1.6203703703703702e-10),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999837963, 12.000000100162037),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999837963, 12.000000100162037),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 60 year/micro grid 2000/123456 step 0.1" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=0.1,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 0.1)
  assert_eq(copy.interval_value(), 0.1)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.123456"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.123459"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      10957.000001428889, 10957.00000142889, 10957.00000142889, 10957.000001428893,
      10957.000001428894, 10957.000001428894, 10957.000001428896, 10957.000001428896,
      10957.000001428898, 10957.0000014289, 10957.0000014289, 10957.000001428902,
      10957.000001428903, 10957.000001428903, 10957.000001428905, 10957.000001428907,
      10957.000001428907, 10957.000001428909, 10957.000001428909, 10957.00000142891,
      10957.000001428913, 10957.000001428913, 10957.000001428914, 10957.000001428916,
      10957.000001428916, 10957.000001428918, 10957.00000142892, 10957.00000142892,
      10957.000001428922, 10957.000001428922, 10957.000001428923,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.123459"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.123456"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      10957.000001428889, 10957.00000142889, 10957.00000142889, 10957.000001428893,
      10957.000001428894, 10957.000001428894, 10957.000001428896, 10957.000001428896,
      10957.000001428898, 10957.0000014289, 10957.0000014289, 10957.000001428902,
      10957.000001428903, 10957.000001428903, 10957.000001428905, 10957.000001428907,
      10957.000001428907, 10957.000001428909, 10957.000001428909, 10957.00000142891,
      10957.000001428913, 10957.000001428913, 10957.000001428914, 10957.000001428916,
      10957.000001428916, 10957.000001428918, 10957.00000142892, 10957.00000142892,
      10957.000001428922, 10957.000001428922, 10957.000001428923,
    ]),
  )
  assert_eq(adapter.tick_values(10957.000001428889, 10957.000001428923), [
    10957.000001428889, 10957.00000142889, 10957.00000142889, 10957.000001428893,
    10957.000001428894, 10957.000001428894, 10957.000001428896, 10957.000001428896,
    10957.000001428898, 10957.0000014289, 10957.0000014289, 10957.000001428902, 10957.000001428903,
    10957.000001428903, 10957.000001428905, 10957.000001428907, 10957.000001428907,
    10957.000001428909, 10957.000001428909, 10957.00000142891, 10957.000001428913,
    10957.000001428913, 10957.000001428914, 10957.000001428916, 10957.000001428916,
    10957.000001428918, 10957.00000142892, 10957.00000142892, 10957.000001428922,
    10957.000001428922, 10957.000001428923,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-12, 2.3148148148148147e-12),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-12, 2.3148148148148147e-12),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999997685, 12.000000100002314),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999997685, 12.000000100002314),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 61 year/micro grid 2000/123456 step 0.25" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=0.25,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 0.25)
  assert_eq(copy.interval_value(), 0.25)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.123456"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.123459"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      10957.000001428889, 10957.000001428893, 10957.000001428894, 10957.000001428898,
      10957.0000014289, 10957.000001428903, 10957.000001428907, 10957.000001428909,
      10957.000001428913, 10957.000001428914, 10957.000001428918, 10957.00000142892,
      10957.000001428923,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.123459"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.123456"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      10957.000001428889, 10957.000001428893, 10957.000001428894, 10957.000001428898,
      10957.0000014289, 10957.000001428903, 10957.000001428907, 10957.000001428909,
      10957.000001428913, 10957.000001428914, 10957.000001428918, 10957.00000142892,
      10957.000001428923,
    ]),
  )
  assert_eq(adapter.tick_values(10957.000001428889, 10957.000001428923), [
    10957.000001428889, 10957.000001428893, 10957.000001428894, 10957.000001428898,
    10957.0000014289, 10957.000001428903, 10957.000001428907, 10957.000001428909,
    10957.000001428913, 10957.000001428914, 10957.000001428918, 10957.00000142892,
    10957.000001428923,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-5.787037037037037e-12, 5.787037037037037e-12),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-5.787037037037037e-12, 5.787037037037037e-12),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999994213, 12.000000100005787),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999994213, 12.000000100005787),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 62 year/micro grid 2000/123456 step 0.5" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=0.5,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 0.5)
  assert_eq(copy.interval_value(), 0.5)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.123456"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.123459"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      10957.000001428889, 10957.000001428894, 10957.0000014289, 10957.000001428907,
      10957.000001428913, 10957.000001428918, 10957.000001428923,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.123459"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.123456"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      10957.000001428889, 10957.000001428894, 10957.0000014289, 10957.000001428907,
      10957.000001428913, 10957.000001428918, 10957.000001428923,
    ]),
  )
  assert_eq(adapter.tick_values(10957.000001428889, 10957.000001428923), [
    10957.000001428889, 10957.000001428894, 10957.0000014289, 10957.000001428907,
    10957.000001428913, 10957.000001428918, 10957.000001428923,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-1.1574074074074074e-11, 1.1574074074074074e-11),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-1.1574074074074074e-11, 1.1574074074074074e-11),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999988425, 12.000000100011574),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999988425, 12.000000100011574),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 63 year/micro grid 2000/123456 step 1.0" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=1.0,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 1.0)
  assert_eq(copy.interval_value(), 1.0)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.123456"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.123459"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      10957.000001428889, 10957.0000014289, 10957.000001428913, 10957.000001428923,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.123459"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.123456"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      10957.000001428889, 10957.0000014289, 10957.000001428913, 10957.000001428923,
    ]),
  )
  assert_eq(adapter.tick_values(10957.000001428889, 10957.000001428923), [
    10957.000001428889, 10957.0000014289, 10957.000001428913, 10957.000001428923,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-11, 2.3148148148148147e-11),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-11, 2.3148148148148147e-11),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999976852, 12.000000100023147),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999976852, 12.000000100023147),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 64 year/micro grid 2000/123456 step 2.5" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=2.5,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 2.5)
  assert_eq(copy.interval_value(), 2.5)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.123456"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.123459"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([10957.000001428878, 10957.000001428907, 10957.000001428934]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.123459"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.123456"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([10957.000001428878, 10957.000001428907, 10957.000001428934]),
  )
  assert_eq(adapter.tick_values(10957.000001428889, 10957.000001428923), [
    10957.000001428878, 10957.000001428907, 10957.000001428934,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-5.787037037037037e-11, 5.787037037037037e-11),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-5.787037037037037e-11, 5.787037037037037e-11),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.99999999994213, 12.00000010005787),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.99999999994213, 12.00000010005787),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 65 year/micro grid 2000/123456 step 7.0" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=7.0,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 7.0)
  assert_eq(copy.interval_value(), 7.0)
  assert_eq(copy.interval(), 7)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.123456"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.123459"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([10957.000001428843, 10957.000001428923]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.123459"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.123456"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([10957.000001428843, 10957.000001428923]),
  )
  assert_eq(adapter.tick_values(10957.000001428889, 10957.000001428923), [
    10957.000001428843, 10957.000001428923,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-1.6203703703703702e-10, 1.6203703703703702e-10),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-1.6203703703703702e-10, 1.6203703703703702e-10),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999837963, 12.000000100162037),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999837963, 12.000000100162037),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 66 year/micro grid 2000/999995 step 0.1" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=0.1,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 0.1)
  assert_eq(copy.interval_value(), 0.1)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.999995"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.999998"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      10957.000011574017, 10957.000011574017, 10957.000011574019, 10957.00001157402,
      10957.00001157402, 10957.000011574022, 10957.000011574024, 10957.000011574024,
      10957.000011574026, 10957.000011574026, 10957.000011574028, 10957.00001157403,
      10957.00001157403, 10957.000011574031, 10957.000011574033, 10957.000011574033,
      10957.000011574035, 10957.000011574037, 10957.000011574037, 10957.000011574039,
      10957.000011574039, 10957.00001157404, 10957.000011574042, 10957.000011574042,
      10957.000011574044, 10957.000011574046, 10957.000011574046, 10957.000011574048,
      10957.00001157405, 10957.00001157405, 10957.000011574051, 10957.000011574051,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.999998"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.999995"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      10957.000011574017, 10957.000011574017, 10957.000011574019, 10957.00001157402,
      10957.00001157402, 10957.000011574022, 10957.000011574024, 10957.000011574024,
      10957.000011574026, 10957.000011574026, 10957.000011574028, 10957.00001157403,
      10957.00001157403, 10957.000011574031, 10957.000011574033, 10957.000011574033,
      10957.000011574035, 10957.000011574037, 10957.000011574037, 10957.000011574039,
      10957.000011574039, 10957.00001157404, 10957.000011574042, 10957.000011574042,
      10957.000011574044, 10957.000011574046, 10957.000011574046, 10957.000011574048,
      10957.00001157405, 10957.00001157405, 10957.000011574051, 10957.000011574051,
    ]),
  )
  assert_eq(adapter.tick_values(10957.000011574017, 10957.000011574051), [
    10957.000011574017, 10957.000011574017, 10957.000011574019, 10957.00001157402,
    10957.00001157402, 10957.000011574022, 10957.000011574024, 10957.000011574024,
    10957.000011574026, 10957.000011574026, 10957.000011574028, 10957.00001157403,
    10957.00001157403, 10957.000011574031, 10957.000011574033, 10957.000011574033,
    10957.000011574035, 10957.000011574037, 10957.000011574037, 10957.000011574039,
    10957.000011574039, 10957.00001157404, 10957.000011574042, 10957.000011574042,
    10957.000011574044, 10957.000011574046, 10957.000011574046, 10957.000011574048,
    10957.00001157405, 10957.00001157405, 10957.000011574051, 10957.000011574051,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-12, 2.3148148148148147e-12),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-12, 2.3148148148148147e-12),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999997685, 12.000000100002314),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999997685, 12.000000100002314),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 67 year/micro grid 2000/999995 step 0.25" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=0.25,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 0.25)
  assert_eq(copy.interval_value(), 0.25)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.999995"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.999998"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      10957.000011574017, 10957.000011574019, 10957.000011574022, 10957.000011574024,
      10957.000011574028, 10957.000011574031, 10957.000011574033, 10957.000011574037,
      10957.000011574039, 10957.000011574042, 10957.000011574046, 10957.000011574048,
      10957.000011574051, 10957.000011574053,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.999998"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.999995"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      10957.000011574017, 10957.000011574019, 10957.000011574022, 10957.000011574024,
      10957.000011574028, 10957.000011574031, 10957.000011574033, 10957.000011574037,
      10957.000011574039, 10957.000011574042, 10957.000011574046, 10957.000011574048,
      10957.000011574051, 10957.000011574053,
    ]),
  )
  assert_eq(adapter.tick_values(10957.000011574017, 10957.000011574051), [
    10957.000011574017, 10957.000011574019, 10957.000011574022, 10957.000011574024,
    10957.000011574028, 10957.000011574031, 10957.000011574033, 10957.000011574037,
    10957.000011574039, 10957.000011574042, 10957.000011574046, 10957.000011574048,
    10957.000011574051, 10957.000011574053,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-5.787037037037037e-12, 5.787037037037037e-12),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-5.787037037037037e-12, 5.787037037037037e-12),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999994213, 12.000000100005787),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999994213, 12.000000100005787),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 68 year/micro grid 2000/999995 step 0.5" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=0.5,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 0.5)
  assert_eq(copy.interval_value(), 0.5)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.999995"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.999998"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      10957.000011574017, 10957.000011574022, 10957.000011574028, 10957.000011574033,
      10957.000011574039, 10957.000011574046, 10957.000011574051, 10957.000011574057,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.999998"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.999995"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      10957.000011574017, 10957.000011574022, 10957.000011574028, 10957.000011574033,
      10957.000011574039, 10957.000011574046, 10957.000011574051, 10957.000011574057,
    ]),
  )
  assert_eq(adapter.tick_values(10957.000011574017, 10957.000011574051), [
    10957.000011574017, 10957.000011574022, 10957.000011574028, 10957.000011574033,
    10957.000011574039, 10957.000011574046, 10957.000011574051, 10957.000011574057,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-1.1574074074074074e-11, 1.1574074074074074e-11),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-1.1574074074074074e-11, 1.1574074074074074e-11),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999988425, 12.000000100011574),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999988425, 12.000000100011574),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 69 year/micro grid 2000/999995 step 1.0" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=1.0,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 1.0)
  assert_eq(copy.interval_value(), 1.0)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.999995"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.999998"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      10957.000011574017, 10957.000011574028, 10957.000011574039, 10957.000011574051,
      10957.000011574062,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.999998"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.999995"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      10957.000011574017, 10957.000011574028, 10957.000011574039, 10957.000011574051,
      10957.000011574062,
    ]),
  )
  assert_eq(adapter.tick_values(10957.000011574017, 10957.000011574051), [
    10957.000011574017, 10957.000011574028, 10957.000011574039, 10957.000011574051,
    10957.000011574062,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-11, 2.3148148148148147e-11),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-11, 2.3148148148148147e-11),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999976852, 12.000000100023147),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999976852, 12.000000100023147),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 70 year/micro grid 2000/999995 step 2.5" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=2.5,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 2.5)
  assert_eq(copy.interval_value(), 2.5)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.999995"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.999998"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([10957.000011574017, 10957.000011574046, 10957.000011574075]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.999998"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.999995"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([10957.000011574017, 10957.000011574046, 10957.000011574075]),
  )
  assert_eq(adapter.tick_values(10957.000011574017, 10957.000011574051), [
    10957.000011574017, 10957.000011574046, 10957.000011574075,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-5.787037037037037e-11, 5.787037037037037e-11),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-5.787037037037037e-11, 5.787037037037037e-11),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.99999999994213, 12.00000010005787),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.99999999994213, 12.00000010005787),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 71 year/micro grid 2000/999995 step 7.0" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=7.0,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 7.0)
  assert_eq(copy.interval_value(), 7.0)
  assert_eq(copy.interval(), 7)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.999995"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.999998"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([10957.000011573982, 10957.000011574062]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.999998"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2000-01-01T00:00:00.999995"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([10957.000011573982, 10957.000011574062]),
  )
  assert_eq(adapter.tick_values(10957.000011574017, 10957.000011574051), [
    10957.000011573982, 10957.000011574062,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-1.6203703703703702e-10, 1.6203703703703702e-10),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-1.6203703703703702e-10, 1.6203703703703702e-10),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999837963, 12.000000100162037),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999837963, 12.000000100162037),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 72 year/micro grid 2400/0 step 0.1" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=0.1,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 0.1)
  assert_eq(copy.interval_value(), 0.1)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2400-01-01T00:00:00")),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.000003"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      157054.0, 157054.0, 157054.0, 157054.0, 157054.0, 157054.0, 157054.0, 157054.0,
      157054.0, 157054.0, 157054.0, 157054.0, 157054.0, 157054.0, 157054.00000000003,
      157054.00000000003, 157054.00000000003, 157054.00000000003, 157054.00000000003,
      157054.00000000003, 157054.00000000003, 157054.00000000003, 157054.00000000003,
      157054.00000000003, 157054.00000000003, 157054.00000000003, 157054.00000000003,
      157054.00000000003, 157054.00000000003, 157054.00000000003, 157054.00000000003,
      157054.00000000003, 157054.00000000003, 157054.00000000003, 157054.00000000003,
      157054.00000000003, 157054.00000000003, 157054.00000000003, 157054.00000000003,
      157054.00000000006, 157054.00000000006, 157054.00000000006, 157054.00000000006,
      157054.00000000006, 157054.00000000006, 157054.00000000006, 157054.00000000006,
      157054.00000000006, 157054.00000000006, 157054.00000000006, 157054.00000000006,
      157054.00000000006, 157054.00000000006,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.000003"),
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2400-01-01T00:00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([
      157054.0, 157054.0, 157054.0, 157054.0, 157054.0, 157054.0, 157054.0, 157054.0,
      157054.0, 157054.0, 157054.0, 157054.0, 157054.0, 157054.0, 157054.00000000003,
      157054.00000000003, 157054.00000000003, 157054.00000000003, 157054.00000000003,
      157054.00000000003, 157054.00000000003, 157054.00000000003, 157054.00000000003,
      157054.00000000003, 157054.00000000003, 157054.00000000003, 157054.00000000003,
      157054.00000000003, 157054.00000000003, 157054.00000000003, 157054.00000000003,
      157054.00000000003, 157054.00000000003, 157054.00000000003, 157054.00000000003,
      157054.00000000003, 157054.00000000003, 157054.00000000003, 157054.00000000003,
      157054.00000000006, 157054.00000000006, 157054.00000000006, 157054.00000000006,
      157054.00000000006, 157054.00000000006, 157054.00000000006, 157054.00000000006,
      157054.00000000006, 157054.00000000006, 157054.00000000006, 157054.00000000006,
      157054.00000000006, 157054.00000000006,
    ]),
  )
  assert_eq(adapter.tick_values(157054.0, 157054.00000000006), [
    157054.0, 157054.0, 157054.0,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-12, 2.3148148148148147e-12),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-12, 2.3148148148148147e-12),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999997685, 12.000000100002314),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999997685, 12.000000100002314),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 73 year/micro grid 2400/0 step 0.25" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=0.25,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 0.25)
  assert_eq(copy.interval_value(), 0.25)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2400-01-01T00:00:00")),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.000003"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      157054.0, 157054.0, 157054.0, 157054.0, 157054.0, 157054.0, 157054.0, 157054.00000000003,
      157054.00000000003, 157054.00000000003, 157054.00000000003, 157054.00000000003,
      157054.00000000003, 157054.00000000003, 157054.00000000003, 157054.00000000003,
      157054.00000000003, 157054.00000000006, 157054.00000000006, 157054.00000000006,
      157054.00000000006, 157054.00000000006, 157054.00000000006,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.000003"),
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2400-01-01T00:00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([
      157054.0, 157054.0, 157054.0, 157054.0, 157054.0, 157054.0, 157054.0, 157054.00000000003,
      157054.00000000003, 157054.00000000003, 157054.00000000003, 157054.00000000003,
      157054.00000000003, 157054.00000000003, 157054.00000000003, 157054.00000000003,
      157054.00000000003, 157054.00000000006, 157054.00000000006, 157054.00000000006,
      157054.00000000006, 157054.00000000006, 157054.00000000006,
    ]),
  )
  assert_eq(adapter.tick_values(157054.0, 157054.00000000006), [
    157054.0, 157054.0, 157054.0,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-5.787037037037037e-12, 5.787037037037037e-12),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-5.787037037037037e-12, 5.787037037037037e-12),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999994213, 12.000000100005787),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999994213, 12.000000100005787),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 74 year/micro grid 2400/0 step 0.5" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=0.5,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 0.5)
  assert_eq(copy.interval_value(), 0.5)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2400-01-01T00:00:00")),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.000003"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      157054.0, 157054.0, 157054.0, 157054.0, 157054.00000000003, 157054.00000000003,
      157054.00000000003, 157054.00000000003, 157054.00000000003, 157054.00000000006,
      157054.00000000006, 157054.00000000006, 157054.00000000006,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.000003"),
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2400-01-01T00:00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([
      157054.0, 157054.0, 157054.0, 157054.0, 157054.00000000003, 157054.00000000003,
      157054.00000000003, 157054.00000000003, 157054.00000000003, 157054.00000000006,
      157054.00000000006, 157054.00000000006, 157054.00000000006,
    ]),
  )
  assert_eq(adapter.tick_values(157054.0, 157054.00000000006), [
    157054.0, 157054.0, 157054.0,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-1.1574074074074074e-11, 1.1574074074074074e-11),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-1.1574074074074074e-11, 1.1574074074074074e-11),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999988425, 12.000000100011574),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999988425, 12.000000100011574),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 75 year/micro grid 2400/0 step 1.0" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=1.0,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 1.0)
  assert_eq(copy.interval_value(), 1.0)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2400-01-01T00:00:00")),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.000003"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      157054.0, 157054.0, 157054.0, 157054.00000000003, 157054.00000000003, 157054.00000000006,
      157054.00000000006, 157054.00000000006,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.000003"),
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2400-01-01T00:00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([
      157054.0, 157054.0, 157054.0, 157054.00000000003, 157054.00000000003, 157054.00000000006,
      157054.00000000006, 157054.00000000006,
    ]),
  )
  assert_eq(adapter.tick_values(157054.0, 157054.00000000006), [
    157054.0, 157054.0, 157054.0,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-11, 2.3148148148148147e-11),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-11, 2.3148148148148147e-11),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999976852, 12.000000100023147),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999976852, 12.000000100023147),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 76 year/micro grid 2400/0 step 2.5" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=2.5,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 2.5)
  assert_eq(copy.interval_value(), 2.5)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2400-01-01T00:00:00")),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.000003"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      157053.99999999997, 157054.0, 157054.00000000003, 157054.00000000006, 157054.0000000001,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.000003"),
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2400-01-01T00:00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([
      157053.99999999997, 157054.0, 157054.00000000003, 157054.00000000006, 157054.0000000001,
    ]),
  )
  assert_eq(adapter.tick_values(157054.0, 157054.00000000006), [
    157053.99999999997, 157054.0, 157054.00000000003,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-5.787037037037037e-11, 5.787037037037037e-11),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-5.787037037037037e-11, 5.787037037037037e-11),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.99999999994213, 12.00000010005787),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.99999999994213, 12.00000010005787),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 77 year/micro grid 2400/0 step 7.0" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=7.0,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 7.0)
  assert_eq(copy.interval_value(), 7.0)
  assert_eq(copy.interval(), 7)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2400-01-01T00:00:00")),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.000003"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([157053.9999999999, 157054.0, 157054.0000000001]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.000003"),
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2400-01-01T00:00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([157053.9999999999, 157054.0, 157054.0000000001]),
  )
  assert_eq(adapter.tick_values(157054.0, 157054.00000000006), [
    157053.9999999999, 157054.0, 157054.0000000001,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-1.6203703703703702e-10, 1.6203703703703702e-10),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-1.6203703703703702e-10, 1.6203703703703702e-10),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999837963, 12.000000100162037),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999837963, 12.000000100162037),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 78 year/micro grid 2400/1 step 0.1" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=0.1,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 0.1)
  assert_eq(copy.interval_value(), 0.1)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.000001"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.000004"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      157054.00000000003, 157054.00000000003, 157054.00000000003, 157054.00000000003,
      157054.00000000003, 157054.00000000003, 157054.00000000003, 157054.00000000003,
      157054.00000000003, 157054.00000000003, 157054.00000000003, 157054.00000000003,
      157054.00000000003, 157054.00000000006, 157054.00000000006, 157054.00000000006,
      157054.00000000006, 157054.00000000006, 157054.00000000006, 157054.00000000006,
      157054.00000000006, 157054.00000000006, 157054.00000000006, 157054.00000000006,
      157054.00000000006, 157054.00000000006, 157054.00000000006,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.000004"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.000001"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      157054.00000000003, 157054.00000000003, 157054.00000000003, 157054.00000000003,
      157054.00000000003, 157054.00000000003, 157054.00000000003, 157054.00000000003,
      157054.00000000003, 157054.00000000003, 157054.00000000003, 157054.00000000003,
      157054.00000000003, 157054.00000000006, 157054.00000000006, 157054.00000000006,
      157054.00000000006, 157054.00000000006, 157054.00000000006, 157054.00000000006,
      157054.00000000006, 157054.00000000006, 157054.00000000006, 157054.00000000006,
      157054.00000000006, 157054.00000000006, 157054.00000000006,
    ]),
  )
  assert_eq(adapter.tick_values(157054.00000000003, 157054.00000000006), [
    157054.0, 157054.0, 157054.0,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-12, 2.3148148148148147e-12),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-12, 2.3148148148148147e-12),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999997685, 12.000000100002314),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999997685, 12.000000100002314),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 79 year/micro grid 2400/1 step 0.25" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=0.25,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 0.25)
  assert_eq(copy.interval_value(), 0.25)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.000001"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.000004"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      157054.00000000003, 157054.00000000003, 157054.00000000003, 157054.00000000003,
      157054.00000000003, 157054.00000000003, 157054.00000000006, 157054.00000000006,
      157054.00000000006, 157054.00000000006, 157054.00000000006, 157054.00000000006,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.000004"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.000001"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      157054.00000000003, 157054.00000000003, 157054.00000000003, 157054.00000000003,
      157054.00000000003, 157054.00000000003, 157054.00000000006, 157054.00000000006,
      157054.00000000006, 157054.00000000006, 157054.00000000006, 157054.00000000006,
    ]),
  )
  assert_eq(adapter.tick_values(157054.00000000003, 157054.00000000006), [
    157054.0, 157054.0, 157054.0,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-5.787037037037037e-12, 5.787037037037037e-12),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-5.787037037037037e-12, 5.787037037037037e-12),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999994213, 12.000000100005787),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999994213, 12.000000100005787),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 80 year/micro grid 2400/1 step 0.5" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=0.5,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 0.5)
  assert_eq(copy.interval_value(), 0.5)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.000001"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.000004"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      157054.00000000003, 157054.00000000003, 157054.00000000003, 157054.00000000006,
      157054.00000000006, 157054.00000000006, 157054.00000000006,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.000004"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.000001"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      157054.00000000003, 157054.00000000003, 157054.00000000003, 157054.00000000006,
      157054.00000000006, 157054.00000000006, 157054.00000000006,
    ]),
  )
  assert_eq(adapter.tick_values(157054.00000000003, 157054.00000000006), [
    157054.0, 157054.0, 157054.0,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-1.1574074074074074e-11, 1.1574074074074074e-11),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-1.1574074074074074e-11, 1.1574074074074074e-11),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999988425, 12.000000100011574),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999988425, 12.000000100011574),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 81 year/micro grid 2400/1 step 1.0" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=1.0,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 1.0)
  assert_eq(copy.interval_value(), 1.0)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.000001"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.000004"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      157054.00000000003, 157054.00000000003, 157054.00000000006, 157054.00000000006,
      157054.00000000006,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.000004"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.000001"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      157054.00000000003, 157054.00000000003, 157054.00000000006, 157054.00000000006,
      157054.00000000006,
    ]),
  )
  assert_eq(adapter.tick_values(157054.00000000003, 157054.00000000006), [
    157054.0, 157054.0, 157054.0,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-11, 2.3148148148148147e-11),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-11, 2.3148148148148147e-11),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999976852, 12.000000100023147),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999976852, 12.000000100023147),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 82 year/micro grid 2400/1 step 2.5" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=2.5,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 2.5)
  assert_eq(copy.interval_value(), 2.5)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.000001"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.000004"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([157054.00000000003, 157054.00000000006, 157054.0000000001]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.000004"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.000001"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([157054.00000000003, 157054.00000000006, 157054.0000000001]),
  )
  assert_eq(adapter.tick_values(157054.00000000003, 157054.00000000006), [
    157053.99999999997, 157054.0, 157054.00000000003,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-5.787037037037037e-11, 5.787037037037037e-11),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-5.787037037037037e-11, 5.787037037037037e-11),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.99999999994213, 12.00000010005787),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.99999999994213, 12.00000010005787),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 83 year/micro grid 2400/1 step 7.0" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=7.0,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 7.0)
  assert_eq(copy.interval_value(), 7.0)
  assert_eq(copy.interval(), 7)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.000001"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.000004"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([157054.0, 157054.0000000001]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.000004"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.000001"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([157054.0, 157054.0000000001]),
  )
  assert_eq(adapter.tick_values(157054.00000000003, 157054.00000000006), [
    157053.9999999999, 157054.0, 157054.0000000001,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-1.6203703703703702e-10, 1.6203703703703702e-10),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-1.6203703703703702e-10, 1.6203703703703702e-10),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999837963, 12.000000100162037),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999837963, 12.000000100162037),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 84 year/micro grid 2400/123456 step 0.1" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=0.1,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 0.1)
  assert_eq(copy.interval_value(), 0.1)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.123456"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.123459"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      157054.00000142888, 157054.00000142888, 157054.00000142888, 157054.00000142888,
      157054.00000142888, 157054.00000142888, 157054.00000142888, 157054.00000142888,
      157054.00000142888, 157054.00000142888, 157054.00000142888, 157054.00000142888,
      157054.00000142888, 157054.00000142888, 157054.0000014289, 157054.0000014289,
      157054.0000014289, 157054.0000014289, 157054.0000014289, 157054.0000014289,
      157054.0000014289, 157054.0000014289, 157054.0000014289, 157054.0000014289,
      157054.0000014289, 157054.0000014289, 157054.0000014289,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.123459"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.123456"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      157054.00000142888, 157054.00000142888, 157054.00000142888, 157054.00000142888,
      157054.00000142888, 157054.00000142888, 157054.00000142888, 157054.00000142888,
      157054.00000142888, 157054.00000142888, 157054.00000142888, 157054.00000142888,
      157054.00000142888, 157054.00000142888, 157054.0000014289, 157054.0000014289,
      157054.0000014289, 157054.0000014289, 157054.0000014289, 157054.0000014289,
      157054.0000014289, 157054.0000014289, 157054.0000014289, 157054.0000014289,
      157054.0000014289, 157054.0000014289, 157054.0000014289,
    ]),
  )
  assert_eq(adapter.tick_values(157054.00000142888, 157054.0000014289), [
    157054.00000142894, 157054.00000142894,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-12, 2.3148148148148147e-12),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-12, 2.3148148148148147e-12),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999997685, 12.000000100002314),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999997685, 12.000000100002314),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 85 year/micro grid 2400/123456 step 0.25" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=0.25,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 0.25)
  assert_eq(copy.interval_value(), 0.25)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.123456"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.123459"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      157054.00000142888, 157054.00000142888, 157054.00000142888, 157054.00000142888,
      157054.00000142888, 157054.00000142888, 157054.0000014289, 157054.0000014289,
      157054.0000014289, 157054.0000014289, 157054.0000014289, 157054.0000014289,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.123459"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.123456"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      157054.00000142888, 157054.00000142888, 157054.00000142888, 157054.00000142888,
      157054.00000142888, 157054.00000142888, 157054.0000014289, 157054.0000014289,
      157054.0000014289, 157054.0000014289, 157054.0000014289, 157054.0000014289,
    ]),
  )
  assert_eq(adapter.tick_values(157054.00000142888, 157054.0000014289), [
    157054.00000142894, 157054.00000142894,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-5.787037037037037e-12, 5.787037037037037e-12),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-5.787037037037037e-12, 5.787037037037037e-12),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999994213, 12.000000100005787),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999994213, 12.000000100005787),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 86 year/micro grid 2400/123456 step 0.5" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=0.5,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 0.5)
  assert_eq(copy.interval_value(), 0.5)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.123456"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.123459"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      157054.00000142888, 157054.00000142888, 157054.00000142888, 157054.00000142888,
      157054.0000014289, 157054.0000014289, 157054.0000014289,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.123459"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.123456"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      157054.00000142888, 157054.00000142888, 157054.00000142888, 157054.00000142888,
      157054.0000014289, 157054.0000014289, 157054.0000014289,
    ]),
  )
  assert_eq(adapter.tick_values(157054.00000142888, 157054.0000014289), [
    157054.00000142894, 157054.00000142894,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-1.1574074074074074e-11, 1.1574074074074074e-11),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-1.1574074074074074e-11, 1.1574074074074074e-11),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999988425, 12.000000100011574),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999988425, 12.000000100011574),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 87 year/micro grid 2400/123456 step 1.0" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=1.0,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 1.0)
  assert_eq(copy.interval_value(), 1.0)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.123456"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.123459"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      157054.00000142888, 157054.00000142888, 157054.0000014289, 157054.0000014289,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.123459"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.123456"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      157054.00000142888, 157054.00000142888, 157054.0000014289, 157054.0000014289,
    ]),
  )
  assert_eq(adapter.tick_values(157054.00000142888, 157054.0000014289), [
    157054.00000142894, 157054.00000142894,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-11, 2.3148148148148147e-11),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-11, 2.3148148148148147e-11),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999976852, 12.000000100023147),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999976852, 12.000000100023147),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 88 year/micro grid 2400/123456 step 2.5" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=2.5,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 2.5)
  assert_eq(copy.interval_value(), 2.5)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.123456"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.123459"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([157054.00000142888, 157054.0000014289, 157054.00000142894]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.123459"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.123456"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([157054.00000142888, 157054.0000014289, 157054.00000142894]),
  )
  assert_eq(adapter.tick_values(157054.00000142888, 157054.0000014289), [
    157054.00000142894, 157054.00000142897,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-5.787037037037037e-11, 5.787037037037037e-11),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-5.787037037037037e-11, 5.787037037037037e-11),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.99999999994213, 12.00000010005787),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.99999999994213, 12.00000010005787),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 89 year/micro grid 2400/123456 step 7.0" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=7.0,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 7.0)
  assert_eq(copy.interval_value(), 7.0)
  assert_eq(copy.interval(), 7)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.123456"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.123459"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([157054.00000142885, 157054.0000014289]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.123459"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.123456"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([157054.00000142885, 157054.0000014289]),
  )
  assert_eq(adapter.tick_values(157054.00000142888, 157054.0000014289), [
    157054.0000014289, 157054.000001429,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-1.6203703703703702e-10, 1.6203703703703702e-10),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-1.6203703703703702e-10, 1.6203703703703702e-10),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999837963, 12.000000100162037),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999837963, 12.000000100162037),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 90 year/micro grid 2400/999995 step 0.1" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=0.1,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 0.1)
  assert_eq(copy.interval_value(), 0.1)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.999995"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.999998"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      157054.000011574, 157054.000011574, 157054.000011574, 157054.000011574, 157054.000011574,
      157054.000011574, 157054.000011574, 157054.000011574, 157054.000011574, 157054.000011574,
      157054.000011574, 157054.000011574, 157054.000011574, 157054.000011574, 157054.00001157404,
      157054.00001157404, 157054.00001157404, 157054.00001157404, 157054.00001157404,
      157054.00001157404, 157054.00001157404, 157054.00001157404, 157054.00001157404,
      157054.00001157404, 157054.00001157404, 157054.00001157404, 157054.00001157404,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.999998"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.999995"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      157054.000011574, 157054.000011574, 157054.000011574, 157054.000011574, 157054.000011574,
      157054.000011574, 157054.000011574, 157054.000011574, 157054.000011574, 157054.000011574,
      157054.000011574, 157054.000011574, 157054.000011574, 157054.000011574, 157054.00001157404,
      157054.00001157404, 157054.00001157404, 157054.00001157404, 157054.00001157404,
      157054.00001157404, 157054.00001157404, 157054.00001157404, 157054.00001157404,
      157054.00001157404, 157054.00001157404, 157054.00001157404, 157054.00001157404,
    ]),
  )
  assert_eq(adapter.tick_values(157054.000011574, 157054.00001157404), [
    157054.00001157407, 157054.00001157407,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-12, 2.3148148148148147e-12),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-12, 2.3148148148148147e-12),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999997685, 12.000000100002314),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999997685, 12.000000100002314),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 91 year/micro grid 2400/999995 step 0.25" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=0.25,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 0.25)
  assert_eq(copy.interval_value(), 0.25)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.999995"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.999998"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      157054.000011574, 157054.000011574, 157054.000011574, 157054.000011574, 157054.000011574,
      157054.000011574, 157054.00001157404, 157054.00001157404, 157054.00001157404,
      157054.00001157404, 157054.00001157404, 157054.00001157404,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.999998"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.999995"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      157054.000011574, 157054.000011574, 157054.000011574, 157054.000011574, 157054.000011574,
      157054.000011574, 157054.00001157404, 157054.00001157404, 157054.00001157404,
      157054.00001157404, 157054.00001157404, 157054.00001157404,
    ]),
  )
  assert_eq(adapter.tick_values(157054.000011574, 157054.00001157404), [
    157054.00001157407, 157054.00001157407,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-5.787037037037037e-12, 5.787037037037037e-12),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-5.787037037037037e-12, 5.787037037037037e-12),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999994213, 12.000000100005787),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999994213, 12.000000100005787),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 92 year/micro grid 2400/999995 step 0.5" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=0.5,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 0.5)
  assert_eq(copy.interval_value(), 0.5)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.999995"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.999998"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      157054.000011574, 157054.000011574, 157054.000011574, 157054.00001157404, 157054.00001157404,
      157054.00001157404, 157054.00001157404,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.999998"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.999995"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      157054.000011574, 157054.000011574, 157054.000011574, 157054.00001157404, 157054.00001157404,
      157054.00001157404, 157054.00001157404,
    ]),
  )
  assert_eq(adapter.tick_values(157054.000011574, 157054.00001157404), [
    157054.00001157407, 157054.00001157407,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-1.1574074074074074e-11, 1.1574074074074074e-11),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-1.1574074074074074e-11, 1.1574074074074074e-11),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999988425, 12.000000100011574),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999988425, 12.000000100011574),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 93 year/micro grid 2400/999995 step 1.0" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=1.0,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 1.0)
  assert_eq(copy.interval_value(), 1.0)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.999995"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.999998"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      157054.000011574, 157054.000011574, 157054.00001157404, 157054.00001157404,
      157054.00001157404,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.999998"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.999995"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      157054.000011574, 157054.000011574, 157054.00001157404, 157054.00001157404,
      157054.00001157404,
    ]),
  )
  assert_eq(adapter.tick_values(157054.000011574, 157054.00001157404), [
    157054.00001157407, 157054.00001157407,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-11, 2.3148148148148147e-11),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-11, 2.3148148148148147e-11),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999976852, 12.000000100023147),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999976852, 12.000000100023147),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 94 year/micro grid 2400/999995 step 2.5" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=2.5,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 2.5)
  assert_eq(copy.interval_value(), 2.5)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.999995"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.999998"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([157054.00001157398, 157054.000011574, 157054.00001157404]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.999998"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.999995"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([157054.00001157398, 157054.000011574, 157054.00001157404]),
  )
  assert_eq(adapter.tick_values(157054.000011574, 157054.00001157404), [
    157054.00001157404, 157054.00001157407,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-5.787037037037037e-11, 5.787037037037037e-11),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-5.787037037037037e-11, 5.787037037037037e-11),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.99999999994213, 12.00000010005787),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.99999999994213, 12.00000010005787),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 95 year/micro grid 2400/999995 step 7.0" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=7.0,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 7.0)
  assert_eq(copy.interval_value(), 7.0)
  assert_eq(copy.interval(), 7)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.999995"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.999998"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([157054.00001157398, 157054.00001157407]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.999998"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2400-01-01T00:00:00.999995"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([157054.00001157398, 157054.00001157407]),
  )
  assert_eq(adapter.tick_values(157054.000011574, 157054.00001157404), [
    157054.00001157407, 157054.00001157416,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-1.6203703703703702e-10, 1.6203703703703702e-10),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-1.6203703703703702e-10, 1.6203703703703702e-10),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999837963, 12.000000100162037),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999837963, 12.000000100162037),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 96 year/micro grid 9999/0 step 0.1" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=0.1,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 0.1)
  assert_eq(copy.interval_value(), 0.1)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("9999-01-01T00:00:00")),
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.000003"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([2932532.0, 2932532.0, 2932532.0]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.000003"),
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("9999-01-01T00:00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([2932532.0, 2932532.0, 2932532.0]),
  )
  assert_eq(adapter.tick_values(2932532.0, 2932532.0), [
    2932532.0, 2932532.0, 2932532.0,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-12, 2.3148148148148147e-12),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-12, 2.3148148148148147e-12),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999997685, 12.000000100002314),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999997685, 12.000000100002314),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 97 year/micro grid 9999/0 step 0.25" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=0.25,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 0.25)
  assert_eq(copy.interval_value(), 0.25)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("9999-01-01T00:00:00")),
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.000003"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([2932532.0, 2932532.0, 2932532.0]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.000003"),
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("9999-01-01T00:00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([2932532.0, 2932532.0, 2932532.0]),
  )
  assert_eq(adapter.tick_values(2932532.0, 2932532.0), [
    2932532.0, 2932532.0, 2932532.0,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-5.787037037037037e-12, 5.787037037037037e-12),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-5.787037037037037e-12, 5.787037037037037e-12),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999994213, 12.000000100005787),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999994213, 12.000000100005787),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 98 year/micro grid 9999/0 step 0.5" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=0.5,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 0.5)
  assert_eq(copy.interval_value(), 0.5)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("9999-01-01T00:00:00")),
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.000003"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([2932532.0, 2932532.0, 2932532.0]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.000003"),
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("9999-01-01T00:00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([2932532.0, 2932532.0, 2932532.0]),
  )
  assert_eq(adapter.tick_values(2932532.0, 2932532.0), [
    2932532.0, 2932532.0, 2932532.0,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-1.1574074074074074e-11, 1.1574074074074074e-11),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-1.1574074074074074e-11, 1.1574074074074074e-11),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999988425, 12.000000100011574),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999988425, 12.000000100011574),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 99 year/micro grid 9999/0 step 1.0" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=1.0,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 1.0)
  assert_eq(copy.interval_value(), 1.0)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("9999-01-01T00:00:00")),
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.000003"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([2932532.0, 2932532.0, 2932532.0]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.000003"),
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("9999-01-01T00:00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([2932532.0, 2932532.0, 2932532.0]),
  )
  assert_eq(adapter.tick_values(2932532.0, 2932532.0), [
    2932532.0, 2932532.0, 2932532.0,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-11, 2.3148148148148147e-11),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-11, 2.3148148148148147e-11),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999976852, 12.000000100023147),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999976852, 12.000000100023147),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 100 year/micro grid 9999/0 step 2.5" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=2.5,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 2.5)
  assert_eq(copy.interval_value(), 2.5)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("9999-01-01T00:00:00")),
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.000003"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([2932532.0, 2932532.0, 2932532.0]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.000003"),
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("9999-01-01T00:00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([2932532.0, 2932532.0, 2932532.0]),
  )
  assert_eq(adapter.tick_values(2932532.0, 2932532.0), [
    2932532.0, 2932532.0, 2932532.0,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-5.787037037037037e-11, 5.787037037037037e-11),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-5.787037037037037e-11, 5.787037037037037e-11),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.99999999994213, 12.00000010005787),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.99999999994213, 12.00000010005787),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 101 year/micro grid 9999/0 step 7.0" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=7.0,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 7.0)
  assert_eq(copy.interval_value(), 7.0)
  assert_eq(copy.interval(), 7)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("9999-01-01T00:00:00")),
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.000003"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([2932532.0, 2932532.0, 2932532.0]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.000003"),
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("9999-01-01T00:00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([2932532.0, 2932532.0, 2932532.0]),
  )
  assert_eq(adapter.tick_values(2932532.0, 2932532.0), [
    2932532.0, 2932532.0, 2932532.0,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-1.6203703703703702e-10, 1.6203703703703702e-10),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-1.6203703703703702e-10, 1.6203703703703702e-10),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999837963, 12.000000100162037),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999837963, 12.000000100162037),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 102 year/micro grid 9999/1 step 0.1" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=0.1,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 0.1)
  assert_eq(copy.interval_value(), 0.1)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.000001"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.000004"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([2932532.0, 2932532.0, 2932532.0]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.000004"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.000001"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([2932532.0, 2932532.0, 2932532.0]),
  )
  assert_eq(adapter.tick_values(2932532.0, 2932532.0), [
    2932532.0, 2932532.0, 2932532.0,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-12, 2.3148148148148147e-12),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-12, 2.3148148148148147e-12),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999997685, 12.000000100002314),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999997685, 12.000000100002314),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 103 year/micro grid 9999/1 step 0.25" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=0.25,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 0.25)
  assert_eq(copy.interval_value(), 0.25)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.000001"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.000004"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([2932532.0, 2932532.0, 2932532.0]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.000004"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.000001"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([2932532.0, 2932532.0, 2932532.0]),
  )
  assert_eq(adapter.tick_values(2932532.0, 2932532.0), [
    2932532.0, 2932532.0, 2932532.0,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-5.787037037037037e-12, 5.787037037037037e-12),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-5.787037037037037e-12, 5.787037037037037e-12),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999994213, 12.000000100005787),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999994213, 12.000000100005787),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 104 year/micro grid 9999/1 step 0.5" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=0.5,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 0.5)
  assert_eq(copy.interval_value(), 0.5)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.000001"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.000004"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([2932532.0, 2932532.0, 2932532.0]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.000004"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.000001"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([2932532.0, 2932532.0, 2932532.0]),
  )
  assert_eq(adapter.tick_values(2932532.0, 2932532.0), [
    2932532.0, 2932532.0, 2932532.0,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-1.1574074074074074e-11, 1.1574074074074074e-11),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-1.1574074074074074e-11, 1.1574074074074074e-11),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999988425, 12.000000100011574),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999988425, 12.000000100011574),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 105 year/micro grid 9999/1 step 1.0" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=1.0,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 1.0)
  assert_eq(copy.interval_value(), 1.0)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.000001"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.000004"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([2932532.0, 2932532.0, 2932532.0]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.000004"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.000001"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([2932532.0, 2932532.0, 2932532.0]),
  )
  assert_eq(adapter.tick_values(2932532.0, 2932532.0), [
    2932532.0, 2932532.0, 2932532.0,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-11, 2.3148148148148147e-11),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-11, 2.3148148148148147e-11),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999976852, 12.000000100023147),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999976852, 12.000000100023147),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 106 year/micro grid 9999/1 step 2.5" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=2.5,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 2.5)
  assert_eq(copy.interval_value(), 2.5)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.000001"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.000004"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([2932532.0, 2932532.0, 2932532.0]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.000004"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.000001"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([2932532.0, 2932532.0, 2932532.0]),
  )
  assert_eq(adapter.tick_values(2932532.0, 2932532.0), [
    2932532.0, 2932532.0, 2932532.0,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-5.787037037037037e-11, 5.787037037037037e-11),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-5.787037037037037e-11, 5.787037037037037e-11),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.99999999994213, 12.00000010005787),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.99999999994213, 12.00000010005787),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 107 year/micro grid 9999/1 step 7.0" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=7.0,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 7.0)
  assert_eq(copy.interval_value(), 7.0)
  assert_eq(copy.interval(), 7)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.000001"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.000004"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([2932532.0, 2932532.0, 2932532.0]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.000004"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.000001"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([2932532.0, 2932532.0, 2932532.0]),
  )
  assert_eq(adapter.tick_values(2932532.0, 2932532.0), [
    2932532.0, 2932532.0, 2932532.0,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-1.6203703703703702e-10, 1.6203703703703702e-10),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-1.6203703703703702e-10, 1.6203703703703702e-10),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999837963, 12.000000100162037),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999837963, 12.000000100162037),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 108 year/micro grid 9999/123456 step 0.1" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=0.1,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 0.1)
  assert_eq(copy.interval_value(), 0.1)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.123456"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.123459"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.123459"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.123456"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
    ]),
  )
  assert_eq(adapter.tick_values(2932532.0000014286, 2932532.000001429), [
    2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428,
    2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428,
    2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428,
    2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428,
    2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428,
    2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428,
    2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428,
    2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428,
    2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428,
    2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428,
    2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428,
    2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428,
    2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428,
    2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428,
    2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428,
    2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428,
    2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428,
    2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428,
    2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428,
    2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428,
    2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428,
    2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428,
    2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428,
    2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428,
    2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428,
    2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428,
    2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428,
    2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428,
    2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428,
    2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428,
    2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428,
    2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428,
    2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428,
    2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428,
    2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428,
    2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428,
    2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428,
    2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428,
    2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428,
    2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428,
    2932532.000001428, 2932532.000001428, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
    2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
    2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
    2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
    2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
    2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
    2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
    2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
    2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
    2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
    2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
    2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
    2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
    2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
    2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
    2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
    2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
    2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
    2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
    2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
    2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
    2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
    2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
    2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
    2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
    2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
    2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
    2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
    2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
    2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
    2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
    2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
    2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
    2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
    2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
    2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
    2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
    2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
    2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
    2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
    2932532.000001429, 2932532.000001429,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-12, 2.3148148148148147e-12),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-12, 2.3148148148148147e-12),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999997685, 12.000000100002314),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999997685, 12.000000100002314),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 109 year/micro grid 9999/123456 step 0.25" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=0.25,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 0.25)
  assert_eq(copy.interval_value(), 0.25)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.123456"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.123459"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.123459"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.123456"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429,
    ]),
  )
  assert_eq(adapter.tick_values(2932532.0000014286, 2932532.000001429), [
    2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428,
    2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428,
    2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428,
    2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428,
    2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428,
    2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428,
    2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428,
    2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428,
    2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428,
    2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428,
    2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428,
    2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428,
    2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428,
    2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428,
    2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428,
    2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428,
    2932532.000001428, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.000001429, 2932532.000001429,
    2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
    2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
    2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
    2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
    2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
    2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
    2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
    2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
    2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
    2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
    2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
    2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
    2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
    2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
    2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
    2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-5.787037037037037e-12, 5.787037037037037e-12),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-5.787037037037037e-12, 5.787037037037037e-12),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999994213, 12.000000100005787),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999994213, 12.000000100005787),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 110 year/micro grid 9999/123456 step 0.5" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=0.5,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 0.5)
  assert_eq(copy.interval_value(), 0.5)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.123456"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.123459"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.123459"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.123456"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429,
    ]),
  )
  assert_eq(adapter.tick_values(2932532.0000014286, 2932532.000001429), [
    2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428,
    2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428,
    2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428,
    2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428,
    2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428,
    2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428,
    2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428,
    2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428,
    2932532.000001428, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.000001429, 2932532.000001429, 2932532.000001429,
    2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
    2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
    2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
    2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
    2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
    2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
    2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
    2932532.000001429, 2932532.000001429, 2932532.000001429,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-1.1574074074074074e-11, 1.1574074074074074e-11),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-1.1574074074074074e-11, 1.1574074074074074e-11),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999988425, 12.000000100011574),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999988425, 12.000000100011574),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 111 year/micro grid 9999/123456 step 1.0" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=1.0,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 1.0)
  assert_eq(copy.interval_value(), 1.0)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.123456"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.123459"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.123459"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.123456"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429,
    ]),
  )
  assert_eq(adapter.tick_values(2932532.0000014286, 2932532.000001429), [
    2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428,
    2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428,
    2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428,
    2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428,
    2932532.000001428, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.000001429, 2932532.000001429, 2932532.000001429,
    2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
    2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
    2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
    2932532.000001429, 2932532.000001429, 2932532.000001429,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-11, 2.3148148148148147e-11),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-11, 2.3148148148148147e-11),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999976852, 12.000000100023147),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999976852, 12.000000100023147),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 112 year/micro grid 9999/123456 step 2.5" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=2.5,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 2.5)
  assert_eq(copy.interval_value(), 2.5)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.123456"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.123459"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.123459"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.123456"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.0000014286, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
      2932532.000001429, 2932532.000001429,
    ]),
  )
  assert_eq(adapter.tick_values(2932532.0000014286, 2932532.000001429), [
    2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428,
    2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.000001429,
    2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
    2932532.000001429, 2932532.000001429, 2932532.000001429,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-5.787037037037037e-11, 5.787037037037037e-11),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-5.787037037037037e-11, 5.787037037037037e-11),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.99999999994213, 12.00000010005787),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.99999999994213, 12.00000010005787),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 113 year/micro grid 9999/123456 step 7.0" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=7.0,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 7.0)
  assert_eq(copy.interval_value(), 7.0)
  assert_eq(copy.interval(), 7)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.123456"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.123459"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.123459"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.123456"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
      2932532.000001429, 2932532.000001429, 2932532.000001429, 2932532.000001429,
    ]),
  )
  assert_eq(adapter.tick_values(2932532.0000014286, 2932532.000001429), [
    2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.000001428, 2932532.0000014286,
    2932532.0000014286, 2932532.0000014286, 2932532.0000014286, 2932532.0000014286,
    2932532.0000014286, 2932532.000001429, 2932532.000001429, 2932532.000001429,
    2932532.000001429,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-1.6203703703703702e-10, 1.6203703703703702e-10),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-1.6203703703703702e-10, 1.6203703703703702e-10),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999837963, 12.000000100162037),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999837963, 12.000000100162037),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 114 year/micro grid 9999/999995 step 0.1" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=0.1,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 0.1)
  assert_eq(copy.interval_value(), 0.1)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.999995"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.999998"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([2932532.000011574, 2932532.000011574]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.999998"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.999995"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([2932532.000011574, 2932532.000011574]),
  )
  assert_eq(adapter.tick_values(2932532.000011574, 2932532.000011574), [
    2932532.000011574, 2932532.000011574,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-12, 2.3148148148148147e-12),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-12, 2.3148148148148147e-12),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999997685, 12.000000100002314),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999997685, 12.000000100002314),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 115 year/micro grid 9999/999995 step 0.25" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=0.25,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 0.25)
  assert_eq(copy.interval_value(), 0.25)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.999995"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.999998"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([2932532.000011574, 2932532.000011574]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.999998"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.999995"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([2932532.000011574, 2932532.000011574]),
  )
  assert_eq(adapter.tick_values(2932532.000011574, 2932532.000011574), [
    2932532.000011574, 2932532.000011574,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-5.787037037037037e-12, 5.787037037037037e-12),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-5.787037037037037e-12, 5.787037037037037e-12),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999994213, 12.000000100005787),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999994213, 12.000000100005787),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 116 year/micro grid 9999/999995 step 0.5" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=0.5,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 0.5)
  assert_eq(copy.interval_value(), 0.5)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.999995"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.999998"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([2932532.000011574, 2932532.000011574]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.999998"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.999995"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([2932532.000011574, 2932532.000011574]),
  )
  assert_eq(adapter.tick_values(2932532.000011574, 2932532.000011574), [
    2932532.000011574, 2932532.000011574,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-1.1574074074074074e-11, 1.1574074074074074e-11),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-1.1574074074074074e-11, 1.1574074074074074e-11),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999988425, 12.000000100011574),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999988425, 12.000000100011574),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 117 year/micro grid 9999/999995 step 1.0" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=1.0,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 1.0)
  assert_eq(copy.interval_value(), 1.0)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.999995"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.999998"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([2932532.000011574, 2932532.000011574]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.999998"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.999995"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([2932532.000011574, 2932532.000011574]),
  )
  assert_eq(adapter.tick_values(2932532.000011574, 2932532.000011574), [
    2932532.000011574, 2932532.000011574,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-11, 2.3148148148148147e-11),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-11, 2.3148148148148147e-11),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999976852, 12.000000100023147),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999976852, 12.000000100023147),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 118 year/micro grid 9999/999995 step 2.5" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=2.5,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 2.5)
  assert_eq(copy.interval_value(), 2.5)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.999995"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.999998"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([2932532.000011574, 2932532.000011574]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.999998"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.999995"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([2932532.000011574, 2932532.000011574]),
  )
  assert_eq(adapter.tick_values(2932532.000011574, 2932532.000011574), [
    2932532.000011574, 2932532.000011574,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-5.787037037037037e-11, 5.787037037037037e-11),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-5.787037037037037e-11, 5.787037037037037e-11),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.99999999994213, 12.00000010005787),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.99999999994213, 12.00000010005787),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 119 year/micro grid 9999/999995 step 7.0" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=7.0,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 7.0)
  assert_eq(copy.interval_value(), 7.0)
  assert_eq(copy.interval(), 7)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.999995"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.999998"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([2932532.000011574, 2932532.000011574]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.999998"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-01-01T00:00:00.999995"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([2932532.000011574, 2932532.000011574]),
  )
  assert_eq(adapter.tick_values(2932532.000011574, 2932532.000011574), [
    2932532.000011574, 2932532.000011574,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-1.6203703703703702e-10, 1.6203703703703702e-10),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-1.6203703703703702e-10, 1.6203703703703702e-10),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999837963, 12.000000100162037),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999837963, 12.000000100162037),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 120 reverse/day/year boundary step 0.1" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=0.1,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 0.1)
  assert_eq(copy.interval_value(), 0.1)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.000001"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("1969-12-31T23:59:59.999999"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      -1.2731481481481483e-11, -1.1574074074074074e-11, -1.0416666666666668e-11,
      -9.25925925925926e-12, -8.101851851851853e-12, -6.944444444444446e-12, -5.787037037037037e-12,
      -4.62962962962963e-12, -3.472222222222223e-12, -2.3148148148148155e-12, -1.1574074074074084e-12,
      0.0, 1.1574074074074084e-12, 2.3148148148148143e-12, 3.472222222222223e-12,
      4.629629629629629e-12, 5.787037037037037e-12, 6.944444444444446e-12, 8.101851851851852e-12,
      9.25925925925926e-12, 1.0416666666666666e-11, 1.1574074074074074e-11, 1.2731481481481483e-11,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("1969-12-31T23:59:59.999999"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.000001"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      -1.2731593557191445e-11, -1.1574075031717257e-11, -1.0416778550847994e-11,
      -9.259260025373806e-12, -8.101963544504542e-12, -6.944556041332817e-12, -5.7870375158586285e-12,
      -4.629741034989365e-12, -3.472222509515177e-12, -2.314926028645914e-12, -1.1575185254741882e-12,
      0.0, 1.1572964808692632e-12, 2.3148150063434514e-12, 3.4721114872127146e-12,
      4.629630012686903e-12, 5.786926493556166e-12, 6.944445019030354e-12, 8.101741499899617e-12,
      9.25903798076888e-12, 1.0416556506243069e-11, 1.1574075031717257e-11, 1.273137151258652e-11,
    ]),
  )
  assert_eq(
    adapter.tick_values(1.1574074074074074e-11, -1.1574074074406894e-11),
    [
      1.273137151258652e-11, 1.1574075031717257e-11, 1.0416556506243069e-11, 9.25903798076888e-12,
      8.101741499899617e-12, 6.944445019030354e-12, 5.786926493556166e-12, 4.629630012686903e-12,
      3.4721114872127146e-12, 2.3148150063434514e-12, 1.1572964808692632e-12, 0.0,
      -1.1575185254741882e-12, -2.314926028645914e-12, -3.472222509515177e-12, -4.629741034989365e-12,
      -5.7870375158586285e-12, -6.944556041332817e-12, -8.101963544504542e-12, -9.259260025373806e-12,
      -1.0416778550847994e-11, -1.1574075031717257e-11, -1.2731593557191445e-11,
    ],
  )
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-12, 2.3148148148148147e-12),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-12, 2.3148148148148147e-12),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999997685, 12.000000100002314),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999997685, 12.000000100002314),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 121 reverse/day/year boundary step 0.1" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=0.1,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 0.1)
  assert_eq(copy.interval_value(), 0.1)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2024-01-01T00:00:00.000001"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2023-12-31T23:59:59.999999"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      19722.99999999999, 19722.99999999999, 19722.99999999999, 19722.999999999993,
      19722.999999999993, 19722.999999999993, 19722.999999999996, 19722.999999999996,
      19722.999999999996, 19723.0, 19723.0, 19723.0, 19723.000000000004, 19723.000000000004,
      19723.000000000004, 19723.000000000007, 19723.000000000007, 19723.000000000007,
      19723.00000000001, 19723.00000000001, 19723.00000000001,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2023-12-31T23:59:59.999999"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2024-01-01T00:00:00.000001"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      19722.99999999999, 19722.99999999999, 19722.99999999999, 19722.999999999993,
      19722.999999999993, 19722.999999999993, 19722.999999999996, 19722.999999999996,
      19722.999999999996, 19723.0, 19723.0, 19723.0, 19723.000000000004, 19723.000000000004,
      19723.000000000004, 19723.000000000007, 19723.000000000007, 19723.000000000007,
      19723.00000000001, 19723.00000000001, 19723.00000000001,
    ]),
  )
  assert_eq(adapter.tick_values(19723.00000000001, 19722.99999999999), [
    19723.00000000001, 19723.00000000001, 19723.00000000001, 19723.000000000007,
    19723.000000000007, 19723.000000000007, 19723.000000000004, 19723.000000000004,
    19723.000000000004, 19723.0, 19723.0, 19723.0, 19722.999999999996, 19722.999999999996,
    19722.999999999996, 19722.999999999993, 19722.999999999993, 19722.999999999993,
    19722.99999999999, 19722.99999999999, 19722.99999999999,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-12, 2.3148148148148147e-12),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-12, 2.3148148148148147e-12),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999997685, 12.000000100002314),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999997685, 12.000000100002314),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 122 reverse/day/year boundary step 0.1" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=0.1,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 0.1)
  assert_eq(copy.interval_value(), 0.1)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("0001-01-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("0001-01-01")),
      ),
    ) catch {
      _ => None
    },
    Some([-719162.0, -719162.0, -719162.0]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("0001-01-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("0001-01-01")),
      ),
    ) catch {
      _ => None
    },
    Some([-719162.0, -719162.0, -719162.0]),
  )
  assert_eq(adapter.tick_values(-719162.0, -719162.0), [
    -719162.0, -719162.0, -719162.0,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-12, 2.3148148148148147e-12),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-12, 2.3148148148148147e-12),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999997685, 12.000000100002314),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999997685, 12.000000100002314),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 123 reverse/day/year boundary step 0.1" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=0.1,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 0.1)
  assert_eq(copy.interval_value(), 0.1)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-12-31T23:59:59.999999"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-12-31T23:59:59.999999"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([2932897.0, 2932897.0, 2932897.0]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-12-31T23:59:59.999999"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-12-31T23:59:59.999999"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([2932897.0, 2932897.0, 2932897.0]),
  )
  assert_eq(adapter.tick_values(2932897.0, 2932897.0), [])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-12, 2.3148148148148147e-12),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-12, 2.3148148148148147e-12),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999997685, 12.000000100002314),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999997685, 12.000000100002314),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 124 reverse/day/year boundary step 0.5" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=0.5,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 0.5)
  assert_eq(copy.interval_value(), 0.5)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.000001"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("1969-12-31T23:59:59.999999"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      -1.736111111111111e-11, -1.1574074074074074e-11, -5.787037037037037e-12, 0.0,
      5.787037037037037e-12, 1.1574074074074074e-11, 1.736111111111111e-11,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("1969-12-31T23:59:59.999999"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.000001"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      -1.7361112547575885e-11, -1.1574075031717257e-11, -5.7870375158586285e-12,
      0.0, 5.786926493556166e-12, 1.1574075031717257e-11, 1.7361001525273423e-11,
    ]),
  )
  assert_eq(
    adapter.tick_values(1.1574074074074074e-11, -1.1574074074406894e-11),
    [
      1.7361001525273423e-11, 1.1574075031717257e-11, 5.786926493556166e-12, 0.0,
      -5.7870375158586285e-12, -1.1574075031717257e-11, -1.7361112547575885e-11,
    ],
  )
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-1.1574074074074074e-11, 1.1574074074074074e-11),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-1.1574074074074074e-11, 1.1574074074074074e-11),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999988425, 12.000000100011574),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999988425, 12.000000100011574),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 125 reverse/day/year boundary step 0.5" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=0.5,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 0.5)
  assert_eq(copy.interval_value(), 0.5)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2024-01-01T00:00:00.000001"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2023-12-31T23:59:59.999999"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      19722.99999999999, 19722.999999999993, 19723.0, 19723.000000000007, 19723.00000000001,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2023-12-31T23:59:59.999999"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2024-01-01T00:00:00.000001"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      19722.99999999999, 19722.999999999993, 19723.0, 19723.000000000007, 19723.00000000001,
    ]),
  )
  assert_eq(adapter.tick_values(19723.00000000001, 19722.99999999999), [
    19723.00000000001, 19723.000000000007, 19723.0, 19722.999999999993, 19722.99999999999,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-1.1574074074074074e-11, 1.1574074074074074e-11),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-1.1574074074074074e-11, 1.1574074074074074e-11),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999988425, 12.000000100011574),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999988425, 12.000000100011574),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 126 reverse/day/year boundary step 0.5" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=0.5,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 0.5)
  assert_eq(copy.interval_value(), 0.5)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("0001-01-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("0001-01-01")),
      ),
    ) catch {
      _ => None
    },
    Some([-719162.0, -719162.0, -719162.0]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("0001-01-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("0001-01-01")),
      ),
    ) catch {
      _ => None
    },
    Some([-719162.0, -719162.0, -719162.0]),
  )
  assert_eq(adapter.tick_values(-719162.0, -719162.0), [
    -719162.0, -719162.0, -719162.0,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-1.1574074074074074e-11, 1.1574074074074074e-11),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-1.1574074074074074e-11, 1.1574074074074074e-11),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999988425, 12.000000100011574),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999988425, 12.000000100011574),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 127 reverse/day/year boundary step 0.5" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=0.5,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 0.5)
  assert_eq(copy.interval_value(), 0.5)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-12-31T23:59:59.999999"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-12-31T23:59:59.999999"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([2932897.0, 2932897.0, 2932897.0]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-12-31T23:59:59.999999"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-12-31T23:59:59.999999"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([2932897.0, 2932897.0, 2932897.0]),
  )
  assert_eq(adapter.tick_values(2932897.0, 2932897.0), [])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-1.1574074074074074e-11, 1.1574074074074074e-11),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-1.1574074074074074e-11, 1.1574074074074074e-11),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999988425, 12.000000100011574),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999988425, 12.000000100011574),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 128 reverse/day/year boundary step 7.0" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=7.0,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 7.0)
  assert_eq(copy.interval_value(), 7.0)
  assert_eq(copy.interval(), 7)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.000001"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("1969-12-31T23:59:59.999999"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([-8.101851851851852e-11, 0.0, 8.101851851851852e-11]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("1969-12-31T23:59:59.999999"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.000001"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([-6.944445019030354e-11, 1.1574075031717257e-11, 9.259260025373806e-11]),
  )
  assert_eq(
    adapter.tick_values(1.1574074074074074e-11, -1.1574074074406894e-11),
    [9.259260025373806e-11, 1.1574075031717257e-11, -6.944445019030354e-11],
  )
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-1.6203703703703702e-10, 1.6203703703703702e-10),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-1.6203703703703702e-10, 1.6203703703703702e-10),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999837963, 12.000000100162037),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999837963, 12.000000100162037),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 129 reverse/day/year boundary step 7.0" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=7.0,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 7.0)
  assert_eq(copy.interval_value(), 7.0)
  assert_eq(copy.interval(), 7)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2024-01-01T00:00:00.000001"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2023-12-31T23:59:59.999999"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([19722.99999999992, 19723.0, 19723.00000000008]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2023-12-31T23:59:59.999999"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2024-01-01T00:00:00.000001"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([19722.99999999993, 19723.00000000001]),
  )
  assert_eq(adapter.tick_values(19723.00000000001, 19722.99999999999), [
    19723.00000000001, 19722.99999999993,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-1.6203703703703702e-10, 1.6203703703703702e-10),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-1.6203703703703702e-10, 1.6203703703703702e-10),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999837963, 12.000000100162037),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999837963, 12.000000100162037),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 130 reverse/day/year boundary step 7.0" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=7.0,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 7.0)
  assert_eq(copy.interval_value(), 7.0)
  assert_eq(copy.interval(), 7)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("0001-01-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("0001-01-01")),
      ),
    ) catch {
      _ => None
    },
    Some([-719162.0000000001, -719162.0, -719161.9999999999]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("0001-01-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("0001-01-01")),
      ),
    ) catch {
      _ => None
    },
    Some([-719162.0000000001, -719162.0, -719161.9999999999]),
  )
  assert_eq(adapter.tick_values(-719162.0, -719162.0), [
    -719162.0000000001, -719162.0, -719161.9999999999,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-1.6203703703703702e-10, 1.6203703703703702e-10),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-1.6203703703703702e-10, 1.6203703703703702e-10),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999837963, 12.000000100162037),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999837963, 12.000000100162037),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 131 reverse/day/year boundary step 7.0" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=7.0,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 7.0)
  assert_eq(copy.interval_value(), 7.0)
  assert_eq(copy.interval(), 7)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-12-31T23:59:59.999999"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-12-31T23:59:59.999999"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([2932897.0, 2932897.0, 2932897.0]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-12-31T23:59:59.999999"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-12-31T23:59:59.999999"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([2932897.0, 2932897.0, 2932897.0]),
  )
  assert_eq(adapter.tick_values(2932897.0, 2932897.0), [])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-1.6203703703703702e-10, 1.6203703703703702e-10),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-1.6203703703703702e-10, 1.6203703703703702e-10),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999837963, 12.000000100162037),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999837963, 12.000000100162037),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 132 reverse/day/year boundary step 250.0" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=250.0,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 250.0)
  assert_eq(copy.interval_value(), 250.0)
  assert_eq(copy.interval(), 250)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.000001"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("1969-12-31T23:59:59.999999"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([-2.8935185185185185e-09, 0.0, 2.8935185185185185e-09]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("1969-12-31T23:59:59.999999"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.000001"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([-2.8935185358847093e-09, 0.0, 2.8935185358847093e-09]),
  )
  assert_eq(
    adapter.tick_values(1.1574074074074074e-11, -1.1574074074406894e-11),
    [2.8935185358847093e-09, 0.0, -2.8935185358847093e-09],
  )
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-5.787037037037037e-09, 5.787037037037037e-09),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-5.787037037037037e-09, 5.787037037037037e-09),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999994212963, 12.000000105787036),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999994212963, 12.000000105787036),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 133 reverse/day/year boundary step 250.0" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=250.0,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 250.0)
  assert_eq(copy.interval_value(), 250.0)
  assert_eq(copy.interval(), 250)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2024-01-01T00:00:00.000001"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2023-12-31T23:59:59.999999"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([19722.999999997108, 19723.0, 19723.000000002892]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2023-12-31T23:59:59.999999"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2024-01-01T00:00:00.000001"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([19722.999999997108, 19723.0, 19723.000000002892]),
  )
  assert_eq(adapter.tick_values(19723.00000000001, 19722.99999999999), [
    19723.000000002892, 19723.0, 19722.999999997108,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-5.787037037037037e-09, 5.787037037037037e-09),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-5.787037037037037e-09, 5.787037037037037e-09),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999994212963, 12.000000105787036),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999994212963, 12.000000105787036),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 134 reverse/day/year boundary step 250.0" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=250.0,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 250.0)
  assert_eq(copy.interval_value(), 250.0)
  assert_eq(copy.interval(), 250)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("0001-01-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("0001-01-01")),
      ),
    ) catch {
      _ => None
    },
    Some([-719162.0000000029, -719162.0, -719161.9999999971]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("0001-01-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("0001-01-01")),
      ),
    ) catch {
      _ => None
    },
    Some([-719162.0000000029, -719162.0, -719161.9999999971]),
  )
  assert_eq(adapter.tick_values(-719162.0, -719162.0), [
    -719162.0000000029, -719162.0, -719161.9999999971,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-5.787037037037037e-09, 5.787037037037037e-09),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-5.787037037037037e-09, 5.787037037037037e-09),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999994212963, 12.000000105787036),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999994212963, 12.000000105787036),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 135 reverse/day/year boundary step 250.0" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=250.0,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 250.0)
  assert_eq(copy.interval_value(), 250.0)
  assert_eq(copy.interval(), 250)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-12-31T23:59:59.999999"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-12-31T23:59:59.999999"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([2932896.999999997, 2932897.0, 2932897.000000003]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-12-31T23:59:59.999999"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-12-31T23:59:59.999999"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([2932896.999999997, 2932897.0, 2932897.000000003]),
  )
  assert_eq(adapter.tick_values(2932897.0, 2932897.0), [])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-5.787037037037037e-09, 5.787037037037037e-09),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-5.787037037037037e-09, 5.787037037037037e-09),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999994212963, 12.000000105787036),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999994212963, 12.000000105787036),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 136 reverse/day/year boundary step 10000000000.0" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=10000000000.0,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 10000000000.0)
  assert_eq(copy.interval_value(), 10000000000.0)
  assert_eq(copy.interval(), 2147483647)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.000001"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("1969-12-31T23:59:59.999999"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([-0.11574074074074074, 0.0, 0.11574074074074074]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("1969-12-31T23:59:59.999999"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.000001"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([-0.07407407407407407, 0.04166666666666674]),
  )
  assert_eq(
    adapter.tick_values(1.1574074074074074e-11, -1.1574074074406894e-11),
    [0.04166666666666674, -0.07407407407407407],
  )
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-0.23148148148148148, 0.23148148148148148),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-0.23148148148148148, 0.23148148148148148),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.768518518518519, 12.23148158148148),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.768518518518519, 12.23148158148148),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 137 reverse/day/year boundary step 10000000000.0" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=10000000000.0,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 10000000000.0)
  assert_eq(copy.interval_value(), 10000000000.0)
  assert_eq(copy.interval(), 2147483647)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2024-01-01T00:00:00.000001"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2023-12-31T23:59:59.999999"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([19722.88425925926, 19723.0, 19723.11574074074]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2023-12-31T23:59:59.999999"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2024-01-01T00:00:00.000001"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([19722.925925925927, 19723.041666666668]),
  )
  assert_eq(adapter.tick_values(19723.00000000001, 19722.99999999999), [
    19723.041666666668, 19722.925925925927,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-0.23148148148148148, 0.23148148148148148),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-0.23148148148148148, 0.23148148148148148),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.768518518518519, 12.23148158148148),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.768518518518519, 12.23148158148148),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 138 reverse/day/year boundary step 10000000000.0" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=10000000000.0,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 10000000000.0)
  assert_eq(copy.interval_value(), 10000000000.0)
  assert_eq(copy.interval(), 2147483647)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("0001-01-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("0001-01-01")),
      ),
    ) catch {
      _ => None
    },
    Some([-719162.1157407408, -719162.0, -719161.8842592592]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("0001-01-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("0001-01-01")),
      ),
    ) catch {
      _ => None
    },
    Some([-719162.1157407408, -719162.0, -719161.8842592592]),
  )
  assert_eq(adapter.tick_values(-719162.0, -719162.0), [
    -719162.1157407408, -719162.0, -719161.8842592592,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-0.23148148148148148, 0.23148148148148148),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-0.23148148148148148, 0.23148148148148148),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.768518518518519, 12.23148158148148),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.768518518518519, 12.23148158148148),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 139 reverse/day/year boundary step 10000000000.0" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=10000000000.0,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 10000000000.0)
  assert_eq(copy.interval_value(), 10000000000.0)
  assert_eq(copy.interval(), 2147483647)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-12-31T23:59:59.999999"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-12-31T23:59:59.999999"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([2932896.8842592593, 2932897.0, 2932897.1157407407]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-12-31T23:59:59.999999"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-12-31T23:59:59.999999"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([2932896.8842592593, 2932897.0, 2932897.1157407407]),
  )
  assert_eq(adapter.tick_values(2932897.0, 2932897.0), [])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-0.23148148148148148, 0.23148148148148148),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-0.23148148148148148, 0.23148148148148148),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.768518518518519, 12.23148158148148),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.768518518518519, 12.23148158148148),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 140 extreme finite interval step 5e-324" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=5.0e-324,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 5.0e-324)
  assert_eq(copy.interval_value(), 5.0e-324)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("1970-01-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("1970-01-01")),
      ),
    ) catch {
      _ => None
    },
    Some([0.0, 0.0, 0.0]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("1970-01-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("1970-01-01")),
      ),
    ) catch {
      _ => None
    },
    Some([0.0, 0.0, 0.0]),
  )
  assert_eq(adapter.tick_values(0.0, 0.0), [0.0, 0.0, 0.0])
  assert_eq(locator.nonsingular(0.0, 0.0), (0.0, 0.0))
  assert_eq(copy.nonsingular(0.0, 0.0), (0.0, 0.0))
  assert_eq(locator.nonsingular(12.0, 12.0000001), (12.0, 12.0000001))
  assert_eq(copy.nonsingular(12.0, 12.0000001), (12.0, 12.0000001))
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 141 extreme finite interval step 5e-324" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=5.0e-324,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 5.0e-324)
  assert_eq(copy.interval_value(), 5.0e-324)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.000001"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.000001"),
        ),
      ),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.000001"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.000001"),
        ),
      ),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    adapter.tick_values(1.1574074074074074e-11, 1.1574074074074074e-11),
    [],
  )
  assert_eq(locator.nonsingular(0.0, 0.0), (0.0, 0.0))
  assert_eq(copy.nonsingular(0.0, 0.0), (0.0, 0.0))
  assert_eq(locator.nonsingular(12.0, 12.0000001), (12.0, 12.0000001))
  assert_eq(copy.nonsingular(12.0, 12.0000001), (12.0, 12.0000001))
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 142 extreme finite interval step 1e-300" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=1.0e-300,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 1.0e-300)
  assert_eq(copy.interval_value(), 1.0e-300)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("1970-01-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("1970-01-01")),
      ),
    ) catch {
      _ => None
    },
    Some([-1.1574074074073e-311, 0.0, 1.1574074074073e-311]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("1970-01-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("1970-01-01")),
      ),
    ) catch {
      _ => None
    },
    Some([-1.1574074074073e-311, 0.0, 1.1574074074073e-311]),
  )
  assert_eq(adapter.tick_values(0.0, 0.0), [
    -1.1574074074073e-311, 0.0, 1.1574074074073e-311,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-2.314814814815e-311, 2.314814814815e-311),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-2.314814814815e-311, 2.314814814815e-311),
  )
  assert_eq(locator.nonsingular(12.0, 12.0000001), (12.0, 12.0000001))
  assert_eq(copy.nonsingular(12.0, 12.0000001), (12.0, 12.0000001))
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 143 extreme finite interval step 1e+300" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=1.0e+300,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 1.0e+300)
  assert_eq(copy.interval_value(), 1.0e+300)
  assert_eq(copy.interval(), 2147483647)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("1970-01-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("1970-01-01")),
      ),
    ) catch {
      _ => None
    },
    Some([-1.1574074074074074e+289, 0.0, 1.1574074074074074e+289]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("1970-01-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("1970-01-01")),
      ),
    ) catch {
      _ => None
    },
    Some([-1.1574074074074074e+289, 0.0, 1.1574074074074074e+289]),
  )
  assert_eq(adapter.tick_values(0.0, 0.0), [
    -1.1574074074074074e+289, 0.0, 1.1574074074074074e+289,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-2.3148148148148148e+289, 2.3148148148148148e+289),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-2.3148148148148148e+289, 2.3148148148148148e+289),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (-2.3148148148148148e+289, 2.3148148148148148e+289),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (-2.3148148148148148e+289, 2.3148148148148148e+289),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 144 extreme finite interval step 1e+300" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=1.0e+300,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 1.0e+300)
  assert_eq(copy.interval_value(), 1.0e+300)
  assert_eq(copy.interval(), 2147483647)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.000001"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.000001"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([-1.1574074074074074e+289, 0.0, 1.1574074074074074e+289]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.000001"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.000001"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([-1.1574074074074074e+289, 0.0, 1.1574074074074074e+289]),
  )
  assert_eq(
    adapter.tick_values(1.1574074074074074e-11, 1.1574074074074074e-11),
    [-1.1574074074074074e+289, 0.0, 1.1574074074074074e+289],
  )
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-2.3148148148148148e+289, 2.3148148148148148e+289),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-2.3148148148148148e+289, 2.3148148148148148e+289),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (-2.3148148148148148e+289, 2.3148148148148148e+289),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (-2.3148148148148148e+289, 2.3148148148148148e+289),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 145 extreme finite interval step 1e+308" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=1.0e+308,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 1.0e+308)
  assert_eq(copy.interval_value(), 1.0e+308)
  assert_eq(copy.interval(), 2147483647)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("1970-01-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("1970-01-01")),
      ),
    ) catch {
      _ => None
    },
    Some([-1.1574074074074074e+297, 0.0, 1.0 / 0.0]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("1970-01-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("1970-01-01")),
      ),
    ) catch {
      _ => None
    },
    Some([-1.1574074074074074e+297, 0.0, 1.0 / 0.0]),
  )
  assert_eq(adapter.tick_values(0.0, 0.0), [
    -1.1574074074074074e+297,
    0.0,
    1.0 / 0.0,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-2.3148148148148148e+297, 2.3148148148148148e+297),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-2.3148148148148148e+297, 2.3148148148148148e+297),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (-2.3148148148148148e+297, 2.3148148148148148e+297),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (-2.3148148148148148e+297, 2.3148148148148148e+297),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 146 extreme finite interval step 1e+308" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=1.0e+308,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 1.0e+308)
  assert_eq(copy.interval_value(), 1.0e+308)
  assert_eq(copy.interval(), 2147483647)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.000001"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.000001"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([-1.1574074074074074e+297, 0.0, 1.0 / 0.0]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.000001"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.000001"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([-1.1574074074074074e+297, 0.0, 1.0 / 0.0]),
  )
  assert_eq(
    adapter.tick_values(1.1574074074074074e-11, 1.1574074074074074e-11),
    [-1.1574074074074074e+297, 0.0, 1.0 / 0.0],
  )
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-2.3148148148148148e+297, 2.3148148148148148e+297),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-2.3148148148148148e+297, 2.3148148148148148e+297),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (-2.3148148148148148e+297, 2.3148148148148148e+297),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (-2.3148148148148148e+297, 2.3148148148148148e+297),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 147 zone attach NY 2024-03-10T02:30:00 step 0.5" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  @date.register_timezone("D19/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D19/reference-NY")
  let zone_ny = @date.get_timezone(name="D19/reference-NY")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=0.5,
    context~,
    timezone=zone_ny,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 0.5)
  assert_eq(copy.interval_value(), 0.5)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00.000003"),
          zone_ny,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      19792.27083333333, 19792.270833333332, 19792.27083333334, 19792.270833333347,
      19792.27083333335, 19792.270833333358, 19792.27083333336, 19792.27083333337,
      19792.270833333372,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00.000003"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      19792.27083333333, 19792.270833333332, 19792.27083333334, 19792.270833333347,
      19792.27083333335, 19792.270833333358, 19792.27083333336, 19792.27083333337,
      19792.270833333372,
    ]),
  )
  assert_eq(adapter.tick_values(19792.270833333332, 19792.27083333337), [
    19792.27083333333, 19792.270833333332, 19792.27083333334, 19792.270833333347,
    19792.27083333335, 19792.270833333358, 19792.27083333336, 19792.27083333337,
    19792.270833333372,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-1.1574074074074074e-11, 1.1574074074074074e-11),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-1.1574074074074074e-11, 1.1574074074074074e-11),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999988425, 12.000000100011574),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999988425, 12.000000100011574),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 148 zone attach NY 2024-03-10T02:30:00 step 7.0" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  @date.register_timezone("D19/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D19/reference-NY")
  let zone_ny = @date.get_timezone(name="D19/reference-NY")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=7.0,
    context~,
    timezone=zone_ny,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 7.0)
  assert_eq(copy.interval_value(), 7.0)
  assert_eq(copy.interval(), 7)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00.000003"),
          zone_ny,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([19792.270833333263, 19792.270833333347, 19792.270833333427]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00.000003"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([19792.270833333263, 19792.270833333347, 19792.270833333427]),
  )
  assert_eq(adapter.tick_values(19792.270833333332, 19792.27083333337), [
    19792.270833333263, 19792.270833333347, 19792.270833333427,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-1.6203703703703702e-10, 1.6203703703703702e-10),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-1.6203703703703702e-10, 1.6203703703703702e-10),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999837963, 12.000000100162037),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999837963, 12.000000100162037),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 149 zone attach NY 2024-11-03T01:30:00 step 0.5" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  @date.register_timezone("D19/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D19/reference-NY")
  let zone_ny = @date.get_timezone(name="D19/reference-NY")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=0.5,
    context~,
    timezone=zone_ny,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 0.5)
  assert_eq(copy.interval_value(), 0.5)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-11-03T01:30:00"),
          zone_ny,
          fold=true,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-11-03T01:30:00.000003"),
          zone_ny,
          fold=true,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      20030.27083333333, 20030.270833333332, 20030.27083333334, 20030.270833333347,
      20030.27083333335, 20030.270833333358, 20030.27083333336, 20030.27083333337,
      20030.270833333372,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-11-03T01:30:00.000003"),
          zone_ny,
          fold=true,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-11-03T01:30:00"),
          zone_ny,
          fold=true,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      20030.27083333333, 20030.270833333332, 20030.27083333334, 20030.270833333347,
      20030.27083333335, 20030.270833333358, 20030.27083333336, 20030.27083333337,
      20030.270833333372,
    ]),
  )
  assert_eq(adapter.tick_values(20030.270833333332, 20030.27083333337), [
    20030.27083333333, 20030.270833333332, 20030.27083333334, 20030.270833333347,
    20030.27083333335, 20030.270833333358, 20030.27083333336, 20030.27083333337,
    20030.270833333372,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-1.1574074074074074e-11, 1.1574074074074074e-11),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-1.1574074074074074e-11, 1.1574074074074074e-11),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999988425, 12.000000100011574),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999988425, 12.000000100011574),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 150 zone attach NY 2024-11-03T01:30:00 step 7.0" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  @date.register_timezone("D19/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D19/reference-NY")
  let zone_ny = @date.get_timezone(name="D19/reference-NY")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=7.0,
    context~,
    timezone=zone_ny,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 7.0)
  assert_eq(copy.interval_value(), 7.0)
  assert_eq(copy.interval(), 7)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-11-03T01:30:00"),
          zone_ny,
          fold=true,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-11-03T01:30:00.000003"),
          zone_ny,
          fold=true,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([20030.270833333263, 20030.270833333347, 20030.270833333427]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-11-03T01:30:00.000003"),
          zone_ny,
          fold=true,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-11-03T01:30:00"),
          zone_ny,
          fold=true,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([20030.270833333263, 20030.270833333347, 20030.270833333427]),
  )
  assert_eq(adapter.tick_values(20030.270833333332, 20030.27083333337), [
    20030.270833333263, 20030.270833333347, 20030.270833333427,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-1.6203703703703702e-10, 1.6203703703703702e-10),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-1.6203703703703702e-10, 1.6203703703703702e-10),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999837963, 12.000000100162037),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999837963, 12.000000100162037),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 151 zone attach LH 2024-10-06T02:15:00 step 0.5" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  @date.register_timezone("D19/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D19/reference-LH")
  let zone_lh = @date.get_timezone(name="D19/reference-LH")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=0.5,
    context~,
    timezone=zone_lh,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 0.5)
  assert_eq(copy.interval_value(), 0.5)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-10-06T02:15:00"),
          zone_lh,
          fold=false,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-10-06T02:15:00.000003"),
          zone_lh,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      20001.635416666668, 20001.63541666667, 20001.63541666668, 20001.635416666682,
      20001.63541666669, 20001.635416666697, 20001.6354166667, 20001.635416666708,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-10-06T02:15:00.000003"),
          zone_lh,
          fold=false,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-10-06T02:15:00"),
          zone_lh,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      20001.635416666668, 20001.63541666667, 20001.63541666668, 20001.635416666682,
      20001.63541666669, 20001.635416666697, 20001.6354166667, 20001.635416666708,
    ]),
  )
  assert_eq(adapter.tick_values(20001.635416666668, 20001.635416666704), [
    20001.635416666668, 20001.63541666667, 20001.63541666668, 20001.635416666682,
    20001.63541666669, 20001.635416666697, 20001.6354166667, 20001.635416666708,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-1.1574074074074074e-11, 1.1574074074074074e-11),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-1.1574074074074074e-11, 1.1574074074074074e-11),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999988425, 12.000000100011574),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999988425, 12.000000100011574),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 152 zone attach LH 2024-10-06T02:15:00 step 7.0" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  @date.register_timezone("D19/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D19/reference-LH")
  let zone_lh = @date.get_timezone(name="D19/reference-LH")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=7.0,
    context~,
    timezone=zone_lh,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 7.0)
  assert_eq(copy.interval_value(), 7.0)
  assert_eq(copy.interval(), 7)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-10-06T02:15:00"),
          zone_lh,
          fold=false,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-10-06T02:15:00.000003"),
          zone_lh,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([20001.6354166666, 20001.63541666668, 20001.63541666676]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-10-06T02:15:00.000003"),
          zone_lh,
          fold=false,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-10-06T02:15:00"),
          zone_lh,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([20001.6354166666, 20001.63541666668, 20001.63541666676]),
  )
  assert_eq(adapter.tick_values(20001.635416666668, 20001.635416666704), [
    20001.6354166666, 20001.63541666668, 20001.63541666676,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-1.6203703703703702e-10, 1.6203703703703702e-10),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-1.6203703703703702e-10, 1.6203703703703702e-10),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999837963, 12.000000100162037),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999837963, 12.000000100162037),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 153 zone attach NEG 2024-10-27T01:00:00 step 0.5" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_neg = @date.get_timezone(name="IST-1GMT0,M10.5.0/2,M3.5.0/1")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=0.5,
    context~,
    timezone=zone_neg,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 0.5)
  assert_eq(copy.interval_value(), 0.5)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-10-27T01:00:00"),
          zone_neg,
          fold=false,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-10-27T01:00:00.000003"),
          zone_neg,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      20022.999999999993, 20023.0, 20023.000000000007, 20023.00000000001, 20023.00000000002,
      20023.000000000022, 20023.00000000003, 20023.000000000036, 20023.00000000004,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-10-27T01:00:00.000003"),
          zone_neg,
          fold=false,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-10-27T01:00:00"),
          zone_neg,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      20022.999999999993, 20023.0, 20023.000000000007, 20023.00000000001, 20023.00000000002,
      20023.000000000022, 20023.00000000003, 20023.000000000036, 20023.00000000004,
    ]),
  )
  assert_eq(adapter.tick_values(20023.0, 20023.000000000036), [
    20022.999999999993, 20023.0, 20023.000000000007, 20023.00000000001, 20023.00000000002,
    20023.000000000022, 20023.00000000003, 20023.000000000036, 20023.00000000004,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-1.1574074074074074e-11, 1.1574074074074074e-11),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-1.1574074074074074e-11, 1.1574074074074074e-11),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999988425, 12.000000100011574),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999988425, 12.000000100011574),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 154 zone attach NEG 2024-10-27T01:00:00 step 7.0" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_neg = @date.get_timezone(name="IST-1GMT0,M10.5.0/2,M3.5.0/1")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=7.0,
    context~,
    timezone=zone_neg,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 7.0)
  assert_eq(copy.interval_value(), 7.0)
  assert_eq(copy.interval(), 7)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-10-27T01:00:00"),
          zone_neg,
          fold=false,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-10-27T01:00:00.000003"),
          zone_neg,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([20022.99999999992, 20023.0, 20023.00000000008]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-10-27T01:00:00.000003"),
          zone_neg,
          fold=false,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-10-27T01:00:00"),
          zone_neg,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([20022.99999999992, 20023.0, 20023.00000000008]),
  )
  assert_eq(adapter.tick_values(20023.0, 20023.000000000036), [
    20022.99999999992, 20023.0, 20023.00000000008,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-1.6203703703703702e-10, 1.6203703703703702e-10),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-1.6203703703703702e-10, 1.6203703703703702e-10),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999837963, 12.000000100162037),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999837963, 12.000000100162037),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 155 zone attach FIX 1900-01-01T00:00:00 step 0.5" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_fix = @date.fixed_timezone_seconds(561)
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=0.5,
    context~,
    timezone=zone_fix,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 0.5)
  assert_eq(copy.interval_value(), 0.5)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("1900-01-01T00:00:00"),
          zone_fix,
          fold=false,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("1900-01-01T00:00:00.000003"),
          zone_fix,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      -25567.00649305556, -25567.006493055556, -25567.00649305555, -25567.006493055545,
      -25567.006493055538, -25567.00649305553, -25567.006493055527, -25567.00649305552,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("1900-01-01T00:00:00.000003"),
          zone_fix,
          fold=false,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("1900-01-01T00:00:00"),
          zone_fix,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      -25567.00649305556, -25567.006493055556, -25567.00649305555, -25567.006493055545,
      -25567.006493055538, -25567.00649305553, -25567.006493055527, -25567.00649305552,
    ]),
  )
  assert_eq(adapter.tick_values(-25567.006493055556, -25567.006493055524), [
    -25567.00649305556, -25567.006493055556,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-1.1574074074074074e-11, 1.1574074074074074e-11),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-1.1574074074074074e-11, 1.1574074074074074e-11),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999988425, 12.000000100011574),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999988425, 12.000000100011574),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 156 zone attach FIX 1900-01-01T00:00:00 step 7.0" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_fix = @date.fixed_timezone_seconds(561)
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=7.0,
    context~,
    timezone=zone_fix,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 7.0)
  assert_eq(copy.interval_value(), 7.0)
  assert_eq(copy.interval(), 7)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("1900-01-01T00:00:00"),
          zone_fix,
          fold=false,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("1900-01-01T00:00:00.000003"),
          zone_fix,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([-25567.006493055615, -25567.00649305553, -25567.00649305545]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("1900-01-01T00:00:00.000003"),
          zone_fix,
          fold=false,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("1900-01-01T00:00:00"),
          zone_fix,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([-25567.006493055615, -25567.00649305553, -25567.00649305545]),
  )
  assert_eq(adapter.tick_values(-25567.006493055556, -25567.006493055524), [
    -25567.006493055615, -25567.00649305553,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-1.6203703703703702e-10, 1.6203703703703702e-10),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-1.6203703703703702e-10, 1.6203703703703702e-10),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999837963, 12.000000100162037),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999837963, 12.000000100162037),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 157 mixed awareness batch step 0.5" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=0.5,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 0.5)
  assert_eq(copy.interval_value(), 0.5)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::aware(@date.parse_iso("1970-01-01T00:00:00+00:00")),
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.000003"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      -5.787037037037037e-12, 0.0, 5.787037037037037e-12, 1.1574074074074074e-11,
      1.736111111111111e-11, 2.3148148148148147e-11, 2.8935185185185184e-11, 3.472222222222222e-11,
      4.050925925925926e-11,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.000003"),
        ),
        @date.RRuleDateTime::aware(@date.parse_iso("1970-01-01T00:00:00+00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([
      -5.787037037037037e-12, 0.0, 5.787037037037037e-12, 1.1574074074074074e-11,
      1.736111111111111e-11, 2.3148148148148147e-11, 2.8935185185185184e-11, 3.472222222222222e-11,
      4.050925925925926e-11,
    ]),
  )
  assert_eq(adapter.tick_values(0.0, 3.472222222222222e-11), [
    -5.787037037037037e-12, 0.0, 5.787037037037037e-12, 1.1574074074074074e-11, 1.736111111111111e-11,
    2.3148148148148147e-11, 2.8935185185185184e-11, 3.472222222222222e-11, 4.050925925925926e-11,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-1.1574074074074074e-11, 1.1574074074074074e-11),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-1.1574074074074074e-11, 1.1574074074074074e-11),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999988425, 12.000000100011574),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999988425, 12.000000100011574),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 158 mixed awareness batch step 1000000.0" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=1000000.0,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 1000000.0)
  assert_eq(copy.interval_value(), 1000000.0)
  assert_eq(copy.interval(), 1000000)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("1970-01-01")),
        @date.RRuleDateTime::aware(
          @date.parse_iso("1970-01-01T00:09:21.000003+00:09:21"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      -1.1574074074074073e-05, 0.0, 1.1574074074074073e-05, 2.3148148148148147e-05,
      3.472222222222222e-05, 4.6296296296296294e-05, 5.787037037037037e-05, 6.944444444444444e-05,
      8.101851851851852e-05, 9.259259259259259e-05, 0.00010416666666666667, 0.00011574074074074075,
      0.0001273148148148148, 0.0001388888888888889, 0.00015046296296296297, 0.00016203703703703703,
      0.00017361111111111112, 0.00018518518518518518, 0.00019675925925925926, 0.00020833333333333335,
      0.0002199074074074074, 0.0002314814814814815, 0.00024305555555555555, 0.0002546296296296296,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::aware(
          @date.parse_iso("1970-01-01T00:09:21.000003+00:09:21"),
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("1970-01-01")),
      ),
    ) catch {
      _ => None
    },
    Some([-1.1574074074074073e-05, 0.0, 1.1574074074074073e-05]),
  )
  assert_eq(adapter.tick_values(0.0, 0.00024305559027777777), [
    -1.1574074074074073e-05, 0.0, 1.1574074074074073e-05, 2.3148148148148147e-05,
    3.472222222222222e-05, 4.6296296296296294e-05, 5.787037037037037e-05, 6.944444444444444e-05,
    8.101851851851852e-05, 9.259259259259259e-05, 0.00010416666666666667, 0.00011574074074074075,
    0.0001273148148148148, 0.0001388888888888889, 0.00015046296296296297, 0.00016203703703703703,
    0.00017361111111111112, 0.00018518518518518518, 0.00019675925925925926, 0.00020833333333333335,
    0.0002199074074074074, 0.0002314814814814815, 0.00024305555555555555, 0.0002546296296296296,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-05, 2.3148148148148147e-05),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-05, 2.3148148148148147e-05),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999976851851851, 12.000023248148148),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999976851851851, 12.000023248148148),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 159 mixed awareness batch step 1000000.0" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=1000000.0,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 1000000.0)
  assert_eq(copy.interval_value(), 1000000.0)
  assert_eq(copy.interval(), 1000000)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::aware(
          @date.parse_iso("1970-01-01T00:09:21+00:09:21"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.000003"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([-1.1574074074074073e-05, 0.0, 1.1574074074074073e-05]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.000003"),
        ),
        @date.RRuleDateTime::aware(
          @date.parse_iso("1970-01-01T00:09:21+00:09:21"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      0.0, 1.1574074074074073e-05, 2.3148148148148147e-05, 3.472222222222222e-05,
      4.6296296296296294e-05, 5.787037037037037e-05, 6.944444444444444e-05, 8.101851851851852e-05,
      9.259259259259259e-05, 0.00010416666666666667, 0.00011574074074074075, 0.0001273148148148148,
      0.0001388888888888889, 0.00015046296296296297, 0.00016203703703703703, 0.00017361111111111112,
      0.00018518518518518518, 0.00019675925925925926, 0.00020833333333333335, 0.0002199074074074074,
      0.0002314814814814815, 0.00024305555555555555, 0.0002546296296296296,
    ]),
  )
  assert_eq(adapter.tick_values(0.0, 3.472222222222222e-11), [
    -1.1574074074074073e-05, 0.0, 1.1574074074074073e-05,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-05, 2.3148148148148147e-05),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-05, 2.3148148148148147e-05),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999976851851851, 12.000023248148148),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999976851851851, 12.000023248148148),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 160 mixed awareness batch step 1000000000.0" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("XST-5:45", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=1000000000.0,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 1000000000.0)
  assert_eq(copy.interval_value(), 1000000000.0)
  assert_eq(copy.interval(), 1000000000)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::aware(@date.parse_iso("1970-01-01T00:00:00+00:00")),
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T05:45:00.000003"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([-0.011574074074074073, 0.0, 0.011574074074074073]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T05:45:00.000003"),
        ),
        @date.RRuleDateTime::aware(@date.parse_iso("1970-01-01T00:00:00+00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([
      -0.011574074074074073, 0.0, 0.011574074074074073, 0.023148148148148147, 0.034722222222222224,
      0.046296296296296294, 0.05787037037037037, 0.06944444444444445, 0.08101851851851852,
      0.09259259259259259, 0.10416666666666667, 0.11574074074074074, 0.12731481481481483,
      0.1388888888888889, 0.15046296296296297, 0.16203703703703703, 0.1736111111111111,
      0.18518518518518517, 0.19675925925925927, 0.20833333333333334, 0.2199074074074074,
      0.23148148148148148, 0.24305555555555555,
    ]),
  )
  assert_eq(adapter.tick_values(0.0, 3.472222222222222e-11), [
    -0.011574074074074073, 0.0, 0.011574074074074073,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-0.023148148148148147, 0.023148148148148147),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-0.023148148148148147, 0.023148148148148147),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.976851851851851, 12.023148248148148),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.976851851851851, 12.023148248148148),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 161 mixed awareness batch step 10000000000.0" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=10000000000.0,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 10000000000.0)
  assert_eq(copy.interval_value(), 10000000000.0)
  assert_eq(copy.interval(), 2147483647)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("0001-01-01")),
        @date.RRuleDateTime::aware(@date.parse_iso("0001-01-01T00:00:00+23:00")),
      ),
    ) catch {
      _ => None
    },
    Some([
      -719163.0416666666, -719162.925925926, -719162.8101851852, -719162.6944444445,
      -719162.5787037037, -719162.4629629629, -719162.3472222222, -719162.2314814815,
      -719162.1157407408, -719162.0, -719161.8842592592,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::aware(@date.parse_iso("0001-01-01T00:00:00+23:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("0001-01-01")),
      ),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(adapter.tick_values(-719162.0, -719162.9583333334), [])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-0.23148148148148148, 0.23148148148148148),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-0.23148148148148148, 0.23148148148148148),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.768518518518519, 12.23148158148148),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.768518518518519, 12.23148158148148),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 162 mixed awareness batch step 1000000000000.0" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=1000000000000.0,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 1000000000000.0)
  assert_eq(copy.interval_value(), 1000000000000.0)
  assert_eq(copy.interval(), 2147483647)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::aware(@date.parse_iso("0002-01-01T00:00:00+00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("0001-01-01")),
      ),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("0001-01-01")),
        @date.RRuleDateTime::aware(@date.parse_iso("0002-01-01T00:00:00+00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([
      -719173.574074074, -719162.0, -719150.425925926, -719138.8518518518, -719127.2777777778,
      -719115.7037037037, -719104.1296296297, -719092.5555555555, -719080.9814814815,
      -719069.4074074074, -719057.8333333334, -719046.2592592592, -719034.6851851852,
      -719023.1111111111, -719011.5370370371, -718999.9629629629, -718988.3888888889,
      -718976.8148148148, -718965.2407407408, -718953.6666666666, -718942.0925925926,
      -718930.5185185185, -718918.9444444445, -718907.3703703703, -718895.7962962963,
      -718884.2222222222, -718872.6481481482, -718861.074074074, -718849.5, -718837.925925926,
      -718826.3518518518, -718814.7777777778, -718803.2037037037, -718791.6296296297,
    ]),
  )
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-23.14814814814815, 23.14814814814815),
  )
  assert_eq(copy.nonsingular(0.0, 0.0), (-23.14814814814815, 23.14814814814815))
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (-11.148148148148149, 35.148148248148146),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (-11.148148148148149, 35.148148248148146),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 163 mixed awareness batch step 10000000000.0" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=10000000000.0,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 10000000000.0)
  assert_eq(copy.interval_value(), 10000000000.0)
  assert_eq(copy.interval(), 2147483647)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::aware(@date.parse_iso("9999-12-31T00:00:00+00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("9999-12-31")),
      ),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("9999-12-31")),
        @date.RRuleDateTime::aware(@date.parse_iso("9999-12-31T00:00:00+00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([2932895.8842592593, 2932896.0, 2932896.1157407407]),
  )
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-0.23148148148148148, 0.23148148148148148),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-0.23148148148148148, 0.23148148148148148),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.768518518518519, 12.23148158148148),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.768518518518519, 12.23148158148148),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 164 mixed awareness batch step 1000000.0" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=1000000.0,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 1000000.0)
  assert_eq(copy.interval_value(), 1000000.0)
  assert_eq(copy.interval(), 1000000)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("1970-01-01")),
        @date.RRuleDateTime::aware(
          @date.parse_iso("1970-01-01T00:00:00-00:09:21"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      -1.1574074074074073e-05, 0.0, 1.1574074074074073e-05, 2.3148148148148147e-05,
      3.472222222222222e-05, 4.6296296296296294e-05, 5.787037037037037e-05, 6.944444444444444e-05,
      8.101851851851852e-05, 9.259259259259259e-05, 0.00010416666666666667, 0.00011574074074074075,
      0.0001273148148148148, 0.0001388888888888889, 0.00015046296296296297, 0.00016203703703703703,
      0.00017361111111111112, 0.00018518518518518518, 0.00019675925925925926, 0.00020833333333333335,
      0.0002199074074074074, 0.0002314814814814815, 0.00024305555555555555, 0.0002546296296296296,
      0.0002662037037037037, 0.0002777777777777778, 0.00028935185185185184, 0.00030092592592592595,
      0.0003125, 0.00032407407407407406, 0.0003356481481481481, 0.00034722222222222224,
      0.0003587962962962963, 0.00037037037037037035, 0.00038194444444444446, 0.0003935185185185185,
      0.0004050925925925926, 0.0004166666666666667, 0.00042824074074074075, 0.0004398148148148148,
      0.00045138888888888887, 0.000462962962962963, 0.00047453703703703704, 0.0004861111111111111,
      0.0004976851851851852, 0.0005092592592592592, 0.0005208333333333333, 0.0005324074074074074,
      0.0005439814814814814, 0.0005555555555555556, 0.0005671296296296297, 0.0005787037037037037,
      0.0005902777777777778, 0.0006018518518518519, 0.0006134259259259259, 0.000625,
      0.0006365740740740741, 0.0006481481481481481, 0.0006597222222222222, 0.0006712962962962962,
      0.0006828703703703704, 0.0006944444444444445, 0.0007060185185185185, 0.0007175925925925926,
      0.0007291666666666667, 0.0007407407407407407, 0.0007523148148148148, 0.0007638888888888889,
      0.0007754629629629629, 0.000787037037037037, 0.0007986111111111112, 0.0008101851851851852,
      0.0008217592592592593, 0.0008333333333333334, 0.0008449074074074074, 0.0008564814814814815,
      0.0008680555555555555, 0.0008796296296296296, 0.0008912037037037037, 0.0009027777777777777,
      0.0009143518518518518, 0.000925925925925926, 0.0009375, 0.0009490740740740741,
      0.0009606481481481482, 0.0009722222222222222, 0.0009837962962962962, 0.0009953703703703704,
      0.0010069444444444444, 0.0010185185185185184, 0.0010300925925925926, 0.0010416666666666667,
      0.0010532407407407407, 0.0010648148148148149, 0.0010763888888888889, 0.0010879629629629629,
      0.001099537037037037, 0.0011111111111111111, 0.0011226851851851851, 0.0011342592592592593,
      0.0011458333333333333, 0.0011574074074074073, 0.0011689814814814816, 0.0011805555555555556,
      0.0011921296296296296, 0.0012037037037037038, 0.0012152777777777778, 0.0012268518518518518,
      0.001238425925925926, 0.00125, 0.001261574074074074, 0.0012731481481481483,
      0.0012847222222222223, 0.0012962962962962963, 0.0013078703703703703, 0.0013194444444444445,
      0.0013310185185185185, 0.0013425925925925925, 0.0013541666666666667, 0.0013657407407407407,
      0.0013773148148148147, 0.001388888888888889, 0.001400462962962963, 0.001412037037037037,
      0.0014236111111111112, 0.0014351851851851852, 0.0014467592592592592, 0.0014583333333333334,
      0.0014699074074074074, 0.0014814814814814814, 0.0014930555555555556, 0.0015046296296296296,
      0.0015162037037037036, 0.0015277777777777779, 0.0015393518518518519, 0.0015509259259259259,
      0.0015625, 0.001574074074074074, 0.001585648148148148, 0.0015972222222222223,
      0.0016087962962962963, 0.0016203703703703703, 0.0016319444444444445, 0.0016435185185185185,
      0.0016550925925925926, 0.0016666666666666668, 0.0016782407407407408, 0.0016898148148148148,
      0.0017013888888888888, 0.001712962962962963, 0.001724537037037037, 0.001736111111111111,
      0.0017476851851851852, 0.0017592592592592592, 0.0017708333333333332, 0.0017824074074074075,
      0.0017939814814814815, 0.0018055555555555555, 0.0018171296296296297, 0.0018287037037037037,
      0.0018402777777777777, 0.001851851851851852, 0.001863425925925926, 0.001875,
      0.0018865740740740742, 0.0018981481481481482, 0.0019097222222222222, 0.0019212962962962964,
      0.0019328703703703704, 0.0019444444444444444, 0.0019560185185185184, 0.0019675925925925924,
      0.001979166666666667, 0.001990740740740741, 0.002002314814814815, 0.002013888888888889,
      0.002025462962962963, 0.002037037037037037, 0.0020486111111111113, 0.0020601851851851853,
      0.0020717592592592593, 0.0020833333333333333, 0.0020949074074074073, 0.0021064814814814813,
      0.0021180555555555558, 0.0021296296296296298, 0.0021412037037037038, 0.0021527777777777778,
      0.0021643518518518518, 0.0021759259259259258, 0.0021875, 0.002199074074074074,
      0.002210648148148148, 0.0022222222222222222, 0.0022337962962962962, 0.0022453703703703702,
      0.0022569444444444442, 0.0022685185185185187, 0.0022800925925925927, 0.0022916666666666667,
      0.0023032407407407407, 0.0023148148148148147, 0.0023263888888888887, 0.002337962962962963,
      0.002349537037037037, 0.002361111111111111, 0.002372685185185185, 0.002384259259259259,
      0.002395833333333333, 0.0024074074074074076, 0.0024189814814814816, 0.0024305555555555556,
      0.0024421296296296296, 0.0024537037037037036, 0.0024652777777777776, 0.002476851851851852,
      0.002488425925925926, 0.0025, 0.002511574074074074, 0.002523148148148148, 0.002534722222222222,
      0.0025462962962962965, 0.0025578703703703705, 0.0025694444444444445, 0.0025810185185185185,
      0.0025925925925925925, 0.0026041666666666665, 0.0026157407407407405, 0.002627314814814815,
      0.002638888888888889, 0.002650462962962963, 0.002662037037037037, 0.002673611111111111,
      0.002685185185185185, 0.0026967592592592594, 0.0027083333333333334, 0.0027199074074074074,
      0.0027314814814814814, 0.0027430555555555554, 0.0027546296296296294, 0.002766203703703704,
      0.002777777777777778, 0.002789351851851852, 0.002800925925925926, 0.0028125,
      0.002824074074074074, 0.0028356481481481483, 0.0028472222222222223, 0.0028587962962962963,
      0.0028703703703703703, 0.0028819444444444444, 0.0028935185185185184, 0.002905092592592593,
      0.002916666666666667, 0.002928240740740741, 0.002939814814814815, 0.002951388888888889,
      0.002962962962962963, 0.0029745370370370373, 0.0029861111111111113, 0.0029976851851851853,
      0.0030092592592592593, 0.0030208333333333333, 0.0030324074074074073, 0.0030439814814814813,
      0.0030555555555555557, 0.0030671296296296297, 0.0030787037037037037, 0.0030902777777777777,
      0.0031018518518518517, 0.0031134259259259257, 0.003125, 0.003136574074074074,
      0.003148148148148148, 0.003159722222222222, 0.003171296296296296, 0.00318287037037037,
      0.0031944444444444446, 0.0032060185185185186, 0.0032175925925925926, 0.0032291666666666666,
      0.0032407407407407406, 0.0032523148148148147, 0.003263888888888889, 0.003275462962962963,
      0.003287037037037037, 0.003298611111111111, 0.003310185185185185, 0.003321759259259259,
      0.0033333333333333335, 0.0033449074074074076, 0.0033564814814814816, 0.0033680555555555556,
      0.0033796296296296296, 0.0033912037037037036, 0.0034027777777777776, 0.003414351851851852,
      0.003425925925925926, 0.0034375, 0.003449074074074074, 0.003460648148148148,
      0.003472222222222222, 0.0034837962962962965, 0.0034953703703703705, 0.0035069444444444445,
      0.0035185185185185185, 0.0035300925925925925, 0.0035416666666666665, 0.003553240740740741,
      0.003564814814814815, 0.003576388888888889, 0.003587962962962963, 0.003599537037037037,
      0.003611111111111111, 0.0036226851851851854, 0.0036342592592592594, 0.0036458333333333334,
      0.0036574074074074074, 0.0036689814814814814, 0.0036805555555555554, 0.00369212962962963,
      0.003703703703703704, 0.003715277777777778, 0.003726851851851852, 0.003738425925925926,
      0.00375, 0.003761574074074074, 0.0037731481481481483, 0.0037847222222222223,
      0.0037962962962962963, 0.0038078703703703703, 0.0038194444444444443, 0.0038310185185185183,
      0.0038425925925925928, 0.0038541666666666668, 0.0038657407407407408, 0.0038773148148148148,
      0.0038888888888888888, 0.0039004629629629628, 0.003912037037037037, 0.003923611111111111,
      0.003935185185185185, 0.003946759259259259, 0.003958333333333334, 0.003969907407407407,
      0.003981481481481482, 0.003993055555555555, 0.00400462962962963, 0.004016203703703704,
      0.004027777777777778, 0.004039351851851852, 0.004050925925925926, 0.0040625,
      0.004074074074074074, 0.004085648148148148, 0.004097222222222223, 0.004108796296296296,
      0.004120370370370371, 0.004131944444444444, 0.004143518518518519, 0.004155092592592592,
      0.004166666666666667, 0.004178240740740741, 0.004189814814814815, 0.004201388888888889,
      0.004212962962962963, 0.004224537037037037, 0.0042361111111111115, 0.004247685185185185,
      0.0042592592592592595, 0.004270833333333333, 0.0042824074074074075, 0.004293981481481481,
      0.0043055555555555555, 0.00431712962962963, 0.0043287037037037035, 0.004340277777777778,
      0.0043518518518518515, 0.004363425925925926, 0.004375, 0.004386574074074074,
      0.004398148148148148, 0.004409722222222222, 0.004421296296296296, 0.00443287037037037,
      0.0044444444444444444, 0.004456018518518519, 0.0044675925925925924, 0.004479166666666667,
      0.0044907407407407405, 0.004502314814814815, 0.0045138888888888885, 0.004525462962962963,
      0.004537037037037037, 0.004548611111111111, 0.004560185185185185, 0.004571759259259259,
      0.004583333333333333, 0.004594907407407408, 0.004606481481481481, 0.004618055555555556,
      0.004629629629629629, 0.004641203703703704, 0.004652777777777777, 0.004664351851851852,
      0.004675925925925926, 0.0046875, 0.004699074074074074, 0.004710648148148148,
      0.004722222222222222, 0.004733796296296297, 0.00474537037037037, 0.004756944444444445,
      0.004768518518518518, 0.004780092592592593, 0.004791666666666666, 0.004803240740740741,
      0.004814814814814815, 0.004826388888888889, 0.004837962962962963, 0.004849537037037037,
      0.004861111111111111, 0.004872685185185185, 0.004884259259259259, 0.004895833333333334,
      0.004907407407407407, 0.004918981481481482, 0.004930555555555555, 0.00494212962962963,
      0.004953703703703704, 0.004965277777777778, 0.004976851851851852, 0.004988425925925926,
      0.005, 0.005011574074074074, 0.005023148148148148, 0.0050347222222222225, 0.005046296296296296,
      0.0050578703703703706, 0.005069444444444444, 0.0050810185185185186, 0.005092592592592593,
      0.005104166666666667, 0.005115740740740741, 0.005127314814814815, 0.005138888888888889,
      0.005150462962962963, 0.005162037037037037, 0.0051736111111111115, 0.005185185185185185,
      0.0051967592592592595, 0.005208333333333333, 0.0052199074074074075, 0.005231481481481481,
      0.0052430555555555555, 0.00525462962962963, 0.0052662037037037035, 0.005277777777777778,
      0.0052893518518518515, 0.005300925925925926, 0.0053125, 0.005324074074074074,
      0.005335648148148148, 0.005347222222222222, 0.005358796296296296, 0.00537037037037037,
      0.005381944444444444, 0.005393518518518519, 0.005405092592592592, 0.005416666666666667,
      0.00542824074074074, 0.005439814814814815, 0.005451388888888889, 0.005462962962962963,
      0.005474537037037037, 0.005486111111111111, 0.005497685185185185, 0.005509259259259259,
      0.005520833333333333, 0.005532407407407408, 0.005543981481481481, 0.005555555555555556,
      0.005567129629629629, 0.005578703703703704, 0.005590277777777777, 0.005601851851851852,
      0.005613425925925926, 0.005625, 0.005636574074074074, 0.005648148148148148,
      0.005659722222222222, 0.005671296296296297, 0.00568287037037037, 0.005694444444444445,
      0.005706018518518518, 0.005717592592592593, 0.005729166666666666, 0.005740740740740741,
      0.005752314814814815, 0.005763888888888889, 0.005775462962962963, 0.005787037037037037,
      0.005798611111111111, 0.005810185185185186, 0.005821759259259259, 0.005833333333333334,
      0.005844907407407407, 0.005856481481481482, 0.005868055555555555, 0.00587962962962963,
      0.005891203703703704, 0.005902777777777778, 0.005914351851851852, 0.005925925925925926,
      0.0059375, 0.0059490740740740745, 0.005960648148148148, 0.0059722222222222225,
      0.005983796296296296, 0.0059953703703703705, 0.006006944444444444, 0.0060185185185185185,
      0.006030092592592593, 0.0060416666666666665, 0.006053240740740741, 0.0060648148148148145,
      0.006076388888888889, 0.0060879629629629626, 0.006099537037037037, 0.006111111111111111,
      0.006122685185185185, 0.0061342592592592594, 0.006145833333333333, 0.0061574074074074074,
      0.006168981481481482, 0.0061805555555555555, 0.00619212962962963, 0.0062037037037037035,
      0.006215277777777778, 0.0062268518518518515, 0.006238425925925926, 0.00625,
      0.006261574074074074,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::aware(
          @date.parse_iso("1970-01-01T00:00:00-00:09:21"),
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("1970-01-01")),
      ),
    ) catch {
      _ => None
    },
    Some([
      -1.1574074074074073e-05, 0.0, 1.1574074074074073e-05, 2.3148148148148147e-05,
      3.472222222222222e-05, 4.6296296296296294e-05, 5.787037037037037e-05, 6.944444444444444e-05,
      8.101851851851852e-05, 9.259259259259259e-05, 0.00010416666666666667, 0.00011574074074074075,
      0.0001273148148148148, 0.0001388888888888889, 0.00015046296296296297, 0.00016203703703703703,
      0.00017361111111111112, 0.00018518518518518518, 0.00019675925925925926, 0.00020833333333333335,
      0.0002199074074074074, 0.0002314814814814815, 0.00024305555555555555, 0.0002546296296296296,
      0.0002662037037037037, 0.0002777777777777778, 0.00028935185185185184, 0.00030092592592592595,
      0.0003125, 0.00032407407407407406, 0.0003356481481481481, 0.00034722222222222224,
      0.0003587962962962963, 0.00037037037037037035, 0.00038194444444444446, 0.0003935185185185185,
      0.0004050925925925926, 0.0004166666666666667, 0.00042824074074074075, 0.0004398148148148148,
      0.00045138888888888887, 0.000462962962962963, 0.00047453703703703704, 0.0004861111111111111,
      0.0004976851851851852, 0.0005092592592592592, 0.0005208333333333333, 0.0005324074074074074,
      0.0005439814814814814, 0.0005555555555555556, 0.0005671296296296297, 0.0005787037037037037,
      0.0005902777777777778, 0.0006018518518518519, 0.0006134259259259259, 0.000625,
      0.0006365740740740741, 0.0006481481481481481, 0.0006597222222222222, 0.0006712962962962962,
      0.0006828703703703704, 0.0006944444444444445, 0.0007060185185185185, 0.0007175925925925926,
      0.0007291666666666667, 0.0007407407407407407, 0.0007523148148148148, 0.0007638888888888889,
      0.0007754629629629629, 0.000787037037037037, 0.0007986111111111112, 0.0008101851851851852,
      0.0008217592592592593, 0.0008333333333333334, 0.0008449074074074074, 0.0008564814814814815,
      0.0008680555555555555, 0.0008796296296296296, 0.0008912037037037037, 0.0009027777777777777,
      0.0009143518518518518, 0.000925925925925926, 0.0009375, 0.0009490740740740741,
      0.0009606481481481482, 0.0009722222222222222, 0.0009837962962962962, 0.0009953703703703704,
      0.0010069444444444444, 0.0010185185185185184, 0.0010300925925925926, 0.0010416666666666667,
      0.0010532407407407407, 0.0010648148148148149, 0.0010763888888888889, 0.0010879629629629629,
      0.001099537037037037, 0.0011111111111111111, 0.0011226851851851851, 0.0011342592592592593,
      0.0011458333333333333, 0.0011574074074074073, 0.0011689814814814816, 0.0011805555555555556,
      0.0011921296296296296, 0.0012037037037037038, 0.0012152777777777778, 0.0012268518518518518,
      0.001238425925925926, 0.00125, 0.001261574074074074, 0.0012731481481481483,
      0.0012847222222222223, 0.0012962962962962963, 0.0013078703703703703, 0.0013194444444444445,
      0.0013310185185185185, 0.0013425925925925925, 0.0013541666666666667, 0.0013657407407407407,
      0.0013773148148148147, 0.001388888888888889, 0.001400462962962963, 0.001412037037037037,
      0.0014236111111111112, 0.0014351851851851852, 0.0014467592592592592, 0.0014583333333333334,
      0.0014699074074074074, 0.0014814814814814814, 0.0014930555555555556, 0.0015046296296296296,
      0.0015162037037037036, 0.0015277777777777779, 0.0015393518518518519, 0.0015509259259259259,
      0.0015625, 0.001574074074074074, 0.001585648148148148, 0.0015972222222222223,
      0.0016087962962962963, 0.0016203703703703703, 0.0016319444444444445, 0.0016435185185185185,
      0.0016550925925925926, 0.0016666666666666668, 0.0016782407407407408, 0.0016898148148148148,
      0.0017013888888888888, 0.001712962962962963, 0.001724537037037037, 0.001736111111111111,
      0.0017476851851851852, 0.0017592592592592592, 0.0017708333333333332, 0.0017824074074074075,
      0.0017939814814814815, 0.0018055555555555555, 0.0018171296296296297, 0.0018287037037037037,
      0.0018402777777777777, 0.001851851851851852, 0.001863425925925926, 0.001875,
      0.0018865740740740742, 0.0018981481481481482, 0.0019097222222222222, 0.0019212962962962964,
      0.0019328703703703704, 0.0019444444444444444, 0.0019560185185185184, 0.0019675925925925924,
      0.001979166666666667, 0.001990740740740741, 0.002002314814814815, 0.002013888888888889,
      0.002025462962962963, 0.002037037037037037, 0.0020486111111111113, 0.0020601851851851853,
      0.0020717592592592593, 0.0020833333333333333, 0.0020949074074074073, 0.0021064814814814813,
      0.0021180555555555558, 0.0021296296296296298, 0.0021412037037037038, 0.0021527777777777778,
      0.0021643518518518518, 0.0021759259259259258, 0.0021875, 0.002199074074074074,
      0.002210648148148148, 0.0022222222222222222, 0.0022337962962962962, 0.0022453703703703702,
      0.0022569444444444442, 0.0022685185185185187, 0.0022800925925925927, 0.0022916666666666667,
      0.0023032407407407407, 0.0023148148148148147, 0.0023263888888888887, 0.002337962962962963,
      0.002349537037037037, 0.002361111111111111, 0.002372685185185185, 0.002384259259259259,
      0.002395833333333333, 0.0024074074074074076, 0.0024189814814814816, 0.0024305555555555556,
      0.0024421296296296296, 0.0024537037037037036, 0.0024652777777777776, 0.002476851851851852,
      0.002488425925925926, 0.0025, 0.002511574074074074, 0.002523148148148148, 0.002534722222222222,
      0.0025462962962962965, 0.0025578703703703705, 0.0025694444444444445, 0.0025810185185185185,
      0.0025925925925925925, 0.0026041666666666665, 0.0026157407407407405, 0.002627314814814815,
      0.002638888888888889, 0.002650462962962963, 0.002662037037037037, 0.002673611111111111,
      0.002685185185185185, 0.0026967592592592594, 0.0027083333333333334, 0.0027199074074074074,
      0.0027314814814814814, 0.0027430555555555554, 0.0027546296296296294, 0.002766203703703704,
      0.002777777777777778, 0.002789351851851852, 0.002800925925925926, 0.0028125,
      0.002824074074074074, 0.0028356481481481483, 0.0028472222222222223, 0.0028587962962962963,
      0.0028703703703703703, 0.0028819444444444444, 0.0028935185185185184, 0.002905092592592593,
      0.002916666666666667, 0.002928240740740741, 0.002939814814814815, 0.002951388888888889,
      0.002962962962962963, 0.0029745370370370373, 0.0029861111111111113, 0.0029976851851851853,
      0.0030092592592592593, 0.0030208333333333333, 0.0030324074074074073, 0.0030439814814814813,
      0.0030555555555555557, 0.0030671296296296297, 0.0030787037037037037, 0.0030902777777777777,
      0.0031018518518518517, 0.0031134259259259257, 0.003125, 0.003136574074074074,
      0.003148148148148148, 0.003159722222222222, 0.003171296296296296, 0.00318287037037037,
      0.0031944444444444446, 0.0032060185185185186, 0.0032175925925925926, 0.0032291666666666666,
      0.0032407407407407406, 0.0032523148148148147, 0.003263888888888889, 0.003275462962962963,
      0.003287037037037037, 0.003298611111111111, 0.003310185185185185, 0.003321759259259259,
      0.0033333333333333335, 0.0033449074074074076, 0.0033564814814814816, 0.0033680555555555556,
      0.0033796296296296296, 0.0033912037037037036, 0.0034027777777777776, 0.003414351851851852,
      0.003425925925925926, 0.0034375, 0.003449074074074074, 0.003460648148148148,
      0.003472222222222222, 0.0034837962962962965, 0.0034953703703703705, 0.0035069444444444445,
      0.0035185185185185185, 0.0035300925925925925, 0.0035416666666666665, 0.003553240740740741,
      0.003564814814814815, 0.003576388888888889, 0.003587962962962963, 0.003599537037037037,
      0.003611111111111111, 0.0036226851851851854, 0.0036342592592592594, 0.0036458333333333334,
      0.0036574074074074074, 0.0036689814814814814, 0.0036805555555555554, 0.00369212962962963,
      0.003703703703703704, 0.003715277777777778, 0.003726851851851852, 0.003738425925925926,
      0.00375, 0.003761574074074074, 0.0037731481481481483, 0.0037847222222222223,
      0.0037962962962962963, 0.0038078703703703703, 0.0038194444444444443, 0.0038310185185185183,
      0.0038425925925925928, 0.0038541666666666668, 0.0038657407407407408, 0.0038773148148148148,
      0.0038888888888888888, 0.0039004629629629628, 0.003912037037037037, 0.003923611111111111,
      0.003935185185185185, 0.003946759259259259, 0.003958333333333334, 0.003969907407407407,
      0.003981481481481482, 0.003993055555555555, 0.00400462962962963, 0.004016203703703704,
      0.004027777777777778, 0.004039351851851852, 0.004050925925925926, 0.0040625,
      0.004074074074074074, 0.004085648148148148, 0.004097222222222223, 0.004108796296296296,
      0.004120370370370371, 0.004131944444444444, 0.004143518518518519, 0.004155092592592592,
      0.004166666666666667, 0.004178240740740741, 0.004189814814814815, 0.004201388888888889,
      0.004212962962962963, 0.004224537037037037, 0.0042361111111111115, 0.004247685185185185,
      0.0042592592592592595, 0.004270833333333333, 0.0042824074074074075, 0.004293981481481481,
      0.0043055555555555555, 0.00431712962962963, 0.0043287037037037035, 0.004340277777777778,
      0.0043518518518518515, 0.004363425925925926, 0.004375, 0.004386574074074074,
      0.004398148148148148, 0.004409722222222222, 0.004421296296296296, 0.00443287037037037,
      0.0044444444444444444, 0.004456018518518519, 0.0044675925925925924, 0.004479166666666667,
      0.0044907407407407405, 0.004502314814814815, 0.0045138888888888885, 0.004525462962962963,
      0.004537037037037037, 0.004548611111111111, 0.004560185185185185, 0.004571759259259259,
      0.004583333333333333, 0.004594907407407408, 0.004606481481481481, 0.004618055555555556,
      0.004629629629629629, 0.004641203703703704, 0.004652777777777777, 0.004664351851851852,
      0.004675925925925926, 0.0046875, 0.004699074074074074, 0.004710648148148148,
      0.004722222222222222, 0.004733796296296297, 0.00474537037037037, 0.004756944444444445,
      0.004768518518518518, 0.004780092592592593, 0.004791666666666666, 0.004803240740740741,
      0.004814814814814815, 0.004826388888888889, 0.004837962962962963, 0.004849537037037037,
      0.004861111111111111, 0.004872685185185185, 0.004884259259259259, 0.004895833333333334,
      0.004907407407407407, 0.004918981481481482, 0.004930555555555555, 0.00494212962962963,
      0.004953703703703704, 0.004965277777777778, 0.004976851851851852, 0.004988425925925926,
      0.005, 0.005011574074074074, 0.005023148148148148, 0.0050347222222222225, 0.005046296296296296,
      0.0050578703703703706, 0.005069444444444444, 0.0050810185185185186, 0.005092592592592593,
      0.005104166666666667, 0.005115740740740741, 0.005127314814814815, 0.005138888888888889,
      0.005150462962962963, 0.005162037037037037, 0.0051736111111111115, 0.005185185185185185,
      0.0051967592592592595, 0.005208333333333333, 0.0052199074074074075, 0.005231481481481481,
      0.0052430555555555555, 0.00525462962962963, 0.0052662037037037035, 0.005277777777777778,
      0.0052893518518518515, 0.005300925925925926, 0.0053125, 0.005324074074074074,
      0.005335648148148148, 0.005347222222222222, 0.005358796296296296, 0.00537037037037037,
      0.005381944444444444, 0.005393518518518519, 0.005405092592592592, 0.005416666666666667,
      0.00542824074074074, 0.005439814814814815, 0.005451388888888889, 0.005462962962962963,
      0.005474537037037037, 0.005486111111111111, 0.005497685185185185, 0.005509259259259259,
      0.005520833333333333, 0.005532407407407408, 0.005543981481481481, 0.005555555555555556,
      0.005567129629629629, 0.005578703703703704, 0.005590277777777777, 0.005601851851851852,
      0.005613425925925926, 0.005625, 0.005636574074074074, 0.005648148148148148,
      0.005659722222222222, 0.005671296296296297, 0.00568287037037037, 0.005694444444444445,
      0.005706018518518518, 0.005717592592592593, 0.005729166666666666, 0.005740740740740741,
      0.005752314814814815, 0.005763888888888889, 0.005775462962962963, 0.005787037037037037,
      0.005798611111111111, 0.005810185185185186, 0.005821759259259259, 0.005833333333333334,
      0.005844907407407407, 0.005856481481481482, 0.005868055555555555, 0.00587962962962963,
      0.005891203703703704, 0.005902777777777778, 0.005914351851851852, 0.005925925925925926,
      0.0059375, 0.0059490740740740745, 0.005960648148148148, 0.0059722222222222225,
      0.005983796296296296, 0.0059953703703703705, 0.006006944444444444, 0.0060185185185185185,
      0.006030092592592593, 0.0060416666666666665, 0.006053240740740741, 0.0060648148148148145,
      0.006076388888888889, 0.0060879629629629626, 0.006099537037037037, 0.006111111111111111,
      0.006122685185185185, 0.0061342592592592594, 0.006145833333333333, 0.0061574074074074074,
      0.006168981481481482, 0.0061805555555555555, 0.00619212962962963, 0.0062037037037037035,
      0.006215277777777778, 0.0062268518518518515, 0.006238425925925926, 0.00625,
      0.006261574074074074, 0.006273148148148148, 0.006284722222222222, 0.006296296296296296,
      0.006307870370370371, 0.006319444444444444, 0.006331018518518519, 0.006342592592592592,
      0.006354166666666667, 0.00636574074074074, 0.006377314814814815, 0.006388888888888889,
      0.006400462962962963, 0.006412037037037037, 0.006423611111111111, 0.006435185185185185,
      0.006446759259259259, 0.006458333333333333, 0.006469907407407408, 0.006481481481481481,
      0.006493055555555556, 0.006504629629629629,
    ]),
  )
  assert_eq(adapter.tick_values(0.0, 0.00625), [
    -1.1574074074074073e-05, 0.0, 1.1574074074074073e-05, 2.3148148148148147e-05,
    3.472222222222222e-05, 4.6296296296296294e-05, 5.787037037037037e-05, 6.944444444444444e-05,
    8.101851851851852e-05, 9.259259259259259e-05, 0.00010416666666666667, 0.00011574074074074075,
    0.0001273148148148148, 0.0001388888888888889, 0.00015046296296296297, 0.00016203703703703703,
    0.00017361111111111112, 0.00018518518518518518, 0.00019675925925925926, 0.00020833333333333335,
    0.0002199074074074074, 0.0002314814814814815, 0.00024305555555555555, 0.0002546296296296296,
    0.0002662037037037037, 0.0002777777777777778, 0.00028935185185185184, 0.00030092592592592595,
    0.0003125, 0.00032407407407407406, 0.0003356481481481481, 0.00034722222222222224,
    0.0003587962962962963, 0.00037037037037037035, 0.00038194444444444446, 0.0003935185185185185,
    0.0004050925925925926, 0.0004166666666666667, 0.00042824074074074075, 0.0004398148148148148,
    0.00045138888888888887, 0.000462962962962963, 0.00047453703703703704, 0.0004861111111111111,
    0.0004976851851851852, 0.0005092592592592592, 0.0005208333333333333, 0.0005324074074074074,
    0.0005439814814814814, 0.0005555555555555556, 0.0005671296296296297, 0.0005787037037037037,
    0.0005902777777777778, 0.0006018518518518519, 0.0006134259259259259, 0.000625,
    0.0006365740740740741, 0.0006481481481481481, 0.0006597222222222222, 0.0006712962962962962,
    0.0006828703703703704, 0.0006944444444444445, 0.0007060185185185185, 0.0007175925925925926,
    0.0007291666666666667, 0.0007407407407407407, 0.0007523148148148148, 0.0007638888888888889,
    0.0007754629629629629, 0.000787037037037037, 0.0007986111111111112, 0.0008101851851851852,
    0.0008217592592592593, 0.0008333333333333334, 0.0008449074074074074, 0.0008564814814814815,
    0.0008680555555555555, 0.0008796296296296296, 0.0008912037037037037, 0.0009027777777777777,
    0.0009143518518518518, 0.000925925925925926, 0.0009375, 0.0009490740740740741,
    0.0009606481481481482, 0.0009722222222222222, 0.0009837962962962962, 0.0009953703703703704,
    0.0010069444444444444, 0.0010185185185185184, 0.0010300925925925926, 0.0010416666666666667,
    0.0010532407407407407, 0.0010648148148148149, 0.0010763888888888889, 0.0010879629629629629,
    0.001099537037037037, 0.0011111111111111111, 0.0011226851851851851, 0.0011342592592592593,
    0.0011458333333333333, 0.0011574074074074073, 0.0011689814814814816, 0.0011805555555555556,
    0.0011921296296296296, 0.0012037037037037038, 0.0012152777777777778, 0.0012268518518518518,
    0.001238425925925926, 0.00125, 0.001261574074074074, 0.0012731481481481483, 0.0012847222222222223,
    0.0012962962962962963, 0.0013078703703703703, 0.0013194444444444445, 0.0013310185185185185,
    0.0013425925925925925, 0.0013541666666666667, 0.0013657407407407407, 0.0013773148148148147,
    0.001388888888888889, 0.001400462962962963, 0.001412037037037037, 0.0014236111111111112,
    0.0014351851851851852, 0.0014467592592592592, 0.0014583333333333334, 0.0014699074074074074,
    0.0014814814814814814, 0.0014930555555555556, 0.0015046296296296296, 0.0015162037037037036,
    0.0015277777777777779, 0.0015393518518518519, 0.0015509259259259259, 0.0015625,
    0.001574074074074074, 0.001585648148148148, 0.0015972222222222223, 0.0016087962962962963,
    0.0016203703703703703, 0.0016319444444444445, 0.0016435185185185185, 0.0016550925925925926,
    0.0016666666666666668, 0.0016782407407407408, 0.0016898148148148148, 0.0017013888888888888,
    0.001712962962962963, 0.001724537037037037, 0.001736111111111111, 0.0017476851851851852,
    0.0017592592592592592, 0.0017708333333333332, 0.0017824074074074075, 0.0017939814814814815,
    0.0018055555555555555, 0.0018171296296296297, 0.0018287037037037037, 0.0018402777777777777,
    0.001851851851851852, 0.001863425925925926, 0.001875, 0.0018865740740740742,
    0.0018981481481481482, 0.0019097222222222222, 0.0019212962962962964, 0.0019328703703703704,
    0.0019444444444444444, 0.0019560185185185184, 0.0019675925925925924, 0.001979166666666667,
    0.001990740740740741, 0.002002314814814815, 0.002013888888888889, 0.002025462962962963,
    0.002037037037037037, 0.0020486111111111113, 0.0020601851851851853, 0.0020717592592592593,
    0.0020833333333333333, 0.0020949074074074073, 0.0021064814814814813, 0.0021180555555555558,
    0.0021296296296296298, 0.0021412037037037038, 0.0021527777777777778, 0.0021643518518518518,
    0.0021759259259259258, 0.0021875, 0.002199074074074074, 0.002210648148148148,
    0.0022222222222222222, 0.0022337962962962962, 0.0022453703703703702, 0.0022569444444444442,
    0.0022685185185185187, 0.0022800925925925927, 0.0022916666666666667, 0.0023032407407407407,
    0.0023148148148148147, 0.0023263888888888887, 0.002337962962962963, 0.002349537037037037,
    0.002361111111111111, 0.002372685185185185, 0.002384259259259259, 0.002395833333333333,
    0.0024074074074074076, 0.0024189814814814816, 0.0024305555555555556, 0.0024421296296296296,
    0.0024537037037037036, 0.0024652777777777776, 0.002476851851851852, 0.002488425925925926,
    0.0025, 0.002511574074074074, 0.002523148148148148, 0.002534722222222222, 0.0025462962962962965,
    0.0025578703703703705, 0.0025694444444444445, 0.0025810185185185185, 0.0025925925925925925,
    0.0026041666666666665, 0.0026157407407407405, 0.002627314814814815, 0.002638888888888889,
    0.002650462962962963, 0.002662037037037037, 0.002673611111111111, 0.002685185185185185,
    0.0026967592592592594, 0.0027083333333333334, 0.0027199074074074074, 0.0027314814814814814,
    0.0027430555555555554, 0.0027546296296296294, 0.002766203703703704, 0.002777777777777778,
    0.002789351851851852, 0.002800925925925926, 0.0028125, 0.002824074074074074,
    0.0028356481481481483, 0.0028472222222222223, 0.0028587962962962963, 0.0028703703703703703,
    0.0028819444444444444, 0.0028935185185185184, 0.002905092592592593, 0.002916666666666667,
    0.002928240740740741, 0.002939814814814815, 0.002951388888888889, 0.002962962962962963,
    0.0029745370370370373, 0.0029861111111111113, 0.0029976851851851853, 0.0030092592592592593,
    0.0030208333333333333, 0.0030324074074074073, 0.0030439814814814813, 0.0030555555555555557,
    0.0030671296296296297, 0.0030787037037037037, 0.0030902777777777777, 0.0031018518518518517,
    0.0031134259259259257, 0.003125, 0.003136574074074074, 0.003148148148148148,
    0.003159722222222222, 0.003171296296296296, 0.00318287037037037, 0.0031944444444444446,
    0.0032060185185185186, 0.0032175925925925926, 0.0032291666666666666, 0.0032407407407407406,
    0.0032523148148148147, 0.003263888888888889, 0.003275462962962963, 0.003287037037037037,
    0.003298611111111111, 0.003310185185185185, 0.003321759259259259, 0.0033333333333333335,
    0.0033449074074074076, 0.0033564814814814816, 0.0033680555555555556, 0.0033796296296296296,
    0.0033912037037037036, 0.0034027777777777776, 0.003414351851851852, 0.003425925925925926,
    0.0034375, 0.003449074074074074, 0.003460648148148148, 0.003472222222222222,
    0.0034837962962962965, 0.0034953703703703705, 0.0035069444444444445, 0.0035185185185185185,
    0.0035300925925925925, 0.0035416666666666665, 0.003553240740740741, 0.003564814814814815,
    0.003576388888888889, 0.003587962962962963, 0.003599537037037037, 0.003611111111111111,
    0.0036226851851851854, 0.0036342592592592594, 0.0036458333333333334, 0.0036574074074074074,
    0.0036689814814814814, 0.0036805555555555554, 0.00369212962962963, 0.003703703703703704,
    0.003715277777777778, 0.003726851851851852, 0.003738425925925926, 0.00375, 0.003761574074074074,
    0.0037731481481481483, 0.0037847222222222223, 0.0037962962962962963, 0.0038078703703703703,
    0.0038194444444444443, 0.0038310185185185183, 0.0038425925925925928, 0.0038541666666666668,
    0.0038657407407407408, 0.0038773148148148148, 0.0038888888888888888, 0.0039004629629629628,
    0.003912037037037037, 0.003923611111111111, 0.003935185185185185, 0.003946759259259259,
    0.003958333333333334, 0.003969907407407407, 0.003981481481481482, 0.003993055555555555,
    0.00400462962962963, 0.004016203703703704, 0.004027777777777778, 0.004039351851851852,
    0.004050925925925926, 0.0040625, 0.004074074074074074, 0.004085648148148148,
    0.004097222222222223, 0.004108796296296296, 0.004120370370370371, 0.004131944444444444,
    0.004143518518518519, 0.004155092592592592, 0.004166666666666667, 0.004178240740740741,
    0.004189814814814815, 0.004201388888888889, 0.004212962962962963, 0.004224537037037037,
    0.0042361111111111115, 0.004247685185185185, 0.0042592592592592595, 0.004270833333333333,
    0.0042824074074074075, 0.004293981481481481, 0.0043055555555555555, 0.00431712962962963,
    0.0043287037037037035, 0.004340277777777778, 0.0043518518518518515, 0.004363425925925926,
    0.004375, 0.004386574074074074, 0.004398148148148148, 0.004409722222222222, 0.004421296296296296,
    0.00443287037037037, 0.0044444444444444444, 0.004456018518518519, 0.0044675925925925924,
    0.004479166666666667, 0.0044907407407407405, 0.004502314814814815, 0.0045138888888888885,
    0.004525462962962963, 0.004537037037037037, 0.004548611111111111, 0.004560185185185185,
    0.004571759259259259, 0.004583333333333333, 0.004594907407407408, 0.004606481481481481,
    0.004618055555555556, 0.004629629629629629, 0.004641203703703704, 0.004652777777777777,
    0.004664351851851852, 0.004675925925925926, 0.0046875, 0.004699074074074074,
    0.004710648148148148, 0.004722222222222222, 0.004733796296296297, 0.00474537037037037,
    0.004756944444444445, 0.004768518518518518, 0.004780092592592593, 0.004791666666666666,
    0.004803240740740741, 0.004814814814814815, 0.004826388888888889, 0.004837962962962963,
    0.004849537037037037, 0.004861111111111111, 0.004872685185185185, 0.004884259259259259,
    0.004895833333333334, 0.004907407407407407, 0.004918981481481482, 0.004930555555555555,
    0.00494212962962963, 0.004953703703703704, 0.004965277777777778, 0.004976851851851852,
    0.004988425925925926, 0.005, 0.005011574074074074, 0.005023148148148148, 0.0050347222222222225,
    0.005046296296296296, 0.0050578703703703706, 0.005069444444444444, 0.0050810185185185186,
    0.005092592592592593, 0.005104166666666667, 0.005115740740740741, 0.005127314814814815,
    0.005138888888888889, 0.005150462962962963, 0.005162037037037037, 0.0051736111111111115,
    0.005185185185185185, 0.0051967592592592595, 0.005208333333333333, 0.0052199074074074075,
    0.005231481481481481, 0.0052430555555555555, 0.00525462962962963, 0.0052662037037037035,
    0.005277777777777778, 0.0052893518518518515, 0.005300925925925926, 0.0053125,
    0.005324074074074074, 0.005335648148148148, 0.005347222222222222, 0.005358796296296296,
    0.00537037037037037, 0.005381944444444444, 0.005393518518518519, 0.005405092592592592,
    0.005416666666666667, 0.00542824074074074, 0.005439814814814815, 0.005451388888888889,
    0.005462962962962963, 0.005474537037037037, 0.005486111111111111, 0.005497685185185185,
    0.005509259259259259, 0.005520833333333333, 0.005532407407407408, 0.005543981481481481,
    0.005555555555555556, 0.005567129629629629, 0.005578703703703704, 0.005590277777777777,
    0.005601851851851852, 0.005613425925925926, 0.005625, 0.005636574074074074, 0.005648148148148148,
    0.005659722222222222, 0.005671296296296297, 0.00568287037037037, 0.005694444444444445,
    0.005706018518518518, 0.005717592592592593, 0.005729166666666666, 0.005740740740740741,
    0.005752314814814815, 0.005763888888888889, 0.005775462962962963, 0.005787037037037037,
    0.005798611111111111, 0.005810185185185186, 0.005821759259259259, 0.005833333333333334,
    0.005844907407407407, 0.005856481481481482, 0.005868055555555555, 0.00587962962962963,
    0.005891203703703704, 0.005902777777777778, 0.005914351851851852, 0.005925925925925926,
    0.0059375, 0.0059490740740740745, 0.005960648148148148, 0.0059722222222222225,
    0.005983796296296296, 0.0059953703703703705, 0.006006944444444444, 0.0060185185185185185,
    0.006030092592592593, 0.0060416666666666665, 0.006053240740740741, 0.0060648148148148145,
    0.006076388888888889, 0.0060879629629629626, 0.006099537037037037, 0.006111111111111111,
    0.006122685185185185, 0.0061342592592592594, 0.006145833333333333, 0.0061574074074074074,
    0.006168981481481482, 0.0061805555555555555, 0.00619212962962963, 0.0062037037037037035,
    0.006215277777777778, 0.0062268518518518515, 0.006238425925925926, 0.00625, 0.006261574074074074,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-05, 2.3148148148148147e-05),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-05, 2.3148148148148147e-05),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999976851851851, 12.000023248148148),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999976851851851, 12.000023248148148),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 165 mixed awareness batch step 1000000.0" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=1000000.0,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 1000000.0)
  assert_eq(copy.interval_value(), 1000000.0)
  assert_eq(copy.interval(), 1000000)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("1970-01-01")),
        @date.RRuleDateTime::aware(
          @date.parse_iso("1970-01-01T00:00:00-00:01:01"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      -1.1574074074074073e-05, 0.0, 1.1574074074074073e-05, 2.3148148148148147e-05,
      3.472222222222222e-05, 4.6296296296296294e-05, 5.787037037037037e-05, 6.944444444444444e-05,
      8.101851851851852e-05, 9.259259259259259e-05, 0.00010416666666666667, 0.00011574074074074075,
      0.0001273148148148148, 0.0001388888888888889, 0.00015046296296296297, 0.00016203703703703703,
      0.00017361111111111112, 0.00018518518518518518, 0.00019675925925925926, 0.00020833333333333335,
      0.0002199074074074074, 0.0002314814814814815, 0.00024305555555555555, 0.0002546296296296296,
      0.0002662037037037037, 0.0002777777777777778, 0.00028935185185185184, 0.00030092592592592595,
      0.0003125, 0.00032407407407407406, 0.0003356481481481481, 0.00034722222222222224,
      0.0003587962962962963, 0.00037037037037037035, 0.00038194444444444446, 0.0003935185185185185,
      0.0004050925925925926, 0.0004166666666666667, 0.00042824074074074075, 0.0004398148148148148,
      0.00045138888888888887, 0.000462962962962963, 0.00047453703703703704, 0.0004861111111111111,
      0.0004976851851851852, 0.0005092592592592592, 0.0005208333333333333, 0.0005324074074074074,
      0.0005439814814814814, 0.0005555555555555556, 0.0005671296296296297, 0.0005787037037037037,
      0.0005902777777777778, 0.0006018518518518519, 0.0006134259259259259, 0.000625,
      0.0006365740740740741, 0.0006481481481481481, 0.0006597222222222222, 0.0006712962962962962,
      0.0006828703703703704, 0.0006944444444444445, 0.0007060185185185185,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::aware(
          @date.parse_iso("1970-01-01T00:00:00-00:01:01"),
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("1970-01-01")),
      ),
    ) catch {
      _ => None
    },
    Some([
      -1.1574074074074073e-05, 0.0, 1.1574074074074073e-05, 2.3148148148148147e-05,
      3.472222222222222e-05, 4.6296296296296294e-05, 5.787037037037037e-05, 6.944444444444444e-05,
      8.101851851851852e-05, 9.259259259259259e-05, 0.00010416666666666667, 0.00011574074074074075,
      0.0001273148148148148, 0.0001388888888888889, 0.00015046296296296297, 0.00016203703703703703,
      0.00017361111111111112, 0.00018518518518518518, 0.00019675925925925926, 0.00020833333333333335,
      0.0002199074074074074, 0.0002314814814814815, 0.00024305555555555555, 0.0002546296296296296,
      0.0002662037037037037, 0.0002777777777777778, 0.00028935185185185184, 0.00030092592592592595,
      0.0003125, 0.00032407407407407406, 0.0003356481481481481, 0.00034722222222222224,
      0.0003587962962962963, 0.00037037037037037035, 0.00038194444444444446, 0.0003935185185185185,
      0.0004050925925925926, 0.0004166666666666667, 0.00042824074074074075, 0.0004398148148148148,
      0.00045138888888888887, 0.000462962962962963, 0.00047453703703703704, 0.0004861111111111111,
      0.0004976851851851852, 0.0005092592592592592, 0.0005208333333333333, 0.0005324074074074074,
      0.0005439814814814814, 0.0005555555555555556, 0.0005671296296296297, 0.0005787037037037037,
      0.0005902777777777778, 0.0006018518518518519, 0.0006134259259259259, 0.000625,
      0.0006365740740740741, 0.0006481481481481481, 0.0006597222222222222, 0.0006712962962962962,
      0.0006828703703703704, 0.0006944444444444445, 0.0007060185185185185, 0.0007175925925925926,
    ]),
  )
  assert_eq(adapter.tick_values(0.0, 0.0006944444444444445), [
    -1.1574074074074073e-05, 0.0, 1.1574074074074073e-05, 2.3148148148148147e-05,
    3.472222222222222e-05, 4.6296296296296294e-05, 5.787037037037037e-05, 6.944444444444444e-05,
    8.101851851851852e-05, 9.259259259259259e-05, 0.00010416666666666667, 0.00011574074074074075,
    0.0001273148148148148, 0.0001388888888888889, 0.00015046296296296297, 0.00016203703703703703,
    0.00017361111111111112, 0.00018518518518518518, 0.00019675925925925926, 0.00020833333333333335,
    0.0002199074074074074, 0.0002314814814814815, 0.00024305555555555555, 0.0002546296296296296,
    0.0002662037037037037, 0.0002777777777777778, 0.00028935185185185184, 0.00030092592592592595,
    0.0003125, 0.00032407407407407406, 0.0003356481481481481, 0.00034722222222222224,
    0.0003587962962962963, 0.00037037037037037035, 0.00038194444444444446, 0.0003935185185185185,
    0.0004050925925925926, 0.0004166666666666667, 0.00042824074074074075, 0.0004398148148148148,
    0.00045138888888888887, 0.000462962962962963, 0.00047453703703703704, 0.0004861111111111111,
    0.0004976851851851852, 0.0005092592592592592, 0.0005208333333333333, 0.0005324074074074074,
    0.0005439814814814814, 0.0005555555555555556, 0.0005671296296296297, 0.0005787037037037037,
    0.0005902777777777778, 0.0006018518518518519, 0.0006134259259259259, 0.000625,
    0.0006365740740740741, 0.0006481481481481481, 0.0006597222222222222, 0.0006712962962962962,
    0.0006828703703703704, 0.0006944444444444445, 0.0007060185185185185,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-05, 2.3148148148148147e-05),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-05, 2.3148148148148147e-05),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999976851851851, 12.000023248148148),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999976851851851, 12.000023248148148),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 166 mixed awareness batch step 1000000.0" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=1000000.0,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 1000000.0)
  assert_eq(copy.interval_value(), 1000000.0)
  assert_eq(copy.interval(), 1000000)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("1970-01-01")),
        @date.RRuleDateTime::aware(
          @date.parse_iso("1970-01-01T00:00:00-00:00:59"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([-1.1574074074074073e-05, 0.0, 1.1574074074074073e-05]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::aware(
          @date.parse_iso("1970-01-01T00:00:00-00:00:59"),
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("1970-01-01")),
      ),
    ) catch {
      _ => None
    },
    Some([
      -1.1574074074074073e-05, 0.0, 1.1574074074074073e-05, 2.3148148148148147e-05,
      3.472222222222222e-05, 4.6296296296296294e-05, 5.787037037037037e-05, 6.944444444444444e-05,
      8.101851851851852e-05, 9.259259259259259e-05, 0.00010416666666666667, 0.00011574074074074075,
      0.0001273148148148148, 0.0001388888888888889, 0.00015046296296296297, 0.00016203703703703703,
      0.00017361111111111112, 0.00018518518518518518, 0.00019675925925925926, 0.00020833333333333335,
      0.0002199074074074074, 0.0002314814814814815, 0.00024305555555555555, 0.0002546296296296296,
      0.0002662037037037037, 0.0002777777777777778, 0.00028935185185185184, 0.00030092592592592595,
      0.0003125, 0.00032407407407407406, 0.0003356481481481481, 0.00034722222222222224,
      0.0003587962962962963, 0.00037037037037037035, 0.00038194444444444446, 0.0003935185185185185,
      0.0004050925925925926, 0.0004166666666666667, 0.00042824074074074075, 0.0004398148148148148,
      0.00045138888888888887, 0.000462962962962963, 0.00047453703703703704, 0.0004861111111111111,
      0.0004976851851851852, 0.0005092592592592592, 0.0005208333333333333, 0.0005324074074074074,
      0.0005439814814814814, 0.0005555555555555556, 0.0005671296296296297, 0.0005787037037037037,
      0.0005902777777777778, 0.0006018518518518519, 0.0006134259259259259, 0.000625,
      0.0006365740740740741, 0.0006481481481481481, 0.0006597222222222222, 0.0006712962962962962,
      0.0006828703703703704, 0.0006944444444444445,
    ]),
  )
  assert_eq(adapter.tick_values(0.0, 0.0), [
    -1.1574074074074073e-05, 0.0, 1.1574074074074073e-05,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-05, 2.3148148148148147e-05),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-05, 2.3148148148148147e-05),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999976851851851, 12.000023248148148),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999976851851851, 12.000023248148148),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 167 mixed awareness batch step 1000000.0" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=1000000.0,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 1000000.0)
  assert_eq(copy.interval_value(), 1000000.0)
  assert_eq(copy.interval(), 1000000)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("1970-01-01")),
        @date.RRuleDateTime::aware(
          @date.parse_iso("1970-01-01T00:00:00+00:00:59"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([-1.1574074074074073e-05, 0.0, 1.1574074074074073e-05]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::aware(
          @date.parse_iso("1970-01-01T00:00:00+00:00:59"),
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("1970-01-01")),
      ),
    ) catch {
      _ => None
    },
    Some([
      -0.000694444444444442, -0.0006828703703704031, -0.0006712962962962532, -0.0006597222222222143,
      -0.0006481481481481755, -0.0006365740740740256, -0.0006249999999999867, -0.0006134259259259478,
      -0.0006018518518517979, -0.000590277777777759, -0.0005787037037037202, -0.0005671296296296813,
      -0.0005555555555555314, -0.0005439814814814925, -0.0005324074074074536, -0.0005208333333333037,
      -0.0005092592592592649, -0.000497685185185226, -0.0004861111111110761, -0.0004745370370370372,
      -0.0004629629629629983, -0.00045138888888884843, -0.00043981481481480955, -0.0004282407407407707,
      -0.0004166666666666208, -0.0004050925925925819, -0.000393518518518543, -0.00038194444444439313,
      -0.00037037037037035425, -0.0003587962962963154, -0.0003472222222222765, -0.0003356481481481266,
      -0.0003240740740740877, -0.00031250000000004885, -0.00030092592592589895, -0.0002893518518518601,
      -0.0002777777777778212, -0.0002662037037036713, -0.0002546296296296324, -0.00024305555555559355,
      -0.00023148148148144365, -0.00021990740740740478, -0.0002083333333333659, -0.000196759259259216,
      -0.00018518518518517713, -0.00017361111111113825, -0.00016203703703698835,
      -0.00015046296296294948, -0.0001388888888889106, -0.0001273148148147607, -0.00011574074074072183,
      -0.00010416666666668295, -9.259259259264407e-05, -8.101851851849418e-05, -6.94444444444553e-05,
      -5.7870370370416424e-05, -4.6296296296266526e-05, -3.472222222222765e-05, -2.3148148148188774e-05,
      -1.1574074074038876e-05, 0.0, 1.1574074074038876e-05,
    ]),
  )
  assert_eq(adapter.tick_values(0.0, 0.0), [
    -1.1574074074074073e-05, 0.0, 1.1574074074074073e-05,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-05, 2.3148148148148147e-05),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-05, 2.3148148148148147e-05),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999976851851851, 12.000023248148148),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999976851851851, 12.000023248148148),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 168 mixed awareness batch step 1000000.0" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(
    interval=1000000.0,
    context~,
    timezone=zone_utc,
  )
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 1000000.0)
  assert_eq(copy.interval_value(), 1000000.0)
  assert_eq(copy.interval(), 1000000)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("1970-01-01")),
        @date.RRuleDateTime::aware(
          @date.parse_iso("1970-01-01T00:00:00+00:01:01"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      -0.0007060185185185185, -0.0006944444444444445, -0.0006828703703703704, -0.0006712962962962962,
      -0.0006597222222222222, -0.0006481481481481481, -0.0006365740740740741, -0.000625,
      -0.0006134259259259259, -0.0006018518518518519, -0.0005902777777777778, -0.0005787037037037037,
      -0.0005671296296296297, -0.0005555555555555556, -0.0005439814814814814, -0.0005324074074074074,
      -0.0005208333333333333, -0.0005092592592592592, -0.0004976851851851852, -0.0004861111111111111,
      -0.00047453703703703704, -0.000462962962962963, -0.00045138888888888887, -0.0004398148148148148,
      -0.00042824074074074075, -0.0004166666666666667, -0.0004050925925925926, -0.0003935185185185185,
      -0.00038194444444444446, -0.00037037037037037035, -0.0003587962962962963, -0.00034722222222222224,
      -0.0003356481481481481, -0.00032407407407407406, -0.0003125, -0.00030092592592592595,
      -0.00028935185185185184, -0.0002777777777777778, -0.0002662037037037037, -0.0002546296296296296,
      -0.00024305555555555555, -0.0002314814814814815, -0.0002199074074074074, -0.00020833333333333335,
      -0.00019675925925925926, -0.00018518518518518518, -0.00017361111111111112,
      -0.00016203703703703703, -0.00015046296296296297, -0.0001388888888888889, -0.0001273148148148148,
      -0.00011574074074074075, -0.00010416666666666667, -9.259259259259259e-05, -8.101851851851852e-05,
      -6.944444444444444e-05, -5.787037037037037e-05, -4.6296296296296294e-05, -3.472222222222222e-05,
      -2.3148148148148147e-05, -1.1574074074074073e-05, 0.0, 1.1574074074074073e-05,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::aware(
          @date.parse_iso("1970-01-01T00:00:00+00:01:01"),
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("1970-01-01")),
      ),
    ) catch {
      _ => None
    },
    Some([
      -0.0007175925925926308, -0.0007060185185184809, -0.000694444444444442, -0.0006828703703704031,
      -0.0006712962962962532, -0.0006597222222222143, -0.0006481481481481755, -0.0006365740740740256,
      -0.0006249999999999867, -0.0006134259259259478, -0.0006018518518517979, -0.000590277777777759,
      -0.0005787037037037202, -0.0005671296296296813, -0.0005555555555555314, -0.0005439814814814925,
      -0.0005324074074074536, -0.0005208333333333037, -0.0005092592592592649, -0.000497685185185226,
      -0.0004861111111110761, -0.0004745370370370372, -0.0004629629629629983, -0.00045138888888884843,
      -0.00043981481481480955, -0.0004282407407407707, -0.0004166666666666208, -0.0004050925925925819,
      -0.000393518518518543, -0.00038194444444439313, -0.00037037037037035425, -0.0003587962962963154,
      -0.0003472222222222765, -0.0003356481481481266, -0.0003240740740740877, -0.00031250000000004885,
      -0.00030092592592589895, -0.0002893518518518601, -0.0002777777777778212, -0.0002662037037036713,
      -0.0002546296296296324, -0.00024305555555559355, -0.00023148148148144365, -0.00021990740740740478,
      -0.0002083333333333659, -0.000196759259259216, -0.00018518518518517713, -0.00017361111111113825,
      -0.00016203703703698835, -0.00015046296296294948, -0.0001388888888889106, -0.0001273148148147607,
      -0.00011574074074072183, -0.00010416666666668295, -9.259259259264407e-05, -8.101851851849418e-05,
      -6.94444444444553e-05, -5.7870370370416424e-05, -4.6296296296266526e-05, -3.472222222222765e-05,
      -2.3148148148188774e-05, -1.1574074074038876e-05, 0.0, 1.1574074074038876e-05,
    ]),
  )
  assert_eq(adapter.tick_values(0.0, -0.0006944444444444445), [
    1.1574074074038876e-05, 0.0, -1.1574074074038876e-05, -2.3148148148188774e-05,
    -3.472222222222765e-05, -4.6296296296266526e-05, -5.7870370370416424e-05, -6.94444444444553e-05,
    -8.101851851849418e-05, -9.259259259264407e-05, -0.00010416666666668295, -0.00011574074074072183,
    -0.0001273148148147607, -0.0001388888888889106, -0.00015046296296294948, -0.00016203703703698835,
    -0.00017361111111113825, -0.00018518518518517713, -0.000196759259259216, -0.0002083333333333659,
    -0.00021990740740740478, -0.00023148148148144365, -0.00024305555555559355, -0.0002546296296296324,
    -0.0002662037037036713, -0.0002777777777778212, -0.0002893518518518601, -0.00030092592592589895,
    -0.00031250000000004885, -0.0003240740740740877, -0.0003356481481481266, -0.0003472222222222765,
    -0.0003587962962963154, -0.00037037037037035425, -0.00038194444444439313, -0.000393518518518543,
    -0.0004050925925925819, -0.0004166666666666208, -0.0004282407407407707, -0.00043981481481480955,
    -0.00045138888888884843, -0.0004629629629629983, -0.0004745370370370372, -0.0004861111111110761,
    -0.000497685185185226, -0.0005092592592592649, -0.0005208333333333037, -0.0005324074074074536,
    -0.0005439814814814925, -0.0005555555555555314, -0.0005671296296296813, -0.0005787037037037202,
    -0.000590277777777759, -0.0006018518518517979, -0.0006134259259259478, -0.0006249999999999867,
    -0.0006365740740740256, -0.0006481481481481755, -0.0006597222222222143, -0.0006712962962962532,
    -0.0006828703703704031, -0.000694444444444442, -0.0007060185185184809,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-05, 2.3148148148148147e-05),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-2.3148148148148147e-05, 2.3148148148148147e-05),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999976851851851, 12.000023248148148),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999976851851851, 12.000023248148148),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 169 invalid interval after display capture step 0.0" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  ignore(zone_utc)
  assert_true(
    try {
      ignore(
        @date.MicrosecondLocator::new(interval=0.0, context~, timezone=zone_utc),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 170 invalid interval after display capture step -1.0" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  ignore(zone_utc)
  assert_true(
    try {
      ignore(
        @date.MicrosecondLocator::new(
          interval=-1.0,
          context~,
          timezone=zone_utc,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 171 invalid display before interval step 0.0" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  assert_true(
    try {
      ignore(
        @date.MicrosecondLocator::new(
          interval=0.0,
          context~,
          tz="invalid/D19-reference",
        ),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_eq(calls.val, 0)
}

///|
test "MicrosecondLocator original 172 capture default rc step 0.5" {
  let previous_rc = @config.timezone()
  defer @config.set_timezone(previous_rc)
  @config.set_timezone("XST-5:45")
  let calls = Ref(0)
  let context = @date.DateParserContext::from_posix("UTC0", clock=fn() {
    calls.val += 1
    1781524800123L
  })
  let locator = @date.MicrosecondLocator::new(interval=0.5, context~)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  @config.set_timezone("UTC")
  assert_eq(locator.interval(), 0.5)
  assert_eq(copy.interval_value(), 0.5)
  assert_eq(copy.interval(), 0)
  assert_eq(copy.unit_scale(), 1.1574074074074074e-11)
  assert_eq(copy.microsecond_locator().unwrap().interval(), locator.interval())
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("1970-01-01")),
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.000003"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      -5.787037037037037e-12, 0.0, 5.787037037037037e-12, 1.1574074074074074e-11,
      1.736111111111111e-11, 2.3148148148148147e-11, 2.8935185185185184e-11, 3.472222222222222e-11,
      4.050925925925926e-11,
    ]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("1970-01-01T00:00:00.000003"),
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("1970-01-01")),
      ),
    ) catch {
      _ => None
    },
    Some([
      -5.787037037037037e-12, 0.0, 5.787037037037037e-12, 1.1574074074074074e-11,
      1.736111111111111e-11, 2.3148148148148147e-11, 2.8935185185185184e-11, 3.472222222222222e-11,
      4.050925925925926e-11,
    ]),
  )
  assert_eq(adapter.tick_values(0.0, 3.472222222222222e-11), [
    -5.787037037037037e-12, 0.0, 5.787037037037037e-12, 1.1574074074074074e-11, 1.736111111111111e-11,
    2.3148148148148147e-11, 2.8935185185185184e-11, 3.472222222222222e-11, 4.050925925925926e-11,
  ])
  assert_eq(
    locator.nonsingular(0.0, 0.0),
    (-1.1574074074074074e-11, 1.1574074074074074e-11),
  )
  assert_eq(
    copy.nonsingular(0.0, 0.0),
    (-1.1574074074074074e-11, 1.1574074074074074e-11),
  )
  assert_eq(
    locator.nonsingular(12.0, 12.0000001),
    (11.999999999988425, 12.000000100011574),
  )
  assert_eq(
    copy.nonsingular(12.0, 12.0000001),
    (11.999999999988425, 12.000000100011574),
  )
  assert_eq(locator.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(copy.nonsingular(5.0, 3.0), (3.0, 5.0))
  assert_eq(locator.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(copy.nonsingular(0.0 / 0.0, 1.0 / 0.0), (0.0, 1.0))
  assert_eq(calls.val, 0)
}
