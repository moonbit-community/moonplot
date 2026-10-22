// Generated original pinned YearLocator and _Edge_integer.

///|
test "YearLocator original 0 base 1 aware False micro 0" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=1,
    month=1,
    day=1,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2021-05-08T12:34:56.000000"),
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2028-02-08T03:04:05")),
      ),
    ) catch {
      _ => None
    },
    Some([
      18628.0, 18993.0, 19358.0, 19723.0, 20089.0, 20454.0, 20819.0, 21184.0,
    ]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2021, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2028, 1, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(18755.52425925926, 21222.12783564815), [
    18628.0, 18993.0, 19358.0, 19723.0, 20089.0, 20454.0, 20819.0, 21184.0,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2021, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2028, 1, 1, 0, 0, 0, 0, 0]),
  )
}

///|
test "YearLocator original 1 base 1 aware False micro 123456" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=1,
    month=1,
    day=1,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2021-05-08T12:34:56.123456"),
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2028-02-08T03:04:05")),
      ),
    ) catch {
      _ => None
    },
    Some([18993.0, 19358.0, 19723.0, 20089.0, 20454.0, 20819.0, 21184.0]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2021, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2028, 1, 1, 0, 0, 0, 123456, 0]),
  )
  assert_eq(adapter.tick_values(18755.524260688147, 21222.12783564815), [
    18993.0, 19358.0, 19723.0, 20089.0, 20454.0, 20819.0, 21184.0,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2021, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2028, 1, 1, 0, 0, 0, 123456, 0]),
  )
}

///|
test "YearLocator original 2 base 1 aware False micro 999999" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=1,
    month=1,
    day=1,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2021-05-08T12:34:56.999999"),
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2028-02-08T03:04:05")),
      ),
    ) catch {
      _ => None
    },
    Some([18993.0, 19358.0, 19723.0, 20089.0, 20454.0, 20819.0, 21184.0]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2021, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2028, 1, 1, 0, 0, 0, 999999, 0]),
  )
  assert_eq(adapter.tick_values(18755.52427083332, 21222.12783564815), [
    18993.0, 19358.0, 19723.0, 20089.0, 20454.0, 20819.0, 21184.0,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2021, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2028, 1, 1, 0, 0, 0, 999999, 0]),
  )
}

///|
test "YearLocator original 3 base 1 aware True micro 0" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=1,
    month=1,
    day=1,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::aware(
          @date.parse_iso("2021-05-08T12:34:56.000000+00:00"),
        ),
        @date.RRuleDateTime::aware(@date.parse_iso("2028-02-08T03:04:05+00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([
      18628.0, 18993.0, 19358.0, 19723.0, 20089.0, 20454.0, 20819.0, 21184.0,
    ]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2021, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2028, 1, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(18755.52425925926, 21222.12783564815), [
    18628.0, 18993.0, 19358.0, 19723.0, 20089.0, 20454.0, 20819.0, 21184.0,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2021, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2028, 1, 1, 0, 0, 0, 0, 0]),
  )
}

///|
test "YearLocator original 4 base 1 aware True micro 123456" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=1,
    month=1,
    day=1,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::aware(
          @date.parse_iso("2021-05-08T12:34:56.123456+00:00"),
        ),
        @date.RRuleDateTime::aware(@date.parse_iso("2028-02-08T03:04:05+00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([18993.0, 19358.0, 19723.0, 20089.0, 20454.0, 20819.0, 21184.0]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2021, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2028, 1, 1, 0, 0, 0, 123456, 0]),
  )
  assert_eq(adapter.tick_values(18755.524260688147, 21222.12783564815), [
    18993.0, 19358.0, 19723.0, 20089.0, 20454.0, 20819.0, 21184.0,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2021, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2028, 1, 1, 0, 0, 0, 123456, 0]),
  )
}

///|
test "YearLocator original 5 base 1 aware True micro 999999" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=1,
    month=1,
    day=1,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::aware(
          @date.parse_iso("2021-05-08T12:34:56.999999+00:00"),
        ),
        @date.RRuleDateTime::aware(@date.parse_iso("2028-02-08T03:04:05+00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([18993.0, 19358.0, 19723.0, 20089.0, 20454.0, 20819.0, 21184.0]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2021, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2028, 1, 1, 0, 0, 0, 999999, 0]),
  )
  assert_eq(adapter.tick_values(18755.52427083332, 21222.12783564815), [
    18993.0, 19358.0, 19723.0, 20089.0, 20454.0, 20819.0, 21184.0,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2021, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2028, 1, 1, 0, 0, 0, 999999, 0]),
  )
}

///|
test "YearLocator original 6 base 2 aware False micro 0" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=2,
    month=1,
    day=1,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2021-05-08T12:34:56.000000"),
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2028-02-08T03:04:05")),
      ),
    ) catch {
      _ => None
    },
    Some([18262.0, 18993.0, 19723.0, 20454.0, 21184.0]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2028, 1, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(18755.52425925926, 21222.12783564815), [
    18262.0, 18993.0, 19723.0, 20454.0, 21184.0,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2028, 1, 1, 0, 0, 0, 0, 0]),
  )
}

///|
test "YearLocator original 7 base 2 aware False micro 123456" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=2,
    month=1,
    day=1,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2021-05-08T12:34:56.123456"),
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2028-02-08T03:04:05")),
      ),
    ) catch {
      _ => None
    },
    Some([18993.0, 19723.0, 20454.0, 21184.0]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2028, 1, 1, 0, 0, 0, 123456, 0]),
  )
  assert_eq(adapter.tick_values(18755.524260688147, 21222.12783564815), [
    18993.0, 19723.0, 20454.0, 21184.0,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2028, 1, 1, 0, 0, 0, 123456, 0]),
  )
}

///|
test "YearLocator original 8 base 2 aware False micro 999999" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=2,
    month=1,
    day=1,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2021-05-08T12:34:56.999999"),
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2028-02-08T03:04:05")),
      ),
    ) catch {
      _ => None
    },
    Some([18993.0, 19723.0, 20454.0, 21184.0]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2028, 1, 1, 0, 0, 0, 999999, 0]),
  )
  assert_eq(adapter.tick_values(18755.52427083332, 21222.12783564815), [
    18993.0, 19723.0, 20454.0, 21184.0,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2028, 1, 1, 0, 0, 0, 999999, 0]),
  )
}

///|
test "YearLocator original 9 base 2 aware True micro 0" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=2,
    month=1,
    day=1,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::aware(
          @date.parse_iso("2021-05-08T12:34:56.000000+00:00"),
        ),
        @date.RRuleDateTime::aware(@date.parse_iso("2028-02-08T03:04:05+00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([18262.0, 18993.0, 19723.0, 20454.0, 21184.0]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2028, 1, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(18755.52425925926, 21222.12783564815), [
    18262.0, 18993.0, 19723.0, 20454.0, 21184.0,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2028, 1, 1, 0, 0, 0, 0, 0]),
  )
}

///|
test "YearLocator original 10 base 2 aware True micro 123456" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=2,
    month=1,
    day=1,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::aware(
          @date.parse_iso("2021-05-08T12:34:56.123456+00:00"),
        ),
        @date.RRuleDateTime::aware(@date.parse_iso("2028-02-08T03:04:05+00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([18993.0, 19723.0, 20454.0, 21184.0]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2028, 1, 1, 0, 0, 0, 123456, 0]),
  )
  assert_eq(adapter.tick_values(18755.524260688147, 21222.12783564815), [
    18993.0, 19723.0, 20454.0, 21184.0,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2028, 1, 1, 0, 0, 0, 123456, 0]),
  )
}

///|
test "YearLocator original 11 base 2 aware True micro 999999" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=2,
    month=1,
    day=1,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::aware(
          @date.parse_iso("2021-05-08T12:34:56.999999+00:00"),
        ),
        @date.RRuleDateTime::aware(@date.parse_iso("2028-02-08T03:04:05+00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([18993.0, 19723.0, 20454.0, 21184.0]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2028, 1, 1, 0, 0, 0, 999999, 0]),
  )
  assert_eq(adapter.tick_values(18755.52427083332, 21222.12783564815), [
    18993.0, 19723.0, 20454.0, 21184.0,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2028, 1, 1, 0, 0, 0, 999999, 0]),
  )
}

///|
test "YearLocator original 12 base 5 aware False micro 0" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=5,
    month=1,
    day=1,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 5)
  assert_eq(copy.interval(), 5)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2021-05-08T12:34:56.000000"),
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2028-02-08T03:04:05")),
      ),
    ) catch {
      _ => None
    },
    Some([18262.0, 20089.0, 21915.0]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 5)
  assert_eq(copy.interval(), 5)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 1, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(18755.52425925926, 21222.12783564815), [
    18262.0, 20089.0, 21915.0,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 5)
  assert_eq(copy.interval(), 5)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 1, 1, 0, 0, 0, 0, 0]),
  )
}

///|
test "YearLocator original 13 base 5 aware False micro 123456" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=5,
    month=1,
    day=1,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 5)
  assert_eq(copy.interval(), 5)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2021-05-08T12:34:56.123456"),
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2028-02-08T03:04:05")),
      ),
    ) catch {
      _ => None
    },
    Some([20089.0, 21915.0]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 5)
  assert_eq(copy.interval(), 5)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 1, 1, 0, 0, 0, 123456, 0]),
  )
  assert_eq(adapter.tick_values(18755.524260688147, 21222.12783564815), [
    20089.0, 21915.0,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 5)
  assert_eq(copy.interval(), 5)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 1, 1, 0, 0, 0, 123456, 0]),
  )
}

