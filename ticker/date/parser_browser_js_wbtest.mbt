///|
extern "js" fn parser_without_node(run : () -> Bool) -> Bool =
  #| function(run) {
  #|   const descriptor = Object.getOwnPropertyDescriptor(globalThis, "process");
  #|   Object.defineProperty(globalThis, "process", {value: undefined, configurable: true});
  #|   try { return run(); }
  #|   finally {
  #|     if (descriptor) Object.defineProperty(globalThis, "process", descriptor);
  #|     else delete globalThis.process;
  #|   }
  #| }

///|
test "fractional microsecond locator uses portable mixed context without reading clock" {
  assert_true(
    parser_without_node(fn() {
      let calls = Ref(0)
      let context = DateParserContext::utc(clock=fn() {
        calls.val += 1
        1781524800123L
      })
      let locator = try! MicrosecondLocator::new(
        interval=0.5,
        tz="UTC",
        context~,
      )
      let first = RRuleDateTime::aware(try! datetime(1970, 1, 1))
      let last = RRuleDateTime::naive(try! datetime(1970, 1, 1, microsecond=3))
      let ticks = try! locator.tick_values(first, last)
      calls.val == 0 &&
      ticks.length() == 9 &&
      locator.as_locator().interval_value() == 0.5
    }),
  )
}

///|
test "embedded JS has no static Node FS requirement and uses an explicit parser context" {
  assert_true(
    parser_without_node(fn() {
      let missing = try {
        ignore(DateParserContext::system())
        false
      } catch {
        _ => true
      }
      let parser = try! DateStringParser::new(
        context=DateParserContext::utc(clock=fn() { 1781524800000L }),
      )
      missing && (try! parser.parse("2024-01-01")).year == 2024
    }),
  )
}

///|
test "timezone defaults work without Node through UTC POSIX and explicit TZif registration" {
  let path = @env.current_dir().unwrap() + "/testdata/tzif/new_york.tzif"
  let data = @date_host.read_zone_file(path).unwrap()
  let previous = @config.timezone()
  defer @config.set_timezone(previous)
  defer unregister_timezone("D12/browser-zone")
  assert_true(
    parser_without_node(fn() {
      try! register_timezone("D12/browser-zone", data)
      @config.set_timezone("D12/browser-zone")
      let zone = try! get_timezone()
      let fixed = try! date_formatter("%H:%M %Z")
      let automatic = try! AutoDateLocator::new()
      let first = zone.initial_offset_seconds == -17762 &&
        fixed.format_value(0.0) == "19:00 EST" &&
        automatic.as_locator().timezone().unwrap().initial_offset_seconds ==
        -17762
      @config.set_timezone("UTC")
      let utc = (try! num2date(0.0)).hour == 0
      @config.set_timezone("XST-5:45")
      let portable = (try! num2date(0.0)).minute == 45
      first && utc && portable
    }),
  )
}

///|
test "rrulewrapper and locator run without Node using explicit dates or parser clock" {
  assert_true(
    parser_without_node(fn() {
      let start = RRuleDateTime::naive(try! datetime(2024, 1, 1))
      let wrapper = try! RRuleWrapper::new(Daily, dtstart=start, count=3)
      let first = (try! wrapper.after(start, inc=true)).unwrap()
      let copy = wrapper.copy()
      try! copy.set(interval=2)
      let implicit = try! RRuleWrapper::new(
        Daily,
        count=2,
        context=DateParserContext::utc(clock=fn() { 1781524800123L }),
      )
      try! wrapper.set(null=["count"])
      let locator = try! RRuleLocator::new(
        wrapper,
        timezone=try! fixed_timezone(0),
      )
      first.is_naive() &&
      first.date().day == 1 &&
      (try! copy.occurrence_count()) == 3L &&
      (try! implicit.occurrence_count()) == 2L &&
      locator
      .as_locator()
      .tick_values(
        start.date().to_ordinal(),
        (try! datetime(2024, 1, 3)).to_ordinal(),
      )
      .length() ==
      3
    }),
  )
}

///|
test "year and automatic year locators run without Node using explicit host context" {
  assert_true(
    parser_without_node(fn() {
      let calls = Ref(0)
      let context = DateParserContext::utc(clock=fn() {
        calls.val += 1
        1781524800123L
      })
      let year = try! YearLocator::new(base=5, tz="UTC", context~)
      let first = try! datetime(2021, 1, 1)
      let last = try! datetime(2028, 1, 1)
      let ticks = try! year
        .as_rrule_locator()
        .tick_values(RRuleDateTime::naive(first), RRuleDateTime::naive(last))
      let auto = try! AutoDateLocator::new(tz="UTC", context~)
      let selected = try! auto.get_locator(first, try! datetime(2050, 1, 1))
      let automatic = try! auto.tick_values(
        first.to_ordinal(),
        (try! datetime(2050, 1, 1)).to_ordinal(),
      )
      ticks.length() == 3 &&
      selected.rrule_locator() is Some(_) &&
      !automatic.is_empty() &&
      calls.val == 3
    }),
  )
}

///|
test "all named calendar locators avoid Node with explicit host context" {
  assert_true(
    parser_without_node(fn() {
      let context = DateParserContext::utc(clock=fn() { 1781524800123L })
      let locators = [
        (try! MonthLocator::new(tz="UTC", context~)).as_locator(),
        (try! WeekdayLocator::new(tz="UTC", context~)).as_locator(),
        (try! DayLocator::new(tz="UTC", context~)).as_locator(),
        (try! HourLocator::new(tz="UTC", context~)).as_locator(),
        (try! MinuteLocator::new(tz="UTC", context~)).as_locator(),
        (try! SecondLocator::new(tz="UTC", context~)).as_locator(),
      ]
      let first = (try! datetime(2024, 1, 1)).to_ordinal()
      let last = first + 5.0 / 86400.0
      locators
      .iter()
      .all(locator => !locator.tick_values(first, last).is_empty())
    }),
  )
}

///|
test "checked recurrence failure and recovery work without Node or host context" {
  assert_true(
    parser_without_node(fn() {
      let start = RRuleDateTime::naive(try! datetime(2024, 1, 1, hour=12))
      let wrapper = try! RRuleWrapper::new(
        Minutely,
        dtstart=start,
        interval=1440,
        byhour=[13],
        byminute=[0],
        count=0,
      )
      let reader = wrapper.checked_raw_iter()
      let failed = try {
        ignore(reader.next())
        false
      } catch {
        _ => true
      }
      let count_failed = try {
        ignore(wrapper.occurrence_count())
        false
      } catch {
        _ => true
      }
      try! wrapper.set(byhour=[12], count=2)
      failed &&
      count_failed &&
      (try! reader.next()) is None &&
      (try! wrapper.occurrence_count()) == 2L
    }),
  )
}