///|
test "YearLocator original 14 base 5 aware False micro 999999" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=5,
    month=1,
    day=1,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 5)
  assert_eq(copy.interval(), 5)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2021-05-08T12:34:56.999999"),
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2028-02-08T03:04:05")),
      ),
    ) catch {
      _ => None
    },
    Some([20089.0, 21915.0]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 5)
  assert_eq(copy.interval(), 5)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 1, 1, 0, 0, 0, 999999, 0]),
  )
  assert_eq(adapter.tick_values(18755.52427083332, 21222.12783564815), [
    20089.0, 21915.0,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 5)
  assert_eq(copy.interval(), 5)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 1, 1, 0, 0, 0, 999999, 0]),
  )
}

///|
test "YearLocator original 15 base 5 aware True micro 0" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=5,
    month=1,
    day=1,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 5)
  assert_eq(copy.interval(), 5)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::aware(
          @date.parse_iso("2021-05-08T12:34:56.000000+00:00"),
        ),
        @date.RRuleDateTime::aware(@date.parse_iso("2028-02-08T03:04:05+00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([18262.0, 20089.0, 21915.0]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 5)
  assert_eq(copy.interval(), 5)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 1, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(18755.52425925926, 21222.12783564815), [
    18262.0, 20089.0, 21915.0,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 5)
  assert_eq(copy.interval(), 5)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 1, 1, 0, 0, 0, 0, 0]),
  )
}

///|
test "YearLocator original 16 base 5 aware True micro 123456" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=5,
    month=1,
    day=1,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 5)
  assert_eq(copy.interval(), 5)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::aware(
          @date.parse_iso("2021-05-08T12:34:56.123456+00:00"),
        ),
        @date.RRuleDateTime::aware(@date.parse_iso("2028-02-08T03:04:05+00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([20089.0, 21915.0]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 5)
  assert_eq(copy.interval(), 5)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 1, 1, 0, 0, 0, 123456, 0]),
  )
  assert_eq(adapter.tick_values(18755.524260688147, 21222.12783564815), [
    20089.0, 21915.0,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 5)
  assert_eq(copy.interval(), 5)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 1, 1, 0, 0, 0, 123456, 0]),
  )
}

///|
test "YearLocator original 17 base 5 aware True micro 999999" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=5,
    month=1,
    day=1,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 5)
  assert_eq(copy.interval(), 5)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::aware(
          @date.parse_iso("2021-05-08T12:34:56.999999+00:00"),
        ),
        @date.RRuleDateTime::aware(@date.parse_iso("2028-02-08T03:04:05+00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([20089.0, 21915.0]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 5)
  assert_eq(copy.interval(), 5)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 1, 1, 0, 0, 0, 999999, 0]),
  )
  assert_eq(adapter.tick_values(18755.52427083332, 21222.12783564815), [
    20089.0, 21915.0,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 5)
  assert_eq(copy.interval(), 5)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 1, 1, 0, 0, 0, 999999, 0]),
  )
}

///|
test "YearLocator original 18 base 10 aware False micro 0" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=10,
    month=1,
    day=1,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 10)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 10)
  assert_eq(copy.interval(), 10)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2021-05-08T12:34:56.000000"),
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2028-02-08T03:04:05")),
      ),
    ) catch {
      _ => None
    },
    Some([18262.0, 21915.0]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 10)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 10)
  assert_eq(copy.interval(), 10)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 1, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(18755.52425925926, 21222.12783564815), [
    18262.0, 21915.0,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 10)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 10)
  assert_eq(copy.interval(), 10)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 1, 1, 0, 0, 0, 0, 0]),
  )
}

///|
test "YearLocator original 19 base 10 aware False micro 123456" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=10,
    month=1,
    day=1,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 10)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 10)
  assert_eq(copy.interval(), 10)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2021-05-08T12:34:56.123456"),
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2028-02-08T03:04:05")),
      ),
    ) catch {
      _ => None
    },
    Some([21915.0]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 10)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 10)
  assert_eq(copy.interval(), 10)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 1, 1, 0, 0, 0, 123456, 0]),
  )
  assert_eq(adapter.tick_values(18755.524260688147, 21222.12783564815), [
    21915.0,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 10)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 10)
  assert_eq(copy.interval(), 10)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 1, 1, 0, 0, 0, 123456, 0]),
  )
}

///|
test "YearLocator original 20 base 10 aware False micro 999999" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=10,
    month=1,
    day=1,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 10)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 10)
  assert_eq(copy.interval(), 10)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2021-05-08T12:34:56.999999"),
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2028-02-08T03:04:05")),
      ),
    ) catch {
      _ => None
    },
    Some([21915.0]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 10)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 10)
  assert_eq(copy.interval(), 10)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 1, 1, 0, 0, 0, 999999, 0]),
  )
  assert_eq(adapter.tick_values(18755.52427083332, 21222.12783564815), [21915.0])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 10)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 10)
  assert_eq(copy.interval(), 10)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 1, 1, 0, 0, 0, 999999, 0]),
  )
}

///|
test "YearLocator original 21 base 10 aware True micro 0" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=10,
    month=1,
    day=1,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 10)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 10)
  assert_eq(copy.interval(), 10)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::aware(
          @date.parse_iso("2021-05-08T12:34:56.000000+00:00"),
        ),
        @date.RRuleDateTime::aware(@date.parse_iso("2028-02-08T03:04:05+00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([18262.0, 21915.0]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 10)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 10)
  assert_eq(copy.interval(), 10)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 1, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(18755.52425925926, 21222.12783564815), [
    18262.0, 21915.0,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 10)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 10)
  assert_eq(copy.interval(), 10)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 1, 1, 0, 0, 0, 0, 0]),
  )
}

///|
test "YearLocator original 22 base 10 aware True micro 123456" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=10,
    month=1,
    day=1,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 10)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 10)
  assert_eq(copy.interval(), 10)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::aware(
          @date.parse_iso("2021-05-08T12:34:56.123456+00:00"),
        ),
        @date.RRuleDateTime::aware(@date.parse_iso("2028-02-08T03:04:05+00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([21915.0]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 10)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 10)
  assert_eq(copy.interval(), 10)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 1, 1, 0, 0, 0, 123456, 0]),
  )
  assert_eq(adapter.tick_values(18755.524260688147, 21222.12783564815), [
    21915.0,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 10)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 10)
  assert_eq(copy.interval(), 10)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 1, 1, 0, 0, 0, 123456, 0]),
  )
}

///|
test "YearLocator original 23 base 10 aware True micro 999999" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=10,
    month=1,
    day=1,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 10)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 10)
  assert_eq(copy.interval(), 10)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::aware(
          @date.parse_iso("2021-05-08T12:34:56.999999+00:00"),
        ),
        @date.RRuleDateTime::aware(@date.parse_iso("2028-02-08T03:04:05+00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([21915.0]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 10)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 10)
  assert_eq(copy.interval(), 10)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 1, 1, 0, 0, 0, 999999, 0]),
  )
  assert_eq(adapter.tick_values(18755.52427083332, 21222.12783564815), [21915.0])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 10)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 10)
  assert_eq(copy.interval(), 10)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 1, 1, 0, 0, 0, 999999, 0]),
  )
}

///|
test "YearLocator original 24 base 100 aware False micro 0" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=100,
    month=1,
    day=1,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 100)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 100)
  assert_eq(copy.interval(), 100)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2021-05-08T12:34:56.000000"),
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2028-02-08T03:04:05")),
      ),
    ) catch {
      _ => None
    },
    Some([10957.0, 47482.0]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 100)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 100)
  assert_eq(copy.interval(), 100)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2000, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2100, 1, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(18755.52425925926, 21222.12783564815), [
    10957.0, 47482.0,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 100)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 100)
  assert_eq(copy.interval(), 100)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2000, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2100, 1, 1, 0, 0, 0, 0, 0]),
  )
}

///|
test "YearLocator original 25 base 100 aware False micro 123456" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=100,
    month=1,
    day=1,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 100)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 100)
  assert_eq(copy.interval(), 100)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2021-05-08T12:34:56.123456"),
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2028-02-08T03:04:05")),
      ),
    ) catch {
      _ => None
    },
    Some([47482.0]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 100)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 100)
  assert_eq(copy.interval(), 100)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2000, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2100, 1, 1, 0, 0, 0, 123456, 0]),
  )
  assert_eq(adapter.tick_values(18755.524260688147, 21222.12783564815), [
    47482.0,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 100)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 100)
  assert_eq(copy.interval(), 100)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2000, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2100, 1, 1, 0, 0, 0, 123456, 0]),
  )
}

///|
test "YearLocator original 26 base 100 aware False micro 999999" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=100,
    month=1,
    day=1,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 100)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 100)
  assert_eq(copy.interval(), 100)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2021-05-08T12:34:56.999999"),
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2028-02-08T03:04:05")),
      ),
    ) catch {
      _ => None
    },
    Some([47482.0]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 100)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 100)
  assert_eq(copy.interval(), 100)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2000, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2100, 1, 1, 0, 0, 0, 999999, 0]),
  )
  assert_eq(adapter.tick_values(18755.52427083332, 21222.12783564815), [47482.0])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 100)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 100)
  assert_eq(copy.interval(), 100)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2000, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2100, 1, 1, 0, 0, 0, 999999, 0]),
  )
}

///|
test "YearLocator original 27 base 100 aware True micro 0" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=100,
    month=1,
    day=1,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 100)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 100)
  assert_eq(copy.interval(), 100)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::aware(
          @date.parse_iso("2021-05-08T12:34:56.000000+00:00"),
        ),
        @date.RRuleDateTime::aware(@date.parse_iso("2028-02-08T03:04:05+00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([10957.0, 47482.0]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 100)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 100)
  assert_eq(copy.interval(), 100)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2000, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2100, 1, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(18755.52425925926, 21222.12783564815), [
    10957.0, 47482.0,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 100)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 100)
  assert_eq(copy.interval(), 100)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2000, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2100, 1, 1, 0, 0, 0, 0, 0]),
  )
}

///|
test "YearLocator original 28 base 100 aware True micro 123456" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=100,
    month=1,
    day=1,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 100)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 100)
  assert_eq(copy.interval(), 100)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::aware(
          @date.parse_iso("2021-05-08T12:34:56.123456+00:00"),
        ),
        @date.RRuleDateTime::aware(@date.parse_iso("2028-02-08T03:04:05+00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([47482.0]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 100)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 100)
  assert_eq(copy.interval(), 100)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2000, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2100, 1, 1, 0, 0, 0, 123456, 0]),
  )
  assert_eq(adapter.tick_values(18755.524260688147, 21222.12783564815), [
    47482.0,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 100)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 100)
  assert_eq(copy.interval(), 100)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2000, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2100, 1, 1, 0, 0, 0, 123456, 0]),
  )
}

///|
test "YearLocator original 29 base 100 aware True micro 999999" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=100,
    month=1,
    day=1,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 100)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 100)
  assert_eq(copy.interval(), 100)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::aware(
          @date.parse_iso("2021-05-08T12:34:56.999999+00:00"),
        ),
        @date.RRuleDateTime::aware(@date.parse_iso("2028-02-08T03:04:05+00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([47482.0]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 100)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 100)
  assert_eq(copy.interval(), 100)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2000, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2100, 1, 1, 0, 0, 0, 999999, 0]),
  )
  assert_eq(adapter.tick_values(18755.52427083332, 21222.12783564815), [47482.0])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 100)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 100)
  assert_eq(copy.interval(), 100)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2000, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2100, 1, 1, 0, 0, 0, 999999, 0]),
  )
}

///|
test "YearLocator original 30 base 1000 aware False micro 0" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=1000,
    month=1,
    day=1,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1000)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1000)
  assert_eq(copy.interval(), 1000)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2021-05-08T12:34:56.000000"),
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2028-02-08T03:04:05")),
      ),
    ) catch {
      _ => None
    },
    Some([10957.0, 376200.0]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1000)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1000)
  assert_eq(copy.interval(), 1000)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2000, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 3000, 1, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(18755.52425925926, 21222.12783564815), [
    10957.0, 376200.0,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1000)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1000)
  assert_eq(copy.interval(), 1000)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2000, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 3000, 1, 1, 0, 0, 0, 0, 0]),
  )
}

///|
test "YearLocator original 31 base 1000 aware False micro 123456" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=1000,
    month=1,
    day=1,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1000)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1000)
  assert_eq(copy.interval(), 1000)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2021-05-08T12:34:56.123456"),
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2028-02-08T03:04:05")),
      ),
    ) catch {
      _ => None
    },
    Some([376200.0]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1000)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1000)
  assert_eq(copy.interval(), 1000)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2000, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 3000, 1, 1, 0, 0, 0, 123456, 0]),
  )
  assert_eq(adapter.tick_values(18755.524260688147, 21222.12783564815), [
    376200.0,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1000)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1000)
  assert_eq(copy.interval(), 1000)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2000, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 3000, 1, 1, 0, 0, 0, 123456, 0]),
  )
}

///|
test "YearLocator original 32 base 1000 aware False micro 999999" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=1000,
    month=1,
    day=1,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1000)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1000)
  assert_eq(copy.interval(), 1000)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2021-05-08T12:34:56.999999"),
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2028-02-08T03:04:05")),
      ),
    ) catch {
      _ => None
    },
    Some([376200.0]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1000)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1000)
  assert_eq(copy.interval(), 1000)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2000, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 3000, 1, 1, 0, 0, 0, 999999, 0]),
  )
  assert_eq(adapter.tick_values(18755.52427083332, 21222.12783564815), [
    376200.0,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1000)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1000)
  assert_eq(copy.interval(), 1000)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2000, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 3000, 1, 1, 0, 0, 0, 999999, 0]),
  )
}

///|
test "YearLocator original 33 base 1000 aware True micro 0" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=1000,
    month=1,
    day=1,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1000)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1000)
  assert_eq(copy.interval(), 1000)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::aware(
          @date.parse_iso("2021-05-08T12:34:56.000000+00:00"),
        ),
        @date.RRuleDateTime::aware(@date.parse_iso("2028-02-08T03:04:05+00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([10957.0, 376200.0]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1000)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1000)
  assert_eq(copy.interval(), 1000)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2000, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 3000, 1, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(18755.52425925926, 21222.12783564815), [
    10957.0, 376200.0,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1000)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1000)
  assert_eq(copy.interval(), 1000)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2000, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 3000, 1, 1, 0, 0, 0, 0, 0]),
  )
}

///|
test "YearLocator original 34 base 1000 aware True micro 123456" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=1000,
    month=1,
    day=1,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1000)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1000)
  assert_eq(copy.interval(), 1000)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::aware(
          @date.parse_iso("2021-05-08T12:34:56.123456+00:00"),
        ),
        @date.RRuleDateTime::aware(@date.parse_iso("2028-02-08T03:04:05+00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([376200.0]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1000)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1000)
  assert_eq(copy.interval(), 1000)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2000, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 3000, 1, 1, 0, 0, 0, 123456, 0]),
  )
  assert_eq(adapter.tick_values(18755.524260688147, 21222.12783564815), [
    376200.0,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1000)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1000)
  assert_eq(copy.interval(), 1000)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2000, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 3000, 1, 1, 0, 0, 0, 123456, 0]),
  )
}

///|
test "YearLocator original 35 base 1000 aware True micro 999999" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=1000,
    month=1,
    day=1,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1000)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1000)
  assert_eq(copy.interval(), 1000)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::aware(
          @date.parse_iso("2021-05-08T12:34:56.999999+00:00"),
        ),
        @date.RRuleDateTime::aware(@date.parse_iso("2028-02-08T03:04:05+00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([376200.0]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1000)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1000)
  assert_eq(copy.interval(), 1000)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2000, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 3000, 1, 1, 0, 0, 0, 999999, 0]),
  )
  assert_eq(adapter.tick_values(18755.52427083332, 21222.12783564815), [
    376200.0,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1000)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1000)
  assert_eq(copy.interval(), 1000)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2000, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 3000, 1, 1, 0, 0, 0, 999999, 0]),
  )
}

///|
test "YearLocator original 36 base 2147483647 aware False micro 0" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=2147483647,
    month=1,
    day=1,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2147483647)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2147483647)
  assert_eq(copy.interval(), 2147483647)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2021-05-08T12:34:56.000000"),
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2028-02-08T03:04:05")),
      ),
    ) catch {
      _ => None
    },
    Some([-719162.0]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2147483647)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2147483647)
  assert_eq(copy.interval(), 2147483647)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 9999, 1, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(18755.52425925926, 21222.12783564815), [
    -719162.0,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2147483647)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2147483647)
  assert_eq(copy.interval(), 2147483647)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 9999, 1, 1, 0, 0, 0, 0, 0]),
  )
}

///|
test "YearLocator original 37 base 2147483647 aware False micro 123456" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=2147483647,
    month=1,
    day=1,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2147483647)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2147483647)
  assert_eq(copy.interval(), 2147483647)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2021-05-08T12:34:56.123456"),
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2028-02-08T03:04:05")),
      ),
    ) catch {
      _ => None
    },
    Some([18755.524260688147, 21222.12783564815]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2147483647)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2147483647)
  assert_eq(copy.interval(), 2147483647)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 9999, 1, 1, 0, 0, 0, 123456, 0]),
  )
  assert_eq(adapter.tick_values(18755.524260688147, 21222.12783564815), [
    18755.524260688147, 21222.12783564815,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2147483647)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2147483647)
  assert_eq(copy.interval(), 2147483647)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 9999, 1, 1, 0, 0, 0, 123456, 0]),
  )
}

///|
test "YearLocator original 38 base 2147483647 aware False micro 999999" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=2147483647,
    month=1,
    day=1,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2147483647)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2147483647)
  assert_eq(copy.interval(), 2147483647)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2021-05-08T12:34:56.999999"),
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2028-02-08T03:04:05")),
      ),
    ) catch {
      _ => None
    },
    Some([18755.52427083332, 21222.12783564815]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2147483647)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2147483647)
  assert_eq(copy.interval(), 2147483647)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 9999, 1, 1, 0, 0, 0, 999999, 0]),
  )
  assert_eq(adapter.tick_values(18755.52427083332, 21222.12783564815), [
    18755.52427083332, 21222.12783564815,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2147483647)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2147483647)
  assert_eq(copy.interval(), 2147483647)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 9999, 1, 1, 0, 0, 0, 999999, 0]),
  )
}

///|
test "YearLocator original 39 base 2147483647 aware True micro 0" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=2147483647,
    month=1,
    day=1,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2147483647)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2147483647)
  assert_eq(copy.interval(), 2147483647)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::aware(
          @date.parse_iso("2021-05-08T12:34:56.000000+00:00"),
        ),
        @date.RRuleDateTime::aware(@date.parse_iso("2028-02-08T03:04:05+00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([-719162.0]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2147483647)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2147483647)
  assert_eq(copy.interval(), 2147483647)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 9999, 1, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(18755.52425925926, 21222.12783564815), [
    -719162.0,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2147483647)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2147483647)
  assert_eq(copy.interval(), 2147483647)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 9999, 1, 1, 0, 0, 0, 0, 0]),
  )
}

///|
test "YearLocator original 40 base 2147483647 aware True micro 123456" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=2147483647,
    month=1,
    day=1,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2147483647)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2147483647)
  assert_eq(copy.interval(), 2147483647)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::aware(
          @date.parse_iso("2021-05-08T12:34:56.123456+00:00"),
        ),
        @date.RRuleDateTime::aware(@date.parse_iso("2028-02-08T03:04:05+00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([18755.524260688147, 21222.12783564815]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2147483647)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2147483647)
  assert_eq(copy.interval(), 2147483647)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 9999, 1, 1, 0, 0, 0, 123456, 0]),
  )
  assert_eq(adapter.tick_values(18755.524260688147, 21222.12783564815), [
    18755.524260688147, 21222.12783564815,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2147483647)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2147483647)
  assert_eq(copy.interval(), 2147483647)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 9999, 1, 1, 0, 0, 0, 123456, 0]),
  )
}

///|
test "YearLocator original 41 base 2147483647 aware True micro 999999" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=2147483647,
    month=1,
    day=1,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2147483647)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2147483647)
  assert_eq(copy.interval(), 2147483647)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::aware(
          @date.parse_iso("2021-05-08T12:34:56.999999+00:00"),
        ),
        @date.RRuleDateTime::aware(@date.parse_iso("2028-02-08T03:04:05+00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([18755.52427083332, 21222.12783564815]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2147483647)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2147483647)
  assert_eq(copy.interval(), 2147483647)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 9999, 1, 1, 0, 0, 0, 999999, 0]),
  )
  assert_eq(adapter.tick_values(18755.52427083332, 21222.12783564815), [
    18755.52427083332, 21222.12783564815,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2147483647)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2147483647)
  assert_eq(copy.interval(), 2147483647)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 9999, 1, 1, 0, 0, 0, 999999, 0]),
  )
}

///|
test "YearLocator original 42 calendar 2/29 2020-05-01/2024-03-02" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=1,
    month=2,
    day=29,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2020-05-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-02")),
      ),
    ) catch {
      _ => None
    },
    Some([18321.0, 19782.0]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 2, 29, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 2, 29, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(18383.0, 19784.0), [18321.0, 19782.0])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 2, 29, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 2, 29, 0, 0, 0, 0, 0]),
  )
}

///|
test "YearLocator original 43 calendar 2/29 2024-05-01/2024-05-01" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=1,
    month=2,
    day=29,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-05-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("2024-05-01")),
      ),
    ) catch {
      _ => None
    },
    Some([19782.0]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 2, 29, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 2, 29, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(19844.0, 19844.0), [19782.0])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 2, 29, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 2, 29, 0, 0, 0, 0, 0]),
  )
}

///|
test "YearLocator original 44 calendar 2/29 2024-05-01/2023-05-01" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=1,
    month=2,
    day=29,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-05-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-05-01")),
      ),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(adapter.tick_values(19844.0, 19478.0), [])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
}

///|
test "YearLocator original 45 calendar 2/29 0001-01-01/0002-01-01" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=1,
    month=2,
    day=29,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("0001-01-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("0002-01-01")),
      ),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(adapter.tick_values(-719162.0, -718797.0), [])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
}

///|
test "YearLocator original 46 calendar 2/29 9998-01-01/9999-12-31" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=1,
    month=2,
    day=29,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("9998-01-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("9999-12-31")),
      ),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(adapter.tick_values(2932167.0, 2932896.0), [])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
}

///|
test "YearLocator original 47 calendar 2/30 2020-05-01/2024-03-02" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=1,
    month=2,
    day=30,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2020-05-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-02")),
      ),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(adapter.tick_values(18383.0, 19784.0), [])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
}

///|
test "YearLocator original 48 calendar 2/30 2024-05-01/2024-05-01" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=1,
    month=2,
    day=30,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-05-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("2024-05-01")),
      ),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(adapter.tick_values(19844.0, 19844.0), [])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
}

///|
test "YearLocator original 49 calendar 2/30 2024-05-01/2023-05-01" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=1,
    month=2,
    day=30,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-05-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-05-01")),
      ),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(adapter.tick_values(19844.0, 19478.0), [])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
}

///|
test "YearLocator original 50 calendar 2/30 0001-01-01/0002-01-01" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=1,
    month=2,
    day=30,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("0001-01-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("0002-01-01")),
      ),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(adapter.tick_values(-719162.0, -718797.0), [])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
}

///|
test "YearLocator original 51 calendar 2/30 9998-01-01/9999-12-31" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=1,
    month=2,
    day=30,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("9998-01-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("9999-12-31")),
      ),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(adapter.tick_values(2932167.0, 2932896.0), [])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
}

///|
test "YearLocator original 52 calendar 2/-1 2020-05-01/2024-03-02" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=1,
    month=2,
    day=-1,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2020-05-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-02")),
      ),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(adapter.tick_values(18383.0, 19784.0), [])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
}

///|
test "YearLocator original 53 calendar 2/-1 2024-05-01/2024-05-01" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=1,
    month=2,
    day=-1,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-05-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("2024-05-01")),
      ),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(adapter.tick_values(19844.0, 19844.0), [])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
}

///|
test "YearLocator original 54 calendar 2/-1 2024-05-01/2023-05-01" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=1,
    month=2,
    day=-1,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-05-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-05-01")),
      ),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(adapter.tick_values(19844.0, 19478.0), [])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
}

///|
test "YearLocator original 55 calendar 2/-1 0001-01-01/0002-01-01" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=1,
    month=2,
    day=-1,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("0001-01-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("0002-01-01")),
      ),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(adapter.tick_values(-719162.0, -718797.0), [])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
}

///|
test "YearLocator original 56 calendar 2/-1 9998-01-01/9999-12-31" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=1,
    month=2,
    day=-1,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("9998-01-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("9999-12-31")),
      ),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(adapter.tick_values(2932167.0, 2932896.0), [])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
}

///|
test "YearLocator original 57 calendar 4/31 2020-05-01/2024-03-02" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=1,
    month=4,
    day=31,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2020-05-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-02")),
      ),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(adapter.tick_values(18383.0, 19784.0), [])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
}

///|
test "YearLocator original 58 calendar 4/31 2024-05-01/2024-05-01" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=1,
    month=4,
    day=31,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-05-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("2024-05-01")),
      ),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(adapter.tick_values(19844.0, 19844.0), [])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
}

///|
test "YearLocator original 59 calendar 4/31 2024-05-01/2023-05-01" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=1,
    month=4,
    day=31,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-05-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-05-01")),
      ),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(adapter.tick_values(19844.0, 19478.0), [])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
}

///|
test "YearLocator original 60 calendar 4/31 0001-01-01/0002-01-01" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=1,
    month=4,
    day=31,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("0001-01-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("0002-01-01")),
      ),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(adapter.tick_values(-719162.0, -718797.0), [])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
}

///|
test "YearLocator original 61 calendar 4/31 9998-01-01/9999-12-31" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=1,
    month=4,
    day=31,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("9998-01-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("9999-12-31")),
      ),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(adapter.tick_values(2932167.0, 2932896.0), [])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
}

///|
test "YearLocator original 62 calendar 12/31 2020-05-01/2024-03-02" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=1,
    month=12,
    day=31,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2020-05-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-02")),
      ),
    ) catch {
      _ => None
    },
    Some([18627.0, 18992.0, 19357.0, 19722.0, 20088.0]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 12, 31, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 12, 31, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(18383.0, 19784.0), [
    18627.0, 18992.0, 19357.0, 19722.0, 20088.0,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 12, 31, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 12, 31, 0, 0, 0, 0, 0]),
  )
}

///|
test "YearLocator original 63 calendar 12/31 2024-05-01/2024-05-01" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=1,
    month=12,
    day=31,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-05-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("2024-05-01")),
      ),
    ) catch {
      _ => None
    },
    Some([20088.0]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 12, 31, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 12, 31, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(19844.0, 19844.0), [20088.0])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 12, 31, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 12, 31, 0, 0, 0, 0, 0]),
  )
}

///|
test "YearLocator original 64 calendar 12/31 2024-05-01/2023-05-01" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=1,
    month=12,
    day=31,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-05-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-05-01")),
      ),
    ) catch {
      _ => None
    },
    Some([19844.0, 19478.0]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 12, 31, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2023, 12, 31, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(19844.0, 19478.0), [20088.0, 19722.0])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2023, 12, 31, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 12, 31, 0, 0, 0, 0, 0]),
  )
}

///|
test "YearLocator original 65 calendar 12/31 0001-01-01/0002-01-01" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=1,
    month=12,
    day=31,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("0001-01-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("0002-01-01")),
      ),
    ) catch {
      _ => None
    },
    Some([-718798.0, -718433.0]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1, 12, 31, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2, 12, 31, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(-719162.0, -718797.0), [-718798.0, -718433.0])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1, 12, 31, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2, 12, 31, 0, 0, 0, 0, 0]),
  )
}

///|
test "YearLocator original 66 calendar 12/31 9998-01-01/9999-12-31" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=1,
    month=12,
    day=31,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("9998-01-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("9999-12-31")),
      ),
    ) catch {
      _ => None
    },
    Some([2932531.0, 2932896.0]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 9998, 12, 31, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 9999, 12, 31, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(2932167.0, 2932896.0), [2932531.0, 2932896.0])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 9998, 12, 31, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 9999, 12, 31, 0, 0, 0, 0, 0]),
  )
}

///|
test "YearLocator original 67 calendar 1/1 2020-05-01/2024-03-02" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=1,
    month=1,
    day=1,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2020-05-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-02")),
      ),
    ) catch {
      _ => None
    },
    Some([18262.0, 18628.0, 18993.0, 19358.0, 19723.0]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 1, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(18383.0, 19784.0), [
    18262.0, 18628.0, 18993.0, 19358.0, 19723.0,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 1, 1, 0, 0, 0, 0, 0]),
  )
}

///|
test "YearLocator original 68 calendar 1/1 2024-05-01/2024-05-01" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=1,
    month=1,
    day=1,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-05-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("2024-05-01")),
      ),
    ) catch {
      _ => None
    },
    Some([19723.0]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 1, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(19844.0, 19844.0), [19723.0])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 1, 1, 0, 0, 0, 0, 0]),
  )
}

///|
test "YearLocator original 69 calendar 1/1 2024-05-01/2023-05-01" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=1,
    month=1,
    day=1,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-05-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-05-01")),
      ),
    ) catch {
      _ => None
    },
    Some([19844.0, 19478.0]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2023, 1, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(19844.0, 19478.0), [19723.0, 19358.0])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2023, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 1, 1, 0, 0, 0, 0, 0]),
  )
}

///|
test "YearLocator original 70 calendar 1/1 0001-01-01/0002-01-01" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=1,
    month=1,
    day=1,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("0001-01-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("0002-01-01")),
      ),
    ) catch {
      _ => None
    },
    Some([-719162.0, -718797.0]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2, 1, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(-719162.0, -718797.0), [-719162.0, -718797.0])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2, 1, 1, 0, 0, 0, 0, 0]),
  )
}

///|
test "YearLocator original 71 calendar 1/1 9998-01-01/9999-12-31" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=1,
    month=1,
    day=1,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("9998-01-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("9999-12-31")),
      ),
    ) catch {
      _ => None
    },
    Some([2932167.0, 2932532.0]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 9998, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 9999, 1, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(2932167.0, 2932896.0), [2932167.0, 2932532.0])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 9998, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 9999, 1, 1, 0, 0, 0, 0, 0]),
  )
}

///|
test "YearLocator original 72 zones NY 1900-01-01" {
  @date.register_timezone("D16/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D16/reference-NY")
  let zone_ny = @date.get_timezone(name="D16/reference-NY")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=2,
    month=1,
    day=1,
    timezone=zone_ny,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("1900-01-01"),
          zone_ny,
          fold=true,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("1903-01-01"),
          zone_ny,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([-25566.794421296298, -24836.791666666668, -24106.791666666668]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1900, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 1904, 1, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(-25566.794421296298, -24471.791666666668), [
    -25566.794421296298, -24836.791666666668, -24106.791666666668,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1900, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 1904, 1, 1, 0, 0, 0, 0, 0]),
  )
}

///|
test "YearLocator original 73 zones NY 2023-07-01T00:00:00.123456" {
  @date.register_timezone("D16/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D16/reference-NY")
  let zone_ny = @date.get_timezone(name="D16/reference-NY")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=2,
    month=1,
    day=1,
    timezone=zone_ny,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2023-07-01T00:00:00.123456"),
          zone_ny,
          fold=true,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2025-07-01"),
          zone_ny,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([19723.208333333332, 20454.208333333332]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2022, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2026, 1, 1, 0, 0, 0, 123456, 0]),
  )
  assert_eq(adapter.tick_values(19539.166668095557, 20270.166666666668), [
    19723.208333333332, 20454.208333333332,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2022, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2026, 1, 1, 0, 0, 0, 123456, 0]),
  )
}

///|
test "YearLocator original 74 zones NY 0001-01-01" {
  @date.register_timezone("D16/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D16/reference-NY")
  let zone_ny = @date.get_timezone(name="D16/reference-NY")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=2,
    month=1,
    day=1,
    timezone=zone_ny,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("0001-01-01"),
          zone_ny,
          fold=true,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("0002-01-01"),
          zone_ny,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([-719161.7944212963]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2, 1, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(-719161.7944212963, -718796.7944212963), [
    -719161.7944212963,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2, 1, 1, 0, 0, 0, 0, 0]),
  )
}

///|
test "YearLocator original 75 zones NY 9998-01-01" {
  @date.register_timezone("D16/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D16/reference-NY")
  let zone_ny = @date.get_timezone(name="D16/reference-NY")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=2,
    month=1,
    day=1,
    timezone=zone_ny,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("9998-01-01"),
          zone_ny,
          fold=true,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("9999-12-31"),
          zone_ny,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([2932167.2083333335]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 9998, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 9999, 1, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(2932167.2083333335, 2932896.2083333335), [
    2932167.2083333335,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 9998, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 9999, 1, 1, 0, 0, 0, 0, 0]),
  )
}

///|
test "YearLocator original 76 zones LH 1900-01-01" {
  @date.register_timezone("D16/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D16/reference-LH")
  let zone_lh = @date.get_timezone(name="D16/reference-LH")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=2,
    month=1,
    day=1,
    timezone=zone_lh,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("1900-01-01"),
          zone_lh,
          fold=true,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("1903-01-01"),
          zone_lh,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([-25567.441898148147, -24837.416666666668, -24107.416666666668]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1900, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 1904, 1, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(-25567.441898148147, -24472.416666666668), [
    -25567.441898148147, -24837.416666666668, -24107.416666666668,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1900, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 1904, 1, 1, 0, 0, 0, 0, 0]),
  )
}

///|
test "YearLocator original 77 zones LH 2023-07-01T00:00:00.123456" {
  @date.register_timezone("D16/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D16/reference-LH")
  let zone_lh = @date.get_timezone(name="D16/reference-LH")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=2,
    month=1,
    day=1,
    timezone=zone_lh,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2023-07-01T00:00:00.123456"),
          zone_lh,
          fold=true,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2025-07-01"),
          zone_lh,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([19722.541666666668, 20453.541666666668]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2022, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2026, 1, 1, 0, 0, 0, 123456, 0]),
  )
  assert_eq(adapter.tick_values(19538.56250142889, 20269.5625), [
    19722.541666666668, 20453.541666666668,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2022, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2026, 1, 1, 0, 0, 0, 123456, 0]),
  )
}

///|
test "YearLocator original 78 zones LH 0001-01-01" {
  @date.register_timezone("D16/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D16/reference-LH")
  let zone_lh = @date.get_timezone(name="D16/reference-LH")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=2,
    month=1,
    day=1,
    timezone=zone_lh,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("0001-01-01"),
          zone_lh,
          fold=true,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("0002-01-01"),
          zone_lh,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2, 1, 1, 0, 0, 0, 0, 0]),
  )
}

///|
test "YearLocator original 79 zones LH 9998-01-01" {
  @date.register_timezone("D16/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D16/reference-LH")
  let zone_lh = @date.get_timezone(name="D16/reference-LH")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=2,
    month=1,
    day=1,
    timezone=zone_lh,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("9998-01-01"),
          zone_lh,
          fold=true,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("9999-12-31"),
          zone_lh,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([2932166.5625]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 9998, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 9999, 1, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(2932166.5625, 2932895.5625), [2932166.5625])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 9998, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 9999, 1, 1, 0, 0, 0, 0, 0]),
  )
}

///|
test "YearLocator original 80 zones FIX 1900-01-01" {
  let zone_fix = @date.fixed_timezone_seconds(561)
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=2,
    month=1,
    day=1,
    timezone=zone_fix,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("1900-01-01"),
          zone_fix,
          fold=true,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("1903-01-01"),
          zone_fix,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([-25567.006493055556, -24837.006493055556, -24107.006493055556]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1900, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 1904, 1, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(-25567.006493055556, -24472.006493055556), [
    -25567.006493055556, -24837.006493055556, -24107.006493055556,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1900, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 1904, 1, 1, 0, 0, 0, 0, 0]),
  )
}

///|
test "YearLocator original 81 zones FIX 2023-07-01T00:00:00.123456" {
  let zone_fix = @date.fixed_timezone_seconds(561)
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=2,
    month=1,
    day=1,
    timezone=zone_fix,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2023-07-01T00:00:00.123456"),
          zone_fix,
          fold=true,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2025-07-01"),
          zone_fix,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([19722.993506944444, 20453.993506944444]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2022, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2026, 1, 1, 0, 0, 0, 123456, 0]),
  )
  assert_eq(adapter.tick_values(19538.993508373333, 20269.993506944444), [
    19722.993506944444, 20453.993506944444,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2022, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2026, 1, 1, 0, 0, 0, 123456, 0]),
  )
}

///|
test "YearLocator original 82 zones FIX 0001-01-01" {
  let zone_fix = @date.fixed_timezone_seconds(561)
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=2,
    month=1,
    day=1,
    timezone=zone_fix,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("0001-01-01"),
          zone_fix,
          fold=true,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("0002-01-01"),
          zone_fix,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2, 1, 1, 0, 0, 0, 0, 0]),
  )
}

///|
test "YearLocator original 83 zones FIX 9998-01-01" {
  let zone_fix = @date.fixed_timezone_seconds(561)
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=2,
    month=1,
    day=1,
    timezone=zone_fix,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("9998-01-01"),
          zone_fix,
          fold=true,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("9999-12-31"),
          zone_fix,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([2932166.9935069443]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 9998, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 9999, 1, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(2932166.9935069443, 2932895.9935069443), [
    2932166.9935069443,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 9998, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 9999, 1, 1, 0, 0, 0, 0, 0]),
  )
}

///|
test "YearLocator original 84 zones E23 1900-01-01" {
  let zone_e23 = @date.fixed_timezone_seconds(82800)
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=2,
    month=1,
    day=1,
    timezone=zone_e23,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("1900-01-01"),
          zone_e23,
          fold=true,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("1903-01-01"),
          zone_e23,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([-25567.958333333332, -24837.958333333332, -24107.958333333332]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1900, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 1904, 1, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(-25567.958333333332, -24472.958333333332), [
    -25567.958333333332, -24837.958333333332, -24107.958333333332,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1900, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 1904, 1, 1, 0, 0, 0, 0, 0]),
  )
}

///|
test "YearLocator original 85 zones E23 2023-07-01T00:00:00.123456" {
  let zone_e23 = @date.fixed_timezone_seconds(82800)
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=2,
    month=1,
    day=1,
    timezone=zone_e23,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2023-07-01T00:00:00.123456"),
          zone_e23,
          fold=true,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2025-07-01"),
          zone_e23,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([19722.041666666668, 20453.041666666668]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2022, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2026, 1, 1, 0, 0, 0, 123456, 0]),
  )
  assert_eq(adapter.tick_values(19538.041668095557, 20269.041666666668), [
    19722.041666666668, 20453.041666666668,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2022, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2026, 1, 1, 0, 0, 0, 123456, 0]),
  )
}

///|
test "YearLocator original 86 zones E23 0001-01-01" {
  let zone_e23 = @date.fixed_timezone_seconds(82800)
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=2,
    month=1,
    day=1,
    timezone=zone_e23,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("0001-01-01"),
          zone_e23,
          fold=true,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("0002-01-01"),
          zone_e23,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2, 1, 1, 0, 0, 0, 0, 0]),
  )
}

///|
test "YearLocator original 87 zones E23 9998-01-01" {
  let zone_e23 = @date.fixed_timezone_seconds(82800)
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=2,
    month=1,
    day=1,
    timezone=zone_e23,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("9998-01-01"),
          zone_e23,
          fold=true,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("9999-12-31"),
          zone_e23,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([2932166.0416666665]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 9998, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 9999, 1, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(2932166.0416666665, 2932895.0416666665), [
    2932166.0416666665,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 9998, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 9999, 1, 1, 0, 0, 0, 0, 0]),
  )
}

///|
test "YearLocator original 88 zones W23 1900-01-01" {
  let zone_w23 = @date.fixed_timezone_seconds(-82800)
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=2,
    month=1,
    day=1,
    timezone=zone_w23,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("1900-01-01"),
          zone_w23,
          fold=true,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("1903-01-01"),
          zone_w23,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([-25566.041666666668, -24836.041666666668, -24106.041666666668]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1900, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 1904, 1, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(-25566.041666666668, -24471.041666666668), [
    -25566.041666666668, -24836.041666666668, -24106.041666666668,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1900, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 1904, 1, 1, 0, 0, 0, 0, 0]),
  )
}

///|
test "YearLocator original 89 zones W23 2023-07-01T00:00:00.123456" {
  let zone_w23 = @date.fixed_timezone_seconds(-82800)
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=2,
    month=1,
    day=1,
    timezone=zone_w23,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2023-07-01T00:00:00.123456"),
          zone_w23,
          fold=true,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2025-07-01"),
          zone_w23,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([19723.958333333332, 20454.958333333332]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2022, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2026, 1, 1, 0, 0, 0, 123456, 0]),
  )
  assert_eq(adapter.tick_values(19539.95833476222, 20270.958333333332), [
    19723.958333333332, 20454.958333333332,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2022, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2026, 1, 1, 0, 0, 0, 123456, 0]),
  )
}

///|
test "YearLocator original 90 zones W23 0001-01-01" {
  let zone_w23 = @date.fixed_timezone_seconds(-82800)
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=2,
    month=1,
    day=1,
    timezone=zone_w23,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("0001-01-01"),
          zone_w23,
          fold=true,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("0002-01-01"),
          zone_w23,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([-719161.0416666666]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2, 1, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(-719161.0416666666, -718796.0416666666), [
    -719161.0416666666,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2, 1, 1, 0, 0, 0, 0, 0]),
  )
}

///|
test "YearLocator original 91 zones W23 9998-01-01" {
  let zone_w23 = @date.fixed_timezone_seconds(-82800)
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=2,
    month=1,
    day=1,
    timezone=zone_w23,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("9998-01-01"),
          zone_w23,
          fold=true,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("9999-12-31"),
          zone_w23,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([2932167.9583333335]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 9998, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 9999, 1, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(2932167.9583333335, 2932896.9583333335), [
    2932167.9583333335,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 9998, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 9999, 1, 1, 0, 0, 0, 0, 0]),
  )
}

///|
test "YearLocator original 92 zones NEG 1900-01-01" {
  let zone_neg = @date.get_timezone(name="IST-1GMT0,M10.5.0/2,M3.5.0/1")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=2,
    month=1,
    day=1,
    timezone=zone_neg,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("1900-01-01"),
          zone_neg,
          fold=true,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("1903-01-01"),
          zone_neg,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([-25567.0, -24837.0, -24107.0]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1900, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 1904, 1, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(-25567.0, -24472.0), [
    -25567.0, -24837.0, -24107.0,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1900, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 1904, 1, 1, 0, 0, 0, 0, 0]),
  )
}

///|
test "YearLocator original 93 zones NEG 2023-07-01T00:00:00.123456" {
  let zone_neg = @date.get_timezone(name="IST-1GMT0,M10.5.0/2,M3.5.0/1")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=2,
    month=1,
    day=1,
    timezone=zone_neg,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2023-07-01T00:00:00.123456"),
          zone_neg,
          fold=true,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2025-07-01"),
          zone_neg,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([19723.0, 20454.0]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2022, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2026, 1, 1, 0, 0, 0, 123456, 0]),
  )
  assert_eq(adapter.tick_values(19538.95833476222, 20269.958333333332), [
    19723.0, 20454.0,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2022, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2026, 1, 1, 0, 0, 0, 123456, 0]),
  )
}

///|
test "YearLocator original 94 zones NEG 0001-01-01" {
  let zone_neg = @date.get_timezone(name="IST-1GMT0,M10.5.0/2,M3.5.0/1")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=2,
    month=1,
    day=1,
    timezone=zone_neg,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("0001-01-01"),
          zone_neg,
          fold=true,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("0002-01-01"),
          zone_neg,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([-719162.0]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2, 1, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(-719162.0, -718797.0), [-719162.0])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2, 1, 1, 0, 0, 0, 0, 0]),
  )
}

///|
test "YearLocator original 95 zones NEG 9998-01-01" {
  let zone_neg = @date.get_timezone(name="IST-1GMT0,M10.5.0/2,M3.5.0/1")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=2,
    month=1,
    day=1,
    timezone=zone_neg,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("9998-01-01"),
          zone_neg,
          fold=true,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("9999-12-31"),
          zone_neg,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([2932167.0]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 9998, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 9999, 1, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(2932167.0, 2932896.0), [2932167.0])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 9998, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 9999, 1, 1, 0, 0, 0, 0, 0]),
  )
}

///|
test "YearLocator original 96 zones MID 1900-01-01" {
  let zone_mid = @date.get_timezone(name="STD0DST,M6.1.0/0,M1.1.0/1")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=2,
    month=1,
    day=1,
    timezone=zone_mid,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("1900-01-01"),
          zone_mid,
          fold=true,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("1903-01-01"),
          zone_mid,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([-25567.041666666668, -24837.041666666668, -24107.041666666668]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1900, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 1904, 1, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(-25567.041666666668, -24472.041666666668), [
    -25567.041666666668, -24837.041666666668, -24107.041666666668,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1900, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 1904, 1, 1, 0, 0, 0, 0, 0]),
  )
}

///|
test "YearLocator original 97 zones MID 2023-07-01T00:00:00.123456" {
  let zone_mid = @date.get_timezone(name="STD0DST,M6.1.0/0,M1.1.0/1")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=2,
    month=1,
    day=1,
    timezone=zone_mid,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2023-07-01T00:00:00.123456"),
          zone_mid,
          fold=true,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2025-07-01"),
          zone_mid,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([19722.958333333332, 20453.958333333332]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2022, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2026, 1, 1, 0, 0, 0, 123456, 0]),
  )
  assert_eq(adapter.tick_values(19538.95833476222, 20269.958333333332), [
    19722.958333333332, 20453.958333333332,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2022, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2026, 1, 1, 0, 0, 0, 123456, 0]),
  )
}

///|
test "YearLocator original 98 zones MID 0001-01-01" {
  let zone_mid = @date.get_timezone(name="STD0DST,M6.1.0/0,M1.1.0/1")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=2,
    month=1,
    day=1,
    timezone=zone_mid,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("0001-01-01"),
          zone_mid,
          fold=true,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("0002-01-01"),
          zone_mid,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2, 1, 1, 0, 0, 0, 0, 0]),
  )
}

///|
test "YearLocator original 99 zones MID 9998-01-01" {
  let zone_mid = @date.get_timezone(name="STD0DST,M6.1.0/0,M1.1.0/1")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=2,
    month=1,
    day=1,
    timezone=zone_mid,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("9998-01-01"),
          zone_mid,
          fold=true,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("9999-12-31"),
          zone_mid,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([2932166.9583333335]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 9998, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 9999, 1, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(2932166.9583333335, 2932895.9583333335), [
    2932166.9583333335,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 2)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 9998, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 9999, 1, 1, 0, 0, 0, 0, 0]),
  )
}

///|
test "YearLocator original 100 mixed naive 2024-01-01" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=1,
    month=1,
    day=1,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01")),
        @date.RRuleDateTime::aware(@date.parse_iso("2023-01-01T00:00:00+02:00")),
      ),
    ) catch {
      _ => None
    },
    Some([19723.0, 19357.916666666668]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2023, 1, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(19723.0, 19357.916666666668), [
    19723.0, 19358.0, 18993.0,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2022, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 1, 1, 0, 0, 0, 0, 0]),
  )
}

///|
test "YearLocator original 101 mixed aware 2024-01-01T00:00:00+02:00" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=1,
    month=1,
    day=1,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::aware(@date.parse_iso("2024-01-01T00:00:00+02:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01")),
      ),
    ) catch {
      _ => None
    },
    Some([19722.916666666668, 19358.0]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2023, 1, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(19722.916666666668, 19358.0), [19358.0])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2023, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2023, 1, 1, 0, 0, 0, 0, 0]),
  )
}

///|
test "YearLocator original 102 mixed naive 0002-01-01" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=1,
    month=1,
    day=1,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("0002-01-01")),
        @date.RRuleDateTime::aware(@date.parse_iso("0001-01-01T00:00:00+23:00")),
      ),
    ) catch {
      _ => None
    },
    Some([-718797.0, -719162.9583333334]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 1, 1, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(-718797.0, -719162.9583333334), [])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 1, 1, 1, 0, 0, 0, 0, 0]),
  )
}

///|
test "YearLocator original 103 mixed aware 0002-01-01T00:00:00+23:00" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=1,
    month=1,
    day=1,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::aware(@date.parse_iso("0002-01-01T00:00:00+23:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("0001-01-01")),
      ),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 1, 1, 1, 0, 0, 0, 0, 0]),
  )
}

///|
test "YearLocator original 104 mutable forms False" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=5,
    month=1,
    day=1,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 5)
  assert_eq(copy.interval(), 5)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2021-05-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("2028-05-01")),
      ),
    ) catch {
      _ => None
    },
    Some([18262.0, 20089.0, 21915.0]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 5)
  assert_eq(copy.interval(), 5)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 1, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(18748.0, 21305.0), [18262.0, 20089.0, 21915.0])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 5)
  assert_eq(copy.interval(), 5)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 1, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(
    try {
      wrapper.set(interval=3)
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 1, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2021-05-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("2028-05-01")),
      ),
    ) catch {
      _ => None
    },
    Some([18262.0, 19358.0, 20454.0, 21550.0]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 1, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(18748.0, 21305.0), [
    18262.0, 19358.0, 20454.0, 21550.0,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 1, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(
    try {
      wrapper.set(frequency=@date.Monthly)
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 30.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 1, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2021-05-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("2028-05-01")),
      ),
    ) catch {
      _ => None
    },
    Some([
      18262.0, 18628.0, 18993.0, 19358.0, 19723.0, 20089.0, 20454.0, 20819.0, 21184.0,
      21550.0, 21915.0,
    ]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 30.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 1, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(18748.0, 21305.0), [
    18262.0, 18628.0, 18993.0, 19358.0, 19723.0, 20089.0, 20454.0, 20819.0, 21184.0,
    21550.0, 21915.0,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 30.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 1, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(
    try {
      wrapper.set(frequency=@date.Yearly, bymonth_value=7, bymonthday_value=4)
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 1, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2021-05-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("2028-05-01")),
      ),
    ) catch {
      _ => None
    },
    Some([18447.0, 19542.0, 20638.0, 21734.0]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 7, 4, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 7, 4, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(18748.0, 21305.0), [
    18447.0, 19542.0, 20638.0, 21734.0,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 7, 4, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 7, 4, 0, 0, 0, 0, 0]),
  )
  assert_eq(
    try {
      wrapper.set(bymonth=[7])
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 7, 4, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 7, 4, 0, 0, 0, 0, 0]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2021-05-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("2028-05-01")),
      ),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 7, 4, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 7, 4, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(18748.0, 21305.0), [])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 7, 4, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 7, 4, 0, 0, 0, 0, 0]),
  )
  assert_eq(
    try {
      wrapper.set(bymonth_value=7)
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 7, 4, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 7, 4, 0, 0, 0, 0, 0]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2021-05-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("2028-05-01")),
      ),
    ) catch {
      _ => None
    },
    Some([18447.0, 19542.0, 20638.0, 21734.0]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 7, 4, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 7, 4, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(18748.0, 21305.0), [
    18447.0, 19542.0, 20638.0, 21734.0,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 7, 4, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 7, 4, 0, 0, 0, 0, 0]),
  )
  assert_eq(
    try {
      wrapper.set(null=["bymonthday"])
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 7, 4, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 7, 4, 0, 0, 0, 0, 0]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2021-05-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("2028-05-01")),
      ),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 7, 4, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 7, 4, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(18748.0, 21305.0), [])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 7, 4, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 7, 4, 0, 0, 0, 0, 0]),
  )
  assert_eq(
    try {
      wrapper.set(bymonthday_value=4)
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 7, 4, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 7, 4, 0, 0, 0, 0, 0]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2021-05-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("2028-05-01")),
      ),
    ) catch {
      _ => None
    },
    Some([18447.0, 19542.0, 20638.0, 21734.0]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 7, 4, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 7, 4, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(18748.0, 21305.0), [
    18447.0, 19542.0, 20638.0, 21734.0,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 7, 4, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 7, 4, 0, 0, 0, 0, 0]),
  )
  assert_eq(
    try {
      wrapper.set(bymonthday_value=-1)
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 7, 4, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 7, 4, 0, 0, 0, 0, 0]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2021-05-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("2028-05-01")),
      ),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 7, 4, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 7, 4, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(18748.0, 21305.0), [])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 7, 4, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 7, 4, 0, 0, 0, 0, 0]),
  )
  assert_eq(
    try {
      wrapper.set(bymonthday_value=1)
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 7, 4, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 7, 4, 0, 0, 0, 0, 0]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2021-05-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("2028-05-01")),
      ),
    ) catch {
      _ => None
    },
    Some([18444.0, 19539.0, 20635.0, 21731.0]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 7, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 7, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(18748.0, 21305.0), [
    18444.0, 19539.0, 20635.0, 21731.0,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 7, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 7, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(
    try {
      wrapper.set(byhour=[12])
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 7, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 7, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2021-05-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("2028-05-01")),
      ),
    ) catch {
      _ => None
    },
    Some([18444.5, 19539.5, 20635.5, 21731.5]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 7, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 7, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(18748.0, 21305.0), [
    18444.5, 19539.5, 20635.5, 21731.5,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 7, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 7, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(
    try {
      wrapper.set(count=0)
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 7, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 7, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2021-05-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("2028-05-01")),
      ),
    ) catch {
      _ => None
    },
    Some([18748.0, 21305.0]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 7, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 7, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(18748.0, 21305.0), [18748.0, 21305.0])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 7, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 7, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(
    try {
      wrapper.set(null=["count"], bysetpos=[0])
      false
    } catch {
      _ => true
    },
    true,
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 7, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 7, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2021-05-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("2028-05-01")),
      ),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 7, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 7, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(18748.0, 21305.0), [])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 7, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 7, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(
    try {
      wrapper.set(null=["bysetpos"])
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 7, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 7, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2021-05-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("2028-05-01")),
      ),
    ) catch {
      _ => None
    },
    Some([18444.5, 19539.5, 20635.5, 21731.5]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 7, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 7, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(18748.0, 21305.0), [
    18444.5, 19539.5, 20635.5, 21731.5,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 7, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 7, 1, 0, 0, 0, 0, 0]),
  )
}

///|
test "YearLocator original 105 mutable forms True" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=5,
    month=1,
    day=1,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 5)
  assert_eq(copy.interval(), 5)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::aware(@date.parse_iso("2021-05-01T00:00:00+00:00")),
        @date.RRuleDateTime::aware(@date.parse_iso("2028-05-01T00:00:00+00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([18262.0, 20089.0, 21915.0]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 5)
  assert_eq(copy.interval(), 5)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 1, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(18748.0, 21305.0), [18262.0, 20089.0, 21915.0])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 5)
  assert_eq(copy.interval(), 5)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 1, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(
    try {
      wrapper.set(interval=3)
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 1, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::aware(@date.parse_iso("2021-05-01T00:00:00+00:00")),
        @date.RRuleDateTime::aware(@date.parse_iso("2028-05-01T00:00:00+00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([18262.0, 19358.0, 20454.0, 21550.0]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 1, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(18748.0, 21305.0), [
    18262.0, 19358.0, 20454.0, 21550.0,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 1, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(
    try {
      wrapper.set(frequency=@date.Monthly)
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 30.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 1, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::aware(@date.parse_iso("2021-05-01T00:00:00+00:00")),
        @date.RRuleDateTime::aware(@date.parse_iso("2028-05-01T00:00:00+00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([
      18262.0, 18628.0, 18993.0, 19358.0, 19723.0, 20089.0, 20454.0, 20819.0, 21184.0,
      21550.0, 21915.0,
    ]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 30.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 1, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(18748.0, 21305.0), [
    18262.0, 18628.0, 18993.0, 19358.0, 19723.0, 20089.0, 20454.0, 20819.0, 21184.0,
    21550.0, 21915.0,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 30.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 1, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(
    try {
      wrapper.set(frequency=@date.Yearly, bymonth_value=7, bymonthday_value=4)
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 1, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::aware(@date.parse_iso("2021-05-01T00:00:00+00:00")),
        @date.RRuleDateTime::aware(@date.parse_iso("2028-05-01T00:00:00+00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([18447.0, 19542.0, 20638.0, 21734.0]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 7, 4, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 7, 4, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(18748.0, 21305.0), [
    18447.0, 19542.0, 20638.0, 21734.0,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 7, 4, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 7, 4, 0, 0, 0, 0, 0]),
  )
  assert_eq(
    try {
      wrapper.set(bymonth=[7])
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 7, 4, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 7, 4, 0, 0, 0, 0, 0]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::aware(@date.parse_iso("2021-05-01T00:00:00+00:00")),
        @date.RRuleDateTime::aware(@date.parse_iso("2028-05-01T00:00:00+00:00")),
      ),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 7, 4, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 7, 4, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(18748.0, 21305.0), [])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 7, 4, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 7, 4, 0, 0, 0, 0, 0]),
  )
  assert_eq(
    try {
      wrapper.set(bymonth_value=7)
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 7, 4, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 7, 4, 0, 0, 0, 0, 0]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::aware(@date.parse_iso("2021-05-01T00:00:00+00:00")),
        @date.RRuleDateTime::aware(@date.parse_iso("2028-05-01T00:00:00+00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([18447.0, 19542.0, 20638.0, 21734.0]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 7, 4, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 7, 4, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(18748.0, 21305.0), [
    18447.0, 19542.0, 20638.0, 21734.0,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 7, 4, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 7, 4, 0, 0, 0, 0, 0]),
  )
  assert_eq(
    try {
      wrapper.set(null=["bymonthday"])
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 7, 4, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 7, 4, 0, 0, 0, 0, 0]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::aware(@date.parse_iso("2021-05-01T00:00:00+00:00")),
        @date.RRuleDateTime::aware(@date.parse_iso("2028-05-01T00:00:00+00:00")),
      ),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 7, 4, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 7, 4, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(18748.0, 21305.0), [])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 7, 4, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 7, 4, 0, 0, 0, 0, 0]),
  )
  assert_eq(
    try {
      wrapper.set(bymonthday_value=4)
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 7, 4, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 7, 4, 0, 0, 0, 0, 0]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::aware(@date.parse_iso("2021-05-01T00:00:00+00:00")),
        @date.RRuleDateTime::aware(@date.parse_iso("2028-05-01T00:00:00+00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([18447.0, 19542.0, 20638.0, 21734.0]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 7, 4, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 7, 4, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(18748.0, 21305.0), [
    18447.0, 19542.0, 20638.0, 21734.0,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 7, 4, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 7, 4, 0, 0, 0, 0, 0]),
  )
  assert_eq(
    try {
      wrapper.set(bymonthday_value=-1)
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 7, 4, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 7, 4, 0, 0, 0, 0, 0]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::aware(@date.parse_iso("2021-05-01T00:00:00+00:00")),
        @date.RRuleDateTime::aware(@date.parse_iso("2028-05-01T00:00:00+00:00")),
      ),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 7, 4, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 7, 4, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(18748.0, 21305.0), [])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 7, 4, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 7, 4, 0, 0, 0, 0, 0]),
  )
  assert_eq(
    try {
      wrapper.set(bymonthday_value=1)
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 7, 4, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 7, 4, 0, 0, 0, 0, 0]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::aware(@date.parse_iso("2021-05-01T00:00:00+00:00")),
        @date.RRuleDateTime::aware(@date.parse_iso("2028-05-01T00:00:00+00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([18444.0, 19539.0, 20635.0, 21731.0]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 7, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 7, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(18748.0, 21305.0), [
    18444.0, 19539.0, 20635.0, 21731.0,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 7, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 7, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(
    try {
      wrapper.set(byhour=[12])
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 7, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 7, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::aware(@date.parse_iso("2021-05-01T00:00:00+00:00")),
        @date.RRuleDateTime::aware(@date.parse_iso("2028-05-01T00:00:00+00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([18444.5, 19539.5, 20635.5, 21731.5]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 7, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 7, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(18748.0, 21305.0), [
    18444.5, 19539.5, 20635.5, 21731.5,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 7, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 7, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(
    try {
      wrapper.set(count=0)
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 7, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 7, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::aware(@date.parse_iso("2021-05-01T00:00:00+00:00")),
        @date.RRuleDateTime::aware(@date.parse_iso("2028-05-01T00:00:00+00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([18748.0, 21305.0]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 7, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 7, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(18748.0, 21305.0), [18748.0, 21305.0])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 7, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 7, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(
    try {
      wrapper.set(null=["count"], bysetpos=[0])
      false
    } catch {
      _ => true
    },
    true,
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 7, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 7, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::aware(@date.parse_iso("2021-05-01T00:00:00+00:00")),
        @date.RRuleDateTime::aware(@date.parse_iso("2028-05-01T00:00:00+00:00")),
      ),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 7, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 7, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(18748.0, 21305.0), [])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 7, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 7, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(
    try {
      wrapper.set(null=["bysetpos"])
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 7, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 7, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::aware(@date.parse_iso("2021-05-01T00:00:00+00:00")),
        @date.RRuleDateTime::aware(@date.parse_iso("2028-05-01T00:00:00+00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([18444.5, 19539.5, 20635.5, 21731.5]),
  )
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 7, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 7, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(18748.0, 21305.0), [
    18444.5, 19539.5, 20635.5, 21731.5,
  ])
  assert_eq(calls.val, 1)
  assert_eq(locator.base(), 5)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2020, 7, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2030, 7, 1, 0, 0, 0, 0, 0]),
  )
}

///|
test "YearLocator original 106 constructor date and until mutators" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=1,
    month=1,
    day=1,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(
    try {
      wrapper.set(bymonth_value=2)
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(
    try {
      wrapper.set(bymonthday_value=29)
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(
    try {
      wrapper.set(bymonthday_value=1)
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 4)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 18, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2021-01-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("2025-01-01")),
      ),
    ) catch {
      _ => None
    },
    Some([18659.0, 19024.0, 19389.0, 19754.0, 20120.0]),
  )
  assert_eq(calls.val, 4)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2021, 2, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2025, 2, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(18628.0, 20089.0), [
    18659.0, 19024.0, 19389.0, 19754.0, 20120.0,
  ])
  assert_eq(calls.val, 4)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2021, 2, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2025, 2, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(
    try {
      wrapper.set(bymonth_value=2)
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 4)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2021, 2, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2025, 2, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2021-01-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("2025-01-01")),
      ),
    ) catch {
      _ => None
    },
    Some([18659.0, 19024.0, 19389.0, 19754.0, 20120.0]),
  )
  assert_eq(calls.val, 4)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2021, 2, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2025, 2, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(18628.0, 20089.0), [
    18659.0, 19024.0, 19389.0, 19754.0, 20120.0,
  ])
  assert_eq(calls.val, 4)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2021, 2, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2025, 2, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(
    try {
      wrapper.set(bymonthday_value=29)
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 4)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2021, 2, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2025, 2, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2021-01-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("2025-01-01")),
      ),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(calls.val, 4)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2021, 2, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2025, 2, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(18628.0, 20089.0), [])
  assert_eq(calls.val, 4)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2021, 2, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2025, 2, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(
    try {
      wrapper.set(bymonthday_value=1)
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 4)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2021, 2, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2025, 2, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2021-01-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("2025-01-01")),
      ),
    ) catch {
      _ => None
    },
    Some([18659.0, 19024.0, 19389.0, 19754.0, 20120.0]),
  )
  assert_eq(calls.val, 4)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2021, 2, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2025, 2, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(18628.0, 20089.0), [
    18659.0, 19024.0, 19389.0, 19754.0, 20120.0,
  ])
  assert_eq(calls.val, 4)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2021, 2, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2025, 2, 1, 0, 0, 0, 0, 0]),
  )
}

///|
test "YearLocator original 107 mixed max aware" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=1,
    month=1,
    day=1,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(
    try {
      wrapper.set(count=0)
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 2)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 16, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
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
  assert_eq(calls.val, 2)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 9999, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 9999, 1, 1, 0, 0, 0, 0, 0]),
  )
}

///|
test "YearLocator original 108 mixed max naive" {
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let context = @date.DateParserContext::utc(clock=fn() {
    let now = 1781524800123L + Int64::from_int(calls.val) * 86400000L
    calls.val += 1
    now
  })
  let locator = @date.YearLocator::new(
    base=1,
    month=1,
    day=1,
    timezone=zone_utc,
    context~,
  )
  let wrapper = locator.rule()
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_eq(
    try {
      wrapper.set(count=0)
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 2)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 16, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("9999-12-31")),
        @date.RRuleDateTime::aware(@date.parse_iso("9999-12-31T23:59:59-23:00")),
      ),
    ) catch {
      _ => None
    },
    Some([2932896.0, 2932897.9583217595]),
  )
  assert_eq(calls.val, 2)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 9999, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 9999, 1, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(adapter.tick_values(2932896.0, 2932897.9583217595), [])
  assert_eq(calls.val, 2)
  assert_eq(locator.base(), 1)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 9999, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 9999, 1, 1, 0, 0, 0, 0, 0]),
  )
}
